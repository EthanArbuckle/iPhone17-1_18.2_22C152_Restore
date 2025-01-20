unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LegalDocumentIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LegalDocumentIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *result = a2 + 8;
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
        JUMPOUT(0x25446CEFCLL);
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
          *result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_25446CF24(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25446CF30(unsigned char *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LegalDocumentIdentifier()
{
  return &type metadata for LegalDocumentIdentifier;
}

uint64_t sub_25446CF48()
{
  sub_25447F400();
  if (qword_269DF1AA0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_269DF2EE0;
  return sub_25447F5B0();
}

unint64_t sub_25446D0F8(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x694C656369766564;
      break;
    case 2:
      unint64_t result = 0x6157656369766564;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    case 7:
      unint64_t result = 0x4C646F50656D6F68;
      break;
    case 8:
      unint64_t result = 0x57646F50656D6F68;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25446D244(char *a1, char *a2)
{
  return sub_25446E318(*a1, *a2);
}

uint64_t sub_25446D250@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25446D57C();
  *a1 = result;
  return result;
}

unint64_t sub_25446D280@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25446D0F8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25446D2B0()
{
  unint64_t result = qword_269DF1AA8;
  if (!qword_269DF1AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1AA8);
  }
  return result;
}

uint64_t sub_25446D304()
{
  return sub_25447F9C0();
}

uint64_t sub_25446D34C()
{
  return sub_25446D354();
}

uint64_t sub_25446D354()
{
  sub_25447F880();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25446D4D4()
{
  return sub_25447F9C0();
}

void sub_25446D518(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_25446D528()
{
  unint64_t result = qword_269DF1AB0;
  if (!qword_269DF1AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1AB0);
  }
  return result;
}

uint64_t sub_25446D57C()
{
  unint64_t v0 = sub_25447F970();
  swift_bridgeObjectRelease();
  if (v0 >= 9) {
    return 9;
  }
  else {
    return v0;
  }
}

uint64_t *sub_25446D5C8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *int v3 = *a2;
    int v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    unsigned int v6 = (uint64_t *)((char *)a1 + v5);
    BOOL v7 = (uint64_t *)((char *)a2 + v5);
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v8 = v7[1];
      *unsigned int v6 = *v7;
      v6[1] = v8;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v10 = sub_25447F260();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v6, v7, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t type metadata accessor for LegalDocumentModel.DocumentType(uint64_t a1)
{
  return sub_25446DCD4(a1, (uint64_t *)&unk_269DF1AC8);
}

uint64_t sub_25446D700(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = sub_25447F260();
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(v2, v4);
  }
}

unsigned char *sub_25446D7A4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  unsigned int v6 = &a2[v4];
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = v6[1];
    *uint64_t v5 = *v6;
    v5[1] = v7;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v8 = sub_25447F260();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(v5, v6, v8);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

unsigned char *sub_25446D864(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  if (a1 != a2)
  {
    uint64_t v4 = *(int *)(a3 + 20);
    uint64_t v5 = &a1[v4];
    unsigned int v6 = &a2[v4];
    sub_25446D93C((uint64_t)&a1[v4]);
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *uint64_t v5 = *v6;
      v5[1] = v6[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v7 = sub_25447F260();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25446D93C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned char *sub_25446D998(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  unsigned int v6 = &a2[v4];
  uint64_t v7 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_25447F260();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

unsigned char *sub_25446DA64(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  if (a1 != a2)
  {
    uint64_t v4 = *(int *)(a3 + 20);
    uint64_t v5 = &a1[v4];
    unsigned int v6 = &a2[v4];
    sub_25446D93C((uint64_t)&a1[v4]);
    uint64_t v7 = type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
    }
    else
    {
      uint64_t v8 = sub_25447F260();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_25446DB40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25446DB54);
}

uint64_t sub_25446DB54(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 247)
  {
    unsigned int v4 = *a1;
    if (v4 >= 9) {
      return v4 - 8;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for LegalDocumentModel.DocumentType(0);
    uint64_t v9 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    v11 = &a1[*(int *)(a3 + 20)];
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25446DBFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25446DC10);
}

unsigned char *sub_25446DC10(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 247)
  {
    *unint64_t result = a2 + 8;
  }
  else
  {
    uint64_t v7 = type metadata accessor for LegalDocumentModel.DocumentType(0);
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for LegalDocumentModel(uint64_t a1)
{
  return sub_25446DCD4(a1, (uint64_t *)&unk_269DF1AB8);
}

uint64_t sub_25446DCD4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25446DD0C()
{
  uint64_t result = type metadata accessor for LegalDocumentModel.DocumentType(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_25446DDA4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v8 = sub_25447F260();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25446DEA4(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = sub_25447F260();
    unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
}

void *sub_25446DF34(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v5 = sub_25447F260();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_25446DFE4(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_25446D93C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v4 = sub_25447F260();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_25446E0AC(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_25447F260();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_25446E160(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25446D93C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_25447F260();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_25446E224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_25446E24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25446E278()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_25446E288()
{
  uint64_t result = sub_25447F260();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_25446E318(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000012;
  unint64_t v4 = 0x80000002544810F0;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0x694C656369766564;
      unint64_t v4 = 0xED000065736E6563;
      break;
    case 2:
      unint64_t v3 = 0x6157656369766564;
      unint64_t v4 = 0xEE0079746E617272;
      break;
    case 3:
      unint64_t v4 = 0x8000000254481120;
      unint64_t v3 = 0xD000000000000010;
      break;
    case 4:
      unint64_t v3 = 0xD000000000000014;
      uint64_t v5 = "deviceROHSCompliance";
      goto LABEL_8;
    case 5:
      unint64_t v3 = 0xD000000000000011;
      uint64_t v5 = "deviceBuiltInApps";
      goto LABEL_8;
    case 6:
      unint64_t v3 = 0xD000000000000013;
      uint64_t v5 = "homePodLegalNotices";
LABEL_8:
      unint64_t v4 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    case 7:
      unint64_t v3 = 0x4C646F50656D6F68;
      unint64_t v4 = 0xEE0065736E656369;
      break;
    case 8:
      unint64_t v3 = 0x57646F50656D6F68;
      unint64_t v4 = 0xEF79746E61727261;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD000000000000012;
  unint64_t v7 = 0x80000002544810F0;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xED000065736E6563;
      if (v3 == 0x694C656369766564) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 2:
      unint64_t v7 = 0xEE0079746E617272;
      if (v3 != 0x6157656369766564) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3:
      unint64_t v7 = 0x8000000254481120;
      if (v3 != 0xD000000000000010) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 4:
      unint64_t v8 = 0xD000000000000014;
      uint64_t v9 = "deviceROHSCompliance";
      goto LABEL_21;
    case 5:
      unint64_t v8 = 0xD000000000000011;
      uint64_t v9 = "deviceBuiltInApps";
      goto LABEL_21;
    case 6:
      unint64_t v8 = 0xD000000000000013;
      uint64_t v9 = "homePodLegalNotices";
LABEL_21:
      unint64_t v7 = (unint64_t)(v9 - 32) | 0x8000000000000000;
      if (v3 != v8) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 7:
      unint64_t v6 = 0x4C646F50656D6F68;
      unint64_t v7 = 0xEE0065736E656369;
      goto LABEL_24;
    case 8:
      unint64_t v7 = 0xEF79746E61727261;
      if (v3 != 0x57646F50656D6F68) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
LABEL_24:
      if (v3 != v6) {
        goto LABEL_28;
      }
LABEL_25:
      if (v4 == v7) {
        char v10 = 1;
      }
      else {
LABEL_28:
      }
        char v10 = sub_25447F990();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10 & 1;
  }
}

uint64_t sub_25446E61C()
{
  uint64_t v1 = sub_25447F260();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x270FA5388]();
  unint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25446F310(v0, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25447F9B0();
    sub_25447F880();
    return swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v6, v1);
    sub_25447F9B0();
    sub_25446F2C8(&qword_269DF1AE8, MEMORY[0x263F06EA8]);
    sub_25447F800();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_25446E7F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25447F260();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x270FA5388]();
  unint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25447F9A0();
  sub_25446F310(v1, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25447F9B0();
    sub_25447F880();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v7, v2);
    sub_25447F9B0();
    sub_25446F2C8(&qword_269DF1AE8, MEMORY[0x263F06EA8]);
    sub_25447F800();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_25447F9C0();
}

uint64_t sub_25446E9E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25447F260();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25447F9A0();
  sub_25446F310(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25447F9B0();
    sub_25447F880();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_25447F9B0();
    sub_25446F2C8(&qword_269DF1AE8, MEMORY[0x263F06EA8]);
    sub_25447F800();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return sub_25447F9C0();
}

uint64_t sub_25446EBD0()
{
  return sub_25446F2C8(&qword_269DF1AD8, (void (*)(uint64_t))type metadata accessor for LegalDocumentModel.DocumentType);
}

uint64_t sub_25446EC18()
{
  uint64_t v1 = sub_25447F260();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25446D354();
  uint64_t v8 = type metadata accessor for LegalDocumentModel(0);
  sub_25446F310(v0 + *(int *)(v8 + 20), (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25447F9B0();
    sub_25447F880();
    return swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_25447F9B0();
    sub_25446F2C8(&qword_269DF1AE8, MEMORY[0x263F06EA8]);
    sub_25447F800();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_25446EE08()
{
  uint64_t v1 = sub_25447F260();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25447F9A0();
  sub_25446D354();
  uint64_t v8 = type metadata accessor for LegalDocumentModel(0);
  sub_25446F310(v0 + *(int *)(v8 + 20), (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25447F9B0();
    sub_25447F880();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_25447F9B0();
    sub_25446F2C8(&qword_269DF1AE8, MEMORY[0x263F06EA8]);
    sub_25447F800();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return sub_25447F9C0();
}

uint64_t sub_25446F00C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25447F260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25447F9A0();
  sub_25446D354();
  sub_25446F310(v2 + *(int *)(a2 + 20), (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_25447F9B0();
    sub_25447F880();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_25447F9B0();
    sub_25446F2C8(&qword_269DF1AE8, MEMORY[0x263F06EA8]);
    sub_25447F800();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return sub_25447F9C0();
}

uint64_t sub_25446F210(char *a1, char *a2, uint64_t a3)
{
  if ((sub_25446E318(*a1, *a2) & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 20);
  return sub_25446F374((uint64_t)&a1[v6], (uint64_t)&a2[v6]);
}

uint64_t sub_25446F280()
{
  return sub_25446F2C8(&qword_269DF1AE0, (void (*)(uint64_t))type metadata accessor for LegalDocumentModel);
}

uint64_t sub_25446F2C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25446F310(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25446F374(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25447F260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  v11 = (uint64_t *)((char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v9);
  v13 = (char *)&v26 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1AF0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v17[*(int *)(v15 + 56)];
  sub_25446F310(a1, (uint64_t)v17);
  sub_25446F310(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_25446F310((uint64_t)v17, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
      char v23 = MEMORY[0x25A27A490](v13, v7);
      v24 = *(void (**)(char *, uint64_t))(v5 + 8);
      v24(v7, v4);
      v24(v13, v4);
      sub_25446D93C((uint64_t)v17);
      return v23 & 1;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
    goto LABEL_12;
  }
  sub_25446F310((uint64_t)v17, (uint64_t)v11);
  uint64_t v20 = *v11;
  uint64_t v19 = v11[1];
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    sub_25446F6A4((uint64_t)v17);
    goto LABEL_13;
  }
  if (v20 == *(void *)v18 && v19 == *((void *)v18 + 1))
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  char v22 = sub_25447F990();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v22)
  {
LABEL_16:
    sub_25446D93C((uint64_t)v17);
    char v23 = 1;
    return v23 & 1;
  }
  sub_25446D93C((uint64_t)v17);
LABEL_13:
  char v23 = 0;
  return v23 & 1;
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

uint64_t sub_25446F6A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1AF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for LegalDocumentSectionIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LegalDocumentSectionIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x25446F860);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_25446F888(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LegalDocumentSectionIdentifier()
{
  return &type metadata for LegalDocumentSectionIdentifier;
}

unint64_t sub_25446F8A8()
{
  unint64_t result = qword_269DF1AF8;
  if (!qword_269DF1AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1AF8);
  }
  return result;
}

uint64_t sub_25446F8FC()
{
  sub_25447F400();
  if (qword_269DF1AA0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_269DF2EE0;
  return sub_25447F5B0();
}

BOOL sub_25446F9F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25446FA08()
{
  return sub_25447F9C0();
}

uint64_t sub_25446FA50()
{
  return sub_25447F9B0();
}

uint64_t sub_25446FA7C()
{
  return sub_25447F9C0();
}

uint64_t initializeBufferWithCopyOfBuffer for LegalDocumentSectionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LegalDocumentSectionModel()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for LegalDocumentSectionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for LegalDocumentSectionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LegalDocumentSectionModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LegalDocumentSectionModel(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LegalDocumentSectionModel()
{
  return &type metadata for LegalDocumentSectionModel;
}

unint64_t sub_25446FC24()
{
  unint64_t result = qword_269DF1B00;
  if (!qword_269DF1B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1B00);
  }
  return result;
}

uint64_t sub_25446FC78(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2) {
    return sub_25446FC9C(*((void *)a1 + 1), *((void *)a2 + 1));
  }
  else {
    return 0;
  }
}

uint64_t sub_25446FC9C(uint64_t a1, uint64_t a2)
{
  uint64_t v59 = sub_25447F260();
  unint64_t v64 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  v58 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v48 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1AF0);
  MEMORY[0x270FA5388](v11);
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for LegalDocumentModel(0);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  v21 = (char *)&v48 - v20;
  uint64_t v22 = *(void *)(a1 + 16);
  if (v22 != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v65 = v11;
  v54 = v10;
  uint64_t v55 = v5;
  v56 = (uint64_t *)v8;
  if (!v22 || a1 == a2) {
    return 1;
  }
  unint64_t v23 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v60 = *(void *)(v19 + 72);
  v52 = (void (**)(char *, char *, uint64_t))(v64 + 32);
  v53 = (void (**)(uint64_t, uint64_t))(v64 + 8);
  uint64_t v63 = v18;
  unint64_t v64 = (unint64_t)&unk_2544810F0;
  unint64_t v50 = (unint64_t)"deviceRFExposure";
  unint64_t v51 = (unint64_t)"es";
  unint64_t v48 = (unint64_t)"deviceBuiltInApps";
  unint64_t v49 = (unint64_t)"deviceROHSCompliance";
  uint64_t v61 = a1;
  uint64_t v62 = a2;
  v24 = v56;
  while (2)
  {
    sub_2544704DC(a1 + v23, (uint64_t)v21, type metadata accessor for LegalDocumentModel);
    sub_2544704DC(a2 + v23, (uint64_t)v17, type metadata accessor for LegalDocumentModel);
    unint64_t v26 = 0xD000000000000012;
    unint64_t v27 = v64 | 0x8000000000000000;
    switch(*v21)
    {
      case 1:
        unint64_t v26 = 0x694C656369766564;
        unint64_t v27 = 0xED000065736E6563;
        break;
      case 2:
        unint64_t v26 = 0x6157656369766564;
        unint64_t v27 = 0xEE0079746E617272;
        break;
      case 3:
        unint64_t v27 = v51 | 0x8000000000000000;
        unint64_t v26 = 0xD000000000000010;
        break;
      case 4:
        unint64_t v26 = 0xD000000000000014;
        unint64_t v27 = v50 | 0x8000000000000000;
        break;
      case 5:
        unint64_t v26 = 0xD000000000000011;
        unint64_t v27 = v49 | 0x8000000000000000;
        break;
      case 6:
        unint64_t v26 = 0xD000000000000013;
        unint64_t v27 = v48 | 0x8000000000000000;
        break;
      case 7:
        unint64_t v26 = 0x4C646F50656D6F68;
        unint64_t v27 = 0xEE0065736E656369;
        break;
      case 8:
        unint64_t v26 = 0x57646F50656D6F68;
        unint64_t v27 = 0xEF79746E61727261;
        break;
      default:
        break;
    }
    unint64_t v28 = 0xD000000000000012;
    unint64_t v29 = v64 | 0x8000000000000000;
    switch(*v17)
    {
      case 1:
        unint64_t v29 = 0xED000065736E6563;
        if (v26 == 0x694C656369766564) {
          goto LABEL_30;
        }
        goto LABEL_33;
      case 2:
        unint64_t v29 = 0xEE0079746E617272;
        if (v26 != 0x6157656369766564) {
          goto LABEL_33;
        }
        goto LABEL_30;
      case 3:
        unint64_t v29 = v51 | 0x8000000000000000;
        if (v26 != 0xD000000000000010) {
          goto LABEL_33;
        }
        goto LABEL_30;
      case 4:
        unint64_t v30 = 0xD000000000000014;
        unint64_t v31 = v50;
        goto LABEL_26;
      case 5:
        unint64_t v30 = 0xD000000000000011;
        unint64_t v31 = v49;
        goto LABEL_26;
      case 6:
        unint64_t v30 = 0xD000000000000013;
        unint64_t v31 = v48;
LABEL_26:
        unint64_t v29 = v31 | 0x8000000000000000;
        if (v26 != v30) {
          goto LABEL_33;
        }
        goto LABEL_30;
      case 7:
        unint64_t v28 = 0x4C646F50656D6F68;
        unint64_t v29 = 0xEE0065736E656369;
        goto LABEL_29;
      case 8:
        unint64_t v29 = 0xEF79746E61727261;
        if (v26 != 0x57646F50656D6F68) {
          goto LABEL_33;
        }
        goto LABEL_30;
      default:
LABEL_29:
        if (v26 != v28) {
          goto LABEL_33;
        }
LABEL_30:
        if (v27 == v29)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
LABEL_33:
          char v32 = sub_25447F990();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v32 & 1) == 0) {
            goto LABEL_46;
          }
        }
        uint64_t v33 = *(int *)(v63 + 20);
        uint64_t v34 = (uint64_t)&v17[v33];
        v35 = &v13[*(int *)(v65 + 48)];
        sub_2544704DC((uint64_t)&v21[v33], (uint64_t)v13, type metadata accessor for LegalDocumentModel.DocumentType);
        sub_2544704DC(v34, (uint64_t)v35, type metadata accessor for LegalDocumentModel.DocumentType);
        if (swift_getEnumCaseMultiPayload() != 1)
        {
          uint64_t v40 = (uint64_t)v54;
          sub_2544704DC((uint64_t)v13, (uint64_t)v54, type metadata accessor for LegalDocumentModel.DocumentType);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            (*v53)(v40, v59);
            goto LABEL_45;
          }
          v42 = v58;
          uint64_t v41 = v59;
          (*v52)(v58, v35, v59);
          char v43 = MEMORY[0x25A27A490](v40, v42);
          uint64_t v44 = v40;
          unint64_t v57 = v23;
          v45 = *v53;
          v46 = v42;
          v24 = v56;
          (*v53)((uint64_t)v46, v41);
          v45(v44, v41);
          unint64_t v23 = v57;
          if ((v43 & 1) == 0)
          {
LABEL_41:
            sub_254470544((uint64_t)v13, type metadata accessor for LegalDocumentModel.DocumentType);
            goto LABEL_46;
          }
LABEL_6:
          sub_254470544((uint64_t)v13, type metadata accessor for LegalDocumentModel.DocumentType);
          sub_254470544((uint64_t)v17, type metadata accessor for LegalDocumentModel);
          sub_254470544((uint64_t)v21, type metadata accessor for LegalDocumentModel);
          a1 = v61;
          v23 += v60;
          --v22;
          a2 = v62;
          if (!v22) {
            return 1;
          }
          continue;
        }
        sub_2544704DC((uint64_t)v13, (uint64_t)v24, type metadata accessor for LegalDocumentModel.DocumentType);
        uint64_t v37 = *v24;
        uint64_t v36 = v24[1];
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          uint64_t v38 = *(void *)v35;
          uint64_t v39 = *((void *)v35 + 1);
          if (v37 == v38 && v36 == v39)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v25 = sub_25447F990();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v25 & 1) == 0) {
              goto LABEL_41;
            }
          }
          goto LABEL_6;
        }
        swift_bridgeObjectRelease();
LABEL_45:
        sub_25446F6A4((uint64_t)v13);
LABEL_46:
        sub_254470544((uint64_t)v17, type metadata accessor for LegalDocumentModel);
        sub_254470544((uint64_t)v21, type metadata accessor for LegalDocumentModel);
        return 0;
    }
  }
}

uint64_t sub_2544704DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_254470544(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_2544705A8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    char v5 = *((unsigned char *)a2 + 8);
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = a1 + v6;
    uint64_t v8 = (uint64_t)a2 + v6;
    *(unsigned char *)(a1 + v6) = *((unsigned char *)a2 + v6);
    uint64_t v9 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
    uint64_t v10 = (void *)(v7 + v9);
    uint64_t v11 = (void *)(v8 + v9);
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    swift_retain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = v11[1];
      *uint64_t v10 = *v11;
      v10[1] = v12;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v14 = sub_25447F260();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v10, v11, v14);
    }
    swift_storeEnumTagMultiPayload();
  }
  return v3;
}

uint64_t sub_2544706F4(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = v4 + *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = sub_25447F260();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v5, v7);
  }
}

uint64_t sub_2544707B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  *(unsigned char *)(a1 + v5) = *(unsigned char *)(a2 + v5);
  uint64_t v8 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  uint64_t v9 = (void *)(v6 + v8);
  uint64_t v10 = (void *)(v7 + v8);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  swift_retain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v12 = sub_25447F260();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_2544708AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for LegalDocumentModel(0);
  if (a1 != a2)
  {
    uint64_t v11 = *(int *)(v10 + 20);
    uint64_t v12 = (void *)(v8 + v11);
    uint64_t v13 = (void *)(v9 + v11);
    sub_2544725C4((uint64_t)v12, type metadata accessor for LegalDocumentModel.DocumentType);
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *uint64_t v12 = *v13;
      v12[1] = v13[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v14 = sub_25447F260();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2544709D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  *(unsigned char *)(a1 + v4) = *(unsigned char *)(a2 + v4);
  uint64_t v7 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  uint64_t v8 = (void *)(v5 + v7);
  uint64_t v9 = (const void *)(v6 + v7);
  uint64_t v10 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    uint64_t v11 = sub_25447F260();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_254470AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v6;
  swift_release();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for LegalDocumentModel(0);
  if (a1 != a2)
  {
    uint64_t v11 = *(int *)(v10 + 20);
    uint64_t v12 = (void *)(v8 + v11);
    uint64_t v13 = (const void *)(v9 + v11);
    sub_2544725C4((uint64_t)v12, type metadata accessor for LegalDocumentModel.DocumentType);
    uint64_t v14 = type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v15 = sub_25447F260();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_254470BE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_254470BFC);
}

uint64_t sub_254470BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 8);
    if (v4 > 1) {
      return (v4 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for LegalDocumentModel(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_254470CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_254470CB8);
}

uint64_t sub_254470CB8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *(unsigned char *)(result + 8) = -(char)a2;
  }
  else
  {
    uint64_t v7 = type metadata accessor for LegalDocumentModel(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for LegalDocumentCell()
{
  uint64_t result = qword_269DF1B08;
  if (!qword_269DF1B08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_254470DA8()
{
  uint64_t result = type metadata accessor for LegalDocumentModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_254470E40()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_254470E5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v131 = a1;
  uint64_t v112 = sub_25447F310();
  uint64_t v111 = *(void *)(v112 - 8);
  MEMORY[0x270FA5388](v112);
  v110 = (char *)v89 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_25447F3F0();
  uint64_t v108 = *(void *)(v109 - 8);
  MEMORY[0x270FA5388](v109);
  v107 = (char *)v89 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LegalDocumentModel(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v96 = (uint64_t)v89 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = type metadata accessor for LegalDocumentWebView(0);
  MEMORY[0x270FA5388](v95);
  v97 = (void *)((char *)v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B18);
  MEMORY[0x270FA5388](v102);
  uint64_t v100 = (uint64_t)v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B20);
  uint64_t v104 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  v132 = (char *)v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B28);
  uint64_t v103 = *(void *)(v105 - 8);
  MEMORY[0x270FA5388](v105);
  v101 = (char *)v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B30);
  uint64_t v120 = *(void *)(v121 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v121);
  v99 = (char *)v89 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v98 = (uint64_t)v89 - v13;
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B38);
  uint64_t v14 = MEMORY[0x270FA5388](v122);
  uint64_t v118 = (uint64_t)v89 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v119 = (uint64_t)v89 - v16;
  uint64_t v17 = type metadata accessor for LegalDocumentCell();
  uint64_t v114 = *(void *)(v17 - 8);
  uint64_t v18 = *(void *)(v114 + 64);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v113 = (uint64_t)v89 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  v21 = (char *)v89 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B40);
  uint64_t v128 = *(void *)(v22 - 8);
  uint64_t v129 = v22;
  MEMORY[0x270FA5388](v22);
  v127 = (char *)v89 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B48);
  MEMORY[0x270FA5388](v24 - 8);
  v126 = (char *)v89 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B50);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  unint64_t v30 = (char *)v89 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  char v32 = (char *)v89 - v31;
  char v33 = *(unsigned char *)(v1 + 8);
  uint64_t v34 = swift_retain();
  sub_254479108(v34, v33);
  swift_release();
  type metadata accessor for LegalAndRegulatorySettingsListState();
  sub_2544729FC((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F7A0();
  v123 = v32;
  sub_25447F790();
  swift_getKeyPath();
  sub_25447F7B0();
  swift_release();
  v35 = *(void (**)(char *, uint64_t))(v27 + 8);
  uint64_t v36 = v30;
  uint64_t v37 = (uint64_t)v21;
  uint64_t v124 = v27 + 8;
  uint64_t v125 = v26;
  v116 = v35;
  v35(v36, v26);
  uint64_t v39 = v137;
  uint64_t v38 = v138;
  uint64_t v94 = v17;
  uint64_t v115 = *(int *)(v17 + 20);
  LOBYTE(v26) = *(unsigned char *)(v1 + v115);
  char v40 = v139;
  sub_25447255C(v2, v37, (uint64_t (*)(void))type metadata accessor for LegalDocumentCell);
  uint64_t v130 = v2;
  uint64_t v41 = v113;
  sub_25447255C(v2, v113, (uint64_t (*)(void))type metadata accessor for LegalDocumentCell);
  unint64_t v42 = (*(unsigned __int8 *)(v114 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v114 + 80);
  uint64_t v43 = swift_allocObject();
  sub_2544724F4(v41, v43 + v42, (uint64_t (*)(void))type metadata accessor for LegalDocumentCell);
  uint64_t v44 = sub_254471E24(v26, v39, v38, v40);
  uint64_t v46 = v45;
  int v48 = v47;
  v133 = sub_254472154;
  uint64_t v134 = v43;
  swift_retain();
  swift_retain();
  uint64_t v114 = v38;
  uint64_t v49 = sub_254471F18(v39, v38, v40);
  uint64_t v117 = v37;
  if (v50)
  {
    uint64_t v51 = v49;
    v89[1] = v50;
    int v90 = v48;
    uint64_t v52 = v96;
    sub_25447255C(v37 + *(int *)(v94 + 20), v96, type metadata accessor for LegalDocumentModel);
    uint64_t KeyPath = swift_getKeyPath();
    v54 = v97;
    uint64_t *v97 = KeyPath;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1D00);
    swift_storeEnumTagMultiPayload();
    sub_2544724F4(v52, (uint64_t)v54 + *(int *)(v95 + 20), type metadata accessor for LegalDocumentModel);
    id v55 = objc_msgSend(self, sel_currentDevice);
    unsigned int v56 = objc_msgSend(v55, sel_sf_isiPad);

    uint64_t v57 = (uint64_t)v54;
    uint64_t v93 = v39;
    uint64_t v92 = v43;
    uint64_t v113 = v44;
    uint64_t v91 = v46;
    v89[2] = v51;
    if (v56) {
      char v58 = sub_25447F4F0();
    }
    else {
      char v58 = sub_25447F520();
    }
    char v62 = v58;
    uint64_t v63 = (uint64_t)v54;
    uint64_t v64 = v100;
    sub_25447255C(v63, v100, type metadata accessor for LegalDocumentWebView);
    uint64_t v65 = v102;
    uint64_t v66 = v64 + *(int *)(v102 + 36);
    *(unsigned char *)uint64_t v66 = v62;
    *(_OWORD *)(v66 + 8) = 0u;
    *(_OWORD *)(v66 + 24) = 0u;
    *(unsigned char *)(v66 + 40) = 1;
    sub_2544725C4(v57, type metadata accessor for LegalDocumentWebView);
    uint64_t v67 = sub_25446CF48();
    uint64_t v69 = v68;
    char v71 = v70 & 1;
    uint64_t v72 = v108;
    v73 = v107;
    uint64_t v74 = v109;
    (*(void (**)(char *, void, uint64_t))(v108 + 104))(v107, *MEMORY[0x263F19698], v109);
    unint64_t v75 = sub_2544723C4();
    sub_25447F660();
    sub_254472624(v67, v69, v71);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v73, v74);
    sub_254472634(v64);
    v76 = v110;
    sub_25447F300();
    uint64_t v135 = v65;
    unint64_t v136 = v75;
    swift_getOpaqueTypeConformance2();
    v77 = v101;
    uint64_t v78 = v106;
    v79 = v132;
    sub_25447F620();
    (*(void (**)(char *, uint64_t))(v111 + 8))(v76, v112);
    (*(void (**)(char *, uint64_t))(v104 + 8))(v79, v78);
    LOBYTE(v79) = sub_25447F500();
    uint64_t v80 = v103;
    uint64_t v81 = (uint64_t)v99;
    uint64_t v82 = v105;
    (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v99, v77, v105);
    uint64_t v60 = v121;
    *(unsigned char *)(v81 + *(int *)(v121 + 36)) = (_BYTE)v79;
    (*(void (**)(char *, uint64_t))(v80 + 8))(v77, v82);
    uint64_t v83 = v98;
    sub_254472694(v81, v98, &qword_269DF1B30);
    uint64_t v84 = v83;
    uint64_t v61 = v118;
    sub_254472694(v84, v118, &qword_269DF1B30);
    swift_release();
    swift_release();
    uint64_t v59 = 0;
  }
  else
  {
    uint64_t v59 = 1;
    uint64_t v60 = v121;
    uint64_t v61 = v118;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v120 + 56))(v61, v59, 1, v60);
  sub_254472694(v61, v119, &qword_269DF1B38);
  sub_25447221C();
  v85 = v127;
  sub_25447F340();
  swift_release();
  sub_2544725C4(v117, (uint64_t (*)(void))type metadata accessor for LegalDocumentCell);
  swift_release();
  swift_release();
  sub_254472470();
  uint64_t v86 = (uint64_t)v126;
  uint64_t v87 = v129;
  sub_25447F680();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v128 + 8))(v85, v87);
  v116(v123, v125);
  return sub_254472694(v86, v131, &qword_269DF1B48);
}

uint64_t sub_254471D3C()
{
  return sub_25447F640();
}

uint64_t sub_254471D5C(uint64_t a1)
{
  uint64_t v2 = sub_25447F330();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25447F3C0();
}

uint64_t sub_254471E24(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 32) = a2;
  *(void *)(v8 + 40) = a3;
  *(unsigned char *)(v8 + 48) = a4;
  *(unsigned char *)(v8 + 49) = a1;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  *(void *)(v9 + 24) = 0;
  *(void *)(v9 + 32) = a2;
  *(void *)(v9 + 40) = a3;
  *(unsigned char *)(v9 + 48) = a4;
  *(unsigned char *)(v9 + 49) = a1;
  swift_retain_n();
  swift_retain_n();
  sub_25447F730();
  return v11;
}

uint64_t sub_254471F18(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v12 = a1;
  uint64_t v13 = a2;
  char v14 = a3;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B88);
  MEMORY[0x25A27A970](&v11, v3);
  char v4 = v11;
  if (v11 == 9)
  {
    swift_release();
    swift_release();
    return 0;
  }
  else
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = 0;
    *(void *)(v6 + 24) = 0;
    *(unsigned char *)(v6 + 32) = v4;
    uint64_t v7 = v12;
    uint64_t v8 = v13;
    char v9 = v14;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = 0;
    *(void *)(v10 + 24) = 0;
    *(void *)(v10 + 32) = v7;
    *(void *)(v10 + 40) = v8;
    *(unsigned char *)(v10 + 48) = v9;
    sub_25447F740();
    return v11;
  }
}

