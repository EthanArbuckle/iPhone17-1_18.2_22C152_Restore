uint64_t sub_21FAA65C8()
{
  __SecTask *v0;
  __CFString *v1;
  unsigned __int8 v3;

  v1 = (__CFString *)sub_21FAAE890();
  SecTaskCopyValueForEntitlement(v0, v1, 0);

  __swift_instantiateConcreteTypeFromMangledName(qword_26AD439C0);
  return swift_dynamicCast() & v3;
}

uint64_t sub_21FAA6640(uint64_t a1)
{
  uint64_t v3 = SecTaskCopyTeamIdentifier();
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    sub_21FAAE8A0();
  }
  if (!os_variant_allows_internal_security_policies()) {
    return 0;
  }
  v5 = (__CFString *)sub_21FAAE890();
  SecTaskCopyValueForEntitlement(v1, v5, 0);

  __swift_instantiateConcreteTypeFromMangledName(qword_26AD439C0);
  if ((swift_dynamicCast() & 1) != 0 && v8) {
    return v7;
  }
  swift_bridgeObjectRetain();
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

uint64_t sub_21FAA6790(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_21FAA67D4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_21FAA67F4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for audit_token_t()
{
  if (!qword_26AD439B0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26AD439B0);
    }
  }
}

uint64_t dispatch thunk of KeyRetrieving.retrieveEncodingKeyData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of KeyRetrieving.retrieveDecodingKeyDatas()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static TeamIdentifierRetrieving.teamIdentifierFromCurrentConnection()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static TeamIdentifierRetrieving.teamIdentifier(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = *(uint64_t (**)(_OWORD *))(a3 + 16);
  char v4 = *(unsigned char *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v5;
  char v8 = v4;
  return v3(v7);
}

uint64_t KeyGenerator.generateKeyData()()
{
  return sub_21FAA6A4C();
}

ValueMetadata *type metadata accessor for KeyGenerator()
{
  return &type metadata for KeyGenerator;
}

ValueMetadata *type metadata accessor for Cryptor()
{
  return &type metadata for Cryptor;
}

BOOL sub_21FAA6970(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21FAA6984()
{
  return sub_21FAAEA60();
}

uint64_t sub_21FAA69CC()
{
  return sub_21FAAEA50();
}

uint64_t sub_21FAA69F8()
{
  return sub_21FAAEA60();
}

uint64_t sub_21FAA6A4C()
{
  uint64_t v0 = sub_21FAAE940();
  *(void *)(v0 + 16) = 32;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], 0x20uLL, (void *)(v0 + 32)))
  {
    swift_bridgeObjectRelease();
    sub_21FAA716C();
    swift_allocError();
    unsigned char *v1 = 2;
    return swift_willThrow();
  }
  else
  {
    uint64_t v3 = sub_21FAAC518(v0);
    swift_bridgeObjectRelease();
    return v3;
  }
}

uint64_t sub_21FAA6B18(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x21FAA6BECLL);
      }
      uint64_t v4 = (int)v4;
LABEL_6:
      if (v4 != 32)
      {
LABEL_7:
        sub_21FAA716C();
        swift_allocError();
        *char v8 = 1;
        swift_willThrow();
        sub_21FAA71C0(a1, a2);
      }
      return a1;
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

unint64_t sub_21FAA6BFC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v36 = a5;
  uint64_t v37 = a6;
  *(void *)&long long v35 = a1;
  *((void *)&v35 + 1) = a2;
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EF3F80);
  MEMORY[0x270FA5388](v9 - 8, v10);
  v38 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21FAAE880();
  uint64_t v33 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v13);
  v39 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_21FAAE850();
  uint64_t v34 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15, v16);
  v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_21FAAE810();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19, v21);
  v23 = (char *)&v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v42 = a3;
  *((void *)&v42 + 1) = a4;
  sub_21FAA7060(a3, a4);
  sub_21FAAE800();
  long long v42 = xmmword_21FAAEE50;
  unint64_t v24 = sub_21FAA70B8();
  sub_21FAAE840();
  if (v6)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
  }
  else
  {
    uint64_t v31 = v12;
    uint64_t v32 = v20;
    uint64_t v25 = v34;
    long long v42 = v35;
    uint64_t v26 = (uint64_t)v38;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v38, v18, v15);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v26, 0, 1, v15);
    uint64_t v40 = v36;
    uint64_t v41 = v37;
    sub_21FAAE830();
    sub_21FAA710C(v26);
    uint64_t v27 = sub_21FAAE860();
    if (v28 >> 60 == 15)
    {
      sub_21FAA716C();
      swift_allocError();
      unsigned char *v29 = 0;
      swift_willThrow();
    }
    else
    {
      unint64_t v24 = v27;
    }
    (*(void (**)(char *, uint64_t))(v33 + 8))(v39, v31);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v18, v15);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v23, v19);
  }
  return v24;
}

uint64_t sub_21FAA7060(uint64_t a1, unint64_t a2)
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

unint64_t sub_21FAA70B8()
{
  unint64_t result = qword_267EF3F88;
  if (!qword_267EF3F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF3F88);
  }
  return result;
}

uint64_t sub_21FAA710C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EF3F80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21FAA716C()
{
  unint64_t result = qword_267EF3F90;
  if (!qword_267EF3F90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF3F90);
  }
  return result;
}

uint64_t sub_21FAA71C0(uint64_t a1, unint64_t a2)
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CryptorError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CryptorError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21FAA7380);
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

uint64_t sub_21FAA73A8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21FAA73B4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CryptorError()
{
  return &type metadata for CryptorError;
}

