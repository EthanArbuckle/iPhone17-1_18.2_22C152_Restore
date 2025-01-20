void sub_21488FE08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  void v13[3];
  char v14;
  char v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782F700);
  v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void *)a2;
  v9 = *(void *)(a2 + 8);
  v10 = *(void **)(a2 + 16);
  v11 = *(unsigned __int8 *)(a2 + 24);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  if (v11 == 1)
  {
    swift_bridgeObjectRetain();
    if (v10) {
      v12 = v10;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    v10 = 0;
  }
  v13[0] = v8;
  v13[1] = v9;
  v13[2] = v10;
  v14 = v11;
  v15 = 6;
  sub_214893890();
  sub_2148A2188();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_214891AD4(v8, v9, v10, v11);
}

void sub_21488FF98(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782F7E8);
  uint64_t v21 = *(void *)(v3 - 8);
  uint64_t v22 = v3;
  MEMORY[0x270FA5388](v3);
  v20 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782F7F0);
  uint64_t v19 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782F7F8);
  uint64_t v8 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v24 = v1[1];
  uint64_t v25 = v11;
  id v23 = (id)v1[2];
  int v12 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214893D28();
  sub_2148A2318();
  if (v12 == 1)
  {
    char v32 = 1;
    sub_214893D7C();
    id v13 = v23;
    v14 = v20;
    uint64_t v15 = v27;
    sub_2148A2118();
    char v31 = 0;
    uint64_t v16 = v22;
    uint64_t v17 = v26;
    sub_2148A2158();
    if (v17)
    {

      (*(void (**)(char *, uint64_t))(v21 + 8))(v14, v16);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v15);
    }
    else
    {
      id v28 = v23;
      char v30 = 1;
      sub_214893DD0();
      sub_2148A2148();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v14, v16);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v15);
    }
  }
  else
  {
    char v29 = 0;
    sub_214893E24();
    uint64_t v18 = v27;
    sub_2148A2118();
    sub_2148A2128();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v5);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  }
}

uint64_t sub_214890340@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  char v31 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782F820);
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782F828);
  uint64_t v32 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782F830);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  int v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = a1[3];
  v35 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_214893D28();
  uint64_t v14 = v36;
  sub_2148A2308();
  if (!v14)
  {
    uint64_t v15 = v34;
    uint64_t v36 = v10;
    uint64_t v16 = sub_2148A2108();
    if (*(void *)(v16 + 16) == 1)
    {
      int v38 = *(unsigned __int8 *)(v16 + 32);
      if (v38)
      {
        uint64_t v32 = v16;
        char v42 = 1;
        sub_214893D7C();
        uint64_t v17 = v5;
        sub_2148A2068();
        char v41 = 0;
        uint64_t v23 = sub_2148A20B8();
        uint64_t v26 = v25;
        uint64_t v30 = v23;
        char v40 = 1;
        sub_214893E78();
        sub_2148A20A8();
        uint64_t v27 = v36;
        (*(void (**)(char *, uint64_t))(v33 + 8))(v17, v15);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v9);
        uint64_t v28 = v37;
      }
      else
      {
        char v39 = 0;
        sub_214893E24();
        sub_2148A2068();
        uint64_t v22 = sub_2148A2088();
        uint64_t v26 = v24;
        uint64_t v30 = v22;
        (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v6);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v9);
        uint64_t v28 = 0;
      }
      char v29 = v31;
      *char v31 = v30;
      v29[1] = v26;
      v29[2] = v28;
      *((unsigned char *)v29 + 24) = v38;
    }
    else
    {
      uint64_t v18 = sub_2148A1F98();
      swift_allocError();
      v20 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26782CC60);
      void *v20 = &type metadata for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable;
      sub_2148A2078();
      sub_2148A1F88();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCB0], v18);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v9);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
}

uint64_t sub_2148908C0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DigitalPresentmentDisplayConfiguration.init(from:)(a1, a2);
}

void sub_2148908D8(void *a1)
{
}

unint64_t sub_2148908F0()
{
  return 0xD000000000000014;
}

uint64_t sub_21489090C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_214893ECC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_214890938(uint64_t a1)
{
  unint64_t v2 = sub_214893E24();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_214890974(uint64_t a1)
{
  unint64_t v2 = sub_214893E24();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2148909B0()
{
  if (*v0) {
    return 0x6D6F74737563;
  }
  else {
    return 0x617242656C707061;
  }
}

uint64_t sub_2148909F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_214893F54(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_214890A18(uint64_t a1)
{
  unint64_t v2 = sub_214893D28();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_214890A54(uint64_t a1)
{
  unint64_t v2 = sub_214893D28();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_214890A90()
{
  if (*v0) {
    return 0x49656C6261646F63;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_214890ACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_214894058(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_214890AF4(uint64_t a1)
{
  unint64_t v2 = sub_214893D7C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_214890B30(uint64_t a1)
{
  unint64_t v2 = sub_214893D7C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_214890B6C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_214890340(a1, a2);
}

void sub_214890B84(void *a1)
{
}

BOOL static DigitalPresentmentDisplayConfiguration.StringID.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DigitalPresentmentDisplayConfiguration.StringID.hash(into:)()
{
  return sub_2148A22C8();
}

uint64_t DigitalPresentmentDisplayConfiguration.StringID.hashValue.getter()
{
  return sub_2148A22F8();
}

uint64_t DigitalPresentmentDisplayConfiguration.clientDisplayName.getter()
{
  uint64_t v1 = sub_2148A1A78();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_2148A1B68();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = 0;
  int v4 = *(unsigned __int8 *)(v0 + 72);
  if (v4 != 255)
  {
    if (v4)
    {
      uint64_t v3 = *(void *)(v0 + 48);
      uint64_t v6 = *(void **)(v0 + 64);
      sub_214891A80(v3, *(void *)(v0 + 56), v6, 1);
    }
    else
    {
      sub_2148A1B58();
      if (qword_26782CBC0 != -1) {
        swift_once();
      }
      id v5 = (id)qword_267849FC0;
      sub_2148A1A68();
      return sub_2148A1BA8();
    }
  }
  return v3;
}

uint64_t static DigitalPresentmentDisplayConfiguration.getString(_:)(unsigned char *a1)
{
  uint64_t v2 = sub_2148A1A78();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_2148A1B68();
  MEMORY[0x270FA5388](v3 - 8);
  switch(*a1)
  {
    case 1:
      sub_2148A1B58();
      if (qword_26782CBC0 != -1) {
        goto LABEL_6;
      }
      break;
    default:
      sub_2148A1B58();
      if (qword_26782CBC0 != -1) {
LABEL_6:
      }
        swift_once();
      break;
  }
  id v4 = (id)qword_267849FC0;
  sub_2148A1A68();
  return sub_2148A1BA8();
}

BOOL sub_214891084(char *a1, char *a2)
{
  return qword_2148B0F40[*a1] == qword_2148B0F40[*a2];
}

uint64_t sub_2148910A8()
{
  return sub_2148A22F8();
}

uint64_t sub_2148910F8()
{
  return sub_2148A22C8();
}

uint64_t sub_214891130()
{
  return sub_2148A22F8();
}

uint64_t sub_21489117C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_214894154(*a1);
  *a2 = result;
  return result;
}

void sub_2148911A8(void *a1@<X8>)
{
  *a1 = qword_2148B0F40[*v1];
}

unint64_t sub_2148911C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_2148A1B98();
  uint64_t v9 = v8;
  uint64_t v23 = MEMORY[0x263F8D310];
  *(void *)&long long v22 = a2;
  *((void *)&v22 + 1) = a3;
  sub_214802C90(&v22, v21);
  swift_bridgeObjectRetain();
  unint64_t v10 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v24 = 0x8000000000000000;
  sub_214801E98(v21, v7, v9, isUniquelyReferenced_nonNull_native);
  unint64_t v24 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_2148A1B98();
  uint64_t v14 = v12;
  uint64_t v15 = v13;
  if (a4)
  {
    swift_getErrorValue();
    uint64_t v23 = v20;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v22);
    (*(void (**)(uint64_t *))(*(void *)(v20 - 8) + 16))(boxed_opaque_existential_0);
    sub_214802C90(&v22, v21);
    unint64_t v17 = v24;
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v24 = 0x8000000000000000;
    sub_214801E98(v21, v14, v15, v18);
    unint64_t v24 = v17;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_214801BBC(v12, v13, &v22);
    swift_bridgeObjectRelease();
    sub_214806250((uint64_t)&v22);
  }
  return v24;
}

uint64_t sub_214891378()
{
  return 0x726F727245504944;
}

uint64_t sub_214891390()
{
  return qword_2148B0F40[*v0];
}

unint64_t sub_2148913A4(uint64_t a1)
{
  return sub_2148911C0(a1, v1[1], v1[2], v1[3]);
}

uint64_t sub_2148913B0(uint64_t a1)
{
  unint64_t v2 = sub_2148931E0();
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_2148913EC(uint64_t a1)
{
  unint64_t v2 = sub_2148931E0();
  return MEMORY[0x270EF2668](a1, v2);
}

unint64_t sub_214891428()
{
  unint64_t result = qword_26782F660;
  if (!qword_26782F660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F660);
  }
  return result;
}

unint64_t sub_21489147C()
{
  unint64_t result = qword_26782F668;
  if (!qword_26782F668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F668);
  }
  return result;
}

unint64_t sub_2148914D0()
{
  unint64_t result = qword_26782F670;
  if (!qword_26782F670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F670);
  }
  return result;
}

BOOL _s7CoreIDV38DigitalPresentmentDisplayConfigurationV06ClientE4InfoO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  id v4 = *(void **)(a1 + 16);
  int v5 = *(unsigned __int8 *)(a1 + 24);
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void **)(a2 + 16);
  char v9 = *(unsigned char *)(a2 + 24);
  if (v5 == 1)
  {
    if (*(unsigned char *)(a2 + 24))
    {
      BOOL v10 = v2 == v6 && v3 == v7;
      if (v10 || (sub_2148A21C8() & 1) != 0)
      {
        if (!v4)
        {
          uint64_t v12 = 1;
          sub_214891A80(v6, v7, v8, 1);
          sub_214891A80(v2, v3, 0, 1);
          id v20 = v8;
          sub_214891AD4(v2, v3, 0, 1);
          sub_214891AD4(v6, v7, v8, 1);
          if (!v8) {
            return v12;
          }

          return 0;
        }
        if (v8)
        {
          type metadata accessor for CGImage(0);
          id v11 = v4;
          uint64_t v12 = 1;
          sub_214891A80(v6, v7, v8, 1);
          sub_214891A80(v2, v3, v4, 1);
          sub_214893938();
          id v22 = v8;
          id v13 = v11;
          char v14 = sub_2148A1A88();
          sub_214891AD4(v2, v3, v4, 1);
          sub_214891AD4(v6, v7, v8, 1);

          if (v14) {
            return v12;
          }
          return 0;
        }
        sub_214891A80(v6, v7, 0, 1);
        sub_214891A80(v2, v3, v4, 1);
        sub_214891AD4(v2, v3, v4, 1);
        uint64_t v15 = v6;
        uint64_t v16 = v7;
        unint64_t v17 = 0;
        char v18 = 1;
      }
      else
      {
        sub_214891A80(v6, v7, v8, 1);
        sub_214891A80(v2, v3, v4, 1);
        sub_214891AD4(v2, v3, v4, 1);
        uint64_t v15 = v6;
        uint64_t v16 = v7;
        unint64_t v17 = v8;
        char v18 = 1;
      }
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (*(unsigned char *)(a2 + 24))
  {
LABEL_13:
    sub_214891A80(*(void *)a2, *(void *)(a2 + 8), v8, v9);
    sub_214891A80(v2, v3, v4, v5);
    sub_214891AD4(v2, v3, v4, v5);
    uint64_t v15 = v6;
    uint64_t v16 = v7;
    unint64_t v17 = v8;
    char v18 = v9;
LABEL_14:
    sub_214891AD4(v15, v16, v17, v18);
    return 0;
  }
  if (!v3)
  {
    swift_bridgeObjectRetain();
    sub_214891A80(v6, v7, v8, 0);
    sub_214891A80(v2, 0, v4, 0);
    sub_214891AD4(v2, 0, v4, 0);
    sub_214891AD4(v6, v7, v8, 0);
    if (!v7) {
      return 1;
    }
LABEL_28:
    sub_214891AD4(v2, v3, v4, 0);
    uint64_t v15 = v6;
    uint64_t v16 = v7;
    unint64_t v17 = v8;
    char v18 = 0;
    goto LABEL_14;
  }
  if (!v7)
  {
    sub_214891A80(*(void *)a2, 0, v8, 0);
    sub_214891A80(v2, v3, v4, 0);
    goto LABEL_28;
  }
  if (v2 == v6 && v3 == v7)
  {
    sub_214891A80(*(void *)a1, v3, v8, 0);
    sub_214891A80(v2, v3, v4, 0);
    sub_214891AD4(v2, v3, v4, 0);
    sub_214891AD4(v2, v3, v8, 0);
    return 1;
  }
  char v21 = sub_2148A21C8();
  sub_214891A80(v6, v7, v8, 0);
  sub_214891A80(v2, v3, v4, 0);
  sub_214891AD4(v2, v3, v4, 0);
  sub_214891AD4(v6, v7, v8, 0);
  return (v21 & 1) != 0;
}

unint64_t sub_21489196C()
{
  unint64_t result = qword_26782F6A8;
  if (!qword_26782F6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F6A8);
  }
  return result;
}

unint64_t sub_2148919C0()
{
  unint64_t result = qword_26782F6B0;
  if (!qword_26782F6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F6B0);
  }
  return result;
}

unint64_t sub_214891A14()
{
  unint64_t result = qword_26782F6B8;
  if (!qword_26782F6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F6B8);
  }
  return result;
}

uint64_t sub_214891A68(uint64_t result, uint64_t a2, void *a3, unsigned __int8 a4)
{
  if (a4 != 255) {
    return sub_214891A80(result, a2, a3, a4 & 1);
  }
  return result;
}

uint64_t sub_214891A80(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  if (a4) {
    id v4 = a3;
  }
  return swift_bridgeObjectRetain();
}

void sub_214891ABC(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 a4)
{
  if (a4 != 255) {
    sub_214891AD4(a1, a2, a3, a4 & 1);
  }
}

void sub_214891AD4(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  swift_bridgeObjectRelease();
  if (a4)
  {
  }
}

unint64_t sub_214891B30()
{
  unint64_t result = qword_26782F6E0;
  if (!qword_26782F6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F6E0);
  }
  return result;
}

unint64_t sub_214891B84()
{
  unint64_t result = qword_26782F6E8;
  if (!qword_26782F6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F6E8);
  }
  return result;
}

unint64_t sub_214891BD8()
{
  unint64_t result = qword_26782F6F0;
  if (!qword_26782F6F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F6F0);
  }
  return result;
}

unint64_t sub_214891C2C()
{
  unint64_t result = qword_26782F6F8;
  if (!qword_26782F6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F6F8);
  }
  return result;
}

uint64_t sub_214891C80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = *(void **)(a1 + 64);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_214891A68(v2, v3, v4, v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_214891D24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = *(void **)(a1 + 64);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_214891ABC(v2, v3, v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_214891DC8(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26782EAC8);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_214891E38()
{
  unint64_t result = qword_26782F708;
  if (!qword_26782F708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F708);
  }
  return result;
}

unint64_t sub_214891E8C()
{
  unint64_t result = qword_26782F710;
  if (!qword_26782F710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F710);
  }
  return result;
}

unint64_t sub_214891EE0()
{
  unint64_t result = qword_26782F718;
  if (!qword_26782F718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F718);
  }
  return result;
}

unint64_t sub_214891F38()
{
  unint64_t result = qword_26782F720;
  if (!qword_26782F720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F720);
  }
  return result;
}

unint64_t sub_214891F90()
{
  unint64_t result = qword_26782F728;
  if (!qword_26782F728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F728);
  }
  return result;
}

uint64_t destroy for DigitalPresentmentDisplayConfiguration(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v2 = *(unsigned __int8 *)(a1 + 72);
  if (v2 != 255) {
    sub_214891AD4(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void **)(a1 + 64), v2 & 1);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DigitalPresentmentDisplayConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  int v5 = *(unsigned __int8 *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5 == 255)
  {
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  }
  else
  {
    char v6 = v5 & 1;
    uint64_t v7 = *(void *)(a2 + 48);
    uint64_t v8 = *(void *)(a2 + 56);
    char v9 = *(void **)(a2 + 64);
    sub_214891A80(v7, v8, v9, v6);
    *(void *)(a1 + 48) = v7;
    *(void *)(a1 + 56) = v8;
    *(void *)(a1 + 64) = v9;
    *(unsigned char *)(a1 + 72) = v6;
  }
  uint64_t v10 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v10;
  uint64_t v11 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v11;
  uint64_t v12 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v12;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DigitalPresentmentDisplayConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  uint64_t v4 = *(void *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  int v5 = (long long *)(a1 + 48);
  char v6 = (long long *)(a2 + 48);
  int v7 = *(unsigned __int8 *)(a2 + 72);
  if (*(unsigned __int8 *)(a1 + 72) == 255)
  {
    if (v7 == 255)
    {
      long long v9 = *v6;
      *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
      *int v5 = v9;
    }
    else
    {
      char v18 = v7 & 1;
      uint64_t v19 = *(void *)(a2 + 48);
      uint64_t v20 = *(void *)(a2 + 56);
      char v21 = *(void **)(a2 + 64);
      sub_214891A80(v19, v20, v21, v7 & 1);
      *(void *)(a1 + 48) = v19;
      *(void *)(a1 + 56) = v20;
      *(void *)(a1 + 64) = v21;
      *(unsigned char *)(a1 + 72) = v18;
    }
  }
  else if (v7 == 255)
  {
    sub_21489232C(a1 + 48);
    long long v8 = *(_OWORD *)(a2 + 57);
    *int v5 = *v6;
    *(_OWORD *)(a1 + 57) = v8;
  }
  else
  {
    char v10 = v7 & 1;
    uint64_t v11 = *(void *)(a2 + 48);
    uint64_t v12 = *(void *)(a2 + 56);
    id v13 = *(void **)(a2 + 64);
    sub_214891A80(v11, v12, v13, v7 & 1);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void **)(a1 + 64);
    char v17 = *(unsigned char *)(a1 + 72);
    *(void *)(a1 + 48) = v11;
    *(void *)(a1 + 56) = v12;
    *(void *)(a1 + 64) = v13;
    *(unsigned char *)(a1 + 72) = v10;
    sub_214891AD4(v14, v15, v16, v17);
  }
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  return a1;
}