uint64_t sub_254472030()
{
  uint64_t v1 = (int *)(type metadata accessor for LegalDocumentCell() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  uint64_t v5 = v1[7];
  uint64_t v6 = v0 + v3 + v5 + *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = sub_25447F260();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_254472154@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for LegalDocumentCell();
  uint64_t result = sub_25446CF48();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

double sub_2544721CC@<D0>(uint64_t a1@<X8>)
{
  (*(void (**)(long long *__return_ptr))(v1 + 16))(&v6);
  char v3 = v7;
  uint64_t v4 = v8;
  double result = *(double *)&v6;
  *(_OWORD *)a1 = v6;
  *(unsigned char *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  return result;
}

unint64_t sub_25447221C()
{
  unint64_t result = qword_269DF1B60;
  if (!qword_269DF1B60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1B38);
    sub_2544722D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1B60);
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

unint64_t sub_2544722D8()
{
  unint64_t result = qword_269DF1B68;
  if (!qword_269DF1B68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1B30);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1B20);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1B18);
    sub_2544723C4();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1B68);
  }
  return result;
}

unint64_t sub_2544723C4()
{
  unint64_t result = qword_269DF1B70;
  if (!qword_269DF1B70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1B18);
    sub_2544729FC(&qword_269DF1B78, (void (*)(uint64_t))type metadata accessor for LegalDocumentWebView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1B70);
  }
  return result;
}

