void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_237A16D58(a1, &qword_268939DB0);
}

uint64_t sub_237A16718(uint64_t a1, uint64_t a2)
{
  return sub_237A16898(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_237A16744(uint64_t a1, uint64_t a2)
{
  return sub_237A16898(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_237A1675C(uint64_t a1, id *a2)
{
  uint64_t result = sub_237A1FE20();
  *a2 = 0;
  return result;
}

uint64_t sub_237A167D4(uint64_t a1, id *a2)
{
  char v3 = sub_237A1FE30();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_237A16854@<X0>(uint64_t *a1@<X8>)
{
  sub_237A1FE40();
  uint64_t v2 = sub_237A1FE10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_237A16898(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_237A1FE40();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_237A168DC()
{
  sub_237A1FE40();
  sub_237A1FE50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237A16930()
{
  sub_237A1FE40();
  sub_237A1FFF0();
  sub_237A1FE50();
  uint64_t v0 = sub_237A20020();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_237A169A8()
{
  uint64_t v0 = sub_237A1FE40();
  uint64_t v2 = v1;
  if (v0 == sub_237A1FE40() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_237A1FF90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_237A16A38(uint64_t a1)
{
  uint64_t v2 = sub_237A16CB4((unint64_t *)&qword_268939E00, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_237A16CB4(&qword_268939E08, type metadata accessor for FileAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_237A16AF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_237A1FE10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_237A16B3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_237A1FE40();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_237A16B68(uint64_t a1)
{
  uint64_t v2 = sub_237A16CB4(&qword_268939DD0, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_237A16CB4(&qword_268939DD8, type metadata accessor for URLResourceKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_237A16C24()
{
  return sub_237A16CB4(&qword_268939DB8, type metadata accessor for URLResourceKey);
}

uint64_t sub_237A16C6C()
{
  return sub_237A16CB4(&qword_268939DC0, type metadata accessor for URLResourceKey);
}

uint64_t sub_237A16CB4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_237A16CFC()
{
  return sub_237A16CB4(&qword_268939DC8, type metadata accessor for URLResourceKey);
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void sub_237A16D58(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_237A16DA0()
{
  return sub_237A16CB4(&qword_268939DE8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_237A16DE8()
{
  return sub_237A16CB4(&qword_268939DF0, type metadata accessor for FileAttributeKey);
}

uint64_t sub_237A16E30()
{
  return sub_237A16CB4(&qword_268939DF8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_237A16E80()
{
  uint64_t v1 = (SEL *)0x264CEF000;
  id v2 = objc_msgSend(v0, sel_modelDescription);
  id v3 = objc_msgSend(v2, sel_inputDescriptions);

  unint64_t v4 = sub_237A1B888(0, &qword_268939E10);
  unint64_t v5 = sub_237A1FE90();

  if (v5 >> 62)
  {
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_237A1FF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v6 != 1) {
    return 0;
  }
  id v7 = [v0 v1[272]];
  id v8 = objc_msgSend(v7, sel_inputDescriptions);

  uint64_t v9 = sub_237A1FE90();
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v10 = (id)MEMORY[0x237E27550](0, v9);
  }
  else
  {
    if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_47;
    }
    id v10 = *(id *)(v9 + 32);
  }
  v11 = v10;
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v11, sel_type);

  if (v12 != (id)4 || (sub_237A1A2C4() & 1) == 0) {
    return 0;
  }
  id v13 = [v0 v1[272]];
  id v14 = objc_msgSend(v13, sel_outputDescriptions);

  unint64_t v4 = sub_237A1FE90();
  if (!(v4 >> 62))
  {
    uint64_t v15 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v15) {
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_47:
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_237A1FF60();
  if (!v15)
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_11:
  uint64_t v16 = 4;
  while (1)
  {
    if ((v4 & 0xC000000000000001) != 0) {
      v17 = (SEL *)MEMORY[0x237E27550](v16 - 4, v4);
    }
    else {
      v17 = (SEL *)*(id *)(v4 + 8 * v16);
    }
    uint64_t v1 = v17;
    uint64_t v18 = v16 - 3;
    if (__OFADD__(v16 - 4, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    id v19 = [(SEL *)v17 type];

    if (v19 == (id)6) {
      break;
    }
    ++v16;
    if (v18 == v15) {
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease_n();
  id v21 = objc_msgSend(v0, sel_modelTypeName);
  uint64_t v22 = sub_237A1FE40();
  uint64_t v24 = v23;

  if (v22 == 0xD000000000000012 && v24 == 0x8000000237A20ED0 || (sub_237A1FF90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return sub_237A1A40C();
  }
  else if (v22 == 0x7373616C436D6C67 && v24 == 0xED00007265696669 {
         || (sub_237A1FF90() & 1) != 0
  }
         || v22 == 0xD000000000000017 && v24 == 0x8000000237A20F70
         || (sub_237A1FF90() & 1) != 0
         || v22 == 0xD000000000000016 && v24 == 0x8000000237A20F90
         || (sub_237A1FF90() & 1) != 0
         || v22 == 0xD000000000000017 && v24 == 0x8000000237A20F10
         || (sub_237A1FF90() & 1) != 0
         || v22 == 0xD00000000000001BLL && v24 == 0x8000000237A20FB0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v25 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    return v25 & 1;
  }
}

uint64_t sub_237A17378()
{
  id v1 = objc_msgSend(v0, sel_modelDescription);
  id v2 = objc_msgSend(v1, sel_inputDescriptions);

  sub_237A1B888(0, &qword_268939E10);
  unint64_t v3 = sub_237A1FE90();

  if (v3 >> 62) {
    goto LABEL_39;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4)
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_3:
  uint64_t v5 = 4;
  while (1)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x237E27550](v5 - 4, v3);
    }
    else {
      id v6 = *(id *)(v3 + 8 * v5);
    }
    id v7 = v6;
    uint64_t v8 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_237A1FF60();
      if (!v4) {
        goto LABEL_14;
      }
      goto LABEL_3;
    }
    id v9 = objc_msgSend(v6, sel_name);
    uint64_t v10 = sub_237A1FE40();
    uint64_t v12 = v11;

    if (v10 == 0x6E496574617473 && v12 == 0xE700000000000000) {
      break;
    }
    char v14 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    if (v14)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_17;
    }

    ++v5;
    if (v8 == v4) {
      goto LABEL_14;
    }
  }
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
LABEL_17:
  if (objc_msgSend(v7, sel_type) != (id)5 || !objc_msgSend(v7, sel_constraint))
  {

    return 0;
  }
  self;
  id v15 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shape);
  sub_237A1B888(0, &qword_268939E18);
  unint64_t v16 = sub_237A1FE90();

  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268939E20);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_237A20740;
  *(void *)(v18 + 32) = sub_237A1FED0();
  sub_237A1FEA0();
  LOBYTE(v18) = sub_237A1AA34(v16, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0) {
    goto LABEL_65;
  }
  id v19 = objc_msgSend(v83, sel_modelDescription);
  id v20 = objc_msgSend(v19, sel_inputDescriptions);

  unint64_t v21 = sub_237A1FE90();
  uint64_t v84 = MEMORY[0x263F8EE78];
  if (!(v21 >> 62))
  {
    uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v22) {
      goto LABEL_22;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    uint64_t v32 = MEMORY[0x263F8EE78];
LABEL_43:
    if ((v32 & 0x8000000000000000) == 0 && (v32 & 0x4000000000000000) == 0)
    {
      uint64_t v33 = *(void *)(v32 + 16);
      goto LABEL_46;
    }
    goto LABEL_110;
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_237A1FF60();
  swift_bridgeObjectRelease();
  if (!v22) {
    goto LABEL_42;
  }
LABEL_22:
  if (v22 >= 1)
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if ((v21 & 0xC000000000000001) != 0) {
        id v24 = (id)MEMORY[0x237E27550](i, v21);
      }
      else {
        id v24 = *(id *)(v21 + 8 * i + 32);
      }
      char v25 = v24;
      id v26 = objc_msgSend(v24, sel_name);
      uint64_t v27 = sub_237A1FE40();
      uint64_t v29 = v28;

      if (v27 == 0x6E496574617473 && v29 == 0xE700000000000000)
      {

        swift_bridgeObjectRelease();
      }
      else
      {
        char v31 = sub_237A1FF90();
        swift_bridgeObjectRelease();
        if (v31)
        {
        }
        else
        {
          sub_237A1FF20();
          sub_237A1FF40();
          sub_237A1FF50();
          sub_237A1FF30();
        }
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v32 = v84;
    goto LABEL_43;
  }
  __break(1u);
LABEL_112:
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_237A1FF60();
  swift_bridgeObjectRelease();
LABEL_49:
  swift_bridgeObjectRelease();
  if (v37 != 3) {
    goto LABEL_65;
  }
  id v38 = objc_msgSend(v83, sel_modelDescription);
  id v39 = [v38 *(SEL *)(v17 + 2216)];

  unint64_t v40 = sub_237A1FE90();
  if (!(v40 >> 62))
  {
    uint64_t v41 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v41) {
      goto LABEL_52;
    }
LABEL_64:
    swift_bridgeObjectRelease_n();
    goto LABEL_65;
  }
  while (2)
  {
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_237A1FF60();
    if (!v41) {
      goto LABEL_64;
    }
LABEL_52:
    uint64_t v42 = 4;
    while (1)
    {
      uint64_t v43 = v42 - 4;
      if ((v40 & 0xC000000000000001) != 0)
      {
        id v44 = (id)MEMORY[0x237E27550](v42 - 4, v40);
        uint64_t v45 = v42 - 3;
        if (__OFADD__(v43, 1)) {
          goto LABEL_109;
        }
      }
      else
      {
        id v44 = *(id *)(v40 + 8 * v42);
        uint64_t v45 = v42 - 3;
        if (__OFADD__(v43, 1))
        {
LABEL_109:
          __break(1u);
LABEL_110:
          swift_bridgeObjectRetain();
          uint64_t v33 = sub_237A1FF60();
          swift_release();
LABEL_46:
          swift_release();
          if (!v33) {
            goto LABEL_65;
          }
          id v34 = objc_msgSend(v83, sel_modelDescription);
          uint64_t v17 = 0x264CEF000uLL;
          id v35 = objc_msgSend(v34, sel_outputDescriptions);

          unint64_t v36 = sub_237A1FE90();
          if (!(v36 >> 62))
          {
            uint64_t v37 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
            goto LABEL_49;
          }
          goto LABEL_112;
        }
      }
      id v82 = v44;
      id v46 = objc_msgSend(v44, sel_name);
      uint64_t v47 = sub_237A1FE40();
      uint64_t v49 = v48;

      if (v47 == 0x6C6562616CLL && v49 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_70;
      }
      char v51 = sub_237A1FF90();
      swift_bridgeObjectRelease();
      if (v51) {
        break;
      }

      ++v42;
      if (v45 == v41) {
        goto LABEL_64;
      }
    }
    swift_bridgeObjectRelease_n();
LABEL_70:
    if (objc_msgSend(v82, sel_type) != (id)3)
    {

      goto LABEL_66;
    }
    id v53 = objc_msgSend(v83, sel_modelDescription);
    id v54 = objc_msgSend(v53, sel_outputDescriptions);

    unint64_t v40 = sub_237A1FE90();
    if (!(v40 >> 62))
    {
      uint64_t v55 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v55) {
        goto LABEL_73;
      }
LABEL_82:
      swift_bridgeObjectRelease_n();
      v64 = v82;
LABEL_83:

LABEL_65:
LABEL_66:
      swift_unknownObjectRelease();
      return 0;
    }
LABEL_117:
    swift_bridgeObjectRetain();
    uint64_t v55 = sub_237A1FF60();
    if (!v55) {
      goto LABEL_82;
    }
LABEL_73:
    uint64_t v56 = 4;
LABEL_74:
    if ((v40 & 0xC000000000000001) != 0) {
      id v57 = (id)MEMORY[0x237E27550](v56 - 4, v40);
    }
    else {
      id v57 = *(id *)(v40 + 8 * v56);
    }
    uint64_t v58 = v56 - 3;
    if (__OFADD__(v56 - 4, 1))
    {
      __break(1u);
      continue;
    }
    break;
  }
  id v81 = v57;
  id v59 = objc_msgSend(v57, sel_name);
  uint64_t v60 = sub_237A1FE40();
  uint64_t v62 = v61;

  if (v60 == 0xD000000000000010 && v62 == 0x8000000237A20F50)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    goto LABEL_87;
  }
  char v63 = sub_237A1FF90();
  swift_bridgeObjectRelease();
  if ((v63 & 1) == 0)
  {

    ++v56;
    if (v58 == v55) {
      goto LABEL_82;
    }
    goto LABEL_74;
  }
  swift_bridgeObjectRelease_n();
LABEL_87:
  if (objc_msgSend(v81, sel_type) != (id)6)
  {

    swift_unknownObjectRelease();
    return 0;
  }
  id v65 = objc_msgSend(v83, sel_modelDescription);
  id v66 = objc_msgSend(v65, sel_outputDescriptions);

  unint64_t v40 = sub_237A1FE90();
  if (v40 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v67 = sub_237A1FF60();
    if (v67) {
      goto LABEL_90;
    }
LABEL_101:
    swift_bridgeObjectRelease_n();

    v64 = v81;
    goto LABEL_83;
  }
  uint64_t v67 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v67) {
    goto LABEL_101;
  }
LABEL_90:
  uint64_t v68 = 4;
  while (1)
  {
    if ((v40 & 0xC000000000000001) != 0) {
      id v69 = (id)MEMORY[0x237E27550](v68 - 4, v40);
    }
    else {
      id v69 = *(id *)(v40 + 8 * v68);
    }
    v70 = v69;
    uint64_t v71 = v68 - 3;
    if (__OFADD__(v68 - 4, 1))
    {
      __break(1u);
      goto LABEL_117;
    }
    id v72 = objc_msgSend(v69, sel_name);
    uint64_t v73 = sub_237A1FE40();
    uint64_t v75 = v74;

    if (v73 == 0x74754F6574617473 && v75 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_105;
    }
    char v77 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    if (v77) {
      break;
    }

    ++v68;
    if (v71 == v67) {
      goto LABEL_101;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_105:
  if (objc_msgSend(v70, sel_type) == (id)5 && objc_msgSend(v7, sel_constraint))
  {
    self;
    id v78 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shape);
    unint64_t v79 = sub_237A1FE90();

    uint64_t v80 = swift_allocObject();
    *(_OWORD *)(v80 + 16) = xmmword_237A20740;
    *(void *)(v80 + 32) = sub_237A1FED0();
    sub_237A1FEA0();
    LOBYTE(v80) = sub_237A1AA34(v79, v80);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return v80 & 1;
  }

  swift_unknownObjectRelease();
  return 0;
}

unint64_t sub_237A17FA8()
{
  id v1 = v0;
  unint64_t v2 = 0x264CEF000uLL;
  id v3 = objc_msgSend(v0, sel_modelDescription);
  id v4 = objc_msgSend(v3, sel_inputDescriptions);

  sub_237A1B888(0, &qword_268939E10);
  unint64_t v5 = sub_237A1FE90();

  if (v5 >> 62) {
    goto LABEL_68;
  }
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
  {
LABEL_24:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_3:
  uint64_t v7 = 4;
  while (1)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v8 = (id)MEMORY[0x237E27550](v7 - 4, v5);
    }
    else {
      id v8 = *(id *)(v5 + 8 * v7);
    }
    id v9 = v8;
    uint64_t v10 = v7 - 3;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
LABEL_65:

      return 0;
    }
    id v11 = objc_msgSend(v8, sel_type);

    if (v11 == (id)4) {
      break;
    }
    ++v7;
    if (v10 == v6) {
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease_n();
  id v12 = [v1 *(SEL *)(v2 + 2176)];
  id v13 = objc_msgSend(v12, sel_outputDescriptions);

  unint64_t v14 = sub_237A1FE90();
  if (v14 >> 62)
  {
LABEL_71:
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_237A1FF60();
    if (!v15) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v15) {
      goto LABEL_24;
    }
  }
  id v53 = v1;
  uint64_t v16 = 4;
  while (1)
  {
    if ((v14 & 0xC000000000000001) != 0) {
      id v17 = (id)MEMORY[0x237E27550](v16 - 4, v14);
    }
    else {
      id v17 = *(id *)(v14 + 8 * v16);
    }
    unint64_t v5 = (unint64_t)v17;
    unint64_t v2 = v16 - 3;
    if (__OFADD__(v16 - 4, 1))
    {
      __break(1u);
LABEL_68:
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_237A1FF60();
      if (!v6) {
        goto LABEL_24;
      }
      goto LABEL_3;
    }
    id v1 = objc_msgSend(v17, sel_name);
    uint64_t v18 = sub_237A1FE40();
    uint64_t v20 = v19;

    if (v18 == 0x6E656469666E6F63 && v20 == 0xEA00000000006563)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    char v22 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    if (v22) {
      break;
    }

    ++v16;
    if (v2 == v15) {
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_28:
  if (objc_msgSend((id)v5, sel_type, v53) != (id)5)
  {
LABEL_63:

    return 0;
  }
  id v24 = objc_msgSend(v54, sel_modelDescription);
  id v25 = objc_msgSend(v24, sel_outputDescriptions);

  unint64_t v14 = sub_237A1FE90();
  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_237A1FF60();
    if (v26) {
      goto LABEL_31;
    }
    goto LABEL_43;
  }
  uint64_t v26 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v26)
  {
LABEL_43:
    swift_bridgeObjectRelease_n();
    goto LABEL_63;
  }
LABEL_31:
  uint64_t v27 = 4;
  while (1)
  {
    uint64_t v28 = v27 - 4;
    if ((v14 & 0xC000000000000001) != 0)
    {
      id v29 = (id)MEMORY[0x237E27550](v27 - 4, v14);
      uint64_t v30 = v27 - 3;
      if (__OFADD__(v28, 1)) {
        goto LABEL_70;
      }
    }
    else
    {
      id v29 = *(id *)(v14 + 8 * v27);
      uint64_t v30 = v27 - 3;
      if (__OFADD__(v28, 1))
      {
LABEL_70:
        __break(1u);
        goto LABEL_71;
      }
    }
    char v31 = v29;
    id v1 = objc_msgSend(v29, sel_name);
    uint64_t v32 = sub_237A1FE40();
    uint64_t v34 = v33;

    if (v32 == 0x616E6964726F6F63 && v34 == 0xEB00000000736574)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_46;
    }
    char v36 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    if (v36) {
      break;
    }

    ++v27;
    if (v30 == v26) {
      goto LABEL_43;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_46:
  id v1 = v31;
  if (objc_msgSend(v31, sel_type) != (id)5) {
    goto LABEL_62;
  }
  id v37 = objc_msgSend(v54, sel_modelTypeName);
  uint64_t v38 = sub_237A1FE40();
  uint64_t v40 = v39;

  if (v38 == 0x656E696C65706970 && v40 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v41 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0) {
      goto LABEL_65;
    }
  }
  id v42 = objc_msgSend(v54, sel_subModels);
  if (!v42)
  {
LABEL_62:

    goto LABEL_63;
  }
  uint64_t v43 = v42;
  sub_237A1B888(0, &qword_268939E38);
  unint64_t v44 = sub_237A1FE90();

  if (v44 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_237A1FF60();
    swift_bridgeObjectRelease();
    if (!v45) {
      goto LABEL_76;
    }
LABEL_54:
    unint64_t result = v45 - 1;
    if (__OFSUB__(v45, 1))
    {
      __break(1u);
    }
    else if ((v44 & 0xC000000000000001) == 0)
    {
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (result < *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        id v46 = *(id *)(v44 + 8 * result + 32);
LABEL_59:
        uint64_t v47 = v46;
        swift_bridgeObjectRelease();
        id v48 = objc_msgSend(v47, sel_modelTypeName);

        uint64_t v49 = sub_237A1FE40();
        uint64_t v51 = v50;

        if (v49 == 0xD000000000000015 && v51 == 0x8000000237A20F30)
        {
          swift_bridgeObjectRelease();

          return 1;
        }
        else
        {
          char v52 = sub_237A1FF90();
          swift_bridgeObjectRelease();

          return v52 & 1;
        }
      }
      __break(1u);
      return result;
    }
    id v46 = (id)MEMORY[0x237E27550](result, v44);
    goto LABEL_59;
  }
  uint64_t v45 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v45) {
    goto LABEL_54;
  }
LABEL_76:

  swift_bridgeObjectRelease();
  return 0;
}

void sub_237A186D4()
{
  id v2 = objc_msgSend(v0, sel_modelDescription);
  id v3 = objc_msgSend(v2, sel_inputDescriptions);

  sub_237A1B888(0, &qword_268939E10);
  unint64_t v4 = sub_237A1FE90();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_237A1FF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v5 != 1) {
    return;
  }
  id v6 = objc_msgSend(v0, sel_modelDescription);
  id v7 = objc_msgSend(v6, sel_inputDescriptions);

  uint64_t v8 = sub_237A1FE90();
  if ((v8 & 0xC000000000000001) != 0)
  {
    id v9 = (id)MEMORY[0x237E27550](0, v8);
  }
  else
  {
    if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_19;
    }
    id v9 = *(id *)(v8 + 32);
  }
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v10, sel_type);

  if (v11 != (id)4) {
    return;
  }
  id v12 = objc_msgSend(v0, sel_modelDescription);
  unint64_t v1 = 0x264CEF000uLL;
  id v13 = objc_msgSend(v12, sel_outputDescriptions);

  unint64_t v14 = sub_237A1FE90();
  if (!(v14 >> 62))
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_10;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_237A1FF60();
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  if (v15 == 1)
  {
    id v16 = objc_msgSend(v0, sel_modelDescription);
    id v17 = [v16 *(SEL *)(v1 + 2216)];

    uint64_t v18 = sub_237A1FE90();
    if ((v18 & 0xC000000000000001) != 0)
    {
      id v19 = (id)MEMORY[0x237E27550](0, v18);
      goto LABEL_14;
    }
    if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v19 = *(id *)(v18 + 32);
LABEL_14:
      uint64_t v20 = v19;
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_type);

      return;
    }
    __break(1u);
  }
}

void sub_237A18994()
{
  id v3 = v0;
  id v4 = objc_msgSend(v0, sel_modelDescription);
  id v5 = objc_msgSend(v4, sel_inputDescriptions);

  sub_237A1B888(0, &qword_268939E10);
  unint64_t v6 = sub_237A1FE90();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_237A1FF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 == 1)
  {
    id v8 = objc_msgSend(v3, sel_modelDescription);
    id v9 = objc_msgSend(v8, sel_inputDescriptions);

    unint64_t v10 = sub_237A1FE90();
    if ((v10 & 0xC000000000000001) != 0)
    {
      id v11 = (id)MEMORY[0x237E27550](0, v10);
    }
    else
    {
      if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_43;
      }
      id v11 = *(id *)(v10 + 32);
    }
    id v8 = v11;
    swift_bridgeObjectRelease();
    if (objc_msgSend(v8, sel_type) != (id)5 || !objc_msgSend(v8, sel_constraint))
    {
LABEL_36:

      return;
    }
    self;
    id v12 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shape);
    unint64_t v10 = sub_237A1B888(0, &qword_268939E18);
    unint64_t v1 = sub_237A1FE90();

    if (v1 >> 62) {
      goto LABEL_44;
    }
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) == 3)
    {
      do
      {
        unint64_t v32 = v1 & 0xC000000000000001;
        if ((v1 & 0xC000000000000001) != 0)
        {
          id v13 = (id)MEMORY[0x237E27550](1, v1);
        }
        else
        {
          if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
          {
            __break(1u);
            goto LABEL_49;
          }
          id v13 = *(id *)(v1 + 40);
        }
        unint64_t v14 = v13;
        uint64_t v15 = (void *)sub_237A1FED0();
        char v16 = sub_237A1FEE0();

        if ((v16 & 1) == 0) {
          break;
        }
        if (v32)
        {
          id v17 = (id)MEMORY[0x237E27550](2, v1);
        }
        else
        {
          if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) < 3uLL)
          {
            __break(1u);
            return;
          }
          id v17 = *(id *)(v1 + 48);
        }
        uint64_t v18 = v17;
        id v19 = (void *)sub_237A1FED0();
        char v20 = sub_237A1FEE0();

        if (v20)
        {
          swift_bridgeObjectRelease();
          unint64_t v2 = 0x264CEF000;
        }
        else
        {
          if (v32) {
            id v21 = (id)MEMORY[0x237E27550](2, v1);
          }
          else {
            id v21 = *(id *)(v1 + 48);
          }
          char v22 = v21;
          unint64_t v2 = 0x264CEF000uLL;
          swift_bridgeObjectRelease();
          uint64_t v23 = (void *)sub_237A1FED0();
          char v24 = sub_237A1FEE0();

          if ((v24 & 1) == 0)
          {
            swift_unknownObjectRelease();
            goto LABEL_36;
          }
        }
        id v25 = objc_msgSend(v3, sel_modelDescription);
        id v26 = objc_msgSend(v25, sel_outputDescriptions);

        unint64_t v10 = sub_237A1FE90();
        if (!(v10 >> 62))
        {
          uint64_t v27 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v27) {
            goto LABEL_34;
          }
          goto LABEL_27;
        }
LABEL_49:
        swift_bridgeObjectRetain();
        uint64_t v27 = sub_237A1FF60();
        if (!v27)
        {
LABEL_34:
          swift_bridgeObjectRelease_n();

          swift_unknownObjectRelease();
          return;
        }
LABEL_27:
        uint64_t v28 = 4;
        while (1)
        {
          id v29 = (v10 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x237E27550](v28 - 4, v10)
              : *(id *)(v10 + 8 * v28);
          id v3 = v29;
          unint64_t v1 = v28 - 3;
          if (__OFADD__(v28 - 4, 1)) {
            break;
          }
          if ([v29 *(SEL *)(v2 + 2192)] == (id)6)
          {
            swift_bridgeObjectRelease_n();
            if (objc_msgSend(v3, sel_constraint))
            {
              self;
              uint64_t v30 = (void *)swift_dynamicCastObjCClassUnconditional();
              swift_unknownObjectRetain();
              objc_msgSend(v30, sel_keyType);

              swift_unknownObjectRelease_n();
              swift_unknownObjectRelease();
            }
            else
            {

              swift_unknownObjectRelease();
            }
            return;
          }

          ++v28;
          if (v1 == v27) {
            goto LABEL_34;
          }
        }
LABEL_43:
        __break(1u);
LABEL_44:
        swift_bridgeObjectRetain();
        uint64_t v31 = sub_237A1FF60();
        swift_bridgeObjectRelease();
      }
      while (v31 == 3);
    }
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
}

unint64_t sub_237A18F00()
{
  id v1 = objc_msgSend(v0, sel_modelTypeName);
  uint64_t v2 = sub_237A1FE40();
  uint64_t v4 = v3;

  if (v2 == 0xD000000000000012 && v4 == 0x8000000237A20ED0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    char v6 = 0;
    if ((v5 & 1) == 0) {
      return v6 & 1;
    }
  }
  id v7 = objc_msgSend(v0, sel_subModels);
  if (!v7)
  {
    char v6 = 0;
    return v6 & 1;
  }
  id v8 = v7;
  sub_237A1B888(0, &qword_268939E38);
  unint64_t v9 = sub_237A1FE90();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t result = sub_237A1FF60();
    unint64_t v10 = result;
    if (!result) {
      goto LABEL_37;
    }
  }
  else
  {
    unint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t result = swift_bridgeObjectRetain();
    if (!v10) {
      goto LABEL_37;
    }
  }
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v12 = (id)MEMORY[0x237E27550](0, v9);
  }
  else
  {
    if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_42;
    }
    id v12 = *(id *)(v9 + 32);
  }
  id v13 = v12;
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v13, sel_modelTypeName);

  uint64_t v15 = sub_237A1FE40();
  uint64_t v17 = v16;

  unint64_t result = v10 - 1;
  if (__OFSUB__(v10, 1))
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v18 = (id)MEMORY[0x237E27550](result, v9);
    goto LABEL_18;
  }
  if ((result & 0x8000000000000000) != 0) {
    goto LABEL_43;
  }
  if (result < *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v18 = *(id *)(v9 + 8 * result + 32);
LABEL_18:
    id v19 = v18;
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v19, sel_modelTypeName);

    uint64_t v21 = sub_237A1FE40();
    uint64_t v23 = v22;

    BOOL v24 = v15 == 0xD00000000000001ALL && v17 == 0x8000000237A20EF0;
    char v25 = v24;
    if (v24 || (sub_237A1FF90() & 1) != 0)
    {
      if (v21 == 0x7373616C436D6C67 && v23 == 0xED00007265696669 || (sub_237A1FF90() & 1) != 0) {
        goto LABEL_33;
      }
      if (v25) {
        goto LABEL_32;
      }
    }
    if (sub_237A1FF90())
    {
LABEL_32:
      if (v21 != 0xD000000000000017 || v23 != 0x8000000237A20F10)
      {
        char v6 = sub_237A1FF90();
        swift_bridgeObjectRelease();
        goto LABEL_38;
      }
LABEL_33:
      swift_bridgeObjectRelease();
      char v6 = 1;
LABEL_38:
      swift_bridgeObjectRelease();
      return v6 & 1;
    }
