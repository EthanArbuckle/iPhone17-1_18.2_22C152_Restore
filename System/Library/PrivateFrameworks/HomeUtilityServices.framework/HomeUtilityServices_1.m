uint64_t destroy for NetworkError(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t vars8;

  result = swift_getEnumCaseMultiPayload();
  if (!result)
  {
    v3 = sub_252830EF8();
    v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *initializeWithCopy for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_252830EF8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithCopy for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2527D325C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_252830EF8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *initializeWithTake for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_252830EF8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for NetworkError(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2527D325C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_252830EF8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkError(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for NetworkError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_252826954()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_252826964()
{
  uint64_t result = sub_252830EF8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkInternalError()
{
  return &type metadata for NetworkInternalError;
}

unsigned char *_s19HomeUtilityServices20NetworkInternalErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252826AE4);
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

ValueMetadata *type metadata accessor for UtilityTerritoryConfigError()
{
  return &type metadata for UtilityTerritoryConfigError;
}

uint64_t sub_252826B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_252826B80(void *a1)
{
  uint64_t v2 = sub_252830EF8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unsigned int v6 = (char *)v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)v64 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1E9C8);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_252830F08();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v16 = (char *)v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  v18 = (char *)v64 - v17;
  uint64_t v74 = (uint64_t)a1;
  id v19 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D4C0);
  int v20 = swift_dynamicCast();
  v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  if (v20)
  {
    v69 = v16;
    v21(v11, 0, 1, v12);
    uint64_t v72 = v13;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
    v22 = v8;
    uint64_t v71 = sub_25282753C(&qword_269C1E9D0, MEMORY[0x263F07A20]);
    sub_252830AF8();
    sub_252830ED8();
    sub_25282753C(&qword_269C1E9A0, MEMORY[0x263F07A00]);
    sub_252831488();
    sub_252831488();
    v23 = v18;
    v25 = v73;
    v24 = (void *)v74;
    v26 = *(void (**)(char *, uint64_t))(v3 + 8);
    v26(v6, v2);
    v26(v22, v2);
    if (v24 == v25)
    {
      if (qword_26B22BF18 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_252831158();
      __swift_project_value_buffer(v27, (uint64_t)qword_26B22C0B8);
      v28 = sub_252831138();
      os_log_type_t v29 = sub_252831618();
      v30 = v23;
      if (os_log_type_enabled(v28, v29))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_25277D000, v28, v29, "No Internet connection detected. Check your network connection.", v31, 2u);
        MEMORY[0x2533BE070](v31, -1, -1);
      }

      type metadata accessor for NetworkError();
      sub_25282753C((unint64_t *)&qword_269C1D948, (void (*)(uint64_t))type metadata accessor for NetworkError);
      uint64_t v32 = swift_allocError();
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v30, v12);
    }
    else
    {
      uint64_t v70 = v12;
      sub_252830AF8();
      sub_252830EC8();
      sub_252831488();
      sub_252831488();
      v38 = v73;
      v37 = (void *)v74;
      v26(v6, v2);
      uint64_t v68 = v2;
      v26(v22, v2);
      BOOL v39 = v37 == v38;
      v40 = v23;
      if (v39)
      {
        uint64_t v41 = v72;
        if (qword_26B22BF18 != -1) {
          swift_once();
        }
        uint64_t v42 = sub_252831158();
        __swift_project_value_buffer(v42, (uint64_t)qword_26B22C0B8);
        v43 = sub_252831138();
        os_log_type_t v44 = sub_252831618();
        BOOL v45 = os_log_type_enabled(v43, v44);
        uint64_t v46 = v70;
        if (v45)
        {
          v47 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v47 = 0;
          _os_log_impl(&dword_25277D000, v43, v44, "Unable to find Host. if this DEV env, please check your VPN connection!", v47, 2u);
          MEMORY[0x2533BE070](v47, -1, -1);
        }

        type metadata accessor for NetworkError();
        sub_25282753C((unint64_t *)&qword_269C1D948, (void (*)(uint64_t))type metadata accessor for NetworkError);
        uint64_t v32 = swift_allocError();
        swift_storeEnumTagMultiPayload();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v46);
      }
      else
      {
        v48 = v22;
        uint64_t v49 = v72;
        if (qword_26B22BF18 != -1) {
          swift_once();
        }
        uint64_t v50 = sub_252831158();
        __swift_project_value_buffer(v50, (uint64_t)qword_26B22C0B8);
        v51 = v69;
        uint64_t v52 = v70;
        (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v69, v40, v70);
        v53 = sub_252831138();
        os_log_type_t v54 = sub_252831618();
        int v55 = v54;
        BOOL v56 = os_log_type_enabled(v53, v54);
        uint64_t v57 = v68;
        if (v56)
        {
          v66 = v53;
          v58 = (uint8_t *)swift_slowAlloc();
          v67 = v40;
          v59 = v58;
          *(_DWORD *)v58 = 134217984;
          v64[1] = v58 + 4;
          int v65 = v55;
          sub_252830AF8();
          uint64_t v60 = sub_252830EE8();
          v26(v48, v57);
          v61 = *(void (**)(char *, uint64_t))(v49 + 8);
          v61(v51, v70);
          uint64_t v74 = v60;
          v53 = v66;
          sub_252831698();
          _os_log_impl(&dword_25277D000, v53, (os_log_type_t)v65, "URLError error : %ld", v59, 0xCu);
          v62 = v59;
          v40 = v67;
          uint64_t v52 = v70;
          MEMORY[0x2533BE070](v62, -1, -1);
        }
        else
        {
          v61 = *(void (**)(char *, uint64_t))(v49 + 8);
          v61(v51, v52);
        }

        type metadata accessor for NetworkError();
        sub_25282753C((unint64_t *)&qword_269C1D948, (void (*)(uint64_t))type metadata accessor for NetworkError);
        uint64_t v32 = swift_allocError();
        sub_252830AF8();
        swift_storeEnumTagMultiPayload();
        v61(v40, v52);
      }
    }
  }
  else
  {
    v21(v11, 1, 1, v12);
    sub_252781C54((uint64_t)v11, &qword_269C1E9C8);
    if (qword_26B22BF18 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_252831158();
    __swift_project_value_buffer(v33, (uint64_t)qword_26B22C0B8);
    v34 = sub_252831138();
    os_log_type_t v35 = sub_252831618();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_25277D000, v34, v35, "Unknown Error", v36, 2u);
      MEMORY[0x2533BE070](v36, -1, -1);
    }

    type metadata accessor for NetworkError();
    sub_25282753C((unint64_t *)&qword_269C1D948, (void (*)(uint64_t))type metadata accessor for NetworkError);
    uint64_t v32 = swift_allocError();
    swift_storeEnumTagMultiPayload();
  }
  return v32;
}

uint64_t sub_25282753C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25282758C()
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  sub_252830858();
  swift_allocObject();
  sub_252830848();
  long long v1 = v0[3];
  long long v21 = v0[2];
  long long v22 = v1;
  long long v23 = v0[4];
  long long v2 = v0[1];
  long long v19 = *v0;
  long long v20 = v2;
  sub_25282B8A4();
  uint64_t v3 = sub_252830838();
  unint64_t v5 = v4;
  swift_release();
  unsigned int v6 = self;
  uint64_t v7 = (void *)sub_252830C48();
  *(void *)&long long v19 = 0;
  id v8 = objc_msgSend(v6, sel_JSONObjectWithData_options_error_, v7, 4, &v19);

  id v9 = (id)v19;
  if (v8)
  {
    sub_252831738();
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v10 = v9;
    v11 = (void *)sub_252830B18();

    swift_willThrow();
    long long v19 = 0u;
    long long v20 = 0u;
  }
  sub_2527845D0((uint64_t)&v19, (uint64_t)&v16);
  if (v17)
  {
    sub_2527933EC(&v16, v15);
    sub_252784638((uint64_t)v15, (uint64_t)v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22BF28);
    if ((swift_dynamicCast() & 1) == 0) {
      uint64_t v18 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    uint64_t v12 = v18;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v18 = 0;
  }
  sub_252782E20(v3, v5);
  sub_252781C54((uint64_t)&v19, &qword_26B22C010);
  return v12;
}

unint64_t TAFAuthorizationError.init(rawValue:)(unint64_t a1)
{
  return sub_25282A85C(a1);
}

unint64_t static TAFAuthorizationError._nsErrorDomain.getter()
{
  return 0xD000000000000029;
}

uint64_t sub_2528277E4()
{
  return sub_252831B18();
}

uint64_t sub_252827848(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25282B7FC();

  return MEMORY[0x270EEEA70](a1, a2, v4);
}

uint64_t sub_252827894()
{
  return sub_252831B18();
}

unint64_t sub_2528278F4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_25282A85C(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_252827928(uint64_t a1)
{
  unint64_t v2 = sub_25282B7FC();

  return MEMORY[0x270EEEA80](a1, v2);
}

uint64_t sub_252827964(uint64_t a1)
{
  unint64_t v2 = sub_25282B7FC();

  return MEMORY[0x270EEEA78](a1, v2);
}

unint64_t sub_2528279A0()
{
  return 0xD000000000000029;
}

uint64_t sub_2528279BC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25282B7FC();

  return MEMORY[0x270EEEA68](a1, a2, v4);
}

uint64_t sub_252827A10(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EAB8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25282BD20();
  sub_252831B38();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EAA8);
  sub_25282BD74(&qword_269C1EAC0, (void (*)(void))sub_25282B8A4);
  sub_252831A18();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_252827B90()
{
  return 0x73726F74636166;
}