unint64_t sub_254472470()
{
  unint64_t result = qword_269DF1B80;
  if (!qword_269DF1B80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1B40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1B80);
  }
  return result;
}

uint64_t sub_2544724CC()
{
  return sub_25447F3B0();
}

uint64_t sub_2544724F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25447255C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2544725C4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_254472624(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_254472634(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_254472694(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2544726F8()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

void sub_254472730(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

uint64_t sub_25447273C()
{
  return sub_25447F720();
}

uint64_t sub_254472794()
{
  return objectdestroy_12Tm(49);
}

uint64_t sub_25447279C()
{
  return sub_25447273C();
}

uint64_t sub_2544727A8@<X0>(uint64_t *a1@<X2>, char *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = a1[1];
  char v5 = *((unsigned char *)a1 + 16);
  char v6 = *a2;
  uint64_t v10 = *a1;
  uint64_t v11 = v4;
  char v12 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B88);
  MEMORY[0x25A27A970](&v9, v7);
  if (v9 == 9) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = sub_25446E318(v9, v6);
  }
  *a3 = result & 1;
  return result;
}

uint64_t sub_254472828()
{
  return objectdestroy_12Tm(50);
}

uint64_t sub_254472830@<X0>(unsigned char *a1@<X8>)
{
  return sub_2544727A8((uint64_t *)(v1 + 32), (char *)(v1 + 49), a1);
}

uint64_t sub_254472840()
{
  return objectdestroy_12Tm(50);
}

uint64_t objectdestroy_12Tm(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_25447289C()
{
  return sub_2544728B0();
}

uint64_t sub_2544728B0()
{
  return swift_release();
}

unint64_t sub_254472950()
{
  unint64_t result = qword_269DF1B90;
  if (!qword_269DF1B90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1B48);
    sub_254472470();
    sub_2544729FC((unint64_t *)&qword_269DF1B98, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1B90);
  }
  return result;
}

uint64_t sub_2544729FC(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for LegalDocumentSection()
{
  return &type metadata for LegalDocumentSection;
}

uint64_t sub_254472A54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_254472A70(char a1, uint64_t a2)
{
  char v3 = a1 & 1;
  uint64_t v4 = sub_25447F420();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BA0);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v18[-v12];
  v18[16] = v3;
  uint64_t v19 = a2;
  uint64_t v20 = sub_25446F8FC();
  uint64_t v21 = v14;
  char v22 = v15 & 1;
  uint64_t v23 = v16;
  sub_25447F410();
  sub_25447F670();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  sub_254472624(v20, v21, v22);
  swift_bridgeObjectRelease();
  sub_254472E3C((uint64_t)v11, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BA8);
  sub_254472EA4();
  sub_254472F50();
  return sub_25447F760();
}

uint64_t sub_254472C78()
{
  return sub_25447F750();
}

uint64_t sub_254472D8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for LegalDocumentCell();
  sub_254473050(a1, a2 + *(int *)(v4 + 20));
  type metadata accessor for LegalAndRegulatorySettingsListState();
  sub_2544730B4((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  uint64_t result = sub_25447F2F0();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v6 & 1;
  return result;
}

uint64_t sub_254472E24()
{
  return sub_254472A70(*(unsigned char *)v0, *(void *)(v0 + 8));
}

uint64_t sub_254472E30()
{
  return sub_254472C78();
}

uint64_t sub_254472E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_254472EA4()
{
  unint64_t result = qword_269DF1BB0;
  if (!qword_269DF1BB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1BA0);
    sub_2544730B4((unint64_t *)&qword_269DF1B98, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1BB0);
  }
  return result;
}

unint64_t sub_254472F50()
{
  unint64_t result = qword_269DF1BB8;
  if (!qword_269DF1BB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1BA8);
    sub_2544730B4(&qword_269DF1BC0, (void (*)(uint64_t))type metadata accessor for LegalDocumentCell);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1BB8);
  }
  return result;
}

unint64_t sub_254472FF4()
{
  unint64_t result = qword_269DF1BD0;
  if (!qword_269DF1BD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1BC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1BD0);
  }
  return result;
}

uint64_t sub_254473050(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LegalDocumentModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2544730B4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_254473100()
{
  unint64_t result = qword_269DF1BE0;
  if (!qword_269DF1BE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_269DF1BE8);
    sub_254472EA4();
    sub_254472F50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1BE0);
  }
  return result;
}

uint64_t sub_254473338()
{
  return type metadata accessor for LegalDocumentWebViewCoordinator(0);
}

uint64_t type metadata accessor for LegalDocumentWebViewCoordinator(uint64_t a1)
{
  return sub_25446DCD4(a1, qword_269DF1CB8);
}

uint64_t sub_254473360()
{
  uint64_t result = sub_25447F330();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_2544733F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LegalDocumentModel(0);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2544752E0(v2 + *(int *)(a2 + 20), (uint64_t)v6, type metadata accessor for LegalDocumentModel);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1D38);
  sub_25447F4D0();
  uint64_t v7 = v14;
  uint64_t v8 = (objc_class *)type metadata accessor for LegalDocumentWebViewController(0);
  uint64_t v9 = (char *)objc_allocWithZone(v8);
  sub_2544752E0((uint64_t)v6, (uint64_t)&v9[OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport30LegalDocumentWebViewController_model], type metadata accessor for LegalDocumentModel);
  *(void *)&v9[OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport30LegalDocumentWebViewController_coordinator] = v7;
  v13.receiver = v9;
  v13.super_class = v8;
  id v10 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
  sub_254470544((uint64_t)v6, type metadata accessor for LegalDocumentModel);
  return v10;
}

uint64_t sub_254473534@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_25447F330();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25447937C((uint64_t)v5);
  char v6 = (objc_class *)type metadata accessor for LegalDocumentWebViewCoordinator(0);
  id v7 = objc_allocWithZone(v6);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))((uint64_t)v7 + OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator_openURL, v5, v2);
  v10.receiver = v7;
  v10.super_class = v6;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v8;
  return result;
}

uint64_t sub_25447365C()
{
  return sub_25447F460();
}

uint64_t sub_254473698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25447529C(&qword_269DF1D30);
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_254473718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25447529C(&qword_269DF1D30);
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_254473798()
{
}

void sub_254473838()
{
  unint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_25447F870();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v53 = sub_25447F260();
  uint64_t v3 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1FA60]), sel_init);
  objc_msgSend(v9, sel_setDataDetectorTypes_, 0);
  id v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1FA38]), sel_init);
  objc_msgSend(v9, sel_setUserContentController_);
  id v10 = objc_allocWithZone(MEMORY[0x263F1FA58]);
  id v55 = v9;
  id v11 = objc_msgSend(v10, sel_initWithFrame_configuration_, v9, 0.0, 0.0, 0.0, 0.0);
  uint64_t v12 = *(void *)&v0[OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport30LegalDocumentWebViewController_coordinator];
  objc_msgSend(v11, sel_setNavigationDelegate_, v12);
  id v13 = objc_msgSend(v11, sel_scrollView);
  objc_msgSend(v13, sel_setDelegate_, v12);

  objc_msgSend(v11, sel_setAllowsLinkPreview_, 0);
  objc_msgSend(v11, sel_setOpaque_, 0);
  uint64_t v14 = self;
  id v15 = v11;
  id v16 = objc_msgSend(v14, sel_clearColor);
  objc_msgSend(v15, sel_setBackgroundColor_, v16);

  id v17 = objc_msgSend(v15, sel_scrollView);
  objc_msgSend(v17, sel_setIndicatorStyle_, 0);

  uint64_t v18 = &v0[OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport30LegalDocumentWebViewController_model];
  uint64_t v19 = type metadata accessor for LegalDocumentModel(0);
  sub_2544752E0((uint64_t)&v18[*(int *)(v19 + 20)], (uint64_t)v8, type metadata accessor for LegalDocumentModel.DocumentType);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    uint64_t v20 = v53;
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v53);
    sub_25447F860();
    uint64_t v61 = sub_25447F810();
    uint64_t v62 = v21;
    unint64_t v59 = 0xD000000000000012;
    unint64_t v60 = 0x80000002544815E0;
    unint64_t v57 = 0xD00000000000006ELL;
    unint64_t v58 = 0x8000000254481600;
    sub_254474284();
    sub_25447F8E0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v20);
    swift_bridgeObjectRelease();
  }
  char v22 = (void *)sub_25447F840();
  swift_bridgeObjectRelease();

  id v23 = objc_msgSend(v1, sel_view);
  if (!v23)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v24 = v23;
  objc_msgSend(v23, sel_addSubview_, v15);

  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1CE0);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_2544805E0;
  id v26 = objc_msgSend(v1, sel_view);
  if (!v26)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v27 = v26;
  id v28 = objc_msgSend(v26, sel_readableContentGuide);

  id v29 = objc_msgSend(v28, sel_leadingAnchor);
  id v30 = objc_msgSend(v15, sel_leadingAnchor);
  id v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

  *(void *)(v25 + 32) = v31;
  id v32 = objc_msgSend(v1, sel_view);
  if (!v32)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  char v33 = v32;
  id v34 = objc_msgSend(v32, sel_readableContentGuide);

  id v35 = objc_msgSend(v34, sel_topAnchor);
  id v36 = objc_msgSend(v15, sel_topAnchor);
  id v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

  *(void *)(v25 + 40) = v37;
  id v38 = objc_msgSend(v1, sel_view);
  if (!v38)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v39 = v38;
  id v40 = objc_msgSend(v38, sel_readableContentGuide);

  id v41 = objc_msgSend(v40, sel_trailingAnchor);
  id v42 = objc_msgSend(v15, sel_trailingAnchor);
  id v43 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v42);

  *(void *)(v25 + 48) = v43;
  id v44 = objc_msgSend(v1, sel_view);
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = self;
    id v47 = objc_msgSend(v45, sel_readableContentGuide);

    id v48 = objc_msgSend(v47, sel_bottomAnchor);
    id v49 = objc_msgSend(v15, sel_bottomAnchor);
    id v50 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v49);

    *(void *)(v25 + 56) = v50;
    uint64_t v61 = v25;
    sub_25447F8C0();
    sub_254474244();
    uint64_t v51 = (void *)sub_25447F8B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v46, sel_activateConstraints_, v51);

    v63.receiver = v1;
    v63.super_class = ObjectType;
    objc_msgSendSuper2(&v63, sel_viewDidLoad);

    return;
  }
LABEL_13:
  __break(1u);
}

id sub_2544740E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_254474180()
{
  return type metadata accessor for LegalDocumentWebViewController(0);
}

uint64_t type metadata accessor for LegalDocumentWebViewController(uint64_t a1)
{
  return sub_25446DCD4(a1, (uint64_t *)&unk_269DF1CD0);
}

uint64_t sub_2544741A8()
{
  uint64_t result = type metadata accessor for LegalDocumentModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_254474244()
{
  unint64_t result = qword_269DF1CE8;
  if (!qword_269DF1CE8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269DF1CE8);
  }
  return result;
}

unint64_t sub_254474284()
{
  unint64_t result = qword_269DF1CF0;
  if (!qword_269DF1CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1CF0);
  }
  return result;
}