LABEL_37:
    swift_bridgeObjectRelease();
    char v6 = 0;
    goto LABEL_38;
  }
LABEL_44:
  __break(1u);
  return result;
}

void sub_237A192AC()
{
  id v1 = objc_msgSend(v0, sel_modelTypeName);
  uint64_t v2 = sub_237A1FE40();
  uint64_t v4 = v3;

  if (v2 == 0xD000000000000012 && v4 == 0x8000000237A20ED0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0) {
      return;
    }
  }
  id v6 = objc_msgSend(v0, sel_subModels);
  if (v6)
  {
    id v7 = v6;
    sub_237A1B888(0, &qword_268939E38);
    unint64_t v8 = sub_237A1FE90();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_237A1FF60();
      swift_bridgeObjectRelease();
      if (v22 != 2) {
        goto LABEL_24;
      }
    }
    else if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) != 2)
    {
      goto LABEL_24;
    }
    if ((v8 & 0xC000000000000001) != 0)
    {
      id v9 = (id)MEMORY[0x237E27550](0, v8);
    }
    else
    {
      if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_28;
      }
      id v9 = *(id *)(v8 + 32);
    }
    unint64_t v10 = v9;
    id v11 = objc_msgSend(v9, sel_modelTypeName);

    uint64_t v12 = sub_237A1FE40();
    uint64_t v14 = v13;

    if (v12 == 0xD000000000000011 && v14 == 0x8000000237A20E90)
    {
      swift_bridgeObjectRelease();
LABEL_15:
      if ((v8 & 0xC000000000000001) != 0)
      {
        id v16 = (id)MEMORY[0x237E27550](1, v8);
LABEL_19:
        uint64_t v17 = v16;
        swift_bridgeObjectRelease();
        id v18 = objc_msgSend(v17, sel_modelTypeName);

        uint64_t v19 = sub_237A1FE40();
        uint64_t v21 = v20;

        if (v19 == 0x7373616C436D6C67 && v21 == 0xED00007265696669)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_237A1FF90();
          swift_bridgeObjectRelease();
        }
        return;
      }
      if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        id v16 = *(id *)(v8 + 40);
        goto LABEL_19;
      }
