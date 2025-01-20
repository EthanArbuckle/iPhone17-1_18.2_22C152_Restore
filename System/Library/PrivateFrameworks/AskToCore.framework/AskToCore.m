AskToCore::ATURL::Parameter_optional __swiftcall ATURL.Parameter.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  AskToCore::ATURL::Parameter_optional result;
  char v5;

  v2 = v1;
  v3 = sub_248766358();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3) {
    v5 = v3;
  }
  *v2 = v5;
  return result;
}

uint64_t ATURL.Parameter.rawValue.getter()
{
  unint64_t v1 = 0xD00000000000001BLL;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000010;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x7265566F546B7361;
  }
}

uint64_t sub_2487454EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_248763290(*a1, *a2);
}

uint64_t sub_2487454F8()
{
  return sub_24875F888();
}

uint64_t sub_248745500()
{
  sub_248766068();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2487455A8()
{
  return sub_24875FAD0();
}

AskToCore::ATURL::Parameter_optional sub_2487455B0(Swift::String *a1)
{
  return ATURL.Parameter.init(rawValue:)(*a1);
}

void sub_2487455BC(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEC0000006E6F6973;
  unint64_t v4 = 0xD00000000000001BLL;
  unint64_t v5 = 0x80000002487687E0;
  if (v2 != 1)
  {
    unint64_t v4 = 0xD000000000000010;
    unint64_t v5 = 0x8000000248768800;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0x7265566F546B7361;
  }
  if (!v6) {
    unint64_t v3 = v5;
  }
  *a1 = v7;
  a1[1] = v3;
}

unint64_t sub_248745634()
{
  unint64_t v1 = v0;
  sub_248749D00(v0, (uint64_t)&v5);
  int v2 = v5;
  sub_248749D00(v1, (uint64_t)&v6);
  switch(v7)
  {
    case 1:
      sub_2487662A8();
      swift_bridgeObjectRelease();
      sub_248766078();
      sub_248766078();
      sub_248766078();
      goto LABEL_5;
    case 2:
    case 3:
      id v3 = v2;
      sub_2487662A8();
      sub_248766078();
      swift_getErrorValue();
      sub_2487664D8();
      sub_248766078();
      swift_bridgeObjectRelease();
      sub_248766078();
      swift_bridgeObjectRelease();
      sub_248749D18((uint64_t)v1);
      break;
    default:
      sub_2487662A8();
      sub_248766078();
      sub_248766078();
LABEL_5:
      sub_248766078();
      sub_248766078();
      swift_bridgeObjectRelease();
      break;
  }
  return 0xD000000000000030;
}

unint64_t sub_2487458EC()
{
  sub_248749D00(v0, (uint64_t)v2);
  return sub_248745634();
}

uint64_t ATURL.Parser.isValid(_:)()
{
  return 1;
}

uint64_t ATURL.Parser.parse<A>(_:from:)@<X0>(uint64_t a1@<X0>, void (*a2)(char *, unint64_t, uint64_t)@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v75 = a2;
  uint64_t v70 = a5;
  v79[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v8 = sub_248765DB8();
  uint64_t v77 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v10 = (char *)v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269324140);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v76 = (uint64_t)v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v15 = (char *)v64 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269324148);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  v19 = (char *)v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v21 = (char *)v64 - v20;
  uint64_t v71 = a1;
  uint64_t v72 = a4;
  sub_248746264((uint64_t)a3, (char *)v79);
  if (LOBYTE(v79[0]) == 3)
  {
    v79[0] = a3;
    swift_getMetatypeMetadata();
    uint64_t v22 = sub_248766058();
    uint64_t v24 = v23;
    sub_248749550();
    swift_allocError();
    *(void *)uint64_t v25 = v22;
    *(void *)(v25 + 8) = v24;
    *(void *)(v25 + 16) = 0;
    *(void *)(v25 + 24) = 0;
    *(unsigned char *)(v25 + 32) = 0;
    return swift_willThrow();
  }
  int v78 = LOBYTE(v79[0]);
  v68 = a3;
  unint64_t v27 = 0xEC0000006E6F6973;
  sub_248765DE8();
  v69 = v21;
  sub_248749E0C((uint64_t)v21, (uint64_t)v19, &qword_269324148);
  uint64_t v28 = sub_248765E18();
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v19, 1, v28) == 1)
  {
    sub_2487495A4((uint64_t)v19, &qword_269324148);
    uint64_t v30 = v77;
LABEL_23:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v15, 1, 1, v8);
    goto LABEL_24;
  }
  uint64_t v31 = sub_248765DC8();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v19, v28);
  uint64_t v30 = v77;
  if (!v31) {
    goto LABEL_23;
  }
  v65 = v15;
  uint64_t v32 = *(void *)(v31 + 16);
  if (!v32)
  {
LABEL_22:
    v15 = v65;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v65, 1, 1, v8);
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  v75 = *(void (**)(char *, unint64_t, uint64_t))(v77 + 16);
  unint64_t v33 = v31 + ((*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80));
  v34 = (void (**)(char *, uint64_t))(v77 + 8);
  uint64_t v73 = *(void *)(v77 + 72);
  v64[1] = v31;
  swift_bridgeObjectRetain();
  unint64_t v66 = 0x8000000248768800;
  unint64_t v67 = 0x80000002487687E0;
  while (1)
  {
    v75(v10, v33, v8);
    uint64_t v35 = sub_248765D98();
    if (v78)
    {
      if (v78 == 1) {
        unint64_t v37 = 0xD00000000000001BLL;
      }
      else {
        unint64_t v37 = 0xD000000000000010;
      }
      if (v78 == 1) {
        unint64_t v38 = v67;
      }
      else {
        unint64_t v38 = v66;
      }
      if (v35 != v37) {
        goto LABEL_19;
      }
    }
    else
    {
      unint64_t v38 = 0xEC0000006E6F6973;
      if (v35 != 0x7265566F546B7361) {
        goto LABEL_19;
      }
    }
    if (v36 == v38)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_39;
    }
LABEL_19:
    char v39 = sub_248766498();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v39) {
      break;
    }
    (*v34)(v10, v8);
    v33 += v73;
    if (!--v32)
    {
      swift_bridgeObjectRelease();
      uint64_t v30 = v77;
      unint64_t v27 = 0xEC0000006E6F6973;
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease();
LABEL_39:
  uint64_t v30 = v77;
  v15 = v65;
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v65, v10, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v15, 0, 1, v8);
  swift_bridgeObjectRelease();
  unint64_t v27 = 0xEC0000006E6F6973;
LABEL_24:
  uint64_t v40 = v76;
  sub_248749E0C((uint64_t)v15, v76, &qword_269324140);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v40, 1, v8) == 1)
  {
    sub_2487495A4(v40, &qword_269324140);
    goto LABEL_28;
  }
  v41 = v74;
  sub_248765DA8();
  uint64_t v43 = v42;
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v40, v8);
  if (v43 && (uint64_t v44 = sub_248765E88(), v46 = v45, swift_bridgeObjectRelease(), v46 >> 60 != 15))
  {
    v52 = (void *)sub_248765E98();
    v79[0] = 0;
    id v53 = objc_msgSend(v52, sel_decompressedDataUsingAlgorithm_error_, 3, v79);

    id v54 = v79[0];
    if (!v53)
    {
      v60 = v54;
      v61 = (void *)sub_248765E68();

      swift_willThrow();
      sub_248749550();
      swift_allocError();
      *(void *)uint64_t v62 = v61;
      *(void *)(v62 + 8) = 0;
      *(void *)(v62 + 16) = 0;
      *(void *)(v62 + 24) = 0;
      *(unsigned char *)(v62 + 32) = 3;
      id v63 = v61;
      swift_willThrow();
      sub_248749600(v44, v46);

      goto LABEL_33;
    }
    uint64_t v55 = sub_248765EB8();
    unint64_t v57 = v56;

    sub_248765D48();
    swift_allocObject();
    sub_24874966C(v55, v57);
    sub_248765D38();
    sub_248765D28();
    if (!v41)
    {
      sub_248749600(v44, v46);
      swift_release();
      sub_248749614(v55, v57);
      sub_248749614(v55, v57);
      goto LABEL_33;
    }
    swift_release();
    sub_248749614(v55, v57);
    sub_248749550();
    swift_allocError();
    *(void *)uint64_t v58 = v41;
    *(void *)(v58 + 8) = 0;
    *(void *)(v58 + 16) = 0;
    *(void *)(v58 + 24) = 0;
    *(unsigned char *)(v58 + 32) = 2;
    id v59 = v41;
    swift_willThrow();
    sub_248749600(v44, v46);

    sub_248749614(v55, v57);
    sub_2487495A4((uint64_t)v15, &qword_269324140);
    return sub_2487495A4((uint64_t)v69, &qword_269324148);
  }
  else
  {
LABEL_28:
    unint64_t v47 = 0x7265566F546B7361;
    if (v78)
    {
      if (v78 == 1)
      {
        unint64_t v47 = 0xD00000000000001BLL;
        unint64_t v27 = 0x80000002487687E0;
      }
      else
      {
        unint64_t v27 = 0x8000000248768800;
        unint64_t v47 = 0xD000000000000010;
      }
    }
    v79[0] = v68;
    swift_getMetatypeMetadata();
    uint64_t v48 = sub_248766058();
    uint64_t v50 = v49;
    sub_248749550();
    swift_allocError();
    *(void *)uint64_t v51 = v47;
    *(void *)(v51 + 8) = v27;
    *(void *)(v51 + 16) = v48;
    *(void *)(v51 + 24) = v50;
    *(unsigned char *)(v51 + 32) = 1;
    swift_willThrow();
LABEL_33:
    sub_2487495A4((uint64_t)v15, &qword_269324140);
    return sub_2487495A4((uint64_t)v69, &qword_269324148);
  }
}

void sub_248746264(uint64_t a1@<X1>, char *a2@<X8>)
{
  if (type metadata accessor for ATPayload() == a1)
  {
    char v10 = 2;
  }
  else
  {
    if (qword_2693240F8 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_248765FA8();
    __swift_project_value_buffer(v3, (uint64_t)qword_269327128);
    unint64_t v4 = sub_248765F88();
    os_log_type_t v5 = sub_2487661C8();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v11 = v7;
      *(_DWORD *)uint64_t v6 = 136315138;
      swift_getMetatypeMetadata();
      uint64_t v8 = sub_248766058();
      sub_2487475D8(v8, v9, &v11);
      sub_248766258();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_248743000, v4, v5, "Unknown ATURL.Parameter for type %s.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57E660](v7, -1, -1);
      MEMORY[0x24C57E660](v6, -1, -1);
    }

    char v10 = 3;
  }
  *a2 = v10;
}