uint64_t sub_2544742D8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1CF8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25447F1E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25447F260();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_navigationType)) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1);
  }
  id v16 = objc_msgSend(a1, sel_request);
  sub_25447F1C0();

  sub_25447F1D0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) == 1)
  {
    sub_254474B60((uint64_t)v7, &qword_269DF1CF8);
    return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1);
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v7, v12);
  sub_25447F320();
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, 0);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

void *sub_25447456C(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1D00);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25447F330();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    id v11 = (char *)a2 + v9;
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    uint64_t v12 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
    uint64_t v13 = &v10[v12];
    uint64_t v14 = &v11[v12];
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = *((void *)v14 + 1);
      *(void *)uint64_t v13 = *(void *)v14;
      *((void *)v13 + 1) = v15;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v16 = sub_25447F260();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v13, v14, v16);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_25447472C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1D00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_25447F330();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = v5 + *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = sub_25447F260();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    return v9(v6, v8);
  }
}

void *sub_25447484C(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1D00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_25447F330();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *((unsigned char *)a1 + v7) = *((unsigned char *)a2 + v7);
  uint64_t v10 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  id v11 = &v8[v10];
  uint64_t v12 = &v9[v10];
  type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)id v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v14 = sub_25447F260();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v11, v12, v14);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_2544749B4(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_254474B60((uint64_t)a1, &qword_269DF1D00);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1D00);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_25447F330();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *((unsigned char *)a1 + v7) = *((unsigned char *)a2 + v7);
  uint64_t v10 = type metadata accessor for LegalDocumentModel(0);
  if (a1 != a2)
  {
    uint64_t v11 = *(int *)(v10 + 20);
    uint64_t v12 = &v8[v11];
    uint64_t v13 = &v9[v11];
    sub_254470544((uint64_t)v12, type metadata accessor for LegalDocumentModel.DocumentType);
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(void *)uint64_t v12 = *(void *)v13;
      *((void *)v12 + 1) = *((void *)v13 + 1);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v14 = sub_25447F260();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_254474B60(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *sub_254474BBC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1D00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_25447F330();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  a1[v8] = a2[v8];
  uint64_t v11 = *(int *)(type metadata accessor for LegalDocumentModel(0) + 20);
  uint64_t v12 = &v9[v11];
  uint64_t v13 = &v10[v11];
  uint64_t v14 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    uint64_t v15 = sub_25447F260();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_254474D38(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_254474B60((uint64_t)a1, &qword_269DF1D00);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1D00);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_25447F330();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  a1[v8] = a2[v8];
  uint64_t v11 = type metadata accessor for LegalDocumentModel(0);
  if (a1 != a2)
  {
    uint64_t v12 = *(int *)(v11 + 20);
    uint64_t v13 = &v9[v12];
    uint64_t v14 = &v10[v12];
    sub_254470544((uint64_t)&v9[v12], type metadata accessor for LegalDocumentModel.DocumentType);
    uint64_t v15 = type metadata accessor for LegalDocumentModel.DocumentType(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      uint64_t v16 = sub_25447F260();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_254474EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_254474F04);
}

uint64_t sub_254474F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269DF1D08);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for LegalDocumentModel(0);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_254475000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_254475014);
}

uint64_t sub_254475014(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269DF1D08);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for LegalDocumentModel(0);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for LegalDocumentWebView(uint64_t a1)
{
  return sub_25446DCD4(a1, (uint64_t *)&unk_269DF1D18);
}

void sub_25447513C()
{
  sub_254475204();
  if (v0 <= 0x3F)
  {
    type metadata accessor for LegalDocumentModel(319);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_254475204()
{
  if (!qword_269DF1D28)
  {
    sub_25447F330();
    unint64_t v0 = sub_25447F2E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269DF1D28);
    }
  }
}

uint64_t sub_25447525C()
{
  return sub_25447529C(&qword_269DF1B78);
}

uint64_t sub_254475290()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_25447529C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for LegalDocumentWebView(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2544752E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for CountryOfOriginDynamicLabel(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for CountryOfOriginDynamicLabel()
{
  return swift_release();
}

uint64_t assignWithCopy for CountryOfOriginDynamicLabel(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for CountryOfOriginDynamicLabel(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CountryOfOriginDynamicLabel(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CountryOfOriginDynamicLabel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CountryOfOriginDynamicLabel()
{
  return &type metadata for CountryOfOriginDynamicLabel;
}

uint64_t sub_2544754B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2544754D4@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3 = a1 & 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1DA0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = swift_retain();
  uint64_t v8 = sub_254479108(v7, v3);
  swift_release();
  swift_getKeyPath();
  uint64_t v31 = v8;
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  swift_release();
  int v9 = *(unsigned __int8 *)(v8 + 67);
  swift_release();
  if (v9 == 1)
  {
    uint64_t v10 = swift_retain();
    uint64_t v11 = sub_254479108(v10, v3);
    swift_release();
    swift_getKeyPath();
    uint64_t v31 = v11;
    sub_25447F2A0();
    swift_release();
    uint64_t v13 = *(void *)(v11 + 72);
    uint64_t v12 = *(void *)(v11 + 80);
    swift_bridgeObjectRetain();
    swift_release();
    uint64_t v31 = v13;
    uint64_t v32 = v12;
    sub_254474284();
    uint64_t v14 = sub_25447F5C0();
    uint64_t v16 = v15;
    char v18 = v17 & 1;
    uint64_t v19 = sub_25447F540();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 1, 1, v19);
    sub_25447F570();
    sub_254475B40((uint64_t)v6);
    uint64_t v20 = sub_25447F5A0();
    uint64_t v22 = v21;
    char v24 = v23;
    uint64_t v26 = v25;
    swift_release();
    sub_254472624(v14, v16, v18);
    swift_bridgeObjectRelease();
    uint64_t v31 = v20;
    uint64_t v32 = v22;
    char v33 = v24 & 1;
    uint64_t v34 = v26;
    sub_25447F680();
    sub_254472624(v20, v22, v24 & 1);
    swift_bridgeObjectRelease();
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BA0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(a2, 0, 1, v27);
  }
  else
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BA0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(a2, 1, 1, v29);
  }
}

uint64_t sub_25447581C@<X0>(uint64_t a1@<X8>)
{
  return sub_2544754D4(*(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_254475828@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 67);
  return result;
}

uint64_t sub_2544758D0()
{
  return swift_release();
}

uint64_t sub_2544759A0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 80);
  *a2 = *(void *)(v3 + 72);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_254475A4C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_254475B40(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1DA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_254475BA0()
{
  return sub_25447D588(v0[2], v0[3], v0[4]);
}

uint64_t sub_254475BC0()
{
  return sub_25447D580(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_254475BE4()
{
  unint64_t result = qword_269DF1DA8;
  if (!qword_269DF1DA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1DB0);
    sub_254472EA4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1DA8);
  }
  return result;
}

uint64_t sub_254475C58(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for EyesightWarningDynamicLabel()
{
  return &type metadata for EyesightWarningDynamicLabel;
}

uint64_t sub_254475CB4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_254475CD0@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  char v2 = a1 & 1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1DA0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_retain();
  uint64_t v7 = sub_254479108(v6, v2);
  swift_release();
  swift_getKeyPath();
  uint64_t v30 = v7;
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  swift_release();
  int v8 = *(unsigned __int8 *)(v7 + 64);
  swift_release();
  if (v8 == 1)
  {
    uint64_t v28 = sub_25447F430();
    sub_254475FDC((uint64_t)&v30);
    uint64_t v9 = v30;
    uint64_t v10 = v31;
    unsigned __int8 v11 = v32;
    HIDWORD(v25) = v32;
    uint64_t v13 = v33;
    uint64_t v12 = v34;
    uint64_t v14 = v35;
    char v15 = v36;
    uint64_t v16 = v37;
    uint64_t v26 = v30;
    uint64_t v27 = v37;
    uint64_t v17 = sub_25447F540();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v5, 1, 1, v17);
    uint64_t v18 = sub_25447F570();
    sub_254475B40((uint64_t)v5);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v30 = v28;
    uint64_t v31 = 0x3FF3333333333333;
    unsigned __int8 v32 = 0;
    uint64_t v33 = v9;
    uint64_t v34 = v10;
    uint64_t v20 = v10;
    LOBYTE(v35) = v11;
    uint64_t v36 = v13;
    uint64_t v37 = v12;
    uint64_t v38 = v14;
    char v39 = v15;
    uint64_t v40 = v16;
    uint64_t v41 = KeyPath;
    uint64_t v42 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1DC0);
    uint64_t v21 = v29;
    sub_254476254();
    sub_25447F680();
    sub_254472624(v26, v20, SBYTE4(v25));
    swift_bridgeObjectRelease();
    sub_254472624(v12, v14, v15);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1DB8);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 0, 1, v22);
  }
  else
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1DB8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v29, 1, 1, v24);
  }
}

uint64_t sub_254475FDC@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0x100000000000003CLL;
  *(void *)(a1 + 8) = 0x80000002544817C0;
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(a1 + 24) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 32) = 0x1000000000000030;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 40) = 0x8000000254481800;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v1;
  sub_25447635C(0x100000000000003CLL, 0x80000002544817C0, 0);
  swift_bridgeObjectRetain();
  sub_25447635C(0x1000000000000030, 0x8000000254481800, 0);
  swift_bridgeObjectRetain();
  sub_254472624(0x1000000000000030, 0x8000000254481800, 0);
  swift_bridgeObjectRelease();
  sub_254472624(0x100000000000003CLL, 0x80000002544817C0, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2544760C0@<X0>(uint64_t a1@<X8>)
{
  return sub_254475CD0(*(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_2544760CC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 64);
  return result;
}

uint64_t sub_254476174()
{
  return swift_release();
}

unint64_t sub_254476254()
{
  unint64_t result = qword_269DF1DC8;
  if (!qword_269DF1DC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1DC0);
    sub_254476318(&qword_269DF1DD0, &qword_269DF1DD8);
    sub_254476318(&qword_269DF1DE0, &qword_269DF1DE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1DC8);
  }
  return result;
}

uint64_t sub_254476318(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25447635C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_25447636C()
{
  return sub_25447D568(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_254476390()
{
  unint64_t result = qword_269DF1DF0;
  if (!qword_269DF1DF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1DF8);
    sub_254476404();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1DF0);
  }
  return result;
}

unint64_t sub_254476404()
{
  unint64_t result = qword_269DF1E00;
  if (!qword_269DF1E00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1DB8);
    sub_254476254();
    sub_254475C58((unint64_t *)&qword_269DF1B98, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1E00);
  }
  return result;
}

ValueMetadata *type metadata accessor for IndiaBISDynamicLabel()
{
  return &type metadata for IndiaBISDynamicLabel;
}

uint64_t sub_2544764C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2544764DC@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3 = a1 & 1;
  uint64_t v4 = swift_retain();
  uint64_t v5 = sub_254479108(v4, v3);
  swift_release();
  swift_getKeyPath();
  uint64_t v27 = v5;
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  swift_release();
  int v6 = *(unsigned __int8 *)(v5 + 17);
  swift_release();
  if (v6 != 1) {
    goto LABEL_6;
  }
  uint64_t v7 = swift_retain();
  uint64_t v8 = sub_254479108(v7, v3);
  swift_release();
  swift_getKeyPath();
  uint64_t v27 = v8;
  sub_25447F2A0();
  swift_release();
  uint64_t v9 = *(void *)(v8 + 24);
  unint64_t v10 = *(void *)(v8 + 32);
  swift_release();
  uint64_t v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    uint64_t v12 = sub_25447F430();
    sub_2544767AC(v3, (uint64_t)&v27);
    uint64_t v13 = v27;
    uint64_t v14 = v28;
    uint64_t v15 = v29;
    char v16 = v30;
    uint64_t v17 = v31;
    uint64_t v18 = v32;
    uint64_t v19 = v33;
    char v23 = v34;
    uint64_t v24 = v36;
    uint64_t v25 = v35;
    uint64_t v26 = v37;
    uint64_t v27 = v12;
    uint64_t v28 = 0x3FF0000000000000;
    LOBYTE(v29) = 0;
    uint64_t v30 = v13;
    uint64_t v31 = v14;
    uint64_t v32 = v15;
    LOBYTE(v33) = v16;
    uint64_t v34 = v17;
    uint64_t v35 = v18;
    uint64_t v36 = v19;
    LOBYTE(v37) = v23;
    uint64_t v38 = v25;
    uint64_t v39 = v24;
    uint64_t v40 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E10);
    sub_254476F58();
    sub_25447F680();
    swift_release();
    sub_254472624(v14, v15, v16);
    swift_bridgeObjectRelease();
    sub_254472624(v18, v19, v23);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E08);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(a2, 0, 1, v20);
  }
  else
  {
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E08);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(a2, 1, 1, v22);
  }
}

uint64_t sub_2544767AC@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3 = a1 & 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1DA0);
  MEMORY[0x270FA5388](v4 - 8);
  int v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E20);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = (id)SFIndiaBISRegulatoryImage();
  sub_25447F690();
  uint64_t v11 = *MEMORY[0x263F1B510];
  uint64_t v12 = sub_25447F6D0();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v9, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
  uint64_t v26 = sub_25447F6C0();
  swift_release();
  sub_254474B60((uint64_t)v9, &qword_269DF1E20);
  sub_254476AAC(v3, (uint64_t)v27);
  uint64_t v15 = v27[0];
  uint64_t v14 = v27[1];
  LOBYTE(v13) = v28;
  uint64_t v16 = v30;
  uint64_t v25 = v29;
  uint64_t v17 = v31;
  LOBYTE(v12) = v32;
  uint64_t v18 = v33;
  uint64_t v19 = sub_25447F540();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v6, 1, 1, v19);
  uint64_t v20 = sub_25447F570();
  sub_254474B60((uint64_t)v6, &qword_269DF1DA0);
  uint64_t KeyPath = swift_getKeyPath();
  v24[1] = KeyPath;
  uint64_t v22 = v25;
  *(void *)a2 = v26;
  *(void *)(a2 + 8) = v15;
  *(void *)(a2 + 16) = v14;
  *(unsigned char *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v22;
  *(void *)(a2 + 40) = v16;
  *(void *)(a2 + 48) = v17;
  *(unsigned char *)(a2 + 56) = v12;
  *(void *)(a2 + 64) = v18;
  *(void *)(a2 + 72) = KeyPath;
  *(void *)(a2 + 80) = v20;
  swift_retain();
  sub_25447635C(v15, v14, v13);
  swift_bridgeObjectRetain();
  sub_25447635C(v16, v17, v12);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_254472624(v15, v14, v13);
  swift_bridgeObjectRelease();
  sub_254472624(v16, v17, v12);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_254476AAC@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3 = a1 & 1;
  uint64_t v4 = swift_retain();
  uint64_t v5 = sub_254479108(v4, v3);
  swift_release();
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  swift_release();
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = *(void *)(v5 + 32);
  swift_bridgeObjectRetain();
  swift_release();
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v8 = MEMORY[0x263F8EE78];
  *(void *)(a2 + 24) = MEMORY[0x263F8EE78];
  *(_OWORD *)(a2 + 32) = xmmword_2544808A0;
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = v8;
  sub_25447635C(v6, v7, 0);
  swift_bridgeObjectRetain();
  sub_25447635C(0x2E7369622E777777, 0xEE006E692E766F67, 0);
  swift_bridgeObjectRetain();
  sub_254472624(0x2E7369622E777777, 0xEE006E692E766F67, 0);
  swift_bridgeObjectRelease();
  sub_254472624(v6, v7, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_254476C34@<X0>(uint64_t a1@<X8>)
{
  return sub_2544764DC(*(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_254476C40@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 17);
  return result;
}

uint64_t sub_254476CE8()
{
  return swift_release();
}

uint64_t sub_254476DB8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  swift_release();
  uint64_t v4 = *(void *)(v3 + 32);
  *a2 = *(void *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_254476E64()
{
  return swift_bridgeObjectRelease();
}

unint64_t sub_254476F58()
{
  unint64_t result = qword_269DF1E18;
  if (!qword_269DF1E18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1E10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1E18);
  }
  return result;
}

uint64_t sub_254476FBC()
{
  return sub_25447D4E0(v0[2], v0[3], v0[4]);
}

uint64_t sub_254476FDC()
{
  return sub_25447D4D8(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_254477000()
{
  unint64_t result = qword_269DF1E28;
  if (!qword_269DF1E28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1E30);
    sub_254477074();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1E28);
  }
  return result;
}

unint64_t sub_254477074()
{
  unint64_t result = qword_269DF1E38;
  if (!qword_269DF1E38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1E08);
    sub_254476F58();
    sub_254475C58((unint64_t *)&qword_269DF1B98, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1E38);
  }
  return result;
}

ValueMetadata *type metadata accessor for IndonesiaAlertMarkDynamicLabel()
{
  return &type metadata for IndonesiaAlertMarkDynamicLabel;
}

uint64_t sub_254477130()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25447714C@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3 = a1 & 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E40);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E48);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_retain();
  uint64_t v12 = sub_254479108(v11, v3);
  swift_release();
  swift_getKeyPath();
  v17[1] = v12;
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  swift_release();
  int v13 = *(unsigned __int8 *)(v12 + 66);
  swift_release();
  if (v13 == 1)
  {
    *(void *)uint64_t v6 = sub_25447F430();
    *((void *)v6 + 1) = 0x3FF3333333333333;
    v6[16] = 0;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E50);
    sub_2544773AC((uint64_t)&v6[*(int *)(v14 + 44)]);
    sub_254477C20();
    sub_25447F680();
    sub_254474B60((uint64_t)v6, &qword_269DF1E40);
    sub_254472694((uint64_t)v10, a2, &qword_269DF1E48);
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v15, 1, v7);
}