LABEL_28:
      __break(1u);
      return;
    }
    char v15 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_15;
    }
LABEL_24:
    swift_bridgeObjectRelease();
  }
}

void sub_237A195C4()
{
  id v1 = objc_msgSend(v0, sel_modelTypeName);
  uint64_t v2 = sub_237A1FE40();
  uint64_t v4 = v3;

  if (v2 == 0xD000000000000011 && v4 == 0x8000000237A20E70)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0) {
      return;
    }
  }
  id v6 = objc_msgSend(v0, sel_subModels);
  if (v6)
  {
    id v7 = v6;
    sub_237A1B888(0, &qword_268939E38);
    unint64_t v8 = sub_237A1FE90();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_237A1FF60();
      swift_bridgeObjectRelease();
      if (v22 != 2) {
        goto LABEL_24;
      }
    }
    else if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) != 2)
    {
      goto LABEL_24;
    }
    if ((v8 & 0xC000000000000001) != 0)
    {
      id v9 = (id)MEMORY[0x237E27550](0, v8);
    }
    else
    {
      if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_28;
      }
      id v9 = *(id *)(v8 + 32);
    }
    unint64_t v10 = v9;
    id v11 = objc_msgSend(v9, sel_modelTypeName);

    uint64_t v12 = sub_237A1FE40();
    uint64_t v14 = v13;

    if (v12 == 0xD000000000000011 && v14 == 0x8000000237A20E90)
    {
      swift_bridgeObjectRelease();
LABEL_15:
      if ((v8 & 0xC000000000000001) != 0)
      {
        id v16 = (id)MEMORY[0x237E27550](1, v8);
LABEL_19:
        uint64_t v17 = v16;
        swift_bridgeObjectRelease();
        id v18 = objc_msgSend(v17, sel_modelTypeName);

        uint64_t v19 = sub_237A1FE40();
        uint64_t v21 = v20;

        if (v19 == 0xD000000000000015 && v21 == 0x8000000237A20EB0)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_237A1FF90();
          swift_bridgeObjectRelease();
        }
        return;
      }
      if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        id v16 = *(id *)(v8 + 40);
        goto LABEL_19;
      }
