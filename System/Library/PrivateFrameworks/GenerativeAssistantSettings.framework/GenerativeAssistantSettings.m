GenerativeAssistantSettings::GenerativeAssistantSettingsIntentHelper::RequestType_optional __swiftcall GenerativeAssistantSettingsIntentHelper.RequestType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3) {
    v2 = rawValue;
  }
  *v1 = v2;
  return (GenerativeAssistantSettings::GenerativeAssistantSettingsIntentHelper::RequestType_optional)rawValue;
}

uint64_t GenerativeAssistantSettingsIntentHelper.RequestType.rawValue.getter()
{
  return *v0;
}

BOOL sub_24FA85EA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24FA85EB8()
{
  return sub_24FAC03C0();
}

GenerativeAssistantSettings::GenerativeAssistantSettingsIntentHelper::RequestType_optional sub_24FA85EE8(Swift::Int *a1)
{
  return GenerativeAssistantSettingsIntentHelper.RequestType.init(rawValue:)(*a1);
}

void sub_24FA85EF0(void *a1@<X8>)
{
  *a1 = *v1;
}

GenerativeAssistantSettings::GenerativeAssistantSettingsIntentHelper::ResponseType_optional __swiftcall GenerativeAssistantSettingsIntentHelper.ResponseType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (GenerativeAssistantSettings::GenerativeAssistantSettingsIntentHelper::ResponseType_optional)rawValue;
}

uint64_t sub_24FA85F10()
{
  return sub_24FAC03D0();
}

uint64_t sub_24FA85F58()
{
  return sub_24FAC03D0();
}

GenerativeAssistantSettings::GenerativeAssistantSettingsIntentHelper::ResponseType_optional sub_24FA85F9C(Swift::Int *a1)
{
  return GenerativeAssistantSettingsIntentHelper.ResponseType.init(rawValue:)(*a1);
}

void static GenerativeAssistantSettingsIntentHelper.responseType(for:isExplicitRequest:sessionId:withTamale:)(unsigned __int8 *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, char *a6@<X8>)
{
  int v43 = a5;
  uint64_t v42 = a3;
  int v45 = a2;
  uint64_t v9 = sub_24FABF290();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v44 = *a1;
  if (qword_269A4BA88 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24FABF440();
  __swift_project_value_buffer(v13, (uint64_t)qword_269A4E248);
  v14 = sub_24FABF410();
  os_log_type_t v15 = sub_24FAC0150();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v40 = a4;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v47 = v18;
    *(_DWORD *)uint64_t v17 = 136315650;
    uint64_t v46 = sub_24FA86AD8(0xD000000000000027, 0x800000024FAC0CD0, &v47);
    sub_24FAC01A0();
    v41 = v12;
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v46 = sub_24FA86AD8(0xD000000000000039, 0x800000024FAC3000, &v47);
    sub_24FAC01A0();
    *(_WORD *)(v17 + 22) = 2080;
    type metadata accessor for GenerativeAssistantSettingsUserDefaults();
    uint64_t v19 = static GenerativeAssistantSettingsUserDefaults.allUserDefaults()();
    uint64_t v46 = sub_24FA86AD8(v19, v20, &v47);
    v12 = v41;
    sub_24FAC01A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA83000, v14, v15, "%s.%s: \n%s", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v18, -1, -1);
    uint64_t v21 = v17;
    a4 = v40;
    MEMORY[0x25336CB50](v21, -1, -1);
  }

  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  v22 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60) {
    goto LABEL_22;
  }
  v23 = (void *)sub_24FABFFD0();
  unsigned int v24 = objc_msgSend(v22, sel_BOOLForKey_, v23);

  if (v24)
  {
    if ((v44 - 1) > 1)
    {
      if ((v43 & 1) == 0 && (!a4 || (MEMORY[0x25336B5C0](v42, a4) & 1) == 0)) {
        goto LABEL_29;
      }
    }
    else if ((v45 & 1) == 0)
    {
      v25 = (void *)qword_26B1FAC60;
      if (qword_26B1FAC60)
      {
        v26 = (void *)sub_24FABFFD0();
        unsigned int v27 = objc_msgSend(v25, sel_BOOLForKey_, v26);

        if (v27)
        {
          swift_bridgeObjectRetain();
          char v28 = sub_24FABF3F0();
          swift_bridgeObjectRelease();
          if ((v28 & 1) == 0)
          {
LABEL_29:
            *a6 = 1;
            return;
          }
        }
      }
    }
    *a6 = 3;
    return;
  }
  v29 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60
    || (v30 = (void *)sub_24FABFFD0(),
        unsigned __int8 v31 = objc_msgSend(v29, sel_BOOLForKey_, v30),
        v30,
        (v31 & 1) == 0))
  {
LABEL_22:
    if ((v45 & 1) == 0)
    {
      *a6 = 0;
      return;
    }
LABEL_23:
    *a6 = 2;
    return;
  }
  if (v45) {
    goto LABEL_23;
  }
  if (v44)
  {
    if (v44 == 1)
    {
      v32 = (void *)qword_26B1FAC60;
      if (qword_26B1FAC60)
      {
        v33 = (void *)sub_24FABFFD0();
        id v34 = objc_msgSend(v32, sel_integerForKey_, v33);
      }
      else
      {
        id v34 = 0;
      }
      type metadata accessor for GenerativeAssistantSettingsUserDefaults();
      static GenerativeAssistantSettingsUserDefaults.declineKnowledgeFallbackExpiration()((uint64_t)v12);
    }
    else
    {
      v37 = (void *)qword_26B1FAC60;
      if (qword_26B1FAC60)
      {
        v38 = (void *)sub_24FABFFD0();
        id v34 = objc_msgSend(v37, sel_integerForKey_, v38);
      }
      else
      {
        id v34 = 0;
      }
      type metadata accessor for GenerativeAssistantSettingsUserDefaults();
      static GenerativeAssistantSettingsUserDefaults.declineComposeViaSiriExpiration()((uint64_t)v12);
    }
  }
  else
  {
    v35 = (void *)qword_26B1FAC60;
    if (qword_26B1FAC60)
    {
      v36 = (void *)sub_24FABFFD0();
      id v34 = objc_msgSend(v35, sel_integerForKey_, v36);
    }
    else
    {
      id v34 = 0;
    }
    type metadata accessor for GenerativeAssistantSettingsUserDefaults();
    static GenerativeAssistantSettingsUserDefaults.declineMediaQAExpiration()((uint64_t)v12);
  }
  sub_24FA86584((uint64_t)v34, (uint64_t)v12, a6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_24FA86584@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  id v34 = a3;
  uint64_t v5 = sub_24FABF290();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v30 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v32 = (char *)&v29 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v29 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v29 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v29 - v17;
  sub_24FABF280();
  char v19 = sub_24FA87640();
  uint64_t v29 = v6;
  unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v31 = a2;
  v20(v16, a2, v5);
  v20(v13, (uint64_t)v18, v5);
  uint64_t v33 = a1;
  if ((v19 & 1) == 0 || a1 < 1)
  {
    v22 = *(void (**)(char *, uint64_t))(v6 + 8);
    v22(v13, v5);
    v22(v16, v5);
LABEL_6:
    v26 = v32;
    v20(v32, v31, v5);
    unsigned int v27 = v30;
    v20(v30, (uint64_t)v18, v5);
    if (v33 < 2)
    {
      v22(v27, v5);
      v22(v26, v5);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v22)(v18, v5);
      v25 = v34;
    }
    else
    {
      char v28 = sub_24FABF250();
      v22(v27, v5);
      v22(v26, v5);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v22)(v18, v5);
      v25 = v34;
      if (v28)
      {
        char v24 = 0;
        goto LABEL_11;
      }
    }
    char v24 = 2;
    goto LABEL_11;
  }
  char v21 = sub_24FABF250();
  v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  v22(v13, v5);
  v22(v16, v5);
  if ((v21 & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v22)(v18, v5);
  char v24 = 0;
  v25 = v34;
LABEL_11:
  char *v25 = v24;
  return result;
}

void static GenerativeAssistantSettingsIntentHelper.responseType(for:isExplicitRequest:)(unsigned __int8 *a1@<X0>, int a2@<W1>, char *a3@<X8>)
{
  unsigned __int8 v3 = *a1;
  static GenerativeAssistantSettingsIntentHelper.responseType(for:isExplicitRequest:sessionId:withTamale:)(&v3, a2, 0, 0, 0, a3);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_24FA86924(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_24FA86930(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_24FA86938@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_24FA8694C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_24FA8697C(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_24FA86990(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_24FA869A4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24FA869B0(uint64_t result, unsigned char **a2)
{
  char v2 = *a2;
  *char v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24FA869C0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24FA869FC(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();

  return MEMORY[0x270FA0128](v1, 0);
}

uint64_t sub_24FA86A38(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24FA86A60(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_24FA86AD8(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_24FAC01A0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_24FA86AD8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24FA86BAC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24FA8759C((uint64_t)v12, *a3);
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
      sub_24FA8759C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24FA86BAC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24FAC01B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24FA86D68(a5, a6);
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
  uint64_t v8 = sub_24FAC0270();
  if (!v8)
  {
    sub_24FAC02C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24FAC02F0();
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

uint64_t sub_24FA86D68(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24FA86E00(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24FA86FE0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24FA86FE0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24FA86E00(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24FA86F78(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24FAC0240();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24FAC02C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24FAC0020();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24FAC02F0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24FAC02C0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24FA86F78(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A4BB10);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24FA86FE0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269A4BB10);
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
  uint64_t result = sub_24FAC02F0();
  __break(1u);
  return result;
}

unsigned char **sub_24FA87130(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

unint64_t sub_24FA87144()
{
  unint64_t result = qword_269A4BAA0;
  if (!qword_269A4BAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BAA0);
  }
  return result;
}

unint64_t sub_24FA8719C()
{
  unint64_t result = qword_269A4BAA8;
  if (!qword_269A4BAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BAA8);
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsIntentHelper()
{
  return &type metadata for GenerativeAssistantSettingsIntentHelper;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GenerativeAssistantSettingsIntentHelper.RequestType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GenerativeAssistantSettingsIntentHelper.RequestType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24FA8736CLL);
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

uint64_t sub_24FA87394(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24FA873A0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsIntentHelper.RequestType()
{
  return &type metadata for GenerativeAssistantSettingsIntentHelper.RequestType;
}

uint64_t getEnumTagSinglePayload for GenerativeAssistantSettingsIntentHelper.ResponseType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GenerativeAssistantSettingsIntentHelper.ResponseType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24FA87514);
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

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsIntentHelper.ResponseType()
{
  return &type metadata for GenerativeAssistantSettingsIntentHelper.ResponseType;
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

uint64_t sub_24FA8759C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

uint64_t sub_24FA87640()
{
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  v0 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60) {
    return 0;
  }
  uint64_t v1 = (void *)sub_24FABFFD0();
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_integerForKey_, v1);

  if (v2 > 1) {
    return 1;
  }
  uint64_t v3 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60) {
    return 0;
  }
  unsigned int v4 = (void *)sub_24FABFFD0();
  uint64_t v5 = (uint64_t)objc_msgSend(v3, sel_integerForKey_, v4);

  if (v5 > 1) {
    return 1;
  }
  unsigned int v6 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60
    && (BOOL v7 = (void *)sub_24FABFFD0(), v8 = (uint64_t)objc_msgSend(v6, sel_integerForKey_, v7), v7, v8 > 1))
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_24FA877A0(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  v2[4] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBD0);
  v2[5] = swift_task_alloc();
  uint64_t v3 = sub_24FABF480();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  uint64_t v4 = sub_24FABF5D0();
  v2[9] = v4;
  v2[10] = *(void *)(v4 - 8);
  v2[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  v2[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FA8794C, 0, 0);
}

uint64_t sub_24FA8794C()
{
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  uint64_t v4 = v0[3];
  sub_24FABF580();
  sub_24FA897D4(v4 + OBJC_IVAR____TtC27GenerativeAssistantSettings25OpenAIAuthenticatorHelper__authenticationSession, v2, &qword_269A4BBD0);
  sub_24FA88D88(v1);
  sub_24FA89838(v2, &qword_269A4BBD0);
  sub_24FABF1E0();
  uint64_t v5 = sub_24FABF200();
  v0[13] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v0[14] = v6;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v3, 1, v5);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = (void *)swift_task_alloc();
    v0[15] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_24FA87AC0;
    uint64_t v9 = v0[12];
    uint64_t v10 = v0[8];
    return sub_24FA87E8C(v9, v10);
  }
  return result;
}

uint64_t sub_24FA87AC0()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 88);
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  uint64_t v5 = *(void *)(*(void *)v1 + 72);
  uint64_t v6 = *(void *)(*(void *)v1 + 64);
  uint64_t v7 = *(void *)(*(void *)v1 + 56);
  uint64_t v8 = *(void *)(*(void *)v1 + 48);
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (v0)
  {
    uint64_t v9 = sub_24FA87DC4;
  }
  else
  {
    (*(void (**)(void, void))(v2[14] + 8))(v2[4], v2[13]);
    uint64_t v9 = sub_24FA87CB8;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_24FA87CB8()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = sub_24FABF500();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v1, 0, 1, v4);
  sub_24FA89894(v1, v2, &qword_269A4BBC0);
  *(unsigned char *)(v3 + OBJC_IVAR____TtC27GenerativeAssistantSettings25OpenAIAuthenticatorHelper_isBusy) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24FA87DC4()
{
  uint64_t v1 = v0[3];
  (*(void (**)(void, void))(v0[14] + 8))(v0[4], v0[13]);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC27GenerativeAssistantSettings25OpenAIAuthenticatorHelper_isBusy) = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_24FA87E8C(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBE0);
  v2[4] = swift_task_alloc();
  uint64_t v3 = sub_24FABF200();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  v2[9] = swift_task_alloc();
  uint64_t v4 = sub_24FABF5D0();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v5 = sub_24FABF5B0();
  v2[13] = v5;
  v2[14] = *(void *)(v5 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FA88084, 0, 0);
}

uint64_t sub_24FA88084()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBE8);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8D310];
  *(_OWORD *)(v4 + 16) = xmmword_24FAC0EC0;
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 32) = 0x6E496E676973;
  *(void *)(v4 + 40) = 0xE600000000000000;
  sub_24FAC03A0();
  swift_bridgeObjectRelease();
  sub_24FABF580();
  sub_24FABF1E0();
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  if (v6 == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = v0[11];
    uint64_t v11 = v0[12];
    uint64_t v14 = v0[9];
    uint64_t v13 = v0[10];
    uint64_t v15 = v0[6];
    uint64_t v17 = v0[4];
    uint64_t v16 = v0[5];
    sub_24FABF560();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v0[17] = v18;
    v0[18] = (v15 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v18(v14, v16);
    sub_24FABF590();
    sub_24FABF450();
    uint64_t v19 = sub_24FABF460();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 0, 1, v19);
    unint64_t v20 = (void *)swift_task_alloc();
    v0[19] = v20;
    *unint64_t v20 = v0;
    v20[1] = sub_24FA882D0;
    uint64_t v7 = v0[7];
    uint64_t v6 = v0[8];
    uint64_t v10 = v0[4];
    uint64_t v8 = 0x68632D656C707061;
    unint64_t v9 = 0xED00007470677461;
  }
  return MEMORY[0x270F07EE0](v6, v7, v8, v9, v10);
}

uint64_t sub_24FA882D0()
{
  uint64_t v2 = (void *)*v1;
  v2[20] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = (void (*)(uint64_t, uint64_t))v2[17];
    uint64_t v4 = v2[7];
    uint64_t v5 = v2[5];
    sub_24FA89838(v2[4], &qword_269A4BBE0);
    v3(v4, v5);
    return MEMORY[0x270FA2498](sub_24FA886EC, 0, 0);
  }
  else
  {
    uint64_t v6 = (void (*)(uint64_t, uint64_t))v2[17];
    uint64_t v8 = v2[15];
    uint64_t v7 = v2[16];
    uint64_t v9 = v2[13];
    uint64_t v10 = v2[14];
    uint64_t v11 = v2[7];
    uint64_t v12 = v2[5];
    sub_24FA89838(v2[4], &qword_269A4BBE0);
    v6(v11, v12);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v7, v9);
    uint64_t v13 = (void *)swift_task_alloc();
    v2[21] = v13;
    *uint64_t v13 = v2;
    v13[1] = sub_24FA884E8;
    uint64_t v14 = v2[8];
    uint64_t v15 = v2[2];
    return MEMORY[0x270F0C1F8](v15, v14);
  }
}

uint64_t sub_24FA884E8()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24FA887C4;
  }
  else {
    uint64_t v2 = sub_24FA885FC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24FA885FC()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 112);
  (*(void (**)(void, void))(v0 + 136))(*(void *)(v0 + 64), *(void *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24FA886EC()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[16], v0[13]);
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

uint64_t sub_24FA887C4()
{
  (*(void (**)(void, void))(v0 + 136))(*(void *)(v0 + 64), *(void *)(v0 + 40));
  (*(void (**)(void, void))(*(void *)(v0 + 112) + 8))(*(void *)(v0 + 128), *(void *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24FA888AC()
{
  sub_24FA89838(v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings25OpenAIAuthenticatorHelper__authenticationSession, &qword_269A4BBD0);
  sub_24FA89838(v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings25OpenAIAuthenticatorHelper__credentials, &qword_269A4BBF8);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24FA88930()
{
  return type metadata accessor for OpenAIAuthenticatorHelper();
}

uint64_t type metadata accessor for OpenAIAuthenticatorHelper()
{
  uint64_t result = qword_269A4BB98;
  if (!qword_269A4BB98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24FA88984()
{
  sub_24FA88A58();
  if (v0 <= 0x3F)
  {
    sub_24FA88AB0();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_24FA88A58()
{
  if (!qword_269A4BBB0)
  {
    sub_24FABF480();
    unint64_t v0 = sub_24FABF6A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269A4BBB0);
    }
  }
}

void sub_24FA88AB0()
{
  if (!qword_269A4BBB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4BBC0);
    unint64_t v0 = sub_24FABFC70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269A4BBB8);
    }
  }
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

uint64_t sub_24FA88B54()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBF8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24FABF5D0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v18 - v13;
  uint64_t v15 = (uint64_t *)(v1 + OBJC_IVAR____TtC27GenerativeAssistantSettings25OpenAIAuthenticatorHelper__authenticationSession);
  *uint64_t v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBF0);
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = v1 + OBJC_IVAR____TtC27GenerativeAssistantSettings25OpenAIAuthenticatorHelper__credentials;
  sub_24FABF580();
  sub_24FABF510();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_24FA897D4((uint64_t)v14, (uint64_t)v12, &qword_269A4BBC0);
  sub_24FABFC40();
  sub_24FA89838((uint64_t)v14, &qword_269A4BBC0);
  sub_24FA89894((uint64_t)v4, v16, &qword_269A4BBF8);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC27GenerativeAssistantSettings25OpenAIAuthenticatorHelper_isBusy) = 0;
  return v1;
}

uint64_t sub_24FA88D88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24FABF800();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FA897D4(v2, (uint64_t)v10, &qword_269A4BBF0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_24FABF480();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_24FAC0170();
    uint64_t v14 = sub_24FABFA80();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = sub_24FA86AD8(0xD000000000000018, 0x800000024FAC3320, &v20);
      sub_24FAC01A0();
      _os_log_impl(&dword_24FA83000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336CB50](v18, -1, -1);
      MEMORY[0x25336CB50](v16, -1, -1);
    }

    sub_24FABF7F0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_24FA89040(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_24FA89078(uint64_t (*a1)(void))
{
  return a1();
}

void sub_24FA890A0(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_24FAC01A0();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t sub_24FA89158()
{
  uint64_t v1 = sub_24FABF440();
  v0[4] = v1;
  v0[5] = *(void *)(v1 - 8);
  v0[6] = swift_task_alloc();
  uint64_t v2 = sub_24FABF5D0();
  v0[7] = v2;
  v0[8] = *(void *)(v2 - 8);
  v0[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FA89270, 0, 0);
}

uint64_t sub_24FA89270()
{
  sub_24FABF580();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  void *v1 = v0;
  v1[1] = sub_24FA8930C;
  return MEMORY[0x270F0C208]();
}

uint64_t sub_24FA8930C()
{
  uint64_t v2 = *(void *)(*v1 + 72);
  uint64_t v3 = *(void *)(*v1 + 64);
  uint64_t v4 = *(void *)(*v1 + 56);
  uint64_t v5 = *v1;
  *(void *)(v5 + 88) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24FA894C0, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_24FA894C0()
{
  char v24 = v0;
  if (qword_269A4BA90 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)v0[11];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v5 = __swift_project_value_buffer(v1, (uint64_t)qword_269A4E260);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v1);
  id v6 = v2;
  id v7 = v2;
  uint64_t v8 = sub_24FABF410();
  os_log_type_t v9 = sub_24FAC0160();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = (void *)v0[11];
  uint64_t v13 = v0[5];
  uint64_t v12 = v0[6];
  uint64_t v14 = v0[4];
  if (v10)
  {
    uint64_t v22 = v0[6];
    uint64_t v15 = swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v23 = v21;
    *(_DWORD *)uint64_t v15 = 136315394;
    v0[2] = sub_24FA86AD8(0x4F74754F6E676973, 0xEF292849416E6570, &v23);
    sub_24FAC01A0();
    *(_WORD *)(v15 + 12) = 2112;
    id v16 = v11;
    uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v17;
    sub_24FAC01A0();
    *uint64_t v20 = v17;

    _os_log_impl(&dword_24FA83000, v8, v9, "%s: OpenAIAuthenticator.shared.signOut() exception: %@", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BC08);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v20, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v21, -1, -1);
    MEMORY[0x25336CB50](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v22, v14);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_24FA897B0()
{
  return sub_24FABF740();
}

uint64_t sub_24FA897D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24FA89838(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24FA89894(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24FA898F8()
{
  return sub_24FAC03D0();
}

uint64_t sub_24FA899D8()
{
  return sub_24FAC03D0();
}

uint64_t sub_24FA89A44()
{
  return sub_24FAC03D0();
}

unint64_t GenerativeAssistantSettingsDestination.entityIdentifierString.getter()
{
  unint64_t result = *v0;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x656C62616E457369;
      break;
    case 2:
      unint64_t result = 0x6F72507075746573;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0x43746E756F636361;
      break;
    case 5:
      unint64_t result = 0x696D694C65746172;
      break;
    case 6:
      unint64_t result = 0x6168437055746573;
      break;
    case 7:
      unint64_t result = 0x6E496E676973;
      break;
    case 8:
      unint64_t result = 0x74754F6E676973;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t GenerativeAssistantSettingsDestination.rawValue.getter()
{
  unint64_t result = *v0;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x656C62616E457369;
      break;
    case 2:
      unint64_t result = 0x6F72507075746573;
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0x43746E756F636361;
      break;
    case 5:
      unint64_t result = 0x696D694C65746172;
      break;
    case 6:
      unint64_t result = 0x6168437055746573;
      break;
    case 7:
      unint64_t result = 0x6E496E676973;
      break;
    case 8:
      unint64_t result = 0x74754F6E676973;
      break;
    default:
      return result;
  }
  return result;
}

void sub_24FA89DD4()
{
  qword_269A4BC10 = 0x6C616E7265747845;
  *(void *)algn_269A4BC18 = 0xEF6C65646F4D4941;
}

void sub_24FA89E04()
{
  qword_269A4E1F0 = 0x6E696769726FLL;
  *(void *)algn_269A4E1F8 = 0xE600000000000000;
}

void sub_24FA89E24()
{
  qword_269A4E200 = 2003134838;
  *(void *)algn_269A4E208 = 0xE400000000000000;
}

uint64_t sub_24FA89E40()
{
  sub_24FAC0230();
  uint64_t result = swift_bridgeObjectRelease();
  if (qword_269A4BA40 != -1) {
    uint64_t result = swift_once();
  }
  qword_269A4BC20 = 0xD00000000000003DLL;
  *(void *)algn_269A4BC28 = 0x800000024FAC3340;
  return result;
}

uint64_t GenerativeAssistantSettingsDestination.fullURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269A4BA58 != -1) {
    swift_once();
  }
  v8[0] = qword_269A4BC20;
  v8[1] = *(void *)algn_269A4BC28;
  swift_bridgeObjectRetain();
  sub_24FAC0010();
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  sub_24FABF1E0();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_24FABF200();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    __break(1u);
    JUMPOUT(0x24FA8A168);
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
}

GenerativeAssistantSettings::GenerativeAssistantSettingsDestination::Origin_optional __swiftcall GenerativeAssistantSettingsDestination.Origin.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24FAC0300();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

unint64_t GenerativeAssistantSettingsDestination.Origin.rawValue.getter()
{
  unint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 1769105779;
      break;
    case 3:
      unint64_t result = 0x54676E6974697277;
      break;
    default:
      unint64_t result = 0x54504774616863;
      break;
  }
  return result;
}

uint64_t sub_24FA8A27C(unsigned __int8 *a1, char *a2)
{
  return sub_24FA91978(*a1, *a2);
}

uint64_t sub_24FA8A288()
{
  return sub_24FA898F8();
}

uint64_t sub_24FA8A290()
{
  return sub_24FA91DF4();
}

uint64_t sub_24FA8A298()
{
  return sub_24FA91F7C();
}

GenerativeAssistantSettings::GenerativeAssistantSettingsDestination::Origin_optional sub_24FA8A2A0(Swift::String *a1)
{
  return GenerativeAssistantSettingsDestination.Origin.init(rawValue:)(*a1);
}

unint64_t sub_24FA8A2AC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = GenerativeAssistantSettingsDestination.Origin.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

GenerativeAssistantSettings::GenerativeAssistantSettingsDestination_optional __swiftcall GenerativeAssistantSettingsDestination.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24FAC0300();
  result.value = swift_bridgeObjectRelease();
  char v5 = 9;
  if (v3 < 9) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t GenerativeAssistantSettingsDestination.fullURL(origin:)()
{
  uint64_t v1 = sub_24FABF140();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_24FABF200();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12[15] = *v0;
  GenerativeAssistantSettingsDestination.fullURL.getter((uint64_t)v8);
  if (qword_269A4BA48 != -1) {
    swift_once();
  }
  sub_24FABF130();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BC30);
  unint64_t v9 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_24FAC0EC0;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v2 + 16))(v10 + v9, v4, v1);
  sub_24FABF1F0();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

GenerativeAssistantSettings::GenerativeAssistantSettingsDestination_optional static GenerativeAssistantSettingsDestination.entityIdentifier(for:)(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = a1;
  uint64_t v5 = a2;

  return GenerativeAssistantSettingsDestination.init(rawValue:)(*(Swift::String *)&v4);
}

GenerativeAssistantSettings::GenerativeAssistantSettingsDestination::Action_optional __swiftcall GenerativeAssistantSettingsDestination.Action.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_24FAC0300();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t GenerativeAssistantSettingsDestination.Action.rawValue.getter()
{
  return *(void *)&aSetupchasignin[8 * *v0];
}

uint64_t sub_24FA8A6D8(char *a1, char *a2)
{
  return sub_24FA91B00(*a1, *a2);
}

uint64_t sub_24FA8A6E4()
{
  return sub_24FA899D8();
}

uint64_t sub_24FA8A6EC()
{
  return sub_24FA91EC0();
}

uint64_t sub_24FA8A6F4()
{
  return sub_24FA91F14();
}

GenerativeAssistantSettings::GenerativeAssistantSettingsDestination::Action_optional sub_24FA8A6FC(Swift::String *a1)
{
  return GenerativeAssistantSettingsDestination.Action.init(rawValue:)(*a1);
}

uint64_t sub_24FA8A708@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = GenerativeAssistantSettingsDestination.Action.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void *static GenerativeAssistantSettingsDestination.allCases.getter()
{
  return &unk_270120A58;
}

unint64_t sub_24FA8A740()
{
  unint64_t result = qword_269A4BC38;
  if (!qword_269A4BC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BC38);
  }
  return result;
}

unint64_t sub_24FA8A798()
{
  unint64_t result = qword_269A4BC40;
  if (!qword_269A4BC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BC40);
  }
  return result;
}

uint64_t sub_24FA8A7EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24FA9166C(*a1, *a2);
}

unint64_t sub_24FA8A7FC()
{
  unint64_t result = qword_269A4BC48;
  if (!qword_269A4BC48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BC48);
  }
  return result;
}

uint64_t sub_24FA8A850()
{
  return sub_24FAC03D0();
}

uint64_t sub_24FA8A898()
{
  return sub_24FA91C84();
}

uint64_t sub_24FA8A8A0()
{
  return sub_24FAC03D0();
}

GenerativeAssistantSettings::GenerativeAssistantSettingsDestination_optional sub_24FA8A8E4(Swift::String *a1)
{
  return GenerativeAssistantSettingsDestination.init(rawValue:)(*a1);
}

unint64_t sub_24FA8A8F0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = GenerativeAssistantSettingsDestination.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_24FA8A91C()
{
  unint64_t result = qword_269A4BC50;
  if (!qword_269A4BC50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4BC58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BC50);
  }
  return result;
}

void sub_24FA8A978(void *a1@<X8>)
{
  *a1 = &unk_270120A58;
}

GenerativeAssistantSettings::GenerativeAssistantSettingsDestination_optional sub_24FA8A98C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  uint64_t v4 = a1;
  uint64_t v5 = a2;

  return GenerativeAssistantSettingsDestination.init(rawValue:)(*(Swift::String *)&v4);
}

uint64_t getEnumTagSinglePayload for GenerativeAssistantSettingsDestination(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GenerativeAssistantSettingsDestination(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x24FA8AB3CLL);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsDestination()
{
  return &type metadata for GenerativeAssistantSettingsDestination;
}

unsigned char *storeEnumTagSinglePayload for GenerativeAssistantSettingsDestination.Origin(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24FA8AC40);
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

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsDestination.Origin()
{
  return &type metadata for GenerativeAssistantSettingsDestination.Origin;
}

unsigned char *storeEnumTagSinglePayload for GenerativeAssistantSettingsDestination.Action(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24FA8AD44);
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

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsDestination.Action()
{
  return &type metadata for GenerativeAssistantSettingsDestination.Action;
}

GenerativeAssistantSettings::EnablementUIDismissType_optional __swiftcall EnablementUIDismissType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (GenerativeAssistantSettings::EnablementUIDismissType_optional)rawValue;
}

uint64_t EnablementUIDismissType.rawValue.getter()
{
  return *v0;
}

GenerativeAssistantSettings::EnablementUIDismissType_optional sub_24FA8AD98(Swift::Int *a1)
{
  return EnablementUIDismissType.init(rawValue:)(*a1);
}

uint64_t GenerativeAssistantSettingsOnboarding.init(enablementDelegate:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)(a2 + 40) = 518;
  return sub_24FA8ADB0(a1, a2);
}

uint64_t sub_24FA8ADB0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t GenerativeAssistantSettingsOnboarding.init(enablementDelegate:requestType:)@<X0>(long long *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v4 = *a2;
  *(unsigned char *)(a3 + 41) = 2;
  uint64_t result = sub_24FA8ADB0(a1, a3);
  *(unsigned char *)(a3 + 40) = v4;
  return result;
}

uint64_t GenerativeAssistantSettingsOnboarding.init(enablementDelegate:isExplicitRequest:)@<X0>(long long *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  *(unsigned char *)(a3 + 40) = 6;
  uint64_t result = sub_24FA8ADB0(a1, a3);
  *(unsigned char *)(a3 + 41) = a2;
  return result;
}

uint64_t GenerativeAssistantSettingsOnboarding.init(enablementDelegate:requestType:isExplicitRequest:)@<X0>(long long *a1@<X0>, char *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  char v6 = *a2;
  uint64_t result = sub_24FA8ADB0(a1, a4);
  *(unsigned char *)(a4 + 40) = v6;
  *(unsigned char *)(a4 + 41) = a3;
  return result;
}

id GenerativeAssistantSettingsOnboarding.makeUIViewController(context:)()
{
  type metadata accessor for GenerativeAssistantEnablementNavigationController(0);
  sub_24FA8AEF0(v0, (uint64_t)v3);
  char v2 = *(unsigned char *)(v0 + 40);
  return GenerativeAssistantEnablementNavigationController.__allocating_init(enablementDelegate:requestType:isExplicitRequest:)(v3, &v2, *(unsigned char *)(v0 + 41));
}

uint64_t type metadata accessor for GenerativeAssistantEnablementNavigationController(uint64_t a1)
{
  return sub_24FA90078(a1, (uint64_t *)&unk_269A4BCB0);
}

uint64_t sub_24FA8AEF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id GenerativeAssistantEnablementNavigationController.__allocating_init(enablementDelegate:requestType:isExplicitRequest:)(long long *a1, char *a2, char a3)
{
  char v6 = *a2;
  id v7 = objc_msgSend(objc_allocWithZone(v3), sel_init);
  objc_msgSend(v7, sel_setModalInPresentation_, 1);
  sub_24FA8ADB0(a1, (uint64_t)v10);
  uint64_t v8 = (uint64_t)v7
     + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_enablementDelegate;
  swift_beginAccess();
  sub_24FA8B018((uint64_t)v10, v8);
  swift_endAccess();
  *((unsigned char *)v7
  + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_requestType) = v6;
  *((unsigned char *)v7
  + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_isExplicitRequest) = a3;

  return v7;
}

uint64_t sub_24FA8B018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BC70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_24FA8B084()
{
  type metadata accessor for GenerativeAssistantEnablementNavigationController(0);
  sub_24FA8AEF0(v0, (uint64_t)v3);
  char v2 = *(unsigned char *)(v0 + 40);
  return GenerativeAssistantEnablementNavigationController.__allocating_init(enablementDelegate:requestType:isExplicitRequest:)(v3, &v2, *(unsigned char *)(v0 + 41));
}

uint64_t sub_24FA8B0E8()
{
  return sub_24FABFA10();
}

uint64_t sub_24FA8B124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24FA8FE20();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_24FA8B188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24FA8FE20();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

uint64_t sub_24FA8B1EC()
{
  return sub_24FABFBA0();
}

void sub_24FA8B208()
{
}

void sub_24FA8B230()
{
  uint64_t v1 = v0;
  v28.receiver = v0;
  v28.super_class = (Class)type metadata accessor for GenerativeAssistantEnablementNavigationController(0);
  objc_msgSendSuper2(&v28, sel_viewDidLoad);
  id v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_msgSend(self, sel_systemBlueColor);
    objc_msgSend(v3, sel_setTintColor_, v4);

    id v5 = objc_msgSend(self, sel_currentDevice);
    objc_msgSend(v5, sel_userInterfaceIdiom);

    id v6 = (id)MobileGestalt_get_current_device();
    if (v6)
    {
      id v7 = v6;
      MobileGestalt_get_cameraButtonCapability();

      uint64_t v8 = *(void **)&v1[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_logo];
      id v9 = objc_allocWithZone(MEMORY[0x263F5B918]);
      id v10 = v8;
      uint64_t v11 = (void *)sub_24FABFFD0();
      unsigned int v27 = v1;
      uint64_t v12 = (void *)sub_24FABFFD0();
      swift_bridgeObjectRelease();
      id v26 = objc_msgSend(v9, sel_initWithTitle_detailText_icon_, v11, v12, v10);

      id v13 = objc_allocWithZone(MEMORY[0x263F5B918]);
      id v14 = v10;
      uint64_t v15 = (void *)sub_24FABFFD0();
      id v16 = (void *)sub_24FABFFD0();
      swift_bridgeObjectRelease();
      id v17 = objc_msgSend(v13, sel_initWithTitle_detailText_icon_, v15, v16, v14);

      id v18 = objc_allocWithZone(MEMORY[0x263F5B918]);
      id v19 = v14;
      uint64_t v20 = (void *)sub_24FABFFD0();
      uint64_t v21 = (void *)sub_24FABFFD0();
      swift_bridgeObjectRelease();
      id v22 = objc_msgSend(v18, sel_initWithTitle_detailText_icon_, v20, v21, v19);

      sub_24FA8B8B0(v26, v17);
      sub_24FA8C374(v17, v22);
      sub_24FA8CA24(v22);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BC88);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_24FAC1290;
      *(void *)(v23 + 32) = v26;
      sub_24FAC0070();
      sub_24FA8FF90(0, &qword_269A4BC90);
      id v24 = v26;
      uint64_t v25 = (void *)sub_24FAC0040();
      swift_bridgeObjectRelease();
      objc_msgSend(v27, sel_setViewControllers_animated_, v25, 0);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_24FA8B69C(unsigned char *a1, unsigned __int8 *a2)
{
  int v3 = *a1;
  int v4 = *a2;
  if ((v3 - 1) >= 2)
  {
    if (*a1)
    {
      if (qword_26B1FAC40 != -1) {
        swift_once();
      }
      id v7 = (void *)qword_26B1FAC60;
      if (qword_26B1FAC60)
      {
        uint64_t v8 = (void *)sub_24FABFFD0();
        objc_msgSend(v7, sel_setBool_forKey_, 1, v8);
      }
    }
    else if (v4 != 6)
    {
      int v5 = *(unsigned __int8 *)(v2
                              + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_isExplicitRequest);
      if (v5 != 2 && (v5 & 1) == 0)
      {
        v18[0] = *a2;
        _s27GenerativeAssistantSettings0abC12UserDefaultsC16incrementDecline3foryAA11RequestTypeO_tFZ_0(v18);
      }
    }
  }
  uint64_t v9 = v2
     + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_enablementDelegate;
  swift_beginAccess();
  sub_24FA897D4(v9, (uint64_t)v18, &qword_269A4BC70);
  if (!v19) {
    return sub_24FA89838((uint64_t)v18, &qword_269A4BC70);
  }
  sub_24FA8AEF0((uint64_t)v18, (uint64_t)v15);
  sub_24FA89838((uint64_t)v18, &qword_269A4BC70);
  uint64_t v10 = v16;
  uint64_t v11 = v17;
  __swift_project_boxed_opaque_existential_1(v15, v16);
  char v14 = v3;
  char v13 = v4;
  (*(void (**)(char *, char *, uint64_t, uint64_t))(v11 + 8))(&v14, &v13, v10, v11);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
}

void sub_24FA8B8B0(void *a1, void *a2)
{
  int v3 = v2;
  uint64_t v6 = sub_24FABF870();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v62 = type metadata accessor for CaptionWithModalLink(0);
  MEMORY[0x270FA5388](v62);
  uint64_t v8 = (uint64_t *)((char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v9 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v9, sel_userInterfaceIdiom);

  id v10 = objc_msgSend(a1, sel_navigationItem);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v3, sel_dismissedWithCancel);
  objc_msgSend(v10, sel_setRightBarButtonItem_, v11);

  uint64_t v12 = (void *)sub_24FABFFD0();
  char v13 = (void *)sub_24FABFFD0();
  char v14 = (void *)sub_24FABFFD0();
  objc_msgSend(a1, sel_addBulletedListItemWithTitle_description_symbolName_, v12, v13, v14);

  id v15 = (id)MobileGestalt_get_current_device();
  if (!v15)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v16 = v15;
  id v61 = a2;
  int cameraButtonCapability = MobileGestalt_get_cameraButtonCapability();

  if (cameraButtonCapability)
  {
    id v18 = (void *)sub_24FABFFD0();
    uint64_t v19 = (void *)sub_24FABFFD0();
    uint64_t v20 = (void *)sub_24FABFFD0();
    objc_msgSend(a1, sel_addBulletedListItemWithTitle_description_symbolName_, v18, v19, v20);
  }
  uint64_t v21 = (void *)sub_24FABFFD0();
  id v22 = (void *)sub_24FABFFD0();
  uint64_t v23 = sub_24FABFFD0();
  objc_msgSend(a1, sel_addBulletedListItemWithTitle_description_symbolName_, v21, v22, v23);

  id v24 = (void *)sub_24FABFFD0();
  uint64_t v25 = (void *)sub_24FABFFD0();
  swift_bridgeObjectRelease();
  id v26 = (void *)sub_24FABFFD0();
  objc_msgSend(a1, sel_addBulletedListItemWithTitle_description_symbolName_, v24, v25, v26);

  id v27 = objc_msgSend(self, sel_boldButton);
  objc_super v28 = (void *)sub_24FABFFD0();
  objc_msgSend(v27, sel_setTitle_forState_, v28, 0);

  sub_24FA8FF90(0, &qword_269A4BCF0);
  uint64_t v29 = swift_allocObject();
  id v30 = v61;
  *(void *)(v29 + 16) = v3;
  *(void *)(v29 + 24) = v30;
  id v31 = v3;
  id v32 = v30;
  uint64_t v33 = (void *)sub_24FAC0190();
  objc_msgSend(v27, sel_addAction_forControlEvents_, v33, 64);

  id v34 = objc_msgSend(a1, sel_buttonTray);
  id v60 = v27;
  objc_msgSend(v34, sel_addButton_, v27);

  id v35 = objc_msgSend(self, sel_linkButton);
  v36 = (void *)sub_24FABFFD0();
  objc_msgSend(v35, sel_setTitle_forState_, v36, 0);

  *(void *)(swift_allocObject() + 16) = v31;
  id v37 = v31;
  v38 = (void *)sub_24FAC0190();
  objc_msgSend(v35, sel_addAction_forControlEvents_, v38, 64);

  id v61 = a1;
  id v39 = objc_msgSend(a1, sel_buttonTray);
  objc_msgSend(v39, sel_addButton_, v35);

  sub_24FABF860();
  sub_24FABF850();
  sub_24FABF840();
  sub_24FABF850();
  uint64_t v40 = sub_24FABF890();
  uint64_t v42 = v41;
  LOBYTE(v23) = v43;
  uint64_t v45 = v44;
  uint64_t v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v47 = (void (*)())swift_allocObject();
  *((void *)v47 + 2) = 0xD00000000000002DLL;
  *((void *)v47 + 3) = 0x800000024FAC3CE0;
  *((void *)v47 + 4) = v46;
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD00);
  swift_storeEnumTagMultiPayload();
  uint64_t v48 = v62;
  v49 = (char *)v8 + *(int *)(v62 + 20);
  *(void *)v49 = v40;
  *((void *)v49 + 1) = v42;
  v49[16] = v23 & 1;
  *((void *)v49 + 3) = v45;
  v50 = (void (**)())((char *)v8 + *(int *)(v48 + 24));
  *v50 = sub_24FA90144;
  v50[1] = v47;
  v51 = (char *)v8 + *(int *)(v48 + 28);
  char v63 = 0;
  sub_24FABFC40();
  uint64_t v52 = v65;
  char *v51 = v64;
  *((void *)v51 + 1) = v52;
  id v53 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD08));
  v54 = (void *)sub_24FABF8C0();
  id v55 = objc_msgSend(v54, sel_view);
  if (!v55) {
    goto LABEL_8;
  }
  v56 = v55;
  id v57 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v56, sel_setBackgroundColor_, v57);

  id v58 = objc_msgSend(v54, sel_view);
  if (v58)
  {
    v59 = v58;
    sub_24FA8EE80((uint64_t)v58, v61);

    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_24FA8C0E0(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2
                + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_requestType);
  uint64_t v3 = a2
     + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_enablementDelegate;
  swift_beginAccess();
  sub_24FA897D4(v3, (uint64_t)v12, &qword_269A4BC70);
  if (!v13) {
    return sub_24FA89838((uint64_t)v12, &qword_269A4BC70);
  }
  sub_24FA8AEF0((uint64_t)v12, (uint64_t)v9);
  sub_24FA89838((uint64_t)v12, &qword_269A4BC70);
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  char v8 = 1;
  char v7 = v2;
  (*(void (**)(char *, char *, uint64_t, uint64_t))(v5 + 8))(&v8, &v7, v4, v5);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
}

void sub_24FA8C1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FABF1E0();
  uint64_t v7 = sub_24FABF200();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = a3 + 16;
    id v10 = objc_allocWithZone(MEMORY[0x263F16980]);
    uint64_t v11 = (void *)sub_24FABF1C0();
    id v12 = objc_msgSend(v10, sel_initWithURL_, v11);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    objc_msgSend(v12, sel_setModalPresentationStyle_, 1);
    swift_beginAccess();
    uint64_t v13 = (void *)MEMORY[0x25336CC30](v9);
    if (v13)
    {
      char v14 = v13;
      objc_msgSend(v13, sel_presentViewController_animated_completion_, v12, 1, 0);
    }
  }
}

void sub_24FA8C374(void *a1, void *a2)
{
  id v39 = a2;
  uint64_t v40 = sub_24FABF3E0();
  uint64_t v4 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(a1, sel_navigationItem);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_dismissedWithCancel);
  objc_msgSend(v7, sel_setRightBarButtonItem_, v8);

  uint64_t v9 = (void *)sub_24FABFFD0();
  id v10 = (void *)sub_24FABFFD0();
  uint64_t v11 = (void *)sub_24FABFFD0();
  objc_msgSend(a1, sel_addBulletedListItemWithTitle_description_symbolName_, v9, v10, v11);

  id v12 = (void *)sub_24FABFFD0();
  uint64_t v13 = (void *)sub_24FABFFD0();
  char v14 = (void *)sub_24FABFFD0();
  objc_msgSend(a1, sel_addBulletedListItemWithTitle_description_symbolName_, v12, v13, v14);

  id v15 = objc_msgSend(self, sel_boldButton);
  uint64_t v16 = (void *)sub_24FABFFD0();
  objc_msgSend(v15, sel_setTitle_forState_, v16, 0);

  sub_24FA8FF90(0, &qword_269A4BCF0);
  *(void *)(swift_allocObject() + 16) = v2;
  id v17 = v2;
  id v18 = (void *)sub_24FAC0190();
  objc_msgSend(v15, sel_addAction_forControlEvents_, v18, 64);

  id v19 = objc_msgSend(a1, sel_buttonTray);
  objc_msgSend(v19, sel_addButton_, v15);

  id v20 = objc_msgSend(self, sel_linkButton);
  uint64_t v21 = (void *)sub_24FABFFD0();
  objc_msgSend(v20, (SEL)0x26533F218, v21, 0);

  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v39;
  *(void *)(v22 + 16) = v17;
  *(void *)(v22 + 24) = v23;
  id v24 = v17;
  id v25 = v23;
  uint64_t v26 = sub_24FAC0190();
  objc_msgSend(v20, sel_addAction_forControlEvents_, v26, 64);

  uint64_t v27 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, (uint64_t)v24+ OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_restrictionsManager, v40);
  id v28 = v20;
  LOBYTE(v26) = sub_24FABF3C0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v27);
  objc_msgSend(v28, sel_setEnabled_, v26 & 1);

  id v29 = objc_msgSend(a1, sel_buttonTray);
  objc_msgSend(v29, sel_addButton_, v28);

  id v30 = objc_msgSend(self, sel_buttonWithType_, 1);
  sub_24FA8F040();
  id v31 = (void *)sub_24FABFFD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_setTitle_forState_, v31, 0);

  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = a1;
  uint64_t v33 = self;
  uint64_t v34 = *MEMORY[0x263F83588];
  id v35 = a1;
  id v36 = objc_msgSend(v33, sel_preferredFontForTextStyle_, v34);
  objc_msgSend(v30, sel__setFont_, v36);

  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = sub_24FA913E0;
  *(void *)(v37 + 24) = v32;
  swift_retain();
  v38 = (void *)sub_24FAC0190();
  objc_msgSend(v30, sel_addAction_forControlEvents_, v38, 64);
  swift_release();

  sub_24FA8EE80((uint64_t)v30, v35);
}

void sub_24FA8CA24(void *a1)
{
  char v2 = v1;
  uint64_t v4 = sub_24FABF3E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(a1, sel_navigationItem);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_dismissedWithCancel);
  objc_msgSend(v8, sel_setRightBarButtonItem_, v9);

  id v10 = objc_msgSend(self, sel_buttonWithType_, 1);
  sub_24FA8F040();
  uint64_t v11 = (void *)sub_24FABFFD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setTitle_forState_, v11, 0);

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  uint64_t v13 = self;
  uint64_t v14 = *MEMORY[0x263F83588];
  id v15 = a1;
  id v16 = objc_msgSend(v13, sel_preferredFontForTextStyle_, v14);
  objc_msgSend(v10, sel__setFont_, v16);

  sub_24FA8FF90(0, &qword_269A4BCF0);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_24FA8FF1C;
  *(void *)(v17 + 24) = v12;
  swift_retain();
  id v18 = (void *)sub_24FAC0190();
  objc_msgSend(v10, sel_addAction_forControlEvents_, v18, 64);
  swift_release();

  sub_24FA8EE80((uint64_t)v10, v15);
  id v19 = objc_msgSend(self, sel_boldButton);
  id v20 = (void *)sub_24FABFFD0();
  objc_msgSend(v19, sel_setTitle_forState_, v20, 0);

  *(void *)(swift_allocObject() + 16) = v2;
  id v21 = v2;
  uint64_t v22 = sub_24FAC0190();
  objc_msgSend(v19, sel_addAction_forControlEvents_, v22, 64);

  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, (uint64_t)v21+ OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_restrictionsManager, v4);
  id v23 = v19;
  LOBYTE(v22) = sub_24FABF3C0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  objc_msgSend(v23, sel_setEnabled_, v22 & 1);

  id v24 = objc_msgSend(v15, sel_buttonTray);
  objc_msgSend(v24, sel_addButton_, v23);

  id v25 = objc_msgSend(self, sel_linkButton);
  uint64_t v26 = (void *)sub_24FABFFD0();
  objc_msgSend(v25, sel_setTitle_forState_, v26, 0);

  *(void *)(swift_allocObject() + 16) = v21;
  id v27 = v21;
  id v28 = (void *)sub_24FAC0190();
  objc_msgSend(v25, sel_addAction_forControlEvents_, v28, 64);

  id v29 = objc_msgSend(v15, sel_buttonTray);
  objc_msgSend(v29, sel_addButton_, v25);
}

uint64_t sub_24FA8CF8C(uint64_t a1, uint64_t a2)
{
  char v2 = *(unsigned char *)(a2
                + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_requestType);
  uint64_t v3 = a2
     + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_enablementDelegate;
  swift_beginAccess();
  sub_24FA897D4(v3, (uint64_t)v12, &qword_269A4BC70);
  if (!v13) {
    return sub_24FA89838((uint64_t)v12, &qword_269A4BC70);
  }
  sub_24FA8AEF0((uint64_t)v12, (uint64_t)v9);
  sub_24FA89838((uint64_t)v12, &qword_269A4BC70);
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  char v8 = 2;
  char v7 = v2;
  (*(void (**)(char *, char *, uint64_t, uint64_t))(v5 + 8))(&v8, &v7, v4, v5);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
}

id sub_24FA8D07C(void *a1)
{
  uint64_t v1 = qword_269A4BA60;
  id v2 = a1;
  if (v1 != -1) {
    swift_once();
  }
  if (qword_269A4BC60) {
    objc_msgSend((id)qword_269A4BC60, sel_setPresentingViewController_, v2);
  }

  uint64_t v3 = (void *)qword_269A4BC60;

  return objc_msgSend(v3, sel_present);
}

id GenerativeAssistantEnablementNavigationController.__allocating_init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t ObjCClassFromMetadata = 0;
  if (a2) {
LABEL_3:
  }
    uint64_t v3 = swift_getObjCClassFromMetadata();
LABEL_4:
  id v5 = objc_allocWithZone(v2);

  return objc_msgSend(v5, sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
}

void GenerativeAssistantEnablementNavigationController.init(navigationBarClass:toolbarClass:)(uint64_t ObjCClassFromMetadata, uint64_t a2)
{
  id v5 = &v2[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_enablementDelegate];
  *(_OWORD *)id v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v2[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_requestType] = 6;
  v2[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_isExplicitRequest] = 2;
  uint64_t v6 = v2;
  sub_24FABF3D0();
  if (qword_269A4BA68 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  char v7 = (void *)sub_24FABFFD0();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(self, sel__systemImageNamed_, v7);

  if (v8)
  {
    uint64_t v9 = OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_logo;
    id v10 = objc_msgSend(self, sel_systemBlueColor);
    id v11 = objc_msgSend(v8, sel_imageWithTintColor_renderingMode_, v10, 1);

    *(void *)&v6[v9] = v11;
    if (ObjCClassFromMetadata) {
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    }
    if (a2) {
      a2 = swift_getObjCClassFromMetadata();
    }
    v12.receiver = v6;
    v12.super_class = (Class)type metadata accessor for GenerativeAssistantEnablementNavigationController(0);
    objc_msgSendSuper2(&v12, sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, a2);
  }
  else
  {
    __break(1u);
  }
}

id GenerativeAssistantEnablementNavigationController.__allocating_init(rootViewController:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithRootViewController_, a1);

  return v3;
}

uint64_t GenerativeAssistantEnablementNavigationController.init(rootViewController:)(void *a1)
{
  sub_24FA8F59C((uint64_t)a1);
  uint64_t v3 = v2;

  return v3;
}

id GenerativeAssistantEnablementNavigationController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_24FABFFD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void GenerativeAssistantEnablementNavigationController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = &v3[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_enablementDelegate];
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v3[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_requestType] = 6;
  v3[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_isExplicitRequest] = 2;
  id v7 = v3;
  sub_24FABF3D0();
  if (qword_269A4BA68 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  id v8 = (void *)sub_24FABFFD0();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(self, sel__systemImageNamed_, v8);

  if (v9)
  {
    uint64_t v10 = OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_logo;
    id v11 = objc_msgSend(self, sel_systemBlueColor);
    id v12 = objc_msgSend(v9, sel_imageWithTintColor_renderingMode_, v11, 1);

    *(void *)&v7[v10] = v12;
    if (a2)
    {
      uint64_t v13 = (void *)sub_24FABFFD0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = 0;
    }
    v14.receiver = v7;
    v14.super_class = (Class)type metadata accessor for GenerativeAssistantEnablementNavigationController(0);
    objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, v13, a3);
  }
  else
  {
    __break(1u);
  }
}

id GenerativeAssistantEnablementNavigationController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void GenerativeAssistantEnablementNavigationController.init(coder:)(void *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_enablementDelegate];
  *(_OWORD *)id v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v1[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_requestType] = 6;
  v1[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_isExplicitRequest] = 2;
  uint64_t v4 = v1;
  sub_24FABF3D0();
  if (qword_269A4BA68 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  id v5 = (void *)sub_24FABFFD0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel__systemImageNamed_, v5);

  if (v6)
  {
    uint64_t v7 = OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_logo;
    id v8 = objc_msgSend(self, sel_systemBlueColor);
    id v9 = objc_msgSend(v6, sel_imageWithTintColor_renderingMode_, v8, 1);

    *(void *)&v4[v7] = v9;
    v10.receiver = v4;
    v10.super_class = (Class)type metadata accessor for GenerativeAssistantEnablementNavigationController(0);
    objc_msgSendSuper2(&v10, sel_initWithCoder_, a1);
  }
  else
  {
    __break(1u);
  }
}

id GenerativeAssistantEnablementNavigationController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeAssistantEnablementNavigationController(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24FA8DA00(unsigned char *a1, unsigned __int8 *a2)
{
  return sub_24FA8B69C(a1, a2);
}

void sub_24FA8DA24(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v23 = MEMORY[0x263F8EE78];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_24FAC01D0();
    sub_24FA8FF90(0, &qword_269A4BCC8);
    sub_24FA8FE74();
    sub_24FAC0130();
    uint64_t v1 = v18;
    uint64_t v16 = v19;
    uint64_t v2 = v20;
    uint64_t v3 = v21;
    unint64_t v4 = v22;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v16 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  while (v1 < 0)
  {
    if (!sub_24FAC01E0()) {
      goto LABEL_37;
    }
    sub_24FA8FF90(0, &qword_269A4BCC8);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v12 = v17;
    swift_unknownObjectRelease();
    uint64_t v11 = v3;
    uint64_t v9 = v4;
    if (!v17) {
      goto LABEL_37;
    }
LABEL_33:
    self;
    if (swift_dynamicCastObjCClass())
    {
      MEMORY[0x25336C1F0]();
      if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24FAC0080();
      }
      sub_24FAC0090();
      sub_24FAC0070();
    }
    else
    {
    }
    uint64_t v3 = v11;
    unint64_t v4 = v9;
  }
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    uint64_t v11 = v3;
LABEL_32:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      goto LABEL_37;
    }
    goto LABEL_33;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v8) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v16 + 8 * v13);
    uint64_t v11 = v3 + 1;
    if (!v14)
    {
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v8) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v16 + 8 * v11);
      if (!v14)
      {
        uint64_t v11 = v3 + 3;
        if (v3 + 3 >= v8) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v16 + 8 * v11);
        if (!v14)
        {
          uint64_t v11 = v3 + 4;
          if (v3 + 4 >= v8) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v16 + 8 * v11);
          if (!v14)
          {
            uint64_t v11 = v3 + 5;
            if (v3 + 5 >= v8) {
              goto LABEL_37;
            }
            unint64_t v14 = *(void *)(v16 + 8 * v11);
            if (!v14)
            {
              uint64_t v15 = v3 + 6;
              while (v8 != v15)
              {
                unint64_t v14 = *(void *)(v16 + 8 * v15++);
                if (v14)
                {
                  uint64_t v11 = v15 - 1;
                  goto LABEL_31;
                }
              }
LABEL_37:
              sub_24FA8FEDC();
              return;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v9 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

void sub_24FA8DD40()
{
  uint64_t v0 = (void *)sub_24FABFFD0();
  id v1 = objc_msgSend(self, sel_presenterForPrivacySplashWithIdentifier_, v0);

  qword_269A4BC60 = (uint64_t)v1;
}

uint64_t sub_24FA8DDB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v96 = a1;
  uint64_t v1 = type metadata accessor for CaptionWithModalLink(0);
  uint64_t v85 = *(void *)(v1 - 8);
  uint64_t v84 = *(void *)(v85 + 64);
  uint64_t v79 = v1 - 8;
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v82 = (uint64_t)&v68 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_24FABF9A0();
  MEMORY[0x270FA5388](v80);
  v77 = (char *)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_24FABF690();
  uint64_t v90 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  v76 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD30);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v92 = v5;
  uint64_t v93 = v6;
  MEMORY[0x270FA5388](v5);
  v81 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD38);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v94 = v8;
  uint64_t v95 = v9;
  MEMORY[0x270FA5388](v8);
  v86 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD40);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  v97 = (uint64_t *)((char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v74 = sub_24FABF6E0();
  uint64_t v73 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v15 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD48);
  MEMORY[0x270FA5388](v98);
  uint64_t v17 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD50);
  uint64_t v89 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  v78 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD58) - 8;
  MEMORY[0x270FA5388](v87);
  v83 = (char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_24FABFB20();
  uint64_t v22 = v21;
  uint64_t v72 = v23;
  char v25 = v24 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v26 = sub_24FABFAD0();
  uint64_t v27 = swift_getKeyPath();
  int v69 = sub_24FABF9C0();
  int v68 = sub_24FABFAA0();
  sub_24FABF670();
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v36 = swift_getKeyPath();
  uint64_t v37 = v15;
  v70 = v15;
  sub_24FABF6D0();
  uint64_t v38 = *(int *)(v12 + 36);
  id v39 = v97;
  uint64_t v40 = v73;
  uint64_t v41 = v37;
  uint64_t v42 = v74;
  (*(void (**)(uint64_t, char *, uint64_t))(v73 + 16))((uint64_t)v97 + v38, v41, v74);
  *id v39 = v36;
  sub_24FA897D4((uint64_t)v39, (uint64_t)&v17[*(int *)(v98 + 36)], &qword_269A4BD40);
  uint64_t v43 = v20;
  *(void *)uint64_t v17 = v20;
  *((void *)v17 + 1) = v22;
  uint64_t v44 = v22;
  LOBYTE(v39) = v25;
  v17[16] = v25;
  uint64_t v45 = KeyPath;
  *((void *)v17 + 3) = v72;
  *((void *)v17 + 4) = v45;
  v17[40] = 1;
  *((void *)v17 + 6) = v27;
  *((void *)v17 + 7) = v26;
  *((_DWORD *)v17 + 16) = v69;
  v17[72] = v68;
  *((void *)v17 + 10) = v29;
  *((void *)v17 + 11) = v31;
  *((void *)v17 + 12) = v33;
  *((void *)v17 + 13) = v35;
  v17[112] = 0;
  uint64_t v46 = v43;
  uint64_t v47 = v44;
  sub_24FA90BD8(v43, v44, (char)v39);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24FA89838((uint64_t)v97, &qword_269A4BD40);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v70, v42);
  sub_24FA90BE8(v46, v47, (char)v39);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_24FABF9E0();
  uint64_t v48 = v76;
  sub_24FABF680();
  uint64_t v49 = v75;
  uint64_t v50 = v82;
  sub_24FA90BF8(v75, v82);
  unint64_t v51 = (*(unsigned __int8 *)(v85 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80);
  v97 = (uint64_t *)(v51 + v84);
  uint64_t v52 = swift_allocObject();
  sub_24FA90C60(v50, v52 + v51);
  sub_24FA90CDC(&qword_269A4BD60, MEMORY[0x263F185B8]);
  sub_24FA90CDC(&qword_269A4BD68, MEMORY[0x263F18588]);
  id v53 = v81;
  uint64_t v54 = v88;
  sub_24FABFCF0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v90 + 8))(v48, v54);
  sub_24FA90BF8(v49, v50);
  uint64_t v55 = swift_allocObject();
  sub_24FA90C60(v50, v55 + v51);
  sub_24FA9120C(&qword_269A4BD70, &qword_269A4BD30);
  v56 = v86;
  uint64_t v57 = v92;
  sub_24FABFCE0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v53, v57);
  sub_24FABF6B0();
  sub_24FA90F10();
  sub_24FA9120C(&qword_269A4BDF8, &qword_269A4BD38);
  id v58 = v78;
  uint64_t v59 = v94;
  sub_24FABFBD0();
  (*(void (**)(char *, uint64_t))(v95 + 8))(v56, v59);
  sub_24FA89838((uint64_t)v17, &qword_269A4BD48);
  uint64_t v60 = v49 + *(int *)(v79 + 36);
  char v61 = *(unsigned char *)v60;
  uint64_t v62 = *(void *)(v60 + 8);
  char v99 = v61;
  uint64_t v100 = v62;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BE00);
  sub_24FABFC50();
  if (v101) {
    double v63 = 0.5;
  }
  else {
    double v63 = 1.0;
  }
  uint64_t v64 = v89;
  uint64_t v65 = (uint64_t)v83;
  uint64_t v66 = v91;
  (*(void (**)(char *, char *, uint64_t))(v89 + 16))(v83, v58, v91);
  *(double *)(v65 + *(int *)(v87 + 44)) = v63;
  (*(void (**)(char *, uint64_t))(v64 + 8))(v58, v66);
  return sub_24FA91250(v65, v96);
}

uint64_t sub_24FA8E804()
{
  return sub_24FABFC60();
}

uint64_t sub_24FA8E870(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for CaptionWithModalLink(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BE00);
  uint64_t v4 = sub_24FABFC60();
  return (*(uint64_t (**)(uint64_t))(a2 + *(int *)(v3 + 24)))(v4);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24FA8E948(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24FAC02D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24FAC02D0();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x25336C420](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_24FA8EB14(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24FAC02D0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_24FAC0070();
}

uint64_t sub_24FA8EB14(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24FAC02D0();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_24FAC02D0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_24FA9120C(&qword_269A4BCE8, &qword_269A4BCE0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BCE0);
          uint64_t v12 = sub_24FA8ED48(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_24FA8FF90(0, &qword_269A4BCD8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_24FAC02F0();
  __break(1u);
  return result;
}

void (*sub_24FA8ED48(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24FA8EDF8(v6, a2, a3);
  return sub_24FA8EDB0;
}

void sub_24FA8EDB0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_24FA8EDF8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x25336C410](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_24FA8EE78;
  }
  __break(1u);
  return result;
}

void sub_24FA8EE78(id *a1)
{
}

void sub_24FA8EE80(uint64_t a1, id a2)
{
  id v3 = objc_msgSend(a2, sel_buttonTray);
  id v4 = objc_msgSend(v3, sel_subviews);

  sub_24FA8FF90(0, &qword_269A4BCF8);
  unint64_t v5 = sub_24FAC0060();

  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    return;
  }
LABEL_16:
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_24FAC02D0();
  if (!v6) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v7 = 4;
  while (1)
  {
    uint64_t v8 = v7 - 4;
    if ((v5 & 0xC000000000000001) != 0)
    {
      id v9 = (id)MEMORY[0x25336C410](v7 - 4, v5);
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v8, 1)) {
        goto LABEL_15;
      }
    }
    else
    {
      id v9 = *(id *)(v5 + 8 * v7);
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v8, 1))
      {
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    id v13 = v9;
    self;
    uint64_t v11 = swift_dynamicCastObjCClass();
    if (v11) {
      break;
    }

    ++v7;
    if (v10 == v6) {
      goto LABEL_11;
    }
  }
  uint64_t v12 = (void *)v11;
  swift_bridgeObjectRelease_n();
  objc_msgSend(v12, sel_insertArrangedSubview_atIndex_, a1, 0);
}

void sub_24FA8F040()
{
  uint64_t v0 = (void *)sub_24FABFFD0();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v2 = objc_msgSend(v1, sel_privacyFlow);

  if (!v2)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id v3 = objc_msgSend(v2, sel_localizedButtonTitle);

  if (v3)
  {
    sub_24FABFFE0();

    return;
  }
LABEL_7:
  __break(1u);
}

id sub_24FA8F124(void *a1)
{
  unint64_t v1 = 0x269A4B000uLL;
  unint64_t v2 = 0x269A4B000uLL;
  if (a1)
  {
    uint64_t v3 = qword_269A4BA60;
    id v4 = a1;
    if (v3 == -1)
    {
      unint64_t v5 = (void *)qword_269A4BC60;
      if (!qword_269A4BC60) {
        goto LABEL_47;
      }
      goto LABEL_4;
    }
    swift_once();
    unint64_t v5 = (void *)qword_269A4BC60;
    if (qword_269A4BC60) {
LABEL_4:
    }
      objc_msgSend(v5, sel_setPresentingViewController_, v4);
LABEL_47:

    if (*(void *)(v1 + 2656) != -1) {
      swift_once();
    }
    goto LABEL_49;
  }
  if (qword_269A4BA60 == -1)
  {
    uint64_t v6 = (void *)qword_269A4BC60;
    if (qword_269A4BC60) {
      goto LABEL_7;
    }
  }
  else
  {
    swift_once();
    uint64_t v6 = (void *)qword_269A4BC60;
    if (qword_269A4BC60)
    {
LABEL_7:
      id v7 = objc_msgSend(self, sel_sharedApplication);
      id v8 = objc_msgSend(v7, sel_connectedScenes);

      sub_24FA8FF90(0, &qword_269A4BCC8);
      sub_24FA8FE74();
      unint64_t v9 = sub_24FAC0120();

      sub_24FA8DA24(v9);
      uint64_t v11 = v10;
      swift_bridgeObjectRelease();
      unint64_t v12 = MEMORY[0x263F8EE78];
      unint64_t v25 = MEMORY[0x263F8EE78];
      if ((unint64_t)v11 >> 62)
      {
        if (v11 < 0) {
          unint64_t v9 = v11;
        }
        else {
          unint64_t v9 = v11 & 0xFFFFFFFFFFFFFF8;
        }
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_24FAC02D0();
        if (v13) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v13 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v13)
        {
LABEL_9:
          if (v13 < 1)
          {
            __break(1u);
            goto LABEL_55;
          }
          uint64_t v14 = 0;
          do
          {
            if ((v11 & 0xC000000000000001) != 0) {
              id v15 = (id)MEMORY[0x25336C410](v14, v11);
            }
            else {
              id v15 = *(id *)(v11 + 8 * v14 + 32);
            }
            uint64_t v16 = v15;
            ++v14;
            id v17 = objc_msgSend(v15, sel_windows);
            sub_24FA8FF90(0, &qword_269A4BCD8);
            unint64_t v18 = sub_24FAC0060();

            unint64_t v9 = (unint64_t)&v25;
            sub_24FA8E948(v18);
          }
          while (v13 != v14);
          swift_bridgeObjectRelease_n();
          uint64_t v19 = v25;
          unint64_t v2 = 0x269A4B000;
          unint64_t v1 = 0x269A4B000;
          unint64_t v12 = MEMORY[0x263F8EE78];
LABEL_25:
          unint64_t v25 = v12;
          if ((unint64_t)v19 >> 62)
          {
            if (v19 < 0) {
              unint64_t v9 = v19;
            }
            else {
              unint64_t v9 = v19 & 0xFFFFFFFFFFFFFF8;
            }
            swift_bridgeObjectRetain();
            uint64_t v20 = sub_24FAC02D0();
            if (v20)
            {
LABEL_27:
              if (v20 >= 1)
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (objc_msgSend(*(id *)(v19 + 8 * i + 32), sel_rootViewController))
                  {
                    MEMORY[0x25336C1F0]();
                    if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8)
                                                                                      + 0x18) >> 1)
                      sub_24FAC0080();
                    sub_24FAC0090();
                    sub_24FAC0070();
                  }
                }
                swift_bridgeObjectRelease();
                unint64_t v9 = v25;
LABEL_40:
                id result = (id)swift_bridgeObjectRelease();
                if (v9 >> 62)
                {
                  swift_bridgeObjectRetain();
                  id v4 = (id)sub_24FAC02D0();
                  id result = (id)swift_bridgeObjectRelease();
                  if (!v4) {
                    goto LABEL_46;
                  }
                }
                else
                {
                  id v4 = *(id *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
                  if (!v4)
                  {
LABEL_46:
                    swift_bridgeObjectRelease();
                    objc_msgSend(v6, sel_setPresentingViewController_, v4);
                    goto LABEL_47;
                  }
                }
                if ((v9 & 0xC000000000000001) == 0)
                {
                  if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
                  {
                    __break(1u);
                    return result;
                  }
                  id v23 = *(id *)(v9 + 32);
                  goto LABEL_45;
                }
LABEL_56:
                id v23 = (id)MEMORY[0x25336C410](0, v9);
LABEL_45:
                id v4 = v23;
                goto LABEL_46;
              }
LABEL_55:
              __break(1u);
              goto LABEL_56;
            }
          }
          else
          {
            uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (v20) {
              goto LABEL_27;
            }
          }
          swift_bridgeObjectRelease();
          unint64_t v9 = MEMORY[0x263F8EE78];
          goto LABEL_40;
        }
      }
      swift_bridgeObjectRelease_n();
      uint64_t v19 = MEMORY[0x263F8EE78];
      goto LABEL_25;
    }
  }
LABEL_49:
  char v24 = *(void **)(v2 + 3168);

  return objc_msgSend(v24, sel_present);
}

void sub_24FA8F59C(uint64_t a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_enablementDelegate];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v1[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_requestType] = 6;
  v1[OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_isExplicitRequest] = 2;
  id v4 = v1;
  sub_24FABF3D0();
  if (qword_269A4BA68 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  unint64_t v5 = (void *)sub_24FABFFD0();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel__systemImageNamed_, v5);

  if (v6)
  {
    uint64_t v7 = OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_logo;
    id v8 = objc_msgSend(self, sel_systemBlueColor);
    id v9 = objc_msgSend(v6, sel_imageWithTintColor_renderingMode_, v8, 1);

    *(void *)&v4[v7] = v9;
    v10.receiver = v4;
    v10.super_class = (Class)type metadata accessor for GenerativeAssistantEnablementNavigationController(0);
    objc_msgSendSuper2(&v10, sel_initWithRootViewController_, a1);
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_24FA8F73C()
{
  unint64_t result = qword_269A4BCA0;
  if (!qword_269A4BCA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BCA0);
  }
  return result;
}

unint64_t sub_24FA8F794()
{
  unint64_t result = qword_269A4BCA8;
  if (!qword_269A4BCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BCA8);
  }
  return result;
}

uint64_t sub_24FA8F7E8()
{
  return MEMORY[0x263F1BB58];
}

unsigned char *storeEnumTagSinglePayload for EnablementUIDismissType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24FA8F8C0);
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

ValueMetadata *type metadata accessor for EnablementUIDismissType()
{
  return &type metadata for EnablementUIDismissType;
}

uint64_t dispatch thunk of EnablementUIDelegate.dismissed(with:request:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for GenerativeAssistantSettingsOnboarding(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for GenerativeAssistantSettingsOnboarding(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  return a1;
}

uint64_t assignWithCopy for GenerativeAssistantSettingsOnboarding(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy42_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for GenerativeAssistantSettingsOnboarding(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for GenerativeAssistantSettingsOnboarding(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 42)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GenerativeAssistantSettingsOnboarding(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 42) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 42) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsOnboarding()
{
  return &type metadata for GenerativeAssistantSettingsOnboarding;
}

uint64_t sub_24FA8FD10()
{
  return type metadata accessor for GenerativeAssistantEnablementNavigationController(0);
}

uint64_t sub_24FA8FD18()
{
  uint64_t result = sub_24FABF3E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for GenerativeAssistantEnablementNavigationController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GenerativeAssistantEnablementNavigationController);
}

uint64_t dispatch thunk of GenerativeAssistantEnablementNavigationController.dismissed(with:request:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

unint64_t sub_24FA8FE20()
{
  unint64_t result = qword_269A4BCC0;
  if (!qword_269A4BCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BCC0);
  }
  return result;
}

unint64_t sub_24FA8FE74()
{
  unint64_t result = qword_269A4BCD0;
  if (!qword_269A4BCD0)
  {
    sub_24FA8FF90(255, &qword_269A4BCC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BCD0);
  }
  return result;
}

uint64_t sub_24FA8FEDC()
{
  return swift_release();
}

uint64_t sub_24FA8FEE4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_24FA8FF1C()
{
  return sub_24FA8D07C(*(void **)(v0 + 16));
}

uint64_t sub_24FA8FF24()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24FA8FF5C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24FA8FF84(uint64_t a1)
{
  return sub_24FA8CF8C(a1, *(void *)(v1 + 16));
}

uint64_t sub_24FA8FF90(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24FA8FFCC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v4 = 3;
  unsigned __int8 v3 = *(unsigned char *)(v1
                + OBJC_IVAR____TtC27GenerativeAssistantSettings49GenerativeAssistantEnablementNavigationController_requestType);
  return sub_24FA8B69C(&v4, &v3);
}

uint64_t sub_24FA90018()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t type metadata accessor for CaptionWithModalLink(uint64_t a1)
{
  return sub_24FA90078(a1, (uint64_t *)&unk_269A4BD18);
}

uint64_t sub_24FA90078(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_24FA900B0()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_pushViewController_animated_, *(void *)(v0 + 24), 1);
}

uint64_t sub_24FA900C4(uint64_t a1)
{
  return sub_24FA8C0E0(a1, *(void *)(v1 + 16));
}

uint64_t sub_24FA900CC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24FA90104()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_24FA90144()
{
  sub_24FA8C1D0(v0[2], v0[3], v0[4]);
}

uint64_t *sub_24FA90158(uint64_t *a1, uint64_t *a2, int *a3)
{
  char v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    char v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD00);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24FABF6E0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *char v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (char *)v4 + v9;
    uint64_t v12 = (char *)a2 + v9;
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)uint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    v11[16] = v12[16];
    *((void *)v11 + 3) = *((void *)v12 + 3);
    uint64_t v14 = (uint64_t *)((char *)v4 + v10);
    id v15 = (uint64_t *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[7];
    unint64_t v18 = (char *)v4 + v17;
    uint64_t v19 = (char *)a2 + v17;
    *unint64_t v18 = *v19;
    *((void *)v18 + 1) = *((void *)v19 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_24FA902D8(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_24FABF6E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

void *sub_24FA903AC(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_24FABF6E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v7;
  uint64_t v10 = (char *)a2 + v7;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = *(void *)v10;
  *((void *)v9 + 1) = v11;
  v9[16] = v10[16];
  *((void *)v9 + 3) = *((void *)v10 + 3);
  uint64_t v12 = (void *)((char *)a1 + v8);
  uint64_t v13 = (void *)((char *)a2 + v8);
  uint64_t v14 = v13[1];
  void *v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  *uint64_t v16 = *v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_24FA904E0(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_24FA89838((uint64_t)a1, &qword_269A4BD00);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD00);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_24FABF6E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)uint64_t v8 = *(void *)((char *)a2 + v7);
  *((void *)v8 + 1) = *(void *)((char *)a2 + v7 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[16] = v9[16];
  *((void *)v8 + 3) = *((void *)v9 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  *uint64_t v15 = *v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_retain();
  swift_release();
  return a1;
}

char *sub_24FA9065C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_24FABF6E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  long long v12 = *((_OWORD *)v11 + 1);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v12;
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *sub_24FA9074C(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_24FA89838((uint64_t)a1, &qword_269A4BD00);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD00);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_24FABF6E0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)&a2[v8 + 8];
  *(void *)uint64_t v9 = *(void *)&a2[v8];
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  v9[16] = v10[16];
  *((void *)v9 + 3) = *((void *)v10 + 3);
  swift_bridgeObjectRelease();
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  swift_release();
  uint64_t v12 = a3[7];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *uint64_t v13 = *v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_release();
  return a1;
}

uint64_t sub_24FA908A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FA908B8);
}

uint64_t sub_24FA908B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD10);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_24FA90980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FA90994);
}

uint64_t sub_24FA90994(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD10);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

void sub_24FA90A58()
{
  sub_24FA90B04();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24FA90B04()
{
  if (!qword_269A4BD28)
  {
    sub_24FABF6E0();
    unint64_t v0 = sub_24FABF6A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269A4BD28);
    }
  }
}

uint64_t sub_24FA90B5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24FA90B80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24FABF770();
  *a1 = result;
  return result;
}

uint64_t sub_24FA90BAC()
{
  return sub_24FABF780();
}

uint64_t sub_24FA90BD8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24FA90BE8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24FA90BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CaptionWithModalLink(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FA90C60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CaptionWithModalLink(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FA90CC4(uint64_t a1)
{
  return sub_24FA90E8C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_24FA8E804);
}

uint64_t sub_24FA90CDC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroy_68Tm()
{
  uint64_t v1 = *(void *)(type metadata accessor for CaptionWithModalLink(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_24FABF6E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24FA90E74(uint64_t a1)
{
  return sub_24FA90E8C(a1, sub_24FA8E870);
}

uint64_t sub_24FA90E8C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for CaptionWithModalLink(0) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

unint64_t sub_24FA90F10()
{
  unint64_t result = qword_269A4BD78;
  if (!qword_269A4BD78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4BD48);
    sub_24FA90FB0();
    sub_24FA9120C(&qword_269A4BDF0, &qword_269A4BD40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BD78);
  }
  return result;
}

unint64_t sub_24FA90FB0()
{
  unint64_t result = qword_269A4BD80;
  if (!qword_269A4BD80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4BD88);
    sub_24FA9102C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BD80);
  }
  return result;
}

unint64_t sub_24FA9102C()
{
  unint64_t result = qword_269A4BD90;
  if (!qword_269A4BD90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4BD98);
    sub_24FA910CC();
    sub_24FA9120C(&qword_269A4BDE0, &qword_269A4BDE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BD90);
  }
  return result;
}

unint64_t sub_24FA910CC()
{
  unint64_t result = qword_269A4BDA0;
  if (!qword_269A4BDA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4BDA8);
    sub_24FA9116C();
    sub_24FA9120C(&qword_269A4BDD0, &qword_269A4BDD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BDA0);
  }
  return result;
}

unint64_t sub_24FA9116C()
{
  unint64_t result = qword_269A4BDB0;
  if (!qword_269A4BDB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4BDB8);
    sub_24FA9120C(&qword_269A4BDC0, &qword_269A4BDC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BDB0);
  }
  return result;
}

uint64_t sub_24FA9120C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24FA91250(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24FA912BC()
{
  unint64_t result = qword_269A4BE08;
  if (!qword_269A4BE08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4BD58);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4BD48);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4BD38);
    sub_24FA90F10();
    sub_24FA9120C(&qword_269A4BDF8, &qword_269A4BD38);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A4BE08);
  }
  return result;
}

uint64_t sub_24FA913E8(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000017;
  unint64_t v4 = 0x800000024FAC2FA0;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0x6C646E7542707061;
      unint64_t v4 = 0xEB00000000444965;
      break;
    case 2:
      break;
    case 3:
      unint64_t v4 = 0x800000024FAC2FC0;
      unint64_t v3 = 0xD000000000000013;
      break;
    case 4:
      unint64_t v3 = 0xD00000000000001ALL;
      unint64_t v4 = 0x800000024FAC2FE0;
      break;
    default:
      unint64_t v3 = 0x496D616441707061;
      unint64_t v4 = 0xE900000000000044;
      break;
  }
  unint64_t v5 = 0xD000000000000017;
  unint64_t v6 = 0x800000024FAC2FA0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEB00000000444965;
      if (v3 == 0x6C646E7542707061) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0x800000024FAC2FC0;
      unint64_t v5 = 0xD000000000000013;
LABEL_12:
      if (v3 == v5) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 4:
      unint64_t v6 = 0x800000024FAC2FE0;
      if (v3 != 0xD00000000000001ALL) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
      unint64_t v6 = 0xE900000000000044;
      if (v3 != 0x496D616441707061) {
        goto LABEL_16;
      }
LABEL_13:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = sub_24FAC0330();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_24FA915D4()
{
  unint64_t v0 = GenerativeAssistantSettingsUserDefaults.Key.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == GenerativeAssistantSettingsUserDefaults.Key.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24FAC0330();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24FA9166C(unint64_t a1, unsigned __int8 a2)
{
  a1 = a1;
  unint64_t v2 = 0xE000000000000000;
  switch((char)a1)
  {
    case 1:
      a1 = 0x656C62616E457369;
      unint64_t v2 = 0xE900000000000064;
      break;
    case 2:
      a1 = 0x6F72507075746573;
      unint64_t v2 = 0xEB0000000074706DLL;
      break;
    case 3:
      unint64_t v2 = 0x800000024FAC2E00;
      a1 = 0xD000000000000016;
      break;
    case 4:
      a1 = 0x43746E756F636361;
      unint64_t v2 = 0xEF736C6F72746E6FLL;
      break;
    case 5:
      a1 = 0x696D694C65746172;
      unint64_t v2 = 0xEF74706D6F725074;
      break;
    case 6:
      a1 = 0x6168437055746573;
      unint64_t v2 = 0xEC00000054504774;
      break;
    case 7:
      unint64_t v2 = 0xE600000000000000;
      a1 = 0x6E496E676973;
      break;
    case 8:
      unint64_t v2 = 0xE700000000000000;
      a1 = 0x74754F6E676973;
      break;
    default:
      break;
  }
  uint64_t v3 = a2;
  unint64_t v4 = 0xE000000000000000;
  switch(a2)
  {
    case 1u:
      unint64_t v4 = 0xE900000000000064;
      if (a1 == 0x656C62616E457369) {
        goto LABEL_25;
      }
      goto LABEL_28;
    case 2u:
      unint64_t v4 = 0xEB0000000074706DLL;
      if (a1 != 0x6F72507075746573) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 3u:
      unint64_t v4 = 0x800000024FAC2E00;
      if (a1 != 0xD000000000000016) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 4u:
      unint64_t v4 = 0xEF736C6F72746E6FLL;
      if (a1 != 0x43746E756F636361) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 5u:
      unint64_t v4 = 0xEF74706D6F725074;
      if (a1 != 0x696D694C65746172) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 6u:
      unint64_t v4 = 0xEC00000054504774;
      if (a1 != 0x6168437055746573) {
        goto LABEL_28;
      }
      goto LABEL_25;
    case 7u:
      unint64_t v4 = 0xE600000000000000;
      uint64_t v3 = 0x6E496E676973;
      goto LABEL_24;
    case 8u:
      unint64_t v4 = 0xE700000000000000;
      if (a1 != 0x74754F6E676973) {
        goto LABEL_28;
      }
      goto LABEL_25;
    default:
LABEL_24:
      if (a1 != v3) {
        goto LABEL_28;
      }
LABEL_25:
      if (v2 == v4) {
        char v5 = 1;
      }
      else {
LABEL_28:
      }
        char v5 = sub_24FAC0330();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v5 & 1;
  }
}

uint64_t sub_24FA91978(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x800000024FAC2DC0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1769105779;
      break;
    case 3:
      unint64_t v3 = 0xEC000000736C6F6FLL;
      unint64_t v5 = 0x54676E6974697277;
      break;
    default:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x54504774616863;
      break;
  }
  unint64_t v6 = 0x800000024FAC2DC0;
  switch(a2)
  {
    case 1:
      goto LABEL_9;
    case 2:
      unint64_t v6 = 0xE400000000000000;
      unint64_t v2 = 1769105779;
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0xEC000000736C6F6FLL;
      if (v5 == 0x54676E6974697277) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x54504774616863) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_24FAC0330();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_24FA91B00(char a1, char a2)
{
  if (*(void *)&aSetupchasignin_0[8 * a1] == *(void *)&aSetupchasignin_0[8 * a2]
    && *(void *)&aTgpt_0[8 * a1] == *(void *)&aTgpt_0[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_24FAC0330();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24FA91B88()
{
  sub_24FAC0000();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA91C84()
{
  sub_24FAC0000();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA91DF4()
{
  sub_24FAC0000();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA91EC0()
{
  sub_24FAC0000();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA91F14()
{
  return sub_24FAC03D0();
}

uint64_t sub_24FA91F7C()
{
  return sub_24FAC03D0();
}

uint64_t sub_24FA92058()
{
  return sub_24FAC03D0();
}

uint64_t static GenerativeAssistantSettingsController.available()()
{
  uint64_t v0 = sub_24FABF3E0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  char v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24FABF3A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FABF390();
  char v8 = sub_24FABF370();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v8)
  {
    sub_24FABF3D0();
    char v9 = sub_24FABF3B0();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    char v10 = v9 ^ 1;
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_24FA9248C(uint64_t a1)
{
  v2[41] = a1;
  v2[42] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  v2[43] = swift_task_alloc();
  v2[44] = sub_24FAC00D0();
  v2[45] = sub_24FAC00C0();
  uint64_t v4 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FA92558, v4, v3);
}

uint64_t sub_24FA92558()
{
  uint64_t v53 = v0;
  uint64_t v1 = *(void *)(v0 + 328);
  swift_release();
  if (!v1)
  {
    __break(1u);
    JUMPOUT(0x24FA92DE4);
  }
  uint64_t v2 = *(void *)(v0 + 328);
  *(void *)(v0 + 280) = 1752457584;
  *(void *)(v0 + 288) = 0xE400000000000000;
  sub_24FAC0220();
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_24FA95754(v0 + 16), (v4 & 1) != 0))
  {
    sub_24FA8759C(*(void *)(v2 + 56) + 32 * v3, v0 + 136);
  }
  else
  {
    *(_OWORD *)(v0 + 136) = 0u;
    *(_OWORD *)(v0 + 152) = 0u;
  }
  sub_24FA95798(v0 + 16);
  if (!*(void *)(v0 + 160))
  {
    sub_24FA89838(v0 + 136, &qword_269A4BE18);
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_11;
  }
  GenerativeAssistantSettingsDestination.init(rawValue:)(*(Swift::String *)(v0 + 248));
  switch(v47)
  {
    case 1:
      char v52 = 1;
      sub_24FAA074C(&v52);
      goto LABEL_11;
    case 2:
      char v51 = 2;
      sub_24FAA074C(&v51);
      goto LABEL_11;
    case 3:
      char v50 = 3;
      sub_24FAA074C(&v50);
      goto LABEL_11;
    case 4:
      char v49 = 4;
      sub_24FAA074C(&v49);
      goto LABEL_11;
    case 5:
      if (qword_269A4BA48 != -1) {
        swift_once();
      }
      uint64_t v18 = *(void *)algn_269A4E1F8;
      *(void *)(v0 + 296) = qword_269A4E1F0;
      *(void *)(v0 + 304) = v18;
      swift_bridgeObjectRetain();
      sub_24FAC0220();
      if (*(void *)(v2 + 16) && (unint64_t v19 = sub_24FA95754(v0 + 56), (v20 & 1) != 0))
      {
        sub_24FA8759C(*(void *)(v2 + 56) + 32 * v19, v0 + 200);
      }
      else
      {
        *(_OWORD *)(v0 + 200) = 0u;
        *(_OWORD *)(v0 + 216) = 0u;
      }
      sub_24FA95798(v0 + 56);
      if (!*(void *)(v0 + 224))
      {
        sub_24FA89838(v0 + 200, &qword_269A4BE18);
        goto LABEL_43;
      }
      if ((swift_dynamicCast() & 1) == 0)
      {
LABEL_43:
        char v37 = 1;
        goto LABEL_44;
      }
      GenerativeAssistantSettingsDestination.Origin.init(rawValue:)(*(Swift::String *)(v0 + 312));
      if (v48 == 4) {
        char v37 = 1;
      }
      else {
        char v37 = v48;
      }
LABEL_44:
      uint64_t v38 = *(void *)(v0 + 344);
      id v39 = *(void **)(v0 + 336);
      uint64_t v40 = swift_allocObject();
      *(void *)(v40 + 16) = v39;
      *(unsigned char *)(v40 + 24) = v37;
      uint64_t v41 = sub_24FAC0110();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v38, 1, 1, v41);
      id v42 = v39;
      swift_retain();
      uint64_t v43 = sub_24FAC00C0();
      uint64_t v44 = swift_allocObject();
      uint64_t v45 = MEMORY[0x263F8F500];
      *(void *)(v44 + 16) = v43;
      *(void *)(v44 + 24) = v45;
      *(void *)(v44 + 32) = sub_24FA92E34;
      *(void *)(v44 + 40) = 0;
      *(void *)(v44 + 48) = v42;
      *(unsigned char *)(v44 + 56) = 0;
      *(void *)(v44 + 64) = sub_24FA95BB4;
      *(void *)(v44 + 72) = v40;
      sub_24FA937DC(v38, (uint64_t)&unk_269A4BE40, v44);
      swift_release();
      swift_release();
LABEL_11:
      if (qword_269A4BA50 != -1) {
        swift_once();
      }
      uint64_t v5 = *(void *)algn_269A4E208;
      *(void *)(v0 + 264) = qword_269A4E200;
      *(void *)(v0 + 272) = v5;
      swift_bridgeObjectRetain();
      sub_24FAC0220();
      if (*(void *)(v2 + 16) && (unint64_t v6 = sub_24FA95754(v0 + 96), (v7 & 1) != 0))
      {
        sub_24FA8759C(*(void *)(v2 + 56) + 32 * v6, v0 + 168);
      }
      else
      {
        *(_OWORD *)(v0 + 168) = 0u;
        *(_OWORD *)(v0 + 184) = 0u;
      }
      sub_24FA95798(v0 + 96);
      if (*(void *)(v0 + 192))
      {
        if (swift_dynamicCast())
        {
          GenerativeAssistantSettingsDestination.init(rawValue:)(*(Swift::String *)(v0 + 232));
          switch(v46)
          {
            case 6:
              uint64_t v8 = *(void *)(v0 + 344);
              char v9 = *(void **)(v0 + 336);
              uint64_t v10 = swift_allocObject();
              *(void *)(v10 + 16) = v9;
              uint64_t v11 = swift_allocObject();
              *(void *)(v11 + 16) = v9;
              uint64_t v12 = sub_24FAC0110();
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
              id v13 = v9;
              swift_retain();
              swift_retain();
              uint64_t v14 = sub_24FAC00C0();
              uint64_t v15 = swift_allocObject();
              uint64_t v16 = MEMORY[0x263F8F500];
              *(void *)(v15 + 16) = v14;
              *(void *)(v15 + 24) = v16;
              *(void *)(v15 + 32) = sub_24FA95B44;
              *(void *)(v15 + 40) = v10;
              *(void *)(v15 + 48) = v13;
              *(unsigned char *)(v15 + 56) = 1;
              *(void *)(v15 + 64) = sub_24FA95B4C;
              *(void *)(v15 + 72) = v11;
              uint64_t v17 = &unk_269A4BE38;
              goto LABEL_32;
            case 7:
              uint64_t v8 = *(void *)(v0 + 344);
              uint64_t v21 = *(void **)(v0 + 336);
              uint64_t v22 = swift_allocObject();
              *(void *)(v22 + 16) = v21;
              uint64_t v23 = swift_allocObject();
              *(void *)(v23 + 16) = v21;
              uint64_t v24 = sub_24FAC0110();
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v8, 1, 1, v24);
              id v25 = v21;
              swift_retain();
              swift_retain();
              uint64_t v26 = sub_24FAC00C0();
              uint64_t v15 = swift_allocObject();
              uint64_t v27 = MEMORY[0x263F8F500];
              *(void *)(v15 + 16) = v26;
              *(void *)(v15 + 24) = v27;
              *(void *)(v15 + 32) = sub_24FA9594C;
              *(void *)(v15 + 40) = v22;
              *(void *)(v15 + 48) = v25;
              *(unsigned char *)(v15 + 56) = 4;
              *(void *)(v15 + 64) = sub_24FA95954;
              *(void *)(v15 + 72) = v23;
              uint64_t v17 = &unk_269A4BE30;
              goto LABEL_32;
            case 8:
              uint64_t v8 = *(void *)(v0 + 344);
              uint64_t v28 = *(void **)(v0 + 336);
              uint64_t v29 = swift_allocObject();
              *(void *)(v29 + 16) = v28;
              uint64_t v30 = swift_allocObject();
              *(void *)(v30 + 16) = v28;
              uint64_t v31 = sub_24FAC0110();
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v8, 1, 1, v31);
              id v32 = v28;
              swift_retain();
              swift_retain();
              uint64_t v33 = sub_24FAC00C0();
              uint64_t v15 = swift_allocObject();
              uint64_t v34 = MEMORY[0x263F8F500];
              *(void *)(v15 + 16) = v33;
              *(void *)(v15 + 24) = v34;
              *(void *)(v15 + 32) = sub_24FA95824;
              *(void *)(v15 + 40) = v29;
              *(void *)(v15 + 48) = v32;
              *(unsigned char *)(v15 + 56) = 4;
              *(void *)(v15 + 64) = sub_24FA9582C;
              *(void *)(v15 + 72) = v30;
              uint64_t v17 = &unk_269A4BE28;
LABEL_32:
              sub_24FA937DC(v8, (uint64_t)v17, v15);
              swift_release();
              swift_release();
              swift_release();
              break;
            default:
              break;
          }
        }
      }
      else
      {
        sub_24FA89838(v0 + 168, &qword_269A4BE18);
      }
      swift_task_dealloc();
      uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
      return v35();
    default:
      goto LABEL_11;
  }
}

uint64_t sub_24FA92E34()
{
  return 1;
}

uint64_t sub_24FA92E3C(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR___GenerativeAssistantSettingsController_settings);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  char v5 = a2;
  sub_24FA9899C(v3, &v5);
  return swift_release();
}

BOOL sub_24FA92EDC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  return (v1 & 1) == 0;
}

BOOL sub_24FA92F64()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  uint64_t v3 = sub_24FABF500();
  BOOL v4 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v2, 1, v3) == 1;
  sub_24FA89838((uint64_t)v2, &qword_269A4BBC0);
  return v4;
}

uint64_t sub_24FA93088(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v2 - 8);
  BOOL v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24FAC0110();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_24FAC00D0();
  id v6 = a1;
  uint64_t v7 = sub_24FAC00C0();
  uint64_t v8 = (void *)swift_allocObject();
  uint64_t v9 = MEMORY[0x263F8F500];
  void v8[2] = v7;
  v8[3] = v9;
  v8[4] = v6;
  sub_24FA937DC((uint64_t)v4, (uint64_t)&unk_269A4BEB8, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_24FA931A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  v4[7] = swift_task_alloc();
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  sub_24FAC00D0();
  v4[10] = sub_24FAC00C0();
  uint64_t v6 = sub_24FAC00A0();
  v4[11] = v6;
  v4[12] = v5;
  return MEMORY[0x270FA2498](sub_24FA93284, v6, v5);
}

uint64_t sub_24FA93284()
{
  v0[13] = *(void *)(v0[6] + OBJC_IVAR___GenerativeAssistantSettingsController_settings);
  type metadata accessor for OpenAIAuthenticatorHelper();
  swift_allocObject();
  v0[14] = sub_24FA88B54();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[15] = v1;
  void *v1 = v0;
  v1[1] = sub_24FA93350;
  uint64_t v2 = v0[9];
  return sub_24FA877A0(v2);
}

uint64_t sub_24FA93350()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 96);
  uint64_t v4 = *(void *)(v2 + 88);
  if (v0) {
    uint64_t v5 = sub_24FA936B4;
  }
  else {
    uint64_t v5 = sub_24FA934A8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24FA934A8()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FA968B4(v1, v3);
  swift_retain();
  sub_24FABF610();
  sub_24FAA3124();
  sub_24FA89838(v1, &qword_269A4BBC0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  uint64_t v4 = sub_24FABF500();
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v2, 1, v4);
  sub_24FA89838(v2, &qword_269A4BBC0);
  if (v5 != 1)
  {
    if (qword_26B1FAC40 != -1) {
      swift_once();
    }
    uint64_t v6 = (void *)qword_26B1FAC60;
    if (qword_26B1FAC60)
    {
      uint64_t v7 = (void *)sub_24FABFFD0();
      objc_msgSend(v6, sel_setBool_forKey_, 1, v7);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_24FA936B4()
{
  swift_release();
  swift_getErrorValue();
  uint64_t DynamicType = swift_getDynamicType();
  if (DynamicType == sub_24FABF520())
  {
    uint64_t v3 = *(void **)(v0 + 128);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 136) = 1;
    swift_retain();
    sub_24FABF610();
    uint64_t v2 = v3;
  }
  else
  {
    uint64_t v2 = *(void **)(v0 + 128);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24FA937DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FAC0110();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24FAC0100();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24FA89838(a1, &qword_269A4C2D0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24FAC00A0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24FA93988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FAC0110();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24FAC0100();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24FA89838(a1, &qword_269A4C2D0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24FAC00A0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BE68);
  return swift_task_create();
}

BOOL sub_24FA93B3C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = &v6[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  if (v6[15] != 1) {
    return 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  uint64_t v3 = sub_24FABF500();
  BOOL v4 = (*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v2, 1, v3) != 1;
  sub_24FA89838((uint64_t)v2, &qword_269A4BBC0);
  return v4;
}

uint64_t sub_24FA93CB4()
{
  return sub_24FABF610();
}

uint64_t sub_24FA93EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  long long v3[2] = a1;
  sub_24FAC00D0();
  v3[5] = sub_24FAC00C0();
  uint64_t v5 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FA93F44, v5, v4);
}

uint64_t sub_24FA93F44()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(const void **)(v0 + 24);
  swift_release();
  *(void *)(v0 + 48) = _Block_copy(v2);
  if (v1) {
    uint64_t v3 = sub_24FABFF60();
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + 56) = v3;
  id v4 = *(id *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24FA9403C;
  return sub_24FA9248C(v3);
}

uint64_t sub_24FA9403C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  uint64_t v3 = *(void **)(*v0 + 32);
  uint64_t v4 = *v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v5 = *(void (***)(void))(v1 + 48);
    v5[2](v5);
    _Block_release(v5);
  }
  uint64_t v6 = *(uint64_t (**)(void))(v4 + 8);
  return v6();
}

uint64_t sub_24FA941A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  *(void *)(v8 + 40) = a8;
  *(void *)(v8 + 48) = v14;
  *(unsigned char *)(v8 + 136) = a7;
  *(void *)(v8 + 24) = a5;
  *(void *)(v8 + 32) = a6;
  *(void *)(v8 + 16) = a4;
  uint64_t v9 = sub_24FAC02A0();
  *(void *)(v8 + 56) = v9;
  *(void *)(v8 + 64) = *(void *)(v9 - 8);
  *(void *)(v8 + 72) = swift_task_alloc();
  *(void *)(v8 + 80) = sub_24FAC00D0();
  *(void *)(v8 + 88) = sub_24FAC00C0();
  uint64_t v11 = sub_24FAC00A0();
  *(void *)(v8 + 96) = v11;
  *(void *)(v8 + 104) = v10;
  return MEMORY[0x270FA2498](sub_24FA942AC, v11, v10);
}

uint64_t sub_24FA942AC()
{
  if ((*(uint64_t (**)(void))(v0 + 16))())
  {
    return MEMORY[0x270FA2498](sub_24FA9435C, 0, 0);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
}

uint64_t sub_24FA9435C()
{
  *(void *)(v0 + 112) = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FA943E8, v2, v1);
}

uint64_t sub_24FA943E8()
{
  uint64_t v6 = v0;
  char v1 = *(unsigned char *)(v0 + 136);
  swift_release();
  char v5 = v1;
  sub_24FAA074C(&v5);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 104);
  return MEMORY[0x270FA2498](sub_24FA94474, v2, v3);
}

uint64_t sub_24FA94474()
{
  sub_24FAC0290();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_269A4BF80 + dword_269A4BF80);
  char v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v1;
  void *v1 = v0;
  v1[1] = sub_24FA9453C;
  return v3(200000000000000000, 0, 0, 0, 1);
}

uint64_t sub_24FA9453C()
{
  uint64_t v3 = (void *)*v1;
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v4 = v2[9];
  uint64_t v5 = v2[8];
  uint64_t v6 = v2[7];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[12];
    uint64_t v8 = v3[13];
    uint64_t v9 = sub_24FA96A58;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[12];
    uint64_t v8 = v3[13];
    uint64_t v9 = sub_24FA946D0;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_24FA946D0()
{
  if ((*(uint64_t (**)(void))(v0 + 16))())
  {
    return MEMORY[0x270FA2498](sub_24FA94780, 0, 0);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    char v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
}

uint64_t sub_24FA94780()
{
  *(void *)(v0 + 128) = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FA9480C, v2, v1);
}

uint64_t sub_24FA9480C()
{
  uint64_t v1 = (void (*)(uint64_t))v0[5];
  uint64_t v2 = swift_release();
  v1(v2);
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  return MEMORY[0x270FA2498](sub_24FA9487C, v3, v4);
}

uint64_t sub_24FA9487C()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id GenerativeAssistantSettingsController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_24FABFFD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id GenerativeAssistantSettingsController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR___GenerativeAssistantSettingsController_settings;
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  swift_allocObject();
  id v7 = v3;
  *(void *)&v3[v6] = sub_24FAA0B84();

  if (a2)
  {
    uint64_t v8 = (void *)sub_24FABFFD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for GenerativeAssistantSettingsController();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, v8, a3);

  return v9;
}

id GenerativeAssistantSettingsController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id GenerativeAssistantSettingsController.init(coder:)(void *a1)
{
  uint64_t v3 = OBJC_IVAR___GenerativeAssistantSettingsController_settings;
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  swift_allocObject();
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_24FAA0B84();

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for GenerativeAssistantSettingsController();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, a1);

  return v5;
}

id GenerativeAssistantSettingsController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeAssistantSettingsController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall GenerativeAssistantSettingsController.viewDidLoad()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  id v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  objc_super v7 = (char *)&v32 - v6;
  uint64_t v8 = sub_24FABF3E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  objc_super v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24FABF3A0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (objc_class *)type metadata accessor for GenerativeAssistantSettingsController();
  v32.receiver = v1;
  v32.super_class = v16;
  objc_msgSendSuper2(&v32, sel_viewDidLoad);
  sub_24FABF390();
  char v17 = sub_24FABF370();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  if (v17)
  {
    sub_24FABF3D0();
    char v18 = sub_24FABF3B0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    if ((v18 & 1) == 0)
    {
      uint64_t v19 = swift_retain();
      sub_24FAB159C(v19, (uint64_t)v7);
      sub_24FA95C38((uint64_t)v7, (uint64_t)v5);
      id v20 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269A4BE50));
      uint64_t v21 = (void *)sub_24FABF8C0();
      id v22 = objc_msgSend(v21, sel_view);
      if (v22)
      {
        uint64_t v23 = v22;
        id v24 = objc_msgSend(v1, sel_view);
        if (v24)
        {
          id v25 = v24;
          objc_msgSend(v24, sel_addSubview_, v23);

          id v26 = objc_msgSend(v1, sel_view);
          if (v26)
          {
            uint64_t v27 = v26;
            objc_msgSend(v26, sel_bounds);
            double v29 = v28;
            double v31 = v30;

            objc_msgSend(v23, sel_setFrame_, 0.0, 0.0, v29, v31);
            objc_msgSend(v23, sel_setAutoresizingMask_, 18);
            objc_msgSend(v1, sel_addChildViewController_, v21);
            objc_msgSend(v21, sel_didMoveToParentViewController_, v1);

            sub_24FA95C9C((uint64_t)v7);
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
        sub_24FA95C9C((uint64_t)v7);
      }
    }
  }
}

uint64_t sub_24FA95090(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24FA96A38;
  return v6();
}

uint64_t sub_24FA9515C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *id v5 = v4;
  v5[1] = sub_24FA96A38;
  return v7();
}

uint64_t sub_24FA95228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24FAC0110();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24FAC0100();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24FA89838(a1, &qword_269A4C2D0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24FAC00A0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24FA953D4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24FA954B0;
  return v6(a1);
}

uint64_t sub_24FA954B0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_24FA955A8(uint64_t a1, uint64_t a2)
{
  sub_24FAC03B0();
  sub_24FAC0000();
  uint64_t v4 = sub_24FAC03D0();

  return sub_24FA95D10(a1, a2, v4);
}

unint64_t sub_24FA95620(unsigned __int8 a1)
{
  sub_24FAC03B0();
  sub_24FAC0000();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_24FAC03D0();

  return sub_24FA95DF4(a1, v2);
}

unint64_t sub_24FA95754(uint64_t a1)
{
  uint64_t v2 = sub_24FAC0200();

  return sub_24FA96064(a1, v2);
}

uint64_t sub_24FA95798(uint64_t a1)
{
  return a1;
}

uint64_t sub_24FA957EC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

BOOL sub_24FA95824()
{
  return sub_24FA93B3C();
}

uint64_t sub_24FA9582C()
{
  return sub_24FA93CB4();
}

uint64_t sub_24FA9585C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 64);
  char v10 = *(unsigned char *)(v1 + 56);
  objc_super v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *objc_super v11 = v2;
  v11[1] = sub_24FA96A38;
  return sub_24FA941A0(a1, v4, v5, v6, v7, v8, v10, v9);
}

BOOL sub_24FA9594C()
{
  return sub_24FA92F64();
}

uint64_t sub_24FA95954()
{
  return sub_24FA93088(*(void **)(v0 + 16));
}

uint64_t sub_24FA95960(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 64);
  char v10 = *(unsigned char *)(v1 + 56);
  objc_super v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *objc_super v11 = v2;
  v11[1] = sub_24FA95A50;
  return sub_24FA941A0(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_24FA95A50()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

BOOL sub_24FA95B44()
{
  return sub_24FA92EDC();
}

uint64_t sub_24FA95B4C()
{
  return sub_24FA93CB4();
}

uint64_t sub_24FA95B7C()
{
  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_24FA95BB4()
{
  return sub_24FA92E3C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t type metadata accessor for GenerativeAssistantSettingsController()
{
  return self;
}

uint64_t sub_24FA95C38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GenerativeAssistantSettingsView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FA95C9C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GenerativeAssistantSettingsView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t method lookup function for GenerativeAssistantSettingsController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GenerativeAssistantSettingsController);
}

unint64_t sub_24FA95D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24FAC0330() & 1) == 0)
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
      while (!v14 && (sub_24FAC0330() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24FA95DF4(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xD000000000000017;
      unint64_t v8 = 0x800000024FAC2FA0;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0x6C646E7542707061;
          unint64_t v8 = 0xEB00000000444965;
          break;
        case 2:
          break;
        case 3:
          unint64_t v8 = 0x800000024FAC2FC0;
          unint64_t v7 = 0xD000000000000013;
          break;
        case 4:
          unint64_t v7 = 0xD00000000000001ALL;
          unint64_t v8 = 0x800000024FAC2FE0;
          break;
        default:
          unint64_t v7 = 0x496D616441707061;
          unint64_t v8 = 0xE900000000000044;
          break;
      }
      unint64_t v9 = 0xD000000000000017;
      unint64_t v10 = 0x800000024FAC2FA0;
      switch(v6)
      {
        case 1:
          unint64_t v10 = 0xEB00000000444965;
          if (v7 == 0x6C646E7542707061) {
            goto LABEL_15;
          }
          goto LABEL_16;
        case 2:
          goto LABEL_14;
        case 3:
          unint64_t v10 = 0x800000024FAC2FC0;
          unint64_t v9 = 0xD000000000000013;
LABEL_14:
          if (v7 == v9) {
            goto LABEL_15;
          }
          goto LABEL_16;
        case 4:
          unint64_t v10 = 0x800000024FAC2FE0;
          if (v7 != 0xD00000000000001ALL) {
            goto LABEL_16;
          }
          goto LABEL_15;
        default:
          unint64_t v10 = 0xE900000000000044;
          if (v7 != 0x496D616441707061) {
            goto LABEL_16;
          }
LABEL_15:
          if (v8 == v10)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_16:
          char v11 = sub_24FAC0330();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v11) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_24FA96064(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24FA969DC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x25336C3D0](v9, a1);
      sub_24FA95798((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_24FA9612C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_24FA9620C;
  return v5(v2 + 32);
}

uint64_t sub_24FA9620C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_24FA96320()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24FA96358(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24FA95A50;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269A4BE58 + dword_269A4BE58);
  return v6(a1, v4);
}

uint64_t sub_24FA96410()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24FA96458()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24FA96A38;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_269A4BE70 + dword_269A4BE70);
  return v6(v2, v3, v4);
}

uint64_t sub_24FA96510()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24FA96A38;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_269A4BE80 + dword_269A4BE80);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_49Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24FA96614(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = sub_24FA96A38;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_269A4BE90 + dword_269A4BE90);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24FA966E0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24FA96A38;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269A4BEA0 + dword_269A4BEA0);
  return v6(a1, v4);
}

uint64_t sub_24FA967B0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24FA967F0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  char v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *char v7 = v2;
  v7[1] = sub_24FA96A38;
  return sub_24FA931A0(a1, v4, v5, v6);
}

uint64_t sub_24FA968B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FA9691C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24FA96A38;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269A4C2F8 + dword_269A4C2F8);
  return v6(a1, v4);
}

uint64_t sub_24FA969DC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24FA96A5C(uint64_t a1, uint64_t a2)
{
  char v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24FA9FDF0;
  return v7(a1, a2);
}

uint64_t sub_24FA96B4C(uint64_t a1, uint64_t a2)
{
  char v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24FA96C3C;
  return v7(a1, a2);
}

uint64_t sub_24FA96C3C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

void sub_24FA96D38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C030);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  id v7 = objc_msgSend(self, sel_sharedInstance);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(void *)(v9 + ((v6 + v8 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
  aBlock[4] = sub_24FA9FB20;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24FA97138;
  aBlock[3] = &block_descriptor_147;
  uint64_t v10 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v7, sel_getAllIAPsForActiveAccountWithResultHandler_, v10);
  _Block_release(v10);
}

uint64_t sub_24FA96F24(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a1) {
    goto LABEL_19;
  }
  if (!(a1 >> 62))
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain_n();
    id v20 = a4;
    if (v6) {
      goto LABEL_4;
    }
LABEL_17:
    uint64_t v9 = (void *)MEMORY[0x263F8EE78];
LABEL_18:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRetain();
    sub_24FA9E198((uint64_t)v9, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_19:
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C030);
    return sub_24FAC00B0();
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = sub_24FAC02D0();
  uint64_t v6 = result;
  id v20 = a4;
  if (!result) {
    goto LABEL_17;
  }
LABEL_4:
  if (v6 >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v10 = (id)MEMORY[0x25336C410](v8, a1);
      }
      else {
        id v10 = *(id *)(a1 + 8 * v8 + 32);
      }
      char v11 = v10;
      id v12 = objc_msgSend(v10, sel_adamId, v20);
      id v13 = objc_msgSend(v12, sel_stringValue);

      uint64_t v14 = sub_24FABFFE0();
      uint64_t v16 = v15;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = sub_24FA9DDF0(0, v9[2] + 1, 1, v9);
      }
      unint64_t v18 = v9[2];
      unint64_t v17 = v9[3];
      if (v18 >= v17 >> 1) {
        uint64_t v9 = sub_24FA9DDF0((void *)(v17 > 1), v18 + 1, 1, v9);
      }
      ++v8;
      v9[2] = v18 + 1;
      uint64_t v19 = &v9[2 * v18];
      v19[4] = v14;
      v19[5] = v16;
    }
    while (v6 != v8);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_24FA97138(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_24FA8FF90(0, &qword_269A4C038);
    uint64_t v4 = sub_24FAC0060();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24FA971DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24FA97250()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();

  return swift_release();
}

uint64_t sub_24FA972C8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24FA9733C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24FA973E4;
  return MEMORY[0x270FA2498](sub_24FA9E470, 0, 0);
}

uint64_t sub_24FA973E4(char a1)
{
  *(unsigned char *)(*(void *)v1 + 40) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24FA974E4, 0, 0);
}

uint64_t sub_24FA974E4()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_isAppInstalled) = *(unsigned char *)(v0 + 40);
  sub_24FA97D24();
  sub_24FA98444();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_24FA97590;
  return sub_24FA99D04();
}

uint64_t sub_24FA97590()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24FA97684()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_24FA976A4, 0, 0);
}

uint64_t sub_24FA976A4()
{
  uint64_t v1 = __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24)+ OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_appStoreDataSource), *(void *)(*(void *)(v0 + 24)+ OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_appStoreDataSource+ 24));
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269A4C238
                                                                                    + dword_269A4C238);
  id v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v6;
  *id v6 = v0;
  v6[1] = sub_24FA97788;
  return v8(3, 1, v3, v2, v4, v5);
}

uint64_t sub_24FA97788(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24FA97BC0;
  }
  else
  {
    *(void *)(v4 + 48) = a1;
    uint64_t v5 = sub_24FA978B0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24FA978B0()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C028);
  *uint64_t v3 = v0;
  v3[1] = sub_24FA979B4;
  return MEMORY[0x270FA2318](v0 + 2, 0, 0, 0xD00000000000001DLL, 0x800000024FAC40A0, sub_24FA9FA70, v2, v4);
}

uint64_t sub_24FA979B4()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24FA97AE8, 0, 0);
}

uint64_t sub_24FA97AE8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(*(void *)(v0 + 16) + 16);
  swift_bridgeObjectRelease();
  int v3 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_accountReportsPaidPlan);
  int v4 = (v3 << 31 >> 31) & 3;
  if (v3) {
    char v5 = 2;
  }
  else {
    char v5 = 4;
  }
  if (v2) {
    LOBYTE(v4) = v5;
  }
  if (v3 == 2) {
    char v6 = 0;
  }
  else {
    char v6 = v4;
  }
  *(unsigned char *)(v0 + 81) = v6;
  sub_24FAC00D0();
  *(void *)(v0 + 72) = sub_24FAC00C0();
  uint64_t v8 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FA97C64, v8, v7);
}

uint64_t sub_24FA97BC0()
{
  *(unsigned char *)(v0 + 81) = 1;
  sub_24FAC00D0();
  *(void *)(v0 + 72) = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FA97C64, v2, v1);
}

uint64_t sub_24FA97C64()
{
  char v1 = *(unsigned char *)(v0 + 81);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 80) = v1;
  swift_retain();
  sub_24FABF610();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 81);
  return v2(v3);
}

uint64_t sub_24FA97D24()
{
  return sub_24FA98480((uint64_t)&unk_270121870, (uint64_t)&unk_270121898, (uint64_t)&unk_269A4C018);
}

uint64_t sub_24FA97D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FA97E10, 0, 0);
}

uint64_t sub_24FA97E10()
{
  if (qword_269A4BA80 != -1) {
    swift_once();
  }
  *(void *)(v0 + 16) = 0xD000000000000011;
  *(void *)(v0 + 24) = 0x800000024FAC4020;
  *(_OWORD *)(v0 + 32) = xmmword_24FAC18D0;
  *(void *)(v0 + 48) = 49;
  *(void *)(v0 + 56) = 0xE100000000000000;
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_24FAA4FF4(v1, (_OWORD *)(v0 + 16));
  uint64_t v4 = v3;
  *(void *)(v0 + 96) = v2;
  *(void *)(v0 + 104) = v3;
  *(void *)(v0 + 112) = v5;
  uint64_t v7 = (void *)sub_24FAAA774(v6, v5);
  id v8 = objc_msgSend(v4, sel_URLForKey_, v7);
  *(void *)(v0 + 120) = v8;

  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24FA97FA4;
  uint64_t v10 = *(void *)(v0 + 88);
  return sub_24FAAC7E8(v10, (uint64_t)v8, 4, 1, v2);
}

uint64_t sub_24FA97FA4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24FA981B8;
  }
  else
  {
    uint64_t v4 = *(void **)(v2 + 120);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_24FA980E0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24FA980E0()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = sub_24FABF200();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  sub_24FAC00D0();
  *(void *)(v0 + 144) = sub_24FAC00C0();
  uint64_t v4 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FA982C4, v4, v3);
}

uint64_t sub_24FA981B8()
{
  uint64_t v1 = *(void **)(v0 + 136);
  uint64_t v2 = *(void **)(v0 + 120);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = sub_24FABF200();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_24FAC00D0();
  *(void *)(v0 + 144) = sub_24FAC00C0();
  uint64_t v6 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FA982C4, v6, v5);
}

uint64_t sub_24FA982C4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[9];
  swift_release();
  sub_24FA897D4(v2, v1, &qword_269A4BBC8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FA897D4(v1, v3, &qword_269A4BBC8);
  swift_retain();
  sub_24FABF610();
  sub_24FA89838(v1, &qword_269A4BBC8);
  return MEMORY[0x270FA2498](sub_24FA983B4, 0, 0);
}

uint64_t sub_24FA983B4()
{
  sub_24FA89838(*(void *)(v0 + 88), &qword_269A4BBC8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24FA98444()
{
  return sub_24FA98480((uint64_t)&unk_270121820, (uint64_t)&unk_270121848, (uint64_t)&unk_269A4C008);
}

uint64_t sub_24FA98480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24FAC0110();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  char v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v5;
  int v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  swift_retain();
  if (v12 == 1)
  {
    sub_24FA89838((uint64_t)v8, &qword_269A4C2D0);
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    sub_24FAC0100();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (v11[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = sub_24FAC00A0();
      uint64_t v14 = v15;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
    }
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = v11;
  if (v14 | v13)
  {
    v18[0] = 0;
    v18[1] = 0;
    v18[2] = v13;
    v18[3] = v14;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24FA986B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 32) = a4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 40) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24FA98748;
  return static SettingsRemoteLocalization.upgradeIAPString()();
}

uint64_t sub_24FA98748(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 56) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24FA98848, 0, 0);
}

uint64_t sub_24FA98848()
{
  sub_24FAC00D0();
  *(void *)(v0 + 64) = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FA988DC, v2, v1);
}

uint64_t sub_24FA988DC()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[6];
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v0[2] = v2;
  v0[3] = v1;
  swift_retain();
  sub_24FABF610();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24FA9899C(uint64_t a1, char *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (((1 << SHIBYTE(v13)) & 0x2A) == 0)
  {
    if (((1 << SHIBYTE(v13)) & 0x14) != 0)
    {
      uint64_t v9 = sub_24FAC0110();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = 0;
      *(void *)(v10 + 24) = 0;
      *(void *)(v10 + 32) = v2;
      *(unsigned char *)(v10 + 40) = v7;
      swift_retain();
      char v11 = &unk_269A4BFC0;
    }
    else
    {
      uint64_t v12 = sub_24FAC0110();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v6, 1, 1, v12);
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = 0;
      *(void *)(v10 + 24) = 0;
      *(void *)(v10 + 32) = v2;
      *(unsigned char *)(v10 + 40) = v7;
      swift_retain();
      char v11 = &unk_269A4BFD0;
    }
    sub_24FA937DC((uint64_t)v6, (uint64_t)v11, v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_24FA98BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 41) = a5;
  *(void *)(v5 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24FA98C10, 0, 0);
}

uint64_t sub_24FA98C10()
{
  *(unsigned char *)(v0 + 40) = *(unsigned char *)(v0 + 41);
  uint64_t v1 = swift_allocObject();
  *(void *)(v0 + 24) = v1;
  swift_weakInit();
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24FA9FDEC;
  return sub_24FA99604(0, (unsigned char *)(v0 + 40), (uint64_t)sub_24FA9F56C, v1);
}

uint64_t sub_24FA98D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 48) = a4;
  return MEMORY[0x270FA2498](sub_24FA98D2C, 0, 0);
}

uint64_t sub_24FA98D2C()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24FA98E24;
    return sub_24FA99D04();
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_24FA98E24()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24FA9FDD4, 0, 0);
}

uint64_t sub_24FA98F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 41) = a5;
  *(void *)(v5 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24FA98F60, 0, 0);
}

uint64_t sub_24FA98F60()
{
  *(unsigned char *)(v0 + 40) = *(unsigned char *)(v0 + 41);
  uint64_t v1 = swift_allocObject();
  *(void *)(v0 + 24) = v1;
  swift_weakInit();
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24FA9905C;
  return sub_24FA99604(1, (unsigned char *)(v0 + 40), (uint64_t)sub_24FA9F730, v1);
}

uint64_t sub_24FA9905C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release_n();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24FA99170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24FAC0110();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  uint64_t v12[3] = 0;
  v12[4] = a2;
  int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  swift_retain();
  if (v13 == 1)
  {
    sub_24FA89838((uint64_t)v9, &qword_269A4C2D0);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  else
  {
    sub_24FAC0100();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (v12[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v14 = sub_24FAC00A0();
      uint64_t v15 = v16;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
  }
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a5;
  *(void *)(v17 + 24) = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BE68);
  if (v15 | v14)
  {
    v19[0] = 0;
    v19[1] = 0;
    v19[2] = v14;
    void v19[3] = v15;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24FA993AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 48) = a4;
  return MEMORY[0x270FA2498](sub_24FA993CC, 0, 0);
}

uint64_t sub_24FA993CC()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24FA994C4;
    return sub_24FA99D04();
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_24FA994C4()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24FA995DC, 0, 0);
}

uint64_t sub_24FA995DC()
{
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 56) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24FA99604(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 72) = a4;
  *(void *)(v5 + 80) = v4;
  *(unsigned char *)(v5 + 128) = *a2;
  *(void *)(v5 + 64) = a3;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269A4BFA0 + dword_269A4BFA0);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 88) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_24FA996C8;
  return v9(a1, v5 + 128);
}

uint64_t sub_24FA996C8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24FA997C8, 0, 0);
}

uint64_t sub_24FA997C8()
{
  uint64_t v1 = *(void *)(v0 + 96);
  if (v1)
  {
    uint64_t v2 = (void *)sub_24FABFFD0();
    uint64_t v3 = (void *)sub_24FABFFD0();
    id v4 = objc_msgSend(self, sel_bagForProfile_profileVersion_, v2, v3);
    *(void *)(v0 + 104) = v4;

    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F27EB8]), sel_initWithRequest_, v1);
    *(void *)(v0 + 112) = v5;
    objc_msgSend(v5, sel_setBag_, v4);
    sub_24FA9A978();
    sub_24FAC00D0();
    *(void *)(v0 + 120) = sub_24FAC00C0();
    uint64_t v7 = sub_24FAC00A0();
    return MEMORY[0x270FA2498](sub_24FA99958, v7, v6);
  }
  else
  {
    (*(void (**)(void))(v0 + 64))(0);
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_24FA99958()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[8];
  swift_release();
  id v4 = objc_msgSend(v1, sel_present);
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v3;
  v6[3] = v2;
  v6[4] = v5;
  v0[6] = sub_24FA9F3C8;
  v0[7] = v6;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24FA99C78;
  v0[5] = &block_descriptor;
  uint64_t v7 = _Block_copy(v0 + 2);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_addFinishBlock_, v7);
  _Block_release(v7);

  return MEMORY[0x270FA2498](sub_24FA99ACC, 0, 0);
}

uint64_t sub_24FA99ACC()
{
  uint64_t v1 = *(void **)(v0 + 112);
  uint64_t v2 = *(void **)(v0 + 96);

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24FA99B38(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  a3(a2);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    if (qword_269A4BA98 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_24FABF440();
    __swift_project_value_buffer(v5, (uint64_t)qword_269A4E278);
    uint64_t v6 = sub_24FABF410();
    os_log_type_t v7 = sub_24FAC0150();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_24FA83000, v6, v7, "stopPollingBillingChanges(forced:)", v8, 2u);
      MEMORY[0x25336CB50](v8, -1, -1);
    }

    if (*(unsigned char *)(v4 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_isPollingForBillingChanges) == 1) {
      *(unsigned char *)(v4 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_continuouslyPoll) = 0;
    }
    return swift_release();
  }
  return result;
}

void sub_24FA99C78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_24FA99D04()
{
  v1[4] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  v1[5] = swift_task_alloc();
  uint64_t v2 = sub_24FABF5D0();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BF88);
  v1[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FA99E24, 0, 0);
}

uint64_t sub_24FA99E24()
{
  uint64_t v10 = v0;
  if (qword_269A4BA98 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24FABF440();
  v0[10] = __swift_project_value_buffer(v1, (uint64_t)qword_269A4E278);
  uint64_t v2 = sub_24FABF410();
  os_log_type_t v3 = sub_24FAC0150();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v9 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[3] = sub_24FA86AD8(0xD000000000000017, 0x800000024FAC3FD0, &v9);
    sub_24FAC01A0();
    _os_log_impl(&dword_24FA83000, v2, v3, "%s Fetching updated billing plan", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v5, -1, -1);
    MEMORY[0x25336CB50](v4, -1, -1);
  }

  sub_24FABF580();
  id v6 = (void *)swift_task_alloc();
  v0[11] = v6;
  *id v6 = v0;
  v6[1] = sub_24FA9A020;
  uint64_t v7 = v0[9];
  return MEMORY[0x270F0C1D0](v7);
}

uint64_t sub_24FA9A020()
{
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v3 = v2[8];
  uint64_t v4 = v2[7];
  uint64_t v5 = v2[6];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    id v6 = sub_24FA9A420;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    id v6 = sub_24FA9A1B8;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24FA9A1B8()
{
  uint64_t v14 = v0;
  uint64_t v1 = v0[9];
  uint64_t v2 = sub_24FABF4D0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  sub_24FA89838(v0[9], &qword_269A4BF88);
  uint64_t v3 = sub_24FABF410();
  os_log_type_t v4 = sub_24FAC0150();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v13 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    v0[2] = sub_24FA86AD8(0xD000000000000017, 0x800000024FAC3FD0, &v13);
    sub_24FAC01A0();
    _os_log_impl(&dword_24FA83000, v3, v4, "%s Completed updating billing plan", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v6, -1, -1);
    MEMORY[0x25336CB50](v5, -1, -1);
  }

  uint64_t v8 = v0[4];
  uint64_t v7 = v0[5];
  uint64_t v9 = sub_24FAC0110();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v8;
  swift_retain();
  sub_24FA93988(v7, (uint64_t)&unk_269A4BF98, (uint64_t)v10);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24FA9A420()
{
  uint64_t v14 = v0;
  uint64_t v1 = v0[9];
  uint64_t v2 = sub_24FABF4D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  sub_24FA89838(v0[9], &qword_269A4BF88);
  uint64_t v3 = sub_24FABF410();
  os_log_type_t v4 = sub_24FAC0150();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v13 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    v0[2] = sub_24FA86AD8(0xD000000000000017, 0x800000024FAC3FD0, &v13);
    sub_24FAC01A0();
    _os_log_impl(&dword_24FA83000, v3, v4, "%s Completed updating billing plan", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v6, -1, -1);
    MEMORY[0x25336CB50](v5, -1, -1);
  }

  uint64_t v8 = v0[4];
  uint64_t v7 = v0[5];
  uint64_t v9 = sub_24FAC0110();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v8;
  swift_retain();
  sub_24FA93988(v7, (uint64_t)&unk_269A4BF98, (uint64_t)v10);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24FA9A688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  v4[4] = swift_task_alloc();
  v4[5] = swift_task_alloc();
  uint64_t v5 = sub_24FABF5D0();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FA9A788, 0, 0);
}

uint64_t sub_24FA9A788()
{
  sub_24FAC00D0();
  *(void *)(v0 + 72) = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FA9A81C, v2, v1);
}

uint64_t sub_24FA9A81C()
{
  swift_release();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v2 = *(void *)(v0 + 64);
    uint64_t v5 = *(void *)(v0 + 40);
    uint64_t v4 = *(void *)(v0 + 48);
    uint64_t v6 = *(void *)(v0 + 32);
    sub_24FABF580();
    sub_24FABF510();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24FA897D4(v5, v6, &qword_269A4BBC0);
    swift_retain();
    sub_24FABF610();
    sub_24FAA3124();
    sub_24FA89838(v5, &qword_269A4BBC0);
    swift_release();
  }
  **(unsigned char **)(v0 + 16) = Strong == 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

void sub_24FA9A978()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((unsigned char *)v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_isPollingForBillingChanges) == 1)
  {
    *((unsigned char *)v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_continuouslyPoll) = 1;
    if (qword_269A4BA98 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24FABF440();
    __swift_project_value_buffer(v6, (uint64_t)qword_269A4E278);
    unint64_t v18 = sub_24FABF410();
    os_log_type_t v7 = sub_24FAC0150();
    if (os_log_type_enabled(v18, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v20 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      uint64_t v19 = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v20);
      sub_24FAC01A0();
      _os_log_impl(&dword_24FA83000, v18, v7, "%s Duplicate request to poll; re-enabling post-poll timer", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336CB50](v9, -1, -1);
      MEMORY[0x25336CB50](v8, -1, -1);
    }
    else
    {
      uint64_t v16 = v18;
    }
  }
  else
  {
    *((unsigned char *)v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_isPollingForBillingChanges) = 1;
    *((unsigned char *)v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_continuouslyPoll) = 1;
    if (qword_269A4BA98 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24FABF440();
    __swift_project_value_buffer(v10, (uint64_t)qword_269A4E278);
    uint64_t v11 = sub_24FABF410();
    os_log_type_t v12 = sub_24FAC0150();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_24FA83000, v11, v12, "startPollingBillingChanges()", v13, 2u);
      MEMORY[0x25336CB50](v13, -1, -1);
    }

    uint64_t v14 = sub_24FAC0110();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v5, 1, 1, v14);
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = 0;
    void v15[3] = 0;
    v15[4] = v1;
    v15[5] = v2;
    swift_retain();
    sub_24FA937DC((uint64_t)v5, (uint64_t)&unk_269A4BF60, (uint64_t)v15);
    swift_release();
  }
}

uint64_t sub_24FA9AD08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[21] = a4;
  uint64_t v5 = sub_24FAC0280();
  v4[22] = v5;
  v4[23] = *(void *)(v5 - 8);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  uint64_t v6 = sub_24FAC02A0();
  v4[26] = v6;
  v4[27] = *(void *)(v6 - 8);
  v4[28] = swift_task_alloc();
  uint64_t v7 = sub_24FABF290();
  v4[29] = v7;
  v4[30] = *(void *)(v7 - 8);
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FA9AEAC, 0, 0);
}

uint64_t sub_24FA9AEAC()
{
  uint64_t v38 = v0;
  sub_24FABF280();
  sub_24FABF230();
  uint64_t v1 = OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_allowPlanUpdatePolling;
  *(void *)(v0 + 272) = OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_continuouslyPoll;
  *(void *)(v0 + 280) = v1;
  swift_beginAccess();
  swift_beginAccess();
  sub_24FABF260();
  if (v2 > -2.0 && v2 < 0.0)
  {
    double v3 = (v2 + 2.0) * 1000.0;
    if ((~*(void *)&v3 & 0x7FF0000000000000) != 0)
    {
      if (v3 > -1.0)
      {
        if (v3 < 1.84467441e19)
        {
          if (qword_269A4BA98 == -1)
          {
LABEL_7:
            unint64_t v4 = (unint64_t)v3;
            uint64_t v5 = sub_24FABF440();
            __swift_project_value_buffer(v5, (uint64_t)qword_269A4E278);
            uint64_t v6 = sub_24FABF410();
            os_log_type_t v7 = sub_24FAC0150();
            if (os_log_type_enabled(v6, v7))
            {
              uint64_t v8 = swift_slowAlloc();
              uint64_t v9 = swift_slowAlloc();
              uint64_t v37 = v9;
              *(_DWORD *)uint64_t v8 = 136315394;
              *(void *)(v0 + 152) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v37);
              sub_24FAC01A0();
              *(_WORD *)(v8 + 12) = 2048;
              *(void *)(v0 + 160) = v4;
              sub_24FAC01A0();
              _os_log_impl(&dword_24FA83000, v6, v7, "%s Waiting for %llums", (uint8_t *)v8, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x25336CB50](v9, -1, -1);
              MEMORY[0x25336CB50](v8, -1, -1);
            }

            uint64_t v10 = 1000000000000000 * v4;
            uint64_t v11 = (v4 * (unsigned __int128)0x38D7EA4C68000uLL) >> 64;
            uint64_t v13 = *(void *)(v0 + 184);
            uint64_t v12 = *(void *)(v0 + 192);
            uint64_t v14 = *(void *)(v0 + 176);
            sub_24FAC0290();
            *(void *)(v0 + 88) = v10;
            *(void *)(v0 + 96) = v11;
            *(void *)(v0 + 72) = 0;
            *(void *)(v0 + 64) = 0;
            *(unsigned char *)(v0 + 80) = 1;
            uint64_t v15 = sub_24FA9DF00(&qword_269A4BF70, MEMORY[0x263F8F710]);
            sub_24FAC0340();
            sub_24FA9DF00(&qword_269A4BF78, MEMORY[0x263F8F6D8]);
            sub_24FAC02B0();
            uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
            *(void *)(v0 + 288) = v16;
            *(void *)(v0 + 296) = (v13 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
            v16(v12, v14);
            uint64_t v17 = (void *)swift_task_alloc();
            *(void *)(v0 + 304) = v17;
            *uint64_t v17 = v0;
            v17[1] = sub_24FA9B4D8;
            uint64_t v19 = *(void *)(v0 + 200);
            uint64_t v18 = *(void *)(v0 + 208);
            return MEMORY[0x270FA2380](v19, v0 + 64, v18, v15);
          }
LABEL_24:
          swift_once();
          goto LABEL_7;
        }
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v20 = *(void *)(v0 + 264);
  uint64_t v21 = *(void *)(v0 + 272);
  uint64_t v23 = *(void *)(v0 + 240);
  uint64_t v22 = *(void *)(v0 + 248);
  uint64_t v24 = *(void *)(v0 + 232);
  uint64_t v25 = *(void *)(v0 + 168);
  sub_24FABF280();
  id v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  v26(v20, v22, v24);
  if (*(unsigned char *)(v25 + v21) == 1)
  {
    uint64_t v27 = *(void *)(v0 + 256);
    uint64_t v28 = *(void *)(v0 + 248);
    uint64_t v29 = *(void *)(v0 + 232);
    sub_24FABF230();
    v26(v27, v28, v29);
    if (qword_269A4BA98 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_24FABF440();
    __swift_project_value_buffer(v30, (uint64_t)qword_269A4E278);
    double v31 = sub_24FABF410();
    os_log_type_t v32 = sub_24FAC0150();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v37 = v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      *(void *)(v0 + 128) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v37);
      sub_24FAC01A0();
      _os_log_impl(&dword_24FA83000, v31, v32, "%s Resetting poll timer", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336CB50](v34, -1, -1);
      MEMORY[0x25336CB50](v33, -1, -1);
    }
  }
  uint64_t v35 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v35;
  void *v35 = v0;
  v35[1] = sub_24FA9CD34;
  return sub_24FA99D04();
}

uint64_t sub_24FA9B4D8()
{
  double v2 = *(void **)v1;
  double v3 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 288);
  uint64_t v4 = *(void *)(*(void *)v1 + 200);
  uint64_t v5 = *(void *)(*(void *)v1 + 176);
  *(void *)(*(void *)v1 + 312) = v0;
  swift_task_dealloc();
  v3(v4, v5);
  if (v0)
  {
    uint64_t v6 = sub_24FA9C1BC;
  }
  else
  {
    (*(void (**)(void, void))(v2[27] + 8))(v2[28], v2[26]);
    uint64_t v6 = sub_24FA9B670;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24FA9B670()
{
  uint64_t v63 = v0;
  if (qword_269A4BA98 != -1) {
    swift_once();
  }
  uint64_t v61 = sub_24FABF440();
  __swift_project_value_buffer(v61, (uint64_t)qword_269A4E278);
  uint64_t v1 = sub_24FABF410();
  os_log_type_t v2 = sub_24FAC0150();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    uint64_t v62 = v4;
    *(_DWORD *)uint64_t v3 = 136315394;
    *(void *)(v0 + 112) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v62);
    sub_24FAC01A0();
    *(_WORD *)(v3 + 12) = 2080;
    sub_24FA9DF00((unint64_t *)&qword_269A4BF68, MEMORY[0x263F07490]);
    uint64_t v5 = sub_24FAC0310();
    *(void *)(v0 + 120) = sub_24FA86AD8(v5, v6, &v62);
    sub_24FAC01A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA83000, v1, v2, "%s pollingEndTime: %s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v4, -1, -1);
    MEMORY[0x25336CB50](v3, -1, -1);
  }

  os_log_type_t v7 = sub_24FABF410();
  os_log_type_t v8 = sub_24FAC0150();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v62 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    *(void *)(v0 + 136) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v62);
    sub_24FAC01A0();
    *(_WORD *)(v9 + 12) = 2080;
    sub_24FA9DF00((unint64_t *)&qword_269A4BF68, MEMORY[0x263F07490]);
    uint64_t v11 = sub_24FAC0310();
    *(void *)(v0 + 104) = sub_24FA86AD8(v11, v12, &v62);
    sub_24FAC01A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA83000, v7, v8, "%s lastPollStarted: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v10, -1, -1);
    MEMORY[0x25336CB50](v9, -1, -1);
  }

  uint64_t v14 = *(void *)(v0 + 240);
  uint64_t v13 = *(void *)(v0 + 248);
  uint64_t v15 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 16))(v13, *(void *)(v0 + 256), v15);
  sub_24FABF220();
  double v17 = v16;
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v18(v13, v15);
  if (v17 > 0.0 && (*(unsigned char *)(*(void *)(v0 + 168) + *(void *)(v0 + 280)) & 1) != 0)
  {
    sub_24FABF260();
    if (v19 > -2.0 && v19 < 0.0)
    {
      double v20 = (v19 + 2.0) * 1000.0;
      if ((~*(void *)&v20 & 0x7FF0000000000000) != 0)
      {
        if (v20 > -1.0)
        {
          if (v20 < 1.84467441e19)
          {
            if (qword_269A4BA98 == -1)
            {
LABEL_15:
              unint64_t v21 = (unint64_t)v20;
              __swift_project_value_buffer(v61, (uint64_t)qword_269A4E278);
              uint64_t v22 = sub_24FABF410();
              os_log_type_t v23 = sub_24FAC0150();
              if (os_log_type_enabled(v22, v23))
              {
                uint64_t v24 = swift_slowAlloc();
                uint64_t v25 = swift_slowAlloc();
                uint64_t v62 = v25;
                *(_DWORD *)uint64_t v24 = 136315394;
                *(void *)(v0 + 152) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v62);
                sub_24FAC01A0();
                *(_WORD *)(v24 + 12) = 2048;
                *(void *)(v0 + 160) = v21;
                sub_24FAC01A0();
                _os_log_impl(&dword_24FA83000, v22, v23, "%s Waiting for %llums", (uint8_t *)v24, 0x16u);
                swift_arrayDestroy();
                MEMORY[0x25336CB50](v25, -1, -1);
                MEMORY[0x25336CB50](v24, -1, -1);
              }

              uint64_t v26 = 1000000000000000 * v21;
              uint64_t v27 = (v21 * (unsigned __int128)0x38D7EA4C68000uLL) >> 64;
              uint64_t v29 = *(void *)(v0 + 184);
              uint64_t v28 = *(void *)(v0 + 192);
              uint64_t v30 = *(void *)(v0 + 176);
              sub_24FAC0290();
              *(void *)(v0 + 88) = v26;
              *(void *)(v0 + 96) = v27;
              *(void *)(v0 + 72) = 0;
              *(void *)(v0 + 64) = 0;
              *(unsigned char *)(v0 + 80) = 1;
              uint64_t v31 = sub_24FA9DF00(&qword_269A4BF70, MEMORY[0x263F8F710]);
              sub_24FAC0340();
              sub_24FA9DF00(&qword_269A4BF78, MEMORY[0x263F8F6D8]);
              sub_24FAC02B0();
              os_log_type_t v32 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
              *(void *)(v0 + 288) = v32;
              *(void *)(v0 + 296) = (v29 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
              v32(v28, v30);
              uint64_t v33 = (void *)swift_task_alloc();
              *(void *)(v0 + 304) = v33;
              void *v33 = v0;
              v33[1] = sub_24FA9B4D8;
              uint64_t v35 = *(void *)(v0 + 200);
              uint64_t v34 = *(void *)(v0 + 208);
              return MEMORY[0x270FA2380](v35, v0 + 64, v34, v31);
            }
LABEL_37:
            swift_once();
            goto LABEL_15;
          }
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_36;
    }
    uint64_t v45 = *(void *)(v0 + 264);
    uint64_t v46 = *(void *)(v0 + 272);
    uint64_t v48 = *(void *)(v0 + 240);
    uint64_t v47 = *(void *)(v0 + 248);
    uint64_t v49 = *(void *)(v0 + 232);
    uint64_t v50 = *(void *)(v0 + 168);
    sub_24FABF280();
    char v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 40);
    v51(v45, v47, v49);
    if (*(unsigned char *)(v50 + v46) == 1)
    {
      uint64_t v52 = *(void *)(v0 + 256);
      uint64_t v53 = *(void *)(v0 + 248);
      uint64_t v54 = *(void *)(v0 + 232);
      sub_24FABF230();
      v51(v52, v53, v54);
      if (qword_269A4BA98 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v61, (uint64_t)qword_269A4E278);
      uint64_t v55 = sub_24FABF410();
      os_log_type_t v56 = sub_24FAC0150();
      if (os_log_type_enabled(v55, v56))
      {
        uint64_t v57 = (uint8_t *)swift_slowAlloc();
        uint64_t v58 = swift_slowAlloc();
        uint64_t v62 = v58;
        *(_DWORD *)uint64_t v57 = 136315138;
        *(void *)(v0 + 128) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v62);
        sub_24FAC01A0();
        _os_log_impl(&dword_24FA83000, v55, v56, "%s Resetting poll timer", v57, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25336CB50](v58, -1, -1);
        MEMORY[0x25336CB50](v57, -1, -1);
      }
    }
    uint64_t v59 = (void *)swift_task_alloc();
    *(void *)(v0 + 320) = v59;
    void *v59 = v0;
    v59[1] = sub_24FA9CD34;
    return sub_24FA99D04();
  }
  else
  {
    uint64_t v36 = sub_24FABF410();
    os_log_type_t v37 = sub_24FAC0150();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v62 = v39;
      *(_DWORD *)uint64_t v38 = 136315138;
      *(void *)(v0 + 144) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v62);
      sub_24FAC01A0();
      _os_log_impl(&dword_24FA83000, v36, v37, "%s Reset polling state", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336CB50](v39, -1, -1);
      MEMORY[0x25336CB50](v38, -1, -1);
    }

    uint64_t v40 = *(void *)(v0 + 256);
    uint64_t v41 = *(void *)(v0 + 264);
    uint64_t v42 = *(void *)(v0 + 232);
    uint64_t v43 = *(void *)(v0 + 168);
    *(unsigned char *)(v43 + *(void *)(v0 + 280)) = 1;
    *(unsigned char *)(v43 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_isPollingForBillingChanges) = 0;
    v18(v40, v42);
    v18(v41, v42);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v44 = *(uint64_t (**)(void))(v0 + 8);
    return v44();
  }
}

uint64_t sub_24FA9C1BC()
{
  uint64_t v65 = v0;
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 208);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (qword_269A4BA98 != -1) {
    swift_once();
  }
  uint64_t v63 = sub_24FABF440();
  __swift_project_value_buffer(v63, (uint64_t)qword_269A4E278);
  uint64_t v4 = sub_24FABF410();
  os_log_type_t v5 = sub_24FAC0150();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v64 = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v0 + 112) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v64);
    sub_24FAC01A0();
    *(_WORD *)(v6 + 12) = 2080;
    sub_24FA9DF00((unint64_t *)&qword_269A4BF68, MEMORY[0x263F07490]);
    uint64_t v8 = sub_24FAC0310();
    *(void *)(v0 + 120) = sub_24FA86AD8(v8, v9, &v64);
    sub_24FAC01A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA83000, v4, v5, "%s pollingEndTime: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v7, -1, -1);
    MEMORY[0x25336CB50](v6, -1, -1);
  }

  uint64_t v10 = sub_24FABF410();
  os_log_type_t v11 = sub_24FAC0150();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v64 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    *(void *)(v0 + 136) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v64);
    sub_24FAC01A0();
    *(_WORD *)(v12 + 12) = 2080;
    sub_24FA9DF00((unint64_t *)&qword_269A4BF68, MEMORY[0x263F07490]);
    uint64_t v14 = sub_24FAC0310();
    *(void *)(v0 + 104) = sub_24FA86AD8(v14, v15, &v64);
    sub_24FAC01A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA83000, v10, v11, "%s lastPollStarted: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v13, -1, -1);
    MEMORY[0x25336CB50](v12, -1, -1);
  }

  uint64_t v17 = *(void *)(v0 + 240);
  uint64_t v16 = *(void *)(v0 + 248);
  uint64_t v18 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, void, uint64_t))(v17 + 16))(v16, *(void *)(v0 + 256), v18);
  sub_24FABF220();
  double v20 = v19;
  unint64_t v21 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v21(v16, v18);
  if (v20 > 0.0 && (*(unsigned char *)(*(void *)(v0 + 168) + *(void *)(v0 + 280)) & 1) != 0)
  {
    sub_24FABF260();
    if (v22 > -2.0 && v22 < 0.0)
    {
      double v23 = (v22 + 2.0) * 1000.0;
      if ((~*(void *)&v23 & 0x7FF0000000000000) != 0)
      {
        if (v23 > -1.0)
        {
          if (v23 < 1.84467441e19)
          {
            if (qword_269A4BA98 == -1)
            {
LABEL_15:
              uint64_t v24 = (void *)(v0 + 64);
              unint64_t v25 = (unint64_t)v23;
              __swift_project_value_buffer(v63, (uint64_t)qword_269A4E278);
              uint64_t v26 = sub_24FABF410();
              os_log_type_t v27 = sub_24FAC0150();
              if (os_log_type_enabled(v26, v27))
              {
                uint64_t v28 = swift_slowAlloc();
                uint64_t v29 = swift_slowAlloc();
                uint64_t v64 = v29;
                *(_DWORD *)uint64_t v28 = 136315394;
                *(void *)(v0 + 152) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v64);
                sub_24FAC01A0();
                *(_WORD *)(v28 + 12) = 2048;
                *(void *)(v0 + 160) = v25;
                uint64_t v24 = (void *)(v0 + 64);
                sub_24FAC01A0();
                _os_log_impl(&dword_24FA83000, v26, v27, "%s Waiting for %llums", (uint8_t *)v28, 0x16u);
                swift_arrayDestroy();
                MEMORY[0x25336CB50](v29, -1, -1);
                MEMORY[0x25336CB50](v28, -1, -1);
              }

              uint64_t v30 = *(void *)(v0 + 184);
              uint64_t v31 = *(void *)(v0 + 192);
              uint64_t v32 = *(void *)(v0 + 176);
              sub_24FAC0290();
              *(_OWORD *)(v0 + 88) = v25 * (unsigned __int128)0x38D7EA4C68000uLL;
              *uint64_t v24 = 0;
              v24[1] = 0;
              *(unsigned char *)(v0 + 80) = 1;
              uint64_t v33 = sub_24FA9DF00(&qword_269A4BF70, MEMORY[0x263F8F710]);
              sub_24FAC0340();
              sub_24FA9DF00(&qword_269A4BF78, MEMORY[0x263F8F6D8]);
              sub_24FAC02B0();
              uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
              *(void *)(v0 + 288) = v34;
              *(void *)(v0 + 296) = (v30 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
              v34(v31, v32);
              uint64_t v35 = (void *)swift_task_alloc();
              *(void *)(v0 + 304) = v35;
              void *v35 = v0;
              v35[1] = sub_24FA9B4D8;
              uint64_t v37 = *(void *)(v0 + 200);
              uint64_t v36 = *(void *)(v0 + 208);
              return MEMORY[0x270FA2380](v37, v24, v36, v33);
            }
LABEL_37:
            swift_once();
            goto LABEL_15;
          }
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_36;
    }
    uint64_t v47 = *(void *)(v0 + 264);
    uint64_t v48 = *(void *)(v0 + 272);
    uint64_t v50 = *(void *)(v0 + 240);
    uint64_t v49 = *(void *)(v0 + 248);
    uint64_t v51 = *(void *)(v0 + 232);
    uint64_t v52 = *(void *)(v0 + 168);
    sub_24FABF280();
    uint64_t v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 40);
    v53(v47, v49, v51);
    if (*(unsigned char *)(v52 + v48) == 1)
    {
      uint64_t v54 = *(void *)(v0 + 256);
      uint64_t v55 = *(void *)(v0 + 248);
      uint64_t v56 = *(void *)(v0 + 232);
      sub_24FABF230();
      v53(v54, v55, v56);
      if (qword_269A4BA98 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v63, (uint64_t)qword_269A4E278);
      uint64_t v57 = sub_24FABF410();
      os_log_type_t v58 = sub_24FAC0150();
      if (os_log_type_enabled(v57, v58))
      {
        uint64_t v59 = (uint8_t *)swift_slowAlloc();
        uint64_t v60 = swift_slowAlloc();
        uint64_t v64 = v60;
        *(_DWORD *)uint64_t v59 = 136315138;
        *(void *)(v0 + 128) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v64);
        sub_24FAC01A0();
        _os_log_impl(&dword_24FA83000, v57, v58, "%s Resetting poll timer", v59, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25336CB50](v60, -1, -1);
        MEMORY[0x25336CB50](v59, -1, -1);
      }
    }
    uint64_t v61 = (void *)swift_task_alloc();
    *(void *)(v0 + 320) = v61;
    *uint64_t v61 = v0;
    v61[1] = sub_24FA9CD34;
    return sub_24FA99D04();
  }
  else
  {
    uint64_t v38 = sub_24FABF410();
    os_log_type_t v39 = sub_24FAC0150();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v64 = v41;
      *(_DWORD *)uint64_t v40 = 136315138;
      *(void *)(v0 + 144) = sub_24FA86AD8(0xD00000000000001CLL, 0x800000024FAC3FB0, &v64);
      sub_24FAC01A0();
      _os_log_impl(&dword_24FA83000, v38, v39, "%s Reset polling state", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25336CB50](v41, -1, -1);
      MEMORY[0x25336CB50](v40, -1, -1);
    }

    uint64_t v42 = *(void *)(v0 + 256);
    uint64_t v43 = *(void *)(v0 + 264);
    uint64_t v44 = *(void *)(v0 + 232);
    uint64_t v45 = *(void *)(v0 + 168);
    *(unsigned char *)(v45 + *(void *)(v0 + 280)) = 1;
    *(unsigned char *)(v45 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_isPollingForBillingChanges) = 0;
    v21(v42, v44);
    v21(v43, v44);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v46 = *(uint64_t (**)(void))(v0 + 8);
    return v46();
  }
}

uint64_t sub_24FA9CD34()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24FA9FDD0, 0, 0);
}

void sub_24FA9CE30(char a1)
{
  uint64_t v2 = v1;
  if (qword_269A4BA98 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24FABF440();
  __swift_project_value_buffer(v4, (uint64_t)qword_269A4E278);
  os_log_type_t v5 = sub_24FABF410();
  os_log_type_t v6 = sub_24FAC0150();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_24FA83000, v5, v6, "stopPollingBillingChanges(forced:)", v7, 2u);
    MEMORY[0x25336CB50](v7, -1, -1);
  }

  if (*(unsigned char *)(v2 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_isPollingForBillingChanges) == 1) {
    *(unsigned char *)(v2 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_continuouslyPoll) = 0;
  }
  if (a1) {
    *(unsigned char *)(v2 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_allowPlanUpdatePolling) = 0;
  }
}

uint64_t sub_24FA9CF48()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo__subscriptionSource;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C048);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo__storeURL;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C050);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo__upgradeCTAText;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C058);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_appStoreDataSource);
  swift_weakDestroy();
  uint64_t v7 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v8 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v7, v8);
}

uint64_t sub_24FA9D09C()
{
  return type metadata accessor for SubscriptionInfo();
}

uint64_t type metadata accessor for SubscriptionInfo()
{
  uint64_t result = qword_269A4BF00;
  if (!qword_269A4BF00) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24FA9D0F0()
{
  sub_24FA9D250(319, &qword_269A4BF28, &qword_269A4BF30);
  if (v0 <= 0x3F)
  {
    sub_24FA9D250(319, &qword_269A4BF38, &qword_269A4BBC8);
    if (v1 <= 0x3F)
    {
      sub_24FA9D250(319, &qword_269A4BF40, &qword_269A4BF48);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_24FA9D250(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_24FABF620();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for SubscriptionInfo.Source(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SubscriptionInfo.Source(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24FA9D3FCLL);
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

ValueMetadata *type metadata accessor for SubscriptionInfo.Source()
{
  return &type metadata for SubscriptionInfo.Source;
}

unint64_t sub_24FA9D438()
{
  unint64_t result = qword_269A4BF50;
  if (!qword_269A4BF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269A4BF50);
  }
  return result;
}

uint64_t sub_24FA9D48C()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_24FA9D498@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SubscriptionInfo();
  uint64_t result = sub_24FABF5E0();
  *a1 = result;
  return result;
}

uint64_t sub_24FA9D4D8@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24FA9D558()
{
  return sub_24FABF610();
}

uint64_t sub_24FA9D5CC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();

  return swift_release();
}

uint64_t sub_24FA9D648(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  BOOL v7 = (char *)&v9 - v6;
  sub_24FA897D4(a1, (uint64_t)&v9 - v6, &qword_269A4BBC8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FA897D4((uint64_t)v7, (uint64_t)v5, &qword_269A4BBC8);
  swift_retain();
  sub_24FABF610();
  return sub_24FA89838((uint64_t)v7, &qword_269A4BBC8);
}

double sub_24FA9D758@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_24FA9D7D8()
{
  return sub_24FABF610();
}

uint64_t sub_24FA9D85C()
{
  return objectdestroyTm(48);
}

uint64_t sub_24FA9D864(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *BOOL v7 = v2;
  v7[1] = sub_24FA96A38;
  return sub_24FA9AD08(a1, v4, v5, v6);
}

uint64_t sub_24FA9D924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_24FAC0280();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_24FA9DA28, 0, 0);
}

uint64_t sub_24FA9DA28()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_24FAC02A0();
  uint64_t v5 = sub_24FA9DF00(&qword_269A4BF70, MEMORY[0x263F8F710]);
  sub_24FAC0340();
  sub_24FA9DF00(&qword_269A4BF78, MEMORY[0x263F8F6D8]);
  sub_24FAC02B0();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  BOOL v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *BOOL v7 = v0;
  v7[1] = sub_24FA9DBC8;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_24FA9DBC8()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24FA9DD84, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_24FA9DD84()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *sub_24FA9DDF0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C040);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
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
    sub_24FA9E360(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24FA9DF00(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24FA9DF48()
{
  return objectdestroyTm(40);
}

uint64_t sub_24FA9DF50(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24FA96A38;
  return sub_24FA9A688(a1, v4, v5, v6);
}

uint64_t sub_24FA9E00C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24FA9E02C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24FA9E02C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C040);
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
  uint64_t result = sub_24FAC02F0();
  __break(1u);
  return result;
}

uint64_t sub_24FA9E198(uint64_t result, void *a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    unint64_t v4 = 0;
    uint64_t v22 = result + 32;
    double v20 = a2 + 7;
    uint64_t v21 = MEMORY[0x263F8EE78];
    while (1)
    {
      if (v4 <= v2) {
        unint64_t v5 = v2;
      }
      else {
        unint64_t v5 = v4;
      }
      unint64_t v23 = v5;
      while (1)
      {
        if (v4 == v23) {
          goto LABEL_34;
        }
        uint64_t v6 = v4++;
        uint64_t v7 = a2[2];
        if (!v7) {
          goto LABEL_7;
        }
        uint64_t v8 = (uint64_t *)(v22 + 16 * v6);
        uint64_t v9 = *v8;
        uint64_t v10 = v8[1];
        if (a2[4] == *v8 && a2[5] == v10) {
          break;
        }
        uint64_t result = sub_24FAC0330();
        if (result) {
          break;
        }
        if (v7 != 1)
        {
          uint64_t v12 = v20;
          uint64_t v13 = 1;
          while (1)
          {
            uint64_t v14 = v13 + 1;
            if (__OFADD__(v13, 1)) {
              break;
            }
            if (*(v12 - 1) == v9 && *v12 == v10) {
              goto LABEL_25;
            }
            uint64_t result = sub_24FAC0330();
            if (result) {
              goto LABEL_25;
            }
            v12 += 2;
            ++v13;
            if (v14 == v7) {
              goto LABEL_7;
            }
          }
          __break(1u);
LABEL_34:
          __break(1u);
          return result;
        }
LABEL_7:
        if (v4 == v2) {
          return v21;
        }
      }
LABEL_25:
      swift_bridgeObjectRetain();
      uint64_t v16 = v21;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = sub_24FA9E00C(0, *(void *)(v21 + 16) + 1, 1);
        uint64_t v16 = v21;
      }
      unint64_t v18 = *(void *)(v16 + 16);
      unint64_t v17 = *(void *)(v16 + 24);
      if (v18 >= v17 >> 1)
      {
        uint64_t result = sub_24FA9E00C(v17 > 1, v18 + 1, 1);
        uint64_t v16 = v21;
      }
      *(void *)(v16 + 16) = v18 + 1;
      uint64_t v21 = v16;
      uint64_t v19 = v16 + 16 * v18;
      *(void *)(v19 + 32) = v9;
      *(void *)(v19 + 40) = v10;
      if (v4 == v2) {
        return v21;
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_24FA9E360(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_24FAC02F0();
  __break(1u);
  return result;
}

uint64_t sub_24FA9E454()
{
  return MEMORY[0x270FA2498](sub_24FA9E470, 0, 0);
}

uint64_t sub_24FA9E470()
{
  if (qword_269A4BA80 != -1) {
    swift_once();
  }
  *(void *)(v0 + 16) = 0xD000000000000011;
  *(void *)(v0 + 24) = 0x800000024FAC4020;
  *(_OWORD *)(v0 + 32) = xmmword_24FAC18D0;
  *(void *)(v0 + 48) = 49;
  *(void *)(v0 + 56) = 0xE100000000000000;
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_24FAA4FF4(v1, (_OWORD *)(v0 + 16));
  uint64_t v4 = v3;
  *(void *)(v0 + 64) = v2;
  *(void *)(v0 + 72) = v3;
  *(void *)(v0 + 80) = v5;
  uint64_t v7 = (void *)sub_24FAAA774(v6, v5);
  id v8 = objc_msgSend(v4, sel_stringForKey_, v7);
  *(void *)(v0 + 88) = v8;

  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24FA9E5E0;
  return sub_24FAA59D4((uint64_t)v8, 1, 1, v2);
}

uint64_t sub_24FA9E5E0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 104) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24FA9E808;
  }
  else
  {

    *(void *)(v4 + 112) = a1;
    uint64_t v5 = sub_24FA9E710;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24FA9E710()
{
  uint64_t v2 = (void *)v0[13];
  uint64_t v1 = (void *)v0[14];
  uint64_t v3 = (void *)v0[9];
  sub_24FABFFE0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24FA8FF90(0, &qword_269A4C070);
  uint64_t v4 = (void *)sub_24FAC0180();
  swift_bridgeObjectRelease();
  if (v2) {

  }
  else {
  uint64_t v5 = (uint64_t (*)(BOOL))v0[1];
  }
  return v5(v2 == 0);
}

uint64_t sub_24FA9E808()
{
  uint64_t v1 = *(void **)(v0 + 104);
  uint64_t v2 = *(void **)(v0 + 72);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3(0);
}

uint64_t sub_24FA9E898(char a1, unsigned char *a2)
{
  *(unsigned char *)(v2 + 408) = a1;
  uint64_t v4 = sub_24FABF440();
  *(void *)(v2 + 304) = v4;
  *(void *)(v2 + 312) = *(void *)(v4 - 8);
  *(void *)(v2 + 320) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  *(void *)(v2 + 328) = swift_task_alloc();
  uint64_t v5 = sub_24FABF200();
  *(void *)(v2 + 336) = v5;
  *(void *)(v2 + 344) = *(void *)(v5 - 8);
  *(void *)(v2 + 352) = swift_task_alloc();
  *(unsigned char *)(v2 + 409) = *a2;
  return MEMORY[0x270FA2498](sub_24FA9E9F0, 0, 0);
}

uint64_t sub_24FA9E9F0()
{
  if (qword_269A4BA80 != -1) {
    swift_once();
  }
  *(void *)(v0 + 224) = 0xD000000000000011;
  *(void *)(v0 + 232) = 0x800000024FAC4020;
  *(_OWORD *)(v0 + 240) = xmmword_24FAC18D0;
  *(void *)(v0 + 256) = 49;
  *(void *)(v0 + 264) = 0xE100000000000000;
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_24FAA4FF4(v1, (_OWORD *)(v0 + 224));
  uint64_t v4 = v3;
  *(void *)(v0 + 360) = v2;
  *(void *)(v0 + 368) = v3;
  *(void *)(v0 + 376) = v5;
  uint64_t v7 = (void *)sub_24FAAA774(v6, v5);
  id v8 = objc_msgSend(v4, sel_URLForKey_, v7);
  *(void *)(v0 + 384) = v8;

  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24FA9EB84;
  uint64_t v10 = *(void *)(v0 + 328);
  return sub_24FAAC7E8(v10, (uint64_t)v8, 4, 1, v2);
}

uint64_t sub_24FA9EB84()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 400) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24FA9F1C8;
  }
  else
  {
    uint64_t v4 = *(void **)(v2 + 368);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v3 = sub_24FA9ECC0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24FA9ECC0()
{
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v3 = *(void *)(v0 + 328);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_24FA89838(*(void *)(v0 + 328), &qword_269A4BBC8);
    sub_24FABF430();
    uint64_t v4 = sub_24FABF410();
    os_log_type_t v5 = sub_24FAC0160();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_24FA83000, v4, v5, "Failed to find subscription manage Apple URL", v6, 2u);
      MEMORY[0x25336CB50](v6, -1, -1);
    }
    uint64_t v8 = *(void *)(v0 + 312);
    uint64_t v7 = *(void *)(v0 + 320);
    uint64_t v9 = *(void *)(v0 + 304);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    id v10 = 0;
  }
  else
  {
    uint64_t v11 = *(unsigned __int8 *)(v0 + 409);
    (*(void (**)(void, void, void))(*(void *)(v0 + 344) + 32))(*(void *)(v0 + 352), *(void *)(v0 + 328), *(void *)(v0 + 336));
    id v12 = objc_msgSend(self, sel_ams_sharedAccountStore);
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F27C58]), sel_init);
    uint64_t v13 = (void *)sub_24FABF1C0();
    objc_msgSend(v10, sel_setURL_, v13);

    objc_msgSend(v10, sel_setAnonymousMetrics_, 1);
    uint64_t v28 = v12;
    id v14 = objc_msgSend(v12, sel_ams_activeiTunesAccount);
    objc_msgSend(v10, sel_setAccount_, v14);

    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BFA8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24FAC0EC0;
    *(void *)(v0 + 272) = 0x696F507972746E65;
    *(void *)(v0 + 280) = 0xEA0000000000746ELL;
    uint64_t v16 = MEMORY[0x263F8D310];
    sub_24FAC0220();
    uint64_t v17 = sub_24FABFFD0();
    swift_bridgeObjectRelease();
    *(void *)(inited + 96) = sub_24FA8FF90(0, &qword_269A4BFB0);
    *(void *)(inited + 72) = v17;
    sub_24FAAA630(inited);
    unint64_t v18 = (void *)sub_24FABFF50();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_setClientData_, v18);

    unint64_t v19 = 0xD000000000000015;
    unint64_t v20 = 0x800000024FAC4060;
    switch(v11)
    {
      case 1:
        break;
      case 2:
        unint64_t v20 = 0xEE00697269532E65;
        unint64_t v19 = 0x6C7070612E6D6F63;
        break;
      case 3:
        unint64_t v19 = 0xD00000000000001FLL;
        unint64_t v20 = 0x800000024FAC4040;
        break;
      default:
        unint64_t v20 = 0xEF746168632E6961;
        unint64_t v19 = 0x6E65706F2E6D6F63;
        break;
    }
    uint64_t v21 = *(void *)(v0 + 344);
    uint64_t v22 = *(void *)(v0 + 352);
    uint64_t v23 = *(void *)(v0 + 336);
    uint64_t v24 = swift_initStackObject();
    *(_OWORD *)(v24 + 16) = xmmword_24FAC0EC0;
    *(void *)(v0 + 288) = 7368801;
    *(void *)(v0 + 296) = 0xE300000000000000;
    sub_24FAC0220();
    *(void *)(v24 + 96) = v16;
    *(void *)(v24 + 72) = v19;
    *(void *)(v24 + 80) = v20;
    sub_24FAAA630(v24);
    unint64_t v25 = (void *)sub_24FABFF50();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_setMetricsOverlay_, v25);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v23);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = *(uint64_t (**)(id))(v0 + 8);
  return v26(v10);
}

uint64_t sub_24FA9F1C8()
{
  uint64_t v1 = *(void **)(v0 + 400);
  uint64_t v2 = *(void **)(v0 + 368);
  uint64_t v3 = *(void *)(v0 + 336);
  uint64_t v4 = *(void *)(v0 + 344);
  uint64_t v5 = *(void *)(v0 + 328);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, 1, 1, v3);
  sub_24FA89838(*(void *)(v0 + 328), &qword_269A4BBC8);
  sub_24FABF430();
  uint64_t v6 = sub_24FABF410();
  os_log_type_t v7 = sub_24FAC0160();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_24FA83000, v6, v7, "Failed to find subscription manage Apple URL", v8, 2u);
    MEMORY[0x25336CB50](v8, -1, -1);
  }
  uint64_t v10 = *(void *)(v0 + 312);
  uint64_t v9 = *(void *)(v0 + 320);
  uint64_t v11 = *(void *)(v0 + 304);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12(0);
}

uint64_t sub_24FA9F350()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24FA9F388()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24FA9F3C8(uint64_t a1, uint64_t a2)
{
  return sub_24FA99B38(a1, a2, *(void (**)(uint64_t))(v2 + 16));
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

uint64_t sub_24FA9F3FC()
{
  return objectdestroyTm(41);
}

uint64_t sub_24FA9F404()
{
  uint64_t v2 = *(void *)(v0 + 32);
  char v3 = *(unsigned char *)(v0 + 40);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(unsigned char *)(v4 + 41) = v3;
  *(void *)(v4 + 8) = sub_24FA95A50;
  *(void *)(v4 + 16) = v2;
  return MEMORY[0x270FA2498](sub_24FA98F60, 0, 0);
}

uint64_t sub_24FA9F4B4()
{
  return objectdestroyTm(41);
}

uint64_t sub_24FA9F4BC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  char v3 = *(unsigned char *)(v0 + 40);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(unsigned char *)(v4 + 41) = v3;
  *(void *)(v4 + 8) = sub_24FA96A38;
  *(void *)(v4 + 16) = v2;
  return MEMORY[0x270FA2498](sub_24FA98C10, 0, 0);
}

uint64_t sub_24FA9F56C(uint64_t a1)
{
  return sub_24FA99170(a1, v1, (uint64_t)&unk_270121780, (uint64_t)&unk_2701217A8, (uint64_t)&unk_269A4BFE0);
}

uint64_t sub_24FA9F5C0()
{
  return objectdestroyTm(40);
}

uint64_t sub_24FA9F5C8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24FA96A38;
  v5[5] = a1;
  v5[6] = v4;
  return MEMORY[0x270FA2498](sub_24FA98D2C, 0, 0);
}

uint64_t sub_24FA9F678(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24FA96A38;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269A4BE58 + dword_269A4BE58);
  return v6(a1, v4);
}

uint64_t sub_24FA9F730(uint64_t a1)
{
  return sub_24FA99170(a1, v1, (uint64_t)&unk_2701217D0, (uint64_t)&unk_2701217F8, (uint64_t)&unk_269A4BFF0);
}

uint64_t sub_24FA9F784()
{
  return objectdestroyTm(40);
}

uint64_t sub_24FA9F78C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24FA96A38;
  v5[5] = a1;
  v5[6] = v4;
  return MEMORY[0x270FA2498](sub_24FA993CC, 0, 0);
}

uint64_t sub_24FA9F83C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24FA9F874()
{
  return objectdestroyTm(40);
}

uint64_t sub_24FA9F87C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  char v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *char v3 = v1;
  v3[1] = sub_24FA96A38;
  v3[4] = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[5] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24FA98748;
  return static SettingsRemoteLocalization.upgradeIAPString()();
}

uint64_t sub_24FA9F960()
{
  return objectdestroyTm(40);
}

uint64_t objectdestroyTm(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24FA9F9B4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24FA96A38;
  return sub_24FA97D60(a1, v4, v5, v6);
}

void sub_24FA9FA70(uint64_t a1)
{
  sub_24FA96D38(a1, *(void *)(v1 + 16));
}

uint64_t sub_24FA9FA78()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C030);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24FA9FB20(unint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A4C030) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_24FA96F24(a1, a2, v2 + v6, v7);
}

uint64_t destroy for BagProvider(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for BagProvider(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for BagProvider(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[1];
  id v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for BagProvider(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BagProvider(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BagProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppStoreDaemonDataSource()
{
  return &type metadata for AppStoreDaemonDataSource;
}

id sub_24FA9FDF4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)sub_24FABFFD0();
  id v3 = objc_msgSend(v1, sel_BOOLForKey_, v2);

  return v3;
}

void sub_24FA9FE64()
{
  qword_269A4E238 = 0x6C2E69616E65706FLL;
  unk_269A4E240 = 0xEB000000006F676FLL;
}

uint64_t sub_24FA9FE90()
{
  return sub_24FAA0AA4();
}

void sub_24FA9FEA4()
{
}

uint64_t sub_24FA9FED0()
{
  return sub_24FAA0AA4();
}

void sub_24FA9FEE4()
{
}

uint64_t sub_24FA9FF10()
{
  return sub_24FAA0AA4();
}

void sub_24FA9FF24()
{
}

void sub_24FA9FF54()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF610();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    id v1 = (void *)sub_24FABFFD0();
    objc_msgSend(v0, sel_setBool_forKey_, v2, v1);
  }
}

uint64_t sub_24FAA0084()
{
  return sub_24FAA0AA4();
}

uint64_t sub_24FAA0098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = sub_24FAC02A0();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FAA0158, 0, 0);
}

uint64_t sub_24FAA0158()
{
  *(void *)(v0 + 48) = sub_24FAC00D0();
  *(void *)(v0 + 56) = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAA01F0, v2, v1);
}

uint64_t sub_24FAA01F0()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24FAA0258, 0, 0);
}

uint64_t sub_24FAA0258()
{
  *(void *)(v0 + 64) = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAA02E4, v2, v1);
}

uint64_t sub_24FAA02E4()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24FAA034C, 0, 0);
}

uint64_t sub_24FAA034C()
{
  uint64_t v1 = sub_24FAC03E0();
  uint64_t v3 = v2;
  sub_24FAC0290();
  id v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_269A4BF80 + dword_269A4BF80);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24FAA0428;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_24FAA0428()
{
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v3 = v2[5];
  uint64_t v4 = v2[4];
  uint64_t v5 = v2[3];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    id v6 = sub_24FAA66FC;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    id v6 = sub_24FAA05C0;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24FAA05C0()
{
  *(void *)(v0 + 80) = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAA064C, v2, v1);
}

uint64_t sub_24FAA064C()
{
  uint64_t v4 = v0;
  swift_release();
  char v3 = 9;
  sub_24FAA074C(&v3);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24FAA06D4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();

  return swift_release();
}

uint64_t sub_24FAA074C(char *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v6 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  v10[15] = v6;
  swift_retain();
  sub_24FABF610();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  uint64_t result = swift_release();
  if (v10[14] != 9)
  {
    uint64_t v8 = sub_24FAC0110();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = 0;
    void v9[3] = 0;
    v9[4] = v1;
    swift_retain();
    sub_24FA937DC((uint64_t)v5, (uint64_t)&unk_269A4C1E8, (uint64_t)v9);
    return swift_release();
  }
  return result;
}

uint64_t sub_24FAA08F4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();

  return swift_release();
}

uint64_t sub_24FAA096C()
{
  return sub_24FAA0AA4();
}

uint64_t sub_24FAA0980()
{
  return sub_24FAA0AA4();
}

uint64_t sub_24FAA0994()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24FAA0A08()
{
  return sub_24FAA0AA4();
}

uint64_t sub_24FAA0A1C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24FAA0A90()
{
  return sub_24FAA0AA4();
}

uint64_t sub_24FAA0AA4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24FAA0B10()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24FAA0B84()
{
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1C8);
  uint64_t v79 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  v78 = (char *)&v78 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1C0);
  uint64_t v99 = *(void *)(v1 - 8);
  uint64_t v100 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v98 = (char *)&v78 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C058);
  uint64_t v96 = *(void *)(v3 - 8);
  uint64_t v97 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v95 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1B8);
  uint64_t v93 = *(void *)(v94 - 8);
  MEMORY[0x270FA5388](v94);
  uint64_t v92 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1B0);
  uint64_t v90 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  uint64_t v89 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_24FABF5D0();
  uint64_t v87 = *(char ***)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  v81 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  uint64_t v8 = MEMORY[0x270FA5388](v86);
  uint64_t v85 = (uint64_t)&v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v78 - v10;
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1A8);
  uint64_t v83 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v82 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1A0);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  uint64_t v17 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    unint64_t v18 = (void *)sub_24FABFFD0();
    LOBYTE(v17) = objc_msgSend(v17, sel_BOOLForKey_, v18);
  }
  uint64_t v19 = v101 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__isEnabled;
  LOBYTE(v109[0]) = (_BYTE)v17;
  sub_24FABF5F0();
  unint64_t v20 = *(char **)(v14 + 32);
  uint64_t v21 = v14 + 32;
  uint64_t v22 = v20;
  ((void (*)(uint64_t, char *, uint64_t))v20)(v19, v16, v13);
  uint64_t v23 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v24 = (void *)sub_24FABFFD0();
    LOBYTE(v23) = objc_msgSend(v23, _swift_FORCE_LOAD___swiftUIKit___GenerativeAssistantSettings, v24);
  }
  uint64_t v25 = v101
      + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__useConfirmationPrompts;
  LOBYTE(v109[0]) = (_BYTE)v23;
  sub_24FABF5F0();
  ((void (*)(uint64_t, char *, uint64_t))v22)(v25, v16, v13);
  uint64_t v26 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    os_log_type_t v27 = (void *)sub_24FABFFD0();
    LOBYTE(v26) = objc_msgSend(v26, _swift_FORCE_LOAD___swiftUIKit___GenerativeAssistantSettings, v27);
  }
  uint64_t v28 = v101;
  uint64_t v29 = v101 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__setupPrompt;
  LOBYTE(v109[0]) = (_BYTE)v26;
  sub_24FABF5F0();
  uint64_t v30 = v13;
  ((void (*)(uint64_t, char *, uint64_t))v22)(v29, v16, v13);
  uint64_t v31 = v28 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__controlToHighlight;
  LOBYTE(v109[0]) = 9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C100);
  uint64_t v32 = v82;
  sub_24FABF5F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v83 + 32))(v31, v32, v84);
  uint64_t v33 = v28 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__credentials;
  uint64_t v34 = v81;
  sub_24FABF580();
  sub_24FABF510();
  ((void (*)(char *, uint64_t))v87[1])(v34, v88);
  sub_24FA897D4((uint64_t)v11, v85, &qword_269A4BBC0);
  uint64_t v35 = v89;
  sub_24FABF5F0();
  sub_24FA89838((uint64_t)v11, &qword_269A4BBC0);
  (*(void (**)(uint64_t, char *, uint64_t))(v90 + 32))(v33, v35, v91);
  uint64_t v36 = v28
      + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__showingSignInFailureAlert;
  LOBYTE(v109[0]) = 0;
  sub_24FABF5F0();
  ((void (*)(uint64_t, char *, uint64_t))v22)(v36, v16, v30);
  uint64_t v37 = v28 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__showingSignOutAlert;
  LOBYTE(v109[0]) = 0;
  sub_24FABF5F0();
  uint64_t v91 = v30;
  uint64_t v90 = v21;
  uint64_t v89 = v22;
  ((void (*)(uint64_t, char *, uint64_t))v22)(v37, v16, v30);
  if (qword_269A4BA80 != -1) {
    swift_once();
  }
  uint64_t v88 = v28 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__subscriptionInfo;
  *(void *)&v109[0] = 0xD000000000000011;
  *((void *)&v109[0] + 1) = 0x800000024FAC4020;
  v109[1] = xmmword_24FAC18D0;
  uint64_t v110 = 49;
  unint64_t v111 = 0xE100000000000000;
  uint64_t v38 = swift_bridgeObjectRetain();
  uint64_t v39 = sub_24FAA4FF4(v38, v109);
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  v105 = &type metadata for AppStoreDaemonDataSource;
  v106 = (uint64_t (*)())&off_270121980;
  uint64_t v46 = (void *)swift_allocObject();
  aBlock = v46;
  v46[2] = v39;
  v46[3] = v41;
  v46[4] = v43;
  v46[5] = v45;
  type metadata accessor for SubscriptionInfo();
  uint64_t v47 = swift_allocObject();
  uint64_t v48 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&aBlock, (uint64_t)&type metadata for AppStoreDaemonDataSource);
  uint64_t v87 = &v78;
  MEMORY[0x270FA5388](v48);
  uint64_t v50 = (uint64_t *)((char *)&v78 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v51 + 16))(v50);
  uint64_t v53 = *v50;
  uint64_t v52 = v50[1];
  uint64_t v54 = v50[2];
  uint64_t v55 = v50[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v56 = v41;
  uint64_t v57 = sub_24FAA5138(2, v53, v52, v54, v55, v47);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&aBlock);
  swift_bridgeObjectRelease();

  uint64_t v58 = v101;
  swift_bridgeObjectRelease();
  aBlock = (void *)v57;
  uint64_t v59 = v92;
  sub_24FABF5F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v93 + 32))(v88, v59, v94);
  uint64_t v60 = v58
      + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__showManageSubscription;
  LOBYTE(aBlock) = 0;
  sub_24FABF5F0();
  uint64_t v61 = v91;
  uint64_t v62 = (void (*)(uint64_t, char *, uint64_t))v89;
  ((void (*)(uint64_t, char *, uint64_t))v89)(v60, v16, v91);
  uint64_t v63 = v58 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__adamID;
  aBlock = 0;
  uint64_t v103 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BF48);
  uint64_t v64 = v95;
  sub_24FABF5F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v96 + 32))(v63, v64, v97);
  uint64_t v65 = v58 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__showRateLimitStatus;
  LOBYTE(aBlock) = 0;
  sub_24FABF5F0();
  v62(v65, v16, v61);
  uint64_t v66 = v58 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__isRateLimited;
  LOBYTE(aBlock) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C120);
  v67 = v98;
  sub_24FABF5F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v99 + 32))(v66, v67, v100);
  uint64_t v68 = OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel_subscription;
  *(void *)(v58 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel_subscription) = 0;
  swift_beginAccess();
  char v108 = 0;
  sub_24FABF5F0();
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_weakAssign();
  swift_release();
  sub_24FAA3124();
  uint64_t v69 = qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    swift_getKeyPath();
    v70 = v78;
    sub_24FABF1B0();
    swift_release();
    swift_allocObject();
    swift_weakInit();
    sub_24FAA64F0();
    uint64_t v71 = v80;
    uint64_t v69 = sub_24FABF630();
    swift_release();
    (*(void (**)(char *, uint64_t))(v79 + 8))(v70, v71);
  }
  *(void *)(v58 + v68) = v69;
  swift_release();
  id v72 = objc_msgSend(self, sel_defaultCenter);
  uint64_t v73 = *MEMORY[0x263F536E0];
  id v74 = objc_msgSend(self, sel_mainQueue);
  v106 = sub_24FAA6468;
  uint64_t v107 = v58;
  aBlock = (void *)MEMORY[0x263EF8330];
  uint64_t v103 = 1107296256;
  v104 = sub_24FAA1D80;
  v105 = (ValueMetadata *)&block_descriptor_182;
  uint64_t v75 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v76 = objc_msgSend(v72, sel_addObserverForName_object_queue_usingBlock_, v73, 0, v74, v75);
  _Block_release(v75);
  swift_unknownObjectRelease();

  return v58;
}

uint64_t sub_24FAA19F4(unsigned __int8 *a1)
{
  int v1 = *a1;
  swift_beginAccess();
  if (!swift_weakLoadStrong()
    || (swift_getKeyPath(),
        swift_getKeyPath(),
        sub_24FABF600(),
        swift_release(),
        swift_release(),
        uint64_t result = swift_release(),
        v3 != v1))
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      sub_24FA9FEA4();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_24FAA1AE0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  unsigned __int8 v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v17 - v4;
  uint64_t v6 = sub_24FABF5D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24FABF3E0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FABF3D0();
  char v14 = sub_24FABF3C0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (v14)
  {
    sub_24FABF580();
    sub_24FABF510();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    uint64_t v15 = sub_24FABF500();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v5, 1, 1, v15);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FA897D4((uint64_t)v5, (uint64_t)v3, &qword_269A4BBC0);
  swift_retain();
  sub_24FABF610();
  sub_24FAA3124();
  return sub_24FA89838((uint64_t)v5, &qword_269A4BBC0);
}

uint64_t sub_24FAA1D80(uint64_t a1)
{
  uint64_t v2 = sub_24FABF120();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_24FABF110();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24FAA1E74()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24FAC0110();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_24FA89838((uint64_t)v4, &qword_269A4C2D0);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_24FAC0100();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_24FAC00A0();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_269A4C158;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24FAA20B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 128) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  *(void *)(v4 + 136) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FAA214C, 0, 0);
}

uint64_t sub_24FAA214C()
{
  if (qword_269A4BA80 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 136);
  *(void *)(v0 + 16) = 0xD000000000000011;
  *(void *)(v0 + 24) = 0x800000024FAC4020;
  *(_OWORD *)(v0 + 32) = xmmword_24FAC18D0;
  *(void *)(v0 + 48) = 49;
  *(void *)(v0 + 56) = 0xE100000000000000;
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_24FAA4FF4(v2, (_OWORD *)(v0 + 16));
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  *(void *)(v0 + 144) = v3;
  *(void *)(v0 + 152) = v4;
  *(void *)(v0 + 160) = v8;
  sub_24FAC00E0();
  uint64_t v10 = sub_24FAC0110();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v1, 0, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v3;
  v11[5] = v5;
  v11[6] = v7;
  v11[7] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v12 = v5;
  sub_24FAA41B8(v1, (uint64_t)&unk_269A4C160, (uint64_t)v11);
  swift_release();
  sub_24FA89838(v1, &qword_269A4C2D0);
  *(void *)(v0 + 64) = 0xD000000000000011;
  *(void *)(v0 + 72) = 0x800000024FAC4020;
  *(_OWORD *)(v0 + 80) = xmmword_24FAC18D0;
  *(void *)(v0 + 96) = 49;
  *(void *)(v0 + 104) = 0xE100000000000000;
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_24FAA4FF4(v13, (_OWORD *)(v0 + 64));
  uint64_t v16 = v15;
  *(void *)(v0 + 168) = v14;
  *(void *)(v0 + 176) = v15;
  *(void *)(v0 + 184) = v17;
  uint64_t v19 = (void *)sub_24FAAA774(v18, v17);
  id v20 = objc_msgSend(v16, sel_stringForKey_, v19);
  *(void *)(v0 + 192) = v20;

  uint64_t v21 = swift_task_alloc();
  *(void *)(v0 + 200) = v21;
  *(void *)uint64_t v21 = v0;
  *(void *)(v21 + 8) = sub_24FAA23F0;
  *(_WORD *)(v21 + 96) = 256;
  *(void *)(v21 + 64) = v20;
  *(void *)(v21 + 72) = v14;
  return MEMORY[0x270FA2498](sub_24FAA59FC, 0, 0);
}

uint64_t sub_24FAA23F0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 208) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24FAA25FC;
  }
  else
  {

    *(void *)(v4 + 216) = a1;
    uint64_t v5 = sub_24FAA2520;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24FAA2520()
{
  uint64_t v1 = (void *)v0[27];
  uint64_t v2 = (void *)v0[22];
  uint64_t v3 = sub_24FABFFE0();
  uint64_t v5 = v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0[28] = v3;
  v0[29] = v5;
  sub_24FAC00D0();
  v0[30] = sub_24FAC00C0();
  uint64_t v7 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAA26C8, v7, v6);
}

uint64_t sub_24FAA25FC()
{
  uint64_t v1 = *(void **)(v0 + 208);
  uint64_t v2 = *(void **)(v0 + 192);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_24FAC00D0();
  *(void *)(v0 + 224) = 0;
  *(void *)(v0 + 232) = 0;
  *(void *)(v0 + 240) = sub_24FAC00C0();
  uint64_t v4 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAA26C8, v4, v3);
}

uint64_t sub_24FAA26C8()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[28];
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v0[14] = v2;
  v0[15] = v1;
  swift_retain();
  sub_24FABF610();
  return MEMORY[0x270FA2498](sub_24FAA2790, 0, 0);
}

uint64_t sub_24FAA2790()
{
  uint64_t v1 = *(void **)(v0 + 152);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24FAA2810()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = &v7[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  uint64_t result = swift_release();
  if (v7[15] == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v7[14] = 2;
    swift_retain();
    sub_24FABF610();
    uint64_t v5 = sub_24FAC0110();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = 0;
    v6[3] = 0;
    v6[4] = v0;
    swift_retain();
    sub_24FA937DC((uint64_t)v3, (uint64_t)&unk_269A4C140, (uint64_t)v6);
    return swift_release();
  }
  return result;
}

uint64_t sub_24FAA29A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = sub_24FABF5D0();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C148);
  v4[6] = swift_task_alloc();
  uint64_t v6 = sub_24FABF540();
  v4[7] = v6;
  v4[8] = *(void *)(v6 - 8);
  v4[9] = swift_task_alloc();
  uint64_t v7 = sub_24FABF3A0();
  v4[10] = v7;
  v4[11] = *(void *)(v7 - 8);
  v4[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FAA2B4C, 0, 0);
}

uint64_t sub_24FAA2B4C()
{
  char v1 = _s27GenerativeAssistantSettings0abC12UserDefaultsC20forcedRateLimitStateSbSgyFZ_0();
  if (v1 == 2)
  {
    uint64_t v3 = *(void *)(v0 + 88);
    uint64_t v2 = *(void *)(v0 + 96);
    uint64_t v4 = *(void *)(v0 + 80);
    sub_24FABF390();
    char v5 = sub_24FABF380();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    if (v5)
    {
      sub_24FABF580();
      uint64_t v6 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v6;
      *uint64_t v6 = v0;
      v6[1] = sub_24FAA2CB8;
      uint64_t v7 = *(void *)(v0 + 48);
      return MEMORY[0x270F0C1E0](v7);
    }
    char v8 = 0;
  }
  else
  {
    char v8 = v1 & 1;
  }
  *(unsigned char *)(v0 + 121) = v8;
  sub_24FAC00D0();
  *(void *)(v0 + 112) = sub_24FAC00C0();
  uint64_t v10 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAA2F60, v10, v9);
}

uint64_t sub_24FAA2CB8()
{
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v3 = v2[5];
  uint64_t v4 = v2[4];
  uint64_t v5 = v2[3];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_24FAA3058;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_24FAA2E50;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_24FAA2E50()
{
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v4, v3);
  LOBYTE(v4) = sub_24FABF530();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  *(unsigned char *)(v0 + 121) = v4 & 1;
  sub_24FAC00D0();
  *(void *)(v0 + 112) = sub_24FAC00C0();
  uint64_t v6 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAA2F60, v6, v5);
}

uint64_t sub_24FAA2F60()
{
  char v1 = *(unsigned char *)(v0 + 121);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 120) = v1;
  swift_retain();
  sub_24FABF610();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24FAA3058()
{
  uint64_t v1 = *(void *)(v0 + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 64) + 56))(v1, 1, 1, *(void *)(v0 + 56));
  sub_24FA89838(v1, &qword_269A4C148);
  *(unsigned char *)(v0 + 121) = 0;
  sub_24FAC00D0();
  *(void *)(v0 + 112) = sub_24FAC00C0();
  uint64_t v3 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAA2F60, v3, v2);
}

uint64_t sub_24FAA3124()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v36 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24FABF4A0();
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v34 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v32 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = sub_24FABF4D0();
  uint64_t v30 = *(void *)(v9 - 8);
  uint64_t v31 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24FABF500();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  uint64_t v19 = v37;
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v35 = v1;
  sub_24FABF600();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v18, 1, v12))
  {
    sub_24FA89838((uint64_t)v18, &qword_269A4BBC0);
    char v20 = 2;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v15, v18, v12);
    sub_24FA89838((uint64_t)v18, &qword_269A4BBC0);
    sub_24FABF4E0();
    sub_24FABF4B0();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v31);
    uint64_t v21 = v32;
    uint64_t v22 = v33;
    uint64_t v23 = v34;
    (*(void (**)(char *, void, uint64_t))(v33 + 104))(v32, *MEMORY[0x263F24C90], v34);
    char v24 = sub_24FABF490();
    uint64_t v25 = *(void (**)(char *, uint64_t))(v22 + 8);
    v25(v21, v23);
    v25(v8, v23);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    char v20 = v24 & 1;
  }
  *(unsigned char *)(v19 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_accountReportsPaidPlan) = v20;
  swift_release();
  uint64_t v26 = sub_24FAC0110();
  uint64_t v27 = (uint64_t)v36;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v36, 1, 1, v26);
  uint64_t v28 = (void *)swift_allocObject();
  v28[2] = 0;
  v28[3] = 0;
  v28[4] = v35;
  swift_retain();
  sub_24FA937DC(v27, (uint64_t)&unk_269A4C130, (uint64_t)v28);
  return swift_release();
}

uint64_t sub_24FAA35E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_24FAA3604, 0, 0);
}

uint64_t sub_24FAA3604()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  v0[4] = v0[2];
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  void *v1 = v0;
  v1[1] = sub_24FAA36EC;
  return sub_24FA97684();
}

uint64_t sub_24FAA36EC(char a1)
{
  *(unsigned char *)(*(void *)v1 + 56) = a1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24FAA380C, 0, 0);
}

uint64_t sub_24FAA380C()
{
  sub_24FAC00D0();
  *(void *)(v0 + 48) = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAA38A0, v2, v1);
}

uint64_t sub_24FAA38A0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  char v2 = *(unsigned char *)(v0 + 56);
  swift_release();
  sub_24FAA393C(v1, v2);
  return MEMORY[0x270FA2498](sub_24FAA3928, 0, 0);
}

uint64_t sub_24FAA3928()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24FAA393C(uint64_t a1, char a2)
{
  uint64_t v3 = sub_24FABF3A0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FABF390();
  char v7 = sub_24FABF380();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_getKeyPath();
  swift_getKeyPath();
  if (v7)
  {
    BOOL v11 = (a2 & 0xFE) != 2;
    swift_retain();
    sub_24FABF610();
    swift_getKeyPath();
    swift_getKeyPath();
    BOOL v10 = a2 == 2;
    swift_retain();
    sub_24FABF610();
    return sub_24FAA2810();
  }
  else
  {
    char v13 = 0;
    swift_retain();
    sub_24FABF610();
    swift_getKeyPath();
    swift_getKeyPath();
    char v12 = 0;
    swift_retain();
    return sub_24FABF610();
  }
}

uint64_t sub_24FAA3B4C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__isEnabled;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1A0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__useConfirmationPrompts, v2);
  v3(v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__setupPrompt, v2);
  v3(v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__showOnboarding, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__controlToHighlight;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__credentials;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v3(v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__showingSignInFailureAlert, v2);
  v3(v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__showingSignOutAlert, v2);
  uint64_t v8 = v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__subscriptionInfo;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v3(v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__showManageSubscription, v2);
  uint64_t v10 = v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__adamID;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C058);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v3(v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__showRateLimitStatus, v2);
  uint64_t v12 = v0 + OBJC_IVAR____TtC27GenerativeAssistantSettings36GenerativeAssistantSettingsViewModel__isRateLimited;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  swift_release();
  return v0;
}

uint64_t sub_24FAA3E04()
{
  sub_24FAA3B4C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24FAA3E5C()
{
  return type metadata accessor for GenerativeAssistantSettingsViewModel();
}

uint64_t type metadata accessor for GenerativeAssistantSettingsViewModel()
{
  uint64_t result = qword_269A4C0E8;
  if (!qword_269A4C0E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24FAA3EB0()
{
  sub_24FAA40C8();
  if (v0 <= 0x3F)
  {
    sub_24FA9D250(319, &qword_269A4C0F8, &qword_269A4C100);
    if (v1 <= 0x3F)
    {
      sub_24FA9D250(319, &qword_269A4C108, &qword_269A4BBC0);
      if (v2 <= 0x3F)
      {
        sub_24FAA4120();
        if (v3 <= 0x3F)
        {
          sub_24FA9D250(319, &qword_269A4BF40, &qword_269A4BF48);
          if (v4 <= 0x3F)
          {
            sub_24FA9D250(319, &qword_269A4C118, &qword_269A4C120);
            if (v5 <= 0x3F) {
              swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

void sub_24FAA40C8()
{
  if (!qword_269A4C2B0)
  {
    unint64_t v0 = sub_24FABF620();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269A4C2B0);
    }
  }
}

void sub_24FAA4120()
{
  if (!qword_269A4C110)
  {
    type metadata accessor for SubscriptionInfo();
    unint64_t v0 = sub_24FABF620();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269A4C110);
    }
  }
}

uint64_t sub_24FAA4178@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  uint64_t result = sub_24FABF5E0();
  *a1 = result;
  return result;
}

uint64_t sub_24FAA41B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FA897D4(a1, (uint64_t)v7, &qword_269A4C2D0);
  uint64_t v8 = sub_24FAC0110();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_24FA89838((uint64_t)v7, &qword_269A4C2D0);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  else
  {
    sub_24FAC0100();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v10 = sub_24FAC00A0();
  uint64_t v12 = v11;
  swift_unknownObjectRelease();
  if (v12 | v10)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v10;
    v14[3] = v12;
  }
  return swift_task_create();
}

void sub_24FAA4388(uint64_t a1, void *a2)
{
}

void sub_24FAA43B8(uint64_t a1, void *a2)
{
}

void sub_24FAA43E8(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v14 + v13, (char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  aBlock[4] = a5;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24FAA45CC;
  aBlock[3] = a6;
  uint64_t v15 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_valueWithCompletion_, v15);
  _Block_release(v15);
}

uint64_t sub_24FAA4584(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  id v6 = a1;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  return sub_24FAC00B0();
}

uint64_t sub_24FAA45CC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v8 = a4;
  v7(a2, a3, a4);
  swift_release();

  return swift_unknownObjectRelease();
}

double sub_24FAA4658@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_24FAA46D8()
{
  return sub_24FABF610();
}

uint64_t sub_24FAA475C@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

uint64_t sub_24FAA4770()
{
  return sub_24FAA4D58();
}

uint64_t sub_24FAA4784@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

void sub_24FAA4798()
{
}

uint64_t sub_24FAA47C0@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

void sub_24FAA47D4()
{
}

uint64_t sub_24FAA47FC@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

void sub_24FAA4810()
{
}

uint64_t sub_24FAA4838@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

uint64_t sub_24FAA484C()
{
  return sub_24FAA4D58();
}

uint64_t sub_24FAA4860@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24FAA48E0(char *a1)
{
  char v2 = *a1;
  return sub_24FAA074C(&v2);
}

uint64_t sub_24FAA4918()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();

  return swift_release();
}

uint64_t sub_24FAA4994(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_24FA897D4(a1, (uint64_t)&v9 - v6, &qword_269A4BBC0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FA897D4((uint64_t)v7, (uint64_t)v5, &qword_269A4BBC0);
  swift_retain();
  sub_24FABF610();
  sub_24FAA3124();
  return sub_24FA89838((uint64_t)v7, &qword_269A4BBC0);
}

uint64_t sub_24FAA4AA8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24FAA4B2C()
{
  return sub_24FABF610();
}

uint64_t sub_24FAA4BB8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24FA96A38;
  v3[3] = v2;
  return MEMORY[0x270FA2498](sub_24FAA3604, 0, 0);
}

uint64_t sub_24FAA4C64@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

uint64_t sub_24FAA4C78()
{
  return sub_24FAA4D58();
}

uint64_t sub_24FAA4C8C@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

uint64_t sub_24FAA4CA0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24FAA4D1C@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

uint64_t sub_24FAA4D44()
{
  return sub_24FAA4D58();
}

uint64_t sub_24FAA4D58()
{
  return sub_24FABF610();
}

uint64_t sub_24FAA4DC8()
{
  return sub_24FAA4D58();
}

uint64_t sub_24FAA4DF0@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

uint64_t sub_24FAA4E18()
{
  return sub_24FAA4D58();
}

uint64_t sub_24FAA4E40@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24FAA4EC4()
{
  return sub_24FABF610();
}

uint64_t sub_24FAA4F40(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24FA96A38;
  return sub_24FAA29A4(a1, v4, v5, v6);
}

uint64_t sub_24FAA4FF4(uint64_t a1, _OWORD *a2)
{
  uint64_t v10 = &type metadata for BagProvider.RuntimeBagConfiguration;
  uint64_t v11 = &off_270122020;
  uint64_t v4 = (_OWORD *)swift_allocObject();
  v9[0] = v4;
  long long v5 = a2[1];
  v4[1] = *a2;
  v4[2] = v5;
  v4[3] = a2[2];
  __swift_project_boxed_opaque_existential_1(v9, (uint64_t)&type metadata for BagProvider.RuntimeBagConfiguration);
  __swift_project_boxed_opaque_existential_1(v9, (uint64_t)v10);
  __swift_project_boxed_opaque_existential_1(v9, (uint64_t)v10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_24FABFFD0();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_24FABFFD0();
  swift_bridgeObjectRelease();
  objc_msgSend(self, sel_bagForProfile_profileVersion_, v6, v7);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return a1;
}

uint64_t sub_24FAA5138(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v38 = a3;
  uint64_t v39 = a4;
  uint64_t v37 = a2;
  int v44 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v45 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C058);
  uint64_t v42 = *(void *)(v10 - 8);
  uint64_t v43 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v41 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C050);
  uint64_t v12 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  char v20 = (char *)&v37 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C048);
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  char v24 = (char *)&v37 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48[3] = &type metadata for AppStoreDaemonDataSource;
  v48[4] = &off_270121980;
  uint64_t v25 = (void *)swift_allocObject();
  v48[0] = v25;
  uint64_t v26 = v38;
  v25[2] = v37;
  v25[3] = v26;
  v25[4] = v39;
  v25[5] = a5;
  uint64_t v27 = a6 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo__subscriptionSource;
  LOBYTE(v46) = 5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BF30);
  sub_24FABF5F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v27, v24, v21);
  uint64_t v28 = a6 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo__storeURL;
  uint64_t v29 = sub_24FABF200();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v20, 1, 1, v29);
  sub_24FA897D4((uint64_t)v20, (uint64_t)v18, &qword_269A4BBC8);
  sub_24FABF5F0();
  sub_24FA89838((uint64_t)v20, &qword_269A4BBC8);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v28, v14, v40);
  uint64_t v30 = a6 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo__upgradeCTAText;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BF48);
  uint64_t v31 = v41;
  sub_24FABF5F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v30, v31, v43);
  *(unsigned char *)(a6 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_continuouslyPoll) = 0;
  *(unsigned char *)(a6 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_allowPlanUpdatePolling) = 1;
  uint64_t v32 = OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_accountReportsPaidPlan;
  *(unsigned char *)(a6 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_accountReportsPaidPlan) = 2;
  swift_weakInit();
  *(unsigned char *)(a6 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_isPollingForBillingChanges) = 0;
  *(unsigned char *)(a6 + v32) = v44;
  *(unsigned char *)(a6 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_isAppInstalled) = 0;
  sub_24FA8AEF0((uint64_t)v48, a6 + OBJC_IVAR____TtC27GenerativeAssistantSettings16SubscriptionInfo_appStoreDataSource);
  uint64_t v33 = sub_24FAC0110();
  uint64_t v34 = (uint64_t)v45;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v45, 1, 1, v33);
  uint64_t v35 = (void *)swift_allocObject();
  v35[2] = 0;
  v35[3] = 0;
  v35[4] = a6;
  swift_retain();
  sub_24FA937DC(v34, (uint64_t)&unk_269A4C1D8, (uint64_t)v35);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v48);
  return a6;
}

uint64_t sub_24FAA5654(uint64_t a1, char a2, char a3, uint64_t a4)
{
  *(unsigned char *)(v4 + 97) = a3;
  *(unsigned char *)(v4 + 96) = a2;
  *(void *)(v4 + 64) = a1;
  *(void *)(v4 + 72) = a4;
  return MEMORY[0x270FA2498](sub_24FAA567C, 0, 0);
}

uint64_t sub_24FAA567C()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = swift_task_alloc();
  v0[10] = v2;
  *(void *)(v2 + 16) = v1;
  char v3 = (void *)swift_task_alloc();
  v0[11] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C198);
  *char v3 = v0;
  v3[1] = sub_24FAA5780;
  return MEMORY[0x270FA2318](v0 + 7, 0, 0, 0xD00000000000003BLL, 0x800000024FAC42B0, sub_24FAA616C, v2, v4);
}

uint64_t sub_24FAA5780()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24FAA5898, 0, 0);
}

uint64_t sub_24FAA5898()
{
  if (*(void *)(v0 + 56))
  {
LABEL_2:
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  if (*(unsigned char *)(v0 + 97))
  {
    if (*(void *)(*(void *)(v0 + 72) + 16))
    {
      unint64_t v3 = sub_24FA95620(*(unsigned char *)(v0 + 96));
      if (v4)
      {
        sub_24FA969DC(*(void *)(*(void *)(v0 + 72) + 56) + 40 * v3, v0 + 16);
        long long v5 = (void *)sub_24FAC01F0();
        sub_24FA95798(v0 + 16);
        self;
        if (swift_dynamicCastObjCClass()) {
          goto LABEL_2;
        }
      }
    }
  }
  sub_24FAA5FB8();
  swift_allocError();
  *uint64_t v6 = 0;
  swift_willThrow();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24FAA59D4(uint64_t a1, char a2, char a3, uint64_t a4)
{
  *(unsigned char *)(v4 + 97) = a3;
  *(unsigned char *)(v4 + 96) = a2;
  *(void *)(v4 + 64) = a1;
  *(void *)(v4 + 72) = a4;
  return MEMORY[0x270FA2498](sub_24FAA59FC, 0, 0);
}

uint64_t sub_24FAA59FC()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = swift_task_alloc();
  v0[10] = v2;
  *(void *)(v2 + 16) = v1;
  unint64_t v3 = (void *)swift_task_alloc();
  v0[11] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C170);
  *unint64_t v3 = v0;
  v3[1] = sub_24FAA5B00;
  return MEMORY[0x270FA2318](v0 + 7, 0, 0, 0xD00000000000003BLL, 0x800000024FAC42B0, sub_24FAA5F70, v2, v4);
}

uint64_t sub_24FAA5B00()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24FAA5C18, 0, 0);
}

uint64_t sub_24FAA5C18()
{
  if (*(void *)(v0 + 56))
  {
LABEL_2:
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  if (*(unsigned char *)(v0 + 97))
  {
    if (*(void *)(*(void *)(v0 + 72) + 16))
    {
      unint64_t v3 = sub_24FA95620(*(unsigned char *)(v0 + 96));
      if (v4)
      {
        sub_24FA969DC(*(void *)(*(void *)(v0 + 72) + 56) + 40 * v3, v0 + 16);
        long long v5 = (void *)sub_24FAC01F0();
        sub_24FA95798(v0 + 16);
        self;
        if (swift_dynamicCastObjCClass()) {
          goto LABEL_2;
        }
      }
    }
  }
  sub_24FAA5FB8();
  swift_allocError();
  *uint64_t v6 = 0;
  swift_willThrow();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_24FAA5D58(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24FA95A50;
  return sub_24FAA20B8(a1, v4, v5, v6);
}

uint64_t sub_24FAA5E0C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24FAA5E44()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24FAA5E94(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24FA95A50;
  return sub_24FAAAB20(a1, v4, v5, v6, v7, v9, v8);
}

void sub_24FAA5F70(uint64_t a1)
{
  sub_24FAA43E8(a1, *(void **)(v1 + 16), &qword_269A4C180, (uint64_t)&unk_270121A70, (uint64_t)sub_24FAA6018, (uint64_t)&block_descriptor_0);
}

unint64_t sub_24FAA5FB8()
{
  unint64_t result = qword_269A4C178;
  if (!qword_269A4C178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C178);
  }
  return result;
}

uint64_t sub_24FAA600C()
{
  return objectdestroy_122Tm(&qword_269A4C180);
}

uint64_t sub_24FAA6018(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24FAA60E0(a1, a2, a3, &qword_269A4C180);
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

uint64_t sub_24FAA603C()
{
  return objectdestroy_122Tm(&qword_269A4C188);
}

uint64_t objectdestroy_122Tm(uint64_t *a1)
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

uint64_t sub_24FAA60D4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_24FAA60E0(a1, a2, a3, &qword_269A4C188);
}

uint64_t sub_24FAA60E0(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a4) - 8);
  return sub_24FAA4584(a1, a2, a3, v4 + ((*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a4);
}

void sub_24FAA616C(uint64_t a1)
{
  sub_24FAA43E8(a1, *(void **)(v1 + 16), &qword_269A4C188, (uint64_t)&unk_270121AC0, (uint64_t)sub_24FAA60D4, (uint64_t)&block_descriptor_129);
}

uint64_t sub_24FAA61B4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24FAA61FC@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

uint64_t sub_24FAA6224()
{
  return sub_24FAA4D58();
}

uint64_t sub_24FAA624C@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

uint64_t sub_24FAA6274()
{
  return sub_24FAA4D58();
}

uint64_t sub_24FAA62A0(char *a1)
{
  char v2 = *a1;
  return sub_24FAA074C(&v2);
}

uint64_t sub_24FAA62E0@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

void sub_24FAA6308()
{
}

uint64_t sub_24FAA6330@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

void sub_24FAA6358()
{
}

uint64_t sub_24FAA6380@<X0>(unsigned char *a1@<X8>)
{
  return sub_24FAA4CA0(a1);
}

void sub_24FAA63A8()
{
}

uint64_t sub_24FAA63D0()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
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

uint64_t sub_24FAA6468()
{
  return sub_24FAA1AE0();
}

char *keypath_get_selector_isEnabled()
{
  return sel_isEnabled;
}

id sub_24FAA647C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isEnabled);
  *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_24FAA64B0()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24FAA64E8(unsigned __int8 *a1)
{
  return sub_24FAA19F4(a1);
}

unint64_t sub_24FAA64F0()
{
  unint64_t result = qword_269A4C1D0;
  if (!qword_269A4C1D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C1C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C1D0);
  }
  return result;
}

uint64_t sub_24FAA6550(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24FA96A38;
  return sub_24FA9733C(a1, v4, v5, v6);
}

uint64_t objectdestroyTm_0()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24FAA6648(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24FA96A38;
  return sub_24FAA0098(a1, v4, v5, v6);
}

uint64_t static GenerativeAssistantSettingsUserDefaults.allUserDefaults()()
{
  uint64_t v0 = sub_24FABF290();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = 0;
  unint64_t v21 = 0xE000000000000000;
  sub_24FAC0230();
  sub_24FAC0010();
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v5 = (void *)sub_24FABFFD0();
    objc_msgSend(v4, sel_BOOLForKey_, v5);
  }
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  sub_24FAC0010();
  uint64_t v6 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v7 = (void *)sub_24FABFFD0();
    objc_msgSend(v6, sel_BOOLForKey_, v7);
  }
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  sub_24FAC0010();
  uint64_t v8 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v9 = (void *)sub_24FABFFD0();
    objc_msgSend(v8, sel_BOOLForKey_, v9);
  }
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  sub_24FAC0010();
  id v10 = (id)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v11 = (void *)sub_24FABFFD0();
    id v10 = objc_msgSend(v10, sel_integerForKey_, v11);
  }
  uint64_t v19 = (uint64_t)v10;
  sub_24FAC0310();
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  sub_24FAC0010();
  static GenerativeAssistantSettingsUserDefaults.declineComposeViaSiriExpiration()((uint64_t)v3);
  sub_24FAA7268();
  sub_24FAC0310();
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v12(v3, v0);
  sub_24FAC0010();
  id v13 = (id)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v14 = (void *)sub_24FABFFD0();
    id v13 = objc_msgSend(v13, sel_integerForKey_, v14);
  }
  uint64_t v19 = (uint64_t)v13;
  sub_24FAC0310();
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  sub_24FAC0010();
  static GenerativeAssistantSettingsUserDefaults.declineMediaQAExpiration()((uint64_t)v3);
  sub_24FAC0310();
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  v12(v3, v0);
  sub_24FAC0010();
  id v15 = (id)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v16 = (void *)sub_24FABFFD0();
    id v15 = objc_msgSend(v15, (SEL)0x26533FE18, v16);
  }
  uint64_t v19 = (uint64_t)v15;
  sub_24FAC0310();
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  sub_24FAC0010();
  static GenerativeAssistantSettingsUserDefaults.declineKnowledgeFallbackExpiration()((uint64_t)v3);
  sub_24FAC0310();
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  v12(v3, v0);
  sub_24FAC0010();
  _s27GenerativeAssistantSettings0abC12UserDefaultsC23taperConfirmationDialogSbyFZ_0();
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  sub_24FAC0010();
  uint64_t v19 = _s27GenerativeAssistantSettings0abC12UserDefaultsC17confirmationCountSiyFZ_0();
  sub_24FAC0310();
  sub_24FAC0010();
  swift_bridgeObjectRelease();
  return v20;
}

id static GenerativeAssistantSettingsUserDefaults.isEnabled()()
{
  return sub_24FAA839C();
}

id static GenerativeAssistantSettingsUserDefaults.useConfirmationPrompts()()
{
  return sub_24FAA839C();
}

id static GenerativeAssistantSettingsUserDefaults.setupPrompt()()
{
  return sub_24FAA839C();
}

uint64_t static GenerativeAssistantSettingsUserDefaults.declineMediaQAExpiration()@<X0>(uint64_t a1@<X8>)
{
  return sub_24FAA6DD4(a1);
}

uint64_t static GenerativeAssistantSettingsUserDefaults.declineComposeViaSiriExpiration()@<X0>(uint64_t a1@<X8>)
{
  return sub_24FAA6DD4(a1);
}

uint64_t sub_24FAA6DD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1F8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  uint64_t v5 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_11:
    sub_24FA89838((uint64_t)&v14, &qword_269A4BE18);
    uint64_t v12 = sub_24FABF290();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
    goto LABEL_12;
  }
  uint64_t v6 = (void *)sub_24FABFFD0();
  id v7 = objc_msgSend(v5, sel_objectForKey_, v6);

  if (v7)
  {
    sub_24FAC01C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  sub_24FAA8804((uint64_t)v13, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_11;
  }
  uint64_t v8 = sub_24FABF290();
  int v9 = swift_dynamicCast();
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v4, v9 ^ 1u, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v4, 1, v8) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v4, v8);
  }
LABEL_12:
  sub_24FABF210();
  return sub_24FA89838((uint64_t)v4, &qword_269A4C1F8);
}

uint64_t static GenerativeAssistantSettingsUserDefaults.declineKnowledgeFallbackExpiration()@<X0>(uint64_t a1@<X8>)
{
  return sub_24FAA6DD4(a1);
}

void static GenerativeAssistantSettingsUserDefaults.setEnabled(_:)(char a1)
{
}

unint64_t GenerativeAssistantSettingsUserDefaults.Key.rawValue.getter()
{
  unint64_t result = 0xD000000000000016;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6F72507075746573;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0xD000000000000018;
      break;
    case 5:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 6:
      unint64_t result = 0xD000000000000022;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000017;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000011;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      unint64_t result = 0x656C62616E457369;
      break;
  }
  return result;
}

void static GenerativeAssistantSettingsUserDefaults.setUseConfirmationPrompts(_:)(char a1)
{
}

void static GenerativeAssistantSettingsUserDefaults.setSetupPrompt(_:)(char a1)
{
}

GenerativeAssistantSettings::RequestType_optional __swiftcall RequestType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 6;
  if ((unint64_t)rawValue < 6) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (GenerativeAssistantSettings::RequestType_optional)rawValue;
}

uint64_t RequestType.rawValue.getter()
{
  return *v0;
}

GenerativeAssistantSettings::RequestType_optional sub_24FAA7224(Swift::Int *a1)
{
  return RequestType.init(rawValue:)(*a1);
}

GenerativeAssistantSettings::ResponseType_optional __swiftcall ResponseType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  char *v1 = v2;
  return (GenerativeAssistantSettings::ResponseType_optional)rawValue;
}

GenerativeAssistantSettings::ResponseType_optional sub_24FAA7240(Swift::Int *a1)
{
  return ResponseType.init(rawValue:)(*a1);
}

id sub_24FAA7248()
{
  id result = sub_24FAA72C0();
  qword_26B1FAC60 = (uint64_t)result;
  return result;
}

unint64_t sub_24FAA7268()
{
  unint64_t result = qword_269A4BF68;
  if (!qword_269A4BF68)
  {
    sub_24FABF290();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4BF68);
  }
  return result;
}

id sub_24FAA72C0()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_24FABFFD0();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1FAC48);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24FAC2060;
  *(void *)(inited + 32) = 0x656C62616E457369;
  *(void *)(inited + 40) = 0xE900000000000064;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 48) = 0;
  *(void *)(inited + 72) = v4;
  *(void *)(inited + 80) = 0x6F72507075746573;
  *(void *)(inited + 88) = 0xEB0000000074706DLL;
  *(unsigned char *)(inited + 96) = 1;
  *(void *)(inited + 120) = v4;
  *(void *)(inited + 128) = 0xD000000000000016;
  *(void *)(inited + 136) = 0x800000024FAC2E00;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 168) = v4;
  *(void *)(inited + 176) = 0xD000000000000013;
  uint64_t v5 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 184) = 0x800000024FAC2E60;
  *(void *)(inited + 192) = 0;
  *(void *)(inited + 216) = v5;
  *(void *)(inited + 224) = 0xD000000000000018;
  *(void *)(inited + 232) = 0x800000024FAC2E80;
  uint64_t v6 = sub_24FABF290();
  *(void *)(inited + 264) = v6;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 240));
  sub_24FABF210();
  *(void *)(inited + 272) = 0xD00000000000001DLL;
  *(void *)(inited + 280) = 0x800000024FAC2EA0;
  *(void *)(inited + 288) = 0;
  *(void *)(inited + 312) = v5;
  *(void *)(inited + 320) = 0xD000000000000022;
  *(void *)(inited + 328) = 0x800000024FAC2EC0;
  *(void *)(inited + 360) = v6;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 336));
  sub_24FABF210();
  *(void *)(inited + 368) = 0xD00000000000001ALL;
  *(void *)(inited + 376) = 0x800000024FAC2EF0;
  *(void *)(inited + 384) = 0;
  *(void *)(inited + 408) = v5;
  *(void *)(inited + 416) = 0xD00000000000001FLL;
  *(void *)(inited + 424) = 0x800000024FAC2F10;
  *(void *)(inited + 456) = v6;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 432));
  sub_24FABF210();
  *(void *)(inited + 464) = 0xD000000000000017;
  *(void *)(inited + 472) = 0x800000024FAC2F30;
  *(unsigned char *)(inited + 480) = 0;
  *(void *)(inited + 504) = v4;
  *(void *)(inited + 512) = 0xD000000000000011;
  *(void *)(inited + 520) = 0x800000024FAC2F50;
  *(void *)(inited + 552) = v5;
  *(void *)(inited + 528) = 0;
  sub_24FAAA3BC(inited);
  if (v2)
  {
    id v7 = v2;
    uint64_t v8 = (void *)sub_24FABFF50();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_registerDefaults_, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v2;
}

GenerativeAssistantSettings::GenerativeAssistantSettingsUserDefaults::Key_optional __swiftcall GenerativeAssistantSettingsUserDefaults.Key.init(rawValue:)(Swift::String rawValue)
{
  id v2 = v1;
  unint64_t v3 = sub_24FAC0300();
  result.value = swift_bridgeObjectRelease();
  char v5 = 12;
  if (v3 < 0xC) {
    char v5 = v3;
  }
  *id v2 = v5;
  return result;
}

uint64_t sub_24FAA75EC()
{
  return sub_24FA915D4();
}

uint64_t sub_24FAA75F8()
{
  return sub_24FAC03D0();
}

uint64_t sub_24FAA7660()
{
  GenerativeAssistantSettingsUserDefaults.Key.rawValue.getter();
  sub_24FAC0000();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24FAA76C4()
{
  return sub_24FAC03D0();
}

GenerativeAssistantSettings::GenerativeAssistantSettingsUserDefaults::Key_optional sub_24FAA7728(Swift::String *a1)
{
  return GenerativeAssistantSettingsUserDefaults.Key.init(rawValue:)(*a1);
}

unint64_t sub_24FAA7734@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = GenerativeAssistantSettingsUserDefaults.Key.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void static GenerativeAssistantSettingsUserDefaults.incrementDeclineMediaQACount()()
{
}

void static GenerativeAssistantSettingsUserDefaults.setDeclineMediaQAExpiration(_:)()
{
}

void static GenerativeAssistantSettingsUserDefaults.incrementKnowledgeFallbackCount()()
{
}

void static GenerativeAssistantSettingsUserDefaults.setDeclineKnowledgeFallbackExpiration(_:)()
{
}

void static GenerativeAssistantSettingsUserDefaults.incrementDeclineComposeViaSiriCount()()
{
}

void static GenerativeAssistantSettingsUserDefaults.setDeclineComposeViaSiriExpiration(_:)()
{
}

void sub_24FAA7840()
{
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v1 = (void *)sub_24FABF240();
    id v2 = (id)sub_24FABFFD0();
    objc_msgSend(v0, sel_setObject_forKey_, v1, v2);
  }
}

void static GenerativeAssistantSettingsUserDefaults.decrementDecline(for:expirationDate:)(unsigned char *a1)
{
  switch(*a1)
  {
    case 1:
      if (qword_26B1FAC40 != -1) {
        swift_once();
      }
      uint64_t v8 = (void *)qword_26B1FAC60;
      if (qword_26B1FAC60)
      {
        int v9 = (void *)sub_24FABFFD0();
        uint64_t v10 = (char *)objc_msgSend(v8, sel_integerForKey_, v9);

        uint64_t v11 = (void *)qword_26B1FAC60;
        if (qword_26B1FAC60)
        {
          uint64_t v12 = (uint64_t)v10 <= 0 ? 0 : (uint64_t)(v10 - 1);
          id v13 = (void *)sub_24FABFFD0();
          objc_msgSend(v11, sel_setInteger_forKey_, v12, v13);

          id v7 = (void *)qword_26B1FAC60;
          if (qword_26B1FAC60) {
            goto LABEL_29;
          }
        }
      }
      break;
    case 2:
      if (qword_26B1FAC40 != -1) {
        swift_once();
      }
      long long v14 = (void *)qword_26B1FAC60;
      if (qword_26B1FAC60)
      {
        long long v15 = (void *)sub_24FABFFD0();
        uint64_t v16 = (char *)objc_msgSend(v14, sel_integerForKey_, v15);

        uint64_t v17 = (void *)qword_26B1FAC60;
        if (qword_26B1FAC60)
        {
          uint64_t v18 = (uint64_t)v16 <= 0 ? 0 : (uint64_t)(v16 - 1);
          uint64_t v19 = (void *)sub_24FABFFD0();
          objc_msgSend(v17, sel_setInteger_forKey_, v18, v19);

          id v7 = (void *)qword_26B1FAC60;
          if (qword_26B1FAC60) {
            goto LABEL_29;
          }
        }
      }
      break;
    case 3:
    case 4:
    case 5:
      return;
    default:
      if (qword_26B1FAC40 != -1) {
        swift_once();
      }
      uint64_t v1 = (void *)qword_26B1FAC60;
      if (qword_26B1FAC60)
      {
        id v2 = (void *)sub_24FABFFD0();
        unint64_t v3 = (char *)objc_msgSend(v1, sel_integerForKey_, v2);

        uint64_t v4 = (void *)qword_26B1FAC60;
        if (qword_26B1FAC60)
        {
          uint64_t v5 = (uint64_t)v3 <= 0 ? 0 : (uint64_t)(v3 - 1);
          uint64_t v6 = (void *)sub_24FABFFD0();
          objc_msgSend(v4, sel_setInteger_forKey_, v5, v6);

          id v7 = (void *)qword_26B1FAC60;
          if (qword_26B1FAC60)
          {
LABEL_29:
            uint64_t v20 = (void *)sub_24FABF240();
            id v21 = (id)sub_24FABFFD0();
            objc_msgSend(v7, sel_setObject_forKey_, v20);
          }
        }
      }
      break;
  }
}

void static GenerativeAssistantSettingsUserDefaults.decrementDeclineMediaQACount()()
{
}

void static GenerativeAssistantSettingsUserDefaults.decrementKnowledgeFallbackCount()()
{
}

void static GenerativeAssistantSettingsUserDefaults.decrementDeclineComposeViaSiriCount()()
{
}

void sub_24FAA7CE8()
{
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v1 = (void *)sub_24FABFFD0();
    id v2 = (char *)objc_msgSend(v0, sel_integerForKey_, v1);

    unint64_t v3 = (void *)qword_26B1FAC60;
    if (qword_26B1FAC60)
    {
      if ((uint64_t)v2 <= 0) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = v2 - 1;
      }
      id v5 = (id)sub_24FABFFD0();
      objc_msgSend(v3, sel_setInteger_forKey_, v4, v5);
    }
  }
}

void static GenerativeAssistantSettingsUserDefaults.setDeclineMediaQACount(_:)(uint64_t a1)
{
}

void static GenerativeAssistantSettingsUserDefaults.setDeclineKnowledgeFallbackCount(_:)(uint64_t a1)
{
}

void static GenerativeAssistantSettingsUserDefaults.setDeclineComposeViaSiriCount(_:)(uint64_t a1)
{
}

void static GenerativeAssistantSettingsUserDefaults.setTaperConfirmationDialog(_:)(char a1)
{
}

void sub_24FAA7E68(char a1)
{
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  id v2 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    id v3 = (id)sub_24FABFFD0();
    objc_msgSend(v2, sel_setBool_forKey_, a1 & 1, v3);
  }
}

void static GenerativeAssistantSettingsUserDefaults.setConfirmationCount(_:)(uint64_t a1)
{
}

void sub_24FAA7F4C(uint64_t a1)
{
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  id v2 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    id v3 = (id)sub_24FABFFD0();
    objc_msgSend(v2, sel_setInteger_forKey_, a1, v3);
  }
}

void static GenerativeAssistantSettingsUserDefaults.logConfirmationCount()()
{
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60)
  {
    long long v9 = 0u;
    long long v10 = 0u;
LABEL_13:
    sub_24FA89838((uint64_t)&v9, &qword_269A4BE18);
    goto LABEL_14;
  }
  uint64_t v1 = (void *)sub_24FABFFD0();
  id v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_24FAC01C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_24FAA8804((uint64_t)v8, (uint64_t)&v9);
  if (!*((void *)&v10 + 1)) {
    goto LABEL_13;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    uint64_t v3 = 0;
    goto LABEL_15;
  }
  uint64_t v3 = *(void *)&v8[0];
  if (*(uint64_t *)&v8[0] >= 2)
  {
    uint64_t v4 = (void *)qword_26B1FAC60;
    if (!qword_26B1FAC60) {
      return;
    }
    id v5 = (void *)sub_24FABFFD0();
    objc_msgSend(v4, sel_setBool_forKey_, 1, v5);
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v6 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60) {
    return;
  }
  uint64_t v7 = v3 + 1;
  id v5 = (void *)sub_24FABFFD0();
  objc_msgSend(v6, sel_setInteger_forKey_, v7, v5);
LABEL_17:
}

void sub_24FAA81DC()
{
  id v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    uint64_t v1 = v0;
    char internalBuild = MobileGestalt_get_internalBuild();

    byte_269A4C1F0 = internalBuild;
  }
  else
  {
    __break(1u);
  }
}

id GenerativeAssistantSettingsUserDefaults.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id GenerativeAssistantSettingsUserDefaults.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GenerativeAssistantSettingsUserDefaults.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static GATSettings.isEnabled()()
{
  return sub_24FAA839C();
}

id static GATSettings.useConfirmationPrompts()()
{
  return sub_24FAA839C();
}

id static GATSettings.setupPrompt()()
{
  return sub_24FAA839C();
}

id sub_24FAA839C()
{
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60) {
    return 0;
  }
  id v1 = (void *)sub_24FABFFD0();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

id sub_24FAA845C()
{
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60) {
    return 0;
  }
  id v1 = (void *)sub_24FABFFD0();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

GATSettings __swiftcall GATSettings.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return (GATSettings)objc_msgSend(v0, sel_init);
}

id GATSettings.init()()
{
  v1.super_class = (Class)GATSettings;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t _s27GenerativeAssistantSettings0abC12UserDefaultsC23taperConfirmationDialogSbyFZ_0()
{
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_11:
    sub_24FA89838((uint64_t)&v5, &qword_269A4BE18);
    return 0;
  }
  objc_super v1 = (void *)sub_24FABFFD0();
  id v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_24FAC01C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_24FAA8804((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_11;
  }
  uint64_t result = swift_dynamicCast();
  if (result) {
    return LOBYTE(v4[0]);
  }
  return result;
}

uint64_t _s27GenerativeAssistantSettings0abC12UserDefaultsC17confirmationCountSiyFZ_0()
{
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_11:
    sub_24FA89838((uint64_t)&v5, &qword_269A4BE18);
    return 0;
  }
  objc_super v1 = (void *)sub_24FABFFD0();
  id v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_24FAC01C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_24FAA8804((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_11;
  }
  if (swift_dynamicCast()) {
    return *(void *)&v4[0];
  }
  return 0;
}

uint64_t sub_24FAA8804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BE18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_24FAA886C()
{
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  id v0 = (char *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    objc_super v1 = (void *)sub_24FABFFD0();
    id v0 = (char *)objc_msgSend(v0, sel_integerForKey_, v1);
  }
  BOOL v2 = __OFADD__(v0, 1);
  uint64_t v3 = v0 + 1;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = (void *)qword_26B1FAC60;
    if (qword_26B1FAC60)
    {
      id v5 = (id)sub_24FABFFD0();
      objc_msgSend(v4, sel_setInteger_forKey_, v3, v5);
    }
  }
}

uint64_t _s27GenerativeAssistantSettings0abC12UserDefaultsC16incrementDecline3foryAA11RequestTypeO_tFZ_0(unsigned char *a1)
{
  uint64_t v2 = sub_24FABF300();
  uint64_t v61 = *(void *)(v2 - 8);
  uint64_t v62 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24FABF310();
  uint64_t v59 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C1F8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  long long v14 = (char *)&v58 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v58 - v15;
  uint64_t v63 = sub_24FABF290();
  uint64_t v17 = MEMORY[0x270FA5388](v63);
  uint64_t v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v58 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v58 - v24;
  uint64_t result = MEMORY[0x270FA5388](v23);
  uint64_t v29 = (char *)&v58 - v28;
  switch(*a1)
  {
    case 1:
      uint64_t v36 = v27;
      sub_24FAA886C();
      sub_24FABF2F0();
      uint64_t v38 = v61;
      uint64_t v37 = v62;
      (*(void (**)(char *, void, uint64_t))(v61 + 104))(v4, *MEMORY[0x263F078A8], v62);
      sub_24FABF270();
      sub_24FABF2E0();
      uint64_t v39 = v25;
      uint64_t v40 = *(void (**)(char *, uint64_t))(v36 + 8);
      uint64_t v41 = v63;
      v40(v39, v63);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v4, v37);
      (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v60);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v14, 1, v41) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v22, v14, v41);
        if (qword_26B1FAC40 != -1) {
          swift_once();
        }
        uint64_t v50 = (void *)qword_26B1FAC60;
        if (qword_26B1FAC60)
        {
          uint64_t v51 = (void *)sub_24FABF240();
          uint64_t v52 = (void *)sub_24FABFFD0();
          objc_msgSend(v50, sel_setObject_forKey_, v51, v52);
        }
        uint64_t v53 = v22;
        uint64_t v54 = v41;
        goto LABEL_23;
      }
      uint64_t result = sub_24FA89838((uint64_t)v14, &qword_269A4C1F8);
      break;
    case 2:
      uint64_t v42 = v27;
      sub_24FAA886C();
      sub_24FABF2F0();
      uint64_t v44 = v61;
      uint64_t v43 = v62;
      (*(void (**)(char *, void, uint64_t))(v61 + 104))(v4, *MEMORY[0x263F078A8], v62);
      sub_24FABF270();
      sub_24FABF2E0();
      uint64_t v45 = v25;
      uint64_t v40 = *(void (**)(char *, uint64_t))(v42 + 8);
      uint64_t v46 = v63;
      v40(v45, v63);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v4, v43);
      (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v60);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v11, 1, v46) == 1)
      {
        uint64_t result = sub_24FA89838((uint64_t)v11, &qword_269A4C1F8);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v19, v11, v46);
        if (qword_26B1FAC40 != -1) {
          swift_once();
        }
        uint64_t v55 = (void *)qword_26B1FAC60;
        if (qword_26B1FAC60)
        {
          id v56 = (void *)sub_24FABF240();
          uint64_t v57 = (void *)sub_24FABFFD0();
          objc_msgSend(v55, sel_setObject_forKey_, v56, v57);
        }
        uint64_t v53 = v19;
        uint64_t v54 = v46;
LABEL_23:
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v40)(v53, v54);
      }
      break;
    case 3:
    case 4:
    case 5:
      return result;
    default:
      uint64_t v30 = v27;
      sub_24FAA886C();
      sub_24FABF2F0();
      uint64_t v32 = v61;
      uint64_t v31 = v62;
      (*(void (**)(char *, void, uint64_t))(v61 + 104))(v4, *MEMORY[0x263F078A8], v62);
      sub_24FABF270();
      sub_24FABF2E0();
      uint64_t v33 = v25;
      uint64_t v34 = *(void (**)(char *, uint64_t))(v30 + 8);
      uint64_t v35 = v63;
      v34(v33, v63);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v4, v31);
      (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v60);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v16, 1, v35) == 1)
      {
        uint64_t result = sub_24FA89838((uint64_t)v16, &qword_269A4C1F8);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v29, v16, v35);
        if (qword_26B1FAC40 != -1) {
          swift_once();
        }
        uint64_t v47 = (void *)qword_26B1FAC60;
        if (qword_26B1FAC60)
        {
          uint64_t v48 = (void *)sub_24FABF240();
          uint64_t v49 = (void *)sub_24FABFFD0();
          objc_msgSend(v47, sel_setObject_forKey_, v48, v49);
        }
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v34)(v29, v35);
      }
      break;
  }
  return result;
}

uint64_t _s27GenerativeAssistantSettings0abC12UserDefaultsC20forcedRateLimitStateSbSgyFZ_0()
{
  if (qword_269A4BA78 != -1) {
    swift_once();
  }
  if (byte_269A4C1F0 != 1) {
    return 2;
  }
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_26B1FAC60;
  if (!qword_26B1FAC60)
  {
    long long v5 = 0u;
    long long v6 = 0u;
LABEL_15:
    sub_24FA89838((uint64_t)&v5, &qword_269A4BE18);
    return 2;
  }
  objc_super v1 = (void *)sub_24FABFFD0();
  id v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_24FAC01C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_24FAA8804((uint64_t)v4, (uint64_t)&v5);
  if (!*((void *)&v6 + 1)) {
    goto LABEL_15;
  }
  if (swift_dynamicCast()) {
    return LOBYTE(v4[0]);
  }
  else {
    return 2;
  }
}

uint64_t _s27GenerativeAssistantSettings0abC12UserDefaultsC18resetDeclineCountsyyFZ_0()
{
  uint64_t v0 = sub_24FABF290();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)&v27 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v27 - v8;
  if (qword_26B1FAC40 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v11 = (void *)sub_24FABFFD0();
    objc_msgSend(v10, sel_setInteger_forKey_, 0, v11);

    uint64_t v12 = (void *)qword_26B1FAC60;
    if (qword_26B1FAC60)
    {
      uint64_t v13 = (void *)sub_24FABFFD0();
      objc_msgSend(v12, sel_setInteger_forKey_, 0, v13);

      long long v14 = (void *)qword_26B1FAC60;
      if (qword_26B1FAC60)
      {
        uint64_t v15 = (void *)sub_24FABFFD0();
        objc_msgSend(v14, sel_setInteger_forKey_, 0, v15);
      }
    }
  }
  sub_24FABF210();
  uint64_t v16 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v17 = (void *)sub_24FABF240();
    uint64_t v18 = (void *)sub_24FABFFD0();
    objc_msgSend(v16, sel_setObject_forKey_, v17, v18);
  }
  uint64_t v19 = *(void (**)(char *, uint64_t))(v1 + 8);
  v19(v9, v0);
  sub_24FABF210();
  uint64_t v20 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v21 = (void *)sub_24FABF240();
    uint64_t v22 = (void *)sub_24FABFFD0();
    objc_msgSend(v20, sel_setObject_forKey_, v21, v22);
  }
  v19(v7, v0);
  sub_24FABF210();
  uint64_t v23 = (void *)qword_26B1FAC60;
  if (qword_26B1FAC60)
  {
    uint64_t v24 = (void *)sub_24FABF240();
    uint64_t v25 = (void *)sub_24FABFFD0();
    objc_msgSend(v23, sel_setObject_forKey_, v24, v25);
  }
  return ((uint64_t (*)(char *, uint64_t))v19)(v4, v0);
}

uint64_t _sSo11GATSettingsC27GenerativeAssistantSettingsE11accountTypeSo010GATAccountF0VyFZ_0()
{
  uint64_t v0 = sub_24FABF4A0();
  uint64_t v23 = *(void *)(v0 - 8);
  uint64_t v24 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_24FABF4D0();
  uint64_t v3 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24FABF5D0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24FABF500();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FABF580();
  sub_24FABF510();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) == 1)
  {
    sub_24FA89838((uint64_t)v8, &qword_269A4BBC0);
    return 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v8, v13);
    sub_24FABF4E0();
    sub_24FABF4B0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v22);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    uint64_t v19 = v23;
    uint64_t v18 = v24;
    int v20 = (*(uint64_t (**)(char *, uint64_t))(v23 + 88))(v2, v24);
    if (v20 == *MEMORY[0x263F24C88])
    {
      return 2;
    }
    else if (v20 == *MEMORY[0x263F24C90])
    {
      return 3;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v2, v18);
      return 0;
    }
  }
}

unint64_t sub_24FAA99FC()
{
  unint64_t result = qword_269A4C200;
  if (!qword_269A4C200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C200);
  }
  return result;
}

unint64_t sub_24FAA9A54()
{
  unint64_t result = qword_269A4C208;
  if (!qword_269A4C208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C208);
  }
  return result;
}

unint64_t sub_24FAA9AAC()
{
  unint64_t result = qword_269A4C210;
  if (!qword_269A4C210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C210);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RequestType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RequestType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x24FAA9C5CLL);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RequestType()
{
  return &type metadata for RequestType;
}

unsigned char *storeEnumTagSinglePayload for ResponseType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24FAA9D60);
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

ValueMetadata *type metadata accessor for ResponseType()
{
  return &type metadata for ResponseType;
}

uint64_t type metadata accessor for GenerativeAssistantSettingsUserDefaults()
{
  return self;
}

uint64_t getEnumTagSinglePayload for GenerativeAssistantSettingsUserDefaults.Key(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GenerativeAssistantSettingsUserDefaults.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x24FAA9F18);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GenerativeAssistantSettingsUserDefaults.Key()
{
  return &type metadata for GenerativeAssistantSettingsUserDefaults.Key;
}

unint64_t type metadata accessor for GATSettings()
{
  unint64_t result = qword_269A4C218;
  if (!qword_269A4C218)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269A4C218);
  }
  return result;
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

uint64_t sub_24FAA9FF8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_24FAAA00C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_24FAAA020(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_24FAAA034(char a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 32) = a5;
  *(void *)(v6 + 40) = a6;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 81) = a2;
  *(unsigned char *)(v6 + 80) = a1;
  return MEMORY[0x270FA2498](sub_24FAAA060, 0, 0);
}

uint64_t sub_24FAAA060()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = (void *)sub_24FAAA774(*(void *)(v0 + 32), *(void *)(v0 + 40));
  id v3 = objc_msgSend(v1, sel_arrayForKey_, v2);
  *(void *)(v0 + 48) = v3;

  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *unsigned int v4 = v0;
  v4[1] = sub_24FAAA138;
  uint64_t v5 = *(void *)(v0 + 16);
  char v6 = *(unsigned char *)(v0 + 81);
  char v7 = *(unsigned char *)(v0 + 80);
  return sub_24FAA5654((uint64_t)v3, v7, v6, v5);
}

uint64_t sub_24FAAA138(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    unsigned int v4 = sub_24FAAA358;
  }
  else
  {

    unsigned int v4 = sub_24FAAA254;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24FAAA254()
{
  id v1 = *(id *)(v0 + 64);
  sub_24FAC0050();

  uint64_t v2 = *(void **)(v0 + 64);
  sub_24FAA5FB8();
  swift_allocError();
  *uint64_t v3 = 1;
  swift_willThrow();

  unsigned int v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24FAAA358()
{
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_24FAAA3BC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1FAC58);
  uint64_t v2 = sub_24FAC02E0();
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
    sub_24FA897D4(v6, (uint64_t)&v15, &qword_26B1FAC50);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24FA955A8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24FAAD1FC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    long long v3[2] = v14;
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

unint64_t sub_24FAAA4F4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C248);
  uint64_t v2 = (void *)sub_24FAC02E0();
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
    sub_24FA897D4(v4, (uint64_t)v14, &qword_269A4C250);
    unsigned __int8 v5 = v14[0];
    unint64_t result = sub_24FA95620(v14[0]);
    if (v7) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    uint64_t v8 = v2[7] + 40 * result;
    long long v9 = v15;
    long long v10 = v16;
    *(void *)(v8 + 32) = v17;
    *(_OWORD *)uint64_t v8 = v9;
    *(_OWORD *)(v8 + 16) = v10;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 48;
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

unint64_t sub_24FAAA630(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C258);
  uint64_t v2 = sub_24FAC02E0();
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
    sub_24FA897D4(v6, (uint64_t)v15, &qword_269A4C260);
    unint64_t result = sub_24FA95754((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_24FAAD1FC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    long long v3[2] = v14;
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

uint64_t sub_24FAAA774(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_24FAC0010();
    sub_24FAC0010();
    swift_bridgeObjectRelease();
  }
  uint64_t v2 = sub_24FABFFD0();
  swift_bridgeObjectRelease();
  return v2;
}

unint64_t sub_24FAAA978(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6C646E7542707061;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      unint64_t result = 0x496D616441707061;
      break;
  }
  return result;
}

uint64_t sub_24FAAAA40(char *a1, char *a2)
{
  return sub_24FA913E8(*a1, *a2);
}

uint64_t sub_24FAAAA4C()
{
  return sub_24FA89A44();
}

uint64_t sub_24FAAAA54()
{
  return sub_24FA91B88();
}

uint64_t sub_24FAAAA5C()
{
  return sub_24FA92058();
}

uint64_t sub_24FAAAA64@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24FAAD80C();
  *a1 = result;
  return result;
}

unint64_t sub_24FAAAA94@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24FAAA978(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_24FAAAAC0(void *a1@<X8>)
{
  *a1 = &unk_270120C60;
}

BOOL sub_24FAAAAD0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_24FAAAAF8()
{
  unint64_t result = sub_24FAAA4F4(MEMORY[0x263F8EE78]);
  qword_269A4C220 = result;
  return result;
}

uint64_t sub_24FAAAB20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[11] = a6;
  v7[12] = a7;
  v7[10] = a5;
  v7[13] = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  v7[14] = swift_task_alloc();
  v7[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FAAABCC, 0, 0);
}

uint64_t sub_24FAAABCC()
{
  uint64_t v1 = *(void *)(v0 + 96);
  *(void *)(v0 + 128) = 0;
  if (!qword_270120C98)
  {
    __break(1u);
    JUMPOUT(0x24FAAB110);
  }
  switch(byte_270120CA8)
  {
    case 2:
    case 4:
      if (v1)
      {
        *(void *)(v0 + 32) = *(void *)(v0 + 88);
        *(void *)(v0 + 40) = v1;
        swift_bridgeObjectRetain();
        sub_24FAC0010();
        sub_24FAC0010();
        swift_bridgeObjectRelease();
      }
      uint64_t v12 = (void *)sub_24FABFFD0();
      swift_bridgeObjectRelease();
      id v13 = objc_msgSend(*(id *)(v0 + 80), sel_URLForKey_, v12);
      *(void *)(v0 + 160) = v13;

      uint64_t v14 = swift_task_alloc();
      *(void *)(v0 + 168) = v14;
      *(void *)(v14 + 16) = v13;
      long long v15 = (void *)swift_task_alloc();
      *(void *)(v0 + 176) = v15;
      *long long v15 = v0;
      v15[1] = sub_24FAAB878;
      uint64_t v16 = *(void *)(v0 + 120);
      uint64_t v8 = *(void *)(v0 + 104);
      unint64_t v9 = 0xD00000000000003ELL;
      unint64_t v10 = 0x800000024FAC4540;
      long long v17 = sub_24FAAD054;
      uint64_t v18 = v14;
      break;
    case 3:
      if (v1)
      {
        *(void *)(v0 + 16) = *(void *)(v0 + 88);
        *(void *)(v0 + 24) = v1;
        swift_bridgeObjectRetain();
        sub_24FAC0010();
        sub_24FAC0010();
        uint64_t v2 = (void *)sub_24FABFFD0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v2 = (void *)sub_24FABFFD0();
      }
      uint64_t v4 = v0 + 64;
      id v19 = objc_msgSend(*(id *)(v0 + 80), sel_arrayForKey_, v2);
      *(void *)(v0 + 184) = v19;

      uint64_t v6 = swift_task_alloc();
      *(void *)(v0 + 192) = v6;
      *(void *)(v6 + 16) = v19;
      int v20 = (void *)swift_task_alloc();
      *(void *)(v0 + 200) = v20;
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C198);
      *int v20 = v0;
      v20[1] = sub_24FAAC034;
      unint64_t v9 = 0xD00000000000003BLL;
      unint64_t v10 = 0x800000024FAC42B0;
      long long v11 = sub_24FAAD04C;
      goto LABEL_13;
    default:
      if (v1)
      {
        *(void *)(v0 + 48) = *(void *)(v0 + 88);
        *(void *)(v0 + 56) = v1;
        swift_bridgeObjectRetain();
        sub_24FAC0010();
        sub_24FAC0010();
        swift_bridgeObjectRelease();
      }
      uint64_t v3 = (void *)sub_24FABFFD0();
      swift_bridgeObjectRelease();
      uint64_t v4 = v0 + 72;
      id v5 = objc_msgSend(*(id *)(v0 + 80), sel_stringForKey_, v3);
      *(void *)(v0 + 136) = v5;

      uint64_t v6 = swift_task_alloc();
      *(void *)(v0 + 144) = v6;
      *(void *)(v6 + 16) = v5;
      char v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 152) = v7;
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C170);
      *char v7 = v0;
      v7[1] = sub_24FAAB124;
      unint64_t v9 = 0xD00000000000003BLL;
      unint64_t v10 = 0x800000024FAC42B0;
      long long v11 = sub_24FAAD0BC;
LABEL_13:
      long long v17 = v11;
      uint64_t v16 = v4;
      uint64_t v18 = v6;
      break;
  }
  return MEMORY[0x270FA2318](v16, 0, 0, v9, v10, v17, v18, v8);
}

uint64_t sub_24FAAB124()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24FAAB23C, 0, 0);
}

uint64_t sub_24FAAB23C()
{
  uint64_t v1 = *(void **)(v0 + 72);
  uint64_t v2 = *(void **)(v0 + 136);
  if (!v1)
  {
    sub_24FAA5FB8();
    swift_allocError();
    *id v5 = 0;
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_5;
  }

  unint64_t v3 = *(void *)(v0 + 128) + 1;
  if (*(void *)(v0 + 128) == 4)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
LABEL_5:
    return v4();
  }
  *(void *)(v0 + 128) = v3;
  if (v3 >= qword_270120C98)
  {
    __break(1u);
    JUMPOUT(0x24FAAB864);
  }
  switch(*((unsigned char *)&unk_270120C88 + v3 + 32))
  {
    case 2:
    case 4:
      uint64_t v8 = *(void *)(v0 + 96);
      if (v8)
      {
        *(void *)(v0 + 32) = *(void *)(v0 + 88);
        *(void *)(v0 + 40) = v8;
        swift_bridgeObjectRetain();
        sub_24FAC0010();
        sub_24FAC0010();
        swift_bridgeObjectRelease();
      }
      int v20 = (void *)sub_24FABFFD0();
      swift_bridgeObjectRelease();
      id v21 = objc_msgSend(*(id *)(v0 + 80), sel_URLForKey_, v20);
      *(void *)(v0 + 160) = v21;

      uint64_t v13 = swift_task_alloc();
      *(void *)(v0 + 168) = v13;
      *(void *)(v13 + 16) = v21;
      uint64_t v22 = (void *)swift_task_alloc();
      *(void *)(v0 + 176) = v22;
      void *v22 = v0;
      v22[1] = sub_24FAAB878;
      uint64_t v19 = *(void *)(v0 + 120);
      uint64_t v15 = *(void *)(v0 + 104);
      unint64_t v16 = 0xD00000000000003ELL;
      unint64_t v17 = 0x800000024FAC4540;
      uint64_t v18 = sub_24FAAD054;
      goto LABEL_18;
    case 3:
      uint64_t v9 = *(void *)(v0 + 96);
      if (v9)
      {
        *(void *)(v0 + 16) = *(void *)(v0 + 88);
        *(void *)(v0 + 24) = v9;
        swift_bridgeObjectRetain();
        sub_24FAC0010();
        sub_24FAC0010();
        unint64_t v10 = (void *)sub_24FABFFD0();
        swift_bridgeObjectRelease();
      }
      else
      {
        unint64_t v10 = (void *)sub_24FABFFD0();
      }
      id v24 = objc_msgSend(*(id *)(v0 + 80), sel_arrayForKey_, v10);
      *(void *)(v0 + 184) = v24;

      uint64_t v25 = swift_task_alloc();
      *(void *)(v0 + 192) = v25;
      *(void *)(v25 + 16) = v24;
      uint64_t v26 = (void *)swift_task_alloc();
      *(void *)(v0 + 200) = v26;
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C198);
      void *v26 = v0;
      v26[1] = sub_24FAAC034;
      unint64_t v16 = 0xD00000000000003BLL;
      unint64_t v17 = 0x800000024FAC42B0;
      uint64_t v18 = sub_24FAAD04C;
      uint64_t v19 = v0 + 64;
      uint64_t v23 = v25;
      break;
    default:
      uint64_t v7 = *(void *)(v0 + 96);
      if (v7)
      {
        *(void *)(v0 + 48) = *(void *)(v0 + 88);
        *(void *)(v0 + 56) = v7;
        swift_bridgeObjectRetain();
        sub_24FAC0010();
        sub_24FAC0010();
        swift_bridgeObjectRelease();
      }
      long long v11 = (void *)sub_24FABFFD0();
      swift_bridgeObjectRelease();
      id v12 = objc_msgSend(*(id *)(v0 + 80), sel_stringForKey_, v11);
      *(void *)(v0 + 136) = v12;

      uint64_t v13 = swift_task_alloc();
      *(void *)(v0 + 144) = v13;
      *(void *)(v13 + 16) = v12;
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 152) = v14;
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C170);
      void *v14 = v0;
      v14[1] = sub_24FAAB124;
      unint64_t v16 = 0xD00000000000003BLL;
      unint64_t v17 = 0x800000024FAC42B0;
      uint64_t v18 = sub_24FAAD0BC;
      uint64_t v19 = v0 + 72;
LABEL_18:
      uint64_t v23 = v13;
      break;
  }
  return MEMORY[0x270FA2318](v19, 0, 0, v16, v17, v18, v23, v15);
}

uint64_t sub_24FAAB878()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24FAAB990, 0, 0);
}

uint64_t sub_24FAAB990()
{
  uint64_t v1 = *(void *)(v0 + 112);
  sub_24FA897D4(*(void *)(v0 + 120), v1, &qword_269A4BBC8);
  uint64_t v2 = sub_24FABF200();
  int v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2);
  uint64_t v4 = *(void **)(v0 + 160);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 120);
  if (v3 == 1)
  {
    sub_24FAAD05C(*(void *)(v0 + 112));
    sub_24FAA5FB8();
    swift_allocError();
    *uint64_t v7 = 0;
    swift_willThrow();
    sub_24FAAD05C(v6);

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
LABEL_5:
    return v8();
  }
  sub_24FAAD05C(*(void *)(v0 + 120));
  sub_24FAAD05C(v5);

  unint64_t v9 = *(void *)(v0 + 128) + 1;
  if (*(void *)(v0 + 128) == 4)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_5;
  }
  *(void *)(v0 + 128) = v9;
  if (v9 >= qword_270120C98)
  {
    __break(1u);
    JUMPOUT(0x24FAAC020);
  }
  switch(*((unsigned char *)&unk_270120C88 + v9 + 32))
  {
    case 2:
    case 4:
      uint64_t v12 = *(void *)(v0 + 96);
      if (v12)
      {
        *(void *)(v0 + 32) = *(void *)(v0 + 88);
        *(void *)(v0 + 40) = v12;
        swift_bridgeObjectRetain();
        sub_24FAC0010();
        sub_24FAC0010();
        swift_bridgeObjectRelease();
      }
      id v24 = (void *)sub_24FABFFD0();
      swift_bridgeObjectRelease();
      id v25 = objc_msgSend(*(id *)(v0 + 80), sel_URLForKey_, v24);
      *(void *)(v0 + 160) = v25;

      uint64_t v26 = swift_task_alloc();
      *(void *)(v0 + 168) = v26;
      *(void *)(v26 + 16) = v25;
      uint64_t v27 = (void *)swift_task_alloc();
      *(void *)(v0 + 176) = v27;
      *uint64_t v27 = v0;
      v27[1] = sub_24FAAB878;
      uint64_t v28 = *(void *)(v0 + 120);
      uint64_t v20 = *(void *)(v0 + 104);
      unint64_t v21 = 0xD00000000000003ELL;
      unint64_t v22 = 0x800000024FAC4540;
      uint64_t v29 = sub_24FAAD054;
      uint64_t v30 = v26;
      break;
    case 3:
      uint64_t v13 = *(void *)(v0 + 96);
      if (v13)
      {
        *(void *)(v0 + 16) = *(void *)(v0 + 88);
        *(void *)(v0 + 24) = v13;
        swift_bridgeObjectRetain();
        sub_24FAC0010();
        sub_24FAC0010();
        uint64_t v14 = (void *)sub_24FABFFD0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v14 = (void *)sub_24FABFFD0();
      }
      uint64_t v16 = v0 + 64;
      id v31 = objc_msgSend(*(id *)(v0 + 80), sel_arrayForKey_, v14);
      *(void *)(v0 + 184) = v31;

      uint64_t v18 = swift_task_alloc();
      *(void *)(v0 + 192) = v18;
      *(void *)(v18 + 16) = v31;
      uint64_t v32 = (void *)swift_task_alloc();
      *(void *)(v0 + 200) = v32;
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C198);
      void *v32 = v0;
      v32[1] = sub_24FAAC034;
      unint64_t v21 = 0xD00000000000003BLL;
      unint64_t v22 = 0x800000024FAC42B0;
      uint64_t v23 = sub_24FAAD04C;
      goto LABEL_20;
    default:
      uint64_t v11 = *(void *)(v0 + 96);
      if (v11)
      {
        *(void *)(v0 + 48) = *(void *)(v0 + 88);
        *(void *)(v0 + 56) = v11;
        swift_bridgeObjectRetain();
        sub_24FAC0010();
        sub_24FAC0010();
        swift_bridgeObjectRelease();
      }
      uint64_t v15 = (void *)sub_24FABFFD0();
      swift_bridgeObjectRelease();
      uint64_t v16 = v0 + 72;
      id v17 = objc_msgSend(*(id *)(v0 + 80), sel_stringForKey_, v15);
      *(void *)(v0 + 136) = v17;

      uint64_t v18 = swift_task_alloc();
      *(void *)(v0 + 144) = v18;
      *(void *)(v18 + 16) = v17;
      uint64_t v19 = (void *)swift_task_alloc();
      *(void *)(v0 + 152) = v19;
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C170);
      *uint64_t v19 = v0;
      v19[1] = sub_24FAAB124;
      unint64_t v21 = 0xD00000000000003BLL;
      unint64_t v22 = 0x800000024FAC42B0;
      uint64_t v23 = sub_24FAAD0BC;
LABEL_20:
      uint64_t v29 = v23;
      uint64_t v28 = v16;
      uint64_t v30 = v18;
      break;
  }
  return MEMORY[0x270FA2318](v28, 0, 0, v21, v22, v29, v30, v20);
}

uint64_t sub_24FAAC034()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24FAAC14C, 0, 0);
}

uint64_t sub_24FAAC14C()
{
  uint64_t v1 = (void *)v0[8];
  id v2 = (id)v0[23];
  if (v1)
  {

    id v2 = v1;
    sub_24FAC0050();

    sub_24FAA5FB8();
    swift_allocError();
    *uint64_t v4 = 1;
  }
  else
  {
    sub_24FAA5FB8();
    swift_allocError();
    *int v3 = 0;
  }
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24FAAC7E8(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5)
{
  *(void *)(v5 + 80) = a2;
  *(void *)(v5 + 88) = a5;
  *(unsigned char *)(v5 + 145) = a4;
  *(unsigned char *)(v5 + 144) = a3;
  *(void *)(v5 + 72) = a1;
  *(void *)(v5 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  *(void *)(v5 + 104) = swift_task_alloc();
  *(void *)(v5 + 112) = swift_task_alloc();
  *(void *)(v5 + 120) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FAAC8A8, 0, 0);
}

uint64_t sub_24FAAC8A8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = swift_task_alloc();
  v0[16] = v2;
  *(void *)(v2 + 16) = v1;
  int v3 = (void *)swift_task_alloc();
  v0[17] = v3;
  *int v3 = v0;
  v3[1] = sub_24FAAC994;
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[12];
  return MEMORY[0x270FA2318](v4, 0, 0, 0xD00000000000003ELL, 0x800000024FAC4540, sub_24FAAD858, v2, v5);
}

uint64_t sub_24FAAC994()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24FAACAAC, 0, 0);
}

uint64_t sub_24FAACAAC()
{
  uint64_t v1 = *(void *)(v0 + 112);
  sub_24FA897D4(*(void *)(v0 + 120), v1, &qword_269A4BBC8);
  uint64_t v2 = sub_24FABF200();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v4(v1, 1, v2) == 1)
  {
    int v5 = *(unsigned __int8 *)(v0 + 145);
    sub_24FAAD05C(*(void *)(v0 + 112));
    if (v5 != 1) {
      goto LABEL_8;
    }
    if (!*(void *)(*(void *)(v0 + 88) + 16)) {
      goto LABEL_8;
    }
    unint64_t v6 = sub_24FA95620(*(unsigned char *)(v0 + 144));
    if ((v7 & 1) == 0) {
      goto LABEL_8;
    }
    sub_24FA969DC(*(void *)(*(void *)(v0 + 88) + 56) + 40 * v6, v0 + 16);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v8 = *(void *)(v0 + 104);
    sub_24FABF1E0();
    swift_bridgeObjectRelease();
    if (v4(v8, 1, v2) == 1)
    {
      sub_24FAAD05C(*(void *)(v0 + 104));
LABEL_8:
      uint64_t v9 = *(void *)(v0 + 120);
      sub_24FAA5FB8();
      swift_allocError();
      *unint64_t v10 = 0;
      swift_willThrow();
      sub_24FAAD05C(v9);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
      goto LABEL_11;
    }
    uint64_t v12 = *(void *)(v0 + 120);
    uint64_t v13 = *(void *)(v0 + 104);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 112);
    uint64_t v12 = *(void *)(v0 + 120);
  }
  uint64_t v14 = *(void *)(v0 + 72);
  sub_24FAAD05C(v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v14, v13, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
LABEL_11:
  return v11();
}

void sub_24FAACCFC(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C230);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_24FAAD158;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24FAACFB8;
  aBlock[3] = &block_descriptor_1;
  uint64_t v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_valueWithCompletion_, v9);
  _Block_release(v9);
}

uint64_t sub_24FAACEA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    sub_24FABF1D0();
    uint64_t v5 = sub_24FABF200();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 0, 1, v5);
  }
  else
  {
    uint64_t v6 = sub_24FABF200();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C230);
  return sub_24FAC00B0();
}

void sub_24FAACFB8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  unint64_t v7 = *(void (**)(void *, uint64_t, void *))(a1 + 32);
  swift_retain();
  id v9 = a2;
  id v8 = a4;
  v7(a2, a3, a4);
  swift_release();
}

void sub_24FAAD04C(uint64_t a1)
{
  sub_24FAA4388(a1, *(void **)(v1 + 16));
}

void sub_24FAAD054(uint64_t a1)
{
  sub_24FAACCFC(a1, *(void **)(v1 + 16));
}

uint64_t sub_24FAAD05C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24FAAD0BC(uint64_t a1)
{
  sub_24FAA43B8(a1, *(void **)(v1 + 16));
}

uint64_t sub_24FAAD0C4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C230);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24FAAD158(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C230);

  return sub_24FAACEA4(a1);
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

_OWORD *sub_24FAAD1FC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t destroy for BagProvider.RuntimeBagConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for BagProvider.RuntimeBagConfiguration(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for BagProvider.RuntimeBagConfiguration(void *a1, void *a2)
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
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for BagProvider.RuntimeBagConfiguration(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BagProvider.RuntimeBagConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BagProvider.RuntimeBagConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BagProvider.RuntimeBagConfiguration()
{
  return &type metadata for BagProvider.RuntimeBagConfiguration;
}

uint64_t getEnumTagSinglePayload for BagProvider.BagError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BagProvider.BagError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x24FAAD5A4);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_24FAAD5CC(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for BagProvider.BagError()
{
  return &type metadata for BagProvider.BagError;
}

ValueMetadata *type metadata accessor for BagProvider()
{
  return &type metadata for BagProvider;
}

unsigned char *storeEnumTagSinglePayload for BagProvider.BagKey(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x24FAAD6C4);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BagProvider.BagKey()
{
  return &type metadata for BagProvider.BagKey;
}

unint64_t sub_24FAAD700()
{
  unint64_t result = qword_269A4C268;
  if (!qword_269A4C268)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C270);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C268);
  }
  return result;
}

unint64_t sub_24FAAD760()
{
  unint64_t result = qword_269A4C278;
  if (!qword_269A4C278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C278);
  }
  return result;
}

unint64_t sub_24FAAD7B8()
{
  unint64_t result = qword_269A4C280;
  if (!qword_269A4C280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C280);
  }
  return result;
}

uint64_t sub_24FAAD80C()
{
  unint64_t v0 = sub_24FAC0300();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

void sub_24FAAD860(void *a1)
{
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v9 = *(void *)(v1 + 24);
  long long v10 = *(_OWORD *)(v1 + 32);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2C0);
  MEMORY[0x25336BE90](v11, v3);
  if (v11[1])
  {
    id v4 = objc_allocWithZone(MEMORY[0x263F25350]);
    uint64_t v5 = (void *)sub_24FABFFD0();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v4, sel_initWithStringValue_, v5, v8, v9, v10);

    id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F25378]), sel_initWithID_kind_context_, v6, *MEMORY[0x263F25330], *MEMORY[0x263F25300]);
    objc_msgSend(a1, sel_setRequest_, v7);
  }
}

id sub_24FAAD964()
{
  id v2 = *v0;
  objc_msgSend(*v0, sel_setDelegate_, MEMORY[0x25336CC30](v0 + 1));
  swift_unknownObjectRelease();

  return v2;
}

uint64_t sub_24FAAD9E0()
{
  return sub_24FABF8F0();
}

uint64_t sub_24FAADA24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24FAAE618();

  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_24FAADA88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24FAAE618();

  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_24FAADAEC()
{
}

uint64_t sub_24FAADB14()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24FAADCA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24FAADCC8, 0, 0);
}

uint64_t sub_24FAADCC8()
{
  sub_24FAC00D0();
  *(void *)(v0 + 24) = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAADD5C, v2, v1);
}

uint64_t sub_24FAADD5C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 32) = 1;
  id v2 = v1;
  sub_24FABF610();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24FAADE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24FAADE8C, 0, 0);
}

uint64_t sub_24FAADE8C()
{
  sub_24FAC00D0();
  *(void *)(v0 + 24) = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAADF20, v2, v1);
}

uint64_t sub_24FAADF20()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 32) = 0;
  id v2 = v1;
  sub_24FABF610();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

id sub_24FAAE138()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24FAAE1E0()
{
  return type metadata accessor for LockupViewDelegate();
}

uint64_t type metadata accessor for LockupViewDelegate()
{
  uint64_t result = qword_269A4C2A0;
  if (!qword_269A4C2A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24FAAE234()
{
  sub_24FAA40C8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t destroy for LockupWrapper(id *a1)
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for LockupWrapper(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  *a1 = *(void *)a2;
  id v5 = v4;
  swift_unknownObjectWeakCopyInit();
  uint64_t v6 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  a1[4] = v7;
  a1[5] = v8;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LockupWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  swift_unknownObjectWeakCopyAssign();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for LockupWrapper(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unknownObjectWeakTakeInit();
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  return a1;
}

uint64_t assignWithTake for LockupWrapper(uint64_t a1, void *a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *a2;

  swift_unknownObjectWeakTakeAssign();
  *(void *)(a1 + 16) = a2[2];
  swift_release();
  *(void *)(a1 + 24) = a2[3];
  swift_release();
  uint64_t v5 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LockupWrapper(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LockupWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LockupWrapper()
{
  return &type metadata for LockupWrapper;
}

unint64_t sub_24FAAE584()
{
  unint64_t result = qword_269A4C2B8;
  if (!qword_269A4C2B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C2B8);
  }
  return result;
}

uint64_t sub_24FAAE5D8@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_24FABF5E0();
  *a1 = result;
  return result;
}

unint64_t sub_24FAAE618()
{
  unint64_t result = qword_269A4C2C8;
  if (!qword_269A4C2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C2C8);
  }
  return result;
}

uint64_t sub_24FAAE66C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24FAAE6F0(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_24FABF610();
}

uint64_t sub_24FAAE768()
{
  uint64_t v2 = *(void *)(v0 + 32);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_24FA96A38;
  long long v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24FAADE8C, 0, 0);
}

uint64_t sub_24FAAE810()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24FAC0110();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  id v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  id v8 = v0;
  if (v7 == 1)
  {
    sub_24FAAEB34((uint64_t)v3);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_24FAC0100();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_24FAC00A0();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_269A4C2F0;
  *(void *)(v12 + 24) = v6;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t objectdestroyTm_1()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24FAAEA8C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_24FA95A50;
  long long v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24FAADCC8, 0, 0);
}

uint64_t sub_24FAAEB34(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24FAAEB94()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24FAAEBCC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24FA95A50;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269A4C2F8 + dword_269A4C2F8);
  return v6(a1, v4);
}

uint64_t static SettingsRemoteLocalization.upgradeIAPString()()
{
  uint64_t v1 = sub_24FABFEB0();
  v0[7] = v1;
  v0[8] = *(void *)(v1 - 8);
  v0[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FAAED40, 0, 0);
}

uint64_t sub_24FAAED40()
{
  sub_24FABFEA0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  void *v1 = v0;
  v1[1] = sub_24FAAEDF0;
  return sub_24FAAF26C(v0 + 16);
}

uint64_t sub_24FAAEDF0()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24FAAEFF0;
  }
  else {
    uint64_t v2 = sub_24FAAEF04;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24FAAEF04()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  uint64_t v4 = sub_24FABFF40();
  uint64_t v6 = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  swift_task_dealloc();
  int v7 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v7(v4, v6);
}

uint64_t sub_24FAAEFF0()
{
  uint64_t v1 = (void *)v0[11];
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);

  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(unint64_t, unint64_t))v0[1];
  return v2(0xD000000000000017, 0x800000024FAC4640);
}

uint64_t sub_24FAAF08C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_24FAAF118;
  return sub_24FAB12BC();
}

uint64_t sub_24FAAF118(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_24FAAF218(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();

  return MEMORY[0x270EF0D78](a1, a2);
}

uint64_t sub_24FAAF26C(uint64_t a1)
{
  v1[33] = a1;
  sub_24FABF330();
  v1[34] = swift_task_alloc();
  uint64_t v2 = sub_24FABF350();
  v1[35] = v2;
  v1[36] = *(void *)(v2 - 8);
  v1[37] = swift_task_alloc();
  uint64_t v3 = sub_24FABFEF0();
  v1[38] = v3;
  v1[39] = *(void *)(v3 - 8);
  v1[40] = swift_task_alloc();
  uint64_t v4 = sub_24FABFD80();
  v1[41] = v4;
  v1[42] = *(void *)(v4 - 8);
  v1[43] = swift_task_alloc();
  uint64_t v5 = sub_24FABFDE0();
  v1[44] = v5;
  v1[45] = *(void *)(v5 - 8);
  v1[46] = swift_task_alloc();
  uint64_t v6 = sub_24FABFD70();
  v1[47] = v6;
  v1[48] = *(void *)(v6 - 8);
  v1[49] = swift_task_alloc();
  uint64_t v7 = sub_24FABFE30();
  v1[50] = v7;
  v1[51] = *(void *)(v7 - 8);
  v1[52] = swift_task_alloc();
  uint64_t v8 = sub_24FABFF30();
  v1[53] = v8;
  v1[54] = *(void *)(v8 - 8);
  v1[55] = swift_task_alloc();
  uint64_t v9 = sub_24FABFE70();
  v1[56] = v9;
  v1[57] = *(void *)(v9 - 8);
  v1[58] = swift_task_alloc();
  uint64_t v10 = sub_24FABFF10();
  v1[59] = v10;
  v1[60] = *(void *)(v10 - 8);
  v1[61] = swift_task_alloc();
  sub_24FABFDB0();
  v1[62] = swift_task_alloc();
  uint64_t v11 = sub_24FABFE40();
  v1[63] = v11;
  v1[64] = *(void *)(v11 - 8);
  v1[65] = swift_task_alloc();
  v1[66] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  v1[67] = swift_task_alloc();
  uint64_t v12 = sub_24FABF200();
  v1[68] = v12;
  v1[69] = *(void *)(v12 - 8);
  v1[70] = swift_task_alloc();
  v1[71] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FAAF76C, 0, 0);
}

uint64_t sub_24FAAF76C()
{
  if (qword_269A4BA80 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 552);
  uint64_t v2 = *(void *)(v0 + 544);
  uint64_t v3 = *(void *)(v0 + 536);
  *(void *)(v0 + 16) = 0xD000000000000011;
  *(void *)(v0 + 24) = 0x800000024FAC4020;
  *(_OWORD *)(v0 + 32) = xmmword_24FAC18D0;
  *(void *)(v0 + 48) = 49;
  *(void *)(v0 + 56) = 0xE100000000000000;
  uint64_t v4 = swift_bridgeObjectRetain();
  sub_24FAA4FF4(v4, (_OWORD *)(v0 + 16));
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 576) = v6;
  swift_bridgeObjectRelease();
  sub_24FABF1E0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2) == 1)
  {
    uint64_t v8 = *(void *)(v0 + 288);
    uint64_t v7 = *(void *)(v0 + 296);
    uint64_t v9 = *(void *)(v0 + 280);
    sub_24FAAD05C(*(void *)(v0 + 536));
    sub_24FABF320();
    sub_24FAB0EBC(MEMORY[0x263F8EE78]);
    sub_24FAB11A8(&qword_269A4C318, MEMORY[0x263F07A20]);
    sub_24FABF150();
    sub_24FABF340();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    swift_willThrow();

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
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 552) + 32))(*(void *)(v0 + 568), *(void *)(v0 + 536), *(void *)(v0 + 544));
    sub_24FABFE50();
    sub_24FABFE90();
    *(void *)(v0 + 584) = sub_24FABFE80();
    sub_24FABFE00();
    *(void *)(v0 + 592) = sub_24FABFDF0();
    uint64_t v10 = *(void *)(v0 + 568);
    uint64_t v13 = *(void *)(v0 + 560);
    uint64_t v14 = *(void *)(v0 + 552);
    uint64_t v28 = *(void *)(v0 + 544);
    uint64_t v16 = *(void *)(v0 + 408);
    uint64_t v15 = *(void *)(v0 + 416);
    uint64_t v29 = *(void *)(v0 + 400);
    swift_retain();
    sub_24FABFDA0();
    sub_24FABFDD0();
    swift_allocObject();
    *(void *)(v0 + 600) = sub_24FABFDC0();
    id v17 = self;
    uint64_t v18 = self;
    id v19 = v6;
    id v20 = objc_msgSend(v18, sel_currentProcess);
    id v21 = objc_msgSend(v17, sel_ams_configurationWithProcessInfo_bag_, v20, v19);

    sub_24FABFF00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v10, v28);
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v15, *MEMORY[0x263F50838], v29);
    sub_24FABFF20();
    unint64_t v22 = (void *)swift_task_alloc();
    *(void *)(v0 + 608) = v22;
    uint64_t v23 = sub_24FAB11A8(&qword_269A4C320, MEMORY[0x263F50BD8]);
    void *v22 = v0;
    v22[1] = sub_24FAAFD20;
    uint64_t v24 = *(void *)(v0 + 488);
    uint64_t v25 = *(void *)(v0 + 464);
    uint64_t v26 = *(void *)(v0 + 472);
    uint64_t v27 = *(void *)(v0 + 440);
    return MEMORY[0x270F44F60](v25, v27, v24, v26, v23);
  }
}

uint64_t sub_24FAAFD20()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 616) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[54] + 8))(v2[55], v2[53]);
  if (v0) {
    uint64_t v3 = sub_24FAB083C;
  }
  else {
    uint64_t v3 = sub_24FAAFE88;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24FAAFE88()
{
  (*(void (**)(uint64_t, void, uint64_t))(v0[45] + 104))(v0[46], *MEMORY[0x263F50810], v0[44]);
  uint64_t v1 = sub_24FABFE20();
  uint64_t v2 = MEMORY[0x263F50828];
  v0[11] = v1;
  v0[12] = v2;
  __swift_allocate_boxed_opaque_existential_0(v0 + 8);
  sub_24FABFE10();
  sub_24FABFD50();
  sub_24FABFE60();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[78] = (uint64_t)v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24FAAFFAC;
  uint64_t v4 = v0[43];
  return MEMORY[0x270F44EF8](v4, v0 + 13);
}

uint64_t sub_24FAAFFAC()
{
  uint64_t v2 = *(void *)v1 + 104;
  *(void *)(*(void *)v1 + 632) = v0;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_0(v2);
  if (v0) {
    uint64_t v3 = sub_24FAB0A14;
  }
  else {
    uint64_t v3 = sub_24FAB00CC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24FAB00CC()
{
  uint64_t v38 = v0[79];
  uint64_t v1 = v0[66];
  uint64_t v2 = v0[65];
  uint64_t v3 = v0[63];
  uint64_t v4 = v0[64];
  uint64_t v5 = v0[42];
  uint64_t v6 = v0[43];
  uint64_t v7 = v0[41];
  uint64_t v8 = MEMORY[0x263F507D0];
  v0[21] = v7;
  v0[22] = v8;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 16))(boxed_opaque_existential_0, v6, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  sub_24FABFEE0();
  if (v38)
  {
    uint64_t v27 = (void *)v0[72];
    uint64_t v10 = v0[69];
    uint64_t v36 = v0[68];
    uint64_t v37 = v0[71];
    uint64_t v11 = v0[64];
    uint64_t v34 = v0[63];
    uint64_t v35 = v0[66];
    uint64_t v12 = v0[60];
    uint64_t v32 = v0[59];
    uint64_t v33 = v0[61];
    uint64_t v13 = v0[57];
    uint64_t v30 = v0[56];
    uint64_t v31 = v0[58];
    uint64_t v29 = v0[49];
    uint64_t v14 = v0[48];
    uint64_t v28 = v0[47];
    uint64_t v16 = v0[42];
    uint64_t v15 = v0[43];
    uint64_t v17 = v0[41];
    swift_release();
    swift_release();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v29, v28);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v31, v30);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v33, v32);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v35, v34);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v37, v36);
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
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
  else
  {
    uint64_t v21 = v0[39];
    uint64_t v20 = v0[40];
    uint64_t v22 = v0[38];
    v0[80] = sub_24FABFED0();
    uint64_t v23 = MEMORY[0x263F50BC0];
    v0[26] = v22;
    v0[27] = v23;
    uint64_t v24 = __swift_allocate_boxed_opaque_existential_0(v0 + 23);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v21 + 16))(v24, v20, v22);
    v0[31] = &type metadata for SettingsRemoteLocalization.SiriLanguageSource;
    v0[32] = sub_24FAB11F0();
    uint64_t v25 = (void *)swift_task_alloc();
    v0[81] = v25;
    void *v25 = v0;
    v25[1] = sub_24FAB0474;
    uint64_t v26 = v0[73];
    return MEMORY[0x270F45E48](v0 + 23, v0 + 28, v26);
  }
}

uint64_t sub_24FAB0474(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 656) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24FAB0C30;
  }
  else
  {
    *(void *)(v4 + 664) = a1;
    __swift_destroy_boxed_opaque_existential_0(v4 + 224);
    __swift_destroy_boxed_opaque_existential_0(v4 + 184);
    uint64_t v5 = sub_24FAB05AC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24FAB05AC()
{
  uint64_t v18 = v0[83];
  uint64_t v15 = (void *)v0[72];
  uint64_t v27 = v0[71];
  uint64_t v25 = v0[69];
  uint64_t v26 = v0[68];
  uint64_t v24 = v0[66];
  uint64_t v1 = v0[64];
  uint64_t v23 = v0[63];
  uint64_t v2 = v0[60];
  uint64_t v21 = v0[59];
  uint64_t v22 = v0[61];
  uint64_t v3 = v0[57];
  uint64_t v19 = v0[56];
  uint64_t v20 = v0[58];
  uint64_t v4 = v0[48];
  uint64_t v16 = v0[47];
  uint64_t v17 = v0[49];
  uint64_t v5 = v0[42];
  uint64_t v6 = v0[40];
  uint64_t v13 = v0[41];
  uint64_t v14 = v0[43];
  uint64_t v8 = v0[38];
  uint64_t v7 = v0[39];
  uint64_t v9 = (void *)v0[33];
  uint64_t v10 = MEMORY[0x263F50BA8];
  void v9[3] = v0[80];
  v9[4] = v10;
  swift_release();
  swift_release();

  swift_release();
  *uint64_t v9 = v18;
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v20, v19);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v22, v21);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v24, v23);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
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
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24FAB083C()
{
  uint64_t v1 = (void *)v0[72];
  uint64_t v2 = v0[69];
  uint64_t v11 = v0[68];
  uint64_t v12 = v0[71];
  uint64_t v10 = v0[66];
  uint64_t v4 = v0[63];
  uint64_t v3 = v0[64];
  uint64_t v5 = v0[60];
  uint64_t v6 = v0[61];
  uint64_t v7 = v0[59];
  swift_release();
  swift_release();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v10, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v11);
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
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_24FAB0A14()
{
  uint64_t v1 = (void *)v0[72];
  uint64_t v2 = v0[69];
  uint64_t v17 = v0[68];
  uint64_t v18 = v0[71];
  uint64_t v3 = v0[64];
  uint64_t v15 = v0[63];
  uint64_t v16 = v0[66];
  uint64_t v4 = v0[60];
  uint64_t v13 = v0[59];
  uint64_t v14 = v0[61];
  uint64_t v5 = v0[57];
  uint64_t v12 = v0[58];
  uint64_t v11 = v0[56];
  uint64_t v7 = v0[48];
  uint64_t v6 = v0[49];
  uint64_t v8 = v0[47];
  swift_release();
  swift_release();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v12, v11);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v16, v15);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v18, v17);
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
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_24FAB0C30()
{
  uint64_t v13 = (void *)v0[72];
  uint64_t v24 = v0[71];
  uint64_t v22 = v0[69];
  uint64_t v23 = v0[68];
  uint64_t v1 = v0[64];
  uint64_t v20 = v0[63];
  uint64_t v21 = v0[66];
  uint64_t v2 = v0[60];
  uint64_t v18 = v0[59];
  uint64_t v19 = v0[61];
  uint64_t v3 = v0[57];
  uint64_t v16 = v0[56];
  uint64_t v17 = v0[58];
  uint64_t v4 = v0[48];
  uint64_t v14 = v0[47];
  uint64_t v15 = v0[49];
  uint64_t v5 = v0[42];
  uint64_t v6 = v0[40];
  uint64_t v11 = v0[41];
  uint64_t v12 = v0[43];
  uint64_t v7 = v0[38];
  uint64_t v8 = v0[39];
  swift_release();
  swift_release();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v12, v11);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v15, v14);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v19, v18);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v21, v20);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 28));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 23));
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
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

ValueMetadata *type metadata accessor for SettingsRemoteLocalization()
{
  return &type metadata for SettingsRemoteLocalization;
}

unint64_t sub_24FAB0EBC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1FAC58);
  uint64_t v2 = sub_24FAC02E0();
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
    sub_24FAB1244(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24FAB0FE8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24FAAD1FC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    long long v3[2] = v14;
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

unint64_t sub_24FAB0FE8(uint64_t a1, uint64_t a2)
{
  sub_24FAC03B0();
  sub_24FAC0000();
  uint64_t v4 = sub_24FAC03D0();

  return sub_24FAB1060(a1, a2, v4);
}

unint64_t sub_24FAB1060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_24FAC0330() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_24FAC0330() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_24FAC0330()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_24FAB11A8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24FAB11F0()
{
  unint64_t result = qword_269A4C328;
  if (!qword_269A4C328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C328);
  }
  return result;
}

uint64_t sub_24FAB1244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1FAC50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for SettingsRemoteLocalization.SiriLanguageSource()
{
  return &type metadata for SettingsRemoteLocalization.SiriLanguageSource;
}

uint64_t sub_24FAB12BC()
{
  uint64_t v1 = sub_24FABF2D0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24FAB1378, 0, 0);
}

uint64_t sub_24FAB1378()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C040);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_24FAC0EC0;
  id v2 = objc_msgSend(self, sel_sharedPreferences);
  id v3 = objc_msgSend(v2, sel_languageCode);

  if (v3)
  {
    uint64_t v4 = sub_24FABFFE0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v8 = v0[3];
    uint64_t v7 = v0[4];
    uint64_t v9 = v0[2];
    sub_24FABF2C0();
    uint64_t v4 = sub_24FABF2B0();
    uint64_t v6 = v10;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  *(void *)(v1 + 32) = v4;
  *(void *)(v1 + 40) = v6;
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(uint64_t))v0[1];
  return v11(v1);
}

uint64_t sub_24FAB14B0()
{
  return sub_24FABF790();
}

uint64_t sub_24FAB14D4(uint64_t a1)
{
  uint64_t v2 = sub_24FABF6E0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_24FABF7A0();
}

uint64_t sub_24FAB159C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24FABF170();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24FABF2D0();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_24FABFFC0();
  MEMORY[0x270FA5388](v9 - 8);
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  swift_allocObject();
  sub_24FAA0B84();
  sub_24FABED20(&qword_269A4C348, (void (*)(uint64_t))type metadata accessor for GenerativeAssistantSettingsViewModel);
  *(void *)a2 = sub_24FABF700();
  *(void *)(a2 + 8) = v10;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C350);
  sub_24FABFC40();
  uint64_t v11 = v21;
  *(_OWORD *)(a2 + 16) = v20;
  *(void *)(a2 + 32) = v11;
  LOBYTE(v18) = 0;
  sub_24FABFC40();
  uint64_t v12 = *((void *)&v20 + 1);
  *(unsigned char *)(a2 + 40) = v20;
  *(void *)(a2 + 48) = v12;
  uint64_t v13 = sub_24FABF3E0();
  uint64_t v14 = MEMORY[0x263F406F0];
  *(void *)(a2 + 80) = v13;
  *(void *)(a2 + 88) = v14;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(a2 + 56));
  sub_24FABF3D0();
  objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LockupViewDelegate()), sel_init);
  sub_24FABED20(&qword_269A4C358, (void (*)(uint64_t))type metadata accessor for LockupViewDelegate);
  *(void *)(a2 + 96) = sub_24FABF700();
  *(void *)(a2 + 104) = v15;
  type metadata accessor for GenerativeAssistantSettingsView();
  sub_24FABFF70();
  sub_24FABF2C0();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06D18], v4);
  sub_24FABF1A0();
  sub_24FABF160();
  uint64_t result = swift_release();
  *(void *)(a2 + 8) = a1;
  return result;
}

uint64_t sub_24FAB1900(uint64_t a1)
{
  return sub_24FAB1984(a1, qword_269A4E248);
}

uint64_t sub_24FAB192C(uint64_t a1)
{
  return sub_24FAB1984(a1, qword_269A4E260);
}

uint64_t sub_24FAB1958(uint64_t a1)
{
  return sub_24FAB1984(a1, qword_269A4E278);
}

uint64_t sub_24FAB1984(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24FABF440();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24FABF420();
}

uint64_t static GenerativeAssistantSettingsView.available()()
{
  uint64_t v0 = sub_24FABF3E0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24FABF3A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FABF390();
  char v8 = sub_24FABF370();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v8)
  {
    sub_24FABF3D0();
    char v9 = sub_24FABF3B0();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    char v10 = v9 ^ 1;
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

Swift::Void __swiftcall GenerativeAssistantSettingsView.dismissed(with:request:)(GenerativeAssistantSettings::EnablementUIDismissType with, GenerativeAssistantSettings::RequestType_optional request)
{
  uint64_t v3 = v2;
  uint64_t v4 = (unsigned __int8 *)with;
  uint64_t v5 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  char v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v9 = *v4;
  if (qword_269A4BA88 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24FABF440();
  __swift_project_value_buffer(v10, (uint64_t)qword_269A4E248);
  uint64_t v11 = sub_24FABF410();
  os_log_type_t v12 = sub_24FAC0140();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v27 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = v14;
    v30[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315650;
    uint64_t v28 = sub_24FA86AD8(0xD00000000000001FLL, 0x800000024FAC27A0, v30);
    sub_24FAC01A0();
    uint64_t v26 = v3;
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v28 = sub_24FA86AD8(0xD000000000000018, 0x800000024FAC46E0, v30);
    sub_24FAC01A0();
    *(_WORD *)(v13 + 22) = 2080;
    LOBYTE(v28) = v9;
    uint64_t v16 = sub_24FABFFF0();
    uint64_t v28 = sub_24FA86AD8(v16, v17, v30);
    uint64_t v3 = v26;
    sub_24FAC01A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24FA83000, v11, v12, "%s.%s: dismissType: %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    uint64_t v18 = v15;
    char v8 = v27;
    MEMORY[0x25336CB50](v18, -1, -1);
    MEMORY[0x25336CB50](v13, -1, -1);
  }

  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v30[0]) = 0;
  swift_retain();
  sub_24FABF610();
  if (v9 >= 2)
  {
    if (v9 == 2)
    {
      sub_24FA95C38((uint64_t)v3, (uint64_t)v8);
      unint64_t v19 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v20 = swift_allocObject();
      sub_24FAB3B18((uint64_t)v8, v20 + v19);
      uint64_t v21 = v3[2];
      uint64_t v22 = v3[3];
      uint64_t v23 = v3[4];
      v30[0] = v21;
      v30[1] = v22;
      v30[2] = v23;
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = sub_24FAB3B7C;
      *(void *)(v24 + 24) = v20;
      uint64_t v28 = (uint64_t)sub_24FA8FF5C;
      uint64_t v29 = v24;
      sub_24FABC9D4(v21);
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C340);
      sub_24FABFC60();
      sub_24FABC9E4(v30[0]);
    }
    else
    {
      swift_retain();
      sub_24FA9FEA4();
    }
    swift_release();
  }
}

uint64_t type metadata accessor for GenerativeAssistantSettingsView()
{
  uint64_t result = qword_269A4C430;
  if (!qword_269A4C430) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t GenerativeAssistantSettingsView.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24FABF170();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24FABF2D0();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_24FABFFC0();
  MEMORY[0x270FA5388](v7 - 8);
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  swift_allocObject();
  sub_24FAA0B84();
  sub_24FABED20(&qword_269A4C348, (void (*)(uint64_t))type metadata accessor for GenerativeAssistantSettingsViewModel);
  *(void *)a1 = sub_24FABF700();
  *(void *)(a1 + 8) = v8;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C350);
  sub_24FABFC40();
  uint64_t v9 = v19;
  *(_OWORD *)(a1 + 16) = v18;
  *(void *)(a1 + 32) = v9;
  LOBYTE(v16) = 0;
  sub_24FABFC40();
  uint64_t v10 = *((void *)&v18 + 1);
  *(unsigned char *)(a1 + 40) = v18;
  *(void *)(a1 + 48) = v10;
  uint64_t v11 = sub_24FABF3E0();
  uint64_t v12 = MEMORY[0x263F406F0];
  *(void *)(a1 + 80) = v11;
  *(void *)(a1 + 88) = v12;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(a1 + 56));
  sub_24FABF3D0();
  objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LockupViewDelegate()), sel_init);
  sub_24FABED20(&qword_269A4C358, (void (*)(uint64_t))type metadata accessor for LockupViewDelegate);
  *(void *)(a1 + 96) = sub_24FABF700();
  *(void *)(a1 + 104) = v13;
  type metadata accessor for GenerativeAssistantSettingsView();
  sub_24FABFF70();
  sub_24FABF2C0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F06D18], v2);
  sub_24FABF1A0();
  return sub_24FABF160();
}

uint64_t GenerativeAssistantSettingsView.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24FABF170();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24FABF2D0();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_24FABFFC0();
  MEMORY[0x270FA5388](v9 - 8);
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  swift_allocObject();
  sub_24FAA0B84();
  sub_24FABED20(&qword_269A4C348, (void (*)(uint64_t))type metadata accessor for GenerativeAssistantSettingsViewModel);
  *(void *)a2 = sub_24FABF700();
  *(void *)(a2 + 8) = v10;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C350);
  sub_24FABFC40();
  uint64_t v11 = v21;
  *(_OWORD *)(a2 + 16) = v20;
  *(void *)(a2 + 32) = v11;
  LOBYTE(v18) = 0;
  sub_24FABFC40();
  uint64_t v12 = *((void *)&v20 + 1);
  *(unsigned char *)(a2 + 40) = v20;
  *(void *)(a2 + 48) = v12;
  uint64_t v13 = sub_24FABF3E0();
  uint64_t v14 = MEMORY[0x263F406F0];
  *(void *)(a2 + 80) = v13;
  *(void *)(a2 + 88) = v14;
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)(a2 + 56));
  sub_24FABF3D0();
  objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LockupViewDelegate()), sel_init);
  sub_24FABED20(&qword_269A4C358, (void (*)(uint64_t))type metadata accessor for LockupViewDelegate);
  *(void *)(a2 + 96) = sub_24FABF700();
  *(void *)(a2 + 104) = v15;
  type metadata accessor for GenerativeAssistantSettingsView();
  sub_24FABFF70();
  sub_24FABF2C0();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F06D18], v4);
  sub_24FABF1A0();
  sub_24FABF160();
  qword_269A4E290 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t GenerativeAssistantSettingsView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v78 = a1;
  uint64_t v2 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v3 = v2 - 8;
  uint64_t v75 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v76 = v4;
  uint64_t v77 = (uint64_t)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_24FABF140();
  uint64_t v5 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v62 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t OpaqueTypeConformance2 = sub_24FABF200();
  uint64_t v67 = *(void *)(OpaqueTypeConformance2 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](OpaqueTypeConformance2);
  id v56 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v65 = (char *)&v55 - v9;
  uint64_t v10 = sub_24FABFD40();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C360);
  uint64_t v59 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C368);
  uint64_t v60 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v58 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C370);
  uint64_t v70 = *(void *)(v17 - 8);
  uint64_t v71 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v80 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C378);
  uint64_t v73 = *(void *)(v19 - 8);
  uint64_t v74 = v19;
  MEMORY[0x270FA5388](v19);
  id v72 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C380);
  sub_24FABCEC4(&qword_269A4C388, &qword_269A4C380, (void (*)(void))sub_24FABCA18);
  uint64_t v57 = v15;
  sub_24FABFAF0();
  strcpy(v13, "com.apple.siri");
  v13[15] = -18;
  uint64_t v21 = *MEMORY[0x263F67E50];
  uint64_t v63 = v11;
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 104);
  uint64_t v64 = v10;
  v22(v13, v21, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C3F0);
  uint64_t v23 = sub_24FABF190();
  uint64_t v24 = *(void *)(v23 - 8);
  unint64_t v25 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v26 = swift_allocObject();
  long long v55 = xmmword_24FAC0EC0;
  *(_OWORD *)(v26 + 16) = xmmword_24FAC0EC0;
  uint64_t v27 = *(int *)(v3 + 44);
  uint64_t v28 = (uint64_t)v56;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v24 + 16))(v26 + v25, v1 + v27, v23);
  LOBYTE(v84) = 0;
  GenerativeAssistantSettingsDestination.fullURL.getter(v28);
  if (qword_269A4BA48 != -1) {
    swift_once();
  }
  uint64_t v79 = v1;
  uint64_t v29 = v62;
  sub_24FABF130();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BC30);
  unint64_t v30 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = v55;
  unint64_t v32 = v31 + v30;
  uint64_t v33 = v66;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 16))(v32, v29, v66);
  uint64_t v34 = v65;
  sub_24FABF1F0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v29, v33);
  uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
  uint64_t v36 = OpaqueTypeConformance2;
  v35(v28, OpaqueTypeConformance2);
  uint64_t v37 = sub_24FA9120C(&qword_269A4C3F8, &qword_269A4C360);
  uint64_t v38 = v58;
  uint64_t v39 = v61;
  uint64_t v40 = v57;
  sub_24FABFB60();
  swift_bridgeObjectRelease();
  v35((uint64_t)v34, v36);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v13, v64);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v40, v39);
  uint64_t v84 = v39;
  uint64_t v85 = v37;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v41 = v69;
  sub_24FABFB50();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v38, v41);
  uint64_t v42 = v79;
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  sub_24FABED20(&qword_269A4C348, (void (*)(uint64_t))type metadata accessor for GenerativeAssistantSettingsViewModel);
  sub_24FABF710();
  swift_getKeyPath();
  sub_24FABF720();
  swift_release();
  swift_release();
  uint64_t v43 = v77;
  sub_24FA95C38(v42, v77);
  unint64_t v44 = (*(unsigned __int8 *)(v75 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
  uint64_t v45 = swift_allocObject();
  sub_24FAB3B18(v43, v45 + v44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C400);
  uint64_t v82 = v41;
  uint64_t v83 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_24FABCD8C();
  uint64_t v46 = v71;
  uint64_t v47 = v72;
  uint64_t v48 = v80;
  sub_24FABFC00();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v48, v46);
  sub_24FA95C38(v79, v43);
  uint64_t v49 = swift_allocObject();
  sub_24FAB3B18(v43, v49 + v44);
  uint64_t v51 = v73;
  uint64_t v50 = v74;
  uint64_t v52 = v78;
  (*(void (**)(uint64_t, char *, uint64_t))(v73 + 16))(v78, v47, v74);
  uint64_t v53 = (void *)(v52 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A4C428) + 36));
  *uint64_t v53 = 0;
  v53[1] = 0;
  v53[2] = sub_24FABCF44;
  v53[3] = v49;
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v47, v50);
}

uint64_t sub_24FAB3114@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v64 = a1;
  uint64_t v3 = sub_24FAC0110();
  uint64_t v62 = *(void *)(v3 - 8);
  uint64_t v63 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v61 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v60 = *(void *)(v5 - 8);
  uint64_t v59 = *(void *)(v60 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v58 = (uint64_t)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24FABF820();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C3C8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C3B0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C3A8);
  uint64_t v50 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C3A0);
  uint64_t v55 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v66 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C450);
  uint64_t v56 = *(void *)(v20 - 8);
  uint64_t v57 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v51 = (char *)&v48 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C398) - 8;
  MEMORY[0x270FA5388](v54);
  uint64_t v53 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FAB4144(v2, (uint64_t)v13);
  uint64_t KeyPath = swift_getKeyPath();
  sub_24FA897D4((uint64_t)v13, (uint64_t)v16, &qword_269A4C3C8);
  uint64_t v24 = &v16[*(int *)(v14 + 36)];
  *(void *)uint64_t v24 = KeyPath;
  v24[8] = 0;
  sub_24FA89838((uint64_t)v13, &qword_269A4C3C8);
  sub_24FABF810();
  unint64_t v25 = sub_24FABCBE0();
  uint64_t v26 = sub_24FABED20(&qword_269A4C3E0, MEMORY[0x263F19708]);
  sub_24FABFB90();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_24FA89838((uint64_t)v16, &qword_269A4C3B0);
  sub_24FABF880();
  uint64_t v69 = v14;
  uint64_t v70 = v7;
  unint64_t v71 = v25;
  uint64_t v72 = v26;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v28 = v49;
  sub_24FABFBB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v18, v28);
  uint64_t v50 = sub_24FABF880();
  uint64_t v29 = v65;
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  sub_24FABED20(&qword_269A4C348, (void (*)(uint64_t))type metadata accessor for GenerativeAssistantSettingsViewModel);
  sub_24FABF710();
  swift_getKeyPath();
  sub_24FABF720();
  swift_release();
  swift_release();
  uint64_t v67 = v28;
  uint64_t v68 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v30 = v52;
  uint64_t v31 = v51;
  unint64_t v32 = v66;
  sub_24FABFBF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v32, v30);
  uint64_t v33 = v58;
  sub_24FA95C38(v29, v58);
  unint64_t v34 = (*(unsigned __int8 *)(v60 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  uint64_t v66 = (char *)(v34 + v59);
  uint64_t v35 = swift_allocObject();
  sub_24FAB3B18(v33, v35 + v34);
  uint64_t v36 = v61;
  sub_24FAC00F0();
  uint64_t v37 = (uint64_t)v53;
  uint64_t v38 = &v53[*(int *)(v54 + 44)];
  uint64_t v39 = sub_24FABF6F0();
  uint64_t v41 = v62;
  uint64_t v40 = v63;
  (*(void (**)(char *, char *, uint64_t))(v62 + 16))(&v38[*(int *)(v39 + 20)], v36, v63);
  *(void *)uint64_t v38 = &unk_269A4C460;
  *((void *)v38 + 1) = v35;
  uint64_t v43 = v56;
  uint64_t v42 = v57;
  (*(void (**)(uint64_t, char *, uint64_t))(v56 + 16))(v37, v31, v57);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v36, v40);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v42);
  sub_24FA95C38(v65, v33);
  uint64_t v44 = swift_allocObject();
  sub_24FAB3B18(v33, v44 + v34);
  uint64_t v45 = v64;
  sub_24FA897D4(v37, v64, &qword_269A4C398);
  uint64_t v46 = (uint64_t (**)())(v45 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A4C380) + 36));
  *uint64_t v46 = sub_24FABDE04;
  v46[1] = (uint64_t (*)())v44;
  v46[2] = 0;
  v46[3] = 0;
  return sub_24FA89838(v37, &qword_269A4C398);
}

uint64_t sub_24FAB3A18@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24FAB3A9C()
{
  return sub_24FABF610();
}

uint64_t sub_24FAB3B18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GenerativeAssistantSettingsView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24FAB3B7C()
{
  return sub_24FABE7F4((uint64_t)&unk_270122498, (uint64_t)&unk_269A4C700, (uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_24FAB7ED0);
}

uint64_t sub_24FAB3BB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = a1;
  uint64_t v28 = a1;
  uint64_t v36 = a2;
  uint64_t v3 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v34 = *(void *)(v35 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v33 = (uint64_t)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24FABF9D0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C410);
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C448);
  uint64_t v31 = *(void *)(v11 - 8);
  uint64_t v32 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37[3] = v3;
  v37[4] = (uint64_t)&protocol witness table for GenerativeAssistantSettingsView;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v37);
  sub_24FA95C38(v2, (uint64_t)boxed_opaque_existential_0);
  __int16 v38 = 515;
  uint64_t v15 = sub_24FABF730();
  LOBYTE(v2) = sub_24FABFA90();
  sub_24FABDBB4((uint64_t)v37, (uint64_t)v39);
  v39[6] = v15;
  char v40 = v2;
  sub_24FABDC10((uint64_t)v37);
  sub_24FABF8A0();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C418);
  uint64_t v17 = sub_24FABCEC4(&qword_269A4C420, &qword_269A4C418, (void (*)(void))sub_24FA8F794);
  uint64_t v18 = MEMORY[0x263F19E90];
  sub_24FABFBC0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_24FA89838((uint64_t)v39, &qword_269A4C418);
  v39[0] = v16;
  v39[1] = v5;
  v39[2] = v17;
  v39[3] = v18;
  swift_getOpaqueTypeConformance2();
  uint64_t v19 = v29;
  sub_24FABFBE0();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v19);
  uint64_t v20 = v33;
  sub_24FA95C38(v28, v33);
  unint64_t v21 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  uint64_t v22 = swift_allocObject();
  sub_24FAB3B18(v20, v22 + v21);
  uint64_t v24 = v31;
  uint64_t v23 = v32;
  uint64_t v25 = v36;
  (*(void (**)(uint64_t, char *, uint64_t))(v31 + 16))(v36, v13, v32);
  uint64_t v26 = (void *)(v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A4C400) + 36));
  void *v26 = 0;
  v26[1] = 0;
  v26[2] = sub_24FABDC68;
  v26[3] = v22;
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v13, v23);
}

uint64_t sub_24FAB4000()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C340);
  sub_24FABFC50();
  if (v2)
  {
    uint64_t v0 = swift_retain();
    v2(v0);
    sub_24FABC9E4((uint64_t)v2);
    sub_24FABC9E4((uint64_t)v2);
  }
  return sub_24FABFC60();
}

uint64_t sub_24FAB40B0()
{
  return swift_release();
}

uint64_t sub_24FAB4144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v120 = a2;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C468);
  MEMORY[0x270FA5388](v100);
  uint64_t v99 = (uint64_t)&v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C470);
  uint64_t v102 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  uint64_t v101 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C478);
  MEMORY[0x270FA5388](v109);
  v105 = (char *)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C480);
  MEMORY[0x270FA5388](v104);
  uint64_t v103 = (char *)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C488);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v119 = (uint64_t)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v107 = (char *)&v94 - v10;
  uint64_t v11 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v114 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v98 = (uint64_t)&v94 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v113 = (uint64_t)&v94 - v14;
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C490);
  uint64_t v117 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108);
  v116 = (char *)&v94 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C498);
  uint64_t v110 = *(void *)(v123 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v123);
  v118 = (char *)&v94 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v112 = (char *)&v94 - v19;
  MEMORY[0x270FA5388](v18);
  v125 = (char *)&v94 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4A0);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v97 = (uint64_t)&v94 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v96 = (uint64_t)&v94 - v24;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4A8);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  uint64_t v95 = (uint64_t)&v94 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v94 = (uint64_t)&v94 - v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4B0);
  uint64_t v30 = MEMORY[0x270FA5388](v29 - 8);
  uint64_t v32 = (char *)&v94 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v124 = (uint64_t)&v94 - v33;
  uint64_t v34 = sub_24FABF190();
  MEMORY[0x270FA5388](v34 - 8);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4B8);
  uint64_t v36 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  __int16 v38 = (char *)&v94 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4C0);
  uint64_t v40 = MEMORY[0x270FA5388](v39 - 8);
  uint64_t v42 = (char *)&v94 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v40);
  uint64_t v44 = (char *)&v94 - v43;
  uint64_t v126 = a1;
  sub_24FABF160();
  uint64_t v127 = sub_24FABFB30();
  uint64_t v128 = v45;
  char v129 = v46 & 1;
  uint64_t v130 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4C8);
  sub_24FABDE24();
  sub_24FABFD20();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  sub_24FAB5338(v127, 1, &qword_269A4C6E0, &qword_269A4C4B8, &qword_269A4C4C0, (uint64_t)v42);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v35);
  v121 = v44;
  v122 = v42;
  sub_24FA89894((uint64_t)v42, (uint64_t)v44, &qword_269A4C4C0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  if (v127 == 1)
  {
    uint64_t v48 = v94;
    sub_24FAB5730(v94);
    uint64_t v49 = v96;
    sub_24FAB5C30(v96);
    uint64_t v50 = v95;
    sub_24FA897D4(v48, v95, &qword_269A4C4A8);
    uint64_t v51 = v97;
    sub_24FA897D4(v49, v97, &qword_269A4C4A0);
    sub_24FA897D4(v50, (uint64_t)v32, &qword_269A4C4A8);
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C568);
    sub_24FA897D4(v51, (uint64_t)&v32[*(int *)(v52 + 48)], &qword_269A4C4A0);
    sub_24FA89838(v49, &qword_269A4C4A0);
    sub_24FA89838(v48, &qword_269A4C4A8);
    sub_24FA89838(v51, &qword_269A4C4A0);
    sub_24FA89838(v50, &qword_269A4C4A8);
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4F8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v32, 0, 1, v53);
    uint64_t v54 = sub_24FA89894((uint64_t)v32, v124, &qword_269A4C4B0);
  }
  else
  {
    uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4F8);
    uint64_t v54 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v124, 1, 1, v55);
  }
  uint64_t v56 = v110;
  uint64_t v57 = (uint64_t)v32;
  uint64_t v58 = v108;
  MEMORY[0x270FA5388](v54);
  sub_24FABF880();
  uint64_t v131 = sub_24FABFB20();
  uint64_t v132 = v59;
  char v133 = v60 & 1;
  uint64_t v134 = v61;
  sub_24FAB62FC((uint64_t)&v127);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C500);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C508);
  sub_24FABDF00();
  sub_24FABDF98();
  uint64_t v62 = v116;
  sub_24FABFD00();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v63 = v113;
  sub_24FA95C38(a1, v113);
  unint64_t v64 = (*(unsigned __int8 *)(v114 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v114 + 80);
  uint64_t v65 = swift_allocObject();
  sub_24FAB3B18(v63, v65 + v64);
  sub_24FABE020();
  uint64_t v66 = v112;
  sub_24FABFC10();
  swift_release();
  (*(void (**)(char *, uint64_t))(v117 + 8))(v62, v58);
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v125, v66, v123);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  if (v127 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_24FABF600();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v67 = v128;
    swift_bridgeObjectRelease();
    uint64_t v68 = v98;
    sub_24FA95C38(a1, v98);
    if (v67)
    {
      uint64_t v69 = *(void **)(v68 + 104);
      swift_getKeyPath();
      swift_getKeyPath();
      id v70 = v69;
      sub_24FABF600();

      swift_release();
      swift_release();
      char v71 = v127;
      uint64_t v72 = sub_24FA95C9C(v68);
      uint64_t v73 = (uint64_t)v105;
      uint64_t v74 = v107;
      uint64_t v75 = v124;
      if ((v71 & 1) == 0)
      {
        MEMORY[0x270FA5388](v72);
        sub_24FAAE584();
        uint64_t v76 = (uint64_t)v103;
        sub_24FABFD10();
        uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C550);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v76, 0, 1, v77);
LABEL_11:
        sub_24FA897D4(v76, v73, &qword_269A4C480);
        swift_storeEnumTagMultiPayload();
        sub_24FABE148(&qword_269A4C540, &qword_269A4C480, (void (*)(void))sub_24FABE1B4);
        sub_24FABE234();
        sub_24FABF990();
        sub_24FA89838(v76, &qword_269A4C480);
        uint64_t v81 = (uint64_t)v74;
        goto LABEL_12;
      }
    }
    else
    {
      sub_24FA95C9C(v68);
      uint64_t v73 = (uint64_t)v105;
      uint64_t v74 = v107;
      uint64_t v75 = v124;
    }
    uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C550);
    uint64_t v76 = (uint64_t)v103;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56))(v103, 1, 1, v82);
    goto LABEL_11;
  }
  sub_24FAB68B8(v99);
  sub_24FABE0A8();
  uint64_t v78 = v101;
  sub_24FABFD20();
  uint64_t v79 = v102;
  uint64_t v80 = v106;
  (*(void (**)(char *, char *, uint64_t))(v102 + 16))(v105, v78, v106);
  swift_storeEnumTagMultiPayload();
  sub_24FABE148(&qword_269A4C540, &qword_269A4C480, (void (*)(void))sub_24FABE1B4);
  sub_24FABE234();
  uint64_t v81 = (uint64_t)v107;
  sub_24FABF990();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v78, v80);
  uint64_t v75 = v124;
LABEL_12:
  uint64_t v83 = (uint64_t)v122;
  sub_24FA897D4((uint64_t)v121, (uint64_t)v122, &qword_269A4C4C0);
  sub_24FA897D4(v75, v57, &qword_269A4C4B0);
  uint64_t v84 = v56;
  uint64_t v111 = v57;
  uint64_t v85 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
  uint64_t v86 = v118;
  uint64_t v87 = v123;
  v85(v118, v125, v123);
  uint64_t v88 = v119;
  sub_24FA897D4(v81, v119, &qword_269A4C488);
  uint64_t v89 = v83;
  uint64_t v90 = v120;
  sub_24FA897D4(v89, v120, &qword_269A4C4C0);
  uint64_t v91 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_269A4C560);
  sub_24FA897D4(v57, v90 + v91[12], &qword_269A4C4B0);
  v85((char *)(v90 + v91[16]), v86, v87);
  sub_24FA897D4(v88, v90 + v91[20], &qword_269A4C488);
  sub_24FA89838(v81, &qword_269A4C488);
  uint64_t v92 = *(void (**)(char *, uint64_t))(v84 + 8);
  v92(v125, v87);
  sub_24FA89838(v124, &qword_269A4C4B0);
  sub_24FA89838((uint64_t)v121, &qword_269A4C4C0);
  sub_24FA89838(v88, &qword_269A4C488);
  v92(v86, v87);
  sub_24FA89838(v111, &qword_269A4C4B0);
  return sub_24FA89838((uint64_t)v122, &qword_269A4C4C0);
}

id sub_24FAB5338@<X0>(unint64_t a1@<X0>, int a2@<W1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  int v13 = a1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v28 = a2;
  uint64_t v27 = v15;
  if (v13 == 9)
  {
    if (a2 != 9) {
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v18 = a4;
    uint64_t v19 = a6;
    uint64_t v20 = sub_24FABFC30();
LABEL_9:
    uint64_t v22 = v20;
    uint64_t v23 = sub_24FABFD30();
    uint64_t v29 = v22;
    uint64_t v30 = v23;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C668);
    sub_24FA9120C(&qword_269A4C670, &qword_269A4C668);
    uint64_t v24 = sub_24FABFCC0();
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(v18);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(v17, v6, v25);
    swift_release();
    *(void *)&v17[*(int *)(v27 + 36)] = v24;
    sub_24FA897D4((uint64_t)v17, v19, a3);
    swift_release();
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(a5);
    *(unsigned char *)(v19 + *(int *)(v26 + 52)) = v28;
    return (id)sub_24FA89838((uint64_t)v17, a3);
  }
  if a2 != 9 && (sub_24FA9166C(a1, a2)) {
    goto LABEL_6;
  }
LABEL_7:
  id result = objc_msgSend(self, sel_tableCellGroupedBackgroundColor);
  if (result)
  {
    uint64_t v18 = a4;
    uint64_t v19 = a6;
    uint64_t v20 = MEMORY[0x25336BDE0]();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

id sub_24FAB555C@<X0>(unint64_t a1@<X0>, unsigned __int8 a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v12 = *(void *)(v3 + 8);
  uint64_t v13 = *(void *)v3;
  char v11 = *(unsigned char *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v15 = *(void *)(v3 + 48);
  uint64_t v16 = *(void *)(v3 + 40);
  char v14 = *(unsigned char *)(v3 + 56);
  uint64_t v6 = *(void *)(v3 + 64);
  uint64_t v7 = *(void *)(v3 + 72);
  uint64_t v8 = *(void *)(v3 + 88);
  char v19 = *(unsigned char *)(v3 + 80);
  uint64_t v17 = *(void *)(v3 + 32);
  if (a1 == 9)
  {
    if (a2 != 9) {
      goto LABEL_7;
    }
LABEL_6:
    sub_24FABFC30();
LABEL_9:
    sub_24FABFD30();
    swift_retain_n();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C668);
    sub_24FA9120C(&qword_269A4C670, &qword_269A4C668);
    uint64_t v10 = sub_24FABFCC0();
    sub_24FABEA88(v3);
    swift_release();
    id result = (id)swift_release_n();
    *(void *)a3 = v13;
    *(void *)(a3 + 8) = v12;
    *(unsigned char *)(a3 + 16) = v11 & 1;
    *(void *)(a3 + 24) = v5;
    *(void *)(a3 + 32) = v17;
    *(void *)(a3 + 40) = v16;
    *(void *)(a3 + 48) = v15;
    *(unsigned char *)(a3 + 56) = v14 & 1;
    *(void *)(a3 + 64) = v6;
    *(void *)(a3 + 72) = v7;
    *(unsigned char *)(a3 + 80) = v19 & 1;
    *(void *)(a3 + 88) = v8;
    *(void *)(a3 + 96) = v10;
    *(unsigned char *)(a3 + 104) = a2;
    return result;
  }
  if (a2 != 9 && (sub_24FA9166C(a1, a2) & 1) != 0) {
    goto LABEL_6;
  }
LABEL_7:
  id result = objc_msgSend(self, sel_tableCellGroupedBackgroundColor);
  if (result)
  {
    MEMORY[0x25336BDE0]();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_24FAB5730@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD40) - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v39 = (uint64_t *)((char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v38 = sub_24FABF6E0();
  uint64_t v45 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C5A8);
  MEMORY[0x270FA5388](v46);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C5B0);
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v40 = v1;
  uint64_t v41 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = v1;
  sub_24FABF880();
  uint64_t v51 = sub_24FABFB20();
  uint64_t v52 = v10;
  char v53 = v11 & 1;
  uint64_t v54 = v12;
  sub_24FAB7A48(v1, (uint64_t)v48);
  uint64_t v13 = v48[0];
  uint64_t v14 = v48[1];
  uint64_t v15 = v48[2];
  uint64_t v16 = v48[3];
  int v37 = v50;
  uint64_t v17 = v49;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v19 = swift_getKeyPath();
  uint64_t v36 = v5;
  sub_24FABF6D0();
  uint64_t v20 = *(int *)(v2 + 36);
  uint64_t v21 = v39;
  uint64_t v22 = v5;
  uint64_t v23 = v38;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))((char *)v39 + v20, v22, v38);
  *uint64_t v21 = v19;
  uint64_t v24 = (uint64_t)v21;
  sub_24FA897D4((uint64_t)v21, (uint64_t)&v7[*(int *)(v46 + 36)], &qword_269A4BD40);
  *(void *)uint64_t v7 = v13;
  *((void *)v7 + 1) = v14;
  *((void *)v7 + 2) = v15;
  *((void *)v7 + 3) = v16;
  v7[32] = v17;
  LOBYTE(v21) = v37;
  v7[33] = v37;
  *((void *)v7 + 5) = KeyPath;
  *((void *)v7 + 6) = 0;
  v7[56] = 1;
  sub_24FABE3F8(v13, v14, v15, v16, v17, (char)v21);
  swift_retain();
  sub_24FA89838(v24, &qword_269A4BD40);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v36, v23);
  sub_24FABE498(v13, v14, v15, v16, v17, (char)v21);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C5B8);
  sub_24FA9120C(&qword_269A4C5C0, &qword_269A4C5B8);
  sub_24FABE538();
  uint64_t v25 = v41;
  sub_24FABFD00();
  __swift_project_boxed_opaque_existential_1((void *)(v40 + 56), *(void *)(v40 + 80));
  LOBYTE(v24) = sub_24FABF360();
  uint64_t v26 = swift_getKeyPath();
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 16) = (v24 & 1) == 0;
  uint64_t v28 = v42;
  uint64_t v29 = v44;
  uint64_t v30 = v25;
  uint64_t v31 = v25;
  uint64_t v32 = v43;
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 16))(v44, v31, v43);
  uint64_t v33 = (uint64_t *)(v29 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4A8) + 36));
  uint64_t *v33 = v26;
  v33[1] = (uint64_t)sub_24FABE794;
  v33[2] = v27;
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v30, v32);
}

uint64_t sub_24FAB5C30@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  uint64_t v2 = swift_release();
  if (v6 == 1)
  {
    MEMORY[0x270FA5388](v2);
    sub_24FABF880();
    sub_24FABFB20();
    sub_24FABF880();
    sub_24FABFB20();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C578);
    sub_24FA9120C(&qword_269A4C580, &qword_269A4C578);
    sub_24FABFD00();
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C570);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(a1, 0, 1, v3);
  }
  else
  {
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C570);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a1, 1, 1, v5);
  }
}

uint64_t sub_24FAB5E9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C6C8);
  MEMORY[0x270FA5388](v18);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C6D0);
  uint64_t v5 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C520);
  uint64_t v8 = MEMORY[0x270FA5388](v17);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v16 - v11;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  int v13 = v21;
  uint64_t v20 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4F0);
  sub_24FA9120C(&qword_269A4C4E8, &qword_269A4C4F0);
  uint64_t v14 = (void (**)(char *, uint64_t))(v5 + 8);
  sub_24FABFD10();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  if (v13 == 1) {
    sub_24FAB5338(v21, 3, &qword_269A4C6D8, &qword_269A4C6D0, &qword_269A4C520, (uint64_t)v10);
  }
  else {
    sub_24FAB5338(v21, 2, &qword_269A4C6D8, &qword_269A4C6D0, &qword_269A4C520, (uint64_t)v10);
  }
  (*v14)(v7, v16);
  sub_24FA89894((uint64_t)v10, (uint64_t)v12, &qword_269A4C520);
  sub_24FA897D4((uint64_t)v12, (uint64_t)v4, &qword_269A4C520);
  swift_storeEnumTagMultiPayload();
  sub_24FA9120C(&qword_269A4C518, &qword_269A4C520);
  sub_24FABF990();
  return sub_24FA89838((uint64_t)v12, &qword_269A4C520);
}

double sub_24FAB62FC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24FABF190();
  MEMORY[0x270FA5388](v2 - 8);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  sub_24FABF160();
  sub_24FABFB30();
  sub_24FABF990();
  double result = *(double *)&v4;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_24FAB648C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if ((v1 & 1) == 0)
  {
    sub_24FAB6520();
    return _s27GenerativeAssistantSettings0abC12UserDefaultsC18resetDeclineCountsyyFZ_0();
  }
  return result;
}

uint64_t sub_24FAB6520()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v17[-v8];
  uint64_t v10 = *(void *)(v0 + 48);
  v17[8] = *(unsigned char *)(v0 + 40);
  uint64_t v18 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BE00);
  uint64_t result = sub_24FABFC50();
  if ((v19 & 1) == 0)
  {
    uint64_t v12 = sub_24FABF500();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24FA897D4((uint64_t)v9, (uint64_t)v7, &qword_269A4BBC0);
    swift_retain_n();
    sub_24FABF610();
    sub_24FAA3124();
    sub_24FA89838((uint64_t)v9, &qword_269A4BBC0);
    swift_release();
    uint64_t v13 = sub_24FAC0110();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v3, 1, 1, v13);
    sub_24FAC00D0();
    uint64_t v14 = sub_24FAC00C0();
    uint64_t v15 = swift_allocObject();
    uint64_t v16 = MEMORY[0x263F8F500];
    *(void *)(v15 + 16) = v14;
    *(void *)(v15 + 24) = v16;
    sub_24FA937DC((uint64_t)v3, (uint64_t)&unk_269A4C6A0, v15);
    return swift_release();
  }
  return result;
}

void sub_24FAB678C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  sub_24FABED20(&qword_269A4C348, (void (*)(uint64_t))type metadata accessor for GenerativeAssistantSettingsViewModel);
  sub_24FABF710();
  swift_getKeyPath();
  sub_24FABF720();
  swift_release();
  swift_release();
  uint64_t v4 = *(void **)(a1 + 104);
  id v5 = objc_allocWithZone(MEMORY[0x263F25380]);
  id v6 = v4;
  *(void *)a2 = objc_msgSend(v5, sel_init);
  swift_unknownObjectWeakInit();
  *(_OWORD *)(a2 + 16) = v7;
  *(void *)(a2 + 32) = v8;
  *(void *)(a2 + 40) = v9;
  swift_unknownObjectWeakAssign();
}

uint64_t sub_24FAB68B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BD40);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  id v5 = (void *)((char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22[0] = sub_24FABF6E0();
  uint64_t v6 = *(void *)(v22[0] - 8);
  MEMORY[0x270FA5388](v22[0]);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24FABF870();
  MEMORY[0x270FA5388](v9 - 8);
  sub_24FABF860();
  sub_24FABF850();
  sub_24FA8F040();
  sub_24FABF840();
  swift_bridgeObjectRelease();
  sub_24FABF850();
  sub_24FABF890();
  uint64_t v10 = sub_24FABFB20();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  sub_24FABF6D0();
  uint64_t v18 = (char *)v5 + *(int *)(v3 + 36);
  uint64_t v19 = v22[0];
  (*(void (**)(char *, char *, void))(v6 + 16))(v18, v8, v22[0]);
  *id v5 = KeyPath;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C468);
  sub_24FA897D4((uint64_t)v5, a1 + *(int *)(v20 + 36), &qword_269A4BD40);
  *(void *)a1 = v10;
  *(void *)(a1 + 8) = v12;
  *(unsigned char *)(a1 + 16) = v16;
  *(void *)(a1 + 24) = v14;
  sub_24FA90BD8(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_24FA89838((uint64_t)v5, &qword_269A4BD40);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  sub_24FA90BE8(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FAB6B7C@<X0>(uint64_t a1@<X8>)
{
  sub_24FABF880();
  uint64_t result = sub_24FABFB20();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24FAB6BF4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  sub_24FAC00D0();
  *(void *)(v1 + 24) = sub_24FAC00C0();
  uint64_t v3 = sub_24FAC00A0();
  return MEMORY[0x270FA2498](sub_24FAB6C8C, v3, v2);
}

uint64_t sub_24FAB6C8C()
{
  swift_release();
  swift_retain();
  sub_24FAA1E74();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24FAB6D04()
{
  swift_retain();
  sub_24FAA2810();

  return swift_release();
}

uint64_t sub_24FAB6D44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24FABF170();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24FABF2D0();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_24FABFFC0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_24FABF190();
  MEMORY[0x270FA5388](v8 - 8);
  sub_24FABFF70();
  sub_24FABF2C0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F06D18], v2);
  sub_24FABF1A0();
  uint64_t result = sub_24FABFB30();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_24FAB6F58()
{
  return sub_24FABFCB0();
}

uint64_t sub_24FAB7054@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24FABF170();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24FABF2D0();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_24FABFFC0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_24FABF190();
  MEMORY[0x270FA5388](v8 - 8);
  sub_24FABFF70();
  sub_24FABF2C0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F06D18], v2);
  sub_24FABF1A0();
  uint64_t result = sub_24FABFB30();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v10;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_24FAB7270@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4F0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C6E8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C4E0);
  MEMORY[0x270FA5388](v15);
  char v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  if (v17)
  {
    type metadata accessor for GenerativeAssistantSettingsViewModel();
    sub_24FABED20(&qword_269A4C348, (void (*)(uint64_t))type metadata accessor for GenerativeAssistantSettingsViewModel);
    sub_24FABF710();
    swift_getKeyPath();
    sub_24FABF720();
    swift_release();
    swift_release();
    MEMORY[0x270FA5388](v17);
    *(&v14 - 2) = a1;
    sub_24FABFCB0();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
    swift_storeEnumTagMultiPayload();
    sub_24FA9120C(&qword_269A4C4D8, &qword_269A4C4E0);
    sub_24FA9120C(&qword_269A4C4E8, &qword_269A4C4F0);
    sub_24FABF990();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    *(void *)char v11 = sub_24FABF830();
    *((void *)v11 + 1) = 0;
    v11[16] = 1;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C6F0);
    sub_24FAB76A4(a1, (uint64_t)&v11[*(int *)(v13 + 44)]);
    sub_24FA897D4((uint64_t)v11, (uint64_t)v9, &qword_269A4C4E0);
    swift_storeEnumTagMultiPayload();
    sub_24FA9120C(&qword_269A4C4D8, &qword_269A4C4E0);
    sub_24FA9120C(&qword_269A4C4E8, &qword_269A4C4F0);
    sub_24FABF990();
    return sub_24FA89838((uint64_t)v11, &qword_269A4C4E0);
  }
}

uint64_t sub_24FAB76A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v30 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v30 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C588);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v31 = &v25[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v32 = &v25[-v10];
  sub_24FABF880();
  uint64_t v11 = sub_24FABFB20();
  uint64_t v27 = v12;
  uint64_t v28 = v11;
  uint64_t v29 = v13;
  int v26 = v14 & 1;
  sub_24FABF880();
  sub_24FA95C38(a1, (uint64_t)&v25[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v15 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v16 = swift_allocObject();
  sub_24FAB3B18((uint64_t)&v25[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v16 + v15);
  uint64_t v17 = v32;
  sub_24FABFC90();
  uint64_t v18 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16);
  uint64_t v19 = v31;
  v18(v31, v17, v6);
  uint64_t v21 = v27;
  uint64_t v20 = v28;
  *(void *)a2 = v28;
  *(void *)(a2 + 8) = v21;
  LOBYTE(v17) = v26;
  *(unsigned char *)(a2 + 16) = v26;
  *(void *)(a2 + 24) = v29;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C6F8);
  v18((unsigned char *)(a2 + *(int *)(v22 + 64)), v19, v6);
  sub_24FA90BD8(v20, v21, (char)v17);
  uint64_t v23 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
  swift_bridgeObjectRetain();
  v23(v32, v6);
  v23(v19, v6);
  sub_24FA90BE8(v20, v21, (char)v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FAB79CC@<X0>(uint64_t a1@<X8>)
{
  sub_24FABF880();
  uint64_t result = sub_24FABFB20();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24FAB7A48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24FABFFB0();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_24FABF190();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v9 = sub_24FABF500();
  int v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9);
  sub_24FA89838((uint64_t)v8, &qword_269A4BBC0);
  __swift_project_boxed_opaque_existential_1((void *)(a1 + 56), *(void *)(a1 + 80));
  if ((sub_24FABF360() & 1) == 0)
  {
    sub_24FABF160();
    uint64_t v15 = sub_24FABFB30();
    uint64_t v17 = v15;
    uint64_t v18 = v16;
    *(void *)&long long v28 = v15;
    *((void *)&v28 + 1) = v16;
    char v20 = v19 & 1;
    *(void *)&long long v29 = v19 & 1;
    *((void *)&v29 + 1) = v21;
    LOBYTE(v30) = 0;
LABEL_6:
    sub_24FA90BD8(v15, v16, v20);
    swift_bridgeObjectRetain();
    sub_24FABF990();
    long long v28 = v31;
    long long v29 = v32;
    __int16 v30 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C508);
    sub_24FABDF98();
    sub_24FABF990();
    sub_24FA90BE8(v17, v18, v20);
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  if (v10 != 1)
  {
    sub_24FABFFA0();
    sub_24FABFF90();
    sub_24FA8F040();
    sub_24FABFF80();
    swift_bridgeObjectRelease();
    sub_24FABFF90();
    sub_24FABF180();
    uint64_t v15 = sub_24FABFB30();
    uint64_t v17 = v15;
    uint64_t v18 = v16;
    *(void *)&long long v28 = v15;
    *((void *)&v28 + 1) = v16;
    char v20 = v22 & 1;
    *(void *)&long long v29 = v22 & 1;
    *((void *)&v29 + 1) = v23;
    LOBYTE(v30) = 1;
    goto LABEL_6;
  }
  sub_24FABFFA0();
  sub_24FABFF90();
  sub_24FA8F040();
  sub_24FABFF80();
  swift_bridgeObjectRelease();
  sub_24FABFF90();
  sub_24FABF180();
  *(void *)&long long v28 = sub_24FABFB30();
  *((void *)&v28 + 1) = v12;
  *(void *)&long long v29 = v11 & 1;
  *((void *)&v29 + 1) = v13;
  __int16 v30 = 256;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C508);
  sub_24FABDF98();
  uint64_t result = sub_24FABF990();
LABEL_7:
  uint64_t v24 = *((void *)&v31 + 1);
  long long v25 = v32;
  unsigned __int8 v26 = v33;
  char v27 = v34;
  *(void *)a2 = v31;
  *(void *)(a2 + 8) = v24;
  *(_OWORD *)(a2 + 16) = v25;
  *(unsigned char *)(a2 + 32) = v26;
  *(unsigned char *)(a2 + 33) = v27;
  return result;
}

uint64_t sub_24FAB7E94()
{
  sub_24FA8F124(0);

  return sub_24FABF6C0();
}

uint64_t sub_24FAB7ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v8 - 8);
  int v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = *(void *)(a1 + 48);
  v18[8] = *(unsigned char *)(a1 + 40);
  uint64_t v19 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BE00);
  uint64_t result = sub_24FABFC50();
  if ((v20 & 1) == 0)
  {
    uint64_t v13 = sub_24FAC0110();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
    sub_24FA95C38(a1, (uint64_t)&v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)]);
    sub_24FAC00D0();
    uint64_t v14 = sub_24FAC00C0();
    unint64_t v15 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v16 = swift_allocObject();
    uint64_t v17 = MEMORY[0x263F8F500];
    *(void *)(v16 + 16) = v14;
    *(void *)(v16 + 24) = v17;
    sub_24FAB3B18((uint64_t)&v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)], v16 + v15);
    sub_24FA937DC((uint64_t)v10, a3, v16);
    return swift_release();
  }
  return result;
}

uint64_t sub_24FAB80AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a4;
  uint64_t v5 = sub_24FABF440();
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  uint64_t v6 = sub_24FABF520();
  v4[22] = v6;
  v4[23] = *(void *)(v6 - 8);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  sub_24FAC00D0();
  v4[30] = sub_24FAC00C0();
  uint64_t v8 = sub_24FAC00A0();
  v4[31] = v8;
  v4[32] = v7;
  return MEMORY[0x270FA2498](sub_24FAB8274, v8, v7);
}

uint64_t sub_24FAB8274()
{
  uint64_t v12 = v0;
  uint64_t v1 = *(void *)(v0 + 136);
  char v2 = *(unsigned char *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 48);
  *(unsigned char *)(v0 + 16) = v2;
  *(void *)(v0 + 24) = v3;
  *(unsigned char *)(v0 + 312) = 1;
  *(void *)(v0 + 264) = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BE00);
  sub_24FABFC60();
  if (qword_269A4BA88 != -1) {
    swift_once();
  }
  *(void *)(v0 + 272) = __swift_project_value_buffer(*(void *)(v0 + 144), (uint64_t)qword_269A4E248);
  uint64_t v4 = sub_24FABF410();
  os_log_type_t v5 = sub_24FAC0140();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v11 = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v0 + 64) = sub_24FA86AD8(0xD00000000000001FLL, 0x800000024FAC27A0, &v11);
    sub_24FAC01A0();
    *(_WORD *)(v6 + 12) = 2080;
    *(void *)(v0 + 96) = sub_24FA86AD8(0x61546E496E676973, 0xEC00000029286B73, &v11);
    sub_24FAC01A0();
    _os_log_impl(&dword_24FA83000, v4, v5, "%s.%s: Calling OpenAIAuthenticatorHelper().authenticateWithOpenAI()", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v7, -1, -1);
    MEMORY[0x25336CB50](v6, -1, -1);
  }

  *(void *)(v0 + 280) = *(void *)(*(void *)(v0 + 136) + 8);
  type metadata accessor for OpenAIAuthenticatorHelper();
  swift_allocObject();
  swift_retain();
  *(void *)(v0 + 288) = sub_24FA88B54();
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_24FAB8524;
  uint64_t v9 = *(void *)(v0 + 232);
  return sub_24FA877A0(v9);
}

uint64_t sub_24FAB8524()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 304) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0)
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 248);
    uint64_t v4 = *(void *)(v2 + 256);
    os_log_type_t v5 = sub_24FAB89D8;
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 248);
    uint64_t v4 = *(void *)(v2 + 256);
    os_log_type_t v5 = sub_24FAB8668;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_24FAB8668()
{
  uint64_t v16 = v0;
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 224);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FA897D4(v1, v3, &qword_269A4BBC0);
  swift_retain();
  sub_24FABF610();
  sub_24FAA3124();
  sub_24FA89838(v1, &qword_269A4BBC0);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = sub_24FABF500();
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v2, 1, v4);
  sub_24FA89838(v2, &qword_269A4BBC0);
  if (v5 == 1)
  {
    uint64_t v6 = sub_24FABF410();
    os_log_type_t v7 = sub_24FAC0140();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v15 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      *(void *)(v0 + 128) = sub_24FA86AD8(0xD00000000000001FLL, 0x800000024FAC27A0, &v15);
      sub_24FAC01A0();
      *(_WORD *)(v8 + 12) = 2080;
      *(void *)(v0 + 104) = sub_24FA86AD8(0x61546E496E676973, 0xEC00000029286B73, &v15);
      sub_24FAC01A0();
      _os_log_impl(&dword_24FA83000, v6, v7, "%s.%s: credentials are nil but no exception thrown", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25336CB50](v9, -1, -1);
      MEMORY[0x25336CB50](v8, -1, -1);
    }
  }
  else
  {
    swift_retain();
    sub_24FA9FEA4();
    swift_release();
  }
  uint64_t v10 = *(void *)(v0 + 136);
  char v11 = *(unsigned char *)(v10 + 40);
  uint64_t v12 = *(void *)(v10 + 48);
  *(unsigned char *)(v0 + 32) = v11;
  *(void *)(v0 + 40) = v12;
  *(unsigned char *)(v0 + 313) = 0;
  sub_24FABFC60();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_24FAB89D8()
{
  uint64_t v57 = v0;
  uint64_t v1 = *(void **)(v0 + 304);
  swift_release();
  *(void *)(v0 + 48) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C6B8);
  char v3 = swift_dynamicCast();
  uint64_t v4 = *(void **)(v0 + 304);
  uint64_t v5 = *(void *)(v0 + 272);
  if (v3)
  {
    uint64_t v6 = *(void *)(v0 + 208);
    uint64_t v53 = *(void *)(v0 + 200);
    uint64_t v8 = *(void *)(v0 + 184);
    uint64_t v7 = *(void *)(v0 + 192);
    uint64_t v10 = *(void *)(v0 + 168);
    uint64_t v9 = *(void *)(v0 + 176);
    uint64_t v11 = *(void *)(v0 + 152);
    *(void *)typea = *(void *)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v6, v7, v9);
    (*(void (**)(uint64_t, uint64_t, os_log_type_t *))(v11 + 16))(v10, v5, *(os_log_type_t **)typea);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    v12(v53, v6, v9);
    uint64_t v13 = sub_24FABF410();
    os_log_type_t type = sub_24FAC0160();
    BOOL v14 = os_log_type_enabled(v13, type);
    uint64_t v15 = *(void *)(v0 + 200);
    uint64_t v17 = *(void *)(v0 + 176);
    uint64_t v16 = *(void *)(v0 + 184);
    uint64_t v18 = *(void *)(v0 + 168);
    uint64_t v19 = *(void *)(v0 + 152);
    uint64_t v54 = *(void *)(v0 + 144);
    if (v14)
    {
      uint64_t v49 = *(void *)(v0 + 168);
      uint64_t v20 = swift_slowAlloc();
      uint64_t v47 = (void *)swift_slowAlloc();
      uint64_t v48 = swift_slowAlloc();
      uint64_t v56 = v48;
      *(_DWORD *)uint64_t v20 = 136315650;
      *(void *)(v0 + 56) = sub_24FA86AD8(0xD00000000000001FLL, 0x800000024FAC27A0, &v56);
      sub_24FAC01A0();
      *(_WORD *)(v20 + 12) = 2080;
      *(void *)(v0 + 112) = sub_24FA86AD8(0x61546E496E676973, 0xEC00000029286B73, &v56);
      sub_24FAC01A0();
      *(_WORD *)(v20 + 22) = 2112;
      sub_24FABED20(&qword_269A4C6C0, MEMORY[0x263F24C98]);
      swift_allocError();
      v12(v21, v15, v17);
      uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 120) = v22;
      sub_24FAC01A0();
      *uint64_t v47 = v22;
      uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      v23(v15, v17);
      _os_log_impl(&dword_24FA83000, v13, type, "%s.%s: OpenAIAuthenticatorHelper().authenticateWithOpenAI() exception: %@", (uint8_t *)v20, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BC08);
      swift_arrayDestroy();
      MEMORY[0x25336CB50](v47, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x25336CB50](v48, -1, -1);
      MEMORY[0x25336CB50](v20, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v49, v54);
    }
    else
    {
      uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      v23(v15, v17);

      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v54);
    }
    uint64_t v40 = *(void *)(v0 + 208);
    uint64_t v41 = *(void *)(v0 + 176);
    swift_getKeyPath();
    swift_getKeyPath();
    *(unsigned char *)(v0 + 314) = 1;
    swift_retain();
    sub_24FABF610();
    v23(v40, v41);
  }
  else
  {
    uint64_t v25 = *(void *)(v0 + 152);
    uint64_t v24 = *(void *)(v0 + 160);
    uint64_t v26 = *(void *)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v5, v26);
    id v27 = v4;
    id v28 = v4;
    long long v29 = sub_24FABF410();
    os_log_type_t v30 = sub_24FAC0160();
    BOOL v31 = os_log_type_enabled(v29, v30);
    long long v32 = *(void **)(v0 + 304);
    uint64_t v34 = *(void *)(v0 + 152);
    uint64_t v33 = *(void *)(v0 + 160);
    uint64_t v35 = *(void *)(v0 + 144);
    if (v31)
    {
      uint64_t v36 = swift_slowAlloc();
      int v37 = (void *)swift_slowAlloc();
      uint64_t typeb = swift_slowAlloc();
      uint64_t v56 = typeb;
      *(_DWORD *)uint64_t v36 = 136315650;
      uint64_t v55 = v35;
      *(void *)(v0 + 72) = sub_24FA86AD8(0xD00000000000001FLL, 0x800000024FAC27A0, &v56);
      sub_24FAC01A0();
      *(_WORD *)(v36 + 12) = 2080;
      *(void *)(v0 + 80) = sub_24FA86AD8(0x61546E496E676973, 0xEC00000029286B73, &v56);
      sub_24FAC01A0();
      *(_WORD *)(v36 + 22) = 2112;
      id v38 = v32;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 88) = v39;
      sub_24FAC01A0();
      void *v37 = v39;

      _os_log_impl(&dword_24FA83000, v29, v30, "%s.%s: OpenAIAuthenticatorHelper().authenticateWithOpenAI() unknown exception type: %@", (uint8_t *)v36, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BC08);
      swift_arrayDestroy();
      MEMORY[0x25336CB50](v37, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x25336CB50](typeb, -1, -1);
      MEMORY[0x25336CB50](v36, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v55);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
    }
  }
  uint64_t v42 = *(void *)(v0 + 136);
  char v43 = *(unsigned char *)(v42 + 40);
  uint64_t v44 = *(void *)(v42 + 48);
  *(unsigned char *)(v0 + 32) = v43;
  *(void *)(v0 + 40) = v44;
  *(unsigned char *)(v0 + 313) = 0;
  sub_24FABFC60();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v45 = *(uint64_t (**)(void))(v0 + 8);
  return v45();
}

uint64_t sub_24FAB913C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v23 = a1;
  uint64_t v3 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C680);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C588);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v21 = v9;
  uint64_t v22 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24FABF880();
  sub_24FABF640();
  uint64_t v13 = sub_24FABF660();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 0, 1, v13);
  sub_24FA95C38(v2, (uint64_t)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v14 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v15 = swift_allocObject();
  sub_24FAB3B18((uint64_t)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  sub_24FABFC80();
  uint64_t v20 = sub_24FABF880();
  void v19[3] = v16;
  type metadata accessor for GenerativeAssistantSettingsViewModel();
  sub_24FABED20(&qword_269A4C348, (void (*)(uint64_t))type metadata accessor for GenerativeAssistantSettingsViewModel);
  sub_24FABF710();
  swift_getKeyPath();
  sub_24FABF720();
  swift_release();
  swift_release();
  uint64_t v24 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C650);
  sub_24FA9120C(&qword_269A4C638, &qword_269A4C588);
  sub_24FA9120C(&qword_269A4C658, &qword_269A4C650);
  uint64_t v17 = v21;
  sub_24FABFBF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v12, v17);
}

uint64_t sub_24FAB9588()
{
  return sub_24FABF610();
}

uint64_t sub_24FAB95F8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  char v43 = a2;
  uint64_t v3 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v40 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v40 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C680);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C588);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v42 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v41 = (char *)&v34 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v39 = (char *)&v34 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v34 = (char *)&v34 - v16;
  uint64_t v17 = sub_24FABF880();
  uint64_t v37 = v18;
  uint64_t v38 = v17;
  int v35 = v19;
  uint64_t v36 = v20;
  sub_24FABF640();
  uint64_t v21 = sub_24FABF660();
  uint64_t v22 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  v22(v7, 0, 1, v21);
  sub_24FA95C38(a1, (uint64_t)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v23 = (*(unsigned __int8 *)(v40 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  uint64_t v24 = swift_allocObject();
  sub_24FAB3B18((uint64_t)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23);
  sub_24FABFC80();
  sub_24FABF880();
  sub_24FABF650();
  v22(v7, 0, 1, v21);
  uint64_t v25 = v39;
  sub_24FABFC80();
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  id v27 = v41;
  id v28 = v34;
  v26(v41, v34, v8);
  long long v29 = v42;
  v26(v42, v25, v8);
  os_log_type_t v30 = v43;
  v26(v43, v27, v8);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C688);
  v26(&v30[*(int *)(v31 + 48)], v29, v8);
  long long v32 = *(void (**)(char *, uint64_t))(v9 + 8);
  v32(v25, v8);
  v32(v28, v8);
  v32(v29, v8);
  return ((uint64_t (*)(char *, uint64_t))v32)(v27, v8);
}

uint64_t sub_24FAB9A28(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C2D0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v18[-v9];
  uint64_t v11 = *(void *)(a1 + 48);
  v18[8] = *(unsigned char *)(a1 + 40);
  uint64_t v19 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BE00);
  uint64_t result = sub_24FABFC50();
  if ((v20 & 1) == 0)
  {
    uint64_t v13 = sub_24FABF500();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24FA897D4((uint64_t)v10, (uint64_t)v8, &qword_269A4BBC0);
    swift_retain_n();
    sub_24FABF610();
    sub_24FAA3124();
    sub_24FA89838((uint64_t)v10, &qword_269A4BBC0);
    swift_release();
    uint64_t v14 = sub_24FAC0110();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
    sub_24FAC00D0();
    uint64_t v15 = sub_24FAC00C0();
    uint64_t v16 = swift_allocObject();
    uint64_t v17 = MEMORY[0x263F8F500];
    *(void *)(v16 + 16) = v15;
    *(void *)(v16 + 24) = v17;
    sub_24FA937DC((uint64_t)v4, (uint64_t)&unk_269A4C698, v16);
    return swift_release();
  }
  return result;
}

id sub_24FAB9C94@<X0>(uint64_t a1@<X8>)
{
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v3 = result;
    MobileGestalt_get_cameraButtonCapability();

    sub_24FABF880();
    id result = (id)sub_24FABFB20();
    *(void *)a1 = result;
    *(void *)(a1 + 8) = v4;
    *(unsigned char *)(a1 + 16) = v5 & 1;
    *(void *)(a1 + 24) = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24FAB9D5C()
{
  sub_24FAC00D0();
  v0[4] = sub_24FAC00C0();
  uint64_t v2 = sub_24FAC00A0();
  v0[5] = v2;
  v0[6] = v1;
  return MEMORY[0x270FA2498](sub_24FAB9DF0, v2, v1);
}

uint64_t sub_24FAB9DF0()
{
  uint64_t v10 = v0;
  if (qword_269A4BA88 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24FABF440();
  __swift_project_value_buffer(v1, (uint64_t)qword_269A4E248);
  uint64_t v2 = sub_24FABF410();
  os_log_type_t v3 = sub_24FAC0140();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v9 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[2] = sub_24FA86AD8(0xD00000000000001FLL, 0x800000024FAC27A0, &v9);
    sub_24FAC01A0();
    *(_WORD *)(v4 + 12) = 2080;
    v0[3] = sub_24FA86AD8(0x5474754F6E676973, 0xED000029286B7361, &v9);
    sub_24FAC01A0();
    _os_log_impl(&dword_24FA83000, v2, v3, "%s.%s: OpenAIAuthenticatorHelper().signOutOpenAI()", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25336CB50](v5, -1, -1);
    MEMORY[0x25336CB50](v4, -1, -1);
  }

  type metadata accessor for OpenAIAuthenticatorHelper();
  swift_allocObject();
  v0[7] = sub_24FA88B54();
  uint64_t v8 = (uint64_t (__cdecl *)())((char *)&dword_269A4BC00 + dword_269A4BC00);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[8] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24FABA050;
  return v8();
}

uint64_t sub_24FABA050()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return MEMORY[0x270FA2498](sub_24FABA194, v3, v2);
}

uint64_t sub_24FABA194()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24FABA1F4@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v103 = a1;
  uint64_t v108 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C678);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v107 = (char *)&v95 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24FABFAE0();
  uint64_t v105 = *(void *)(v4 - 8);
  uint64_t v106 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v104 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24FABF870();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v102 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_24FABF4A0();
  uint64_t v99 = *(void *)(v100 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v100);
  uint64_t v10 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v95 - v11;
  uint64_t v101 = sub_24FABF4D0();
  uint64_t v109 = *(void *)(v101 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v101);
  uint64_t v15 = (char *)&v95 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v95 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  MEMORY[0x270FA5388](v18 - 8);
  char v20 = (char *)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24FABF500();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v98 = (char *)&v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  uint64_t v24 = v21;
  uint64_t v25 = v22;
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v24) == 1)
  {
    sub_24FA89838((uint64_t)v20, &qword_269A4BBC0);
LABEL_9:
    uint64_t v40 = v104;
LABEL_10:
    sub_24FABF880();
    uint64_t v57 = sub_24FABFB20();
    uint64_t v59 = v58;
    char v61 = v60 & 1;
    LODWORD(v115) = sub_24FABF9B0();
    uint64_t v62 = sub_24FABFB00();
    uint64_t v64 = v63;
    uint64_t v66 = v65;
    uint64_t v68 = v67 & 1;
    sub_24FA90BE8(v57, v59, v61);
    swift_bridgeObjectRelease();
    uint64_t v110 = v62;
    uint64_t v111 = v64;
    uint64_t v112 = v68;
    uint64_t v113 = v66;
    char v114 = 1;
    sub_24FABF990();
    uint64_t v109 = v115;
    uint64_t v101 = v116;
    uint64_t v100 = v117;
    uint64_t v99 = v118;
    char v56 = v119;
    goto LABEL_11;
  }
  uint64_t v97 = v15;
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  id v27 = v98;
  v26(v98, v20, v24);
  sub_24FABF4E0();
  sub_24FABF4B0();
  id v28 = *(void (**)(char *, uint64_t))(v109 + 8);
  v109 += 8;
  uint64_t v96 = v28;
  v28(v17, v101);
  uint64_t v29 = v99;
  uint64_t v30 = v100;
  (*(void (**)(char *, void, uint64_t))(v99 + 104))(v10, *MEMORY[0x263F24C90], v100);
  char v31 = sub_24FABF490();
  long long v32 = *(void (**)(char *, uint64_t))(v29 + 8);
  v32(v10, v30);
  v32(v12, v30);
  if ((v31 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
    goto LABEL_9;
  }
  uint64_t v95 = v24;
  uint64_t v33 = v97;
  sub_24FABF4E0();
  uint64_t v34 = sub_24FABF4C0();
  unint64_t v36 = v35;
  uint64_t v37 = v101;
  uint64_t v38 = v96;
  v96(v33, v101);
  swift_bridgeObjectRelease();
  uint64_t v39 = HIBYTE(v36) & 0xF;
  if ((v36 & 0x2000000000000000) == 0) {
    uint64_t v39 = v34 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v40 = v104;
  if (!v39)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v95);
    goto LABEL_10;
  }
  sub_24FABF4E0();
  uint64_t v41 = sub_24FABF4C0();
  uint64_t v43 = v42;
  v38(v17, v37);
  uint64_t v115 = v41;
  uint64_t v116 = v43;
  sub_24FABE308();
  uint64_t v44 = sub_24FABFB40();
  uint64_t v46 = v45;
  char v48 = v47 & 1;
  LODWORD(v115) = sub_24FABF9B0();
  uint64_t v49 = sub_24FABFB00();
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54 & 1;
  sub_24FA90BE8(v44, v46, v48);
  swift_bridgeObjectRelease();
  uint64_t v110 = v49;
  uint64_t v111 = v51;
  uint64_t v112 = v55;
  uint64_t v113 = v53;
  char v114 = 0;
  sub_24FABF990();
  uint64_t v109 = v115;
  uint64_t v101 = v116;
  uint64_t v100 = v117;
  uint64_t v99 = v118;
  char v56 = v119;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v98, v95);
LABEL_11:
  uint64_t v70 = v106;
  uint64_t v69 = (uint64_t)v107;
  uint64_t v71 = v105;
  sub_24FABF860();
  sub_24FABF850();
  sub_24FABF4F0();
  sub_24FABF840();
  swift_bridgeObjectRelease();
  sub_24FABF850();
  sub_24FABF890();
  uint64_t v72 = sub_24FABFB20();
  uint64_t v74 = v73;
  char v76 = v75 & 1;
  (*(void (**)(char *, void, uint64_t))(v71 + 104))(v40, *MEMORY[0x263F1A6C0], v70);
  uint64_t v77 = sub_24FABFAB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v69, 1, 1, v77);
  sub_24FABFAC0();
  sub_24FA89838(v69, &qword_269A4C678);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v40, v70);
  uint64_t v78 = sub_24FABFB10();
  uint64_t v80 = v79;
  LOBYTE(v70) = v81;
  swift_release();
  char v82 = v70 & 1;
  sub_24FA90BE8(v72, v74, v76);
  swift_bridgeObjectRelease();
  LODWORD(v115) = sub_24FABF9C0();
  uint64_t v83 = sub_24FABFB00();
  uint64_t v85 = v84;
  uint64_t v87 = v86;
  LOBYTE(v74) = v88 & 1;
  sub_24FA90BE8(v78, v80, v82);
  swift_bridgeObjectRelease();
  LOBYTE(v115) = v56;
  uint64_t v89 = v108;
  uint64_t v90 = v109;
  uint64_t v91 = v101;
  *uint64_t v108 = v109;
  v89[1] = v91;
  char v92 = v100;
  uint64_t v93 = v99;
  v89[2] = v100;
  v89[3] = v93;
  *((unsigned char *)v89 + 32) = v56;
  v89[5] = v83;
  v89[6] = v85;
  *((unsigned char *)v89 + 56) = v74;
  v89[8] = v87;
  sub_24FABE45C(v90, v91, v92);
  sub_24FA90BD8(v83, v85, v74);
  swift_bridgeObjectRetain();
  sub_24FA90BE8(v83, v85, v74);
  swift_bridgeObjectRelease();
  return sub_24FABE4FC(v90, v91, v92);
}

uint64_t sub_24FABAC70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v115 = a2;
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C610);
  uint64_t v100 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114);
  uint64_t v99 = (uint64_t)&v95 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C618);
  MEMORY[0x270FA5388](v110);
  uint64_t v5 = (char *)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C588);
  uint64_t v109 = *(void *)(v119 - 8);
  MEMORY[0x270FA5388](v119);
  uint64_t v98 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C620);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v97 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v101 = (uint64_t)&v95 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C628);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v113 = (char *)&v95 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v126 = (uint64_t)&v95 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v96 = (char *)&v95 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v102 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v104 = (uint64_t)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v105 = (char *)&v95 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C590);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v125 = (uint64_t)&v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v131 = (uint64_t)&v95 - v24;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC0);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  uint64_t v118 = (char *)&v95 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v95 - v28;
  uint64_t v30 = sub_24FABF500();
  uint64_t v31 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v95 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  unint64_t v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48);
  int v36 = v35(v29, 1, v30);
  uint64_t v112 = v5;
  uint64_t v111 = v7;
  uint64_t v117 = v31 + 48;
  uint64_t v116 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v35;
  if (v36 == 1)
  {
    sub_24FA89838((uint64_t)v29, &qword_269A4BBC0);
    uint64_t v133 = 0;
    uint64_t v132 = 0;
    uint64_t v124 = 0;
    uint64_t v123 = 0;
    uint64_t v130 = 0;
    uint64_t v122 = 0;
    uint64_t v121 = 0;
    uint64_t v120 = 0;
    uint64_t v129 = 0;
    uint64_t v128 = 0;
    uint64_t v108 = 0;
    uint64_t v107 = 0;
    uint64_t v106 = 0;
    int v127 = 0;
    uint64_t v37 = v119;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v33, v29, v30);
    uint64_t v38 = sub_24FABF8B0();
    uint64_t v95 = a1;
    sub_24FABA1F4((uint64_t)v33, &v134);
    uint64_t v39 = v134;
    uint64_t v40 = v135;
    uint64_t v128 = v136;
    uint64_t v132 = v139;
    uint64_t v130 = v140;
    LODWORD(v129) = v141;
    uint64_t v133 = v142;
    uint64_t v149 = v38;
    uint64_t v150 = 0;
    char v151 = 1;
    uint64_t v152 = v134;
    uint64_t v153 = v135;
    uint64_t v154 = v136;
    uint64_t v155 = v137;
    char v156 = v138;
    uint64_t v157 = v139;
    uint64_t v158 = v140;
    unsigned __int8 v159 = v141;
    uint64_t v160 = v142;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_24FABF600();
    swift_release();
    swift_release();
    swift_release();
    sub_24FAB555C(v148, 4u, (uint64_t)&v134);
    sub_24FABE4FC(v39, v40, v128);
    sub_24FA90BE8(v132, v130, v129);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v30);
    uint64_t v133 = v134;
    uint64_t v132 = v135;
    uint64_t v124 = v136;
    uint64_t v123 = v137;
    uint64_t v130 = v138;
    uint64_t v122 = v139;
    uint64_t v121 = v140;
    uint64_t v120 = v141;
    uint64_t v129 = v142;
    uint64_t v128 = v143;
    uint64_t v108 = v144;
    uint64_t v107 = v145;
    uint64_t v106 = v146;
    int v127 = v147;
    uint64_t v37 = v119;
    uint64_t v34 = v95;
  }
  uint64_t v41 = v109;
  uint64_t v42 = v30;
  uint64_t v43 = (uint64_t)v105;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  int v44 = v134;
  sub_24FA95C38(v34, v43);
  if (v44 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_24FABF600();
    swift_release();
    swift_release();
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v45 = (uint64_t)v96;
    sub_24FABF600();
    swift_release();
    swift_release();
    swift_release();
    sub_24FA95C9C(v43);
    uint64_t v46 = sub_24FABF200();
    uint64_t v47 = 1;
    int v48 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 48))(v45, 1, v46);
    sub_24FA89838(v45, &qword_269A4BBC8);
    if (v48 != 1)
    {
      sub_24FABF880();
      uint64_t v49 = v104;
      sub_24FA95C38(v34, v104);
      unint64_t v50 = (*(unsigned __int8 *)(v102 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80);
      uint64_t v51 = swift_allocObject();
      sub_24FAB3B18(v49, v51 + v50);
      uint64_t v37 = v119;
      sub_24FABFC90();
      uint64_t v47 = 0;
    }
  }
  else
  {
    sub_24FA95C9C(v43);
    uint64_t v47 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v131, v47, 1, v37);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t v52 = (uint64_t)v118;
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  int v53 = v116(v52, 1, v42);
  sub_24FA89838(v52, &qword_269A4BBC0);
  if (v53 == 1)
  {
    sub_24FABF880();
    uint64_t v54 = v104;
    sub_24FA95C38(v34, v104);
    unint64_t v55 = (*(unsigned __int8 *)(v102 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80);
    uint64_t v56 = swift_allocObject();
    sub_24FAB3B18(v54, v56 + v55);
    uint64_t v57 = v98;
    sub_24FABFC90();
    uint64_t v58 = *(void *)(v34 + 48);
    LOBYTE(v134) = *(unsigned char *)(v34 + 40);
    uint64_t v135 = v58;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BE00);
    sub_24FABFC50();
    LOBYTE(v55) = v148;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v60 = swift_allocObject();
    *(unsigned char *)(v60 + 16) = v55;
    uint64_t v61 = (uint64_t)v97;
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v97, v57, v37);
    uint64_t v62 = (uint64_t *)(v61 + *(int *)(v111 + 36));
    *uint64_t v62 = KeyPath;
    v62[1] = (uint64_t)sub_24FABF0D8;
    v62[2] = v60;
    (*(void (**)(char *, uint64_t))(v41 + 8))(v57, v37);
    uint64_t v63 = v101;
    sub_24FA89894(v61, v101, &qword_269A4C620);
    sub_24FA897D4(v63, (uint64_t)v112, &qword_269A4C620);
    swift_storeEnumTagMultiPayload();
    sub_24FABE880();
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C650);
    uint64_t v65 = sub_24FA9120C(&qword_269A4C638, &qword_269A4C588);
    uint64_t v66 = sub_24FA9120C(&qword_269A4C658, &qword_269A4C650);
    uint64_t v134 = v37;
    uint64_t v135 = v64;
    uint64_t v136 = MEMORY[0x263F1A830];
    uint64_t v137 = v65;
    uint64_t v138 = v66;
    uint64_t v139 = MEMORY[0x263F1A820];
    swift_getOpaqueTypeConformance2();
    uint64_t v67 = v126;
    sub_24FABF990();
    sub_24FA89838(v63, &qword_269A4C620);
  }
  else
  {
    uint64_t v68 = v99;
    sub_24FAB913C(v99);
    uint64_t v69 = v100;
    uint64_t v70 = v114;
    (*(void (**)(char *, uint64_t, uint64_t))(v100 + 16))(v112, v68, v114);
    swift_storeEnumTagMultiPayload();
    sub_24FABE880();
    uint64_t v71 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C650);
    uint64_t v72 = sub_24FA9120C(&qword_269A4C638, &qword_269A4C588);
    uint64_t v73 = sub_24FA9120C(&qword_269A4C658, &qword_269A4C650);
    uint64_t v134 = v37;
    uint64_t v135 = v71;
    uint64_t v136 = MEMORY[0x263F1A830];
    uint64_t v137 = v72;
    uint64_t v138 = v73;
    uint64_t v139 = MEMORY[0x263F1A820];
    swift_getOpaqueTypeConformance2();
    uint64_t v67 = v126;
    sub_24FABF990();
    (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
  }
  uint64_t v74 = v115;
  uint64_t v75 = (uint64_t)v113;
  uint64_t v76 = v125;
  uint64_t v77 = v133;
  uint64_t v78 = v132;
  sub_24FA897D4(v131, v125, &qword_269A4C590);
  sub_24FA897D4(v67, v75, &qword_269A4C628);
  *(void *)uint64_t v74 = v77;
  *(void *)(v74 + 8) = v78;
  uint64_t v79 = v123;
  *(void *)(v74 + 16) = v124;
  *(void *)(v74 + 24) = v79;
  uint64_t v80 = v122;
  *(void *)(v74 + 32) = v130;
  *(void *)(v74 + 40) = v80;
  uint64_t v81 = v120;
  *(void *)(v74 + 48) = v121;
  *(void *)(v74 + 56) = v81;
  uint64_t v82 = v129;
  uint64_t v83 = v128;
  *(void *)(v74 + 64) = v129;
  *(void *)(v74 + 72) = v83;
  uint64_t v128 = v83;
  char v84 = v108;
  uint64_t v85 = v107;
  *(void *)(v74 + 80) = v108;
  *(void *)(v74 + 88) = v85;
  *(void *)(v74 + 96) = v106;
  LODWORD(v77) = v127;
  *(unsigned char *)(v74 + 104) = v127;
  int v127 = v77;
  uint64_t v86 = v75;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C660);
  sub_24FA897D4(v76, v74 + *(int *)(v87 + 48), &qword_269A4C590);
  sub_24FA897D4(v86, v74 + *(int *)(v87 + 64), &qword_269A4C628);
  uint64_t v94 = v83;
  uint64_t v93 = v82;
  uint64_t v88 = v124;
  uint64_t v89 = v123;
  LOBYTE(v83) = v122;
  uint64_t v90 = v121;
  uint64_t v91 = v120;
  sub_24FABE944(v133, v132, v124, v123, v130, v122, v121, v120, v93, v94, v84, v85);
  sub_24FA89838(v126, &qword_269A4C628);
  sub_24FA89838(v131, &qword_269A4C590);
  sub_24FA89838(v86, &qword_269A4C628);
  sub_24FA89838(v125, &qword_269A4C590);
  return sub_24FABE9E4(v133, v132, v88, v89, v130, v83, v90, v91, v129, v128, v84, v85);
}

uint64_t sub_24FABBEB8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  char v2 = 1;
  uint64_t v0 = swift_retain();
  sub_24FA9899C(v0, &v2);
  swift_release();
  return swift_release();
}

uint64_t sub_24FABBF64@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  sub_24FABF880();
  uint64_t v2 = sub_24FABFB20();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_24FABF9C0();
  uint64_t v7 = sub_24FABFB00();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  sub_24FA90BE8(v2, v4, v6);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v11 & 1;
  *(void *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_24FABC0F8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v3 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v42 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v43 = v4;
  uint64_t v45 = (uint64_t)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C588);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v46 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  int v44 = (char *)&v41 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4BBC8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C590);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v48 = (uint64_t)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v41 - v16;
  uint64_t v52 = sub_24FABF830();
  sub_24FABC808((uint64_t)&v60);
  uint64_t v18 = v61;
  int v53 = v62;
  uint64_t v54 = v60;
  uint64_t v55 = v63;
  uint64_t v51 = v64;
  int v50 = v65;
  uint64_t v57 = v67;
  uint64_t v58 = v66;
  int v56 = v68;
  uint64_t v59 = v69;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v19 = sub_24FABF200();
  int v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v12, 1, v19);
  sub_24FA89838((uint64_t)v12, &qword_269A4BBC8);
  uint64_t v21 = 1;
  if (v20 == 1) {
    goto LABEL_6;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v22 = v61;
  swift_bridgeObjectRelease();
  if (!v22)
  {
    uint64_t v21 = 1;
    goto LABEL_6;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24FABF600();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24FABF600();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (v61)
  {
    uint64_t v24 = v45;
    sub_24FA95C38(a1, v45);
    unint64_t v25 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
    uint64_t v26 = swift_allocObject();
    sub_24FAB3B18(v24, v26 + v25);
    sub_24FABE308();
    uint64_t v27 = v46;
    sub_24FABFCA0();
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    uint64_t v29 = v44;
    v28(v44, v27, v5);
    v28(v17, v29, v5);
    uint64_t v21 = 0;
LABEL_6:
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    uint64_t v47 = v17;
    v30(v17, v21, 1, v5);
    uint64_t v31 = v48;
    sub_24FA897D4((uint64_t)v17, v48, &qword_269A4C590);
    uint64_t v32 = v49;
    uint64_t *v49 = v52;
    v32[1] = 0;
    *((unsigned char *)v32 + 16) = 1;
    uint64_t v34 = v54;
    uint64_t v33 = v55;
    v32[3] = v54;
    v32[4] = v18;
    char v35 = v53;
    *((unsigned char *)v32 + 40) = v53;
    uint64_t v36 = v51;
    v32[6] = v33;
    v32[7] = v36;
    *((unsigned char *)v32 + 64) = v50;
    uint64_t v38 = v57;
    uint64_t v37 = v58;
    v32[9] = v58;
    v32[10] = v38;
    char v39 = v56;
    *((unsigned char *)v32 + 88) = v56;
    v32[12] = v59;
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269A4C598);
    sub_24FA897D4(v31, (uint64_t)v32 + *(int *)(v40 + 48), &qword_269A4C590);
    sub_24FA90BD8(v34, v18, v35);
    swift_bridgeObjectRetain();
    sub_24FA90BD8(v37, v38, v39);
    swift_bridgeObjectRetain();
    sub_24FA89838((uint64_t)v47, &qword_269A4C590);
    sub_24FA89838(v31, &qword_269A4C590);
    sub_24FA90BE8(v34, v18, v35);
    swift_bridgeObjectRelease();
    sub_24FA90BE8(v37, v38, v39);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_24FABC808@<X0>(uint64_t a1@<X8>)
{
  sub_24FABF880();
  uint64_t v2 = sub_24FABFB20();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  LODWORD(v18[0]) = sub_24FABF9B0();
  uint64_t v7 = sub_24FABFB00();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_24FA90BE8(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_24FABBF64((uint64_t)v18);
  uint64_t v14 = v18[0];
  uint64_t v15 = v18[1];
  LOBYTE(v4) = v19;
  uint64_t v16 = v20;
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v9;
  *(unsigned char *)(a1 + 16) = v13;
  *(void *)(a1 + 24) = v11;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = v14;
  *(void *)(a1 + 56) = v15;
  *(unsigned char *)(a1 + 64) = v4;
  *(void *)(a1 + 72) = v16;
  sub_24FA90BD8(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_24FA90BD8(v14, v15, v4);
  swift_bridgeObjectRetain();
  sub_24FA90BE8(v14, v15, v4);
  swift_bridgeObjectRelease();
  sub_24FA90BE8(v7, v9, v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24FABC99C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24FABC9D4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24FABC9E4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24FABC9F4@<X0>(uint64_t a1@<X8>)
{
  return sub_24FAB3114(a1);
}

unint64_t sub_24FABCA18()
{
  unint64_t result = qword_269A4C390;
  if (!qword_269A4C390)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C398);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C3A0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C3A8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C3B0);
    sub_24FABF820();
    sub_24FABCBE0();
    sub_24FABED20(&qword_269A4C3E0, MEMORY[0x263F19708]);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_24FABED20(&qword_269A4C3E8, MEMORY[0x263F189F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C390);
  }
  return result;
}

unint64_t sub_24FABCBE0()
{
  unint64_t result = qword_269A4C3B8;
  if (!qword_269A4C3B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C3B0);
    sub_24FABCC80();
    sub_24FA9120C(&qword_269A4BDC0, &qword_269A4BDC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C3B8);
  }
  return result;
}

unint64_t sub_24FABCC80()
{
  unint64_t result = qword_269A4C3C0;
  if (!qword_269A4C3C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C3C8);
    sub_24FA9120C(&qword_269A4C3D0, &qword_269A4C3D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C3C0);
  }
  return result;
}

uint64_t sub_24FABCD1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for GenerativeAssistantSettingsView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_24FAB3BB0(v4, a1);
}

unint64_t sub_24FABCD8C()
{
  unint64_t result = qword_269A4C408;
  if (!qword_269A4C408)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C400);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C410);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C418);
    sub_24FABF9D0();
    sub_24FABCEC4(&qword_269A4C420, &qword_269A4C418, (void (*)(void))sub_24FA8F794);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C408);
  }
  return result;
}

uint64_t sub_24FABCEC4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_24FABCF44()
{
  return sub_24FABCF5C((uint64_t (*)(uint64_t))sub_24FAB40B0);
}

uint64_t sub_24FABCF5C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for GenerativeAssistantSettingsView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_24FABCFD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for GenerativeAssistantSettingsView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v9 = a2 + 2;
    uint64_t v8 = a2[2];
    swift_retain();
    if (v8)
    {
      uint64_t v10 = a2[3];
      *(void *)(a1 + 16) = v8;
      *(void *)(a1 + 24) = v10;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 16) = *v9;
    }
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    *(void *)(a1 + 48) = a2[6];
    long long v12 = *((_OWORD *)a2 + 5);
    *(_OWORD *)(a1 + 80) = v12;
    uint64_t v13 = v12;
    uint64_t v14 = **(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8);
    swift_retain();
    swift_retain();
    v14(a1 + 56, (uint64_t)(a2 + 7), v13);
    uint64_t v15 = (void *)a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v15;
    uint64_t v16 = *(int *)(a3 + 36);
    uint64_t v17 = a1 + v16;
    uint64_t v18 = (uint64_t)a2 + v16;
    uint64_t v19 = sub_24FABF190();
    uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16);
    id v21 = v15;
    v20(v17, v18, v19);
    v20(a1 + *(int *)(a3 + 40), (uint64_t)a2 + *(int *)(a3 + 40), v19);
  }
  return a1;
}

uint64_t destroy for GenerativeAssistantSettingsView(uint64_t a1, uint64_t a2)
{
  swift_release();
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(a1 + 56);

  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_24FABF190();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 40);

  return v8(v6, v5);
}

uint64_t initializeWithCopy for GenerativeAssistantSettingsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v8 = (_OWORD *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 16);
  swift_retain();
  if (v7)
  {
    uint64_t v9 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v9;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v8;
  }
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  long long v10 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v10;
  uint64_t v11 = v10;
  long long v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
  swift_retain();
  swift_retain();
  v12(a1 + 56, a2 + 56, v11);
  uint64_t v13 = *(void **)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v13;
  uint64_t v14 = *(int *)(a3 + 36);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_24FABF190();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16);
  id v19 = v13;
  v18(v15, v16, v17);
  v18(a1 + *(int *)(a3 + 40), a2 + *(int *)(a3 + 40), v17);
  return a1;
}

uint64_t assignWithCopy for GenerativeAssistantSettingsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(a2 + 16);
  if (!*(void *)(a1 + 16))
  {
    if (v6)
    {
      uint64_t v8 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v6;
      *(void *)(a1 + 24) = v8;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_8;
  }
  if (!v6)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  swift_retain();
  swift_release();
LABEL_8:
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v9 = *(void **)(a2 + 104);
  long long v10 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = v9;
  id v11 = v9;

  uint64_t v12 = *(int *)(a3 + 36);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_24FABF190();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24);
  v16(v13, v14, v15);
  v16(a1 + *(int *)(a3 + 40), a2 + *(int *)(a3 + 40), v15);
  return a1;
}

uint64_t initializeWithTake for GenerativeAssistantSettingsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  uint64_t v10 = sub_24FABF190();
  id v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(a1 + *(int *)(a3 + 40), a2 + *(int *)(a3 + 40), v10);
  return a1;
}

uint64_t assignWithTake for GenerativeAssistantSettingsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_release();
  uint64_t v7 = *(void *)(a2 + 16);
  if (!*(void *)(a1 + 16))
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v9;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_8;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  swift_release();
LABEL_8:
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v10 = *(void **)(a1 + 104);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);

  uint64_t v11 = *(int *)(a3 + 36);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_24FABF190();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v15(a1 + *(int *)(a3 + 40), a2 + *(int *)(a3 + 40), v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for GenerativeAssistantSettingsView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24FABD7B8);
}

uint64_t sub_24FABD7B8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24FABF190();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for GenerativeAssistantSettingsView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24FABD87C);
}

uint64_t sub_24FABD87C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24FABF190();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24FABD924()
{
  uint64_t result = sub_24FABF190();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_24FABD9E0()
{
  unint64_t result = qword_269A4C440;
  if (!qword_269A4C440)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C428);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C370);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C400);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C368);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C360);
    sub_24FA9120C(&qword_269A4C3F8, &qword_269A4C360);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_24FABCD8C();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C440);
  }
  return result;
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

uint64_t sub_24FABDBB4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24FABDC10(uint64_t a1)
{
  return a1;
}

uint64_t sub_24FABDC68()
{
  return sub_24FABCF5C((uint64_t (*)(uint64_t))sub_24FAB4000);
}

uint64_t sub_24FABDC80@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24FABF750();
  *a1 = result;
  return result;
}

uint64_t sub_24FABDCAC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24FABF750();
  *a1 = result;
  return result;
}

uint64_t sub_24FABDCD8()
{
  return sub_24FABF760();
}

uint64_t sub_24FABDD00()
{
  return sub_24FABF760();
}

uint64_t sub_24FABDD34()
{
  uint64_t v2 = *(void *)(type metadata accessor for GenerativeAssistantSettingsView() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *unint64_t v4 = v1;
  v4[1] = sub_24FA95A50;
  return sub_24FAB6BF4(v3);
}

uint64_t sub_24FABDE04()
{
  return sub_24FABCF5C((uint64_t (*)(uint64_t))sub_24FAB6D04);
}

uint64_t sub_24FABDE1C@<X0>(uint64_t a1@<X8>)
{
  return sub_24FAB7270(*(void *)(v1 + 16), a1);
}

unint64_t sub_24FABDE24()
{
  unint64_t result = qword_269A4C4D0;
  if (!qword_269A4C4D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C4C8);
    sub_24FA9120C(&qword_269A4C4D8, &qword_269A4C4E0);
    sub_24FA9120C(&qword_269A4C4E8, &qword_269A4C4F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C4D0);
  }
  return result;
}

uint64_t sub_24FABDEF8@<X0>(uint64_t a1@<X8>)
{
  return sub_24FAB5E9C(*(void *)(v1 + 16), a1);
}

unint64_t sub_24FABDF00()
{
  unint64_t result = qword_269A4C510;
  if (!qword_269A4C510)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C500);
    sub_24FA9120C(&qword_269A4C518, &qword_269A4C520);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C510);
  }
  return result;
}

unint64_t sub_24FABDF98()
{
  unint64_t result = qword_269A4C528;
  if (!qword_269A4C528)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C508);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C528);
  }
  return result;
}

uint64_t sub_24FABE008()
{
  return sub_24FABCF5C((uint64_t (*)(uint64_t))sub_24FAB648C);
}

unint64_t sub_24FABE020()
{
  unint64_t result = qword_269A4C530;
  if (!qword_269A4C530)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C490);
    sub_24FABDF00();
    sub_24FABDF98();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C530);
  }
  return result;
}

unint64_t sub_24FABE0A8()
{
  unint64_t result = qword_269A4C538;
  if (!qword_269A4C538)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C468);
    sub_24FA9120C(&qword_269A4BDF0, &qword_269A4BD40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C538);
  }
  return result;
}

uint64_t sub_24FABE148(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_24FABE1B4()
{
  unint64_t result = qword_269A4C548;
  if (!qword_269A4C548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C550);
    sub_24FAAE584();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C548);
  }
  return result;
}

unint64_t sub_24FABE234()
{
  unint64_t result = qword_269A4C558;
  if (!qword_269A4C558)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C470);
    sub_24FABE0A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C558);
  }
  return result;
}

void sub_24FABE2C4(uint64_t a1@<X8>)
{
  sub_24FAB678C(*(void *)(v1 + 16), a1);
}

uint64_t sub_24FABE2D4@<X0>(uint64_t *a1@<X8>)
{
  return sub_24FABC0F8(*(void *)(v1 + 16), a1);
}

uint64_t sub_24FABE2F0()
{
  return sub_24FABCF5C((uint64_t (*)(uint64_t))sub_24FABBEB8);
}

unint64_t sub_24FABE308()
{
  unint64_t result = qword_269A4C5A0;
  if (!qword_269A4C5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C5A0);
  }
  return result;
}

uint64_t sub_24FABE364@<X0>(uint64_t a1@<X8>)
{
  return sub_24FABAC70(*(void *)(v1 + 16), a1);
}

uint64_t sub_24FABE36C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_24FABF7D0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_24FABE3A0()
{
  return sub_24FABF7E0();
}

uint64_t sub_24FABE3D0()
{
  return sub_24FABF790();
}

uint64_t sub_24FABE3F8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    sub_24FA90BD8(a1, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  else
  {
    return sub_24FABE45C(a1, a2, a3);
  }
}

uint64_t sub_24FABE45C(uint64_t a1, uint64_t a2, char a3)
{
  sub_24FA90BD8(a1, a2, a3 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_24FABE498(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    sub_24FA90BE8(a1, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    return sub_24FABE4FC(a1, a2, a3);
  }
}

uint64_t sub_24FABE4FC(uint64_t a1, uint64_t a2, char a3)
{
  sub_24FA90BE8(a1, a2, a3 & 1);

  return swift_bridgeObjectRelease();
}

unint64_t sub_24FABE538()
{
  unint64_t result = qword_269A4C5C8;
  if (!qword_269A4C5C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C5A8);
    sub_24FABE5D8();
    sub_24FA9120C(&qword_269A4BDF0, &qword_269A4BD40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C5C8);
  }
  return result;
}

unint64_t sub_24FABE5D8()
{
  unint64_t result = qword_269A4C5D0;
  if (!qword_269A4C5D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C5D8);
    sub_24FABE148(&qword_269A4C5E0, &qword_269A4C5E8, (void (*)(void))sub_24FABE6B0);
    sub_24FA9120C(&qword_269A4C600, &qword_269A4C608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C5D0);
  }
  return result;
}

unint64_t sub_24FABE6B0()
{
  unint64_t result = qword_269A4C5F0;
  if (!qword_269A4C5F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C5F8);
    sub_24FABDF98();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C5F0);
  }
  return result;
}

uint64_t sub_24FABE72C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24FABF7B0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24FABE75C()
{
  return sub_24FABF7C0();
}

uint64_t sub_24FABE784()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_24FABE794(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_24FABE7C0()
{
  return sub_24FABE7F4((uint64_t)&unk_270122448, (uint64_t)&unk_269A4C6B0, (uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_24FAB7ED0);
}

uint64_t sub_24FABE7F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(type metadata accessor for GenerativeAssistantSettingsView() - 8);
  return a3(v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a1, a2);
}

uint64_t sub_24FABE870()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_24FABE880()
{
  unint64_t result = qword_269A4C630;
  if (!qword_269A4C630)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269A4C620);
    sub_24FA9120C(&qword_269A4C638, &qword_269A4C588);
    sub_24FA9120C(&qword_269A4C640, &qword_269A4C648);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269A4C630);
  }
  return result;
}

uint64_t sub_24FABE944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  if (a12)
  {
    sub_24FABE45C(a4, a5, a6);
    sub_24FA90BD8(a9, a10, a11 & 1);
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24FABE9E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  if (a12)
  {
    sub_24FABE4FC(a4, a5, a6);
    sub_24FA90BE8(a9, a10, a11 & 1);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_24FABEA88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  char v4 = *(unsigned char *)(a1 + 80);
  sub_24FABE45C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40));
  sub_24FA90BD8(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24FABEAF8()
{
  return sub_24FABE7F4((uint64_t)&unk_24FAC2CD0, (uint64_t)&unk_24FAC2CF8, (uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_24FAB9588);
}

uint64_t sub_24FABEB28@<X0>(char *a1@<X8>)
{
  return sub_24FAB95F8(*(void *)(v1 + 16), a1);
}

uint64_t sub_24FABEB34()
{
  return sub_24FABCF5C(sub_24FAB9A28);
}

uint64_t sub_24FABEB4C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24FABEB84()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_24FA96A38;
  return sub_24FAB9D5C();
}

uint64_t sub_24FABEC34(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for GenerativeAssistantSettingsView() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_24FA96A38;
  return sub_24FAB80AC(a1, v5, v6, v7);
}

uint64_t sub_24FABED20(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24FABED68()
{
  return sub_24FAB6F58();
}

uint64_t sub_24FABEDA0()
{
  return sub_24FAB6F58();
}

uint64_t sub_24FABEDE8@<X0>(uint64_t a1@<X8>)
{
  return sub_24FAB79CC(a1);
}

uint64_t objectdestroyTm_2()
{
  uint64_t v1 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  swift_release();
  if (*(void *)(v0 + v3 + 16)) {
    swift_release();
  }
  uint64_t v6 = v3 + v4;
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v5 + 56);

  uint64_t v7 = v5 + *(int *)(v1 + 36);
  uint64_t v8 = sub_24FABF190();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v5 + *(int *)(v1 + 40), v8);

  return MEMORY[0x270FA0238](v0, v6, v2 | 7);
}

uint64_t sub_24FABEF48()
{
  return sub_24FABE7F4((uint64_t)&unk_24FAC2770, (uint64_t)&unk_24FAC2798, (uint64_t (*)(unint64_t, uint64_t, uint64_t))sub_24FAB9588);
}

uint64_t objectdestroy_160Tm()
{
  uint64_t v1 = type metadata accessor for GenerativeAssistantSettingsView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = v0 + v3;
  swift_release();
  if (*(void *)(v0 + v3 + 16)) {
    swift_release();
  }
  uint64_t v6 = v3 + v4;
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v5 + 56);

  uint64_t v7 = v5 + *(int *)(v1 + 36);
  uint64_t v8 = sub_24FABF190();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v5 + *(int *)(v1 + 40), v8);

  return MEMORY[0x270FA0238](v0, v6, v2 | 7);
}

uint64_t sub_24FABF0DC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_24FABF110()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_24FABF120()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24FABF130()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_24FABF140()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_24FABF150()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_24FABF160()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_24FABF170()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_24FABF180()
{
  return MEMORY[0x270EEF888]();
}

uint64_t sub_24FABF190()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_24FABF1A0()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_24FABF1B0()
{
  return MEMORY[0x270EEFBA8]();
}

uint64_t sub_24FABF1C0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24FABF1D0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24FABF1E0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_24FABF1F0()
{
  return MEMORY[0x270EEFF38]();
}

uint64_t sub_24FABF200()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24FABF210()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_24FABF220()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24FABF230()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_24FABF240()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24FABF250()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_24FABF260()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_24FABF270()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24FABF280()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24FABF290()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24FABF2B0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_24FABF2C0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_24FABF2D0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24FABF2E0()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_24FABF2F0()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_24FABF300()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_24FABF310()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24FABF320()
{
  return MEMORY[0x270EF1678]();
}

uint64_t sub_24FABF330()
{
  return MEMORY[0x270EF16A8]();
}

uint64_t sub_24FABF340()
{
  return MEMORY[0x270EF16B0]();
}

uint64_t sub_24FABF350()
{
  return MEMORY[0x270EF16C8]();
}

uint64_t sub_24FABF360()
{
  return MEMORY[0x270F2E980]();
}

uint64_t sub_24FABF370()
{
  return MEMORY[0x270F2E988]();
}

uint64_t sub_24FABF380()
{
  return MEMORY[0x270F2E990]();
}

uint64_t sub_24FABF390()
{
  return MEMORY[0x270F2E998]();
}

uint64_t sub_24FABF3A0()
{
  return MEMORY[0x270F2E9A8]();
}

uint64_t sub_24FABF3B0()
{
  return MEMORY[0x270F2E9B0]();
}

uint64_t sub_24FABF3C0()
{
  return MEMORY[0x270F2E9B8]();
}

uint64_t sub_24FABF3D0()
{
  return MEMORY[0x270F2E9C0]();
}

uint64_t sub_24FABF3E0()
{
  return MEMORY[0x270F2E9C8]();
}

uint64_t sub_24FABF3F0()
{
  return MEMORY[0x270F2EA70]();
}

uint64_t sub_24FABF400()
{
  return MEMORY[0x270F2EA80]();
}

uint64_t sub_24FABF410()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24FABF420()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24FABF430()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_24FABF440()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24FABF450()
{
  return MEMORY[0x270F07ED0]();
}

uint64_t sub_24FABF460()
{
  return MEMORY[0x270F07ED8]();
}

uint64_t sub_24FABF480()
{
  return MEMORY[0x270F07EE8]();
}

uint64_t sub_24FABF490()
{
  return MEMORY[0x270F0C170]();
}

uint64_t sub_24FABF4A0()
{
  return MEMORY[0x270F0C178]();
}

uint64_t sub_24FABF4B0()
{
  return MEMORY[0x270F0C180]();
}

uint64_t sub_24FABF4C0()
{
  return MEMORY[0x270F0C188]();
}

uint64_t sub_24FABF4D0()
{
  return MEMORY[0x270F0C190]();
}

uint64_t sub_24FABF4E0()
{
  return MEMORY[0x270F0C198]();
}

uint64_t sub_24FABF4F0()
{
  return MEMORY[0x270F0C1A0]();
}

uint64_t sub_24FABF500()
{
  return MEMORY[0x270F0C1A8]();
}

uint64_t sub_24FABF510()
{
  return MEMORY[0x270F0C1B0]();
}

uint64_t sub_24FABF520()
{
  return MEMORY[0x270F0C1B8]();
}

uint64_t sub_24FABF530()
{
  return MEMORY[0x270F0C1C0]();
}

uint64_t sub_24FABF540()
{
  return MEMORY[0x270F0C1C8]();
}

uint64_t sub_24FABF560()
{
  return MEMORY[0x270F0C1D8]();
}

uint64_t sub_24FABF580()
{
  return MEMORY[0x270F0C1E8]();
}

uint64_t sub_24FABF590()
{
  return MEMORY[0x270F0C1F0]();
}

uint64_t sub_24FABF5B0()
{
  return MEMORY[0x270F0C200]();
}

uint64_t sub_24FABF5D0()
{
  return MEMORY[0x270F0C210]();
}

uint64_t sub_24FABF5E0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_24FABF5F0()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_24FABF600()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_24FABF610()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_24FABF620()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_24FABF630()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_24FABF640()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_24FABF650()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_24FABF660()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_24FABF670()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24FABF680()
{
  return MEMORY[0x270EFEF58]();
}

uint64_t sub_24FABF690()
{
  return MEMORY[0x270EFEFB8]();
}

uint64_t sub_24FABF6A0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_24FABF6B0()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_24FABF6C0()
{
  return MEMORY[0x270EFF818]();
}

uint64_t sub_24FABF6D0()
{
  return MEMORY[0x270EFF838]();
}

uint64_t sub_24FABF6E0()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_24FABF6F0()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_24FABF700()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_24FABF710()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_24FABF720()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_24FABF730()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_24FABF740()
{
  return MEMORY[0x270F07EF0]();
}

uint64_t sub_24FABF750()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_24FABF760()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_24FABF770()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24FABF780()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24FABF790()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_24FABF7A0()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_24FABF7B0()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_24FABF7C0()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_24FABF7D0()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_24FABF7E0()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_24FABF7F0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24FABF800()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24FABF810()
{
  return MEMORY[0x270F00FE8]();
}

uint64_t sub_24FABF820()
{
  return MEMORY[0x270F00FF8]();
}

uint64_t sub_24FABF830()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24FABF840()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_24FABF850()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_24FABF860()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_24FABF870()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_24FABF880()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_24FABF890()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_24FABF8A0()
{
  return MEMORY[0x270F01310]();
}

uint64_t sub_24FABF8B0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24FABF8C0()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_24FABF8D0()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_24FABF8E0()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_24FABF8F0()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_24FABF910()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_24FABF920()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_24FABF930()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_24FABF940()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_24FABF950()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_24FABF960()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_24FABF980()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_24FABF990()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24FABF9A0()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_24FABF9B0()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_24FABF9C0()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_24FABF9D0()
{
  return MEMORY[0x270F01D80]();
}

uint64_t sub_24FABF9E0()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_24FABF9F0()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_24FABFA00()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_24FABFA10()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_24FABFA30()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_24FABFA40()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_24FABFA50()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_24FABFA70()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_24FABFA80()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24FABFA90()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24FABFAA0()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_24FABFAB0()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_24FABFAC0()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_24FABFAD0()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_24FABFAE0()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_24FABFAF0()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_24FABFB00()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24FABFB10()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24FABFB20()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_24FABFB30()
{
  return MEMORY[0x270F03248]();
}

uint64_t sub_24FABFB40()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24FABFB50()
{
  return MEMORY[0x270F5D070]();
}

uint64_t sub_24FABFB60()
{
  return MEMORY[0x270F5D078]();
}

uint64_t sub_24FABFB70()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24FABFB80()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24FABFB90()
{
  return MEMORY[0x270F03548]();
}

uint64_t sub_24FABFBA0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24FABFBB0()
{
  return MEMORY[0x270F037F0]();
}

uint64_t sub_24FABFBC0()
{
  return MEMORY[0x270F03A90]();
}

uint64_t sub_24FABFBD0()
{
  return MEMORY[0x270F03B78]();
}

uint64_t sub_24FABFBE0()
{
  return MEMORY[0x270F03E00]();
}

uint64_t sub_24FABFBF0()
{
  return MEMORY[0x270F03FA0]();
}

uint64_t sub_24FABFC00()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_24FABFC10()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_24FABFC20()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_24FABFC30()
{
  return MEMORY[0x270F043B0]();
}

uint64_t sub_24FABFC40()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24FABFC50()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24FABFC60()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24FABFC70()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_24FABFC80()
{
  return MEMORY[0x270F048C8]();
}

uint64_t sub_24FABFC90()
{
  return MEMORY[0x270F048E0]();
}

uint64_t sub_24FABFCA0()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_24FABFCB0()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_24FABFCC0()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_24FABFCD0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_24FABFCE0()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_24FABFCF0()
{
  return MEMORY[0x270F04CF0]();
}

uint64_t sub_24FABFD00()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_24FABFD10()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_24FABFD20()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_24FABFD30()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_24FABFD40()
{
  return MEMORY[0x270F5D090]();
}

uint64_t sub_24FABFD50()
{
  return MEMORY[0x270F44EE0]();
}

uint64_t sub_24FABFD70()
{
  return MEMORY[0x270F44F00]();
}

uint64_t sub_24FABFD80()
{
  return MEMORY[0x270F44F18]();
}

uint64_t sub_24FABFDA0()
{
  return MEMORY[0x270F44F68]();
}

uint64_t sub_24FABFDB0()
{
  return MEMORY[0x270F44F70]();
}

uint64_t sub_24FABFDC0()
{
  return MEMORY[0x270F44F78]();
}

uint64_t sub_24FABFDD0()
{
  return MEMORY[0x270F44F80]();
}

uint64_t sub_24FABFDE0()
{
  return MEMORY[0x270F44F88]();
}

uint64_t sub_24FABFDF0()
{
  return MEMORY[0x270F44F90]();
}

uint64_t sub_24FABFE00()
{
  return MEMORY[0x270F44F98]();
}

uint64_t sub_24FABFE10()
{
  return MEMORY[0x270F44FB0]();
}

uint64_t sub_24FABFE20()
{
  return MEMORY[0x270F44FB8]();
}

uint64_t sub_24FABFE30()
{
  return MEMORY[0x270F44FC0]();
}

uint64_t sub_24FABFE40()
{
  return MEMORY[0x270F44FC8]();
}

uint64_t sub_24FABFE50()
{
  return MEMORY[0x270F44FD0]();
}

uint64_t sub_24FABFE60()
{
  return MEMORY[0x270F44FD8]();
}

uint64_t sub_24FABFE70()
{
  return MEMORY[0x270F44FE0]();
}

uint64_t sub_24FABFE80()
{
  return MEMORY[0x270F45768]();
}

uint64_t sub_24FABFE90()
{
  return MEMORY[0x270F457B0]();
}

uint64_t sub_24FABFEA0()
{
  return MEMORY[0x270F45E18]();
}

uint64_t sub_24FABFEB0()
{
  return MEMORY[0x270F45E20]();
}

uint64_t sub_24FABFED0()
{
  return MEMORY[0x270F45E50]();
}

uint64_t sub_24FABFEE0()
{
  return MEMORY[0x270F45E88]();
}

uint64_t sub_24FABFEF0()
{
  return MEMORY[0x270F45E90]();
}

uint64_t sub_24FABFF00()
{
  return MEMORY[0x270F45EE0]();
}

uint64_t sub_24FABFF10()
{
  return MEMORY[0x270F45EE8]();
}

uint64_t sub_24FABFF20()
{
  return MEMORY[0x270F45EF0]();
}

uint64_t sub_24FABFF30()
{
  return MEMORY[0x270F45EF8]();
}

uint64_t sub_24FABFF40()
{
  return MEMORY[0x270F46700]();
}

uint64_t sub_24FABFF50()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24FABFF60()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24FABFF70()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24FABFF80()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_24FABFF90()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_24FABFFA0()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_24FABFFB0()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_24FABFFC0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24FABFFD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24FABFFE0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24FABFFF0()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_24FAC0000()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24FAC0010()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24FAC0020()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24FAC0030()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24FAC0040()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24FAC0050()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_24FAC0060()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24FAC0070()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24FAC0080()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24FAC0090()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24FAC00A0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24FAC00B0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24FAC00C0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24FAC00D0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24FAC00E0()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t sub_24FAC00F0()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24FAC0100()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24FAC0110()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24FAC0120()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24FAC0130()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24FAC0140()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24FAC0150()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24FAC0160()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24FAC0170()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24FAC0180()
{
  return MEMORY[0x270F475A0]();
}

uint64_t sub_24FAC0190()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_24FAC01A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24FAC01B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24FAC01C0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24FAC01D0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24FAC01E0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24FAC01F0()
{
  return MEMORY[0x270EF2608]();
}

uint64_t sub_24FAC0200()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24FAC0210()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24FAC0220()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24FAC0230()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24FAC0240()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24FAC0250()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24FAC0260()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24FAC0270()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24FAC0280()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24FAC0290()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24FAC02A0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24FAC02B0()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24FAC02C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24FAC02D0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24FAC02E0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24FAC02F0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24FAC0300()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24FAC0310()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24FAC0330()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24FAC0340()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24FAC0360()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24FAC0370()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24FAC0380()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24FAC0390()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24FAC03A0()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_24FAC03B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24FAC03C0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24FAC03D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24FAC03E0()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t MobileGestalt_get_cameraButtonCapability()
{
  return MEMORY[0x270F960D8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_internalBuild()
{
  return MEMORY[0x270F96148]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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