uint64_t sub_1000B840C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1000B8414(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ShareAddress()
{
  return &type metadata for ShareAddress;
}

uint64_t getEnumTagSinglePayload for SharingStage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SharingStage(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *result = a2 + 6;
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
        JUMPOUT(0x1000B858CLL);
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
          *result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingStage()
{
  return &type metadata for SharingStage;
}

unsigned char *_s37com_apple_CloudSharingUI_CloudSharing13ExecutionModeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *result = a2 + 3;
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
        JUMPOUT(0x1000B8690);
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
          *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExecutionMode()
{
  return &type metadata for ExecutionMode;
}

uint64_t sub_1000B86C8@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B86DC()
{
  return sub_1000114AC();
}

unint64_t sub_1000B86F0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v0 = 0x10000000000;
  if (!v3) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = 0x1000000000000;
  if (!v3) {
    uint64_t v1 = 0;
  }
  return v3 | ((unint64_t)v3 << 8) | ((unint64_t)v3 << 16) | ((unint64_t)v3 << 24) | ((unint64_t)v3 << 32) | v0 | v1;
}

uint64_t sub_1000B8A58@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B8A6C()
{
  return sub_1000114AC();
}

uint64_t sub_1000B8A80(unsigned char *a1, unsigned __int8 *a2)
{
  int v2 = *a2;
  switch(*a1)
  {
    case 2:
      if (v2 == 2) {
        goto LABEL_9;
      }
      goto LABEL_11;
    case 3:
      if (v2 != 3) {
        goto LABEL_11;
      }
      goto LABEL_9;
    case 4:
      if (v2 != 4) {
        goto LABEL_11;
      }
      goto LABEL_9;
    case 5:
      if (v2 != 5) {
        goto LABEL_11;
      }
LABEL_9:
      uint64_t result = 1;
      break;
    default:
      if ((v2 - 2) >= 4) {
        uint64_t result = (((*a1 & 1) == 0) ^ v2) & 1;
      }
      else {
LABEL_11:
      }
        uint64_t result = 0;
      break;
  }
  return result;
}

unint64_t sub_1000B8B2C()
{
  unint64_t result = qword_10010EAB8;
  if (!qword_10010EAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EAB8);
  }
  return result;
}

unint64_t sub_1000B8B84()
{
  unint64_t result = qword_10010EAC0;
  if (!qword_10010EAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EAC0);
  }
  return result;
}

unint64_t sub_1000B8BDC()
{
  unint64_t result = qword_10010EAC8;
  if (!qword_10010EAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EAC8);
  }
  return result;
}

unint64_t sub_1000B8C34()
{
  unint64_t result = qword_10010EAD0;
  if (!qword_10010EAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EAD0);
  }
  return result;
}

unint64_t sub_1000B8C8C()
{
  unint64_t result = qword_10010EAD8;
  if (!qword_10010EAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EAD8);
  }
  return result;
}

uint64_t sub_1000B8CE0@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B8D08()
{
  return sub_1000114AC();
}

uint64_t sub_1000B8D38@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B8D4C()
{
  return sub_1000114AC();
}

uint64_t sub_1000B8D60@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B8D74()
{
  return sub_1000114AC();
}

uint64_t sub_1000B8D88@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000C67E0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1000B8E08()
{
  return sub_1000C67F0();
}

uint64_t sub_1000B8E84@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B8E98()
{
  return sub_1000114AC();
}

uint64_t sub_1000B8EAC@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B8EC0()
{
  return sub_1000114AC();
}

uint64_t sub_1000B8EDC@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B8F04()
{
  return sub_1000114AC();
}

uint64_t sub_1000B8F2C@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B8F54()
{
  return sub_1000114AC();
}

uint64_t sub_1000B8F7C@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B8FA4()
{
  return sub_1000114AC();
}

uint64_t sub_1000B8FCC@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B8FF4()
{
  return sub_1000114AC();
}

uint64_t sub_1000B9024@<X0>(unsigned char *a1@<X8>)
{
  return sub_10001141C(a1);
}

uint64_t sub_1000B904C()
{
  return sub_1000114AC();
}

uint64_t destroy for PermissionPickerSections(void *a1)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (a1[6]) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (a1[12]) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  if (a1[16]) {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for PermissionPickerSections(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  BOOL v7 = (_OWORD *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 48);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  if (v6)
  {
    uint64_t v8 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v6;
    *(void *)(a1 + 56) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 48) = *v7;
  }
  uint64_t v9 = *(void *)(a2 + 96);
  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  if (v9)
  {
    uint64_t v11 = *(void *)(a2 + 104);
    *(void *)(a1 + 96) = v9;
    *(void *)(a1 + 104) = v11;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  }
  uint64_t v12 = *(void *)(a2 + 128);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  swift_bridgeObjectRetain();
  if (v12)
  {
    uint64_t v13 = *(void *)(a2 + 136);
    *(void *)(a1 + 128) = v12;
    *(void *)(a1 + 136) = v13;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  }
  uint64_t v14 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v14;
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  uint64_t v15 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v15;
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  uint64_t v16 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v16;
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  uint64_t v17 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v17;
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PermissionPickerSections(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a1 + 48);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 48);
  if (v4)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a2 + 56);
      *(void *)(a1 + 48) = v5;
      *(void *)(a1 + 56) = v6;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v5;
    *(void *)(a1 + 56) = v7;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
LABEL_8:
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  uint64_t v8 = *(void *)(a1 + 96);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v9 = *(void *)(a2 + 96);
  if (v8)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a2 + 104);
      *(void *)(a1 + 96) = v9;
      *(void *)(a1 + 104) = v10;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    uint64_t v11 = *(void *)(a2 + 104);
    *(void *)(a1 + 96) = v9;
    *(void *)(a1 + 104) = v11;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
LABEL_15:
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a1 + 128);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  uint64_t v13 = *(void *)(a2 + 128);
  if (!v12)
  {
    if (v13)
    {
      uint64_t v15 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = v13;
      *(void *)(a1 + 136) = v15;
      swift_retain();
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    goto LABEL_22;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v14 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = v13;
  *(void *)(a1 + 136) = v14;
  swift_retain();
  swift_release();
LABEL_22:
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_retain();
  swift_release();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_retain();
  swift_release();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_retain();
  swift_release();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_retain();
  swift_release();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for PermissionPickerSections(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  long long v8 = a2[8];
  long long v9 = a2[9];
  long long v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  __n128 result = (__n128)a2[12];
  long long v12 = a2[13];
  long long v13 = a2[15];
  *(_OWORD *)(a1 + 224) = a2[14];
  *(_OWORD *)(a1 + 240) = v13;
  *(__n128 *)(a1 + 192) = result;
  *(_OWORD *)(a1 + 208) = v12;
  return result;
}

uint64_t assignWithTake for PermissionPickerSections(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 48);
  uint64_t v6 = *(void *)(a1 + 48);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  if (v6)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 56);
      *(void *)(a1 + 48) = v5;
      *(void *)(a1 + 56) = v7;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v8 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v5;
    *(void *)(a1 + 56) = v8;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
LABEL_8:
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  uint64_t v9 = *(void *)(a2 + 96);
  uint64_t v10 = *(void *)(a1 + 96);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  if (v10)
  {
    if (v9)
    {
      uint64_t v11 = *(void *)(a2 + 104);
      *(void *)(a1 + 96) = v9;
      *(void *)(a1 + 104) = v11;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v9)
  {
    uint64_t v12 = *(void *)(a2 + 104);
    *(void *)(a1 + 96) = v9;
    *(void *)(a1 + 104) = v12;
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
LABEL_15:
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 128);
  uint64_t v14 = *(void *)(a1 + 128);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  if (!v14)
  {
    if (v13)
    {
      uint64_t v16 = *(void *)(a2 + 136);
      *(void *)(a1 + 128) = v13;
      *(void *)(a1 + 136) = v16;
      goto LABEL_22;
    }
LABEL_21:
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    goto LABEL_22;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_21;
  }
  uint64_t v15 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = v13;
  *(void *)(a1 + 136) = v15;
  swift_release();
LABEL_22:
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_release();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_release();
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_release();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_release();
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_release();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_release();
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_release();
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_release();
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 240) = *(unsigned char *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PermissionPickerSections(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 256)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PermissionPickerSections(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 248) = 0;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 256) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 256) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PermissionPickerSections()
{
  return &type metadata for PermissionPickerSections;
}

uint64_t sub_1000B99C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000B99DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  sub_1000363CC();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1000C7000();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  id v11 = [self labelColor];
  sub_1000C7180();
  uint64_t v12 = sub_1000C6FB0();
  uint64_t v14 = v13;
  char v23 = v15;
  uint64_t v17 = v16;
  swift_release();
  sub_100039234(v6, v8, v10);
  swift_bridgeObjectRelease();
  if (a3 != 2 && a3)
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    unsigned __int8 v21 = -1;
  }
  else
  {
    sub_1000C71A0();
    sub_1000C7120();
    swift_getKeyPath();
    sub_100012854(&qword_10010C988);
    sub_10004DFD4();
    sub_1000C6D50();
    uint64_t v18 = a1;
    uint64_t v19 = a2;
    uint64_t v20 = v26;
    unsigned __int8 v21 = v27;
  }
  *(void *)a4 = v12;
  *(void *)(a4 + 8) = v14;
  *(unsigned char *)(a4 + 16) = v23 & 1;
  *(void *)(a4 + 24) = v17;
  *(void *)(a4 + 32) = 0;
  *(unsigned char *)(a4 + 40) = 1;
  *(void *)(a4 + 48) = v18;
  *(void *)(a4 + 56) = v19;
  *(void *)(a4 + 64) = v20;
  *(unsigned char *)(a4 + 72) = v21;
  sub_100039224(v12, v14, v23 & 1);
  swift_bridgeObjectRetain();
  sub_1000BCAE0(v18, v19, v20, v21);
  sub_1000BCB40(v18, v19, v20, v21);
  sub_100039234(v12, v14, v23 & 1);
  return swift_bridgeObjectRelease();
}

__n128 sub_1000B9C30@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  uint64_t v6 = sub_1000C6CF0();
  sub_1000B99DC(v3, v4, v5, (uint64_t)&v15);
  char v7 = v16;
  uint64_t v8 = v17;
  uint64_t v9 = v18;
  char v10 = v19;
  uint64_t v11 = v21;
  char v12 = v22;
  __n128 result = v15;
  long long v14 = v20;
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(unsigned char *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 72) = v14;
  *(void *)(a1 + 88) = v11;
  *(unsigned char *)(a1 + 96) = v12;
  return result;
}

uint64_t sub_1000B9CD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100012854(&qword_10010EB00);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  char v7 = (char *)&v107 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v121 = (char *)&v107 - v8;
  uint64_t v117 = sub_100012854(&qword_10010EB08);
  uint64_t v9 = *(void *)(v117 - 8);
  __chkstk_darwin(v117);
  v114 = (char *)&v107 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100012854(&qword_10010EB10);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  long long v14 = (char *)&v107 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  char v16 = (char *)&v107 - v15;
  uint64_t v17 = sub_100012854(&qword_10010EB18);
  uint64_t v115 = *(void *)(v17 - 8);
  v116 = (uint64_t *)v17;
  __chkstk_darwin(v17);
  v113 = (char *)&v107 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100012854(&qword_10010EB20);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v119 = (uint64_t)&v107 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v126 = (uint64_t)&v107 - v22;
  uint64_t v23 = sub_100012854(&qword_10010EB28);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v107 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100012854(&qword_10010EB30);
  uint64_t v28 = __chkstk_darwin(v27 - 8);
  __chkstk_darwin(v28);
  uint64_t v29 = *(void *)(a1 + 16);
  uint64_t v30 = *(void *)(v29 + 16);
  uint64_t v122 = a2;
  v123 = v7;
  v120 = v14;
  v127 = v16;
  uint64_t v118 = v31;
  uint64_t v124 = v9;
  uint64_t v125 = (uint64_t)&v107 - v32;
  if (v30)
  {
    uint64_t v110 = v24;
    v111 = v26;
    v112 = (uint64_t *)v23;
    sub_1000C6D00();
    __int16 v106 = 256;
    v105 = 0;
    uint64_t v33 = sub_1000C6FF0();
    uint64_t v35 = v34;
    char v37 = v36;
    uint64_t v39 = v38;
    long long v128 = *(_OWORD *)(a1 + 24);
    char v129 = *(unsigned char *)(a1 + 40);
    sub_100012854(&qword_10010BF08);
    uint64_t v40 = sub_1000C7280();
    char v41 = v131[0];
    uint64_t v42 = *(void *)(a1 + 48);
    uint64_t v43 = *(void *)(a1 + 56);
    if (v42)
    {
      uint64_t v40 = swift_allocObject();
      uint64_t v44 = v40;
      *(void *)(v40 + 16) = v42;
      *(void *)(v40 + 24) = v43;
      v45 = sub_1000BC428;
    }
    else
    {
      v45 = 0;
      uint64_t v44 = 0;
    }
    v108 = v45;
    v109 = &v107;
    v131[0] = v41;
    *(void *)&long long v128 = v33;
    *((void *)&v128 + 1) = v35;
    char v46 = v37 & 1;
    char v129 = v46;
    uint64_t v130 = v39;
    __chkstk_darwin(v40);
    *(&v107 - 6) = v29;
    *(&v107 - 5) = v47;
    *(&v107 - 4) = v44;
    *(&v107 - 3) = a1;
    v105 = v131;
    sub_1000236E0(v42);
    sub_100039224(v33, v35, v46);
    swift_bridgeObjectRetain();
    sub_100012854(&qword_10010EB38);
    sub_1000BC03C(&qword_10010EB40, &qword_10010EB38);
    v48 = v111;
    sub_1000C7300();
    sub_100039234(v33, v35, v46);
    swift_bridgeObjectRelease();
    sub_100013344((uint64_t)v108);
    uint64_t v49 = v110;
    uint64_t v50 = v125;
    v51 = v112;
    (*(void (**)(uint64_t, char *, uint64_t *))(v110 + 32))(v125, v48, v112);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t *))(v49 + 56))(v50, 0, 1, v51);
  }
  else
  {
    (*(void (**)(void))(v24 + 56))();
  }
  uint64_t v52 = *(void *)(a1 + 64);
  if (*(void *)(v52 + 16))
  {
    sub_1000C6D00();
    __int16 v106 = 256;
    v105 = 0;
    uint64_t v53 = sub_1000C6FF0();
    uint64_t v55 = v54;
    char v57 = v56;
    uint64_t v59 = v58;
    long long v128 = *(_OWORD *)(a1 + 72);
    char v129 = *(unsigned char *)(a1 + 88);
    sub_100012854(&qword_10010BF10);
    uint64_t v60 = sub_1000C7280();
    char v61 = v131[0];
    uint64_t v62 = *(void *)(a1 + 96);
    uint64_t v63 = *(void *)(a1 + 104);
    if (v62)
    {
      uint64_t v60 = swift_allocObject();
      uint64_t v64 = v60;
      *(void *)(v60 + 16) = v62;
      *(void *)(v60 + 24) = v63;
    }
    else
    {
      uint64_t v64 = 0;
    }
    v112 = &v107;
    v131[0] = v61;
    *(void *)&long long v128 = v53;
    *((void *)&v128 + 1) = v55;
    char v70 = v57 & 1;
    char v129 = v70;
    uint64_t v130 = v59;
    __chkstk_darwin(v60);
    *(&v107 - 6) = v52;
    *(&v107 - 5) = v71;
    *(&v107 - 4) = v64;
    *(&v107 - 3) = a1;
    v105 = v131;
    uint64_t v72 = v71;
    sub_1000236E0(v62);
    sub_100039224(v53, v55, v70);
    swift_bridgeObjectRetain();
    sub_100012854(&qword_10010EB68);
    sub_1000BC03C(&qword_10010EB70, &qword_10010EB68);
    v73 = v113;
    sub_1000C7300();
    sub_100039234(v53, v55, v70);
    swift_bridgeObjectRelease();
    sub_100013344(v72);
    uint64_t v69 = v115;
    v68 = v116;
    uint64_t v66 = v126;
    (*(void (**)(uint64_t, char *, uint64_t *))(v115 + 32))(v126, v73, v116);
    uint64_t v65 = 0;
    uint64_t v67 = v124;
  }
  else
  {
    uint64_t v65 = 1;
    uint64_t v66 = v126;
    uint64_t v67 = v124;
    uint64_t v69 = v115;
    v68 = v116;
  }
  uint64_t v74 = 1;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(v69 + 56))(v66, v65, 1, v68);
  uint64_t v75 = *(void *)(a1 + 112);
  if (*(void *)(v75 + 16))
  {
    sub_1000C6D00();
    __int16 v106 = 256;
    v105 = 0;
    uint64_t v76 = sub_1000C6FF0();
    uint64_t v77 = v76;
    uint64_t v79 = v78;
    char v81 = v80;
    uint64_t v83 = v82;
    uint64_t v84 = *(void *)(a1 + 128);
    uint64_t v85 = *(void *)(a1 + 136);
    if (v84)
    {
      uint64_t v76 = swift_allocObject();
      uint64_t v86 = v76;
      *(void *)(v76 + 16) = v84;
      *(void *)(v76 + 24) = v85;
    }
    else
    {
      uint64_t v86 = 0;
    }
    v116 = &v107;
    v131[0] = *(unsigned char *)(a1 + 120);
    *(void *)&long long v128 = v77;
    *((void *)&v128 + 1) = v79;
    char v129 = v81 & 1;
    uint64_t v130 = v83;
    __chkstk_darwin(v76);
    *(&v107 - 6) = v75;
    *(&v107 - 5) = v89;
    *(&v107 - 4) = v86;
    *(&v107 - 3) = a1;
    v105 = v131;
    uint64_t v90 = v89;
    sub_1000236E0(v84);
    sub_100039224(v77, v79, v81 & 1);
    swift_bridgeObjectRetain();
    sub_100012854(&qword_10010EB78);
    sub_1000BC03C(&qword_10010EB80, &qword_10010EB78);
    v91 = v114;
    sub_1000C7300();
    sub_100039234(v77, v79, v81 & 1);
    swift_bridgeObjectRelease();
    sub_100013344(v90);
    uint64_t v88 = v117;
    uint64_t v67 = v124;
    uint64_t v87 = (uint64_t)v127;
    (*(void (**)(char *, char *, uint64_t))(v124 + 32))(v127, v91, v117);
    uint64_t v74 = 0;
  }
  else
  {
    uint64_t v87 = (uint64_t)v127;
    uint64_t v88 = v117;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v67 + 56))(v87, v74, 1, v88);
  long long v128 = *(_OWORD *)(a1 + 192);
  char v129 = *(unsigned char *)(a1 + 208);
  sub_100012854(&qword_10010BF18);
  uint64_t v92 = sub_1000C7280();
  if (v131[0] == 1)
  {
    __chkstk_darwin(v92);
    v105 = (unsigned char *)a1;
    sub_100012854(&qword_10010EB98);
    sub_1000BC1B8();
    uint64_t v93 = (uint64_t)v121;
    sub_1000C7310();
    uint64_t v94 = sub_100012854(&qword_10010EB88);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v94 - 8) + 56))(v93, 0, 1, v94);
  }
  else
  {
    uint64_t v95 = sub_100012854(&qword_10010EB88);
    uint64_t v93 = (uint64_t)v121;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v95 - 8) + 56))(v121, 1, 1, v95);
  }
  uint64_t v96 = v125;
  uint64_t v97 = v118;
  sub_10001A740(v125, v118, &qword_10010EB30);
  uint64_t v98 = v126;
  uint64_t v99 = v119;
  sub_10001A740(v126, v119, &qword_10010EB20);
  uint64_t v100 = (uint64_t)v120;
  sub_10001A740(v87, (uint64_t)v120, &qword_10010EB10);
  uint64_t v101 = (uint64_t)v123;
  sub_10001A740(v93, (uint64_t)v123, &qword_10010EB00);
  uint64_t v102 = v122;
  sub_10001A740(v97, v122, &qword_10010EB30);
  v103 = (int *)sub_100012854(&qword_10010EB90);
  sub_10001A740(v99, v102 + v103[12], &qword_10010EB20);
  sub_10001A740(v100, v102 + v103[16], &qword_10010EB10);
  sub_10001A740(v101, v102 + v103[20], &qword_10010EB00);
  sub_10001326C(v93, &qword_10010EB00);
  sub_10001326C((uint64_t)v127, &qword_10010EB10);
  sub_10001326C(v98, &qword_10010EB20);
  sub_10001326C(v96, &qword_10010EB30);
  sub_10001326C(v101, &qword_10010EB00);
  sub_10001326C(v100, &qword_10010EB10);
  sub_10001326C(v99, &qword_10010EB20);
  return sub_10001326C(v97, &qword_10010EB30);
}