LABEL_28:
      __break(1u);
      return;
    }
    char v15 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_15;
    }
LABEL_24:
    swift_bridgeObjectRelease();
  }
}

BOOL sub_237A198AC()
{
  uint64_t v3 = v0;
  unint64_t v4 = 0x264CEF000uLL;
  id v5 = objc_msgSend(v0, sel_modelDescription);
  id v6 = objc_msgSend(v5, sel_inputDescriptions);

  sub_237A1B888(0, &qword_268939E10);
  unint64_t v7 = sub_237A1FE90();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_237A1FF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v8 != 1) {
    return 0;
  }
  id v9 = objc_msgSend(v3, sel_modelDescription);
  id v10 = objc_msgSend(v9, sel_inputDescriptions);

  unint64_t v11 = sub_237A1FE90();
  if ((v11 & 0xC000000000000001) != 0)
  {
LABEL_28:
    id v12 = (id)MEMORY[0x237E27550](0, v11);
  }
  else
  {
    if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_30;
    }
    id v12 = *(id *)(v11 + 32);
  }
  id v9 = v12;
  swift_bridgeObjectRelease();
  unint64_t v1 = 0x264CEF000uLL;
  if (objc_msgSend(v9, sel_type) != (id)5
    || (unint64_t v2 = 0x264CEF000uLL, !objc_msgSend(v9, sel_constraint)))
  {

    return 0;
  }
  self;
  id v13 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shape);
  sub_237A1B888(0, &qword_268939E18);
  unint64_t v14 = sub_237A1FE90();

  __swift_instantiateConcreteTypeFromMangledName(&qword_268939E20);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_237A20750;
  *(void *)(v15 + 32) = sub_237A1FED0();
  *(void *)(v15 + 40) = sub_237A1FED0();
  *(void *)(v15 + 48) = sub_237A1FED0();
  sub_237A1FEA0();
  LOBYTE(v15) = sub_237A1AA34(v14, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v15 & 1) == 0) {
    goto LABEL_20;
  }
  id v16 = [v3 *(SEL *)(v4 + 2176)];
  id v17 = objc_msgSend(v16, sel_outputDescriptions);

  unint64_t v11 = sub_237A1FE90();
  if (!(v11 >> 62))
  {
    uint64_t v18 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v18) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
LABEL_30:
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_237A1FF60();
  if (!v18)
  {
LABEL_19:
    swift_bridgeObjectRelease_n();
LABEL_20:

    swift_unknownObjectRelease();
    return 0;
  }
LABEL_12:
  unint64_t v4 = 4;
  while (1)
  {
    if ((v11 & 0xC000000000000001) != 0) {
      id v19 = (id)MEMORY[0x237E27550](v4 - 4, v11);
    }
    else {
      id v19 = *(id *)(v11 + 8 * v4);
    }
    uint64_t v3 = v19;
    unint64_t v20 = v4 - 3;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if ([v19 *(SEL *)(v1 + 2192)] == (id)6) {
      break;
    }

    ++v4;
    if (v20 == v18) {
      goto LABEL_19;
    }
  }
  swift_bridgeObjectRelease_n();
  if ([v3 *(SEL *)(v2 + 2200)])
  {
    self;
    uint64_t v22 = (void *)swift_dynamicCastObjCClassUnconditional();
    swift_unknownObjectRetain();
    id v23 = objc_msgSend(v22, sel_keyType);

    swift_unknownObjectRelease_n();
    swift_unknownObjectRelease();
    return v23 == (id)3;
  }

  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_237A19D00()
{
  uint64_t v3 = v0;
  id v4 = objc_msgSend(v0, sel_modelDescription);
  id v5 = objc_msgSend(v4, sel_inputDescriptions);

  sub_237A1B888(0, &qword_268939E10);
  unint64_t v6 = sub_237A1FE90();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_237A1FF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 != 1) {
    return 0;
  }
  id v8 = objc_msgSend(v3, sel_modelDescription);
  id v9 = objc_msgSend(v8, sel_inputDescriptions);

  unint64_t v10 = sub_237A1FE90();
  if ((v10 & 0xC000000000000001) != 0)
  {
LABEL_43:
    id v11 = (id)MEMORY[0x237E27550](0, v10);
  }
  else
  {
    if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_45;
    }
    id v11 = *(id *)(v10 + 32);
  }
  id v8 = v11;
  swift_bridgeObjectRelease();
  if (objc_msgSend(v8, sel_type) != (id)5 || !objc_msgSend(v8, sel_constraint))
  {

    return 0;
  }
  self;
  id v12 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shape);
  sub_237A1B888(0, &qword_268939E18);
  unint64_t v1 = sub_237A1FE90();

  unint64_t v2 = v1 >> 62;
  if (!(v1 >> 62))
  {
    int64_t v13 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13 >= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v13 >= (unint64_t)v14)
    {
LABEL_14:
      if ((v1 & 0xC000000000000001) != 0 && (unint64_t)v13 >= 2)
      {
        uint64_t v15 = v14;
        do
        {
          uint64_t v16 = v15 + 1;
          sub_237A1FF00();
          uint64_t v15 = v16;
        }
        while (v13 != v16);
      }
      if (v2)
      {
        swift_bridgeObjectRetain();
        sub_237A1FF70();
        id v9 = v17;
        uint64_t v14 = v18;
        int64_t v13 = v19;
        swift_bridgeObjectRelease_n();
      }
      else
      {
        id v9 = (id)((v1 & 0xFFFFFFFFFFFFFF8) + 32);
        int64_t v13 = (2 * v13) | 1;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_268939E20);
      unint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_237A20760;
      *(void *)(v1 + 32) = sub_237A1FED0();
      *(void *)(v1 + 40) = sub_237A1FED0();
      sub_237A1FEA0();
      if ((v1 & 0x8000000000000000) == 0 && (v1 & 0x4000000000000000) == 0)
      {
        uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
LABEL_25:
        sub_237A1B2A0((uint64_t)v9, v14, v13, v20 + 32, 0, (2 * *(void *)(v20 + 16)) | 1);
        char v22 = v21;
        swift_unknownObjectRelease();
        swift_release();
        if (v22)
        {
          id v23 = objc_msgSend(v3, sel_modelDescription);
          id v24 = objc_msgSend(v23, sel_outputDescriptions);

          unint64_t v10 = sub_237A1FE90();
          if (v10 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v25 = sub_237A1FF60();
            unint64_t v26 = 0x264CEF000;
            if (v25)
            {
LABEL_28:
              id v9 = (id)(v10 & 0xC000000000000001);
              uint64_t v27 = 4;
              while (1)
              {
                if (v9) {
                  id v28 = (id)MEMORY[0x237E27550](v27 - 4, v10);
                }
                else {
                  id v28 = *(id *)(v10 + 8 * v27);
                }
                uint64_t v3 = v28;
                uint64_t v29 = v27 - 3;
                if (__OFADD__(v27 - 4, 1))
                {
                  __break(1u);
                  goto LABEL_43;
                }
                if ([v28 *(SEL *)(v26 + 2192)] == (id)6) {
                  break;
                }

                ++v27;
                if (v29 == v25) {
                  goto LABEL_35;
                }
              }
              swift_bridgeObjectRelease_n();
              if (objc_msgSend(v3, sel_constraint))
              {
                self;
                uint64_t v31 = (void *)swift_dynamicCastObjCClassUnconditional();
                swift_unknownObjectRetain();
                id v32 = objc_msgSend(v31, sel_keyType);

                swift_unknownObjectRelease_n();
                swift_unknownObjectRelease();
                return v32 == (id)3;
              }

              swift_unknownObjectRelease();
              return 0;
            }
          }
          else
          {
            uint64_t v25 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            unint64_t v26 = 0x264CEF000uLL;
            if (v25) {
              goto LABEL_28;
            }
          }
LABEL_35:
          swift_bridgeObjectRelease_n();
        }

        swift_unknownObjectRelease();
        return 0;
      }
LABEL_53:
      uint64_t v20 = (uint64_t)sub_237A1AD20(v1);
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  int64_t v13 = sub_237A1FF60();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v13 & 0x8000000000000000) == 0)
  {
    if (v13 >= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    swift_bridgeObjectRetain();
    id v9 = (id)sub_237A1FF60();
    swift_bridgeObjectRelease();
    if ((uint64_t)v9 >= v14)
    {
      swift_bridgeObjectRetain();
      id v9 = (id)sub_237A1FF60();
      swift_bridgeObjectRelease();
      if ((uint64_t)v9 >= v13) {
        goto LABEL_14;
      }
      __break(1u);
    }
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  __break(1u);
  return result;
}

uint64_t sub_237A1A2C4()
{
  unint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_modelDescription);
  id v3 = objc_msgSend(v2, sel_predictedFeatureName);

  if (v3)
  {
    uint64_t v4 = sub_237A1FE40();
    unint64_t v6 = v5;

    uint64_t v7 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0) {
      uint64_t v7 = v4 & 0xFFFFFFFFFFFFLL;
    }
    if (v7)
    {
      id v8 = objc_msgSend(v1, sel_modelDescription);
      id v9 = objc_msgSend(v8, sel_outputDescriptions);

      sub_237A1B888(0, &qword_268939E10);
      unint64_t v10 = sub_237A1FE90();

      swift_bridgeObjectRetain();
      char v11 = sub_237A1B100(v10, v4, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

uint64_t sub_237A1A40C()
{
  uint64_t result = (uint64_t)objc_msgSend(v0, sel_subModels);
  if (!result) {
    return result;
  }
  id v2 = (void *)result;
  sub_237A1B888(0, &qword_268939E38);
  unint64_t v3 = sub_237A1FE90();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_237A1FF60();
    swift_bridgeObjectRelease();
    if (v39 != 2) {
      goto LABEL_7;
    }
  }
  else if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) != 2)
  {
    goto LABEL_7;
  }
  id v4 = objc_msgSend(v0, sel_modelDescription);
  id v5 = objc_msgSend(v4, sel_outputDescriptions);

  sub_237A1B888(0, &qword_268939E10);
  unint64_t v6 = sub_237A1FE90();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_237A1FF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 >= 3) {
    goto LABEL_7;
  }
  unint64_t v8 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
  {
    id v9 = (id)MEMORY[0x237E27550](0, v3);
  }
  else
  {
    if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    id v9 = *(id *)(v3 + 32);
  }
  unint64_t v10 = v9;
  id v11 = objc_msgSend(v9, sel_modelTypeName);

  uint64_t v12 = sub_237A1FE40();
  uint64_t v14 = v13;

  if (v12 == 0xD000000000000012 && v14 == 0x8000000237A20FD0) {
    goto LABEL_25;
  }
  char v15 = sub_237A1FF90();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_26;
  }
  id v16 = v8 ? (id)MEMORY[0x237E27550](0, v3) : *(id *)(v3 + 32);
  id v17 = v16;
  id v18 = objc_msgSend(v16, sel_modelTypeName);

  uint64_t v19 = sub_237A1FE40();
  uint64_t v21 = v20;

  if (v19 == 0x654E6C617275656ELL && v21 == 0xED00006B726F7774) {
    goto LABEL_25;
  }
  char v22 = sub_237A1FF90();
  swift_bridgeObjectRelease();
  if (v22) {
    goto LABEL_26;
  }
  id v23 = v8 ? (id)MEMORY[0x237E27550](0, v3) : *(id *)(v3 + 32);
  id v24 = v23;
  id v25 = objc_msgSend(v23, sel_modelTypeName);

  uint64_t v26 = sub_237A1FE40();
  uint64_t v28 = v27;

  if (v26 == 0x6F4D6D6F74737563 && v28 == 0xEB000000006C6564)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  char v37 = sub_237A1FF90();
  swift_bridgeObjectRelease();
  if ((v37 & 1) == 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_26:
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_237A1FF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v29 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v29) {
    goto LABEL_64;
  }
  unint64_t v30 = v29 - 1;
  if (__OFSUB__(v29, 1)) {
    goto LABEL_61;
  }
  if (v8)
  {
    id v31 = (id)MEMORY[0x237E27550](v30, v3);
    goto LABEL_36;
  }
  if ((v30 & 0x8000000000000000) != 0) {
    goto LABEL_62;
  }
  if (v30 >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_63:
    __break(1u);
LABEL_64:
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    return result;
  }
  id v31 = *(id *)(v3 + 8 * v30 + 32);