uint64_t sub_2544773AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v49 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1DA0);
  MEMORY[0x270FA5388](v1 - 8);
  id v48 = (char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E60);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_25447F6E0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E68);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (uint64_t *)((char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E70) - 8;
  MEMORY[0x270FA5388](v47);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E78) - 8;
  uint64_t v17 = MEMORY[0x270FA5388](v46);
  uint64_t v50 = (uint64_t)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v51 = (uint64_t)&v42 - v19;
  uint64_t v20 = sub_25447F6A0();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F1B530], v7);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v6 + *(int *)(v4 + 36), v10, v7);
  *uint64_t v6 = KeyPath;
  sub_254477E1C((uint64_t)v6, (uint64_t)v14 + *(int *)(v12 + 44), &qword_269DF1E60);
  *uint64_t v14 = v20;
  swift_retain();
  sub_254474B60((uint64_t)v6, &qword_269DF1E60);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  uint64_t v22 = sub_25447F540();
  uint64_t v23 = *(void *)(v22 - 8);
  id v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v45 = v23 + 56;
  uint64_t v24 = (uint64_t)v48;
  v44(v48, 1, 1, v22);
  sub_25447F570();
  sub_254474B60(v24, &qword_269DF1DA0);
  sub_25447F560();
  uint64_t v25 = sub_25447F580();
  swift_release();
  uint64_t v26 = swift_getKeyPath();
  sub_254477E1C((uint64_t)v14, (uint64_t)v16, &qword_269DF1E68);
  uint64_t v27 = (uint64_t *)&v16[*(int *)(v47 + 44)];
  *uint64_t v27 = v26;
  v27[1] = v25;
  sub_254474B60((uint64_t)v14, &qword_269DF1E68);
  LOBYTE(v26) = sub_25447F510();
  uint64_t v28 = v50;
  sub_254477E1C((uint64_t)v16, v50, &qword_269DF1E70);
  uint64_t v29 = v28 + *(int *)(v46 + 44);
  *(unsigned char *)uint64_t v29 = v26;
  *(_OWORD *)(v29 + 8) = 0u;
  *(_OWORD *)(v29 + 24) = 0u;
  *(unsigned char *)(v29 + 40) = 1;
  sub_254474B60((uint64_t)v16, &qword_269DF1E70);
  uint64_t v30 = v51;
  sub_254472694(v28, v51, &qword_269DF1E78);
  sub_2544779B0((uint64_t)v52);
  uint64_t v31 = v52[0];
  uint64_t v32 = v52[1];
  LOBYTE(v10) = v53;
  uint64_t v33 = v54;
  uint64_t v43 = v56;
  LOBYTE(v4) = v57;
  uint64_t v46 = v55;
  uint64_t v47 = v58;
  sub_25447F550();
  v44((char *)v24, 1, 1, v22);
  uint64_t v34 = sub_25447F570();
  sub_254474B60(v24, &qword_269DF1DA0);
  uint64_t v35 = swift_getKeyPath();
  sub_254477E1C(v30, v28, &qword_269DF1E78);
  uint64_t v36 = v49;
  sub_254477E1C(v28, v49, &qword_269DF1E78);
  uint64_t v37 = v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269DF1E80) + 48);
  *(void *)uint64_t v37 = v31;
  *(void *)(v37 + 8) = v32;
  *(unsigned char *)(v37 + 16) = (_BYTE)v10;
  uint64_t v39 = v46;
  uint64_t v38 = v47;
  *(void *)(v37 + 24) = v33;
  *(void *)(v37 + 32) = v39;
  uint64_t v40 = v43;
  *(void *)(v37 + 40) = v43;
  *(unsigned char *)(v37 + 48) = v4;
  *(void *)(v37 + 56) = v38;
  *(void *)(v37 + 64) = v35;
  *(void *)(v37 + 72) = v34;
  sub_25447635C(v31, v32, (char)v10);
  swift_bridgeObjectRetain();
  sub_25447635C(v39, v40, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_254474B60(v51, &qword_269DF1E78);
  sub_254472624(v31, v32, (char)v10);
  swift_bridgeObjectRelease();
  sub_254472624(v39, v40, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_254474B60(v50, &qword_269DF1E78);
}

uint64_t sub_2544779B0@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0xD00000000000001CLL;
  *(void *)(a1 + 8) = 0x80000002544818C0;
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(a1 + 24) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 32) = 0xD000000000000015;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 40) = 0x80000002544818E0;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v1;
  sub_25447635C(0xD00000000000001CLL, 0x80000002544818C0, 0);
  swift_bridgeObjectRetain();
  sub_25447635C(0xD000000000000015, 0x80000002544818E0, 0);
  swift_bridgeObjectRetain();
  sub_254472624(0xD000000000000015, 0x80000002544818E0, 0);
  swift_bridgeObjectRelease();
  sub_254472624(0xD00000000000001CLL, 0x80000002544818C0, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_254477A94@<X0>(uint64_t a1@<X8>)
{
  return sub_25447714C(*(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_254477AA0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 66);
  return result;
}

uint64_t sub_254477B48()
{
  return swift_release();
}

unint64_t sub_254477C20()
{
  unint64_t result = qword_269DF1E58;
  if (!qword_269DF1E58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1E40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1E58);
  }
  return result;
}

uint64_t sub_254477C7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25447F390();
  *a1 = result;
  return result;
}

uint64_t sub_254477CA8()
{
  return sub_25447F3A0();
}

uint64_t sub_254477CD4()
{
  return sub_25447F370();
}

uint64_t sub_254477CF8(uint64_t a1)
{
  uint64_t v2 = sub_25447F6E0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_25447F380();
}

uint64_t sub_254477DC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25447F390();
  *a1 = result;
  return result;
}

uint64_t sub_254477DF0()
{
  return sub_25447F3A0();
}

uint64_t sub_254477E1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_254477E80()
{
  return sub_25447D578(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_254477EA4()
{
  unint64_t result = qword_269DF1E88;
  if (!qword_269DF1E88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1E90);
    sub_254477F18();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1E88);
  }
  return result;
}

unint64_t sub_254477F18()
{
  unint64_t result = qword_269DF1E98;
  if (!qword_269DF1E98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1E48);
    sub_254477C20();
    sub_254475C58((unint64_t *)&qword_269DF1B98, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1E98);
  }
  return result;
}

ValueMetadata *type metadata accessor for MonthAndYearOfManufactureDynamicLabel()
{
  return &type metadata for MonthAndYearOfManufactureDynamicLabel;
}

uint64_t sub_254477FD4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_254477FF0@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3 = a1 & 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1DA0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = swift_retain();
  uint64_t v8 = sub_254479108(v7, v3);
  swift_release();
  swift_getKeyPath();
  unint64_t v35 = v8;
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  swift_release();
  int v9 = *(unsigned __int8 *)(v8 + 65);
  swift_release();
  if (v9 == 1)
  {
    uint64_t v10 = swift_retain();
    uint64_t v11 = sub_254479108(v10, v3);
    swift_release();
    swift_getKeyPath();
    unint64_t v35 = v11;
    sub_25447F2A0();
    swift_release();
    uint64_t v12 = *(void *)(v11 + 48);
    swift_bridgeObjectRetain();
    swift_release();
    if (*(void *)(v12 + 16))
    {
      unint64_t v13 = sub_25447E628(0x68746E6F6DLL, 0xE500000000000000);
      if (v14)
      {
        id v15 = *(id *)(*(void *)(v12 + 56) + 8 * v13);
        swift_bridgeObjectRelease();
        uint64_t v16 = swift_retain();
        uint64_t v17 = sub_254479108(v16, v3);
        swift_release();
        swift_getKeyPath();
        unint64_t v35 = v17;
        sub_25447F2A0();
        swift_release();
        uint64_t v18 = *(void *)(v17 + 48);
        swift_bridgeObjectRetain();
        swift_release();
        if (*(void *)(v18 + 16))
        {
          unint64_t v19 = sub_25447E628(1918985593, 0xE400000000000000);
          if (v20)
          {
            id v21 = *(id *)(*(void *)(v18 + 56) + 8 * v19);
            swift_bridgeObjectRelease();
            unint64_t v35 = 0;
            unint64_t v36 = 0xE000000000000000;
            sub_25447F920();
            swift_bridgeObjectRelease();
            unint64_t v35 = 0x85EBB0A1EC9CA0ECLL;
            unint64_t v36 = 0xAE00203A949BEC84;
            id v22 = objc_msgSend(v15, sel_description);
            sub_25447F850();

            sub_25447F890();
            swift_bridgeObjectRelease();
            sub_25447F890();
            id v23 = objc_msgSend(v21, sel_description);
            sub_25447F850();

            sub_25447F890();
            swift_bridgeObjectRelease();
            uint64_t v24 = sub_25447F540();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v6, 1, 1, v24);
            sub_25447F570();
            sub_254475B40((uint64_t)v6);
            uint64_t v25 = sub_25447F5A0();
            uint64_t v27 = v26;
            LOBYTE(v23) = v28;
            uint64_t v30 = v29;
            swift_bridgeObjectRelease();
            swift_release();
            unint64_t v35 = v25;
            unint64_t v36 = v27;
            char v37 = v23 & 1;
            uint64_t v38 = v30;
            sub_25447F680();

            sub_254472624(v25, v27, v23 & 1);
            swift_bridgeObjectRelease();
            uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BA0);
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(a2, 0, 1, v31);
          }
        }
      }
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BA0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(a2, 1, 1, v33);
}

uint64_t sub_2544784BC@<X0>(uint64_t a1@<X8>)
{
  return sub_254477FF0(*(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_2544784C8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  swift_release();
  *a2 = *(void *)(v3 + 48);
  return swift_bridgeObjectRetain();
}

uint64_t sub_254478574()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_254478654@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 65);
  return result;
}

uint64_t sub_2544786FC()
{
  return swift_release();
}

uint64_t sub_2544787DC()
{
  return sub_25447D524(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2544787F8()
{
  return sub_25447D570(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

ValueMetadata *type metadata accessor for RegulatoryAndDynamicLabel()
{
  return &type metadata for RegulatoryAndDynamicLabel;
}

uint64_t sub_254478828()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_254478844@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  char v5 = a2 & 1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1EB8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  int v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v31 - v10;
  sub_254478AF0(a1, v5);
  type metadata accessor for LegalAndRegulatorySettingsListState();
  sub_254478F7C();
  uint64_t v36 = sub_25447F2F0();
  int v37 = v12;
  uint64_t v13 = sub_25447F2F0();
  int v35 = v14;
  uint64_t v15 = sub_25447F2F0();
  int v34 = v16;
  uint64_t v17 = sub_25447F2F0();
  int v33 = v18;
  uint64_t v19 = sub_25447F2F0();
  int v32 = v20;
  uint64_t v21 = sub_25447F2F0();
  LOBYTE(a1) = v22;
  uint64_t v38 = v9;
  sub_254477E1C((uint64_t)v11, (uint64_t)v9, &qword_269DF1EB8);
  sub_254477E1C((uint64_t)v9, a3, &qword_269DF1EB8);
  id v23 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_269DF1EC0);
  uint64_t v24 = a3 + v23[12];
  *(void *)uint64_t v24 = v36;
  *(unsigned char *)(v24 + 8) = v37 & 1;
  uint64_t v25 = a3 + v23[16];
  *(void *)uint64_t v25 = v13;
  *(unsigned char *)(v25 + 8) = v35 & 1;
  uint64_t v26 = a3 + v23[20];
  *(void *)uint64_t v26 = v15;
  *(unsigned char *)(v26 + 8) = v34 & 1;
  uint64_t v27 = a3 + v23[24];
  *(void *)uint64_t v27 = v17;
  *(unsigned char *)(v27 + 8) = v33 & 1;
  uint64_t v28 = a3 + v23[28];
  *(void *)uint64_t v28 = v19;
  *(unsigned char *)(v28 + 8) = v32 & 1;
  uint64_t v29 = a3 + v23[32];
  *(void *)uint64_t v29 = v21;
  *(unsigned char *)(v29 + 8) = a1 & 1;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_254474B60((uint64_t)v11, &qword_269DF1EB8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return sub_254474B60((uint64_t)v38, &qword_269DF1EB8);
}

uint64_t sub_254478AF0(uint64_t a1, char a2)
{
  char v2 = a2 & 1;
  uint64_t v3 = sub_25447F6B0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1EB8);
  MEMORY[0x270FA5388](v7);
  int v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_retain();
  uint64_t v11 = sub_254479108(v10, v2);
  swift_release();
  swift_getKeyPath();
  uint64_t v23 = v11;
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  id v12 = *(id *)(v11 + 88);
  swift_release();
  sub_25447F690();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F1B4B8], v3);
  uint64_t v13 = sub_25447F6F0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  char v14 = sub_25447F530();
  uint64_t v23 = v13;
  uint64_t v24 = 0;
  __int16 v25 = 1;
  char v26 = v14;
  long long v27 = 0u;
  long long v28 = 0u;
  char v29 = 1;
  sub_25447F400();
  if (qword_269DF1AA0 != -1) {
    swift_once();
  }
  id v15 = (id)qword_269DF2EE0;
  uint64_t v16 = sub_25447F5B0();
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1EC8);
  sub_254479B58(&qword_269DF1ED0, &qword_269DF1EC8, (void (*)(void))sub_2544792EC);
  sub_25447F650();
  sub_254472624(v16, v18, v20);
  swift_release();
  swift_bridgeObjectRelease();
  sub_25447F350();
  return sub_254474B60((uint64_t)v9, &qword_269DF1EB8);
}