unint64_t sub_24874641C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693241F8);
  int v2 = (void *)sub_248766338();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (void *)(a1 + 48);
  while (1)
  {
    unsigned __int8 v5 = *((unsigned char *)v4 - 16);
    uint64_t v7 = *(v4 - 1);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_248747C30(v5);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    char v10 = (void *)(v2[7] + 16 * result);
    void *v10 = v7;
    v10[1] = v6;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_24874652C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269324170);
  uint64_t v2 = sub_248766338();
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
    sub_248749E0C(v6, (uint64_t)&v15, &qword_269324178);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_248747D10(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_248749DA0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_248746664(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693241E0);
  uint64_t v2 = (void *)sub_248766338();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_248747D10(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

uint64_t sub_248746780(uint64_t a1)
{
  uint64_t v2 = sub_248765DB8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v29 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - v6;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v22 = a1 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  uint64_t v11 = v10 & v8;
  int64_t v23 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v27 = v3 + 32;
  uint64_t v28 = (void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v26 = v3 + 8;
  uint64_t v30 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v13 = 0;
  unint64_t v14 = MEMORY[0x263F8EE78];
  unint64_t v24 = 0x8000000248768800;
  unint64_t v25 = 0x80000002487687E0;
  if (!v11) {
    goto LABEL_5;
  }
LABEL_4:
  for (v11 &= v11 - 1; ; uint64_t v11 = (v16 - 1) & v16)
  {
    swift_bridgeObjectRetain();
    sub_248765D88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = v29;
    (*v28)(v29, v7, v2);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v14 = sub_248747370(0, *(void *)(v14 + 16) + 1, 1, v14);
    }
    unint64_t v20 = *(void *)(v14 + 16);
    unint64_t v19 = *(void *)(v14 + 24);
    if (v20 >= v19 >> 1) {
      unint64_t v14 = sub_248747370(v19 > 1, v20 + 1, 1, v14);
    }
    *(void *)(v14 + 16) = v20 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v14+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v20, v18, v2);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    if (v11) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v15 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v15 >= v23) {
      goto LABEL_25;
    }
    uint64_t v16 = *(void *)(v22 + 8 * v15);
    ++v13;
    if (!v16)
    {
      int64_t v13 = v15 + 1;
      if (v15 + 1 >= v23) {
        goto LABEL_25;
      }
      uint64_t v16 = *(void *)(v22 + 8 * v13);
      if (!v16)
      {
        int64_t v13 = v15 + 2;
        if (v15 + 2 >= v23) {
          goto LABEL_25;
        }
        uint64_t v16 = *(void *)(v22 + 8 * v13);
        if (!v16) {
          break;
        }
      }
    }
LABEL_18:
    ;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v23)
  {
LABEL_25:
    swift_release();
    return v14;
  }
  uint64_t v16 = *(void *)(v22 + 8 * v17);
  if (v16)
  {
    int64_t v13 = v17;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v13 >= v23) {
      goto LABEL_25;
    }
    uint64_t v16 = *(void *)(v22 + 8 * v13);
    ++v17;
    if (v16) {
      goto LABEL_18;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t static ATURL.create(using:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  v77[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_248765E18();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_248766048();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248765D78();
  swift_allocObject();
  uint64_t v12 = sub_248765D68();
  v77[0] = a1;
  type metadata accessor for ATPayload();
  sub_248749FCC(&qword_2693244D0);
  uint64_t v13 = sub_248765D58();
  if (v2) {
    return swift_release();
  }
  uint64_t v70 = v6;
  uint64_t v71 = a2;
  uint64_t v16 = v13;
  unint64_t v17 = v14;
  uint64_t v73 = v11;
  unint64_t v67 = a1;
  uint64_t v68 = 0;
  if (qword_2693240F8 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_248765FA8();
  uint64_t v19 = __swift_project_value_buffer(v18, (uint64_t)qword_269327128);
  unint64_t v20 = v17;
  sub_24874966C(v16, v17);
  sub_24874966C(v16, v17);
  uint64_t v21 = sub_248765F88();
  os_log_type_t v22 = sub_2487661D8();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v74 = v19;
  uint64_t v75 = v12;
  uint64_t v72 = v5;
  v69 = v8;
  if (v23)
  {
    unint64_t v24 = (uint8_t *)swift_slowAlloc();
    unint64_t v25 = (void *)swift_slowAlloc();
    v77[0] = v25;
    *(_DWORD *)unint64_t v24 = 136315138;
    unint64_t v66 = v24 + 4;
    sub_24874966C(v16, v17);
    uint64_t v26 = sub_248765E78();
    unint64_t v28 = v27;
    sub_248749614(v16, v20);
    uint64_t v76 = sub_2487475D8(v26, v28, (uint64_t *)v77);
    sub_248766258();
    swift_bridgeObjectRelease();
    sub_248749614(v16, v20);
    sub_248749614(v16, v20);
    _os_log_impl(&dword_248743000, v21, v22, "Encoded payload data: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v25, -1, -1);
    MEMORY[0x24C57E660](v24, -1, -1);
  }
  else
  {
    sub_248749614(v16, v17);
    sub_248749614(v16, v17);
  }

  sub_24874966C(v16, v20);
  sub_24874966C(v16, v20);
  uint64_t v29 = sub_248765F88();
  os_log_type_t v30 = sub_2487661D8();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = (void *)swift_slowAlloc();
    v77[0] = v32;
    *(_DWORD *)uint64_t v31 = 136315138;
    sub_248766038();
    uint64_t v33 = sub_248766028();
    if (v34)
    {
      unint64_t v35 = v34;
    }
    else
    {
      uint64_t v33 = 7104878;
      unint64_t v35 = 0xE300000000000000;
    }
    uint64_t v76 = sub_2487475D8(v33, v35, (uint64_t *)v77);
    sub_248766258();
    swift_bridgeObjectRelease();
    sub_248749614(v16, v20);
    sub_248749614(v16, v20);
    _os_log_impl(&dword_248743000, v29, v30, "Encoded payload JSON: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v32, -1, -1);
    MEMORY[0x24C57E660](v31, -1, -1);
  }
  else
  {
    sub_248749614(v16, v20);
    sub_248749614(v16, v20);
  }

  uint64_t v36 = (void *)sub_248765E98();
  v77[0] = 0;
  id v37 = objc_msgSend(v36, sel_compressedDataUsingAlgorithm_error_, 3, v77);

  id v38 = v77[0];
  if (!v37)
  {
    uint64_t v50 = v38;
    sub_248765E68();

    swift_willThrow();
    sub_248749614(v16, v20);
    return swift_release();
  }
  uint64_t v39 = sub_248765EB8();
  unint64_t v41 = v40;

  uint64_t v73 = (char *)v39;
  unint64_t v66 = (uint8_t *)v41;
  uint64_t v42 = sub_248765EA8();
  unint64_t v44 = v43;
  swift_bridgeObjectRetain_n();
  unint64_t v45 = sub_248765F88();
  os_log_type_t v46 = sub_2487661D8();
  BOOL v47 = os_log_type_enabled(v45, v46);
  uint64_t v65 = v42;
  if (v47)
  {
    uint64_t v48 = (uint8_t *)swift_slowAlloc();
    uint64_t v49 = (void *)swift_slowAlloc();
    v77[0] = v49;
    *(_DWORD *)uint64_t v48 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_2487475D8(v42, v44, (uint64_t *)v77);
    sub_248766258();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_248743000, v45, v46, "Zipped and encoded payload data to base64: %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v49, -1, -1);
    MEMORY[0x24C57E660](v48, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v51 = v69;
  v52 = v67;
  id v53 = (void *)sub_24874641C(MEMORY[0x263F8EE78]);
  LOWORD(v77[0]) = *(_WORD *)&v52[OBJC_IVAR____TtC9AskToCore9ATPayload_version];
  uint64_t v54 = sub_248766478();
  uint64_t v56 = v55;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v77[0] = v53;
  sub_248748A44(v54, v56, 0, isUniquelyReferenced_nonNull_native);
  id v58 = v77[0];
  swift_bridgeObjectRelease();
  uint64_t v59 = *(void *)&v52[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8];
  if (v59)
  {
    uint64_t v60 = *(void *)&v52[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier];
    swift_bridgeObjectRetain();
    char v61 = swift_isUniquelyReferenced_nonNull_native();
    v77[0] = v58;
    sub_248748A44(v60, v59, 1u, v61);
    id v58 = v77[0];
    swift_bridgeObjectRelease();
  }
  uint64_t v62 = v65;
  char v63 = swift_isUniquelyReferenced_nonNull_native();
  v77[0] = v58;
  sub_248748A44(v62, v44, 2u, v63);
  id v64 = v77[0];
  swift_bridgeObjectRelease();
  sub_248765E08();
  sub_248746780((uint64_t)v64);
  sub_248765DD8();
  sub_248765DF8();
  (*(void (**)(char *, uint64_t))(v70 + 8))(v51, v72);
  sub_248749614(v16, v20);
  sub_248749614((uint64_t)v73, (unint64_t)v66);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_248747370(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693241F0);
  uint64_t v10 = *(void *)(sub_248765DB8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2487662F8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_248765DB8() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_248749E74(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_2487475D8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2487476AC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_248749DB0((uint64_t)v12, *a3);
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
      sub_248749DB0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2487476AC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_248766268();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_248747868(a5, a6);
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
  uint64_t v8 = sub_2487662D8();
  if (!v8)
  {
    sub_2487662F8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_248766348();
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

uint64_t sub_248747868(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_248747900(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_248747AE0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_248747AE0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_248747900(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_248747A78(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2487662B8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2487662F8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_248766088();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_248766348();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2487662F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_248747A78(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693241E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_248747AE0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693241E8);
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
  uint64_t result = sub_248766348();
  __break(1u);
  return result;
}

unint64_t sub_248747C30(unsigned __int8 a1)
{
  sub_248766528();
  sub_248766068();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_248766588();

  return sub_248747D88(a1, v2);
}

unint64_t sub_248747D10(uint64_t a1, uint64_t a2)
{
  sub_248766528();
  sub_248766068();
  uint64_t v4 = sub_248766588();

  return sub_248747F4C(a1, a2, v4);
}

unint64_t sub_248747D88(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    while (1)
    {
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        if (*(unsigned char *)(*(void *)(v2 + 48) + v4) == 1)
        {
          unint64_t v7 = 0xD00000000000001BLL;
          unint64_t v8 = 0x80000002487687E0;
          int v9 = a1;
          if (!a1) {
            goto LABEL_17;
          }
        }
        else
        {
          unint64_t v8 = 0x8000000248768800;
          unint64_t v7 = 0xD000000000000010;
          int v9 = a1;
          if (!a1)
          {
LABEL_17:
            unint64_t v11 = 0xEC0000006E6F6973;
            if (v7 != 0x7265566F546B7361) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
        unint64_t v7 = 0x7265566F546B7361;
        unint64_t v8 = 0xEC0000006E6F6973;
        int v9 = a1;
        if (!a1) {
          goto LABEL_17;
        }
      }
      if (v9 == 1) {
        unint64_t v10 = 0xD00000000000001BLL;
      }
      else {
        unint64_t v10 = 0xD000000000000010;
      }
      if (v9 == 1) {
        unint64_t v11 = 0x80000002487687E0;
      }
      else {
        unint64_t v11 = 0x8000000248768800;
      }
      if (v7 != v10) {
        goto LABEL_19;
      }
LABEL_18:
      if (v8 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_19:
      char v12 = sub_248766498();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v6;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
  }
  return v4;
}

unint64_t sub_248747F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_248766498() & 1) == 0)
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
      while (!v14 && (sub_248766498() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_248748030(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693241F8);
  char v37 = a2;
  uint64_t v6 = sub_248766328();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  unint64_t v34 = v2;
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
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
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
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
    char v22 = *(unsigned char *)(*(void *)(v5 + 48) + v17);
    BOOL v23 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v17);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_248766528();
    sub_248766068();
    swift_bridgeObjectRelease();
    uint64_t result = sub_248766588();
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
          goto LABEL_41;
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
    *(unsigned char *)(*(void *)(v7 + 48) + v14) = v22;
    BOOL v15 = (void *)(*(void *)(v7 + 56) + 16 * v14);
    void *v15 = v24;
    v15[1] = v25;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2487483B0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269324170);
  uint64_t v6 = sub_248766328();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_248749DA0(v24, v35);
      }
      else
      {
        sub_248749DB0((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_248766528();
      sub_248766068();
      uint64_t result = sub_248766588();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      BOOL v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_248749DA0(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_2487486B0()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693241F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_248766318();
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
    unint64_t v16 = (uint64_t *)(*(void *)(v2 + 56) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    unint64_t v19 = (void *)(*(void *)(v4 + 56) + 16 * v15);
    void *v19 = v18;
    v19[1] = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_24874885C()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269324170);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_248766318();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
    uint64_t v20 = 32 * v15;
    sub_248749DB0(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_248749DA0(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
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

uint64_t sub_248748A44(uint64_t a1, uint64_t a2, unsigned __int8 a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_248747C30(a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2487486B0();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_bridgeObjectRelease();
      void *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(unsigned char *)(v18[6] + v12) = a3;
    unint64_t v21 = (void *)(v18[7] + 16 * v12);
    void *v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_248748030(result, a4 & 1);
  uint64_t result = sub_248747C30(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    uint64_t v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_2487664C8();
  __break(1u);
  return result;
}

_OWORD *sub_248748B84(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_248747D10(a2, a3);
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
      sub_24874885C();
      goto LABEL_7;
    }
    sub_2487483B0(v15, a4 & 1);
    unint64_t v21 = sub_248747D10(a2, a3);
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
    uint64_t result = (_OWORD *)sub_2487664C8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_248749DA0(a1, v19);
  }
LABEL_13:
  sub_248748CD8(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_248748CD8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_248749DA0(a4, (_OWORD *)(a5[7] + 32 * a1));
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

id sub_248748D44()
{
  unint64_t v1 = v0;
  v60[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_248765DB8();
  uint64_t v57 = *(void *)(v2 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269324140);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v56 = (uint64_t)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v50 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269324148);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  unint64_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  BOOL v14 = (char *)&v50 - v13;
  uint64_t v55 = (void *)type metadata accessor for ATPayload();
  sub_248765DE8();
  sub_248749E0C((uint64_t)v14, (uint64_t)v12, &qword_269324148);
  uint64_t v15 = sub_248765E18();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, v15) == 1)
  {
    sub_2487495A4((uint64_t)v12, &qword_269324148);
LABEL_12:
    uint64_t v24 = v57;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v8, 1, 1, v2);
    goto LABEL_13;
  }
  uint64_t v17 = sub_248765DC8();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v15);
  if (!v17) {
    goto LABEL_12;
  }
  uint64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    uint64_t v51 = v0;
    v52 = v14;
    id v53 = v8;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v57 + 16);
    unint64_t v20 = v17 + ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80));
    unint64_t v21 = (void (**)(char *, uint64_t))(v57 + 8);
    uint64_t v58 = *(void *)(v57 + 72);
    uint64_t v59 = v19;
    uint64_t v50 = v17;
    swift_bridgeObjectRetain();
    unint64_t v54 = 0x8000000248768800;
    while (1)
    {
      v59(v4, v20, v2);
      if (sub_248765D98() == 0xD000000000000010 && v22 == v54) {
        break;
      }
      char v23 = sub_248766498();
      swift_bridgeObjectRelease();
      if (v23) {
        goto LABEL_23;
      }
      (*v21)(v4, v2);
      v20 += v58;
      if (!--v18)
      {
        swift_bridgeObjectRelease();
        BOOL v14 = v52;
        uint64_t v8 = v53;
        unint64_t v1 = v51;
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
LABEL_23:
    swift_bridgeObjectRelease();
    uint64_t v24 = v57;
    uint64_t v8 = v53;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v53, v4, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v8, 0, 1, v2);
    swift_bridgeObjectRelease();
    unint64_t v1 = v51;
    BOOL v14 = v52;
  }
  else
  {
LABEL_11:
    uint64_t v24 = v57;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v57 + 56))(v8, 1, 1, v2);
    swift_bridgeObjectRelease();
  }
LABEL_13:
  uint64_t v25 = v56;
  sub_248749E0C((uint64_t)v8, v56, &qword_269324140);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v25, 1, v2) == 1)
  {
    sub_2487495A4(v25, &qword_269324140);
LABEL_17:
    v60[0] = v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269324200);
    uint64_t v32 = sub_248766058();
    uint64_t v34 = v33;
    sub_248749550();
    swift_allocError();
    *(void *)uint64_t v35 = 0xD000000000000010;
    *(void *)(v35 + 8) = 0x8000000248768800;
    *(void *)(v35 + 16) = v32;
    *(void *)(v35 + 24) = v34;
    *(unsigned char *)(v35 + 32) = 1;
    swift_willThrow();
LABEL_18:
    sub_2487495A4((uint64_t)v8, &qword_269324140);
    return (id)sub_2487495A4((uint64_t)v14, &qword_269324148);
  }
  unint64_t v26 = v1;
  sub_248765DA8();
  uint64_t v28 = v27;
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v2);
  if (!v28) {
    goto LABEL_17;
  }
  uint64_t v29 = sub_248765E88();
  unint64_t v31 = v30;
  swift_bridgeObjectRelease();
  if (v31 >> 60 == 15) {
    goto LABEL_17;
  }
  char v37 = (void *)sub_248765E98();
  v60[0] = 0;
  id v38 = objc_msgSend(v37, sel_decompressedDataUsingAlgorithm_error_, 3, v60);

  id v39 = v60[0];
  if (!v38)
  {
    os_log_type_t v46 = v39;
    BOOL v47 = (void *)sub_248765E68();

    swift_willThrow();
    sub_248749550();
    swift_allocError();
    *(void *)uint64_t v48 = v47;
    *(void *)(v48 + 8) = 0;
    *(void *)(v48 + 16) = 0;
    *(void *)(v48 + 24) = 0;
    *(unsigned char *)(v48 + 32) = 3;
    id v49 = v47;
    swift_willThrow();
    sub_248749600(v29, v31);

    goto LABEL_18;
  }
  uint64_t v40 = (uint64_t)v14;
  uint64_t v41 = sub_248765EB8();
  unint64_t v43 = v42;

  sub_248765D48();
  swift_allocObject();
  sub_24874966C(v41, v43);
  sub_248765D38();
  sub_248749FCC(&qword_269324208);
  sub_248765D28();
  if (v26)
  {
    swift_release();
    sub_248749614(v41, v43);
    sub_248749550();
    swift_allocError();
    *(void *)uint64_t v44 = v26;
    *(void *)(v44 + 8) = 0;
    *(void *)(v44 + 16) = 0;
    *(void *)(v44 + 24) = 0;
    *(unsigned char *)(v44 + 32) = 2;
    id v45 = v26;
    swift_willThrow();
    sub_248749600(v29, v31);

    sub_248749614(v41, v43);
    BOOL v14 = (char *)v40;
    goto LABEL_18;
  }
  sub_248749600(v29, v31);
  swift_release();
  sub_248749614(v41, v43);
  sub_248749614(v41, v43);
  sub_2487495A4((uint64_t)v8, &qword_269324140);
  sub_2487495A4(v40, &qword_269324148);
  return v60[0];
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

unint64_t sub_248749550()
{
  unint64_t result = qword_269324150;
  if (!qword_269324150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324150);
  }
  return result;
}

uint64_t sub_2487495A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_248749600(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_248749614(a1, a2);
  }
  return a1;
}

uint64_t sub_248749614(uint64_t a1, unint64_t a2)
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

uint64_t sub_24874966C(uint64_t a1, unint64_t a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_248749700()
{
  unint64_t result = qword_269324160;
  if (!qword_269324160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324160);
  }
  return result;
}

ValueMetadata *type metadata accessor for ATURL()
{
  return &type metadata for ATURL;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ATURL.Parameter(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ATURL.Parameter(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2487498D0);
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

uint64_t sub_2487498F8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_248749904(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ATURL.Parameter()
{
  return &type metadata for ATURL.Parameter;
}

ValueMetadata *type metadata accessor for ATURL.Parser()
{
  return &type metadata for ATURL.Parser;
}

void type metadata accessor for CGImage()
{
  if (!qword_269324168)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269324168);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for ATURL.Parser.Error(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

id sub_2487499B8(id result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
      goto LABEL_7;
    case 1:
      swift_bridgeObjectRetain();
LABEL_7:
      unint64_t result = (id)swift_bridgeObjectRetain();
      break;
    case 2:
    case 3:
      unint64_t result = result;
      break;
    default:
      return result;
  }
  return result;
}

void destroy for ATURL.Parser.Error(uint64_t a1)
{
}

void sub_248749A70(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
      goto LABEL_7;
    case 1:
      swift_bridgeObjectRelease();
LABEL_7:
      swift_bridgeObjectRelease();
      break;
    case 2:
    case 3:

      break;
    default:
      return;
  }
}

uint64_t initializeWithCopy for ATURL.Parser.Error(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_2487499B8(*(id *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for ATURL.Parser.Error(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_2487499B8(*(id *)a2, v4, v5, v6, v7);
  int v8 = *(void **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_248749A70(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ATURL.Parser.Error(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_248749A70(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ATURL.Parser.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ATURL.Parser.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_248749CDC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_248749CE4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ATURL.Parser.Error()
{
  return &type metadata for ATURL.Parser.Error;
}

uint64_t sub_248749D00(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_248749D18(uint64_t a1)
{
  return a1;
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

_OWORD *sub_248749DA0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_248749DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_248749E0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_248749E74(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_248765DB8() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_248766348();
  __break(1u);
  return result;
}

uint64_t sub_248749FCC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ATPayload();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24874A010(uint64_t a1)
{
  return sub_24874A154(a1, qword_269327110);
}

uint64_t sub_24874A034(uint64_t a1)
{
  return sub_24874A154(a1, qword_269327128);
}

uint64_t sub_24874A058(uint64_t a1)
{
  return sub_24874A154(a1, qword_269327140);
}

uint64_t sub_24874A07C(uint64_t a1)
{
  return sub_24874A154(a1, qword_269327158);
}

uint64_t sub_24874A0A4(uint64_t a1)
{
  return sub_24874A154(a1, qword_269327170);
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

uint64_t sub_24874A134(uint64_t a1)
{
  return sub_24874A154(a1, qword_269327188);
}

uint64_t sub_24874A154(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_248765FA8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_248765F98();
}

uint64_t PayloadImage.clientIconImageData.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_24874A208(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t sub_24874A208(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24874966C(a1, a2);
  }
  return a1;
}

uint64_t PayloadImage.associatedContentIconImageData.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_24874966C(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t PayloadImage.cornerRadiusIncluded.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t PayloadImage.init(clientIconImageData:associatedContentIconImageData:cornerRadiusIncluded:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 32) = a5;
  return result;
}

uint64_t destroy for PayloadImage(uint64_t *a1)
{
  unint64_t v2 = a1[1];
  if (v2 >> 60 != 15) {
    sub_248749614(*a1, v2);
  }
  uint64_t v3 = a1[2];
  unint64_t v4 = a1[3];

  return sub_248749614(v3, v4);
}

uint64_t initializeWithCopy for PayloadImage(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v5 = *a2;
    sub_24874966C(*a2, a2[1]);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v4;
  }
  uint64_t v6 = a2[2];
  unint64_t v7 = a2[3];
  sub_24874966C(v6, v7);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  return a1;
}

uint64_t assignWithCopy for PayloadImage(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8) >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      uint64_t v6 = *(void *)a2;
      sub_24874966C(*(void *)a2, *(void *)(a2 + 8));
      uint64_t v7 = *(void *)a1;
      unint64_t v8 = *(void *)(a1 + 8);
      *(void *)a1 = v6;
      *(void *)(a1 + 8) = v4;
      sub_248749614(v7, v8);
      goto LABEL_8;
    }
    sub_24874A3F8(a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  uint64_t v5 = *(void *)a2;
  sub_24874966C(*(void *)a2, *(void *)(a2 + 8));
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v4;
LABEL_8:
  uint64_t v9 = *(void *)(a2 + 16);
  unint64_t v10 = *(void *)(a2 + 24);
  sub_24874966C(v9, v10);
  uint64_t v11 = *(void *)(a1 + 16);
  unint64_t v12 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v10;
  sub_248749614(v11, v12);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t sub_24874A3F8(uint64_t a1)
{
  return a1;
}

uint64_t assignWithTake for PayloadImage(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4 >> 60 != 15)
  {
    unint64_t v5 = *(void *)(a2 + 8);
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *(void *)a1;
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v5;
      sub_248749614(v6, v4);
      goto LABEL_6;
    }
    sub_24874A3F8(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  sub_248749614(v7, v8);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PayloadImage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PayloadImage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PayloadImage()
{
  return &type metadata for PayloadImage;
}

id AskToExtension.configuration.getter@<X0>(void *a1@<X8>)
{
  id result = sub_248765C54(v1);
  *a1 = result;
  return result;
}

uint64_t dispatch thunk of AskToExtension.messagesDataPayload(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_24874A5D8()
{
  type metadata accessor for _AskToExtensionConfiguration();

  return swift_getWitnessTable();
}

uint64_t ATRecipientGroup.debugDescription.getter(unsigned __int16 a1)
{
  if (a1 == 0xFFFF) {
    return 0x6E6F2D6576696CLL;
  }
  if (!a1) {
    return 0xD000000000000019;
  }
  uint64_t result = sub_2487664B8();
  __break(1u);
  return result;
}

uint64_t ATRecipientGroup.isFamily.getter(unsigned __int16 a1)
{
  if (a1 == 0xFFFF) {
    return 0;
  }
  if (!a1) {
    return 1;
  }
  uint64_t result = sub_2487664B8();
  __break(1u);
  return result;
}

uint64_t ATRecipientGroup.init(rawValue:)(unsigned __int16 a1)
{
  int v1 = a1;
  if (a1)
  {
    if (a1 == 0xFFFF) {
      int v1 = 0xFFFF;
    }
    else {
      int v1 = 0;
    }
    int v2 = a1 != 0xFFFF;
  }
  else
  {
    int v2 = 0;
  }
  return v1 | (v2 << 16);
}

BOOL sub_24874A730(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24874A748()
{
  unint64_t result = qword_269324390;
  if (!qword_269324390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324390);
  }
  return result;
}

uint64_t sub_24874A79C()
{
  return sub_248766588();
}

uint64_t sub_24874A7E4()
{
  return sub_248766558();
}

uint64_t sub_24874A810()
{
  return sub_248766588();
}

_WORD *sub_24874A854@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  int v2 = (unsigned __int16)*result;
  if (v2 == 0xFFFF) {
    __int16 v3 = -1;
  }
  else {
    __int16 v3 = 0;
  }
  BOOL v4 = v2 != 0xFFFF;
  BOOL v5 = v2 == 0;
  if (*result) {
    __int16 v6 = v3;
  }
  else {
    __int16 v6 = 0;
  }
  if (v5) {
    BOOL v4 = 0;
  }
  *(_WORD *)a2 = v6;
  *(unsigned char *)(a2 + 2) = v4;
  return result;
}

void sub_24874A884(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24874A890()
{
  return sub_2487660E8();
}

uint64_t sub_24874A8F0()
{
  return sub_2487660C8();
}

uint64_t sub_24874A940()
{
  if ((unsigned __int16)*v0 == 0xFFFF) {
    return 0x6E6F2D6576696CLL;
  }
  if (!*v0) {
    return 0xD000000000000019;
  }
  uint64_t result = sub_2487664B8();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for ATRecipientGroup()
{
  return &type metadata for ATRecipientGroup;
}

unint64_t sub_24874A9CC()
{
  unint64_t result = qword_269324398;
  if (!qword_269324398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324398);
  }
  return result;
}

uint64_t static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:entryPoint:)(uint64_t a1, uint64_t a2, void *a3, unsigned __int16 a4, __int16 a5)
{
  if (qword_269324118 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_248765FA8();
  __swift_project_value_buffer(v10, (uint64_t)qword_269327188);
  uint64_t v11 = sub_248765F88();
  os_log_type_t v12 = sub_2487661D8();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(void *)&long long v21 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    uint64_t v15 = Metrics.ResponseJourney.Checkpoint.description.getter(a4);
    sub_2487475D8(v15, v16, (uint64_t *)&v21);
    sub_248766258();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_248743000, v11, v12, "Logging response journey metric with checkpoint %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v14, -1, -1);
    MEMORY[0x24C57E660](v13, -1, -1);
  }

  type metadata accessor for ResponseJourneyEvent();
  uint64_t inited = swift_initStackObject();
  *(_WORD *)(inited + 104) = a5;
  uint64_t v22 = &type metadata for Metrics.ResponseJourney.Checkpoint;
  unint64_t v23 = sub_24874CC88();
  LOWORD(v21) = a4;
  *(_WORD *)(inited + 32) = 1;
  *(void *)(inited + 16) = 0xD000000000000026;
  *(void *)(inited + 24) = 0x80000002487690B0;
  *(void *)(inited + 40) = a1;
  *(void *)(inited + 48) = a2;
  swift_bridgeObjectRetain();
  id v18 = a3;
  swift_bridgeObjectRelease();
  *(void *)(inited + 56) = v18;
  sub_24874CCDC(&v21, inited + 64);
  uint64_t v19 = swift_retain();
  sub_24874C8A8(v19, (uint64_t (*)(uint64_t))sub_24874C398);
  swift_release();
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return __swift_destroy_boxed_opaque_existential_0(inited + 64);
}

uint64_t static Metrics.RequestSend.log(requestIdentifier:clientBundleIdentifier:sentSuccessfully:errorDomain:errorIdentifier:rawRecipientGroup:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 a9)
{
  uint64_t v13 = (int *)type metadata accessor for RequestSendEvent(0);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  id v18 = (uint64_t *)((char *)&v40 - v17);
  if (qword_269324118 != -1) {
    swift_once();
  }
  __int16 v19 = a9;
  uint64_t v20 = sub_248765FA8();
  __swift_project_value_buffer(v20, (uint64_t)qword_269327188);
  long long v21 = sub_248765F88();
  os_log_type_t v22 = sub_2487661D8();
  if (os_log_type_enabled(v21, v22))
  {
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = a3;
    uint64_t v24 = a1;
    uint64_t v25 = a2;
    char v26 = a4;
    uint64_t v27 = v23;
    *(_WORD *)unint64_t v23 = 0;
    _os_log_impl(&dword_248743000, v21, v22, "Logging request send metric", v23, 2u);
    uint64_t v28 = v27;
    a4 = v26;
    a2 = v25;
    a1 = v24;
    __int16 v19 = a9;
    a3 = v41;
    MEMORY[0x24C57E660](v28, -1, -1);
  }

  uint64_t v29 = (char *)v18 + v13[5];
  uint64_t v30 = sub_248765F58();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 16))(v29, a1, v30);
  *id v18 = 0xD000000000000022;
  v18[1] = 0x80000002487690E0;
  unint64_t v31 = (void *)((char *)v18 + v13[6]);
  uint64_t v32 = (void *)((char *)v18 + v13[8]);
  *uint64_t v32 = 0;
  v32[1] = 0;
  uint64_t v33 = (void *)((char *)v18 + v13[9]);
  *uint64_t v33 = 0;
  v33[1] = 0;
  *unint64_t v31 = a2;
  v31[1] = a3;
  *((unsigned char *)v18 + v13[7]) = a4 & 1;
  *(_WORD *)((char *)v18 + v13[10]) = v19;
  sub_24874CD6C((uint64_t)v18, (uint64_t)v16, type metadata accessor for RequestSendEvent);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v34 = sub_24874C48C();
  sub_24874BD40(v34);
  swift_bridgeObjectRelease();
  id v35 = objc_allocWithZone(MEMORY[0x263F202A8]);
  uint64_t v36 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  char v37 = (void *)sub_248765FB8();
  swift_bridgeObjectRelease();
  id v38 = objc_msgSend(v35, sel_initWithEventName_eventCategory_initData_, v36, 0, v37);

  if (qword_269324128 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_2693243A8, sel_sendEvent_, v38);

  sub_24874CDD4((uint64_t)v18, type metadata accessor for RequestSendEvent);
  return sub_24874CDD4((uint64_t)v16, type metadata accessor for RequestSendEvent);
}

uint64_t static Metrics.ResponseSend.log(requestIdentifier:clientBundleIdentifier:sentSuccessfully:rawOriginalRecipientGroup:answerKind:responseCount:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, __int16 a5, __int16 a6, uint64_t a7)
{
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  os_log_type_t v12 = (int *)type metadata accessor for ResponseSendEvent(0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (uint64_t *)((char *)&v37 - v16);
  if (qword_269324118 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_248765FA8();
  __swift_project_value_buffer(v18, (uint64_t)qword_269327188);
  __int16 v19 = sub_248765F88();
  os_log_type_t v20 = sub_2487661D8();
  if (os_log_type_enabled(v19, v20))
  {
    long long v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = a3;
    char v22 = a4;
    __int16 v23 = a5;
    __int16 v24 = a6;
    uint64_t v25 = a7;
    char v26 = v21;
    *(_WORD *)long long v21 = 0;
    _os_log_impl(&dword_248743000, v19, v20, "Logging response send metric", v21, 2u);
    uint64_t v27 = v26;
    a7 = v25;
    a6 = v24;
    a5 = v23;
    a4 = v22;
    a3 = v38;
    MEMORY[0x24C57E660](v27, -1, -1);
  }

  uint64_t v28 = (char *)v17 + v12[5];
  uint64_t v29 = sub_248765F58();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(v28, v39, v29);
  *uint64_t v17 = 0xD000000000000023;
  v17[1] = 0x8000000248769110;
  uint64_t v30 = (void *)((char *)v17 + v12[6]);
  *uint64_t v30 = v40;
  v30[1] = a3;
  *((unsigned char *)v17 + v12[7]) = a4 & 1;
  *(_WORD *)((char *)v17 + v12[8]) = a5;
  *(_WORD *)((char *)v17 + v12[9]) = a6;
  *(void *)((char *)v17 + v12[10]) = a7;
  sub_24874CD6C((uint64_t)v17, (uint64_t)v15, type metadata accessor for ResponseSendEvent);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v31 = sub_24874C6EC();
  sub_24874BD40(v31);
  swift_bridgeObjectRelease();
  id v32 = objc_allocWithZone(MEMORY[0x263F202A8]);
  uint64_t v33 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  unint64_t v34 = (void *)sub_248765FB8();
  swift_bridgeObjectRelease();
  id v35 = objc_msgSend(v32, sel_initWithEventName_eventCategory_initData_, v33, 0, v34);

  if (qword_269324128 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_2693243A8, sel_sendEvent_, v35);

  sub_24874CDD4((uint64_t)v17, type metadata accessor for ResponseSendEvent);
  return sub_24874CDD4((uint64_t)v15, type metadata accessor for ResponseSendEvent);
}

uint64_t Metrics.RequestJourney.Checkpoint.description.getter(unsigned __int16 a1)
{
  if (a1 <= 0x3E7u)
  {
    if (a1 <= 0x1F3u)
    {
      if (a1 <= 0xC7u)
      {
        if (!a1)
        {
          unint64_t v1 = 0x6C616974696E69;
          goto LABEL_48;
        }
        if (a1 == 100)
        {
          unint64_t v1 = 0xD000000000000022;
          goto LABEL_48;
        }
      }
      else
      {
        switch(a1)
        {
          case 0xC8u:
            unint64_t v1 = 0xD000000000000020;
            goto LABEL_48;
          case 0x12Cu:
            unint64_t v1 = 0xD000000000000016;
LABEL_48:
            sub_248766478();
            sub_248766078();
            swift_bridgeObjectRelease();
            sub_248766078();
            swift_bridgeObjectRetain();
            sub_248766078();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v1;
          case 0x190u:
            unint64_t v1 = 0xD00000000000001FLL;
            goto LABEL_48;
        }
      }
      goto LABEL_49;
    }
    if (a1 <= 0x2BBu)
    {
      if (a1 == 500)
      {
        unint64_t v1 = 0xD000000000000020;
        goto LABEL_48;
      }
      if (a1 != 600) {
        goto LABEL_49;
      }
    }
    else if (a1 != 700)
    {
      if (a1 == 800)
      {
        unint64_t v1 = 0xD000000000000018;
        goto LABEL_48;
      }
      if (a1 == 900)
      {
        unint64_t v1 = 0xD00000000000001ALL;
        goto LABEL_48;
      }
      goto LABEL_49;
    }
LABEL_45:
    unint64_t v1 = 0xD00000000000001ELL;
    goto LABEL_48;
  }
  if (a1 > 0x5DBu)
  {
    if (a1 <= 0x6A3u)
    {
      if (a1 == 1500)
      {
        unint64_t v1 = 0xD00000000000001FLL;
        goto LABEL_48;
      }
      if (a1 == 1600)
      {
        unint64_t v1 = 0xD00000000000002ALL;
        goto LABEL_48;
      }
    }
    else
    {
      switch(a1)
      {
        case 0x6A4u:
          unint64_t v1 = 0xD000000000000020;
          goto LABEL_48;
        case 0x708u:
          unint64_t v1 = 0xD00000000000001BLL;
          goto LABEL_48;
        case 0x76Cu:
          unint64_t v1 = 0xD000000000000011;
          goto LABEL_48;
      }
    }
    goto LABEL_49;
  }
  if (a1 <= 0x4AFu)
  {
    if (a1 == 1000)
    {
      unint64_t v1 = 0xD000000000000018;
      goto LABEL_48;
    }
    if (a1 == 1100)
    {
      unint64_t v1 = 0xD00000000000001FLL;
      goto LABEL_48;
    }
    goto LABEL_49;
  }
  switch(a1)
  {
    case 0x4B0u:
      unint64_t v1 = 0xD000000000000028;
      goto LABEL_48;
    case 0x514u:
      unint64_t v1 = 0xD00000000000001BLL;
      goto LABEL_48;
    case 0x578u:
      goto LABEL_45;
  }
LABEL_49:
  uint64_t result = sub_2487664B8();
  __break(1u);
  return result;
}

uint64_t Metrics.RequestJourney.Checkpoint.init(rawValue:)(uint64_t a1)
{
  return sub_24874BA70(a1, (uint64_t (*)(void))sub_24874CE34);
}

uint64_t sub_24874B75C@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_24874CE34(*a1);
  *(_WORD *)a2 = result;
  *(unsigned char *)(a2 + 2) = BYTE2(result) & 1;
  return result;
}

uint64_t sub_24874B790()
{
  return Metrics.RequestJourney.Checkpoint.description.getter(*v0);
}

uint64_t Metrics.ResponseJourney.Checkpoint.description.getter(unsigned __int16 a1)
{
  if (a1 > 0x2BBu)
  {
    if (a1 <= 0x3E7u)
    {
      switch(a1)
      {
        case 0x2BCu:
          unint64_t v1 = 0xD000000000000020;
          goto LABEL_34;
        case 0x320u:
          unint64_t v1 = 0xD000000000000017;
          goto LABEL_34;
        case 0x384u:
          unint64_t v1 = 0xD000000000000019;
          goto LABEL_34;
      }
    }
    else if (a1 > 0x4AFu)
    {
      if (a1 == 1200)
      {
        unint64_t v1 = 0xD000000000000028;
        goto LABEL_34;
      }
      if (a1 == 1300)
      {
        unint64_t v1 = 0xD000000000000019;
        goto LABEL_34;
      }
    }
    else
    {
      if (a1 == 1000)
      {
        unint64_t v1 = 0xD000000000000013;
        goto LABEL_34;
      }
      if (a1 == 1100)
      {
        unint64_t v1 = 0xD000000000000012;
        goto LABEL_34;
      }
    }
  }
  else if (a1 <= 0x12Bu)
  {
    switch(a1)
    {
      case 0u:
        unint64_t v1 = 0x6C616974696E69;
        goto LABEL_34;
      case 0x64u:
        unint64_t v1 = 0xD000000000000017;
        goto LABEL_34;
      case 0xC8u:
        goto LABEL_27;
    }
  }
  else if (a1 > 0x1F3u)
  {
    if (a1 == 500)
    {
      unint64_t v1 = 0xD00000000000001BLL;
      goto LABEL_34;
    }
    if (a1 == 600)
    {
      unint64_t v1 = 0xD000000000000027;
      goto LABEL_34;
    }
  }
  else
  {
    if (a1 == 300)
    {
      unint64_t v1 = 0xD000000000000029;
LABEL_34:
      sub_248766478();
      sub_248766078();
      swift_bridgeObjectRelease();
      sub_248766078();
      swift_bridgeObjectRetain();
      sub_248766078();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v1;
    }
    if (a1 == 400)
    {
LABEL_27:
      unint64_t v1 = 0xD000000000000016;
      goto LABEL_34;
    }
  }
  uint64_t result = sub_2487664B8();
  __break(1u);
  return result;
}

uint64_t Metrics.ResponseJourney.Checkpoint.init(rawValue:)(uint64_t a1)
{
  return sub_24874BA70(a1, (uint64_t (*)(void))sub_24874CF48);
}

uint64_t sub_24874BA70(uint64_t a1, uint64_t (*a2)(void))
{
  return a2() & 0x1FFFF;
}

uint64_t sub_24874BA98@<X0>(unsigned __int16 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_24874CF48(*a1);
  *(_WORD *)a2 = result;
  *(unsigned char *)(a2 + 2) = BYTE2(result) & 1;
  return result;
}

uint64_t sub_24874BACC()
{
  return Metrics.ResponseJourney.Checkpoint.description.getter(*v0);
}

uint64_t Metrics.ResponseJourney.EntryPoint.description.getter(__int16 a1)
{
  switch(a1)
  {
    case 0:
      unint64_t v1 = 0x6E776F6E6B6E75;
      goto LABEL_7;
    case 2:
      unint64_t v1 = 0xD000000000000014;
LABEL_7:
      sub_248766478();
      sub_248766078();
      swift_bridgeObjectRelease();
      sub_248766078();
      swift_bridgeObjectRetain();
      sub_248766078();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v1;
    case 1:
      unint64_t v1 = 0xD000000000000012;
      goto LABEL_7;
  }
  uint64_t result = sub_2487664B8();
  __break(1u);
  return result;
}

uint64_t Metrics.ResponseJourney.EntryPoint.init(rawValue:)(unsigned __int16 a1)
{
  int v1 = a1;
  if (a1)
  {
    if (a1 == 2) {
      int v2 = 2;
    }
    else {
      int v2 = 0;
    }
    int v3 = a1 != 2;
    if (a1 == 1) {
      int v1 = 1;
    }
    else {
      int v1 = v2;
    }
    if (a1 == 1) {
      int v3 = 0;
    }
  }
  else
  {
    int v3 = 0;
  }
  return v1 | (v3 << 16);
}

unsigned __int16 *sub_24874BC58@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2 = *result;
  BOOL v3 = v2 > 2;
  if (v2 > 2) {
    LOWORD(v2) = 0;
  }
  *(_WORD *)a2 = v2;
  *(unsigned char *)(a2 + 2) = v3;
  return result;
}

uint64_t sub_24874BC74()
{
  return Metrics.ResponseJourney.EntryPoint.description.getter(*v0);
}

id sub_24874BC7C()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F202B8]), sel_init);
  qword_2693243A0 = (uint64_t)result;
  return result;
}

void sub_24874BCB0()
{
  if (qword_269324120 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_2693243A0;
  id v1 = objc_allocWithZone(MEMORY[0x263F202B0]);
  id v2 = v0;
  id v3 = objc_msgSend(v1, sel_initWithTransport_, v2);

  qword_2693243A8 = (uint64_t)v3;
}

uint64_t sub_24874BD40(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269324418);
    uint64_t v2 = sub_248766338();
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
    sub_248749DB0(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_248749DA0(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_248749DA0(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_248749DA0(v36, v37);
    sub_248749DA0(v37, &v33);
    uint64_t result = sub_248766288();
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
    uint64_t result = (uint64_t)sub_248749DA0(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_24874E228();
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

unint64_t sub_24874C108()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269324410);
  uint64_t inited = swift_initStackObject();
  uint64_t v2 = inited;
  *(_OWORD *)(inited + 16) = xmmword_2487674F0;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x8000000248769670;
  uint64_t v3 = MEMORY[0x263F8E4F0];
  *(_WORD *)(inited + 48) = *(_WORD *)(v0 + 32);
  *(void *)(inited + 72) = v3;
  *(void *)(inited + 80) = 0xD000000000000016;
  *(void *)(inited + 88) = 0x8000000248768820;
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = MEMORY[0x263F8D310];
  if (!v5) {
    uint64_t v4 = 0x6E776F6E6B6E55;
  }
  unint64_t v7 = 0xE700000000000000;
  if (v5) {
    unint64_t v7 = *(void *)(v0 + 48);
  }
  *(void *)(inited + 96) = v4;
  *(void *)(inited + 104) = v7;
  *(void *)(inited + 120) = v6;
  strcpy((char *)(inited + 128), "questionTopic");
  *(_WORD *)(inited + 142) = -4864;
  int64_t v8 = (void *)(*(void *)(v0 + 56) + OBJC_IVAR___ATQuestionTopic_rawValue);
  uint64_t v9 = v8[1];
  *(void *)(inited + 144) = *v8;
  *(void *)(inited + 152) = v9;
  *(void *)(inited + 168) = v6;
  strcpy((char *)(inited + 176), "checkpointV2");
  *(unsigned char *)(inited + 189) = 0;
  *(_WORD *)(inited + 190) = -5120;
  uint64_t v10 = *(void *)(v0 + 88);
  unint64_t v11 = __swift_project_boxed_opaque_existential_1((void *)(v0 + 64), v10);
  uint64_t v12 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v14);
  *(void *)(v2 + 216) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2487660A8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
  return sub_24874652C(v2);
}

uint64_t sub_24874C340()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_0(v0 + 64);

  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t sub_24874C390()
{
  return sub_24874C430(104);
}

unint64_t sub_24874C398()
{
  unint64_t v1 = sub_24874C108();
  __int16 v2 = *(_WORD *)(v0 + 104);
  uint64_t v7 = MEMORY[0x263F8E4F0];
  LOWORD(v6) = v2;
  sub_248749DA0(&v6, v5);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_248748B84(v5, 0x696F507972746E65, 0xEA0000000000746ELL, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_24874C428()
{
  return sub_24874C430(106);
}

uint64_t sub_24874C430(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_0(v1 + 64);

  return MEMORY[0x270FA0228](v1, a1, 7);
}

unint64_t sub_24874C48C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269324410);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2487674F0;
  *(void *)(inited + 32) = 0xD000000000000011;
  *(void *)(inited + 40) = 0x8000000248769750;
  uint64_t v3 = (int *)type metadata accessor for RequestSendEvent(0);
  uint64_t v4 = sub_248765F08();
  uint64_t v5 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v4;
  *(void *)(inited + 56) = v6;
  *(void *)(inited + 72) = v5;
  *(void *)(inited + 80) = 0xD000000000000016;
  *(void *)(inited + 88) = 0x8000000248768820;
  uint64_t v7 = (uint64_t *)(v0 + v3[6]);
  uint64_t v9 = *v7;
  unint64_t v8 = v7[1];
  uint64_t v10 = 0x6E776F6E6B6E55;
  if (v8) {
    uint64_t v10 = v9;
  }
  unint64_t v11 = 0xE700000000000000;
  if (v8) {
    unint64_t v11 = v8;
  }
  *(void *)(inited + 96) = v10;
  *(void *)(inited + 104) = v11;
  *(void *)(inited + 120) = v5;
  *(void *)(inited + 128) = 0xD000000000000010;
  *(void *)(inited + 136) = 0x8000000248769770;
  uint64_t v12 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 144) = *(unsigned char *)(v0 + v3[7]);
  *(void *)(inited + 168) = v12;
  strcpy((char *)(inited + 176), "recipientGroup");
  *(unsigned char *)(inited + 191) = -18;
  __int16 v13 = *(_WORD *)(v0 + v3[10]);
  *(void *)(inited + 216) = MEMORY[0x263F8E4F0];
  *(_WORD *)(inited + 192) = v13;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_24874652C(inited);
  int64_t v15 = (uint64_t *)(v1 + v3[8]);
  uint64_t v16 = v15[1];
  if (v16)
  {
    uint64_t v17 = *v15;
    uint64_t v26 = v5;
    *(void *)&long long v25 = v17;
    *((void *)&v25 + 1) = v16;
    sub_248749DA0(&v25, v24);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_248748B84(v24, 0x6D6F44726F727265, 0xEB000000006E6961, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  uint64_t v19 = (uint64_t *)(v1 + v3[9]);
  uint64_t v20 = v19[1];
  if (v20)
  {
    uint64_t v21 = *v19;
    uint64_t v26 = v5;
    *(void *)&long long v25 = v21;
    *((void *)&v25 + 1) = v20;
    sub_248749DA0(&v25, v24);
    swift_bridgeObjectRetain();
    char v22 = swift_isUniquelyReferenced_nonNull_native();
    sub_248748B84(v24, 0x656449726F727265, 0xEF7265696669746ELL, v22);
    swift_bridgeObjectRelease();
  }
  return v14;
}

unint64_t sub_24874C6EC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269324410);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_248767500;
  *(void *)(inited + 32) = 0xD000000000000011;
  *(void *)(inited + 40) = 0x8000000248769750;
  __int16 v2 = (int *)type metadata accessor for ResponseSendEvent(0);
  uint64_t v3 = sub_248765F08();
  uint64_t v4 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 56) = v5;
  *(void *)(inited + 72) = v4;
  *(void *)(inited + 80) = 0xD000000000000016;
  *(void *)(inited + 88) = 0x8000000248768820;
  uint64_t v6 = (uint64_t *)(v0 + v2[6]);
  uint64_t v8 = *v6;
  unint64_t v7 = v6[1];
  uint64_t v9 = 0x6E776F6E6B6E55;
  if (v7) {
    uint64_t v9 = v8;
  }
  unint64_t v10 = 0xE700000000000000;
  if (v7) {
    unint64_t v10 = v7;
  }
  *(void *)(inited + 96) = v9;
  *(void *)(inited + 104) = v10;
  *(void *)(inited + 120) = v4;
  *(void *)(inited + 128) = 0xD000000000000010;
  *(void *)(inited + 136) = 0x8000000248769770;
  uint64_t v11 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 144) = *(unsigned char *)(v0 + v2[7]);
  *(void *)(inited + 168) = v11;
  *(void *)(inited + 176) = 0xD000000000000016;
  *(void *)(inited + 184) = 0x8000000248769790;
  uint64_t v12 = MEMORY[0x263F8E4F0];
  *(_WORD *)(inited + 192) = *(_WORD *)(v0 + v2[8]);
  *(void *)(inited + 216) = v12;
  *(void *)(inited + 224) = 0x694B726577736E61;
  *(void *)(inited + 232) = 0xEA0000000000646ELL;
  *(_WORD *)(inited + 240) = *(_WORD *)(v0 + v2[9]);
  *(void *)(inited + 264) = v12;
  strcpy((char *)(inited + 272), "responseCount");
  *(_WORD *)(inited + 286) = -4864;
  uint64_t v13 = *(void *)(v0 + v2[10]);
  *(void *)(inited + 312) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 288) = v13;
  swift_bridgeObjectRetain();
  return sub_24874652C(inited);
}

void sub_24874C8A8(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = a2(v3);
  sub_24874BD40(v4);
  swift_bridgeObjectRelease();
  id v5 = objc_allocWithZone(MEMORY[0x263F202A8]);
  uint64_t v6 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  unint64_t v7 = (void *)sub_248765FB8();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v5, sel_initWithEventName_eventCategory_initData_, v6, 0, v7);

  if (qword_269324128 != -1) {
    swift_once();
  }
  objc_msgSend((id)qword_2693243A8, sel_sendEvent_, v8);
}

uint64_t _s9AskToCore7MetricsO11SendJourneyO3log22clientBundleIdentifier13questionTopic10checkpointySSSg_0aB010ATQuestionC0L0CAC07RequestF0O10CheckpointOtFZ_0(uint64_t a1, uint64_t a2, void *a3, unsigned __int16 a4)
{
  if (qword_269324118 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_248765FA8();
  __swift_project_value_buffer(v8, (uint64_t)qword_269327188);
  uint64_t v9 = sub_248765F88();
  os_log_type_t v10 = sub_2487661D8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v20[0] = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v13 = Metrics.RequestJourney.Checkpoint.description.getter(a4);
    *(void *)&v19[0] = sub_2487475D8(v13, v14, v20);
    sub_248766258();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_248743000, v9, v10, "Logging request journey metric with checkpoint %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v12, -1, -1);
    MEMORY[0x24C57E660](v11, -1, -1);
  }

  v20[3] = (uint64_t)&type metadata for Metrics.RequestJourney.Checkpoint;
  v20[4] = sub_24874E230();
  LOWORD(v20[0]) = a4;
  type metadata accessor for RequestJourneyEvent();
  uint64_t inited = swift_initStackObject();
  sub_24874E284((uint64_t)v20, (uint64_t)v19);
  *(_WORD *)(inited + 32) = 1;
  *(void *)(inited + 16) = 0xD000000000000022;
  *(void *)(inited + 24) = 0x80000002487697B0;
  *(void *)(inited + 40) = a1;
  *(void *)(inited + 48) = a2;
  swift_bridgeObjectRetain();
  id v16 = a3;
  swift_bridgeObjectRelease();
  *(void *)(inited + 56) = v16;
  sub_24874CCDC(v19, inited + 64);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
  uint64_t v17 = swift_retain();
  sub_24874C8A8(v17, (uint64_t (*)(uint64_t))sub_24874C108);
  swift_release();
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return __swift_destroy_boxed_opaque_existential_0(inited + 64);
}

uint64_t type metadata accessor for ResponseJourneyEvent()
{
  return self;
}

unint64_t sub_24874CC88()
{
  unint64_t result = qword_2693243B0;
  if (!qword_2693243B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693243B0);
  }
  return result;
}

uint64_t sub_24874CCDC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for RequestSendEvent(uint64_t a1)
{
  return sub_24874CD34(a1, (uint64_t *)&unk_269324400);
}

uint64_t type metadata accessor for ResponseSendEvent(uint64_t a1)
{
  return sub_24874CD34(a1, (uint64_t *)&unk_2693243F0);
}

uint64_t sub_24874CD34(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24874CD6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24874CDD4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24874CE34(unsigned __int16 a1)
{
  int v1 = a1;
  if (a1 > 0x3E7u)
  {
    if (a1 > 0x5DBu)
    {
      if (a1 <= 0x6A3u)
      {
        if (a1 != 1500 && a1 != 1600) {
          goto LABEL_37;
        }
      }
      else if (a1 != 1700 && a1 != 1800 && a1 != 1900)
      {
        goto LABEL_37;
      }
    }
    else if (a1 <= 0x4AFu)
    {
      if (a1 != 1000 && a1 != 1100) {
        goto LABEL_37;
      }
    }
    else if (a1 != 1200 && a1 != 1300 && a1 != 1400)
    {
      goto LABEL_37;
    }
  }
  else if (a1 > 0x1F3u)
  {
    if (a1 <= 0x2BBu)
    {
      if (a1 != 500 && a1 != 600) {
        goto LABEL_37;
      }
    }
    else if (a1 != 700 && a1 != 800 && a1 != 900)
    {
      goto LABEL_37;
    }
  }
  else if (a1 <= 0xC7u)
  {
    if (a1 && a1 != 100) {
      goto LABEL_37;
    }
  }
  else if (a1 != 200 && a1 != 300 && a1 != 400)
  {
LABEL_37:
    int v1 = 0;
    int v2 = 1;
    return v1 | (v2 << 16);
  }
  int v2 = 0;
  return v1 | (v2 << 16);
}

uint64_t sub_24874CF48(unsigned __int16 a1)
{
  int v1 = a1;
  if (a1 > 0x2BBu)
  {
    if (a1 <= 0x3E7u)
    {
      if (a1 != 700 && a1 != 800 && a1 != 900) {
        goto LABEL_27;
      }
    }
    else if (a1 > 0x4AFu)
    {
      if (a1 != 1200 && a1 != 1300) {
        goto LABEL_27;
      }
    }
    else if (a1 != 1000 && a1 != 1100)
    {
      goto LABEL_27;
    }
  }
  else if (a1 <= 0x12Bu)
  {
    if (a1 && a1 != 100 && a1 != 200) {
      goto LABEL_27;
    }
  }
  else if (a1 > 0x1F3u)
  {
    if (a1 != 500 && a1 != 600) {
      goto LABEL_27;
    }
  }
  else if (a1 != 300 && a1 != 400)
  {
LABEL_27:
    int v1 = 0;
    int v2 = 1;
    return v1 | (v2 << 16);
  }
  int v2 = 0;
  return v1 | (v2 << 16);
}

unint64_t sub_24874D018()
{
  unint64_t result = qword_2693243B8;
  if (!qword_2693243B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693243B8);
  }
  return result;
}

uint64_t sub_24874D06C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24874D1C4(a1, a2, a3, (uint64_t (*)(void))sub_24874D098, (uint64_t (*)(void))sub_24874D0EC);
}

unint64_t sub_24874D098()
{
  unint64_t result = qword_2693243C0;
  if (!qword_2693243C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693243C0);
  }
  return result;
}

unint64_t sub_24874D0EC()
{
  unint64_t result = qword_2693243C8;
  if (!qword_2693243C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693243C8);
  }
  return result;
}

unint64_t sub_24874D144()
{
  unint64_t result = qword_2693243D0;
  if (!qword_2693243D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693243D0);
  }
  return result;
}

uint64_t sub_24874D198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24874D1C4(a1, a2, a3, (uint64_t (*)(void))sub_24874D200, (uint64_t (*)(void))sub_24874D254);
}

uint64_t sub_24874D1C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24874D200()
{
  unint64_t result = qword_2693243D8;
  if (!qword_2693243D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693243D8);
  }
  return result;
}

unint64_t sub_24874D254()
{
  unint64_t result = qword_2693243E0;
  if (!qword_2693243E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693243E0);
  }
  return result;
}

unint64_t sub_24874D2AC()
{
  unint64_t result = qword_2693243E8;
  if (!qword_2693243E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693243E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics()
{
  return &type metadata for Metrics;
}

ValueMetadata *type metadata accessor for Metrics.SendJourney()
{
  return &type metadata for Metrics.SendJourney;
}

ValueMetadata *type metadata accessor for Metrics.RequestJourney()
{
  return &type metadata for Metrics.RequestJourney;
}

ValueMetadata *type metadata accessor for Metrics.ResponseJourney()
{
  return &type metadata for Metrics.ResponseJourney;
}

ValueMetadata *type metadata accessor for Metrics.RequestSend()
{
  return &type metadata for Metrics.RequestSend;
}

ValueMetadata *type metadata accessor for Metrics.ResponseSend()
{
  return &type metadata for Metrics.ResponseSend;
}

ValueMetadata *type metadata accessor for Metrics.RequestJourney.Checkpoint()
{
  return &type metadata for Metrics.RequestJourney.Checkpoint;
}

ValueMetadata *type metadata accessor for Metrics.ResponseJourney.Checkpoint()
{
  return &type metadata for Metrics.ResponseJourney.Checkpoint;
}

ValueMetadata *type metadata accessor for Metrics.ResponseJourney.EntryPoint()
{
  return &type metadata for Metrics.ResponseJourney.EntryPoint;
}

uint64_t type metadata accessor for JourneyEvent()
{
  return self;
}

uint64_t type metadata accessor for RequestJourneyEvent()
{
  return self;
}

void *sub_24874D3D8(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    os_log_type_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_248765F58();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    int64_t v15 = (void *)((char *)v4 + v13);
    id v16 = (void *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    void *v15 = *v16;
    v15[1] = v17;
    *((unsigned char *)v4 + v14) = *((unsigned char *)a2 + v14);
    uint64_t v18 = a3[9];
    *(_WORD *)((char *)v4 + a3[8]) = *(_WORD *)((char *)a2 + a3[8]);
    *(_WORD *)((char *)v4 + v18) = *(_WORD *)((char *)a2 + v18);
    *(void *)((char *)v4 + a3[10]) = *(void *)((char *)a2 + a3[10]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24874D510(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_248765F58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

void *sub_24874D5A0(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_248765F58();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  int64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *((unsigned char *)a1 + v13) = *((unsigned char *)a2 + v13);
  uint64_t v17 = a3[9];
  *(_WORD *)((char *)a1 + a3[8]) = *(_WORD *)((char *)a2 + a3[8]);
  *(_WORD *)((char *)a1 + v17) = *(_WORD *)((char *)a2 + v17);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_24874D688(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_248765F58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *(_WORD *)((char *)a1 + a3[8]) = *(_WORD *)((char *)a2 + a3[8]);
  *(_WORD *)((char *)a1 + a3[9]) = *(_WORD *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  return a1;
}

_OWORD *sub_24874D788(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_248765F58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  uint64_t v11 = a3[9];
  *(_WORD *)((char *)a1 + a3[8]) = *(_WORD *)((char *)a2 + a3[8]);
  *(_WORD *)((char *)a1 + v11) = *(_WORD *)((char *)a2 + v11);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  return a1;
}

void *sub_24874D848(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_248765F58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *(_WORD *)((char *)a1 + v16) = *(_WORD *)((char *)a2 + v16);
  uint64_t v17 = a3[10];
  *(_WORD *)((char *)a1 + a3[9]) = *(_WORD *)((char *)a2 + a3[9]);
  *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);
  return a1;
}

uint64_t sub_24874D920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t sub_24874D938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t sub_24874D950()
{
  return sub_24874E120();
}

void *sub_24874D970(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_248765F58();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (void *)((char *)v4 + v13);
    uint64_t v16 = (void *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    void *v15 = *v16;
    v15[1] = v17;
    *((unsigned char *)v4 + v14) = *((unsigned char *)a2 + v14);
    uint64_t v18 = a3[8];
    uint64_t v19 = a3[9];
    uint64_t v20 = (void *)((char *)v4 + v18);
    uint64_t v21 = (void *)((char *)a2 + v18);
    uint64_t v22 = v21[1];
    *uint64_t v20 = *v21;
    v20[1] = v22;
    char v23 = (void *)((char *)v4 + v19);
    unint64_t v24 = (void *)((char *)a2 + v19);
    uint64_t v25 = v24[1];
    *char v23 = *v24;
    v23[1] = v25;
    *(_WORD *)((char *)v4 + a3[10]) = *(_WORD *)((char *)a2 + a3[10]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24874DAC8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_248765F58();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_24874DB78(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_248765F58();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  *((unsigned char *)a1 + v13) = *((unsigned char *)a2 + v13);
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)((char *)a1 + v17);
  uint64_t v20 = (void *)((char *)a2 + v17);
  uint64_t v21 = v20[1];
  void *v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = (void *)((char *)a1 + v18);
  char v23 = (void *)((char *)a2 + v18);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  *(_WORD *)((char *)a1 + a3[10]) = *(_WORD *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_24874DC80(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_248765F58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[9];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_WORD *)((char *)a1 + a3[10]) = *(_WORD *)((char *)a2 + a3[10]);
  return a1;
}

_OWORD *sub_24874DDC0(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_248765F58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
  uint64_t v11 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  *(_WORD *)((char *)a1 + a3[10]) = *(_WORD *)((char *)a2 + a3[10]);
  return a1;
}

void *sub_24874DE80(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_248765F58();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[9];
  uint64_t v22 = (void *)((char *)a1 + v21);
  char v23 = (void *)((char *)a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  *(_WORD *)((char *)a1 + a3[10]) = *(_WORD *)((char *)a2 + a3[10]);
  return a1;
}

uint64_t sub_24874DF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24874DF90);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_248765F58();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24874E044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24874E058);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_248765F58();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24874E104()
{
  return sub_24874E120();
}

uint64_t sub_24874E120()
{
  uint64_t result = sub_248765F58();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
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

uint64_t sub_24874E228()
{
  return swift_release();
}

unint64_t sub_24874E230()
{
  unint64_t result = qword_269324420;
  if (!qword_269324420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324420);
  }
  return result;
}

uint64_t sub_24874E284(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24874E2F4(char a1)
{
  unint64_t result = 0x6E6F6973726576;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x6D6146726F467369;
      break;
    case 5:
      unint64_t result = 0x476567617373656DLL;
      break;
    case 6:
      unint64_t result = 0x6E6F697473657571;
      break;
    case 7:
      unint64_t result = 0x65736E6F70736572;
      break;
    case 8:
      unint64_t result = 0x6F707365526C6C61;
      break;
    case 9:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24874E454(char a1)
{
  unint64_t result = 0x6E6F6973726576;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x6D6146726F467369;
      break;
    case 5:
      unint64_t result = 0x476567617373656DLL;
      break;
    case 6:
      unint64_t result = 0x6E6F697473657571;
      break;
    case 7:
      unint64_t result = 0x65736E6F70736572;
      break;
    case 8:
      unint64_t result = 0x6F707365526C6C61;
      break;
    case 9:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24874E5B4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_24874E2F4(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_24874E2F4(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_248766498();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24874E640()
{
  char v1 = *v0;
  sub_248766528();
  sub_24874E2F4(v1);
  sub_248766068();
  swift_bridgeObjectRelease();
  return sub_248766588();
}

uint64_t sub_24874E6A4()
{
  sub_24874E2F4(*v0);
  sub_248766068();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24874E6F8()
{
  char v1 = *v0;
  sub_248766528();
  sub_24874E2F4(v1);
  sub_248766068();
  swift_bridgeObjectRelease();
  return sub_248766588();
}

uint64_t sub_24874E758@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2487519F8();
  *a1 = result;
  return result;
}

unint64_t sub_24874E788@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_24874E2F4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_24874E7B4()
{
  return sub_24874E454(*v0);
}

uint64_t sub_24874E7BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2487519F8();
  *a1 = result;
  return result;
}

uint64_t sub_24874E7E4()
{
  return 0;
}

void sub_24874E7F0(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_24874E7FC(uint64_t a1)
{
  unint64_t v2 = sub_2487520CC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24874E838(uint64_t a1)
{
  unint64_t v2 = sub_2487520CC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t static ATPayload.currentVersion.getter()
{
  return 3;
}

uint64_t ATPayload.version.getter()
{
  return *(unsigned __int16 *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_version);
}

uint64_t ATPayload.clientBundleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPayload.clientAdamIdentifier.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier);
}

uint64_t ATPayload.messageGUID.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATPayload.rawRecipientGroup.getter()
{
  return *(unsigned __int16 *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup);
}

uint64_t ATPayload.isForFamily.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily);
}

id ATPayload.question.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
}

void *ATPayload.response.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_response);
  id v2 = v1;
  return v1;
}

uint64_t ATPayload.allResponses.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t ATPayload.dictionaryRepresentation.getter()
{
  return sub_24874ED70();
}

unint64_t sub_24874ED70()
{
  swift_getObjectType();
  uint64_t v18 = v0;
  unint64_t v2 = sub_24874652C(MEMORY[0x263F8EE78]);
  __int16 v3 = *(_WORD *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_version);
  uint64_t v17 = MEMORY[0x263F8E4F0];
  LOWORD(v16) = v3;
  sub_248749DA0(&v16, v15);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_248748B84(v15, 0x6E6F6973726576, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  sub_248765D78();
  swift_allocObject();
  uint64_t v5 = sub_248765D68();
  sub_2487526DC(&qword_2693244D0, v6, (void (*)(uint64_t))type metadata accessor for ATPayload);
  unint64_t v7 = v5;
  uint64_t v8 = sub_248765D58();
  if (v1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_248752810();
    swift_allocError();
    *(void *)uint64_t v10 = v1;
    *(void *)(v10 + 8) = 0;
    *(unsigned char *)(v10 + 16) = 1;
    swift_willThrow();
  }
  else
  {
    uint64_t v11 = v8;
    unint64_t v12 = v9;
    uint64_t v17 = MEMORY[0x263F06F78];
    *(void *)&long long v16 = v8;
    *((void *)&v16 + 1) = v9;
    sub_248749DA0(&v16, v15);
    sub_24874966C(v11, v12);
    char v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_248748B84(v15, 1635017060, 0xE400000000000000, v13);
    unint64_t v7 = v2;
    swift_bridgeObjectRelease();
    sub_248749614(v11, v12);
    swift_release();
  }
  return v7;
}

NSObject *ATPayload.__allocating_init(dictionaryRepresentation:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  swift_getObjectType();
  unint64_t v4 = sub_24874F04C(a1);
  swift_deallocPartialClassInstance();
  return v4;
}

NSObject *ATPayload.init(dictionaryRepresentation:)(uint64_t a1)
{
  swift_getObjectType();
  unint64_t v2 = sub_24874F04C(a1);
  swift_deallocPartialClassInstance();
  return v2;
}

NSObject *sub_24874F04C(uint64_t a1)
{
  if (!*(void *)(a1 + 16)
    || (uint64_t v4 = v2, v5 = v1, v6 = sub_248747D10(0x6E6F6973726576, 0xE700000000000000), (v7 & 1) == 0)
    || (sub_248749DB0(*(void *)(a1 + 56) + 32 * v6, (uint64_t)v51), !swift_dynamicCast()))
  {
    if (qword_269324100 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_248765FA8();
    __swift_project_value_buffer(v18, (uint64_t)qword_269327140);
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_248765F88();
    os_log_type_t v20 = sub_2487661C8();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      v51[0] = v52;
      *(_DWORD *)uint64_t v21 = 136315650;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269324200);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269324530);
      uint64_t v22 = sub_248766058();
      sub_2487475D8(v22, v23, v51);
      sub_248766258();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      sub_2487475D8(0x6E6F6973726576, 0xE700000000000000, v51);
      sub_248766258();
      *(_WORD *)(v21 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_248765FD8();
      unint64_t v26 = v25;
      swift_bridgeObjectRelease();
      sub_2487475D8(v24, v26, v51);
      sub_248766258();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_248743000, v19, v20, "Failed %s init. Could not find required value for key \"%s\" in dictionary: %s", (uint8_t *)v21, 0x20u);
      uint64_t v27 = v52;
      swift_arrayDestroy();
      MEMORY[0x24C57E660](v27, -1, -1);
      MEMORY[0x24C57E660](v21, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_248752810();
    swift_allocError();
    long long v29 = xmmword_248767990;
    goto LABEL_15;
  }
  if (qword_269324100 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_248765FA8();
  __swift_project_value_buffer(v8, (uint64_t)qword_269327140);
  swift_bridgeObjectRetain_n();
  unint64_t v9 = sub_248765F88();
  os_log_type_t v10 = sub_2487661D8();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t type = v10;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    v51[0] = v47;
    *(_DWORD *)uint64_t v11 = 136315650;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269324200);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269324530);
    uint64_t v52 = v2;
    uint64_t v12 = sub_248766058();
    sub_2487475D8(v12, v13, v51);
    sub_248766258();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 512;
    sub_248766258();
    *(_WORD *)(v11 + 16) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_248765FD8();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    uint64_t v17 = v14;
    uint64_t v4 = v52;
    uint64_t v49 = sub_2487475D8(v17, v16, v51);
    sub_248766258();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_248743000, v9, type, "Creating %s with dictionary. Had version %hd. dictionary: %s", (uint8_t *)v11, 0x1Au);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v47, -1, -1);
    MEMORY[0x24C57E660](v11, -1, -1);

    if (!*(void *)(a1 + 16)) {
      goto LABEL_22;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!*(void *)(a1 + 16)) {
      goto LABEL_22;
    }
  }
  unint64_t v31 = sub_248747D10(1635017060, 0xE400000000000000);
  if ((v32 & 1) == 0
    || (sub_248749DB0(*(void *)(a1 + 56) + 32 * v31, (uint64_t)v51), !swift_dynamicCast()))
  {
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_248765F88();
    os_log_type_t v36 = sub_2487661C8();
    if (os_log_type_enabled(v19, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      v51[0] = v52;
      *(_DWORD *)uint64_t v37 = 136315650;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269324200);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269324530);
      uint64_t v38 = sub_248766058();
      sub_2487475D8(v38, v39, v51);
      sub_248766258();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      sub_2487475D8(1635017060, 0xE400000000000000, v51);
      sub_248766258();
      *(_WORD *)(v37 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_248765FD8();
      unint64_t v42 = v41;
      swift_bridgeObjectRelease();
      sub_2487475D8(v40, v42, v51);
      sub_248766258();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_248743000, v19, v36, "Failed %s init. Could not find required value for key \"%s\" in dictionary: %s", (uint8_t *)v37, 0x20u);
      uint64_t v43 = v52;
      swift_arrayDestroy();
      MEMORY[0x24C57E660](v43, -1, -1);
      MEMORY[0x24C57E660](v37, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_248752810();
    swift_allocError();
    long long v29 = xmmword_248767980;
LABEL_15:
    *(_OWORD *)uint64_t v28 = v29;
    *(unsigned char *)(v28 + 16) = 0;
    swift_willThrow();
    return v19;
  }
  swift_bridgeObjectRelease();
  sub_248765D48();
  swift_allocObject();
  uint64_t v33 = sub_248765D38();
  sub_2487526DC(&qword_269324208, v34, (void (*)(uint64_t))type metadata accessor for ATPayload);
  uint64_t v19 = v33;
  sub_248765D28();
  if (v4)
  {
    sub_248752810();
    swift_allocError();
    *(void *)uint64_t v35 = v4;
    *(void *)(v35 + 8) = 0;
    *(unsigned char *)(v35 + 16) = 2;
    swift_willThrow();
    swift_release();
    sub_248749614(v49, v50);
  }
  else
  {
    uint64_t v44 = (void *)v51[0];
    id v45 = objc_allocWithZone(v5);
    os_log_type_t v46 = v44;
    uint64_t v19 = sub_24874FD5C(v46);
    swift_release();
    sub_248749614(v49, v50);
  }
  return v19;
}

id ATPayload.__allocating_init(clientBundleIdentifier:clientAdamIdentifier:messageGUID:rawRecipientGroup:isForFamily:question:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, __int16 a7, char a8, uint64_t a9)
{
  return sub_248751A44(3, a1, a2, a3, a4 & 1, a5, a6, a7, a8, a9, 0, 0);
}

id ATPayload.__allocating_init(clientBundleIdentifier:clientAdamIdentifier:rawRecipientGroup:isForFamily:question:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, __int16 a5, char a6, uint64_t a7)
{
  char v13 = a4 & 1;
  uint64_t v14 = sub_248765F08();
  return sub_248751A44(3, a1, a2, a3, v13, v14, v15, a5, a6, a7, 0, 0);
}

id ATPayload.__allocating_init(originalPayload:newResponse:)(unsigned char *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return ATPayload.init(originalPayload:newResponse:)(a1, a2);
}

id ATPayload.init(originalPayload:newResponse:)(unsigned char *a1, void *a2)
{
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (*(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses]) {
    uint64_t v5 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses];
  }
  uint64_t v19 = v5;
  id v6 = v2;
  swift_bridgeObjectRetain();
  id v7 = a2;
  MEMORY[0x24C57DB30]();
  if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_248766148();
  }
  sub_248766158();
  sub_248766138();
  swift_getObjectType();

  uint64_t v8 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8];
  uint64_t v17 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier];
  uint64_t v18 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier];
  char v9 = a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8];
  uint64_t v10 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID];
  uint64_t v11 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID + 8];
  char v12 = a1[OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily];
  char v13 = *(void **)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_question];
  __int16 v14 = *(_WORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = sub_248751A44(3, v18, v8, v17, v9, v10, v11, v14, v12, (uint64_t)v13, (uint64_t)v7, v19);

  swift_deallocPartialClassInstance();
  return v15;
}

id sub_24874FD28(unsigned char *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_24874FD5C(a1);
}

id sub_24874FD5C(unsigned char *a1)
{
  swift_getObjectType();
  uint64_t v2 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8];
  uint64_t v17 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier];
  uint64_t v16 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier];
  char v15 = a1[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8];
  uint64_t v3 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID + 8];
  uint64_t v14 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID];
  char v4 = a1[OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily];
  uint64_t v5 = *(void **)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_question];
  id v6 = *(void **)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_response];
  uint64_t v7 = *(void *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses];
  __int16 v8 = *(_WORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup];
  __int16 v9 = *(_WORD *)&a1[OBJC_IVAR____TtC9AskToCore9ATPayload_version];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v10 = v5;
  id v11 = v6;
  swift_bridgeObjectRetain();
  id v12 = sub_248751A44(v9, v17, v2, v16, v15, v14, v3, v8, v4, (uint64_t)v10, (uint64_t)v6, v7);

  swift_deallocPartialClassInstance();
  return v12;
}