uint64_t sub_21489232C(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy129_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for DigitalPresentmentDisplayConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  int v4 = *(unsigned __int8 *)(a1 + 72);
  if (v4 != 255)
  {
    int v5 = *(unsigned __int8 *)(a2 + 72);
    if (v5 != 255)
    {
      char v6 = v4 & 1;
      uint64_t v7 = *(void *)(a2 + 64);
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      char v10 = *(void **)(a1 + 64);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      *(void *)(a1 + 64) = v7;
      *(unsigned char *)(a1 + 72) = v5 & 1;
      sub_214891AD4(v8, v9, v10, v6);
      goto LABEL_6;
    }
    sub_21489232C(a1 + 48);
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
LABEL_6:
  uint64_t v11 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v13;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for DigitalPresentmentDisplayConfiguration(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 129)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DigitalPresentmentDisplayConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 128) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 129) = 1;
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
    *(unsigned char *)(result + 129) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.PersistedElementsStorageLifetime()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.PersistedElementsStorageLifetime;
}

void destroy for DigitalPresentmentDisplayConfiguration.ClientDisplayInfo(uint64_t a1)
{
}

uint64_t initializeWithCopy for DigitalPresentmentDisplayConfiguration.ClientDisplayInfo(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_2148939A8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_214891A80);
}

uint64_t *assignWithCopy for DigitalPresentmentDisplayConfiguration.ClientDisplayInfo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_214893A3C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_214891A80, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_214891AD4);
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t *assignWithTake for DigitalPresentmentDisplayConfiguration.ClientDisplayInfo(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_214893AD4(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_214891AD4);
}

uint64_t sub_214892608(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_214892610(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.ClientDisplayInfo()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.ClientDisplayInfo;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.PresentationStyle()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.PresentationStyle;
}

uint64_t getEnumTagSinglePayload for DigitalPresentmentDisplayConfiguration.StringID(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DigitalPresentmentDisplayConfiguration.StringID(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 8;
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
        JUMPOUT(0x21489279CLL);
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
          *__n128 result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.StringID()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.StringID;
}

uint64_t getEnumTagSinglePayload for DigitalPresentmentDisplayConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DigitalPresentmentDisplayConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *__n128 result = a2 + 10;
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
        JUMPOUT(0x214892930);
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
          *__n128 result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.CodingKeys()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.CodingKeys;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.PresentationStyle.CodingKeys()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.PresentationStyle.CodingKeys;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.PresentationStyle.ConsentSheetCodingKeys()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.PresentationStyle.ConsentSheetCodingKeys;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.PresentationStyle.TransactionElementDetailsCodingKeys()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.PresentationStyle.TransactionElementDetailsCodingKeys;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.PersistedElementsStorageLifetime.CodingKeys()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.PersistedElementsStorageLifetime.CodingKeys;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.PersistedElementsStorageLifetime.IndefinitelyCodingKeys()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.PersistedElementsStorageLifetime.IndefinitelyCodingKeys;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.PersistedElementsStorageLifetime.LimitCodingKeys()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.PersistedElementsStorageLifetime.LimitCodingKeys;
}

void destroy for DIPError(uint64_t a1)
{
  swift_bridgeObjectRelease();
  int v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for DIPError(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  unsigned int v4 = *(void **)(a2 + 24);
  swift_bridgeObjectRetain();
  id v5 = v4;
  *(void *)(a1 + 24) = v4;
  return a1;
}

uint64_t assignWithCopy for DIPError(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unsigned int v4 = *(void **)(a1 + 24);
  id v5 = *(void **)(a2 + 24);
  id v6 = v5;
  *(void *)(a1 + 24) = v5;

  return a1;
}

uint64_t assignWithTake for DIPError(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  unsigned int v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for DIPError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DIPError(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DIPError()
{
  return &type metadata for DIPError;
}

unint64_t sub_214892BB4()
{
  unint64_t result = qword_26782F730;
  if (!qword_26782F730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F730);
  }
  return result;
}

unint64_t sub_214892C0C()
{
  unint64_t result = qword_26782F738;
  if (!qword_26782F738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F738);
  }
  return result;
}

unint64_t sub_214892C64()
{
  unint64_t result = qword_26782F740;
  if (!qword_26782F740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F740);
  }
  return result;
}

unint64_t sub_214892CBC()
{
  unint64_t result = qword_26782F748;
  if (!qword_26782F748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F748);
  }
  return result;
}

unint64_t sub_214892D14()
{
  unint64_t result = qword_26782F750;
  if (!qword_26782F750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F750);
  }
  return result;
}

unint64_t sub_214892D6C()
{
  unint64_t result = qword_26782F758;
  if (!qword_26782F758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F758);
  }
  return result;
}

unint64_t sub_214892DC4()
{
  unint64_t result = qword_26782F760;
  if (!qword_26782F760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F760);
  }
  return result;
}

unint64_t sub_214892E1C()
{
  unint64_t result = qword_26782F768;
  if (!qword_26782F768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F768);
  }
  return result;
}

unint64_t sub_214892E74()
{
  unint64_t result = qword_26782F770;
  if (!qword_26782F770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F770);
  }
  return result;
}

unint64_t sub_214892ECC()
{
  unint64_t result = qword_26782F778;
  if (!qword_26782F778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F778);
  }
  return result;
}

unint64_t sub_214892F24()
{
  unint64_t result = qword_26782F780;
  if (!qword_26782F780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F780);
  }
  return result;
}

unint64_t sub_214892F7C()
{
  unint64_t result = qword_26782F788;
  if (!qword_26782F788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F788);
  }
  return result;
}

unint64_t sub_214892FD4()
{
  unint64_t result = qword_26782F790;
  if (!qword_26782F790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F790);
  }
  return result;
}

unint64_t sub_21489302C()
{
  unint64_t result = qword_26782F798;
  if (!qword_26782F798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F798);
  }
  return result;
}

unint64_t sub_214893084()
{
  unint64_t result = qword_26782F7A0;
  if (!qword_26782F7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F7A0);
  }
  return result;
}

unint64_t sub_2148930DC()
{
  unint64_t result = qword_26782F7A8;
  if (!qword_26782F7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F7A8);
  }
  return result;
}

unint64_t sub_214893134()
{
  unint64_t result = qword_26782F7B0;
  if (!qword_26782F7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F7B0);
  }
  return result;
}

unint64_t sub_21489318C()
{
  unint64_t result = qword_26782F7B8;
  if (!qword_26782F7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F7B8);
  }
  return result;
}

unint64_t sub_2148931E0()
{
  unint64_t result = qword_26782F7C0;
  if (!qword_26782F7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F7C0);
  }
  return result;
}

uint64_t sub_214893234(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696E696665646E69 && a2 == 0xEC000000796C6574;
  if (v2 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74696D696CLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2148A21C8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_214893338(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x53746E65736E6F63 && a2 == 0xEC00000074656568;
  if (v2 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000002148B73B0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2148A21C8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_214893440(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73746E656D656C65 && a2 == 0xE800000000000000;
  if (v2 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000002148B6D70 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002148B73D0 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002148B73F0 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002148B7410 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000002148B7430 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x4979616C70736964 && a2 == 0xEB000000006F666ELL || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x444973736170 && a2 == 0xE600000000000000 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002148B7450 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x656D614E73736170 && a2 == 0xE800000000000000 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x746E656D75636F64 && a2 == 0xEC00000065707954)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    char v6 = sub_2148A21C8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 10;
    }
    else {
      return 11;
    }
  }
}

unint64_t sub_214893890()
{
  unint64_t result = qword_26782F7C8;
  if (!qword_26782F7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F7C8);
  }
  return result;
}

unint64_t sub_2148938E4()
{
  unint64_t result = qword_26782F7D0;
  if (!qword_26782F7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F7D0);
  }
  return result;
}

unint64_t sub_214893938()
{
  unint64_t result = qword_26782F7D8;
  if (!qword_26782F7D8)
  {
    type metadata accessor for CGImage(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F7D8);
  }
  return result;
}

uint64_t initializeWithCopy for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_2148939A8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_2148946BC);
}

uint64_t sub_2148939A8(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v6, v7, v8);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 24) = v8;
  return a1;
}

uint64_t *assignWithCopy for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_214893A3C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t))sub_2148946BC, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2148946B8);
}

uint64_t *sub_214893A3C(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v10 = *((unsigned __int8 *)a2 + 24);
  a4(*a2, v8, v9, v10);
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  uint64_t v13 = a1[2];
  uint64_t v14 = *((unsigned __int8 *)a1 + 24);
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  *((unsigned char *)a1 + 24) = v10;
  a5(v11, v12, v13, v14);
  return a1;
}

uint64_t *assignWithTake for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_214893AD4(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2148946B8);
}

uint64_t *sub_214893AD4(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(a2 + 16);
  char v7 = *(unsigned char *)(a2 + 24);
  uint64_t v8 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v9 = a1[2];
  uint64_t v11 = *((unsigned __int8 *)a1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v6;
  *((unsigned char *)a1 + 24) = v7;
  a4(v8, v10, v9, v11);
  return a1;
}

uint64_t _s7CoreIDV38DigitalPresentmentDisplayConfigurationV17ClientDisplayInfoOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s7CoreIDV38DigitalPresentmentDisplayConfigurationV17ClientDisplayInfoOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable;
}

unsigned char *storeEnumTagSinglePayload for DIPError.Code(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x214893C98);
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

ValueMetadata *type metadata accessor for DIPError.Code()
{
  return &type metadata for DIPError.Code;
}

unint64_t sub_214893CD4()
{
  unint64_t result = qword_26782F7E0;
  if (!qword_26782F7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F7E0);
  }
  return result;
}

unint64_t sub_214893D28()
{
  unint64_t result = qword_26782F800;
  if (!qword_26782F800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F800);
  }
  return result;
}

unint64_t sub_214893D7C()
{
  unint64_t result = qword_26782F808;
  if (!qword_26782F808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F808);
  }
  return result;
}

unint64_t sub_214893DD0()
{
  unint64_t result = qword_26782F810;
  if (!qword_26782F810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F810);
  }
  return result;
}

unint64_t sub_214893E24()
{
  unint64_t result = qword_26782F818;
  if (!qword_26782F818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F818);
  }
  return result;
}

unint64_t sub_214893E78()
{
  unint64_t result = qword_26782F838;
  if (!qword_26782F838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F838);
  }
  return result;
}

uint64_t sub_214893ECC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x80000002148B5510)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_2148A21C8();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_214893F54(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x617242656C707061 && a2 == 0xEC0000006465646ELL;
  if (v2 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D6F74737563 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2148A21C8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_214894058(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x49656C6261646F63 && a2 == 0xEC0000006567616DLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2148A21C8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_214894154(uint64_t a1)
{
  if (a1 > -15010)
  {
    if (a1 != -15009)
    {
      if (a1 == -1302) {
        return 2;
      }
      return 4;
    }
    return 0;
  }
  else
  {
    if (a1 != -18084)
    {
      if (a1 == -15032) {
        return 1;
      }
      return 4;
    }
    return 3;
  }
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable.CodingKeys()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable.CodingKeys;
}

unsigned char *_s7CoreIDV38DigitalPresentmentDisplayConfigurationV32PersistedElementsStorageLifetimeO15LimitCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x214894260);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable.AppleBrandedCodingKeys()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable.AppleBrandedCodingKeys;
}

unsigned char *_s7CoreIDV38DigitalPresentmentDisplayConfigurationV17PresentationStyleOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x214894364);
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

ValueMetadata *type metadata accessor for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable.CustomCodingKeys()
{
  return &type metadata for DigitalPresentmentDisplayConfiguration.DisplayInfoCodable.CustomCodingKeys;
}

unint64_t sub_2148943A0()
{
  unint64_t result = qword_26782F840;
  if (!qword_26782F840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F840);
  }
  return result;
}

unint64_t sub_2148943F8()
{
  unint64_t result = qword_26782F848;
  if (!qword_26782F848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F848);
  }
  return result;
}

unint64_t sub_214894450()
{
  unint64_t result = qword_26782F850;
  if (!qword_26782F850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F850);
  }
  return result;
}

unint64_t sub_2148944A8()
{
  unint64_t result = qword_26782F858;
  if (!qword_26782F858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F858);
  }
  return result;
}

unint64_t sub_214894500()
{
  unint64_t result = qword_26782F860;
  if (!qword_26782F860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F860);
  }
  return result;
}

unint64_t sub_214894558()
{
  unint64_t result = qword_26782F868;
  if (!qword_26782F868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F868);
  }
  return result;
}

unint64_t sub_2148945B0()
{
  unint64_t result = qword_26782F870;
  if (!qword_26782F870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F870);
  }
  return result;
}

unint64_t sub_214894608()
{
  unint64_t result = qword_26782F878;
  if (!qword_26782F878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F878);
  }
  return result;
}

unint64_t sub_214894660()
{
  unint64_t result = qword_26782F880;
  if (!qword_26782F880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F880);
  }
  return result;
}

uint64_t sub_2148946C8()
{
  return sub_2148A22F8();
}

uint64_t sub_21489474C()
{
  return sub_2148A22F8();
}

uint64_t sub_21489483C()
{
  sub_2148A1BD8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2148949AC()
{
  sub_2148A1BD8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_214894AC0()
{
  sub_2148A1BD8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_214894BE0()
{
  sub_2148A1BD8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_214894CB0()
{
  return sub_2148A22F8();
}

uint64_t sub_214894D30()
{
  return sub_2148A22F8();
}

uint64_t sub_214894E1C()
{
  return sub_2148A22F8();
}

uint64_t sub_214894F54()
{
  return sub_2148A22F8();
}

unint64_t ISO18013KnownDocTypes.rawValue.getter()
{
  if (*v0) {
    return 0xD000000000000016;
  }
  else {
    return 0xD000000000000015;
  }
}

CoreIDV::ISO18013KnownNamespaces_optional __swiftcall ISO18013KnownNamespaces.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  unint64_t v3 = sub_2148A2058();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *BOOL v2 = v5;
  return result;
}

unint64_t ISO18013KnownNamespaces.rawValue.getter()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000017;
      break;
    case 2:
      unint64_t result = 0x2E6F73692E67726FLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

CoreIDV::ISO18013_5_1_ElementIdentifier_optional __swiftcall ISO18013_5_1_ElementIdentifier.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  uint64_t v3 = sub_2148A21E8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 13;
  switch(v3)
  {
    case 0:
      goto LABEL_15;
    case 1:
      char v5 = 1;
      goto LABEL_15;
    case 2:
      char v5 = 2;
      goto LABEL_15;
    case 3:
      char v5 = 3;
      goto LABEL_15;
    case 4:
      char v5 = 4;
      goto LABEL_15;
    case 5:
      char v5 = 5;
      goto LABEL_15;
    case 6:
      char v5 = 6;
      goto LABEL_15;
    case 7:
      char v5 = 7;
      goto LABEL_15;
    case 8:
      char v5 = 8;
      goto LABEL_15;
    case 9:
      char v5 = 9;
      goto LABEL_15;
    case 10:
      char v5 = 10;
      goto LABEL_15;
    case 11:
      char v5 = 11;
      goto LABEL_15;
    case 12:
      char v5 = 12;
LABEL_15:
      char v6 = v5;
      break;
    case 13:
      break;
    case 14:
      char v6 = 14;
      break;
    case 15:
      char v6 = 15;
      break;
    case 16:
      char v6 = 16;
      break;
    case 17:
      char v6 = 17;
      break;
    case 18:
      char v6 = 18;
      break;
    case 19:
      char v6 = 19;
      break;
    case 20:
      char v6 = 20;
      break;
    case 21:
      char v6 = 21;
      break;
    case 22:
      char v6 = 22;
      break;
    case 23:
      char v6 = 23;
      break;
    case 24:
      char v6 = 24;
      break;
    case 25:
      char v6 = 25;
      break;
    case 26:
      char v6 = 26;
      break;
    case 27:
      char v6 = 27;
      break;
    case 28:
      char v6 = 28;
      break;
    case 29:
      char v6 = 29;
      break;
    case 30:
      char v6 = 30;
      break;
    default:
      char v6 = 31;
      break;
  }
  *BOOL v2 = v6;
  return result;
}

CoreIDV::ISO18013_AAMVA_ElementIdentifier_optional __swiftcall ISO18013_AAMVA_ElementIdentifier.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  unint64_t v3 = sub_2148A21E8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 18;
  if (v3 < 0x12) {
    char v5 = v3;
  }
  *BOOL v2 = v5;
  return result;
}

unsigned __int8 *static ISO23220_1_ElementIdentifier.parseAgeOverElement(_:)(unint64_t a1, unint64_t a2)
{
  return sub_214896B84(a1, a2);
}

CoreIDV::ISO23220_1_ElementIdentifier_optional __swiftcall ISO23220_1_ElementIdentifier.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  unint64_t v3 = sub_2148A2058();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *BOOL v2 = v5;
  return result;
}

CoreIDV::ISO23220_1_Japan_ElementIdentifier_optional __swiftcall ISO23220_1_Japan_ElementIdentifier.init(rawValue:)(Swift::String rawValue)
{
  return (CoreIDV::ISO23220_1_Japan_ElementIdentifier_optional)sub_214895BE8(v1);
}

CoreIDV::ISO18013KnownDocTypes_optional __swiftcall ISO18013KnownDocTypes.init(rawValue:)(Swift::String rawValue)
{
  BOOL v2 = v1;
  uint64_t v3 = sub_2148A2058();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *BOOL v2 = v5;
  return result;
}

uint64_t sub_2148954EC(char *a1, char *a2)
{
  return sub_21480FB80(*a1, *a2);
}

uint64_t sub_2148954F8()
{
  return sub_2148946C8();
}

uint64_t sub_214895500()
{
  sub_2148A1BD8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_214895570()
{
  return sub_214894CB0();
}

CoreIDV::ISO18013KnownDocTypes_optional sub_214895578(Swift::String *a1)
{
  return ISO18013KnownDocTypes.init(rawValue:)(*a1);
}

void sub_214895584(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0xD000000000000015;
  if (*v1) {
    unint64_t v2 = 0xD000000000000016;
  }
  unint64_t v3 = 0x80000002148B46B0;
  if (!*v1) {
    unint64_t v3 = 0x80000002148B4690;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_2148955C4()
{
  return sub_2148A1CA8();
}

uint64_t sub_214895624()
{
  return sub_2148A1C98();
}

uint64_t sub_214895674(unsigned __int8 *a1, char *a2)
{
  return sub_2148101FC(*a1, *a2);
}

uint64_t sub_214895680()
{
  return sub_21489474C();
}

uint64_t sub_214895688()
{
  return sub_214894BE0();
}

uint64_t sub_214895690()
{
  return sub_214894D30();
}

CoreIDV::ISO18013KnownNamespaces_optional sub_214895698(Swift::String *a1)
{
  return ISO18013KnownNamespaces.init(rawValue:)(*a1);
}

unint64_t sub_2148956A4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ISO18013KnownNamespaces.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2148956CC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782D280);
  __swift_allocate_value_buffer(v0, qword_26782F888);
  __swift_project_value_buffer(v0, (uint64_t)qword_26782F888);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26782D288);
  return sub_2148A1AB8();
}