uint64_t sub_1000BA998@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v12 = sub_100012854(&qword_10010EB60);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = &v24[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v33 = a1;
  char v32 = a5;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  *(unsigned char *)(v16 + 32) = a1;
  uint64_t v25 = &v33;
  uint64_t v26 = a4;
  uint64_t v27 = &v32;
  sub_1000236E0(a2);
  sub_100012854(&qword_10010EBE0);
  uint64_t v17 = sub_1000C6D60();
  unint64_t v18 = sub_1000BC5DC();
  unint64_t v19 = sub_1000BC630();
  *(void *)&long long v29 = &type metadata for PermissionPickerRow;
  *((void *)&v29 + 1) = v17;
  unint64_t v30 = v18;
  unint64_t v31 = v19;
  swift_getOpaqueTypeConformance2();
  sub_1000C7230();
  long long v29 = *(_OWORD *)(a4 + 144);
  LOBYTE(v30) = *(unsigned char *)(a4 + 160);
  sub_100012854(&qword_10010BF18);
  sub_1000C7280();
  LOBYTE(a3) = v28;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = a3;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v13 + 16))(a6, v15, v12);
  uint64_t v22 = (uint64_t *)(a6 + *(int *)(sub_100012854(&qword_10010EB50) + 36));
  *uint64_t v22 = KeyPath;
  v22[1] = (uint64_t)sub_1000BCD3C;
  v22[2] = v21;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_1000BAC08@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v12 = sub_100012854(&qword_10010EB60);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = &v24[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v33 = a1;
  char v32 = a5;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  *(unsigned char *)(v16 + 32) = a1;
  uint64_t v25 = &v33;
  uint64_t v26 = a4;
  uint64_t v27 = &v32;
  sub_1000236E0(a2);
  sub_100012854(&qword_10010EBE0);
  uint64_t v17 = sub_1000C6D60();
  unint64_t v18 = sub_1000BC5DC();
  unint64_t v19 = sub_1000BC630();
  *(void *)&long long v29 = &type metadata for PermissionPickerRow;
  *((void *)&v29 + 1) = v17;
  unint64_t v30 = v18;
  unint64_t v31 = v19;
  swift_getOpaqueTypeConformance2();
  sub_1000C7230();
  long long v29 = *(_OWORD *)(a4 + 144);
  LOBYTE(v30) = *(unsigned char *)(a4 + 160);
  sub_100012854(&qword_10010BF18);
  sub_1000C7280();
  LOBYTE(a3) = v28;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = a3;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v13 + 16))(a6, v15, v12);
  uint64_t v22 = (uint64_t *)(a6 + *(int *)(sub_100012854(&qword_10010EB50) + 36));
  *uint64_t v22 = KeyPath;
  v22[1] = (uint64_t)sub_1000BCD3C;
  v22[2] = v21;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_1000BAE78@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  char v10 = a1 & 1;
  char v11 = a5 & 1;
  uint64_t v12 = sub_100012854(&qword_10010EB60);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = &v24[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v33 = v10;
  char v32 = v11;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  *(unsigned char *)(v16 + 32) = v10;
  uint64_t v25 = &v33;
  uint64_t v26 = a4;
  uint64_t v27 = &v32;
  sub_1000236E0(a2);
  sub_100012854(&qword_10010EBE0);
  uint64_t v17 = sub_1000C6D60();
  unint64_t v18 = sub_1000BC5DC();
  unint64_t v19 = sub_1000BC630();
  *(void *)&long long v29 = &type metadata for PermissionPickerRow;
  *((void *)&v29 + 1) = v17;
  unint64_t v30 = v18;
  unint64_t v31 = v19;
  swift_getOpaqueTypeConformance2();
  sub_1000C7230();
  long long v29 = *(_OWORD *)(a4 + 144);
  LOBYTE(v30) = *(unsigned char *)(a4 + 160);
  sub_100012854(&qword_10010BF18);
  sub_1000C7280();
  LOBYTE(a3) = v28;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = a3;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v13 + 16))(a6, v15, v12);
  uint64_t v22 = (uint64_t *)(a6 + *(int *)(sub_100012854(&qword_10010EB50) + 36));
  *uint64_t v22 = KeyPath;
  v22[1] = (uint64_t)sub_1000BCD3C;
  v22[2] = v21;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_1000BB0E8@<X0>(uint64_t a1@<X0>, unsigned __int8 a2@<W2>, uint64_t (*a3)(uint64_t)@<X3>, uint64_t a4@<X8>)
{
  int v7 = a2;
  uint64_t v8 = sub_1000C6D60();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100012854(&qword_10010EBE0);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a3(a1);
  char v18 = v7 != a1;
  if (v7 == 2) {
    char v18 = 2;
  }
  v20[1] = v16;
  v20[2] = v17;
  char v21 = v18;
  sub_1000C6B10();
  sub_1000BC5DC();
  sub_1000BC630();
  sub_1000C7050();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a4, v15, v12);
}

uint64_t sub_1000BB2CC@<X0>(char a1@<W0>, char a2@<W2>, uint64_t a3@<X8>)
{
  int v4 = a1 & 1;
  int v5 = a2 & 1;
  uint64_t v6 = sub_1000C6D60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100012854(&qword_10010EBE0);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = sub_10003BDB8(v4);
  v16[2] = v14;
  BOOL v17 = v4 != v5;
  sub_1000C6B10();
  sub_1000BC5DC();
  sub_1000BC630();
  sub_1000C7050();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a3, v13, v10);
}

uint64_t sub_1000BB4A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v42 = sub_100012854(&qword_10010E728);
  uint64_t v3 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  int v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100012854(&qword_10010EBC0);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100012854(&qword_10010EBB0);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v43 = (uint64_t)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v48 = *(_OWORD *)(a1 + 240);
  long long v45 = *(_OWORD *)(a1 + 240);
  sub_100012854(&qword_10010D7A8);
  sub_1000C7210();
  sub_1000C7250();
  long long v46 = *(_OWORD *)(a1 + 144);
  char v47 = *(unsigned char *)(a1 + 160);
  sub_100012854(&qword_10010BF18);
  sub_1000C7280();
  char v13 = v45;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v15 = swift_allocObject();
  *(unsigned char *)(v15 + 16) = v13;
  uint64_t v16 = v42;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v9, v5, v42);
  BOOL v17 = (uint64_t *)&v9[*(int *)(v7 + 44)];
  *BOOL v17 = KeyPath;
  v17[1] = (uint64_t)sub_10004DBA0;
  v17[2] = v15;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v16);
  long long v46 = v48;
  sub_1000C71F0();
  LOBYTE(v15) = v45;
  char v18 = (_OWORD *)swift_allocObject();
  long long v19 = *(_OWORD *)(a1 + 208);
  v18[13] = *(_OWORD *)(a1 + 192);
  v18[14] = v19;
  long long v20 = *(_OWORD *)(a1 + 240);
  v18[15] = *(_OWORD *)(a1 + 224);
  v18[16] = v20;
  long long v21 = *(_OWORD *)(a1 + 144);
  v18[9] = *(_OWORD *)(a1 + 128);
  v18[10] = v21;
  long long v22 = *(_OWORD *)(a1 + 176);
  v18[11] = *(_OWORD *)(a1 + 160);
  v18[12] = v22;
  long long v23 = *(_OWORD *)(a1 + 80);
  v18[5] = *(_OWORD *)(a1 + 64);
  v18[6] = v23;
  long long v24 = *(_OWORD *)(a1 + 112);
  v18[7] = *(_OWORD *)(a1 + 96);
  v18[8] = v24;
  long long v25 = *(_OWORD *)(a1 + 16);
  v18[1] = *(_OWORD *)a1;
  v18[2] = v25;
  long long v26 = *(_OWORD *)(a1 + 48);
  v18[3] = *(_OWORD *)(a1 + 32);
  v18[4] = v26;
  uint64_t v27 = v43;
  sub_10001A740((uint64_t)v9, v43, &qword_10010EBC0);
  uint64_t v28 = v27 + *(int *)(v11 + 44);
  *(unsigned char *)uint64_t v28 = v15;
  *(void *)(v28 + 8) = sub_1000BC470;
  *(void *)(v28 + 16) = v18;
  sub_100038E98((void *)a1);
  sub_10001326C((uint64_t)v9, &qword_10010EBC0);
  long long v29 = (uint64_t (*)())swift_allocObject();
  long long v30 = *(_OWORD *)(a1 + 208);
  *((_OWORD *)v29 + 13) = *(_OWORD *)(a1 + 192);
  *((_OWORD *)v29 + 14) = v30;
  long long v31 = *(_OWORD *)(a1 + 240);
  *((_OWORD *)v29 + 15) = *(_OWORD *)(a1 + 224);
  *((_OWORD *)v29 + 16) = v31;
  long long v32 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v29 + 9) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v29 + 10) = v32;
  long long v33 = *(_OWORD *)(a1 + 176);
  *((_OWORD *)v29 + 11) = *(_OWORD *)(a1 + 160);
  *((_OWORD *)v29 + 12) = v33;
  long long v34 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v29 + 5) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v29 + 6) = v34;
  long long v35 = *(_OWORD *)(a1 + 112);
  *((_OWORD *)v29 + 7) = *(_OWORD *)(a1 + 96);
  *((_OWORD *)v29 + 8) = v35;
  long long v36 = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v29 + 1) = *(_OWORD *)a1;
  *((_OWORD *)v29 + 2) = v36;
  long long v37 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v29 + 3) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v29 + 4) = v37;
  uint64_t v38 = v44;
  sub_10001A740(v27, v44, &qword_10010EBB0);
  uint64_t v39 = (uint64_t (**)())(v38 + *(int *)(sub_100012854(&qword_10010EB98) + 36));
  *uint64_t v39 = sub_1000BC598;
  v39[1] = v29;
  v39[2] = 0;
  v39[3] = 0;
  sub_100038E98((void *)a1);
  return sub_10001326C(v27, &qword_10010EBB0);
}

uint64_t sub_1000BB894@<X0>(uint64_t a1@<X8>)
{
  sub_1000C6D00();
  uint64_t result = sub_1000C6FF0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_1000BB914()
{
  return sub_1000C7200();
}

uint64_t sub_1000BB990()
{
  uint64_t v1 = sub_1000C6AE0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100012854(&qword_10010EAE0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = v0[13];
  v17[12] = v0[12];
  v17[13] = v8;
  long long v9 = v0[15];
  v17[14] = v0[14];
  v17[15] = v9;
  long long v10 = v0[9];
  v17[8] = v0[8];
  v17[9] = v10;
  long long v11 = v0[11];
  v17[10] = v0[10];
  v17[11] = v11;
  long long v12 = v0[5];
  v17[4] = v0[4];
  v17[5] = v12;
  long long v13 = v0[7];
  v17[6] = v0[6];
  v17[7] = v13;
  long long v14 = v0[1];
  v17[0] = *v0;
  v17[1] = v14;
  long long v15 = v0[3];
  v17[2] = v0[2];
  v17[3] = v15;
  sub_1000B9CD0((uint64_t)v17, (uint64_t)v7);
  sub_1000C6AD0();
  sub_1000BBB48();
  sub_1000C7110();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_10001326C((uint64_t)v7, &qword_10010EAE0);
}

unint64_t sub_1000BBB48()
{
  unint64_t result = qword_10010EAE8;
  if (!qword_10010EAE8)
  {
    sub_100013128(&qword_10010EAE0);
    sub_10001E454(&qword_10010EAF0, &qword_10010EAF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EAE8);
  }
  return result;
}

uint64_t sub_1000BBBE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  char v8 = *a5;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  long long v10 = *(_OWORD *)(a4 + 208);
  *(_OWORD *)(v9 + 224) = *(_OWORD *)(a4 + 192);
  *(_OWORD *)(v9 + 240) = v10;
  long long v11 = *(_OWORD *)(a4 + 240);
  *(_OWORD *)(v9 + 256) = *(_OWORD *)(a4 + 224);
  *(_OWORD *)(v9 + 272) = v11;
  long long v12 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(v9 + 160) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(v9 + 176) = v12;
  long long v13 = *(_OWORD *)(a4 + 176);
  *(_OWORD *)(v9 + 192) = *(_OWORD *)(a4 + 160);
  *(_OWORD *)(v9 + 208) = v13;
  long long v14 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v9 + 96) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v9 + 112) = v14;
  long long v15 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(v9 + 128) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(v9 + 144) = v15;
  long long v16 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)a4;
  *(_OWORD *)(v9 + 48) = v16;
  long long v17 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v9 + 64) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v9 + 80) = v17;
  *(unsigned char *)(v9 + 288) = v8;
  swift_bridgeObjectRetain();
  sub_1000236E0(a2);
  sub_100038E98((void *)a4);
  sub_100012854(&qword_10010C1A0);
  sub_100012854(&qword_10010EB50);
  sub_10001E454(&qword_10010EBD8, &qword_10010C1A0);
  sub_1000BC0A4();
  sub_10003F660();
  return sub_1000C72F0();
}

uint64_t sub_1000BBD4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  char v8 = *a5;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  long long v10 = *(_OWORD *)(a4 + 208);
  *(_OWORD *)(v9 + 224) = *(_OWORD *)(a4 + 192);
  *(_OWORD *)(v9 + 240) = v10;
  long long v11 = *(_OWORD *)(a4 + 240);
  *(_OWORD *)(v9 + 256) = *(_OWORD *)(a4 + 224);
  *(_OWORD *)(v9 + 272) = v11;
  long long v12 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(v9 + 160) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(v9 + 176) = v12;
  long long v13 = *(_OWORD *)(a4 + 176);
  *(_OWORD *)(v9 + 192) = *(_OWORD *)(a4 + 160);
  *(_OWORD *)(v9 + 208) = v13;
  long long v14 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v9 + 96) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v9 + 112) = v14;
  long long v15 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(v9 + 128) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(v9 + 144) = v15;
  long long v16 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)a4;
  *(_OWORD *)(v9 + 48) = v16;
  long long v17 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v9 + 64) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v9 + 80) = v17;
  *(unsigned char *)(v9 + 288) = v8;
  swift_bridgeObjectRetain();
  sub_1000236E0(a2);
  sub_100038E98((void *)a4);
  sub_100012854(&qword_10010C188);
  sub_100012854(&qword_10010EB50);
  sub_10001E454(&qword_10010EBF0, &qword_10010C188);
  sub_1000BC0A4();
  sub_10003F3FC();
  return sub_1000C72F0();
}