void *ATPayload.__allocating_init(from:)(void *a1)
{
  return sub_248751B6C(a1);
}

uint64_t ATPayload.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269324480);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  __int16 v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2487520CC();
  sub_2487665B8();
  LOBYTE(v11) = 0;
  sub_248766468();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_2487663F8();
    LOBYTE(v11) = 2;
    sub_248766418();
    LOBYTE(v11) = 5;
    sub_248766428();
    LOBYTE(v11) = 3;
    sub_248766468();
    LOBYTE(v11) = 4;
    sub_248766438();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
    HIBYTE(v10) = 6;
    type metadata accessor for ATQuestion();
    sub_2487526DC((unint64_t *)&unk_269324490, 255, (void (*)(uint64_t))type metadata accessor for ATQuestion);
    sub_248766458();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC9AskToCore9ATPayload_response);
    HIBYTE(v10) = 7;
    type metadata accessor for ATResponse();
    sub_2487526DC(&qword_2693247F0, 255, (void (*)(uint64_t))type metadata accessor for ATResponse);
    sub_248766408();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses);
    HIBYTE(v10) = 8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693244A0);
    sub_248752724(&qword_2693244A8, &qword_2693247F0);
    sub_248766408();
    LOWORD(v11) = 0;
    HIBYTE(v10) = 9;
    sub_248752168();
    sub_248766458();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t static ATPayload.supportsSecureCoding.getter()
{
  return 1;
}

id ATPayload.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ATPayload.init(coder:)(a1);
}