LABEL_36:
  id v32 = v31;
  swift_bridgeObjectRelease();
  id v33 = objc_msgSend(v32, sel_modelTypeName);

  uint64_t v34 = sub_237A1FE40();
  uint64_t v36 = v35;

  if (v34 == 0x7373616C436D6C67 && v36 == 0xED00007265696669
    || (sub_237A1FF90() & 1) != 0
    || v34 == 0xD000000000000017 && v36 == 0x8000000237A20F70
    || (sub_237A1FF90() & 1) != 0
    || v34 == 0xD000000000000016 && v36 == 0x8000000237A20F90
    || (sub_237A1FF90() & 1) != 0
    || v34 == 0xD000000000000017 && v36 == 0x8000000237A20F10
    || (sub_237A1FF90() & 1) != 0
    || v34 == 0xD00000000000001BLL && v36 == 0x8000000237A20FB0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v38 = sub_237A1FF90();
    swift_bridgeObjectRelease();
    return v38 & 1;
  }
}

id sub_237A1AA34(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_237A1FF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_237A1FF60();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)MEMORY[0x237E27550](0, v3))
  {
    id v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)MEMORY[0x237E27550](0, a2);
LABEL_22:
    uint64_t v13 = v12;
    sub_237A1B888(0, &qword_268939E18);
    char v14 = sub_237A1FEE0();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)MEMORY[0x237E27550](v16 + 1, v3);
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        uint64_t v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)MEMORY[0x237E27550](v16 + 1, a2);
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        uint64_t v21 = v20;
        unint64_t v5 = sub_237A1FEE0();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      id v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        uint64_t v27 = *v25++;
        uint64_t v26 = v27;
        uint64_t v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = sub_237A1FEE0();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
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
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

void *sub_237A1AD20(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268939E20);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_237A1AE18((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_237A1FF60();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

uint64_t sub_237A1AE18(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_237A1FF60();
    id result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_237A1FF60();
      id result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_237A1B7E4();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_268939E28);
            unint64_t v10 = sub_237A1AFC8(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_237A1B888(0, &qword_268939E18);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_237A1AFC8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_237A1B078(v6, a2, a3);
  return sub_237A1B030;
}

void sub_237A1B030(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_237A1B078(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x237E27550](a2, a3);
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
    return destroy for ModelHeuristics;
  }
  __break(1u);
  return result;
}

void destroy for ModelHeuristics(id *a1)
{
}

uint64_t sub_237A1B100(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_237A1FF60();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v9 = 4;
      while (1)
      {
        uint64_t v10 = v9 - 4;
        if (v24)
        {
          id v11 = (id)MEMORY[0x237E27550](v9 - 4, v7);
          uint64_t v4 = v9 - 3;
          if (__OFADD__(v10, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v11 = *(id *)(v7 + 8 * v9);
          uint64_t v4 = v9 - 3;
          if (__OFADD__(v10, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v11;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v11, sel_name, v22);
        uint64_t v16 = sub_237A1FE40();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();

          char v20 = 1;
          goto LABEL_22;
        }
        char v20 = sub_237A1FF90();

        swift_bridgeObjectRelease();
        if ((v20 & 1) == 0)
        {
          ++v9;
          uint64_t v8 = v12;
          BOOL v19 = v4 == v12;
          unint64_t v7 = v23;
          if (!v19) {
            continue;
          }
        }
        goto LABEL_22;
      }
    }
  }
  char v20 = 0;
LABEL_22:
  swift_bridgeObjectRelease();
  return v20 & 1;
}

void sub_237A1B2A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int64_t v6 = a3 >> 1;
  uint64_t v7 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
  {
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = a6 >> 1;
  if (__OFSUB__(a6 >> 1, a5)) {
    goto LABEL_23;
  }
  if (v7 != (a6 >> 1) - a5) {
    return;
  }
  if (!v7) {
    return;
  }
  uint64_t v12 = (id *)(a1 + 8 * a2);
  if (v12 == (id *)(a4 + 8 * a5) || v6 == a2) {
    return;
  }
  if (v6 <= a2)
  {
LABEL_26:
    __break(1u);
    return;
  }
  uint64_t v19 = a2 + 1;
  id v18 = *v12;
  id v20 = *v12;
  if (v18)
  {
    uint64_t v13 = a5;
    while (v9 != v13)
    {
      if (v13 < a5 || v13 >= v9) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void **)(a4 + 8 * v13);
      sub_237A1B888(0, &qword_268939E18);
      id v15 = v14;
      id v16 = v18;
      char v17 = sub_237A1FEE0();

      if ((v17 & 1) != 0 && v6 != v19)
      {
        if (v19 >= v6) {
          goto LABEL_25;
        }
        id v18 = *(id *)(a1 + 8 * v19);
        ++v13;
        ++v19;
        if (v18) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_237A1B408(void *a1)
{
  if (sub_237A16E80())
  {
    uint64_t v2 = 0x436567616D69;
    return v2 & 0xFFFFFFFFFFFFLL | 0x616C000000000000;
  }
  if (sub_237A17378()) {
    return 0xD000000000000012;
  }
  if (sub_237A17FA8()) {
    return 0x65447463656A626FLL;
  }
  sub_237A186D4();
  if (v4) {
    return 0x617254656C797473;
  }
  sub_237A18994();
  if (v5) {
    return 0xD000000000000010;
  }
  if (sub_237A18F00())
  {
    uint64_t v2 = 0x43646E756F73;
    return v2 & 0xFFFFFFFFFFFFLL | 0x616C000000000000;
  }
  sub_237A192AC();
  if (v7) {
    return 0xD000000000000011;
  }
  sub_237A195C4();
  if (v8) {
    return 0xD000000000000010;
  }
  uint64_t v3 = 0x6E656D6D6F636572;
  id v9 = objc_msgSend(a1, sel_modelTypeName);
  uint64_t v10 = sub_237A1FE40();
  uint64_t v12 = v11;

  if (v10 == 0xD000000000000019 && v12 == 0x8000000237A20E50) {
    goto LABEL_27;
  }
  char v13 = sub_237A1FF90();
  swift_bridgeObjectRelease();
  if (v13) {
    return v3;
  }
  uint64_t v3 = 0x73616C4374786574;
  id v14 = objc_msgSend(a1, sel_modelTypeName);
  uint64_t v15 = sub_237A1FE40();
  uint64_t v17 = v16;

  if (v15 == 0x73616C4374786574 && v17 == 0xEE00726569666973) {
    goto LABEL_27;
  }
  char v18 = sub_237A1FF90();
  swift_bridgeObjectRelease();
  if (v18) {
    return v3;
  }
  uint64_t v3 = 0x6767615464726F77;
  id v19 = objc_msgSend(a1, sel_modelTypeName);
  uint64_t v20 = sub_237A1FE40();
  uint64_t v22 = v21;

  if (v20 == 0x6767615464726F77 && v22 == 0xEA00000000007265)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    return v3;
  }
  char v23 = sub_237A1FF90();
  swift_bridgeObjectRelease();
  if ((v23 & 1) == 0)
  {
    if (sub_237A198AC())
    {
      return 0xD000000000000012;
    }
    else if (sub_237A19D00())
    {
      return 0xD000000000000014;
    }
    else
    {
      id v24 = objc_msgSend(a1, sel_modelTypeName);
      uint64_t v3 = sub_237A1FE40();
    }
  }
  return v3;
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

unint64_t sub_237A1B7E4()
{
  unint64_t result = qword_268939E30;
  if (!qword_268939E30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268939E28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268939E30);
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

uint64_t sub_237A1B888(uint64_t a1, unint64_t *a2)
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

MLKit::MLPreviewType_optional __swiftcall MLPreviewType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_237A1FFA0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 19;
  if (v3 < 0x13) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t sub_237A1B928()
{
  unint64_t v0 = MLPreviewType.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == MLPreviewType.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_237A1FF90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *static MLPreviewType.allCases.getter()
{
  return &unk_26EAA3188;
}

unint64_t MLPreviewType.rawValue.getter()
{
  unint64_t result = 0x616C436567616D69;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x73616C4374786574;
      break;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0x65447463656A626FLL;
      break;
    case 4:
      unint64_t result = 0x6767615464726F77;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
    case 0xA:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0x6E656D6D6F636572;
      break;
    case 8:
      unint64_t result = 0x616C43646E756F73;
      break;
    case 9:
      unint64_t result = 0x617254656C797473;
      break;
    case 0xB:
      unint64_t result = 0xD000000000000014;
      break;
    case 0xC:
      unint64_t result = 0xD000000000000012;
      break;
    case 0xD:
      unint64_t result = 0x6765536567616D69;
      break;
    case 0xE:
      unint64_t result = 0x6974734565736F70;
      break;
    case 0xF:
      unint64_t result = 0x415174726562;
      break;
    case 0x10:
      unint64_t result = 0x7473456874706564;
      break;
    case 0x11:
      unint64_t result = 0xD000000000000019;
      break;
    case 0x12:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_237A1BC5C()
{
  return sub_237A1B928();
}

unint64_t sub_237A1BC6C()
{
  unint64_t result = qword_268939E40;
  if (!qword_268939E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268939E40);
  }
  return result;
}

uint64_t sub_237A1BCC0()
{
  return sub_237A20020();
}

uint64_t sub_237A1BD28()
{
  MLPreviewType.rawValue.getter();
  sub_237A1FE50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_237A1BD8C()
{
  return sub_237A20020();
}

uint64_t sub_237A1BDF0()
{
  return sub_237A1FE80();
}

uint64_t sub_237A1BE50()
{
  return sub_237A1FE70();
}

unint64_t sub_237A1BEA4()
{
  unint64_t result = qword_268939E48;
  if (!qword_268939E48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268939E50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268939E48);
  }
  return result;
}

void sub_237A1BF00(void *a1@<X8>)
{
  *a1 = &unk_26EAA3188;
}

MLKit::MLPreviewType_optional sub_237A1BF10(Swift::String *a1)
{
  return MLPreviewType.init(rawValue:)(*a1);
}

unint64_t sub_237A1BF1C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = MLPreviewType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MLPreviewType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEE) {
    goto LABEL_17;
  }
  if (a2 + 18 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 18) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 18;
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
      return (*a1 | (v4 << 8)) - 18;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 18;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x13;
  int v8 = v6 - 19;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MLPreviewType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 18 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 18) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xED)
  {
    unsigned int v6 = ((a2 - 238) >> 8) + 1;
    *unint64_t result = a2 + 18;
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
        JUMPOUT(0x237A1C0B0);
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
          *unint64_t result = a2 + 18;
        break;
    }
  }
  return result;
}

uint64_t sub_237A1C0D8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_237A1C0E4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MLPreviewType()
{
  return &type metadata for MLPreviewType;
}

unint64_t sub_237A1C0FC()
{
  unint64_t result = qword_268939E58;
  if (!qword_268939E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268939E58);
  }
  return result;
}

BOOL sub_237A1C150(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_237A1C168()
{
  return sub_237A20020();
}

uint64_t sub_237A1C1B0()
{
  return sub_237A20000();
}

uint64_t sub_237A1C1DC()
{
  return sub_237A20020();
}

uint64_t sub_237A1C220()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC5MLKit20MLPreviewEnvironment__screenMode;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268939EA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC5MLKit20MLPreviewEnvironment__dismissPreview;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268939EA8);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC5MLKit20MLPreviewEnvironment__presentShareSheet, v4);
  uint64_t v6 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v7 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v6, v7);
}