uint64_t sub_1000BBEB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  char v8 = *a5;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  long long v10 = *(_OWORD *)(a4 + 208);
  *(_OWORD *)(v9 + 224) = *(_OWORD *)(a4 + 192);
  *(_OWORD *)(v9 + 240) = v10;
  long long v11 = *(_OWORD *)(a4 + 240);
  *(_OWORD *)(v9 + 256) = *(_OWORD *)(a4 + 224);
  *(_OWORD *)(v9 + 272) = v11;
  long long v12 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(v9 + 160) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(v9 + 176) = v12;
  long long v13 = *(_OWORD *)(a4 + 176);
  *(_OWORD *)(v9 + 192) = *(_OWORD *)(a4 + 160);
  *(_OWORD *)(v9 + 208) = v13;
  long long v14 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v9 + 96) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v9 + 112) = v14;
  long long v15 = *(_OWORD *)(a4 + 112);
  *(_OWORD *)(v9 + 128) = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(v9 + 144) = v15;
  long long v16 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)a4;
  *(_OWORD *)(v9 + 48) = v16;
  long long v17 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v9 + 64) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v9 + 80) = v17;
  *(unsigned char *)(v9 + 288) = v8;
  swift_bridgeObjectRetain();
  sub_1000236E0(a2);
  sub_100038E98((void *)a4);
  sub_100012854(&qword_10010C170);
  sub_100012854(&qword_10010EB50);
  sub_10001E454(&qword_10010EBF8, &qword_10010C170);
  sub_1000BC0A4();
  sub_10003F510();
  return sub_1000C72F0();
}

uint64_t sub_1000BC024()
{
  return sub_1000BC180((uint64_t (*)(void, void, void, void, void))sub_1000BBEB8);
}

uint64_t sub_1000BC03C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100013128(a2);
    sub_1000BC0A4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000BC0A4()
{
  unint64_t result = qword_10010EB48;
  if (!qword_10010EB48)
  {
    sub_100013128(&qword_10010EB50);
    sub_10001E454(&qword_10010EB58, &qword_10010EB60);
    sub_10001E454((unint64_t *)&qword_10010C928, &qword_10010C930);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EB48);
  }
  return result;
}

uint64_t sub_1000BC168()
{
  return sub_1000BC180((uint64_t (*)(void, void, void, void, void))sub_1000BBD4C);
}

uint64_t sub_1000BC180(uint64_t (*a1)(void, void, void, void, void))
{
  return a1(v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_1000BC198()
{
  return sub_1000BC180((uint64_t (*)(void, void, void, void, void))sub_1000BBBE0);
}

uint64_t sub_1000BC1B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000BB4A0(*(void *)(v1 + 16), a1);
}

unint64_t sub_1000BC1B8()
{
  unint64_t result = qword_10010EBA0;
  if (!qword_10010EBA0)
  {
    sub_100013128(&qword_10010EB98);
    sub_1000BC234();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EBA0);
  }
  return result;
}

unint64_t sub_1000BC234()
{
  unint64_t result = qword_10010EBA8;
  if (!qword_10010EBA8)
  {
    sub_100013128(&qword_10010EBB0);
    sub_1000BC2D4();
    sub_10001E454(&qword_10010EBC8, &qword_10010EBD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EBA8);
  }
  return result;
}

unint64_t sub_1000BC2D4()
{
  unint64_t result = qword_10010EBB8;
  if (!qword_10010EBB8)
  {
    sub_100013128(&qword_10010EBC0);
    sub_10001E454(&qword_10010E740, &qword_10010E728);
    sub_10001E454((unint64_t *)&qword_10010C928, &qword_10010C930);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EBB8);
  }
  return result;
}

uint64_t sub_1000BC398()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000BC3D0(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1000BC3FC(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1000BC428(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_1000BC45C()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_1000BC470(unsigned char *result)
{
  uint64_t v2 = *(uint64_t (**)(BOOL))(v1 + 144);
  if (v2) {
    return (unsigned char *)v2((*result & 1) == 0);
  }
  return result;
}

uint64_t sub_1000BC4B0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0[8]) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0[14]) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  if (v0[18]) {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 272, 7);
}

uint64_t sub_1000BC598()
{
  return sub_1000BB914();
}

uint64_t sub_1000BC5A4(unsigned __int8 *a1)
{
  return sub_1000BC6B4(a1, (uint64_t (*)(void, void, void, uint64_t, void))sub_1000BA998);
}

uint64_t sub_1000BC5C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000BC730((uint64_t (*)(uint64_t))sub_10003BEE4, a1);
}

unint64_t sub_1000BC5DC()
{
  unint64_t result = qword_10010EBE8;
  if (!qword_10010EBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EBE8);
  }
  return result;
}

unint64_t sub_1000BC630()
{
  unint64_t result = qword_10010E748;
  if (!qword_10010E748)
  {
    sub_1000C6D60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010E748);
  }
  return result;
}

uint64_t sub_1000BC688()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000BC69C(unsigned __int8 *a1)
{
  return sub_1000BC6B4(a1, (uint64_t (*)(void, void, void, uint64_t, void))sub_1000BAC08);
}

uint64_t sub_1000BC6B4(unsigned __int8 *a1, uint64_t (*a2)(void, void, void, uint64_t, void))
{
  return a2(*a1, *(void *)(v2 + 16), *(void *)(v2 + 24), v2 + 32, *(unsigned __int8 *)(v2 + 288));
}

uint64_t sub_1000BC6D4()
{
  uint64_t v1 = *(uint64_t (**)(char *))(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 32);
  if (v1) {
    return v1(&v3);
  }
  return result;
}

uint64_t sub_1000BC718@<X0>(uint64_t a1@<X8>)
{
  return sub_1000BC730((uint64_t (*)(uint64_t))sub_10003BBE0, a1);
}

uint64_t sub_1000BC730@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  return sub_1000BB0E8(**(unsigned __int8 **)(v2 + 16), **(unsigned char **)(v2 + 32), a1, a2);
}

uint64_t sub_1000BC75C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000BC770()
{
  if (v0[2]) {
    swift_release();
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0[10]) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0[16]) {
    swift_release();
  }
  swift_bridgeObjectRelease();
  if (v0[20]) {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 289, 7);
}

uint64_t sub_1000BC868@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000BAE78(*a1, *(void *)(v2 + 16), *(void *)(v2 + 24), v2 + 32, *(unsigned char *)(v2 + 288), a2);
}

uint64_t sub_1000BC880()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_1000BC8C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000BB2CC(**(unsigned char **)(v1 + 16), **(unsigned char **)(v1 + 32), a1);
}

uint64_t sub_1000BC8D4()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1000BC8E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PermissionPickerRow(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for PermissionPickerRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for PermissionPickerRow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PermissionPickerRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PermissionPickerRow()
{
  return &type metadata for PermissionPickerRow;
}

uint64_t sub_1000BCA50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000BCAC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000BCAE0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 != 255) {
    return sub_1000BCAF8();
  }
  return result;
}

uint64_t sub_1000BCAF8()
{
  swift_retain();
  swift_retain();

  return swift_retain();
}

uint64_t sub_1000BCB40(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 != 255) {
    return sub_1000BCB58();
  }
  return result;
}

uint64_t sub_1000BCB58()
{
  swift_release();
  swift_release();

  return swift_release();
}

unsigned char *storeEnumTagSinglePayload for PermissionPickerRow.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000BCC70);
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

ValueMetadata *type metadata accessor for PermissionPickerRow.State()
{
  return &type metadata for PermissionPickerRow.State;
}

uint64_t sub_1000BCCA8()
{
  return sub_10001E454(&qword_10010EC00, &qword_10010EC08);
}

unint64_t sub_1000BCCE8()
{
  unint64_t result = qword_10010EC10;
  if (!qword_10010EC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EC10);
  }
  return result;
}

uint64_t sub_1000BCD48(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000012;
  unint64_t v3 = 0x80000001000D35C0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000012;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000015;
      unsigned int v6 = "presentComposeMessage";
      goto LABEL_5;
    case 2:
      unint64_t v5 = 0xD000000000000016;
      unsigned int v6 = "presentComposeCopyLink";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD000000000000018;
      unsigned int v6 = "presentComposeThirdParty";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x80000001000D35C0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD000000000000015;
      char v8 = "presentComposeMessage";
      goto LABEL_10;
    case 2:
      unint64_t v2 = 0xD000000000000016;
      char v8 = "presentComposeCopyLink";
      goto LABEL_10;
    case 3:
      unint64_t v2 = 0xD000000000000018;
      char v8 = "presentComposeThirdParty";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_1000C7A50();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int sub_1000BCEA8()
{
  return sub_1000C7B30();
}

uint64_t sub_1000BCF84()
{
  sub_1000C7480();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000BD040()
{
  return sub_1000C7B30();
}

uint64_t sub_1000BD118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1000C7600();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1000C75F0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_10001326C(a1, &qword_10010B770);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000C7590();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1000BD2A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000C7600();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000C75F0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10001326C(a1, &qword_10010B770);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000C7590();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000BD44C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000BD478@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100012854((uint64_t *)&unk_10010BDD0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v15 - v7;
  id v9 = [*(id *)(v1 + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing22ActivityItemDataSource_share) URL];
  if (v9)
  {
    long long v10 = v9;
    sub_1000C64F0();

    uint64_t v11 = sub_1000C6530();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 0, 1, v11);
  }
  else
  {
    uint64_t v11 = sub_1000C6530();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  }
  sub_100012898((uint64_t)v6, (uint64_t)v8, (uint64_t *)&unk_10010BDD0);
  sub_1000C6530();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) == 1)
  {
    uint64_t result = sub_10001326C((uint64_t)v8, (uint64_t *)&unk_10010BDD0);
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  else
  {
    *(void *)(a1 + 24) = v11;
    long long v14 = sub_100036448((uint64_t *)a1);
    return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v12 + 32))(v14, v8, v11);
  }
  return result;
}

uint64_t type metadata accessor for ActivityItemDataSource()
{
  return self;
}

uint64_t sub_1000BD74C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

unint64_t sub_1000BD7F4(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1000BD87C(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000BD904(unsigned __int8 *a1, char *a2)
{
  return sub_1000BCD48(*a1, *a2);
}

Swift::Int sub_1000BD910()
{
  return sub_1000BCEA8();
}

uint64_t sub_1000BD918()
{
  return sub_1000BCF84();
}

Swift::Int sub_1000BD920()
{
  return sub_1000BD040();
}

uint64_t sub_1000BD928@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000C4694(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000BD958@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000BD87C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1000BD984@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000BD7F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000BDBB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v15 = a1;
  uint64_t v1 = sub_100012854((uint64_t *)&unk_10010BDD0);
  uint64_t v2 = __chkstk_darwin(v1);
  unint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  sub_100012854((uint64_t *)&unk_10010BD70);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000CABA0;
  unint64_t v16 = 0;
  unint64_t v17 = 0xE000000000000000;
  sub_1000C78D0(38);
  swift_bridgeObjectRelease();
  unint64_t v16 = 0xD000000000000024;
  unint64_t v17 = 0x80000001000DA040;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_release();
  v18._countAndFlagsBits = sub_1000C7450();
  sub_1000C74B0(v18);
  swift_bridgeObjectRelease();
  unint64_t v6 = v16;
  unint64_t v7 = v17;
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_100036368();
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  sub_1000C6580();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v8 = sub_1000C6530();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v4, 1, v8) == 1)
  {
    uint64_t result = sub_10001326C((uint64_t)v4, (uint64_t *)&unk_10010BDD0);
    uint64_t v11 = v15;
    *(_OWORD *)uint64_t v15 = 0u;
    *((_OWORD *)v11 + 1) = 0u;
  }
  else
  {
    uint64_t v12 = v15;
    v15[3] = v8;
    long long v13 = sub_100036448(v12);
    return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v9 + 32))(v13, v4, v8);
  }
  return result;
}

id sub_1000BDE94(void *a1, uint64_t a2, void *a3, void *a4, void (*a5)(void *__return_ptr))
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a1;
  a5(v18);

  uint64_t v11 = v19;
  if (v19)
  {
    uint64_t v12 = sub_1000C43B4(v18, v19);
    uint64_t v13 = *(void *)(v11 - 8);
    __chkstk_darwin(v12);
    uint64_t v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    unint64_t v16 = (void *)sub_1000C7A40();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_100075E20((uint64_t)v18);
  }
  else
  {
    unint64_t v16 = 0;
  }

  return v16;
}

id sub_1000BDFF8(void *a1)
{
  if (!a1) {
    return [objc_allocWithZone((Class)NSOperation) init];
  }
  type metadata accessor for UIActivityTransportViewController();
  uint64_t v3 = swift_dynamicCastClass();
  if (!v3) {
    return [objc_allocWithZone((Class)NSOperation) init];
  }
  unint64_t v4 = (void *)v3;
  id v5 = a1;
  id v6 = [v4 activity];
  if (v6)
  {
    unint64_t v7 = v6;
    id v8 = (void *)swift_allocObject();
    v8[2] = v4;
    v8[3] = v7;
    v8[4] = v1;
    v16[4] = sub_1000C41B0;
    v16[5] = v8;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    v16[2] = sub_1000BCEA4;
    void v16[3] = &unk_100103728;
    id v9 = _Block_copy(v16);
    id v10 = self;
    id v11 = v5;
    id v12 = v7;
    id v13 = v1;
    id v14 = [v10 blockOperationWithBlock:v9];
    _Block_release(v9);

    swift_release();
  }
  else
  {
    id v14 = [objc_allocWithZone((Class)NSOperation) init];
  }
  return v14;
}

void sub_1000BE19C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v57 = sub_1000C66D0();
  uint64_t v6 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  id v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100012854(&qword_10010B770);
  __chkstk_darwin(v9 - 8);
  uint64_t v58 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = *(void (**)(uint64_t))(a1
                                       + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController_userDidTapTransport);
  if (v11)
  {
    swift_retain();
    v11(a2);
    sub_100013344((uint64_t)v11);
  }
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  uint64_t v13 = sub_1000C7600();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = (uint64_t)v58;
  uint64_t v54 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 56);
  uint64_t v55 = v13;
  uint64_t v53 = v14 + 56;
  v54(v58, 1, 1);
  uint64_t v16 = sub_1000C75D0();
  id v17 = a3;
  Swift::String v18 = v12;
  uint64_t v52 = v16;
  uint64_t v19 = sub_1000C75C0();
  long long v20 = (void *)swift_allocObject();
  v20[2] = v19;
  void v20[3] = &protocol witness table for MainActor;
  v20[4] = v17;
  v20[5] = v18;
  sub_1000BD2A0(v15, (uint64_t)&unk_10010EF28, (uint64_t)v20);
  swift_release();
  char v56 = v18;
  sub_1000C7710();
  sub_1000C66B0();
  long long v21 = v17;
  long long v22 = sub_1000C66C0();
  os_log_type_t v23 = sub_1000C7670();
  long long v24 = &qword_10010E000;
  if (os_log_type_enabled(v22, v23))
  {
    long long v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    *(_DWORD *)long long v25 = 136315138;
    uint64_t v26 = *(void *)&v21[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error
                        + 8];
    uint64_t v27 = *(void **)&v21[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error
                       + 16];
    uint64_t v28 = *(void *)&v21[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error
                        + 24];
    uint64_t v29 = *(void *)&v21[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error
                        + 32];
    unsigned __int8 v30 = v21[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error + 40];
    uint64_t v59 = *(void *)&v21[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error];
    uint64_t v60 = v26;
    char v61 = v27;
    uint64_t v62 = v28;
    uint64_t v63 = v29;
    unsigned __int8 v64 = v30;
    sub_1000C43A0(v59, v26, v27, v28, v29, v30);
    sub_100012854(&qword_10010EF40);
    uint64_t v31 = sub_1000C7450();
    uint64_t v59 = sub_1000720D0(v31, v32, &v65);
    sub_1000C7850();

    long long v24 = &qword_10010E000;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "UIActivityTransportView wait finished iosPrepareToShare, error: %s", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v57);
  long long v33 = &v21[v24[424]];
  int v34 = v33[40];
  if (v34 == 255) {
    goto LABEL_11;
  }
  uint64_t v35 = *(void *)v33;
  uint64_t v36 = *((void *)v33 + 1);
  uint64_t v38 = (void *)*((void *)v33 + 2);
  uint64_t v37 = *((void *)v33 + 3);
  uint64_t v39 = *((void *)v33 + 4);
  sub_1000C7440();
  id v40 = objc_allocWithZone((Class)NSError);
  uint64_t v57 = v35;
  uint64_t v51 = v36;
  uint64_t v41 = v36;
  uint64_t v42 = v37;
  sub_1000236F4(v35, v41, v38, v37, v39, v34);
  NSString v43 = sub_1000C7400();
  swift_bridgeObjectRelease();
  id v44 = [v40 initWithDomain:v43 code:1 userInfo:0];

  if (v34 == 4)
  {

    if (!v38)
    {
      __break(1u);
      return;
    }
    goto LABEL_13;
  }
  if (v34 == 1)
  {

    if (!v38)
    {
      __break(1u);
LABEL_11:

      return;
    }
LABEL_13:
    id v44 = v38;
  }
  uint64_t v45 = (uint64_t)v58;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(v58, 1, 1, v55);
  long long v46 = v21;
  id v47 = v44;
  uint64_t v48 = sub_1000C75C0();
  uint64_t v49 = (void *)swift_allocObject();
  v49[2] = v48;
  v49[3] = &protocol witness table for MainActor;
  v49[4] = v46;
  v49[5] = v47;
  sub_1000BD2A0(v45, (uint64_t)&unk_10010EF38, (uint64_t)v49);
  swift_release();

  sub_1000C438C(v57, v51, v38, v42, v39, v34);
}