id ATPayload.init(coder:)(void *a1)
{
  swift_getObjectType();
  sub_248752368(0, &qword_2693244B8);
  uint64_t v3 = sub_248766208();
  if (v3)
  {
    char v4 = (void *)v3;
    uint64_t v5 = sub_248765EB8();
    unint64_t v7 = v6;
    id v8 = objc_allocWithZone(MEMORY[0x263F08928]);
    id v9 = sub_2487521BC();
    sub_248749614(v5, v7);
    sub_2487526DC(&qword_269324208, v13, (void (*)(uint64_t))type metadata accessor for ATPayload);
    sub_2487661F8();
    if (v15)
    {
      id v11 = objc_msgSend(v1, sel_initWithCopying_, v15);

      objc_msgSend(v9, sel_finishDecoding);
      return v11;
    }
    sub_2487661C8();
    sub_248752368(0, (unint64_t *)&unk_2693244C0);
    uint64_t v14 = (void *)sub_248766238();
    sub_248765F78();

    objc_msgSend(v9, sel_finishDecoding);
  }
  else
  {
    sub_2487661C8();
    sub_248752368(0, (unint64_t *)&unk_2693244C0);
    uint64_t v10 = (void *)sub_248766238();
    sub_248765F78();
  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall ATPayload.encode(with:)(NSCoder with)
{
  swift_getObjectType();
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  sub_2487526DC(&qword_2693244D0, v3, (void (*)(uint64_t))type metadata accessor for ATPayload);
  sub_2487661E8();
  objc_msgSend(v2, sel_finishEncoding);
  id v4 = objc_msgSend(v2, sel_encodedData);
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = (void *)sub_248766008();
    [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];
  }
  else
  {
    __break(1u);
  }
}

id ATPayload.copy(with:)@<X0>(void *a1@<X8>)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v4 = objc_allocWithZone(ObjectType);
  id result = sub_24874FD5C(v1);
  a1[3] = ObjectType;
  *a1 = result;
  return result;
}

uint64_t ATPayload.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  sub_2487522A0(a1, (uint64_t)v20);
  if (!v21)
  {
    sub_248752308((uint64_t)v20);
    goto LABEL_36;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_36:
    unsigned __int8 v17 = 0;
    return v17 & 1;
  }
  if (*(unsigned __int16 *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_version) != *(unsigned __int16 *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_version]) {
    goto LABEL_35;
  }
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8);
  uint64_t v5 = *(void *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8];
  if (v4)
  {
    if (!v5) {
      goto LABEL_35;
    }
    BOOL v6 = *(void *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier) == *(void *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier]
      && v4 == v5;
    if (!v6 && (sub_248766498() & 1) == 0) {
      goto LABEL_35;
    }
  }
  else if (v5)
  {
    goto LABEL_35;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8))
  {
    if ((v19[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8] & 1) == 0) {
      goto LABEL_35;
    }
  }
  else if ((v19[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8] & 1) != 0 {
         || *(void *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier) != *(void *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier])
  }
  {
    goto LABEL_35;
  }
  BOOL v7 = *(void *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID) == *(void *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID]
    && *(void *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID + 8) == *(void *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID
                                                                                               + 8];
  if (!v7 && (sub_248766498() & 1) == 0) {
    goto LABEL_35;
  }
  if (*(unsigned __int16 *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup) != *(unsigned __int16 *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup]) {
    goto LABEL_35;
  }
  if (*(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily) != v19[OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily]) {
    goto LABEL_35;
  }
  sub_248752368(0, &qword_2693244E0);
  id v8 = *(id *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_question];
  char v9 = sub_248766218();

  if ((v9 & 1) == 0) {
    goto LABEL_35;
  }
  uint64_t v10 = *(void **)(v2 + OBJC_IVAR____TtC9AskToCore9ATPayload_response);
  id v11 = *(void **)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_response];
  if (!v10)
  {
    if (!v11) {
      goto LABEL_32;
    }
LABEL_35:

    goto LABEL_36;
  }
  if (!v11) {
    goto LABEL_35;
  }
  type metadata accessor for ATResponse();
  id v12 = v11;
  id v13 = v10;
  char v14 = sub_248766218();

  if ((v14 & 1) == 0) {
    goto LABEL_35;
  }
LABEL_32:
  unint64_t v15 = *(void *)(v2 + OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses);
  uint64_t v16 = *(void *)&v19[OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses];
  if (!v15)
  {
    swift_bridgeObjectRetain();

    if (!v16)
    {
      unsigned __int8 v17 = 1;
      return v17 & 1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_36;
  }
  if (!v16) {
    goto LABEL_35;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  unsigned __int8 v17 = sub_2487515F8(v15, v16, (uint64_t (*)(void))type metadata accessor for ATResponse);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();

  return v17 & 1;
}

uint64_t ATPayload.hash.getter()
{
  uint64_t v1 = v0;
  sub_248766598();
  sub_248766558();
  if (*(void *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8))
  {
    sub_248766548();
    swift_bridgeObjectRetain();
    sub_248766068();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_248766548();
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8) == 1)
  {
    sub_248766548();
  }
  else
  {
    sub_248766548();
    sub_248766568();
  }
  swift_bridgeObjectRetain();
  sub_248766068();
  swift_bridgeObjectRelease();
  sub_248766558();
  sub_248766548();
  id v2 = *(id *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
  sub_248766228();

  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_response);
  sub_248766548();
  if (v3)
  {
    id v4 = v3;
    sub_248766228();
  }
  unint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses);
  sub_248766548();
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_2487518E0((uint64_t)v7, v5);
    swift_bridgeObjectRelease();
  }
  long long v11 = v7[2];
  long long v12 = v7[3];
  uint64_t v13 = v8;
  long long v9 = v7[0];
  long long v10 = v7[1];
  return sub_248766578();
}

uint64_t ATPayload.description.getter()
{
  uint64_t v1 = v0;
  sub_2487662A8();
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269324200);
  sub_248766058();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  sub_248766478();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  swift_bridgeObjectRetain();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  sub_248766478();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  swift_bridgeObjectRetain();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  sub_248766478();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  id v2 = *(id *)(v0 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
  id v3 = objc_msgSend(v2, sel_description);
  sub_248766018();

  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  if (*(void *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_response)) {
    ATResponse.description.getter();
  }
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  uint64_t v6 = type metadata accessor for ATResponse();
  swift_bridgeObjectRetain();
  MEMORY[0x24C57DB60](v5, v6);
  sub_248766078();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_248766078();
  return 0;
}

id ATPayload.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void ATPayload.init()()
{
}

id ATPayload.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_248751590@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = sub_248751B6C(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2487515BC(void *a1)
{
  return ATPayload.encode(to:)(a1);
}

id sub_2487515E0(unint64_t a1, uint64_t a2)
{
  return sub_2487515F8(a1, a2, (uint64_t (*)(void))type metadata accessor for ATAnswerChoice);
}

id sub_2487515F8(unint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a1;
  unint64_t v6 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_248766308();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_248766308();
    swift_bridgeObjectRelease();
    if (v7 == v31) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v7) = 0;
    return (id)(v7 & 1);
  }
  if (v7 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v7) {
    goto LABEL_38;
  }
  uint64_t v8 = v5 & 0xFFFFFFFFFFFFFF8;
  if (v5 < 0) {
    uint64_t v8 = v5;
  }
  if (!v6) {
    uint64_t v8 = (v5 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v10 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v11 = a2;
  }
  else {
    uint64_t v11 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v10 = v11;
  }
  if (v8 == v10)
  {
LABEL_38:
    LOBYTE(v7) = 1;
    return (id)(v7 & 1);
  }
  if ((v7 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v32 = v5 & 0xC000000000000001;
  if ((v5 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v5 + 32); ; id result = (id)MEMORY[0x24C57DD00](0, v5))
  {
    uint64_t v13 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v14 = (id)MEMORY[0x24C57DD00](0, a2);
LABEL_22:
    unint64_t v15 = v14;
    a3 = (uint64_t (*)(void))a3(0);
    char v16 = sub_248766218();

    if ((v16 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v17 = v7 - 1;
    if (v7 == 1) {
      return (id)(v7 & 1);
    }
    if (((a2 | v5) & 0xC000000000000001) != 0)
    {
      uint64_t v18 = 0;
      unint64_t v19 = v7 - 2;
      while (v17 != v18)
      {
        unint64_t v7 = v18 + 1;
        if (v32) {
          id v20 = (id)MEMORY[0x24C57DD00](v18 + 1, v5);
        }
        else {
          id v20 = *(id *)(v5 + 40 + 8 * v18);
        }
        uint64_t v21 = v20;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v22 = (id)MEMORY[0x24C57DD00](v18 + 1, a2);
        }
        else
        {
          if (v7 >= *(void *)(v9 + 16)) {
            goto LABEL_54;
          }
          id v22 = *(id *)(a2 + 40 + 8 * v18);
        }
        unint64_t v23 = v22;
        unint64_t v7 = sub_248766218();

        if ((v7 & 1) != 0 && v19 != v18++) {
          continue;
        }
        return (id)(v7 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v25 = *(void *)(v9 + 16);
      if (v25 <= 1) {
        unint64_t v25 = 1;
      }
      unint64_t v26 = v25 - 1;
      uint64_t v27 = (void **)(v5 + 40);
      uint64_t v9 = a2 + 40;
      while (v17)
      {
        if (!v26) {
          goto LABEL_53;
        }
        long long v29 = *v27++;
        uint64_t v28 = v29;
        long long v30 = *(void **)v9;
        v9 += 8;
        a2 = v28;
        uint64_t v5 = v30;
        unint64_t v7 = sub_248766218();

        if (v7)
        {
          --v26;
          if (--v17) {
            continue;
          }
        }
        return (id)(v7 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v9 + 16))
  {
    id v14 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

void sub_2487518E0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_248766308();
    swift_bridgeObjectRelease();
    sub_248766538();
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_248766308();
    swift_bridgeObjectRelease();
    if (!v3) {
      return;
    }
  }
  else
  {
    sub_248766538();
    uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v3) {
      return;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
  }
  else if ((a2 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      MEMORY[0x24C57DD00](i, a2);
      sub_248766228();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    uint64_t v5 = (void **)(a2 + 32);
    do
    {
      unint64_t v6 = *v5++;
      id v7 = v6;
      sub_248766228();

      --v3;
    }
    while (v3);
  }
}

uint64_t sub_2487519F8()
{
  unint64_t v0 = sub_248766358();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA) {
    return 10;
  }
  else {
    return v0;
  }
}

id sub_248751A44(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, __int16 a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  unint64_t v19 = (objc_class *)type metadata accessor for ATPayload();
  id v20 = objc_allocWithZone(v19);
  *(_WORD *)&v20[OBJC_IVAR____TtC9AskToCore9ATPayload_version] = a1;
  uint64_t v21 = &v20[OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier];
  void *v21 = a2;
  v21[1] = a3;
  id v22 = &v20[OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier];
  *(void *)id v22 = a4;
  v22[8] = a5 & 1;
  unint64_t v23 = &v20[OBJC_IVAR____TtC9AskToCore9ATPayload_messageGUID];
  *unint64_t v23 = a6;
  v23[1] = a7;
  *(_WORD *)&v20[OBJC_IVAR____TtC9AskToCore9ATPayload_rawRecipientGroup] = a8;
  v20[OBJC_IVAR____TtC9AskToCore9ATPayload_isForFamily] = a9;
  *(void *)&v20[OBJC_IVAR____TtC9AskToCore9ATPayload_question] = a10;
  *(void *)&v20[OBJC_IVAR____TtC9AskToCore9ATPayload_response] = a11;
  *(void *)&v20[OBJC_IVAR____TtC9AskToCore9ATPayload_allResponses] = a12;
  v26.receiver = v20;
  v26.super_class = v19;
  return objc_msgSendSuper2(&v26, sel_init);
}

void *sub_248751B6C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269324500);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2487520CC();
  sub_2487665A8();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    LOBYTE(v29) = 0;
    __int16 v8 = sub_2487663E8();
    LOBYTE(v29) = 1;
    uint64_t v10 = sub_248766368();
    uint64_t v12 = v11;
    LOBYTE(v29) = 2;
    uint64_t v13 = sub_2487663A8();
    int v26 = v14;
    uint64_t v27 = v13;
    LOBYTE(v29) = 5;
    uint64_t v24 = sub_2487663B8();
    uint64_t v25 = v15;
    type metadata accessor for ATQuestion();
    char v28 = 6;
    sub_2487526DC((unint64_t *)&unk_2693247D0, 255, (void (*)(uint64_t))type metadata accessor for ATQuestion);
    sub_2487663D8();
    uint64_t v23 = v29;
    type metadata accessor for ATResponse();
    char v28 = 7;
    sub_2487526DC(&qword_269324510, 255, (void (*)(uint64_t))type metadata accessor for ATResponse);
    sub_248766388();
    uint64_t v22 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693244A0);
    char v28 = 8;
    sub_248752724(&qword_269324518, &qword_269324510);
    sub_248766388();
    uint64_t v21 = v29;
    char v28 = 9;
    sub_2487527BC();
    sub_2487663D8();
    int v20 = (unsigned __int16)v29;
    LOBYTE(v29) = 3;
    int v19 = sub_248766398();
    LOBYTE(v29) = 4;
    char v16 = sub_248766378();
    if ((v19 & 0x10000) != 0) {
      __int16 v17 = v20;
    }
    else {
      __int16 v17 = v19;
    }
    id v7 = sub_248751A44(v8, v10, v12, v27, v26 & 1, v24, v25, v17, (v16 == 2) | (v16 & 1), v23, v22, v21);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_2487520CC()
{
  unint64_t result = qword_269324488;
  if (!qword_269324488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324488);
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

unint64_t sub_248752168()
{
  unint64_t result = qword_2693244B0;
  if (!qword_2693244B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693244B0);
  }
  return result;
}

id sub_2487521BC()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_248765E98();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initForReadingFromData_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_248765E68();

    swift_willThrow();
  }
  return v2;
}

uint64_t type metadata accessor for ATPayload()
{
  return self;
}

uint64_t sub_2487522A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693244D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248752308(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693244D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248752368(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2487523A4(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = sub_2487526DC(&qword_269324208, a2, (void (*)(uint64_t))type metadata accessor for ATPayload);
  uint64_t result = sub_2487526DC(&qword_2693244D0, v3, (void (*)(uint64_t))type metadata accessor for ATPayload);
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t method lookup function for ATPayload(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATPayload);
}

uint64_t getEnumTagSinglePayload for ATPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ATPayload.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x24875259CLL);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ATPayload.CodingKeys()
{
  return &type metadata for ATPayload.CodingKeys;
}

unint64_t sub_2487525D8()
{
  unint64_t result = qword_2693244E8;
  if (!qword_2693244E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693244E8);
  }
  return result;
}

unint64_t sub_248752630()
{
  unint64_t result = qword_2693244F0;
  if (!qword_2693244F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693244F0);
  }
  return result;
}

unint64_t sub_248752688()
{
  unint64_t result = qword_2693244F8;
  if (!qword_2693244F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693244F8);
  }
  return result;
}

uint64_t sub_2487526DC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_248752724(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2693244A0);
    sub_2487526DC(a2, 255, (void (*)(uint64_t))type metadata accessor for ATResponse);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2487527BC()
{
  unint64_t result = qword_269324520;
  if (!qword_269324520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324520);
  }
  return result;
}

unint64_t sub_248752810()
{
  unint64_t result = qword_269324528;
  if (!qword_269324528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324528);
  }
  return result;
}

uint64_t ATDaemonConnectionManager.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  ATDaemonConnectionManager.init()();
  return v0;
}

uint64_t ATDaemonConnectionManager.init()()
{
  uint64_t v1 = v0;
  *(unsigned char *)(v0 + 24) = 0;
  if (qword_2693240F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_248765FA8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269327110);
  int v3 = sub_248765F88();
  os_log_type_t v4 = sub_2487661D8();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_248743000, v3, v4, "Daemon connection manager initialized", v5, 2u);
    MEMORY[0x24C57E660](v5, -1, -1);
  }

  id v6 = objc_allocWithZone(MEMORY[0x263F08D68]);
  BOOL v7 = (void *)sub_248766008();
  id v8 = objc_msgSend(v6, sel_initWithMachServiceName_options_, v7, 0);

  *(void *)(v1 + 16) = v8;
  id v9 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FC7F040);
  objc_msgSend(v8, sel_setRemoteObjectInterface_, v9);
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  uint64_t v22 = sub_248755210;
  uint64_t v23 = v10;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 1107296256;
  int v20 = sub_248752BA8;
  uint64_t v21 = &block_descriptor;
  uint64_t v11 = _Block_copy(&v18);
  id v12 = v8;
  swift_release();
  objc_msgSend(v12, sel_setInterruptionHandler_, v11);
  _Block_release(v11);

  uint64_t v13 = *(void **)(v1 + 16);
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  uint64_t v22 = sub_24875524C;
  uint64_t v23 = v14;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 1107296256;
  int v20 = sub_248752BA8;
  uint64_t v21 = &block_descriptor_4;
  uint64_t v15 = _Block_copy(&v18);
  id v16 = v13;
  swift_release();
  objc_msgSend(v16, sel_setInvalidationHandler_, v15);
  _Block_release(v15);

  return v1;
}

uint64_t sub_248752BA8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_248752BEC(uint64_t a1, const char *a2)
{
  if (qword_2693240F0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_248765FA8();
  __swift_project_value_buffer(v3, (uint64_t)qword_269327110);
  os_log_type_t v4 = sub_248765F88();
  os_log_type_t v5 = sub_2487661C8();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_248743000, v4, v5, a2, v6, 2u);
    MEMORY[0x24C57E660](v6, -1, -1);
  }

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    *(unsigned char *)(result + 24) = 0;
    return swift_release();
  }
  return result;
}

uint64_t ATDaemonConnectionManager.deinit()
{
  uint64_t v1 = v0;
  if (qword_2693240F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_248765FA8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269327110);
  uint64_t v3 = sub_248765F88();
  os_log_type_t v4 = sub_2487661D8();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl(&dword_248743000, v3, v4, "Daemon connection manager deinitialized", v5, 2u);
    MEMORY[0x24C57E660](v5, -1, -1);
  }

  ATDaemonConnectionManager.disconnectIfNecessary()();
  return v1;
}

Swift::Void __swiftcall ATDaemonConnectionManager.disconnectIfNecessary()()
{
  uint64_t v1 = v0;
  if (qword_2693240F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_248765FA8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269327110);
  uint64_t v3 = sub_248765F88();
  os_log_type_t v4 = sub_2487661D8();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v13 = v6;
    *(_DWORD *)os_log_type_t v5 = 136315138;
    sub_2487475D8(0xD000000000000017, 0x8000000248769B60, &v13);
    sub_248766258();
    _os_log_impl(&dword_248743000, v3, v4, "%s called", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v6, -1, -1);
    MEMORY[0x24C57E660](v5, -1, -1);
  }

  int v7 = *(unsigned __int8 *)(v0 + 24);
  id v8 = sub_248765F88();
  os_log_type_t v9 = sub_2487661D8();
  BOOL v10 = os_log_type_enabled(v8, v9);
  if (v7 == 1)
  {
    if (v10)
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_248743000, v8, v9, "Disconnecting from daemon", v11, 2u);
      MEMORY[0x24C57E660](v11, -1, -1);
    }

    *(unsigned char *)(v1 + 24) = 0;
    objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  }
  else
  {
    if (v10)
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_248743000, v8, v9, "Skipping invalidation because the connection is already invalid", v12, 2u);
      MEMORY[0x24C57E660](v12, -1, -1);
    }
  }
}

uint64_t ATDaemonConnectionManager.__deallocating_deinit()
{
  uint64_t v1 = v0;
  if (qword_2693240F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_248765FA8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269327110);
  uint64_t v3 = sub_248765F88();
  os_log_type_t v4 = sub_2487661D8();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl(&dword_248743000, v3, v4, "Daemon connection manager deinitialized", v5, 2u);
    MEMORY[0x24C57E660](v5, -1, -1);
  }

  ATDaemonConnectionManager.disconnectIfNecessary()();

  return MEMORY[0x270FA0228](v1, 25, 7);
}

void sub_248753158()
{
  uint64_t v1 = v0;
  if (qword_2693240F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_248765FA8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269327110);
  uint64_t v3 = sub_248765F88();
  os_log_type_t v4 = sub_2487661D8();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v13 = v6;
    *(_DWORD *)os_log_type_t v5 = 136315138;
    sub_2487475D8(0xD000000000000014, 0x8000000248769CB0, &v13);
    sub_248766258();
    _os_log_impl(&dword_248743000, v3, v4, "%s called", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v6, -1, -1);
    MEMORY[0x24C57E660](v5, -1, -1);
  }

  char v7 = *(unsigned char *)(v0 + 24);
  id v8 = sub_248765F88();
  os_log_type_t v9 = sub_2487661D8();
  BOOL v10 = os_log_type_enabled(v8, v9);
  if (v7)
  {
    if (v10)
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_248743000, v8, v9, "Skipping resume because there's already a connection", v11, 2u);
      MEMORY[0x24C57E660](v11, -1, -1);
    }
  }
  else
  {
    if (v10)
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_248743000, v8, v9, "Connecting to daemon", v12, 2u);
      MEMORY[0x24C57E660](v12, -1, -1);
    }

    *(unsigned char *)(v1 + 24) = 1;
    objc_msgSend(*(id *)(v1 + 16), sel_resume);
  }
}

uint64_t sub_2487533B8()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_2487533D8, 0, 0);
}

uint64_t sub_2487533D8()
{
  if (qword_2693240F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_248765FA8();
  __swift_project_value_buffer(v1, (uint64_t)qword_269327110);
  uint64_t v2 = sub_248765F88();
  os_log_type_t v3 = sub_2487661D8();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl(&dword_248743000, v2, v3, "Obtaining synchronous daemon proxy", v4, 2u);
    MEMORY[0x24C57E660](v4, -1, -1);
  }

  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269324578);
  *os_log_type_t v5 = v0;
  v5[1] = sub_248753578;
  uint64_t v7 = *(void *)(v0 + 24);
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD000000000000013, 0x8000000248769C90, sub_248755568, v7, v6);
}

uint64_t sub_248753578()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2487536A8;
  }
  else {
    uint64_t v2 = sub_24875368C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24875368C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_2487536A8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2487536C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 16);
  aBlock[4] = sub_2487538E8;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_248753AC4;
  aBlock[3] = &block_descriptor_22;
  os_log_type_t v3 = _Block_copy(aBlock);
  id v4 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v3);
  _Block_release(v3);
  sub_248766278();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269324578);
  if (swift_dynamicCast())
  {
    if (qword_2693240F0 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_248765FA8();
    __swift_project_value_buffer(v5, (uint64_t)qword_269327110);
    uint64_t v6 = sub_248765F88();
    os_log_type_t v7 = sub_2487661D8();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_248743000, v6, v7, "Successfully obtained synchronous daemon proxy", v8, 2u);
      MEMORY[0x24C57E660](v8, -1, -1);
    }

    aBlock[0] = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269324588);
    return sub_248766178();
  }
  else
  {
    sub_248755570();
    uint64_t v10 = swift_allocError();
    *uint64_t v11 = 0;
    aBlock[0] = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269324588);
    return sub_248766168();
  }
}

void sub_2487538E8(void *a1)
{
  if (qword_2693240F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_248765FA8();
  __swift_project_value_buffer(v2, (uint64_t)qword_269327110);
  id v3 = a1;
  id v4 = a1;
  oslog = sub_248765F88();
  os_log_type_t v5 = sub_2487661C8();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    id v8 = a1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    sub_248766258();
    *os_log_type_t v7 = v10;

    _os_log_impl(&dword_248743000, oslog, v5, "Error obtaining remote object proxy: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269324478);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v7, -1, -1);
    MEMORY[0x24C57E660](v6, -1, -1);
  }
  else
  {
  }
}

void sub_248753AC4(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t ATDaemonConnectionManager.send(question:to:)(uint64_t a1, __int16 a2)
{
  *(_WORD *)(v3 + 176) = a2;
  *(void *)(v3 + 136) = a1;
  *(void *)(v3 + 144) = v2;
  return MEMORY[0x270FA2498](sub_248753B50, 0, 0);
}

uint64_t sub_248753B50()
{
  uint64_t v9 = v0;
  if (qword_2693240F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_248765FA8();
  __swift_project_value_buffer(v1, (uint64_t)qword_269327110);
  uint64_t v2 = sub_248765F88();
  os_log_type_t v3 = sub_2487661B8();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v8 = v5;
    *(_DWORD *)id v4 = 136315138;
    v0[16] = sub_2487475D8(0xD000000000000012, 0x8000000248769BA0, &v8);
    sub_248766258();
    _os_log_impl(&dword_248743000, v2, v3, "%s called", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v5, -1, -1);
    MEMORY[0x24C57E660](v4, -1, -1);
  }

  sub_248753158();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[19] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_248753D5C;
  v6[3] = v0[18];
  return MEMORY[0x270FA2498](sub_2487533D8, 0, 0);
}

uint64_t sub_248753D5C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 160) = a1;
  swift_task_dealloc();
  if (v1)
  {
    id v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_248753E90, 0, 0);
  }
}

uint64_t sub_248753E90()
{
  uint64_t v1 = *(void **)(v0 + 160);
  uint64_t v2 = *(__int16 *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 136);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_248753FA4;
  uint64_t v4 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_248754190;
  *(void *)(v0 + 104) = &block_descriptor_6;
  *(void *)(v0 + 112) = v4;
  objc_msgSend(v1, sel_sendWithQuestion_to_completionHandler_, v3, v2, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_248753FA4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    uint64_t v2 = sub_24875411C;
  }
  else {
    uint64_t v2 = sub_2487540B4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2487540B4()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24875411C()
{
  swift_willThrow();
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_248754190(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269324568);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2) {
      uint64_t v8 = sub_248766118();
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v8;
    sub_248755500((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t ATDaemonConnectionManager.sendResponse(_:to:)(uint64_t a1, uint64_t a2)
{
  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  return MEMORY[0x270FA2498](sub_248754290, 0, 0);
}

uint64_t sub_248754290()
{
  uint64_t v9 = v0;
  if (qword_2693240F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_248765FA8();
  __swift_project_value_buffer(v1, (uint64_t)qword_269327110);
  uint64_t v2 = sub_248765F88();
  os_log_type_t v3 = sub_2487661B8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v8 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[15] = sub_2487475D8(0xD000000000000013, 0x8000000248769BE0, &v8);
    sub_248766258();
    _os_log_impl(&dword_248743000, v2, v3, "%s called", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v5, -1, -1);
    MEMORY[0x24C57E660](v4, -1, -1);
  }

  sub_248753158();
  uint64_t v6 = (void *)swift_task_alloc();
  v0[19] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24875449C;
  v6[3] = v0[18];
  return MEMORY[0x270FA2498](sub_2487533D8, 0, 0);
}

uint64_t sub_24875449C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 160) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2487545D0, 0, 0);
  }
}

uint64_t sub_2487545D0()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v2 = v0[16];
  uint64_t v3 = sub_248766108();
  v0[21] = v3;
  v0[2] = v0;
  v0[3] = sub_2487546EC;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2487548E0;
  v0[13] = &block_descriptor_9;
  v0[14] = v4;
  objc_msgSend(v1, sel_sendResponse_to_completionHandler_, v2, v3, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_2487546EC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    uint64_t v2 = sub_248754864;
  }
  else {
    uint64_t v2 = sub_2487547FC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2487547FC()
{
  uint64_t v1 = *(void **)(v0 + 168);
  swift_unknownObjectRelease();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_248754864()
{
  uint64_t v1 = *(void **)(v0 + 168);
  swift_willThrow();
  swift_unknownObjectRelease();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2487548E0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269324568);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    return swift_continuation_throwingResume();
  }
}

uint64_t ATDaemonConnectionManager.sendResponsePayloadViaIDS(_:to:)(uint64_t a1, uint64_t a2)
{
  id v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *id v6 = v3;
  v6[1] = sub_248754A34;
  v6[17] = a2;
  v6[18] = v2;
  v6[16] = a1;
  return MEMORY[0x270FA2498](sub_248754290, 0, 0);
}

uint64_t sub_248754A34()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t ATDaemonConnectionManager.screenTimeDidReceiveAnswer(_:forRequestWithID:responderDSID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[20] = a5;
  v6[21] = v5;
  v6[18] = a3;
  v6[19] = a4;
  v6[16] = a1;
  v6[17] = a2;
  return MEMORY[0x270FA2498](sub_248754B50, 0, 0);
}

uint64_t sub_248754B50()
{
  uint64_t v9 = v0;
  if (qword_2693240F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_248765FA8();
  __swift_project_value_buffer(v1, (uint64_t)qword_269327110);
  uint64_t v2 = sub_248765F88();
  os_log_type_t v3 = sub_2487661D8();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v8 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[15] = sub_2487475D8(0xD00000000000003DLL, 0x8000000248769C00, &v8);
    sub_248766258();
    _os_log_impl(&dword_248743000, v2, v3, "%s called", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v5, -1, -1);
    MEMORY[0x24C57E660](v4, -1, -1);
  }

  sub_248753158();
  id v6 = (void *)swift_task_alloc();
  v0[22] = v6;
  *id v6 = v0;
  v6[1] = sub_248754D5C;
  v6[3] = v0[21];
  return MEMORY[0x270FA2498](sub_2487533D8, 0, 0);
}

uint64_t sub_248754D5C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 184) = a1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_248754E90, 0, 0);
  }
}