void static ISO18013_5_1_ElementIdentifier.namespaceIdentifier.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void *static ISO18013_5_1_ElementIdentifier.allCases.getter()
{
  return &unk_26C570B28;
}

uint64_t ISO18013_5_1_ElementIdentifier.rawValue.getter()
{
  uint64_t result = 0x616E5F6E65766967;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6E5F796C696D6166;
      break;
    case 2:
      uint64_t v2 = 0x5F6874726962;
      goto LABEL_5;
    case 3:
      uint64_t v2 = 0x5F6575737369;
LABEL_5:
      uint64_t result = v2 & 0xFFFFFFFFFFFFLL | 0x6164000000000000;
      break;
    case 4:
      uint64_t result = 0x645F797269707865;
      break;
    case 5:
      uint64_t result = 0x5F676E6975737369;
      break;
    case 6:
      uint64_t result = 0xD000000000000011;
      break;
    case 7:
      uint64_t result = 0x746E656D75636F64;
      break;
    case 8:
      uint64_t result = 0x7469617274726F70;
      break;
    case 9:
      uint64_t result = 0xD000000000000012;
      break;
    case 0xA:
      uint64_t result = 0xD000000000000016;
      break;
    case 0xB:
      uint64_t result = 0xD000000000000015;
      break;
    case 0xC:
      uint64_t result = 7890291;
      break;
    case 0xD:
      uint64_t result = 0x746867696568;
      break;
    case 0xE:
      uint64_t result = 0x746867696577;
      break;
    case 0xF:
      uint64_t result = 0x6F6C6F635F657965;
      break;
    case 0x10:
      uint64_t result = 0x6C6F635F72696168;
      break;
    case 0x11:
      uint64_t result = 0x6C705F6874726962;
      break;
    case 0x12:
      uint64_t result = 0xD000000000000010;
      break;
    case 0x13:
      uint64_t result = 0xD000000000000015;
      break;
    case 0x14:
      uint64_t result = 0x795F6E695F656761;
      break;
    case 0x15:
      uint64_t result = 0x747269625F656761;
      break;
    case 0x16:
    case 0x1A:
    case 0x1E:
      uint64_t result = 0xD000000000000014;
      break;
    case 0x17:
      uint64_t result = 0x6C616E6F6974616ELL;
      break;
    case 0x18:
    case 0x19:
      uint64_t result = 0x746E656469736572;
      break;
    case 0x1B:
      uint64_t result = 0xD000000000000010;
      break;
    case 0x1C:
      uint64_t result = 0xD00000000000001ELL;
      break;
    case 0x1D:
      uint64_t result = 0xD00000000000001DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_214895B3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21480FE74(*a1, *a2);
}

uint64_t sub_214895B48(uint64_t a1, uint64_t a2)
{
  return sub_214895FF4(a1, a2, (void (*)(uint64_t))ISO18013_5_1_ElementIdentifier.rawValue.getter);
}

uint64_t sub_214895B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21489607C(a1, a2, a3, (void (*)(void))ISO18013_5_1_ElementIdentifier.rawValue.getter);
}

uint64_t sub_214895B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2148960FC(a1, a2, a3, (void (*)(uint64_t))ISO18013_5_1_ElementIdentifier.rawValue.getter);
}

CoreIDV::ISO18013_5_1_ElementIdentifier_optional sub_214895B90(Swift::String *a1)
{
  return ISO18013_5_1_ElementIdentifier.init(rawValue:)(*a1);
}

uint64_t sub_214895B9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ISO18013_5_1_ElementIdentifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_214895BC4(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void sub_214895BCC(void *a1@<X8>)
{
  *a1 = &unk_26C570B28;
}

CoreIDV::ISO18013_5_1_DrivingPrivilegeIdentifier_optional __swiftcall ISO18013_5_1_DrivingPrivilegeIdentifier.init(rawValue:)(Swift::String rawValue)
{
  return (CoreIDV::ISO18013_5_1_DrivingPrivilegeIdentifier_optional)sub_214895BE8(v1);
}

uint64_t sub_214895BE8@<X0>(char *a1@<X8>)
{
  unint64_t v2 = sub_2148A2058();
  uint64_t result = swift_bridgeObjectRelease();
  char v4 = 7;
  if (v2 < 7) {
    char v4 = v2;
  }
  *a1 = v4;
  return result;
}

unint64_t ISO18013_5_1_DrivingPrivilegeIdentifier.rawValue.getter()
{
  unint64_t result = 0xD000000000000015;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x61645F6575737369;
      break;
    case 2:
      unint64_t result = 0x645F797269707865;
      break;
    case 3:
      unint64_t result = 0x7365646F63;
      break;
    case 4:
      unint64_t result = 1701080931;
      break;
    case 5:
      unint64_t result = 1852270963;
      break;
    case 6:
      unint64_t result = 0x65756C6176;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_214895D1C(unsigned __int8 *a1, char *a2)
{
  return sub_21480F950(*a1, *a2);
}

uint64_t sub_214895D28()
{
  return sub_214894F54();
}

uint64_t sub_214895D34()
{
  return sub_2148949AC();
}

uint64_t sub_214895D3C()
{
  return sub_214894F54();
}

CoreIDV::ISO18013_5_1_DrivingPrivilegeIdentifier_optional sub_214895D44(Swift::String *a1)
{
  return ISO18013_5_1_DrivingPrivilegeIdentifier.init(rawValue:)(*a1);
}

unint64_t sub_214895D50@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ISO18013_5_1_DrivingPrivilegeIdentifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void static ISO18013_AAMVA_ElementIdentifier.namespaceIdentifier.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void *static ISO18013_AAMVA_ElementIdentifier.allCases.getter()
{
  return &unk_26C571590;
}

unint64_t ISO18013_AAMVA_ElementIdentifier.rawValue.getter()
{
  unint64_t result = 0xD00000000000001BLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6675735F656D616ELL;
      break;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x6F645F6E6167726FLL;
      break;
    case 4:
      unint64_t result = 0x6E617265746576;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    case 6:
      unint64_t result = 0xD000000000000015;
      break;
    case 7:
      unint64_t result = 0x696D61665F616B61;
      break;
    case 8:
      unint64_t result = 0x657669675F616B61;
      break;
    case 9:
      unint64_t result = 0x666675735F616B61;
      break;
    case 0xA:
      unint64_t result = 0x725F746867696577;
      break;
    case 0xB:
      unint64_t result = 0x6874655F65636172;
      break;
    case 0xC:
      unint64_t result = 0x706D6F635F534844;
      break;
    case 0xE:
      unint64_t result = 0x646572635F6C6465;
      break;
    case 0xF:
      unint64_t result = 0xD000000000000010;
      break;
    case 0x10:
      unint64_t result = 0xD000000000000022;
      break;
    case 0x11:
      unint64_t result = 7890291;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_214895FD0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21480FE5C(*a1, *a2);
}

uint64_t sub_214895FDC(uint64_t a1, uint64_t a2)
{
  return sub_214895FF4(a1, a2, (void (*)(uint64_t))ISO18013_AAMVA_ElementIdentifier.rawValue.getter);
}

uint64_t sub_214895FF4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_2148A22B8();
  a3(v4);
  sub_2148A1BD8();
  swift_bridgeObjectRelease();
  return sub_2148A22F8();
}

uint64_t sub_214896064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21489607C(a1, a2, a3, (void (*)(void))ISO18013_AAMVA_ElementIdentifier.rawValue.getter);
}

uint64_t sub_21489607C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  sub_2148A1BD8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2148960E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2148960FC(a1, a2, a3, (void (*)(uint64_t))ISO18013_AAMVA_ElementIdentifier.rawValue.getter);
}

uint64_t sub_2148960FC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5 = sub_2148A22B8();
  a4(v5);
  sub_2148A1BD8();
  swift_bridgeObjectRelease();
  return sub_2148A22F8();
}

CoreIDV::ISO18013_AAMVA_ElementIdentifier_optional sub_214896168(Swift::String *a1)
{
  return ISO18013_AAMVA_ElementIdentifier.init(rawValue:)(*a1);
}

unint64_t sub_214896174@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ISO18013_AAMVA_ElementIdentifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_21489619C(void *a1@<X8>)
{
  *a1 = &unk_26C571590;
}

CoreIDV::ISO18013_AAMVA_DomesticDrivingPrivilegeIdentifier_optional __swiftcall ISO18013_AAMVA_DomesticDrivingPrivilegeIdentifier.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_2148A2058();
  result.value = swift_bridgeObjectRelease();
  char v5 = 11;
  if (v3 < 0xB) {
    char v5 = v3;
  }
  *unint64_t v2 = v5;
  return result;
}

unint64_t ISO18013_AAMVA_DomesticDrivingPrivilegeIdentifier.rawValue.getter()
{
  unint64_t result = 0xD000000000000016;
  switch(*v0)
  {
    case 1:
    case 2:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000022;
      break;
    case 5:
      unint64_t result = 0x61645F6575737369;
      break;
    case 6:
      unint64_t result = 0x645F797269707865;
      break;
    case 7:
      unint64_t result = 0xD000000000000021;
      break;
    case 8:
      unint64_t result = 0xD000000000000028;
      break;
    case 9:
      unint64_t result = 0xD000000000000021;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000028;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_214896340(unsigned __int8 *a1, char *a2)
{
  return sub_21480F690(*a1, *a2);
}

uint64_t sub_21489634C()
{
  return sub_2148A22F8();
}

uint64_t sub_214896394()
{
  return sub_21489483C();
}

uint64_t sub_21489639C()
{
  return sub_2148A22F8();
}

CoreIDV::ISO18013_AAMVA_DomesticDrivingPrivilegeIdentifier_optional sub_2148963E0(Swift::String *a1)
{
  return ISO18013_AAMVA_DomesticDrivingPrivilegeIdentifier.init(rawValue:)(*a1);
}

unint64_t sub_2148963EC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ISO18013_AAMVA_DomesticDrivingPrivilegeIdentifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t _s7CoreIDV30ISO18013_5_1_ElementIdentifierO7ageOver2nnSSSi_tFZ_0(uint64_t a1)
{
  uint64_t v2 = sub_2148A1918();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2148A1A78();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782F8A0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v16 - v12;
  uint64_t v17 = 0x7265766F5F656761;
  unint64_t v18 = 0xE90000000000005FLL;
  v16[1] = a1;
  sub_2148A19F8();
  sub_214896EB8();
  sub_2148A17E8();
  v16[2] = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26782F8B0);
  sub_214865B54(&qword_26782F8B8, &qword_26782F8B0);
  sub_2148A1908();
  MEMORY[0x2166A8B30](v5, v7);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v14 = *(void (**)(char *, uint64_t))(v8 + 8);
  v14(v11, v7);
  sub_214865B54(&qword_26782F8C0, &qword_26782F8A0);
  sub_2148A1EB8();
  v14(v13, v7);
  sub_2148A1BE8();
  swift_bridgeObjectRelease();
  return v17;
}

BOOL static ISO23220_1_ElementIdentifier.isAgeOverElement(_:)(unint64_t a1, unint64_t a2)
{
  sub_214896B84(a1, a2);
  return (v2 & 1) == 0;
}

void static ISO23220_1_ElementIdentifier.namespaceIdentifier.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

void *static ISO23220_1_ElementIdentifier.allCases.getter()
{
  return &unk_26C56F878;
}

uint64_t ISO23220_1_ElementIdentifier.rawValue.getter()
{
  uint64_t v1 = 0x61645F6874726962;
  if (*v0 != 1) {
    uint64_t v1 = 7890291;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x795F6E695F656761;
  }
}

uint64_t sub_2148967A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21480FF30(*a1, *a2);
}

uint64_t sub_2148967B4()
{
  return sub_2148A22F8();
}

uint64_t sub_21489685C()
{
  sub_2148A1BD8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2148968F0()
{
  return sub_2148A22F8();
}

CoreIDV::ISO23220_1_ElementIdentifier_optional sub_214896994(Swift::String *a1)
{
  return ISO23220_1_ElementIdentifier.init(rawValue:)(*a1);
}

void sub_2148969A0(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEC00000073726165;
  unint64_t v4 = 0xEA00000000006574;
  uint64_t v5 = 0x61645F6874726962;
  if (v2 != 1)
  {
    uint64_t v5 = 7890291;
    unint64_t v4 = 0xE300000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x795F6E695F656761;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

void sub_214896A04(void *a1@<X8>)
{
  *a1 = &unk_26C56F998;
}

void static ISO23220_1_Japan_ElementIdentifier.namespaceIdentifier.getter(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

void *static ISO23220_1_Japan_ElementIdentifier.allCases.getter()
{
  return &unk_26C571AD8;
}

unint64_t ISO23220_1_Japan_ElementIdentifier.rawValue.getter()
{
  unint64_t result = 0xD000000000000016;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD000000000000018;
      break;
    case 4:
      unint64_t result = 0x63696E755F786573;
      break;
    case 5:
      unint64_t result = 0xD000000000000019;
      break;
    case 6:
      unint64_t result = 0x7469617274726F70;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_214896B14(char *a1, char *a2)
{
  return sub_21480FC28(*a1, *a2);
}

uint64_t sub_214896B20()
{
  return sub_214894E1C();
}

uint64_t sub_214896B2C()
{
  return sub_214894AC0();
}

uint64_t sub_214896B34()
{
  return sub_214894E1C();
}

CoreIDV::ISO23220_1_Japan_ElementIdentifier_optional sub_214896B3C(Swift::String *a1)
{
  return ISO23220_1_Japan_ElementIdentifier.init(rawValue:)(*a1);
}

unint64_t sub_214896B48@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ISO23220_1_Japan_ElementIdentifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_214896B70(void *a1@<X8>)
{
  *a1 = &unk_26C571AD8;
}

unsigned __int8 *sub_214896B84(unint64_t a1, unint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782D270);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v27[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782D278);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = &v27[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = &v27[-v12];
  unint64_t v28 = a1;
  unint64_t v29 = a2;
  if (qword_26782CBB0 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782D280);
  __swift_project_value_buffer(v14, (uint64_t)qword_26782F888);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26782D288);
  sub_214808128();
  sub_214865B54((unint64_t *)&qword_26782D298, &qword_26782D280);
  sub_2148A1B38();
  sub_2148081D8((uint64_t)v13, (uint64_t)v11);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4) == 1)
  {
    uint64_t v15 = 0;
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v7, v11, v4);
    swift_getKeyPath();
    sub_2148A1AC8();
    swift_release();
    uint64_t v16 = v28;
    uint64_t v17 = v29;
    uint64_t v18 = v31;
    if ((v29 ^ v28) >> 14)
    {
      uint64_t v19 = v30;
      uint64_t v20 = sub_214808D5C(v28, v29, v30, v31, 10);
      if ((v21 & 0x100) != 0)
      {
        uint64_t v15 = sub_214808500(v16, v17, v19, v18, 10);
        char v25 = v24;
        swift_bridgeObjectRelease();
        int v23 = v25 & 1;
      }
      else
      {
        uint64_t v15 = (unsigned __int8 *)v20;
        char v22 = v21;
        swift_bridgeObjectRelease();
        int v23 = v22 & 1;
      }
      if (v23) {
        uint64_t v15 = 0;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v15 = 0;
    }
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_214808240((uint64_t)v13);
  return v15;
}

unint64_t sub_214896EB8()
{
  unint64_t result = qword_26782F8A8;
  if (!qword_26782F8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F8A8);
  }
  return result;
}

unint64_t sub_214896F10()
{
  unint64_t result = qword_26782F8C8;
  if (!qword_26782F8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F8C8);
  }
  return result;
}

unint64_t sub_214896F68()
{
  unint64_t result = qword_26782F8D0;
  if (!qword_26782F8D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F8D0);
  }
  return result;
}

unint64_t sub_214896FC0()
{
  unint64_t result = qword_26782F8D8;
  if (!qword_26782F8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F8D8);
  }
  return result;
}

unint64_t sub_214897018()
{
  unint64_t result = qword_26782F8E0;
  if (!qword_26782F8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F8E0);
  }
  return result;
}

uint64_t sub_21489706C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_214897580(a1, a2, a3, (uint64_t (*)(void))sub_214897098, (uint64_t (*)(void))sub_2148970EC);
}

unint64_t sub_214897098()
{
  unint64_t result = qword_26782F8E8;
  if (!qword_26782F8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F8E8);
  }
  return result;
}

unint64_t sub_2148970EC()
{
  unint64_t result = qword_26782F8F0;
  if (!qword_26782F8F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F8F0);
  }
  return result;
}

uint64_t sub_214897140()
{
  return sub_214865B54(&qword_26782F8F8, &qword_26782F900);
}

unint64_t sub_214897180()
{
  unint64_t result = qword_26782F908;
  if (!qword_26782F908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F908);
  }
  return result;
}

unint64_t sub_2148971D8()
{
  unint64_t result = qword_26782F910;
  if (!qword_26782F910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F910);
  }
  return result;
}

uint64_t sub_21489722C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_214897580(a1, a2, a3, (uint64_t (*)(void))sub_214897258, (uint64_t (*)(void))sub_2148972AC);
}

unint64_t sub_214897258()
{
  unint64_t result = qword_26782F918;
  if (!qword_26782F918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F918);
  }
  return result;
}

unint64_t sub_2148972AC()
{
  unint64_t result = qword_26782F920;
  if (!qword_26782F920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F920);
  }
  return result;
}

uint64_t sub_214897300()
{
  return sub_214865B54(&qword_26782F928, &qword_26782F930);
}

unint64_t sub_214897340()
{
  unint64_t result = qword_26782F938;
  if (!qword_26782F938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F938);
  }
  return result;
}

unint64_t sub_214897398()
{
  unint64_t result = qword_26782F940;
  if (!qword_26782F940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F940);
  }
  return result;
}

uint64_t sub_2148973EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_214897580(a1, a2, a3, (uint64_t (*)(void))sub_214897418, (uint64_t (*)(void))sub_21489746C);
}

unint64_t sub_214897418()
{
  unint64_t result = qword_26782F948;
  if (!qword_26782F948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F948);
  }
  return result;
}

unint64_t sub_21489746C()
{
  unint64_t result = qword_26782F950;
  if (!qword_26782F950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F950);
  }
  return result;
}