uint64_t sub_1000BE6E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[17] = a4;
  v5[18] = a5;
  uint64_t v6 = sub_1000C66D0();
  v5[19] = v6;
  v5[20] = *(void *)(v6 - 8);
  v5[21] = swift_task_alloc();
  sub_1000C75D0();
  v5[22] = sub_1000C75C0();
  uint64_t v8 = sub_1000C7590();
  v5[23] = v8;
  v5[24] = v7;
  return _swift_task_switch(sub_1000BE7D8, v8, v7);
}

uint64_t sub_1000BE7D8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000BE880;
  return sub_10006B15C(v0 + 16);
}

uint64_t sub_1000BE880()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 192);
  uint64_t v3 = *(void *)(v1 + 184);
  return _swift_task_switch(sub_1000BE9A0, v3, v2);
}

uint64_t sub_1000BE9A0()
{
  uint64_t v34 = v0;
  uint64_t v1 = *(unsigned char **)(v0 + 136);
  swift_release();
  uint64_t v2 = &v1[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error];
  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error];
  uint64_t v4 = *(void *)&v1[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error
                    + 8];
  uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error
                   + 16];
  uint64_t v6 = *(void *)&v1[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error
                    + 24];
  uint64_t v7 = *(void *)&v1[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error
                    + 32];
  unsigned __int8 v8 = v1[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error + 40];
  sub_100012898(v0 + 16, (uint64_t)&v1[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error], &qword_10010EF40);
  sub_1000C438C(v3, v4, v5, v6, v7, v8);
  sub_1000C66B0();
  uint64_t v9 = v1;
  uint64_t v10 = sub_1000C66C0();
  os_log_type_t v11 = sub_1000C7670();
  if (os_log_type_enabled(v10, v11))
  {
    dispatch_semaphore_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)dispatch_semaphore_t v12 = 136315138;
    int v13 = v2[40];
    if (v13 == 255)
    {
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v16 = v32;
    }
    else
    {
      uint64_t v14 = *((void *)v2 + 4);
      long long v15 = *((_OWORD *)v2 + 1);
      uint64_t v16 = v32;
      *(_OWORD *)(v32 + 64) = *(_OWORD *)v2;
      *(_OWORD *)(v32 + 80) = v15;
      *(void *)(v32 + 96) = v14;
      *(unsigned char *)(v32 + 104) = v13;
      sub_100012A24();
      uint64_t v17 = sub_1000C7AB0();
    }
    uint64_t v31 = *(void *)(v16 + 168);
    uint64_t v25 = *(void *)(v32 + 152);
    uint64_t v24 = *(void *)(v32 + 160);
    uint64_t v26 = *(void **)(v32 + 136);
    *(void *)(v32 + 112) = v17;
    *(void *)(v32 + 120) = v18;
    sub_100012854(&qword_10010CBB0);
    uint64_t v27 = sub_1000C7450();
    *(void *)(v32 + 128) = sub_1000720D0(v27, v28, &v33);
    sub_1000C7850();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "UIActivityTransportView iosPrepareToShare (sharingURL attempt) error: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v31, v25);
    uint64_t v23 = v32;
  }
  else
  {
    uint64_t v20 = *(void *)(v32 + 160);
    uint64_t v19 = *(void *)(v32 + 168);
    uint64_t v21 = *(void *)(v32 + 152);
    long long v22 = *(void **)(v32 + 136);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    uint64_t v23 = v32;
  }
  sub_1000C7720();
  swift_task_dealloc();
  uint64_t v29 = *(uint64_t (**)(void))(v23 + 8);
  return v29();
}

uint64_t sub_1000BEC70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_1000C75D0();
  v5[4] = sub_1000C75C0();
  uint64_t v7 = sub_1000C7590();
  return _swift_task_switch(sub_1000BED08, v7, v6);
}

uint64_t sub_1000BED08()
{
  uint64_t v1 = *(void **)(v0 + 24);
  swift_release();
  sub_100067284(3u, v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

id sub_1000BEE18()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIActivityTransportView.Coordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for UIActivityTransportView.Coordinator()
{
  return self;
}

uint64_t sub_1000BEEE0(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_1000C75D0();
  v2[4] = sub_1000C75C0();
  uint64_t v4 = sub_1000C7590();
  v2[5] = v4;
  v2[6] = v3;
  return _swift_task_switch(sub_1000BEF78, v4, v3);
}

uint64_t sub_1000BEF78(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4 < 1)
  {
    __break(1u);
    return _swift_task_switch(a1, a2, a3);
  }
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = **(void **)(v3 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000C67E0();
  swift_release();
  swift_release();
  if (*(unsigned __int8 *)(v3 + 80) - 2 > 3
    || (swift_getKeyPath(),
        swift_getKeyPath(),
        sub_1000C67E0(),
        swift_release(),
        swift_release(),
        *(unsigned char *)(v3 + 81) == 2))
  {
    a1 = sub_1000BF140;
    a2 = 0;
    a3 = 0;
    return _swift_task_switch(a1, a2, a3);
  }
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000C67E0();
  swift_release();
  swift_release();
  BOOL v5 = *(unsigned __int8 *)(v3 + 82) - 3 < 2;
  uint64_t v6 = *(uint64_t (**)(BOOL))(v3 + 8);
  return v6(v5);
}

uint64_t sub_1000BF140()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000BF1D8;
  return static Task<>.sleep(nanoseconds:)(1000000000);
}

uint64_t sub_1000BF1D8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    BOOL v5 = sub_1000C51B8;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    BOOL v5 = sub_1000BF2FC;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_1000BF2FC(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 56);
  if (v4 == 1)
  {
    BOOL v5 = (unsigned __int8 *)(v3 + 83);
  }
  else
  {
    if (v4 < 2)
    {
      __break(1u);
      return _swift_task_switch(a1, a2, a3);
    }
    *(void *)(v3 + 56) = v4 - 1;
    *(void *)(v3 + 64) = **(void **)(v3 + 24);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1000C67E0();
    swift_release();
    swift_release();
    if (*(unsigned __int8 *)(v3 + 80) - 2 > 3
      || (swift_getKeyPath(),
          swift_getKeyPath(),
          sub_1000C67E0(),
          swift_release(),
          swift_release(),
          *(unsigned char *)(v3 + 81) == 2))
    {
      a1 = sub_1000BF140;
      a2 = 0;
      a3 = 0;
      return _swift_task_switch(a1, a2, a3);
    }
    BOOL v5 = (unsigned __int8 *)(v3 + 82);
  }
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1000C67E0();
  swift_release();
  swift_release();
  BOOL v6 = *v5 - 3 < 2;
  uint64_t v7 = *(uint64_t (**)(BOOL))(v3 + 8);
  return v7(v6);
}

id sub_1000BF4D8()
{
  uint64_t v1 = v0;
  id v2 = [objc_allocWithZone((Class)type metadata accessor for ShareCopyLinkActivity()) init];
  sub_100012854(&qword_10010BDE0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1000CABA0;
  *(void *)(v3 + 56) = type metadata accessor for UIActivityTransportView.Coordinator();
  sub_100012854((uint64_t *)&unk_10010EF60);
  sub_1000C6E80();
  uint64_t v71 = sub_100012854(&qword_10010BD50);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1000CC370;
  *(void *)(v4 + 32) = v2;
  aBlock = (void **)v4;
  sub_1000C7550();
  uint64_t v5 = *(void *)v0;
  long long v6 = *(_OWORD *)(v0 + 144);
  long long v81 = *(_OWORD *)(v0 + 128);
  long long v82 = v6;
  id v72 = v2;
  swift_retain();
  sub_100012854(&qword_10010BF28);
  sub_1000C72B0();
  uint64_t v7 = aBlock;
  uint64_t v8 = v75;
  uint64_t v9 = (uint64_t)v76;
  uint64_t v10 = v77;
  os_log_type_t v11 = (objc_class *)type metadata accessor for UIActivityTransportViewController();
  dispatch_semaphore_t v12 = (char *)objc_allocWithZone(v11);
  int v13 = &v12[OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController_userDidTapTransport];
  *(void *)int v13 = 0;
  *((void *)v13 + 1) = 0;
  *(void *)&v12[OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController_sharingModel] = v5;
  uint64_t v14 = (void ***)&v12[OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController__transportPrepCompletion];
  *uint64_t v14 = v7;
  v14[1] = (void **)v8;
  v14[2] = (void **)v9;
  v14[3] = v10;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000236E0(v9);
  Class isa = sub_1000C7530().super.isa;
  swift_bridgeObjectRelease();
  sub_1000132C8(0, (unint64_t *)&qword_10010EF70);
  Class v16 = sub_1000C7530().super.isa;
  swift_bridgeObjectRelease();
  v80.receiver = v12;
  v80.super_class = v11;
  id v17 = objc_msgSendSuper2(&v80, "initWithActivityItems:applicationActivities:", isa, v16);
  swift_release();
  swift_release();
  sub_100013344(v9);

  swift_release();
  [v17 setAllowsEmbedding:1];
  [v17 setConfigureForCloudSharing:1];
  sub_100012854(&qword_10010EF78);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1000D2E50;
  *(void *)(v18 + 32) = UIActivityTypeAirDrop;
  *(void *)(v18 + 40) = UIActivityTypeAddToReadingList;
  uint64_t v19 = (void *)UIActivityTypeCreateReminder;
  uint64_t v20 = (void *)UIActivityTypeSaveToNotes;
  *(void *)(v18 + 48) = UIActivityTypeCreateReminder;
  *(void *)(v18 + 56) = v20;
  type metadata accessor for ActivityType(0);
  uint64_t v21 = (char *)v17;
  long long v22 = UIActivityTypeAirDrop;
  uint64_t v23 = UIActivityTypeAddToReadingList;
  id v24 = v19;
  id v25 = v20;
  Class v26 = sub_1000C7530().super.isa;
  swift_bridgeObjectRelease();
  [v21 setExcludedActivityTypes:v26];

  uint64_t v27 = swift_allocObject();
  long long v28 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v27 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v27 + 128) = v28;
  long long v29 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v27 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v27 + 96) = v29;
  *(unsigned char *)(v27 + 192) = *(unsigned char *)(v1 + 176);
  long long v30 = *(_OWORD *)(v1 + 160);
  long long v31 = *(_OWORD *)(v1 + 128);
  *(_OWORD *)(v27 + 160) = *(_OWORD *)(v1 + 144);
  *(_OWORD *)(v27 + 176) = v30;
  *(_OWORD *)(v27 + 144) = v31;
  long long v32 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v27 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v27 + 32) = v32;
  long long v33 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v27 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v27 + 64) = v33;
  uint64_t v34 = (void (**)(void *))&v21[OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController_userDidTapTransport];
  uint64_t v35 = *(void *)&v21[OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController_userDidTapTransport];
  *uint64_t v34 = sub_1000C4DF4;
  v34[1] = (void (*)(void *))v27;
  sub_100096D64(v1);
  sub_100013344(v35);
  uint64_t v36 = swift_allocObject();
  long long v37 = *(_OWORD *)(v1 + 144);
  *(_OWORD *)(v36 + 144) = *(_OWORD *)(v1 + 128);
  *(_OWORD *)(v36 + 160) = v37;
  *(_OWORD *)(v36 + 176) = *(_OWORD *)(v1 + 160);
  *(unsigned char *)(v36 + 192) = *(unsigned char *)(v1 + 176);
  long long v38 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v36 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v36 + 96) = v38;
  long long v39 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v36 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v36 + 128) = v39;
  long long v40 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v36 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v36 + 32) = v40;
  long long v41 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v36 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v36 + 64) = v41;
  uint64_t v78 = sub_1000C4EBC;
  uint64_t v79 = v36;
  aBlock = _NSConcreteStackBlock;
  uint64_t v75 = 1107296256;
  uint64_t v76 = sub_10009C300;
  uint64_t v77 = (void **)&unk_100103938;
  uint64_t v42 = _Block_copy(&aBlock);
  NSString v43 = v21;
  sub_100096D64(v1);
  swift_release();
  [v43 setCompletionWithItemsHandler:v42];
  _Block_release(v42);

  id v44 = (void *)qword_10010EC20;
  qword_10010EC20 = (uint64_t)v43;
  uint64_t v45 = v43;

  id result = [v45 view];
  if (!result) {
    goto LABEL_17;
  }
  id v47 = result;
  v73 = v45;
  uint64_t v48 = swift_allocObject();
  *(void *)(v48 + 16) = _swiftEmptyArrayStorage;
  uint64_t v49 = (unint64_t *)(v48 + 16);
  sub_1000C321C(v47, v48);
  swift_beginAccess();
  unint64_t v50 = *v49;
  swift_bridgeObjectRetain();

  id result = (id)swift_release();
  if (v50 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_1000C7990();
    id result = (id)swift_bridgeObjectRelease();
    if (!v51) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v51 = *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v51) {
      goto LABEL_13;
    }
  }
  if (v51 < 1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  for (uint64_t i = 0; i != v51; ++i)
  {
    if ((v50 & 0xC000000000000001) != 0) {
      id v53 = (id)sub_1000C78F0();
    }
    else {
      id v53 = *(id *)(v50 + 8 * i + 32);
    }
    uint64_t v54 = v53;
    objc_msgSend(v53, "setDirectionalLayoutMargins:", 0.0, 20.0, 0.0, 20.0, v71, v72);
    self;
    uint64_t v55 = swift_dynamicCastObjCClass();
    if (v55)
    {
      char v56 = (void *)v55;
      id v57 = v54;
      [v56 contentInset];
      double v59 = v58;
      double v61 = v60;
      double v63 = v62;
      [v56 setAlwaysBounceVertical:0];
      [v56 setScrollEnabled:0];
      [v56 setClipsToBounds:0];
      objc_msgSend(v56, "setContentInset:", v59, v61, -15.0, v63);
    }
  }
LABEL_13:
  swift_bridgeObjectRelease();
  id v64 = [objc_allocWithZone((Class)UIViewController) init];
  id result = [v64 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v65 = result;
  objc_msgSend(result, "setDirectionalLayoutMargins:", 0.0, 0.0, -1.0, 0.0);

  id result = [v64 view];
  if (result)
  {
    uint64_t v66 = result;
    [result setClipsToBounds:1];

    sub_10000A54C(v73);
    uint64_t v67 = swift_allocObject();
    *(_OWORD *)(v67 + 16) = xmmword_1000D2E60;
    v68 = self;
    *(void *)(v67 + 32) = [v68 traitCollectionWithHorizontalSizeClass:1];
    *(void *)(v67 + 40) = [v68 traitCollectionWithVerticalSizeClass:1];
    *(void *)&long long v81 = v67;
    sub_1000C7550();
    sub_1000132C8(0, &qword_10010EF80);
    Class v69 = sub_1000C7530().super.isa;
    swift_bridgeObjectRelease();
    id v70 = [v68 traitCollectionWithTraitsFromCollections:v69];

    [v64 setOverrideTraitCollection:v70 forChildViewController:v73];
    return v64;
  }
LABEL_19:
  __break(1u);
  return result;
}

void sub_1000BFD00(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100012854(&qword_10010B770);
  __chkstk_darwin(v4 - 8);
  long long v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [a1 activityType];
  if (!v7) {
    return;
  }
  id v47 = v7;
  uint64_t v8 = sub_1000C7440();
  uint64_t v10 = v9;
  if (v8 == sub_1000C7440() && v10 == v11)
  {
LABEL_17:
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  char v13 = sub_1000C7A50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v13 & 1) == 0)
  {
    uint64_t v14 = sub_1000C7440();
    uint64_t v16 = v15;
    if (v14 != sub_1000C7440() || v16 != v17)
    {
      char v19 = sub_1000C7A50();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0)
      {
        uint64_t v20 = qword_10010ACE8;
        id v21 = v47;
        if (v20 != -1) {
          swift_once();
        }
        uint64_t v22 = sub_1000C7440();
        uint64_t v24 = v23;
        if (v22 == sub_1000C7440() && v24 == v25)
        {

          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v27 = sub_1000C7A50();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v27 & 1) == 0)
          {
            type metadata accessor for GlobalPermissionViewModel();
            swift_allocObject();
            uint64_t v39 = swift_retain();
            sub_1000407F0(v39);
            swift_release();
            swift_getKeyPath();
            swift_getKeyPath();
            sub_1000C67E0();
            swift_release();
            swift_release();
            if (v49 == 1)
            {
              uint64_t v40 = sub_1000C7600();
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v6, 1, 1, v40);
              sub_1000C75D0();
              sub_100096D64(a2);
              uint64_t v41 = sub_1000C75C0();
              uint64_t v31 = swift_allocObject();
              *(void *)(v31 + 16) = v41;
              *(void *)(v31 + 24) = &protocol witness table for MainActor;
              long long v42 = *(_OWORD *)(a2 + 144);
              *(_OWORD *)(v31 + 160) = *(_OWORD *)(a2 + 128);
              *(_OWORD *)(v31 + 176) = v42;
              *(_OWORD *)(v31 + 192) = *(_OWORD *)(a2 + 160);
              *(unsigned char *)(v31 + 208) = *(unsigned char *)(a2 + 176);
              long long v43 = *(_OWORD *)(a2 + 80);
              *(_OWORD *)(v31 + 96) = *(_OWORD *)(a2 + 64);
              *(_OWORD *)(v31 + 112) = v43;
              long long v44 = *(_OWORD *)(a2 + 112);
              *(_OWORD *)(v31 + 128) = *(_OWORD *)(a2 + 96);
              *(_OWORD *)(v31 + 144) = v44;
              long long v45 = *(_OWORD *)(a2 + 16);
              *(_OWORD *)(v31 + 32) = *(_OWORD *)a2;
              *(_OWORD *)(v31 + 48) = v45;
              long long v46 = *(_OWORD *)(a2 + 48);
              *(_OWORD *)(v31 + 64) = *(_OWORD *)(a2 + 32);
              *(_OWORD *)(v31 + 80) = v46;
              long long v37 = &unk_10010EFA0;
              goto LABEL_27;
            }
            long long v49 = *(_OWORD *)(a2 + 8);
            char v50 = *(unsigned char *)(a2 + 24);
            char v38 = 3;
LABEL_29:
            char v48 = v38;
            sub_100012854(&qword_10010EF90);
            sub_1000C7290();
            goto LABEL_30;
          }
        }
        type metadata accessor for GlobalPermissionViewModel();
        swift_allocObject();
        uint64_t v28 = swift_retain();
        sub_1000407F0(v28);
        swift_release();
        swift_getKeyPath();
        swift_getKeyPath();
        sub_1000C67E0();
        swift_release();
        swift_release();
        if (v49 == 1)
        {
          uint64_t v29 = sub_1000C7600();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v6, 1, 1, v29);
          sub_1000C75D0();
          sub_100096D64(a2);
          uint64_t v30 = sub_1000C75C0();
          uint64_t v31 = swift_allocObject();
          *(void *)(v31 + 16) = v30;
          *(void *)(v31 + 24) = &protocol witness table for MainActor;
          long long v32 = *(_OWORD *)(a2 + 144);
          *(_OWORD *)(v31 + 160) = *(_OWORD *)(a2 + 128);
          *(_OWORD *)(v31 + 176) = v32;
          *(_OWORD *)(v31 + 192) = *(_OWORD *)(a2 + 160);
          *(unsigned char *)(v31 + 208) = *(unsigned char *)(a2 + 176);
          long long v33 = *(_OWORD *)(a2 + 80);
          *(_OWORD *)(v31 + 96) = *(_OWORD *)(a2 + 64);
          *(_OWORD *)(v31 + 112) = v33;
          long long v34 = *(_OWORD *)(a2 + 112);
          *(_OWORD *)(v31 + 128) = *(_OWORD *)(a2 + 96);
          *(_OWORD *)(v31 + 144) = v34;
          long long v35 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)(v31 + 32) = *(_OWORD *)a2;
          *(_OWORD *)(v31 + 48) = v35;
          long long v36 = *(_OWORD *)(a2 + 48);
          *(_OWORD *)(v31 + 64) = *(_OWORD *)(a2 + 32);
          *(_OWORD *)(v31 + 80) = v36;
          long long v37 = &unk_10010EFB0;