uint64_t sub_237A1C33C()
{
  return type metadata accessor for MLPreviewEnvironment();
}

uint64_t type metadata accessor for MLPreviewEnvironment()
{
  uint64_t result = qword_268939E78;
  if (!qword_268939E78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_237A1C390()
{
  sub_237A1C478(319, &qword_268939E88);
  if (v0 <= 0x3F)
  {
    sub_237A1C478(319, &qword_268939E90);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_237A1C478(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_237A1FDE0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for MLPreviewEnvironment.PreviewScreenMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MLPreviewEnvironment.PreviewScreenMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x237A1C61CLL);
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

unsigned char *sub_237A1C644(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MLPreviewEnvironment.PreviewScreenMode()
{
  return &type metadata for MLPreviewEnvironment.PreviewScreenMode;
}

unint64_t sub_237A1C664()
{
  unint64_t result = qword_268939E98;
  if (!qword_268939E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268939E98);
  }
  return result;
}

uint64_t sub_237A1C6B8()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_237A1C6C4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MLPreviewEnvironment();
  uint64_t result = sub_237A1FDD0();
  *a1 = result;
  return result;
}

MLKit::MLPreviewType_optional ModelHeuristics.previewType.getter@<W0>(char *a1@<X8>)
{
  id v3 = *v1;
  uint64_t v4 = sub_237A1B408(v3);
  unsigned int v6 = v5;

  v7._countAndFlagsBits = v4;
  v7._object = v6;
  result.value = MLPreviewType.init(rawValue:)(v7).value;
  char v9 = v10;
  if (v10 == 19) {
    char v9 = 18;
  }
  *a1 = v9;
  return result;
}

uint64_t sub_237A1C774()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for SomeClass()
{
  return self;
}

double ModelHeuristics.availabilityOfSpecification.getter@<D0>(uint64_t a1@<X8>)
{
  unint64_t v2 = *(void *)(v1 + 8) - 1;
  if (v2 >= 8)
  {
    double result = 0.0;
    *(_OWORD *)a1 = xmmword_237A209F0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
  }
  else
  {
    uint64_t v3 = 8 * v2;
    uint64_t v4 = *(void *)&a1013[v3];
    uint64_t v5 = *(void *)((char *)&unk_237A20B10 + v3);
    uint64_t v6 = *(void *)&a110[v3];
    uint64_t v7 = *(void *)&a40[v3];
    uint64_t v8 = *(void *)((char *)&unk_237A20BD0 + v3);
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = 0xE400000000000000;
    *(void *)(a1 + 32) = v7;
    *(void *)(a1 + 40) = v8;
    *(void *)(a1 + 48) = v6;
    double result = -4.94660803e173;
    *(_OWORD *)(a1 + 56) = xmmword_237A20A00;
    *(void *)(a1 + 72) = 0xE300000000000000;
  }
  return result;
}

uint64_t ModelHeuristics.OSAvailability.components.getter()
{
  uint64_t v0 = ModelHeuristics.OSAvailability.pairs.getter();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_237A1DA34((uint64_t)v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.init(macOS:iOS:watchOS:tvOS:visionOS:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  return result;
}

uint64_t ModelHeuristics.OSAvailability.macOS.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.macOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.macOS.modify())()
{
  return nullsub_1;
}

uint64_t ModelHeuristics.OSAvailability.iOS.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.iOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.iOS.modify())()
{
  return nullsub_1;
}

uint64_t ModelHeuristics.OSAvailability.watchOS.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.watchOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.watchOS.modify())()
{
  return nullsub_1;
}

uint64_t ModelHeuristics.OSAvailability.tvOS.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.tvOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.tvOS.modify())()
{
  return nullsub_1;
}

uint64_t ModelHeuristics.OSAvailability.visionOS.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.visionOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.visionOS.modify())()
{
  return nullsub_1;
}

void *ModelHeuristics.OSAvailability.pairs.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v24 = v0[6];
  uint64_t v25 = v0[7];
  uint64_t v26 = v0[8];
  uint64_t v27 = v0[9];
  if (!v1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
    if (v3) {
      goto LABEL_5;
    }
LABEL_12:
    if (!v5) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_237A1D6BC(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v9 = v7[2];
  unint64_t v8 = v7[3];
  if (v9 >= v8 >> 1) {
    uint64_t v7 = sub_237A1D6BC((void *)(v8 > 1), v9 + 1, 1, v7);
  }
  v7[2] = v9 + 1;
  char v10 = &v7[4 * v9];
  v10[4] = 0x534F63616DLL;
  v10[5] = 0xE500000000000000;
  v10[6] = v2;
  v10[7] = v1;
  if (!v3) {
    goto LABEL_12;
  }
LABEL_5:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v7 = sub_237A1D6BC(0, v7[2] + 1, 1, v7);
  }
  unint64_t v12 = v7[2];
  unint64_t v11 = v7[3];
  if (v12 >= v11 >> 1) {
    uint64_t v7 = sub_237A1D6BC((void *)(v11 > 1), v12 + 1, 1, v7);
  }
  v7[2] = v12 + 1;
  char v13 = &v7[4 * v12];
  v13[4] = 5459817;
  v13[5] = 0xE300000000000000;
  v13[6] = v4;
  v13[7] = v3;
  if (v5)
  {
LABEL_13:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v7 = sub_237A1D6BC(0, v7[2] + 1, 1, v7);
    }
    unint64_t v15 = v7[2];
    unint64_t v14 = v7[3];
    if (v15 >= v14 >> 1) {
      uint64_t v7 = sub_237A1D6BC((void *)(v14 > 1), v15 + 1, 1, v7);
    }
    v7[2] = v15 + 1;
    uint64_t v16 = &v7[4 * v15];
    v16[4] = 0x534F6863746177;
    v16[5] = 0xE700000000000000;
    v16[6] = v6;
    v16[7] = v5;
  }
LABEL_18:
  if (v25)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v7 = sub_237A1D6BC(0, v7[2] + 1, 1, v7);
    }
    unint64_t v18 = v7[2];
    unint64_t v17 = v7[3];
    if (v18 >= v17 >> 1) {
      uint64_t v7 = sub_237A1D6BC((void *)(v17 > 1), v18 + 1, 1, v7);
    }
    v7[2] = v18 + 1;
    id v19 = &v7[4 * v18];
    v19[4] = 1397716596;
    v19[5] = 0xE400000000000000;
    v19[6] = v24;
    v19[7] = v25;
  }
  if (v27)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v7 = sub_237A1D6BC(0, v7[2] + 1, 1, v7);
    }
    unint64_t v21 = v7[2];
    unint64_t v20 = v7[3];
    if (v21 >= v20 >> 1) {
      uint64_t v7 = sub_237A1D6BC((void *)(v20 > 1), v21 + 1, 1, v7);
    }
    v7[2] = v21 + 1;
    uint64_t v22 = &v7[4 * v21];
    v22[4] = 0x534F6E6F69736976;
    v22[5] = 0xE800000000000000;
    v22[6] = v26;
    v22[7] = v27;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268939EB0);
  swift_arrayDestroy();
  return v7;
}