uint64_t sub_248754E90()
{
  uint64_t v1 = (void *)v0[23];
  uint64_t v2 = v0[16];
  uint64_t v3 = sub_248766008();
  v0[24] = v3;
  uint64_t v4 = sub_248766008();
  v0[25] = v4;
  v0[2] = v0;
  v0[3] = sub_248754FD0;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_2487548E0;
  v0[13] = &block_descriptor_14;
  v0[14] = v5;
  objc_msgSend(v1, sel_screenTimeDidReceiveAnswer_forRequestWithID_responderDSID_completionHandler_, v2, v3, v4, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_248754FD0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_248755150;
  }
  else {
    uint64_t v2 = sub_2487550E0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2487550E0()
{
  uint64_t v1 = (void *)v0[24];
  uint64_t v2 = (void *)v0[25];
  swift_unknownObjectRelease();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_248755150()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = (void *)v0[24];
  swift_willThrow();
  swift_unknownObjectRelease();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2487551D8()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_248755210()
{
  return sub_248752BEC(v0, "Daemon connection interrupted");
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

uint64_t sub_24875524C()
{
  return sub_248752BEC(v0, "Daemon connection invalidated");
}

uint64_t type metadata accessor for ATDaemonConnectionManager()
{
  return self;
}

uint64_t method lookup function for ATDaemonConnectionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATDaemonConnectionManager);
}

uint64_t dispatch thunk of ATDaemonConnectionManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void *initializeBufferWithCopyOfBuffer for ATDaemonConnectionManager.ConnectionError(void *a1, void **a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    id v4 = v3;
  }
  *a1 = v3;
  return a1;
}

void destroy for ATDaemonConnectionManager.ConnectionError(void **a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF) {
}
  }

void **assignWithCopy for ATDaemonConnectionManager.ConnectionError(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF) {
      id v7 = v4;
    }
    *a1 = v4;
  }
  else if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    *a1 = *a2;
  }
  else
  {
    id v5 = v4;
    uint64_t v6 = *a1;
    *a1 = v4;
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for ATDaemonConnectionManager.ConnectionError(void **a1, unint64_t *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v4 < 0xFFFFFFFF)
  {

LABEL_5:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for ATDaemonConnectionManager.ConnectionError(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ATDaemonConnectionManager.ConnectionError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_2487554B8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_2487554D0(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for ATDaemonConnectionManager.ConnectionError()
{
  return &type metadata for ATDaemonConnectionManager.ConnectionError;
}

uint64_t sub_248755500(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269324570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248755568(uint64_t a1)
{
  return sub_2487536C0(a1, v1);
}

unint64_t sub_248755570()
{
  unint64_t result = qword_269324580;
  if (!qword_269324580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324580);
  }
  return result;
}

id Icon.image.getter()
{
  return *v0;
}

double Icon.scale.getter()
{
  return *(double *)(v0 + 8);
}

uint64_t Icon.isBlank.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t Icon.isComposite.getter()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_2487555F8()
{
  return 0;
}

void sub_2487556EC()
{
  off_269324590 = &unk_26FC7AFF8;
}

uint64_t sub_248755700(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = qword_269324130;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v32 = *((void *)off_269324590 + 2);
  if (v32)
  {
    uint64_t v34 = (char *)off_269324590 + 32;
    swift_bridgeObjectRetain_n();
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = &v34[32 * v5];
      uint64_t v8 = *(void *)v6;
      uint64_t v7 = *((void *)v6 + 1);
      uint64_t v10 = *((void *)v6 + 2);
      uint64_t v9 = *((void *)v6 + 3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269324760);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_248767C50;
      uint64_t v33 = v8;
      *(void *)(inited + 32) = v8;
      *(void *)(inited + 40) = v7;
      *(void *)(inited + 48) = v10;
      *(void *)(inited + 56) = v9;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v12 = sub_2487580A0(inited);
      swift_setDeallocating();
      swift_arrayDestroy();
      if (*(void *)(v12 + 16))
      {
        sub_248766528();
        sub_248766068();
        uint64_t v13 = sub_248766588();
        uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
        unint64_t v15 = v13 & ~v14;
        if ((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
        {
          uint64_t v16 = *(void *)(v12 + 48);
          __int16 v17 = (void *)(v16 + 16 * v15);
          BOOL v18 = *v17 == a1 && v17[1] == a2;
          if (v18 || (sub_248766498() & 1) != 0)
          {
LABEL_21:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v22 = v33;
            goto LABEL_25;
          }
          uint64_t v19 = ~v14;
          while (1)
          {
            unint64_t v15 = (v15 + 1) & v19;
            if (((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
              break;
            }
            int v20 = (void *)(v16 + 16 * v15);
            BOOL v21 = *v20 == a1 && v20[1] == a2;
            if (v21 || (sub_248766498() & 1) != 0) {
              goto LABEL_21;
            }
          }
        }
      }
      ++v5;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v5 != v32);
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v22 = a1;
LABEL_25:
  if (qword_269324108 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_248765FA8();
  __swift_project_value_buffer(v23, (uint64_t)qword_269327158);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_248765F88();
  os_log_type_t v25 = sub_2487661D8();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    v35[0] = v27;
    *(_DWORD *)uint64_t v26 = 136315394;
    swift_bridgeObjectRetain();
    sub_2487475D8(a1, a2, v35);
    sub_248766258();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v26 + 12) = 2080;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_2487555F8();
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2487475D8(v28, v30, v35);
    sub_248766258();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_248743000, v24, v25, "Platform correct bundle identifier for %s is %s", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C57E660](v27, -1, -1);
    MEMORY[0x24C57E660](v26, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return v22;
}

id IconProvider.init()@<X0>(void *a1@<X8>)
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B558]), sel_initWithSize_scale_, 60.0, 60.0, 3.0);
  *a1 = result;
  return result;
}

id sub_248755C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  id result = objc_msgSend(self, sel_defaultWorkspace);
  if (result)
  {
    uint64_t v11 = result;
    swift_bridgeObjectRetain();
    uint64_t v12 = (void *)sub_248766008();
    swift_bridgeObjectRelease();
    unsigned int v13 = objc_msgSend(v11, sel_applicationIsInstalled_, v12);

    unint64_t v14 = 0x26523D000uLL;
    unint64_t v15 = 0x26523D000uLL;
    if (a1 != 0xD000000000000019 || a2 != 0x8000000248769D80)
    {
      if ((sub_248766498() & 1) == 0)
      {
        if ((v13 & 1) == 0)
        {
          if (qword_269324108 != -1) {
            swift_once();
          }
          uint64_t v51 = sub_248765FA8();
          __swift_project_value_buffer(v51, (uint64_t)qword_269327158);
          uint64_t v52 = sub_248765F88();
          os_log_type_t v53 = sub_2487661D8();
          if (os_log_type_enabled(v52, v53))
          {
            unint64_t v54 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)unint64_t v54 = 0;
            _os_log_impl(&dword_248743000, v52, v53, "Not using IconServices because !isAppInstalled && !appHasSystemIcon", v54, 2u);
            MEMORY[0x24C57E660](v54, -1, -1);
          }

          return 0;
        }
        id v19 = 0;
        goto LABEL_17;
      }
      if ((sub_248766498() & 1) == 0)
      {
        unsigned int v59 = v13;
        id v19 = 0;
        if (!v59) {
          goto LABEL_23;
        }
        goto LABEL_17;
      }
    }
    unsigned int v57 = v13;
    id v16 = objc_allocWithZone(MEMORY[0x263F4B540]);
    __int16 v17 = (void *)sub_248766008();
    id v18 = objc_msgSend(v16, sel_initWithType_, v17);

    id v19 = objc_msgSend(v18, sel_prepareImageForDescriptor_, a5);
    if (v19)
    {
      if (qword_269324108 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_248765FA8();
      __swift_project_value_buffer(v20, (uint64_t)qword_269327158);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      BOOL v21 = sub_248765F88();
      os_log_type_t v22 = sub_2487661D8();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v55 = a5;
        uint64_t v24 = swift_slowAlloc();
        uint64_t v60 = v24;
        *(_DWORD *)uint64_t v23 = 136315138;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_2487555F8();
        unint64_t v27 = v26;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2487475D8(v25, v27, &v60);
        unint64_t v14 = 0x26523D000;
        sub_248766258();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_248743000, v21, v22, "App with bundle ID %s has a system icon image! Using that.", v23, 0xCu);
        swift_arrayDestroy();
        uint64_t v28 = v24;
        a5 = v55;
        MEMORY[0x24C57E660](v28, -1, -1);
        unint64_t v29 = v23;
        unint64_t v15 = 0x26523D000;
        MEMORY[0x24C57E660](v29, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      if (![v19 *(SEL *)(v15 + 2992)] || (a6 & 1) != 0)
      {
LABEL_24:
        if (![v19 *(SEL *)(v15 + 2992)] || (a6 & 1) != 0) {
          return v19;
        }
        if (qword_269324108 != -1) {
          swift_once();
        }
        uint64_t v43 = sub_248765FA8();
        __swift_project_value_buffer(v43, (uint64_t)qword_269327158);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v44 = sub_248765F88();
        os_log_type_t v45 = sub_2487661D8();
        if (os_log_type_enabled(v44, v45))
        {
          os_log_type_t v46 = (uint8_t *)swift_slowAlloc();
          uint64_t v47 = swift_slowAlloc();
          uint64_t v60 = v47;
          *(_DWORD *)os_log_type_t v46 = 136315138;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v48 = sub_2487555F8();
          unint64_t v50 = v49;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2487475D8(v48, v50, &v60);
          sub_248766258();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_248743000, v44, v45, "Icon for app with bundle ID %s was a placeholder. Removing as placeholders were not allowed", v46, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C57E660](v47, -1, -1);
          MEMORY[0x24C57E660](v46, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        return 0;
      }
    }
    if (!v57)
    {
LABEL_23:
      if (!v19) {
        return v19;
      }
      goto LABEL_24;
    }
LABEL_17:
    if (qword_269324108 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_248765FA8();
    __swift_project_value_buffer(v30, (uint64_t)qword_269327158);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v31 = sub_248765F88();
    os_log_type_t v32 = sub_2487661D8();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = a5;
      uint64_t v58 = swift_slowAlloc();
      uint64_t v60 = v58;
      *(_DWORD *)uint64_t v33 = 136315138;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v34 = v14;
      uint64_t v35 = sub_2487555F8();
      unint64_t v37 = v36;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = v35;
      unint64_t v14 = v34;
      sub_2487475D8(v38, v37, &v60);
      sub_248766258();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      unint64_t v15 = 0x26523D000;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_248743000, v31, v32, "Trying to use bundle ID to get IconServices icon for app with bundle ID %s", v33, 0xCu);
      swift_arrayDestroy();
      a5 = v56;
      MEMORY[0x24C57E660](v58, -1, -1);
      MEMORY[0x24C57E660](v33, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    id v39 = objc_allocWithZone(MEMORY[0x263F4B540]);
    swift_bridgeObjectRetain();
    uint64_t v40 = (void *)sub_248766008();
    swift_bridgeObjectRelease();
    id v41 = objc_msgSend(v39, sel_initWithBundleIdentifier_, v40);

    id v42 = objc_msgSend(v41, *(SEL *)(v14 + 2960), a5);
    id v19 = v42;
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

double IconProvider.clientIcon(for:isBadge:)@<D0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8))
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
  }
  else
  {
    v12[0] = *(void *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier);
    uint64_t v6 = sub_248766478();
    unint64_t v7 = v8;
  }
  sub_2487565E8(a2 & 1, *(void *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier), *(void *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8), v6, v7, (uint64_t)v12);
  swift_bridgeObjectRelease();
  double result = *(double *)&v12[1];
  char v10 = v13;
  char v11 = v14;
  *(void *)a3 = v12[0];
  *(double *)(a3 + 8) = result;
  *(unsigned char *)(a3 + 16) = v10;
  *(unsigned char *)(a3 + 17) = v11;
  return result;
}

void sub_2487565E8(char a1@<W0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X8>)
{
  id v12 = *v6;
  char v13 = v12;
  if (a1)
  {
    objc_msgSend(v12, sel_size);
    double v15 = v14 * 0.333333333;
    objc_msgSend(v13, sel_size);
    double v17 = v16 * 0.333333333;
    objc_msgSend(v13, sel_scale);
    id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B558]), sel_initWithSize_scale_, v15, v17, v18);

    char v13 = v19;
  }
  uint64_t v20 = sub_248755700(a2, a3);
  if (v21
    && (id v24 = sub_248755C18(v20, v21, v22, v23, (uint64_t)v13, 0),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        v24))
  {
    if (qword_269324108 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_248765FA8();
    __swift_project_value_buffer(v25, (uint64_t)qword_269327158);
    unint64_t v26 = sub_248765F88();
    os_log_type_t v27 = sub_2487661D8();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_248743000, v26, v27, "Got icon from Iconservices.", v28, 2u);
      MEMORY[0x24C57E660](v28, -1, -1);
    }

    id v29 = objc_msgSend(v24, sel_CGImage);
    if (v29)
    {
      id v30 = v29;
      objc_msgSend(v24, sel_scale);
      uint64_t v32 = v31;

      char v33 = 0;
LABEL_30:
      *(void *)a6 = v30;
      *(void *)(a6 + 8) = v32;
      *(unsigned char *)(a6 + 16) = v33;
      *(unsigned char *)(a6 + 17) = 0;
      return;
    }
  }
  else
  {
    if (qword_269324108 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_248765FA8();
    __swift_project_value_buffer(v34, (uint64_t)qword_269327158);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v35 = sub_248765F88();
    os_log_type_t v36 = sub_2487661C8();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v49 = v38;
      *(_DWORD *)uint64_t v37 = 136315394;
      if (!a3) {
        a2 = 7104878;
      }
      uint64_t v47 = a6;
      if (a3) {
        unint64_t v39 = a3;
      }
      else {
        unint64_t v39 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain();
      sub_2487475D8(a2, v39, &v49);
      sub_248766258();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      if (a5) {
        uint64_t v40 = a4;
      }
      else {
        uint64_t v40 = 7104878;
      }
      if (a5) {
        unint64_t v41 = a5;
      }
      else {
        unint64_t v41 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain();
      sub_2487475D8(v40, v41, &v49);
      a6 = v47;
      sub_248766258();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_248743000, v35, v36, "Nothing worked! Falling back to generic blank icon. bundleIdentifier: %s, adamIdentifier: %s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C57E660](v38, -1, -1);
      MEMORY[0x24C57E660](v37, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    id v42 = objc_msgSend(self, sel_genericApplicationIcon);
    id v43 = objc_msgSend(v42, sel_imageForDescriptor_, v13);
    if (v43)
    {
      uint64_t v44 = v43;
      id v45 = objc_msgSend(v43, sel_CGImage);
      if (v45)
      {
        id v30 = v45;
        objc_msgSend(v44, sel_scale);
        uint64_t v32 = v46;

        char v33 = 1;
        goto LABEL_30;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  __break(1u);
}

double IconProvider.associatedContentIcon(for:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
  uint64_t v4 = (uint64_t *)(v3 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
  swift_beginAccess();
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  unint64_t v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
  swift_beginAccess();
  uint64_t v8 = *v7;
  unint64_t v9 = v7[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2487565E8(0, v5, v6, v8, v9, (uint64_t)v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double result = *(double *)&v13[1];
  char v11 = v14;
  char v12 = v15;
  *(void *)a2 = v13[0];
  *(double *)(a2 + 8) = result;
  *(unsigned char *)(a2 + 16) = v11;
  *(unsigned char *)(a2 + 17) = v12;
  return result;
}

void sub_248756BC0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int16 v4 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v5 = *(void **)a2;
  __int16 v6 = *(unsigned __int8 *)(a2 + 16);
  unint64_t v7 = (CGImage *)*(id *)a1;
  id v8 = v5;
  double v9 = (double)(uint64_t)CGImageGetWidth(v7) * 0.0833333333;
  if ((~*(void *)&v9 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v9 <= -9.22337204e18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v9 >= 9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  double v10 = (double)(uint64_t)CGImageGetWidth(v7) * 0.333333333;
  if ((~*(void *)&v10 & 0x7FF0000000000000) == 0)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v10 >= 9.22337204e18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v11 = (uint64_t)v9;
  size_t Width = CGImageGetWidth(v7);
  size_t v13 = Width + (uint64_t)v9;
  if (__OFADD__(Width, (uint64_t)v9))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  size_t Height = CGImageGetHeight(v7);
  size_t v15 = Height + v11;
  if (__OFADD__(Height, v11))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if ((v13 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  double v17 = CGBitmapContextCreate(0, v13, v15, 8uLL, 4 * v13, DeviceRGB, 0x2002u);

  if (!v17)
  {
    if (qword_269324108 == -1)
    {
LABEL_16:
      uint64_t v21 = sub_248765FA8();
      __swift_project_value_buffer(v21, (uint64_t)qword_269327158);
      uint64_t v22 = sub_248765F88();
      os_log_type_t v23 = sub_2487661C8();
      if (os_log_type_enabled(v22, v23))
      {
        id v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v24 = 0;
        _os_log_impl(&dword_248743000, v22, v23, "Composite context was nil. Failing to composite icons.", v24, 2u);
        MEMORY[0x24C57E660](v24, -1, -1);
      }

      goto LABEL_24;
    }
LABEL_36:
    swift_once();
    goto LABEL_16;
  }
  CGImageGetWidth(v7);
  CGImageGetHeight(v7);
  sub_2487661A8();
  size_t v18 = CGImageGetWidth(v7);
  if (__OFSUB__(v18, (uint64_t)v10)) {
    goto LABEL_34;
  }
  if (__OFADD__(v18 - (uint64_t)v10, v11))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  sub_2487661A8();
  CGImageRef Image = CGBitmapContextCreateImage(v17);
  if (Image)
  {
    CGImageRef v20 = Image;

    *(void *)a3 = v20;
    *(void *)(a3 + 8) = 0x4008000000000000;
    *(_WORD *)(a3 + 16) = v4 | v6 | 0x100;
    return;
  }
  if (qword_269324108 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_248765FA8();
  __swift_project_value_buffer(v25, (uint64_t)qword_269327158);
  uint64_t v22 = sub_248765F88();
  os_log_type_t v26 = sub_2487661C8();
  if (os_log_type_enabled(v22, v26))
  {
    os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v27 = 0;
    _os_log_impl(&dword_248743000, v22, v26, "Resulting composite image was nil. Failing to composite icons.", v27, 2u);
    MEMORY[0x24C57E660](v27, -1, -1);
  }

LABEL_24:
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(_WORD *)(a3 + 16) = 0;
}

void IconProvider.compositeIcon(for:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  v32[0] = *v2;
  uint64_t v6 = *(void *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_question);
  unint64_t v7 = (uint64_t *)(v6 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
  swift_beginAccess();
  uint64_t v8 = *v7;
  unint64_t v9 = v7[1];
  double v10 = (uint64_t *)(v6 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
  swift_beginAccess();
  uint64_t v17 = *v10;
  unint64_t v11 = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2487565E8(0, v8, v9, v17, v11, (uint64_t)&v35);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = 0;
  unint64_t v13 = 0;
  id v14 = v35;
  uint64_t v15 = v36;
  char v16 = v37;
  LOBYTE(v17) = HIBYTE(v37);
  if ((*(unsigned char *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier + 8) & 1) == 0)
  {
    id v35 = *(id *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientAdamIdentifier);
    uint64_t v12 = sub_248766478();
    unint64_t v13 = v18;
  }
  v32[0] = v5;
  sub_2487565E8(1, *(void *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier), *(void *)(a1 + OBJC_IVAR____TtC9AskToCore9ATPayload_clientBundleIdentifier + 8), v12, v13, (uint64_t)&v35);
  swift_bridgeObjectRelease();
  id v19 = v35;
  uint64_t v20 = v36;
  char v21 = HIBYTE(v37);
  if ((v16 & 1) == 0)
  {
    if ((v37 & 1) == 0)
    {
      v32[0] = v14;
      v32[1] = v15;
      char v33 = 0;
      char v34 = v17;
      v29[0] = v35;
      v29[1] = v36;
      char v30 = 0;
      char v31 = HIBYTE(v37);
      sub_248756BC0((uint64_t)v32, (uint64_t)v29, (uint64_t)&v35);
      id v23 = v35;
      if (v35)
      {
        uint64_t v15 = v36;
        unsigned int v24 = v37;

        char v22 = v24 & 1;
        LODWORD(v17) = (v24 >> 8) & 1;
        id v14 = v23;
        goto LABEL_12;
      }
      if (qword_269324108 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_248765FA8();
      __swift_project_value_buffer(v25, (uint64_t)qword_269327158);
      os_log_type_t v26 = sub_248765F88();
      os_log_type_t v27 = sub_2487661C8();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_248743000, v26, v27, "Composite icon was nil. Returning associatedContentIcon only.", v28, 2u);
        MEMORY[0x24C57E660](v28, -1, -1);

        goto LABEL_8;
      }
    }
LABEL_8:
    char v22 = 0;
    goto LABEL_12;
  }
  if ((_BYTE)v37)
  {

    char v22 = 1;
  }
  else
  {

    char v22 = 0;
    id v14 = v19;
    uint64_t v15 = v20;
    LOBYTE(v17) = v21;
  }
LABEL_12:
  *(void *)a2 = v14;
  *(void *)(a2 + 8) = v15;
  *(unsigned char *)(a2 + 16) = v22;
  *(unsigned char *)(a2 + 17) = v17;
}

CGImageRef sub_24875728C(CGImage *a1)
{
  CGImageRef v28 = a1;
  uint64_t v1 = sub_248765F68();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  __int16 v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269324108 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_248765FA8();
  __swift_project_value_buffer(v5, (uint64_t)qword_269327158);
  uint64_t v6 = sub_248765F88();
  os_log_type_t v7 = sub_2487661D8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_248743000, v6, v7, "Attempting to add corner radius to image from Data", v8, 2u);
    MEMORY[0x24C57E660](v8, -1, -1);
  }

  uint64_t Width = CGImageGetWidth(v28);
  CGImageRef result = (CGImageRef)CGImageGetHeight(v28);
  if ((unint64_t)(Width - 0x2000000000000000) >> 62 != 3)
  {
    __break(1u);
    return result;
  }
  int64_t v11 = (int64_t)result;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  unint64_t v13 = CGBitmapContextCreate(0, Width, v11, 8uLL, 4 * Width, DeviceRGB, 0x2002u);

  if (v13)
  {
    double v14 = 0.0666666667;
    if (Width == v11) {
      double v14 = 0.25;
    }
    CGFloat v15 = v14 * (double)Width;
    v30.origin.x = 0.0;
    v30.origin.y = 0.0;
    v30.size.width = (double)Width;
    v30.size.height = (double)v11;
    char v16 = CGPathCreateWithRoundedRect(v30, v15, v15, 0);
    CGContextAddPath(v13, v16);
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F00040], v1);
    sub_248766198();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    sub_2487661A8();
    CGImageRef Image = CGBitmapContextCreateImage(v13);
    unint64_t v18 = sub_248765F88();
    if (Image)
    {
      os_log_type_t v19 = sub_2487661D8();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_248743000, v18, v19, "Added corner radius to image from Data", v20, 2u);
        MEMORY[0x24C57E660](v20, -1, -1);
      }

      return Image;
    }
    os_log_type_t v24 = sub_2487661C8();
    if (os_log_type_enabled(v18, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_248743000, v18, v24, "Resulting rounded corner image was nil. Returning the original image with no corner radius.", v25, 2u);
      MEMORY[0x24C57E660](v25, -1, -1);
    }
  }
  else
  {
    char v21 = sub_248765F88();
    os_log_type_t v22 = sub_2487661C8();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v23 = 0;
      _os_log_impl(&dword_248743000, v21, v22, "Rounded corner image context was nil. Returning the original image with no corner radius.", v23, 2u);
      MEMORY[0x24C57E660](v23, -1, -1);
    }
  }
  CGImageRef v26 = v28;

  return v26;
}

void IconProvider.icon(from:isScreenTimeRequest:)(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)a1;
  unint64_t v6 = *(void *)(a1 + 8);
  int v8 = *(unsigned __int8 *)(a1 + 32);
  unint64_t v9 = *v3;
  CFDataRef v10 = (const __CFData *)sub_248765E98();
  int64_t v11 = CGImageSourceCreateWithData(v10, 0);

  if (!v11)
  {
    if (qword_269324108 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_248765FA8();
    __swift_project_value_buffer(v14, (uint64_t)qword_269327158);
    CGFloat v15 = sub_248765F88();
    os_log_type_t v16 = sub_2487661C8();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_248743000, v15, v16, "Image source was nil for existing image data.", v17, 2u);
      MEMORY[0x24C57E660](v17, -1, -1);
    }

    goto LABEL_15;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, 0, 0);
  if (!ImageAtIndex)
  {
    if (qword_269324108 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_248765FA8();
    __swift_project_value_buffer(v18, (uint64_t)qword_269327158);
    os_log_type_t v19 = sub_248765F88();
    os_log_type_t v20 = sub_2487661C8();
    if (os_log_type_enabled(v19, v20))
    {
      char v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v21 = 0;
      _os_log_impl(&dword_248743000, v19, v20, "Image was nil for existing image data image source.", v21, 2u);
      MEMORY[0x24C57E660](v21, -1, -1);
    }

LABEL_15:
    unint64_t v13 = 0;
    double v22 = 0.0;
    goto LABEL_18;
  }
  unint64_t v13 = ImageAtIndex;
  if (v8)
  {
  }
  else
  {
    CGImageRef v23 = sub_24875728C(ImageAtIndex);

    unint64_t v13 = v23;
  }
  double v22 = 3.0;
LABEL_18:
  if (v6 >> 60 == 15)
  {
    CGImageRef v24 = 0;
    double v25 = 0.0;
    goto LABEL_35;
  }
  sub_24874966C(v7, v6);
  CFDataRef v26 = (const __CFData *)sub_248765E98();
  uint64_t v27 = CGImageSourceCreateWithData(v26, 0);

  if (!v27)
  {
    if (qword_269324108 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_248765FA8();
    __swift_project_value_buffer(v29, (uint64_t)qword_269327158);
    uint64_t v27 = sub_248765F88();
    os_log_type_t v30 = sub_2487661C8();
    if (os_log_type_enabled(v27, v30))
    {
      char v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v31 = 0;
      _os_log_impl(&dword_248743000, v27, v30, "Image source was nil for existing image data.", v31, 2u);
      MEMORY[0x24C57E660](v31, -1, -1);
    }
    sub_248749600(v7, v6);
    goto LABEL_33;
  }
  CGImageRef v28 = CGImageSourceCreateImageAtIndex((CGImageSourceRef)v27, 0, 0);
  if (!v28)
  {
    if (qword_269324108 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_248765FA8();
    __swift_project_value_buffer(v32, (uint64_t)qword_269327158);
    char v33 = sub_248765F88();
    os_log_type_t v34 = sub_2487661C8();
    if (os_log_type_enabled(v33, v34))
    {
      id v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v35 = 0;
      _os_log_impl(&dword_248743000, v33, v34, "Image was nil for existing image data image source.", v35, 2u);
      MEMORY[0x24C57E660](v35, -1, -1);
    }
    sub_248749600(v7, v6);

LABEL_33:
    CGImageRef v24 = 0;
    double v25 = 0.0;
    goto LABEL_34;
  }
  CGImageRef v24 = v28;
  sub_248749600(v7, v6);
  double v25 = 3.0;
LABEL_34:

LABEL_35:
  id v36 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B578]);
  unsigned __int16 v37 = v36;
  if (!v13)
  {
    if (v24)
    {

      __int16 v41 = 0;
      double v22 = v25;
LABEL_57:
      __int16 v42 = 0;
      unint64_t v13 = v24;
      goto LABEL_58;
    }
    id v59 = objc_msgSend(self, sel_genericApplicationIcon);
    id v64 = objc_msgSend(v59, sel_imageForDescriptor_, v37);
    if (v64)
    {
      char v61 = v64;
      uint64_t v65 = (CGImage *)objc_msgSend(v64, sel_CGImage);
      if (v65)
      {
        CGImageRef v24 = v65;
        objc_msgSend(v61, sel_scale);
        double v22 = v66;

        goto LABEL_54;
      }
      goto LABEL_65;
    }
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  if (v24)
  {
    uint64_t v70 = v13;
    double v71 = v22;
    LOWORD(v72) = 0;
    CGImageRef v67 = v24;
    double v68 = v25;
    LOWORD(v69) = 0;
    uint64_t v38 = v13;
    unint64_t v39 = v24;
    sub_248756BC0((uint64_t)&v70, (uint64_t)&v67, (uint64_t)&v73);
    unint64_t v13 = v73;
    if (v73)
    {
      __int16 v40 = v75;
      double v22 = v74;

      __int16 v41 = v40 & 1;
      if ((v40 & 0x100) == 0)
      {
LABEL_39:
        __int16 v42 = 0;
LABEL_58:
        *(void *)a3 = v13;
        *(double *)(a3 + 8) = v22;
        *(_WORD *)(a3 + 16) = v42 | v41;
        return;
      }
      goto LABEL_61;
    }
    id v59 = objc_msgSend(self, sel_genericApplicationIcon, v67, *(void *)&v68, v69, v70, *(void *)&v71, v72);
    id v60 = objc_msgSend(v59, sel_imageForDescriptor_, v37);
    if (v60)
    {
      char v61 = v60;
      uint64_t v62 = (CGImage *)objc_msgSend(v60, sel_CGImage);
      if (v62)
      {
        CGImageRef v24 = v62;
        objc_msgSend(v61, sel_scale);
        double v22 = v63;

LABEL_54:
        __int16 v41 = 1;
        goto LABEL_57;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_64;
  }
  if ((a2 & 1) == 0)
  {

    __int16 v41 = 0;
    CGImageRef v24 = v13;
    goto LABEL_57;
  }
  CGImageRef v24 = v13;
  id v43 = v9;
  objc_msgSend(v43, sel_size);
  double v45 = v44 * 0.333333333;
  objc_msgSend(v43, sel_size);
  double v47 = v46 * 0.333333333;
  objc_msgSend(v43, sel_scale);
  id v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B558]), sel_initWithSize_scale_, v45, v47, v48);

  id v50 = objc_allocWithZone(MEMORY[0x263F4B540]);
  uint64_t v51 = (void *)sub_248766008();
  id v52 = objc_msgSend(v50, sel_initWithType_, v51);

  id v53 = objc_msgSend(v52, sel_prepareImageForDescriptor_, v49);
  if (!v53)
  {

    __int16 v41 = 0;
    goto LABEL_57;
  }
  unint64_t v54 = (CGImage *)objc_msgSend(v53, sel_CGImage);
  if (v54)
  {
    uint64_t v55 = v54;
    objc_msgSend(v53, sel_scale);
    uint64_t v70 = v24;
    double v71 = v22;
    LOWORD(v72) = 0;
    CGImageRef v67 = v55;
    double v68 = v56;
    LOWORD(v69) = 0;
    sub_248756BC0((uint64_t)&v70, (uint64_t)&v67, (uint64_t)&v73);

    unsigned int v57 = v73;
    if (!v73)
    {
      __int16 v41 = 0;
      goto LABEL_39;
    }
    __int16 v58 = v75;
    double v22 = v74;

    __int16 v41 = v58 & 1;
    if ((v58 & 0x100) == 0)
    {
      __int16 v42 = 0;
      unint64_t v13 = v57;
      goto LABEL_58;
    }
    unint64_t v13 = v57;
LABEL_61:
    __int16 v42 = 256;
    goto LABEL_58;
  }
LABEL_66:

  __break(1u);
}

double static IconProvider.Spec.effectiveSizeWithBadge.getter()
{
  return 65.0;
}

double static IconProvider.Spec.effectiveSizeWithoutBadge.getter()
{
  return 60.0;
}

void destroy for ContactFormatter(id *a1)
{
}

uint64_t _s9AskToCore4IconVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for Icon(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Icon(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for Icon(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 18)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Icon(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 18) = 1;
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
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Icon()
{
  return &type metadata for Icon;
}

ValueMetadata *type metadata accessor for IconProvider()
{
  return &type metadata for IconProvider;
}

ValueMetadata *type metadata accessor for IconProvider.Spec()
{
  return &type metadata for IconProvider.Spec;
}

uint64_t sub_2487580A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269324598);
    uint64_t v3 = sub_248766298();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      id v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_248766528();
      swift_bridgeObjectRetain();
      sub_248766068();
      uint64_t result = sub_248766588();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        os_log_type_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_248766498(), (result & 1) != 0))
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
          os_log_type_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_248766498();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      char v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
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
  return MEMORY[0x263F8EE88];
}

unint64_t ATDaemonMachServiceName.getter()
{
  return 0xD000000000000010;
}

uint64_t initializeBufferWithCopyOfBuffer for ContactFormatter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for ContactFormatter(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for ContactFormatter(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactFormatter(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactFormatter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 9) = 1;
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
    *(unsigned char *)(result + 9) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactFormatter()
{
  return &type metadata for ContactFormatter;
}

BOOL sub_2487583D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2487583E8()
{
  return sub_248766588();
}

uint64_t sub_248758430()
{
  return sub_248766538();
}

uint64_t sub_24875845C()
{
  return sub_248766588();
}

void sub_2487584A0(id *a1, char a2, int a3, int a4, id a5)
{
  unint64_t v6 = (unint64_t)a1;
  id v7 = objc_msgSend(a5, sel_stringFromContact_, a1);
  if (v7)
  {
    uint64_t v8 = v7;
    sub_248766018();

    return;
  }
  id v9 = objc_msgSend((id)v6, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693245A0);
  unint64_t v10 = sub_248766118();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_248766308();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_5;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_11;
  }
LABEL_5:
  if ((v10 & 0xC000000000000001) != 0)
  {
    id v11 = (id)MEMORY[0x24C57DD00](0, v10);
  }
  else
  {
    if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_248766308();
      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
    id v11 = *(id *)(v10 + 32);
  }
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v12, sel_value);

  if (v13)
  {
    sub_248766018();

    return;
  }
LABEL_12:
  if ((a2 & 1) == 0)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    return;
  }
  id v15 = objc_msgSend((id)v6, sel_phoneNumbers);
  unint64_t v6 = sub_248766118();

  if (v6 >> 62) {
    goto LABEL_21;
  }
  if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
LABEL_15:
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v16 = (id)MEMORY[0x24C57DD00](0, v6);
    goto LABEL_18;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v16 = *(id *)(v6 + 32);
LABEL_18:
    BOOL v17 = v16;
    swift_bridgeObjectRelease();
    id v18 = objc_msgSend(v17, sel_value);

    id v19 = objc_msgSend(v18, sel_stringValue);
    sub_248766018();

    return;
  }
  __break(1u);
}

uint64_t getEnumTagSinglePayload for ContactFormatter.Style(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ContactFormatter.Style(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x248758894);
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

unsigned char *sub_2487588BC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ContactFormatter.Style()
{
  return &type metadata for ContactFormatter.Style;
}

unint64_t sub_2487588DC()
{
  unint64_t result = qword_2693245A8;
  if (!qword_2693245A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693245A8);
  }
  return result;
}

unint64_t sub_248758934(char a1)
{
  unint64_t result = 0x64496D6574737973;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E6F6973726576;
      break;
    case 2:
      unint64_t result = 25705;
      break;
    case 3:
      unint64_t result = 0x6369706F74;
      break;
    case 4:
      unint64_t result = 0x656C746974;
      break;
    case 5:
      unint64_t result = 0x7972616D6D7573;
      break;
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0x6843726577736E61;
      break;
    case 8:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000021;
      break;
    case 11:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 12:
      unint64_t result = 0x6974617269707865;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_248758AD8(char a1)
{
  unint64_t result = 0x64496D6574737973;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E6F6973726576;
      break;
    case 2:
      unint64_t result = 25705;
      break;
    case 3:
      unint64_t result = 0x6369706F74;
      break;
    case 4:
      unint64_t result = 0x656C746974;
      break;
    case 5:
      unint64_t result = 0x7972616D6D7573;
      break;
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0x6843726577736E61;
      break;
    case 8:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000021;
      break;
    case 11:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 12:
      unint64_t result = 0x6974617269707865;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_248758C7C(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_248758934(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_248758934(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_248766498();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_248758D08()
{
  char v1 = *v0;
  sub_248766528();
  sub_248758934(v1);
  sub_248766068();
  swift_bridgeObjectRelease();
  return sub_248766588();
}

uint64_t sub_248758D6C()
{
  sub_248758934(*v0);
  sub_248766068();

  return swift_bridgeObjectRelease();
}

uint64_t sub_248758DC0()
{
  char v1 = *v0;
  sub_248766528();
  sub_248758934(v1);
  sub_248766068();
  swift_bridgeObjectRelease();
  return sub_248766588();
}

uint64_t sub_248758E20@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24875E400();
  *a1 = result;
  return result;
}

unint64_t sub_248758E50@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_248758934(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_248758E7C()
{
  return sub_248758AD8(*v0);
}

uint64_t sub_248758E84@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24875E400();
  *a1 = result;
  return result;
}

void sub_248758EAC(unsigned char *a1@<X8>)
{
  *a1 = 13;
}

uint64_t sub_248758EB8(uint64_t a1)
{
  unint64_t v2 = sub_24875E8A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_248758EF4(uint64_t a1)
{
  unint64_t v2 = sub_24875E8A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ATQuestion.Topic.rawValue.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___ATQuestionTopic_rawValue);
  swift_bridgeObjectRetain();
  return v1;
}

id ATQuestion.Topic.__allocating_init(rawValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  uint64_t v6 = &v5[OBJC_IVAR___ATQuestionTopic_rawValue];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id ATQuestion.Topic.init(rawValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = &v2[OBJC_IVAR___ATQuestionTopic_rawValue];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  v8.receiver = v2;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t ATQuestion.Topic.isEqual(_:)(uint64_t a1)
{
  swift_getObjectType();
  sub_248749E0C(a1, (uint64_t)v7, &qword_2693244D8);
  if (!v8)
  {
    sub_2487495A4((uint64_t)v7, &qword_2693244D8);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    char v4 = 0;
    return v4 & 1;
  }
  if (*(void *)(v1 + OBJC_IVAR___ATQuestionTopic_rawValue) == *(void *)&v6[OBJC_IVAR___ATQuestionTopic_rawValue]
    && *(void *)(v1 + OBJC_IVAR___ATQuestionTopic_rawValue + 8) == *(void *)&v6[OBJC_IVAR___ATQuestionTopic_rawValue
                                                                                  + 8])
  {

    char v4 = 1;
  }
  else
  {
    char v4 = sub_248766498();
  }
  return v4 & 1;
}

uint64_t ATQuestion.Topic.hash.getter()
{
  return sub_248766098();
}

id ATQuestion.Topic.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void ATQuestion.Topic.init()()
{
}

id sub_2487592A8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = (char *)objc_allocWithZone(v2);
  BOOL v7 = &v6[OBJC_IVAR___ATQuestionTopic_rawValue];
  *(void *)BOOL v7 = v4;
  *((void *)v7 + 1) = v5;
  v9.receiver = v6;
  v9.super_class = v2;
  id result = objc_msgSendSuper2(&v9, sel_init);
  *a2 = result;
  return result;
}

uint64_t sub_24875930C@<X0>(void *a1@<X8>)
{
  return sub_24875DAE0(&OBJC_IVAR___ATQuestionTopic_rawValue, a1);
}

uint64_t sub_248759318(uint64_t a1, uint64_t a2)
{
  return sub_2487660D8();
}

uint64_t sub_24875939C(uint64_t a1, uint64_t a2)
{
  return sub_2487660B8();
}

uint64_t ATQuestion.systemId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_systemId;
  uint64_t v4 = sub_248765F58();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

double ATQuestion.version.getter()
{
  return *(double *)(v0 + OBJC_IVAR____TtC5AskTo10ATQuestion_version);
}

id sub_2487594AC()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_248766008();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t ATQuestion.id.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC5AskTo10ATQuestion_id);
  swift_bridgeObjectRetain();
  return v1;
}

id ATQuestion.topic.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  unint64_t v2 = *v1;

  return v2;
}

void ATQuestion.topic.setter(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = a1;
}

uint64_t (*ATQuestion.topic.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.title.getter()
{
  return sub_248759814(&OBJC_IVAR____TtC5AskTo10ATQuestion_title);
}

uint64_t ATQuestion.title.setter(uint64_t a1, uint64_t a2)
{
  return sub_2487598EC(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_title);
}

uint64_t (*ATQuestion.title.modify())()
{
  return j_j__swift_endAccess;
}

id sub_248759790()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_248766008();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t ATQuestion.summary.getter()
{
  return sub_248759814(&OBJC_IVAR____TtC5AskTo10ATQuestion_summary);
}

uint64_t sub_248759814(void *a1)
{
  unint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_248759874(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_248766018();
  uint64_t v8 = v7;
  objc_super v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *objc_super v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t ATQuestion.summary.setter(uint64_t a1, uint64_t a2)
{
  return sub_2487598EC(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_summary);
}

uint64_t sub_2487598EC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*ATQuestion.summary.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.notificationText.getter()
{
  return sub_248759814(&OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText);
}

uint64_t ATQuestion.notificationText.setter(uint64_t a1, uint64_t a2)
{
  return sub_2487598EC(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText);
}

uint64_t (*ATQuestion.notificationText.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.answerChoices.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ATQuestion.answerChoices.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*ATQuestion.answerChoices.modify())()
{
  return j__swift_endAccess;
}

uint64_t ATQuestion.associatedContentDisplayName.getter()
{
  return sub_248759814(&OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName);
}

uint64_t ATQuestion.associatedContentDisplayName.setter(uint64_t a1, uint64_t a2)
{
  return sub_2487598EC(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName);
}

uint64_t (*ATQuestion.associatedContentDisplayName.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.associatedContentIdentifier.getter()
{
  return sub_248759814(&OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier);
}

uint64_t ATQuestion.associatedContentIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_2487598EC(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier);
}

uint64_t (*ATQuestion.associatedContentIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.associatedContentBundleIdentifier.getter()
{
  return sub_248759814(&OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
}

uint64_t ATQuestion.associatedContentBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_2487598EC(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
}

uint64_t (*ATQuestion.associatedContentBundleIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

id sub_248759DD4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess();
  if (*(void *)(v3 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_248766008();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t ATQuestion.associatedContentAdamIdentifier.getter()
{
  return sub_248759814(&OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
}

uint64_t sub_248759E74(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v6 = sub_248766018();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  objc_super v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *objc_super v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t ATQuestion.associatedContentAdamIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_2487598EC(a1, a2, &OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
}

uint64_t (*ATQuestion.associatedContentAdamIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ATQuestion.expirationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  return sub_248749E0C(v3, a1, &qword_2693245C0);
}

uint64_t ATQuestion.expirationDate.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  sub_24875A294(a1, v3);
  return swift_endAccess();
}

uint64_t sub_24875A294(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693245C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*ATQuestion.expirationDate.modify())()
{
  return j_j__swift_endAccess;
}

id ATQuestion.__allocating_init(topic:title:summary:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v14 = sub_248765F58();
  uint64_t v4 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone(v2);
  sub_248765F48();
  sub_248765F08();
  uint64_t v8 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  objc_super v9 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  unint64_t v10 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v7, sel_initWithId_topic_title_summary_, v8, a1, v9, v10);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v14);
  return v11;
}

id ATQuestion.init(topic:title:summary:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v13 = sub_248765F58();
  uint64_t v4 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248765F48();
  sub_248765F08();
  id v7 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  objc_super v9 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v2, sel_initWithId_topic_title_summary_, v7, a1, v8, v9);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v13);
  return v10;
}

id ATQuestion.__allocating_init(id:topic:title:summary:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  id v18 = a3;
  uint64_t v19 = sub_248765F58();
  uint64_t v5 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  id v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_allocWithZone(v4);
  sub_248765F48();
  objc_super v9 = (void *)sub_248765F18();
  id v10 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  id v11 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  type metadata accessor for ATAnswerChoice();
  uint64_t v13 = (void *)sub_248766108();
  uint64_t v14 = v8;
  id v15 = v18;
  id v16 = objc_msgSend(v14, sel_initWithSystemId_version_id_topic_title_summary_notificationText_answerChoices_, v9, v10, v18, v11, v12, 0, 1.0, v13);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v19);
  return v16;
}

id ATQuestion.init(id:topic:title:summary:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = sub_24875E44C(a1, a2, (uint64_t)a3);

  return v4;
}

id ATQuestion.__allocating_init(systemId:version:id:topic:title:summary:notificationText:answerChoices:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, long long a10, uint64_t a11)
{
  id v21 = objc_allocWithZone(v11);
  id v22 = sub_24875E604(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, *((uint64_t *)&a10 + 1), a11);

  return v22;
}

id ATQuestion.init(systemId:version:id:topic:title:summary:notificationText:answerChoices:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  id v13 = sub_24875E604(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);

  return v13;
}

id ATQuestion.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ATQuestion.init(from:)(a1);
}

id ATQuestion.init(from:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693245C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_248765F58();
  uint64_t v65 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v64 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693245C8);
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  objc_super v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText];
  *(void *)id v10 = 0;
  *((void *)v10 + 1) = 0;
  __int16 v75 = (uint64_t *)v10;
  double v74 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices];
  *(void *)&v1[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices] = MEMORY[0x263F8EE78];
  id v11 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName];
  *(void *)id v11 = 0;
  *((void *)v11 + 1) = 0;
  uint64_t v76 = (uint64_t *)v11;
  uint64_t v12 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  uint64_t v73 = (uint64_t *)v12;
  id v13 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier];
  *(void *)id v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v72 = (uint64_t *)v13;
  uint64_t v14 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  double v71 = (uint64_t *)v14;
  uint64_t v15 = (uint64_t)&v1[OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate];
  uint64_t v16 = sub_248765EF8();
  BOOL v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v69 = v15;
  v17(v15, 1, 1, v16);
  uint64_t v18 = a1[3];
  CGImageRef v67 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_24875E8A4();
  v85 = v1;
  double v66 = v9;
  uint64_t v19 = (uint64_t)v68;
  sub_2487665A8();
  if (v19)
  {
    BOOL v23 = v85;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v67);
    id v24 = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2487495A4(v69, &qword_2693245C0);

    swift_deallocPartialClassInstance();
  }
  else
  {
    double v68 = v5;
    uint64_t v20 = v62;
    LOBYTE(v84) = 0;
    sub_24875F3B4(&qword_2693245D8, 255, MEMORY[0x263F07508]);
    sub_2487663D8();
    id v21 = v75;
    id v22 = v74;
    CFDataRef v26 = v85;
    (*(void (**)(char *, char *, uint64_t))(v65 + 32))(&v85[OBJC_IVAR____TtC5AskTo10ATQuestion_systemId], v64, v6);
    LOBYTE(v84) = 1;
    sub_2487663C8();
    *(void *)&v26[OBJC_IVAR____TtC5AskTo10ATQuestion_version] = v27;
    LOBYTE(v84) = 2;
    uint64_t v28 = sub_2487663B8();
    uint64_t v29 = (uint64_t *)&v26[OBJC_IVAR____TtC5AskTo10ATQuestion_id];
    *uint64_t v29 = v28;
    v29[1] = v30;
    type metadata accessor for ATQuestion.Topic();
    char v83 = 3;
    sub_24875F3B4(&qword_2693245E0, v31, (void (*)(uint64_t))type metadata accessor for ATQuestion.Topic);
    sub_2487663D8();
    *(void *)&v26[OBJC_IVAR____TtC5AskTo10ATQuestion_topic] = v84;
    LOBYTE(v84) = 4;
    uint64_t v32 = sub_2487663B8();
    char v33 = (uint64_t *)&v26[OBJC_IVAR____TtC5AskTo10ATQuestion_title];
    *char v33 = v32;
    v33[1] = v34;
    LOBYTE(v84) = 5;
    uint64_t v35 = sub_2487663B8();
    id v36 = (uint64_t *)&v26[OBJC_IVAR____TtC5AskTo10ATQuestion_summary];
    *id v36 = v35;
    v36[1] = v37;
    LOBYTE(v84) = 6;
    uint64_t v38 = sub_248766368();
    uint64_t v40 = v39;
    swift_beginAccess();
    uint64_t *v21 = v38;
    v21[1] = v40;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693245E8);
    char v83 = 7;
    sub_24875E91C(&qword_2693245F0, &qword_2693245F8);
    sub_2487663D8();
    uint64_t v41 = v82;
    swift_beginAccess();
    *(void *)id v22 = v41;
    swift_bridgeObjectRelease();
    LOBYTE(v82) = 8;
    uint64_t v42 = sub_248766368();
    id v64 = v43;
    uint64_t v44 = v42;
    double v45 = v76;
    swift_beginAccess();
    double v46 = v64;
    *double v45 = v44;
    v45[1] = (uint64_t)v46;
    swift_bridgeObjectRelease();
    char v81 = 9;
    uint64_t v47 = sub_248766368();
    uint64_t v49 = v48;
    id v50 = v73;
    swift_beginAccess();
    *id v50 = v47;
    v50[1] = v49;
    swift_bridgeObjectRelease();
    char v80 = 10;
    uint64_t v51 = sub_248766368();
    uint64_t v53 = v52;
    unint64_t v54 = v72;
    swift_beginAccess();
    *unint64_t v54 = v51;
    v54[1] = v53;
    swift_bridgeObjectRelease();
    char v79 = 11;
    uint64_t v55 = sub_248766368();
    uint64_t v57 = v56;
    __int16 v58 = v71;
    swift_beginAccess();
    *__int16 v58 = v55;
    v58[1] = v57;
    swift_bridgeObjectRelease();
    char v78 = 12;
    sub_24875F3B4(&qword_269324600, 255, MEMORY[0x263F07490]);
    sub_248766388();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v66, v63);
    uint64_t v59 = v69;
    swift_beginAccess();
    sub_24875A294((uint64_t)v68, v59);
    swift_endAccess();
    id v60 = v85;

    v77.receiver = v60;
    v77.super_class = ObjectType;
    id v24 = objc_msgSendSuper2(&v77, sel_init);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v67);
  }
  return v24;
}