LABEL_27:
          sub_1000BD2A0((uint64_t)v6, (uint64_t)v37, v31);
          swift_release();
LABEL_30:
          swift_release();

          return;
        }
        long long v49 = *(_OWORD *)(a2 + 8);
        char v50 = *(unsigned char *)(a2 + 24);
        char v38 = 2;
        goto LABEL_29;
      }
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_18:
  id v26 = v47;
}

uint64_t sub_1000C0264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  sub_100012854((uint64_t *)&unk_10010BDD0);
  v4[3] = swift_task_alloc();
  v4[4] = swift_task_alloc();
  v4[5] = swift_task_alloc();
  uint64_t v5 = sub_1000C6530();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  v4[9] = sub_1000C75D0();
  v4[10] = sub_1000C75C0();
  long long v6 = (void *)swift_task_alloc();
  v4[11] = v6;
  *long long v6 = v4;
  v6[1] = sub_1000C03C0;
  return sub_1000BEEE0(10);
}

uint64_t sub_1000C03C0(char a1)
{
  *(unsigned char *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  uint64_t v3 = sub_1000C7590();
  return _swift_task_switch(sub_1000C0504, v3, v2);
}

uint64_t sub_1000C0504()
{
  char v1 = *(unsigned char *)(v0 + 96);
  swift_release();
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 48);
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v4 = *(void *)(v0 + 40);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_1000C67E0();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
    if (v5(v4, 1, v2) == 1)
    {
      sub_10001326C(*(void *)(v0 + 40), (uint64_t *)&unk_10010BDD0);
    }
    else
    {
      uint64_t v10 = *(void *)(v0 + 56);
      uint64_t v9 = *(void *)(v0 + 64);
      uint64_t v11 = *(void *)(v0 + 48);
      uint64_t v13 = *(void *)(v0 + 24);
      uint64_t v12 = *(void *)(v0 + 32);
      (*(void (**)(uint64_t, void, uint64_t))(v10 + 32))(v9, *(void *)(v0 + 40), v11);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, v9, v11);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v12, 0, 1, v11);
      id v14 = [self generalPasteboard];
      sub_1000128FC(v12, v13);
      if (v5(v13, 1, v11) == 1)
      {
        uint64_t v16 = 0;
      }
      else
      {
        uint64_t v17 = *(void *)(v0 + 48);
        uint64_t v18 = *(void *)(v0 + 56);
        uint64_t v19 = *(void *)(v0 + 24);
        sub_1000C64C0(v15);
        uint64_t v16 = v20;
        (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v17);
      }
      uint64_t v22 = *(void *)(v0 + 56);
      uint64_t v21 = *(void *)(v0 + 64);
      uint64_t v23 = *(void *)(v0 + 48);
      uint64_t v24 = *(void *)(v0 + 32);
      [v14 setURL:v16];

      sub_10001326C(v24, (uint64_t *)&unk_10010BDD0);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    }
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_10000AB98();
      uint64_t v25 = (void *)sub_10000A1F4();
      if (v25)
      {
        [v25 _dismissViewControllerWithError:0];
        swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_1000C7440();
    id v6 = objc_allocWithZone((Class)NSError);
    NSString v7 = sub_1000C7400();
    swift_bridgeObjectRelease();
    id v8 = [v6 initWithDomain:v7 code:1 userInfo:0];

    sub_100067284(3u, v8);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_1000C0840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a4;
  v4[9] = sub_1000C75D0();
  v4[10] = sub_1000C75C0();
  uint64_t v5 = (void *)swift_task_alloc();
  v4[11] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000C08FC;
  return sub_10005DFC0(0, 0, 0);
}

uint64_t sub_1000C08FC()
{
  swift_task_dealloc();
  uint64_t v1 = sub_1000C7590();
  return _swift_task_switch(sub_1000C0A38, v1, v0);
}

uint64_t sub_1000C0A38()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_release();
  long long v2 = *(_OWORD *)(v1 + 144);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 128);
  *(_OWORD *)(v0 + 32) = v2;
  sub_100012854(&qword_10010BF28);
  sub_1000C7280();
  uint64_t v3 = *(void (**)(uint64_t))(v0 + 48);
  if (v3)
  {
    uint64_t v4 = swift_retain();
    v3(v4);
    sub_100013344((uint64_t)v3);
    sub_100013344((uint64_t)v3);
  }
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

void sub_1000C0AFC(void *a1)
{
  if (!a1) {
    return;
  }
  uint64_t v1 = sub_1000C7440();
  uint64_t v3 = v2;
  if (v1 == sub_1000C7440() && v3 == v4)
  {
    id v19 = a1;
    swift_bridgeObjectRelease_n();
    goto LABEL_21;
  }
  char v6 = sub_1000C7A50();
  id v22 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v6)
  {
LABEL_21:
    uint64_t v18 = a1;
    goto LABEL_22;
  }
  uint64_t v7 = sub_1000C7440();
  uint64_t v9 = v8;
  if (v7 == sub_1000C7440() && v9 == v10) {
    goto LABEL_17;
  }
  char v12 = sub_1000C7A50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v12)
  {
LABEL_18:
    uint64_t v18 = v22;
LABEL_22:

    return;
  }
  uint64_t v13 = qword_10010ACE8;
  id v22 = v22;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_1000C7440();
  uint64_t v16 = v15;
  if (v14 == sub_1000C7440() && v16 == v17)
  {

LABEL_17:
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  char v20 = sub_1000C7A50();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v20 & 1) != 0 || !swift_unknownObjectWeakLoadStrong()) {
    goto LABEL_18;
  }
  sub_10000AB98();
  uint64_t v21 = (void *)sub_10000A1F4();
  if (!v21)
  {
    swift_unknownObjectRelease();
    uint64_t v18 = v22;
    goto LABEL_22;
  }
  [v21 _dismissViewControllerWithError:0];
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

id sub_1000C0D78()
{
  return sub_1000BF4D8();
}

id sub_1000C0DDC@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (objc_class *)type metadata accessor for UIActivityTransportView.Coordinator();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  char v6 = &v5[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_BRActivityTypeCopyShareLink];
  *(void *)char v6 = 0xD00000000000002BLL;
  *((void *)v6 + 1) = 0x80000001000DA0D0;
  uint64_t v7 = &v5[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_error];
  *((void *)v7 + 4) = 0;
  *(_OWORD *)uint64_t v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[40] = -1;
  *(void *)&v5[OBJC_IVAR____TtCV37com_apple_CloudSharingUI_CloudSharing23UIActivityTransportView11Coordinator_sharingModel] = v3;
  v9.receiver = v5;
  v9.super_class = v4;
  swift_retain();
  id result = objc_msgSendSuper2(&v9, "init");
  *a1 = result;
  return result;
}

uint64_t sub_1000C0E94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000C5140();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000C0EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000C5140();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1000C0F5C()
{
}

uint64_t sub_1000C0F84(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100012854(&qword_10010B770);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000C7390();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  char v12 = (uint64_t *)((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000132C8(0, (unint64_t *)&qword_10010B500);
  *char v12 = sub_1000C76D0();
  (*(void (**)(uint64_t *, void, uint64_t))(v10 + 104))(v12, enum case for DispatchPredicate.onQueue(_:), v9);
  char v13 = sub_1000C73A0();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v10 + 8))(v12, v9);
  if (v13)
  {
    uint64_t v15 = sub_1000C7600();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 1, 1, v15);
    sub_1000C75D0();
    id v16 = a1;
    swift_retain();
    uint64_t v17 = sub_1000C75C0();
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = v17;
    void v18[3] = &protocol witness table for MainActor;
    v18[4] = v16;
    v18[5] = a2;
    v18[6] = a3;
    sub_1000BD2A0((uint64_t)v8, (uint64_t)&unk_10010EF08, (uint64_t)v18);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000C11B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[9] = a5;
  v6[10] = a6;
  v6[8] = a4;
  sub_100012854((uint64_t *)&unk_10010BDD0);
  v6[11] = swift_task_alloc();
  sub_1000C75D0();
  v6[12] = sub_1000C75C0();
  uint64_t v8 = sub_1000C7590();
  return _swift_task_switch(sub_1000C127C, v8, v7);
}

uint64_t sub_1000C127C()
{
  uint64_t v1 = v0[11];
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1000C67E0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v2 = sub_1000C6530();
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_10001326C(v0[11], (uint64_t *)&unk_10010BDD0);
  }
  else
  {
    uint64_t v4 = v0[10];
    uint64_t v5 = v0[11];
    uint64_t v6 = v0[8];
    uint64_t v7 = v0[9];
    sub_1000C64A0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v9 = *(void *)(v6
                   + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController__transportPrepCompletion);
    uint64_t v8 = *(void *)(v6
                   + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController__transportPrepCompletion
                   + 8);
    uint64_t v10 = *(void *)(v6
                    + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController__transportPrepCompletion
                    + 16);
    uint64_t v11 = *(void *)(v6
                    + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController__transportPrepCompletion
                    + 24);
    v0[2] = v9;
    v0[3] = v8;
    v0[4] = v10;
    v0[5] = v11;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v7;
    *(void *)(v12 + 24) = v4;
    v0[6] = sub_1000391FC;
    v0[7] = v12;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1000236E0(v10);
    sub_100012854(&qword_10010BF28);
    sub_1000C7290();
    swift_release();
    swift_release();
    sub_100013344(v0[4]);
  }
  swift_task_dealloc();
  char v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t type metadata accessor for UIActivityTransportViewController()
{
  return self;
}

uint64_t sub_1000C18B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = sub_1000C75D0();
  v5[8] = sub_1000C75C0();
  uint64_t v7 = sub_1000C7590();
  return _swift_task_switch(sub_1000C1958, v7, v6);
}

uint64_t sub_1000C1958()
{
  uint64_t v1 = *(const void **)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 24);
  swift_release();
  *(void *)(v0 + 72) = _Block_copy(v1);
  if (v2) {
    sub_1000C7440();
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + 80) = v3;
  uint64_t v4 = *(void *)(v0 + 32);
  if (v4) {
    uint64_t v4 = sub_1000C7540();
  }
  *(void *)(v0 + 88) = v4;
  uint64_t v5 = *(void **)(v0 + 48);
  id v6 = *(id *)(v0 + 16);
  id v7 = v5;
  *(void *)(v0 + 96) = sub_1000C75C0();
  uint64_t v9 = sub_1000C7590();
  *(void *)(v0 + 104) = v9;
  *(void *)(v0 + 112) = v8;
  return _swift_task_switch(sub_1000C1A3C, v9, v8);
}

uint64_t sub_1000C1A3C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  if (v1)
  {
    sub_1000B60FC(v1);
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_1000C1B60;
    return sub_10006DE7C();
  }
  else
  {
    uint64_t v4 = *(void **)(v0 + 48);
    swift_release();
    swift_bridgeObjectRelease();

    uint64_t v5 = *(void *)(v0 + 72);
    if (v5)
    {
      id v6 = *(void (***)(void, void))(v0 + 72);
      v6[2](v6, 1);
      _Block_release(v6);
    }
    id v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_1000C1B60()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = *(void *)(v1 + 104);
  return _swift_task_switch(sub_1000C1C80, v3, v2);
}

uint64_t sub_1000C1C80()
{
  uint64_t v1 = *(void **)(v0 + 48);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + 72);

  if (v2)
  {
    uint64_t v3 = *(void (***)(void, void))(v0 + 72);
    v3[2](v3, 1);
    _Block_release(v3);
  }
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1000C1D34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[17] = a5;
  v6[18] = a6;
  v6[16] = a4;
  uint64_t v7 = sub_1000C66D0();
  v6[19] = v7;
  v6[20] = *(void *)(v7 - 8);
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  sub_1000C75D0();
  v6[23] = sub_1000C75C0();
  uint64_t v9 = sub_1000C7590();
  v6[24] = v9;
  v6[25] = v8;
  return _swift_task_switch(sub_1000C1E3C, v9, v8);
}

uint64_t sub_1000C1E3C()
{
  v0[26] = *(void *)(v0[16]
                     + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing33UIActivityTransportViewController_sharingModel);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[27] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000C1EDC;
  return sub_100051988();
}