uint64_t sub_254478E74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1EA0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)v1;
  char v7 = *(unsigned char *)(v1 + 8);
  *(void *)uint64_t v5 = sub_25447F430();
  *((void *)v5 + 1) = 0x4028000000000000;
  v5[16] = 0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1EA8);
  sub_254478844(v6, v7, (uint64_t)&v5[*(int *)(v8 + 44)]);
  char v9 = sub_25447F510();
  sub_254477E1C((uint64_t)v5, a1, &qword_269DF1EA0);
  uint64_t v10 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269DF1EB0) + 36);
  *(unsigned char *)uint64_t v10 = v9;
  *(_OWORD *)(v10 + 8) = 0u;
  *(_OWORD *)(v10 + 24) = 0u;
  *(unsigned char *)(v10 + 40) = 1;
  return sub_254474B60((uint64_t)v5, &qword_269DF1EA0);
}

unint64_t sub_254478F7C()
{
  unint64_t result = qword_269DF1B58;
  if (!qword_269DF1B58)
  {
    type metadata accessor for LegalAndRegulatorySettingsListState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1B58);
  }
  return result;
}

id sub_254478FD4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 88);
  *a2 = v4;
  return v4;
}

void sub_25447905C(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_254478F7C();
  id v2 = v1;
  sub_25447F290();
  swift_release();
}

uint64_t sub_254479108(uint64_t a1, char a2)
{
  uint64_t v4 = sub_25447F3E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = sub_25447F8D0();
    char v9 = sub_25447F4E0();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v14 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_254479610(0xD000000000000023, 0x80000002544819B0, &v14);
      _os_log_impl(&dword_25446B000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A27B210](v11, -1, -1);
      MEMORY[0x25A27B210](v10, -1, -1);
    }

    sub_25447F3D0();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

unint64_t sub_2544792EC()
{
  unint64_t result = qword_269DF1ED8;
  if (!qword_269DF1ED8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1EE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1ED8);
  }
  return result;
}

void sub_254479360()
{
  sub_25447D5C4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_25447937C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25447F3E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1D00);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_254477E1C(v2, (uint64_t)v10, &qword_269DF1D00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_25447F330();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_25447F8D0();
    uint64_t v14 = sub_25447F4E0();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_254479610(0x414C52556E65704FLL, 0xED00006E6F697463, &v18);
      _os_log_impl(&dword_25446B000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A27B210](v16, -1, -1);
      MEMORY[0x25A27B210](v15, -1, -1);
    }

    sub_25447F3D0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_254479610(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_2544796E4(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_254479834((uint64_t)v12, *a3);
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
      sub_254479834((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_2544796E4(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_254479890(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_25447F940();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
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

uint64_t sub_254479834(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_254479890(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_254479928(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_254479A2C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_254479A2C((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_254479928(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_2544799C4(v2, 0);
      uint64_t result = sub_25447F930();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_25447F8A0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2544799C4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1EE8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_254479A2C(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1EE8);
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
  os_log_type_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_254479B1C()
{
  return sub_254479B58(&qword_269DF1EF0, &qword_269DF1EB0, (void (*)(void))sub_254479BD8);
}

uint64_t sub_254479B58(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_254479BD8()
{
  unint64_t result = qword_269DF1EF8;
  if (!qword_269DF1EF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1EA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1EF8);
  }
  return result;
}

ValueMetadata *type metadata accessor for YearOfManufactureDynamicLabel()
{
  return &type metadata for YearOfManufactureDynamicLabel;
}

uint64_t sub_254479C44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_254479C60@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v3 = a1 & 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1DA0);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = swift_retain();
  uint64_t v8 = sub_254479108(v7, v3);
  swift_release();
  swift_getKeyPath();
  unint64_t v26 = v8;
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  swift_release();
  int v9 = *(unsigned __int8 *)(v8 + 40);
  swift_release();
  if (v9 != 1) {
    goto LABEL_4;
  }
  uint64_t v10 = swift_retain();
  uint64_t v11 = sub_254479108(v10, v3);
  swift_release();
  swift_getKeyPath();
  unint64_t v26 = v11;
  sub_25447F2A0();
  swift_release();
  uint64_t v12 = *(void *)(v11 + 56);
  swift_release();
  if (v12)
  {
    unint64_t v26 = 0xB9E5A080E9BDA3E8;
    unint64_t v27 = 0xAD000020BDBBE4B4;
    uint64_t v13 = swift_retain();
    uint64_t v14 = sub_254479108(v13, v3);
    swift_release();
    swift_getKeyPath();
    uint64_t v30 = v14;
    sub_25447F2A0();
    swift_release();
    uint64_t v15 = *(void *)(v14 + 56);
    swift_release();
    uint64_t v30 = v15;
    sub_25447F980();
    sub_25447F890();
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_25447F540();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
    sub_25447F570();
    sub_254475B40((uint64_t)v6);
    uint64_t v17 = sub_25447F5A0();
    uint64_t v19 = v18;
    LOBYTE(v15) = v20;
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    swift_release();
    unint64_t v26 = v17;
    unint64_t v27 = v19;
    char v28 = v15 & 1;
    uint64_t v29 = v22;
    sub_25447F680();
    sub_254472624(v17, v19, v15 & 1);
    swift_bridgeObjectRelease();
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BA0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(a2, 0, 1, v23);
  }
  else
  {
LABEL_4:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BA0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(a2, 1, 1, v25);
  }
}

uint64_t sub_25447A020@<X0>(uint64_t a1@<X8>)
{
  return sub_254479C60(*(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_25447A02C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 40);
  return result;
}

uint64_t sub_25447A0D4()
{
  return swift_release();
}

uint64_t sub_25447A1A4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  uint64_t result = swift_release();
  *a2 = *(void *)(v3 + 56);
  return result;
}

uint64_t sub_25447A24C()
{
  return swift_release();
}

uint64_t sub_25447A328()
{
  return sub_25447D560(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25447A344()
{
  return sub_25447D51C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

ValueMetadata *type metadata accessor for DeviceSerialNumberQRCodeImage()
{
  return &type metadata for DeviceSerialNumberQRCodeImage;
}

uint64_t sub_25447A374()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25447A390()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1F00);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25447F430();
  id v4 = objc_msgSend(self, sel_currentDevice);
  id v5 = objc_msgSend(v4, sel_sf_serialNumberQRImage);

  uint64_t v6 = sub_25447F690();
  char v7 = sub_25447F530();
  uint64_t v16 = v3;
  uint64_t v17 = 0;
  char v18 = 1;
  uint64_t v19 = v6;
  char v20 = v7;
  long long v21 = 0u;
  long long v22 = 0u;
  char v23 = 1;
  sub_25447F7D0();
  sub_25447A698(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v24, 0.0, 1, 0.0, 1);
  swift_release();
  v15[9] = v24[8];
  v15[10] = v24[9];
  v15[11] = v24[10];
  v15[12] = v24[11];
  v15[5] = v24[4];
  v15[6] = v24[5];
  v15[7] = v24[6];
  v15[8] = v24[7];
  v15[1] = v24[0];
  v15[2] = v24[1];
  v15[3] = v24[2];
  v15[4] = v24[3];
  sub_25447F400();
  if (qword_269DF1AA0 != -1) {
    swift_once();
  }
  id v8 = (id)qword_269DF2EE0;
  uint64_t v9 = sub_25447F5B0();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1F08);
  sub_25447A88C(&qword_269DF1F10, &qword_269DF1F08, (void (*)(void))sub_25447A85C);
  sub_25447F630();
  sub_254472624(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_25447A964((uint64_t)v24);
  sub_25447F350();
  return sub_25447A990((uint64_t)v2);
}

uint64_t sub_25447A698@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_25447F8D0();
    char v23 = (void *)sub_25447F4E0();
    sub_25447F2D0();
  }
  sub_25447F360();
  long long v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  *(_OWORD *)((char *)a9 + 57) = *(_OWORD *)((char *)v13 + 57);
  long long v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  a9[9] = v31;
  a9[10] = v32;
  a9[11] = v33;
  a9[5] = v27;
  a9[6] = v28;
  a9[7] = v29;
  a9[8] = v30;
  return sub_25447A9F0((uint64_t)v13);
}

uint64_t sub_25447A85C()
{
  return sub_25447A88C(&qword_269DF1F18, &qword_269DF1F20, (void (*)(void))sub_25447A908);
}

uint64_t sub_25447A88C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_25447A908()
{
  unint64_t result = qword_269DF1F28;
  if (!qword_269DF1F28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1F30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1F28);
  }
  return result;
}

uint64_t sub_25447A964(uint64_t a1)
{
  return a1;
}

uint64_t sub_25447A990(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1F00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25447A9F0(uint64_t a1)
{
  return a1;
}

unint64_t sub_25447AA20()
{
  unint64_t result = qword_269DF1F38;
  if (!qword_269DF1F38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269DF1F00);
    sub_25447A88C(&qword_269DF1F10, &qword_269DF1F08, (void (*)(void))sub_25447A85C);
    sub_25447AAC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1F38);
  }
  return result;
}

unint64_t sub_25447AAC8()
{
  unint64_t result = qword_269DF1B98;
  if (!qword_269DF1B98)
  {
    sub_25447F4C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1B98);
  }
  return result;
}

uint64_t sub_25447AB20()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for FindLegalAndRegulatorySettingsSupportClass()
{
  return self;
}

id sub_25447AB54()
{
  type metadata accessor for FindLegalAndRegulatorySettingsSupportClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269DF2EE0 = (uint64_t)result;
  return result;
}

uint64_t sub_25447ABAC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  sub_25447F2A0();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_25447AC54()
{
  return swift_release();
}

uint64_t LegalAndRegulatorySettingsList.init(legalAndRegulatorySettingsListState:)()
{
  uint64_t v0 = sub_25447F280();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25447F1F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25447F830();
  MEMORY[0x270FA5388](v5 - 8);
  type metadata accessor for LegalAndRegulatorySettingsList();
  sub_25447F820();
  if (qword_269DF1AA0 != -1) {
    swift_once();
  }
  id v6 = objc_msgSend((id)qword_269DF2EE0, sel_bundleURL);
  sub_25447F240();

  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F06D20], v1);
  sub_25447F270();
  sub_25447F210();
  type metadata accessor for LegalAndRegulatorySettingsListState();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  return sub_25447F7A0();
}

uint64_t type metadata accessor for LegalAndRegulatorySettingsList()
{
  uint64_t result = qword_269DF1F78;
  if (!qword_269DF1F78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LegalAndRegulatorySettingsList.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1CF8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v55 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_25447F260();
  uint64_t v54 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v47 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25447F7E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char **)((char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B50);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1F40);
  uint64_t v39 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1F48);
  uint64_t v48 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v42 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1F50);
  uint64_t v50 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  id v44 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1F58);
  uint64_t v43 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v40 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25447F790();
  swift_getKeyPath();
  sub_25447F7B0();
  swift_release();
  char v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v41 = v9;
  v18(v12, v9);
  uint64_t v62 = v58;
  uint64_t v63 = v59;
  char v64 = v60;
  uint64_t v57 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1F60);
  sub_25446D2B0();
  sub_254476318(&qword_269DF1F68, &qword_269DF1F60);
  int v37 = v14;
  sub_25447F590();
  *uint64_t v8 = 0xD00000000000002BLL;
  v8[1] = 0x8000000254481B70;
  uint64_t v19 = *MEMORY[0x263F67E48];
  uint64_t v46 = v6;
  char v20 = *(void (**)(void *, uint64_t, uint64_t))(v6 + 104);
  uint64_t v49 = v5;
  v20(v8, v19, v5);
  sub_25447BDDC();
  long long v21 = v55;
  sub_25447F250();
  uint64_t v22 = v54;
  uint64_t v23 = v56;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v54 + 48))(v21, 1);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for LegalAndRegulatorySettingsList();
    long long v25 = v47;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v47, v21, v23);
    uint64_t v26 = sub_254476318(&qword_269DF1F70, &qword_269DF1F40);
    long long v27 = v42;
    uint64_t v28 = v38;
    long long v29 = v37;
    sub_25447F5E0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v23);
    (*(void (**)(void *, uint64_t))(v46 + 8))(v8, v49);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v29, v28);
    sub_25447F780();
    uint64_t v30 = type metadata accessor for LegalAndRegulatorySettingsListState();
    uint64_t v58 = v28;
    uint64_t v59 = v26;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v32 = sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
    long long v33 = v44;
    uint64_t v34 = v51;
    sub_25447F610();
    swift_release();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v27, v34);
    uint64_t v58 = v34;
    uint64_t v59 = v30;
    uint64_t v60 = OpaqueTypeConformance2;
    uint64_t v61 = v32;
    swift_getOpaqueTypeConformance2();
    int v35 = v40;
    uint64_t v36 = v52;
    sub_25447F5D0();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v33, v36);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v43 + 32))(v53, v35, v45);
  }
  return result;
}

uint64_t sub_25447B808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v50 = a2;
  uint64_t v48 = (void (*)(char *, char *, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BA0);
  MEMORY[0x270FA5388](v48);
  uint64_t v46 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1F98);
  uint64_t v44 = *(void *)(v49 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v49);
  uint64_t v51 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v41 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1FA0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v47 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v52 = (char *)&v41 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1FA8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v53 = (uint64_t)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v41 - v15;
  uint64_t v17 = self;
  id v18 = objc_msgSend(v17, sel_currentDevice);
  unsigned int v19 = objc_msgSend(v18, sel_sf_isCarrierInstall);

  if (v19
    && (id v20 = objc_msgSend(v17, sel_currentDevice),
        unsigned __int8 v21 = objc_msgSend(v20, sel_sf_isInternalInstall),
        v20,
        (v21 & 1) == 0))
  {
    sub_25447CDCC();
    sub_25447F770();
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1FB0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v16, 0, 1, v23);
  }
  else
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1FB0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v16, 1, 1, v22);
  }
  uint64_t v43 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B50);
  sub_25447F780();
  uint64_t v24 = sub_25447EFF8();
  swift_release();
  uint64_t v54 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1FB8);
  sub_254476318(&qword_269DF1FC0, &qword_269DF1FB8);
  sub_25447CC08();
  sub_25447CC5C();
  long long v25 = v52;
  sub_25447F750();
  sub_25447C10C();
  sub_254472EA4();
  sub_25447CCB0();
  sub_25447F760();
  uint64_t v26 = v53;
  sub_25447CD04((uint64_t)v16, v53);
  uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  long long v27 = v47;
  v48(v47, v25, v7);
  uint64_t v28 = v44;
  long long v29 = v6;
  uint64_t v42 = v6;
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  uint64_t v31 = v49;
  v30(v51, v29, v49);
  uint64_t v32 = v26;
  uint64_t v33 = v28;
  uint64_t v34 = v50;
  sub_25447CD04(v32, v50);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1FE0);
  v48((char *)(v34 + *(int *)(v35 + 48)), v27, v7);
  uint64_t v36 = v34 + *(int *)(v35 + 64);
  int v37 = v51;
  v30((char *)v36, v51, v31);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v33 + 8);
  v38(v42, v31);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v8 + 8);
  v39(v52, v7);
  sub_25447CD6C((uint64_t)v43);
  v38(v37, v31);
  v39(v27, v7);
  return sub_25447CD6C(v53);
}