uint64_t ATQuestion.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693245C0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269324608);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24875E8A4();
  sub_2487665B8();
  char v24 = 0;
  sub_248765F58();
  sub_24875F3B4(&qword_269324610, 255, MEMORY[0x263F07508]);
  sub_248766458();
  if (!v2)
  {
    char v24 = 1;
    sub_248766448();
    char v24 = 2;
    sub_248766428();
    uint64_t v12 = (uint64_t *)(v3 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
    swift_beginAccess();
    uint64_t v23 = *v12;
    char v22 = 3;
    type metadata accessor for ATQuestion.Topic();
    sub_24875F3B4(&qword_269324618, v13, (void (*)(uint64_t))type metadata accessor for ATQuestion.Topic);
    sub_248766458();
    swift_beginAccess();
    char v22 = 4;
    swift_bridgeObjectRetain();
    sub_248766428();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    char v21 = 5;
    swift_bridgeObjectRetain();
    sub_248766428();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    char v20 = 6;
    swift_bridgeObjectRetain();
    sub_2487663F8();
    swift_bridgeObjectRelease();
    uint64_t v15 = (uint64_t *)(v3 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
    swift_beginAccess();
    uint64_t v19 = *v15;
    char v18 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2693245E8);
    sub_24875E91C((unint64_t *)&unk_269324620, (unint64_t *)&unk_269324720);
    sub_248766458();
    swift_beginAccess();
    char v18 = 8;
    swift_bridgeObjectRetain();
    sub_2487663F8();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v17[56] = 9;
    swift_bridgeObjectRetain();
    sub_2487663F8();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v17[32] = 10;
    swift_bridgeObjectRetain();
    sub_2487663F8();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v17[8] = 11;
    swift_bridgeObjectRetain();
    sub_2487663F8();
    swift_bridgeObjectRelease();
    uint64_t v16 = v3 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
    swift_beginAccess();
    sub_248749E0C(v16, (uint64_t)v7, &qword_2693245C0);
    char v25 = 12;
    sub_248765EF8();
    sub_24875F3B4(&qword_269324630, 255, MEMORY[0x263F07490]);
    sub_248766408();
    sub_2487495A4((uint64_t)v7, &qword_2693245C0);
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t ATQuestion.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_248765EF8();
  uint64_t v82 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269324638);
  MEMORY[0x270FA5388](v7);
  char v83 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693245C0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v78 - v14;
  MEMORY[0x270FA5388](v13);
  BOOL v17 = (char *)&v78 - v16;
  sub_248749E0C(a1, (uint64_t)v85, &qword_2693244D8);
  if (!v86)
  {
    uint64_t v39 = &qword_2693244D8;
    uint64_t v40 = v85;
LABEL_22:
    sub_2487495A4((uint64_t)v40, v39);
    goto LABEL_24;
  }
  if (swift_dynamicCast())
  {
    char v18 = v84;
    if ((sub_248765F28() & 1) == 0
      || *(double *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_version) != *(double *)&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_version]
      || (*(void *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_id) != *(void *)&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_id]
       || *(void *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_id + 8) != *(void *)&v18[OBJC_IVAR____TtC5AskTo10ATQuestion_id
                                                                                       + 8])
      && (sub_248766498() & 1) == 0)
    {

      goto LABEL_24;
    }
    char v79 = v6;
    uint64_t v80 = v4;
    char v81 = (char *)sub_248752368(0, &qword_2693244E0);
    uint64_t v19 = (void **)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
    swift_beginAccess();
    char v20 = v18;
    char v21 = *v19;
    char v22 = (void **)&v20[OBJC_IVAR____TtC5AskTo10ATQuestion_topic];
    swift_beginAccess();
    uint64_t v23 = *v22;
    id v24 = v21;
    id v25 = v23;
    LOBYTE(v21) = sub_248766218();

    if (v21)
    {
      CFDataRef v26 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_title);
      swift_beginAccess();
      uint64_t v27 = *v26;
      uint64_t v28 = v26[1];
      char v81 = v20;
      uint64_t v29 = &v20[OBJC_IVAR____TtC5AskTo10ATQuestion_title];
      swift_beginAccess();
      if ((v27 != *(void *)v29 || v28 != *((void *)v29 + 1)) && (sub_248766498() & 1) == 0) {
        goto LABEL_27;
      }
      uint64_t v30 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_summary);
      swift_beginAccess();
      uint64_t v31 = *v30;
      uint64_t v32 = v30[1];
      char v33 = &v81[OBJC_IVAR____TtC5AskTo10ATQuestion_summary];
      swift_beginAccess();
      if ((v31 != *(void *)v33 || v32 != *((void *)v33 + 1)) && (sub_248766498() & 1) == 0) {
        goto LABEL_27;
      }
      uint64_t v34 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText);
      swift_beginAccess();
      uint64_t v36 = *v34;
      uint64_t v35 = v34[1];
      uint64_t v37 = &v81[OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText];
      swift_beginAccess();
      uint64_t v38 = *((void *)v37 + 1);
      if (v35)
      {
        if (!v38 || (v36 != *(void *)v37 || v35 != v38) && (sub_248766498() & 1) == 0) {
          goto LABEL_27;
        }
      }
      else if (v38)
      {
        goto LABEL_27;
      }
      id v43 = (unint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
      swift_beginAccess();
      unint64_t v44 = *v43;
      char v20 = v81;
      double v45 = (uint64_t *)&v81[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices];
      swift_beginAccess();
      uint64_t v46 = *v45;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unsigned __int8 v47 = sub_2487515E0(v44, v46);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v47)
      {
        uint64_t v48 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName);
        swift_beginAccess();
        uint64_t v49 = v48[1];
        uint64_t v78 = *v48;
        id v50 = &v20[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName];
        swift_beginAccess();
        uint64_t v51 = *((void *)v50 + 1);
        if (v49)
        {
          if (!v51 || (v78 != *(void *)v50 || v49 != v51) && (sub_248766498() & 1) == 0) {
            goto LABEL_27;
          }
        }
        else if (v51)
        {
          goto LABEL_27;
        }
        uint64_t v52 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier);
        swift_beginAccess();
        uint64_t v54 = *v52;
        uint64_t v53 = v52[1];
        uint64_t v55 = &v81[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier];
        swift_beginAccess();
        uint64_t v56 = *((void *)v55 + 1);
        if (v53)
        {
          if (!v56 || (v54 != *(void *)v55 || v53 != v56) && (sub_248766498() & 1) == 0) {
            goto LABEL_27;
          }
        }
        else if (v56)
        {
          goto LABEL_27;
        }
        uint64_t v57 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
        swift_beginAccess();
        uint64_t v59 = *v57;
        uint64_t v58 = v57[1];
        id v60 = &v81[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier];
        swift_beginAccess();
        uint64_t v61 = *((void *)v60 + 1);
        if (v58)
        {
          if (!v61 || (v59 != *(void *)v60 || v58 != v61) && (sub_248766498() & 1) == 0) {
            goto LABEL_27;
          }
        }
        else if (v61)
        {
          goto LABEL_27;
        }
        uint64_t v62 = (uint64_t *)(v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
        swift_beginAccess();
        uint64_t v64 = *v62;
        uint64_t v63 = v62[1];
        uint64_t v65 = &v81[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier];
        swift_beginAccess();
        uint64_t v66 = *((void *)v65 + 1);
        if (v63)
        {
          if (v66 && (v64 == *(void *)v65 && v63 == v66 || (sub_248766498() & 1) != 0)) {
            goto LABEL_58;
          }
        }
        else if (!v66)
        {
LABEL_58:
          uint64_t v67 = v2 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
          swift_beginAccess();
          sub_248749E0C(v67, (uint64_t)v17, &qword_2693245C0);
          double v68 = &v81[OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate];
          swift_beginAccess();
          sub_248749E0C((uint64_t)v68, (uint64_t)v15, &qword_2693245C0);
          uint64_t v69 = *(int *)(v7 + 48);
          uint64_t v70 = (uint64_t)v83;
          uint64_t v71 = (uint64_t)&v83[v69];
          sub_248749E0C((uint64_t)v17, (uint64_t)v83, &qword_2693245C0);
          sub_248749E0C((uint64_t)v15, v71, &qword_2693245C0);
          uint64_t v72 = v82;
          uint64_t v73 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v82 + 48);
          uint64_t v74 = v70;
          uint64_t v75 = v80;
          if (v73(v74, 1, v80) == 1)
          {

            sub_2487495A4((uint64_t)v15, &qword_2693245C0);
            sub_2487495A4((uint64_t)v17, &qword_2693245C0);
            if (v73(v71, 1, v75) == 1)
            {
              sub_2487495A4((uint64_t)v83, &qword_2693245C0);
              char v41 = 1;
              return v41 & 1;
            }
          }
          else
          {
            sub_248749E0C((uint64_t)v83, (uint64_t)v12, &qword_2693245C0);
            if (v73(v71, 1, v75) != 1)
            {
              uint64_t v76 = v79;
              (*(void (**)(char *, uint64_t, uint64_t))(v72 + 32))(v79, v71, v75);
              sub_24875F3B4(&qword_269324648, 255, MEMORY[0x263F07490]);
              char v41 = sub_248765FF8();

              objc_super v77 = *(void (**)(char *, uint64_t))(v72 + 8);
              v77(v76, v75);
              sub_2487495A4((uint64_t)v15, &qword_2693245C0);
              sub_2487495A4((uint64_t)v17, &qword_2693245C0);
              v77(v12, v75);
              sub_2487495A4((uint64_t)v83, &qword_2693245C0);
              return v41 & 1;
            }

            sub_2487495A4((uint64_t)v15, &qword_2693245C0);
            sub_2487495A4((uint64_t)v17, &qword_2693245C0);
            (*(void (**)(char *, uint64_t))(v72 + 8))(v12, v75);
          }
          uint64_t v39 = (uint64_t *)&unk_269324638;
          uint64_t v40 = v83;
          goto LABEL_22;
        }