uint64_t sub_1000C1EDC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 224) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 200);
  uint64_t v4 = *(void *)(v2 + 192);
  if (v0) {
    uint64_t v5 = sub_1000C208C;
  }
  else {
    uint64_t v5 = sub_1000C2018;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_1000C2018()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_1000C208C()
{
  uint64_t v47 = v0;
  uint64_t v1 = *(void *)(v0 + 224);
  swift_release();
  *(void *)(v0 + 96) = v1;
  swift_errorRetain();
  sub_100012854((uint64_t *)&unk_10010B010);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    uint64_t v2 = *(void **)(v0 + 32);
    uint64_t v44 = *(void *)(v0 + 16);
    uint64_t v45 = *(void *)(v0 + 24);
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v3 = *(void *)(v0 + 48);
    int v5 = *(unsigned __int8 *)(v0 + 56);
    sub_1000C7440();
    id v6 = objc_allocWithZone((Class)NSError);
    NSString v7 = sub_1000C7400();
    swift_bridgeObjectRelease();
    id v8 = [v6 initWithDomain:v7 code:1 userInfo:0];

    unsigned __int8 v9 = v5;
    *(void *)(v0 + 88) = v8;
    long long v43 = v2;
    if (v5 == 8)
    {

      if (!v2)
      {
        __break(1u);
        return;
      }
      *(void *)(v0 + 88) = v2;
      swift_bridgeObjectRetain();
      id v10 = v2;
      swift_bridgeObjectRetain();
      sub_1000C66B0();
      swift_bridgeObjectRetain_n();
      id v11 = v10;
      uint64_t v12 = sub_1000C66C0();
      os_log_type_t v13 = sub_1000C7670();
      BOOL v14 = os_log_type_enabled(v12, v13);
      uint64_t v41 = *(void *)(v0 + 176);
      uint64_t v15 = *(void *)(v0 + 160);
      uint64_t v38 = *(void *)(v0 + 152);
      unint64_t v16 = *(void *)(v0 + 144);
      if (v14)
      {
        uint64_t v40 = v3;
        uint64_t v17 = *(void *)(v0 + 136);
        uint64_t v18 = swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        *(_DWORD *)uint64_t v18 = 136315394;
        log = v12;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 112) = sub_1000720D0(v17, v16, &v46);
        sub_1000C7850();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v18 + 12) = 2080;
        id v19 = v11;
        id v20 = [v19 description];
        uint64_t v21 = sub_1000C7440();
        uint64_t v22 = v4;
        unint64_t v24 = v23;

        *(void *)(v0 + 120) = sub_1000720D0(v21, v24, &v46);
        sub_1000C7850();
        uint64_t v4 = v22;
        uint64_t v3 = v40;
        swift_bridgeObjectRelease();

        uint64_t v12 = log;
        _os_log_impl((void *)&_mh_execute_header, log, v13, "mailComposeController %s delegate stopSharingError: %s", (uint8_t *)v18, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        unsigned __int8 v9 = 8;
        swift_slowDealloc();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v41, v38);
    }
    else
    {
      uint64_t v42 = v4;
      sub_1000C66B0();
      swift_bridgeObjectRetain_n();
      id v26 = sub_1000C66C0();
      os_log_type_t v27 = sub_1000C7670();
      BOOL v28 = os_log_type_enabled(v26, v27);
      uint64_t v30 = *(void *)(v0 + 160);
      uint64_t v29 = *(void *)(v0 + 168);
      unint64_t v32 = *(void *)(v0 + 144);
      uint64_t v31 = *(void *)(v0 + 152);
      if (v28)
      {
        os_log_t loga = *(os_log_t *)(v0 + 136);
        unsigned __int8 v39 = v9;
        long long v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        *(_DWORD *)long long v33 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 104) = sub_1000720D0((uint64_t)loga, v32, &v46);
        sub_1000C7850();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "mailComposeController %s delegate unexpected internal error, returning CKError.internalError as best approximation", v33, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        unsigned __int8 v9 = v39;
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
      }
      uint64_t v4 = v42;
    }
    swift_beginAccess();
    long long v34 = *(void **)(v0 + 88);
    id v35 = v34;
    sub_100067284(3u, v34);

    sub_10002376C(v44, v45, v43, v4, v3, v9);
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v25 = *(void (**)(void))(v0 + 8);
  }
  else
  {
    swift_errorRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v25 = *(void (**)(void))(v0 + 8);
  }
  v25();
}

void sub_1000C2658(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7 = sub_100012854(&qword_10010B770);
  __chkstk_darwin(v7 - 8);
  unsigned __int8 v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [v3 activity];
  if (v10)
  {
    v19[0] = v10;
    self;
    id v11 = (void *)swift_dynamicCastObjCClass();
    if (v11)
    {
      uint64_t v12 = v11;
      if ([v11 respondsToSelector:"mailComposeController:didFinishWithResult:error:"])
      {
        v19[1] = a2;
        type metadata accessor for MFMailComposeResult(0);
        [v12 performSelector:"mailComposeController:didFinishWithResult:error:" withObject:a1 withObject:sub_1000C7A70()];
        swift_unknownObjectRelease();
      }
      if (a2 != (void *)2 || a3)
      {
        uint64_t v15 = sub_1000C7600();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
        sub_1000C75D0();
        id v16 = v3;
        uint64_t v17 = sub_1000C75C0();
        uint64_t v18 = swift_allocObject();
        *(void *)(v18 + 16) = v17;
        *(void *)(v18 + 24) = &protocol witness table for MainActor;
        *(void *)(v18 + 32) = v16;
        strcpy((char *)(v18 + 40), "didFinishWith");
        *(_WORD *)(v18 + 54) = -4864;
        sub_1000BD118((uint64_t)v9, (uint64_t)&unk_10010EED0, v18);

        swift_release();
      }
      else if (swift_unknownObjectWeakLoadStrong())
      {
        sub_10000AB98();
        os_log_type_t v13 = (void *)sub_10000A1F4();
        if (v13)
        {
          [v13 _dismissViewControllerWithError:0];

          swift_unknownObjectRelease();
        }
        else
        {
        }
        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
    else
    {
      id v14 = v19[0];
    }
  }
}

uint64_t sub_1000C2B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = sub_1000C75D0();
  v5[8] = sub_1000C75C0();
  uint64_t v7 = sub_1000C7590();
  return _swift_task_switch(sub_1000C2BD0, v7, v6);
}

uint64_t sub_1000C2BD0()
{
  uint64_t v1 = *(const void **)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 24);
  swift_release();
  *(void *)(v0 + 72) = _Block_copy(v1);
  if (v2) {
    sub_1000C7440();
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + 80) = v3;
  uint64_t v4 = *(void *)(v0 + 32);
  if (v4) {
    uint64_t v4 = sub_1000C7540();
  }
  *(void *)(v0 + 88) = v4;
  int v5 = *(void **)(v0 + 48);
  id v6 = *(id *)(v0 + 16);
  id v7 = v5;
  *(void *)(v0 + 96) = sub_1000C75C0();
  uint64_t v9 = sub_1000C7590();
  *(void *)(v0 + 104) = v9;
  *(void *)(v0 + 112) = v8;
  return _swift_task_switch(sub_1000C2CB4, v9, v8);
}

uint64_t sub_1000C2CB4()
{
  uint64_t v1 = *(void *)(v0 + 88);
  if (v1)
  {
    sub_1000B60FC(v1);
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_1000C2DD8;
    return sub_10006DE7C();
  }
  else
  {
    uint64_t v4 = *(void **)(v0 + 48);
    swift_release();
    swift_bridgeObjectRelease();

    uint64_t v5 = *(void *)(v0 + 72);
    if (v5)
    {
      id v6 = *(void (***)(void, void))(v0 + 72);
      v6[2](v6, 1);
      _Block_release(v6);
    }
    id v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_1000C2DD8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = *(void *)(v1 + 104);
  return _swift_task_switch(sub_1000C5194, v3, v2);
}

void sub_1000C2EF8(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_100012854(&qword_10010B770);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [v2 activity];
  if (v8)
  {
    v17[0] = v8;
    self;
    uint64_t v9 = (void *)swift_dynamicCastObjCClass();
    if (v9)
    {
      id v10 = v9;
      if ([v9 respondsToSelector:"messageComposeViewController:didFinishWithResult:"])
      {
        v17[1] = a2;
        type metadata accessor for MessageComposeResult(0);
        [v10 performSelector:"messageComposeViewController:didFinishWithResult:" withObject:a1 withObject:sub_1000C7A70()];
        swift_unknownObjectRelease();
      }
      if (a2 == (void *)1)
      {
        if (swift_unknownObjectWeakLoadStrong())
        {
          sub_10000AB98();
          uint64_t v11 = (void *)sub_10000A1F4();
          if (v11)
          {
            [v11 _dismissViewControllerWithError:0];

            swift_unknownObjectRelease();
          }
          else
          {
          }
          swift_unknownObjectRelease();
        }
        else
        {
        }
      }
      else
      {
        uint64_t v13 = sub_1000C7600();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
        sub_1000C75D0();
        id v14 = v2;
        uint64_t v15 = sub_1000C75C0();
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 16) = v15;
        *(void *)(v16 + 24) = &protocol witness table for MainActor;
        *(void *)(v16 + 32) = v14;
        strcpy((char *)(v16 + 40), "didFinishWith");
        *(_WORD *)(v16 + 54) = -4864;
        sub_1000BD118((uint64_t)v7, (uint64_t)&unk_10010EE80, v16);

        swift_release();
      }
    }
    else
    {
      id v12 = v17[0];
    }
  }
}

uint64_t sub_1000C321C(void *a1, uint64_t a2)
{
  swift_beginAccess();
  id v4 = a1;
  sub_1000C7520();
  if (*(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_1000C7560();
  sub_1000C7580();
  sub_1000C7550();
  swift_endAccess();
  id v5 = [v4 subviews];
  sub_1000132C8(0, &qword_10010EF88);
  unint64_t v6 = sub_1000C7540();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000C7990();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (v7 >= 1)
  {
    id v9 = [v4 subviews];
    unint64_t v10 = sub_1000C7540();

    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_1000C7990();
      uint64_t v11 = result;
      if (result) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v11)
      {
LABEL_8:
        if (v11 < 1)
        {
          __break(1u);
          return result;
        }
        for (uint64_t i = 0; i != v11; ++i)
        {
          if ((v10 & 0xC000000000000001) != 0) {
            id v13 = (id)sub_1000C78F0();
          }
          else {
            id v13 = *(id *)(v10 + 8 * i + 32);
          }
          id v14 = v13;
          sub_1000C321C(v13, a2);
        }
      }
    }
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

uint64_t sub_1000C3420()
{
  return sub_1000C3F88((void (*)(void))&_swift_bridgeObjectRelease);
}

uint64_t sub_1000C3438(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  id v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *id v9 = v2;
  v9[1] = sub_10001AE78;
  return sub_1000C1D34(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1000C3500(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000C35DC;
  return v6(a1);
}

uint64_t sub_1000C35DC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000C36D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10001AE78;
  return v6();
}

uint64_t sub_1000C37A0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10001AE78;
  return v7();
}

uint64_t sub_1000C386C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000C7600();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000C75F0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10001326C(a1, &qword_10010B770);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000C7590();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000C3A18(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000C51BC;
  return v6(a1);
}

uint64_t sub_1000C3AF8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_10001AE78;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10010EE90 + dword_10010EE90);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_1000C3BC8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000C3C00(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10001AE78;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10010EEC0 + dword_10010EEC0);
  return v6(a1, v4);
}

uint64_t sub_1000C3CB8()
{
  return sub_1000C3F88((void (*)(void))&_swift_bridgeObjectRelease);
}

uint64_t sub_1000C3CD0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  id v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *id v9 = v2;
  v9[1] = sub_100013B98;
  return sub_1000C1D34(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1000C3D9C()
{
  _Block_release(*(const void **)(v0 + 40));

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000C3DF4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_10001AE78;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10010EED8 + dword_10010EED8);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_1000C3EC4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000C3EFC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000C3F0C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000C3F4C()
{
  return sub_1000C0F84(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1000C3F58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000C3F68()
{
  return swift_release();
}

uint64_t sub_1000C3F70()
{
  return sub_1000C3F88((void (*)(void))&_swift_release);
}

uint64_t sub_1000C3F88(void (*a1)(void))
{
  swift_unknownObjectRelease();

  a1(*(void *)(v1 + 48));

  return _swift_deallocObject(v1, 56, 7);
}

uint64_t sub_1000C3FE0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  id v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *id v9 = v2;
  v9[1] = sub_10001AE78;
  return sub_1000C11B0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1000C40A8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10001AE78;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10010EF10 + dword_10010EF10);
  return v6(a1, v4);
}

uint64_t sub_1000C4168()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_1000C41B0()
{
  sub_1000BE19C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1000C41C0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10001AE78;
  return sub_1000BE6E4(a1, v4, v5, v7, v6);
}

uint64_t sub_1000C4284()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000C42CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100013B98;
  return sub_1000BEC70(a1, v4, v5, v7, v6);
}

uint64_t sub_1000C438C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 != 0xFF) {
    return sub_10002376C(a1, a2, a3, a4, a5, a6);
  }
  return a1;
}

void sub_1000C43A0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 != 0xFF) {
    sub_1000236F4(a1, a2, a3, a4, a5, a6);
  }
}

void *sub_1000C43B4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

id sub_1000C43F8(void *a1)
{
  if (!a1) {
    return [objc_allocWithZone((Class)NSOperation) init];
  }
  id v1 = a1;
  id v2 = [v1 activity];
  if (v2)
  {

    v6[4] = nullsub_2;
    v6[5] = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_1000BCEA4;
    v6[3] = &unk_1001037A0;
    uint64_t v3 = _Block_copy(v6);
    id v4 = [self blockOperationWithBlock:v3];
    _Block_release(v3);

    swift_release();
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)NSOperation) init];
  }
  return v4;
}

unsigned char *storeEnumTagSinglePayload for TransportPresentationState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000C4604);
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

ValueMetadata *type metadata accessor for TransportPresentationState()
{
  return &type metadata for TransportPresentationState;
}

unint64_t sub_1000C4640()
{
  unint64_t result = qword_10010EF48;
  if (!qword_10010EF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EF48);
  }
  return result;
}

uint64_t sub_1000C4694(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000FF798;
  v6._object = a2;
  unint64_t v4 = sub_1000C79F0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t destroy for UIActivityTransportView(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (*(void *)(a1 + 144)) {
    swift_release();
  }

  return sub_10004809C();
}

uint64_t initializeWithCopy for UIActivityTransportView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  id v9 = (_OWORD *)(a2 + 144);
  uint64_t v8 = *(void *)(a2 + 144);
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  uint64_t v17 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v17;
  uint64_t v11 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v11;
  uint64_t v18 = *(void *)(a2 + 136);
  uint64_t v19 = v8;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v18;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  if (v19)
  {
    uint64_t v12 = *(void *)(a2 + 152);
    *(void *)(a1 + 144) = v19;
    *(void *)(a1 + 152) = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 144) = *v9;
  }
  uint64_t v13 = *(void *)(a2 + 160);
  uint64_t v14 = *(void *)(a2 + 168);
  char v15 = *(unsigned char *)(a2 + 176);
  sub_100047E74();
  *(void *)(a1 + 160) = v13;
  *(void *)(a1 + 168) = v14;
  *(unsigned char *)(a1 + 176) = v15;
  return a1;
}

uint64_t assignWithCopy for UIActivityTransportView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_retain();
  swift_release();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 144);
  if (!*(void *)(a1 + 144))
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = v4;
      *(void *)(a1 + 152) = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = v4;
  *(void *)(a1 + 152) = v5;
  swift_retain();
  swift_release();
LABEL_8:
  uint64_t v7 = *(void *)(a2 + 160);
  uint64_t v8 = *(void *)(a2 + 168);
  char v9 = *(unsigned char *)(a2 + 176);
  sub_100047E74();
  *(void *)(a1 + 160) = v7;
  *(void *)(a1 + 168) = v8;
  *(unsigned char *)(a1 + 176) = v9;
  sub_10004809C();
  return a1;
}

__n128 initializeWithTake for UIActivityTransportView(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[10];
  *(unsigned char *)(a1 + 176) = *((unsigned char *)a2 + 176);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for UIActivityTransportView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  swift_release();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_release();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_release();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 144);
  if (!*(void *)(a1 + 144))
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a2 + 152);
      *(void *)(a1 + 144) = v4;
      *(void *)(a1 + 152) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = v4;
  *(void *)(a1 + 152) = v5;
  swift_release();
LABEL_8:
  char v7 = *(unsigned char *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(unsigned char *)(a1 + 176) = v7;
  sub_10004809C();
  return a1;
}

uint64_t getEnumTagSinglePayload for UIActivityTransportView(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 177)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UIActivityTransportView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 176) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 177) = 1;
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
    *(unsigned char *)(result + 177) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UIActivityTransportView()
{
  return &type metadata for UIActivityTransportView;
}

unint64_t sub_1000C4D9C()
{
  unint64_t result = qword_10010EF50;
  if (!qword_10010EF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EF50);
  }
  return result;
}

void sub_1000C4DF4(void *a1)
{
  sub_1000BFD00(a1, v1 + 16);
}

uint64_t sub_1000C4E00()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (*(void *)(v0 + 160)) {
    swift_release();
  }
  sub_10004809C();

  return _swift_deallocObject(v0, 193, 7);
}

void sub_1000C4EBC(void *a1)
{
}

uint64_t sub_1000C4EC4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000C4F08(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_10001AE78;
  return sub_1000C0840(a1, v4, v5, v1 + 32);
}

uint64_t sub_1000C4FC0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (*(void *)(v0 + 176)) {
    swift_release();
  }
  sub_10004809C();

  return _swift_deallocObject(v0, 209, 7);
}

uint64_t sub_1000C5084(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_10001AE78;
  return sub_1000C0264(a1, v4, v5, v1 + 32);
}

unint64_t sub_1000C5140()
{
  unint64_t result = qword_10010EFC0;
  if (!qword_10010EFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010EFC0);
  }
  return result;
}

NSString sub_1000C51C0()
{
  NSString result = sub_1000C7400();
  qword_1001153B8 = (uint64_t)result;
  return result;
}

uint64_t sub_1000C5468(uint64_t a1)
{
  uint64_t v3 = sub_100012854((uint64_t *)&unk_10010BDD0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    uint64_t v7 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_100075E70(v7, (uint64_t)&v15);
      sub_100075E70((uint64_t)&v15, (uint64_t)v17);
      sub_1000C5C60();
      if (swift_dynamicCast()) {
        break;
      }
      sub_100075E20((uint64_t)&v15);
      v7 += 32;
      if (!--v6)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    uint64_t v8 = (void *)v14[1];
    swift_bridgeObjectRelease();

    sub_1000C5D08(&v15, v17);
  }
  else
  {
LABEL_6:
    memset(v17, 0, sizeof(v17));
  }
  sub_10001A740((uint64_t)v17, (uint64_t)&v15, (uint64_t *)&unk_10010D400);
  if (v16)
  {
    uint64_t v9 = sub_1000C6530();
    int v10 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, v10 ^ 1u, 1, v9);
  }
  else
  {
    sub_10001326C((uint64_t)&v15, (uint64_t *)&unk_10010D400);
    uint64_t v11 = sub_1000C6530();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v5, 1, 1, v11);
  }
  uint64_t v12 = v1 + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing21ShareCopyLinkActivity_urlToCopy;
  swift_beginAccess();
  sub_1000C5CA0((uint64_t)v5, v12);
  swift_endAccess();
  return sub_10001326C((uint64_t)v17, (uint64_t *)&unk_10010D400);
}