uint64_t sub_2148974C0()
{
  return sub_214865B54(&qword_26782F958, &qword_26782F960);
}

unint64_t sub_214897500()
{
  unint64_t result = qword_26782F968;
  if (!qword_26782F968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F968);
  }
  return result;
}

uint64_t sub_214897554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_214897580(a1, a2, a3, (uint64_t (*)(void))sub_2148975BC, (uint64_t (*)(void))sub_214897610);
}

uint64_t sub_214897580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2148975BC()
{
  unint64_t result = qword_26782F970;
  if (!qword_26782F970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F970);
  }
  return result;
}

unint64_t sub_214897610()
{
  unint64_t result = qword_26782F978;
  if (!qword_26782F978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F978);
  }
  return result;
}

uint64_t sub_214897664()
{
  return sub_214865B54(&qword_26782F980, &qword_26782F988);
}

unsigned char *storeEnumTagSinglePayload for ISO18013KnownDocTypes(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21489776CLL);
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

ValueMetadata *type metadata accessor for ISO18013KnownDocTypes()
{
  return &type metadata for ISO18013KnownDocTypes;
}

unsigned char *storeEnumTagSinglePayload for ISO18013KnownNamespaces(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x214897870);
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

ValueMetadata *type metadata accessor for ISO18013KnownNamespaces()
{
  return &type metadata for ISO18013KnownNamespaces;
}

uint64_t dispatch thunk of static MobileDocumentElementIdentifier.namespaceIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t getEnumTagSinglePayload for ISO18013_5_1_ElementIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE2) {
    goto LABEL_17;
  }
  if (a2 + 30 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 30) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 30;
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
      return (*a1 | (v4 << 8)) - 30;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 30;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1F;
  int v8 = v6 - 31;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ISO18013_5_1_ElementIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 30 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 30) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE1)
  {
    unsigned int v6 = ((a2 - 226) >> 8) + 1;
    *unint64_t result = a2 + 30;
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
        JUMPOUT(0x214897A18);
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
          *unint64_t result = a2 + 30;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ISO18013_5_1_ElementIdentifier()
{
  return &type metadata for ISO18013_5_1_ElementIdentifier;
}

ValueMetadata *type metadata accessor for ISO18013_5_1_DrivingPrivilegeIdentifier()
{
  return &type metadata for ISO18013_5_1_DrivingPrivilegeIdentifier;
}

uint64_t getEnumTagSinglePayload for ISO18013_AAMVA_ElementIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEF) {
    goto LABEL_17;
  }
  if (a2 + 17 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 17) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 17;
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
      return (*a1 | (v4 << 8)) - 17;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 17;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x12;
  int v8 = v6 - 18;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ISO18013_AAMVA_ElementIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 17 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 17) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEE)
  {
    unsigned int v6 = ((a2 - 239) >> 8) + 1;
    *unint64_t result = a2 + 17;
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
        JUMPOUT(0x214897BC4);
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
          *unint64_t result = a2 + 17;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ISO18013_AAMVA_ElementIdentifier()
{
  return &type metadata for ISO18013_AAMVA_ElementIdentifier;
}

unsigned char *storeEnumTagSinglePayload for ISO18013_AAMVA_DomesticDrivingPrivilegeIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x214897CC8);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ISO18013_AAMVA_DomesticDrivingPrivilegeIdentifier()
{
  return &type metadata for ISO18013_AAMVA_DomesticDrivingPrivilegeIdentifier;
}

unsigned char *storeEnumTagSinglePayload for ISO23220_1_ElementIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x214897DCCLL);
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

ValueMetadata *type metadata accessor for ISO23220_1_ElementIdentifier()
{
  return &type metadata for ISO23220_1_ElementIdentifier;
}

uint64_t _s7CoreIDV39ISO18013_5_1_DrivingPrivilegeIdentifierOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s7CoreIDV39ISO18013_5_1_DrivingPrivilegeIdentifierOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x214897F60);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ISO23220_1_Japan_ElementIdentifier()
{
  return &type metadata for ISO23220_1_Japan_ElementIdentifier;
}

unint64_t sub_214897F98()
{
  unint64_t result = qword_26782F990;
  if (!qword_26782F990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F990);
  }
  return result;
}

uint64_t MobileDocumentReaderEntitlementChecker.init(bundleRecordFetcher:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_214897FFC(a1, a2);
}

uint64_t sub_214897FFC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

Swift::Bool __swiftcall MobileDocumentReaderEntitlementChecker.checkInternalEntitlement(connection:)(NSXPCConnection_optional connection)
{
  if (connection.value.super.isa)
  {
    uint64_t v1 = connection.value.super.isa;
    long long v2 = (void *)sub_2148A1B78();
    id v3 = [(objc_class *)v1 valueForEntitlement:v2];

    if (v3)
    {
      sub_2148A1EC8();

      swift_unknownObjectRelease();
    }
    else
    {

      long long v11 = 0u;
      long long v12 = 0u;
    }
    sub_21480DB2C((uint64_t)&v11, (uint64_t)&v13, &qword_26782D028);
    if (*((void *)&v14 + 1))
    {
      int v8 = swift_dynamicCast();
      if (v8) {
        LOBYTE(v8) = v10;
      }
      return v8;
    }
LABEL_16:
    sub_2147FC5F8((uint64_t)&v13, &qword_26782D028);
    LOBYTE(v8) = 0;
    return v8;
  }
  SecTaskRef v4 = SecTaskCreateFromSelf(0);
  if (!v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    goto LABEL_16;
  }
  uint64_t v5 = v4;
  unsigned int v6 = (__CFString *)sub_2148A1B78();
  CFTypeRef v7 = SecTaskCopyValueForEntitlement(v5, v6, 0);

  if (v7)
  {
    *((void *)&v12 + 1) = swift_getObjectType();
    *(void *)&long long v11 = v7;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  sub_21480DB2C((uint64_t)&v11, (uint64_t)&v13, &qword_26782D028);

  if (!*((void *)&v14 + 1)) {
    goto LABEL_16;
  }
  int v8 = swift_dynamicCast();
  if (v8) {
    LOBYTE(v8) = v11;
  }
  return v8;
}

Swift::Bool __swiftcall MobileDocumentReaderEntitlementChecker.checkPublicEntitlements(auditToken:)(audit_token_t_optional *auditToken)
{
  sub_21480DB2C((uint64_t)auditToken, (uint64_t)v18, &qword_26782F998);
  if (v19)
  {
    sub_2148989DC((uint64_t)auditToken, &v16);
    if (*((void *)&v17 + 1))
    {
      if (swift_dynamicCast())
      {
        char v2 = token.val[0];
        goto LABEL_10;
      }
    }
    else
    {
      sub_2147FC5F8((uint64_t)&v16, &qword_26782D028);
    }
    char v2 = 0;
LABEL_10:
    SecTaskRef v3 = SecTaskCreateFromSelf(0);
    if (v3)
    {
      SecTaskRef v4 = v3;
      uint64_t v5 = (__CFString *)sub_2148A1B78();
      CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, v5, 0);

      if (v6)
      {
        *(void *)&token.val[6] = swift_getObjectType();
        *(void *)token.val = v6;
      }
      else
      {
        memset(&token, 0, sizeof(token));
      }
      sub_21480DB2C((uint64_t)&token, (uint64_t)&v16, &qword_26782D028);

      if (*((void *)&v17 + 1)) {
        goto LABEL_24;
      }
LABEL_26:
      sub_2147FC5F8((uint64_t)&v16, &qword_26782D028);
      goto LABEL_27;
    }
LABEL_18:
    long long v16 = 0u;
    long long v17 = 0u;
    goto LABEL_26;
  }
  long long v13 = v18[1];
  long long v14 = v18[0];
  sub_2148989DC((uint64_t)auditToken, &v16);
  if (*((void *)&v17 + 1))
  {
    if (swift_dynamicCast())
    {
      char v2 = token.val[0];
      goto LABEL_15;
    }
  }
  else
  {
    sub_2147FC5F8((uint64_t)&v16, &qword_26782D028);
  }
  char v2 = 0;
LABEL_15:
  *(_OWORD *)token.val = v14;
  *(_OWORD *)&token.val[4] = v13;
  SecTaskRef v7 = SecTaskCreateWithAuditToken(0, &token);
  if (!v7) {
    goto LABEL_18;
  }
  int v8 = v7;
  uint64_t v9 = (__CFString *)sub_2148A1B78();
  CFTypeRef v10 = SecTaskCopyValueForEntitlement(v8, v9, 0);

  if (v10)
  {
    *(void *)&token.val[6] = swift_getObjectType();
    *(void *)token.val = v10;
  }
  else
  {
    memset(&token, 0, sizeof(token));
  }
  sub_21480DB2C((uint64_t)&token, (uint64_t)&v16, &qword_26782D028);

  if (!*((void *)&v17 + 1)) {
    goto LABEL_26;
  }
LABEL_24:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26782F9A0);
  if (!swift_dynamicCast())
  {
LABEL_27:
    char v11 = 0;
    return v11 | v2;
  }
  swift_bridgeObjectRelease();
  char v11 = 1;
  return v11 | v2;
}

CoreIDV::MobileDocumentReaderBundleTypeCheckOutcome __swiftcall MobileDocumentReaderEntitlementChecker.checkBundleTypeSupported(auditToken:)(audit_token_t_optional *auditToken)
{
  SecTaskRef v4 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782E650);
  MEMORY[0x270FA5388](v5 - 8);
  SecTaskRef v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v8 = type metadata accessor for BundleRecord();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  long long v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)v35 - v14 + 8;
  MEMORY[0x270FA5388](v13);
  long long v17 = (char *)v35 - v16 + 8;
  sub_21480DB2C((uint64_t)auditToken, (uint64_t)v35, &qword_26782F998);
  if (v36)
  {
    uint64_t v18 = v2[3];
    uint64_t v19 = v2[4];
    __swift_project_boxed_opaque_existential_1(v2, v18);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v19);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      CoreIDV::MobileDocumentReaderBundleTypeCheckOutcome result = sub_2147FC5F8((uint64_t)v7, &qword_26782E650);
LABEL_11:
      char v33 = 2;
      goto LABEL_12;
    }
    sub_214852D8C((uint64_t)v7, (uint64_t)v12);
    uint64_t v15 = v12;
  }
  else
  {
    uint64_t v21 = v35[0];
    uint64_t v22 = v35[1];
    uint64_t v23 = v35[2];
    uint64_t v24 = v35[3];
    uint64_t v34 = v17;
    uint64_t v25 = v8;
    uint64_t v26 = v4;
    uint64_t v28 = v2[3];
    uint64_t v27 = v2[4];
    __swift_project_boxed_opaque_existential_1(v2, v28);
    uint64_t v29 = v28;
    SecTaskRef v4 = v26;
    uint64_t v8 = v25;
    long long v17 = v34;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 16))(v21, v22, v23, v24, v29, v27);
  }
  sub_214852D8C((uint64_t)v15, (uint64_t)v17);
  if (v17[*(int *)(v8 + 40)])
  {
    if (v17[*(int *)(v8 + 40)] != 1)
    {
      CoreIDV::MobileDocumentReaderBundleTypeCheckOutcome result = sub_214898AC8((uint64_t)v17);
      goto LABEL_11;
    }
    id v30 = *(id *)&v17[*(int *)(v8 + 48)];
    v31._object = (void *)0x80000002148B7550;
    v31._countAndFlagsBits = 0xD000000000000040;
    Swift::Bool v32 = LSPropertyList.BOOL(forKey:)(v31);

    CoreIDV::MobileDocumentReaderBundleTypeCheckOutcome result = sub_214898AC8((uint64_t)v17);
    char v33 = !v32;
  }
  else
  {
    CoreIDV::MobileDocumentReaderBundleTypeCheckOutcome result = sub_214898AC8((uint64_t)v17);
    char v33 = 0;
  }
LABEL_12:
  *SecTaskRef v4 = v33;
  return result;
}

BOOL static MobileDocumentReaderBundleTypeCheckOutcome.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MobileDocumentReaderBundleTypeCheckOutcome.hash(into:)()
{
  return sub_2148A22C8();
}

uint64_t MobileDocumentReaderBundleTypeCheckOutcome.hashValue.getter()
{
  return sub_2148A22F8();
}

unint64_t static MobileDocumentReaderEntitlementChecker.Constant.displayOnlyEntitlementKey.getter()
{
  return 0xD000000000000035;
}

unint64_t static MobileDocumentReaderEntitlementChecker.Constant.dataTransferEntitlementKey.getter()
{
  return 0xD000000000000032;
}

void sub_2148989DC(uint64_t a1@<X2>, _OWORD *a2@<X8>)
{
  sub_21480DB2C(a1, (uint64_t)&v8, &qword_26782F998);
  if (v9)
  {
    SecTaskRef v3 = SecTaskCreateFromSelf(0);
    if (!v3)
    {
LABEL_3:
      *a2 = 0u;
      a2[1] = 0u;
      return;
    }
  }
  else
  {
    audit_token_t v7 = v8;
    SecTaskRef v3 = SecTaskCreateWithAuditToken(0, &v7);
    if (!v3) {
      goto LABEL_3;
    }
  }
  SecTaskRef v4 = v3;
  uint64_t v5 = (__CFString *)sub_2148A1B78();
  CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, v5, 0);

  if (v6)
  {
    *(void *)&v7.val[6] = swift_getObjectType();
    *(void *)v7.val = v6;
  }
  else
  {
    memset(&v7, 0, sizeof(v7));
  }
  sub_21480DB2C((uint64_t)&v7, (uint64_t)a2, &qword_26782D028);
}

uint64_t sub_214898AC8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BundleRecord();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Bool __swiftcall MobileDocumentReaderEntitlementChecker.checkDevelopmentFlagEntitlements(auditToken:)(audit_token_t *auditToken)
{
  *(void *)token.val = auditToken;
  *(void *)&token.val[2] = v1;
  *(void *)&token.val[4] = v2;
  *(void *)&token.val[6] = v3;
  SecTaskRef v4 = SecTaskCreateWithAuditToken(0, &token);
  if (!v4)
  {
    memset(&token, 0, sizeof(token));
LABEL_9:
    sub_2147FC5F8((uint64_t)&token, &qword_26782D028);
    LOBYTE(v8) = 0;
    return v8;
  }
  uint64_t v5 = v4;
  CFTypeRef v6 = (__CFString *)sub_2148A1B78();
  CFTypeRef v7 = SecTaskCopyValueForEntitlement(v5, v6, 0);

  if (v7)
  {
    *((void *)&v11 + 1) = swift_getObjectType();
    *(void *)&long long v10 = v7;
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  sub_21480DB2C((uint64_t)&v10, (uint64_t)&token, &qword_26782D028);

  if (!*(void *)&token.val[6]) {
    goto LABEL_9;
  }
  int v8 = swift_dynamicCast();
  if (v8) {
    LOBYTE(v8) = v10;
  }
  return v8;
}

BOOL sub_214898C54(NSXPCConnection_optional a1)
{
  return MobileDocumentReaderEntitlementChecker.checkInternalEntitlement(connection:)(a1);
}

BOOL sub_214898C74(audit_token_t *a1)
{
  return MobileDocumentReaderEntitlementChecker.checkDevelopmentFlagEntitlements(auditToken:)(a1);
}

unint64_t sub_214898C98()
{
  unint64_t result = qword_26782F9A8;
  if (!qword_26782F9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F9A8);
  }
  return result;
}