LABEL_27:

        goto LABEL_24;
      }
    }
  }
LABEL_24:
  char v41 = 0;
  return v41 & 1;
}

uint64_t sub_24875CA0C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_248766278();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = a1;
  }
  char v8 = a4(v10);

  sub_2487495A4((uint64_t)v10, &qword_2693244D8);
  return v8 & 1;
}

uint64_t ATQuestion.hash.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_248765EF8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693245C0);
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = &v20[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_248766598();
  sub_248765F58();
  sub_24875F3B4(&qword_269324650, 255, MEMORY[0x263F07508]);
  sub_248765FE8();
  sub_248766568();
  swift_bridgeObjectRetain();
  sub_248766068();
  swift_bridgeObjectRelease();
  uint64_t v9 = (id *)(v0 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  id v10 = *v9;
  sub_248766228();

  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_248766068();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_248766068();
  swift_bridgeObjectRelease();
  uint64_t v11 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText;
  swift_beginAccess();
  if (*(void *)(v11 + 8))
  {
    sub_248766548();
    swift_bridgeObjectRetain();
    sub_248766068();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_248766548();
  }
  uint64_t v12 = (uint64_t *)(v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
  swift_beginAccess();
  uint64_t v13 = *v12;
  swift_bridgeObjectRetain();
  sub_2487518DC(v21, v13);
  swift_bridgeObjectRelease();
  uint64_t v14 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName;
  swift_beginAccess();
  if (*(void *)(v14 + 8))
  {
    sub_248766548();
    swift_bridgeObjectRetain();
    sub_248766068();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_248766548();
  }
  uint64_t v15 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier;
  swift_beginAccess();
  if (*(void *)(v15 + 8))
  {
    sub_248766548();
    swift_bridgeObjectRetain();
    sub_248766068();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_248766548();
  }
  uint64_t v16 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier;
  swift_beginAccess();
  if (*(void *)(v16 + 8))
  {
    sub_248766548();
    swift_bridgeObjectRetain();
    sub_248766068();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_248766548();
  }
  uint64_t v17 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier;
  swift_beginAccess();
  if (*(void *)(v17 + 8))
  {
    sub_248766548();
    swift_bridgeObjectRetain();
    sub_248766068();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_248766548();
  }
  uint64_t v18 = v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  sub_248749E0C(v18, (uint64_t)v8, &qword_2693245C0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_248766548();
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_248766548();
    sub_24875F3B4(&qword_269324658, 255, MEMORY[0x263F07490]);
    sub_248765FE8();
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  }
  long long v25 = v21[2];
  long long v26 = v21[3];
  uint64_t v27 = v22;
  long long v23 = v21[0];
  long long v24 = v21[1];
  return sub_248766578();
}

uint64_t ATQuestion.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_248765EF8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjectType = 0;
  unint64_t v25 = 0xE000000000000000;
  sub_2487662A8();
  uint64_t v26 = ObjectType;
  unint64_t v27 = v25;
  uint64_t ObjectType = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269324660);
  sub_248766058();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  sub_248765F08();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  sub_248766188();
  sub_248766078();
  swift_bridgeObjectRetain();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  uint64_t v6 = v0 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v6, 1, v2))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    sub_248765EC8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_248766078();
  swift_bridgeObjectRelease();
  sub_248766078();
  uint64_t v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
  swift_beginAccess();
  uint64_t v8 = *v7;
  if (!((unint64_t)*v7 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_5;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_16:
    MEMORY[0x24C57DB60](v12, MEMORY[0x263F8D310]);
    sub_248766078();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_248766078();
    return v26;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_248766308();
  if (!v9) {
    goto LABEL_15;
  }
LABEL_5:
  uint64_t v23 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24875E274(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    uint64_t v11 = 0;
    uint64_t v12 = v23;
    unint64_t v22 = v8 & 0xC000000000000001;
    uint64_t v13 = v8;
    do
    {
      if (v22) {
        uint64_t v14 = (char *)MEMORY[0x24C57DD00](v11, v8);
      }
      else {
        uint64_t v14 = (char *)*(id *)(v8 + 8 * v11 + 32);
      }
      uint64_t v15 = v14;
      uint64_t v17 = *(void *)&v14[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
      uint64_t v16 = *(void *)&v14[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id + 8];
      swift_bridgeObjectRetain();

      uint64_t v23 = v12;
      unint64_t v19 = *(void *)(v12 + 16);
      unint64_t v18 = *(void *)(v12 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_24875E274(v18 > 1, v19 + 1, 1);
        uint64_t v12 = v23;
      }
      ++v11;
      *(void *)(v12 + 16) = v19 + 1;
      uint64_t v20 = v12 + 16 * v19;
      *(void *)(v20 + 32) = v17;
      *(void *)(v20 + 40) = v16;
      uint64_t v8 = v13;
    }
    while (v9 != v11);
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

void ATQuestion.init()()
{
}

id _s5AskTo10ATQuestionC5TopicCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24875DAD4@<X0>(void *a1@<X8>)
{
  return sub_24875DAE0(&OBJC_IVAR____TtC5AskTo10ATQuestion_id, a1);
}

uint64_t sub_24875DAE0@<X0>(void *a1@<X2>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*v2 + *a1);
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

id sub_24875DAF8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  id result = ATQuestion.init(from:)(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_24875DB48(void *a1)
{
  return ATQuestion.encode(to:)(a1);
}

uint64_t static ATQuestion.supportsSecureCoding.getter()
{
  return 1;
}

id ATQuestion.init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

{
  void *v1;
  objc_class *ObjectType;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v15;
  id v16;
  void *v17;
  void *v18;

  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_248752368(0, &qword_2693244B8);
  uint64_t v4 = v1;
  uint64_t v5 = sub_248766208();
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = sub_248765EB8();
    uint64_t v9 = v8;
    id v10 = objc_allocWithZone(MEMORY[0x263F08928]);
    uint64_t v11 = sub_2487521BC();
    sub_248749614(v7, v9);
    sub_24875F3B4((unint64_t *)&unk_2693247D0, 255, (void (*)(uint64_t))type metadata accessor for ATQuestion);
    sub_2487661F8();

    if (v18)
    {
      uint64_t v15 = objc_allocWithZone(ObjectType);
      uint64_t v16 = sub_24875EA00((uint64_t)v18);

      swift_getObjectType();
      swift_deallocPartialClassInstance();
      uint64_t v13 = v16;
      objc_msgSend(v11, sel_finishDecoding);

      return v13;
    }
    sub_2487661C8();
    sub_248752368(0, (unint64_t *)&unk_2693244C0);
    uint64_t v17 = (void *)sub_248766238();
    sub_248765F78();

    objc_msgSend(v11, sel_finishDecoding);
  }
  else
  {

    sub_2487661C8();
    sub_248752368(0, (unint64_t *)&unk_2693244C0);
    uint64_t v12 = (void *)sub_248766238();
    sub_248765F78();
  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall ATQuestion.encode(with:)(NSCoder with)
{
  swift_getObjectType();
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  sub_24875F3B4((unint64_t *)&unk_269324490, 255, (void (*)(uint64_t))type metadata accessor for ATQuestion);
  sub_2487661E8();
  objc_msgSend(v2, sel_finishEncoding);
  id v3 = objc_msgSend(v2, sel_encodedData);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = (void *)sub_248766008();
    [(objc_class *)with.super.isa encodeObject:v4 forKey:v5];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24875E274(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24875E294(a1, a2, a3, *v3);
  *id v3 = (char *)result;
  return result;
}

uint64_t sub_24875E294(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269324760);
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
  uint64_t result = sub_248766348();
  __break(1u);
  return result;
}

uint64_t sub_24875E400()
{
  unint64_t v0 = sub_248766358();
  swift_bridgeObjectRelease();
  if (v0 >= 0xD) {
    return 13;
  }
  else {
    return v0;
  }
}

id sub_24875E44C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = sub_248765F58();
  uint64_t v4 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248765F48();
  int64_t v7 = (void *)sub_248765F18();
  uint64_t v8 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  id v10 = (void *)sub_248766008();
  swift_bridgeObjectRelease();
  type metadata accessor for ATAnswerChoice();
  int64_t v11 = (void *)sub_248766108();
  id v12 = objc_msgSend(v14, sel_initWithSystemId_version_id_topic_title_summary_notificationText_answerChoices_, v7, v8, a3, v9, v10, 0, 1.0, v11);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  return v12;
}

id sub_24875E604(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13 = v12;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  unint64_t v19 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText];
  *(void *)unint64_t v19 = 0;
  *((void *)v19 + 1) = 0;
  uint64_t v20 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices];
  *(void *)&v12[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices] = MEMORY[0x263F8EE78];
  uint64_t v21 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  unint64_t v22 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier];
  *(void *)unint64_t v22 = 0;
  *((void *)v22 + 1) = 0;
  uint64_t v23 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier];
  *(void *)uint64_t v23 = 0;
  *((void *)v23 + 1) = 0;
  long long v24 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier];
  *(void *)long long v24 = 0;
  *((void *)v24 + 1) = 0;
  unint64_t v25 = &v12[OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate];
  uint64_t v26 = sub_248765EF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 1, 1, v26);
  unint64_t v27 = &v13[OBJC_IVAR____TtC5AskTo10ATQuestion_systemId];
  uint64_t v28 = sub_248765F58();
  uint64_t v29 = *(void *)(v28 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v27, a1, v28);
  *(double *)&v13[OBJC_IVAR____TtC5AskTo10ATQuestion_version] = a9;
  uint64_t v30 = &v13[OBJC_IVAR____TtC5AskTo10ATQuestion_id];
  *(void *)uint64_t v30 = a2;
  *((void *)v30 + 1) = a3;
  *(void *)&v13[OBJC_IVAR____TtC5AskTo10ATQuestion_topic] = a4;
  uint64_t v31 = &v13[OBJC_IVAR____TtC5AskTo10ATQuestion_title];
  *(void *)uint64_t v31 = a5;
  *((void *)v31 + 1) = a6;
  uint64_t v32 = &v13[OBJC_IVAR____TtC5AskTo10ATQuestion_summary];
  *(void *)uint64_t v32 = a7;
  *((void *)v32 + 1) = a8;
  swift_beginAccess();
  *(void *)unint64_t v19 = a10;
  *((void *)v19 + 1) = a11;
  char v33 = v13;
  id v34 = a4;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)uint64_t v20 = a12;

  swift_bridgeObjectRelease();
  v42.receiver = v33;
  v42.super_class = ObjectType;
  id v35 = objc_msgSendSuper2(&v42, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(a1, v28);
  return v35;
}

unint64_t sub_24875E8A4()
{
  unint64_t result = qword_2693245D0;
  if (!qword_2693245D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693245D0);
  }
  return result;
}

uint64_t type metadata accessor for ATQuestion.Topic()
{
  return self;
}

uint64_t sub_24875E91C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2693245E8);
    sub_24875F3B4(a2, 255, (void (*)(uint64_t))type metadata accessor for ATAnswerChoice);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for ATQuestion()
{
  uint64_t result = qword_269324668;
  if (!qword_269324668) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_24875EA00(uint64_t a1)
{
  id v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693245C0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v66 = (uint64_t)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText];
  *(void *)unint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  id v60 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices];
  *(void *)&v1[OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices] = MEMORY[0x263F8EE78];
  int64_t v7 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName];
  uint64_t v61 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName];
  *(void *)int64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier];
  uint64_t v62 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v9 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier];
  uint64_t v63 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier];
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  id v10 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier];
  uint64_t v64 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier];
  *(void *)id v10 = 0;
  *((void *)v10 + 1) = 0;
  int64_t v11 = &v1[OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate];
  uint64_t v65 = (uint64_t)v11;
  uint64_t v12 = sub_248765EF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_systemId;
  id v14 = &v2[OBJC_IVAR____TtC5AskTo10ATQuestion_systemId];
  uint64_t v15 = sub_248765F58();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v14, v13, v15);
  *(void *)&v2[OBJC_IVAR____TtC5AskTo10ATQuestion_version] = *(void *)(a1
                                                                         + OBJC_IVAR____TtC5AskTo10ATQuestion_version);
  uint64_t v17 = *(void *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_id);
  uint64_t v59 = *(void *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_id + 8);
  uint64_t v16 = v59;
  unint64_t v18 = &v2[OBJC_IVAR____TtC5AskTo10ATQuestion_id];
  *(void *)unint64_t v18 = v17;
  *((void *)v18 + 1) = v16;
  unint64_t v19 = (void **)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_topic);
  swift_beginAccess();
  uint64_t v20 = *v19;
  *(void *)&v2[OBJC_IVAR____TtC5AskTo10ATQuestion_topic] = *v19;
  uint64_t v21 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_title);
  swift_beginAccess();
  uint64_t v22 = *v21;
  uint64_t v23 = v21[1];
  long long v24 = &v2[OBJC_IVAR____TtC5AskTo10ATQuestion_title];
  *(void *)long long v24 = v22;
  *((void *)v24 + 1) = v23;
  unint64_t v25 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_summary);
  swift_beginAccess();
  uint64_t v26 = *v25;
  uint64_t v27 = v25[1];
  uint64_t v28 = &v2[OBJC_IVAR____TtC5AskTo10ATQuestion_summary];
  *(void *)uint64_t v28 = v26;
  *((void *)v28 + 1) = v27;
  uint64_t v29 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_notificationText);
  swift_beginAccess();
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  swift_beginAccess();
  *(void *)unint64_t v6 = v31;
  *((void *)v6 + 1) = v30;
  uint64_t v32 = v2;
  swift_bridgeObjectRetain();
  id v33 = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v34 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_answerChoices);
  swift_beginAccess();
  uint64_t v35 = *v34;
  uint64_t v36 = v60;
  swift_beginAccess();
  *(void *)uint64_t v36 = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v37 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentDisplayName);
  swift_beginAccess();
  uint64_t v39 = *v37;
  uint64_t v38 = v37[1];
  uint64_t v40 = v61;
  swift_beginAccess();
  *(void *)uint64_t v40 = v39;
  *((void *)v40 + 1) = v38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v41 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentIdentifier);
  swift_beginAccess();
  uint64_t v43 = *v41;
  uint64_t v42 = v41[1];
  unint64_t v44 = v62;
  swift_beginAccess();
  *(void *)unint64_t v44 = v43;
  *((void *)v44 + 1) = v42;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  double v45 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentBundleIdentifier);
  swift_beginAccess();
  uint64_t v47 = *v45;
  uint64_t v46 = v45[1];
  uint64_t v48 = v63;
  swift_beginAccess();
  *(void *)uint64_t v48 = v47;
  *((void *)v48 + 1) = v46;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v49 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_associatedContentAdamIdentifier);
  swift_beginAccess();
  uint64_t v51 = *v49;
  uint64_t v50 = v49[1];
  uint64_t v52 = v64;
  swift_beginAccess();
  *(void *)uint64_t v52 = v51;
  *((void *)v52 + 1) = v50;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v53 = a1 + OBJC_IVAR____TtC5AskTo10ATQuestion_expirationDate;
  swift_beginAccess();
  uint64_t v54 = v53;
  uint64_t v55 = v66;
  sub_248749E0C(v54, v66, &qword_2693245C0);
  uint64_t v56 = v65;
  swift_beginAccess();
  sub_24875A294(v55, v56);
  swift_endAccess();

  v68.receiver = v32;
  v68.super_class = ObjectType;
  return objc_msgSendSuper2(&v68, sel_init);
}

uint64_t sub_24875EF0C()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_24875EF18()
{
  return type metadata accessor for ATQuestion();
}

void sub_24875EF20()
{
  sub_248765F58();
  if (v0 <= 0x3F)
  {
    sub_24875F094();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for ATQuestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATQuestion);
}

uint64_t dispatch thunk of ATQuestion.__allocating_init(systemId:version:id:topic:title:summary:notificationText:answerChoices:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of ATQuestion.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

void sub_24875F094()
{
  if (!qword_269324678)
  {
    sub_248765EF8();
    unint64_t v0 = sub_248766248();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269324678);
    }
  }
}

uint64_t method lookup function for ATQuestion.Topic(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATQuestion.Topic);
}

uint64_t dispatch thunk of ATQuestion.Topic.__allocating_init(rawValue:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t getEnumTagSinglePayload for ATQuestion.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
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
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ATQuestion.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *uint64_t result = a2 + 12;
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
        JUMPOUT(0x24875F274);
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
          *uint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ATQuestion.CodingKeys()
{
  return &type metadata for ATQuestion.CodingKeys;
}

unint64_t sub_24875F2B0()
{
  unint64_t result = qword_269324688;
  if (!qword_269324688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324688);
  }
  return result;
}

unint64_t sub_24875F308()
{
  unint64_t result = qword_269324690;
  if (!qword_269324690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324690);
  }
  return result;
}

unint64_t sub_24875F360()
{
  unint64_t result = qword_269324698;
  if (!qword_269324698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324698);
  }
  return result;
}