uint64_t sub_25447BDC0@<X0>(uint64_t a1@<X8>)
{
  return sub_25447B808(*(void *)(v1 + 16), a1);
}

uint64_t sub_25447BDC8@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v2 = *a1;
  uint64_t v3 = *((void *)a1 + 1);
  *(unsigned char *)a2 = v2;
  *(void *)(a2 + 8) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_25447BDDC()
{
  uint64_t v0 = sub_25447F280();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_25447F1F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25447F830();
  MEMORY[0x270FA5388](v5 - 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1F90);
  sub_25447F200();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_254480D70;
  sub_25447F820();
  if (qword_269DF1AA0 != -1) {
    swift_once();
  }
  id v7 = objc_msgSend((id)qword_269DF2EE0, sel_bundleURL);
  sub_25447F240();

  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F06D20], v1);
  sub_25447F270();
  sub_25447F210();
  return v6;
}

uint64_t sub_25447C074()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_25447C090@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for LegalAndRegulatorySettingsListState();
  sub_254475C58((unint64_t *)&qword_269DF1B58, (void (*)(uint64_t))type metadata accessor for LegalAndRegulatorySettingsListState);
  uint64_t result = sub_25447F2F0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_25447C10C()
{
  uint64_t v0 = sub_25447F420();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  char v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25447F400();
  if (qword_269DF1AA0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_269DF2EE0;
  uint64_t v10 = sub_25447F5B0();
  uint64_t v11 = v5;
  char v12 = v6 & 1;
  uint64_t v13 = v7;
  sub_25447F410();
  sub_25447F670();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_254472624(v10, v11, v12);
  return swift_bridgeObjectRelease();
}

uint64_t *initializeBufferWithCopyOfBuffer for LegalAndRegulatorySettingsList(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B50);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25447F200();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_25447F200();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25447F200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25447F200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25447F200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_25447F200();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25447C790);
}

uint64_t sub_25447C790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B50);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_25447F200();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for LegalAndRegulatorySettingsList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25447C8A0);
}

uint64_t sub_25447C8A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1B50);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_25447F200();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_25447C9A8()
{
  sub_25447CA70();
  if (v0 <= 0x3F)
  {
    sub_25447F200();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_25447CA70()
{
  if (!qword_269DF1F88)
  {
    type metadata accessor for LegalAndRegulatorySettingsListState();
    unint64_t v0 = sub_25447F7C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269DF1F88);
    }
  }
}

uint64_t sub_25447CAC8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_25447CC08()
{
  unint64_t result = qword_269DF1FC8;
  if (!qword_269DF1FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1FC8);
  }
  return result;
}

unint64_t sub_25447CC5C()
{
  unint64_t result = qword_269DF1FD0;
  if (!qword_269DF1FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1FD0);
  }
  return result;
}

unint64_t sub_25447CCB0()
{
  unint64_t result = qword_269DF1FD8;
  if (!qword_269DF1FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1FD8);
  }
  return result;
}

uint64_t sub_25447CD04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1FA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25447CD6C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1FA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25447CDCC()
{
  unint64_t result = qword_269DF1FE8;
  if (!qword_269DF1FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DF1FE8);
  }
  return result;
}

uint64_t sub_25447CE20()
{
  return sub_25447D4D0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

unint64_t sub_25447CE40(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF2018);
  uint64_t v2 = (void *)sub_25447F960();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_25447E628(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

uint64_t sub_25447CF5C()
{
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_25447CFCC()
{
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 67);
}

uint64_t sub_25447D03C()
{
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25447D0BC()
{
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t sub_25447D12C()
{
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_25447D19C()
{
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25447D21C()
{
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 66);
}

uint64_t sub_25447D28C()
{
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 65);
}

uint64_t sub_25447D2FC()
{
  return swift_bridgeObjectRetain();
}

id sub_25447D370()
{
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 88);
  return v1;
}

uint64_t sub_25447D3F0()
{
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t sub_25447D460()
{
  swift_getKeyPath();
  sub_254478F7C();
  sub_25447F2A0();
  swift_release();
  return *(void *)(v0 + 56);
}

uint64_t sub_25447D4D0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

uint64_t sub_25447D4D8(uint64_t result, char a2)
{
  *(unsigned char *)(result + 17) = a2;
  return result;
}

uint64_t sub_25447D4E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25447D51C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

uint64_t sub_25447D524(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 48) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25447D560(uint64_t result, uint64_t a2)
{
  *(void *)(result + 56) = a2;
  return result;
}

uint64_t sub_25447D568(uint64_t result, char a2)
{
  *(unsigned char *)(result + 64) = a2;
  return result;
}

uint64_t sub_25447D570(uint64_t result, char a2)
{
  *(unsigned char *)(result + 65) = a2;
  return result;
}

uint64_t sub_25447D578(uint64_t result, char a2)
{
  *(unsigned char *)(result + 66) = a2;
  return result;
}

uint64_t sub_25447D580(uint64_t result, char a2)
{
  *(unsigned char *)(result + 67) = a2;
  return result;
}

uint64_t sub_25447D588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 72) = a2;
  *(void *)(a1 + 80) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_25447D5C4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 88);
  *(void *)(a1 + 88) = a2;
  id v3 = a2;
}

void *sub_25447D5F8()
{
  uint64_t v0 = type metadata accessor for LegalDocumentModel(0);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = (id)SFAcknowledgementsDocumentFilePath();
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v6 = v4;
    sub_25447F850();

    sub_25447F220();
    swift_bridgeObjectRelease();
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    swift_storeEnumTagMultiPayload();
    *id v3 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF2028);
    unint64_t v7 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    size_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_254480D70;
    sub_25447F10C((uint64_t)v3, v8 + v7);
    uint64_t v55 = v5;
    sub_25447EA30(v8);
    uint64_t v5 = v55;
  }
  id v9 = (id)SFLicenseFilePath();
  sub_25447F850();

  sub_25447F220();
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  swift_storeEnumTagMultiPayload();
  *id v3 = 1;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF2028);
  uint64_t v12 = *(void *)(v1 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = v13 | 7;
  uint64_t v51 = v14 + v12;
  uint64_t v16 = swift_allocObject();
  long long v54 = xmmword_254480D70;
  *(_OWORD *)(v16 + 16) = xmmword_254480D70;
  uint64_t v49 = v16;
  sub_25447F10C((uint64_t)v3, v16 + v14);
  id v17 = (id)SFWarrantyFilePath();
  uint64_t v50 = v5;
  uint64_t v52 = v11;
  uint64_t v53 = v10;
  if (!v17)
  {
    uint64_t v19 = v15;
    uint64_t v48 = MEMORY[0x263F8EE78];
    if (SFShouldShowRoHSCompliance()) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v25 = MEMORY[0x263F8EE78];
    goto LABEL_9;
  }
  id v18 = v17;
  sub_25447F850();

  sub_25447F220();
  swift_bridgeObjectRelease();
  swift_storeEnumTagMultiPayload();
  *id v3 = 2;
  uint64_t v19 = v15;
  size_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = v54;
  sub_25447F10C((uint64_t)v3, v20 + v14);
  uint64_t v55 = MEMORY[0x263F8EE78];
  sub_25447EA30(v20);
  uint64_t v48 = v55;
  if (!SFShouldShowRoHSCompliance()) {
    goto LABEL_8;
  }
LABEL_5:
  id v21 = (id)SFRoHSComplianceDocumentFilePath();
  uint64_t v22 = MEMORY[0x263F8EE78];
  if (!v21)
  {
    uint64_t v47 = MEMORY[0x263F8EE78];
    goto LABEL_10;
  }
  uint64_t v23 = v21;
  sub_25447F850();

  sub_25447F220();
  swift_bridgeObjectRelease();
  swift_storeEnumTagMultiPayload();
  *id v3 = 4;
  size_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = v54;
  sub_25447F10C((uint64_t)v3, v24 + v14);
  uint64_t v55 = v22;
  sub_25447EA30(v24);
  uint64_t v25 = v55;
LABEL_9:
  uint64_t v47 = v25;
LABEL_10:
  uint64_t v26 = (uint64_t *)&v3[*(int *)(v0 + 20)];
  id v27 = (id)SFRFExposureDocumentHTMLString();
  uint64_t v28 = sub_25447F850();
  uint64_t v30 = v29;

  *uint64_t v26 = v28;
  v26[1] = v30;
  swift_storeEnumTagMultiPayload();
  *id v3 = 3;
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = v54;
  sub_25447F10C((uint64_t)v3, v31 + v14);
  unint64_t result = (void *)SFShouldShowBuiltInApps();
  if (result)
  {
    uint64_t v46 = v19;
    unint64_t result = (id)SFBuiltInAppsDocumentFilePath();
    uint64_t v33 = MEMORY[0x263F8EE78];
    if (result)
    {
      uint64_t v34 = result;
      sub_25447F850();

      sub_25447F220();
      swift_bridgeObjectRelease();
      swift_storeEnumTagMultiPayload();
      *id v3 = 5;
      size_t v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = v54;
      sub_25447F10C((uint64_t)v3, v35 + v14);
      uint64_t v55 = v33;
      unint64_t result = (void *)sub_25447EA30(v35);
      uint64_t v33 = v55;
    }
  }
  else
  {
    uint64_t v33 = MEMORY[0x263F8EE78];
  }
  *(void *)&long long v54 = v57;
  v57[0] = v50;
  v57[1] = v49;
  v57[2] = v48;
  v57[3] = v47;
  v57[4] = v31;
  v57[5] = v33;
  uint64_t v36 = 32;
  int v37 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v38 = *(void *)&v56[v36];
    uint64_t v39 = *(void *)(v38 + 16);
    int64_t v40 = v37[2];
    int64_t v41 = v40 + v39;
    if (__OFADD__(v40, v39)) {
      break;
    }
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
    if (result && v41 <= v37[3] >> 1)
    {
      if (*(void *)(v38 + 16)) {
        goto LABEL_26;
      }
    }
    else
    {
      if (v40 <= v41) {
        int64_t v42 = v40 + v39;
      }
      else {
        int64_t v42 = v40;
      }
      unint64_t result = (void *)sub_25447EC5C((size_t)result, v42, 1, v37);
      int v37 = result;
      if (*(void *)(v38 + 16))
      {
LABEL_26:
        if ((v37[3] >> 1) - v37[2] < v39) {
          goto LABEL_34;
        }
        unint64_t result = (void *)swift_arrayInitWithCopy();
        if (v39)
        {
          uint64_t v43 = v37[2];
          BOOL v44 = __OFADD__(v43, v39);
          uint64_t v45 = v43 + v39;
          if (v44) {
            goto LABEL_35;
          }
          v37[2] = v45;
        }
        goto LABEL_16;
      }
    }
    if (v39) {
      goto LABEL_33;
    }
LABEL_16:
    unint64_t result = (void *)swift_bridgeObjectRelease();
    v36 += 8;
    if (v36 == 80)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BC8);
      swift_arrayDestroy();
      return v37;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