uint64_t dispatch thunk of MobileDocumentReaderEntitlementChecking.checkInternalEntitlement(connection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MobileDocumentReaderEntitlementChecking.checkPublicEntitlements(auditToken:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(_OWORD *))(a3 + 16);
  char v4 = *(unsigned char *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v5;
  char v8 = v4;
  return v3(v7) & 1;
}

uint64_t dispatch thunk of MobileDocumentReaderEntitlementChecking.checkDevelopmentFlagEntitlements(auditToken:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of MobileDocumentReaderEntitlementChecking.checkBundleTypeSupported(auditToken:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(_OWORD *))(a3 + 32);
  char v4 = *(unsigned char *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v5;
  char v8 = v4;
  return v3(v7);
}

unsigned char *storeEnumTagSinglePayload for MobileDocumentReaderBundleTypeCheckOutcome(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x214898E6CLL);
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

ValueMetadata *type metadata accessor for MobileDocumentReaderBundleTypeCheckOutcome()
{
  return &type metadata for MobileDocumentReaderBundleTypeCheckOutcome;
}

uint64_t initializeWithCopy for MobileDocumentReaderEntitlementChecker(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for MobileDocumentReaderEntitlementChecker(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
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
        *long long v3 = v12;
      }
      else
      {
        long long v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *long long v3 = *a2;
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

uint64_t assignWithTake for MobileDocumentReaderEntitlementChecker(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for MobileDocumentReaderEntitlementChecker(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MobileDocumentReaderEntitlementChecker(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MobileDocumentReaderEntitlementChecker()
{
  return &type metadata for MobileDocumentReaderEntitlementChecker;
}

ValueMetadata *type metadata accessor for MobileDocumentReaderEntitlementChecker.Constant()
{
  return &type metadata for MobileDocumentReaderEntitlementChecker.Constant;
}

uint64_t sub_214899244()
{
  uint64_t result = os_variant_allows_internal_security_policies();
  byte_267849FB8 = result;
  return result;
}

id static related decl 'e' for DIIdentityError.make(_:)(uint64_t a1)
{
  sub_2148A1B98();
  id v2 = objc_allocWithZone(MEMORY[0x263F087E8]);
  long long v3 = (void *)sub_2148A1B78();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_initWithDomain_code_userInfo_, v3, a1, 0);

  return v4;
}

id static DigitalPresentmentXPCInterface.interface()()
{
  id v0 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26C5819F0);
  return v0;
}

unint64_t machServiceDigitalPresentmentXPC.getter()
{
  return 0xD00000000000002ALL;
}

uint64_t DigitalPresentmentXPCInterface.deinit()
{
  return v0;
}

uint64_t DigitalPresentmentXPCInterface.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DigitalPresentmentXPCInterface()
{
  return self;
}

uint64_t method lookup function for DigitalPresentmentXPCInterface(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DigitalPresentmentXPCInterface);
}

id sub_2148993C0()
{
  type metadata accessor for BundleToken();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_267849FC0 = (uint64_t)result;
  return result;
}

uint64_t sub_214899418()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BundleToken()
{
  return self;
}

uint64_t MobileDocumentReaderMerchant.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MobileDocumentReaderMerchant.logoData.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_2147FC780(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t MobileDocumentReaderMerchant.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MobileDocumentReaderMerchant.init(name:logoData:identifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t MobileDocumentReaderMerchant.hash(into:)()
{
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  uint64_t v3 = v0[5];
  swift_bridgeObjectRetain();
  sub_2148A1BD8();
  swift_bridgeObjectRelease();
  if (v2 >> 60 != 15)
  {
    sub_2148A22D8();
    sub_2147F3CA8(v1, v2);
    sub_2148A1998();
    sub_2147FC794(v1, v2);
    if (v3) {
      goto LABEL_3;
    }
    return sub_2148A22D8();
  }
  sub_2148A22D8();
  if (!v3) {
    return sub_2148A22D8();
  }
LABEL_3:
  sub_2148A22D8();
  swift_bridgeObjectRetain();
  sub_2148A1BD8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_214899608()
{
  uint64_t v1 = 0x617461446F676F6CLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x696669746E656469;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701667182;
  }
}

uint64_t sub_214899660@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21489A494(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_214899688(uint64_t a1)
{
  unint64_t v2 = sub_214899F68();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2148996C4(uint64_t a1)
{
  unint64_t v2 = sub_214899F68();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MobileDocumentReaderMerchant.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782F9B0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = v1[2];
  uint64_t v12 = v1[3];
  uint64_t v13 = v7;
  uint64_t v8 = v1[4];
  v11[1] = v1[5];
  v11[2] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214899F68();
  sub_2148A2318();
  LOBYTE(v15) = 0;
  uint64_t v9 = v14;
  sub_2148A2158();
  if (!v9)
  {
    uint64_t v15 = v13;
    uint64_t v16 = v12;
    char v17 = 1;
    sub_2147FBC84();
    sub_2148A2148();
    LOBYTE(v15) = 2;
    sub_2148A2128();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MobileDocumentReaderMerchant.hashValue.getter()
{
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  uint64_t v3 = v0[5];
  sub_2148A22B8();
  swift_bridgeObjectRetain();
  sub_2148A1BD8();
  swift_bridgeObjectRelease();
  if (v2 >> 60 != 15)
  {
    sub_2148A22D8();
    sub_2147F3CA8(v1, v2);
    sub_2148A1998();
    sub_2147FC794(v1, v2);
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    sub_2148A22D8();
    return sub_2148A22F8();
  }
  sub_2148A22D8();
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  sub_2148A22D8();
  swift_bridgeObjectRetain();
  sub_2148A1BD8();
  swift_bridgeObjectRelease();
  return sub_2148A22F8();
}

uint64_t MobileDocumentReaderMerchant.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782F9C0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_214899F68();
  sub_2148A2308();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v24) = 0;
  uint64_t v9 = sub_2148A20B8();
  uint64_t v11 = v10;
  uint64_t v23 = v9;
  char v26 = 1;
  sub_2147FC078();
  swift_bridgeObjectRetain();
  sub_2148A20A8();
  uint64_t v12 = v24;
  LOBYTE(v24) = 2;
  unint64_t v21 = v25;
  uint64_t v22 = v12;
  sub_2147FC780(v12, v25);
  uint64_t v13 = sub_2148A2088();
  uint64_t v15 = v14;
  uint64_t v16 = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  unint64_t v18 = v21;
  uint64_t v17 = v22;
  sub_2147FC780(v22, v21);
  swift_bridgeObjectRetain();
  sub_2147FC794(v17, v18);
  swift_bridgeObjectRelease();
  *a2 = v23;
  a2[1] = v11;
  a2[2] = v17;
  a2[3] = v18;
  a2[4] = v16;
  a2[5] = v15;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  sub_2147FC794(v17, v18);
  return swift_bridgeObjectRelease();
}

uint64_t sub_214899CB8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return MobileDocumentReaderMerchant.init(from:)(a1, a2);
}

uint64_t sub_214899CD0(void *a1)
{
  return MobileDocumentReaderMerchant.encode(to:)(a1);
}

uint64_t sub_214899CF0()
{
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  uint64_t v3 = v0[5];
  sub_2148A22B8();
  swift_bridgeObjectRetain();
  sub_2148A1BD8();
  swift_bridgeObjectRelease();
  if (v2 >> 60 != 15)
  {
    sub_2148A22D8();
    sub_2147F3CA8(v1, v2);
    sub_2148A1998();
    sub_2147FC794(v1, v2);
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    sub_2148A22D8();
    return sub_2148A22F8();
  }
  sub_2148A22D8();
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  sub_2148A22D8();
  swift_bridgeObjectRetain();
  sub_2148A1BD8();
  swift_bridgeObjectRelease();
  return sub_2148A22F8();
}

uint64_t _s7CoreIDV28MobileDocumentReaderMerchantV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  unint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a2[2];
  unint64_t v6 = a2[3];
  uint64_t v9 = a2[4];
  uint64_t v8 = a2[5];
  if (*a1 == *a2 && a1[1] == a2[1] || (char v10 = sub_2148A21C8(), result = 0, (v10 & 1) != 0))
  {
    if (v4 >> 60 == 15)
    {
      if (v6 >> 60 == 15)
      {
LABEL_10:
        if (v5)
        {
          if (v8 && (v3 == v9 && v5 == v8 || (sub_2148A21C8() & 1) != 0)) {
            return 1;
          }
        }
        else if (!v8)
        {
          return 1;
        }
        return 0;
      }
    }
    else if (v6 >> 60 != 15)
    {
      sub_2147FC780(v2, v4);
      sub_2147FC780(v7, v6);
      char v12 = sub_214850200(v2, v4, v7, v6);
      sub_2147FC794(v7, v6);
      sub_2147FC794(v2, v4);
      if (v12) {
        goto LABEL_10;
      }
      return 0;
    }
    sub_2147FC780(v2, v4);
    sub_2147FC780(v7, v6);
    sub_2147FC794(v2, v4);
    sub_2147FC794(v7, v6);
    return 0;
  }
  return result;
}

unint64_t sub_214899F68()
{
  unint64_t result = qword_26782F9B8;
  if (!qword_26782F9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F9B8);
  }
  return result;
}

unint64_t sub_214899FC0()
{
  unint64_t result = qword_26782F9C8;
  if (!qword_26782F9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F9C8);
  }
  return result;
}

uint64_t destroy for MobileDocumentReaderMerchant(uint64_t a1)
{
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >> 60 != 15) {
    sub_2147F4030(*(void *)(a1 + 16), v2);
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MobileDocumentReaderMerchant(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 2;
  unint64_t v6 = a2[3];
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *v5;
  }
  else
  {
    uint64_t v7 = *(void *)v5;
    sub_2147F3CA8(v7, v6);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v6;
  }
  uint64_t v8 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MobileDocumentReaderMerchant(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2 + 2;
  unint64_t v5 = a2[3];
  if (a1[3] >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_2147F3CA8(*v4, a2[3]);
      uint64_t v8 = a1[2];
      unint64_t v9 = a1[3];
      a1[2] = v7;
      a1[3] = v5;
      sub_2147F4030(v8, v9);
      goto LABEL_8;
    }
    sub_2147F5D1C((uint64_t)(a1 + 2));
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *((_OWORD *)a1 + 1) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v6 = *v4;
  sub_2147F3CA8(*v4, a2[3]);
  a1[2] = v6;
  a1[3] = v5;
LABEL_8:
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for MobileDocumentReaderMerchant(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  unint64_t v5 = a2 + 2;
  unint64_t v6 = a1[3];
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = a2[3];
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = a1[2];
      a1[2] = *v5;
      a1[3] = v7;
      sub_2147F4030(v8, v6);
      goto LABEL_6;
    }
    sub_2147F5D1C((uint64_t)(a1 + 2));
  }
  *((_OWORD *)a1 + 1) = *(_OWORD *)v5;
LABEL_6:
  uint64_t v9 = a2[5];
  a1[4] = a2[4];
  a1[5] = v9;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for MobileDocumentReaderMerchant()
{
  return &type metadata for MobileDocumentReaderMerchant;
}

unsigned char *storeEnumTagSinglePayload for MobileDocumentReaderMerchant.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21489A354);
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

ValueMetadata *type metadata accessor for MobileDocumentReaderMerchant.CodingKeys()
{
  return &type metadata for MobileDocumentReaderMerchant.CodingKeys;
}

unint64_t sub_21489A390()
{
  unint64_t result = qword_26782F9D0;
  if (!qword_26782F9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F9D0);
  }
  return result;
}

unint64_t sub_21489A3E8()
{
  unint64_t result = qword_26782F9D8;
  if (!qword_26782F9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782F9D8);
  }
  return result;
}

unint64_t sub_21489A440()
{
  unint64_t result = qword_26782F9E0[0];
  if (!qword_26782F9E0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26782F9E0);
  }
  return result;
}

uint64_t sub_21489A494(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x617461446F676F6CLL && a2 == 0xE800000000000000 || (sub_2148A21C8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2148A21C8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_21489A5EC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21489A640()
{
  uint64_t v1 = *(void **)(v0 + 16);
  objc_msgSend(v1, sel_invalidate);

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SendableXPCConnection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void _s7CoreIDV35XPCMobileDocumentReaderSessionStateC6encode4withySo7NSCoderC_tF_0(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  type metadata accessor for MobileDocumentReaderSession.State();
  sub_2148A0908(&qword_26782FAB0, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderSession.State);
  sub_2148A1E48();
  objc_msgSend(v2, sel_finishEncoding);
  id v3 = objc_msgSend(v2, sel_encodedData);
  if (v3)
  {
    unsigned int v4 = v3;
    id v5 = (id)sub_2148A1B78();
    objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);
  }
  else
  {
    __break(1u);
  }
}

void _s7CoreIDV36XPCMobileDocumentReaderConfigurationC6encode4withySo7NSCoderC_tF_0(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  sub_2148A0134();
  swift_bridgeObjectRetain();
  sub_2148A1E48();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_finishEncoding);
  id v3 = objc_msgSend(v2, sel_encodedData);
  if (v3)
  {
    unsigned int v4 = v3;
    id v5 = (void *)sub_2148A1B78();
    objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);
  }
  else
  {
    __break(1u);
  }
}

void _s7CoreIDV44XPCMobileDocumentReaderConfigurationResponseC6encode4withySo7NSCoderC_tF_0(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  type metadata accessor for MobileDocumentReaderConfigurationResponse();
  sub_2148A0908(&qword_26782FAD0, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderConfigurationResponse);
  sub_2148A1E48();
  objc_msgSend(v2, sel_finishEncoding);
  id v3 = objc_msgSend(v2, sel_encodedData);
  if (v3)
  {
    unsigned int v4 = v3;
    id v5 = (id)sub_2148A1B78();
    objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);
  }
  else
  {
    __break(1u);
  }
}

void _s7CoreIDV31XPCMobileDocumentReaderMerchantC6encode4withySo7NSCoderC_tF_0(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value + 16);
  long long v8 = *(_OWORD *)(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value + 24);
  swift_bridgeObjectRetain();
  sub_2147FC780(v4, v8);
  sub_2148A0274();
  swift_bridgeObjectRetain();
  sub_2148A1E48();
  swift_bridgeObjectRelease();
  sub_2147FC794(v4, v8);
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_finishEncoding);
  id v5 = objc_msgSend(v3, sel_encodedData);
  if (v5)
  {
    char v6 = v5;
    unint64_t v7 = (void *)sub_2148A1B78();
    objc_msgSend(a1, sel_encodeObject_forKey_, v6, v7);
  }
  else
  {
    __break(1u);
  }
}

void _s7CoreIDV30XPCMobileDocumentReaderRequestC6encode4withySo7NSCoderC_tF_0(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  type metadata accessor for MobileDocumentReaderRequest(0);
  sub_2148A0908(&qword_26782FAF0, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderRequest);
  sub_2148A1E48();
  objc_msgSend(v2, sel_finishEncoding);
  id v3 = objc_msgSend(v2, sel_encodedData);
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = (id)sub_2148A1B78();
    objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);
  }
  else
  {
    __break(1u);
  }
}

void _s7CoreIDV43XPCMobileDocumentReaderDeviceEngagementTypeC6encode4withySo7NSCoderC_tF_0(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value);
  unint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value + 8);
  sub_2147FC780(v7, v8);
  sub_2148A03B4();
  sub_2148A1E48();
  sub_2147FC794(v7, v8);
  objc_msgSend(v3, sel_finishEncoding);
  id v4 = objc_msgSend(v3, sel_encodedData);
  if (v4)
  {
    id v5 = v4;
    char v6 = (void *)sub_2148A1B78();
    objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);
  }
  else
  {
    __break(1u);
  }
}

void _s7CoreIDV31XPCMobileDocumentReaderResponseC6encode4withySo7NSCoderC_tF_0(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  type metadata accessor for MobileDocumentReaderResponse(0);
  sub_2148A0908(&qword_26782FB10, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderResponse);
  sub_2148A1E48();
  objc_msgSend(v2, sel_finishEncoding);
  id v3 = objc_msgSend(v2, sel_encodedData);
  if (v3)
  {
    id v4 = v3;
    id v5 = (id)sub_2148A1B78();
    objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);
  }
  else
  {
    __break(1u);
  }
}

void _s7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequestC6encode4withySo7NSCoderC_tF_0(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  type metadata accessor for MobileDocumentReaderIdentityKeyRequest();
  sub_2148A0908(&qword_26782FB30, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
  sub_2148A1E48();
  objc_msgSend(v2, sel_finishEncoding);
  id v3 = objc_msgSend(v2, sel_encodedData);
  if (v3)
  {
    id v4 = v3;
    id v5 = (id)sub_2148A1B78();
    objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);
  }
  else
  {
    __break(1u);
  }
}

void _s7CoreIDV41XPCMobileDocumentReaderCertificateRequestC6encode4withySo7NSCoderC_tF_0(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  type metadata accessor for MobileDocumentReaderCertificateRequest();
  sub_2148A0908(&qword_26782FB40, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderCertificateRequest);
  sub_2148A1E48();
  objc_msgSend(v2, sel_finishEncoding);
  id v3 = objc_msgSend(v2, sel_encodedData);
  if (v3)
  {
    id v4 = v3;
    id v5 = (id)sub_2148A1B78();
    objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);
  }
  else
  {
    __break(1u);
  }
}

void sub_21489B4C4(void *a1, uint64_t a2, void (*a3)(void))
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  a3();
  swift_bridgeObjectRetain();
  sub_2148A1E48();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_finishEncoding);
  id v6 = objc_msgSend(v5, sel_encodedData);
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = (void *)sub_2148A1B78();
    objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);
  }
  else
  {
    __break(1u);
  }
}

void _s7CoreIDV29XPCIdentityDocumentDescriptorC6encode4withySo7NSCoderC_tF_0(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  type metadata accessor for IdentityDocumentDescriptor(0);
  sub_2148A0908((unint64_t *)&unk_26782FB80, (void (*)(uint64_t))type metadata accessor for IdentityDocumentDescriptor);
  sub_2148A1E48();
  objc_msgSend(v2, sel_finishEncoding);
  id v3 = objc_msgSend(v2, sel_encodedData);
  if (v3)
  {
    id v4 = v3;
    id v5 = (id)sub_2148A1B78();
    objc_msgSend(a1, sel_encodeObject_forKey_, v4, v5);
  }
  else
  {
    __break(1u);
  }
}

id XPCIdentityDocumentDescriptor.__allocating_init(value:)(uint64_t a1)
{
  return sub_21489B7F8(a1, &OBJC_IVAR____TtC7CoreIDV29XPCIdentityDocumentDescriptor_value, type metadata accessor for IdentityDocumentDescriptor);
}

id XPCMobileDocumentReaderIdentityKeyRequest.__allocating_init(value:)(uint64_t a1)
{
  return sub_21489B7F8(a1, &OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
}

id sub_21489B7F8(uint64_t a1, void *a2, uint64_t (*a3)(void))
{
  id v7 = objc_allocWithZone(v3);
  sub_21489F0B0(a1, (uint64_t)v7 + *a2, a3);
  v10.receiver = v7;
  v10.super_class = v3;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  sub_21489F118(a1, a3);
  return v8;
}

id XPCMobileDocumentReaderCertificateRequest.__allocating_init(value:)(uint64_t a1)
{
  return sub_21489B7F8(a1, &OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderCertificateRequest);
}

id XPCMobileDocumentReaderConfiguration.__allocating_init(value:)(uint64_t a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  char v4 = *(unsigned char *)(a1 + 16);
  id v5 = &v3[OBJC_IVAR____TtC7CoreIDV36XPCMobileDocumentReaderConfiguration_value];
  *(_OWORD *)id v5 = *(_OWORD *)a1;
  v5[16] = v4;
  v7.receiver = v3;
  v7.super_class = v1;
  return objc_msgSendSuper2(&v7, sel_init);
}

id XPCMobileDocumentReaderRequest.__allocating_init(value:)(uint64_t a1)
{
  return sub_21489B7F8(a1, &OBJC_IVAR____TtC7CoreIDV30XPCMobileDocumentReaderRequest_value, type metadata accessor for MobileDocumentReaderRequest);
}

id XPCMobileDocumentReaderDeviceEngagementType.__allocating_init(value:)(_OWORD *a1)
{
  id v3 = (char *)objc_allocWithZone(v1);
  *(_OWORD *)&v3[OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value] = *a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id XPCAuditToken.__allocating_init(value:)(void *a1)
{
  return sub_21489DB80(a1, &OBJC_IVAR____TtC7CoreIDV13XPCAuditToken_value);
}

uint64_t static XPCMobileDocumentReaderSessionState.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderSessionState.value.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV35XPCMobileDocumentReaderSessionState_value, a1, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderSession.State);
}

id XPCMobileDocumentReaderSessionState.__allocating_init(value:)(uint64_t a1)
{
  return sub_21489B7F8(a1, &OBJC_IVAR____TtC7CoreIDV35XPCMobileDocumentReaderSessionState_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderSession.State);
}

id XPCMobileDocumentReaderSessionState.init(value:)(uint64_t a1)
{
  return sub_21489BE8C(a1, &OBJC_IVAR____TtC7CoreIDV35XPCMobileDocumentReaderSessionState_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderSession.State);
}

uint64_t XPCMobileDocumentReaderSessionState.__allocating_init(coder:)(uint64_t a1)
{
  return sub_21489BF2C(a1, (uint64_t (*)(uint64_t))sub_21489E1C0);
}

uint64_t XPCMobileDocumentReaderSessionState.init(coder:)(uint64_t a1)
{
  return sub_21489BFE0(a1, (uint64_t (*)(uint64_t))sub_21489E1C0);
}

void XPCMobileDocumentReaderSessionState.init()()
{
}