uint64_t ModelHeuristics.OSAvailability.description.getter()
{
  uint64_t v0 = ModelHeuristics.OSAvailability.pairs.getter();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_237A1DA34((uint64_t)v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268939EB8);
  sub_237A1DB6C();
  uint64_t v1 = sub_237A1FE00();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.hash(into:)()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[9];
  if (v0[1])
  {
    sub_237A20010();
    swift_bridgeObjectRetain();
    sub_237A1FE50();
    swift_bridgeObjectRelease();
    if (v1) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_237A20010();
    if (v1)
    {
LABEL_3:
      sub_237A20010();
      swift_bridgeObjectRetain();
      sub_237A1FE50();
      swift_bridgeObjectRelease();
      if (v2) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  sub_237A20010();
  if (v2)
  {
LABEL_4:
    sub_237A20010();
    swift_bridgeObjectRetain();
    sub_237A1FE50();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_5;
    }
LABEL_12:
    sub_237A20010();
    if (v4) {
      goto LABEL_6;
    }
    return sub_237A20010();
  }
LABEL_11:
  sub_237A20010();
  if (!v3) {
    goto LABEL_12;
  }
LABEL_5:
  sub_237A20010();
  swift_bridgeObjectRetain();
  sub_237A1FE50();
  swift_bridgeObjectRelease();
  if (!v4) {
    return sub_237A20010();
  }
LABEL_6:
  sub_237A20010();
  swift_bridgeObjectRetain();
  sub_237A1FE50();
  return swift_bridgeObjectRelease();
}

uint64_t ModelHeuristics.OSAvailability.hashValue.getter()
{
  return sub_237A20020();
}

uint64_t sub_237A1D380()
{
  return sub_237A20020();
}

uint64_t sub_237A1D3E0()
{
  return sub_237A20020();
}

uint64_t sub_237A1D438()
{
  uint64_t v0 = ModelHeuristics.OSAvailability.pairs.getter();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_237A1DA34((uint64_t)v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268939EB8);
  sub_237A1DB6C();
  uint64_t v1 = sub_237A1FE00();
  swift_bridgeObjectRelease();
  return v1;
}

char *sub_237A1D598(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_237A1D5B8(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_237A1D5B8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268939ED0);
    char v10 = (char *)swift_allocObject();
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
    char v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  swift_release();
  return v10;
}

void *sub_237A1D6BC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268939ED8);
    char v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    char v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268939EE0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t _s5MLKit15ModelHeuristicsV14OSAvailabilityV2eeoiySbAE_AEtFZ_0(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v10 = a1[7];
  uint64_t v9 = a1[8];
  uint64_t v11 = a1[9];
  uint64_t v12 = a2[1];
  uint64_t v13 = a2[2];
  uint64_t v15 = a2[3];
  uint64_t v14 = a2[4];
  uint64_t v17 = a2[5];
  uint64_t v16 = a2[6];
  uint64_t v18 = a2[7];
  uint64_t v19 = a2[8];
  uint64_t v20 = a2[9];
  if (!v3)
  {
    if (v12) {
      return 0;
    }
    goto LABEL_8;
  }
  if (!v12) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v12) {
    goto LABEL_8;
  }
  uint64_t v49 = a1[7];
  uint64_t v51 = a2[7];
  uint64_t v47 = a2[8];
  uint64_t v48 = a1[6];
  uint64_t v45 = a1[9];
  uint64_t v46 = a2[9];
  uint64_t v21 = a1[8];
  uint64_t v22 = a2[6];
  uint64_t v23 = a1[4];
  uint64_t v24 = a1[5];
  uint64_t v25 = a2[5];
  uint64_t v26 = a2[4];
  uint64_t v27 = a2[2];
  char v28 = sub_237A1FF90();
  uint64_t v13 = v27;
  uint64_t v14 = v26;
  uint64_t v17 = v25;
  uint64_t v7 = v24;
  uint64_t v5 = v23;
  uint64_t v16 = v22;
  uint64_t v9 = v21;
  uint64_t v11 = v45;
  uint64_t v20 = v46;
  uint64_t v19 = v47;
  uint64_t v8 = v48;
  uint64_t v10 = v49;
  uint64_t v18 = v51;
  char v29 = v28;
  uint64_t result = 0;
  if (v29)
  {
LABEL_8:
    if (v6)
    {
      if (!v15) {
        return 0;
      }
      if (v4 != v13 || v6 != v15)
      {
        uint64_t v50 = v9;
        uint64_t v52 = v17;
        uint64_t v31 = v16;
        uint64_t v32 = v5;
        uint64_t v33 = v7;
        uint64_t v34 = v14;
        char v35 = sub_237A1FF90();
        uint64_t v14 = v34;
        uint64_t v9 = v50;
        uint64_t v17 = v52;
        uint64_t v7 = v33;
        uint64_t v5 = v32;
        uint64_t v16 = v31;
        char v36 = v35;
        uint64_t result = 0;
        if ((v36 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v15)
    {
      return 0;
    }
    if (v7)
    {
      if (!v17) {
        return 0;
      }
      if (v5 != v14 || v7 != v17)
      {
        uint64_t v37 = v18;
        uint64_t v38 = v9;
        uint64_t v39 = v16;
        char v40 = sub_237A1FF90();
        uint64_t v16 = v39;
        uint64_t v9 = v38;
        uint64_t v18 = v37;
        char v41 = v40;
        uint64_t result = 0;
        if ((v41 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v17)
    {
      return 0;
    }
    if (v10)
    {
      if (!v18) {
        return 0;
      }
      if (v8 != v16 || v10 != v18)
      {
        uint64_t v42 = v9;
        char v43 = sub_237A1FF90();
        uint64_t v9 = v42;
        char v44 = v43;
        uint64_t result = 0;
        if ((v44 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v18)
    {
      return 0;
    }
    if (v11)
    {
      if (v20 && (v9 == v19 && v11 == v20 || (sub_237A1FF90() & 1) != 0)) {
        return 1;
      }
    }
    else if (!v20)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_237A1DA34(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_237A1D598(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = a1 + 56;
    do
    {
      uint64_t v9 = *(void *)(v4 - 24);
      uint64_t v10 = *(void *)(v4 - 16);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_237A1FE60();
      sub_237A1FE60();
      sub_237A1FE60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v6 = *(void *)(v11 + 16);
      unint64_t v5 = *(void *)(v11 + 24);
      if (v6 >= v5 >> 1) {
        sub_237A1D598((char *)(v5 > 1), v6 + 1, 1);
      }
      v4 += 32;
      *(void *)(v11 + 16) = v6 + 1;
      uint64_t v7 = v11 + 16 * v6;
      *(void *)(v7 + 32) = v9;
      *(void *)(v7 + 40) = v10;
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t sub_237A1DB6C()
{
  unint64_t result = qword_268939EC0;
  if (!qword_268939EC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268939EB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268939EC0);
  }
  return result;
}

unint64_t sub_237A1DBCC()
{
  unint64_t result = qword_268939EC8;
  if (!qword_268939EC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268939EC8);
  }
  return result;
}

uint64_t _s14descr26EAA2F49O14OSAvailabilityVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s14descr26EAA2F49O14OSAvailabilityVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s14descr26EAA2F49O14OSAvailabilityVwcp(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s14descr26EAA2F49O14OSAvailabilityVwca(void *a1, void *a2)
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
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

void *_s14descr26EAA2F49O14OSAvailabilityVwta(void *a1, void *a2)
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
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14descr26EAA2F49O14OSAvailabilityVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s14descr26EAA2F49O14OSAvailabilityVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelHeuristics.OSAvailability()
{
  return &type metadata for ModelHeuristics.OSAvailability;
}

unsigned char *storeEnumTagSinglePayload for FileErrors(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x237A1E02CLL);
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

ValueMetadata *type metadata accessor for FileErrors()
{
  return &type metadata for FileErrors;
}

unint64_t sub_237A1E068()
{
  unint64_t result = qword_268939EE8;
  if (!qword_268939EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268939EE8);
  }
  return result;
}

uint64_t ModelHeuristics.init(model:version:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t ModelHeuristics.specificationVersion.getter()
{
  return *(void *)(v0 + 8);
}

void *initializeBufferWithCopyOfBuffer for ModelHeuristics(void *a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for ModelHeuristics(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for ModelHeuristics(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelHeuristics(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ModelHeuristics(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ModelHeuristics()
{
  return &type metadata for ModelHeuristics;
}

uint64_t static DiskSize.formattedSize(of:)(uint64_t a1)
{
  uint64_t v2 = 3157552;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268939EF0);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_237A1E75C())
  {
    uint64_t v6 = sub_237A1FDC0();
    uint64_t v7 = *(void *)(v6 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a1, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    unint64_t v9 = sub_237A1F374((uint64_t)v5);
    char v11 = v10;
    sub_237A1FCE4((uint64_t)v5, &qword_268939EF0);
    if (v11) {
      return v2;
    }
  }
  else
  {
    unint64_t v9 = sub_237A1F8C4();
    if (v8) {
      return v2;
    }
  }
  if ((uint64_t)v9 >= 1)
  {
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F086F0]), sel_init);
    objc_msgSend(v12, sel_setCountStyle_, 0);
    if (v9 > 0x3FE)
    {
      if (v9 >> 10 > 0x3FE)
      {
        if ((float)((float)(v9 >> 10) * 0.00097656) >= 1023.0) {
          objc_msgSend(v12, sel_setAllowedUnits_, 8);
        }
        else {
          objc_msgSend(v12, sel_setAllowedUnits_, 4);
        }
        id v14 = objc_msgSend(v12, sel_stringFromByteCount_, v9);
      }
      else
      {
        objc_msgSend(v12, sel_setAllowedUnits_, 2);
        id v14 = objc_msgSend(v12, sel_stringFromByteCount_, v9);
      }
      id v15 = v14;
      uint64_t v2 = sub_237A1FE40();
    }
    else
    {
      objc_msgSend(v12, sel_setAllowedUnits_, 1);
      id v13 = objc_msgSend(v12, sel_stringFromByteCount_, v9);
      uint64_t v2 = sub_237A1FE40();
    }
  }
  return v2;
}

uint64_t sub_237A1E520@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_237A1F02C(a1);
  if (v6) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32))
  {
    *(void *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    id v7 = sub_237A1F0B4(v10, result, v5, 0, a1);
    id v9 = v7;
    *(void *)a2 = v7;
    sub_237A1FAD0((uint64_t)v10, a2 + 8);
    id v8 = v7;
    return sub_237A1FCE4((uint64_t)&v9, &qword_268939F08);
  }
  return result;
}

uint64_t static DiskSize.sizeInBytes(of:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268939EF0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_237A1E75C() & 1) == 0) {
    return sub_237A1F8C4();
  }
  uint64_t v5 = sub_237A1FDC0();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  uint64_t v7 = sub_237A1F374((uint64_t)v4);
  sub_237A1FCE4((uint64_t)v4, &qword_268939EF0);
  return v7;
}

uint64_t sub_237A1E75C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268939F30);
  uint64_t v0 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v12 - v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268939EF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237A20CE0;
  uint64_t v6 = (void *)*MEMORY[0x263EFF6A8];
  *(void *)(inited + 32) = *MEMORY[0x263EFF6A8];
  id v7 = v6;
  sub_237A1F144(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_237A1FDA0();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_237A1FD60();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 0, 1, v8);
  sub_237A1FC80((uint64_t)v4, (uint64_t)v2, (uint64_t *)&unk_268939F30);
  sub_237A1FD60();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v2, 1, v8) == 1)
  {
    sub_237A1FCE4((uint64_t)v4, (uint64_t *)&unk_268939F30);
    sub_237A1FCE4((uint64_t)v2, (uint64_t *)&unk_268939F30);
    return 0;
  }
  else
  {
    char v11 = sub_237A1FD50();
    sub_237A1FCE4((uint64_t)v4, (uint64_t *)&unk_268939F30);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v2, v8);
    return v11 & 1;
  }
}

uint64_t static DiskSize.folderSizeInBytes(of:)(uint64_t a1)
{
  uint64_t result = sub_237A1F374(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t static DiskSize.fileSizeInBytes(of:)()
{
  return sub_237A1F8C4();
}

uint64_t static DiskSize.fileSizeInGB(url:)()
{
  uint64_t v0 = sub_237A1FD60();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268939EF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237A20CE0;
  uint64_t v5 = (void *)*MEMORY[0x263EFF688];
  *(void *)(inited + 32) = *MEMORY[0x263EFF688];
  id v6 = v5;
  sub_237A1F144(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_237A1FDA0();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_237A1FD40();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_237A1E520(v7, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  if (v10)
  {

    sub_237A1FAB0(&v11, v12);
    sub_237A1FAB0(v12, &v13);
    return swift_dynamicCast();
  }
  else
  {
    uint64_t result = sub_237A1FCE4((uint64_t)&v10, &qword_268939F00);
    __break(1u);
  }
  return result;
}

uint64_t static DiskSize.fileSizeInMB(url:)()
{
  uint64_t v0 = sub_237A1FD60();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268939EF8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237A20CE0;
  uint64_t v5 = (void *)*MEMORY[0x263EFF688];
  *(void *)(inited + 32) = *MEMORY[0x263EFF688];
  id v6 = v5;
  sub_237A1F144(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_237A1FDA0();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_237A1FD40();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_237A1E520(v7, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  if (v10)
  {

    sub_237A1FAB0(&v11, v12);
    sub_237A1FAB0(v12, &v13);
    return swift_dynamicCast();
  }
  else
  {
    uint64_t result = sub_237A1FCE4((uint64_t)&v10, &qword_268939F00);
    __break(1u);
  }
  return result;
}

unint64_t sub_237A1EE20(uint64_t a1)
{
  sub_237A1FE40();
  sub_237A1FFF0();
  sub_237A1FE50();
  uint64_t v2 = sub_237A20020();
  swift_bridgeObjectRelease();
  return sub_237A1EEB4(a1, v2);
}

unint64_t sub_237A1EEB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_237A1FE40();
    uint64_t v8 = v7;
    if (v6 == sub_237A1FE40() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_237A1FF90();
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
          uint64_t v13 = sub_237A1FE40();
          uint64_t v15 = v14;
          if (v13 == sub_237A1FE40() && v15 == v16) {
            break;
          }
          char v18 = sub_237A1FF90();
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

uint64_t sub_237A1F02C(uint64_t a1)
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

id sub_237A1F0B4(id result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  id v5 = *(id *)(*(void *)(a5 + 48) + 8 * a2);
  sub_237A1FAD0(*(void *)(a5 + 56) + 32 * a2, (uint64_t)result);
  return v5;
}

uint64_t sub_237A1F144(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268939F10);
    uint64_t v3 = sub_237A1FEF0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      unsigned int v6 = *(void **)(v32 + 8 * v4);
      sub_237A1FE40();
      sub_237A1FFF0();
      id v7 = v6;
      sub_237A1FE50();
      uint64_t v8 = sub_237A20020();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_237A1FE40();
        uint64_t v17 = v16;
        if (v15 == sub_237A1FE40() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_237A1FF90();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_237A1FE40();
          uint64_t v24 = v23;
          if (v22 == sub_237A1FE40() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_237A1FF90();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_237A1F374(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_237A1FD90();
  uint64_t v37 = *(void *)(v2 - 8);
  uint64_t v38 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268939EF0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_237A1FDC0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1;
  uint64_t v14 = v13;
  sub_237A1FC80(v12, (uint64_t)v7, &qword_268939EF0);
  int v15 = (*(uint64_t (**)(char *, uint64_t, char *))(v9 + 48))(v7, 1, v14);
  if (v15 == 1)
  {
    sub_237A1FCE4((uint64_t)v7, &qword_268939EF0);
    return 0;
  }
  int v36 = v15;
  (*(void (**)(char *, char *, char *))(v9 + 32))(v11, v7, v14);
  id v17 = objc_msgSend(self, sel_defaultManager);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268939EF8);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_237A20CE0;
  uint64_t v19 = (void *)*MEMORY[0x263EFF688];
  *(void *)(v18 + 32) = *MEMORY[0x263EFF688];
  char v20 = v14;
  id v21 = v19;
  uint64_t v22 = (void *)sub_237A1FEC0();

  swift_bridgeObjectRelease();
  if (!v22)
  {
LABEL_17:
    sub_237A1FB2C();
    swift_allocError();
    *BOOL v29 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(char *, char *))(v9 + 8))(v11, v20);
  }
  id v34 = v22;
  char v35 = v20;
  sub_237A1FEB0();
  sub_237A1FD80();
  if (v42)
  {
    uint64_t v33 = 0;
    while (1)
    {
      sub_237A1FAB0(&v41, v40);
      sub_237A1FB80();
      if (!swift_dynamicCast())
      {
        sub_237A1FB2C();
        swift_allocError();
        *uint64_t v30 = 1;
        swift_willThrow();

        (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v38);
        return (*(uint64_t (**)(char *, char *))(v9 + 8))(v11, v35);
      }
      char v20 = v11;
      id v23 = v39;
      id v39 = 0;
      *(void *)&v40[0] = 0;
      unsigned int v24 = objc_msgSend(v23, sel_getResourceValue_forKey_error_, v40, v21, &v39);
      uint64_t v25 = *(void *)&v40[0];
      id v26 = v39;
      if (!v24)
      {
        uint64_t v31 = v26;
        swift_unknownObjectRetain();
        sub_237A1FD70();

        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v38);
        (*(void (**)(char *, char *))(v9 + 8))(v20, v35);
        return swift_unknownObjectRelease();
      }
      if (!v25) {
        goto LABEL_11;
      }
      swift_unknownObjectRetain_n();
      self;
      char v27 = (void *)swift_dynamicCastObjCClass();
      if (!v27) {
        break;
      }
      unint64_t v11 = (char *)objc_msgSend(v27, sel_longLongValue);

      swift_unknownObjectRelease_n();
      BOOL v28 = __OFADD__(v33, v11);
      v33 += (uint64_t)v11;
      if (v28)
      {
        __break(1u);
        goto LABEL_17;
      }
LABEL_12:
      sub_237A1FD80();
      unint64_t v11 = v20;
      if (!v42) {
        goto LABEL_19;
      }
    }
    swift_unknownObjectRelease_n();
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v33 = 0;
LABEL_19:

  (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v38);
  (*(void (**)(char *, char *))(v9 + 8))(v11, v35);
  return v33;
}

uint64_t sub_237A1F8C4()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v0 = objc_msgSend(self, sel_defaultManager);
  sub_237A1FDB0();
  uint64_t v1 = (void *)sub_237A1FE10();
  swift_bridgeObjectRelease();
  *(void *)&long long v15 = 0;
  id v2 = objc_msgSend(v0, sel_attributesOfItemAtPath_error_, v1, &v15);

  uint64_t v3 = (void *)v15;
  if (v2)
  {
    type metadata accessor for FileAttributeKey(0);
    sub_237A1FC28();
    uint64_t v4 = sub_237A1FDF0();
    id v5 = v3;

    if (*(void *)(v4 + 16))
    {
      id v6 = (id)*MEMORY[0x263F080B8];
      unint64_t v7 = sub_237A1EE20((uint64_t)v6);
      if (v8)
      {
        sub_237A1FAD0(*(void *)(v4 + 56) + 32 * v7, (uint64_t)&v15);
      }
      else
      {
        long long v15 = 0u;
        long long v16 = 0u;
      }
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = (id)v15;
    uint64_t v10 = (void *)sub_237A1FD70();

    swift_willThrow();
    long long v15 = 0u;
    long long v16 = 0u;
  }
  sub_237A1FBC0((uint64_t)&v15, (uint64_t)v13);
  if (v14)
  {
    if (swift_dynamicCast()) {
      return v12;
    }
  }
  else
  {
    sub_237A1FCE4((uint64_t)v13, &qword_268939F28);
  }
  return 0;
}

_OWORD *sub_237A1FAB0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

ValueMetadata *type metadata accessor for DiskSize()
{
  return &type metadata for DiskSize;
}

uint64_t sub_237A1FAD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_237A1FB2C()
{
  unint64_t result = qword_268939F18;
  if (!qword_268939F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268939F18);
  }
  return result;
}

unint64_t sub_237A1FB80()
{
  unint64_t result = qword_268939F20;
  if (!qword_268939F20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268939F20);
  }
  return result;
}

uint64_t sub_237A1FBC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268939F28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_237A1FC28()
{
  unint64_t result = qword_268939E00;
  if (!qword_268939E00)
  {
    type metadata accessor for FileAttributeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268939E00);
  }
  return result;
}

uint64_t sub_237A1FC80(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_237A1FCE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_237A1FD40()
{
  return MEMORY[0x270EEEED8]();
}

uint64_t sub_237A1FD50()
{
  return MEMORY[0x270EEEEF0]();
}

uint64_t sub_237A1FD60()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_237A1FD70()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_237A1FD80()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_237A1FD90()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_237A1FDA0()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_237A1FDB0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_237A1FDC0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_237A1FDD0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_237A1FDE0()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_237A1FDF0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_237A1FE00()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_237A1FE10()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_237A1FE20()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_237A1FE30()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_237A1FE40()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_237A1FE50()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_237A1FE60()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_237A1FE70()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_237A1FE80()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_237A1FE90()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_237A1FEA0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_237A1FEB0()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t sub_237A1FEC0()
{
  return MEMORY[0x270EF1EE8]();
}

uint64_t sub_237A1FED0()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_237A1FEE0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_237A1FEF0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_237A1FF00()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_237A1FF10()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_237A1FF20()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_237A1FF30()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_237A1FF40()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_237A1FF50()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_237A1FF60()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_237A1FF70()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_237A1FF90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_237A1FFA0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_237A1FFB0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_237A1FFC0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_237A1FFD0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_237A1FFE0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_237A1FFF0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_237A20000()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_237A20010()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_237A20020()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}