uint64_t sub_252827BA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x73726F74636166 && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_252831A58();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_252827C40(uint64_t a1)
{
  unint64_t v2 = sub_25282BD20();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252827C7C(uint64_t a1)
{
  unint64_t v2 = sub_25282BD20();

  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_252827CB8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_25282AD78(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_252827CE4(void *a1)
{
  return sub_252827A10(a1, *v1);
}

uint64_t sub_252827D00(char *a1, char *a2)
{
  return sub_2527A5F4C(*a1, *a2);
}

uint64_t sub_252827D0C()
{
  return sub_252831B18();
}

uint64_t sub_252827DE4()
{
  sub_252831258();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252827EA4()
{
  return sub_252831B18();
}

uint64_t sub_252827F78@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25282AF20();
  *a1 = result;
  return result;
}

void sub_252827FA8(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE200000000000000;
  uint64_t v3 = 25705;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEA00000000006570;
      uint64_t v3 = 0x7954726F74636166;
      goto LABEL_3;
    case 2:
      *a1 = 0x74616E6974736564;
      a1[1] = 0xEB000000006E6F69;
      break;
    case 3:
      *a1 = 0x736B6E696C5FLL;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_252828040()
{
  uint64_t result = 25705;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x7954726F74636166;
      break;
    case 2:
      uint64_t result = 0x74616E6974736564;
      break;
    case 3:
      uint64_t result = 0x736B6E696C5FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2528280CC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25282AF20();
  *a1 = result;
  return result;
}

uint64_t sub_2528280F4(uint64_t a1)
{
  unint64_t v2 = sub_25282B31C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252828130(uint64_t a1)
{
  unint64_t v2 = sub_25282B31C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25282816C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EA18);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25282B31C();
  sub_252831B38();
  v11[0] = 0;
  sub_2528319E8();
  if (!v2)
  {
    v11[0] = 1;
    sub_2528319E8();
    v11[0] = 2;
    sub_2528319E8();
    sub_25282B408(v3 + 48, (uint64_t)v12);
    sub_25282B408((uint64_t)v12, (uint64_t)v11);
    v10[15] = 3;
    sub_25282B470();
    sub_2528319D8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_252828344(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v12[0] = a4;
  v12[1] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EA40);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25282B7A8();
  sub_252831B38();
  char v14 = 0;
  sub_2528319E8();
  if (!v5)
  {
    char v13 = 1;
    sub_2528319E8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

__n128 sub_2528284B8@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_25282AF6C(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v6[4];
    __n128 result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_252828504(void *a1)
{
  return sub_25282816C(a1);
}

uint64_t sub_252828548()
{
  if (*v0) {
    return 1684956531;
  }
  else {
    return 0x796669726576;
  }
}

uint64_t sub_252828578@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25282B4C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2528285A0(uint64_t a1)
{
  unint64_t v2 = sub_25282B7A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2528285DC(uint64_t a1)
{
  unint64_t v2 = sub_25282B7A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252828618@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_25282B5A0(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_252828648(void *a1)
{
  return sub_252828344(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_252828668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[34] = a4;
  v5[35] = a5;
  v5[32] = a2;
  v5[33] = a3;
  v5[31] = a1;
  uint64_t v6 = sub_252831818();
  v5[36] = v6;
  v5[37] = *(void *)(v6 - 8);
  v5[38] = swift_task_alloc();
  uint64_t v7 = sub_252831828();
  v5[39] = v7;
  v5[40] = *(void *)(v7 - 8);
  v5[41] = swift_task_alloc();
  uint64_t v8 = sub_252830DB8();
  v5[42] = v8;
  v5[43] = *(void *)(v8 - 8);
  v5[44] = swift_task_alloc();
  v5[45] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22BD40);
  v5[46] = swift_task_alloc();
  uint64_t v9 = sub_2528307F8();
  v5[47] = v9;
  v5[48] = *(void *)(v9 - 8);
  v5[49] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252828884, 0, 0);
}

uint64_t sub_252828884()
{
  uint64_t v18 = v0;
  if (os_variant_has_internal_diagnostics()
    && (uint64_t v1 = (__CFString *)sub_252831298(),
        uint64_t v2 = (__CFString *)sub_252831298(),
        CFPropertyListRef v3 = CFPreferencesCopyAppValue(v1, v2),
        v2,
        v1,
        v3)
    && (v0[28] = v3, __swift_instantiateConcreteTypeFromMangledName(&qword_269C1DFE8), (swift_dynamicCast() & 1) != 0))
  {
    uint64_t v4 = v0[29];
    if (qword_269C1CEC8 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_252831158();
    __swift_project_value_buffer(v5, (uint64_t)qword_269C2D2C8);
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_252831138();
    os_log_type_t v7 = sub_252831628();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v17 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_252831238();
      unint64_t v12 = v11;
      swift_bridgeObjectRelease();
      v0[30] = sub_25278F894(v10, v12, &v17);
      sub_252831698();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25277D000, v6, v7, "Overriding Account Lookup fields with: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533BE070](v9, -1, -1);
      MEMORY[0x2533BE070](v8, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    uint64_t v4 = v0[32];
    swift_bridgeObjectRetain();
  }
  v0[50] = v4;
  char v13 = (void *)swift_task_alloc();
  v0[51] = v13;
  *char v13 = v0;
  v13[1] = sub_252828B9C;
  uint64_t v14 = v0[46];
  uint64_t v15 = v0[31];
  return sub_25282E664(v14, v15, v4);
}

uint64_t sub_252828B9C()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_252828CB4, 0, 0);
}

uint64_t sub_252828CB4()
{
  uint64_t v1 = v0[47];
  uint64_t v2 = v0[48];
  uint64_t v3 = v0[46];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_252781C54(v3, &qword_26B22BD40);
    if (qword_269C1CEC8 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_252831158();
    __swift_project_value_buffer(v4, (uint64_t)qword_269C2D2C8);
    uint64_t v5 = sub_252831138();
    os_log_type_t v6 = sub_252831618();
    if (os_log_type_enabled(v5, v6))
    {
      os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v7 = 0;
      _os_log_impl(&dword_25277D000, v5, v6, "Unable to create request URL for TAF Authorization.", v7, 2u);
      MEMORY[0x2533BE070](v7, -1, -1);
    }

    type metadata accessor for NetworkError();
    sub_2527B3838();
    swift_allocError();
    unsigned char *v8 = 0;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[49], v3, v1);
    sub_252804F18(0xD00000000000001ALL, 0x800000025283E080, (uint8_t *)0xD000000000000021, 0x800000025283E0A0);
    sub_252830DA8();
    unint64_t v11 = (void *)swift_task_alloc();
    v0[52] = v11;
    void *v11 = v0;
    v11[1] = sub_252828F8C;
    uint64_t v12 = v0[49];
    return MEMORY[0x270EF1EB0](v12, 0);
  }
}

uint64_t sub_252828F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)*v4;
  v5[53] = a1;
  v5[54] = a2;
  v5[55] = a3;
  v5[56] = v3;
  swift_task_dealloc();
  if (v3) {
    os_log_type_t v6 = sub_25282A6E4;
  }
  else {
    os_log_type_t v6 = sub_2528290A4;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_2528290A4()
{
  uint64_t v171 = v0;
  uint64_t v1 = *(void *)(v0 + 352);
  uint64_t v159 = *(void *)(v0 + 360);
  uint64_t v3 = *(void *)(v0 + 336);
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v162 = *(void *)(v0 + 272);
  uint64_t v5 = (uint64_t *)(*(void *)(v0 + 248) + OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_252806A64();
  uint64_t v10 = v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v159, v3);
  swift_bridgeObjectRetain();
  sub_25282C970(v6, v7, v8, v10, v162, v4, 0, v1, v0 + 16);
  sub_25282CB08();
  sub_252812B50(v0 + 16);
  self;
  uint64_t v11 = swift_dynamicCastObjCClass();
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = *(void *)(v0 + 392);
    uint64_t v14 = *(NSObject **)(v0 + 360);
    uint64_t v15 = *(void **)(v0 + 264);
    id v16 = *(id *)(v0 + 440);
    sub_252805814(0xD00000000000001ALL, (char *)0x800000025283E0D0, (unint64_t)objc_msgSend(v12, sel_statusCode), qword_2702C4AB8);
    sub_2527EAA54(v13, (uint64_t)objc_msgSend(v12, sel_statusCode), v6, v7, v14, v15);
    id v17 = objc_msgSend(v12, sel_statusCode);
    uint64_t v18 = (objc_super *)v0;
    switch((unint64_t)v17)
    {
      case 0x190uLL:
        if (qword_269C1CEC8 != -1) {
          swift_once();
        }
        uint64_t v19 = sub_252831158();
        __swift_project_value_buffer(v19, (uint64_t)qword_269C2D2C8);
        long long v20 = sub_252831138();
        os_log_type_t v21 = sub_252831618();
        if (os_log_type_enabled(v20, v21))
        {
          long long v22 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v22 = 0;
          _os_log_impl(&dword_25277D000, v20, v21, "BAD REQUEST | Check request", v22, 2u);
          MEMORY[0x2533BE070](v22, -1, -1);
        }
        unint64_t receiver = (unint64_t)v18[27].receiver;
        Class super_class = v18[27].super_class;
        uint64_t v25 = (uint64_t)v18[26].super_class;
        Class v26 = v18[22].super_class;
        id v27 = v18[21].receiver;
        Class v28 = v18[21].super_class;

        sub_252812AFC();
        os_log_type_t v29 = (objc_class *)swift_allocError();
        void *v30 = 0;
        goto LABEL_59;
      case 0x191uLL:
        if (qword_269C1CEC8 != -1) {
          swift_once();
        }
        uint64_t v71 = sub_252831158();
        __swift_project_value_buffer(v71, (uint64_t)qword_269C2D2C8);
        uint64_t v72 = sub_252831138();
        os_log_type_t v73 = sub_252831618();
        if (os_log_type_enabled(v72, v73))
        {
          uint64_t v74 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v74 = 0;
          _os_log_impl(&dword_25277D000, v72, v73, "UnAuthorized | PAT Validation Failed | Check request", v74, 2u);
          MEMORY[0x2533BE070](v74, -1, -1);
        }
        unint64_t receiver = (unint64_t)v18[27].receiver;
        Class super_class = v18[27].super_class;
        uint64_t v25 = (uint64_t)v18[26].super_class;
        Class v26 = v18[22].super_class;
        id v27 = v18[21].receiver;
        Class v28 = v18[21].super_class;

        sub_252812AFC();
        os_log_type_t v29 = (objc_class *)swift_allocError();
        uint64_t v76 = 1;
        goto LABEL_58;
      case 0x192uLL:
      case 0x193uLL:
      case 0x195uLL:
      case 0x196uLL:
      case 0x197uLL:
      case 0x198uLL:
      case 0x19AuLL:
      case 0x19BuLL:
      case 0x19DuLL:
      case 0x19EuLL:
      case 0x19FuLL:
      case 0x1A0uLL:
      case 0x1A1uLL:
      case 0x1A2uLL:
      case 0x1A3uLL:
      case 0x1A4uLL:
      case 0x1A5uLL:
      case 0x1A6uLL:
      case 0x1A7uLL:
      case 0x1A8uLL:
      case 0x1A9uLL:
      case 0x1AAuLL:
      case 0x1ABuLL:
      case 0x1ACuLL:
        goto LABEL_24;
      case 0x194uLL:
        if (qword_269C1CEC8 != -1) {
          swift_once();
        }
        uint64_t v77 = sub_252831158();
        __swift_project_value_buffer(v77, (uint64_t)qword_269C2D2C8);
        v78 = sub_252831138();
        os_log_type_t v79 = sub_252831618();
        if (os_log_type_enabled(v78, v79))
        {
          v80 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v80 = 0;
          _os_log_impl(&dword_25277D000, v78, v79, "Lookup Failed | User Account Not Found", v80, 2u);
          MEMORY[0x2533BE070](v80, -1, -1);
        }
        unint64_t receiver = (unint64_t)v18[27].receiver;
        Class super_class = v18[27].super_class;
        uint64_t v25 = (uint64_t)v18[26].super_class;
        Class v26 = v18[22].super_class;
        id v27 = v18[21].receiver;
        Class v28 = v18[21].super_class;

        sub_252812AFC();
        os_log_type_t v29 = (objc_class *)swift_allocError();
        uint64_t v76 = 2;
        goto LABEL_58;
      case 0x199uLL:
        if (qword_269C1CEC8 != -1) {
          swift_once();
        }
        uint64_t v81 = sub_252831158();
        __swift_project_value_buffer(v81, (uint64_t)qword_269C2D2C8);
        v82 = sub_252831138();
        os_log_type_t v83 = sub_252831618();
        if (os_log_type_enabled(v82, v83))
        {
          v84 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v84 = 0;
          _os_log_impl(&dword_25277D000, v82, v83, "User Conflict | User must authenticate using OAuth.", v84, 2u);
          MEMORY[0x2533BE070](v84, -1, -1);
        }
        unint64_t receiver = (unint64_t)v18[27].receiver;
        Class super_class = v18[27].super_class;
        uint64_t v25 = (uint64_t)v18[26].super_class;
        Class v26 = v18[22].super_class;
        id v27 = v18[21].receiver;
        Class v28 = v18[21].super_class;

        sub_252812AFC();
        os_log_type_t v29 = (objc_class *)swift_allocError();
        uint64_t v76 = 3;
        goto LABEL_58;
      case 0x19CuLL:
        if (qword_269C1CEC8 != -1) {
          swift_once();
        }
        uint64_t v85 = sub_252831158();
        __swift_project_value_buffer(v85, (uint64_t)qword_269C2D2C8);
        v86 = sub_252831138();
        os_log_type_t v87 = sub_252831618();
        if (os_log_type_enabled(v86, v87))
        {
          v88 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v88 = 0;
          _os_log_impl(&dword_25277D000, v86, v87, "No Verification Factor | User does not have a verification factor on record.", v88, 2u);
          MEMORY[0x2533BE070](v88, -1, -1);
        }
        unint64_t receiver = (unint64_t)v18[27].receiver;
        Class super_class = v18[27].super_class;
        uint64_t v25 = (uint64_t)v18[26].super_class;
        Class v26 = v18[22].super_class;
        id v27 = v18[21].receiver;
        Class v28 = v18[21].super_class;

        sub_252812AFC();
        os_log_type_t v29 = (objc_class *)swift_allocError();
        uint64_t v76 = 4;
        goto LABEL_58;
      case 0x1ADuLL:
        if (qword_269C1CEC8 != -1) {
          swift_once();
        }
        uint64_t v89 = sub_252831158();
        __swift_project_value_buffer(v89, (uint64_t)qword_269C2D2C8);
        v90 = sub_252831138();
        os_log_type_t v91 = sub_252831618();
        if (os_log_type_enabled(v90, v91))
        {
          v92 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v92 = 0;
          _os_log_impl(&dword_25277D000, v90, v91, "Too Many Request | User requested to authorize multiple times from the same account.", v92, 2u);
          MEMORY[0x2533BE070](v92, -1, -1);
        }
        unint64_t receiver = (unint64_t)v18[27].receiver;
        Class super_class = v18[27].super_class;
        uint64_t v25 = (uint64_t)v18[26].super_class;
        Class v26 = v18[22].super_class;
        id v27 = v18[21].receiver;
        Class v28 = v18[21].super_class;

        sub_252812AFC();
        os_log_type_t v29 = (objc_class *)swift_allocError();
        uint64_t v76 = 5;
        goto LABEL_58;
      default:
        if (v17 == (id)500)
        {
          if (qword_269C1CEC8 != -1) {
            swift_once();
          }
          uint64_t v93 = sub_252831158();
          __swift_project_value_buffer(v93, (uint64_t)qword_269C2D2C8);
          v94 = sub_252831138();
          os_log_type_t v95 = sub_252831618();
          if (os_log_type_enabled(v94, v95))
          {
            v96 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v96 = 0;
            _os_log_impl(&dword_25277D000, v94, v95, "Internal Server Error", v96, 2u);
            MEMORY[0x2533BE070](v96, -1, -1);
          }
          unint64_t receiver = (unint64_t)v18[27].receiver;
          Class super_class = v18[27].super_class;
          uint64_t v25 = (uint64_t)v18[26].super_class;
          Class v26 = v18[22].super_class;
          id v27 = v18[21].receiver;
          Class v28 = v18[21].super_class;

          sub_252812AFC();
          os_log_type_t v29 = (objc_class *)swift_allocError();
          uint64_t v76 = 6;
LABEL_58:
          uint64_t *v75 = v76;
LABEL_59:
          swift_willThrow();
          sub_252782E20(v25, receiver);

          (*((void (**)(Class, id))v28 + 1))(v26, v27);
        }
        else
        {
          if (v17 != (id)300)
          {
LABEL_24:
            if (qword_269C1CEC8 != -1) {
              swift_once();
            }
            v63 = *(void **)(v0 + 440);
            uint64_t v64 = sub_252831158();
            __swift_project_value_buffer(v64, (uint64_t)qword_269C2D2C8);
            id v65 = v63;
            v66 = sub_252831138();
            os_log_type_t v67 = sub_252831618();
            if (os_log_type_enabled(v66, v67))
            {
              Class v68 = v18[27].super_class;
              v69 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)v69 = 134217984;
              v18[13].Class super_class = (Class)objc_msgSend(v12, sel_statusCode);
              sub_252831698();

              _os_log_impl(&dword_25277D000, v66, v67, "Request failed : Status Code %ld", v69, 0xCu);
              MEMORY[0x2533BE070](v69, -1, -1);
              uint64_t v70 = v18[27].super_class;
            }
            else
            {

              uint64_t v70 = v18[27].super_class;
              v66 = v70;
            }
            uint64_t v106 = (uint64_t)v18[26].super_class;
            unint64_t v107 = (unint64_t)v18[27].receiver;
            Class v108 = v18[21].super_class;
            id v165 = v18[21].receiver;
            Class v167 = v18[22].super_class;

            type metadata accessor for NetworkError();
            sub_2527B3838();
            os_log_type_t v29 = (objc_class *)swift_allocError();
            void *v109 = objc_msgSend(v12, sel_statusCode);
            swift_storeEnumTagMultiPayload();
            swift_willThrow();
            sub_252782E20(v106, v107);

            (*((void (**)(Class, id))v108 + 1))(v167, v165);
            break;
          }
          if (qword_269C1CEC8 != -1) {
            swift_once();
          }
          uint64_t v42 = (uint64_t *)(v0 + 160);
          uint64_t v43 = sub_252831158();
          __swift_project_value_buffer(v43, (uint64_t)qword_269C2D2C8);
          os_log_type_t v44 = sub_252831138();
          os_log_type_t v45 = sub_252831628();
          if (os_log_type_enabled(v44, v45))
          {
            uint64_t v46 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v46 = 0;
            _os_log_impl(&dword_25277D000, v44, v45, "Account Lookup Response received", v46, 2u);
            MEMORY[0x2533BE070](v46, -1, -1);
          }
          id v47 = v18[28].receiver;

          sub_252830828();
          swift_allocObject();
          sub_252830818();
          sub_25282B850();
          sub_252830808();
          if (!v47)
          {
            swift_release();
            uint64_t v110 = *v42;
            uint64_t v111 = *(void *)(*v42 + 16);
            if (v111)
            {
              v156 = v18 + 9;
              v170[0] = MEMORY[0x263F8EE78];
              sub_252831868();
              v112 = (uint64_t *)(v110 + 56);
              v157 = v18;
              v113 = (objc_class *)type metadata accessor for TAFVerificationFactor();
              do
              {
                uint64_t v114 = *(v112 - 2);
                uint64_t v166 = *(v112 - 3);
                uint64_t v168 = v111;
                uint64_t v115 = *v112;
                uint64_t v116 = v112[2];
                uint64_t v158 = v112[1];
                uint64_t v160 = *(v112 - 1);
                uint64_t v117 = v112[3];
                uint64_t v118 = v112[4];
                uint64_t v120 = v112[5];
                uint64_t v119 = v112[6];
                v121 = (char *)objc_allocWithZone(v113);
                v122 = &v121[OBJC_IVAR____TtC19HomeUtilityServices21TAFVerificationFactor__factor];
                *(void *)v122 = v166;
                *((void *)v122 + 1) = v114;
                *((void *)v122 + 2) = v160;
                *((void *)v122 + 3) = v115;
                *((void *)v122 + 4) = v158;
                *((void *)v122 + 5) = v116;
                *((void *)v122 + 6) = v117;
                *((void *)v122 + 7) = v118;
                *((void *)v122 + 8) = v120;
                *((void *)v122 + 9) = v119;
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                uint64_t v18 = v157;
                sub_25282B3C4(v117, v118);
                v157[9].unint64_t receiver = v121;
                v157[9].Class super_class = v113;
                [(objc_super *)v156 init];
                sub_252831848();
                sub_252831878();
                sub_252831888();
                sub_252831858();
                v112 += 10;
                uint64_t v111 = v168 - 1;
              }
              while (v168 != 1);
              Class v123 = v157[27].super_class;
              uint64_t v124 = v170[0];
              sub_252782E20((uint64_t)v157[26].super_class, (unint64_t)v157[27].receiver);

              swift_bridgeObjectRelease();
            }
            else
            {
              Class v143 = v18[27].super_class;
              sub_252782E20((uint64_t)v18[26].super_class, (unint64_t)v18[27].receiver);

              swift_bridgeObjectRelease();
              uint64_t v124 = MEMORY[0x263F8EE78];
            }
            v145 = (void (**)(Class, Class))v18[24].receiver;
            Class v144 = v18[24].super_class;
            Class v146 = v18[23].super_class;
            (*((void (**)(Class, id))v18[21].super_class + 1))(v18[22].super_class, v18[21].receiver);
            v145[1](v144, v146);
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            v147 = (uint64_t (*)(uint64_t))v18->super_class;
            return v147(v124);
          }
          v48 = v47;
          p_Class super_class = (id *)&v18[10].super_class;
          swift_release();
          v18[10].Class super_class = (Class)v47;
          id v50 = v47;
          __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D4C0);
          if (swift_dynamicCast())
          {
            int v51 = (*((uint64_t (**)(Class, Class))v18[20].receiver + 11))(v18[20].super_class, v18[19].super_class);
            uint64_t v52 = (void (**)(long long *, Class))v18[20].receiver;
            v53 = (long long *)v18[20].super_class;
            os_log_type_t v54 = v18;
            Class v55 = v18[19].super_class;
            if (v51 == *MEMORY[0x263F8DCA8])
            {
              Class v56 = v54[18].super_class;
              id v57 = v54[19].receiver;
              id v163 = v54[18].receiver;

              v52[12](v53, v55);
              v58 = (char *)v53 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C1E9B8) + 48);
              sub_25280A568(v53, (uint64_t)&v54[5]);
              (*((void (**)(id, char *, id))v56 + 4))(v57, v58, v163);
              uint64_t v164 = (uint64_t)&v54[5];
              __swift_project_boxed_opaque_existential_1(&v54[5].receiver, (uint64_t)v54[6].super_class);
              sub_252831B48();
              sub_2528313A8();
              swift_bridgeObjectRelease();
              sub_2528317C8();
              swift_bridgeObjectRelease();
              v170[0] = 0x6E756F6620746F6ELL;
              v170[1] = 0xAE00209380E22064;
              sub_252831808();
              sub_2528313A8();
              swift_bridgeObjectRelease();
              sub_2528313A8();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRetain();
              v59 = sub_252831138();
              os_log_type_t v60 = sub_252831618();
              uint64_t v18 = v54;
              if (os_log_type_enabled(v59, v60))
              {
                v61 = (uint8_t *)swift_slowAlloc();
                uint64_t v62 = swift_slowAlloc();
                v170[0] = v62;
                *(_DWORD *)v61 = 136315138;
                swift_bridgeObjectRetain();
                v54[13].unint64_t receiver = (id)sub_25278F894(0xD00000000000001FLL, 0x800000025283E0F0, v170);
                sub_252831698();
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_25277D000, v59, v60, "%s", v61, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x2533BE070](v62, -1, -1);
                MEMORY[0x2533BE070](v61, -1, -1);
              }
              else
              {
                swift_bridgeObjectRelease_n();
              }

              unint64_t v148 = (unint64_t)v54[27].receiver;
              Class v149 = v54[27].super_class;
              uint64_t v150 = (uint64_t)v54[26].super_class;
              Class v169 = v54[22].super_class;
              Class v151 = v54[21].super_class;
              id v161 = v54[21].receiver;
              Class v152 = v54[18].super_class;
              id v153 = v54[19].receiver;
              id v154 = v54[18].receiver;
              type metadata accessor for NetworkError();
              sub_2527B3838();
              os_log_type_t v29 = (objc_class *)swift_allocError();
              unsigned char *v155 = 1;
              swift_storeEnumTagMultiPayload();
              swift_willThrow();
              sub_252782E20(v150, v148);

              (*((void (**)(id, id))v152 + 1))(v153, v154);
              (*((void (**)(Class, id))v151 + 1))(v169, v161);
              __swift_destroy_boxed_opaque_existential_0(v164);

              break;
            }
            v52[1](v53, v55);
            uint64_t v18 = v54;
          }

          v125 = sub_252831138();
          os_log_type_t v126 = sub_252831618();
          if (os_log_type_enabled(v125, v126))
          {
            v127 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v127 = 0;
            _os_log_impl(&dword_25277D000, v125, v126, "Error while decoding response from server", v127, 2u);
            MEMORY[0x2533BE070](v127, -1, -1);
          }

          id v128 = v48;
          id v129 = v48;
          v130 = sub_252831138();
          os_log_type_t v131 = sub_252831618();
          if (os_log_type_enabled(v130, v131))
          {
            v132 = (uint8_t *)swift_slowAlloc();
            uint64_t v133 = swift_slowAlloc();
            v170[0] = v133;
            *(_DWORD *)v132 = 136315138;
            swift_getErrorValue();
            uint64_t v134 = sub_252831AA8();
            v18[12].unint64_t receiver = (id)sub_25278F894(v134, v135, v170);
            sub_252831698();
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_25277D000, v130, v131, "%s", v132, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2533BE070](v133, -1, -1);
            MEMORY[0x2533BE070](v132, -1, -1);
          }
          else
          {
          }
          unint64_t v136 = (unint64_t)v18[27].receiver;
          Class v137 = v18[27].super_class;
          uint64_t v138 = (uint64_t)v18[26].super_class;
          Class v139 = v18[22].super_class;
          id v140 = v18[21].receiver;
          Class v141 = v18[21].super_class;
          type metadata accessor for NetworkError();
          sub_2527B3838();
          os_log_type_t v29 = (objc_class *)swift_allocError();
          unsigned char *v142 = 1;
          swift_storeEnumTagMultiPayload();
          swift_willThrow();
          sub_252782E20(v138, v136);

          (*((void (**)(Class, id))v141 + 1))(v139, v140);
        }
        break;
    }
  }
  else
  {
    uint64_t v18 = (objc_super *)v0;
    if (qword_269C1CEC0 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_252831158();
    __swift_project_value_buffer(v31, (uint64_t)qword_269C2D2B0);
    uint64_t v32 = sub_252831138();
    os_log_type_t v33 = sub_252831618();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_25277D000, v32, v33, "Unable to process Authorization response from Utility.", v34, 2u);
      MEMORY[0x2533BE070](v34, -1, -1);
    }
    unint64_t v35 = (unint64_t)v18[27].receiver;
    Class v36 = v18[27].super_class;
    uint64_t v37 = (uint64_t)v18[26].super_class;
    Class v38 = v18[22].super_class;
    id v39 = v18[21].receiver;
    Class v40 = v18[21].super_class;

    type metadata accessor for NetworkError();
    sub_2527B3838();
    os_log_type_t v29 = (objc_class *)swift_allocError();
    *uint64_t v41 = 2;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    sub_252782E20(v37, v35);

    (*((void (**)(Class, id))v40 + 1))(v38, v39);
  }
  v18[12].Class super_class = v29;
  v97 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D4C0);
  int v98 = swift_dynamicCast();
  v100 = (void (**)(Class, Class))v18[24].receiver;
  Class v99 = v18[24].super_class;
  Class v101 = v18[23].super_class;
  if (v98)
  {
    Class v102 = v18[11].super_class;
    sub_252812AFC();
    swift_allocError();
    Class *v103 = v102;
  }
  else
  {
    sub_252826B80(v29);
  }
  swift_willThrow();

  v100[1](v99, v101);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v104 = (uint64_t (*)(void))v18->super_class;
  return v104();
}