uint64_t *initializeBufferWithCopyOfBuffer for Cryptor.Key(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_21FAA7060(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for Cryptor.Key(uint64_t a1)
{
  return sub_21FAA71C0(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *assignWithCopy for Cryptor.Key(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_21FAA7060(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_21FAA71C0(v5, v6);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for Cryptor.Key(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_21FAA71C0(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Cryptor.Key(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for Cryptor.Key(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)__n128 result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Cryptor.Key()
{
  return &type metadata for Cryptor.Key;
}

unint64_t sub_21FAA755C()
{
  unint64_t result = qword_267EF3F98;
  if (!qword_267EF3F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF3F98);
  }
  return result;
}

uint64_t sub_21FAA75B4()
{
  return 1;
}

uint64_t sub_21FAA75BC()
{
  return sub_21FAAEA60();
}

uint64_t sub_21FAA7600()
{
  return sub_21FAAEA50();
}

uint64_t sub_21FAA7628()
{
  return sub_21FAAEA60();
}

id KeyRetriever.init()@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F53ED0]), sel_init);
  *a1 = result;
  return result;
}

uint64_t KeyRetriever.retrieveEncodingKeyData()()
{
  id v1 = *v0;
  id v2 = objc_msgSend(*v0, sel_managedSettings);
  id v3 = objc_msgSend(v2, sel_tokenEncodingKey);

  if (v3)
  {
    uint64_t v4 = sub_21FAAE7B0();
    unint64_t v6 = v5;

    sub_21FAA7060(v4, v6);
    uint64_t v7 = sub_21FAAE780();
    unint64_t v9 = v8;
    sub_21FAA7060(v4, v6);
    char v10 = sub_21FAA805C(v4, v6, v7, v9);
    sub_21FAA71C0(v7, v9);
    sub_21FAA71C0(v4, v6);
    sub_21FAA71C0(v4, v6);
    if ((v10 & 1) == 0) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0xF000000000000000;
  }
  id v11 = objc_msgSend(v1, sel_allowedClient);
  id v12 = objc_msgSend(v11, sel_tokenKeys);

  if (!v12)
  {
    sub_21FAA7924(v4, v6);
    goto LABEL_11;
  }
  sub_21FAA798C();
  uint64_t v13 = sub_21FAAE950();

  uint64_t result = sub_21FAA7DD4(v13);
  if ((v16 & 1) == 0)
  {
    if (*(_DWORD *)(v13 + 36) == v15)
    {
      if (result != 1 << *(unsigned char *)(v13 + 32))
      {
        sub_21FAA7E74(result, v15, v13, v21);
        sub_21FAA7924(v4, v6);
        swift_bridgeObjectRelease();
        uint64_t v4 = v21[0];
        unint64_t v6 = v21[1];
LABEL_13:
        sub_21FAA7060(v4, v6);
        uint64_t v17 = sub_21FAAE780();
        unint64_t v19 = v18;
        char v20 = sub_21FAA805C(v4, v6, v17, v18);
        sub_21FAA71C0(v17, v19);
        if ((v20 & 1) == 0)
        {
          sub_21FAA7924(v4, v6);
          return v4;
        }
        sub_21FAA71C0(v4, v6);
LABEL_15:
        sub_21FAA7938();
        swift_allocError();
        swift_willThrow();
        sub_21FAA7924(v4, v6);
        return v4;
      }
      sub_21FAA7924(v4, v6);
      swift_bridgeObjectRelease();
LABEL_11:
      uint64_t v4 = 0;
      unint64_t v6 = 0xF000000000000000;
      goto LABEL_15;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21FAA7924(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_21FAA71C0(a1, a2);
  }
  return a1;
}

unint64_t sub_21FAA7938()
{
  unint64_t result = qword_267EF3FA0;
  if (!qword_267EF3FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF3FA0);
  }
  return result;
}

unint64_t sub_21FAA798C()
{
  unint64_t result = qword_267EF3FA8;
  if (!qword_267EF3FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF3FA8);
  }
  return result;
}

uint64_t KeyRetriever.retrieveDecodingKeyDatas()()
{
  id v1 = *v0;
  id v2 = objc_msgSend(*v0, sel_managedSettings);
  id v3 = objc_msgSend(v2, sel_tokenDecodingKeys);

  if (v3)
  {
    sub_21FAA798C();
    uint64_t v4 = sub_21FAAE950();

    if (*(void *)(v4 + 16)) {
      return v4;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend(v1, sel_allowedClient);
  id v6 = objc_msgSend(v5, sel_tokenKeys);

  if (!v6)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    sub_21FAA7938();
    swift_allocError();
    swift_willThrow();
    swift_bridgeObjectRelease();
    return v4;
  }
  sub_21FAA798C();
  uint64_t v7 = sub_21FAAE950();
  swift_bridgeObjectRelease();

  uint64_t v4 = v7;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_9;
  }
  return v4;
}

uint64_t sub_21FAA7B30()
{
  return KeyRetriever.retrieveEncodingKeyData()();
}

uint64_t sub_21FAA7B48()
{
  return KeyRetriever.retrieveDecodingKeyDatas()();
}

uint64_t sub_21FAA7B60@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_21FAA7060(a2, a3);
      char v10 = (char *)sub_21FAAE700();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_21FAAE730();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_21FAAE720();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x21FAA7DC4);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_21FAA71C0(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_21FAAE700();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_21FAAE730();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_21FAAE720();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_21FAA7DD4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

uint64_t sub_21FAA7E74@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  if (result < 0 || 1 << *(unsigned char *)(a3 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a3 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a3 + 36) == a2)
  {
    uint64_t v4 = (uint64_t *)(*(void *)(a3 + 48) + 16 * result);
    uint64_t v5 = *v4;
    unint64_t v6 = v4[1];
    *a4 = *v4;
    a4[1] = v6;
    return sub_21FAA7060(v5, v6);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_21FAA7ECC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_21FAA7B60((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_21FAA7FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_21FAAE700();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_21FAAE730();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_21FAAE720();
  sub_21FAA7B60(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_21FAA805C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x21FAA82C4);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_21FAA7060(a3, a4);
                  sub_21FAA7060(a1, a2);
                  char v17 = sub_21FAA7FA4((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_21FAA71C0(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_21FAA7060(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_21FAA7FA4(v21, v22, v20, a3, a4);
                  sub_21FAA71C0(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_21FAA7060(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_21FAA7060(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_21FAA7ECC(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_21FAA71C0(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

ValueMetadata *type metadata accessor for KeyRetriever()
{
  return &type metadata for KeyRetriever;
}

uint64_t getEnumTagSinglePayload for KeyRetrieverError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for KeyRetrieverError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x21FAA83F4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21FAA841C()
{
  return 0;
}

ValueMetadata *type metadata accessor for KeyRetrieverError()
{
  return &type metadata for KeyRetrieverError;
}

unint64_t sub_21FAA8438()
{
  unint64_t result = qword_267EF3FB0;
  if (!qword_267EF3FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF3FB0);
  }
  return result;
}

uint64_t sub_21FAA848C(uint64_t a1, unint64_t a2)
{
  v28[5] = *MEMORY[0x263EF8340];
  v28[3] = MEMORY[0x263F06F78];
  v28[4] = MEMORY[0x263F06F68];
  v28[0] = a1;
  v28[1] = a2;
  unsigned int v4 = __swift_project_boxed_opaque_existential_1(v28, MEMORY[0x263F06F78]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      sub_21FAA7060(a1, a2);
      sub_21FAA7060(v5, v6);
      uint64_t v8 = (unsigned char *)sub_21FAAE700();
      if (v8)
      {
        uint64_t v9 = sub_21FAAE730();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = sub_21FAAE720();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = &v8[v11];
      if (v8) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      sub_21FAAC0B0(v8, v13, &v27);
      sub_21FAA71C0(v5, v6);
LABEL_27:
      sub_21FAA71C0(a1, a2);
      uint64_t v24 = v27;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      sub_21FAA7060(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v16 = (unsigned char *)sub_21FAAE700();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_21FAAE730();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_30;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_29;
      }
      uint64_t v20 = sub_21FAAE720();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = &v16[v21];
      if (v16) {
        int v23 = v22;
      }
      else {
        int v23 = 0;
      }
      sub_21FAAC0B0(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      sub_21FAA7060(a1, a2);
      char v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      sub_21FAA7060(a1, a2);
      char v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      sub_21FAAC0B0(v26, v7, &v27);
      goto LABEL_27;
  }
}

uint64_t sub_21FAA8740(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EF4000);
  if (swift_dynamicCast())
  {
    sub_21FAACA14(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_21FAAE750();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_21FAAC948((uint64_t)v38);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      unint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      char v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = sub_21FAAE970();
      }
      if (v4) {
        unint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        unint64_t v6 = 0;
      }
      char v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_21FAAC5D8(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    uint64_t v11 = sub_21FAAE8C0();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_21FAAC63C(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0], v12);
  unint64_t v13 = (unint64_t)sub_21FAABDAC((void *(*)(uint64_t *__return_ptr, char *, char *))sub_21FAAC9A8);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_21FAAE790();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_21FAAC24C(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = sub_21FAAE8F0();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = sub_21FAAE970();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_21FAAC24C(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = sub_21FAAE8D0();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_21FAAE7A0();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_21FAAE7A0();
    sub_21FAA7924(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_21FAA7924((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t sub_21FAA8C68()
{
  return sub_21FAAEA60();
}

uint64_t sub_21FAA8D14()
{
  sub_21FAAE8B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FAA8DAC()
{
  return sub_21FAAEA60();
}

uint64_t sub_21FAA8E54@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FAAC6DC();
  *a1 = result;
  return result;
}

void sub_21FAA8E84(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE800000000000000;
  unint64_t v4 = 0xEA00000000004449;
  uint64_t v5 = 0x79726F6765746163;
  if (v2 != 1)
  {
    uint64_t v5 = 0x69616D6F44626577;
    unint64_t v4 = 0xE90000000000006ELL;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x4449656C646E7562;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_21FAA8EEC()
{
  return sub_21FAAE930();
}

uint64_t sub_21FAA8F4C()
{
  return sub_21FAAE920();
}

uint64_t sub_21FAA8F9C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21FAA8FA8(*a1, *a2);
}

uint64_t sub_21FAA8FA8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x79726F6765746163;
    }
    else {
      uint64_t v3 = 0x69616D6F44626577;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEA00000000004449;
    }
    else {
      unint64_t v4 = 0xE90000000000006ELL;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x79726F6765746163;
      }
      else {
        uint64_t v6 = 0x69616D6F44626577;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEA00000000004449;
      }
      else {
        unint64_t v7 = 0xE90000000000006ELL;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE800000000000000;
    uint64_t v3 = 0x4449656C646E7562;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE800000000000000;
  if (v3 != 0x4449656C646E7562)
  {
LABEL_21:
    char v8 = sub_21FAAE9F0();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

BOOL sub_21FAA90D4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_21FAA90E4()
{
  return sub_21FAAEA50();
}

uint64_t sub_21FAA910C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1835365481 && a2 == 0xE400000000000000;
  if (v2 || (sub_21FAAE9F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x697461746F6E6E61 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_21FAAE9F0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_21FAA91FC()
{
  return sub_21FAAEA60();
}

uint64_t sub_21FAA9244(char a1)
{
  if (a1) {
    return 0x697461746F6E6E61;
  }
  else {
    return 1835365481;
  }
}

BOOL sub_21FAA9280(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21FAA90D4(*a1, *a2);
}

uint64_t sub_21FAA9298()
{
  return sub_21FAA91FC();
}

uint64_t sub_21FAA92AC()
{
  return sub_21FAA90E4();
}

uint64_t sub_21FAA92C0()
{
  return sub_21FAAEA60();
}

uint64_t sub_21FAA930C()
{
  return sub_21FAA9244(*v0);
}

uint64_t sub_21FAA9320@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21FAA910C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21FAA9354()
{
  return 0;
}

uint64_t sub_21FAA9360@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FAAC728();
  *a1 = result;
  return result;
}

uint64_t sub_21FAA9394(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_21FAA93E8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_21FAA943C(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  v13[0] = *(void *)(a2 + 32);
  v13[1] = v4;
  type metadata accessor for Annotated.CodingKeys();
  swift_getWitnessTable();
  uint64_t v5 = sub_21FAAE9E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  unint64_t v9 = (char *)v13 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v10 = v13[2];
  sub_21FAAEA80();
  char v16 = 0;
  uint64_t v11 = v13[3];
  sub_21FAAE9D0();
  if (!v11)
  {
    char v15 = *(unsigned char *)(v10 + *(int *)(a2 + 44));
    char v14 = 1;
    sub_21FAADC10();
    sub_21FAAE9D0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_21FAA95F8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v23 = a4;
  uint64_t v24 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v28 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Annotated.CodingKeys();
  swift_getWitnessTable();
  uint64_t v8 = sub_21FAAE9B0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  uint64_t v27 = v9;
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v22 - v10;
  uint64_t v25 = a3;
  uint64_t v12 = type metadata accessor for Annotated();
  uint64_t v22 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  char v14 = (char *)&v22 - v13;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v15 = v29;
  sub_21FAAEA70();
  if (v15) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v29 = v12;
  char v16 = v14;
  uint64_t v17 = v24;
  char v32 = 0;
  uint64_t v18 = v26;
  sub_21FAAE9A0();
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v16, v28, a2);
  char v30 = 1;
  sub_21FAADBBC();
  sub_21FAAE9A0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v18);
  uint64_t v19 = v29;
  v16[*(int *)(v29 + 44)] = v31;
  uint64_t v20 = v22;
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 16))(v23, v16, v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v16, v19);
}

uint64_t sub_21FAA9998@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_21FAA95F8(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_21FAA99BC(void *a1, uint64_t a2)
{
  return sub_21FAA943C(a1, a2);
}

uint64_t sub_21FAA99D4()
{
  sub_21FAAE6D0();
  sub_21FAAC900(&qword_267EF3FF0, MEMORY[0x263F061E0]);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EF3FD0);
  sub_21FAACA4C(&qword_267EF3FF8, &qword_267EF3FD0);
  sub_21FAAE7E0();
  if (v0) {
    return swift_bridgeObjectRelease();
  }
  switch(v6 >> 62)
  {
    case 1uLL:
      sub_21FAA71C0(v5, v6);
      swift_bridgeObjectRelease();
      LODWORD(v2) = HIDWORD(v5) - v5;
      if (__OFSUB__(HIDWORD(v5), v5))
      {
        __break(1u);
        JUMPOUT(0x21FAA9BC0);
      }
      uint64_t v2 = (int)v2;
      break;
    case 2uLL:
      uint64_t v4 = *(void *)(v5 + 16);
      uint64_t v3 = *(void *)(v5 + 24);
      sub_21FAA71C0(v5, v6);
      swift_bridgeObjectRelease();
      uint64_t v2 = v3 - v4;
      if (__OFSUB__(v3, v4))
      {
        __break(1u);
        goto LABEL_10;
      }
      break;
    case 3uLL:
LABEL_10:
      sub_21FAA71C0(v5, v6);
      swift_bridgeObjectRelease();
      uint64_t v2 = 0;
      break;
    default:
      sub_21FAA71C0(v5, v6);
      swift_bridgeObjectRelease();
      uint64_t v2 = BYTE6(v6);
      break;
  }
  return 100 * (v2 / 100) - v2 + 100;
}

uint64_t sub_21FAA9BD0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1835365481 && a2 == 0xE400000000000000;
  if (v2 || (sub_21FAAE9F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E6964646170 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_21FAAE9F0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_21FAA9CB4(char a1)
{
  if (a1) {
    return 0x676E6964646170;
  }
  else {
    return 1835365481;
  }
}

uint64_t sub_21FAA9CE4(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  long long v13 = *(_OWORD *)(a2 + 16);
  long long v14 = v13;
  uint64_t v15 = v3;
  long long v12 = *(_OWORD *)(a2 + 40);
  long long v16 = v12;
  type metadata accessor for Padded.CodingKeys();
  swift_getWitnessTable();
  uint64_t v4 = sub_21FAAE9E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v6);
  uint64_t v8 = (char *)&v11 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FAAEA80();
  LOBYTE(v14) = 0;
  uint64_t v9 = v17;
  sub_21FAAE9D0();
  if (!v9)
  {
    LOBYTE(v14) = 1;
    sub_21FAAE9C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_21FAA9EB0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v41 = a7;
  uint64_t v42 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1, a2);
  v47 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = v14;
  uint64_t v49 = v15;
  uint64_t v50 = v16;
  uint64_t v51 = v17;
  uint64_t v52 = v18;
  type metadata accessor for Padded.CodingKeys();
  swift_getWitnessTable();
  uint64_t v19 = sub_21FAAE9B0();
  uint64_t v45 = *(void *)(v19 - 8);
  uint64_t v46 = v19;
  MEMORY[0x270FA5388](v19, v20);
  uint64_t v22 = (char *)&v39 - v21;
  uint64_t v43 = a2;
  uint64_t v44 = a4;
  uint64_t v48 = a2;
  uint64_t v49 = a3;
  uint64_t v50 = a4;
  uint64_t v51 = a5;
  uint64_t v52 = a6;
  uint64_t v23 = type metadata accessor for Padded();
  uint64_t v40 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23, v24);
  uint64_t v26 = (char *)&v39 - v25;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v27 = (uint64_t)v53;
  sub_21FAAEA70();
  if (v27) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v53 = a1;
  uint64_t v28 = v26;
  uint64_t v30 = v42;
  uint64_t v29 = v43;
  LOBYTE(v48) = 0;
  uint64_t v31 = v46;
  sub_21FAAE9A0();
  (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v28, v47, v29);
  LOBYTE(v48) = 1;
  uint64_t v32 = sub_21FAAE990();
  uint64_t v33 = v22;
  uint64_t v35 = v34;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v33, v31);
  uint64_t v36 = (uint64_t *)&v28[*(int *)(v23 + 60)];
  *uint64_t v36 = v32;
  v36[1] = v35;
  uint64_t v37 = v40;
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 16))(v41, v28, v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v28, v23);
}

BOOL sub_21FAAA260(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21FAA90D4(*a1, *a2);
}

uint64_t sub_21FAAA27C()
{
  return sub_21FAA91FC();
}

uint64_t sub_21FAAA294()
{
  return sub_21FAA90E4();
}

uint64_t sub_21FAAA2AC()
{
  return sub_21FAAEA60();
}

uint64_t sub_21FAAA2FC()
{
  return sub_21FAA9CB4(*v0);
}

uint64_t sub_21FAAA314@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21FAA9BD0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21FAAA34C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21FAAC728();
  *a1 = result;
  return result;
}

uint64_t sub_21FAAA384(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_21FAAA3D8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_21FAAA42C@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_21FAA9EB0(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a3);
}

uint64_t sub_21FAAA454(void *a1, uint64_t a2)
{
  return sub_21FAA9CE4(a1, a2);
}

void *TokenEncoder.__allocating_init(teamIdentifier:keyRetriever:)(unint64_t a1, unint64_t a2, long long *a3)
{
  uint64_t v6 = sub_21FAAE690();
  MEMORY[0x270FA5388](v6 - 8, v7);
  uint64_t v8 = (void *)swift_allocObject();
  sub_21FAAE6D0();
  swift_allocObject();
  uint64_t v9 = sub_21FAAE6C0();
  sub_21FAAE680();
  sub_21FAAE6A0();
  v8[2] = v9;
  v8[3] = sub_21FAA8740(a1, a2);
  v8[4] = v10;
  sub_21FAACA14(a3, (uint64_t)(v8 + 5));
  return v8;
}

void *TokenEncoder.init(teamIdentifier:keyRetriever:)(unint64_t a1, unint64_t a2, long long *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_21FAAE690();
  MEMORY[0x270FA5388](v8 - 8, v9);
  sub_21FAAE6D0();
  swift_allocObject();
  uint64_t v10 = sub_21FAAE6C0();
  sub_21FAAE680();
  sub_21FAAE6A0();
  v4[2] = v10;
  v4[3] = sub_21FAA8740(a1, a2);
  v4[4] = v11;
  sub_21FAACA14(a3, (uint64_t)(v4 + 5));
  return v4;
}

uint64_t sub_21FAAA62C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[8];
  uint64_t v7 = v2[9];
  __swift_project_boxed_opaque_existential_1(v2 + 5, v6);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  if (!v3)
  {
    uint64_t v10 = result;
    unint64_t v11 = v9;
    sub_21FAAA8BC(a1, a2, result, v9);
    return sub_21FAA71C0(v10, v11);
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

uint64_t sub_21FAAA734(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[8];
  uint64_t v7 = v2[9];
  __swift_project_boxed_opaque_existential_1(v2 + 5, v6);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  if (!v3)
  {
    uint64_t v10 = result;
    unint64_t v11 = v9;
    sub_21FAAA8BC(a1, a2, result, v9);
    return sub_21FAA71C0(v10, v11);
  }
  return result;
}

uint64_t sub_21FAAA7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[8];
  uint64_t v7 = v2[9];
  __swift_project_boxed_opaque_existential_1(v2 + 5, v6);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  if (!v3)
  {
    uint64_t v10 = result;
    unint64_t v11 = v9;
    sub_21FAAA8BC(a1, a2, result, v9);
    return sub_21FAA71C0(v10, v11);
  }
  return result;
}

uint64_t sub_21FAAA8BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  uint64_t v7 = sub_21FAA99D4();
  if (v5)
  {
    swift_bridgeObjectRelease_n();
    return swift_release_n();
  }
  else
  {
    uint64_t v9 = v7;
    uint64_t v20 = v4;
    swift_bridgeObjectRetain();
    MEMORY[0x223C57F70](77, 0xE100000000000000, v9);
    swift_bridgeObjectRelease_n();
    swift_release_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EF3FD0);
    sub_21FAACA4C(&qword_267EF3FF8, &qword_267EF3FD0);
    uint64_t v10 = sub_21FAAE6B0();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    switch(v12 >> 62)
    {
      case 1uLL:
        LODWORD(v13) = HIDWORD(v10) - v10;
        if (__OFSUB__(HIDWORD(v10), v10))
        {
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x21FAAAB88);
        }
        uint64_t v13 = (int)v13;
LABEL_8:
        if (__ROR8__(0x8F5C28F5C28F5C29 * v13 + 0x51EB851EB851EB8, 2) <= 0x28F5C28F5C28F5CuLL)
        {
LABEL_10:
          sub_21FAA7060(a3, a4);
          uint64_t v17 = sub_21FAA6B18(a3, a4);
          unint64_t v19 = v18;
          sub_21FAA6BFC(v10, v12, v17, v18, *(void *)(v20 + 24), *(void *)(v20 + 32));
          sub_21FAAE7D0();
          sub_21FAA71C0(v17, v19);
        }
        else
        {
          sub_21FAABD58();
          swift_allocError();
          swift_willThrow();
        }
        uint64_t result = sub_21FAA71C0(v10, v12);
        break;
      case 2uLL:
        uint64_t v15 = *(void *)(v10 + 16);
        uint64_t v14 = *(void *)(v10 + 24);
        BOOL v16 = __OFSUB__(v14, v15);
        uint64_t v13 = v14 - v15;
        if (!v16) {
          goto LABEL_8;
        }
        goto LABEL_13;
      case 3uLL:
        goto LABEL_10;
      default:
        uint64_t v13 = BYTE6(v12);
        goto LABEL_8;
    }
  }
  return result;
}

uint64_t TokenEncoder.deinit()
{
  swift_release();
  sub_21FAA71C0(*(void *)(v0 + 24), *(void *)(v0 + 32));
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return v0;
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

uint64_t TokenEncoder.__deallocating_deinit()
{
  swift_release();
  sub_21FAA71C0(*(void *)(v0 + 24), *(void *)(v0 + 32));
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  return MEMORY[0x270FA0228](v0, 80, 7);
}

void *TokenDecoder.__allocating_init(teamIdentifier:keyRetriever:)(unint64_t a1, unint64_t a2, long long *a3)
{
  uint64_t v6 = sub_21FAAE690();
  MEMORY[0x270FA5388](v6 - 8, v7);
  uint64_t v8 = (void *)swift_allocObject();
  sub_21FAAE670();
  swift_allocObject();
  v8[2] = sub_21FAAE660();
  sub_21FAAE6D0();
  swift_allocObject();
  uint64_t v9 = sub_21FAAE6C0();
  sub_21FAAE680();
  sub_21FAAE6A0();
  v8[3] = v9;
  v8[4] = sub_21FAA8740(a1, a2);
  v8[5] = v10;
  sub_21FAACA14(a3, (uint64_t)(v8 + 6));
  return v8;
}

void *TokenDecoder.init(teamIdentifier:keyRetriever:)(unint64_t a1, unint64_t a2, long long *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_21FAAE690();
  MEMORY[0x270FA5388](v8 - 8, v9);
  sub_21FAAE670();
  swift_allocObject();
  v3[2] = sub_21FAAE660();
  sub_21FAAE6D0();
  swift_allocObject();
  uint64_t v10 = sub_21FAAE6C0();
  sub_21FAAE680();
  sub_21FAAE6A0();
  v4[3] = v10;
  v4[4] = sub_21FAA8740(a1, a2);
  v4[5] = v11;
  sub_21FAACA14(a3, (uint64_t)(v4 + 6));
  return v4;
}

unint64_t sub_21FAAAE60(uint64_t a1)
{
  uint64_t v4 = v1[9];
  uint64_t v5 = v1[10];
  unint64_t v6 = (unint64_t)__swift_project_boxed_opaque_existential_1(v1 + 6, v4);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if (!v2)
  {
    unint64_t v6 = sub_21FAAB07C(a1, v7, 0);
    swift_bridgeObjectRelease();
  }
  return v6;
}

unint64_t sub_21FAAAF14(uint64_t a1)
{
  uint64_t v4 = v1[9];
  uint64_t v5 = v1[10];
  unint64_t v6 = (unint64_t)__swift_project_boxed_opaque_existential_1(v1 + 6, v4);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if (!v2)
  {
    unint64_t v6 = sub_21FAAB07C(a1, v7, 1);
    swift_bridgeObjectRelease();
  }
  return v6;
}

unint64_t sub_21FAAAFC8(uint64_t a1)
{
  uint64_t v4 = v1[9];
  uint64_t v5 = v1[10];
  unint64_t v6 = (unint64_t)__swift_project_boxed_opaque_existential_1(v1 + 6, v4);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  if (!v2)
  {
    unint64_t v6 = sub_21FAAB07C(a1, v7, 2);
    swift_bridgeObjectRelease();
  }
  return v6;
}

unint64_t sub_21FAAB07C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = v3;
  int v71 = a3;
  uint64_t v82 = a1;
  uint64_t v77 = sub_21FAAE880();
  uint64_t v7 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77, v8);
  v78 = (char *)&v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_21FAAE810();
  MEMORY[0x270FA5388](v80, v10);
  uint64_t v94 = (uint64_t)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(a2 + 56);
  uint64_t v74 = a2 + 56;
  uint64_t v14 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v13;
  int64_t v75 = (unint64_t)(v14 + 63) >> 6;
  v76 = (void (**)(char *, uint64_t))(v7 + 8);
  v79 = (void (**)(uint64_t, uint64_t))(v11 + 8);
  unsigned int v72 = *MEMORY[0x263F04538];
  uint64_t v83 = a2;
  swift_bridgeObjectRetain();
  uint64_t v73 = 0;
  uint64_t v17 = 0;
  int64_t v18 = 0;
  unint64_t v19 = 0xF000000000000000;
  uint64_t v81 = v5;
  unint64_t v87 = 0xF000000000000000;
  if (!v16) {
    goto LABEL_5;
  }
  while (2)
  {
    unint64_t v20 = __clz(__rbit64(v16));
    uint64_t v21 = (v16 - 1) & v16;
    unint64_t v22 = v20 | (v18 << 6);
LABEL_16:
    uint64_t v26 = (uint64_t *)(*(void *)(v83 + 48) + 16 * v22);
    uint64_t v28 = *v26;
    unint64_t v27 = v26[1];
    switch(v27 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v28), v28)) {
          goto LABEL_58;
        }
        uint64_t v29 = HIDWORD(v28) - (int)v28;
LABEL_22:
        sub_21FAA7060(v28, v27);
        sub_21FAA7060(v28, v27);
        if (v29 != 32)
        {
LABEL_41:
          sub_21FAA716C();
          swift_allocError();
          unsigned char *v54 = 1;
          swift_willThrow();
          sub_21FAA71C0(v28, v27);
          swift_release();
          MEMORY[0x223C582D0](v73);
          sub_21FAA7924(v17, v19);
          sub_21FAA71C0(v28, v27);
          return v4;
        }
        break;
      case 2uLL:
        uint64_t v31 = *(void *)(v28 + 16);
        uint64_t v30 = *(void *)(v28 + 24);
        uint64_t v29 = v30 - v31;
        if (!__OFSUB__(v30, v31)) {
          goto LABEL_22;
        }
        goto LABEL_59;
      case 3uLL:
        goto LABEL_41;
      default:
        if (BYTE6(v27) != 32) {
          goto LABEL_41;
        }
        break;
    }
    unint64_t v85 = v21;
    int64_t v86 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EF3FB8);
    uint64_t v32 = sub_21FAAE7C0();
    unint64_t v4 = v33;
    uint64_t v34 = *(void *)(v5 + 32);
    unint64_t v35 = *(void *)(v5 + 40);
    uint64_t v89 = v28;
    unint64_t v90 = v27;
    sub_21FAA7060(v28, v27);
    sub_21FAAE800();
    switch(v4 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v32), v32)) {
          goto LABEL_60;
        }
        uint64_t v36 = v17;
        unint64_t v37 = v19;
        uint64_t v38 = HIDWORD(v32) - (int)v32;
LABEL_28:
        sub_21FAA7060(v32, v4);
LABEL_29:
        BOOL v41 = v38 < 28;
        unint64_t v19 = v37;
        uint64_t v17 = v36;
        if (v41)
        {
LABEL_39:
          uint64_t v51 = sub_21FAAE7F0();
          sub_21FAAC900(&qword_267EF3FC0, MEMORY[0x263F04548]);
          uint64_t v52 = swift_allocError();
          (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v51 - 8) + 104))(v53, v72, v51);
          swift_willThrow();
          sub_21FAA71C0(v32, v4);
          (*v79)(v94, v80);
          MEMORY[0x223C582D0](v73);
          sub_21FAA71C0(v28, v27);
          sub_21FAA71C0(v32, v4);
          sub_21FAA71C0(v28, v27);
          uint64_t v88 = 0;
          uint64_t v73 = v52;
          goto LABEL_32;
        }
        unint64_t v84 = v27;
        uint64_t v42 = v36;
        sub_21FAA848C(v32, v4);
        uint64_t v43 = v78;
        sub_21FAAE870();
        uint64_t v89 = v34;
        unint64_t v90 = v35;
        sub_21FAA70B8();
        uint64_t v44 = v94;
        uint64_t v45 = v88;
        uint64_t v46 = sub_21FAAE820();
        unint64_t v48 = v4;
        if (!v45)
        {
          uint64_t v49 = v46;
          unint64_t v4 = v47;
          uint64_t v88 = 0;
          (*v76)(v43, v77);
          (*v79)(v44, v80);
          sub_21FAA7924(v42, v87);
          unint64_t v50 = v84;
          sub_21FAA71C0(v28, v84);
          sub_21FAA71C0(v32, v48);
          sub_21FAA71C0(v28, v50);
          uint64_t v17 = v49;
          unint64_t v19 = v4;
LABEL_32:
          uint64_t v5 = v81;
          goto LABEL_33;
        }
        (*v76)(v43, v77);
        (*v79)(v44, v80);
        MEMORY[0x223C582D0](v73);
        unint64_t v4 = v84;
        sub_21FAA71C0(v28, v84);
        sub_21FAA71C0(v32, v48);
        sub_21FAA71C0(v28, v4);
        uint64_t v73 = v45;
        uint64_t v88 = 0;
        uint64_t v5 = v81;
        uint64_t v17 = v42;
        unint64_t v19 = v87;
LABEL_33:
        unint64_t v16 = v85;
        int64_t v18 = v86;
        unint64_t v87 = v19;
        if (v85) {
          continue;
        }
LABEL_5:
        if (__OFADD__(v18++, 1))
        {
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
LABEL_60:
          __break(1u);
LABEL_61:
          __break(1u);
          goto LABEL_62;
        }
        if (v18 >= v75) {
          goto LABEL_42;
        }
        unint64_t v24 = *(void *)(v74 + 8 * v18);
        if (v24) {
          goto LABEL_15;
        }
        int64_t v25 = v18 + 1;
        if (v18 + 1 >= v75) {
          goto LABEL_42;
        }
        unint64_t v24 = *(void *)(v74 + 8 * v25);
        if (v24) {
          goto LABEL_14;
        }
        int64_t v25 = v18 + 2;
        if (v18 + 2 >= v75) {
          goto LABEL_42;
        }
        unint64_t v24 = *(void *)(v74 + 8 * v25);
        if (v24) {
          goto LABEL_14;
        }
        int64_t v25 = v18 + 3;
        if (v18 + 3 < v75)
        {
          unint64_t v24 = *(void *)(v74 + 8 * v25);
          if (!v24)
          {
            while (1)
            {
              int64_t v18 = v25 + 1;
              if (__OFADD__(v25, 1)) {
                break;
              }
              if (v18 >= v75) {
                goto LABEL_42;
              }
              unint64_t v24 = *(void *)(v74 + 8 * v18);
              ++v25;
              if (v24) {
                goto LABEL_15;
              }
            }
LABEL_62:
            __break(1u);
            JUMPOUT(0x21FAABA24);
          }
LABEL_14:
          int64_t v18 = v25;
LABEL_15:
          uint64_t v21 = (v24 - 1) & v24;
          unint64_t v22 = __clz(__rbit64(v24)) + (v18 << 6);
          goto LABEL_16;
        }
LABEL_42:
        swift_release();
        if (v19 >> 60 == 15)
        {
          if (!v73)
          {
            sub_21FAABCBC();
            swift_allocError();
          }
          swift_willThrow();
        }
        else
        {
          unint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EF3FD0);
          sub_21FAA7060(v17, v19);
          sub_21FAACA4C(&qword_267EF3FD8, &qword_267EF3FD0);
          uint64_t v55 = v88;
          sub_21FAAE650();
          if (v55)
          {
            MEMORY[0x223C582D0](v73);
            sub_21FAA7924(v17, v19);
            sub_21FAA7924(v17, v19);
          }
          else
          {
            uint64_t v94 = v17;
            uint64_t v57 = v89;
            uint64_t v56 = v90;
            char v58 = v91;
            uint64_t v59 = v92;
            unint64_t v4 = v93;
            swift_retain_n();
            swift_bridgeObjectRetain();
            uint64_t v63 = sub_21FAA99D4();
            swift_bridgeObjectRetain();
            uint64_t v64 = MEMORY[0x223C57F70](77, 0xE100000000000000, v63);
            uint64_t v66 = v65;
            swift_bridgeObjectRelease();
            swift_release();
            if (v59 == v64 && v4 == v66)
            {
              swift_release();
              swift_bridgeObjectRelease_n();
            }
            else
            {
              char v67 = sub_21FAAE9F0();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v67 & 1) == 0)
              {
                sub_21FAABD58();
                swift_allocError();
                swift_willThrow();
                uint64_t v60 = v94;
                unint64_t v61 = v87;
                sub_21FAA7924(v94, v87);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                MEMORY[0x223C582D0](v73);
                sub_21FAA7924(v60, v61);
                swift_release();
                return v4;
              }
              swift_release();
            }
            uint64_t v68 = v94;
            swift_bridgeObjectRelease();
            unint64_t v4 = sub_21FAAC730(v57, v56, v58, v71);
            swift_bridgeObjectRetain();
            MEMORY[0x223C582D0](v73);
            unint64_t v69 = v87;
            sub_21FAA7924(v68, v87);
            sub_21FAA7924(v68, v69);
            swift_bridgeObjectRelease();
          }
        }
        return v4;
      case 2uLL:
        uint64_t v36 = v17;
        unint64_t v37 = v19;
        uint64_t v40 = *(void *)(v32 + 16);
        uint64_t v39 = *(void *)(v32 + 24);
        uint64_t v38 = v39 - v40;
        if (!__OFSUB__(v39, v40)) {
          goto LABEL_28;
        }
        goto LABEL_61;
      case 3uLL:
        goto LABEL_39;
      default:
        uint64_t v36 = v17;
        unint64_t v37 = v19;
        uint64_t v38 = BYTE6(v4);
        goto LABEL_29;
    }
  }
}

uint64_t TokenDecoder.deinit()
{
  swift_release();
  swift_release();
  sub_21FAA71C0(*(void *)(v0 + 32), *(void *)(v0 + 40));
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return v0;
}

uint64_t TokenDecoder.__deallocating_deinit()
{
  swift_release();
  swift_release();
  sub_21FAA71C0(*(void *)(v0 + 32), *(void *)(v0 + 40));
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return MEMORY[0x270FA0228](v0, 88, 7);
}

uint64_t type metadata accessor for TokenEncoder()
{
  return self;
}

uint64_t method lookup function for TokenEncoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TokenEncoder);
}

uint64_t dispatch thunk of TokenEncoder.__allocating_init(teamIdentifier:keyRetriever:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of TokenEncoder.encode(bundleIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of TokenEncoder.encode(categoryIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of TokenEncoder.encode(webDomain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t type metadata accessor for TokenDecoder()
{
  return self;
}

uint64_t method lookup function for TokenDecoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TokenDecoder);
}

uint64_t dispatch thunk of TokenDecoder.__allocating_init(teamIdentifier:keyRetriever:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of TokenDecoder.decode(bundleIdentifierToken:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of TokenDecoder.decode(categoryIdentifierToken:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of TokenDecoder.decode(webDomainToken:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

unint64_t sub_21FAABCBC()
{
  unint64_t result = qword_267EF3FC8;
  if (!qword_267EF3FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF3FC8);
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

unint64_t sub_21FAABD58()
{
  unint64_t result = qword_267EF3FE0;
  if (!qword_267EF3FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF3FE0);
  }
  return result;
}

char *sub_21FAABDAC(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_21FAAF030;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_21FAAE700() && __OFSUB__((int)v4, sub_21FAAE730())) {
        goto LABEL_24;
      }
      sub_21FAAE740();
      swift_allocObject();
      uint64_t v13 = sub_21FAAE6E0();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      unint64_t result = sub_21FAAC198((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        uint64_t *v5 = v4;
        goto LABEL_19;
      }
      uint64_t *v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_21FAAE760();
      unint64_t result = sub_21FAAC198(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        uint64_t *v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        uint64_t *v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        unint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      uint64_t *v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_21FAAC0B0@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_21FAAC354(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_21FAAC418((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_21FAAC494((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_21FAAC128(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  unint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_21FAAC198(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  unint64_t result = (char *)sub_21FAAE700();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  unint64_t result = (char *)sub_21FAAE730();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_21FAAE720();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  unint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_21FAAC24C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_21FAAE900();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x223C57F40](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_21FAAC2C8@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    unint64_t result = sub_21FAAE960();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      unint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21FAAC354(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_21FAAC418(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_21FAAE740();
  swift_allocObject();
  uint64_t result = sub_21FAAE6F0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_21FAAE770();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_21FAAC494(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_21FAAE740();
  swift_allocObject();
  uint64_t result = sub_21FAAE6F0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_21FAAC518(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EF4010);
  uint64_t v10 = sub_21FAACA4C(qword_267EF4018, &qword_267EF4010);
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  char v3 = (unsigned char *)(*v2 + 32);
  uint64_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_21FAAC0B0(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

unsigned char *sub_21FAAC5D8(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_21FAAC354(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_21FAAC418((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_21FAAC494((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_21FAAC63C(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_21FAAE740();
      swift_allocObject();
      sub_21FAAE710();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_21FAAE770();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_21FAAC6DC()
{
  unint64_t v0 = sub_21FAAE980();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_21FAAC728()
{
  return 2;
}

uint64_t sub_21FAAC730(uint64_t a1, uint64_t a2, char a3, unsigned __int8 a4)
{
  if (!a3)
  {
    unint64_t v6 = 0xE800000000000000;
    uint64_t v5 = 0x4449656C646E7562;
    int v7 = a4;
    if (a4) {
      goto LABEL_9;
    }
LABEL_18:
    unint64_t v9 = 0xE800000000000000;
    if (v5 != 0x4449656C646E7562) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (a3 == 1) {
    uint64_t v5 = 0x79726F6765746163;
  }
  else {
    uint64_t v5 = 0x69616D6F44626577;
  }
  if (a3 == 1) {
    unint64_t v6 = 0xEA00000000004449;
  }
  else {
    unint64_t v6 = 0xE90000000000006ELL;
  }
  int v7 = a4;
  if (!a4) {
    goto LABEL_18;
  }
LABEL_9:
  if (v7 == 1) {
    uint64_t v8 = 0x79726F6765746163;
  }
  else {
    uint64_t v8 = 0x69616D6F44626577;
  }
  if (v7 == 1) {
    unint64_t v9 = 0xEA00000000004449;
  }
  else {
    unint64_t v9 = 0xE90000000000006ELL;
  }
  if (v5 != v8) {
    goto LABEL_21;
  }
LABEL_19:
  if (v6 == v9)
  {
    swift_bridgeObjectRelease_n();
    return a1;
  }
LABEL_21:
  char v10 = sub_21FAAE9F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    sub_21FAAC8AC();
    swift_allocError();
    swift_willThrow();
  }
  return a1;
}

unint64_t sub_21FAAC8AC()
{
  unint64_t result = qword_267EF3FE8;
  if (!qword_267EF3FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF3FE8);
  }
  return result;
}

uint64_t sub_21FAAC900(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_21FAAC948(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EF4008);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_21FAAC9A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_21FAAC128((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_21FAACA2C, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_21FAACA14(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_21FAACA2C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_21FAAC2C8(a1, a2);
}

uint64_t sub_21FAACA4C(unint64_t *a1, uint64_t *a2)
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

ValueMetadata *type metadata accessor for AnnotationError()
{
  return &type metadata for AnnotationError;
}

ValueMetadata *type metadata accessor for PaddingError()
{
  return &type metadata for PaddingError;
}

uint64_t sub_21FAACAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_21FAACAC0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_21FAACB58(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(_DWORD *)(v5 + 80);
  if (v7 <= 7 && (unint64_t)(v6 + 1) <= 0x18 && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(void *, void *))(v5 + 16))(a1, a2);
    *((unsigned char *)v4 + v6) = *((unsigned char *)a2 + v6);
  }
  else
  {
    uint64_t v10 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return v4;
}

uint64_t sub_21FAACC2C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_21FAACC58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  *(unsigned char *)(*(void *)(v5 + 48) + a1) = *(unsigned char *)(*(void *)(v5 + 48) + a2);
  return a1;
}

uint64_t sub_21FAACCC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  *(unsigned char *)(*(void *)(v5 + 40) + a1) = *(unsigned char *)(*(void *)(v5 + 40) + a2);
  return a1;
}

uint64_t sub_21FAACD28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(unsigned char *)(*(void *)(v5 + 32) + a1) = *(unsigned char *)(*(void *)(v5 + 32) + a2);
  return a1;
}

uint64_t sub_21FAACD90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  *(unsigned char *)(*(void *)(v5 + 24) + a1) = *(unsigned char *)(*(void *)(v5 + 24) + a2);
  return a1;
}

uint64_t sub_21FAACDF8(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0xFD) {
    unsigned int v7 = 253;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = v6 + 1;
  char v10 = 8 * (v6 + 1);
  if ((v6 + 1) <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if (v5 >= 0xFD) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      unsigned int v15 = *((unsigned __int8 *)a1 + v6);
      if (v15 >= 3) {
        return v15 - 2;
      }
      else {
        return 0;
      }
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_21FAACF7C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0xFD) {
    unsigned int v8 = 253;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  size_t v10 = v9 + 1;
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v9 != -1)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v9 + 1);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x21FAAD1B8);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v7 < 0xFD)
        {
          a1[v9] = a2 + 2;
        }
        else
        {
          int64_t v18 = *(void (**)(void))(v6 + 56);
          v18();
        }
      }
      return;
  }
}

uint64_t type metadata accessor for Annotated()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21FAAD1F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 48);
}

uint64_t sub_21FAAD200()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21FAAD298(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    size_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    BOOL v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *size_t v10 = *v11;
    v10[1] = v11[1];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_21FAAD39C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FAAD40C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21FAAD494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21FAAD528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_21FAAD5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unsigned int v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21FAAD630(_DWORD *a1, unsigned int a2, uint64_t a3)
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
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
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
        JUMPOUT(0x21FAAD77CLL);
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
  unint64_t v17 = *(void *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_21FAAD790(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
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
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
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
        goto LABEL_43;
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
LABEL_43:
      __break(1u);
      JUMPOUT(0x21FAAD970);
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
          int64_t v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            void *v18 = a2 ^ 0x80000000;
            v18[1] = 0;
          }
          else
          {
            v18[1] = a2 - 1;
          }
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

uint64_t type metadata accessor for Padded()
{
  return swift_getGenericMetadata();
}

unsigned char *_s22ManagedSettingsSupport15AnnotationErrorOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x21FAADA4CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DecoderError()
{
  return &type metadata for DecoderError;
}

unint64_t sub_21FAADA88()
{
  unint64_t result = qword_267EF4120;
  if (!qword_267EF4120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF4120);
  }
  return result;
}

unint64_t sub_21FAADAE0()
{
  unint64_t result = qword_267EF4128;
  if (!qword_267EF4128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF4128);
  }
  return result;
}

unint64_t sub_21FAADB38()
{
  unint64_t result = qword_267EF4130;
  if (!qword_267EF4130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF4130);
  }
  return result;
}

uint64_t type metadata accessor for Padded.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for Annotated.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_21FAADBBC()
{
  unint64_t result = qword_267EF4138;
  if (!qword_267EF4138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF4138);
  }
  return result;
}

unint64_t sub_21FAADC10()
{
  unint64_t result = qword_267EF4140[0];
  if (!qword_267EF4140[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267EF4140);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_21FAADC94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_21FAADCA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_21FAADCAC(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_21FAADD3C(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21FAADE08);
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

unsigned char *sub_21FAADE30(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

unsigned char *storeEnumTagSinglePayload for Annotation(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21FAADF08);
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

ValueMetadata *type metadata accessor for Annotation()
{
  return &type metadata for Annotation;
}

unint64_t sub_21FAADF44()
{
  unint64_t result = qword_267EF4248;
  if (!qword_267EF4248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF4248);
  }
  return result;
}

uint64_t sub_21FAADF98()
{
  return swift_getWitnessTable();
}

uint64_t sub_21FAADFB4()
{
  return swift_getWitnessTable();
}

uint64_t sub_21FAADFD0()
{
  return swift_getWitnessTable();
}

uint64_t sub_21FAADFEC()
{
  return swift_getWitnessTable();
}

uint64_t sub_21FAAE008()
{
  return swift_getWitnessTable();
}

uint64_t sub_21FAAE024()
{
  return swift_getWitnessTable();
}

unint64_t sub_21FAAE040()
{
  unint64_t result = qword_267EF4250;
  if (!qword_267EF4250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF4250);
  }
  return result;
}

BOOL static TeamIdentifierRetrieverError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TeamIdentifierRetrieverError.hash(into:)()
{
  return sub_21FAAEA50();
}

uint64_t TeamIdentifierRetrieverError.hashValue.getter()
{
  return sub_21FAAEA60();
}

uint64_t static TeamIdentifierRetriever.internalTeamIdentifier.getter()
{
  return 0x656C707041;
}

uint64_t static TeamIdentifierRetriever.simulatorTeamIdentifier.getter()
{
  return 0x6F74616C756D6953;
}

uint64_t static TeamIdentifierRetriever.teamIdentifierFromCurrentConnection()()
{
  id v0 = objc_msgSend(self, sel_currentConnection);
  unint64_t v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, sel_auditToken);
    long long v5 = v8;
    long long v6 = v7;

    long long v3 = v5;
    long long v2 = v6;
  }
  else
  {
    long long v2 = 0uLL;
    long long v3 = 0uLL;
  }
  long long v7 = v2;
  long long v8 = v3;
  BOOL v9 = v1 == 0;
  return sub_21FAAE2C8((uint64_t)&v7);
}

uint64_t static TeamIdentifierRetriever.teamIdentifier(from:)(uint64_t a1)
{
  return sub_21FAAE2C8(a1);
}

uint64_t sub_21FAAE210()
{
  id v0 = objc_msgSend(self, sel_currentConnection);
  unint64_t v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, sel_auditToken);
    long long v5 = v8;
    long long v6 = v7;

    long long v3 = v5;
    long long v2 = v6;
  }
  else
  {
    long long v2 = 0uLL;
    long long v3 = 0uLL;
  }
  long long v7 = v2;
  long long v8 = v3;
  BOOL v9 = v1 == 0;
  return sub_21FAAE2C8((uint64_t)&v7);
}

uint64_t sub_21FAAE2B0(uint64_t a1)
{
  return sub_21FAAE2C8(a1);
}

uint64_t sub_21FAAE2C8(uint64_t a1)
{
  sub_21FAAE594(a1, (uint64_t)&v12);
  if (v13)
  {
    sub_21FAAE5FC();
    swift_allocError();
    *long long v2 = 1;
LABEL_7:
    swift_willThrow();
    return v1;
  }
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  audit_token_t v11 = v12;
  SecTaskRef v4 = SecTaskCreateWithAuditToken(v3, &v11);
  if (!v4)
  {
    sub_21FAAE5FC();
    swift_allocError();
    *long long v6 = 0;
    goto LABEL_7;
  }
  SecTaskRef v5 = v4;
  uint64_t v1 = 0x656C707041;
  if ((sub_21FAA65C8() & 1) == 0)
  {
    uint64_t v8 = sub_21FAA6640(0x656C707041);
    if (v9)
    {
      uint64_t v1 = v8;
    }
    else
    {
      sub_21FAAE5FC();
      swift_allocError();
      *unint64_t v10 = 2;
      swift_willThrow();
    }
  }

  return v1;
}

unint64_t sub_21FAAE42C()
{
  unint64_t result = qword_267EF4258;
  if (!qword_267EF4258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF4258);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TeamIdentifierRetrieverError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21FAAE54CLL);
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

ValueMetadata *type metadata accessor for TeamIdentifierRetrieverError()
{
  return &type metadata for TeamIdentifierRetrieverError;
}

ValueMetadata *type metadata accessor for TeamIdentifierRetriever()
{
  return &type metadata for TeamIdentifierRetriever;
}

uint64_t sub_21FAAE594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD439B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21FAAE5FC()
{
  unint64_t result = qword_267EF4260;
  if (!qword_267EF4260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EF4260);
  }
  return result;
}

uint64_t sub_21FAAE650()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_21FAAE660()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_21FAAE670()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_21FAAE680()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_21FAAE690()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_21FAAE6A0()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_21FAAE6B0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_21FAAE6C0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_21FAAE6D0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_21FAAE6E0()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_21FAAE6F0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_21FAAE700()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_21FAAE710()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_21FAAE720()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_21FAAE730()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_21FAAE740()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_21FAAE750()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_21FAAE760()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_21FAAE770()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_21FAAE780()
{
  return MEMORY[0x270EF5808]();
}

uint64_t sub_21FAAE790()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_21FAAE7A0()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_21FAAE7B0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21FAAE7C0()
{
  return MEMORY[0x270EF5860]();
}

uint64_t sub_21FAAE7D0()
{
  return MEMORY[0x270EF5868]();
}

uint64_t sub_21FAAE7E0()
{
  return MEMORY[0x270EE3C00]();
}

uint64_t sub_21FAAE7F0()
{
  return MEMORY[0x270EEA9E8]();
}

uint64_t sub_21FAAE800()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_21FAAE810()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t sub_21FAAE820()
{
  return MEMORY[0x270EEAC50]();
}

uint64_t sub_21FAAE830()
{
  return MEMORY[0x270EEAC58]();
}

uint64_t sub_21FAAE840()
{
  return MEMORY[0x270EEAC70]();
}

uint64_t sub_21FAAE850()
{
  return MEMORY[0x270EEAC88]();
}

uint64_t sub_21FAAE860()
{
  return MEMORY[0x270EEACB8]();
}

uint64_t sub_21FAAE870()
{
  return MEMORY[0x270EEACC8]();
}

uint64_t sub_21FAAE880()
{
  return MEMORY[0x270EEACD8]();
}

uint64_t sub_21FAAE890()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21FAAE8A0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_21FAAE8B0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21FAAE8C0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21FAAE8D0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_21FAAE8E0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_21FAAE8F0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_21FAAE900()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_21FAAE910()
{
  return MEMORY[0x270F9D8A0]();
}

uint64_t sub_21FAAE920()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_21FAAE930()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_21FAAE940()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_21FAAE950()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_21FAAE960()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21FAAE970()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21FAAE980()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21FAAE990()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_21FAAE9A0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_21FAAE9B0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_21FAAE9C0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_21FAAE9D0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_21FAAE9E0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_21FAAE9F0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21FAAEA00()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21FAAEA10()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21FAAEA20()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21FAAEA30()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21FAAEA40()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21FAAEA50()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21FAAEA60()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21FAAEA70()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_21FAAEA80()
{
  return MEMORY[0x270F9FD98]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return MEMORY[0x270EFDCA8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void bzero(void *a1, size_t a2)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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