uint64_t sub_21489BB5C@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV35XPCMobileDocumentReaderSessionState_value, a1, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderSession.State);
}

id sub_21489BB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21489C284(a1, a2, a3, &OBJC_IVAR____TtC7CoreIDV35XPCMobileDocumentReaderSessionState_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderSession.State);
}

uint64_t static XPCMobileDocumentReaderConfiguration.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderConfiguration.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV36XPCMobileDocumentReaderConfiguration_value + 8);
  char v3 = *(unsigned char *)(v1 + OBJC_IVAR____TtC7CoreIDV36XPCMobileDocumentReaderConfiguration_value + 16);
  *(void *)a1 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV36XPCMobileDocumentReaderConfiguration_value);
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

id XPCMobileDocumentReaderConfiguration.init(value:)(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  char v4 = *(unsigned char *)(a1 + 16);
  objc_super v5 = &v1[OBJC_IVAR____TtC7CoreIDV36XPCMobileDocumentReaderConfiguration_value];
  *(_OWORD *)objc_super v5 = *(_OWORD *)a1;
  v5[16] = v4;
  v7.receiver = v1;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t XPCMobileDocumentReaderConfiguration.__allocating_init(coder:)(uint64_t a1)
{
  return sub_21489C474(a1, (uint64_t (*)(uint64_t))sub_21489E508);
}

uint64_t XPCMobileDocumentReaderConfiguration.init(coder:)(uint64_t a1)
{
  return sub_21489C504(a1, (uint64_t (*)(uint64_t))sub_21489E508);
}

void XPCMobileDocumentReaderConfiguration.init()()
{
}

uint64_t sub_21489BD80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV36XPCMobileDocumentReaderConfiguration_value + 8);
  char v3 = *(unsigned char *)(v1 + OBJC_IVAR____TtC7CoreIDV36XPCMobileDocumentReaderConfiguration_value + 16);
  *(void *)a1 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV36XPCMobileDocumentReaderConfiguration_value);
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

id sub_21489BDA0(uint64_t a1)
{
  char v3 = (char *)objc_allocWithZone(v1);
  char v4 = *(unsigned char *)(a1 + 16);
  objc_super v5 = &v3[OBJC_IVAR____TtC7CoreIDV36XPCMobileDocumentReaderConfiguration_value];
  *(_OWORD *)objc_super v5 = *(_OWORD *)a1;
  v5[16] = v4;
  v7.receiver = v3;
  v7.super_class = v1;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t static XPCMobileDocumentReaderConfigurationResponse.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderConfigurationResponse.value.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV44XPCMobileDocumentReaderConfigurationResponse_value, a1, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderConfigurationResponse);
}

id XPCMobileDocumentReaderConfigurationResponse.__allocating_init(value:)(uint64_t a1)
{
  return sub_21489B7F8(a1, &OBJC_IVAR____TtC7CoreIDV44XPCMobileDocumentReaderConfigurationResponse_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderConfigurationResponse);
}

id XPCMobileDocumentReaderConfigurationResponse.init(value:)(uint64_t a1)
{
  return sub_21489BE8C(a1, &OBJC_IVAR____TtC7CoreIDV44XPCMobileDocumentReaderConfigurationResponse_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderConfigurationResponse);
}

id sub_21489BE8C(uint64_t a1, void *a2, uint64_t (*a3)(void))
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_21489F0B0(a1, (uint64_t)v3 + *a2, a3);
  v10.receiver = v3;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  sub_21489F118(a1, a3);
  return v8;
}

uint64_t XPCMobileDocumentReaderConfigurationResponse.__allocating_init(coder:)(uint64_t a1)
{
  return sub_21489BF2C(a1, (uint64_t (*)(uint64_t))sub_21489E6B8);
}

uint64_t sub_21489BF2C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  id v5 = objc_allocWithZone(v2);
  swift_getObjectType();
  uint64_t v6 = a2(a1);
  swift_deallocPartialClassInstance();
  return v6;
}

uint64_t XPCMobileDocumentReaderConfigurationResponse.init(coder:)(uint64_t a1)
{
  return sub_21489BFE0(a1, (uint64_t (*)(uint64_t))sub_21489E6B8);
}

uint64_t sub_21489BFE0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  swift_getObjectType();
  uint64_t v4 = a2(a1);
  swift_deallocPartialClassInstance();
  return v4;
}

uint64_t sub_21489C08C(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void *))
{
  swift_getObjectType();
  uint64_t v6 = a4(a3);
  swift_deallocPartialClassInstance();
  return v6;
}

void XPCMobileDocumentReaderConfigurationResponse.init()()
{
}

uint64_t sub_21489C228@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV44XPCMobileDocumentReaderConfigurationResponse_value, a1, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderConfigurationResponse);
}

id sub_21489C264(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21489C284(a1, a2, a3, &OBJC_IVAR____TtC7CoreIDV44XPCMobileDocumentReaderConfigurationResponse_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderConfigurationResponse);
}

id sub_21489C284(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(void))
{
  id v9 = objc_allocWithZone(v5);
  sub_21489F0B0(a1, (uint64_t)v9 + *a4, a5);
  v12.receiver = v9;
  v12.super_class = v5;
  id v10 = objc_msgSendSuper2(&v12, sel_init);
  sub_21489F118(a1, a5);
  return v10;
}

uint64_t static XPCMobileDocumentReaderMerchant.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderMerchant.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value + 8);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value + 16);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value + 40);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v5;
  long long v8 = *(_OWORD *)(v2 + 24);
  *(_OWORD *)(a1 + 24) = v8;
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  sub_2147FC780(v5, v8);
  return swift_bridgeObjectRetain();
}

id XPCMobileDocumentReaderMerchant.__allocating_init(value:)(uint64_t a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = &v3[OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value];
  *(void *)uint64_t v5 = *(void *)a1;
  *((void *)v5 + 1) = v4;
  long long v6 = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v5 + 1) = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v5 + 2) = v6;
  v8.receiver = v3;
  v8.super_class = v1;
  return objc_msgSendSuper2(&v8, sel_init);
}

id XPCMobileDocumentReaderMerchant.init(value:)(uint64_t a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = &v1[OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value];
  *(void *)uint64_t v5 = *(void *)a1;
  *((void *)v5 + 1) = v4;
  long long v6 = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v5 + 1) = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v5 + 2) = v6;
  v8.receiver = v1;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t XPCMobileDocumentReaderMerchant.__allocating_init(coder:)(uint64_t a1)
{
  return sub_21489C474(a1, (uint64_t (*)(uint64_t))sub_21489EA00);
}

uint64_t sub_21489C474(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  id v5 = objc_allocWithZone(v2);
  swift_getObjectType();
  uint64_t v6 = a2(a1);
  swift_deallocPartialClassInstance();
  return v6;
}

uint64_t XPCMobileDocumentReaderMerchant.init(coder:)(uint64_t a1)
{
  return sub_21489C504(a1, (uint64_t (*)(uint64_t))sub_21489EA00);
}

uint64_t sub_21489C504(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  swift_getObjectType();
  uint64_t v4 = a2(a1);
  swift_deallocPartialClassInstance();
  return v4;
}

uint64_t sub_21489C58C(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void *))
{
  swift_getObjectType();
  uint64_t v6 = a4(a3);
  swift_deallocPartialClassInstance();
  return v6;
}

void XPCMobileDocumentReaderMerchant.init()()
{
}

uint64_t sub_21489C728@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value);
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value + 8);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value + 16);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value + 40);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v5;
  long long v8 = *(_OWORD *)(v2 + 24);
  *(_OWORD *)(a1 + 24) = v8;
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRetain();
  sub_2147FC780(v5, v8);
  return swift_bridgeObjectRetain();
}

id sub_21489C7A4(uint64_t a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = &v3[OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value];
  *(void *)uint64_t v5 = *(void *)a1;
  *((void *)v5 + 1) = v4;
  long long v6 = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v5 + 1) = *(_OWORD *)(a1 + 16);
  *((_OWORD *)v5 + 2) = v6;
  v8.receiver = v3;
  v8.super_class = v1;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t static XPCMobileDocumentReaderRequest.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderRequest.value.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV30XPCMobileDocumentReaderRequest_value, a1, type metadata accessor for MobileDocumentReaderRequest);
}

id XPCMobileDocumentReaderRequest.init(value:)(uint64_t a1)
{
  return sub_21489BE8C(a1, &OBJC_IVAR____TtC7CoreIDV30XPCMobileDocumentReaderRequest_value, type metadata accessor for MobileDocumentReaderRequest);
}

uint64_t XPCMobileDocumentReaderRequest.__allocating_init(coder:)(uint64_t a1)
{
  return sub_21489BF2C(a1, (uint64_t (*)(uint64_t))sub_21489EBC0);
}

uint64_t XPCMobileDocumentReaderRequest.init(coder:)(uint64_t a1)
{
  return sub_21489BFE0(a1, (uint64_t (*)(uint64_t))sub_21489EBC0);
}

void XPCMobileDocumentReaderRequest.init()()
{
}

uint64_t sub_21489C9C0@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV30XPCMobileDocumentReaderRequest_value, a1, type metadata accessor for MobileDocumentReaderRequest);
}

id sub_21489C9FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21489C284(a1, a2, a3, &OBJC_IVAR____TtC7CoreIDV30XPCMobileDocumentReaderRequest_value, type metadata accessor for MobileDocumentReaderRequest);
}

uint64_t static XPCMobileDocumentReaderDeviceEngagementType.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderDeviceEngagementType.value.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value);
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value + 8);
  *a1 = v2;
  a1[1] = v3;
  return sub_2147FC780(v2, v3);
}

id XPCMobileDocumentReaderDeviceEngagementType.init(value:)(_OWORD *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)&v1[OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value] = *a1;
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t XPCMobileDocumentReaderDeviceEngagementType.__allocating_init(coder:)(uint64_t a1)
{
  return sub_21489C474(a1, (uint64_t (*)(uint64_t))sub_21489EF08);
}

uint64_t XPCMobileDocumentReaderDeviceEngagementType.init(coder:)(uint64_t a1)
{
  return sub_21489C504(a1, (uint64_t (*)(uint64_t))sub_21489EF08);
}

void XPCMobileDocumentReaderDeviceEngagementType.init()()
{
}

uint64_t sub_21489CBD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value);
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value + 8);
  *a1 = v2;
  a1[1] = v3;
  return sub_2147FC780(v2, v3);
}

id sub_21489CBE8(_OWORD *a1)
{
  unint64_t v3 = (char *)objc_allocWithZone(v1);
  *(_OWORD *)&v3[OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value] = *a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t static XPCMobileDocumentReaderResponse.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderResponse.value.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderResponse_value, a1, type metadata accessor for MobileDocumentReaderResponse);
}

id XPCMobileDocumentReaderResponse.__allocating_init(value:)(uint64_t a1)
{
  return sub_21489B7F8(a1, &OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderResponse_value, type metadata accessor for MobileDocumentReaderResponse);
}

id XPCMobileDocumentReaderResponse.init(value:)(uint64_t a1)
{
  return sub_21489BE8C(a1, &OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderResponse_value, type metadata accessor for MobileDocumentReaderResponse);
}

uint64_t XPCMobileDocumentReaderResponse.__allocating_init(coder:)(uint64_t a1)
{
  return sub_21489BF2C(a1, (uint64_t (*)(uint64_t))sub_21489F178);
}

uint64_t XPCMobileDocumentReaderResponse.init(coder:)(uint64_t a1)
{
  return sub_21489BFE0(a1, (uint64_t (*)(uint64_t))sub_21489F178);
}

void XPCMobileDocumentReaderResponse.init()()
{
}

uint64_t sub_21489CE18@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderResponse_value, a1, type metadata accessor for MobileDocumentReaderResponse);
}

id sub_21489CE54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21489C284(a1, a2, a3, &OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderResponse_value, type metadata accessor for MobileDocumentReaderResponse);
}

uint64_t static XPCAuditToken.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCAuditToken.value.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV13XPCAuditToken_value);
  return swift_bridgeObjectRetain();
}

id XPCAuditToken.init(value:)(void *a1)
{
  return sub_21489DBE8(a1, &OBJC_IVAR____TtC7CoreIDV13XPCAuditToken_value);
}

id XPCAuditToken.__allocating_init(coder:)(void *a1)
{
  return sub_21489CEE0(a1, (void (*)(uint64_t))sub_2148A049C, (uint64_t)&type metadata for AuditToken, (uint64_t (*)(uint64_t))type metadata accessor for XPCAuditToken, &OBJC_IVAR____TtC7CoreIDV13XPCAuditToken_value);
}

id sub_21489CEE0(void *a1, void (*a2)(uint64_t), uint64_t a3, uint64_t (*a4)(uint64_t), void *a5)
{
  id v11 = objc_allocWithZone(v5);
  swift_getObjectType();
  id v12 = sub_21489FB50(a1, a2, a3, a4, a5);
  swift_deallocPartialClassInstance();
  return v12;
}

id XPCAuditToken.init(coder:)(void *a1)
{
  return sub_21489CFAC(a1, (void (*)(uint64_t))sub_2148A049C, (uint64_t)&type metadata for AuditToken, (uint64_t (*)(uint64_t))type metadata accessor for XPCAuditToken, &OBJC_IVAR____TtC7CoreIDV13XPCAuditToken_value);
}

id sub_21489CFAC(void *a1, void (*a2)(uint64_t), uint64_t a3, uint64_t (*a4)(uint64_t), void *a5)
{
  swift_getObjectType();
  id v10 = sub_21489FB50(a1, a2, a3, a4, a5);
  swift_deallocPartialClassInstance();
  return v10;
}

id sub_21489D070(uint64_t a1, uint64_t a2, void *a3, void (*a4)(uint64_t), uint64_t a5, uint64_t (*a6)(uint64_t), void *a7)
{
  swift_getObjectType();
  id v12 = sub_21489FB50(a3, a4, a5, a6, a7);
  swift_deallocPartialClassInstance();
  return v12;
}

Swift::Void __swiftcall XPCAuditToken.encode(with:)(NSCoder with)
{
}

id XPCAuditToken.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void XPCAuditToken.init()()
{
}

uint64_t sub_21489D268@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV13XPCAuditToken_value);
  return swift_bridgeObjectRetain();
}

id sub_21489D27C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_21489DE54(a1, a2, a3, &OBJC_IVAR____TtC7CoreIDV13XPCAuditToken_value);
}

uint64_t static XPCMobileDocumentReaderIdentityKeyRequest.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderIdentityKeyRequest.value.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest_value, a1, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
}

id XPCMobileDocumentReaderIdentityKeyRequest.init(value:)(uint64_t a1)
{
  return sub_21489BE8C(a1, &OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
}

uint64_t XPCMobileDocumentReaderIdentityKeyRequest.__allocating_init(coder:)(uint64_t a1)
{
  return sub_21489BF2C(a1, (uint64_t (*)(uint64_t))sub_21489F4C0);
}

uint64_t XPCMobileDocumentReaderIdentityKeyRequest.init(coder:)(uint64_t a1)
{
  return sub_21489BFE0(a1, (uint64_t (*)(uint64_t))sub_21489F4C0);
}

void XPCMobileDocumentReaderIdentityKeyRequest.init()()
{
}

uint64_t sub_21489D444@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest_value, a1, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
}

id sub_21489D480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21489C284(a1, a2, a3, &OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
}

uint64_t static XPCMobileDocumentReaderCertificateRequest.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderCertificateRequest.value.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest_value, a1, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderCertificateRequest);
}

id XPCMobileDocumentReaderCertificateRequest.init(value:)(uint64_t a1)
{
  return sub_21489BE8C(a1, &OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderCertificateRequest);
}

uint64_t XPCMobileDocumentReaderCertificateRequest.__allocating_init(coder:)(uint64_t a1)
{
  return sub_21489BF2C(a1, (uint64_t (*)(uint64_t))sub_21489F808);
}

uint64_t XPCMobileDocumentReaderCertificateRequest.init(coder:)(uint64_t a1)
{
  return sub_21489BFE0(a1, (uint64_t (*)(uint64_t))sub_21489F808);
}

void XPCMobileDocumentReaderCertificateRequest.init()()
{
}

uint64_t sub_21489D65C@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest_value, a1, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderCertificateRequest);
}

id sub_21489D698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21489C284(a1, a2, a3, &OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderCertificateRequest);
}

uint64_t static XPCMobileDocumentReaderIdentityKeyResponse.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderIdentityKeyResponse.value.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse_value);
  return swift_bridgeObjectRetain();
}

id XPCMobileDocumentReaderIdentityKeyResponse.__allocating_init(value:)(void *a1)
{
  return sub_21489DB80(a1, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse_value);
}

id XPCMobileDocumentReaderIdentityKeyResponse.init(value:)(void *a1)
{
  return sub_21489DBE8(a1, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse_value);
}

id XPCMobileDocumentReaderIdentityKeyResponse.__allocating_init(coder:)(void *a1)
{
  return sub_21489CEE0(a1, (void (*)(uint64_t))sub_2148A066C, (uint64_t)&type metadata for MobileDocumentReaderIdentityKeyResponse, (uint64_t (*)(uint64_t))type metadata accessor for XPCMobileDocumentReaderIdentityKeyResponse, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse_value);
}

id XPCMobileDocumentReaderIdentityKeyResponse.init(coder:)(void *a1)
{
  return sub_21489CFAC(a1, (void (*)(uint64_t))sub_2148A066C, (uint64_t)&type metadata for MobileDocumentReaderIdentityKeyResponse, (uint64_t (*)(uint64_t))type metadata accessor for XPCMobileDocumentReaderIdentityKeyResponse, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse_value);
}

Swift::Void __swiftcall XPCMobileDocumentReaderIdentityKeyResponse.encode(with:)(NSCoder with)
{
}

void XPCMobileDocumentReaderIdentityKeyResponse.init()()
{
}

uint64_t sub_21489D8E4@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse_value);
  return swift_bridgeObjectRetain();
}

id sub_21489D8F8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_21489DE54(a1, a2, a3, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse_value);
}

uint64_t static XPCMobileDocumentReaderCertificateResponse.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderCertificateResponse.value.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse_value);
  return swift_bridgeObjectRetain();
}

id XPCMobileDocumentReaderCertificateResponse.__allocating_init(value:)(void *a1)
{
  return sub_21489DB80(a1, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse_value);
}

id XPCMobileDocumentReaderCertificateResponse.init(value:)(void *a1)
{
  return sub_21489DBE8(a1, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse_value);
}

id XPCMobileDocumentReaderCertificateResponse.__allocating_init(coder:)(void *a1)
{
  return sub_21489CEE0(a1, (void (*)(uint64_t))sub_2148A071C, (uint64_t)&type metadata for MobileDocumentReaderCertificateResponse, (uint64_t (*)(uint64_t))type metadata accessor for XPCMobileDocumentReaderCertificateResponse, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse_value);
}