uint64_t sub_25282A6E4()
{
  (*(void (**)(void, void))(v0[43] + 8))(v0[45], v0[42]);
  uint64_t v1 = (void *)v0[56];
  v0[25] = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D4C0);
  int v3 = swift_dynamicCast();
  uint64_t v5 = v0[48];
  uint64_t v4 = v0[49];
  uint64_t v6 = v0[47];
  if (v3)
  {
    uint64_t v7 = v0[23];
    sub_252812AFC();
    swift_allocError();
    void *v8 = v7;
  }
  else
  {
    sub_252826B80(v1);
  }
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

unint64_t sub_25282A85C(unint64_t result)
{
  if (result > 8) {
    return 0;
  }
  return result;
}

unint64_t sub_25282A870()
{
  unint64_t result = qword_269C1E9D8;
  if (!qword_269C1E9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1E9D8);
  }
  return result;
}

unint64_t sub_25282A8C8()
{
  unint64_t result = qword_269C1E9E0;
  if (!qword_269C1E9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1E9E0);
  }
  return result;
}

unint64_t sub_25282A920()
{
  unint64_t result = qword_269C1E9E8;
  if (!qword_269C1E9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1E9E8);
  }
  return result;
}

unint64_t sub_25282A978()
{
  unint64_t result = qword_269C1E9F0;
  if (!qword_269C1E9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1E9F0);
  }
  return result;
}