id sub_1000C5704()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000C6690();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100012854((uint64_t *)&unk_10010BDD0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000C6530();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t)v1 + OBJC_IVAR____TtC37com_apple_CloudSharingUI_CloudSharing21ShareCopyLinkActivity_urlToCopy;
  swift_beginAccess();
  sub_10001A740(v13, (uint64_t)v8, (uint64_t *)&unk_10010BDD0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10001326C((uint64_t)v8, (uint64_t *)&unk_10010BDD0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    id v14 = [self generalPasteboard];
    sub_1000C64C0(v15);
    uint64_t v17 = v16;
    sub_1000C6610();
    sub_1000C65C0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    NSString v18 = sub_1000C7400();
    swift_bridgeObjectRelease();
    [v14 setValue:v17 forPasteboardType:v18];

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return [v1 activityDidFinish:1];
}

id sub_1000C5AC0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ShareCopyLinkActivity();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000C5B24()
{
  return type metadata accessor for ShareCopyLinkActivity();
}

uint64_t type metadata accessor for ShareCopyLinkActivity()
{
  uint64_t result = qword_10010F000;
  if (!qword_10010F000) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000C5B78()
{
  sub_1000C5C08();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1000C5C08()
{
  if (!qword_10010F010)
  {
    sub_1000C6530();
    unint64_t v0 = sub_1000C7840();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10010F010);
    }
  }
}

unint64_t sub_1000C5C60()
{
  unint64_t result = qword_10010F018;
  if (!qword_10010F018)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10010F018);
  }
  return result;
}

uint64_t sub_1000C5CA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100012854((uint64_t *)&unk_10010BDD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1000C5D08(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000C5D18(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_100075E70(v2, (uint64_t)v6);
    sub_100075E70((uint64_t)v6, (uint64_t)v5);
    sub_1000C5C60();
    if (swift_dynamicCast()) {
      break;
    }
    sub_100075E20((uint64_t)v6);
    v2 += 32;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }

  sub_100075E20((uint64_t)v6);
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_1000C5DE0()
{
  return sub_1000C6030(0);
}

unint64_t sub_1000C5E00()
{
  unint64_t result = qword_10010F020;
  if (!qword_10010F020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010F020);
  }
  return result;
}

uint64_t sub_1000C5E54(uint64_t a1)
{
  uint64_t v2 = sub_100012854((uint64_t *)&unk_10010D400);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for Features(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x1000C5F80);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Features()
{
  return &type metadata for Features;
}

unint64_t sub_1000C5FBC()
{
  unint64_t result = qword_10010F028;
  if (!qword_10010F028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10010F028);
  }
  return result;
}

uint64_t sub_1000C6010()
{
  return sub_1000C6030(1);
}

uint64_t sub_1000C6030(char a1)
{
  *((void *)&v10 + 1) = &type metadata for Features;
  unint64_t v11 = sub_1000C5E00();
  LOBYTE(v9) = a1;
  char v2 = sub_1000C6590();
  sub_100075E20((uint64_t)&v9);
  if ((v2 & 1) == 0) {
    return 0;
  }
  id v3 = objc_msgSend(self, "standardUserDefaults", (void)v9);
  NSString v4 = sub_1000C7400();
  id v5 = [v3 objectForKey:v4];

  if (v5)
  {
    sub_1000C7880();
    swift_unknownObjectRelease();
    sub_1000C5E54((uint64_t)&v9);
    NSString v6 = sub_1000C7400();
    id v7 = [v3 BOOLForKey:v6];
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;

    sub_1000C5E54((uint64_t)&v9);
    return 1;
  }
  return (uint64_t)v7;
}

const char *sub_1000C6170()
{
  return "CloudSharingUI";
}

const char *sub_1000C6184()
{
  if (*v0) {
    return "ShareAccessRequests";
  }
  else {
    return "Gelato";
  }
}

uint64_t sub_1000C61B4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_1000C61E8()
{
  sub_10000872C();
  sub_100008710((void *)&_mh_execute_header, v0, v1, "[ERROR] Selected property %@ is neither mail nor phone number? Trying as email anyway.", v2, v3, v4, v5, v6);
}

void sub_1000C6250()
{
  sub_10000872C();
  sub_100008710((void *)&_mh_execute_header, v0, v1, "[ERROR] Couldn't create recipient for phone number contact %@", v2, v3, v4, v5, v6);
}

void sub_1000C62B8()
{
  sub_10000872C();
  sub_100008710((void *)&_mh_execute_header, v0, v1, "[ERROR] compose recipient %@ doesn't have a display name?", v2, v3, v4, v5, v6);
}

uint64_t sub_1000C6320(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_1000C6330()
{
  return URLResourceValues.localizedName.getter();
}

uint64_t sub_1000C6340()
{
  return URLResourceValues.typeIdentifier.getter();
}

uint64_t sub_1000C6350()
{
  return URLResourceValues.ubiquitousItemIsShared.getter();
}

uint64_t sub_1000C6360()
{
  return URLResourceValues.ubiquitousSharedItemCurrentUserRole.getter();
}

uint64_t sub_1000C6370()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t sub_1000C6380()
{
  return PersonNameComponents.givenName.getter();
}

uint64_t sub_1000C6390()
{
  return PersonNameComponents.familyName.getter();
}

uint64_t sub_1000C63A0()
{
  return PersonNameComponents.middleName.getter();
}

uint64_t sub_1000C63B0()
{
  return PersonNameComponents.namePrefix.getter();
}

uint64_t sub_1000C63C0()
{
  return PersonNameComponents.nameSuffix.getter();
}

Class sub_1000C63D0()
{
  return PersonNameComponents._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_1000C63E0()
{
  return static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000C63F0()
{
  return PersonNameComponents.nickname.getter();
}

uint64_t sub_1000C6400()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t sub_1000C6450()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t sub_1000C6470()
{
  return _BridgedStoredNSError.errorCode.getter();
}

uint64_t sub_1000C6480()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000C6490()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1000C64A0()
{
  return URL.absoluteString.getter();
}

uint64_t sub_1000C64B0()
{
  return URL.lastPathComponent.getter();
}

void sub_1000C64C0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000C64D0()
{
  return URL.promisedItemResourceValues(forKeys:)();
}

void sub_1000C64E0()
{
}

uint64_t sub_1000C64F0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

BOOL sub_1000C6500()
{
  return URL.startAccessingSecurityScopedResource()();
}

uint64_t sub_1000C6510()
{
  return URL.scheme.getter();
}

uint64_t sub_1000C6520()
{
  return URL.init(string:)();
}

uint64_t sub_1000C6530()
{
  return type metadata accessor for URL();
}

NSData sub_1000C6540()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000C6550()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000C6560()
{
  return UUID.init()();
}

uint64_t sub_1000C6570()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1000C6580()
{
  return NSLog(_:_:)();
}

uint64_t sub_1000C6590()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_1000C65A0()
{
  return static UTTagClass.filenameExtension.getter();
}

uint64_t sub_1000C65B0()
{
  return type metadata accessor for UTTagClass();
}

uint64_t sub_1000C65C0()
{
  return UTType.identifier.getter();
}

uint64_t sub_1000C65D0()
{
  return static UTType.spreadsheet.getter();
}

uint64_t sub_1000C65E0()
{
  return static UTType.presentation.getter();
}

uint64_t sub_1000C65F0()
{
  return static UTType.pdf.getter();
}

uint64_t sub_1000C6600()
{
  return UTType.init(tag:tagClass:conformingTo:)();
}

uint64_t sub_1000C6610()
{
  return static UTType.url.getter();
}

uint64_t sub_1000C6620()
{
  return static UTType.item.getter();
}

uint64_t sub_1000C6630()
{
  return static UTType.image.getter();
}

uint64_t sub_1000C6640()
{
  return static UTType.movie.getter();
}

uint64_t sub_1000C6650()
{
  return static UTType.folder.getter();
}

uint64_t sub_1000C6660()
{
  return static UTType.content.getter();
}

uint64_t sub_1000C6670()
{
  return UTType.conforms(to:)();
}

uint64_t sub_1000C6680()
{
  return UTType.isSubtype(of:)();
}

uint64_t sub_1000C6690()
{
  return type metadata accessor for UTType();
}

uint64_t sub_1000C66A0()
{
  return UTType.init(_:)();
}

uint64_t sub_1000C66B0()
{
  return static Logger.general.getter();
}

uint64_t sub_1000C66C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000C66D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000C66E0()
{
  return Publishers.CombineLatest.init(_:_:)();
}

uint64_t sub_1000C66F0()
{
  return type metadata accessor for Publishers.CombineLatest3();
}

uint64_t sub_1000C6700()
{
  return Publishers.CombineLatest3.init(_:_:_:)();
}

uint64_t sub_1000C6710()
{
  return type metadata accessor for Publishers.CombineLatest4();
}

uint64_t sub_1000C6720()
{
  return Publishers.CombineLatest4.init(_:_:_:_:)();
}

uint64_t sub_1000C6730()
{
  return Publishers.Map.receive<A>(subscriber:)();
}

uint64_t sub_1000C6740()
{
  return type metadata accessor for Publishers.Map();
}

uint64_t sub_1000C6750()
{
  return static Subscribers.Demand.unlimited.getter();
}

uint64_t sub_1000C6760()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_1000C6770()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_1000C6780()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t sub_1000C6790()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_1000C67A0()
{
  return Future.init(_:)();
}

uint64_t sub_1000C67B0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_1000C67C0()
{
  return Published.projectedValue.getter();
}

uint64_t sub_1000C67D0()
{
  return Published.projectedValue.setter();
}

uint64_t sub_1000C67E0()
{
  return static Published.subscript.getter();
}

uint64_t sub_1000C67F0()
{
  return static Published.subscript.setter();
}

uint64_t sub_1000C6800()
{
  return type metadata accessor for Published();
}

uint64_t sub_1000C6810()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t sub_1000C6820()
{
  return Publisher.compactMap<A>(_:)();
}

uint64_t sub_1000C6830()
{
  return Publisher.map<A>(_:)();
}

uint64_t sub_1000C6840()
{
  return Publisher.flatMap<A, B>(maxPublishers:_:)();
}

uint64_t sub_1000C6850()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_1000C6860()
{
  return Publisher<>.removeDuplicates()();
}

uint64_t sub_1000C6870()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_1000C6880()
{
  return Publisher<>.assign(to:)();
}

uint64_t sub_1000C6890()
{
  return NWPathMonitor.pathUpdateHandler.setter();
}

uint64_t sub_1000C68A0()
{
  return NWPathMonitor.start(queue:)();
}

uint64_t sub_1000C68B0()
{
  return NWPathMonitor.init()();
}

uint64_t sub_1000C68C0()
{
  return type metadata accessor for NWPathMonitor();
}

uint64_t sub_1000C68D0()
{
  return static NWPath.Status.== infix(_:_:)();
}

uint64_t sub_1000C68E0()
{
  return type metadata accessor for NWPath.Status();
}

uint64_t sub_1000C68F0()
{
  return NWPath.status.getter();
}

uint64_t sub_1000C6900()
{
  return type metadata accessor for NWPath();
}

uint64_t sub_1000C6910()
{
  return static ButtonRole.destructive.getter();
}

uint64_t sub_1000C6920()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_1000C6930()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_1000C6940()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1000C6950()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_1000C6960()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_1000C6970()
{
  return StateObject.projectedValue.getter();
}

uint64_t sub_1000C6980()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t sub_1000C6990()
{
  return ProgressView<>.init(label:)();
}

uint64_t sub_1000C69A0()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_1000C69B0()
{
  return static VerticalEdge.Set.all.getter();
}

uint64_t sub_1000C69C0()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_1000C69D0()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_1000C69E0()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_1000C69F0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_1000C6A00()
{
  return type metadata accessor for DismissAction();
}

uint64_t sub_1000C6A10()
{
  return GeometryProxy.frame(in:)();
}

uint64_t sub_1000C6A20()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t sub_1000C6A30()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t sub_1000C6A40()
{
  return NavigationLink.init(destination:label:)();
}

uint64_t sub_1000C6A50()
{
  return NavigationView.init(content:)();
}

uint64_t sub_1000C6A60()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_1000C6A70()
{
  return ObservedObject.projectedValue.getter();
}

uint64_t sub_1000C6A80()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_1000C6A90()
{
  return ViewDimensions.subscript.getter();
}

uint64_t sub_1000C6AA0()
{
  return type metadata accessor for CoordinateSpace();
}

uint64_t sub_1000C6AB0()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_1000C6AC0()
{
  return NavigationStack.init<>(root:)();
}

uint64_t sub_1000C6AD0()
{
  return GroupedListStyle.init()();
}

uint64_t sub_1000C6AE0()
{
  return type metadata accessor for GroupedListStyle();
}

void sub_1000C6AF0()
{
}

uint64_t sub_1000C6B00()
{
  return type metadata accessor for PresentationMode();
}

uint64_t sub_1000C6B10()
{
  return static CustomHoverEffect<>.automatic.getter();
}

uint64_t sub_1000C6B20()
{
  return EnvironmentObject.error()();
}

uint64_t sub_1000C6B30()
{
  return EnvironmentObject.init()();
}

uint64_t sub_1000C6B40()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_1000C6B50()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_1000C6B60()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_1000C6B70()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_1000C6B80()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_1000C6B90()
{
  return EnvironmentValues.truncationMode.setter();
}

uint64_t sub_1000C6BA0()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_1000C6BB0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000C6BC0()
{
  return EnvironmentValues.allowsTightening.getter();
}

uint64_t sub_1000C6BD0()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t sub_1000C6BE0()
{
  return EnvironmentValues.presentationMode.getter();
}

uint64_t sub_1000C6BF0()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_1000C6C00()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_1000C6C10()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t sub_1000C6C20()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_1000C6C30()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000C6C40()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_1000C6C50()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000C6C60()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t sub_1000C6C70()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t sub_1000C6C80()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_1000C6C90()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_1000C6CA0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1000C6CB0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000C6CC0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000C6CD0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1000C6CE0()
{
  return type metadata accessor for NavigationBarItem.TitleDisplayMode();
}

uint64_t sub_1000C6CF0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_1000C6D00()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_1000C6D10()
{
  return static HorizontalAlignment.listRowSeparatorLeading.getter();
}

uint64_t sub_1000C6D20()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_1000C6D30()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_1000C6D40()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_1000C6D50()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000C6D60()
{
  return type metadata accessor for AutomaticHoverEffect();
}

uint64_t sub_1000C6D70()
{
  return static ToolbarItemPlacement.navigationBarTrailing.getter();
}

uint64_t sub_1000C6D80()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_1000C6D90()
{
  return InsetGroupedListStyle.init()();
}

uint64_t sub_1000C6DA0()
{
  return type metadata accessor for InsetGroupedListStyle();
}

uint64_t sub_1000C6DB0()
{
  return static ToolbarContentBuilder.buildBlock<A>(_:)();
}

uint64_t sub_1000C6DC0()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t sub_1000C6DD0()
{
  return StackNavigationViewStyle.init()();
}

uint64_t sub_1000C6DE0()
{
  return type metadata accessor for StackNavigationViewStyle();
}

uint64_t sub_1000C6DF0()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_1000C6E00()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_1000C6E10()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_1000C6E30()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_1000C6E40()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_1000C6E50()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_1000C6E70()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t sub_1000C6E80()
{
  return UIViewControllerRepresentableContext.coordinator.getter();
}

uint64_t sub_1000C6E90()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_1000C6EA0()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_1000C6EB0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000C6EC0()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_1000C6ED0()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_1000C6EE0()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_1000C6EF0()
{
  return static Font.largeTitle.getter();
}

uint64_t sub_1000C6F00()
{
  return static Font.subheadline.getter();
}

uint64_t sub_1000C6F10()
{
  return static Font.body.getter();
}

uint64_t sub_1000C6F20()
{
  return static Font.title.getter();
}

uint64_t sub_1000C6F30()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_1000C6F40()
{
  return static Font.Weight.semibold.getter();
}

uint64_t sub_1000C6F50()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_1000C6F60()
{
  return static Font.title3.getter();
}

uint64_t sub_1000C6F70()
{
  return Font.weight(_:)();
}

uint64_t sub_1000C6F80()
{
  return static Font.caption.getter();
}

uint64_t sub_1000C6F90()
{
  return List<>.init(content:)();
}

uint64_t sub_1000C6FA0()
{
  return type metadata accessor for Text.TruncationMode();
}

uint64_t sub_1000C6FB0()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_1000C6FC0()
{
  return type metadata accessor for Text.Case();
}

uint64_t sub_1000C6FD0()
{
  return Text.bold()();
}

uint64_t sub_1000C6FE0()
{
  return Text.font(_:)();
}

uint64_t sub_1000C6FF0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_1000C7000()
{
  return Text.init<A>(_:)();
}

uint64_t sub_1000C7010()
{
  return View.navigationViewStyle<A>(_:)();
}

uint64_t sub_1000C7020()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000C7030()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000C7040()
{
  return View.dialogIcon(_:)();
}

uint64_t sub_1000C7050()
{
  return View.hoverEffect<A>(_:isEnabled:)();
}

uint64_t sub_1000C7060()
{
  return View.listPadding(_:_:)();
}

uint64_t sub_1000C7070()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000C7080()
{
  return View.navigationBarTitle(_:displayMode:)();
}

uint64_t sub_1000C7090()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_1000C70A0()
{
  return View.listSectionSeparatorTint(_:edges:)();
}

uint64_t sub_1000C70B0()
{
  return View.alert<A, B>(_:isPresented:actions:message:)();
}

uint64_t sub_1000C70C0()
{
  return View.alert<A, B, C>(_:isPresented:actions:message:)();
}

uint64_t sub_1000C70D0()
{
  return View.sheet<A>(isPresented:onDismiss:content:)();
}

uint64_t sub_1000C70E0()
{
  return View.sheet<A, B>(item:onDismiss:content:)();
}

uint64_t sub_1000C70F0()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_1000C7100()
{
  return View.disabled(_:)();
}

uint64_t sub_1000C7110()
{
  return View.listStyle<A>(_:)();
}

uint64_t sub_1000C7120()
{
  return static Color.accentColor.getter();
}

uint64_t sub_1000C7130()
{
  return static Color.red.getter();
}

uint64_t sub_1000C7140()
{
  return static Color.black.getter();
}

uint64_t sub_1000C7150()
{
  return static Color.clear.getter();
}

uint64_t sub_1000C7160()
{
  return Color.opacity(_:)();
}

uint64_t sub_1000C7170()
{
  return static Color.secondary.getter();
}

uint64_t sub_1000C7180()
{
  return Color.init(_:)();
}

uint64_t sub_1000C7190()
{
  return Image.init(uiImage:)();
}

uint64_t sub_1000C71A0()
{
  return Image.init(systemName:)();
}

uint64_t sub_1000C71B0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_1000C71C0()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_1000C71D0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_1000C71E0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_1000C71F0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_1000C7200()
{
  return State.wrappedValue.setter();
}

uint64_t sub_1000C7210()
{
  return State.projectedValue.getter();
}

uint64_t sub_1000C7220()
{
  return Button.init(role:action:label:)();
}

uint64_t sub_1000C7230()
{
  return Button.init(action:label:)();
}

uint64_t sub_1000C7240()
{
  return type metadata accessor for Button();
}

uint64_t sub_1000C7250()
{
  return Toggle.init(isOn:label:)();
}

uint64_t sub_1000C7260()
{
  return Toggle<>.init<A>(_:isOn:)();
}

uint64_t sub_1000C7270()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_1000C7280()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_1000C7290()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_1000C72A0()
{
  return Binding.subscript.getter();
}

uint64_t sub_1000C72B0()
{
  return Binding.projectedValue.getter();
}

uint64_t sub_1000C72C0()
{
  return Binding.init(get:set:)();
}

uint64_t sub_1000C72D0()
{
  return static Binding.constant(_:)();
}

uint64_t sub_1000C72E0()
{
  return type metadata accessor for Binding();
}

uint64_t sub_1000C72F0()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_1000C7300()
{
  return Section<>.init(header:content:)();
}

uint64_t sub_1000C7310()
{
  return Section<>.init(content:)();
}

uint64_t sub_1000C7320()
{
  return Section<>.init(footer:content:)();
}

uint64_t sub_1000C7330()
{
  return static Alignment.center.getter();
}

uint64_t sub_1000C7340()
{
  return static Animation.easeInOut.getter();
}

uint64_t sub_1000C7350()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_1000C7360()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000C7370()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000C7380()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_1000C7390()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_1000C73A0()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t sub_1000C73B0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

void sub_1000C73C0(Swift::Int a1)
{
}

uint64_t sub_1000C73D0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000C73E0()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_1000C73F0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_1000C7400()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000C7410()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_1000C7420()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000C7430()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000C7440()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000C7450()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000C7460()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_1000C7470()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_1000C7480()
{
  return String.hash(into:)();
}

uint64_t sub_1000C7490()
{
  return String.count.getter();
}

uint64_t sub_1000C74A0()
{
  return String.index(after:)();
}

void sub_1000C74B0(Swift::String a1)
{
}

Swift::Int sub_1000C74C0()
{
  return String.UTF8View._foreignCount()();
}

Swift::Int sub_1000C74D0()
{
  return String.UTF16View._foreignCount()();
}

uint64_t sub_1000C74E0()
{
  return String.UTF16View._nativeGetOffset(for:)();
}

BOOL sub_1000C74F0(Swift::String a1)
{
  return String.hasSuffix(_:)(a1);
}

uint64_t sub_1000C7500()
{
  return String.subscript.getter();
}

uint64_t sub_1000C7510()
{
  return String.subscript.getter();
}

uint64_t sub_1000C7520()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000C7530()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000C7540()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000C7550()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000C7560()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000C7570()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_1000C7580()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000C7590()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000C75A0()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_1000C75B0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_1000C75C0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1000C75D0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_1000C75E0()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_1000C75F0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000C7600()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_1000C7630()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_1000C7640()
{
  return static Set._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000C7650()
{
  return Range<>.init(_:in:)();
}

uint64_t sub_1000C7660()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_1000C7670()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000C7680()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000C7690()
{
  return static os_log_type_t.default.getter();
}

void sub_1000C76A0(CKShare _, CKContainer container, CKAllowedSharingOptions allowedSharingOptions)
{
}

uint64_t sub_1000C76B0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_1000C76C0()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_1000C76D0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1000C76E0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_1000C76F0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_1000C7700()
{
  return CKShareParticipant.participantID.getter();
}

void sub_1000C7710()
{
}

Swift::Int sub_1000C7720()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_1000C7730()
{
  return static CKShareParticipantRole.administrator.getter();
}

uint64_t sub_1000C7740()
{
  return CKRecordKeyValueSetting.subscript.getter();
}

uint64_t sub_1000C7750()
{
  return CKModifyRecordsOperation.modifyRecordsResultBlock.setter();
}

CKModifyRecordsOperation sub_1000C7760(Swift::OpaquePointer_optional recordsToSave, Swift::OpaquePointer_optional recordIDsToDelete)
{
  return CKModifyRecordsOperation.init(recordsToSave:recordIDsToDelete:)(recordsToSave, recordIDsToDelete);
}

uint64_t sub_1000C7770()
{
  return CKModifyRecordsOperation.perRecordSaveBlock.setter();
}

uint64_t sub_1000C7780()
{
  return CKModifyRecordsOperation.perRecordDeleteBlock.setter();
}

uint64_t sub_1000C7790()
{
  return CKSystemSharingUIObserver.systemSharingUIDidSaveShareBlock.setter();
}

uint64_t sub_1000C77A0()
{
  return CKSystemSharingUIObserver.systemSharingUIDidStopSharingBlock.setter();
}

uint64_t sub_1000C77B0()
{
  return CKFetchShareMetadataOperation.perShareMetadataResultBlock.setter();
}

uint64_t sub_1000C77C0()
{
  return static CKShare.SystemFieldKey.thumbnailImageData.getter();
}

uint64_t sub_1000C77D0()
{
  return static CKShare.SystemFieldKey.title.getter();
}

uint64_t sub_1000C77E0()
{
  return static CKShare.SystemFieldKey.shareType.getter();
}

uint64_t sub_1000C77F0()
{
  return CKRecord.subscript.getter();
}

uint64_t sub_1000C7800()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000C7810()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_1000C7820()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t sub_1000C7830()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_1000C7840()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000C7850()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000C7860()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000C7870()
{
  return StringProtocol.localizedCaseInsensitiveCompare<A>(_:)();
}

uint64_t sub_1000C7880()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000C78A0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000C78B0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1000C78C0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_1000C78D0(Swift::Int a1)
{
}

uint64_t sub_1000C78E0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000C78F0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000C7900()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000C7910()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000C7920()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000C7930()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_1000C7940()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_1000C7950()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000C7960()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_1000C7970()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000C7980()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000C7990()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000C79A0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000C79B0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000C79C0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000C79D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_1000C79F0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

Swift::Int sub_1000C7A10(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_1000C7A20()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000C7A40()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_1000C7A50()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000C7A70()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_1000C7A80()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000C7AB0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1000C7AC0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000C7AD0()
{
  return Error._code.getter();
}

uint64_t sub_1000C7AE0()
{
  return Error._domain.getter();
}

uint64_t sub_1000C7AF0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000C7B00()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_1000C7B10()
{
  return Hasher.init(_seed:)();
}

void sub_1000C7B20(Swift::UInt a1)
{
}

Swift::Int sub_1000C7B30()
{
  return Hasher._finalize()();
}

uint64_t BRSharingCopyCurrentUserNameAndDisplayHandle()
{
  return _BRSharingCopyCurrentUserNameAndDisplayHandle();
}

uint64_t BRSharingCopyCurrentUserNameAndDisplayHandleForURL()
{
  return _BRSharingCopyCurrentUserNameAndDisplayHandleForURL();
}

uint64_t BRSharingCreateShareForItemAtURL()
{
  return _BRSharingCreateShareForItemAtURL();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CKErrorCodeForUnderlyingErrorCode()
{
  return _CKErrorCodeForUnderlyingErrorCode();
}

uint64_t IMStringIsEmail()
{
  return _IMStringIsEmail();
}

uint64_t IMStringIsPhoneNumber()
{
  return _IMStringIsPhoneNumber();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t TCPContactStore()
{
  return _TCPContactStore();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return _UTTypeConformsTo(inUTI, inConformsToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIAdaptLocalizedStringForView()
{
  return __UIAdaptLocalizedStringForView();
}

uint64_t _UIBarsApplyChromelessEverywhere()
{
  return __UIBarsApplyChromelessEverywhere();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return _swift_getTupleTypeMetadata3();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
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

id objc_msgSend__applyBoldFont_toPartialMatches_inAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyBoldFont:toPartialMatches:inAttributedString:");
}

id objc_msgSend__subtitleTextForRecord_font_boldFond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subtitleTextForRecord:font:boldFond:");
}

id objc_msgSend__titleTextForRecord_font_boldFond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleTextForRecord:font:boldFond:");
}

id objc_msgSend__updateSendButton(void *a1, const char *a2, ...)
{
  return _[a1 _updateSendButton];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addParticipantController(void *a1, const char *a2, ...)
{
  return _[a1 addParticipantController];
}

id objc_msgSend_addRecipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRecipient:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_addressHeightConstraint(void *a1, const char *a2, ...)
{
  return _[a1 addressHeightConstraint];
}

id objc_msgSend_addressView(void *a1, const char *a2, ...)
{
  return _[a1 addressView];
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_areKeysAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areKeysAvailable:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_atomViewsInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "atomViewsInRange:");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_cancelTaskWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTaskWithID:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _[a1 children];
}

id objc_msgSend_clearText(void *a1, const char *a2, ...)
{
  return _[a1 clearText];
}

id objc_msgSend_completelyMatchedAttributedStrings(void *a1, const char *a2, ...)
{
  return _[a1 completelyMatchedAttributedStrings];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _[a1 completion];
}

id objc_msgSend_composeRecipient(void *a1, const char *a2, ...)
{
  return _[a1 composeRecipient];
}

id objc_msgSend_composeRecipientView_composeRecipientForAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "composeRecipientView:composeRecipientForAddress:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:multiplier:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _[a1 contact];
}

id objc_msgSend_contactForMailAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForMailAddress:");
}

id objc_msgSend_contactForMailAddressOrPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForMailAddressOrPhoneNumber:");
}

id objc_msgSend_contactForPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForPhoneNumber:");
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return _[a1 contactStore];
}

id objc_msgSend_contactWithDisplayName_emailOrPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactWithDisplayName:emailOrPhoneNumber:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentParticipants(void *a1, const char *a2, ...)
{
  return _[a1 currentParticipants];
}

id objc_msgSend_currentSearchTaskID(void *a1, const char *a2, ...)
{
  return _[a1 currentSearchTaskID];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return _[a1 descriptorForRequiredKeys];
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeysForStyle:");
}

id objc_msgSend_descriptorForRequiredKeysIncludingImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeysIncludingImage:");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return _[a1 displayString];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return _[a1 emailAddresses];
}

id objc_msgSend_enumerateLeafRecipients_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateLeafRecipients:block:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_existingRecipients(void *a1, const char *a2, ...)
{
  return _[a1 existingRecipients];
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finishAndReturnParticipants(void *a1, const char *a2, ...)
{
  return _[a1 finishAndReturnParticipants];
}

id objc_msgSend_finishEnteringRecipient(void *a1, const char *a2, ...)
{
  return _[a1 finishEnteringRecipient];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_infoLabel(void *a1, const char *a2, ...)
{
  return _[a1 infoLabel];
}

id objc_msgSend_initWithAutocompleteSearchType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAutocompleteSearchType:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithContact_address_kind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContact:address:kind:");
}

id objc_msgSend_initWithContactStore_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContactStore:delegate:");
}

id objc_msgSend_initWithCurrentAddresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCurrentAddresses:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordType:zoneID:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithStyle_diameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:diameter:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithZoneName_ownerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneName:ownerName:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isGroup(void *a1, const char *a2, ...)
{
  return _[a1 isGroup];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 leftBarButtonItem];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_monogramForContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monogramForContact:");
}

id objc_msgSend_monogrammer(void *a1, const char *a2, ...)
{
  return _[a1 monogrammer];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return _[a1 operationQueue];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return _[a1 participants];
}

id objc_msgSend_phoneNumberWithStringValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberWithStringValue:");
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumbers];
}