id XPCMobileDocumentReaderCertificateResponse.init(coder:)(void *a1)
{
  return sub_21489CFAC(a1, (void (*)(uint64_t))sub_2148A071C, (uint64_t)&type metadata for MobileDocumentReaderCertificateResponse, (uint64_t (*)(uint64_t))type metadata accessor for XPCMobileDocumentReaderCertificateResponse, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse_value);
}

Swift::Void __swiftcall XPCMobileDocumentReaderCertificateResponse.encode(with:)(NSCoder with)
{
}

void XPCMobileDocumentReaderCertificateResponse.init()()
{
}

uint64_t sub_21489DB30@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse_value);
  return swift_bridgeObjectRetain();
}

id sub_21489DB44(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_21489DE54(a1, a2, a3, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse_value);
}

uint64_t static XPCMobileDocumentReaderIssuerRootCertificateList.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCMobileDocumentReaderIssuerRootCertificateList.value.getter@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList_value);
  return swift_bridgeObjectRetain();
}

id XPCMobileDocumentReaderIssuerRootCertificateList.__allocating_init(value:)(void *a1)
{
  return sub_21489DB80(a1, &OBJC_IVAR____TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList_value);
}

id sub_21489DB80(void *a1, void *a2)
{
  objc_super v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[*a2] = *a1;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id XPCMobileDocumentReaderIssuerRootCertificateList.init(value:)(void *a1)
{
  return sub_21489DBE8(a1, &OBJC_IVAR____TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList_value);
}

id sub_21489DBE8(void *a1, void *a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v2[*a2] = *a1;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id XPCMobileDocumentReaderIssuerRootCertificateList.__allocating_init(coder:)(void *a1)
{
  return sub_21489CEE0(a1, (void (*)(uint64_t))sub_2148A07CC, (uint64_t)&type metadata for MobileDocumentReaderIssuerRootCertificateList, (uint64_t (*)(uint64_t))type metadata accessor for XPCMobileDocumentReaderIssuerRootCertificateList, &OBJC_IVAR____TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList_value);
}

id XPCMobileDocumentReaderIssuerRootCertificateList.init(coder:)(void *a1)
{
  return sub_21489CFAC(a1, (void (*)(uint64_t))sub_2148A07CC, (uint64_t)&type metadata for MobileDocumentReaderIssuerRootCertificateList, (uint64_t (*)(uint64_t))type metadata accessor for XPCMobileDocumentReaderIssuerRootCertificateList, &OBJC_IVAR____TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList_value);
}

Swift::Void __swiftcall XPCMobileDocumentReaderIssuerRootCertificateList.encode(with:)(NSCoder with)
{
}

void XPCMobileDocumentReaderIssuerRootCertificateList.init()()
{
}

uint64_t sub_21489DE34@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + OBJC_IVAR____TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList_value);
  return swift_bridgeObjectRetain();
}

id sub_21489DE48(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_21489DE54(a1, a2, a3, &OBJC_IVAR____TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList_value);
}

id sub_21489DE54(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_super v7 = (char *)objc_allocWithZone(v4);
  *(void *)&v7[*a4] = *a1;
  v9.receiver = v7;
  v9.super_class = v4;
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t static XPCIdentityDocumentDescriptor.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t XPCIdentityDocumentDescriptor.value.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV29XPCIdentityDocumentDescriptor_value, a1, type metadata accessor for IdentityDocumentDescriptor);
}

id XPCIdentityDocumentDescriptor.init(value:)(uint64_t a1)
{
  return sub_21489BE8C(a1, &OBJC_IVAR____TtC7CoreIDV29XPCIdentityDocumentDescriptor_value, type metadata accessor for IdentityDocumentDescriptor);
}

uint64_t XPCIdentityDocumentDescriptor.__allocating_init(coder:)(uint64_t a1)
{
  return sub_21489BF2C(a1, (uint64_t (*)(uint64_t))sub_21489FD00);
}

uint64_t XPCIdentityDocumentDescriptor.init(coder:)(uint64_t a1)
{
  return sub_21489BFE0(a1, (uint64_t (*)(uint64_t))sub_21489FD00);
}

void XPCIdentityDocumentDescriptor.init()()
{
}

id _s7CoreIDV35XPCMobileDocumentReaderSessionStateCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21489E0A4@<X0>(uint64_t a1@<X8>)
{
  return sub_21489F0B0(v1 + OBJC_IVAR____TtC7CoreIDV29XPCIdentityDocumentDescriptor_value, a1, type metadata accessor for IdentityDocumentDescriptor);
}

id sub_21489E0E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21489C284(a1, a2, a3, &OBJC_IVAR____TtC7CoreIDV29XPCIdentityDocumentDescriptor_value, type metadata accessor for IdentityDocumentDescriptor);
}

id sub_21489E100()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_2148A1978();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initForReadingFromData_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_2148A18F8();

    swift_willThrow();
  }
  return v2;
}

id sub_21489E1C0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26782FC40);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MobileDocumentReaderSession.State();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  objc_super v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v23 - v10;
  sub_214857D54();
  uint64_t v12 = sub_2148A1E68();
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = sub_2148A1988();
    unint64_t v16 = v15;

    id v17 = objc_allocWithZone(MEMORY[0x263F08928]);
    sub_2147F3CA8(v14, v16);
    id v18 = sub_21489E100();
    sub_2147F4030(v14, v16);
    if (v18)
    {
      sub_2148A0908(&qword_26782FAA8, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderSession.State);
      sub_2148A1E58();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        sub_2148A0F08((uint64_t)v4, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderSession.State);
        sub_21489F0B0((uint64_t)v11, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderSession.State);
        unint64_t v21 = (objc_class *)type metadata accessor for XPCMobileDocumentReaderSessionState(0);
        id v22 = objc_allocWithZone(v21);
        sub_21489F0B0((uint64_t)v9, (uint64_t)v22 + OBJC_IVAR____TtC7CoreIDV35XPCMobileDocumentReaderSessionState_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderSession.State);
        v24.receiver = v22;
        v24.super_class = v21;
        id v19 = objc_msgSendSuper2(&v24, sel_init);
        sub_21489F118((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderSession.State);
        sub_21489F118((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderSession.State);
        objc_msgSend(v18, sel_finishDecoding);

        sub_2147F4030(v14, v16);
        return v19;
      }
      sub_2147FC5F8((uint64_t)v4, (uint64_t *)&unk_26782FC40);
      objc_msgSend(v18, sel_finishDecoding);
    }
    sub_2147F4030(v14, v16);
  }
  else
  {
  }
  return 0;
}

id sub_21489E508(void *a1)
{
  sub_214857D54();
  uint64_t v2 = sub_2148A1E68();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = sub_2148A1988();
    unint64_t v6 = v5;

    id v7 = objc_allocWithZone(MEMORY[0x263F08928]);
    sub_2147F3CA8(v4, v6);
    id v8 = sub_21489E100();
    sub_2147F4030(v4, v6);
    if (v8)
    {
      sub_2148A00DC();
      sub_2148A1E58();
      uint64_t v9 = v18;
      if (v18 != 1)
      {
        char v12 = v19 & 1;
        uint64_t v13 = (objc_class *)type metadata accessor for XPCMobileDocumentReaderConfiguration();
        uint64_t v14 = (char *)objc_allocWithZone(v13);
        unint64_t v15 = &v14[OBJC_IVAR____TtC7CoreIDV36XPCMobileDocumentReaderConfiguration_value];
        *(void *)unint64_t v15 = v17;
        *((void *)v15 + 1) = v9;
        v15[16] = v12;
        v16.receiver = v14;
        v16.super_class = v13;
        id v10 = objc_msgSendSuper2(&v16, sel_init);
        objc_msgSend(v8, sel_finishDecoding);

        sub_2147F4030(v4, v6);
        return v10;
      }
      objc_msgSend(v8, sel_finishDecoding);
    }
    sub_2147F4030(v4, v6);
  }
  else
  {
  }
  return 0;
}

id sub_21489E6B8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782FC38);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MobileDocumentReaderConfigurationResponse();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v23 - v10;
  sub_214857D54();
  uint64_t v12 = sub_2148A1E68();
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = sub_2148A1988();
    unint64_t v16 = v15;

    id v17 = objc_allocWithZone(MEMORY[0x263F08928]);
    sub_2147F3CA8(v14, v16);
    id v18 = sub_21489E100();
    sub_2147F4030(v14, v16);
    if (v18)
    {
      sub_2148A0908(&qword_26782FAC8, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderConfigurationResponse);
      sub_2148A1E58();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        sub_2148A0F08((uint64_t)v4, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderConfigurationResponse);
        sub_21489F0B0((uint64_t)v11, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderConfigurationResponse);
        unint64_t v21 = (objc_class *)type metadata accessor for XPCMobileDocumentReaderConfigurationResponse(0);
        id v22 = objc_allocWithZone(v21);
        sub_21489F0B0((uint64_t)v9, (uint64_t)v22 + OBJC_IVAR____TtC7CoreIDV44XPCMobileDocumentReaderConfigurationResponse_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderConfigurationResponse);
        v24.receiver = v22;
        v24.super_class = v21;
        id v19 = objc_msgSendSuper2(&v24, sel_init);
        sub_21489F118((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderConfigurationResponse);
        sub_21489F118((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderConfigurationResponse);
        objc_msgSend(v18, sel_finishDecoding);

        sub_2147F4030(v14, v16);
        return v19;
      }
      sub_2147FC5F8((uint64_t)v4, &qword_26782FC38);
      objc_msgSend(v18, sel_finishDecoding);
    }
    sub_2147F4030(v14, v16);
  }
  else
  {
  }
  return 0;
}

id sub_21489EA00(void *a1)
{
  sub_214857D54();
  uint64_t v2 = sub_2148A1E68();
  if (!v2)
  {

    return 0;
  }
  uint64_t v3 = (void *)v2;
  uint64_t v4 = sub_2148A1988();
  unint64_t v6 = v5;

  id v7 = objc_allocWithZone(MEMORY[0x263F08928]);
  sub_2147F3CA8(v4, v6);
  id v8 = sub_21489E100();
  sub_2147F4030(v4, v6);
  if (!v8)
  {
LABEL_8:

    sub_2147F4030(v4, v6);
    return 0;
  }
  sub_2148A021C();
  sub_2148A1E58();
  uint64_t v9 = v20;
  if (!v20)
  {
    objc_msgSend(v8, sel_finishDecoding);

    goto LABEL_8;
  }
  uint64_t v11 = v22;
  uint64_t v10 = v23;
  long long v17 = v21;
  uint64_t v12 = (objc_class *)type metadata accessor for XPCMobileDocumentReaderMerchant();
  uint64_t v13 = (char *)objc_allocWithZone(v12);
  uint64_t v14 = &v13[OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value];
  *(void *)uint64_t v14 = v19;
  *((void *)v14 + 1) = v9;
  *((_OWORD *)v14 + 1) = v17;
  *((void *)v14 + 4) = v11;
  *((void *)v14 + 5) = v10;
  v18.receiver = v13;
  v18.super_class = v12;
  id v15 = objc_msgSendSuper2(&v18, sel_init);
  objc_msgSend(v8, sel_finishDecoding);

  sub_2147F4030(v4, v6);
  return v15;
}

id sub_21489EBC0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782FC30);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MobileDocumentReaderRequest(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - v10;
  sub_214857D54();
  uint64_t v12 = sub_2148A1E68();
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = sub_2148A1988();
    unint64_t v16 = v15;

    id v17 = objc_allocWithZone(MEMORY[0x263F08928]);
    sub_2147F3CA8(v14, v16);
    id v18 = sub_21489E100();
    sub_2147F4030(v14, v16);
    if (v18)
    {
      sub_2148A0908(&qword_26782FAE8, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderRequest);
      sub_2148A1E58();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        sub_2148A0F08((uint64_t)v4, (uint64_t)v11, type metadata accessor for MobileDocumentReaderRequest);
        sub_21489F0B0((uint64_t)v11, (uint64_t)v9, type metadata accessor for MobileDocumentReaderRequest);
        long long v21 = (objc_class *)type metadata accessor for XPCMobileDocumentReaderRequest(0);
        id v22 = objc_allocWithZone(v21);
        sub_21489F0B0((uint64_t)v9, (uint64_t)v22 + OBJC_IVAR____TtC7CoreIDV30XPCMobileDocumentReaderRequest_value, type metadata accessor for MobileDocumentReaderRequest);
        v24.receiver = v22;
        v24.super_class = v21;
        id v19 = objc_msgSendSuper2(&v24, sel_init);
        sub_21489F118((uint64_t)v9, type metadata accessor for MobileDocumentReaderRequest);
        sub_21489F118((uint64_t)v11, type metadata accessor for MobileDocumentReaderRequest);
        objc_msgSend(v18, sel_finishDecoding);

        sub_2147F4030(v14, v16);
        return v19;
      }
      sub_2147FC5F8((uint64_t)v4, &qword_26782FC30);
      objc_msgSend(v18, sel_finishDecoding);
    }
    sub_2147F4030(v14, v16);
  }
  else
  {
  }
  return 0;
}

id sub_21489EF08(void *a1)
{
  sub_214857D54();
  uint64_t v2 = sub_2148A1E68();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = sub_2148A1988();
    unint64_t v6 = v5;

    id v7 = objc_allocWithZone(MEMORY[0x263F08928]);
    sub_2147F3CA8(v4, v6);
    id v8 = sub_21489E100();
    sub_2147F4030(v4, v6);
    if (v8)
    {
      sub_2148A035C();
      sub_2148A1E58();
      unint64_t v9 = v17;
      if (v17 >> 60 != 11)
      {
        uint64_t v12 = (objc_class *)type metadata accessor for XPCMobileDocumentReaderDeviceEngagementType();
        uint64_t v13 = (char *)objc_allocWithZone(v12);
        uint64_t v14 = &v13[OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value];
        *(void *)uint64_t v14 = v16;
        *((void *)v14 + 1) = v9;
        v15.receiver = v13;
        v15.super_class = v12;
        id v10 = objc_msgSendSuper2(&v15, sel_init);
        objc_msgSend(v8, sel_finishDecoding);

        sub_2147F4030(v4, v6);
        return v10;
      }
      objc_msgSend(v8, sel_finishDecoding);
    }
    sub_2147F4030(v4, v6);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_21489F0B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21489F118(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_21489F178(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782FC28);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MobileDocumentReaderResponse(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - v10;
  sub_214857D54();
  uint64_t v12 = sub_2148A1E68();
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = sub_2148A1988();
    unint64_t v16 = v15;

    id v17 = objc_allocWithZone(MEMORY[0x263F08928]);
    sub_2147F3CA8(v14, v16);
    id v18 = sub_21489E100();
    sub_2147F4030(v14, v16);
    if (v18)
    {
      sub_2148A0908(&qword_26782CC68, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderResponse);
      sub_2148A1E58();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        sub_2148A0F08((uint64_t)v4, (uint64_t)v11, type metadata accessor for MobileDocumentReaderResponse);
        sub_21489F0B0((uint64_t)v11, (uint64_t)v9, type metadata accessor for MobileDocumentReaderResponse);
        long long v21 = (objc_class *)type metadata accessor for XPCMobileDocumentReaderResponse(0);
        id v22 = objc_allocWithZone(v21);
        sub_21489F0B0((uint64_t)v9, (uint64_t)v22 + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderResponse_value, type metadata accessor for MobileDocumentReaderResponse);
        v24.receiver = v22;
        v24.super_class = v21;
        id v19 = objc_msgSendSuper2(&v24, sel_init);
        sub_21489F118((uint64_t)v9, type metadata accessor for MobileDocumentReaderResponse);
        sub_21489F118((uint64_t)v11, type metadata accessor for MobileDocumentReaderResponse);
        objc_msgSend(v18, sel_finishDecoding);

        sub_2147F4030(v14, v16);
        return v19;
      }
      sub_2147FC5F8((uint64_t)v4, &qword_26782FC28);
      objc_msgSend(v18, sel_finishDecoding);
    }
    sub_2147F4030(v14, v16);
  }
  else
  {
  }
  return 0;
}