unint64_t sub_25282A9D0()
{
  unint64_t result = qword_269C1E9F8;
  if (!qword_269C1E9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1E9F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for TAFAuthorizationError()
{
  return &type metadata for TAFAuthorizationError;
}

uint64_t destroy for AuthorizationFactor(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for AuthorizationFactor(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    a1[6] = a2[6];
    a1[7] = v7;
    uint64_t v8 = a2[8];
    uint64_t v9 = a2[9];
    a1[8] = v8;
    a1[9] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v10 = *((_OWORD *)a2 + 4);
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
    *((_OWORD *)a1 + 4) = v10;
  }
  return a1;
}

void *assignWithCopy for AuthorizationFactor(void *a1, void *a2)
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
  uint64_t v4 = a1 + 6;
  uint64_t v5 = a2 + 6;
  uint64_t v6 = a2[7];
  if (a1[7])
  {
    if (v6)
    {
      a1[6] = a2[6];
      a1[7] = a2[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[8] = a2[8];
      a1[9] = a2[9];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_25282AC7C((uint64_t)(a1 + 6));
      long long v7 = *((_OWORD *)a2 + 4);
      *uint64_t v4 = *v5;
      *((_OWORD *)a1 + 4) = v7;
    }
  }
  else if (v6)
  {
    a1[6] = a2[6];
    a1[7] = a2[7];
    a1[8] = a2[8];
    a1[9] = a2[9];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *((_OWORD *)a2 + 4);
    *uint64_t v4 = *v5;
    *((_OWORD *)a1 + 4) = v8;
  }
  return a1;
}

uint64_t sub_25282AC7C(uint64_t a1)
{
  return a1;
}

uint64_t assignWithTake for AuthorizationFactor(uint64_t a1, uint64_t a2)
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
  if (!*(void *)(a1 + 56)) {
    goto LABEL_5;
  }
  uint64_t v7 = *(void *)(a2 + 56);
  if (!v7)
  {
    sub_25282AC7C(a1 + 48);
LABEL_5:
    long long v9 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v9;
    return a1;
  }
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for AuthorizationFactor()
{
  return &type metadata for AuthorizationFactor;
}

ValueMetadata *type metadata accessor for TAFAuthorizationEndpoints()
{
  return &type metadata for TAFAuthorizationEndpoints;
}

void *sub_25282AD78(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EA98);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25282BD20();
  sub_252831B28();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EAA8);
    sub_25282BD74(&qword_269C1EAB0, (void (*)(void))sub_2527907E0);
    sub_252831998();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v7 = (void *)v9[1];
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_25282AF20()
{
  unint64_t v0 = sub_252831918();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25282AF6C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EA00);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25282B31C();
  sub_252831B28();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  LOBYTE(v33) = 0;
  uint64_t v9 = sub_252831968();
  uint64_t v11 = v10;
  uint64_t v31 = v9;
  LOBYTE(v33) = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_252831968();
  uint64_t v32 = v13;
  uint64_t v29 = v12;
  uint64_t v30 = v11;
  LOBYTE(v33) = 2;
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_252831968();
  char v37 = 3;
  uint64_t v15 = v14;
  sub_25282B370();
  uint64_t v28 = v15;
  swift_bridgeObjectRetain();
  sub_252831958();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v16 = v33;
  uint64_t v17 = v34;
  uint64_t v26 = v33;
  uint64_t v18 = v35;
  uint64_t v19 = v36;
  uint64_t v20 = v30;
  swift_bridgeObjectRetain();
  uint64_t v21 = v32;
  swift_bridgeObjectRetain();
  uint64_t v22 = v28;
  swift_bridgeObjectRetain();
  sub_25282B3C4(v16, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v23 = v26;
  uint64_t result = sub_252792C74(v26, v17);
  *a2 = v31;
  a2[1] = v20;
  a2[2] = v29;
  a2[3] = v21;
  a2[4] = v27;
  a2[5] = v22;
  a2[6] = v23;
  a2[7] = v17;
  a2[8] = v18;
  a2[9] = v19;
  return result;
}

unint64_t sub_25282B31C()
{
  unint64_t result = qword_269C1EA08;
  if (!qword_269C1EA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA08);
  }
  return result;
}

unint64_t sub_25282B370()
{
  unint64_t result = qword_269C1EA10;
  if (!qword_269C1EA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA10);
  }
  return result;
}

uint64_t sub_25282B3C4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25282B408(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EA20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_25282B470()
{
  unint64_t result = qword_269C1EA28;
  if (!qword_269C1EA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA28);
  }
  return result;
}

uint64_t sub_25282B4C4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x796669726576 && a2 == 0xE600000000000000;
  if (v2 || (sub_252831A58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684956531 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_252831A58();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25282B5A0(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EA30);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25282B7A8();
  sub_252831B28();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    char v11 = 0;
    uint64_t v7 = sub_252831968();
    char v10 = 1;
    swift_bridgeObjectRetain();
    sub_252831968();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_25282B7A8()
{
  unint64_t result = qword_269C1EA38;
  if (!qword_269C1EA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA38);
  }
  return result;
}

unint64_t sub_25282B7FC()
{
  unint64_t result = qword_269C1EA48;
  if (!qword_269C1EA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA48);
  }
  return result;
}

unint64_t sub_25282B850()
{
  unint64_t result = qword_269C1EA58;
  if (!qword_269C1EA58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA58);
  }
  return result;
}

unint64_t sub_25282B8A4()
{
  unint64_t result = qword_269C1EA60;
  if (!qword_269C1EA60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA60);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountLookupResponse()
{
  return &type metadata for AccountLookupResponse;
}

unsigned char *storeEnumTagSinglePayload for TAFAuthorizationEndpoints.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25282B9D4);
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

ValueMetadata *type metadata accessor for TAFAuthorizationEndpoints.CodingKeys()
{
  return &type metadata for TAFAuthorizationEndpoints.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for AuthorizationFactor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25282BAD8);
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

ValueMetadata *type metadata accessor for AuthorizationFactor.CodingKeys()
{
  return &type metadata for AuthorizationFactor.CodingKeys;
}

unint64_t sub_25282BB14()
{
  unint64_t result = qword_269C1EA68;
  if (!qword_269C1EA68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA68);
  }
  return result;
}

unint64_t sub_25282BB6C()
{
  unint64_t result = qword_269C1EA70;
  if (!qword_269C1EA70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA70);
  }
  return result;
}

unint64_t sub_25282BBC4()
{
  unint64_t result = qword_269C1EA78;
  if (!qword_269C1EA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA78);
  }
  return result;
}

unint64_t sub_25282BC1C()
{
  unint64_t result = qword_269C1EA80;
  if (!qword_269C1EA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA80);
  }
  return result;
}

unint64_t sub_25282BC74()
{
  unint64_t result = qword_269C1EA88;
  if (!qword_269C1EA88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA88);
  }
  return result;
}