id objc_msgSend_predicateForContactsMatchingEmailAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForContactsMatchingEmailAddress:");
}

id objc_msgSend_predicateForContactsMatchingPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForContactsMatchingPhoneNumber:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _[a1 presentationController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_processRecipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processRecipients:");
}

id objc_msgSend_processUpdate_changedObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUpdate:changedObjects:");
}

id objc_msgSend_publicPermission(void *a1, const char *a2, ...)
{
  return _[a1 publicPermission];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:range:");
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return _[a1 recipients];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return _[a1 recordName];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_requestAccessForEntityType_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAccessForEntityType:completionHandler:");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 rightBarButtonItem];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return _[a1 searchController];
}

id objc_msgSend_searchForText_withAutocompleteFetchContext_consumer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchForText:withAutocompleteFetchContext:consumer:");
}

id objc_msgSend_searchManager(void *a1, const char *a2, ...)
{
  return _[a1 searchManager];
}

id objc_msgSend_searchResultTable(void *a1, const char *a2, ...)
{
  return _[a1 searchResultTable];
}

id objc_msgSend_searchResultTableViewController(void *a1, const char *a2, ...)
{
  return _[a1 searchResultTableViewController];
}

id objc_msgSend_searchResults(void *a1, const char *a2, ...)
{
  return _[a1 searchResults];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_sendButton(void *a1, const char *a2, ...)
{
  return _[a1 sendButton];
}

id objc_msgSend_setAddParticipantController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddParticipantController:");
}

id objc_msgSend_setAddressHeightConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddressHeightConstraint:");
}

id objc_msgSend_setAddressView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddressView:");
}

id objc_msgSend_setAllParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllParticipants:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAttributedPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedPlaceholder:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setComposeRecipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComposeRecipient:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContact:");
}

id objc_msgSend_setCurrentParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentParticipants:");
}

id objc_msgSend_setCurrentSearchTaskID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSearchTaskID:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisplayedPropertyKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayedPropertyKeys:");
}

id objc_msgSend_setEdgesForExtendedLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEdgesForExtendedLayout:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExistingRecipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExistingRecipients:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setIncludeIncludeManagedAppleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeIncludeManagedAppleIDs:");
}

id objc_msgSend_setIncludeUpcomingEventMembers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeUpcomingEventMembers:");
}

id objc_msgSend_setInfoLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInfoLabel:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLeftBarButtonItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItems:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setMonogrammer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonogrammer:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOtherAddressesAlreadyChosen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherAddressesAlreadyChosen:");
}

id objc_msgSend_setPredicateForEnablingContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicateForEnablingContact:");
}

id objc_msgSend_setPredicateForSelectionOfContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicateForSelectionOfContact:");
}

id objc_msgSend_setRightBarButtonItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItems:");
}

id objc_msgSend_setSearchResultTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchResultTable:");
}

id objc_msgSend_setSearchResultTableViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchResultTableViewController:");
}

id objc_msgSend_setSearchText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchText:");
}

id objc_msgSend_setSeparatorHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorHidden:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTypingTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypingTextColor:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_startSearchingText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSearchingText:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textStorage(void *a1, const char *a2, ...)
{
  return _[a1 textStorage];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return _[a1 textView];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uncommentedAddresses(void *a1, const char *a2, ...)
{
  return _[a1 uncommentedAddresses];
}

id objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unifiedContactWithIdentifier:keysToFetch:error:");
}

id objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:");
}

id objc_msgSend_updateOtherRecipients(void *a1, const char *a2, ...)
{
  return _[a1 updateOtherRecipients];
}

id objc_msgSend_userIdentity(void *a1, const char *a2, ...)
{
  return _[a1 userIdentity];
}

id objc_msgSend_userRecordID(void *a1, const char *a2, ...)
{
  return _[a1 userRecordID];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}