id sub_21489F4C0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782FC20);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MobileDocumentReaderIdentityKeyRequest();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - v10;
  sub_214857D54();
  uint64_t v12 = sub_2148A1E68();
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = sub_2148A1988();
    unint64_t v16 = v15;

    id v17 = objc_allocWithZone(MEMORY[0x263F08928]);
    sub_2147F3CA8(v14, v16);
    id v18 = sub_21489E100();
    sub_2147F4030(v14, v16);
    if (v18)
    {
      sub_2148A0908(&qword_26782FB28, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
      sub_2148A1E58();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        sub_2148A0F08((uint64_t)v4, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
        sub_21489F0B0((uint64_t)v11, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
        long long v21 = (objc_class *)type metadata accessor for XPCMobileDocumentReaderIdentityKeyRequest(0);
        id v22 = objc_allocWithZone(v21);
        sub_21489F0B0((uint64_t)v9, (uint64_t)v22 + OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
        v24.receiver = v22;
        v24.super_class = v21;
        id v19 = objc_msgSendSuper2(&v24, sel_init);
        sub_21489F118((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
        sub_21489F118((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
        objc_msgSend(v18, sel_finishDecoding);

        sub_2147F4030(v14, v16);
        return v19;
      }
      sub_2147FC5F8((uint64_t)v4, &qword_26782FC20);
      objc_msgSend(v18, sel_finishDecoding);
    }
    sub_2147F4030(v14, v16);
  }
  else
  {
  }
  return 0;
}

id sub_21489F808(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782FC18);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MobileDocumentReaderCertificateRequest();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - v10;
  sub_214857D54();
  uint64_t v12 = sub_2148A1E68();
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = sub_2148A1988();
    unint64_t v16 = v15;

    id v17 = objc_allocWithZone(MEMORY[0x263F08928]);
    sub_2147F3CA8(v14, v16);
    id v18 = sub_21489E100();
    sub_2147F4030(v14, v16);
    if (v18)
    {
      sub_2148A0908(&qword_26782FB38, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderCertificateRequest);
      sub_2148A1E58();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        sub_2148A0F08((uint64_t)v4, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderCertificateRequest);
        sub_21489F0B0((uint64_t)v11, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderCertificateRequest);
        long long v21 = (objc_class *)type metadata accessor for XPCMobileDocumentReaderCertificateRequest(0);
        id v22 = objc_allocWithZone(v21);
        sub_21489F0B0((uint64_t)v9, (uint64_t)v22 + OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest_value, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderCertificateRequest);
        v24.receiver = v22;
        v24.super_class = v21;
        id v19 = objc_msgSendSuper2(&v24, sel_init);
        sub_21489F118((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderCertificateRequest);
        sub_21489F118((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for MobileDocumentReaderCertificateRequest);
        objc_msgSend(v18, sel_finishDecoding);

        sub_2147F4030(v14, v16);
        return v19;
      }
      sub_2147FC5F8((uint64_t)v4, &qword_26782FC18);
      objc_msgSend(v18, sel_finishDecoding);
    }
    sub_2147F4030(v14, v16);
  }
  else
  {
  }
  return 0;
}

id sub_21489FB50(void *a1, void (*a2)(uint64_t), uint64_t a3, uint64_t (*a4)(uint64_t), void *a5)
{
  sub_214857D54();
  uint64_t v9 = sub_2148A1E68();
  if (!v9)
  {

    return 0;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = sub_2148A1988();
  unint64_t v13 = v12;

  id v14 = objc_allocWithZone(MEMORY[0x263F08928]);
  sub_2147F3CA8(v11, v13);
  id v15 = sub_21489E100();
  uint64_t v16 = sub_2147F4030(v11, v13);
  if (!v15)
  {
LABEL_8:

    sub_2147F4030(v11, v13);
    return 0;
  }
  a2(v16);
  uint64_t v17 = sub_2148A1E58();
  if (!v23)
  {
    objc_msgSend(v15, sel_finishDecoding);

    goto LABEL_8;
  }
  id v18 = (objc_class *)a4(v17);
  id v19 = (char *)objc_allocWithZone(v18);
  *(void *)&v19[*a5] = v23;
  v22.receiver = v19;
  v22.super_class = v18;
  id v20 = objc_msgSendSuper2(&v22, sel_init);
  objc_msgSend(v15, sel_finishDecoding);

  sub_2147F4030(v11, v13);
  return v20;
}

id sub_21489FD00(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26782D440);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for IdentityDocumentDescriptor(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - v10;
  sub_214857D54();
  uint64_t v12 = sub_2148A1E68();
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    uint64_t v14 = sub_2148A1988();
    unint64_t v16 = v15;

    id v17 = objc_allocWithZone(MEMORY[0x263F08928]);
    sub_2147F3CA8(v14, v16);
    id v18 = sub_21489E100();
    sub_2147F4030(v14, v16);
    if (v18)
    {
      sub_2148A0908(&qword_26782FB78, (void (*)(uint64_t))type metadata accessor for IdentityDocumentDescriptor);
      sub_2148A1E58();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
      {
        sub_2148A0F08((uint64_t)v4, (uint64_t)v11, type metadata accessor for IdentityDocumentDescriptor);
        sub_21489F0B0((uint64_t)v11, (uint64_t)v9, type metadata accessor for IdentityDocumentDescriptor);
        long long v21 = (objc_class *)type metadata accessor for XPCIdentityDocumentDescriptor(0);
        id v22 = objc_allocWithZone(v21);
        sub_21489F0B0((uint64_t)v9, (uint64_t)v22 + OBJC_IVAR____TtC7CoreIDV29XPCIdentityDocumentDescriptor_value, type metadata accessor for IdentityDocumentDescriptor);
        v24.receiver = v22;
        v24.super_class = v21;
        id v19 = objc_msgSendSuper2(&v24, sel_init);
        sub_21489F118((uint64_t)v9, type metadata accessor for IdentityDocumentDescriptor);
        sub_21489F118((uint64_t)v11, type metadata accessor for IdentityDocumentDescriptor);
        objc_msgSend(v18, sel_finishDecoding);

        sub_2147F4030(v14, v16);
        return v19;
      }
      sub_2147FC5F8((uint64_t)v4, &qword_26782D440);
      objc_msgSend(v18, sel_finishDecoding);
    }
    sub_2147F4030(v14, v16);
  }
  else
  {
  }
  return 0;
}

uint64_t sub_2148A0048()
{
  return sub_2148A0908(&qword_26782FAA8, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderSession.State);
}

uint64_t sub_2148A0090()
{
  return sub_2148A0908(&qword_26782FAB0, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderSession.State);
}

unint64_t sub_2148A00DC()
{
  unint64_t result = qword_26782FAB8;
  if (!qword_26782FAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FAB8);
  }
  return result;
}

unint64_t sub_2148A0134()
{
  unint64_t result = qword_26782FAC0;
  if (!qword_26782FAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FAC0);
  }
  return result;
}

uint64_t sub_2148A0188()
{
  return sub_2148A0908(&qword_26782FAC8, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderConfigurationResponse);
}

uint64_t sub_2148A01D0()
{
  return sub_2148A0908(&qword_26782FAD0, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderConfigurationResponse);
}

unint64_t sub_2148A021C()
{
  unint64_t result = qword_26782FAD8;
  if (!qword_26782FAD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FAD8);
  }
  return result;
}

unint64_t sub_2148A0274()
{
  unint64_t result = qword_26782FAE0;
  if (!qword_26782FAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FAE0);
  }
  return result;
}

uint64_t sub_2148A02C8()
{
  return sub_2148A0908(&qword_26782FAE8, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderRequest);
}

uint64_t sub_2148A0310()
{
  return sub_2148A0908(&qword_26782FAF0, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderRequest);
}

unint64_t sub_2148A035C()
{
  unint64_t result = qword_26782FAF8;
  if (!qword_26782FAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FAF8);
  }
  return result;
}

unint64_t sub_2148A03B4()
{
  unint64_t result = qword_26782FB00;
  if (!qword_26782FB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FB00);
  }
  return result;
}

uint64_t sub_2148A0408()
{
  return sub_2148A0908(&qword_26782CC68, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderResponse);
}

uint64_t sub_2148A0450()
{
  return sub_2148A0908(&qword_26782FB10, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderResponse);
}

unint64_t sub_2148A049C()
{
  unint64_t result = qword_26782FB18;
  if (!qword_26782FB18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FB18);
  }
  return result;
}

unint64_t sub_2148A04F4()
{
  unint64_t result = qword_26782FB20;
  if (!qword_26782FB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FB20);
  }
  return result;
}

uint64_t sub_2148A0548()
{
  return sub_2148A0908(&qword_26782FB28, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
}

uint64_t sub_2148A0590()
{
  return sub_2148A0908(&qword_26782FB30, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
}

uint64_t sub_2148A05D8()
{
  return sub_2148A0908(&qword_26782FB38, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderCertificateRequest);
}

uint64_t sub_2148A0620()
{
  return sub_2148A0908(&qword_26782FB40, (void (*)(uint64_t))type metadata accessor for MobileDocumentReaderCertificateRequest);
}

unint64_t sub_2148A066C()
{
  unint64_t result = qword_26782FB48;
  if (!qword_26782FB48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FB48);
  }
  return result;
}

unint64_t sub_2148A06C4()
{
  unint64_t result = qword_26782FB50;
  if (!qword_26782FB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FB50);
  }
  return result;
}

unint64_t sub_2148A071C()
{
  unint64_t result = qword_26782FB58;
  if (!qword_26782FB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FB58);
  }
  return result;
}

unint64_t sub_2148A0774()
{
  unint64_t result = qword_26782FB60;
  if (!qword_26782FB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FB60);
  }
  return result;
}

unint64_t sub_2148A07CC()
{
  unint64_t result = qword_26782FB68;
  if (!qword_26782FB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FB68);
  }
  return result;
}

unint64_t sub_2148A0824()
{
  unint64_t result = qword_26782FB70;
  if (!qword_26782FB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26782FB70);
  }
  return result;
}

uint64_t sub_2148A0878()
{
  return sub_2148A0908(&qword_26782FB78, (void (*)(uint64_t))type metadata accessor for IdentityDocumentDescriptor);
}

uint64_t sub_2148A08C0()
{
  return sub_2148A0908((unint64_t *)&unk_26782FB80, (void (*)(uint64_t))type metadata accessor for IdentityDocumentDescriptor);
}

uint64_t sub_2148A0908(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2148A0950()
{
  return type metadata accessor for XPCMobileDocumentReaderSessionState(0);
}

uint64_t type metadata accessor for XPCMobileDocumentReaderSessionState(uint64_t a1)
{
  return sub_21483DAEC(a1, (uint64_t *)&unk_26782FB90);
}

uint64_t sub_2148A0978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2148A0E48(a1, a2, a3, (uint64_t (*)(uint64_t))type metadata accessor for MobileDocumentReaderSession.State);
}

uint64_t method lookup function for XPCMobileDocumentReaderSessionState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderSessionState);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderSessionState.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for XPCMobileDocumentReaderConfiguration()
{
  return self;
}

uint64_t method lookup function for XPCMobileDocumentReaderConfiguration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderConfiguration);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderConfiguration.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2148A0A0C()
{
  return type metadata accessor for XPCMobileDocumentReaderConfigurationResponse(0);
}

uint64_t type metadata accessor for XPCMobileDocumentReaderConfigurationResponse(uint64_t a1)
{
  return sub_21483DAEC(a1, (uint64_t *)&unk_26782FBA0);
}

uint64_t sub_2148A0A34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2148A0E48(a1, a2, a3, (uint64_t (*)(uint64_t))type metadata accessor for MobileDocumentReaderConfigurationResponse);
}

uint64_t method lookup function for XPCMobileDocumentReaderConfigurationResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderConfigurationResponse);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderConfigurationResponse.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for XPCMobileDocumentReaderMerchant()
{
  return self;
}

uint64_t method lookup function for XPCMobileDocumentReaderMerchant(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderMerchant);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderMerchant.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2148A0AC8()
{
  return type metadata accessor for XPCMobileDocumentReaderRequest(0);
}

uint64_t type metadata accessor for XPCMobileDocumentReaderRequest(uint64_t a1)
{
  return sub_21483DAEC(a1, (uint64_t *)&unk_26782FBB0);
}

uint64_t sub_2148A0AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2148A0E48(a1, a2, a3, type metadata accessor for MobileDocumentReaderRequest);
}

uint64_t method lookup function for XPCMobileDocumentReaderRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderRequest);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderRequest.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for XPCMobileDocumentReaderDeviceEngagementType()
{
  return self;
}

uint64_t method lookup function for XPCMobileDocumentReaderDeviceEngagementType(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderDeviceEngagementType);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderDeviceEngagementType.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2148A0B84()
{
  return type metadata accessor for XPCMobileDocumentReaderResponse(0);
}

uint64_t type metadata accessor for XPCMobileDocumentReaderResponse(uint64_t a1)
{
  return sub_21483DAEC(a1, (uint64_t *)&unk_26782FBC0);
}

uint64_t sub_2148A0BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2148A0E48(a1, a2, a3, type metadata accessor for MobileDocumentReaderResponse);
}

uint64_t method lookup function for XPCMobileDocumentReaderResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderResponse);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderResponse.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for XPCAuditToken()
{
  return self;
}

uint64_t method lookup function for XPCAuditToken(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCAuditToken);
}

uint64_t dispatch thunk of XPCAuditToken.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2148A0C40()
{
  return type metadata accessor for XPCMobileDocumentReaderIdentityKeyRequest(0);
}

uint64_t type metadata accessor for XPCMobileDocumentReaderIdentityKeyRequest(uint64_t a1)
{
  return sub_21483DAEC(a1, qword_26782FBD0);
}

uint64_t sub_2148A0C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2148A0E48(a1, a2, a3, (uint64_t (*)(uint64_t))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
}

uint64_t method lookup function for XPCMobileDocumentReaderIdentityKeyRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderIdentityKeyRequest);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderIdentityKeyRequest.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2148A0CAC()
{
  return type metadata accessor for XPCMobileDocumentReaderCertificateRequest(0);
}

uint64_t type metadata accessor for XPCMobileDocumentReaderCertificateRequest(uint64_t a1)
{
  return sub_21483DAEC(a1, (uint64_t *)&unk_26782FBE8);
}

uint64_t sub_2148A0CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2148A0E48(a1, a2, a3, (uint64_t (*)(uint64_t))type metadata accessor for MobileDocumentReaderCertificateRequest);
}

uint64_t method lookup function for XPCMobileDocumentReaderCertificateRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderCertificateRequest);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderCertificateRequest.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for XPCMobileDocumentReaderIdentityKeyResponse()
{
  return self;
}

uint64_t method lookup function for XPCMobileDocumentReaderIdentityKeyResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderIdentityKeyResponse);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderIdentityKeyResponse.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for XPCMobileDocumentReaderCertificateResponse()
{
  return self;
}

uint64_t method lookup function for XPCMobileDocumentReaderCertificateResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderCertificateResponse);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderCertificateResponse.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for XPCMobileDocumentReaderIssuerRootCertificateList()
{
  return self;
}

uint64_t method lookup function for XPCMobileDocumentReaderIssuerRootCertificateList(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCMobileDocumentReaderIssuerRootCertificateList);
}

uint64_t dispatch thunk of XPCMobileDocumentReaderIssuerRootCertificateList.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2148A0E08()
{
  return type metadata accessor for XPCIdentityDocumentDescriptor(0);
}

uint64_t type metadata accessor for XPCIdentityDocumentDescriptor(uint64_t a1)
{
  return sub_21483DAEC(a1, qword_26782FBF8);
}

uint64_t sub_2148A0E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2148A0E48(a1, a2, a3, type metadata accessor for IdentityDocumentDescriptor);
}

uint64_t sub_2148A0E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for XPCIdentityDocumentDescriptor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCIdentityDocumentDescriptor);
}

uint64_t dispatch thunk of XPCIdentityDocumentDescriptor.__allocating_init(value:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2148A0F08(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2148A1708()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_2148A1718()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2148A1728()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2148A1738()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_2148A1748()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_2148A1758()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_2148A1768()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_2148A1778()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2148A1788()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2148A1798()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2148A17A8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2148A17B8()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2148A17C8()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2148A17D8()
{
  return MEMORY[0x270EEEEA8]();
}

uint64_t sub_2148A17E8()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_2148A17F8()
{
  return MEMORY[0x270EEF0C8]();
}

uint64_t sub_2148A1808()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_2148A1818()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_2148A1828()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_2148A1838()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_2148A1848()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_2148A1858()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_2148A1868()
{
  return MEMORY[0x270EEF408]();
}

uint64_t sub_2148A1878()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_2148A18E8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2148A18F8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2148A1908()
{
  return MEMORY[0x270EEFB08]();
}

uint64_t sub_2148A1918()
{
  return MEMORY[0x270EEFB28]();
}

uint64_t sub_2148A1928()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2148A1938()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2148A1948()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2148A1958()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2148A1968()
{
  return MEMORY[0x270EF0108]();
}

uint64_t sub_2148A1978()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2148A1988()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2148A1998()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_2148A19B8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2148A19C8()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2148A19D8()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2148A19E8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2148A19F8()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_2148A1A08()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_2148A1A18()
{
  return MEMORY[0x270EF0F58]();
}

uint64_t sub_2148A1A28()
{
  return MEMORY[0x270EF0F60]();
}

uint64_t sub_2148A1A38()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_2148A1A48()
{
  return MEMORY[0x270EF0F78]();
}

uint64_t sub_2148A1A58()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_2148A1A68()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2148A1A78()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2148A1A88()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_2148A1A98()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_2148A1AA8()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_2148A1AB8()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_2148A1AC8()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_2148A1AD8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2148A1AE8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2148A1AF8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2148A1B08()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_2148A1B18()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2148A1B28()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2148A1B38()
{
  return MEMORY[0x270FA2B38]();
}

uint64_t sub_2148A1B48()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2148A1B58()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_2148A1B68()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_2148A1B78()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2148A1B88()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_2148A1B98()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2148A1BA8()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_2148A1BB8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2148A1BC8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2148A1BD8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2148A1BE8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2148A1BF8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2148A1C08()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2148A1C18()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2148A1C28()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_2148A1C38()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2148A1C48()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2148A1C58()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2148A1C68()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2148A1C78()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2148A1C88()
{
  return MEMORY[0x270EF1B58]();
}

uint64_t sub_2148A1C98()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2148A1CA8()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2148A1CB8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2148A1CC8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2148A1CD8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2148A1CE8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2148A1CF8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2148A1D08()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2148A1D18()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2148A1D28()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2148A1D38()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2148A1D48()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2148A1D58()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_2148A1D68()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2148A1D78()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2148A1D98()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2148A1DA8()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_2148A1DB8()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_2148A1DC8()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_2148A1DD8()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_2148A1DE8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2148A1DF8()
{
  return MEMORY[0x270EF1CB8]();
}

uint64_t sub_2148A1E08()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2148A1E18()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2148A1E28()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2148A1E38()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2148A1E48()
{
  return MEMORY[0x270EF1F18]();
}

uint64_t sub_2148A1E58()
{
  return MEMORY[0x270EF1F58]();
}

uint64_t sub_2148A1E68()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_2148A1E78()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_2148A1E88()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2148A1E98()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2148A1EA8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2148A1EB8()
{
  return MEMORY[0x270EF25E8]();
}

uint64_t sub_2148A1EC8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2148A1ED8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2148A1EE8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2148A1EF8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2148A1F08()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2148A1F18()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2148A1F28()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2148A1F38()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2148A1F48()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2148A1F58()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2148A1F68()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2148A1F78()
{
  return MEMORY[0x270F9EA70]();
}

uint64_t sub_2148A1F88()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2148A1F98()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2148A1FA8()
{
  return MEMORY[0x270F9EAA0]();
}

uint64_t sub_2148A1FB8()
{
  return MEMORY[0x270F9EAB0]();
}

uint64_t sub_2148A1FC8()
{
  return MEMORY[0x270F9EAB8]();
}

uint64_t sub_2148A1FD8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2148A1FE8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2148A1FF8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2148A2008()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2148A2018()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2148A2028()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2148A2038()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2148A2048()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2148A2058()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2148A2068()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2148A2078()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2148A2088()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2148A2098()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_2148A20A8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2148A20B8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2148A20C8()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2148A20D8()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2148A20E8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2148A20F8()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_2148A2108()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2148A2118()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2148A2128()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2148A2138()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_2148A2148()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2148A2158()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2148A2168()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2148A2178()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2148A2188()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2148A2198()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_2148A21A8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2148A21B8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2148A21C8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2148A21E8()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_2148A2208()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_2148A2218()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2148A2228()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2148A2258()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2148A2268()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2148A2278()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2148A2288()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2148A2298()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2148A22A8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2148A22B8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2148A22C8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2148A22D8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2148A22E8()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2148A22F8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2148A2308()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2148A2318()
{
  return MEMORY[0x270F9FD98]();
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6770](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x270EE67F0](image);
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x270EE6840](image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return MEMORY[0x270EE6848](image);
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x270F960F0]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}