unint64_t sub_25282BCCC()
{
  unint64_t result = qword_269C1EA90;
  if (!qword_269C1EA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EA90);
  }
  return result;
}

unint64_t sub_25282BD20()
{
  unint64_t result = qword_269C1EAA0;
  if (!qword_269C1EAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EAA0);
  }
  return result;
}

uint64_t sub_25282BD74(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C1EAA8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AccountLookupResponse.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25282BE80);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountLookupResponse.CodingKeys()
{
  return &type metadata for AccountLookupResponse.CodingKeys;
}

unint64_t sub_25282BEBC()
{
  unint64_t result = qword_269C1EAC8;
  if (!qword_269C1EAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EAC8);
  }
  return result;
}

unint64_t sub_25282BF14()
{
  unint64_t result = qword_269C1EAD0;
  if (!qword_269C1EAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EAD0);
  }
  return result;
}

unint64_t sub_25282BF6C()
{
  unint64_t result = qword_269C1EAD8;
  if (!qword_269C1EAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EAD8);
  }
  return result;
}

uint64_t sub_25282BFC0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_25282BFD4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_25282BFE8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_25282BFFC()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  sub_252830858();
  swift_allocObject();
  sub_252830848();
  long long v1 = v0[1];
  long long v19 = *v0;
  long long v20 = v1;
  long long v2 = v0[3];
  long long v21 = v0[2];
  long long v22 = v2;
  sub_25282CE90();
  uint64_t v3 = sub_252830838();
  unint64_t v5 = v4;
  swift_release();
  unsigned int v6 = self;
  uint64_t v7 = (void *)sub_252830C48();
  *(void *)&long long v19 = 0;
  id v8 = objc_msgSend(v6, sel_JSONObjectWithData_options_error_, v7, 4, &v19);

  id v9 = (id)v19;
  if (v8)
  {
    sub_252831738();
    swift_unknownObjectRelease();
  }
  else
  {
    char v10 = v9;
    char v11 = (void *)sub_252830B18();

    swift_willThrow();
    long long v19 = 0u;
    long long v20 = 0u;
  }
  sub_2527845D0((uint64_t)&v19, (uint64_t)&v16);
  if (v17)
  {
    sub_2527933EC(&v16, v15);
    sub_252784638((uint64_t)v15, (uint64_t)v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EAF0);
    if ((swift_dynamicCast() & 1) == 0) {
      uint64_t v18 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    uint64_t v12 = v18;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v18 = 0;
  }
  sub_252782E20(v3, v5);
  sub_252784570((uint64_t)&v19);
  return v12;
}