size_t sub_25447DC00()
{
  uint64_t v0 = type metadata accessor for LegalDocumentModel(0);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = (id)SFAudioAccessoryAcknowledgementsDocumentFilePath();
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v6 = v4;
    sub_25447F850();

    sub_25447F220();
    swift_bridgeObjectRelease();
    type metadata accessor for LegalDocumentModel.DocumentType(0);
    swift_storeEnumTagMultiPayload();
    *id v3 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF2028);
    unint64_t v7 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    size_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_254480D70;
    sub_25447F10C((uint64_t)v3, v8 + v7);
    uint64_t v44 = v5;
    sub_25447EA30(v8);
    uint64_t v5 = v44;
  }
  id v9 = (id)SFAudioAccessoryLicenseFilePath();
  sub_25447F850();
  uint64_t v43 = v0;

  sub_25447F220();
  swift_bridgeObjectRelease();
  uint64_t v41 = type metadata accessor for LegalDocumentModel.DocumentType(0);
  swift_storeEnumTagMultiPayload();
  *id v3 = 7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF2028);
  unint64_t v11 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v42 = *(void *)(v1 + 72);
  uint64_t v12 = swift_allocObject();
  long long v40 = xmmword_254480D70;
  *(_OWORD *)(v12 + 16) = xmmword_254480D70;
  sub_25447F10C((uint64_t)v3, v12 + v11);
  id v13 = (id)SFAudioAccessoryWarrantyFilePath();
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (v13)
  {
    uint64_t v15 = v13;
    sub_25447F850();
    v39[1] = v10;

    sub_25447F220();
    swift_bridgeObjectRelease();
    swift_storeEnumTagMultiPayload();
    *id v3 = 8;
    size_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = v40;
    sub_25447F10C((uint64_t)v3, v16 + v11);
    uint64_t v44 = v14;
    sub_25447EA30(v16);
    uint64_t v14 = v44;
  }
  uint64_t v45 = v5;
  uint64_t v46 = v12;
  uint64_t v47 = v14;
  int64_t v17 = *(void *)(v5 + 16);
  swift_bridgeObjectRetain();
  size_t result = sub_25447EC5C(0, v17, 1, MEMORY[0x263F8EE78]);
  uint64_t v19 = (void *)result;
  if (*(void *)(v5 + 16))
  {
    if ((*(void *)(result + 24) >> 1) - *(void *)(result + 16) < v17)
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    size_t result = swift_arrayInitWithCopy();
    if (v17)
    {
      uint64_t v20 = v19[2];
      BOOL v21 = __OFADD__(v20, v17);
      uint64_t v22 = v20 + v17;
      if (v21)
      {
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
      v19[2] = v22;
    }
  }
  else if (v17)
  {
    __break(1u);
    goto LABEL_39;
  }
  swift_bridgeObjectRelease();
  uint64_t v23 = v46;
  int64_t v24 = *(void *)(v46 + 16);
  int64_t v25 = v19[2];
  int64_t v26 = v25 + v24;
  if (__OFADD__(v25, v24))
  {
    __break(1u);
LABEL_19:
    if (v25 <= v26) {
      int64_t v30 = v25 + v24;
    }
    else {
      int64_t v30 = v25;
    }
    size_t result = sub_25447EC5C(1uLL, v30, 1, v19);
    uint64_t v19 = (void *)result;
    int64_t v25 = *(void *)(result + 16);
    if (*(void *)(v23 + 16)) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
  unint64_t v27 = v19[3];
  size_t result = swift_bridgeObjectRetain();
  if (v26 > (uint64_t)(v27 >> 1)) {
    goto LABEL_19;
  }
  if (!v24)
  {
LABEL_23:
    if (!v24) {
      goto LABEL_24;
    }
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_14:
  if ((v19[3] >> 1) - v25 < v24)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  size_t result = swift_arrayInitWithCopy();
  if (v24)
  {
    uint64_t v28 = v19[2];
    BOOL v21 = __OFADD__(v28, v24);
    uint64_t v29 = v28 + v24;
    if (v21)
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    v19[2] = v29;
  }
LABEL_24:
  swift_bridgeObjectRelease();
  uint64_t v31 = v47;
  int64_t v32 = *(void *)(v47 + 16);
  int64_t v33 = v19[2];
  int64_t v34 = v33 + v32;
  if (__OFADD__(v33, v32))
  {
    __break(1u);
  }
  else
  {
    unint64_t v35 = v19[3];
    size_t result = swift_bridgeObjectRetain();
    if (v34 <= (uint64_t)(v35 >> 1))
    {
      if (v32) {
        goto LABEL_27;
      }
      goto LABEL_36;
    }
  }
  if (v33 <= v34) {
    int64_t v38 = v33 + v32;
  }
  else {
    int64_t v38 = v33;
  }
  size_t result = sub_25447EC5C(1uLL, v38, 1, v19);
  uint64_t v19 = (void *)result;
  int64_t v33 = *(void *)(result + 16);
  if (!*(void *)(v31 + 16))
  {
LABEL_36:
    if (!v32) {
      goto LABEL_37;
    }
    goto LABEL_40;
  }
LABEL_27:
  if ((v19[3] >> 1) - v33 < v32)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  size_t result = swift_arrayInitWithCopy();
  if (!v32)
  {
LABEL_37:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1BC8);
    swift_arrayDestroy();
    return (size_t)v19;
  }
  uint64_t v36 = v19[2];
  BOOL v21 = __OFADD__(v36, v32);
  uint64_t v37 = v36 + v32;
  if (!v21)
  {
    v19[2] = v37;
    goto LABEL_37;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t LegalAndRegulatorySettingsListState.__allocating_init()()
{
  char v23 = SFShouldShowIndiaBIS();
  id v0 = (id)SFIndiaBISNumber();
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = sub_25447F850();
    unint64_t v21 = v3;
    uint64_t v22 = v2;
  }
  else
  {
    unint64_t v21 = 0xE000000000000000;
    uint64_t v22 = 0;
  }
  char v20 = SFShouldShowYearOfManufacture();
  id v4 = self;
  id v5 = objc_msgSend(v4, sel_currentDevice);
  id v6 = objc_msgSend(v5, sel_sf_monthAndYearOfManufacture);

  if (v6)
  {
    sub_25447E314();
    unint64_t v7 = sub_25447F7F0();
  }
  else
  {
    unint64_t v7 = sub_25447CE40(MEMORY[0x263F8EE78]);
  }
  id v8 = objc_msgSend(v4, sel_currentDevice);
  id v9 = objc_msgSend(v8, sel_sf_yearOfManufacture);

  char v10 = SFShouldShowEyesightWarning();
  char v11 = SFShouldShowMonthOfManufacture();
  char v12 = SFShouldShowAlertMark();
  LOBYTE(v8) = SFShouldShowCountryOfOrigin();
  id v13 = (id)SFCountryOfOrigin();
  uint64_t v14 = sub_25447F850();
  uint64_t v16 = v15;

  id v17 = (id)SFRegulatoryImage();
  uint64_t v18 = swift_allocObject();
  *(unsigned char *)(v18 + 16) = 9;
  sub_25447F2B0();
  *(unsigned char *)(v18 + 17) = v23;
  *(void *)(v18 + 24) = v22;
  *(void *)(v18 + 32) = v21;
  *(unsigned char *)(v18 + 40) = v20;
  *(void *)(v18 + 48) = v7;
  *(void *)(v18 + 56) = v9;
  *(unsigned char *)(v18 + 64) = v10;
  *(unsigned char *)(v18 + 65) = v11;
  *(unsigned char *)(v18 + 66) = v12;
  *(unsigned char *)(v18 + 67) = (_BYTE)v8;
  *(void *)(v18 + 72) = v14;
  *(void *)(v18 + 80) = v16;
  *(void *)(v18 + 88) = v17;
  return v18;
}

unint64_t sub_25447E314()
{
  unint64_t result = qword_269DF1FF0;
  if (!qword_269DF1FF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269DF1FF0);
  }
  return result;
}

Swift::Void __swiftcall LegalAndRegulatorySettingsListState.handleURL(_:)(Swift::OpaquePointer a1)
{
  uint64_t v2 = v1;
  sub_25447F910();
  if (*((void *)a1._rawValue + 2) && (unint64_t v4 = sub_25447E6A0((uint64_t)v7), (v5 & 1) != 0))
  {
    sub_254479834(*((void *)a1._rawValue + 7) + 32 * v4, (uint64_t)&v8);
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  sub_25447E6E4((uint64_t)v7);
  if (*((void *)&v9 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0 && sub_25446D57C() != 9)
    {
      uint64_t KeyPath = swift_getKeyPath();
      MEMORY[0x270FA5388](KeyPath);
      v7[0] = v2;
      sub_254478F7C();
      sub_25447F290();
      swift_release();
    }
  }
  else
  {
    sub_25447E738((uint64_t)&v8);
  }
}

uint64_t LegalAndRegulatorySettingsListState.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = v0
     + OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport35LegalAndRegulatorySettingsListState___observationRegistrar;
  uint64_t v2 = sub_25447F2C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t LegalAndRegulatorySettingsListState.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v1 = (char *)v0
     + OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport35LegalAndRegulatorySettingsListState___observationRegistrar;
  uint64_t v2 = sub_25447F2C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

unint64_t sub_25447E628(uint64_t a1, uint64_t a2)
{
  sub_25447F9A0();
  sub_25447F880();
  uint64_t v4 = sub_25447F9C0();
  return sub_25447E798(a1, a2, v4);
}

unint64_t sub_25447E6A0(uint64_t a1)
{
  uint64_t v2 = sub_25447F8F0();
  return sub_25447E87C(a1, v2);
}

uint64_t sub_25447E6E4(uint64_t a1)
{
  return a1;
}

uint64_t sub_25447E738(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269DF1FF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25447E798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25447F990() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25447F990() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25447E87C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_25447EF9C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x25A27AB60](v9, a1);
      sub_25447E6E4((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_25447E944(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  unint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  unint64_t result = (uint64_t)sub_25447EB58((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    unint64_t result = swift_bridgeObjectRelease();
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

size_t sub_25447EA30(size_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  size_t v6 = result;
  unint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  unint64_t result = sub_25447EC5C(result, v11, 1, v3);
  uint64_t v3 = (void *)result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v7 = (v3[3] >> 1) - v3[2];
  unint64_t result = type metadata accessor for LegalDocumentModel(0);
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  unint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    unint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = v3[2];
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_25447EB58(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DF2020);
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
  id v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_25447EC5C(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    id v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF2028);
  uint64_t v10 = *(void *)(type metadata accessor for LegalDocumentModel(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  unint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for LegalDocumentModel(0) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

void sub_25447EE38()
{
  *(unsigned char *)(*(void *)(v0 + 16) + 16) = *(unsigned char *)(v0 + 24);
}

uint64_t type metadata accessor for LegalAndRegulatorySettingsListState()
{
  uint64_t result = qword_269DF2008;
  if (!qword_269DF2008) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25447EE94()
{
  return type metadata accessor for LegalAndRegulatorySettingsListState();
}

uint64_t sub_25447EE9C()
{
  uint64_t result = sub_25447F2C0();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for LegalAndRegulatorySettingsListState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LegalAndRegulatorySettingsListState);
}

uint64_t sub_25447EF9C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25447EFF8()
{
  uint64_t v0 = sub_25447D5F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DF2020);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_254480D70;
  *(unsigned char *)(inited + 32) = 0;
  *(void *)(inited + 40) = v0;
  unsigned int v2 = objc_msgSend(self, sel_areAnySpeakersConfigured);
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (v2)
  {
    size_t v5 = sub_25447DC00();
    uint64_t v6 = swift_initStackObject();
    *(_OWORD *)(v6 + 16) = xmmword_254480D70;
    *(unsigned char *)(v6 + 32) = 1;
    *(void *)(v6 + 40) = v5;
    sub_25447E944(v6);
    uint64_t v4 = v3;
  }
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_25447E944(v7);
  sub_25447E944(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  return v3;
}

uint64_t sub_25447F10C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LegalDocumentModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25447F1C0()
{
  return MEMORY[0x270EEDC48]();
}

uint64_t sub_25447F1D0()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_25447F1E0()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_25447F1F0()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_25447F200()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_25447F210()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_25447F220()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25447F230()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_25447F240()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25447F250()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_25447F260()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25447F270()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_25447F280()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_25447F290()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_25447F2A0()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_25447F2B0()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_25447F2C0()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_25447F2D0()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_25447F2E0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_25447F2F0()
{
  return MEMORY[0x270EFEFF0]();
}

uint64_t sub_25447F300()
{
  return MEMORY[0x270EFF188]();
}

uint64_t sub_25447F310()
{
  return MEMORY[0x270EFF198]();
}

uint64_t sub_25447F320()
{
  return MEMORY[0x270EFF800]();
}

uint64_t sub_25447F330()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_25447F340()
{
  return MEMORY[0x270EFFAD0]();
}

uint64_t sub_25447F350()
{
  return MEMORY[0x270F00148]();
}

uint64_t sub_25447F360()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_25447F370()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_25447F380()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_25447F390()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_25447F3A0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_25447F3B0()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_25447F3C0()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_25447F3D0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_25447F3E0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_25447F3F0()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_25447F400()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_25447F410()
{
  return MEMORY[0x270F01440]();
}

uint64_t sub_25447F420()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_25447F430()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_25447F440()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_25447F450()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_25447F460()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_25447F480()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_25447F490()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_25447F4A0()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_25447F4C0()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_25447F4D0()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_25447F4E0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_25447F4F0()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_25447F500()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_25447F510()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_25447F520()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_25447F530()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_25447F540()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_25447F550()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_25447F560()
{
  return MEMORY[0x270F02BE8]();
}

uint64_t sub_25447F570()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_25447F580()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_25447F590()
{
  return MEMORY[0x270F02DC0]();
}

uint64_t sub_25447F5A0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_25447F5B0()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_25447F5C0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_25447F5D0()
{
  return MEMORY[0x270F5D070]();
}

uint64_t sub_25447F5E0()
{
  return MEMORY[0x270F5D078]();
}

uint64_t sub_25447F5F0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_25447F600()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_25447F610()
{
  return MEMORY[0x270F03498]();
}

uint64_t sub_25447F620()
{
  return MEMORY[0x270F03558]();
}

uint64_t sub_25447F630()
{
  return MEMORY[0x270F03638]();
}

uint64_t sub_25447F640()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_25447F650()
{
  return MEMORY[0x270F039A0]();
}

uint64_t sub_25447F660()
{
  return MEMORY[0x270F03A60]();
}

uint64_t sub_25447F670()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_25447F680()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_25447F690()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_25447F6A0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_25447F6B0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_25447F6C0()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_25447F6D0()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_25447F6E0()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_25447F6F0()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_25447F700()
{
  return MEMORY[0x270F04B28]();
}

uint64_t sub_25447F710()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_25447F720()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_25447F730()
{
  return MEMORY[0x270F04B70]();
}

uint64_t sub_25447F740()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_25447F750()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_25447F760()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_25447F770()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_25447F780()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_25447F790()
{
  return MEMORY[0x270F04E10]();
}

uint64_t sub_25447F7A0()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_25447F7B0()
{
  return MEMORY[0x270F04E28]();
}

uint64_t sub_25447F7C0()
{
  return MEMORY[0x270F04E38]();
}

uint64_t sub_25447F7D0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_25447F7E0()
{
  return MEMORY[0x270F5D090]();
}

uint64_t sub_25447F7F0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_25447F800()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25447F810()
{
  return MEMORY[0x270EF1870]();
}

uint64_t sub_25447F820()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_25447F830()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_25447F840()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25447F850()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25447F860()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25447F870()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25447F880()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25447F890()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25447F8A0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25447F8B0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_25447F8C0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25447F8D0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25447F8E0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_25447F8F0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_25447F900()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_25447F910()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_25447F920()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25447F930()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25447F940()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25447F950()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25447F960()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25447F970()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25447F980()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25447F990()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25447F9A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25447F9B0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25447F9C0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t SFAcknowledgementsDocumentFilePath()
{
  return MEMORY[0x270F5D138]();
}

uint64_t SFAudioAccessoryAcknowledgementsDocumentFilePath()
{
  return MEMORY[0x270F5D148]();
}

uint64_t SFAudioAccessoryLicenseFilePath()
{
  return MEMORY[0x270F5D150]();
}

uint64_t SFAudioAccessoryWarrantyFilePath()
{
  return MEMORY[0x270F5D158]();
}

uint64_t SFBuiltInAppsDocumentFilePath()
{
  return MEMORY[0x270F5D160]();
}

uint64_t SFCountryOfOrigin()
{
  return MEMORY[0x270F5D168]();
}

uint64_t SFIndiaBISNumber()
{
  return MEMORY[0x270F5D170]();
}

uint64_t SFIndiaBISRegulatoryImage()
{
  return MEMORY[0x270F5D178]();
}

uint64_t SFLicenseFilePath()
{
  return MEMORY[0x270F5D180]();
}

uint64_t SFRFExposureDocumentHTMLString()
{
  return MEMORY[0x270F5D1A0]();
}

uint64_t SFRegulatoryImage()
{
  return MEMORY[0x270F5D1A8]();
}

uint64_t SFRoHSComplianceDocumentFilePath()
{
  return MEMORY[0x270F5D1B0]();
}

uint64_t SFShouldShowAlertMark()
{
  return MEMORY[0x270F5D1C0]();
}

uint64_t SFShouldShowBuiltInApps()
{
  return MEMORY[0x270F5D1C8]();
}

uint64_t SFShouldShowCountryOfOrigin()
{
  return MEMORY[0x270F5D1D0]();
}

uint64_t SFShouldShowEyesightWarning()
{
  return MEMORY[0x270F5D1D8]();
}

uint64_t SFShouldShowIndiaBIS()
{
  return MEMORY[0x270F5D1E0]();
}

uint64_t SFShouldShowMonthOfManufacture()
{
  return MEMORY[0x270F5D1E8]();
}

uint64_t SFShouldShowRoHSCompliance()
{
  return MEMORY[0x270F5D1F0]();
}

uint64_t SFShouldShowYearOfManufacture()
{
  return MEMORY[0x270F5D1F8]();
}

uint64_t SFWarrantyFilePath()
{
  return MEMORY[0x270F5D200]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}