uint64_t sub_24875F3B4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_24875F408(id result, id a2, char a3)
{
  if (a3 == 2 || a3 == 1) {
    return result;
  }
  if (!a3) {
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

void destroy for DictionaryRepresentableError(uint64_t a1)
{
}

void sub_24875F440(void *a1, id a2, char a3)
{
  if (a3 == 2 || a3 == 1)
  {
  }
  else if (!a3)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t _s9AskToCore28DictionaryRepresentableErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned int v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24875F408(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DictionaryRepresentableError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned int v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_24875F408(*(id *)a2, v4, v5);
  unsigned int v6 = *(void **)a1;
  BOOL v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24875F440(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for DictionaryRepresentableError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  unsigned int v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24875F440(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DictionaryRepresentableError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DictionaryRepresentableError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24875F5F4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_24875F5FC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DictionaryRepresentableError()
{
  return &type metadata for DictionaryRepresentableError;
}

uint64_t Transport.debugDescription.getter(__int16 a1)
{
  if (!a1) {
    return 0x6567617373654D69;
  }
  uint64_t result = sub_2487664B8();
  __break(1u);
  return result;
}

uint64_t Transport.init(rawValue:)(__int16 a1)
{
  return (a1 != 0) << 16;
}

unint64_t sub_24875F688()
{
  unint64_t result = qword_2693246A8;
  if (!qword_2693246A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693246A8);
  }
  return result;
}

_WORD *sub_24875F6DC@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 0;
  *(_WORD *)a2 = 0;
  *(unsigned char *)(a2 + 2) = v2;
  return result;
}

uint64_t sub_24875F6F4()
{
  return sub_2487660E8();
}

uint64_t sub_24875F754()
{
  return sub_2487660C8();
}

uint64_t sub_24875F7A4()
{
  if (!*v0) {
    return 0x6567617373654D69;
  }
  uint64_t result = sub_2487664B8();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for Transport()
{
  return &type metadata for Transport;
}

unint64_t sub_24875F808()
{
  unint64_t result = qword_2693246B0;
  if (!qword_2693246B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693246B0);
  }
  return result;
}

unint64_t static AskToExtensionPoint.identifier.getter()
{
  return 0xD000000000000019;
}

ValueMetadata *type metadata accessor for AskToExtensionPoint()
{
  return &type metadata for AskToExtensionPoint;
}

uint64_t sub_24875F888()
{
  return sub_248766588();
}

uint64_t sub_24875F944()
{
  return sub_248766588();
}

uint64_t sub_24875FA0C()
{
  return sub_248766588();
}

uint64_t sub_24875FAD0()
{
  return sub_248766588();
}

uint64_t sub_24875FB8C(char *a1, char *a2)
{
  return sub_248763124(*a1, *a2);
}

uint64_t sub_24875FB98()
{
  return sub_24875F944();
}

uint64_t sub_24875FBA0()
{
  sub_248766068();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24875FC50()
{
  return sub_24875FA0C();
}

uint64_t sub_24875FC58@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_248762314();
  *a1 = result;
  return result;
}

void sub_24875FC88(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE200000000000000;
  uint64_t v3 = 25705;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      uint64_t v3 = 0x656C746974;
      goto LABEL_3;
    case 2:
      *a1 = 0xD000000000000015;
      a1[1] = 0x8000000248768A60;
      break;
    case 3:
      *a1 = 1684957547;
      a1[1] = 0xE400000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t sub_24875FD10()
{
  unint64_t result = 25705;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x656C746974;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
      unint64_t result = 1684957547;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24875FD8C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_248762314();
  *a1 = result;
  return result;
}

void sub_24875FDB4(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24875FDC0(uint64_t a1)
{
  unint64_t v2 = sub_248760DB8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24875FDFC(uint64_t a1)
{
  unint64_t v2 = sub_248760DB8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ATAnswerChoice.Kind.init(rawValue:)(unsigned __int16 a1)
{
  int v1 = a1;
  if (a1)
  {
    if (a1 == 2) {
      int v2 = 2;
    }
    else {
      int v2 = 0;
    }
    int v3 = a1 != 2;
    if (a1 == 1) {
      int v1 = 1;
    }
    else {
      int v1 = v2;
    }
    if (a1 == 1) {
      int v3 = 0;
    }
  }
  else
  {
    int v3 = 0;
  }
  return v1 | (v3 << 16);
}

uint64_t sub_24875FE78()
{
  return sub_2487660E8();
}

uint64_t sub_24875FED8()
{
  return sub_2487660C8();
}

uint64_t ATAnswerChoice.id.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ATAnswerChoice.title.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ATAnswerChoice.title.setter(uint64_t a1, uint64_t a2)
{
  char v5 = (void *)(v2 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  swift_beginAccess();
  *char v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*ATAnswerChoice.title.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ATAnswerChoice.completedRequestTitle.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ATAnswerChoice.completedRequestTitle.setter(uint64_t a1, uint64_t a2)
{
  char v5 = (void *)(v2 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  swift_beginAccess();
  *char v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*ATAnswerChoice.completedRequestTitle.modify())()
{
  return j__swift_endAccess;
}

uint64_t ATAnswerChoice.kind.getter()
{
  uint64_t v1 = (unsigned __int16 *)(v0 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
  swift_beginAccess();
  return *v1;
}

uint64_t ATAnswerChoice.kind.setter(__int16 a1)
{
  int v3 = (_WORD *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
  uint64_t result = swift_beginAccess();
  *int v3 = a1;
  return result;
}

uint64_t (*ATAnswerChoice.kind.modify())()
{
  return j_j__swift_endAccess;
}

id ATAnswerChoice.__allocating_init(id:title:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  id v10 = &v9[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(void *)id v10 = 0;
  *((void *)v10 + 1) = 0;
  *(_WORD *)&v9[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind] = 0;
  int64_t v11 = &v9[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
  *(void *)int64_t v11 = a1;
  *((void *)v11 + 1) = a2;
  uint64_t v12 = &v9[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
  *(void *)uint64_t v12 = a3;
  *((void *)v12 + 1) = a4;
  v14.receiver = v9;
  v14.super_class = v4;
  return objc_msgSendSuper2(&v14, sel_init);
}

id ATAnswerChoice.init(id:title:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v10 = &v4[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(void *)id v10 = 0;
  *((void *)v10 + 1) = 0;
  *(_WORD *)&v4[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind] = 0;
  int64_t v11 = &v4[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
  *(void *)int64_t v11 = a1;
  *((void *)v11 + 1) = a2;
  uint64_t v12 = &v4[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
  *(void *)uint64_t v12 = a3;
  *((void *)v12 + 1) = a4;
  v14.receiver = v4;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, sel_init);
}

id ATAnswerChoice.__allocating_init(id:title:completedRequestTitle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (char *)objc_allocWithZone(v6);
  objc_super v14 = &v13[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(void *)objc_super v14 = 0;
  *((void *)v14 + 1) = 0;
  *(_WORD *)&v13[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind] = 0;
  uint64_t v15 = &v13[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
  *(void *)uint64_t v15 = a1;
  *((void *)v15 + 1) = a2;
  uint64_t v16 = &v13[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
  *(void *)uint64_t v16 = a3;
  *((void *)v16 + 1) = a4;
  swift_beginAccess();
  *(void *)objc_super v14 = a5;
  *((void *)v14 + 1) = a6;
  swift_bridgeObjectRelease();
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ATAnswerChoice.init(id:title:completedRequestTitle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  objc_super v14 = &v6[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(void *)objc_super v14 = 0;
  *((void *)v14 + 1) = 0;
  *(_WORD *)&v6[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind] = 0;
  uint64_t v15 = &v6[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
  *(void *)uint64_t v15 = a1;
  *((void *)v15 + 1) = a2;
  uint64_t v16 = &v6[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
  *(void *)uint64_t v16 = a3;
  *((void *)v16 + 1) = a4;
  swift_beginAccess();
  *(void *)objc_super v14 = a5;
  *((void *)v14 + 1) = a6;
  swift_bridgeObjectRelease();
  v18.receiver = v6;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ATAnswerChoice.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ATAnswerChoice.init(from:)(a1);
}

id ATAnswerChoice.init(from:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693246E0);
  uint64_t v32 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v7 = &v1[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(void *)BOOL v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v36 = (uint64_t *)v7;
  char v8 = &v1[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind];
  *(_WORD *)&v1[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind] = 0;
  uint64_t v9 = a1[3];
  id v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_248760DB8();
  id v10 = v1;
  sub_2487665A8();
  if (v2)
  {
    objc_super v14 = v10;
    uint64_t v15 = v36;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
    id v28 = (id)v15[1];

    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v31 = v8;
    uint64_t v12 = v32;
    uint64_t v11 = v33;
    char v39 = 0;
    uint64_t v13 = sub_2487663B8();
    uint64_t v17 = v10;
    objc_super v18 = (uint64_t *)&v10[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
    *objc_super v18 = v13;
    v18[1] = v19;
    char v39 = 1;
    uint64_t v20 = sub_2487663B8();
    uint64_t v21 = (uint64_t *)&v10[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
    uint64_t *v21 = v20;
    v21[1] = v22;
    char v39 = 2;
    uint64_t v23 = sub_248766368();
    uint64_t v30 = v24;
    unint64_t v25 = v36;
    swift_beginAccess();
    uint64_t v26 = v30;
    *unint64_t v25 = v23;
    v25[1] = v26;
    swift_bridgeObjectRelease();
    char v38 = 3;
    sub_248760E0C();
    sub_2487663D8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
    LOWORD(v18) = v40;
    uint64_t v27 = v31;
    swift_beginAccess();
    *(_WORD *)uint64_t v27 = (_WORD)v18;

    v37.receiver = v17;
    v37.super_class = ObjectType;
    id v28 = objc_msgSendSuper2(&v37, sel_init);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  }
  return v28;
}

unint64_t sub_248760DB8()
{
  unint64_t result = qword_2693246E8;
  if (!qword_2693246E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693246E8);
  }
  return result;
}

unint64_t sub_248760E0C()
{
  unint64_t result = qword_2693246F0;
  if (!qword_2693246F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693246F0);
  }
  return result;
}

uint64_t ATAnswerChoice.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693246F8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_248760DB8();
  sub_2487665B8();
  char v15 = 0;
  sub_248766428();
  if (!v2)
  {
    swift_beginAccess();
    char v14 = 1;
    swift_bridgeObjectRetain();
    sub_248766428();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    char v13 = 2;
    swift_bridgeObjectRetain();
    sub_2487663F8();
    swift_bridgeObjectRelease();
    id v10 = (__int16 *)(v3 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
    swift_beginAccess();
    __int16 v12 = *v10;
    v11[5] = 3;
    sub_2487610EC();
    sub_248766458();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_2487610EC()
{
  unint64_t result = qword_269324700;
  if (!qword_269324700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324700);
  }
  return result;
}

BOOL ATAnswerChoice.isEqual(_:)(uint64_t a1)
{
  swift_getObjectType();
  sub_2487522A0(a1, (uint64_t)v19);
  if (v20)
  {
    if (swift_dynamicCast())
    {
      BOOL v3 = *(void *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id) == *(void *)&v18[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id]
        && *(void *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id + 8) == *(void *)&v18[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id
                                                                                            + 8];
      if (v3 || (sub_248766498() & 1) != 0)
      {
        uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
        swift_beginAccess();
        uint64_t v5 = *v4;
        uint64_t v6 = v4[1];
        uint64_t v7 = &v18[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
        swift_beginAccess();
        BOOL v8 = v5 == *(void *)v7 && v6 == *((void *)v7 + 1);
        if (v8 || (sub_248766498() & 1) != 0)
        {
          uint64_t v9 = (uint64_t *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
          swift_beginAccess();
          uint64_t v10 = *v9;
          uint64_t v11 = v9[1];
          __int16 v12 = &v18[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
          swift_beginAccess();
          uint64_t v13 = *((void *)v12 + 1);
          if (v11)
          {
            if (v13 && (v10 == *(void *)v12 && v11 == v13 || (sub_248766498() & 1) != 0)) {
              goto LABEL_18;
            }
          }
          else if (!v13)
          {
LABEL_18:
            char v14 = (unsigned __int16 *)(v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
            swift_beginAccess();
            int v15 = *v14;
            uint64_t v16 = &v18[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind];
            swift_beginAccess();
            LODWORD(v16) = *(unsigned __int16 *)v16;

            return v15 == v16;
          }
        }
      }
    }
  }
  else
  {
    sub_248752308((uint64_t)v19);
  }
  return 0;
}

uint64_t ATAnswerChoice.hash.getter()
{
  sub_248766598();
  swift_bridgeObjectRetain();
  sub_248766068();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_248766068();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle;
  swift_beginAccess();
  if (*(void *)(v1 + 8))
  {
    sub_248766548();
    swift_bridgeObjectRetain();
    sub_248766068();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_248766548();
  }
  swift_beginAccess();
  sub_248766558();
  return sub_248766578();
}

uint64_t ATAnswerChoice.description.getter()
{
  return 0;
}

id ATAnswerChoice.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void ATAnswerChoice.init()()
{
}

id ATAnswerChoice.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2487618F4@<X0>(void *a1@<X8>)
{
  objc_super v2 = (void *)(*v1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id);
  uint64_t v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  return swift_bridgeObjectRetain();
}

id sub_248761910@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  id result = ATAnswerChoice.init(from:)(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_248761960(void *a1)
{
  return ATAnswerChoice.encode(to:)(a1);
}

uint64_t static ATAnswerChoice.supportsSecureCoding.getter()
{
  return 1;
}

id ATAnswerChoice.init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

{
  void *v1;
  void *ObjectType;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;

  uint64_t ObjectType = (void *)swift_getObjectType();
  sub_248752368(0, &qword_2693244B8);
  uint64_t v4 = v1;
  uint64_t v5 = sub_248766208();
  if (!v5)
  {

    uint64_t v11 = sub_2487661C8();
    sub_248752368(0, (unint64_t *)&unk_2693244C0);
    __int16 v12 = sub_248766238();
    uint64_t v13 = v11;
    if (os_log_type_enabled(v12, v11))
    {
      char v14 = (uint8_t *)swift_slowAlloc();
      int v15 = swift_slowAlloc();
      uint64_t v30 = v15;
      uint64_t v31 = ObjectType;
      *(_DWORD *)char v14 = 136315138;
      swift_getMetatypeMetadata();
      uint64_t v16 = sub_248766058();
      uint64_t v31 = (id)sub_2487475D8(v16, v17, &v30);
      sub_248766258();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_248743000, v12, v13, "Not initializing %s (coder had nil value for key \"data\")", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57E660](v15, -1, -1);
      MEMORY[0x24C57E660](v14, -1, -1);
    }

    goto LABEL_8;
  }
  id v6 = (void *)v5;
  uint64_t v7 = sub_248765EB8();
  uint64_t v9 = v8;
  uint64_t v10 = objc_allocWithZone(MEMORY[0x263F08928]);
  objc_super v18 = sub_2487521BC();
  sub_248749614(v7, v9);
  sub_2487624D8(&qword_2693245F8);
  sub_2487661F8();

  if (!v31)
  {
    uint64_t v23 = sub_2487661C8();
    sub_248752368(0, (unint64_t *)&unk_2693244C0);
    uint64_t v24 = sub_248766238();
    unint64_t v25 = v23;
    if (os_log_type_enabled(v24, (os_log_type_t)v23))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v30 = v27;
      uint64_t v31 = ObjectType;
      *(_DWORD *)uint64_t v26 = 136315138;
      swift_getMetatypeMetadata();
      id v28 = sub_248766058();
      uint64_t v31 = (id)sub_2487475D8(v28, v29, &v30);
      sub_248766258();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_248743000, v24, v25, "Not initializing %s (unarchiver had nil value for key \"value\")", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C57E660](v27, -1, -1);
      MEMORY[0x24C57E660](v26, -1, -1);
    }

    objc_msgSend(v18, sel_finishDecoding);
LABEL_8:
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v19 = objc_allocWithZone((Class)ObjectType);
  uint64_t v20 = sub_248762360((uint64_t)v31);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  uint64_t v21 = v20;
  objc_msgSend(v18, sel_finishDecoding);

  return v21;
}

Swift::Void __swiftcall ATAnswerChoice.encode(with:)(NSCoder with)
{
  swift_getObjectType();
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  uint64_t v9 = v1;
  sub_2487624D8((unint64_t *)&unk_269324720);
  sub_2487661E8();
  objc_msgSend(v3, sel_finishEncoding, v7, v8);
  id v4 = objc_msgSend(v3, sel_encodedData);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = (void *)sub_248766008();
    [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for ATAnswerChoice()
{
  return self;
}

uint64_t sub_248762314()
{
  unint64_t v0 = sub_248766358();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

id sub_248762360(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = &v1[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  id v6 = &v1[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind];
  *(_WORD *)id v6 = 0;
  uint64_t v7 = *(void *)(a1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id + 8);
  uint64_t v8 = &v2[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id];
  *(void *)uint64_t v8 = *(void *)(a1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_id);
  *((void *)v8 + 1) = v7;
  uint64_t v9 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title);
  swift_beginAccess();
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  __int16 v12 = &v2[OBJC_IVAR____TtC5AskTo14ATAnswerChoice_title];
  *(void *)__int16 v12 = v10;
  *((void *)v12 + 1) = v11;
  uint64_t v13 = (uint64_t *)(a1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_completedRequestTitle);
  swift_beginAccess();
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  swift_beginAccess();
  *(void *)uint64_t v5 = v15;
  *((void *)v5 + 1) = v14;
  uint64_t v16 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = (_WORD *)(a1 + OBJC_IVAR____TtC5AskTo14ATAnswerChoice_kind);
  swift_beginAccess();
  LOWORD(v17) = *v17;
  swift_beginAccess();
  *(_WORD *)id v6 = (_WORD)v17;

  v19.receiver = v16;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, sel_init);
}

uint64_t sub_2487624D8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ATAnswerChoice();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24876251C()
{
  unint64_t result = qword_269324730;
  if (!qword_269324730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324730);
  }
  return result;
}

uint64_t method lookup function for ATAnswerChoice(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATAnswerChoice);
}

uint64_t dispatch thunk of ATAnswerChoice.__allocating_init(id:title:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ATAnswerChoice.__allocating_init(id:title:completedRequestTitle:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ATAnswerChoice.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

ValueMetadata *type metadata accessor for ATAnswerChoice.Kind()
{
  return &type metadata for ATAnswerChoice.Kind;
}

uint64_t getEnumTagSinglePayload for ATAnswerChoice.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ATAnswerChoice.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x248762744);
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

ValueMetadata *type metadata accessor for ATAnswerChoice.CodingKeys()
{
  return &type metadata for ATAnswerChoice.CodingKeys;
}

unint64_t sub_248762780()
{
  unint64_t result = qword_269324740;
  if (!qword_269324740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324740);
  }
  return result;
}

unint64_t sub_2487627D8()
{
  unint64_t result = qword_269324748;
  if (!qword_269324748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324748);
  }
  return result;
}

unint64_t sub_248762830()
{
  unint64_t result = qword_269324750;
  if (!qword_269324750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324750);
  }
  return result;
}

unint64_t sub_248762884()
{
  unint64_t result = qword_269324758;
  if (!qword_269324758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324758);
  }
  return result;
}

unint64_t sub_2487628D8()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEA58]), sel_init);
  unint64_t result = sub_248746664(MEMORY[0x263F8EE78]);
  qword_269327208 = (uint64_t)v0;
  unk_269327210 = result;
  return result;
}

uint64_t sub_248762928(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  v47[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a4 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v8 = sub_248747D10(a1, a2);
    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(a4 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_269324110 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_248765FA8();
      __swift_project_value_buffer(v11, (uint64_t)qword_269327170);
      swift_bridgeObjectRetain_n();
      __int16 v12 = sub_248765F88();
      os_log_type_t v13 = sub_2487661D8();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        uint64_t v15 = swift_slowAlloc();
        v47[0] = v15;
        *(_DWORD *)uint64_t v14 = 136315138;
        swift_bridgeObjectRetain();
        id v46 = (id)sub_2487475D8(a1, a2, v47);
        sub_248766258();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_248743000, v12, v13, "Using cached results for responder handle %s", v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C57E660](v15, -1, -1);
        MEMORY[0x24C57E660](v14, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return v10;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v16 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269324760);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_248768520;
  *(void *)(v17 + 32) = a1;
  *(void *)(v17 + 40) = a2;
  swift_bridgeObjectRetain();
  objc_super v18 = (void *)sub_248766108();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v16, sel_predicateForContactsMatchingHandleStrings_, v18);

  __swift_instantiateConcreteTypeFromMangledName(&qword_269324768);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_248768530;
  uint64_t v21 = self;
  id v22 = objc_msgSend(v21, sel_descriptorForRequiredKeysForStyle_, 0);
  uint64_t v23 = (void *)*MEMORY[0x263EFDF80];
  *(void *)(v20 + 32) = v22;
  *(void *)(v20 + 40) = v23;
  uint64_t v24 = (void *)*MEMORY[0x263EFE070];
  *(void *)(v20 + 48) = *MEMORY[0x263EFE070];
  v47[0] = v20;
  sub_248766138();
  id v25 = v23;
  id v26 = v24;
  id v27 = objc_msgSend(v21, sel_descriptorForRequiredKeysForStyle_, 1000);
  uint64_t v28 = swift_unknownObjectRetain();
  MEMORY[0x24C57DB30](v28);
  if (*(void *)((v47[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v47[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_248766148();
  }
  sub_248766158();
  sub_248766138();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269324770);
  uint64_t v29 = (void *)sub_248766108();
  swift_bridgeObjectRelease();
  id v46 = 0;
  id v30 = objc_msgSend(a3, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v19, v29, &v46);

  id v31 = v46;
  if (v30)
  {
    sub_248762FAC();
    uint64_t v10 = sub_248766118();
    id v32 = v31;
  }
  else
  {
    id v33 = v46;
    id v34 = (void *)sub_248765E68();

    swift_willThrow();
    if (qword_269324110 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_248765FA8();
    __swift_project_value_buffer(v35, (uint64_t)qword_269327170);
    swift_bridgeObjectRetain();
    id v36 = v34;
    swift_bridgeObjectRetain();
    id v37 = v34;
    char v38 = sub_248765F88();
    os_log_type_t v39 = sub_2487661C8();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = swift_slowAlloc();
      char v41 = (void *)swift_slowAlloc();
      uint64_t v42 = (void *)swift_slowAlloc();
      id v46 = v42;
      *(_DWORD *)uint64_t v40 = 136315394;
      swift_bridgeObjectRetain();
      sub_2487475D8(a1, a2, (uint64_t *)&v46);
      sub_248766258();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v40 + 12) = 2112;
      id v43 = v34;
      uint64_t v45 = _swift_stdlib_bridgeErrorToNSError();
      sub_248766258();
      void *v41 = v45;

      _os_log_impl(&dword_248743000, v38, v39, "Error fetching contacts for responder handle %s: %@", (uint8_t *)v40, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269324478);
      swift_arrayDestroy();
      MEMORY[0x24C57E660](v41, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24C57E660](v42, -1, -1);
      MEMORY[0x24C57E660](v40, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  return v10;
}

unint64_t sub_248762FAC()
{
  unint64_t result = qword_269324780;
  if (!qword_269324780)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269324780);
  }
  return result;
}

uint64_t sub_248762FEC(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x8000000248768A80;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0x65646E6F70736572;
    }
    else {
      unint64_t v5 = 0x6E416E65736F6863;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xEF656C646E614872;
    }
    else {
      unint64_t v6 = 0xEC00000072657773;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0xD000000000000010;
  unint64_t v6 = 0x8000000248768A80;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v2 = 0x65646E6F70736572;
    }
    else {
      unint64_t v2 = 0x6E416E65736F6863;
    }
    if (v7 == 1) {
      unint64_t v3 = 0xEF656C646E614872;
    }
    else {
      unint64_t v3 = 0xEC00000072657773;
    }
  }
LABEL_15:
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_248766498();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_248763124(char a1, char a2)
{
  unint64_t v3 = 0xE200000000000000;
  unint64_t v4 = 25705;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v4 = 0x656C746974;
      break;
    case 2:
      unint64_t v3 = 0x8000000248768A60;
      unint64_t v4 = 0xD000000000000015;
      break;
    case 3:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v4 = 1684957547;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xE200000000000000;
  unint64_t v6 = 25705;
  switch(a2)
  {
    case 1:
      unint64_t v5 = 0xE500000000000000;
      if (v4 == 0x656C746974) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v5 = 0x8000000248768A60;
      unint64_t v6 = 0xD000000000000015;
      goto LABEL_9;
    case 3:
      unint64_t v5 = 0xE400000000000000;
      if (v4 == 1684957547) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v4 != v6) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v5) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_248766498();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_248763290(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEC0000006E6F6973;
  unint64_t v3 = 0x7265566F546B7361;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD00000000000001BLL;
    }
    else {
      unint64_t v5 = 0xD000000000000010;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x80000002487687E0;
    }
    else {
      unint64_t v6 = 0x8000000248768800;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  unint64_t v5 = 0x7265566F546B7361;
  unint64_t v6 = 0xEC0000006E6F6973;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      unint64_t v3 = 0xD00000000000001BLL;
    }
    else {
      unint64_t v3 = 0xD000000000000010;
    }
    if (v7 == 1) {
      unint64_t v2 = 0x80000002487687E0;
    }
    else {
      unint64_t v2 = 0x8000000248768800;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_248766498();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t ATResponse.description.getter()
{
  return 0;
}

uint64_t sub_24876361C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_248762FEC(*a1, *a2);
}

uint64_t sub_248763628()
{
  return sub_248766588();
}

uint64_t sub_2487636E4()
{
  sub_248766068();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24876378C()
{
  return sub_248766588();
}

uint64_t sub_248763844@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24876503C();
  *a1 = result;
  return result;
}

void sub_248763874(unint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0x8000000248768A80;
  unint64_t v4 = 0xEF656C646E614872;
  uint64_t v5 = 0x65646E6F70736572;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6E416E65736F6863;
    unint64_t v4 = 0xEC00000072657773;
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

unint64_t sub_2487638EC()
{
  uint64_t v1 = 0x65646E6F70736572;
  if (*v0 != 1) {
    uint64_t v1 = 0x6E416E65736F6863;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_248763960@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24876503C();
  *a1 = result;
  return result;
}

void sub_248763988(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_248763994(uint64_t a1)
{
  unint64_t v2 = sub_248765184();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2487639D0(uint64_t a1)
{
  unint64_t v2 = sub_248765184();

  return MEMORY[0x270FA00B8](a1, v2);
}

id ATResponse.originalQuestion.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  unint64_t v2 = *v1;

  return v2;
}

void ATResponse.originalQuestion.setter(void *a1)
{
  unint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  unint64_t v4 = *v3;
  *unint64_t v3 = a1;
}

uint64_t (*ATResponse.originalQuestion.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t ATResponse.responderHandle.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ATResponse.responderHandle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*ATResponse.responderHandle.modify())()
{
  return j__swift_endAccess;
}

uint64_t ATResponse.responderDisplayName.getter()
{
  if (qword_269324138 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_269327208;
  uint64_t v2 = unk_269327210;
  unint64_t v3 = (uint64_t *)(v0 + OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle);
  swift_beginAccess();
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_248762928(v4, v5, v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v7 = *v3;
  uint64_t v8 = v3[1];
  if (!v6)
  {
    swift_bridgeObjectRetain();
    return v7;
  }
  if (!(v6 >> 62))
  {
    uint64_t v9 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_6;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return v7;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_248766308();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v14) {
    goto LABEL_12;
  }
LABEL_6:
  if ((v6 & 0xC000000000000001) != 0)
  {
    uint64_t v11 = (id *)MEMORY[0x24C57DD00](0, v6);
    goto LABEL_9;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v11 = (id *)*(id *)(v6 + 32);
LABEL_9:
    __int16 v12 = v11;
    swift_bridgeObjectRelease();
    sub_2487584A0(v12, 1, v7, v8, *(id *)(v0 + OBJC_IVAR____TtC9AskToCore10ATResponse_displayNameContactFormatter));
    uint64_t v7 = v13;
    swift_bridgeObjectRelease();

    return v7;
  }
  __break(1u);
  return result;
}

id ATResponse.chosenAnswer.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer);
}

id ATResponse.__allocating_init(originalQuestion:responderHandle:chosenAnswer:)(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = objc_allocWithZone(v4);
  id v10 = sub_248765088(a1, a2, a3, a4);

  return v10;
}

id ATResponse.init(originalQuestion:responderHandle:chosenAnswer:)(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = sub_248765088(a1, a2, a3, a4);

  return v6;
}

id ATResponse.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ATResponse.init(from:)(a1);
}

id ATResponse.init(from:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693247C0);
  uint64_t v4 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  id v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = &v1[OBJC_IVAR____TtC9AskToCore10ATResponse_displayNameContactFormatter];
  id v8 = objc_allocWithZone(MEMORY[0x263EFEA20]);
  id v9 = v1;
  id v10 = objc_msgSend(v8, sel_init);
  objc_msgSend(v10, sel_setStyle_, 1000);
  *(void *)uint64_t v7 = v10;
  v7[8] = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_248765184();
  sub_2487665A8();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    id v17 = *(id *)v7;

    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v11 = v4;
    type metadata accessor for ATQuestion();
    char v22 = 0;
    sub_248765330((unint64_t *)&unk_2693247D0, 255, (void (*)(uint64_t))type metadata accessor for ATQuestion);
    uint64_t v12 = v19;
    sub_2487663D8();
    uint64_t v18 = OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion;
    *(void *)&v9[OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion] = v23;
    LOBYTE(v23) = 1;
    uint64_t v14 = sub_2487663B8();
    uint64_t v15 = (uint64_t *)&v9[OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle];
    uint64_t *v15 = v14;
    v15[1] = v16;
    type metadata accessor for ATAnswerChoice();
    char v22 = 2;
    sub_248765330(&qword_2693245F8, 255, (void (*)(uint64_t))type metadata accessor for ATAnswerChoice);
    sub_2487663D8();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v12);
    *(void *)&v9[OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer] = v23;

    v21.receiver = v9;
    v21.super_class = ObjectType;
    id v17 = objc_msgSendSuper2(&v21, sel_init);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v17;
}

uint64_t ATResponse.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2693247E0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_248765184();
  sub_2487665B8();
  id v9 = (uint64_t *)(v3 + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  uint64_t v13 = *v9;
  LOBYTE(v12) = 0;
  type metadata accessor for ATQuestion();
  sub_248765330((unint64_t *)&unk_269324490, 255, (void (*)(uint64_t))type metadata accessor for ATQuestion);
  sub_248766458();
  if (!v2)
  {
    swift_beginAccess();
    LOBYTE(v12) = 1;
    swift_bridgeObjectRetain();
    sub_248766428();
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v3 + OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer);
    v11[7] = 2;
    type metadata accessor for ATAnswerChoice();
    sub_248765330((unint64_t *)&unk_269324720, 255, (void (*)(uint64_t))type metadata accessor for ATAnswerChoice);
    sub_248766458();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t static ATResponse.supportsSecureCoding.getter()
{
  return 1;
}

id ATResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ATResponse.init(coder:)(a1);
}

id ATResponse.init(coder:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_248752368(0, &qword_2693244B8);
  id v4 = v1;
  uint64_t v5 = sub_248766208();
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = sub_248765EB8();
    unint64_t v9 = v8;
    id v10 = objc_allocWithZone(MEMORY[0x263F08928]);
    id v11 = sub_2487521BC();
    sub_248749614(v7, v9);
    sub_248765330(&qword_269324510, v15, (void (*)(uint64_t))type metadata accessor for ATResponse);
    sub_2487661F8();

    if (v19)
    {
      id v16 = objc_allocWithZone(ObjectType);
      id v17 = sub_2487651FC((uint64_t)v19);

      swift_getObjectType();
      swift_deallocPartialClassInstance();
      id v13 = v17;
      objc_msgSend(v11, sel_finishDecoding);

      return v13;
    }
    sub_2487661C8();
    sub_248752368(0, (unint64_t *)&unk_2693244C0);
    uint64_t v18 = (void *)sub_248766238();
    sub_248765F78();

    objc_msgSend(v11, sel_finishDecoding);
  }
  else
  {

    sub_2487661C8();
    sub_248752368(0, (unint64_t *)&unk_2693244C0);
    uint64_t v12 = (void *)sub_248766238();
    sub_248765F78();
  }
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall ATResponse.encode(with:)(NSCoder with)
{
  swift_getObjectType();
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  sub_248765330(&qword_2693247F0, v3, (void (*)(uint64_t))type metadata accessor for ATResponse);
  sub_2487661E8();
  objc_msgSend(v2, sel_finishEncoding);
  id v4 = objc_msgSend(v2, sel_encodedData);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = (void *)sub_248766008();
    [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];
  }
  else
  {
    __break(1u);
  }
}

void ATResponse.copy(with:)(void *a1@<X8>)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v4 = objc_allocWithZone(ObjectType);
  id v5 = v1;
  id v6 = sub_2487651FC((uint64_t)v5);

  a1[3] = ObjectType;
  *a1 = v6;
}

id ATResponse.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void ATResponse.init()()
{
}

id ATResponse.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_248764FC8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  id result = ATResponse.init(from:)(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_248765018(void *a1)
{
  return ATResponse.encode(to:)(a1);
}

uint64_t sub_24876503C()
{
  unint64_t v0 = sub_248766358();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

id sub_248765088(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v11 = &v5[OBJC_IVAR____TtC9AskToCore10ATResponse_displayNameContactFormatter];
  id v12 = objc_allocWithZone(MEMORY[0x263EFEA20]);
  id v13 = v5;
  id v14 = objc_msgSend(v12, sel_init);
  objc_msgSend(v14, sel_setStyle_, 1000);
  *(void *)id v11 = v14;
  unsigned char v11[8] = 1;
  *(void *)&v13[OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion] = a1;
  uint64_t v15 = &v13[OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle];
  *(void *)uint64_t v15 = a2;
  *((void *)v15 + 1) = a3;
  *(void *)&v13[OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer] = a4;
  id v16 = a1;
  id v17 = a4;

  v19.receiver = v13;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, sel_init);
}

unint64_t sub_248765184()
{
  unint64_t result = qword_2693247C8;
  if (!qword_2693247C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693247C8);
  }
  return result;
}

uint64_t type metadata accessor for ATResponse()
{
  return self;
}

id sub_2487651FC(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v5 = &v2[OBJC_IVAR____TtC9AskToCore10ATResponse_displayNameContactFormatter];
  id v6 = objc_allocWithZone(MEMORY[0x263EFEA20]);
  uint64_t v7 = v2;
  id v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setStyle_, 1000);
  *(void *)id v5 = v8;
  v5[8] = 1;
  unint64_t v9 = (void **)(a1 + OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion);
  swift_beginAccess();
  id v10 = *v9;
  *(void *)&v7[OBJC_IVAR____TtC9AskToCore10ATResponse_originalQuestion] = *v9;
  id v11 = (uint64_t *)(a1 + OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle);
  swift_beginAccess();
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  id v14 = &v7[OBJC_IVAR____TtC9AskToCore10ATResponse_responderHandle];
  *(void *)id v14 = v12;
  *((void *)v14 + 1) = v13;
  uint64_t v15 = *(void **)(a1 + OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer);
  *(void *)&v7[OBJC_IVAR____TtC9AskToCore10ATResponse_chosenAnswer] = v15;
  id v16 = v10;
  swift_bridgeObjectRetain();
  id v17 = v15;

  v19.receiver = v7;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, sel_init);
}

uint64_t sub_248765330(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t method lookup function for ATResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ATResponse);
}

uint64_t dispatch thunk of ATResponse.__allocating_init(originalQuestion:responderHandle:chosenAnswer:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ATResponse.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

unsigned char *storeEnumTagSinglePayload for ATResponse.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x248765498);
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

ValueMetadata *type metadata accessor for ATResponse.CodingKeys()
{
  return &type metadata for ATResponse.CodingKeys;
}

unint64_t sub_2487654D4()
{
  unint64_t result = qword_2693247F8;
  if (!qword_2693247F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693247F8);
  }
  return result;
}

unint64_t sub_24876552C()
{
  unint64_t result = qword_269324800;
  if (!qword_269324800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269324800);
  }
  return result;
}

unint64_t sub_248765584()
{
  unint64_t result = qword_269324808[0];
  if (!qword_269324808[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269324808);
  }
  return result;
}

uint64_t sub_2487655DC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_248765670(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FC7F100);
  objc_msgSend(a1, sel_setExportedInterface_, v4);

  objc_msgSend(a1, sel_setExportedObject_, a2);
  objc_msgSend(a1, sel_resume);
  return 1;
}

uint64_t sub_24876570C(uint64_t a1, void (*a2)(void, uint64_t, unint64_t))
{
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void))(*(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x58) + 16))(a1, *(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x50));
  unint64_t v6 = v5;
  sub_24874966C(v4, v5);
  a2(0, v4, v6);
  sub_248749614(v4, v6);

  return sub_248749614(v4, v6);
}

uint64_t sub_248765854(void *a1, int a2, void *a3, void *aBlock)
{
  unint64_t v6 = _Block_copy(aBlock);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a3;
  id v8 = a1;
  sub_24876570C((uint64_t)v7, sub_248765CF0);

  return swift_release();
}

void sub_2487658F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1) {
    unint64_t v6 = (void *)sub_248765E58();
  }
  else {
    unint64_t v6 = 0;
  }
  if (a3 >> 60 == 15) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = sub_248765E98();
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);
}

void sub_248765994()
{
}

id sub_2487659D8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _AskToExtensionConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_248765A4C(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x60)]);
}

uint64_t type metadata accessor for _AskToExtensionConfiguration.ExportedObject()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_248765ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t type metadata accessor for _AskToExtensionConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_248765AEC(void *a1)
{
  sub_248765670(a1, *v1);
  return 1;
}

uint64_t sub_248765B0C(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

id sub_248765B48(uint64_t a1)
{
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1)
                                                                          + 0x50)
                                                              - 8)
                                                  + 16))(&v1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x60)], a1, *(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x50));
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for _AskToExtensionConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_248765C18(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for _AskToExtensionConfiguration.ExportedObject());
  return sub_248765B48(a1);
}

id sub_248765C54(uint64_t a1)
{
  return sub_248765C18(a1);
}

void sub_248765C88()
{
}

uint64_t sub_248765CB8()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_248765CF0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_2487658F4(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_248765D28()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_248765D38()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_248765D48()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_248765D58()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_248765D68()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_248765D78()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_248765D88()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_248765D98()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_248765DA8()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_248765DB8()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_248765DC8()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_248765DD8()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_248765DE8()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_248765DF8()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_248765E08()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_248765E18()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_248765E28()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_248765E38()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_248765E48()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_248765E58()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_248765E68()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_248765E78()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_248765E88()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_248765E98()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_248765EA8()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_248765EB8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_248765EC8()
{
  return MEMORY[0x270EF06F8]();
}

uint64_t sub_248765ED8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_248765EE8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_248765EF8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_248765F08()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_248765F18()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_248765F28()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_248765F38()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_248765F48()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_248765F58()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_248765F68()
{
  return MEMORY[0x270EE57F8]();
}

uint64_t sub_248765F78()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_248765F88()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_248765F98()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_248765FA8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_248765FB8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_248765FC8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_248765FD8()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_248765FE8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_248765FF8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_248766008()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_248766018()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_248766028()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_248766038()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_248766048()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_248766058()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_248766068()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_248766078()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_248766088()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_248766098()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_2487660A8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2487660B8()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2487660C8()
{
  return MEMORY[0x270F9DAB0]();
}

uint64_t sub_2487660D8()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2487660E8()
{
  return MEMORY[0x270F9DB30]();
}

uint64_t sub_2487660F8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_248766108()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_248766118()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_248766128()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_248766138()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_248766148()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_248766158()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_248766168()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_248766178()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_248766188()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_248766198()
{
  return MEMORY[0x270EE5840]();
}

uint64_t sub_2487661A8()
{
  return MEMORY[0x270EE5848]();
}

uint64_t sub_2487661B8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2487661C8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2487661D8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2487661E8()
{
  return MEMORY[0x270EF1F18]();
}

uint64_t sub_2487661F8()
{
  return MEMORY[0x270EF1F58]();
}

uint64_t sub_248766208()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_248766218()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_248766228()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_248766238()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_248766248()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_248766258()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_248766268()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_248766278()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_248766288()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_248766298()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2487662A8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2487662B8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2487662C8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2487662D8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2487662E8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2487662F8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_248766308()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_248766318()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_248766328()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_248766338()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_248766348()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_248766358()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_248766368()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_248766378()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_248766388()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_248766398()
{
  return MEMORY[0x270F9F2B0]();
}

uint64_t sub_2487663A8()
{
  return MEMORY[0x270F9F2E0]();
}

uint64_t sub_2487663B8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2487663C8()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2487663D8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2487663E8()
{
  return MEMORY[0x270F9F328]();
}

uint64_t sub_2487663F8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_248766408()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_248766418()
{
  return MEMORY[0x270F9F418]();
}

uint64_t sub_248766428()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_248766438()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_248766448()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_248766458()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_248766468()
{
  return MEMORY[0x270F9F468]();
}

uint64_t sub_248766478()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_248766488()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_248766498()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2487664B8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_2487664C8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2487664D8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2487664E8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2487664F8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_248766508()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_248766518()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_248766528()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_248766538()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_248766548()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_248766558()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_248766568()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_248766578()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_248766588()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_248766598()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_2487665A8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2487665B8()
{
  return MEMORY[0x270F9FD98]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7060](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
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