id sub_25282C208(uint64_t a1)
{
  long long v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_25282CE50();
    unint64_t v4 = (void *)sub_252831218();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_25282C294(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EB00);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25282D0E8();
  sub_252831B38();
  v10[15] = 0;
  sub_2528319E8();
  if (!v2)
  {
    v10[14] = 1;
    sub_2528319E8();
    v10[13] = 2;
    sub_2528319E8();
    v10[12] = *(unsigned char *)(v3 + 48);
    v10[11] = 3;
    sub_25282D13C();
    sub_252831A18();
    v10[10] = 4;
    sub_252831A08();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25282C484()
{
  uint64_t result = 0x497974696C697475;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x4974736575716572;
      break;
    case 2:
      uint64_t result = 0x74616C6572726F63;
      break;
    case 3:
      uint64_t result = 1701869940;
      break;
    case 4:
      uint64_t result = 0x6E6F697461727564;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25282C534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25282D190(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25282C55C(uint64_t a1)
{
  unint64_t v2 = sub_25282D0E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25282C598(uint64_t a1)
{
  unint64_t v2 = sub_25282D0E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

double sub_25282C5D4@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_25282D3DC(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    long long v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t sub_25282C618(void *a1)
{
  return sub_25282C294(a1);
}

uint64_t sub_25282C630(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2527A6B04(*a1, *a2);
}

uint64_t sub_25282C63C()
{
  return sub_252831B18();
}

uint64_t sub_25282C6E8()
{
  sub_252831258();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25282C780()
{
  return sub_252831B18();
}

uint64_t sub_25282C828@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25282DB9C();
  *a1 = result;
  return result;
}

void sub_25282C858(unint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0x800000025283A7D0;
  unint64_t v4 = 0xE800000000000000;
  uint64_t v5 = 0x65646F43646E6573;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6F43796669726576;
    unint64_t v4 = 0xEA00000000006564;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = 0xD000000000000010;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_25282C8C0()
{
  return sub_2528314B8();
}

uint64_t sub_25282C920()
{
  return sub_252831498();
}

uint64_t sub_25282C970@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  int v28 = a7;
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  uint64_t v15 = sub_252830DB8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252830D78();
  sub_252830C98();
  double v20 = v19;
  long long v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v21(a8, v15);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v21)(v18, v15);
  double v23 = v20 * 1000.0;
  if ((~COERCE__INT64(v20 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v23 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v23 < 9.22337204e18)
  {
    *(void *)a9 = a1;
    *(void *)(a9 + 8) = a2;
    *(void *)(a9 + 16) = a3;
    *(void *)(a9 + 24) = a4;
    uint64_t v24 = v27;
    *(void *)(a9 + 32) = v26;
    *(void *)(a9 + 40) = v24;
    *(unsigned char *)(a9 + 48) = v28;
    *(void *)(a9 + 56) = (uint64_t)v23;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_25282CB08()
{
  uint64_t v0 = sub_25282BFFC();
  if (v0) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = MEMORY[0x263F8EE80];
  }
  if (qword_269C1CF08 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252831158();
  __swift_project_value_buffer(v2, (uint64_t)qword_269C2D388);
  swift_bridgeObjectRetain_n();
  unint64_t v3 = sub_252831138();
  os_log_type_t v4 = sub_252831628();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    aBlock[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_25278F894(0xD00000000000002ELL, 0x800000025283E130, aBlock);
    sub_252831698();
    *(_WORD *)(v5 + 12) = 2080;
    sub_25282CE50();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_252831238();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    sub_25278F894(v7, v9, aBlock);
    sub_252831698();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25277D000, v3, v4, "Sending analytics event for [%s]: %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533BE070](v6, -1, -1);
    MEMORY[0x2533BE070](v5, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  char v10 = (void *)sub_252831298();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  aBlock[4] = (uint64_t)sub_25282CE30;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_25282C208;
  aBlock[3] = (uint64_t)&block_descriptor_2;
  uint64_t v12 = _Block_copy(aBlock);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v12);
}

uint64_t sub_25282CDF8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25282CE30()
{
  return swift_bridgeObjectRetain();
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

unint64_t sub_25282CE50()
{
  unint64_t result = qword_269C1EAE0;
  if (!qword_269C1EAE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C1EAE0);
  }
  return result;
}

unint64_t sub_25282CE90()
{
  unint64_t result = qword_269C1EAE8;
  if (!qword_269C1EAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EAE8);
  }
  return result;
}

uint64_t initializeWithCopy for UtilityTransactionData(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UtilityTransactionData(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for UtilityTransactionData(uint64_t a1, uint64_t a2)
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
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

ValueMetadata *type metadata accessor for UtilityTransactionData()
{
  return &type metadata for UtilityTransactionData;
}

unint64_t sub_25282D064(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_25282D094();
  unint64_t result = sub_25282CE90();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_25282D094()
{
  unint64_t result = qword_269C1EAF8;
  if (!qword_269C1EAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EAF8);
  }
  return result;
}

unint64_t sub_25282D0E8()
{
  unint64_t result = qword_269C1EB08;
  if (!qword_269C1EB08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EB08);
  }
  return result;
}

unint64_t sub_25282D13C()
{
  unint64_t result = qword_269C1EB10;
  if (!qword_269C1EB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EB10);
  }
  return result;
}

uint64_t sub_25282D190(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x497974696C697475 && a2 == 0xE900000000000044;
  if (v2 || (sub_252831A58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4974736575716572 && a2 == 0xE900000000000044 || (sub_252831A58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74616C6572726F63 && a2 == 0xED000044496E6F69 || (sub_252831A58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000 || (sub_252831A58() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_252831A58();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_25282D3DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1EB18);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25282D0E8();
  sub_252831B28();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v33 = 0;
  uint64_t v9 = sub_252831968();
  uint64_t v11 = v10;
  uint64_t v26 = v9;
  char v32 = 1;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_252831968();
  uint64_t v27 = v13;
  uint64_t v23 = v12;
  char v31 = 2;
  swift_bridgeObjectRetain();
  uint64_t v25 = 0;
  uint64_t v22 = sub_252831968();
  char v29 = 3;
  uint64_t v15 = v14;
  sub_25282D78C();
  swift_bridgeObjectRetain();
  sub_252831998();
  uint64_t v24 = v15;
  int v21 = v30;
  char v28 = 4;
  uint64_t v16 = sub_252831988();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  uint64_t v17 = v24;
  swift_bridgeObjectRelease();
  uint64_t v18 = v27;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v26;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v23;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v22;
  *(void *)(a2 + 40) = v17;
  *(unsigned char *)(a2 + 48) = v21;
  *(void *)(a2 + 56) = v16;
  return result;
}

unint64_t sub_25282D78C()
{
  unint64_t result = qword_269C1EB20;
  if (!qword_269C1EB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EB20);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for UtilityTransactionData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25282D8ACLL);
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

ValueMetadata *type metadata accessor for UtilityTransactionData.CodingKeys()
{
  return &type metadata for UtilityTransactionData.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for UtilityTransactionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25282D9B0);
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

ValueMetadata *type metadata accessor for UtilityTransactionType()
{
  return &type metadata for UtilityTransactionType;
}

unint64_t sub_25282D9EC()
{
  unint64_t result = qword_269C1EB28;
  if (!qword_269C1EB28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EB28);
  }
  return result;
}

unint64_t sub_25282DA44()
{
  unint64_t result = qword_269C1EB30;
  if (!qword_269C1EB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EB30);
  }
  return result;
}

unint64_t sub_25282DA9C()
{
  unint64_t result = qword_269C1EB38;
  if (!qword_269C1EB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EB38);
  }
  return result;
}

unint64_t sub_25282DAF4()
{
  unint64_t result = qword_269C1EB40;
  if (!qword_269C1EB40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C1EB40);
  }
  return result;
}

unint64_t sub_25282DB48()
{
  unint64_t result = qword_269C1EB48;
  if (!qword_269C1EB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269C1EB48);
  }
  return result;
}

uint64_t sub_25282DB9C()
{
  unint64_t v0 = sub_252831918();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_25282DBE8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v3 = a1;
  uint64_t v33 = MEMORY[0x263F8EE78];
  sub_25278FF34(0, v1, 0);
  uint64_t v2 = v33;
  uint64_t result = sub_25282F588(v3);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = v3 + 64;
  uint64_t v27 = v3 + 80;
  int64_t v28 = v1;
  int v29 = v5;
  uint64_t v30 = v3 + 64;
  uint64_t v31 = v3;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(v3 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(v3 + 36) != v5) {
      goto LABEL_24;
    }
    uint64_t v32 = v7;
    uint64_t v12 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v6);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 56) + 16 * v6);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B22BFF0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_252835580;
    *(void *)(inited + 32) = 0x6D614E646C656966;
    *(void *)(inited + 40) = 0xE900000000000065;
    *(void *)(inited + 48) = v13;
    *(void *)(inited + 56) = v14;
    *(void *)(inited + 64) = 0x65756C6176;
    *(void *)(inited + 72) = 0xE500000000000000;
    *(void *)(inited + 80) = v17;
    *(void *)(inited + 88) = v16;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    unint64_t v19 = sub_252786E88(inited);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v21 = *(void *)(v33 + 16);
    unint64_t v20 = *(void *)(v33 + 24);
    if (v21 >= v20 >> 1) {
      uint64_t result = sub_25278FF34(v20 > 1, v21 + 1, 1);
    }
    *(void *)(v33 + 16) = v21 + 1;
    *(void *)(v33 + 8 * v21 + 32) = v19;
    uint64_t v3 = v31;
    int64_t v9 = 1 << *(unsigned char *)(v31 + 32);
    if (v6 >= v9) {
      goto LABEL_25;
    }
    uint64_t v8 = v30;
    uint64_t v22 = *(void *)(v30 + 8 * v11);
    if ((v22 & (1 << v6)) == 0) {
      goto LABEL_26;
    }
    int v5 = v29;
    if (*(_DWORD *)(v31 + 36) != v29) {
      goto LABEL_27;
    }
    unint64_t v23 = v22 & (-2 << (v6 & 0x3F));
    if (v23)
    {
      int64_t v9 = __clz(__rbit64(v23)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v28;
    }
    else
    {
      unint64_t v24 = v11 + 1;
      unint64_t v25 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v28;
      if (v11 + 1 < v25)
      {
        unint64_t v26 = *(void *)(v30 + 8 * v24);
        if (v26)
        {
LABEL_20:
          int64_t v9 = __clz(__rbit64(v26)) + (v24 << 6);
        }
        else
        {
          while (v25 - 2 != v11)
          {
            unint64_t v26 = *(void *)(v27 + 8 * v11++);
            if (v26)
            {
              unint64_t v24 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    uint64_t v7 = v32 + 1;
    uint64_t v6 = v9;
    if (v32 + 1 == v10) {
      return v2;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25282DE9C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22BD40);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2528307F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  char v13 = sub_25280DF84();
  int v44 = a2;
  switch(v13)
  {
    case 1:
LABEL_4:
      swift_bridgeObjectRelease();
      goto LABEL_6;
    default:
      char v14 = sub_252831A58();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        switch(v13)
        {
          case 0:
            goto LABEL_4;
          case 1:
          case 2:
          case 3:
            char v15 = sub_252831A58();
            swift_bridgeObjectRelease();
            if (v15) {
              goto LABEL_6;
            }
            if (qword_269C1CEC8 != -1) {
              swift_once();
            }
            uint64_t v24 = sub_252831158();
            __swift_project_value_buffer(v24, (uint64_t)qword_269C2D2C8);
            unint64_t v25 = sub_252831138();
            os_log_type_t v26 = sub_252831628();
            if (os_log_type_enabled(v25, v26))
            {
              uint64_t v27 = v12;
              int64_t v28 = (uint8_t *)swift_slowAlloc();
              uint64_t v29 = swift_slowAlloc();
              uint64_t v46 = v29;
              *(_DWORD *)int64_t v28 = 136315138;
              uint64_t v30 = 1953654115;
              if (v13 != 2) {
                uint64_t v30 = 1685025392;
              }
              if (v13 == 1) {
                uint64_t v31 = 7759204;
              }
              else {
                uint64_t v31 = v30;
              }
              if (v13 == 1) {
                unint64_t v32 = 0xE300000000000000;
              }
              else {
                unint64_t v32 = 0xE400000000000000;
              }
              uint64_t v45 = sub_25278F894(v31, v32, &v46);
              sub_252831698();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_25277D000, v25, v26, "No HMAC Auth headers required in current env %s.", v28, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x2533BE070](v29, -1, -1);
              MEMORY[0x2533BE070](v28, -1, -1);

              uint64_t v12 = v27;
              if (v44) {
                goto LABEL_35;
              }
            }
            else
            {

              if (a2) {
                goto LABEL_35;
              }
            }
            break;
          default:
            JUMPOUT(0);
        }
        goto LABEL_36;
      }
LABEL_6:
      if (qword_269C1CEC8 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_252831158();
      __swift_project_value_buffer(v16, (uint64_t)qword_269C2D2C8);
      uint64_t v17 = sub_252831138();
      os_log_type_t v18 = sub_252831628();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v42 = v12;
        uint64_t v43 = a3;
        unint64_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v20 = swift_slowAlloc();
        uint64_t v46 = v20;
        *(_DWORD *)unint64_t v19 = 136315138;
        unint64_t v21 = 0xE300000000000000;
        uint64_t v22 = v20;
        uint64_t v23 = 7759204;
        switch(v13)
        {
          case 1:
            break;
          case 2:
            unint64_t v21 = 0xE400000000000000;
            uint64_t v23 = 1953654115;
            break;
          case 3:
            unint64_t v21 = 0xE400000000000000;
            uint64_t v23 = 1685025392;
            break;
          default:
            uint64_t v23 = 0x6E7265746E496171;
            unint64_t v21 = 0xEA00000000006C61;
            break;
        }
        uint64_t v45 = sub_25278F894(v23, v21, &v46);
        sub_252831698();
        swift_bridgeObjectRelease();
        swift_arrayDestroy();
        MEMORY[0x2533BE070](v22, -1, -1);
        MEMORY[0x2533BE070](v19, -1, -1);

        uint64_t v12 = v42;
        a3 = v43;
      }
      else
      {
      }
      uint64_t v33 = sub_252831138();
      os_log_type_t v34 = sub_252831628();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v35 = 0;
        _os_log_impl(&dword_25277D000, v33, v34, "Adding HMAC headers.", v35, 2u);
        MEMORY[0x2533BE070](v35, -1, -1);
      }

      sub_252814B24((uint64_t)v8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
      {
        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
        (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
        if (v44) {
LABEL_35:
        }
          sub_2528307E8();
LABEL_36:
        (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v12, v9);
        uint64_t v39 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a3, v39, 1, v9);
      }
      sub_252781C54((uint64_t)v8, &qword_26B22BD40);
      uint64_t v36 = sub_252831138();
      os_log_type_t v37 = sub_252831618();
      if (os_log_type_enabled(v36, v37))
      {
        Class v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)Class v38 = 0;
        _os_log_impl(&dword_25277D000, v36, v37, "Unable to sign with HMAC headers.", v38, 2u);
        MEMORY[0x2533BE070](v38, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      uint64_t v39 = 1;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a3, v39, 1, v9);
  }
}

uint64_t sub_25282E664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  uint64_t v4 = sub_252830DE8();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  uint64_t v5 = sub_2528307F8();
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22BD58);
  v3[14] = swift_task_alloc();
  uint64_t v6 = sub_252830BD8();
  v3[15] = v6;
  v3[16] = *(void *)(v6 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25282E84C, 0, 0);
}

uint64_t sub_25282E84C()
{
  int64_t v1 = (void *)(v0[6] + OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config);
  uint64_t v3 = v1[15];
  unint64_t v2 = v1[16];
  uint64_t v4 = v1[17];
  v0[19] = v4;
  unint64_t v5 = v1[18];
  v0[20] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B22BFE8);
  uint64_t v6 = swift_allocObject();
  v0[21] = v6;
  *(_OWORD *)(v6 + 16) = xmmword_252832B00;
  uint64_t v7 = v1[24];
  uint64_t v8 = v1[25];
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v8;
  uint64_t v9 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v9 = v3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  uint64_t v10 = v0[15];
  uint64_t v11 = v0[16];
  uint64_t v12 = v0[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_252830BA8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v12, 1, v10) == 1)
  {
    uint64_t v13 = v0[14];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_252781C54(v13, &qword_26B22BD58);
LABEL_7:
    if (qword_269C1CEC8 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_252831158();
    __swift_project_value_buffer(v14, (uint64_t)qword_269C2D2C8);
    char v15 = sub_252831138();
    os_log_type_t v16 = sub_252831618();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_25277D000, v15, v16, "Unable to generate TAF Authorization URL", v17, 2u);
      MEMORY[0x2533BE070](v17, -1, -1);
    }
    uint64_t v18 = v0[11];
    uint64_t v19 = v0[12];
    uint64_t v20 = v0[5];

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v20, 1, 1, v18);
LABEL_12:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v21 = (uint64_t (*)(void))v0[1];
    return v21();
  }
  (*(void (**)(void, void, void))(v0[16] + 32))(v0[18], v0[14], v0[15]);
  uint64_t v23 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0) {
    uint64_t v23 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (!v23)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_269C1CEC8 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_252831158();
    __swift_project_value_buffer(v25, (uint64_t)qword_269C2D2C8);
    os_log_type_t v26 = sub_252831138();
    os_log_type_t v27 = sub_252831618();
    if (os_log_type_enabled(v26, v27))
    {
      int64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v28 = 0;
      _os_log_impl(&dword_25277D000, v26, v27, "Unable to generate TAF Authorization URL | UtilityConfiguration contains empty ClientID", v28, 2u);
      MEMORY[0x2533BE070](v28, -1, -1);
    }
    uint64_t v29 = v0[18];
    uint64_t v30 = v0[15];
    uint64_t v31 = v0[16];
    uint64_t v32 = v0[11];
    uint64_t v33 = v0[12];
    uint64_t v34 = v0[5];

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56))(v34, 1, 1, v32);
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  uint64_t v24 = (void *)swift_task_alloc();
  v0[22] = v24;
  void *v24 = v0;
  v24[1] = sub_25282ECE0;
  return sub_2527E5764(v6, 0);
}

uint64_t sub_25282ECE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[23] = a1;
  v4[24] = a2;
  v4[25] = v2;
  swift_task_dealloc();
  if (v2)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();

    unint64_t v5 = sub_25282F330;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v5 = sub_25282EE70;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25282EE70()
{
  uint64_t v1 = *(void *)(v0 + 56);
  sub_2527E858C(*(void *)(v0 + 168));
  swift_bridgeObjectRelease();
  sub_25282DBE8(v1);
  unint64_t v2 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C1DFE8);
  uint64_t v3 = (void *)sub_2528314E8();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 32) = 0;
  id v4 = objc_msgSend(v2, sel_dataWithJSONObject_options_error_, v3, 0, v0 + 32);

  id v5 = *(id *)(v0 + 32);
  if (v4)
  {
    uint64_t v6 = *(void *)(v0 + 144);
    uint64_t v8 = *(void *)(v0 + 128);
    uint64_t v7 = *(void *)(v0 + 136);
    uint64_t v9 = *(void *)(v0 + 120);
    uint64_t v10 = *(void *)(v0 + 104);
    uint64_t v11 = *(void *)(v0 + 80);
    uint64_t v33 = *(void *)(v0 + 96);
    uint64_t v34 = *(void *)(v0 + 88);
    uint64_t v12 = *(void *)(v0 + 64);
    uint64_t v13 = *(void *)(v0 + 72);
    uint64_t v32 = *(void *)(v0 + 40);
    uint64_t v14 = sub_252830C68();
    unint64_t v30 = v15;
    uint64_t v31 = v14;

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v6, v9);
    sub_252830798();
    sub_252830DD8();
    sub_252830DC8();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    sub_252831328();
    swift_bridgeObjectRelease();
    sub_2528307B8();
    swift_bridgeObjectRelease();
    sub_2528313A8();
    swift_bridgeObjectRelease();
    sub_2528307B8();
    swift_bridgeObjectRelease();
    sub_2528307B8();
    swift_bridgeObjectRelease();
    sub_252830778();
    sub_252782DC8(v31, v30);
    sub_2528307D8();
    sub_25282DE9C(v10, 1, v32);
    sub_252782E20(v31, v30);
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v10, v34);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v9);
  }
  else
  {
    os_log_type_t v16 = v5;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v17 = (void *)sub_252830B18();

    swift_willThrow();
    if (qword_269C1CEC8 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_252831158();
    __swift_project_value_buffer(v18, (uint64_t)qword_269C2D2C8);
    uint64_t v19 = sub_252831138();
    os_log_type_t v20 = sub_252831618();
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v21 = 0;
      _os_log_impl(&dword_25277D000, v19, v20, "Unable to encode TAF Authorization fields", v21, 2u);
      MEMORY[0x2533BE070](v21, -1, -1);
    }
    uint64_t v22 = *(void *)(v0 + 144);
    uint64_t v23 = *(void *)(v0 + 120);
    uint64_t v24 = *(void *)(v0 + 128);
    uint64_t v25 = *(void *)(v0 + 88);
    uint64_t v26 = *(void *)(v0 + 96);
    uint64_t v27 = *(void *)(v0 + 40);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(v27, 1, 1, v25);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int64_t v28 = *(uint64_t (**)(void))(v0 + 8);
  return v28();
}

uint64_t sub_25282F330()
{
  uint64_t v13 = v0;
  v12[1] = *MEMORY[0x263EF8340];
  if (qword_269C1CEC8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_252831158();
  __swift_project_value_buffer(v1, (uint64_t)qword_269C2D2C8);
  unint64_t v2 = sub_252831138();
  os_log_type_t v3 = sub_252831618();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[16];
  if (v4)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    v12[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    v0[2] = sub_25278F894(0xD000000000000045, 0x800000025283E180, v12);
    sub_252831698();
    _os_log_impl(&dword_25277D000, v2, v3, "Unable to generate Private Access Token. %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533BE070](v9, -1, -1);
    MEMORY[0x2533BE070](v8, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[12] + 56))(v0[5], 1, 1, v0[11]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_25282F588(uint64_t a1)
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

double static UtilityPeakPeriodsController.generateMockUtilityPeakPeriods(start:)@<D0>(uint64_t *a1@<X8>)
{
  v97 = a1;
  uint64_t v110 = sub_252830E98();
  unint64_t v1 = *(char **)(v110 - 8);
  MEMORY[0x270FA5388](v110);
  uint64_t v3 = (char *)&v95 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22BD70);
  MEMORY[0x270FA5388](v4 - 8);
  unsigned int v6 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_252830DB8();
  unint64_t v7 = *(char **)(v101 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v101);
  unint64_t v10 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  v100 = (char *)&v95 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v96 = (char *)&v95 - v14;
  MEMORY[0x270FA5388](v13);
  Class v102 = (char *)&v95 - v15;
  if (qword_26B22BEE0 != -1) {
    goto LABEL_31;
  }
  while (1)
  {
    uint64_t v16 = sub_252831158();
    __swift_project_value_buffer(v16, (uint64_t)qword_26B22C058);
    uint64_t v17 = sub_252831138();
    os_log_type_t v18 = sub_252831628();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_25277D000, v17, v18, "Generating Mock Data for Utility Peak", v19, 2u);
      MEMORY[0x2533BE070](v19, -1, -1);
    }

    os_log_type_t v20 = v102;
    sub_252830D08();
    sub_2528300CC();
    char v22 = v21;
    uint64_t v23 = (void (*)(char *, uint64_t))*((void *)v7 + 1);
    uint64_t v24 = v20;
    uint64_t v25 = v101;
    uint64_t v106 = v7 + 8;
    Class v99 = v23;
    v23(v24, v101);
    if (v22)
    {
      uint64_t v26 = sub_252831138();
      os_log_type_t v27 = sub_252831618();
      if (os_log_type_enabled(v26, v27))
      {
        int64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int64_t v28 = 0;
        uint64_t v29 = "Mock Service unable to calculate end date properly.";
        goto LABEL_10;
      }
LABEL_11:

      unint64_t v30 = v97;
      v97[10] = 0;
      double result = 0.0;
      *((_OWORD *)v30 + 3) = 0u;
      *((_OWORD *)v30 + 4) = 0u;
      *((_OWORD *)v30 + 1) = 0u;
      *((_OWORD *)v30 + 2) = 0u;
      *(_OWORD *)unint64_t v30 = 0u;
      return result;
    }
    sub_252830E78();
    sub_252830E48();
    (*((void (**)(char *, uint64_t))v1 + 1))(v3, v110);
    (*((void (**)(char *, void, uint64_t, uint64_t))v7 + 7))(v6, 0, 1, v25);
    if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v7 + 6))(v6, 1, v25) == 1)
    {
      sub_2527CE14C((uint64_t)v6);
      uint64_t v26 = sub_252831138();
      os_log_type_t v27 = sub_252831618();
      if (os_log_type_enabled(v26, v27))
      {
        int64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int64_t v28 = 0;
        uint64_t v29 = "Mock Service unable to calculate start date properly.";
LABEL_10:
        _os_log_impl(&dword_25277D000, v26, v27, v29, v28, 2u);
        MEMORY[0x2533BE070](v28, -1, -1);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    uint64_t v32 = v25;
    uint64_t v33 = (char *)*((void *)v7 + 4);
    uint64_t v34 = v96;
    unint64_t v107 = v7 + 32;
    int v98 = v33;
    ((void (*)(char *, char *, uint64_t))v33)(v96, v6, v25);
    sub_252830D08();
    (*((void (**)(char *, char *, uint64_t))v7 + 2))(v10, v34, v25);
    char v35 = sub_252830D28();
    uint64_t v36 = (void *)MEMORY[0x263F8EE78];
    if ((v35 & 1) == 0) {
      break;
    }
    while (1)
    {
      id v37 = sub_252808B68();
      Class v38 = (void *)sub_252830D18();
      id v39 = objc_msgSend(v37, sel_stringFromDate_, v38);

      uint64_t v105 = sub_2528312A8();
      uint64_t v110 = v40;

      unint64_t v7 = v102;
      uint64_t v41 = v10;
      sub_252830D08();
      uint64_t v42 = v10;
      uint64_t v43 = v99;
      v99(v42, v32);
      uint64_t v3 = v98;
      ((void (*)(char *, char *, uint64_t))v98)(v41, v7, v32);
      id v44 = sub_252808B68();
      uint64_t v45 = (void *)sub_252830D18();
      id v46 = objc_msgSend(v44, sel_stringFromDate_, v45);

      uint64_t v104 = sub_2528312A8();
      uint64_t v109 = v47;

      sub_252830D08();
      v43(v41, v32);
      ((void (*)(char *, char *, uint64_t))v3)(v41, v7, v32);
      id v48 = sub_252808B68();
      uint64_t v49 = (void *)sub_252830D18();
      id v50 = objc_msgSend(v48, sel_stringFromDate_, v49);

      uint64_t v103 = sub_2528312A8();
      uint64_t v108 = v51;

      sub_252830D08();
      unint64_t v1 = v106;
      v43(v41, v32);
      ((void (*)(char *, char *, uint64_t))v3)(v41, v7, v32);
      id v52 = sub_252808B68();
      v53 = (void *)sub_252830D18();
      id v54 = objc_msgSend(v52, sel_stringFromDate_, v53);

      unsigned int v6 = (char *)sub_2528312A8();
      uint64_t v56 = v55;

      sub_252830D08();
      v43(v41, v32);
      unint64_t v10 = v41;
      ((void (*)(char *, char *, uint64_t))v3)(v41, v7, v32);
      int64_t v57 = v36[2];
      int64_t v58 = v57 + 4;
      if (__OFADD__(v57, 4)) {
        break;
      }
      isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v58 > v36[3] >> 1)
      {
        if (v57 <= v58) {
          int64_t v60 = v57 + 4;
        }
        else {
          int64_t v60 = v57;
        }
        uint64_t v36 = sub_252822028(isUniquelyReferenced_nonNull_native, v60, 1, v36);
      }
      unint64_t v62 = v36[2];
      unint64_t v61 = v36[3];
      unint64_t v63 = v62 + 1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v62 >= v61 >> 1) {
        uint64_t v36 = sub_252822028((void *)(v61 > 1), v62 + 1, 1, v36);
      }
      v36[2] = v63;
      uint64_t v64 = (char *)&v36[5 * v62];
      uint64_t v65 = v110;
      *((void *)v64 + 4) = v105;
      *((void *)v64 + 5) = v65;
      strcpy(v64 + 48, "superOffPeak");
      v64[61] = 0;
      *((_WORD *)v64 + 31) = -5120;
      *((void *)v64 + 8) = 0;
      unint64_t v66 = v36[3];
      int64_t v67 = v62 + 2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v63 >= v66 >> 1) {
        uint64_t v36 = sub_252822028((void *)(v66 > 1), v67, 1, v36);
      }
      v36[2] = v67;
      Class v68 = &v36[5 * v63];
      uint64_t v69 = v109;
      v68[4] = v104;
      v68[5] = v69;
      v68[6] = 0x6B61655066666FLL;
      v68[7] = 0xE700000000000000;
      v68[8] = 1;
      unint64_t v70 = v36[2];
      unint64_t v71 = v36[3];
      unint64_t v72 = v70 + 1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v70 >= v71 >> 1) {
        uint64_t v36 = sub_252822028((void *)(v71 > 1), v70 + 1, 1, v36);
      }
      v36[2] = v72;
      os_log_type_t v73 = &v36[5 * v70];
      uint64_t v74 = v108;
      v73[4] = v103;
      v73[5] = v74;
      v73[6] = 0x6B6165506E6FLL;
      v73[7] = 0xE600000000000000;
      v73[8] = 2;
      unint64_t v75 = v36[3];
      unint64_t v76 = v70 + 2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v72 >= v75 >> 1) {
        uint64_t v36 = sub_252822028((void *)(v75 > 1), v70 + 2, 1, v36);
      }
      uint64_t v32 = v101;
      v36[2] = v76;
      uint64_t v77 = &v36[5 * v72];
      v77[4] = v6;
      v77[5] = v56;
      v77[6] = 0x6B61655066666FLL;
      v77[7] = 0xE700000000000000;
      v77[8] = 1;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      if ((sub_252830D28() & 1) == 0) {
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_31:
    swift_once();
  }
LABEL_29:
  id v78 = sub_252808B68();
  os_log_type_t v79 = v96;
  v80 = (void *)sub_252830D18();
  uint64_t v81 = v32;
  id v82 = objc_msgSend(v78, sel_stringFromDate_, v80);

  uint64_t v83 = sub_2528312A8();
  uint64_t v85 = v84;

  id v86 = sub_252808B68();
  os_log_type_t v87 = v100;
  v88 = (void *)sub_252830D18();
  id v89 = objc_msgSend(v86, sel_stringFromDate_, v88);

  uint64_t v90 = sub_2528312A8();
  uint64_t v92 = v91;

  uint64_t v93 = v99;
  v99(v10, v81);
  v93(v87, v81);
  v93(v79, v81);
  v94 = v97;
  uint64_t *v97 = v83;
  v94[1] = v85;
  v94[2] = v90;
  v94[3] = v92;
  v94[4] = (uint64_t)v36;
  *(_OWORD *)(v94 + 5) = xmmword_25283A360;
  *(_OWORD *)(v94 + 7) = xmmword_25283A370;
  *(void *)&double result = 5590868;
  *(_OWORD *)(v94 + 9) = xmmword_25283A380;
  return result;
}

uint64_t sub_2528300CC()
{
  uint64_t v0 = sub_252830E88();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  unsigned int v6 = (char *)&v21 - v5;
  uint64_t v7 = sub_252830E28();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_252830E98();
  uint64_t v11 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F07718], v7);
  sub_252830E38();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v14 = *(void (**)(char *, void, uint64_t))(v1 + 104);
  v14(v6, *MEMORY[0x263F07870], v0);
  v14(v4, *MEMORY[0x263F078A8], v0);
  uint64_t v15 = sub_252830E68();
  uint64_t v17 = v16;
  LOBYTE(v8) = v18;
  uint64_t v19 = *(void (**)(char *, uint64_t))(v1 + 8);
  v19(v4, v0);
  v19(v6, v0);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v22);
  uint64_t result = 0;
  if ((v8 & 1) == 0)
  {
    uint64_t result = v17 - v15;
    if (__OFSUB__(v17, v15)) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_2528303AC(uint64_t a1)
{
  return sub_2528306D0(a1, qword_26B22C058);
}

uint64_t sub_2528303D8(uint64_t a1)
{
  return sub_2528306D0(a1, qword_26B22C0A0);
}

uint64_t sub_252830404(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D238);
}

uint64_t sub_252830428(uint64_t a1)
{
  return sub_2528306D0(a1, qword_26B22C070);
}

uint64_t sub_252830454(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D250);
}

uint64_t sub_252830478(uint64_t a1)
{
  return sub_2528306D0(a1, qword_26B22C088);
}

uint64_t sub_25283049C(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D268);
}

uint64_t sub_2528304C4(uint64_t a1)
{
  return sub_2528306D0(a1, qword_26B22C0B8);
}

uint64_t sub_2528304E4(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D280);
}

uint64_t sub_252830504(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D298);
}

uint64_t sub_252830530(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D2B0);
}

uint64_t sub_252830554(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D2C8);
}

uint64_t sub_252830578(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D2E0);
}

uint64_t sub_25283059C(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D2F8);
}

uint64_t sub_2528305C0(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D310);
}

uint64_t sub_2528305E8(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D328);
}

uint64_t sub_25283060C(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D340);
}

uint64_t sub_252830638(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D358);
}

uint64_t sub_25283065C(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D370);
}

uint64_t sub_252830688(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D388);
}

uint64_t sub_2528306AC(uint64_t a1)
{
  return sub_2528306D0(a1, qword_269C2D3A0);
}

uint64_t sub_2528306D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_252831158();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  swift_bridgeObjectRetain();
  return sub_252831148();
}

uint64_t sub_252830758()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_252830768()
{
  return MEMORY[0x270EEDBA0]();
}

uint64_t sub_252830778()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_252830788()
{
  return MEMORY[0x270EEDC10]();
}

uint64_t sub_252830798()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_2528307A8()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_2528307B8()
{
  return MEMORY[0x270EEDC80]();
}

uint64_t sub_2528307C8()
{
  return MEMORY[0x270EEDC88]();
}

uint64_t sub_2528307D8()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_2528307E8()
{
  return MEMORY[0x270EEDCA0]();
}

uint64_t sub_2528307F8()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_252830808()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_252830818()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_252830828()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_252830838()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_252830848()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_252830858()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_252830868()
{
  return MEMORY[0x270EEE100]();
}

uint64_t sub_252830878()
{
  return MEMORY[0x270EEE168]();
}

uint64_t sub_252830888()
{
  return MEMORY[0x270EEE1A0]();
}

uint64_t sub_252830898()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2528308A8()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_2528308B8()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_2528308C8()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_2528308D8()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_2528308E8()
{
  return MEMORY[0x270EEE4D8]();
}

uint64_t sub_2528308F8()
{
  return MEMORY[0x270EEE4E0]();
}

uint64_t sub_252830908()
{
  return MEMORY[0x270EEE4F0]();
}

uint64_t sub_252830918()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_252830928()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_252830938()
{
  return MEMORY[0x270EEE530]();
}

uint64_t sub_252830948()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_252830958()
{
  return MEMORY[0x270EEE558]();
}

uint64_t sub_252830968()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_252830978()
{
  return MEMORY[0x270EEE590]();
}

uint64_t sub_252830988()
{
  return MEMORY[0x270EEE5A0]();
}

uint64_t sub_252830998()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_2528309A8()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_2528309B8()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_2528309C8()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_2528309D8()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2528309E8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2528309F8()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_252830A08()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_252830A18()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_252830A28()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_252830A38()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_252830A48()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_252830A58()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_252830A68()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_252830A78()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_252830A88()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_252830A98()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_252830AA8()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_252830AF8()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_252830B08()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_252830B18()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_252830B28()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_252830B38()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_252830B48()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_252830B58()
{
  return MEMORY[0x270EEFE50]();
}

uint64_t sub_252830B68()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_252830B78()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_252830B88()
{
  return MEMORY[0x270EEFEA8]();
}

uint64_t sub_252830B98()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_252830BA8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_252830BB8()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_252830BC8()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_252830BD8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_252830BE8()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_252830BF8()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_252830C08()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_252830C18()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_252830C28()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_252830C38()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_252830C48()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_252830C58()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_252830C68()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_252830C78()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_252830C88()
{
  return MEMORY[0x270EF0790]();
}

uint64_t sub_252830C98()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_252830CA8()
{
  return MEMORY[0x270EF07E8]();
}

uint64_t sub_252830CB8()
{
  return MEMORY[0x270EF07F8]();
}

uint64_t sub_252830CC8()
{
  return MEMORY[0x270EF0808]();
}

uint64_t sub_252830CD8()
{
  return MEMORY[0x270EF0820]();
}

uint64_t sub_252830CE8()
{
  return MEMORY[0x270EF0840]();
}

uint64_t sub_252830CF8()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_252830D08()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_252830D18()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_252830D28()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_252830D38()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_252830D48()
{
  return MEMORY[0x270EF0AF0]();
}

uint64_t sub_252830D58()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_252830D68()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_252830D78()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_252830D88()
{
  return MEMORY[0x270EF0BD0]();
}

uint64_t sub_252830D98()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_252830DA8()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_252830DB8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_252830DC8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_252830DD8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_252830DE8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_252830DF8()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_252830E08()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_252830E18()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_252830E28()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_252830E38()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_252830E48()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_252830E58()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_252830E68()
{
  return MEMORY[0x270EF13A8]();
}

uint64_t sub_252830E78()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_252830E88()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_252830E98()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_252830EA8()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_252830EB8()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_252830EC8()
{
  return MEMORY[0x270EF1630]();
}

uint64_t sub_252830ED8()
{
  return MEMORY[0x270EF1670]();
}

uint64_t sub_252830EE8()
{
  return MEMORY[0x270EF1688]();
}

uint64_t sub_252830EF8()
{
  return MEMORY[0x270EF16A8]();
}

uint64_t sub_252830F08()
{
  return MEMORY[0x270EF16C8]();
}

uint64_t sub_252830F18()
{
  return MEMORY[0x270F16CA0]();
}

uint64_t sub_252830F28()
{
  return MEMORY[0x270F16CA8]();
}

uint64_t sub_252830F38()
{
  return MEMORY[0x270F16CB8]();
}

uint64_t sub_252830F48()
{
  return MEMORY[0x270EE57F8]();
}

uint64_t sub_252830F58()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_252830F68()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_252830F78()
{
  return MEMORY[0x270F44A18]();
}

uint64_t sub_252830F88()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_252830F98()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_252830FA8()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_252830FD8()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_252830FE8()
{
  return MEMORY[0x270F44B20]();
}

uint64_t sub_252830FF8()
{
  return MEMORY[0x270F44B40]();
}

uint64_t sub_252831008()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_252831018()
{
  return MEMORY[0x270F44B78]();
}

uint64_t sub_252831028()
{
  return MEMORY[0x270F44B80]();
}

uint64_t sub_252831038()
{
  return MEMORY[0x270F44BB0]();
}

uint64_t sub_252831048()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_252831058()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_252831068()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_252831088()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_252831098()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_2528310A8()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_2528310B8()
{
  return MEMORY[0x270F44D68]();
}

uint64_t sub_2528310C8()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_2528310D8()
{
  return MEMORY[0x270F44DA0]();
}

uint64_t sub_2528310E8()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_2528310F8()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_252831108()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_252831118()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_252831128()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_252831138()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_252831148()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_252831158()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_252831168()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_252831178()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_252831188()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_252831198()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_2528311A8()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_2528311B8()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_2528311C8()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_2528311D8()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t sub_2528311E8()
{
  return MEMORY[0x270EEAD48]();
}

uint64_t sub_2528311F8()
{
  return MEMORY[0x270EEB060]();
}

uint64_t sub_252831208()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_252831218()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_252831228()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_252831238()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_252831248()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_252831258()
{
  return MEMORY[0x270F9D3C0]();
}

uint64_t sub_252831268()
{
  return MEMORY[0x270FA2B38]();
}

uint64_t sub_252831278()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_252831288()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_252831298()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2528312A8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2528312B8()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_2528312C8()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_2528312D8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2528312E8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_2528312F8()
{
  return MEMORY[0x270EF1AC8]();
}

uint64_t sub_252831308()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_252831318()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_252831328()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_252831338()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_252831348()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_252831358()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_252831368()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_252831378()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_252831388()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_252831398()
{
  return MEMORY[0x270F9D790]();
}

uint64_t sub_2528313A8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2528313B8()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_2528313C8()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_2528313D8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2528313E8()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2528313F8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_252831418()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_252831428()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_252831438()
{
  return MEMORY[0x270F9D898]();
}

uint64_t sub_252831448()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_252831458()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_252831468()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_252831478()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_252831488()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_252831498()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2528314A8()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_2528314B8()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2528314C8()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_2528314D8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2528314E8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2528314F8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_252831508()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_252831518()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_252831528()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_252831538()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_252831548()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_252831558()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_252831568()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_252831578()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_252831588()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_252831598()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2528315A8()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2528315B8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2528315E8()
{
  return MEMORY[0x270F16CC0]();
}

uint64_t sub_2528315F8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_252831608()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_252831618()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_252831628()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_252831638()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_252831648()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_252831658()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_252831668()
{
  return MEMORY[0x270F16CC8]();
}

uint64_t sub_252831678()
{
  return MEMORY[0x270EE5950]();
}

uint64_t sub_252831688()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_252831698()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2528316A8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2528316B8()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2528316C8()
{
  return MEMORY[0x270EF2418]();
}

uint64_t sub_2528316D8()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2528316E8()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t sub_2528316F8()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_252831708()
{
  return MEMORY[0x270EF2570]();
}

uint64_t sub_252831718()
{
  return MEMORY[0x270EF25A0]();
}

uint64_t sub_252831728()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_252831738()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_252831748()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_252831758()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_252831768()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_252831778()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_252831788()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_252831798()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2528317A8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2528317B8()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_2528317C8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2528317D8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2528317E8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2528317F8()
{
  return MEMORY[0x270F9EA80]();
}

uint64_t sub_252831808()
{
  return MEMORY[0x270F9EA88]();
}

uint64_t sub_252831818()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_252831828()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_252831838()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_252831848()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_252831858()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_252831868()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_252831878()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_252831888()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_252831898()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2528318A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2528318B8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2528318C8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2528318D8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2528318E8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2528318F8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_252831908()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_252831918()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_252831928()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_252831938()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_252831948()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_252831958()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_252831968()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_252831978()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_252831988()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_252831998()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2528319A8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2528319B8()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_2528319C8()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_2528319D8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2528319E8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2528319F8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_252831A08()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_252831A18()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_252831A28()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_252831A38()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_252831A48()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_252831A58()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_252831A88()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_252831A98()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_252831AA8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_252831AB8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_252831AC8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_252831AD8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_252831AE8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_252831AF8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_252831B08()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_252831B18()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_252831B28()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_252831B38()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_252831B48()
{
  return MEMORY[0x270FA0090]();
}

uint64_t sub_252831B78()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t DeviceIdentityIsSupported()
{
  return MEMORY[0x270F25E60]();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x270F25E68]();
}

uint64_t DeviceIdentityUCRTAttestationSupported()
{
  return MEMORY[0x270F25E70]();
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MEMORY[0x270EF58C8]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
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

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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