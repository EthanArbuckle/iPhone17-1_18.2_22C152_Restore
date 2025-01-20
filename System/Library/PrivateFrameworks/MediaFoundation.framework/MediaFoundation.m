uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t a1)
{
  return *(void *)a1;
}

char *sub_1E01417C0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = sub_1E0156C30();
  if (!a1) {
    goto LABEL_43;
  }
  if (v5 == 0x8000000000000000 && a1 == -1)
  {
LABEL_44:
    __break(1u);
    JUMPOUT(0x1E01419ECLL);
  }
  v7 = sub_1E014383C(0, (v5 / a1) & ~((v5 / a1) >> 63), 0, MEMORY[0x1E4FBC860]);
  uint64_t v8 = 0;
  uint64_t v9 = a2;
  uint64_t v10 = a2 >> 32;
  uint64_t v11 = BYTE6(a3);
  int64_t v12 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      int64_t v12 = (int)a2;
      uint64_t v8 = a2 >> 32;
      break;
    case 2uLL:
      int64_t v12 = *(void *)(a2 + 16);
      uint64_t v8 = *(void *)(a2 + 24);
      break;
    case 3uLL:
      break;
    default:
      int64_t v12 = 0;
      uint64_t v8 = BYTE6(a3);
      break;
  }
  char v13 = 0;
  unint64_t v14 = 0;
  BOOL v15 = 0;
  unint64_t v16 = a3 >> 62;
  while (1)
  {
    BOOL v17 = v8 >= v12;
    if (a1 > 0) {
      BOOL v17 = v12 >= v8;
    }
    if (v17) {
      break;
    }
    BOOL v15 = !__OFADD__(v12, a1);
    if (__OFADD__(v12, a1)) {
      unint64_t v14 = 0x8000000000000000;
    }
    else {
      unint64_t v14 = 0;
    }
    if (__OFADD__(v12, a1)) {
      unint64_t v18 = ((v12 + a1) >> 63) ^ 0x8000000000000000;
    }
    else {
      unint64_t v18 = v12 + a1;
    }
LABEL_28:
    if (__OFADD__(v12, a1))
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    uint64_t v19 = 0;
    switch(v16)
    {
      case 1uLL:
        uint64_t v19 = v10;
        break;
      case 2uLL:
        uint64_t v19 = *(void *)(v9 + 24);
        break;
      case 3uLL:
        break;
      default:
        uint64_t v19 = v11;
        break;
    }
    if (v19 >= v12 + a1) {
      int64_t v20 = v12 + a1;
    }
    else {
      int64_t v20 = v19;
    }
    if (v20 < v12) {
      goto LABEL_42;
    }
    unint64_t v22 = *((void *)v7 + 2);
    unint64_t v21 = *((void *)v7 + 3);
    if (v22 >= v21 >> 1)
    {
      uint64_t v27 = v11;
      uint64_t v28 = v10;
      unint64_t v26 = v14;
      v24 = sub_1E014383C((char *)(v21 > 1), v22 + 1, 1, v7);
      unint64_t v14 = v26;
      uint64_t v11 = v27;
      uint64_t v10 = v28;
      uint64_t v9 = a2;
      v7 = v24;
    }
    *((void *)v7 + 2) = v22 + 1;
    v23 = &v7[16 * v22];
    *((void *)v23 + 4) = v12;
    *((void *)v23 + 5) = v20;
    int64_t v12 = v18;
  }
  if ((v12 != v8) | v13 & 1) {
    return v7;
  }
  if (v15)
  {
    char v13 = 1;
    unint64_t v18 = v8;
    BOOL v15 = 1;
    goto LABEL_28;
  }
  if (v14 != 0x8000000000000000)
  {
    BOOL v15 = 0;
    char v13 = 1;
    unint64_t v18 = v8;
    goto LABEL_28;
  }
  return v7;
}

uint64_t RandomAccessCollection<>.chunkRanges(by:)(void (**a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  v83 = a1;
  uint64_t v7 = *(void *)(*(void *)(a3 + 8) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_4();
  uint64_t v66 = v9;
  OUTLINED_FUNCTION_10();
  ((void (*)(void))MEMORY[0x1F4188790])();
  v65 = (char *)&v55 - v10;
  uint64_t v69 = *(void *)(a4 + 8);
  uint64_t v11 = sub_1E0156FC0();
  OUTLINED_FUNCTION_0();
  v59 = v12;
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_4();
  uint64_t v64 = v13;
  OUTLINED_FUNCTION_10();
  ((void (*)(void))MEMORY[0x1F4188790])();
  v63 = (char *)&v55 - v14;
  sub_1E0157050();
  OUTLINED_FUNCTION_3();
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_11();
  uint64_t v82 = v15;
  OUTLINED_FUNCTION_0();
  BOOL v17 = v16;
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_4();
  uint64_t v68 = v18;
  OUTLINED_FUNCTION_10();
  ((void (*)(void))MEMORY[0x1F4188790])();
  v67 = (char *)&v55 - v19;
  OUTLINED_FUNCTION_10();
  uint64_t v20 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  unint64_t v22 = (char *)&v55 - v21;
  MEMORY[0x1F4188790](v20);
  v70 = (char *)&v55 - v23;
  OUTLINED_FUNCTION_9();
  v80 = (void (*)(void))sub_1E0157130();
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_11();
  v79 = v25;
  OUTLINED_FUNCTION_9();
  uint64_t v76 = sub_1E0157240();
  OUTLINED_FUNCTION_0();
  uint64_t v57 = v26;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_11();
  uint64_t v75 = v28;
  uint64_t v78 = a4;
  uint64_t v29 = swift_getAssociatedTypeWitness();
  sub_1E0157050();
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v30);
  v32 = (char *)&v55 - v31;
  OUTLINED_FUNCTION_0();
  uint64_t v58 = v33;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_11();
  uint64_t v77 = v35;
  uint64_t v71 = v11;
  uint64_t v85 = sub_1E0156CE0();
  uint64_t v73 = a2;
  uint64_t v74 = v4;
  v36 = v83;
  uint64_t v72 = v7;
  uint64_t result = sub_1E0156F90();
  if (!v36)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  BOOL v38 = result == 0x8000000000000000 && (void (**)(void))((char *)v36 + 1) == 0;
  if (v38) {
    goto LABEL_15;
  }
  uint64_t v62 = sub_1E0156EC0();
  sub_1E0156E80();
  v84 = v36;
  swift_getAssociatedConformanceWitness();
  sub_1E01421E8();
  sub_1E0156F70();
  uint64_t result = OUTLINED_FUNCTION_15((uint64_t)v32);
  if (!v38)
  {
    v39 = *(void (**)(uint64_t, char *, uint64_t))(v58 + 32);
    uint64_t v56 = v29;
    v39(v77, v32, v29);
    v40 = v70;
    sub_1E0156F80();
    sub_1E0156FA0();
    sub_1E0157340();
    uint64_t v41 = AssociatedTypeWitness;
    v42 = v17[1];
    OUTLINED_FUNCTION_13();
    v42();
    v43 = v42;
    OUTLINED_FUNCTION_13();
    v42();
    sub_1E0157120();
    uint64_t v44 = v82;
    sub_1E0157230();
    OUTLINED_FUNCTION_15(v44);
    if (v38)
    {
LABEL_12:
      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v75, v76);
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v77, v56);
      return v85;
    }
    v80 = v17[4];
    v60 = v17 + 2;
    v59 += 4;
    v61 = v22;
    v83 = v17 + 1;
    while (1)
    {
      ((void (*)(char *, uint64_t, uint64_t))v80)(v40, v82, v41);
      v45 = v67;
      sub_1E0157070();
      uint64_t v46 = v68;
      sub_1E0156FA0();
      sub_1E01572B0();
      ((void (*)(uint64_t, uint64_t))v43)(v46, v41);
      ((void (*)(char *, uint64_t))v43)(v45, v41);
      uint64_t result = sub_1E0156D30();
      if ((result & 1) == 0) {
        break;
      }
      uint64_t v47 = TupleTypeMetadata2;
      v48 = &v65[*(int *)(TupleTypeMetadata2 + 48)];
      v49 = *v60;
      OUTLINED_FUNCTION_6();
      v49();
      v79 = v48;
      v50 = v80;
      ((void (*)(char *, char *, uint64_t))v80)(v48, v22, v41);
      uint64_t v51 = v66 + *(int *)(v47 + 48);
      OUTLINED_FUNCTION_6();
      v49();
      OUTLINED_FUNCTION_6();
      v49();
      uint64_t v52 = v64;
      OUTLINED_FUNCTION_5();
      v50();
      ((void (*)(uint64_t, uint64_t))v43)(v51, v41);
      OUTLINED_FUNCTION_5();
      v50();
      OUTLINED_FUNCTION_5();
      v50();
      uint64_t v53 = v71;
      uint64_t v54 = v82;
      OUTLINED_FUNCTION_5();
      v50();
      unint64_t v22 = v61;
      OUTLINED_FUNCTION_13();
      v43();
      (*v59)(v63, v52, v53);
      sub_1E0156EA0();
      v40 = v70;
      OUTLINED_FUNCTION_13();
      v43();
      sub_1E0157230();
      OUTLINED_FUNCTION_15(v54);
      if (v38) {
        goto LABEL_12;
      }
    }
    __break(1u);
    goto LABEL_14;
  }
LABEL_16:
  __break(1u);
  return result;
}

unint64_t sub_1E01421E8()
{
  unint64_t result = qword_1EBA35BD8;
  if (!qword_1EBA35BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA35BD8);
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t Sequence.chunked(by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0();
  uint64_t v38 = v8;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v31 - v10;
  sub_1E0157050();
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v31 - v13;
  OUTLINED_FUNCTION_0();
  uint64_t v34 = v15;
  MEMORY[0x1F4188790](v16);
  uint64_t v33 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_0();
  uint64_t v19 = v18;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1F4188790](v20);
  unint64_t v22 = (char *)&v31 - v21;
  sub_1E0156EC0();
  uint64_t v42 = sub_1E0156CE0();
  uint64_t v35 = v3;
  uint64_t v36 = a3;
  uint64_t result = sub_1E0156E20();
  if (!a1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }
  if (result == 0x8000000000000000 && a1 == -1) {
    goto LABEL_16;
  }
  uint64_t v32 = v19;
  uint64_t v37 = sub_1E0156EC0();
  sub_1E0156E80();
  uint64_t v41 = sub_1E0156CE0();
  uint64_t v25 = a1;
  sub_1E0156E80();
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v33, v35, a2);
  sub_1E0156E10();
  swift_getAssociatedConformanceWitness();
  sub_1E0157060();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, AssociatedTypeWitness) != 1)
  {
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
    v38 += 32;
    do
    {
      v26(v11, v14, AssociatedTypeWitness);
      sub_1E0156EA0();
      uint64_t v27 = v41;
      uint64_t v28 = swift_bridgeObjectRetain();
      uint64_t v29 = MEMORY[0x1E01F1BB0](v28, AssociatedTypeWitness);
      swift_bridgeObjectRelease();
      if (v29 == v25)
      {
        uint64_t v40 = v27;
        swift_bridgeObjectRetain();
        sub_1E0156EA0();
        sub_1E0156EB0();
      }
      sub_1E0157060();
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, AssociatedTypeWitness) != 1);
  }
  (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v39);
  uint64_t v30 = v41;
  uint64_t v40 = v41;
  swift_getWitnessTable();
  if (sub_1E0156FB0())
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v40 = v30;
    sub_1E0156EA0();
  }
  return v42;
}

uint64_t static Data.printableCharacter(for:)(unsigned __int8 a1)
{
  if (!isprint(a1)) {
    return 46;
  }
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = v1;
  return MEMORY[0x1E01F1AC0](&v3);
}

uint64_t Data.chunked(by:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_1E01417C0(a1, a2, a3);
  sub_1E014282C(a2, a3);
  uint64_t v5 = OUTLINED_FUNCTION_8();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1E014270C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v16 = MEMORY[0x1E4FBC860];
    sub_1E0143CB0(0, v5, 0);
    uint64_t v7 = v16;
    uint64_t v8 = a1 + 40;
    do
    {
      uint64_t v9 = sub_1E0156C40();
      uint64_t v11 = v10;
      unint64_t v13 = *(void *)(v16 + 16);
      unint64_t v12 = *(void *)(v16 + 24);
      if (v13 >= v12 >> 1) {
        sub_1E0143CB0((char *)(v12 > 1), v13 + 1, 1);
      }
      v8 += 16;
      *(void *)(v16 + 16) = v13 + 1;
      uint64_t v14 = v16 + 16 * v13;
      *(void *)(v14 + 32) = v9;
      *(void *)(v14 + 40) = v11;
      --v5;
    }
    while (v5);
    sub_1E0143D10(a2, a3);
  }
  else
  {
    sub_1E0143D10(a2, a3);
    return MEMORY[0x1E4FBC860];
  }
  return v7;
}

uint64_t sub_1E014282C(uint64_t a1, unint64_t a2)
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

uint64_t Data.HexDumpLine.offset.getter()
{
  return OUTLINED_FUNCTION_12();
}

uint64_t Data.HexDumpLine.offset.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Data.HexDumpLine.offset.modify())()
{
  return nullsub_1;
}

uint64_t Data.HexDumpLine.hex.getter()
{
  return OUTLINED_FUNCTION_12();
}

uint64_t Data.HexDumpLine.hex.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*Data.HexDumpLine.hex.modify())()
{
  return nullsub_1;
}

uint64_t Data.HexDumpLine.text.getter()
{
  return OUTLINED_FUNCTION_12();
}

uint64_t Data.HexDumpLine.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*Data.HexDumpLine.text.modify())()
{
  return nullsub_1;
}

uint64_t Data.HexDumpLine.line.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[6];
  if (v2 + 0x4000000000000000 < 0)
  {
    __break(1u);
  }
  else if (!__OFADD__(2 * v2, 8))
  {
    sub_1E0142B2C();
    sub_1E0157090();
    swift_bridgeObjectRetain();
    _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
    _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
    swift_bridgeObjectRelease();
    _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
    swift_bridgeObjectRetain();
    _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_1E0142B2C()
{
  unint64_t result = qword_1EACE2A18;
  if (!qword_1EACE2A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2A18);
  }
  return result;
}

char *Data.hexDump(bytesPerRow:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  sub_1E01417C0(a1, a2, a3);
  sub_1E014282C(a2, a3);
  uint64_t v5 = OUTLINED_FUNCTION_8();
  swift_bridgeObjectRelease();
  uint64_t v120 = *(void *)(v5 + 16);
  if (!v120)
  {
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  uint64_t v122 = v5 + 32;
  v127 = (char *)MEMORY[0x1E4FBC860];
  uint64_t v119 = v5;
  while (2)
  {
    if (v7 >= *(void *)(v5 + 16)) {
      goto LABEL_161;
    }
    uint64_t v8 = (uint64_t *)(v122 + 16 * v7);
    uint64_t v9 = *v8;
    unint64_t v10 = v8[1];
    unint64_t v123 = v7 + 1;
    sub_1E01447E4(0, &qword_1EACE2A20, &qword_1EACE2A28);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1E0157850;
    *(void *)(v11 + 56) = MEMORY[0x1E4FBB550];
    *(void *)(v11 + 64) = MEMORY[0x1E4FBB5C8];
    uint64_t v126 = v6;
    *(void *)(v11 + 32) = v6;
    sub_1E014282C(v9, v10);
    uint64_t v12 = sub_1E0156D60();
    uint64_t v124 = v13;
    uint64_t v125 = v12;
    uint64_t v14 = sub_1E0156C30();
    uint64_t v15 = sub_1E014383C(0, (v14 / 2) & ~((v14 / 2) >> 63), 0, MEMORY[0x1E4FBC860]);
    uint64_t v16 = 0;
    uint64_t v135 = v9 >> 32;
    uint64_t v128 = (int)v9;
    unint64_t v129 = v10;
    uint64_t v17 = 0;
    uint64_t v18 = BYTE6(v10);
    uint64_t v19 = v9;
    unint64_t v20 = v10 >> 62;
    switch(v10 >> 62)
    {
      case 1uLL:
        uint64_t v16 = v9 >> 32;
        uint64_t v17 = (int)v9;
        break;
      case 2uLL:
        uint64_t v17 = *(void *)(v9 + 16);
        uint64_t v16 = *(void *)(v9 + 24);
        break;
      case 3uLL:
        break;
      default:
        uint64_t v17 = 0;
        uint64_t v16 = BYTE6(v10);
        break;
    }
    char v21 = 0;
    unint64_t v22 = 0;
    BOOL v23 = 0;
    uint64_t v133 = v18;
    uint64_t v134 = v9;
    unsigned int v132 = v20;
    while (v17 < v16)
    {
      BOOL v23 = !__OFADD__(v17, 2);
      if (__OFADD__(v17, 2)) {
        unint64_t v22 = 0x8000000000000000;
      }
      else {
        unint64_t v22 = 0;
      }
      if (__OFADD__(v17, 2)) {
        uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v24 = v17 + 2;
      }
LABEL_24:
      if (__OFADD__(v17, 2))
      {
        __break(1u);
LABEL_149:
        __break(1u);
LABEL_150:
        __break(1u);
LABEL_151:
        __break(1u);
LABEL_152:
        __break(1u);
LABEL_153:
        __break(1u);
LABEL_154:
        __break(1u);
LABEL_155:
        __break(1u);
LABEL_156:
        __break(1u);
LABEL_157:
        __break(1u);
LABEL_158:
        __break(1u);
LABEL_159:
        __break(1u);
LABEL_160:
        __break(1u);
LABEL_161:
        __break(1u);
LABEL_162:
        __break(1u);
LABEL_163:
        __break(1u);
LABEL_164:
        __break(1u);
LABEL_165:
        __break(1u);
LABEL_166:
        __break(1u);
LABEL_167:
        __break(1u);
LABEL_168:
        __break(1u);
LABEL_169:
        __break(1u);
LABEL_170:
        __break(1u);
LABEL_171:
        __break(1u);
LABEL_172:
        __break(1u);
      }
      uint64_t v25 = 0;
      switch((int)v20)
      {
        case 1:
          uint64_t v25 = v9 >> 32;
          break;
        case 2:
          uint64_t v25 = *(void *)(v19 + 24);
          break;
        case 3:
          break;
        default:
          uint64_t v25 = v18;
          break;
      }
      if (v25 >= v17 + 2) {
        uint64_t v26 = v17 + 2;
      }
      else {
        uint64_t v26 = v25;
      }
      if (v26 < v17) {
        goto LABEL_149;
      }
      unint64_t v28 = *((void *)v15 + 2);
      unint64_t v27 = *((void *)v15 + 3);
      if (v28 >= v27 >> 1)
      {
        uint64_t v30 = sub_1E014383C((char *)(v27 > 1), v28 + 1, 1, v15);
        LODWORD(v20) = v132;
        uint64_t v18 = v133;
        uint64_t v15 = v30;
        uint64_t v19 = v9;
      }
      *((void *)v15 + 2) = v28 + 1;
      uint64_t v29 = &v15[16 * v28];
      *((void *)v29 + 4) = v17;
      *((void *)v29 + 5) = v26;
      uint64_t v17 = v24;
    }
    if ((v17 != v16) | v21 & 1) {
      goto LABEL_36;
    }
    if (v23)
    {
      char v21 = 1;
      uint64_t v24 = v16;
      BOOL v23 = 1;
      goto LABEL_24;
    }
    if (v22 != 0x8000000000000000)
    {
      BOOL v23 = 0;
      char v21 = 1;
      uint64_t v24 = v16;
      goto LABEL_24;
    }
LABEL_36:
    sub_1E014282C(v19, v129);
    uint64_t v31 = OUTLINED_FUNCTION_12();
    uint64_t v33 = sub_1E014270C(v31, v32, v129);
    swift_bridgeObjectRelease();
    int64_t v34 = *(void *)(v33 + 16);
    if (!v34)
    {
      swift_bridgeObjectRelease();
      uint64_t v35 = MEMORY[0x1E4FBC860];
      uint64_t v37 = MEMORY[0x1E4FBC860];
LABEL_83:
      uint64_t v144 = v37;
      uint64_t v74 = MEMORY[0x1E4FBB1A0];
      sub_1E0144A10(0, &qword_1EACE2A30, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
      sub_1E0143D68((unint64_t *)&qword_1EBA35BB0, &qword_1EACE2A30, v74);
      uint64_t v75 = sub_1E0156D20();
      uint64_t v77 = v76;
      swift_bridgeObjectRelease();
      uint64_t v78 = v35;
      uint64_t v79 = v133;
      switch(v132)
      {
        case 1u:
          if (__OFSUB__(HIDWORD(v134), v134)) {
            goto LABEL_164;
          }
          uint64_t v79 = HIDWORD(v134) - (int)v134;
LABEL_87:
          if (v79)
          {
            uint64_t v142 = v75;
            uint64_t v146 = MEMORY[0x1E4FBC860];
            int64_t v82 = v79 & ~(v79 >> 63);
            sub_1E0143CD0(0, v82, 0);
            unsigned int v83 = v132;
            uint64_t v141 = v77;
            if (!v132)
            {
              if ((v79 & 0x8000000000000000) == 0)
              {
                uint64_t v84 = 0;
                uint64_t v86 = v133;
                uint64_t v85 = v134;
                goto LABEL_96;
              }
              goto LABEL_168;
            }
            if (v132 == 1)
            {
              uint64_t v84 = v128;
              uint64_t v85 = v134;
            }
            else
            {
              uint64_t v85 = v134;
              uint64_t v84 = *(void *)(v134 + 16);
            }
            uint64_t v86 = v133;
            if (v79 < 0) {
              goto LABEL_163;
            }
            do
            {
LABEL_96:
              if (!v82) {
                goto LABEL_150;
              }
              if (v83)
              {
                if (v83 == 1)
                {
                  if (v84 < v128 || v84 >= v135) {
                    goto LABEL_152;
                  }
                  uint64_t v88 = sub_1E0156B90();
                  if (!v88) {
                    goto LABEL_171;
                  }
                  uint64_t v89 = v88;
                  uint64_t v90 = sub_1E0156BB0();
                  uint64_t v91 = v84 - v90;
                  if (__OFSUB__(v84, v90)) {
                    goto LABEL_155;
                  }
                }
                else
                {
                  if (v84 < *(void *)(v85 + 16)) {
                    goto LABEL_154;
                  }
                  if (v84 >= *(void *)(v85 + 24)) {
                    goto LABEL_156;
                  }
                  uint64_t v94 = sub_1E0156B90();
                  if (!v94) {
                    goto LABEL_172;
                  }
                  uint64_t v89 = v94;
                  uint64_t v95 = sub_1E0156BB0();
                  uint64_t v91 = v84 - v95;
                  if (__OFSUB__(v84, v95)) {
                    goto LABEL_157;
                  }
                }
                int v93 = *(unsigned __int8 *)(v89 + v91);
              }
              else
              {
                if (v84 >= v86) {
                  goto LABEL_153;
                }
                LOWORD(v144) = v85;
                BYTE2(v144) = BYTE2(v85);
                BYTE3(v144) = BYTE3(v85);
                BYTE4(v144) = BYTE4(v134);
                BYTE5(v144) = BYTE5(v85);
                BYTE6(v144) = BYTE6(v85);
                OUTLINED_FUNCTION_2();
                int v93 = *(unsigned __int8 *)(v92 + v84);
              }
              if (isprint(v93))
              {
                OUTLINED_FUNCTION_14();
                OUTLINED_FUNCTION_1_0();
                uint64_t v144 = v96;
                uint64_t v97 = MEMORY[0x1E01F1AC0](&v144);
                unint64_t v99 = v98;
              }
              else
              {
                unint64_t v99 = 0xE100000000000000;
                uint64_t v97 = 46;
              }
              uint64_t v78 = v146;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_1E0143CD0(0, *(void *)(v78 + 16) + 1, 1);
                uint64_t v78 = v146;
              }
              uint64_t v86 = v133;
              uint64_t v85 = v134;
              unsigned int v83 = v132;
              unint64_t v101 = *(void *)(v78 + 16);
              unint64_t v100 = *(void *)(v78 + 24);
              if (v101 >= v100 >> 1)
              {
                sub_1E0143CD0((char *)(v100 > 1), v101 + 1, 1);
                unsigned int v83 = v132;
                uint64_t v86 = v133;
                uint64_t v85 = v134;
                uint64_t v78 = v146;
              }
              *(void *)(v78 + 16) = v101 + 1;
              uint64_t v102 = v78 + 16 * v101;
              *(void *)(v102 + 32) = v97;
              *(void *)(v102 + 40) = v99;
              ++v84;
              --v82;
              --v79;
            }
            while (v79);
            uint64_t v75 = v142;
            uint64_t v77 = v141;
          }
          else
          {
            uint64_t v78 = MEMORY[0x1E4FBC860];
          }
LABEL_124:
          uint64_t v144 = v78;
          uint64_t v103 = MEMORY[0x1E4FBAF58];
          sub_1E0144A10(0, &qword_1EACE2A38, MEMORY[0x1E4FBAF58], MEMORY[0x1E4FBB320]);
          sub_1E0143D68(&qword_1EACE2A40, &qword_1EACE2A38, v103);
          uint64_t v104 = sub_1E0156E00();
          uint64_t v106 = v105;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v127 = sub_1E014394C(0, *((void *)v127 + 2) + 1, 1, v127);
          }
          unint64_t v108 = *((void *)v127 + 2);
          unint64_t v107 = *((void *)v127 + 3);
          uint64_t v109 = v134;
          unint64_t v110 = v129;
          uint64_t v111 = v132;
          if (v108 >= v107 >> 1)
          {
            v117 = sub_1E014394C((char *)(v107 > 1), v108 + 1, 1, v127);
            uint64_t v111 = v132;
            unint64_t v110 = v129;
            v127 = v117;
            uint64_t v109 = v134;
          }
          *((void *)v127 + 2) = v108 + 1;
          v112 = &v127[56 * v108];
          *((void *)v112 + 4) = v125;
          *((void *)v112 + 5) = v124;
          *((void *)v112 + 6) = v75;
          *((void *)v112 + 7) = v77;
          *((void *)v112 + 8) = v104;
          *((void *)v112 + 9) = v106;
          *((void *)v112 + 10) = a1;
          uint64_t v5 = v119;
          switch(v111)
          {
            case 1:
              int v114 = v109;
              sub_1E0143D10(v109, v110);
              LODWORD(v113) = HIDWORD(v134) - v114;
              if (__OFSUB__(HIDWORD(v134), v114)) {
                goto LABEL_166;
              }
              uint64_t v113 = (int)v113;
              break;
            case 2:
              uint64_t v116 = *(void *)(v109 + 16);
              uint64_t v115 = *(void *)(v109 + 24);
              sub_1E0143D10(v109, v110);
              uint64_t v113 = v115 - v116;
              if (__OFSUB__(v115, v116)) {
                goto LABEL_167;
              }
              uint64_t v5 = v119;
              break;
            case 3:
              sub_1E0143D10(v109, v110);
              uint64_t v113 = 0;
              break;
            default:
              sub_1E0143D10(v109, v110);
              uint64_t v113 = v133;
              break;
          }
          uint64_t v6 = v126 + v113;
          unint64_t v7 = v123;
          if (__OFADD__(v126, v113)) {
            goto LABEL_162;
          }
          if (v123 == v120) {
            goto LABEL_147;
          }
          continue;
        case 2u:
          uint64_t v81 = *(void *)(v134 + 16);
          uint64_t v80 = *(void *)(v134 + 24);
          uint64_t v79 = v80 - v81;
          if (!__OFSUB__(v80, v81)) {
            goto LABEL_87;
          }
          goto LABEL_165;
        case 3u:
          goto LABEL_124;
        default:
          goto LABEL_87;
      }
    }
    break;
  }
  uint64_t v35 = MEMORY[0x1E4FBC860];
  uint64_t v146 = MEMORY[0x1E4FBC860];
  sub_1E0143CF0(0, v34, 0);
  uint64_t v36 = 0;
  uint64_t v37 = v146;
  int64_t v130 = v34;
  uint64_t v131 = v33 + 32;
  while (1)
  {
    uint64_t v38 = (uint64_t *)(v131 + 16 * v36++);
    uint64_t v39 = *v38;
    unint64_t v40 = v38[1];
    unint64_t v41 = v40 >> 62;
    uint64_t v42 = v35;
    unint64_t v43 = HIDWORD(*v38);
    uint64_t v44 = BYTE6(v40);
    uint64_t v139 = BYTE6(v40);
    unint64_t v140 = v40;
    switch(v40 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(v43, v39)) {
          goto LABEL_158;
        }
        uint64_t v136 = v36;
        uint64_t v137 = v37;
        unint64_t v53 = v38[1];
        uint64_t v45 = (int)v43 - (int)v39;
        uint64_t v54 = *v38;
        break;
      case 2uLL:
        uint64_t v136 = v36;
        uint64_t v137 = v37;
        uint64_t v56 = *(void *)(v39 + 16);
        uint64_t v55 = *(void *)(v39 + 24);
        uint64_t v45 = v55 - v56;
        if (__OFSUB__(v55, v56)) {
          goto LABEL_159;
        }
        uint64_t v54 = v39;
        unint64_t v53 = v140;
        break;
      case 3uLL:
        goto LABEL_42;
      default:
        uint64_t v136 = v36;
        uint64_t v137 = v37;
        uint64_t v45 = BYTE6(v40);
        if (!v44) {
          goto LABEL_40;
        }
        goto LABEL_51;
    }
    sub_1E014282C(v54, v53);
    if (v45) {
      break;
    }
LABEL_40:
    uint64_t v42 = v35;
LABEL_41:
    uint64_t v36 = v136;
    uint64_t v37 = v137;
    int64_t v34 = v130;
    unint64_t v40 = v140;
LABEL_42:
    uint64_t v144 = v42;
    uint64_t v46 = MEMORY[0x1E4FBB1A0];
    sub_1E0144A10(0, &qword_1EACE2A30, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
    sub_1E0143D68((unint64_t *)&qword_1EBA35BB0, &qword_1EACE2A30, v46);
    uint64_t v47 = sub_1E0156D20();
    uint64_t v49 = v48;
    swift_bridgeObjectRelease();
    sub_1E0143D10(v39, v40);
    uint64_t v146 = v37;
    unint64_t v51 = *(void *)(v37 + 16);
    unint64_t v50 = *(void *)(v37 + 24);
    if (v51 >= v50 >> 1)
    {
      sub_1E0143CF0((char *)(v50 > 1), v51 + 1, 1);
      uint64_t v37 = v146;
    }
    *(void *)(v37 + 16) = v51 + 1;
    uint64_t v52 = v37 + 16 * v51;
    *(void *)(v52 + 32) = v47;
    *(void *)(v52 + 40) = v49;
    uint64_t v35 = MEMORY[0x1E4FBC860];
    if (v36 == v34)
    {
      swift_bridgeObjectRelease();
      goto LABEL_83;
    }
  }
LABEL_51:
  uint64_t v145 = v35;
  int64_t v57 = v45 & ~(v45 >> 63);
  sub_1E0143CF0(0, v57, 0);
  uint64_t v42 = v145;
  char v138 = v43;
  if (v41)
  {
    if (v41 == 1) {
      uint64_t v58 = (int)v39;
    }
    else {
      uint64_t v58 = *(void *)(v39 + 16);
    }
    if (v45 < 0) {
      goto LABEL_151;
    }
  }
  else
  {
    if (v45 < 0) {
      goto LABEL_160;
    }
    uint64_t v58 = 0;
  }
  int v143 = v41;
  while (v57)
  {
    if (v41)
    {
      if (v41 == 1)
      {
        if (v58 < (int)v39 || v58 >= v39 >> 32) {
          goto LABEL_143;
        }
        uint64_t v60 = sub_1E0156B90();
        if (!v60) {
          goto LABEL_169;
        }
        uint64_t v61 = v60;
        uint64_t v62 = sub_1E0156BB0();
        uint64_t v63 = v58 - v62;
        if (__OFSUB__(v58, v62)) {
          goto LABEL_145;
        }
      }
      else
      {
        if (v58 < *(void *)(v39 + 16)) {
          goto LABEL_142;
        }
        if (v58 >= *(void *)(v39 + 24)) {
          goto LABEL_144;
        }
        uint64_t v66 = sub_1E0156B90();
        if (!v66) {
          goto LABEL_170;
        }
        uint64_t v61 = v66;
        uint64_t v67 = sub_1E0156BB0();
        uint64_t v63 = v58 - v67;
        if (__OFSUB__(v58, v67)) {
          goto LABEL_146;
        }
      }
      char v65 = *(unsigned char *)(v61 + v63);
    }
    else
    {
      if (v58 >= v139) {
        goto LABEL_141;
      }
      LOWORD(v144) = v39;
      BYTE2(v144) = BYTE2(v39);
      BYTE3(v144) = BYTE3(v39);
      BYTE4(v144) = v138;
      BYTE5(v144) = BYTE5(v39);
      BYTE6(v144) = BYTE6(v39);
      OUTLINED_FUNCTION_2();
      char v65 = *(unsigned char *)(v64 + v58);
    }
    uint64_t v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_1E0157850;
    *(void *)(v68 + 56) = MEMORY[0x1E4FBC358];
    *(void *)(v68 + 64) = MEMORY[0x1E4FBC3B0];
    *(unsigned char *)(v68 + 32) = v65;
    unint64_t v41 = sub_1E0156D60();
    uint64_t v70 = v69;
    uint64_t v145 = v42;
    unint64_t v72 = *(void *)(v42 + 16);
    unint64_t v71 = *(void *)(v42 + 24);
    if (v72 >= v71 >> 1)
    {
      sub_1E0143CF0((char *)(v71 > 1), v72 + 1, 1);
      uint64_t v42 = v145;
    }
    *(void *)(v42 + 16) = v72 + 1;
    uint64_t v73 = v42 + 16 * v72;
    *(void *)(v73 + 32) = v41;
    *(void *)(v73 + 40) = v70;
    ++v58;
    --v57;
    --v45;
    LODWORD(v41) = v143;
    if (!v45) {
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  swift_bridgeObjectRelease();
  return v127;
}

char *sub_1E014383C(char *result, int64_t a2, char a3, char *a4)
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
    sub_1E0144890(0, &qword_1EACE2AD8, (void (*)(uint64_t))sub_1E01449BC);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1E014394C(char *result, int64_t a2, char a3, char *a4)
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
    sub_1E0144A10(0, &qword_1EACE2AC8, (uint64_t)&type metadata for Data.HexDumpLine, MEMORY[0x1E4FBBE00]);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[56 * v8] <= v12) {
      memmove(v12, v13, 56 * v8);
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

uint64_t sub_1E0143A7C(uint64_t result, int64_t a2, char a3, void *a4)
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
    sub_1E0144890(0, &qword_1EACE2AA8, (void (*)(uint64_t))sub_1E01448E4);
    uint64_t v10 = swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size((const void *)v10);
    OUTLINED_FUNCTION_7(v11);
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    if ((void *)v10 != a4 || (unint64_t)&a4[2 * v8 + 4] <= v10 + 32) {
      memmove((void *)(v10 + 32), a4 + 4, 16 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_1E0144978();
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1E0143BA0(char *result, int64_t a2, char a3, char *a4)
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
    sub_1E0144A10(0, &qword_1EACE2AA0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    OUTLINED_FUNCTION_7(v11);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
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

char *sub_1E0143CB0(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1E0144218(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_1E0143CD0(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1E0144338(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_1E0143CF0(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_1E0144458(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_1E0143D10(uint64_t a1, unint64_t a2)
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

uint64_t sub_1E0143D68(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1E0144A10(255, a2, a3, MEMORY[0x1E4FBB320]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s11HexDumpLineVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s11HexDumpLineVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s11HexDumpLineVwcp(void *a1, void *a2)
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
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s11HexDumpLineVwca(void *a1, void *a2)
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
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

void *_s11HexDumpLineVwta(void *a1, void *a2)
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
  a1[6] = a2[6];
  return a1;
}

uint64_t _s11HexDumpLineVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s11HexDumpLineVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Data.HexDumpLine()
{
  return &type metadata for Data.HexDumpLine;
}

void type metadata accessor for MRPlaybackState(uint64_t a1)
{
}

void type metadata accessor for MRDisabledReason(uint64_t a1)
{
}

void type metadata accessor for MRContentItemMediaSubType(uint64_t a1)
{
}

void type metadata accessor for MRContentItemRadioStationType(uint64_t a1)
{
}

void type metadata accessor for MRContentItemPlaylistType(uint64_t a1)
{
}

void type metadata accessor for MRContentItemEpisodeType(uint64_t a1)
{
}

void type metadata accessor for MRContentItemMediaType(uint64_t a1)
{
}

void type metadata accessor for MRContentItemMetadataAudioRouteType(uint64_t a1)
{
}

void type metadata accessor for MRQueueEndAction(uint64_t a1)
{
}

void type metadata accessor for MRMediaRemoteCommandHandlerStatus(uint64_t a1)
{
}

char *sub_1E01441D8(char *a1, int64_t a2, char a3)
{
  __n128 result = sub_1E0144578(a1, a2, a3, *v3);
  *long long v3 = result;
  return result;
}

void *sub_1E01441F8(void *a1, int64_t a2, char a3)
{
  __n128 result = sub_1E01446A4(a1, a2, a3, *v3);
  *long long v3 = result;
  return result;
}

char *sub_1E0144218(char *result, int64_t a2, char a3, char *a4)
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
    sub_1E0144A10(0, &qword_1EACE2AE8, MEMORY[0x1E4F277C0], MEMORY[0x1E4FBBE00]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
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

char *sub_1E0144338(char *result, int64_t a2, char a3, char *a4)
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
    sub_1E0144A10(0, &qword_1EACE2AD0, MEMORY[0x1E4FBAF58], MEMORY[0x1E4FBBE00]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
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

char *sub_1E0144458(char *result, int64_t a2, char a3, char *a4)
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
    sub_1E0144A10(0, &qword_1EACE2AA0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBBE00]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
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

char *sub_1E0144578(char *result, int64_t a2, char a3, char *a4)
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
    sub_1E0144A10(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[40 * v8] <= v12) {
      memmove(v12, v13, 40 * v8);
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

void *sub_1E01446A4(void *result, int64_t a2, char a3, void *a4)
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
    sub_1E01447E4(0, &qword_1EBA35BD0, (unint64_t *)&qword_1EBA35BC8);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_1E014483C(0, (unint64_t *)&qword_1EBA35BC8);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void sub_1E01447E4(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_1E014483C(255, a3);
    unint64_t v4 = sub_1E0157260();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1E014483C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_1E0144890(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1E0157260();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_1E01448E4()
{
  unint64_t result = qword_1EACE2AB0;
  if (!qword_1EACE2AB0)
  {
    sub_1E0144938();
    unint64_t result = swift_getFunctionTypeMetadata1();
    atomic_store(result, (unint64_t *)&qword_1EACE2AB0);
  }
  return result;
}

unint64_t sub_1E0144938()
{
  unint64_t result = qword_1EACE2AB8;
  if (!qword_1EACE2AB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EACE2AB8);
  }
  return result;
}

unint64_t sub_1E0144978()
{
  unint64_t result = qword_1EACE2AC0;
  if (!qword_1EACE2AC0)
  {
    unint64_t result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_1EACE2AC0);
  }
  return result;
}

void sub_1E01449BC()
{
  if (!qword_1EACE2AE0)
  {
    unint64_t v0 = sub_1E0156FC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE2AE0);
    }
  }
}

void sub_1E0144A10(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void OUTLINED_FUNCTION_2()
{
  *(unsigned char *)(v2 - 145) = v0;
  *(_WORD *)(v2 - 144) = v1;
  *(unsigned char *)(v2 - 142) = BYTE2(v1);
  *(unsigned char *)(v2 - 141) = BYTE3(v1);
  *(unsigned char *)(v2 - 140) = BYTE4(v1);
  *(unsigned char *)(v2 - 139) = BYTE5(v1);
}

uint64_t OUTLINED_FUNCTION_7(uint64_t result)
{
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 2 * ((result - 32) / 16);
  return result;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_1E014270C(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t NSURLSession.dataProgress(for:)()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v2 = v1;
  sub_1E014502C();
  v0[2] = swift_task_alloc();
  uint64_t v3 = sub_1E0156FE0();
  v0[3] = v3;
  OUTLINED_FUNCTION_1(v3);
  v0[4] = v4;
  v0[5] = *(void *)(v5 + 64);
  v0[6] = swift_task_alloc();
  uint64_t v6 = swift_task_alloc();
  v0[7] = v6;
  int64_t v7 = (void *)swift_task_alloc();
  v0[8] = v7;
  void *v7 = v0;
  v7[1] = sub_1E0144CE4;
  return MEMORY[0x1F40E6610](v6, v2, 0);
}

uint64_t sub_1E0144CE4()
{
  OUTLINED_FUNCTION_10_0();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_4_0();
  void *v7 = v6;
  *(void *)(v5 + 72) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(void *)(v5 + 80) = v3;
  }
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x1F4188298](v8, v9, v10);
}

uint64_t sub_1E0144DD8()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v6 = v0[2];
  uint64_t v7 = v0[3];
  uint64_t v20 = v6;
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28F90]), sel_init);
  id v9 = objc_msgSend(v1, sel_expectedContentLength);
  objc_msgSend(v8, sel_setTotalUnitCount_, v9);
  uint64_t v10 = sub_1E0156F30();
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v10);
  uint64_t v11 = v2;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v2, v3, v7);
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v13 = (v4 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = 0;
  *((void *)v14 + 3) = 0;
  *((void *)v14 + 4) = v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(&v14[v12], v11, v7);
  *(void *)&v14[v13] = v8;
  id v15 = v8;
  uint64_t v16 = sub_1E01461B4(v20, (uint64_t)&unk_1EACE2B08, (uint64_t)v14);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(id, uint64_t, uint64_t))v0[1];
  uint64_t v18 = v0[10];
  return v17(v15, v18, v16);
}

uint64_t sub_1E0144FBC()
{
  OUTLINED_FUNCTION_7_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v0();
}

void sub_1E014502C()
{
  if (!qword_1EACE2AF8)
  {
    sub_1E0156F30();
    unint64_t v0 = sub_1E0157050();
    if (!v1) {
      atomic_store(v0, &qword_1EACE2AF8);
    }
  }
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_1E01450AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[23] = a5;
  v6[24] = a6;
  v6[21] = a1;
  v6[22] = a4;
  uint64_t v7 = sub_1E0156FE0();
  v6[25] = v7;
  v6[26] = *(void *)(v7 - 8);
  v6[27] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E014519C, 0, 0);
}

uint64_t sub_1E014519C()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CAA8]), sel_initToMemory);
  *(void *)(v0 + 224) = v1;
  objc_msgSend(v1, sel_open);
  *(_OWORD *)(v0 + 144) = xmmword_1E01579E0;
  sub_1E0156C20();
  uint64_t v2 = OUTLINED_FUNCTION_5_0();
  v3(v2);
  *(void *)(v0 + 120) = sub_1E0156FD0();
  *(void *)(v0 + 128) = v4;
  *(void *)(v0 + 136) = v5;
  *(void *)(v0 + 232) = 0;
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x1F4188298](v6, v7, v8);
}

uint64_t sub_1E01452C4()
{
  OUTLINED_FUNCTION_7_0();
  id v1 = *(unsigned char **)(v0 + 128);
  if (v1 == *(unsigned char **)(v0 + 136))
  {
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_1E01453E4;
    return MEMORY[0x1F40E4010]();
  }
  else
  {
    *(unsigned char *)(v0 + 259) = *v1;
    *(void *)(v0 + 128) = v1 + 1;
    OUTLINED_FUNCTION_3_0();
    return MEMORY[0x1F4188298](v2, v3, v4);
  }
}

uint64_t sub_1E01453E4()
{
  OUTLINED_FUNCTION_10_0();
  __int16 v3 = v2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  uint64_t v6 = *v1;
  OUTLINED_FUNCTION_4_0();
  void *v7 = v6;
  *(void *)(v5 + 248) = v0;
  swift_task_dealloc();
  if (!v0) {
    *(_WORD *)(v5 + 256) = v3;
  }
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x1F4188298](v8, v9, v10);
}

uint64_t sub_1E0145500()
{
  uint64_t v1 = *(void *)(v0 + 232);
  sub_1E0156F60();
  if (v1)
  {
    swift_unknownObjectRelease();
    sub_1E0143D10(*(void *)(v0 + 144), *(void *)(v0 + 152));
    __int16 v2 = *(void **)(v0 + 224);
    objc_msgSend(v2, sel_close);

    swift_task_dealloc();
    OUTLINED_FUNCTION_6_0();
    return v3();
  }
  OUTLINED_FUNCTION_9_0();
  sub_1E0146928();
  *(void *)(v0 + 40) = v5;
  unint64_t v6 = sub_1E0146974();
  OUTLINED_FUNCTION_2_0(v6);
  __swift_destroy_boxed_opaque_existential_1(0);
  uint64_t v7 = *(void *)(v0 + 144);
  unint64_t v8 = *(void *)(v0 + 152);
  switch(v8 >> 62)
  {
    case 1uLL:
      LODWORD(v9) = HIDWORD(v7) - v7;
      if (__OFSUB__(HIDWORD(v7), v7))
      {
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
      uint64_t v9 = (int)v9;
LABEL_9:
      if (v9 != 4096) {
        goto LABEL_16;
      }
      unint64_t v13 = (char *)objc_msgSend(*(id *)(v0 + 192), sel_completedUnitCount);
      if (__OFADD__(v13, 4096)) {
        goto LABEL_21;
      }
      objc_msgSend(*(id *)(v0 + 192), sel_setCompletedUnitCount_, v13 + 4096);
      sub_1E014282C(v7, v8);
      NSOutputStream.write(_:)(v7, v8);
      OUTLINED_FUNCTION_8_0();
      if (v8 >> 62 == 2)
      {
        uint64_t v14 = *(void *)(v7 + 16);
        uint64_t v15 = *(void *)(v7 + 24);
      }
      else
      {
        uint64_t v14 = (int)v7;
        uint64_t v15 = v7 >> 32;
      }
      if (v15 < v14) {
LABEL_22:
      }
        __break(1u);
      sub_1E0156C10();
LABEL_16:
      *(void *)(v0 + 232) = 0;
      OUTLINED_FUNCTION_3_0();
      return MEMORY[0x1F4188298](v16, v17, v18);
    case 2uLL:
      uint64_t v11 = *(void *)(v7 + 16);
      uint64_t v10 = *(void *)(v7 + 24);
      BOOL v12 = __OFSUB__(v10, v11);
      uint64_t v9 = v10 - v11;
      if (!v12) {
        goto LABEL_9;
      }
      goto LABEL_20;
    default:
      goto LABEL_16;
  }
}

uint64_t sub_1E01457B8()
{
  OUTLINED_FUNCTION_7_0();
  *(void *)(v0 + 160) = *(void *)(v0 + 248);
  sub_1E0146A58();
  swift_willThrowTypedImpl();
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x1F4188298](v1, v2, v3);
}

uint64_t sub_1E0145864()
{
  OUTLINED_FUNCTION_10_0();
  swift_unknownObjectRelease();
  sub_1E0143D10(v0[18], v0[19]);
  uint64_t v1 = (void *)v0[28];
  objc_msgSend(v1, sel_close);

  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v2();
}

uint64_t sub_1E014591C()
{
  if ((*(_WORD *)(v0 + 256) & 0x100) != 0)
  {
    swift_unknownObjectRelease();
    uint64_t v4 = *(void *)(v0 + 144);
    unint64_t v5 = *(void *)(v0 + 152);
    switch(v5 >> 62)
    {
      case 1uLL:
        uint64_t v6 = (int)v4;
        uint64_t v7 = v4 >> 32;
        goto LABEL_10;
      case 2uLL:
        uint64_t v6 = *(void *)(v4 + 16);
        uint64_t v7 = *(void *)(v4 + 24);
LABEL_10:
        if (v6 != v7) {
          goto LABEL_11;
        }
        goto LABEL_14;
      case 3uLL:
        goto LABEL_14;
      default:
        if ((v5 & 0xFF000000000000) == 0) {
          goto LABEL_14;
        }
LABEL_11:
        uint64_t v8 = *(void *)(v0 + 248);
        uint64_t v9 = OUTLINED_FUNCTION_5_0();
        sub_1E014282C(v9, v10);
        uint64_t v11 = OUTLINED_FUNCTION_5_0();
        NSOutputStream.write(_:)(v11, v12);
        sub_1E0143D10(v4, v5);
        if (v8)
        {
          uint64_t v2 = OUTLINED_FUNCTION_5_0();
          goto LABEL_13;
        }
LABEL_14:
        uint64_t v15 = *(void **)(v0 + 224);
        objc_msgSend(*(id *)(v0 + 192), sel_setCompletedUnitCount_, objc_msgSend(*(id *)(v0 + 192), sel_totalUnitCount));
        if (!objc_msgSend(v15, sel_propertyForKey_, *MEMORY[0x1E4F1C4C0]))
        {
          __break(1u);
          JUMPOUT(0x1E0145D4CLL);
        }
        uint64_t v16 = *(void **)(v0 + 224);
        sub_1E01570B0();
        swift_unknownObjectRelease();
        sub_1E0146AB0((_OWORD *)(v0 + 56), (_OWORD *)(v0 + 88));
        swift_dynamicCast();
        sub_1E0143D10(v4, v5);
        objc_msgSend(v16, sel_close);

        swift_task_dealloc();
        uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
        break;
    }
    goto LABEL_16;
  }
  uint64_t v1 = *(void *)(v0 + 248);
  sub_1E0156F60();
  if (v1)
  {
    swift_unknownObjectRelease();
    uint64_t v2 = *(void *)(v0 + 144);
    unint64_t v3 = *(void *)(v0 + 152);
LABEL_13:
    sub_1E0143D10(v2, v3);
    unint64_t v13 = *(void **)(v0 + 224);
    objc_msgSend(v13, sel_close);

    swift_task_dealloc();
    uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
LABEL_16:
    return v14();
  }
  OUTLINED_FUNCTION_9_0();
  sub_1E0146928();
  *(void *)(v0 + 40) = v18;
  unint64_t v19 = sub_1E0146974();
  OUTLINED_FUNCTION_2_0(v19);
  __swift_destroy_boxed_opaque_existential_1(0);
  uint64_t v20 = *(void *)(v0 + 144);
  unint64_t v21 = *(void *)(v0 + 152);
  switch(v21 >> 62)
  {
    case 1uLL:
      LODWORD(v22) = HIDWORD(v20) - v20;
      if (__OFSUB__(HIDWORD(v20), v20))
      {
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      uint64_t v22 = (int)v22;
LABEL_23:
      if (v22 != 4096) {
        goto LABEL_30;
      }
      uint64_t v26 = (char *)objc_msgSend(*(id *)(v0 + 192), sel_completedUnitCount);
      if (__OFADD__(v26, 4096)) {
        goto LABEL_35;
      }
      objc_msgSend(*(id *)(v0 + 192), sel_setCompletedUnitCount_, v26 + 4096);
      sub_1E014282C(v20, v21);
      NSOutputStream.write(_:)(v20, v21);
      OUTLINED_FUNCTION_8_0();
      if (v21 >> 62 == 2)
      {
        uint64_t v27 = *(void *)(v20 + 16);
        uint64_t v28 = *(void *)(v20 + 24);
      }
      else
      {
        uint64_t v27 = (int)v20;
        uint64_t v28 = v20 >> 32;
      }
      if (v28 < v27) {
LABEL_36:
      }
        __break(1u);
      sub_1E0156C10();
LABEL_30:
      *(void *)(v0 + 232) = 0;
      OUTLINED_FUNCTION_3_0();
      return MEMORY[0x1F4188298](v29, v30, v31);
    case 2uLL:
      uint64_t v24 = *(void *)(v20 + 16);
      uint64_t v23 = *(void *)(v20 + 24);
      BOOL v25 = __OFSUB__(v23, v24);
      uint64_t v22 = v23 - v24;
      if (!v25) {
        goto LABEL_23;
      }
      goto LABEL_34;
    default:
      goto LABEL_30;
  }
}

uint64_t sub_1E0145D7C()
{
  uint64_t v1 = sub_1E0156FE0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v6 + 8, v5);
}

uint64_t sub_1E0145E64(uint64_t a1)
{
  uint64_t v4 = sub_1E0156FE0();
  OUTLINED_FUNCTION_1(v4);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  unint64_t v9 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v12 = v1[4];
  uint64_t v13 = (uint64_t)v1 + v9;
  uint64_t v14 = *(void *)((char *)v1 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v15;
  *uint64_t v15 = v2;
  v15[1] = sub_1E0145F6C;
  return sub_1E01450AC(a1, v10, v11, v12, v13, v14);
}

uint64_t sub_1E0145F6C()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_6_0();
  return v3();
}

void NSOutputStream.write(_:)(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
        JUMPOUT(0x1E0146194);
      }
      id v5 = v2;
      sub_1E014282C(a1, a2);
      sub_1E014648C((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, v5);
      sub_1E0143D10(a1, a2);
      break;
    case 2uLL:
      uint64_t v6 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v7 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      id v9 = v2;
      swift_retain();
      swift_retain();
      sub_1E014648C(v7, v8, v6, v9);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      id v10 = v2;
      OUTLINED_FUNCTION_3_0();
      sub_1E014653C(v11, v12, v13, v14);
      break;
    default:
      sub_1E014653C(a1, a2 & 0xFFFFFFFFFFFFLL, BYTE6(a2), v2);
      break;
  }
}

uint64_t sub_1E01461A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1E01461B4(a1, a2, a3);
}

uint64_t sub_1E01461B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1E0156F30();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_1E0146880(a1);
  }
  else
  {
    sub_1E0156F20();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1E0156ED0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

BOOL static NSOutputStream.OutputStreamError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t NSOutputStream.OutputStreamError.hash(into:)()
{
  return sub_1E0157320();
}

uint64_t NSOutputStream.OutputStreamError.hashValue.getter()
{
  return sub_1E0157330();
}

uint64_t sub_1E0146388()
{
  return sub_1E0157330();
}

uint64_t sub_1E01463DC(uint64_t result, uint64_t a2, id a3)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = a2 - result;
    if (a2 - result < 1) {
      return result;
    }
    while (1)
    {
      unint64_t result = (uint64_t)objc_msgSend(a3, sel_write_maxLength_, v3, v4);
      if (result < 0) {
        break;
      }
      v3 += result;
      BOOL v6 = v4 <= result;
      v4 -= result;
      if (v6) {
        return result;
      }
    }
    char v7 = 1;
  }
  else
  {
    char v7 = 0;
  }
  sub_1E01468DC();
  swift_allocError();
  *uint64_t v8 = v7;
  return swift_willThrow();
}

void sub_1E014648C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_1E0156B90();
  if (v7)
  {
    uint64_t v8 = sub_1E0156BB0();
    if (__OFSUB__(a1, v8))
    {
LABEL_13:
      __break(1u);
      return;
    }
    v7 += a1 - v8;
  }
  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v11 = sub_1E0156BA0();
  if (v11 >= v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = v7 + v12;
  if (v7) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  sub_1E01463DC(v7, v14, a4);
}

void sub_1E014653C(uint64_t a1, uint64_t a2, uint64_t a3, id a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a1;
  __int16 v11 = a2;
  char v12 = BYTE2(a2);
  char v13 = BYTE3(a2);
  char v14 = BYTE4(a2);
  char v15 = BYTE5(a2);
  if (a3 >= 1)
  {
    uint64_t v5 = a3;
    BOOL v6 = &v10;
    while (1)
    {
      uint64_t v7 = (uint64_t)objc_msgSend(a4, sel_write_maxLength_, v6, v5);
      if (v7 < 0) {
        break;
      }
      BOOL v6 = (uint64_t *)((char *)v6 + v7);
      BOOL v8 = v5 <= v7;
      v5 -= v7;
      if (v8) {
        goto LABEL_8;
      }
    }
    sub_1E01468DC();
    swift_allocError();
    *BOOL v9 = 1;
    swift_willThrow();
  }
LABEL_8:
}

unint64_t sub_1E0146684()
{
  unint64_t result = qword_1EACE2B10;
  if (!qword_1EACE2B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2B10);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s17OutputStreamErrorOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s17OutputStreamErrorOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E0146834);
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

uint64_t sub_1E014685C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1E0146864(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NSOutputStream.OutputStreamError()
{
  return &type metadata for NSOutputStream.OutputStreamError;
}

uint64_t sub_1E0146880(uint64_t a1)
{
  sub_1E014502C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1E01468DC()
{
  unint64_t result = qword_1EACE2B18;
  if (!qword_1EACE2B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2B18);
  }
  return result;
}

void sub_1E0146928()
{
  if (!qword_1EACE2B20)
  {
    unint64_t v0 = sub_1E0157140();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE2B20);
    }
  }
}

unint64_t sub_1E0146974()
{
  unint64_t result = qword_1EACE2B28;
  if (!qword_1EACE2B28)
  {
    sub_1E0146928();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2B28);
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

unint64_t sub_1E0146A58()
{
  unint64_t result = qword_1EBA35BC8;
  if (!qword_1EBA35BC8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA35BC8);
  }
  return result;
}

_OWORD *sub_1E0146AB0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(unsigned char *)(v2 + 16) = v4;
  *(unsigned char *)(v2 + 258) = *(unsigned char *)__swift_project_boxed_opaque_existential_1(v1, v3);
  return sub_1E0156C10();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_1E0143D10(v0, v1);
}

uint64_t waitForDebugger(for:)()
{
  OUTLINED_FUNCTION_7_0();
  v0[9] = v1;
  v0[10] = v2;
  uint64_t v3 = sub_1E0156F10();
  v0[11] = v3;
  OUTLINED_FUNCTION_1(v3);
  v0[12] = v4;
  v0[13] = OUTLINED_FUNCTION_15_0();
  uint64_t v5 = sub_1E0156CA0();
  v0[14] = v5;
  OUTLINED_FUNCTION_1(v5);
  v0[15] = v6;
  v0[16] = OUTLINED_FUNCTION_15_0();
  uint64_t v7 = sub_1E0156CD0();
  v0[17] = v7;
  OUTLINED_FUNCTION_1(v7);
  v0[18] = v8;
  v0[19] = OUTLINED_FUNCTION_15_0();
  sub_1E0147FAC(0, &qword_1EACE2AF8, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  v0[20] = OUTLINED_FUNCTION_15_0();
  uint64_t v9 = sub_1E0157190();
  v0[21] = v9;
  OUTLINED_FUNCTION_1(v9);
  v0[22] = v10;
  v0[23] = *(void *)(v11 + 64);
  v0[24] = swift_task_alloc();
  v0[25] = swift_task_alloc();
  uint64_t v12 = sub_1E01571B0();
  v0[26] = v12;
  OUTLINED_FUNCTION_1(v12);
  v0[27] = v13;
  v0[28] = *(void *)(v14 + 64);
  v0[29] = swift_task_alloc();
  v0[30] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E0146D6C, 0, 0);
}

uint64_t sub_1E0146D6C()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[30];
  uint64_t v3 = v0[27];
  uint64_t v5 = v0[25];
  uint64_t v4 = v0[26];
  uint64_t v6 = v0[24];
  uint64_t v31 = v1;
  uint64_t v32 = v0[23];
  uint64_t v7 = v0[21];
  uint64_t v8 = v0[22];
  uint64_t v9 = v0[20];
  uint64_t v33 = v0[28];
  uint64_t v34 = v0[9];
  uint64_t v36 = v0[10];
  sub_1E01571A0();
  sub_1E0157150();
  uint64_t v10 = sub_1E0156F30();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v12 = (v32 + *(unsigned __int8 *)(v3 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 32))(v13 + v11, v6, v7);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v13 + v12, v31, v4);
  uint64_t v14 = (void *)(v13 + ((v33 + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v14 = v34;
  v14[1] = v36;
  uint64_t v15 = sub_1E01461A4(v9, (uint64_t)&unk_1EACE2B40, v13);
  v0[31] = v15;
  LODWORD(v9) = isatty(0);
  sub_1E0147D68();
  uint64_t v16 = OUTLINED_FUNCTION_14_0();
  *(_OWORD *)(v16 + 16) = xmmword_1E0157850;
  *(void *)(v16 + 56) = MEMORY[0x1E4FBB1A0];
  if (v9 == 1)
  {
    uint64_t v18 = v0[18];
    uint64_t v17 = v0[19];
    uint64_t v19 = v0[16];
    uint64_t v20 = v0[15];
    uint64_t v35 = v0[14];
    uint64_t v37 = v0[17];
    *(void *)(v16 + 32) = 0x1000000000000028;
    *(void *)(v16 + 40) = 0x80000001E015A070;
    sub_1E0157300();
    swift_bridgeObjectRelease();
    unint64_t v21 = (FILE *)sub_1E0156C70();
    fflush(v21);
    uint64_t v22 = (void (__cdecl *)(int))sub_1E0156C90();
    uint64_t v23 = signal(2, v22);
    sub_1E0147DB8();
    uint64_t v24 = sub_1E0157010();
    swift_getObjectType();
    v0[6] = sub_1E0147E4C;
    v0[7] = v15;
    v0[2] = MEMORY[0x1E4F143A8];
    v0[3] = 1107296256;
    v0[4] = sub_1E0147E54;
    v0[5] = &block_descriptor;
    BOOL v25 = _Block_copy(v0 + 2);
    swift_unknownObjectRetain();
    swift_retain();
    sub_1E0156CC0();
    sub_1E0147EB0();
    sub_1E0157020();
    _Block_release(v25);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v35);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v37);
    swift_release();
    swift_unknownObjectRetain();
    sub_1E0157040();
    swift_unknownObjectRelease();
  }
  else
  {
    *(void *)(v16 + 32) = 0x1000000000000017;
    *(void *)(v16 + 40) = 0x80000001E015A050;
    sub_1E0157300();
    swift_bridgeObjectRelease();
    uint64_t v23 = 0;
    uint64_t v24 = 0;
  }
  v0[32] = v23;
  v0[33] = v24;
  uint64_t v26 = (void *)swift_task_alloc();
  v0[34] = v26;
  unint64_t v27 = sub_1E0146A58();
  v0[35] = v27;
  *uint64_t v26 = v0;
  v26[1] = sub_1E01471B0;
  uint64_t v28 = MEMORY[0x1E4FBC848] + 8;
  uint64_t v29 = MEMORY[0x1E4FBC0F0];
  return MEMORY[0x1F4187D90](v27, v15, v28, v27, v29);
}

uint64_t sub_1E01471B0()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_13_0();
  *uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_13_0();
  *uint64_t v5 = v4;
  *(void *)(v6 + 288) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v7 = sub_1E01473EC;
  }
  else {
    uint64_t v7 = sub_1E0147294;
  }
  return MEMORY[0x1F4188298](v7, 0, 0);
}

uint64_t sub_1E0147294()
{
  if (*(void *)(v0 + 264))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1E0157030();
    swift_unknownObjectRelease();
  }
  if (isatty(0) == 1)
  {
    uint64_t v1 = *(void (__cdecl **)(int))(v0 + 256);
    if (!v1) {
      uint64_t v1 = (void (__cdecl *)(int))sub_1E0156C80();
    }
    signal(2, v1);
    sub_1E0147D68();
    uint64_t v2 = (__n128 *)OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_2_1(v2, MEMORY[0x1E4FBB1A0], (__n128)xmmword_1E0157850);
    swift_bridgeObjectRelease();
    uint64_t v3 = (FILE *)sub_1E0156C70();
    fflush(v3);
  }
  OUTLINED_FUNCTION_1_1();
  uint64_t v4 = OUTLINED_FUNCTION_7_1();
  v5(v4);
  uint64_t v6 = OUTLINED_FUNCTION_6_1();
  v7(v6);
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9_1();
  return v8();
}

uint64_t sub_1E01473EC()
{
  *(void *)(v0 + 64) = *(void *)(v0 + 288);
  MEMORY[0x1E01F23A0]();
  if (swift_dynamicCast())
  {
    uint64_t v2 = *(void *)(v0 + 96);
    uint64_t v1 = *(void *)(v0 + 104);
    uint64_t v3 = *(void *)(v0 + 88);

    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    if (*(void *)(v0 + 264))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_1E0157030();
      swift_unknownObjectRelease();
    }
    if (isatty(0) == 1)
    {
      uint64_t v4 = *(void (__cdecl **)(int))(v0 + 256);
      if (!v4) {
        uint64_t v4 = (void (__cdecl *)(int))sub_1E0156C80();
      }
      signal(2, v4);
      sub_1E0147D68();
      uint64_t v5 = (__n128 *)OUTLINED_FUNCTION_14_0();
      OUTLINED_FUNCTION_2_1(v5, MEMORY[0x1E4FBB1A0], (__n128)xmmword_1E0157850);
      swift_bridgeObjectRelease();
      uint64_t v6 = (FILE *)sub_1E0156C70();
      fflush(v6);
    }
    OUTLINED_FUNCTION_1_1();
    uint64_t v7 = OUTLINED_FUNCTION_7_1();
    v8(v7);
    uint64_t v9 = OUTLINED_FUNCTION_6_1();
    v10(v9);
    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_9_1();
  }
  else
  {

    if (isatty(0) == 1)
    {
      unint64_t v12 = *(void (__cdecl **)(int))(v0 + 256);
      if (!v12) {
        unint64_t v12 = (void (__cdecl *)(int))sub_1E0156C80();
      }
      signal(2, v12);
      sub_1E0147D68();
      uint64_t v13 = (__n128 *)OUTLINED_FUNCTION_14_0();
      OUTLINED_FUNCTION_2_1(v13, MEMORY[0x1E4FBB1A0], (__n128)xmmword_1E0157850);
      swift_bridgeObjectRelease();
      uint64_t v14 = (FILE *)sub_1E0156C70();
      fflush(v14);
    }
    OUTLINED_FUNCTION_1_1();
    uint64_t v15 = OUTLINED_FUNCTION_7_1();
    v16(v15);
    uint64_t v17 = OUTLINED_FUNCTION_6_1();
    v18(v17);
    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v11();
}

uint64_t sub_1E014767C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  uint64_t v8 = sub_1E0157190();
  v7[6] = v8;
  v7[7] = *(void *)(v8 - 8);
  v7[8] = swift_task_alloc();
  v7[9] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E0147750, 0, 0);
}

uint64_t sub_1E0147750()
{
  OUTLINED_FUNCTION_11_0();
  sub_1E0157180();
  uint64_t v2 = OUTLINED_FUNCTION_4_1();
  v1(v2);
  if (OUTLINED_FUNCTION_18() & 1) == 0 || (MSVProcessIsDebugging())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_12_0();
    __asm { BRAA            X1, X16 }
  }
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_10_1();
  uint64_t v5 = OUTLINED_FUNCTION_17();
  v1(v5);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1E0147868;
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_12_0();
  return MEMORY[0x1F4187F40]();
}

uint64_t sub_1E0147868()
{
  uint64_t v2 = *v1;
  OUTLINED_FUNCTION_13_0();
  *uint64_t v4 = v3;
  *uint64_t v4 = *v1;
  *(void *)(v3 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2 + 80))(*(void *)(v2 + 64), *(void *)(v2 + 48));
  if (v0) {
    uint64_t v5 = sub_1E01479D4;
  }
  else {
    uint64_t v5 = sub_1E0147750;
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

uint64_t sub_1E01479D4()
{
  OUTLINED_FUNCTION_7_0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1E0147A3C()
{
  uint64_t v1 = sub_1E0157190();
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = sub_1E01571B0();
  OUTLINED_FUNCTION_3_1();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = (v5 + v7 + v13) & ~v13;
  uint64_t v15 = v4 | v13 | 7;
  unint64_t v16 = ((*(void *)(v12 + 64) + v14 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v5, v1);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v14, v8);
  return MEMORY[0x1F4186498](v0, v16, v15);
}

uint64_t sub_1E0147B50(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_1E0157190();
  OUTLINED_FUNCTION_1(v5);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = sub_1E01571B0();
  OUTLINED_FUNCTION_1(v10);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  unint64_t v15 = (v7 + v9 + *(unsigned __int8 *)(v12 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = *(void *)(v1 + 16);
  uint64_t v17 = *(void *)(v1 + 24);
  uint64_t v18 = v1 + v7;
  uint64_t v19 = v1 + v15;
  uint64_t v20 = (uint64_t *)(v1 + ((*(void *)(v14 + 64) + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v21 = *v20;
  uint64_t v22 = v20[1];
  uint64_t v23 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v23;
  void *v23 = v3;
  v23[1] = sub_1E0147CA0;
  return sub_1E014767C(a1, v16, v17, v18, v19, v21, v22);
}

uint64_t sub_1E0147CA0()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_13_0();
  void *v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

void sub_1E0147D68()
{
  if (!qword_1EACE2B48)
  {
    unint64_t v0 = sub_1E0157260();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE2B48);
    }
  }
}

unint64_t sub_1E0147DB8()
{
  unint64_t result = qword_1EBA35BC0;
  if (!qword_1EBA35BC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBA35BC0);
  }
  return result;
}

uint64_t sub_1E0147DF8(uint64_t a1)
{
  unint64_t v2 = sub_1E0146A58();
  uint64_t v3 = MEMORY[0x1E4FBC848] + 8;
  uint64_t v4 = MEMORY[0x1E4FBC0F0];
  return MEMORY[0x1F4187D98](a1, v3, v2, v4);
}

uint64_t sub_1E0147E4C()
{
  return sub_1E0147DF8(v0);
}

uint64_t sub_1E0147E54(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
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

uint64_t sub_1E0147EB0()
{
  return sub_1E01570C0();
}

unint64_t sub_1E0147F5C()
{
  unint64_t result = qword_1EBA35BA0;
  if (!qword_1EBA35BA0)
  {
    sub_1E0156CA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA35BA0);
  }
  return result;
}

void sub_1E0147FAC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_1E0148010()
{
  unint64_t result = qword_1EBA35BA8;
  if (!qword_1EBA35BA8)
  {
    sub_1E0147FAC(255, &qword_1EACE2B50, MEMORY[0x1E4FBCB00], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA35BA8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_2_1@<X0>(__n128 *a1@<X0>, unint64_t a2@<X8>, __n128 a3@<Q0>)
{
  a1[1] = a3;
  a1[3].n128_u64[1] = a2;
  a1[2].n128_u64[0] = 0x4B325B1B0DLL;
  a1[2].n128_u64[1] = 0xE500000000000000;
  return sub_1E0157300();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  *(void *)(v1 + 80) = *(void *)(v2 + 8);
  *(void *)(v1 + 88) = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return *(void *)(v0 + 64);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return v0 + 8;
}

void OUTLINED_FUNCTION_10_1()
{
  JUMPOUT(0x1E01F1E90);
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_1E0157150();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_1E0157150();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return MEMORY[0x1F4186160](v0, v3, v2, v1);
}

uint64_t sub_1E01482A8(int64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || a1 > v3[3] >> 1)
  {
    if (v3[2] <= a1) {
      int64_t v5 = a1;
    }
    else {
      int64_t v5 = v3[2];
    }
    uint64_t result = sub_1E0143A7C(result, v5, 0, v3);
    uint64_t v3 = (void *)result;
  }
  *uint64_t v1 = v3;
  return result;
}

void MSVSQLStatement.bindNull(to:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*((unsigned char *)a1 + 16) == 1)
  {
    id v3 = (id)sub_1E0156D40();
    objc_msgSend(v1, sel_bindNullValueToParameterNamed_, v3);
  }
  else
  {
    objc_msgSend(v1, sel_bindNullValueToParameterAtIndex_, v2);
  }
}

void MSVSQLStatement.bind(_:to:)(uint64_t a1, char a2, uint64_t a3)
{
}

{
  sub_1E014843C(a1, a2, a3, (SEL *)&selRef_bindInt64Value_toParameterNamed_, (const char **)&selRef_bindInt64Value_toParameterAtIndex_);
}

{
  sub_1E01483DC(a1, a2, a3, (void (*)(uint64_t, void, void *))MSVSQLStatement.bind(_:to:));
}

{
  sub_1E014843C(a1, a2, a3, (SEL *)&selRef_bindUInt64Value_toParameterNamed_, (const char **)&selRef_bindUInt64Value_toParameterAtIndex_);
}

{
  void *v3;
  uint64_t v5;
  char v6;
  uint64_t v8;
  id v9;
  uint64_t v10[2];
  char v11;
  uint64_t vars8;

  int64_t v5 = *(void *)(a3 + 8);
  uint64_t v6 = *(unsigned char *)(a3 + 16);
  if (a2)
  {
    v10[0] = *(void *)a3;
    v10[1] = v5;
    uint64_t v11 = v6;
    MSVSQLStatement.bindNull(to:)(v10);
  }
  else if (*(unsigned char *)(a3 + 16))
  {
    uint64_t v9 = (id)sub_1E0156D40();
    objc_msgSend(v3, sel_bindDoubleValue_toParameterNamed_, v9, *(double *)&a1);
  }
  else
  {
    unint64_t v8 = *(void *)a3;
    objc_msgSend(v3, sel_bindDoubleValue_toParameterAtIndex_, v8, *(double *)&a1);
  }
}

void sub_1E01483DC(uint64_t a1, char a2, uint64_t a3, void (*a4)(uint64_t, void, void *))
{
  uint64_t v4 = *(void *)(a3 + 8);
  char v5 = *(unsigned char *)(a3 + 16);
  if (a2)
  {
    OUTLINED_FUNCTION_14_1(v5, v6, *(void *)a3, v4, v8);
  }
  else
  {
    v7[0] = *(void *)a3;
    v7[1] = v4;
    char v8 = v5;
    a4(a1, 0, v7);
  }
}

void sub_1E014843C(uint64_t a1, char a2, uint64_t a3, SEL *a4, const char **a5)
{
  uint64_t v9 = *(void *)a3;
  uint64_t v8 = *(void *)(a3 + 8);
  char v10 = *(unsigned char *)(a3 + 16);
  if (a2)
  {
    v14[0] = *(void *)a3;
    v14[1] = v8;
    char v15 = v10;
    MSVSQLStatement.bindNull(to:)(v14);
  }
  else if (*(unsigned char *)(a3 + 16))
  {
    sub_1E0156D40();
    OUTLINED_FUNCTION_16_0();
    objc_msgSend(v5, *a4, a1);
  }
  else
  {
    uint64_t v12 = *a5;
    objc_msgSend(v5, v12, a1, v9);
  }
}

void MSVSQLStatement.bind(_:to:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  if ((a1 & 0x100000000) != 0)
  {
    OUTLINED_FUNCTION_14_1(v7, (uint64_t)v10, v6, v5, v12);
  }
  else
  {
    int v8 = a1;
    if (v7)
    {
      id v11 = (id)sub_1E0156D40();
      LODWORD(v9) = v8;
      objc_msgSend(v3, sel_bindFloatValue_toParameterNamed_, v11, v9);
    }
    else
    {
      LODWORD(a3) = a1;
      objc_msgSend(v3, sel_bindFloatValue_toParameterAtIndex_, v6, a3);
    }
  }
}

void MSVSQLStatement.bind(_:to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)a3;
  if (a2)
  {
    if (*(unsigned char *)(a3 + 16))
    {
      uint64_t v5 = (void *)sub_1E0156D40();
      sub_1E0156D40();
      OUTLINED_FUNCTION_16_0();
      objc_msgSend(v3, sel_bindStringValue_toParameterNamed_, v5);
    }
    else
    {
      id v6 = (id)sub_1E0156D40();
      objc_msgSend(v3, sel_bindStringValue_toParameterAtIndex_, v6, v4);
    }
  }
  else
  {
    OUTLINED_FUNCTION_14_1(*(unsigned char *)(a3 + 16), (uint64_t)v6, *(void *)a3, *(void *)(a3 + 8), v7);
  }
}

void MSVSQLStatement.bind<A>(_:to:)()
{
  OUTLINED_FUNCTION_13_1();
  uint64_t v5 = OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_3_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_20();
  char v9 = *(unsigned char *)(v2 + 16);
  uint64_t v10 = OUTLINED_FUNCTION_10_2();
  v11(v10);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v0, 1, v1);
  if (EnumTagSinglePayload == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v5);
    uint64_t v13 = 0;
  }
  else
  {
    sub_1E0156E30();
    uint64_t v13 = v15[0];
    OUTLINED_FUNCTION_7_2();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0, v1);
  }
  v15[0] = v3;
  v15[1] = v4;
  char v16 = v9;
  MSVSQLStatement.bind(_:to:)(v13, EnumTagSinglePayload == 1, (uint64_t)v15);
  OUTLINED_FUNCTION_12_1();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  OUTLINED_FUNCTION_13_1();
  uint64_t v5 = OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_3_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_20();
  char v9 = *(unsigned char *)(v2 + 16);
  uint64_t v10 = OUTLINED_FUNCTION_10_2();
  v11(v10);
  if (__swift_getEnumTagSinglePayload(v0, 1, v1) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v5);
    char v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    sub_1E0156E30();
    char v12 = v15;
    uint64_t v13 = v16;
    OUTLINED_FUNCTION_7_2();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0, v1);
  }
  char v15 = v3;
  char v16 = v4;
  uint64_t v17 = v9;
  MSVSQLStatement.bind(_:to:)(v12, v13, (uint64_t)&v15);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12_1();
}

void MSVSQLStatement.bind(_:to:)(char a1, uint64_t a2)
{
  uint64_t v5 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  int v6 = *(unsigned __int8 *)(a2 + 16);
  if (a1 == 2)
  {
    OUTLINED_FUNCTION_14_1(v6, (uint64_t)v8, v5, v4, v9);
  }
  else if (v6)
  {
    uint64_t v7 = a1 & 1;
    sub_1E0156D40();
    OUTLINED_FUNCTION_16_0();
    objc_msgSend(v2, sel_bindBoolValue_toParameterNamed_, v7);
  }
  else
  {
    objc_msgSend(v2, sel_bindBoolValue_toParameterAtIndex_, a1 & 1, v5);
  }
}

void MSVSQLStatement.bind(_:to:)()
{
  OUTLINED_FUNCTION_13_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_1E0148C38();
  MEMORY[0x1F4188790](v4 - 8);
  int v6 = (char *)&v19[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1E0156C60();
  OUTLINED_FUNCTION_3_1();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  char v12 = (char *)&v19[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)v3;
  uint64_t v14 = *(void *)(v3 + 8);
  int v15 = *(unsigned __int8 *)(v3 + 16);
  sub_1E0148E48();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    sub_1E0148EF0((uint64_t)v6, (void (*)(void))sub_1E0148C38);
    v19[0] = v13;
    v19[1] = v14;
    char v20 = v15;
    MSVSQLStatement.bindNull(to:)(v19);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v6, v7);
    if (v15)
    {
      char v16 = (void *)sub_1E0156C50();
      uint64_t v17 = (void *)sub_1E0156D40();
      objc_msgSend(v1, sel_bindDateValue_toParameterNamed_, v16, v17);
    }
    else
    {
      uint64_t v17 = (void *)sub_1E0156C50();
      objc_msgSend(v1, sel_bindDateValue_toParameterAtIndex_, v17, v13);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
  }
  OUTLINED_FUNCTION_12_1();
}

void sub_1E0148C38()
{
  if (!qword_1EACE2B58)
  {
    sub_1E0156C60();
    unint64_t v0 = sub_1E0157050();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE2B58);
    }
  }
}

void MSVSQLStatement.bind(json:to:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  int v5 = *((unsigned __int8 *)a2 + 16);
  sub_1E0148E48();
  if (!v15)
  {
    sub_1E0148EF0((uint64_t)&v14, (void (*)(void))sub_1E0148EA0);
    *(void *)&long long v16 = v3;
    *((void *)&v16 + 1) = v4;
    char v17 = v5;
    MSVSQLStatement.bindNull(to:)((uint64_t *)&v16);
    return;
  }
  sub_1E0146AB0(&v14, &v16);
  if (!v5)
  {
    __swift_project_boxed_opaque_existential_1(&v16, v18);
    uint64_t v11 = sub_1E0157280();
    *(void *)&long long v14 = 0;
    unsigned int v12 = objc_msgSend(v2, sel_bindJSONValue_toParameterAtIndex_error_, v11, v3, &v14);
    swift_unknownObjectRelease();
    uint64_t v9 = (void *)v14;
    if (!v12) {
      goto LABEL_4;
    }
LABEL_7:
    id v13 = v9;
    goto LABEL_8;
  }
  __swift_project_boxed_opaque_existential_1(&v16, v18);
  uint64_t v6 = sub_1E0157280();
  uint64_t v7 = (void *)sub_1E0156D40();
  *(void *)&long long v14 = 0;
  unsigned __int8 v8 = objc_msgSend(v2, sel_bindJSONValue_toParameterNamed_error_, v6, v7, &v14);
  swift_unknownObjectRelease();

  uint64_t v9 = (void *)v14;
  if (v8) {
    goto LABEL_7;
  }
LABEL_4:
  id v10 = v9;
  sub_1E0156BE0();

  swift_willThrow();
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
}

uint64_t sub_1E0148E48()
{
  uint64_t v2 = OUTLINED_FUNCTION_18_0();
  v3(v2);
  OUTLINED_FUNCTION_7_2();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

void sub_1E0148EA0()
{
  if (!qword_1EACE2B60)
  {
    unint64_t v0 = sub_1E0157050();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE2B60);
    }
  }
}

uint64_t sub_1E0148EF0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_7_2();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

void MSVSQLStatement.bind(functionContext:to:)(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (*(unsigned char *)(a2 + 16))
    {
      swift_unknownObjectRetain();
      sub_1E0156D40();
      OUTLINED_FUNCTION_16_0();
      objc_msgSend(v2, sel_bindFunctionContext_toParameterNamed_, a1);
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v3 = *(void *)a2;
      objc_msgSend(v2, sel_bindFunctionContext_toParameterAtIndex_, a1, v3);
    }
  }
  else
  {
    OUTLINED_FUNCTION_14_1(*(unsigned char *)(a2 + 16), (uint64_t)v5, *(void *)a2, *(void *)(a2 + 8), v6);
  }
}

uint64_t MSVSQLDatabase.StatementInterpolation.StringInterpolation.init(literalCapacity:interpolationCount:)@<X0>(uint64_t result@<X0>, int64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0xE000000000000000;
  a3[2] = MEMORY[0x1E4FBC860];
  uint64_t v3 = *MEMORY[0x1E4F778F8] + 1;
  if (__OFADD__(*MEMORY[0x1E4F778F8], 1))
  {
    __break(1u);
    goto LABEL_6;
  }
  int64_t v5 = a2 * v3;
  if ((unsigned __int128)(a2 * (__int128)v3) >> 64 != (a2 * v3) >> 63)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  BOOL v6 = __OFADD__(result, v5);
  result += v5;
  if (!v6)
  {
    MEMORY[0x1E01F1AB0](result);
    return sub_1E01482A8(a2);
  }
LABEL_7:
  __break(1u);
  return result;
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::Int_optional a1)
{
}

uint64_t sub_1E01490D8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E0149110(uint64_t a1)
{
  return sub_1E014A008(a1, (void (*)(uint64_t, uint64_t, void *))MSVSQLStatement.bind(_:to:));
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::UInt_optional a1)
{
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::Int64_optional a1)
{
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::UInt64_optional a1)
{
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::Double_optional a1)
{
  sub_1E01491A8(*(uint64_t *)&a1.is_nil, v1, (uint64_t)&unk_1F3B59060, (uint64_t)sub_1E014A060);
}

uint64_t sub_1E01491A8(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = v4;
  id v9 = (id)OUTLINED_FUNCTION_4_2();
  sub_1E0156D50();

  _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
  swift_bridgeObjectRelease();
  _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(unsigned char *)(v10 + 24) = a2 & 1;
  *(void *)(v10 + 32) = v15;
  *(void *)(v10 + 40) = v16;
  sub_1E0149F64();
  uint64_t v11 = *(void *)(*(void *)(v6 + 16) + 16);
  uint64_t result = sub_1E0149FB0(v11);
  uint64_t v13 = *(void *)(v6 + 16);
  *(void *)(v13 + 16) = v11 + 1;
  uint64_t v14 = v13 + 16 * v11;
  *(void *)(v14 + 32) = a4;
  *(void *)(v14 + 40) = v10;
  *(void *)(v6 + 16) = v13;
  return result;
}

uint64_t sub_1E0149298(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, void *))
{
  uint64_t v8 = a3 & 1;
  v10[0] = a4;
  v10[1] = a5;
  char v11 = 1;
  swift_bridgeObjectRetain();
  a6(a2, v8, v10);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::Float_optional *a1)
{
  id v5 = (id)OUTLINED_FUNCTION_4_2();
  sub_1E0156D50();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_1();
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = a1;
  *(unsigned char *)(v6 + 20) = BYTE4(a1) & 1;
  *(void *)(v6 + 24) = v2;
  *(void *)(v6 + 32) = v3;
  sub_1E0149F64();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_2();
  *(void *)(v7 + 32) = sub_1E014A0B0;
  *(void *)(v7 + 40) = v6;
  *(void *)(v1 + 16) = v8;
}

uint64_t sub_1E01493D0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  v7[0] = a3;
  v7[1] = a4;
  char v8 = 1;
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(_:to:)(a2 | ((HIDWORD(a2) & 1) << 32), (uint64_t)v7, v5);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::String_optional a1)
{
  uint64_t v2 = v1;
  object = a1.value._object;
  uint64_t countAndFlagsBits = a1.value._countAndFlagsBits;
  id v5 = (id)OUTLINED_FUNCTION_4_2();
  sub_1E0156D50();

  _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
  swift_bridgeObjectRelease();
  _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = countAndFlagsBits;
  v6[3] = object;
  v6[4] = v9;
  v6[5] = v10;
  swift_bridgeObjectRetain();
  sub_1E0149F64();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_2();
  *(void *)(v7 + 32) = sub_1E014A114;
  *(void *)(v7 + 40) = v6;
  *(void *)(v2 + 16) = v8;
}

uint64_t sub_1E0149528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v8[0] = a4;
  v8[1] = a5;
  char v9 = 1;
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(_:to:)(a2, a3, (uint64_t)v8);
  return swift_bridgeObjectRelease();
}

void MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation<A>(_:)()
{
}

{
  sub_1E01495DC();
}

void sub_1E01495DC()
{
  OUTLINED_FUNCTION_13_1();
  uint64_t v27 = v1;
  uint64_t v28 = v2;
  v26[1] = v3;
  uint64_t v4 = v0;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_1E0157050();
  OUTLINED_FUNCTION_3_1();
  uint64_t v11 = v10;
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)v26 - v15;
  uint64_t v29 = 64;
  unint64_t v30 = 0xE100000000000000;
  id v17 = (id)MSVNanoIDCreateTaggedPointer();
  sub_1E0156D50();

  _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
  swift_bridgeObjectRelease();
  uint64_t v18 = v29;
  unint64_t v19 = v30;
  _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v8, v9);
  unint64_t v20 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = v27;
  *(void *)(v21 + 16) = v6;
  *(void *)(v21 + 24) = v22;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v21 + v20, v16, v9);
  uint64_t v23 = (uint64_t *)(v21 + ((v13 + v20 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t *v23 = v18;
  v23[1] = v19;
  sub_1E0149F64();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_2();
  *(void *)(v24 + 32) = v28;
  *(void *)(v24 + 40) = v21;
  *(void *)(v4 + 16) = v25;
  OUTLINED_FUNCTION_12_1();
}

uint64_t sub_1E0149760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, void *, uint64_t, uint64_t))
{
  v12[0] = a3;
  v12[1] = a4;
  char v13 = 1;
  swift_bridgeObjectRetain();
  a7(a2, v12, a5, a6);
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)(Swift::Bool_optional a1)
{
  id v5 = (id)OUTLINED_FUNCTION_4_2();
  sub_1E0156D50();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_1();
  uint64_t v6 = swift_allocObject();
  *(Swift::Bool_optional *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = v2;
  *(void *)(v6 + 32) = v3;
  sub_1E0149F64();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_2();
  *(void *)(v7 + 32) = sub_1E014A2AC;
  *(void *)(v7 + 40) = v6;
  *(void *)(v1 + 16) = v8;
}

uint64_t sub_1E0149898(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  v6[0] = a3;
  v6[1] = a4;
  char v7 = 1;
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(_:to:)(a2, (uint64_t)v6);
  return swift_bridgeObjectRelease();
}

void MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(_:)()
{
  uint64_t v1 = v0;
  sub_1E0148C38();
  uint64_t v3 = OUTLINED_FUNCTION_1(v2);
  uint64_t v5 = v4;
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v3);
  id v8 = (id)MSVNanoIDCreateTaggedPointer();
  sub_1E0156D50();

  _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
  swift_bridgeObjectRelease();
  _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
  sub_1E0148E48();
  unint64_t v9 = (v7 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = swift_allocObject();
  sub_1E014A444();
  uint64_t v11 = (void *)(v10 + v9);
  *uint64_t v11 = 64;
  v11[1] = 0xE100000000000000;
  sub_1E0149F64();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_2();
  *(void *)(v12 + 32) = sub_1E014A384;
  *(void *)(v12 + 40) = v10;
  *(void *)(v1 + 16) = v13;
}

uint64_t sub_1E0149A80()
{
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(_:to:)();
  return swift_bridgeObjectRelease();
}

uint64_t MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(json:)()
{
  id v3 = (id)OUTLINED_FUNCTION_4_2();
  sub_1E0156D50();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_1();
  sub_1E0148E48();
  uint64_t v4 = swift_allocObject();
  sub_1E014A444();
  *(void *)(v4 + 48) = v1;
  *(void *)(v4 + 56) = v2;
  sub_1E0149F64();
  uint64_t v5 = *(void *)(*(void *)(v0 + 16) + 16);
  uint64_t result = sub_1E0149FB0(v5);
  uint64_t v7 = *(void *)(v0 + 16);
  *(void *)(v7 + 16) = v5 + 1;
  uint64_t v8 = v7 + 16 * v5;
  *(void *)(v8 + 32) = sub_1E014A49C;
  *(void *)(v8 + 40) = v4;
  *(void *)(v0 + 16) = v7;
  return result;
}

uint64_t sub_1E0149BE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6[0] = a3;
  v6[1] = a4;
  char v7 = 1;
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(json:to:)(a2, v6);
  return swift_bridgeObjectRelease();
}

void MSVSQLDatabase.StatementInterpolation.StringInterpolation.appendInterpolation(functionContext:)(uint64_t a1)
{
  id v5 = (id)OUTLINED_FUNCTION_4_2();
  sub_1E0156D50();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_1();
  uint64_t v6 = (void *)swift_allocObject();
  uint64_t v6[2] = a1;
  v6[3] = v2;
  v6[4] = v3;
  swift_unknownObjectRetain();
  sub_1E0149F64();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_2();
  *(void *)(v7 + 32) = sub_1E014A4E8;
  *(void *)(v7 + 40) = v6;
  *(void *)(v1 + 16) = v8;
}

uint64_t sub_1E0149D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6[0] = a3;
  v6[1] = a4;
  char v7 = 1;
  swift_bridgeObjectRetain();
  MSVSQLStatement.bind(functionContext:to:)(a2, (uint64_t)v6);
  return swift_bridgeObjectRelease();
}

void sub_1E0149D8C(Swift::String *a1)
{
}

uint64_t MSVSQLDatabase.StatementInterpolation.init(stringLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = sub_1E0156DC0();
  MEMORY[0x1E01F1AB0](v6);
  uint64_t v7 = sub_1E0143A7C(0, 0, 0, MEMORY[0x1E4FBC860]);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = a1;
  a3[1] = a2;
  a3[2] = v7;
  return result;
}

__n128 MSVSQLDatabase.StatementInterpolation.init(stringInterpolation:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *(void *)a1;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_1E0149E24@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return MSVSQLDatabase.StatementInterpolation.init(stringLiteral:)(*a1, a1[1], a2);
}

id MSVSQLDatabase.statement(_:)(uint64_t a1)
{
  v12[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = (void *)sub_1E0156D40();
  v12[0] = 0;
  id v4 = objc_msgSend(v1, sel_statementWithString_error_, v3, v12);

  if (v4)
  {
    uint64_t v5 = *(void *)(v2 + 16);
    if (v5)
    {
      id v6 = v12[0];
      swift_bridgeObjectRetain();
      uint64_t v7 = v2 + 40;
      do
      {
        uint64_t v8 = *(void (**)(id *))(v7 - 8);
        v12[0] = v4;
        swift_retain();
        v8(v12);
        swift_release();
        v7 += 16;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v10 = v12[0];
    }
  }
  else
  {
    id v9 = v12[0];
    sub_1E0156BE0();

    swift_willThrow();
  }
  return v4;
}

uint64_t sub_1E0149F64()
{
  uint64_t v1 = (void *)*v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v0 = (uint64_t)v1;
  if (!result)
  {
    uint64_t result = sub_1E0143A7C(result, v1[2] + 1, 1, v1);
    uint64_t *v0 = result;
  }
  return result;
}

uint64_t sub_1E0149FB0(uint64_t result)
{
  unint64_t v2 = *(void *)(*v1 + 24);
  if (result + 1 > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_1E0143A7C(v2 > 1, result + 1, 1, (void *)*v1);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_1E0149FF0(uint64_t a1)
{
  return sub_1E014A008(a1, (void (*)(uint64_t, uint64_t, void *))MSVSQLStatement.bind(_:to:));
}

uint64_t sub_1E014A008(uint64_t a1, void (*a2)(uint64_t, uint64_t, void *))
{
  return sub_1E0149298(a1, *(void *)(v2 + 16), *(unsigned char *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), a2);
}

uint64_t sub_1E014A030(uint64_t a1)
{
  return sub_1E014A008(a1, (void (*)(uint64_t, uint64_t, void *))MSVSQLStatement.bind(_:to:));
}

uint64_t sub_1E014A048(uint64_t a1)
{
  return sub_1E014A008(a1, (void (*)(uint64_t, uint64_t, void *))MSVSQLStatement.bind(_:to:));
}

uint64_t sub_1E014A060(uint64_t a1)
{
  return sub_1E014A008(a1, (void (*)(uint64_t, uint64_t, void *))MSVSQLStatement.bind(_:to:));
}

uint64_t sub_1E014A078()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E014A0B0(uint64_t a1)
{
  return sub_1E01493D0(a1, *(unsigned int *)(v1 + 16) | ((unint64_t)*(unsigned __int8 *)(v1 + 20) << 32), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1E014A0D4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1E014A114(uint64_t a1)
{
  return sub_1E0149528(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1E014A124(uint64_t a1)
{
  return sub_1E014A220(a1, (void (*)(uint64_t, void *, uint64_t, uint64_t))MSVSQLStatement.bind<A>(_:to:));
}

uint64_t objectdestroy_20Tm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_1E0157050();
  OUTLINED_FUNCTION_1(v2);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  if (!__swift_getEnumTagSinglePayload(v0 + v4, 1, v1))
  {
    OUTLINED_FUNCTION_7_2();
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v4, v1);
  }
  OUTLINED_FUNCTION_6_2();
  return MEMORY[0x1F4186498](v0, v1, v0 + v4);
}

uint64_t sub_1E014A208(uint64_t a1)
{
  return sub_1E014A220(a1, (void (*)(uint64_t, void *, uint64_t, uint64_t))MSVSQLStatement.bind<A>(_:to:));
}

uint64_t sub_1E014A220(uint64_t a1, void (*a2)(uint64_t, void *, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = sub_1E0157050();
  OUTLINED_FUNCTION_1(v7);
  OUTLINED_FUNCTION_11_1();
  return sub_1E0149760(a1, v8, v9, v10, v5, v6, a2);
}

uint64_t sub_1E014A2AC(uint64_t a1)
{
  return sub_1E0149898(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1E014A2B8()
{
  sub_1E0148C38();
  OUTLINED_FUNCTION_1(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = sub_1E0156C60();
  if (!__swift_getEnumTagSinglePayload(v0 + v3, 1, v4))
  {
    OUTLINED_FUNCTION_7_2();
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v3, v4);
  }
  OUTLINED_FUNCTION_6_2();
  return MEMORY[0x1F4186498](v0, v0 + v3, v4);
}

uint64_t sub_1E014A384()
{
  sub_1E0148C38();
  OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_11_1();
  return sub_1E0149A80();
}

uint64_t sub_1E014A3FC()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1E014A444()
{
  uint64_t v2 = OUTLINED_FUNCTION_18_0();
  v3(v2);
  OUTLINED_FUNCTION_7_2();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_1E014A49C(uint64_t a1)
{
  return sub_1E0149BE0(a1, v1 + 16, *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_1E014A4A8()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1E014A4E8(uint64_t a1)
{
  return sub_1E0149D1C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1E014A4F4()
{
  return MEMORY[0x1E4FBB220];
}

unint64_t sub_1E014A504()
{
  unint64_t result = qword_1EACE2B68;
  if (!qword_1EACE2B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2B68);
  }
  return result;
}

unint64_t sub_1E014A554()
{
  unint64_t result = qword_1EACE2B70;
  if (!qword_1EACE2B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2B70);
  }
  return result;
}

unint64_t sub_1E014A5A4()
{
  unint64_t result = qword_1EACE2B78;
  if (!qword_1EACE2B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2B78);
  }
  return result;
}

unint64_t sub_1E014A5F4()
{
  unint64_t result = qword_1EACE2B80;
  if (!qword_1EACE2B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2B80);
  }
  return result;
}

uint64_t sub_1E014A640()
{
  return MEMORY[0x1E4FBB230];
}

uint64_t sub_1E014A64C()
{
  return MEMORY[0x1E4FBB228];
}

uint64_t sub_1E014A65C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t _s9ParameterOwxx(uint64_t a1)
{
  return sub_1E014A67C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_1E014A67C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s9ParameterOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1E014A65C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s9ParameterOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1E014A65C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_1E014A67C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t _s9ParameterOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_1E014A67C(v4, v5, v6);
  return a1;
}

uint64_t _s9ParameterOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s9ParameterOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1E014A810(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1E014A818(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

void type metadata accessor for MSVSQLStatement.Parameter()
{
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for MSVSQLDatabase.StatementInterpolation()
{
}

uint64_t _s22StatementInterpolationV19StringInterpolationVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s22StatementInterpolationV19StringInterpolationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s22StatementInterpolationV19StringInterpolationVwca_0(void *a1, void *a2)
{
  OUTLINED_FUNCTION_17_0(a1, a2);
  *(void *)(v3 + 8) = *(void *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v3 + 16) = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s22StatementInterpolationV19StringInterpolationVwta_0(void *a1, void *a2)
{
  OUTLINED_FUNCTION_17_0(a1, a2);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _s22StatementInterpolationV19StringInterpolationVwet_0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1E014A9BC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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

void type metadata accessor for MSVSQLDatabase.StatementInterpolation.StringInterpolation()
{
}

void OUTLINED_FUNCTION_2_2()
{
  *(void *)(*(void *)(v0 + 16) + 16) = v1 + 1;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  uint64_t v2 = *(void *)(*(void *)(v0 + 16) + 16);
  return sub_1E0149FB0(v2);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return MSVNanoIDCreateTaggedPointer();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return sub_1E0157050();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return v0;
}

void OUTLINED_FUNCTION_14_1(char a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  a5 = a1;
  MSVSQLStatement.bindNull(to:)(&a3);
}

void *OUTLINED_FUNCTION_17_0(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return 0;
}

void OUTLINED_FUNCTION_19()
{
}

uint64_t sub_1E014ABF4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 24) = &type metadata for RepeatMode;
  *(void *)(a2 + 32) = &protocol witness table for RepeatMode;
  *(unsigned char *)a2 = result;
  return result;
}

uint64_t sub_1E014AC10@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 24) = &type metadata for ShuffleMode;
  *(void *)(a2 + 32) = &protocol witness table for ShuffleMode;
  *(unsigned char *)a2 = result;
  return result;
}

void sub_1E014AC2C(uint64_t a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for MRContentItemMediaType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemMediaType;
  *a2 = a1;
}

void sub_1E014AC68(uint64_t a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for MRContentItemMediaSubType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemMediaSubType;
  *a2 = a1;
}

void sub_1E014ACA4(uint64_t a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for MRContentItemEpisodeType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemEpisodeType;
  *a2 = a1;
}

void sub_1E014ACE0(uint64_t a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for MRContentItemPlaylistType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemPlaylistType;
  *a2 = a1;
}

void sub_1E014AD1C(uint64_t a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for MRContentItemRadioStationType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemRadioStationType;
  *a2 = a1;
}

uint64_t sub_1E014AD58@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 24) = &type metadata for SystemAppPlaybackQueueInsertionPosition;
  *(void *)(a2 + 32) = &protocol witness table for SystemAppPlaybackQueueInsertionPosition;
  *(unsigned char *)a2 = result;
  return result;
}

void sub_1E014AD74(int a1@<W0>, uint64_t a2@<X8>)
{
  type metadata accessor for MRMediaRemoteCommandHandlerStatus(0);
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = &protocol witness table for MRMediaRemoteCommandHandlerStatus;
  *(_DWORD *)a2 = a1;
}

void sub_1E014ADB0(int a1@<W0>, uint64_t a2@<X8>)
{
  type metadata accessor for MRQueueEndAction(0);
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = &protocol witness table for MRQueueEndAction;
  *(_DWORD *)a2 = a1;
}

void sub_1E014ADEC(uint64_t a1@<X0>, void *a2@<X8>)
{
  type metadata accessor for MRContentItemMetadataAudioRouteType(0);
  a2[3] = v4;
  a2[4] = &protocol witness table for MRContentItemMetadataAudioRouteType;
  *a2 = a1;
}

void sub_1E014AE28(int a1@<W0>, uint64_t a2@<X8>)
{
  type metadata accessor for MRDisabledReason(0);
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = &protocol witness table for MRDisabledReason;
  *(_DWORD *)a2 = a1;
}

void sub_1E014AE64(int a1@<W0>, uint64_t a2@<X8>)
{
  type metadata accessor for MRPlaybackState(0);
  *(void *)(a2 + 24) = v4;
  *(void *)(a2 + 32) = &protocol witness table for MRPlaybackState;
  *(_DWORD *)a2 = a1;
}

uint64_t NamedEnum._namedEnum.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  a3[3] = a1;
  a3[4] = a2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a3);
  char v6 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16);
  return v6(boxed_opaque_existential_1, v3, a1);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

id MRPlayerPath.init(_:)(void *a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v3 = a1;
  id v4 = objc_msgSend(v3, sel_origin);
  id v5 = objc_msgSend(v3, sel_client);
  id v6 = objc_msgSend(v3, sel_player);
  id v7 = objc_msgSend(v2, sel_initWithOrigin_client_player_, v4, v5, v6);

  return v7;
}

uint64_t static MRPlayerPath.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t MRPlayerPath.Error.hash(into:)()
{
  return sub_1E0157320();
}

uint64_t MRPlayerPath.Error.hashValue.getter()
{
  return sub_1E0157330();
}

uint64_t sub_1E014B0A4()
{
  return 1;
}

uint64_t sub_1E014B0AC()
{
  return MRPlayerPath.Error.hashValue.getter();
}

uint64_t sub_1E014B0C4()
{
  return MRPlayerPath.Error.hash(into:)();
}

uint64_t MRPlayerPath.resolve()()
{
  *(void *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_10_3((uint64_t)sub_1E014B0F8);
}

uint64_t sub_1E014B0F8()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = swift_task_alloc();
  v0[4] = v2;
  *(void *)(v2 + 16) = v1;
  id v3 = (void *)swift_task_alloc();
  v0[5] = v3;
  sub_1E0155C00(0, &qword_1EACE2B98);
  *id v3 = v0;
  v3[1] = sub_1E014B204;
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x1F4188160]();
}

uint64_t sub_1E014B204()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_0();
  *uint64_t v5 = v4;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x1F4188298](v6, v7, v8);
}

uint64_t sub_1E014B2F0()
{
  OUTLINED_FUNCTION_7_0();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_1E014B350(uint64_t a1)
{
  sub_1E0155F54(0, (uint64_t)&unk_1EACE2CF0);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)aBlock - v5;
  uint64_t v7 = sub_1E0156CB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0155C00(0, &qword_1EBA35BB8);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4FBCB48], v7);
  uint64_t v11 = (void *)sub_1E0157000();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  unint64_t v12 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v13 + v12, v6, v3);
  aBlock[4] = sub_1E0156060;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E014B6E4;
  aBlock[3] = &block_descriptor_395;
  uint64_t v14 = _Block_copy(aBlock);
  swift_release();
  MRMediaRemoteNowPlayingResolvePlayerPath();
  _Block_release(v14);
}

void sub_1E014B5F4(uint64_t a1)
{
}

uint64_t sub_1E014B5FC(void *a1)
{
  if (a1)
  {
    sub_1E0155C00(0, &qword_1EACE2B98);
    MRPlayerPath.init(_:)(a1);
    sub_1E0155F54(0, (uint64_t)&unk_1EACE2CF0);
    return sub_1E0156EF0();
  }
  else
  {
    sub_1E01560D8();
    swift_allocError();
    sub_1E0155F54(0, (uint64_t)&unk_1EACE2CF0);
    return sub_1E0156EE0();
  }
}

void sub_1E014B6E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t static MROrigin.available.getter()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  sub_1E0153FF4(0, (uint64_t)&unk_1EACE2BA8);
  *uint64_t v1 = v0;
  v1[1] = sub_1E014B84C;
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x1F41880D8]();
}

uint64_t sub_1E014B84C()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_4_0();
  void *v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

void sub_1E014B914(uint64_t a1)
{
  sub_1E0155E1C();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = sub_1E0156CB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0155C00(0, &qword_1EBA35BB8);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4FBCB48], v6);
  uint64_t v10 = (void *)sub_1E0157000();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  unint64_t v11 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v12 + v11, (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  aBlock[4] = sub_1E0155F10;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E014BC1C;
  aBlock[3] = &block_descriptor_389;
  uint64_t v13 = _Block_copy(aBlock);
  swift_release();
  MRMediaRemoteGetAvailableOrigins();
  _Block_release(v13);
}

uint64_t sub_1E014BB98(uint64_t a1)
{
  if (a1)
  {
    sub_1E0155C00(0, &qword_1EACE2BB0);
    sub_1E0156E50();
  }
  sub_1E0155E1C();
  return sub_1E0156EF0();
}

uint64_t MediaRemoteCommand.name.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (uint64_t (*)(void))dlsym((void *)0xFFFFFFFFFFFFFFFELL, "MPCRemoteCommandDescriptionCopy");
  id v3 = (id)v2(dword_1E0159A3C[v1]);
  sub_1E0156D50();
  OUTLINED_FUNCTION_32();
  return OUTLINED_FUNCTION_21();
}

uint64_t MediaRemoteCommand.rawValue.getter()
{
  return qword_1E0159B60[*v0];
}

uint64_t sub_1E014BC98()
{
  return sub_1E0157320();
}

uint64_t sub_1E014BCC0()
{
  return sub_1E0157330();
}

uint64_t sub_1E014BD04()
{
  return sub_1E0157330();
}

uint64_t MediaRemoteCommand.send(_:sendOptions:to:)(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)(v4 + 64) = a2;
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = a3;
  *(unsigned char *)(v4 + 68) = *v3;
  return OUTLINED_FUNCTION_10_3((uint64_t)sub_1E014BD68);
}

uint64_t sub_1E014BD68()
{
  char v1 = *(unsigned char *)(v0 + 68);
  int v2 = *(_DWORD *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 40) = v5;
  *(unsigned char *)(v5 + 16) = v1;
  *(void *)(v5 + 24) = v4;
  *(void *)(v5 + 32) = v3;
  *(_DWORD *)(v5 + 40) = v2;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v6;
  sub_1E0155C00(0, &qword_1EACE2BC0);
  *uint64_t v6 = v0;
  v6[1] = sub_1E014BE8C;
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x1F4188160]();
}

uint64_t sub_1E014BE8C()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  OUTLINED_FUNCTION_4_0();
  *uint64_t v5 = v4;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  OUTLINED_FUNCTION_3_0();
  return MEMORY[0x1F4188298](v6, v7, v8);
}

uint64_t sub_1E014BF74()
{
  OUTLINED_FUNCTION_7_0();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_1E014BFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v23 = a5;
  uint64_t v21 = a1;
  uint64_t v22 = a4;
  sub_1E0155F54(0, (uint64_t)&unk_1EACE2CC8);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v20 - v9;
  uint64_t v11 = sub_1E0156CB0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E014C2E8(a3);
  uint64_t v15 = (void *)sub_1E0156CF0();
  swift_bridgeObjectRelease();
  sub_1E0155C00(0, &qword_1EBA35BB8);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4FBCB48], v11);
  uint64_t v16 = (void *)sub_1E0157000();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v21, v7);
  unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v18 + v17, v10, v7);
  aBlock[4] = sub_1E0155C58;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1E014BC1C;
  aBlock[3] = &block_descriptor_0;
  unint64_t v19 = _Block_copy(aBlock);
  swift_release();
  MRMediaRemoteSendCommandToPlayerWithResult();
  _Block_release(v19);
}

void sub_1E014C2D8(uint64_t a1)
{
  sub_1E014BFD4(a1, *(unsigned __int8 *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(_DWORD *)(v1 + 40));
}

uint64_t sub_1E014C2E8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1E0155D18(0, &qword_1EACE2CD8, MEMORY[0x1E4FBB960], MEMORY[0x1E4FBB968], MEMORY[0x1E4FBBD58]);
    uint64_t v2 = sub_1E0157220();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
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
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_1E0155D74(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1E0146AB0(v38, v37);
    sub_1E0155DD0();
    swift_dynamicCast();
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1E0146AB0(&v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1E0146AB0(v36, v37);
    sub_1E0146AB0(v37, &v33);
    uint64_t result = sub_1E01570D0();
    uint64_t v18 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v6 + 8 * (v19 >> 6))) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v6 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v6 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t v26 = *(void *)(v2 + 48) + 40 * v21;
    *(_OWORD *)uint64_t v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(void *)(v26 + 32) = v31;
    uint64_t result = (uint64_t)sub_1E0146AB0(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v21));
    ++*(void *)(v2 + 16);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v28 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_1E0155BF8();
    return v2;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1E014C700(void *a1)
{
  if (a1)
  {
    sub_1E0155F54(0, (uint64_t)&unk_1EACE2CC8);
    id v2 = a1;
    return sub_1E0156EF0();
  }
  else
  {
    sub_1E0155CCC();
    swift_allocError();
    sub_1E0155F54(0, (uint64_t)&unk_1EACE2CC8);
    return sub_1E0156EE0();
  }
}

void sub_1E014C7C0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

MediaFoundation::MediaRemoteCommand_optional __swiftcall MediaRemoteCommand.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 0;
  char v3 = 54;
  switch(rawValue)
  {
    case 0:
      goto LABEL_66;
    case 1:
      char v2 = 1;
      goto LABEL_66;
    case 2:
      char v2 = 2;
      goto LABEL_66;
    case 3:
      char v2 = 3;
      goto LABEL_66;
    case 4:
      char v2 = 4;
      goto LABEL_66;
    case 5:
      char v2 = 5;
      goto LABEL_66;
    case 6:
      char v2 = 6;
      goto LABEL_66;
    case 7:
      char v2 = 7;
      goto LABEL_66;
    case 8:
      char v2 = 8;
      goto LABEL_66;
    case 9:
      char v2 = 9;
      goto LABEL_66;
    case 10:
      char v2 = 10;
      goto LABEL_66;
    case 11:
      char v2 = 11;
      goto LABEL_66;
    case 12:
    case 13:
    case 14:
    case 15:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 141:
      goto LABEL_8;
    case 16:
      char v2 = 12;
      goto LABEL_66;
    case 17:
      char v2 = 13;
      goto LABEL_66;
    case 18:
      char v2 = 14;
      goto LABEL_66;
    case 19:
      char v2 = 15;
      goto LABEL_66;
    case 20:
      char v2 = 16;
      goto LABEL_66;
    case 21:
      char v2 = 17;
      goto LABEL_66;
    case 22:
      char v2 = 18;
      goto LABEL_66;
    case 23:
      char v2 = 19;
      goto LABEL_66;
    case 24:
      char v2 = 20;
      goto LABEL_66;
    case 25:
      char v2 = 21;
      goto LABEL_66;
    case 26:
      char v2 = 22;
      goto LABEL_66;
    case 27:
      char v2 = 23;
      goto LABEL_66;
    case 28:
      char v2 = 24;
      goto LABEL_66;
    case 100:
      char v2 = 25;
      goto LABEL_66;
    case 101:
      char v2 = 26;
      goto LABEL_66;
    case 102:
      char v2 = 27;
      goto LABEL_66;
    case 103:
      char v2 = 28;
      goto LABEL_66;
    case 104:
      char v2 = 29;
      goto LABEL_66;
    case 105:
      char v2 = 30;
      goto LABEL_66;
    case 106:
      char v3 = 63;
      break;
    case 107:
      char v3 = 64;
      break;
    case 108:
      char v3 = 65;
      break;
    case 109:
      char v2 = 31;
      goto LABEL_66;
    case 110:
      char v2 = 32;
      goto LABEL_66;
    case 111:
      char v2 = 33;
      goto LABEL_66;
    case 112:
      char v2 = 34;
      goto LABEL_66;
    case 113:
      char v2 = 35;
      goto LABEL_66;
    case 114:
      char v2 = 36;
      goto LABEL_66;
    case 115:
      char v2 = 37;
      goto LABEL_66;
    case 116:
      char v2 = 38;
      goto LABEL_66;
    case 117:
      char v2 = 39;
      goto LABEL_66;
    case 118:
      char v2 = 40;
      goto LABEL_66;
    case 119:
      char v2 = 41;
      goto LABEL_66;
    case 120:
      char v2 = 42;
      goto LABEL_66;
    case 121:
      char v2 = 43;
      goto LABEL_66;
    case 122:
      char v2 = 44;
      goto LABEL_66;
    case 123:
      char v2 = 45;
      goto LABEL_66;
    case 124:
      char v2 = 46;
      goto LABEL_66;
    case 125:
      char v2 = 47;
      goto LABEL_66;
    case 126:
      char v2 = 48;
      goto LABEL_66;
    case 127:
      char v3 = 66;
      break;
    case 128:
      char v3 = 67;
      break;
    case 129:
      char v2 = 49;
      goto LABEL_66;
    case 130:
      char v2 = 50;
      goto LABEL_66;
    case 131:
      char v2 = 51;
      goto LABEL_66;
    case 132:
      char v2 = 52;
      goto LABEL_66;
    case 133:
      char v2 = 53;
LABEL_66:
      char v3 = v2;
      break;
    case 134:
      break;
    case 135:
      char v3 = 55;
      break;
    case 136:
      char v3 = 56;
      break;
    case 137:
      char v3 = 57;
      break;
    case 138:
      char v3 = 58;
      break;
    case 139:
      char v3 = 59;
      break;
    case 140:
      char v3 = 60;
      break;
    case 142:
      char v3 = 61;
      break;
    case 143:
      char v3 = 62;
      break;
    default:
      switch(rawValue)
      {
        case 25001:
          char v3 = 68;
          break;
        case 25010:
          char v3 = 69;
          break;
        case 25020:
          char v3 = 70;
          break;
        case 99990:
          char v3 = 71;
          break;
        default:
LABEL_8:
          char v3 = 72;
          break;
      }
      break;
  }
  *uint64_t v1 = v3;
  return (MediaFoundation::MediaRemoteCommand_optional)rawValue;
}

uint64_t sub_1E014CD14()
{
  return sub_1E014CD1C();
}

uint64_t sub_1E014CD1C()
{
  return sub_1E0157330();
}

uint64_t sub_1E014CD70()
{
  return sub_1E0157330();
}

uint64_t sub_1E014CDB0()
{
  return sub_1E014CDE0();
}

uint64_t sub_1E014CDB8()
{
  return sub_1E0157320();
}

uint64_t sub_1E014CDE0()
{
  return sub_1E0157320();
}

uint64_t sub_1E014CE14()
{
  return sub_1E014CE1C();
}

uint64_t sub_1E014CE1C()
{
  return sub_1E0157330();
}

uint64_t sub_1E014CE6C()
{
  return sub_1E0157330();
}

MediaFoundation::MediaRemoteCommand_optional sub_1E014CEB0(Swift::Int *a1)
{
  return MediaRemoteCommand.init(rawValue:)(*a1);
}

uint64_t sub_1E014CEB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MediaRemoteCommand.rawValue.getter();
  *a1 = result;
  return result;
}

BOOL sub_1E014CEE0(char *a1, char *a2)
{
  return sub_1E014CEFC(*a1, *a2);
}

BOOL sub_1E014CEEC(char a1, char a2)
{
  return a1 == a2;
}

BOOL sub_1E014CEFC(char a1, char a2)
{
  return qword_1E0159B60[a1] == qword_1E0159B60[a2];
}

uint64_t MRMediaRemoteCommandHandlerStatus.name.getter(uint64_t a1)
{
  return sub_1E01507FC(a1, MEMORY[0x1E4F76F78]);
}

uint64_t sub_1E014CF38()
{
  return MRMediaRemoteCommandHandlerStatus.name.getter(*v0);
}

void sub_1E014CF40(uint64_t a1@<X8>)
{
  sub_1E014AD74(*v1, a1);
}

uint64_t RepeatMode.name.getter()
{
  uint64_t result = 0x6E776F6E6B6E55;
  switch(*v0)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_19_0();
      break;
    case 2:
      uint64_t result = 6647375;
      break;
    case 3:
      uint64_t result = 7105601;
      break;
    default:
      return result;
  }
  return result;
}

MediaFoundation::RepeatMode_optional __swiftcall RepeatMode.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (MediaFoundation::RepeatMode_optional)rawValue;
}

uint64_t RepeatMode.rawValue.getter()
{
  return *v0;
}

BOOL sub_1E014CFD0(char *a1, char *a2)
{
  return sub_1E014CEEC(*a1, *a2);
}

uint64_t sub_1E014CFDC()
{
  return sub_1E014CD70();
}

uint64_t sub_1E014CFF8()
{
  return sub_1E014CDB8();
}

uint64_t sub_1E014D000()
{
  return sub_1E014CE6C();
}

MediaFoundation::RepeatMode_optional sub_1E014D01C(Swift::Int *a1)
{
  return RepeatMode.init(rawValue:)(*a1);
}

uint64_t sub_1E014D024@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = RepeatMode.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1E014D050@<X0>(uint64_t a1@<X8>)
{
  return sub_1E014ABF4(*v1, a1);
}

uint64_t ShuffleMode.name.getter()
{
  uint64_t result = 0x6E776F6E6B6E55;
  switch(*v0)
  {
    case 1:
      uint64_t result = OUTLINED_FUNCTION_19_0();
      break;
    case 2:
      uint64_t result = 0x736D75626C41;
      break;
    case 3:
      uint64_t result = 0x73676E6F53;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E014D0D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E014AC10(*v1, a1);
}

uint64_t MRQueueEndAction.name.getter(int a1)
{
  uint64_t result = 0x7261656C43;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 1701736270;
      break;
    case 2:
      uint64_t result = 0x7465736552;
      break;
    case 3:
      uint64_t result = 0x79616C706F747541;
      break;
    default:
      sub_1E0157250();
      OUTLINED_FUNCTION_8_3();
      swift_bridgeObjectRelease();
      uint64_t result = 0x206E776F6E6B6E55;
      break;
  }
  return result;
}

uint64_t sub_1E014D1CC()
{
  return MRQueueEndAction.name.getter(*v0);
}

void sub_1E014D1D4(uint64_t a1@<X8>)
{
  sub_1E014ADB0(*v1, a1);
}

unint64_t MRCommandInfo._options.getter()
{
  uint64_t v1 = sub_1E0152C10(v0, (SEL *)&selRef_options);
  if (!v1 || (unint64_t v2 = sub_1E014D2A0(v1), swift_bridgeObjectRelease(), !v2))
  {
    unint64_t v2 = sub_1E0156D10();
    swift_bridgeObjectRelease();
  }
  unint64_t v7 = v2;
  unint64_t result = *MEMORY[0x1E4F77248];
  if (*MEMORY[0x1E4F77248])
  {
    uint64_t v4 = sub_1E0156D50();
    sub_1E01523E8(v4, v5, v6);
    swift_bridgeObjectRelease();
    sub_1E0152554((uint64_t)v6);
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_1E014D2A0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1E0155D18(0, &qword_1EACE2CB0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB1B0], MEMORY[0x1E4FBBD58]);
    unint64_t v2 = (void *)sub_1E0157220();
  }
  else
  {
    unint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  sub_1E01523B0(a1, v41);
  uint64_t v3 = v41[0];
  uint64_t v4 = v41[3];
  int64_t v29 = (unint64_t)(v41[2] + 64) >> 6;
  uint64_t v30 = v41[1];
  unint64_t v5 = v41[4];
  uint64_t v6 = &__src[40];
  unint64_t v7 = &__dst[40];
  int64_t v8 = &v35;
  unint64_t v9 = &v37;
  unint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v31 = (v5 - 1) & v5;
  int64_t v32 = v4;
  for (unint64_t i = __clz(__rbit64(v5)) | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    sub_1E0155ADC(*(void *)(v3 + 48) + 40 * i, (uint64_t)__src);
    sub_1E0155D74(*(void *)(v3 + 56) + 32 * i, (uint64_t)v6);
    memcpy(__dst, __src, sizeof(__dst));
    sub_1E0155ADC((uint64_t)__dst, (uint64_t)v34);
    if (!swift_dynamicCast())
    {
      sub_1E0155B38((uint64_t)__dst);
      swift_bridgeObjectRelease();
      sub_1E0155BF8();
      swift_release();
      return 0;
    }
    sub_1E0155D74((uint64_t)v7, (uint64_t)v34);
    sub_1E0155B38((uint64_t)__dst);
    sub_1E0146AB0(v34, v8);
    long long v36 = v33;
    sub_1E0146AB0(v8, v9);
    long long v16 = v36;
    sub_1E0146AB0(v9, v38);
    sub_1E0146AB0(v38, &v36);
    unint64_t result = sub_1E015218C(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      unint64_t v19 = v9;
      unint64_t v20 = v8;
      unint64_t v21 = v7;
      uint64_t v22 = v3;
      unint64_t v23 = v6;
      BOOL v24 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      _OWORD *v24 = v16;
      uint64_t v6 = v23;
      uint64_t v3 = v22;
      unint64_t v7 = v21;
      int64_t v8 = v20;
      unint64_t v9 = v19;
      uint64_t v25 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      unint64_t result = (unint64_t)sub_1E0146AB0(&v36, v25);
      goto LABEL_28;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_1E0146AB0(&v36, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v26 = v2[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_34;
    }
    v2[2] = v28;
LABEL_28:
    unint64_t v5 = v31;
    uint64_t v4 = v32;
    if (v31) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_35;
    }
    if (v12 >= v29) {
      goto LABEL_31;
    }
    unint64_t v13 = *(void *)(v30 + 8 * v12);
    int64_t v14 = v4 + 1;
    if (!v13)
    {
      int64_t v14 = v4 + 2;
      if (v4 + 2 >= v29) {
        goto LABEL_31;
      }
      unint64_t v13 = *(void *)(v30 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v4 + 3;
        if (v4 + 3 >= v29) {
          goto LABEL_31;
        }
        unint64_t v13 = *(void *)(v30 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v4 + 4;
          if (v4 + 4 >= v29) {
            goto LABEL_31;
          }
          unint64_t v13 = *(void *)(v30 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v4 + 5;
            if (v4 + 5 >= v29) {
              goto LABEL_31;
            }
            unint64_t v13 = *(void *)(v30 + 8 * v14);
            if (!v13)
            {
              int64_t v15 = v4 + 6;
              while (v15 < v29)
              {
                unint64_t v13 = *(void *)(v30 + 8 * v15++);
                if (v13)
                {
                  int64_t v14 = v15 - 1;
                  goto LABEL_21;
                }
              }
LABEL_31:
              sub_1E0155BF8();
              return (unint64_t)v2;
            }
          }
        }
      }
    }
LABEL_21:
    uint64_t v31 = (v13 - 1) & v13;
    int64_t v32 = v14;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

unint64_t MRCommandInfo.disabledReason.getter()
{
  unsigned __int8 v1 = objc_msgSend(v0, sel_isEnabled);
  if (v1) {
    goto LABEL_9;
  }
  uint64_t v2 = sub_1E0152C10(v0, (SEL *)&selRef_options);
  if (!v2) {
    goto LABEL_9;
  }
  unint64_t v3 = sub_1E014D2A0(v2);
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_9;
  }
  unint64_t result = *MEMORY[0x1E4F77248];
  if (*MEMORY[0x1E4F77248])
  {
    uint64_t v5 = sub_1E0156D50();
    sub_1E014D770(v5, v6, v3, &v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v10)
    {
      if (swift_dynamicCast())
      {
        uint64_t v7 = v8;
LABEL_10:
        LOBYTE(v9) = v1;
        return v7 | ((unint64_t)v1 << 32);
      }
    }
    else
    {
      sub_1E0152554((uint64_t)&v9);
    }
LABEL_9:
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

double sub_1E014D770@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1E015218C(a1, a2), (v7 & 1) != 0))
  {
    sub_1E0155D74(*(void *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

double sub_1E014D7C0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_1E0152148(a1), (v6 & 1) != 0))
  {
    sub_1E0155D74(*(void *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t MRContentItemMetadataAudioRouteType.name.getter(uint64_t a1)
{
  uint64_t result = 0x6E776F6E6B6E55;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x5320656369766544;
      break;
    case 2:
      uint64_t result = 0x74754F20656E694CLL;
      break;
    case 3:
    case 4:
      uint64_t result = 0x6E6F687064616548;
      break;
    case 5:
      uint64_t result = 0x72656B61657053;
      break;
    case 6:
      unsigned int v3 = 541217621;
      goto LABEL_9;
    case 7:
      unsigned int v3 = 544366915;
LABEL_9:
      uint64_t result = v3 | 0x6964754100000000;
      break;
    case 8:
      uint64_t result = 1229800520;
      break;
    case 9:
      uint64_t result = 0x79616C50726941;
      break;
    default:
      sub_1E0157250();
      OUTLINED_FUNCTION_8_3();
      swift_bridgeObjectRelease();
      uint64_t result = 0x206E776F6E6B6E55;
      break;
  }
  return result;
}

uint64_t sub_1E014D99C()
{
  return MRContentItemMetadataAudioRouteType.name.getter(*v0);
}

void sub_1E014D9A4(void *a1@<X8>)
{
  sub_1E014ADEC(*v1, a1);
}

uint64_t MRContentItem._identifier.getter()
{
  uint64_t result = sub_1E01525D8(v0);
  if (!v2) {
    return 0x5F4C4C554E5FLL;
  }
  return result;
}

id MRContentItem._metadata.getter()
{
  id result = objc_msgSend(v0, sel_metadata);
  if (!result)
  {
    id v2 = objc_allocWithZone(MEMORY[0x1E4F77008]);
    return objc_msgSend(v2, sel_init);
  }
  return result;
}

uint64_t MRContentItem.playPerformance.getter()
{
  id v0 = MRContentItem._metadata.getter();
  uint64_t v1 = sub_1E015263C(v0);
  if (!v1)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    goto LABEL_6;
  }
  uint64_t v2 = v1;
  sub_1E01570F0();
  sub_1E014D7C0((uint64_t)v7, v2, &v8);
  sub_1E01526B4((uint64_t)v7);
  swift_bridgeObjectRelease();
  if (!*((void *)&v9 + 1))
  {
LABEL_6:
    sub_1E0152554((uint64_t)&v8);
    return 0;
  }
  sub_1E0155C00(0, &qword_1EACE2BC8);
  if (swift_dynamicCast())
  {
    id v3 = v7[0];
    objc_msgSend(v7[0], sel_doubleValue);
    uint64_t v5 = v4;

    return v5;
  }
  return 0;
}

uint64_t MRContentItem.title.getter()
{
  id v0 = MRContentItem._metadata.getter();
  uint64_t result = sub_1E0152784(v0, (SEL *)&selRef_localizedTitle);
  if (!v2)
  {
    id v3 = MRContentItem._metadata.getter();
    uint64_t result = sub_1E0152784(v3, (SEL *)&selRef_title);
    if (!v4) {
      return 0x9480E29480E2;
    }
  }
  return result;
}

uint64_t MRContentItem.subtitle.getter()
{
  id v0 = MRContentItem._metadata.getter();
  uint64_t v1 = sub_1E0152784(v0, (SEL *)&selRef_subtitle);
  if (v2) {
    return v1;
  }
  sub_1E0152708();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E0157C60;
  id v5 = MRContentItem._metadata.getter();
  uint64_t v6 = sub_1E0152784(v5, (SEL *)&selRef_trackArtistName);
  uint64_t v8 = v7;
  *(void *)(inited + 32) = v6;
  *(void *)(inited + 40) = v7;
  id v9 = MRContentItem._metadata.getter();
  uint64_t v11 = sub_1E0152784(v9, (SEL *)&selRef_albumName);
  uint64_t v12 = v10;
  *(void *)(inited + 48) = v11;
  *(void *)(inited + 56) = v10;
  if (v8)
  {
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_1E0143BA0(0, 1, 1, MEMORY[0x1E4FBC860]);
    unint64_t v14 = *((void *)v13 + 2);
    unint64_t v15 = *((void *)v13 + 3);
    unint64_t v16 = v14 + 1;
    if (v14 >= v15 >> 1)
    {
      unint64_t v28 = v14 + 1;
      uint64_t v22 = v13;
      unint64_t v23 = *((void *)v13 + 2);
      BOOL v24 = sub_1E0143BA0((char *)(v15 > 1), v14 + 1, 1, v22);
      unint64_t v14 = v23;
      unint64_t v16 = v28;
      unint64_t v13 = v24;
    }
    *((void *)v13 + 2) = v16;
    unint64_t v17 = &v13[16 * v14];
    *((void *)v17 + 4) = v6;
    *((void *)v17 + 5) = v8;
    if (!v12) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  unint64_t v13 = (char *)MEMORY[0x1E4FBC860];
  if (v10)
  {
LABEL_9:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v13 = sub_1E0143BA0(0, *((void *)v13 + 2) + 1, 1, v13);
    }
    unint64_t v19 = *((void *)v13 + 2);
    unint64_t v18 = *((void *)v13 + 3);
    if (v19 >= v18 >> 1)
    {
      BOOL v25 = OUTLINED_FUNCTION_30(v18);
      unint64_t v13 = sub_1E0143BA0((char *)v25, v26, v27, v13);
    }
    *((void *)v13 + 2) = v19 + 1;
    unint64_t v20 = &v13[16 * v19];
    *((void *)v20 + 4) = v11;
    *((void *)v20 + 5) = v12;
  }
LABEL_14:
  swift_release();
  if (*((void *)v13 + 2))
  {
    sub_1E01540A0(0, &qword_1EACE2A30, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
    sub_1E01527E4();
    uint64_t v3 = sub_1E0156D20();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0x9380E29380E2;
  }
  return v3;
}

BOOL static MRContentItem.MetadataOutline.BoolType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MRContentItem.MetadataOutline.BoolType.hash(into:)()
{
  return sub_1E0157320();
}

uint64_t MRContentItem.MetadataOutline.BoolType.hashValue.getter()
{
  return sub_1E0157330();
}

uint64_t MRContentItem.MetadataOutline.hasValue(in:)(void *a1)
{
  sub_1E0152858(0, (uint64_t)&qword_1EACE2B58);
  MEMORY[0x1F4188790](v3 - 8);
  id v5 = (char *)&v36 - v4;
  sub_1E0152858(0, (uint64_t)&unk_1EACE2BE0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v36 - v7;
  uint64_t v9 = *v1;
  unint64_t v10 = v1[5];
  switch(v10 >> 60)
  {
    case 1uLL:
      uint64_t v43 = (uint64_t)a1;
      swift_retain();
      id v20 = a1;
      swift_getAtKeyPath();

      swift_release();
      goto LABEL_15;
    case 2uLL:
      uint64_t v37 = (uint64_t)a1;
      id v21 = a1;
      swift_retain();
      swift_getAtKeyPath();

      swift_release();
      uint64_t v22 = sub_1E0156C00();
      unint64_t v12 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v22) != 1;
      unint64_t v23 = (uint64_t *)&unk_1EACE2BE0;
      uint64_t v24 = (uint64_t)v8;
      goto LABEL_12;
    case 3uLL:
      uint64_t v37 = (uint64_t)a1;
      id v25 = a1;
      swift_retain();
      swift_getAtKeyPath();

      swift_release();
      uint64_t v26 = sub_1E0156C60();
      unint64_t v12 = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v26) != 1;
      unint64_t v23 = &qword_1EACE2B58;
      uint64_t v24 = (uint64_t)v5;
LABEL_12:
      sub_1E0152B74(v24, (uint64_t)v23);
      return v12;
    case 4uLL:
    case 5uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      uint64_t v37 = (uint64_t)a1;
      id v11 = a1;
      swift_retain();
      OUTLINED_FUNCTION_25();
      swift_getAtKeyPath();

      goto LABEL_3;
    case 6uLL:
    case 0xBuLL:
      uint64_t v37 = (uint64_t)a1;
      id v27 = a1;
      swift_retain();
      OUTLINED_FUNCTION_25();
      swift_getAtKeyPath();

LABEL_3:
      swift_release();
      return v43;
    case 7uLL:
      uint64_t v43 = (uint64_t)a1;
      id v28 = a1;
      OUTLINED_FUNCTION_11_2();
      swift_getAtKeyPath();
      OUTLINED_FUNCTION_16_1();

LABEL_15:
      unint64_t v12 = v38 != 0;
      if (v38) {
        swift_bridgeObjectRelease();
      }
      return v12;
    case 0xCuLL:
      uint64_t v37 = (uint64_t)a1;
      id v29 = a1;
      OUTLINED_FUNCTION_11_2();
      OUTLINED_FUNCTION_25();
      swift_getAtKeyPath();
      OUTLINED_FUNCTION_16_1();

      uint64_t v30 = v43;
      if (v43) {
        goto LABEL_18;
      }
      return 0;
    case 0xDuLL:
      if (v1[2] | v1[1] | v9 | v1[3] | v1[4]) {
        BOOL v32 = 0;
      }
      else {
        BOOL v32 = v10 == 0xD000000000000000;
      }
      if (v32)
      {
        id v34 = MRContentItem._metadata.getter();
        unint64_t v12 = (unint64_t)objc_msgSend(v34, sel_hasArtworkAvailable);

        return v12;
      }
      id v33 = MRContentItem._metadata.getter();
      uint64_t v30 = sub_1E01528A8(v33);
      if (v30)
      {
LABEL_18:
        uint64_t v31 = *(void *)(v30 + 16);
        swift_bridgeObjectRelease();
        return v31 != 0;
      }
      return 0;
    default:
      uint64_t v13 = *(void *)(*(void *)(v9 + 32) + 16);
      if (!v13) {
        return 0;
      }
      uint64_t v36 = swift_bridgeObjectRetain();
      unint64_t v14 = (uint64_t *)(v36 + 40);
      break;
  }
  do
  {
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = v14[2];
    uint64_t v18 = v14[3];
    unint64_t v19 = v14[4];
    uint64_t v37 = *(v14 - 1);
    uint64_t v38 = v15;
    uint64_t v39 = v16;
    uint64_t v40 = v17;
    uint64_t v41 = v18;
    unint64_t v42 = v19;
    sub_1E015293C(v37, v15, v16, v17, v18, v19);
    if (MRContentItem.MetadataOutline.hasValue(in:)(a1))
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_17_1();
      return 1;
    }
    v14 += 6;
    OUTLINED_FUNCTION_17_1();
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  return 0;
}

double sub_1E014E2D4()
{
  sub_1E01540A0(0, &qword_1EACE2CA8, (uint64_t)&type metadata for MRContentItem.MetadataOutline, MEMORY[0x1E4FBBE00]);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1E0157C70;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = 0xD000000000000000;
  uint64_t v1 = (void *)swift_allocObject();
  v1[2] = 0x696669746E656449;
  v1[3] = 0xEB00000000737265;
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1E0157C80;
  uint64_t KeyPath = swift_getKeyPath();
  *(_OWORD *)(v2 + 32) = xmmword_1E0157C90;
  *(void *)(v2 + 48) = KeyPath;
  *(_OWORD *)(v2 + 56) = 0u;
  *(void *)(v2 + 72) = 0x1000000000000000;
  uint64_t v4 = swift_getKeyPath();
  *(_OWORD *)(v2 + 80) = xmmword_1E0157CA0;
  *(void *)(v2 + 96) = v4;
  *(_OWORD *)(v2 + 104) = 0u;
  *(void *)(v2 + 120) = 0x1000000000000000;
  uint64_t v5 = swift_getKeyPath();
  *(_OWORD *)(v2 + 128) = xmmword_1E0157CB0;
  *(void *)(v2 + 144) = v5;
  *(_OWORD *)(v2 + 152) = 0u;
  *(void *)(v2 + 168) = 0x1000000000000000;
  uint64_t v6 = swift_getKeyPath();
  *(_OWORD *)(v2 + 176) = xmmword_1E0157CC0;
  *(void *)(v2 + 192) = v6;
  *(_OWORD *)(v2 + 200) = 0u;
  *(void *)(v2 + 216) = 0x1000000000000000;
  uint64_t v7 = swift_getKeyPath();
  uint64_t v8 = swift_getKeyPath();
  *(_OWORD *)(v2 + 224) = xmmword_1E0157CD0;
  *(void *)(v2 + 240) = v7;
  *(void *)(v2 + 248) = v8;
  *(_OWORD *)(v2 + 256) = xmmword_1E0157CE0;
  uint64_t v9 = swift_getKeyPath();
  uint64_t v10 = swift_getKeyPath();
  *(_OWORD *)(v2 + 272) = xmmword_1E0157CF0;
  *(void *)(v2 + 288) = v9;
  *(void *)(v2 + 296) = v10;
  *(_OWORD *)(v2 + 304) = xmmword_1E0157CE0;
  uint64_t v11 = swift_getKeyPath();
  *(_OWORD *)(v2 + 320) = xmmword_1E0157D00;
  *(void *)(v2 + 336) = v11;
  *(_OWORD *)(v2 + 344) = 0u;
  *(void *)(v2 + 360) = 0x1000000000000000;
  uint64_t v12 = swift_getKeyPath();
  *(_OWORD *)(v2 + 368) = xmmword_1E0157D10;
  *(void *)(v2 + 384) = v12;
  *(_OWORD *)(v2 + 392) = 0u;
  *(void *)(v2 + 408) = 0x1000000000000000;
  uint64_t v13 = swift_getKeyPath();
  uint64_t v14 = swift_getKeyPath();
  *(_OWORD *)(v2 + 416) = xmmword_1E0157D20;
  *(void *)(v2 + 432) = v13;
  *(void *)(v2 + 440) = v14;
  *(_OWORD *)(v2 + 448) = xmmword_1E0157CE0;
  v1[4] = v2;
  *(void *)(v0 + 80) = v1;
  *(_OWORD *)(v0 + 88) = 0u;
  *(_OWORD *)(v0 + 104) = 0u;
  *(void *)(v0 + 120) = 0;
  uint64_t v15 = (void *)swift_allocObject();
  void v15[2] = 0x6B63616279616C50;
  v15[3] = 0xE800000000000000;
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1E0157D30;
  uint64_t v17 = swift_getKeyPath();
  uint64_t v18 = swift_getKeyPath();
  *(_OWORD *)(v16 + 32) = xmmword_1E0157D40;
  *(void *)(v16 + 48) = 2;
  *(void *)(v16 + 56) = v17;
  *(void *)(v16 + 64) = v18;
  *(void *)(v16 + 72) = 0xB000000000000000;
  uint64_t v19 = swift_getKeyPath();
  uint64_t v20 = swift_getKeyPath();
  *(_OWORD *)(v16 + 80) = xmmword_1E0157D50;
  *(void *)(v16 + 96) = 2;
  *(void *)(v16 + 104) = v19;
  *(void *)(v16 + 112) = v20;
  *(void *)(v16 + 120) = 0xB000000000000000;
  uint64_t v21 = swift_getKeyPath();
  uint64_t v22 = swift_getKeyPath();
  uint64_t v23 = swift_getKeyPath();
  *(_OWORD *)(v16 + 128) = xmmword_1E0157D60;
  *(void *)(v16 + 144) = v21;
  *(void *)(v16 + 152) = v22;
  *(void *)(v16 + 160) = v23;
  *(void *)(v16 + 168) = 0xA000000000000000;
  uint64_t v24 = swift_getKeyPath();
  uint64_t v25 = swift_getKeyPath();
  *(_OWORD *)(v16 + 176) = xmmword_1E0157D70;
  *(void *)(v16 + 192) = v24;
  *(void *)(v16 + 200) = v25;
  *(_OWORD *)(v16 + 208) = xmmword_1E0157D80;
  uint64_t v26 = swift_getKeyPath();
  uint64_t v27 = swift_getKeyPath();
  *(_OWORD *)(v16 + 224) = xmmword_1E0157D90;
  *(_OWORD *)(v16 + 240) = xmmword_1E0157DA0;
  *(void *)(v16 + 256) = v26;
  *(void *)(v16 + 264) = v27 | 0x6000000000000000;
  uint64_t v28 = swift_getKeyPath();
  uint64_t v29 = swift_getKeyPath();
  *(_OWORD *)(v16 + 272) = xmmword_1E0157DB0;
  *(_OWORD *)(v16 + 288) = xmmword_1E0157DA0;
  *(void *)(v16 + 304) = v28;
  *(void *)(v16 + 312) = v29 | 0x6000000000000000;
  uint64_t v30 = swift_getKeyPath();
  uint64_t v31 = swift_getKeyPath();
  *(_OWORD *)(v16 + 320) = xmmword_1E0157DC0;
  *(void *)(v16 + 336) = v30;
  *(void *)(v16 + 344) = v31;
  *(_OWORD *)(v16 + 352) = xmmword_1E0157D80;
  v15[4] = v16;
  *(void *)(v0 + 128) = v15;
  *(_OWORD *)(v0 + 136) = 0u;
  *(_OWORD *)(v0 + 152) = 0u;
  *(void *)(v0 + 168) = 0;
  BOOL v32 = (void *)swift_allocObject();
  v32[2] = 0x617461646174654DLL;
  v32[3] = 0xE800000000000000;
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1E0157DD0;
  uint64_t v34 = swift_getKeyPath();
  *(_OWORD *)(v33 + 32) = xmmword_1E0157DE0;
  *(void *)(v33 + 48) = v34;
  *(_OWORD *)(v33 + 56) = 0u;
  *(void *)(v33 + 72) = 0x1000000000000000;
  uint64_t v35 = swift_getKeyPath();
  *(_OWORD *)(v33 + 80) = xmmword_1E0157DF0;
  *(void *)(v33 + 96) = v35;
  *(_OWORD *)(v33 + 104) = 0u;
  *(void *)(v33 + 120) = 0x1000000000000000;
  uint64_t v36 = swift_getKeyPath();
  uint64_t v37 = swift_getKeyPath();
  *(_OWORD *)(v33 + 128) = xmmword_1E0157E00;
  *(void *)(v33 + 144) = v36;
  *(void *)(v33 + 152) = v37;
  *(_OWORD *)(v33 + 160) = xmmword_1E0157E10;
  uint64_t v38 = swift_getKeyPath();
  uint64_t v39 = swift_getKeyPath();
  *(_OWORD *)(v33 + 176) = xmmword_1E0157E20;
  *(void *)(v33 + 192) = v38;
  *(void *)(v33 + 200) = v39;
  *(_OWORD *)(v33 + 208) = xmmword_1E0157E10;
  uint64_t v40 = swift_getKeyPath();
  uint64_t v41 = swift_getKeyPath();
  *(_OWORD *)(v33 + 224) = xmmword_1E0157E30;
  *(void *)(v33 + 240) = 2;
  *(void *)(v33 + 248) = v40;
  *(void *)(v33 + 256) = v41;
  *(void *)(v33 + 264) = 0xB000000000000000;
  uint64_t v42 = swift_getKeyPath();
  uint64_t v43 = swift_getKeyPath();
  *(_OWORD *)(v33 + 272) = xmmword_1E0157E40;
  *(void *)(v33 + 288) = 2;
  *(void *)(v33 + 296) = v42;
  *(void *)(v33 + 304) = v43;
  *(void *)(v33 + 312) = 0xB000000000000000;
  uint64_t v44 = swift_getKeyPath();
  *(_OWORD *)(v33 + 320) = xmmword_1E0157E50;
  *(void *)(v33 + 336) = v44;
  *(_OWORD *)(v33 + 344) = 0u;
  *(void *)(v33 + 360) = 0x3000000000000000;
  uint64_t v45 = swift_getKeyPath();
  *(_OWORD *)(v33 + 368) = xmmword_1E0157E60;
  *(void *)(v33 + 384) = v45;
  *(_OWORD *)(v33 + 392) = 0u;
  *(void *)(v33 + 408) = 0x1000000000000000;
  uint64_t v46 = swift_getKeyPath();
  *(_OWORD *)(v33 + 416) = xmmword_1E0157E70;
  *(void *)(v33 + 432) = v46;
  *(_OWORD *)(v33 + 440) = 0u;
  *(void *)(v33 + 456) = 0x1000000000000000;
  uint64_t v47 = swift_getKeyPath();
  *(_OWORD *)(v33 + 464) = xmmword_1E0157E80;
  *(void *)(v33 + 480) = v47;
  *(_OWORD *)(v33 + 488) = 0u;
  *(void *)(v33 + 504) = 0x1000000000000000;
  uint64_t v48 = swift_getKeyPath();
  *(_OWORD *)(v33 + 512) = xmmword_1E0157E90;
  *(void *)(v33 + 528) = v48;
  *(_OWORD *)(v33 + 536) = 0u;
  *(void *)(v33 + 552) = 0x1000000000000000;
  uint64_t v49 = swift_getKeyPath();
  *(_OWORD *)(v33 + 560) = xmmword_1E0157EA0;
  *(void *)(v33 + 576) = v49;
  *(_OWORD *)(v33 + 584) = 0u;
  *(void *)(v33 + 600) = 0x1000000000000000;
  uint64_t v50 = swift_getKeyPath();
  uint64_t v51 = swift_getKeyPath();
  *(_OWORD *)(v33 + 608) = xmmword_1E0157EB0;
  *(void *)(v33 + 624) = v50;
  *(void *)(v33 + 632) = v51;
  *(_OWORD *)(v33 + 640) = xmmword_1E0157EC0;
  uint64_t v52 = swift_getKeyPath();
  uint64_t v53 = swift_getKeyPath();
  *(_OWORD *)(v33 + 656) = xmmword_1E0157ED0;
  *(void *)(v33 + 672) = v52;
  *(void *)(v33 + 680) = v53;
  *(_OWORD *)(v33 + 688) = xmmword_1E0157EC0;
  uint64_t v54 = swift_getKeyPath();
  uint64_t v55 = swift_getKeyPath();
  *(_OWORD *)(v33 + 704) = xmmword_1E0157EE0;
  *(void *)(v33 + 720) = v54;
  *(void *)(v33 + 728) = v55;
  *(_OWORD *)(v33 + 736) = xmmword_1E0157EC0;
  uint64_t v56 = swift_getKeyPath();
  uint64_t v57 = swift_getKeyPath();
  *(_OWORD *)(v33 + 752) = xmmword_1E0157EF0;
  *(void *)(v33 + 768) = v56;
  *(void *)(v33 + 776) = v57;
  *(_OWORD *)(v33 + 784) = xmmword_1E0157EC0;
  uint64_t v58 = swift_getKeyPath();
  *(_OWORD *)(v33 + 800) = xmmword_1E0157F00;
  *(void *)(v33 + 816) = v58;
  *(_OWORD *)(v33 + 824) = 0u;
  *(void *)(v33 + 840) = 0x1000000000000000;
  uint64_t v59 = swift_getKeyPath();
  uint64_t v60 = swift_getKeyPath();
  *(_OWORD *)(v33 + 848) = xmmword_1E0157F10;
  *(void *)(v33 + 864) = v59;
  *(void *)(v33 + 872) = v60;
  *(_OWORD *)(v33 + 880) = xmmword_1E0157E10;
  uint64_t v61 = swift_getKeyPath();
  *(_OWORD *)(v33 + 896) = xmmword_1E0157F20;
  *(void *)(v33 + 912) = v61;
  *(void *)(v33 + 920) = 0;
  *(void *)(v33 + 928) = 0;
  *(void *)(v33 + 936) = 0x1000000000000000;
  uint64_t v62 = swift_getKeyPath();
  uint64_t v63 = swift_getKeyPath();
  *(_OWORD *)(v33 + 944) = xmmword_1E0157F30;
  *(void *)(v33 + 960) = v62;
  *(void *)(v33 + 968) = v63;
  *(_OWORD *)(v33 + 976) = xmmword_1E0157EC0;
  uint64_t v64 = swift_getKeyPath();
  uint64_t v65 = swift_getKeyPath();
  *(_OWORD *)(v33 + 992) = xmmword_1E0157F40;
  *(void *)(v33 + 1008) = v64;
  *(void *)(v33 + 1016) = v65;
  *(_OWORD *)(v33 + 1024) = xmmword_1E0157EC0;
  v32[4] = v33;
  *(void *)(v0 + 176) = v32;
  *(_OWORD *)(v0 + 184) = 0u;
  *(_OWORD *)(v0 + 200) = 0u;
  *(void *)(v0 + 216) = 0;
  uint64_t v66 = (void *)swift_allocObject();
  v66[2] = 0x7069636974726150;
  v66[3] = 0xEB00000000746E61;
  uint64_t v67 = swift_allocObject();
  *(_OWORD *)(v67 + 16) = xmmword_1E0157C60;
  uint64_t v68 = swift_getKeyPath();
  *(_OWORD *)(v67 + 32) = xmmword_1E0157F50;
  *(void *)(v67 + 48) = v68;
  *(void *)(v67 + 56) = 0;
  *(void *)(v67 + 64) = 0;
  *(void *)(v67 + 72) = 0x1000000000000000;
  uint64_t v69 = swift_getKeyPath();
  *(_OWORD *)(v67 + 80) = xmmword_1E0157F60;
  *(void *)(v67 + 96) = v69;
  *(void *)(v67 + 104) = 0;
  *(void *)(v67 + 112) = 0;
  *(void *)(v67 + 120) = 0x1000000000000000;
  v66[4] = v67;
  *(void *)(v0 + 224) = v66;
  *(_OWORD *)(v0 + 232) = 0u;
  *(_OWORD *)(v0 + 248) = 0u;
  *(void *)(v0 + 264) = 0;
  uint64_t v70 = (void *)swift_allocObject();
  v70[2] = 1868983881;
  v70[3] = 0xE400000000000000;
  uint64_t v71 = swift_allocObject();
  *(_OWORD *)(v71 + 16) = xmmword_1E0157850;
  *(void *)(v71 + 32) = swift_getKeyPath();
  *(_OWORD *)(v71 + 40) = 0u;
  *(_OWORD *)(v71 + 56) = 0u;
  *(void *)(v71 + 72) = 0x7000000000000000;
  v70[4] = v71;
  *(void *)(v0 + 272) = v70;
  *(_OWORD *)(v0 + 280) = 0u;
  *(_OWORD *)(v0 + 296) = 0u;
  *(void *)(v0 + 312) = 0;
  unint64_t v72 = (void *)swift_allocObject();
  v72[2] = 0x656E6961746E6F43;
  v72[3] = 0xE900000000000072;
  uint64_t v73 = swift_allocObject();
  *(_OWORD *)(v73 + 16) = xmmword_1E0157F70;
  uint64_t v74 = (void *)swift_allocObject();
  v74[2] = 0x696669746E656449;
  v74[3] = 0xEB00000000737265;
  uint64_t v75 = swift_allocObject();
  *(_OWORD *)(v75 + 16) = xmmword_1E0157F70;
  uint64_t v76 = swift_getKeyPath();
  *(_OWORD *)(v75 + 32) = xmmword_1E0157F80;
  *(void *)(v75 + 48) = v76;
  *(void *)(v75 + 56) = 0;
  *(void *)(v75 + 64) = 0;
  *(void *)(v75 + 72) = 0x1000000000000000;
  uint64_t v77 = swift_getKeyPath();
  *(_OWORD *)(v75 + 80) = xmmword_1E0157F90;
  *(void *)(v75 + 96) = v77;
  *(void *)(v75 + 104) = 0;
  *(void *)(v75 + 112) = 0;
  *(void *)(v75 + 120) = 0x1000000000000000;
  uint64_t v78 = swift_getKeyPath();
  uint64_t v79 = swift_getKeyPath();
  *(_OWORD *)(v75 + 128) = xmmword_1E0157F90;
  *(void *)(v75 + 144) = v78;
  *(void *)(v75 + 152) = v79;
  *(_OWORD *)(v75 + 160) = xmmword_1E0157CE0;
  v74[4] = v75;
  *(void *)(v73 + 32) = v74;
  *(_OWORD *)(v73 + 40) = 0u;
  *(_OWORD *)(v73 + 56) = 0u;
  *(void *)(v73 + 72) = 0;
  uint64_t v80 = (void *)swift_allocObject();
  v80[2] = 0x617461646174654DLL;
  v80[3] = 0xE800000000000000;
  uint64_t v81 = swift_allocObject();
  *(_OWORD *)(v81 + 16) = xmmword_1E0157FA0;
  uint64_t v82 = swift_getKeyPath();
  *(_OWORD *)(v81 + 32) = xmmword_1E0157FB0;
  *(void *)(v81 + 48) = v82;
  *(void *)(v81 + 56) = 0;
  *(void *)(v81 + 64) = 0;
  *(void *)(v81 + 72) = 0x1000000000000000;
  uint64_t v83 = swift_getKeyPath();
  *(_OWORD *)(v81 + 80) = xmmword_1E0157FC0;
  *(void *)(v81 + 96) = v83;
  *(void *)(v81 + 104) = 0;
  *(void *)(v81 + 112) = 0;
  *(void *)(v81 + 120) = 0x1000000000000000;
  uint64_t v84 = swift_getKeyPath();
  *(_OWORD *)(v81 + 128) = xmmword_1E0157FD0;
  *(void *)(v81 + 144) = v84;
  *(void *)(v81 + 152) = 0;
  *(void *)(v81 + 160) = 0;
  *(void *)(v81 + 168) = 0x1000000000000000;
  uint64_t v85 = swift_getKeyPath();
  uint64_t v86 = swift_getKeyPath();
  *(_OWORD *)(v81 + 176) = xmmword_1E0157FE0;
  *(void *)(v81 + 192) = v85;
  *(void *)(v81 + 200) = v86;
  *(_OWORD *)(v81 + 208) = xmmword_1E0157E10;
  uint64_t v87 = swift_getKeyPath();
  uint64_t v88 = swift_getKeyPath();
  *(void *)(v81 + 224) = 0xD000000000000012;
  *(void *)(v81 + 232) = 0x80000001E015A220;
  *(void *)(v81 + 240) = v87;
  *(void *)(v81 + 248) = v88;
  *(_OWORD *)(v81 + 256) = xmmword_1E0157E10;
  uint64_t v89 = swift_getKeyPath();
  *(_OWORD *)(v81 + 272) = xmmword_1E0157FF0;
  *(void *)(v81 + 288) = v89;
  *(void *)(v81 + 296) = 0;
  *(void *)(v81 + 304) = 0;
  *(void *)(v81 + 312) = 0x1000000000000000;
  v80[4] = v81;
  *(void *)(v73 + 80) = v80;
  *(_OWORD *)(v73 + 88) = 0u;
  *(_OWORD *)(v73 + 104) = 0u;
  *(void *)(v73 + 120) = 0;
  uint64_t v90 = (void *)swift_allocObject();
  v90[2] = 1868983881;
  v90[3] = 0xE400000000000000;
  uint64_t v91 = swift_allocObject();
  *(_OWORD *)(v91 + 16) = xmmword_1E0157850;
  *(void *)(v91 + 32) = swift_getKeyPath();
  *(_OWORD *)(v91 + 40) = 0u;
  *(_OWORD *)(v91 + 56) = 0u;
  *(void *)(v91 + 72) = 0xC000000000000000;
  v90[4] = v91;
  *(void *)(v73 + 128) = v90;
  *(_OWORD *)(v73 + 136) = 0u;
  *(_OWORD *)(v73 + 152) = 0u;
  *(void *)(v73 + 168) = 0;
  v72[4] = v73;
  *(void *)(v0 + 320) = v72;
  *(_OWORD *)(v0 + 328) = 0u;
  *(_OWORD *)(v0 + 344) = 0u;
  *(void *)(v0 + 360) = 0;
  uint64_t v92 = (void *)swift_allocObject();
  v92[2] = 0x737465737341;
  v92[3] = 0xE600000000000000;
  uint64_t v93 = swift_allocObject();
  *(_OWORD *)(v93 + 16) = xmmword_1E0157C60;
  uint64_t v94 = swift_getKeyPath();
  *(_OWORD *)(v93 + 32) = xmmword_1E0158000;
  *(void *)(v93 + 48) = v94;
  *(void *)(v93 + 56) = 0;
  *(void *)(v93 + 64) = 0;
  *(void *)(v93 + 72) = 0x2000000000000000;
  uint64_t v95 = swift_getKeyPath();
  *(_OWORD *)(v93 + 80) = xmmword_1E0158010;
  *(void *)(v93 + 96) = v95;
  *(void *)(v93 + 104) = 0;
  *(void *)(v93 + 112) = 0;
  *(void *)(v93 + 120) = 0x2000000000000000;
  v92[4] = v93;
  *(void *)(v0 + 368) = v92;
  *(_OWORD *)(v0 + 376) = 0u;
  *(_OWORD *)(v0 + 392) = 0u;
  *(void *)(v0 + 408) = 0;
  uint64_t v96 = (void *)swift_allocObject();
  v96[2] = 0x6B726F77747241;
  v96[3] = 0xE700000000000000;
  uint64_t v97 = swift_allocObject();
  *(_OWORD *)(v97 + 16) = xmmword_1E0158020;
  uint64_t v98 = swift_getKeyPath();
  *(_OWORD *)(v97 + 32) = xmmword_1E0157F50;
  *(void *)(v97 + 48) = v98;
  *(void *)(v97 + 56) = 0;
  *(void *)(v97 + 64) = 0;
  *(void *)(v97 + 72) = 0x1000000000000000;
  uint64_t v99 = swift_getKeyPath();
  *(_OWORD *)(v97 + 80) = xmmword_1E0158030;
  *(void *)(v97 + 96) = v99;
  *(void *)(v97 + 104) = 0;
  *(void *)(v97 + 112) = 0;
  *(void *)(v97 + 120) = 0x2000000000000000;
  uint64_t v100 = swift_getKeyPath();
  *(_OWORD *)(v97 + 128) = xmmword_1E0158040;
  *(void *)(v97 + 144) = v100;
  *(void *)(v97 + 152) = 0;
  *(void *)(v97 + 160) = 0;
  *(void *)(v97 + 168) = 0x2000000000000000;
  uint64_t v101 = swift_getKeyPath();
  *(_OWORD *)(v97 + 176) = xmmword_1E0158050;
  *(void *)(v97 + 192) = v101;
  *(void *)(v97 + 200) = 0;
  *(void *)(v97 + 208) = 0;
  *(_OWORD *)(v97 + 216) = xmmword_1E0158060;
  *(_OWORD *)(v97 + 232) = 0u;
  *(_OWORD *)(v97 + 248) = 0u;
  *(void *)(v97 + 264) = 0xD000000000000000;
  v96[4] = v97;
  *(void *)(v0 + 416) = v96;
  *(_OWORD *)(v0 + 424) = 0u;
  *(_OWORD *)(v0 + 440) = 0u;
  *(void *)(v0 + 456) = 0;
  uint64_t v102 = (void *)swift_allocObject();
  v102[2] = 0x666E492072657355;
  v102[3] = 0xE90000000000006FLL;
  uint64_t v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = xmmword_1E0157850;
  *(void *)(v103 + 32) = swift_getKeyPath();
  *(_OWORD *)(v103 + 40) = 0u;
  *(_OWORD *)(v103 + 56) = 0u;
  *(void *)(v103 + 72) = 0xC000000000000000;
  v102[4] = v103;
  *(void *)(v0 + 464) = v102;
  *(_OWORD *)(v0 + 472) = 0u;
  *(_OWORD *)(v0 + 488) = 0u;
  *(void *)(v0 + 504) = 0;
  uint64_t v104 = (void *)swift_allocObject();
  v104[2] = 0xD000000000000010;
  v104[3] = 0x80000001E015A240;
  uint64_t v105 = swift_allocObject();
  *(_OWORD *)(v105 + 16) = xmmword_1E0157850;
  *(void *)(v105 + 32) = swift_getKeyPath();
  double result = 0.0;
  *(_OWORD *)(v105 + 40) = 0u;
  *(_OWORD *)(v105 + 56) = 0u;
  *(void *)(v105 + 72) = 0xC000000000000000;
  v104[4] = v105;
  *(void *)(v0 + 512) = v104;
  *(_OWORD *)(v0 + 520) = 0u;
  *(_OWORD *)(v0 + 536) = 0u;
  *(void *)(v0 + 552) = 0;
  qword_1EACE2B88 = v0;
  return result;
}

id sub_1E014F2FC@<X0>(void *a1@<X8>)
{
  id result = MRContentItem._metadata.getter();
  *a1 = result;
  return result;
}

void sub_1E014F328(uint64_t a1, void **a2)
{
  sub_1E0152858(0, (uint64_t)&qword_1EACE2B58);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v10 - v5;
  sub_1E0155A70(a1, (uint64_t)&v10 - v5, (uint64_t)&qword_1EACE2B58);
  uint64_t v7 = *a2;
  uint64_t v8 = sub_1E0156C60();
  uint64_t v9 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8) != 1)
  {
    uint64_t v9 = (void *)sub_1E0156C50();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setReleaseDate_, v9);
}

void sub_1E014F454(uint64_t a1, void **a2)
{
  sub_1E0152858(0, (uint64_t)&unk_1EACE2BE0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v10 - v5;
  sub_1E0155A70(a1, (uint64_t)&v10 - v5, (uint64_t)&unk_1EACE2BE0);
  uint64_t v7 = *a2;
  uint64_t v8 = sub_1E0156C00();
  uint64_t v9 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8) != 1)
  {
    uint64_t v9 = (void *)sub_1E0156BF0();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setAssetURL_, v9);
}

void sub_1E014F580(uint64_t a1, void **a2)
{
  sub_1E0152858(0, (uint64_t)&unk_1EACE2BE0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v10 - v5;
  sub_1E0155A70(a1, (uint64_t)&v10 - v5, (uint64_t)&unk_1EACE2BE0);
  uint64_t v7 = *a2;
  uint64_t v8 = sub_1E0156C00();
  uint64_t v9 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8) != 1)
  {
    uint64_t v9 = (void *)sub_1E0156BF0();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setLyricsURL_, v9);
}

void sub_1E014F6AC(uint64_t a1, void **a2)
{
  sub_1E0152858(0, (uint64_t)&unk_1EACE2BE0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v10 - v5;
  sub_1E0155A70(a1, (uint64_t)&v10 - v5, (uint64_t)&unk_1EACE2BE0);
  uint64_t v7 = *a2;
  uint64_t v8 = sub_1E0156C00();
  uint64_t v9 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8) != 1)
  {
    uint64_t v9 = (void *)sub_1E0156BF0();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setArtworkURL_, v9);
}

uint64_t sub_1E014F7D8(void **a1, uint64_t a2, uint64_t a3, const char **a4, void (*a5)(void), uint64_t (*a6)(void))
{
  id v9 = OUTLINED_FUNCTION_20_0(a1, a2, a3, a4);
  if (v9)
  {
    uint64_t v10 = v9;
    a5();

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1;
  }
  uint64_t v12 = a6(0);
  return __swift_storeEnumTagSinglePayload(v6, v11, 1, v12);
}

void sub_1E014F860(uint64_t a1, void **a2)
{
  sub_1E0152858(0, (uint64_t)&unk_1EACE2BE0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v10 - v5;
  sub_1E0155A70(a1, (uint64_t)&v10 - v5, (uint64_t)&unk_1EACE2BE0);
  uint64_t v7 = *a2;
  uint64_t v8 = sub_1E0156C00();
  id v9 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8) != 1)
  {
    id v9 = (void *)sub_1E0156BF0();
    (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setArtworkFileURL_, v9);
}

void sub_1E014F98C(void **a1, uint64_t a2, uint64_t a3, const char **a4)
{
  id v5 = OUTLINED_FUNCTION_20_0(a1, a2, a3, a4);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_1E0156D50();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  *uint64_t v4 = v7;
  v4[1] = v9;
}

void sub_1E014F9E4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v7 = sub_1E0156D40();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  [v6 *a5];
}

void sub_1E014FA54(void **a1, uint64_t a2, uint64_t a3, const char **a4)
{
  id v5 = OUTLINED_FUNCTION_20_0(a1, a2, a3, a4);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = sub_1E0156D00();
  }
  else
  {
    uint64_t v7 = 0;
  }
  *uint64_t v4 = v7;
}

void sub_1E014FAC0(void *a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  if (*a1) {
    uint64_t v7 = sub_1E0156CF0();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  [v6 *a5];
}

uint64_t static MRContentItem.metadataOutline.getter()
{
  if (qword_1EACE2A10 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

char *MRContentItemMetadata.identifiers.getter()
{
  sub_1E0152708();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1E0157C60;
  uint64_t v1 = MRContentItemMetadata.subscriptionAdamID.getter();
  if (!v2) {
    uint64_t v1 = MRContentItemMetadata.adamID.getter();
  }
  *(void *)(inited + 32) = v1;
  *(void *)(inited + 40) = v2;
  uint64_t v3 = MRContentItemMetadata.univeralLibraryID.getter();
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 56) = v4;
  uint64_t v5 = *(void *)(inited + 40);
  if (!v5)
  {
    uint64_t v12 = v3;
    uint64_t v11 = v4;
    uint64_t v7 = (char *)MEMORY[0x1E4FBC860];
    if (!v4) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  uint64_t v6 = *(void *)(inited + 32);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1E0143BA0(0, 1, 1, MEMORY[0x1E4FBC860]);
  unint64_t v9 = *((void *)v7 + 2);
  unint64_t v8 = *((void *)v7 + 3);
  if (v9 >= v8 >> 1) {
    uint64_t v7 = sub_1E0143BA0((char *)(v8 > 1), v9 + 1, 1, v7);
  }
  *((void *)v7 + 2) = v9 + 1;
  uint64_t v10 = &v7[16 * v9];
  *((void *)v10 + 4) = v6;
  *((void *)v10 + 5) = v5;
  uint64_t v12 = *(void *)(inited + 48);
  uint64_t v11 = *(void *)(inited + 56);
  if (v11)
  {
LABEL_9:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v7 = sub_1E0143BA0(0, *((void *)v7 + 2) + 1, 1, v7);
    }
    unint64_t v14 = *((void *)v7 + 2);
    unint64_t v13 = *((void *)v7 + 3);
    if (v14 >= v13 >> 1)
    {
      BOOL v17 = OUTLINED_FUNCTION_30(v13);
      uint64_t v7 = sub_1E0143BA0((char *)v17, v18, v19, v7);
    }
    *((void *)v7 + 2) = v14 + 1;
    uint64_t v15 = &v7[16 * v14];
    *((void *)v15 + 4) = v12;
    *((void *)v15 + 5) = v11;
  }
LABEL_14:
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t MRContentItemMetadata.subscriptionAdamID.getter()
{
  return sub_1E014FD20((SEL *)&selRef_iTunesStoreSubscriptionIdentifier);
}

uint64_t MRContentItemMetadata.adamID.getter()
{
  return sub_1E014FD20((SEL *)&selRef_iTunesStoreIdentifier);
}

uint64_t sub_1E014FD20(SEL *a1)
{
  if ((uint64_t)[v1 *a1] < 1) {
    return 0;
  }
  [v1 *a1];
  sub_1E0152BC4();
  return sub_1E01570A0();
}

uint64_t MRContentItemMetadata.univeralLibraryID.getter()
{
  uint64_t v1 = sub_1E0152C10(v0, (SEL *)&selRef_deviceSpecificUserInfo);
  if (!v1)
  {
    long long v5 = 0u;
    long long v6 = 0u;
    goto LABEL_8;
  }
  uint64_t v2 = v1;
  *(void *)&long long v5 = 1684630645;
  *((void *)&v5 + 1) = 0xE400000000000000;
  sub_1E01570F0();
  sub_1E014D7C0((uint64_t)&v4, v2, &v5);
  sub_1E01526B4((uint64_t)&v4);
  swift_bridgeObjectRelease();
  if (!*((void *)&v6 + 1))
  {
LABEL_8:
    sub_1E0152554((uint64_t)&v5);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t MRContentItemMetadata.allAudioFormats.getter()
{
  uint64_t v1 = MEMORY[0x1E4FBC860];
  uint64_t v4 = MEMORY[0x1E4FBC860];
  unint64_t v2 = sub_1E0152C78(v0);
  if (v2)
  {
    sub_1E014FEBC(v2);
    return v4;
  }
  return v1;
}

uint64_t sub_1E014FEBC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1E0157210();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1E0157210();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v5 = v4 + v3;
  if (__OFADD__(v4, v3))
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  uint64_t v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_16;
    }
    uint64_t v8 = 1;
  }
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1E0157210();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v10 <= v5) {
    uint64_t v10 = v5;
  }
  swift_bridgeObjectRetain();
  uint64_t v11 = MEMORY[0x1E01F1E30](v8, v10, 1, v6);
  swift_bridgeObjectRelease();
  *uint64_t v1 = v11;
  uint64_t v9 = v11 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
  uint64_t v12 = *(void *)(v9 + 16);
  uint64_t v13 = (*(void *)(v9 + 24) >> 1) - v12;
  sub_1E0153E30(v9 + 8 * v12 + 32, v13, a1);
  if (v14 < v3)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    sub_1E0153FF4(0, (uint64_t)&unk_1EACE2C90);
    goto LABEL_21;
  }
  uint64_t v15 = v14;
  if (v14 >= 1)
  {
    uint64_t v16 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v17 = __OFADD__(v16, v14);
    uint64_t v18 = v16 + v14;
    if (v17)
    {
      __break(1u);
      return MEMORY[0x1F4183E98]();
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v18;
  }
  swift_bridgeObjectRelease();
  if (v15 == v13) {
    goto LABEL_28;
  }
LABEL_21:
  return MEMORY[0x1F4183E98]();
}

uint64_t MRContentItemMediaType.name.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 1701736270;
    case 2:
      uint64_t v1 = 1701079382;
      return v1 & 0xFFFF0000FFFFFFFFLL | 0x6F00000000;
    case 1:
      uint64_t v1 = 1768191297;
      return v1 & 0xFFFF0000FFFFFFFFLL | 0x6F00000000;
  }
  OUTLINED_FUNCTION_12_2();
  sub_1E0157250();
  OUTLINED_FUNCTION_8_3();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1E0150154()
{
  return MRContentItemMediaType.name.getter(*v0);
}

void sub_1E015015C(void *a1@<X8>)
{
  sub_1E014AC2C(*v1, a1);
}

unint64_t MRContentItemEpisodeType.name.getter(uint64_t a1)
{
  unint64_t result = 0x6E776F6E6B6E55;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x65646F73697045;
      break;
    case 2:
      unint64_t result = OUTLINED_FUNCTION_29();
      break;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0x6569767265746E49;
      break;
    case 5:
      unint64_t result = 0x72656C69617254;
      break;
    case 6:
      unint64_t result = 0x6172747845;
      break;
    default:
      sub_1E0157250();
      OUTLINED_FUNCTION_8_3();
      swift_bridgeObjectRelease();
      unint64_t result = 0x206E776F6E6B6E55;
      break;
  }
  return result;
}

unint64_t sub_1E01502B0()
{
  return MRContentItemEpisodeType.name.getter(*v0);
}

void sub_1E01502B8(void *a1@<X8>)
{
  sub_1E014ACA4(*v1, a1);
}

uint64_t MRContentItemPlaylistType.name.getter(uint64_t a1)
{
  uint64_t result = 0x72616C75676552;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x7375696E6547;
      break;
    case 2:
      uint64_t result = 0x7472616D53;
      break;
    case 3:
      uint64_t result = 0x7265646C6F46;
      break;
    case 4:
      uint64_t result = 0x4D207375696E6547;
      break;
    default:
      sub_1E0157250();
      OUTLINED_FUNCTION_8_3();
      swift_bridgeObjectRelease();
      uint64_t result = 0x206E776F6E6B6E55;
      break;
  }
  return result;
}

uint64_t sub_1E01503D8()
{
  return MRContentItemPlaylistType.name.getter(*v0);
}

void sub_1E01503E0(void *a1@<X8>)
{
  sub_1E014ACE0(*v1, a1);
}

uint64_t MRContentItemRadioStationType.name.getter(uint64_t a1)
{
  if (!a1) {
    return 0x65727574616546;
  }
  if (a1 == 1) {
    return 0x6C616E6F73726550;
  }
  OUTLINED_FUNCTION_12_2();
  sub_1E0157250();
  OUTLINED_FUNCTION_8_3();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_1E0150478()
{
  return MRContentItemRadioStationType.name.getter(*v0);
}

void sub_1E0150480(void *a1@<X8>)
{
  sub_1E014AD1C(*v1, a1);
}

uint64_t MRContentItemMediaSubType.name.getter(uint64_t a1)
{
  uint64_t result = 1701736270;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x636973754DLL;
      break;
    case 2:
      uint64_t result = 0x776F6853205654;
      break;
    case 3:
      uint64_t result = 0x6569766F4DLL;
      break;
    case 4:
      uint64_t result = 0x74736163646F50;
      break;
    case 5:
      uint64_t result = 0x6F6F626F69647541;
      break;
    case 6:
      uint64_t result = 0x552073656E755469;
      break;
    case 7:
      uint64_t result = 0x64654D20656D6F48;
      break;
    default:
      sub_1E0157250();
      OUTLINED_FUNCTION_8_3();
      swift_bridgeObjectRelease();
      uint64_t result = 0x206E776F6E6B6E55;
      break;
  }
  return result;
}

uint64_t sub_1E01505F4()
{
  return MRContentItemMediaSubType.name.getter(*v0);
}

void sub_1E01505FC(void *a1@<X8>)
{
  sub_1E014AC68(*v1, a1);
}

unint64_t MRDisabledReason.name.getter(int a1)
{
  unint64_t result = 0x64656C6261736944;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x20676E6979616C50;
      break;
    case 2:
      unint64_t result = 0x6D694C2070696B53;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = OUTLINED_FUNCTION_29();
      break;
    case 5:
      unint64_t result = 0x65776F5020776F4CLL;
      break;
    case 6:
      unint64_t result = 0x6672655020776F4CLL;
      break;
    default:
      sub_1E0157250();
      OUTLINED_FUNCTION_8_3();
      swift_bridgeObjectRelease();
      _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
      unint64_t result = 0x64656C6261736944;
      break;
  }
  return result;
}

unint64_t sub_1E0150784()
{
  return MRDisabledReason.name.getter(*v0);
}

void sub_1E015078C(uint64_t a1@<X8>)
{
  sub_1E014AE28(*v1, a1);
}

uint64_t SystemAppPlaybackQueueInsertionPosition.name.getter()
{
  uint64_t result = MRMediaRemoteCopyPlaybackQueueInsertionPositionDescription();
  if (result)
  {
    sub_1E0156D50();
    OUTLINED_FUNCTION_32();
    return OUTLINED_FUNCTION_21();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1E01507DC@<X0>(uint64_t a1@<X8>)
{
  return sub_1E014AD58(*v1, a1);
}

uint64_t MRPlaybackState.name.getter(uint64_t a1)
{
  return sub_1E01507FC(a1, MEMORY[0x1E4F76F80]);
}

uint64_t sub_1E01507FC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (result)
  {
    sub_1E0156D50();
    OUTLINED_FUNCTION_32();
    return OUTLINED_FUNCTION_21();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1E0150840()
{
  return MRPlaybackState.name.getter(*v0);
}

void sub_1E0150848(uint64_t a1@<X8>)
{
  sub_1E014AE64(*v1, a1);
}

uint64_t MRContentItem.MetadataOutline.id.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[5];
  switch(v2 >> 60)
  {
    case 1uLL:
      sub_1E0152CE8();
      goto LABEL_15;
    case 2uLL:
      uint64_t v4 = &unk_1EACE2C58;
      goto LABEL_6;
    case 3uLL:
      uint64_t v4 = &unk_1EACE2BF0;
LABEL_6:
      sub_1E0152EF0(0, (uint64_t)v4);
      goto LABEL_15;
    case 4uLL:
      uint64_t v5 = (unint64_t *)&unk_1EACE2C50;
      goto LABEL_14;
    case 5uLL:
      uint64_t v5 = (unint64_t *)&unk_1EACE2C28;
      goto LABEL_14;
    case 6uLL:
      uint64_t v5 = (unint64_t *)&unk_1EACE2C20;
      goto LABEL_14;
    case 7uLL:
      sub_1E0152CE8();
      goto LABEL_22;
    case 8uLL:
      sub_1E0152EF0(0, (uint64_t)&unk_1EACE2C08);
      goto LABEL_15;
    case 9uLL:
      uint64_t v5 = (unint64_t *)&unk_1EACE2C00;
LABEL_14:
      sub_1E0152D84(0, v5);
LABEL_15:
      swift_retain_n();
      sub_1E0156D70();
      uint64_t v8 = v1;
      swift_bridgeObjectRetain();
      _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
      swift_release();
      goto LABEL_19;
    case 0xAuLL:
      unint64_t v6 = (unint64_t *)&unk_1EACE2C00;
      goto LABEL_18;
    case 0xBuLL:
      unint64_t v6 = (unint64_t *)&unk_1EACE2C48;
LABEL_18:
      sub_1E0152D84(0, v6);
      swift_retain_n();
      sub_1E0156D70();
      uint64_t v8 = v1;
      swift_bridgeObjectRetain();
      _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
      swift_release();
LABEL_19:
      swift_bridgeObjectRelease();
      uint64_t v3 = v8;
      break;
    case 0xCuLL:
      sub_1E0152DF4();
LABEL_22:
      swift_retain();
      uint64_t v3 = sub_1E0156D70();
      break;
    case 0xDuLL:
      if ((v0[1] | v1 | v0[2] | v0[3] | v0[4]) == 0 && v2 == 0xD000000000000000) {
        uint64_t v3 = 0x6B726F77747261;
      }
      else {
        uint64_t v3 = 0xD000000000000010;
      }
      break;
    default:
      uint64_t v3 = *(void *)(v1 + 16);
      swift_bridgeObjectRetain();
      break;
  }
  return v3;
}

uint64_t sub_1E0150BE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MRContentItem.MetadataOutline.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void MediaRemoteCommand.symbol.getter()
{
}

void MRMediaRemoteCommandHandlerStatus.symbol.getter()
{
}

uint64_t RepeatMode.symbol.getter()
{
  return qword_1E0159FE0[*v0];
}

uint64_t ShuffleMode.symbol.getter()
{
  return qword_1E015A000[*v0];
}

void MRQueueEndAction.symbol.getter(unsigned int a1)
{
  if (a1 > 3) {
    OUTLINED_FUNCTION_15_1();
  }
  else {
    OUTLINED_FUNCTION_31();
  }
}

uint64_t MediaRemoteCommand.Option.id.getter()
{
  uint64_t v1 = *(void *)v0;
  if (*(unsigned __int8 *)(v0 + 32) >> 5 == 4)
  {
    uint64_t v3 = *(void *)(v1 + 16);
    int64_t v4 = *(void *)(v3 + 16);
    if (v4)
    {
      uint64_t v13 = MEMORY[0x1E4FBC860];
      uint64_t v5 = sub_1E0143CF0(0, v4, 0);
      uint64_t v6 = v3 + 64;
      do
      {
        uint64_t v5 = (char *)MediaRemoteCommand.Option.id.getter(v5);
        uint64_t v7 = v5;
        uint64_t v9 = v8;
        unint64_t v11 = *(void *)(v13 + 16);
        unint64_t v10 = *(void *)(v13 + 24);
        if (v11 >= v10 >> 1) {
          uint64_t v5 = sub_1E0143CF0((char *)(v10 > 1), v11 + 1, 1);
        }
        *(void *)(v13 + 16) = v11 + 1;
        uint64_t v12 = v13 + 16 * v11;
        *(void *)(v12 + 32) = v7;
        *(void *)(v12 + 40) = v9;
        v6 += 40;
        --v4;
      }
      while (v4);
    }
    sub_1E01540A0(0, &qword_1EACE2A30, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
    sub_1E01527E4();
    uint64_t v1 = sub_1E0156D20();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v1;
}

BOOL MediaRemoteCommand.Option.isRequired.getter()
{
  BOOL result = 1;
  switch(v0[32] >> 5)
  {
    case 1:
    case 2:
      BOOL result = 0;
      break;
    case 4:
      uint64_t v2 = *(void *)(*(void *)(*(void *)v0 + 16) + 16);
      if (v2)
      {
        uint64_t v3 = (unsigned char *)(swift_bridgeObjectRetain() + 64);
        uint64_t v4 = MEMORY[0x1E4FBC860];
        do
        {
          uint64_t v5 = *((void *)v3 - 4);
          uint64_t v6 = *((void *)v3 - 3);
          uint64_t v7 = *((void *)v3 - 2);
          uint64_t v8 = *((void *)v3 - 1);
          char v9 = *v3;
          uint64_t v10 = OUTLINED_FUNCTION_24();
          uint64_t v15 = sub_1E0152F84(v10, v11, v12, v13, v14);
          if (MediaRemoteCommand.Option.isRequired.getter(v15))
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              sub_1E01441D8(0, *(void *)(v4 + 16) + 1, 1);
            }
            unint64_t v17 = *(void *)(v4 + 16);
            unint64_t v16 = *(void *)(v4 + 24);
            unint64_t v18 = v17 + 1;
            if (v17 >= v16 >> 1)
            {
              sub_1E01441D8((char *)(v16 > 1), v17 + 1, 1);
              unint64_t v18 = v17 + 1;
            }
            *(void *)(v4 + 16) = v18;
            uint64_t v19 = v4 + 40 * v17;
            *(void *)(v19 + 32) = v5;
            *(void *)(v19 + 40) = v6;
            *(void *)(v19 + 48) = v7;
            *(void *)(v19 + 56) = v8;
            *(unsigned char *)(v19 + 64) = v9;
          }
          else
          {
            uint64_t v20 = OUTLINED_FUNCTION_24();
            sub_1E0153030(v20, v21, v22, v23, v24);
          }
          v3 += 40;
          --v2;
        }
        while (v2);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v4 = MEMORY[0x1E4FBC860];
      }
      uint64_t v25 = *(void *)(v4 + 16);
      swift_release();
      BOOL result = v25 != 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t MediaRemoteCommand.Option.name.getter()
{
  uint64_t v0 = OUTLINED_FUNCTION_34();
  if (v0 == 1869828432 && v1 == 0xE400000000000000)
  {
    unint64_t v5 = 0xD000000000000022;
    goto LABEL_8;
  }
  uint64_t v3 = v0;
  uint64_t v4 = v1;
  if (OUTLINED_FUNCTION_26())
  {
    unint64_t v5 = 0xD000000000000022;
LABEL_8:
    swift_bridgeObjectRelease();
    return v5;
  }
  unint64_t v5 = 0x496563616C706552;
  if (v3 == 1769099600 && v4 == 0xE400000000000000) {
    goto LABEL_8;
  }
  char v8 = OUTLINED_FUNCTION_26();
  swift_bridgeObjectRelease();
  if ((v8 & 1) == 0)
  {
    uint64_t v20 = OUTLINED_FUNCTION_34();
    uint64_t v21 = v9;
    unint64_t v18 = 0xD000000000000014;
    unint64_t v19 = 0x80000001E015A1B0;
    uint64_t v16 = 0;
    unint64_t v17 = 0xE000000000000000;
    sub_1E0142B2C();
    uint64_t v10 = OUTLINED_FUNCTION_14_2((uint64_t)&v18, (uint64_t)&v16);
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    uint64_t v20 = v10;
    uint64_t v21 = v12;
    unint64_t v18 = 0xD000000000000019;
    unint64_t v19 = 0x80000001E015A1D0;
    uint64_t v16 = 0;
    unint64_t v17 = 0xE000000000000000;
    uint64_t v13 = OUTLINED_FUNCTION_14_2((uint64_t)&v18, (uint64_t)&v16);
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v20 = v13;
    uint64_t v21 = v15;
    swift_bridgeObjectRetain();
    LOBYTE(v13) = sub_1E0156DF0();
    swift_bridgeObjectRelease();
    if (v13) {
      sub_1E015126C(3);
    }
    return v20;
  }
  return v5;
}

uint64_t sub_1E015126C(uint64_t result)
{
  if (result)
  {
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      unint64_t v2 = v1[1];
      if ((v2 & 0x2000000000000000) != 0) {
        uint64_t v3 = HIBYTE(v2) & 0xF;
      }
      else {
        uint64_t v3 = *v1 & 0xFFFFFFFFFFFFLL;
      }
      unint64_t v4 = sub_1E0156DD0();
      if (v5) {
        goto LABEL_14;
      }
      if (4 * v3 >= v4 >> 14)
      {
        return MEMORY[0x1F41838E8]();
      }
    }
    __break(1u);
LABEL_14:
    __break(1u);
    return MEMORY[0x1F41838E8]();
  }
  return result;
}

uint64_t sub_1E015131C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MediaRemoteCommand.Option.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t MediaRemoteCommand.options.getter()
{
  uint64_t v1 = MEMORY[0x1E4FBC860];
  switch(*v0)
  {
    case 4:
    case 5:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_7_3();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157C60;
      if (!*MEMORY[0x1E4F77678])
      {
        __break(1u);
        goto LABEL_80;
      }
      uint64_t v3 = sub_1E0156D50();
      OUTLINED_FUNCTION_35(v3, v4);
      if (!*MEMORY[0x1E4F77780])
      {
        __break(1u);
LABEL_6:
        sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
        uint64_t v1 = OUTLINED_FUNCTION_5_2();
        *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
        if (*MEMORY[0x1E4F772C8])
        {
LABEL_72:
          *(void *)(v1 + 32) = sub_1E0156D50();
          *(void *)(v1 + 40) = v60;
          *(void *)(v1 + 48) = 0;
          *(void *)(v1 + 56) = 0;
          char v10 = 64;
          goto LABEL_73;
        }
        __break(1u);
LABEL_8:
        sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
        uint64_t v1 = OUTLINED_FUNCTION_5_2();
        *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
        if (*MEMORY[0x1E4F777A0])
        {
          uint64_t v6 = sub_1E0156D50();
          if (*MEMORY[0x1E4F772A0])
          {
            uint64_t v7 = v5;
            uint64_t v8 = sub_1E0156D50();
            *(void *)(v1 + 32) = v6;
            *(void *)(v1 + 40) = v7;
            *(void *)(v1 + 48) = v8;
            *(void *)(v1 + 56) = v9;
            char v10 = 32;
LABEL_73:
            *(unsigned char *)(v1 + 64) = v10;
            return v1;
          }
          goto LABEL_81;
        }
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
LABEL_84:
        __break(1u);
LABEL_85:
        __break(1u);
LABEL_86:
        __break(1u);
LABEL_87:
        __break(1u);
LABEL_88:
        __break(1u);
LABEL_89:
        __break(1u);
LABEL_90:
        __break(1u);
        goto LABEL_91;
      }
LABEL_40:
      *(void *)(v1 + 72) = sub_1E0156D50();
      *(void *)(v1 + 80) = v30;
      *(void *)(v1 + 88) = 0;
      *(void *)(v1 + 96) = 0;
      *(unsigned char *)(v1 + 104) = (_BYTE)v0;
      return v1;
    case 6:
    case 7:
      goto LABEL_6;
    case 0xD:
    case 0xE:
      goto LABEL_8;
    case 0xF:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
      if (*MEMORY[0x1E4F776F8]) {
        goto LABEL_78;
      }
      __break(1u);
LABEL_24:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
      if (*MEMORY[0x1E4F77760]) {
        goto LABEL_78;
      }
      __break(1u);
LABEL_26:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
      if (*MEMORY[0x1E4F776C8]) {
        goto LABEL_72;
      }
      __break(1u);
LABEL_28:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
      if (*MEMORY[0x1E4F776C8]) {
        goto LABEL_72;
      }
      __break(1u);
LABEL_30:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
      if (*MEMORY[0x1E4F776D8])
      {
LABEL_78:
        uint64_t v65 = sub_1E0156D50();
        OUTLINED_FUNCTION_3_3(v65, v66);
        return v1;
      }
      __break(1u);
LABEL_32:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_7_3();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157C60;
      if (!*MEMORY[0x1E4F77778]) {
        goto LABEL_89;
      }
      uint64_t v24 = sub_1E0156D50();
      OUTLINED_FUNCTION_3_3(v24, v25);
      if (*MEMORY[0x1E4F772C0]) {
        goto LABEL_69;
      }
      __break(1u);
LABEL_35:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_7_3();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157C60;
      if (!*MEMORY[0x1E4F77798]) {
        goto LABEL_90;
      }
      uint64_t v26 = sub_1E0156D50();
      OUTLINED_FUNCTION_3_3(v26, v27);
      if (*MEMORY[0x1E4F772C8])
      {
LABEL_69:
        *(void *)(v1 + 72) = sub_1E0156D50();
        *(void *)(v1 + 80) = v59;
        *(void *)(v1 + 88) = 0;
        *(void *)(v1 + 96) = 0;
        char v47 = 64;
LABEL_70:
        *(unsigned char *)(v1 + 104) = v47;
        return v1;
      }
      __break(1u);
LABEL_38:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_7_3();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157C60;
      if (!*MEMORY[0x1E4F777C8])
      {
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
LABEL_96:
        __break(1u);
LABEL_97:
        __break(1u);
LABEL_98:
        __break(1u);
LABEL_99:
        __break(1u);
LABEL_100:
        __break(1u);
LABEL_101:
        __break(1u);
LABEL_102:
        __break(1u);
LABEL_103:
        __break(1u);
LABEL_104:
        __break(1u);
LABEL_105:
        __break(1u);
LABEL_106:
        __break(1u);
LABEL_107:
        __break(1u);
LABEL_108:
        __break(1u);
LABEL_109:
        __break(1u);
LABEL_110:
        __break(1u);
LABEL_111:
        __break(1u);
LABEL_112:
        __break(1u);
LABEL_113:
        __break(1u);
LABEL_114:
        __break(1u);
LABEL_115:
        __break(1u);
        JUMPOUT(0x1E0152004);
      }
      uint64_t v28 = sub_1E0156D50();
      OUTLINED_FUNCTION_35(v28, v29);
      if (!*MEMORY[0x1E4F77790]) {
        goto LABEL_92;
      }
      goto LABEL_40;
    case 0x10:
      goto LABEL_24;
    case 0x11:
      goto LABEL_26;
    case 0x12:
      goto LABEL_28;
    case 0x14:
      goto LABEL_30;
    case 0x15:
      goto LABEL_32;
    case 0x16:
      goto LABEL_35;
    case 0x17:
    case 0x18:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_7_3();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157C60;
      if (!*MEMORY[0x1E4F776D0]) {
        goto LABEL_82;
      }
      uint64_t v11 = sub_1E0156D50();
      OUTLINED_FUNCTION_3_3(v11, v12);
      if (*MEMORY[0x1E4F77658]) {
        goto LABEL_76;
      }
      __break(1u);
LABEL_14:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157FA0;
      if (!*MEMORY[0x1E4F77710]) {
        goto LABEL_83;
      }
      uint64_t v13 = sub_1E0156D50();
      OUTLINED_FUNCTION_3_3(v13, v14);
      if (!*MEMORY[0x1E4F77730]) {
        goto LABEL_84;
      }
      uint64_t v16 = sub_1E0156D50();
      if (!*MEMORY[0x1E4F77330]) {
        goto LABEL_85;
      }
      uint64_t v17 = v15;
      uint64_t v18 = sub_1E0156D50();
      *(void *)(v1 + 72) = v16;
      *(void *)(v1 + 80) = v17;
      *(void *)(v1 + 88) = v18;
      *(void *)(v1 + 96) = v19;
      *(unsigned char *)(v1 + 104) = 97;
      if (!*MEMORY[0x1E4F77720]) {
        goto LABEL_86;
      }
      *(void *)(v1 + 112) = sub_1E0156D50();
      *(void *)(v1 + 120) = v20;
      *(void *)(v1 + 128) = 0;
      *(void *)(v1 + 136) = 0;
      *(unsigned char *)(v1 + 144) = 0;
      if (!*MEMORY[0x1E4F77708]) {
        goto LABEL_87;
      }
      *(void *)(v1 + 152) = sub_1E0156D50();
      *(void *)(v1 + 160) = v21;
      *(void *)(v1 + 168) = 0;
      *(void *)(v1 + 176) = 0;
      *(unsigned char *)(v1 + 184) = 0;
      if (!*MEMORY[0x1E4F77728]) {
        goto LABEL_88;
      }
      *(void *)(v1 + 192) = sub_1E0156D50();
      *(void *)(v1 + 200) = v22;
      *(void *)(v1 + 208) = 0;
      *(void *)(v1 + 216) = 0;
      *(unsigned char *)(v1 + 224) = 0;
      if (!*MEMORY[0x1E4F77718]) {
        goto LABEL_115;
      }
      *(void *)(v1 + 232) = sub_1E0156D50();
      *(void *)(v1 + 240) = v23;
      *(void *)(v1 + 248) = 0;
      *(void *)(v1 + 256) = 0;
      *(unsigned char *)(v1 + 264) = 0;
      return v1;
    case 0x2B:
      goto LABEL_38;
    case 0x2C:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_1E0158070;
      if (!*MEMORY[0x1E4F777D0]) {
        goto LABEL_93;
      }
      uint64_t v31 = sub_1E0156D50();
      OUTLINED_FUNCTION_3_3(v31, v32);
      if (!*MEMORY[0x1E4F77750]) {
        goto LABEL_94;
      }
      *(void *)(v1 + 72) = sub_1E0156D50();
      *(void *)(v1 + 80) = v33;
      *(void *)(v1 + 88) = 0;
      *(void *)(v1 + 96) = 0;
      *(unsigned char *)(v1 + 104) = 64;
      if (!*MEMORY[0x1E4F77888]) {
        goto LABEL_95;
      }
      *(void *)(v1 + 112) = sub_1E0156D50();
      *(void *)(v1 + 120) = v34;
      *(void *)(v1 + 128) = 0;
      *(void *)(v1 + 136) = 0;
      *(unsigned char *)(v1 + 144) = 64;
      if (*MEMORY[0x1E4F77880]) {
        goto LABEL_45;
      }
      goto LABEL_96;
    case 0x2F:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_1E0158070;
      if (!*MEMORY[0x1E4F776E8]) {
        goto LABEL_97;
      }
      uint64_t v36 = sub_1E0156D50();
      OUTLINED_FUNCTION_3_3(v36, v37);
      if (!*MEMORY[0x1E4F777D0]) {
        goto LABEL_98;
      }
      uint64_t v38 = sub_1E0156D50();
      OUTLINED_FUNCTION_23(v38, v39);
      if (!*MEMORY[0x1E4F77750]) {
        goto LABEL_99;
      }
      *(void *)(v1 + 112) = sub_1E0156D50();
      *(void *)(v1 + 120) = v40;
      *(void *)(v1 + 128) = 0;
      *(void *)(v1 + 136) = 0;
      *(unsigned char *)(v1 + 144) = 64;
      if (!*MEMORY[0x1E4F776B0]) {
        goto LABEL_100;
      }
LABEL_45:
      *(void *)(v1 + 152) = sub_1E0156D50();
      *(void *)(v1 + 160) = v35;
      *(void *)(v1 + 168) = 0;
      *(void *)(v1 + 176) = 0;
      *(unsigned char *)(v1 + 184) = 64;
      return v1;
    case 0x31:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
      if (*MEMORY[0x1E4F77678]) {
        goto LABEL_78;
      }
      __break(1u);
LABEL_53:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_7_3();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157C60;
      if (!*MEMORY[0x1E4F77678]) {
        goto LABEL_101;
      }
      uint64_t v41 = sub_1E0156D50();
      OUTLINED_FUNCTION_3_3(v41, v42);
      uint64_t v43 = OUTLINED_FUNCTION_7_3();
      *(_OWORD *)(v43 + 16) = xmmword_1E0157C60;
      if (!*MEMORY[0x1E4F776B0]) {
        goto LABEL_102;
      }
      *(void *)(v43 + 32) = sub_1E0156D50();
      *(void *)(v43 + 40) = v44;
      *(void *)(v43 + 48) = 0;
      *(void *)(v43 + 56) = 0;
      *(unsigned char *)(v43 + 64) = 0;
      if (!*MEMORY[0x1E4F776B8]) {
        goto LABEL_103;
      }
      uint64_t v45 = swift_allocObject();
      *(void *)(v43 + 72) = sub_1E0156D50();
      *(void *)(v43 + 80) = v46;
      *(void *)(v43 + 88) = 0;
      *(void *)(v43 + 96) = 0;
      *(unsigned char *)(v43 + 104) = 0;
      *(void *)(v45 + 16) = v43;
      *(void *)(v1 + 72) = v45;
      *(void *)(v1 + 80) = 0;
      *(void *)(v1 + 88) = 0;
      *(void *)(v1 + 96) = 0;
      char v47 = 0x80;
      goto LABEL_70;
    case 0x32:
      goto LABEL_53;
    case 0x33:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
      if (*MEMORY[0x1E4F77678]) {
        goto LABEL_78;
      }
      __break(1u);
LABEL_59:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
      if (*MEMORY[0x1E4F777E0]) {
        goto LABEL_72;
      }
      __break(1u);
LABEL_61:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_1E0158070;
      if (!*MEMORY[0x1E4F77700]) {
        goto LABEL_104;
      }
      uint64_t v48 = sub_1E0156D50();
      OUTLINED_FUNCTION_3_3(v48, v49);
      if (!*MEMORY[0x1E4F77710]) {
        goto LABEL_105;
      }
      uint64_t v50 = sub_1E0156D50();
      OUTLINED_FUNCTION_23(v50, v51);
      if (!*MEMORY[0x1E4F77728]) {
        goto LABEL_106;
      }
      *(void *)(v1 + 112) = sub_1E0156D50();
      *(void *)(v1 + 120) = v52;
      *(void *)(v1 + 128) = 0;
      *(void *)(v1 + 136) = 0;
      *(unsigned char *)(v1 + 144) = 0;
      if (!*MEMORY[0x1E4F77720]) {
        goto LABEL_107;
      }
      *(void *)(v1 + 152) = sub_1E0156D50();
      *(void *)(v1 + 160) = v53;
      *(void *)(v1 + 168) = 0;
      *(void *)(v1 + 176) = 0;
      *(unsigned char *)(v1 + 184) = 0;
      return v1;
    case 0x34:
      goto LABEL_59;
    case 0x35:
      goto LABEL_61;
    case 0x37:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_7_3();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157C60;
      if (!*MEMORY[0x1E4F77758]) {
        goto LABEL_108;
      }
      uint64_t v55 = sub_1E0156D50();
      if (!*MEMORY[0x1E4F77338]) {
        goto LABEL_109;
      }
      uint64_t v56 = v54;
      uint64_t v57 = sub_1E0156D50();
      *(void *)(v1 + 32) = v55;
      *(void *)(v1 + 40) = v56;
      *(void *)(v1 + 48) = v57;
      *(void *)(v1 + 56) = v58;
      *(unsigned char *)(v1 + 64) = 97;
      if (*MEMORY[0x1E4F772B8]) {
        goto LABEL_69;
      }
      goto LABEL_110;
    case 0x38:
      goto LABEL_14;
    case 0x3B:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
      if (*MEMORY[0x1E4F77788]) {
        goto LABEL_72;
      }
      goto LABEL_111;
    case 0x3C:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_7_3();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157C60;
      if (!*MEMORY[0x1E4F77698]) {
        goto LABEL_112;
      }
      uint64_t v61 = sub_1E0156D50();
      OUTLINED_FUNCTION_3_3(v61, v62);
      if (!*MEMORY[0x1E4F776A0]) {
        goto LABEL_113;
      }
LABEL_76:
      uint64_t v63 = sub_1E0156D50();
      OUTLINED_FUNCTION_23(v63, v64);
      return v1;
    case 0x43:
      sub_1E01540A0(0, &qword_1EACE2A98, (uint64_t)&type metadata for MediaRemoteCommand.Option, MEMORY[0x1E4FBBE00]);
      uint64_t v1 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v1 + 16) = xmmword_1E0157850;
      if (*MEMORY[0x1E4F77678]) {
        goto LABEL_78;
      }
      goto LABEL_114;
    default:
      return v1;
  }
}

unint64_t sub_1E0152124(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_1E0152148(uint64_t a1)
{
  uint64_t v2 = sub_1E01570D0();
  return sub_1E0152204(a1, v2);
}

unint64_t sub_1E015218C(uint64_t a1, uint64_t a2)
{
  sub_1E0157310();
  sub_1E0156DB0();
  uint64_t v4 = sub_1E0157330();
  return sub_1E01522CC(a1, a2, v4);
}

unint64_t sub_1E0152204(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_1E0155ADC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x1E01F1E00](v9, a1);
      sub_1E01526B4((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1E01522CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1E0157290() & 1) == 0)
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
      while (!v14 && (sub_1E0157290() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1E01523B0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

double sub_1E01523E8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1E015218C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_1E0155D18(0, &qword_1EACE2CC0, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB1B0], MEMORY[0x1E4FBBCB8]);
    sub_1E01571F0();
    swift_bridgeObjectRelease();
    sub_1E0146AB0((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1E0157200();
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1E0152554(uint64_t a1)
{
  sub_1E01540A0(0, (unint64_t *)&qword_1EACE2B60, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E01525D8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_identifier);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1E0156D50();

  return v3;
}

uint64_t sub_1E015263C(void *a1)
{
  id v2 = objc_msgSend(a1, sel_userInfo);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1E0156D00();

  return v3;
}

uint64_t sub_1E01526B4(uint64_t a1)
{
  return a1;
}

void sub_1E0152708()
{
  if (!qword_1EACE2BD0)
  {
    sub_1E01540A0(255, &qword_1EACE2BD8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB718]);
    unint64_t v0 = sub_1E0157260();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE2BD0);
    }
  }
}

uint64_t sub_1E0152784(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (v3)
  {
    sub_1E0156D50();
    OUTLINED_FUNCTION_32();
  }
  return OUTLINED_FUNCTION_21();
}

unint64_t sub_1E01527E4()
{
  unint64_t result = qword_1EBA35BB0;
  if (!qword_1EBA35BB0)
  {
    sub_1E01540A0(255, &qword_1EACE2A30, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB320]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA35BB0);
  }
  return result;
}

void sub_1E0152858(uint64_t a1, uint64_t a2)
{
  if (!OUTLINED_FUNCTION_33(a1, a2))
  {
    uint64_t v4 = v2;
    v3(255);
    unint64_t v5 = sub_1E0157050();
    if (!v6) {
      atomic_store(v5, v4);
    }
  }
}

uint64_t sub_1E01528A8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_artworkURLTemplates);

  if (!v2) {
    return 0;
  }
  sub_1E0155D18(0, &qword_1EACE2C40, MEMORY[0x1E4FBB960], MEMORY[0x1E4FBB968], MEMORY[0x1E4FBAEA0]);
  uint64_t v3 = sub_1E0156E60();

  return v3;
}

uint64_t sub_1E015293C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  switch(a6 >> 60)
  {
    case 0uLL:
    case 7uLL:
    case 0xCuLL:
      goto LABEL_8;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 4uLL:
    case 5uLL:
    case 8uLL:
    case 9uLL:
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_8;
    case 6uLL:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_8;
    case 0xAuLL:
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_7;
    case 0xBuLL:
      swift_bridgeObjectRetain();
LABEL_7:
      swift_retain();
LABEL_8:
      uint64_t result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E0152A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  switch(a6 >> 60)
  {
    case 0uLL:
    case 7uLL:
    case 0xCuLL:
      goto LABEL_8;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      swift_bridgeObjectRelease();
      goto LABEL_8;
    case 4uLL:
    case 5uLL:
    case 8uLL:
    case 9uLL:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_8;
    case 6uLL:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_8;
    case 0xAuLL:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_7;
    case 0xBuLL:
      swift_bridgeObjectRelease();
LABEL_7:
      swift_release();
LABEL_8:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E0152B74(uint64_t a1, uint64_t a2)
{
  sub_1E0152858(0, a2);
  OUTLINED_FUNCTION_9_3();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_1E0152BC4()
{
  unint64_t result = qword_1EACE2BE8;
  if (!qword_1EACE2BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2BE8);
  }
  return result;
}

uint64_t sub_1E0152C10(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_1E0156D00();

  return v4;
}

uint64_t sub_1E0152C78(void *a1)
{
  id v1 = objc_msgSend(a1, sel_alternativeFormats);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  sub_1E0155C00(0, &qword_1EACE2C98);
  uint64_t v3 = sub_1E0156E60();

  return v3;
}

void sub_1E0152CE8()
{
  if (!qword_1EACE2C18)
  {
    sub_1E0155C00(255, &qword_1EACE2BF8);
    sub_1E01540A0(255, &qword_1EACE2BD8, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB718]);
    unint64_t v0 = sub_1E0157360();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE2C18);
    }
  }
}

void sub_1E0152D84(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    sub_1E0155C00(255, &qword_1EACE2BF8);
    unint64_t v3 = sub_1E0157360();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_1E0152DF4()
{
  if (!qword_1EACE2C30)
  {
    sub_1E0155C00(255, &qword_1EACE2BF8);
    sub_1E0152E6C();
    unint64_t v0 = sub_1E0157360();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE2C30);
    }
  }
}

void sub_1E0152E6C()
{
  if (!qword_1EACE2C38)
  {
    sub_1E0155D18(255, &qword_1EACE2C40, MEMORY[0x1E4FBB960], MEMORY[0x1E4FBB968], MEMORY[0x1E4FBAEA0]);
    unint64_t v0 = sub_1E0157050();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE2C38);
    }
  }
}

void sub_1E0152EF0(uint64_t a1, uint64_t a2)
{
  if (!OUTLINED_FUNCTION_33(a1, a2))
  {
    uint64_t v6 = v5;
    uint64_t v7 = v4;
    uint64_t v8 = v3;
    char v9 = v2;
    sub_1E0155C00(255, &qword_1EACE2BF8);
    v6(255, v8, v7);
    unint64_t v10 = sub_1E0157360();
    if (!v11) {
      atomic_store(v10, v9);
    }
  }
}

uint64_t sub_1E0152F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  switch(a5 >> 5)
  {
    case 0:
    case 2:
      goto LABEL_3;
    case 1:
    case 3:
      swift_bridgeObjectRetain();
LABEL_3:
      uint64_t result = swift_bridgeObjectRetain();
      break;
    case 4:
      uint64_t result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E0153030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  switch(a5 >> 5)
  {
    case 0:
    case 2:
      goto LABEL_3;
    case 1:
    case 3:
      swift_bridgeObjectRelease();
LABEL_3:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 4:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E01530DC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

unint64_t sub_1E0153118()
{
  unint64_t result = qword_1EACE2C60;
  if (!qword_1EACE2C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2C60);
  }
  return result;
}

unint64_t sub_1E0153168()
{
  unint64_t result = qword_1EACE2C68;
  if (!qword_1EACE2C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2C68);
  }
  return result;
}

unint64_t sub_1E01531B8()
{
  unint64_t result = qword_1EACE2C70;
  if (!qword_1EACE2C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2C70);
  }
  return result;
}

unint64_t sub_1E0153208()
{
  unint64_t result = qword_1EACE2C78;
  if (!qword_1EACE2C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2C78);
  }
  return result;
}

unint64_t sub_1E0153258()
{
  unint64_t result = qword_1EACE2C80;
  if (!qword_1EACE2C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2C80);
  }
  return result;
}

unint64_t sub_1E01532A8()
{
  unint64_t result = qword_1EACE2C88;
  if (!qword_1EACE2C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2C88);
  }
  return result;
}

uint64_t sub_1E01532F4()
{
  return MEMORY[0x1E4FBB1B0];
}

uint64_t dispatch thunk of NamedEnum.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NamedEnum._namedEnum.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1E0153334()
{
  return 0;
}

void type metadata accessor for MRPlayerPath.Error()
{
}

uint64_t getEnumTagSinglePayload for MediaRemoteCommand(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xB9)
  {
    if (a2 + 71 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 71) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 72;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x48;
  int v5 = v6 - 72;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for MediaRemoteCommand(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 71 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 71) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xB9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xB8)
  {
    unsigned int v6 = ((a2 - 185) >> 8) + 1;
    *unint64_t result = a2 + 71;
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
        JUMPOUT(0x1E015349CLL);
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
          *unint64_t result = a2 + 71;
        break;
    }
  }
  return result;
}

unsigned char *sub_1E01534C4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void type metadata accessor for MediaRemoteCommand()
{
}

void type metadata accessor for RepeatMode()
{
}

void type metadata accessor for ShuffleMode()
{
}

uint64_t _s15MetadataOutlineOwxx(uint64_t a1)
{
  return sub_1E0152A58(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t *_s15MetadataOutlineOwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  unint64_t v8 = a2[5];
  sub_1E015293C(*a2, v4, v5, v6, v7, v8);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  return a1;
}

uint64_t *_s15MetadataOutlineOwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  unint64_t v8 = a2[5];
  sub_1E015293C(*a2, v4, v5, v6, v7, v8);
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  unint64_t v14 = a1[5];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  sub_1E0152A58(v9, v10, v11, v12, v13, v14);
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

uint64_t *_s15MetadataOutlineOwta(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  unint64_t v8 = a1[5];
  long long v9 = a2[1];
  *(_OWORD *)a1 = *a2;
  *((_OWORD *)a1 + 1) = v9;
  *((_OWORD *)a1 + 2) = a2[2];
  sub_1E0152A58(v3, v5, v4, v6, v7, v8);
  return a1;
}

uint64_t _s15MetadataOutlineOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x3FF3 && *(unsigned char *)(a1 + 48))
    {
      unsigned int v2 = *(_DWORD *)a1 + 16370;
    }
    else
    {
      unsigned int v2 = ((*(void *)(a1 + 40) >> 60) | (16
                                          * ((*(void *)(a1 + 32) >> 57) & 0x78 | *(void *)(a1 + 32) & 7 | ((*(void *)(a1 + 40) & 7) << 7)))) ^ 0x3FFF;
      if (v2 >= 0x3FF2) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t _s15MetadataOutlineOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FF2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 16371;
    if (a3 >= 0x3FF3) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FF3) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2)
    {
      unint64_t v3 = (-a2 >> 4) & 0x3FF | ((-a2 & 0x3FFF) << 10);
      *(_OWORD *)__n128 result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(void *)(result + 32) = (v3 | (v3 << 57)) & 0xF000000000000007;
      *(void *)(result + 40) = ((v3 >> 7) | (v3 << 50)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1E0153744(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40) >> 60;
  if (v1 <= 0xC) {
    return v1;
  }
  else {
    return (*(_DWORD *)a1 + 13);
  }
}

uint64_t sub_1E0153760(uint64_t result)
{
  *(void *)(result + 40) &= 0xFFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_1E0153770(uint64_t result, uint64_t a2)
{
  if (a2 < 0xD)
  {
    uint64_t v2 = *(void *)(result + 40) & 0xFFFFFFFFFFFFFF8 | (a2 << 60);
    *(void *)(result + 32) &= 0xFFFFFFFFFFFFFF8uLL;
    *(void *)(result + 40) = v2;
  }
  else
  {
    *(void *)__n128 result = (a2 - 13);
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)(result + 40) = 0xD000000000000000;
  }
  return result;
}

void type metadata accessor for MRContentItem.MetadataOutline()
{
}

uint64_t _s15MetadataOutlineO8BoolTypeOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s15MetadataOutlineO8BoolTypeOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x1E015390CLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

void type metadata accessor for MRContentItem.MetadataOutline.BoolType()
{
}

uint64_t _s15MediaFoundation10RepeatModeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s15MediaFoundation10RepeatModeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x1E0153A94);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for SystemAppPlaybackQueueInsertionPosition()
{
}

uint64_t destroy for MediaRemoteCommand.Option(uint64_t a1)
{
  return sub_1E0153030(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t initializeWithCopy for MediaRemoteCommand.Option(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_1E0152F84(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for MediaRemoteCommand.Option(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 32);
  sub_1E0152F84(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  unsigned __int8 v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_1E0153030(v8, v9, v10, v11, v12);
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

uint64_t assignWithTake for MediaRemoteCommand.Option(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_1E0153030(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaRemoteCommand.Option(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7C && *(unsigned char *)(a1 + 33))
    {
      unsigned int v2 = *(_DWORD *)a1 + 123;
    }
    else
    {
      unsigned int v2 = ((*(unsigned __int8 *)(a1 + 32) >> 5) & 0xFFFFFF87 | (8 * ((*(unsigned __int8 *)(a1 + 32) >> 1) & 0xF))) ^ 0x7F;
      if (v2 >= 0x7B) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for MediaRemoteCommand.Option(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7B)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 124;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7C) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7C) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2)
    {
      *(_OWORD *)__n128 result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(unsigned char *)(result + 32) = 2 * (((-a2 >> 3) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_1E0153CBC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32) >> 5;
}

uint64_t sub_1E0153CC8(uint64_t result)
{
  *(unsigned char *)(result + 32) &= 0x1Fu;
  return result;
}

uint64_t sub_1E0153CD8(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 1 | (32 * a2);
  return result;
}

void type metadata accessor for MediaRemoteCommand.Option()
{
}

void (*sub_1E0153CF8(void *a1, unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_1E0153DA8(v6, a2, a3);
  return sub_1E0153D60;
}

void sub_1E0153D60(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1E0153DA8(void *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6 = a3 & 0xC000000000000001;
  sub_1E0152124(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6) {
    id v7 = (id)MEMORY[0x1E01F1E20](a2, a3);
  }
  else {
    id v7 = *(id *)(a3 + 8 * a2 + 32);
  }
  *a1 = v7;
  return sub_1E0153E28;
}

void sub_1E0153E28(id *a1)
{
}

uint64_t sub_1E0153E30(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1E0157210();
    __n128 result = swift_bridgeObjectRelease();
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
      uint64_t v8 = sub_1E0157210();
      __n128 result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1E0153FF4(0, (uint64_t)&unk_1EACE2C90);
          sub_1E0154038();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            uint64_t v10 = sub_1E0153CF8(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void *, void))v10)(v13, 0);
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
        sub_1E0155C00(0, &qword_1EACE2C98);
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

void sub_1E0153FF4(uint64_t a1, uint64_t a2)
{
  if (!OUTLINED_FUNCTION_33(a1, a2))
  {
    OUTLINED_FUNCTION_27(0, v3, v4);
    unint64_t v5 = sub_1E0156EC0();
    if (!v6) {
      atomic_store(v5, v2);
    }
  }
}

unint64_t sub_1E0154038()
{
  unint64_t result = qword_1EACE2CA0;
  if (!qword_1EACE2CA0)
  {
    sub_1E0153FF4(255, (uint64_t)&unk_1EACE2C90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2CA0);
  }
  return result;
}

void sub_1E01540A0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1E01540EC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_1E0154138(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0154158(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

id sub_1E0154178@<X0>(void *a1@<X8>)
{
  id result = MRContentItem._metadata.getter();
  *a1 = result;
  return result;
}

char *keypath_get_selector_contentIdentifier()
{
  return sel_contentIdentifier;
}

void sub_1E01541B0(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E01541D0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_queueIdentifier()
{
  return sel_queueIdentifier;
}

void sub_1E01541FC(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E015421C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_profileIdentifier()
{
  return sel_profileIdentifier;
}

void sub_1E0154248(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0154268(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_hasITunesStoreIdentifier()
{
  return sel_hasITunesStoreIdentifier;
}

id sub_1E0154294(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasITunesStoreIdentifier);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E01542C4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasITunesStoreIdentifier_, *a1);
}

char *keypath_get_selector_iTunesStoreIdentifier()
{
  return sel_iTunesStoreIdentifier;
}

id sub_1E01542E4(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_iTunesStoreIdentifier);
  *uint64_t v1 = result;
  return result;
}

id sub_1E0154314(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setITunesStoreIdentifier_, *a1);
}

char *keypath_get_selector_hasITunesStoreSubscriptionIdentifier()
{
  return sel_hasITunesStoreSubscriptionIdentifier;
}

id sub_1E0154334(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasITunesStoreSubscriptionIdentifier);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0154364(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasITunesStoreSubscriptionIdentifier_, *a1);
}

char *keypath_get_selector_iTunesStoreSubscriptionIdentifier()
{
  return sel_iTunesStoreSubscriptionIdentifier;
}

id sub_1E0154384(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_iTunesStoreSubscriptionIdentifier);
  *uint64_t v1 = result;
  return result;
}

id sub_1E01543B4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setITunesStoreSubscriptionIdentifier_, *a1);
}

char *keypath_get_selector_brandIdentifier()
{
  return sel_brandIdentifier;
}

void sub_1E01543D4(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E01543F4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_serviceIdentifier()
{
  return sel_serviceIdentifier;
}

void sub_1E0154420(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0154440(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_hasLegacyUniqueIdentifier()
{
  return sel_hasLegacyUniqueIdentifier;
}

id sub_1E015446C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasLegacyUniqueIdentifier);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E015449C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasLegacyUniqueIdentifier_, *a1);
}

char *keypath_get_selector_legacyUniqueIdentifier()
{
  return sel_legacyUniqueIdentifier;
}

id sub_1E01544BC(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_legacyUniqueIdentifier);
  *uint64_t v1 = result;
  return result;
}

id sub_1E01544EC(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLegacyUniqueIdentifier_, *a1);
}

char *keypath_get_selector_hasAlwaysLive()
{
  return sel_hasAlwaysLive;
}

id sub_1E015450C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasAlwaysLive);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E015453C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasAlwaysLive_, *a1);
}

char *keypath_get_selector_isAlwaysLive()
{
  return sel_isAlwaysLive;
}

id sub_1E015455C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_isAlwaysLive);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E015458C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAlwaysLive_, *a1);
}

char *keypath_get_selector_hasLoading()
{
  return sel_hasLoading;
}

id sub_1E01545AC(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasLoading);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E01545DC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasLoading_, *a1);
}

char *keypath_get_selector_hasElapsedTime()
{
  return sel_hasElapsedTime;
}

id sub_1E01545FC(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasElapsedTime);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E015462C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasElapsedTime_, *a1);
}

char *keypath_get_selector_playbackRate()
{
  return sel_playbackRate;
}

id sub_1E015464C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_playbackRate);
  *uint64_t v1 = v3;
  return result;
}

id sub_1E015467C(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setPlaybackRate_, a3);
}

char *keypath_get_selector_calculatedPlaybackPosition()
{
  return sel_calculatedPlaybackPosition;
}

id sub_1E015469C(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_calculatedPlaybackPosition);
  *uint64_t v1 = v3;
  return result;
}

char *keypath_get_selector_hasDuration()
{
  return sel_hasDuration;
}

id sub_1E01546D8(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasDuration);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0154708(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasDuration_, *a1);
}

char *keypath_get_selector_duration()
{
  return sel_duration;
}

id sub_1E0154728(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_duration);
  *uint64_t v1 = v3;
  return result;
}

id sub_1E0154758(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDuration_, *a1);
}

char *keypath_get_selector_hasPlaybackRate()
{
  return sel_hasPlaybackRate;
}

id sub_1E0154778(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasPlaybackRate);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E01547A8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasPlaybackRate_, *a1);
}

char *keypath_get_selector_hasDefaultPlaybackRate()
{
  return sel_hasDefaultPlaybackRate;
}

id sub_1E01547C8(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasDefaultPlaybackRate);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E01547F8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasDefaultPlaybackRate_, *a1);
}

char *keypath_get_selector_defaultPlaybackRate()
{
  return sel_defaultPlaybackRate;
}

id sub_1E0154818(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_defaultPlaybackRate);
  *uint64_t v1 = v3;
  return result;
}

id sub_1E0154848(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setDefaultPlaybackRate_, a3);
}

char *keypath_get_selector_hasStartTime()
{
  return sel_hasStartTime;
}

id sub_1E0154868(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasStartTime);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0154898(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasStartTime_, *a1);
}

char *keypath_get_selector_startTime()
{
  return sel_startTime;
}

id sub_1E01548B8(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_startTime);
  *uint64_t v1 = v3;
  return result;
}

id sub_1E01548E8(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStartTime_, *a1);
}

char *keypath_get_selector_title()
{
  return sel_title;
}

void sub_1E0154908(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0154928(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_subtitle()
{
  return sel_subtitle;
}

void sub_1E0154954(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0154974(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_hasMediaType()
{
  return sel_hasMediaType;
}

id sub_1E01549A0(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasMediaType);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E01549D0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasMediaType_, *a1);
}

char *keypath_get_selector_mediaType()
{
  return sel_mediaType;
}

id sub_1E01549F0(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_mediaType);
  *uint64_t v1 = result;
  return result;
}

id sub_1E0154A20(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMediaType_, *a1);
}

void sub_1E0154A34(uint64_t *a1@<X0>, void *a2@<X8>)
{
}

char *keypath_get_selector_hasMediaSubType()
{
  return sel_hasMediaSubType;
}

id sub_1E0154A48(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasMediaSubType);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0154A78(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasMediaSubType_, *a1);
}

char *keypath_get_selector_mediaSubType()
{
  return sel_mediaSubType;
}

id sub_1E0154A98(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_mediaSubType);
  *uint64_t v1 = result;
  return result;
}

id sub_1E0154AC8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMediaSubType_, *a1);
}

void sub_1E0154ADC(uint64_t *a1@<X0>, void *a2@<X8>)
{
}

char *keypath_get_selector_hasExplicitItem()
{
  return sel_hasExplicitItem;
}

id sub_1E0154AF0(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasExplicitItem);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0154B20(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasExplicitItem_, *a1);
}

char *keypath_get_selector_isExplicitItem()
{
  return sel_isExplicitItem;
}

id sub_1E0154B40(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_isExplicitItem);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0154B70(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setExplicitItem_, *a1);
}

char *keypath_get_selector_hasAdvertisement()
{
  return sel_hasAdvertisement;
}

id sub_1E0154B90(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasAdvertisement);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0154BC0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasAdvertisement_, *a1);
}

char *keypath_get_selector_isAdvertisement()
{
  return sel_isAdvertisement;
}

id sub_1E0154BE0(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_isAdvertisement);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0154C10(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAdvertisement_, *a1);
}

char *keypath_get_selector_releaseDate()
{
  return sel_releaseDate;
}

uint64_t sub_1E0154C30(void **a1, uint64_t a2, uint64_t a3)
{
  return sub_1E014F7D8(a1, a2, a3, (const char **)&selRef_releaseDate, MEMORY[0x1E4F27918], MEMORY[0x1E4F27928]);
}

char *keypath_get_selector_localizedContentRating()
{
  return sel_localizedContentRating;
}

void sub_1E0154C88(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0154CA8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_trackArtistName()
{
  return sel_trackArtistName;
}

void sub_1E0154CD4(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0154CF4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_genre()
{
  return sel_genre;
}

void sub_1E0154D20(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0154D40(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_composer()
{
  return sel_composer;
}

void sub_1E0154D6C(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0154D8C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_classicalWork()
{
  return sel_classicalWork;
}

void sub_1E0154DB8(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0154DD8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_hasDiscNumber()
{
  return sel_hasDiscNumber;
}

id sub_1E0154E04(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasDiscNumber);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0154E34(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasDiscNumber_, *a1);
}

char *keypath_get_selector_discNumber()
{
  return sel_discNumber;
}

id sub_1E0154E54(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_discNumber);
  *uint64_t v1 = result;
  return result;
}

id sub_1E0154E84(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDiscNumber_, *a1);
}

char *keypath_get_selector_hasTotalDiscCount()
{
  return sel_hasTotalDiscCount;
}

id sub_1E0154EA4(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasTotalDiscCount);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0154ED4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasTotalDiscCount_, *a1);
}

char *keypath_get_selector_totalDiscCount()
{
  return sel_totalDiscCount;
}

id sub_1E0154EF4(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_totalDiscCount);
  *uint64_t v1 = result;
  return result;
}

id sub_1E0154F24(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTotalDiscCount_, *a1);
}

char *keypath_get_selector_hasTrackNumber()
{
  return sel_hasTrackNumber;
}

id sub_1E0154F44(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasTrackNumber);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0154F74(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasTrackNumber_, *a1);
}

char *keypath_get_selector_trackNumber()
{
  return sel_trackNumber;
}

id sub_1E0154F94(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_trackNumber);
  *uint64_t v1 = result;
  return result;
}

id sub_1E0154FC4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrackNumber_, *a1);
}

char *keypath_get_selector_hasTotalTrackCount()
{
  return sel_hasTotalTrackCount;
}

id sub_1E0154FE4(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasTotalTrackCount);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0155014(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasTotalTrackCount_, *a1);
}

char *keypath_get_selector_totalTrackCount()
{
  return sel_totalTrackCount;
}

id sub_1E0155034(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_totalTrackCount);
  *uint64_t v1 = result;
  return result;
}

id sub_1E0155064(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTotalTrackCount_, *a1);
}

char *keypath_get_selector_directorName()
{
  return sel_directorName;
}

void sub_1E0155084(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E01550A4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_hasEpisodeType()
{
  return sel_hasEpisodeType;
}

id sub_1E01550D0(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasEpisodeType);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0155100(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasEpisodeType_, *a1);
}

char *keypath_get_selector_episodeType()
{
  return sel_episodeType;
}

id sub_1E0155120(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_episodeType);
  *uint64_t v1 = result;
  return result;
}

id sub_1E0155150(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEpisodeType_, *a1);
}

void sub_1E0155164(uint64_t *a1@<X0>, void *a2@<X8>)
{
}

char *keypath_get_selector_seriesName()
{
  return sel_seriesName;
}

void sub_1E0155178(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0155198(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_hasEpisodeNumber()
{
  return sel_hasEpisodeNumber;
}

id sub_1E01551C4(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasEpisodeNumber);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E01551F4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasEpisodeNumber_, *a1);
}

char *keypath_get_selector_episodeNumber()
{
  return sel_episodeNumber;
}

id sub_1E0155214(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_episodeNumber);
  *uint64_t v1 = result;
  return result;
}

id sub_1E0155244(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEpisodeNumber_, *a1);
}

char *keypath_get_selector_hasSeasonNumber()
{
  return sel_hasSeasonNumber;
}

id sub_1E0155264(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasSeasonNumber);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0155294(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasSeasonNumber_, *a1);
}

char *keypath_get_selector_seasonNumber()
{
  return sel_seasonNumber;
}

id sub_1E01552B4(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_seasonNumber);
  *uint64_t v1 = result;
  return result;
}

id sub_1E01552E4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSeasonNumber_, *a1);
}

char *keypath_get_selector_participantIdentifier()
{
  return sel_participantIdentifier;
}

void sub_1E0155304(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0155324(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_participantName()
{
  return sel_participantName;
}

void sub_1E0155350(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0155370(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_info()
{
  return sel_info;
}

void sub_1E015539C(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E01553BC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_collectionIdentifier()
{
  return sel_collectionIdentifier;
}

void sub_1E01553E8(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0155408(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_radioStationString()
{
  return sel_radioStationString;
}

void sub_1E0155434(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0155454(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_hasRadioStationIdentifier()
{
  return sel_hasRadioStationIdentifier;
}

id sub_1E0155480(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasRadioStationIdentifier);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E01554B0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasRadioStationIdentifier_, *a1);
}

char *keypath_get_selector_radioStationIdentifier()
{
  return sel_radioStationIdentifier;
}

id sub_1E01554D0(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_radioStationIdentifier);
  *uint64_t v1 = result;
  return result;
}

id sub_1E0155500(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRadioStationIdentifier_, *a1);
}

char *keypath_get_selector_radioStationName()
{
  return sel_radioStationName;
}

void sub_1E0155520(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0155540(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_albumName()
{
  return sel_albumName;
}

void sub_1E015556C(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E015558C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_albumArtistName()
{
  return sel_albumArtistName;
}

void sub_1E01555B8(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E01555D8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_hasPlaylistType()
{
  return sel_hasPlaylistType;
}

id sub_1E0155604(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasPlaylistType);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E0155634(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasPlaylistType_, *a1);
}

char *keypath_get_selector_playlistType()
{
  return sel_playlistType;
}

id sub_1E0155654(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_playlistType);
  *uint64_t v1 = result;
  return result;
}

id sub_1E0155684(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPlaylistType_, *a1);
}

void sub_1E0155698(uint64_t *a1@<X0>, void *a2@<X8>)
{
}

char *keypath_get_selector_hasRadioStationType()
{
  return sel_hasRadioStationType;
}

id sub_1E01556AC(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_hasRadioStationType);
  *uint64_t v1 = (_BYTE)result;
  return result;
}

id sub_1E01556DC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHasRadioStationType_, *a1);
}

char *keypath_get_selector_radioStationType()
{
  return sel_radioStationType;
}

id sub_1E01556FC(uint64_t a1)
{
  id result = objc_msgSend((id)OUTLINED_FUNCTION_0_1(a1), sel_radioStationType);
  *uint64_t v1 = result;
  return result;
}

id sub_1E015572C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRadioStationType_, *a1);
}

void sub_1E0155740(uint64_t *a1@<X0>, void *a2@<X8>)
{
}

char *keypath_get_selector_albumYear()
{
  return sel_albumYear;
}

void sub_1E0155754(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0155774(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_collectionInfo()
{
  return sel_collectionInfo;
}

void sub_1E01557A0(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E01557C0(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_assetURL()
{
  return sel_assetURL;
}

uint64_t sub_1E01557EC(void **a1, uint64_t a2, uint64_t a3)
{
  return sub_1E014F7D8(a1, a2, a3, (const char **)&selRef_assetURL, MEMORY[0x1E4F276E0], MEMORY[0x1E4F276F0]);
}

char *keypath_get_selector_lyricsURL()
{
  return sel_lyricsURL;
}

uint64_t sub_1E0155844(void **a1, uint64_t a2, uint64_t a3)
{
  return sub_1E014F7D8(a1, a2, a3, (const char **)&selRef_lyricsURL, MEMORY[0x1E4F276E0], MEMORY[0x1E4F276F0]);
}

char *keypath_get_selector_artworkIdentifier()
{
  return sel_artworkIdentifier;
}

void sub_1E015589C(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E01558BC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_artworkURL()
{
  return sel_artworkURL;
}

uint64_t sub_1E01558E8(void **a1, uint64_t a2, uint64_t a3)
{
  return sub_1E014F7D8(a1, a2, a3, (const char **)&selRef_artworkURL, MEMORY[0x1E4F276E0], MEMORY[0x1E4F276F0]);
}

char *keypath_get_selector_artworkFileURL()
{
  return sel_artworkFileURL;
}

uint64_t sub_1E0155940(void **a1, uint64_t a2, uint64_t a3)
{
  return sub_1E014F7D8(a1, a2, a3, (const char **)&selRef_artworkFileURL, MEMORY[0x1E4F276E0], MEMORY[0x1E4F276F0]);
}

char *keypath_get_selector_artworkMIMEType()
{
  return sel_artworkMIMEType;
}

void sub_1E0155998(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E01559B8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_userInfo()
{
  return sel_userInfo;
}

void sub_1E01559E4(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0155A04(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_deviceSpecificUserInfo()
{
  return sel_deviceSpecificUserInfo;
}

void sub_1E0155A30(void **a1, uint64_t a2, uint64_t a3)
{
}

void sub_1E0155A50(void *a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1E0155A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1E0152858(0, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1E0155ADC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1E0155B38(uint64_t a1)
{
  sub_1E0155B94();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1E0155B94()
{
  if (!qword_1EACE2CB8)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EACE2CB8);
    }
  }
}

uint64_t sub_1E0155BF8()
{
  return swift_release();
}

uint64_t sub_1E0155C00(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1E0155C3C()
{
  return objectdestroy_382Tm((uint64_t)&unk_1EACE2CC8);
}

uint64_t sub_1E0155C58()
{
  sub_1E0155F54(0, (uint64_t)&unk_1EACE2CC8);
  OUTLINED_FUNCTION_4_3(v0);
  uint64_t v1 = (void *)OUTLINED_FUNCTION_36();
  return sub_1E014C700(v1);
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

unint64_t sub_1E0155CCC()
{
  unint64_t result = qword_1EACE2CD0;
  if (!qword_1EACE2CD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2CD0);
  }
  return result;
}

void sub_1E0155D18(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, MEMORY[0x1E4FBC840] + 8);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_1E0155D74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1E0155DD0()
{
  unint64_t result = qword_1EACE2CE0;
  if (!qword_1EACE2CE0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EACE2CE0);
  }
  return result;
}

void sub_1E0155E1C()
{
  if (!qword_1EACE2CE8)
  {
    sub_1E0153FF4(255, (uint64_t)&unk_1EACE2BA8);
    unint64_t v0 = sub_1E0156F00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EACE2CE8);
    }
  }
}

uint64_t sub_1E0155E9C()
{
  sub_1E0155E1C();
  OUTLINED_FUNCTION_9_3();
  uint64_t v3 = OUTLINED_FUNCTION_22();
  v4(v3);
  return MEMORY[0x1F4186498](v1, v0, v2);
}

uint64_t sub_1E0155F10()
{
  sub_1E0155E1C();
  OUTLINED_FUNCTION_4_3(v0);
  uint64_t v1 = OUTLINED_FUNCTION_36();
  return sub_1E014BB98(v1);
}

void sub_1E0155F54(uint64_t a1, uint64_t a2)
{
  if (!OUTLINED_FUNCTION_33(a1, a2))
  {
    OUTLINED_FUNCTION_27(0, v3, v4);
    sub_1E014483C(255, (unint64_t *)&qword_1EBA35BC8);
    OUTLINED_FUNCTION_21();
    unint64_t v5 = sub_1E0156F00();
    if (!v6) {
      atomic_store(v5, v2);
    }
  }
}

uint64_t sub_1E0155FC4()
{
  return objectdestroy_382Tm((uint64_t)&unk_1EACE2CF0);
}

uint64_t objectdestroy_382Tm(uint64_t a1)
{
  sub_1E0155F54(0, a1);
  OUTLINED_FUNCTION_9_3();
  uint64_t v4 = OUTLINED_FUNCTION_22();
  v5(v4);
  return MEMORY[0x1F4186498](v2, v1, v3);
}

uint64_t sub_1E0156060(void *a1)
{
  sub_1E0155F54(0, (uint64_t)&unk_1EACE2CF0);
  OUTLINED_FUNCTION_4_3(v2);
  return sub_1E014B5FC(a1);
}

unint64_t sub_1E01560D8()
{
  unint64_t result = qword_1EACE2CF8;
  if (!qword_1EACE2CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2CF8);
  }
  return result;
}

uint64_t _s5ErrorOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s5ErrorOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1E0156210);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for MediaRemoteCommand.Error()
{
}

unint64_t sub_1E0156248()
{
  unint64_t result = qword_1EACE2D00;
  if (!qword_1EACE2D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACE2D00);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t result, uint64_t a2)
{
  *(void *)(v2 + 32) = result;
  *(void *)(v2 + 40) = a2;
  *(void *)(v2 + 48) = 0;
  *(void *)(v2 + 56) = 0;
  *(unsigned char *)(v2 + 64) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_3(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0();
}

uint64_t OUTLINED_FUNCTION_10_3(uint64_t a1)
{
  return MEMORY[0x1F4188298](a1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return sub_1E015293C(v3, v4, v0, v1, v5, v2);
}

uint64_t OUTLINED_FUNCTION_14_2(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40E6C80](a1, a2, 0, 0, 0, 1, v2, v2);
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return sub_1E0152A58(v3, v4, v0, v1, v5, v2);
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return sub_1E0152A58(v0, v1, v2, v3, v4, v5);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return 6710863;
}

id OUTLINED_FUNCTION_20_0(void **a1, uint64_t a2, uint64_t a3, const char **a4)
{
  unint64_t v5 = *a1;
  uint64_t v6 = *a4;
  return [v5 v6];
}

uint64_t OUTLINED_FUNCTION_21()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return v1 + v0;
}

uint64_t OUTLINED_FUNCTION_23(uint64_t result, uint64_t a2)
{
  *(void *)(v2 + 72) = result;
  *(void *)(v2 + 80) = a2;
  *(void *)(v2 + 88) = 0;
  *(void *)(v2 + 96) = 0;
  *(unsigned char *)(v2 + 104) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  return v0 - 136;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_1E0157290();
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  return sub_1E0155C00(255, a3);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_1E0157310();
}

unint64_t OUTLINED_FUNCTION_29()
{
  return 0xD000000000000010;
}

BOOL OUTLINED_FUNCTION_30@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

void OUTLINED_FUNCTION_32()
{
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1, uint64_t a2)
{
  return *(void *)a2;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return MediaRemoteCommand.Option.id.getter();
}

uint64_t OUTLINED_FUNCTION_35(uint64_t result, uint64_t a2)
{
  *(void *)(v2 + 32) = result;
  *(void *)(v2 + 40) = a2;
  *(void *)(v2 + 48) = 0;
  *(void *)(v2 + 56) = 0;
  *(unsigned char *)(v2 + 64) = 64;
  return result;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return v0;
}

uint64_t NSError.wrapWith<A>(domain:code:userInfo:debugDescription:)()
{
  return sub_1E015678C(MEMORY[0x1E4FBC860], (void (*)(uint64_t *__return_ptr, uint64_t))sub_1E0156764);
}

void sub_1E0156610(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = self;
  uint64_t v3 = (void *)sub_1E0156D40();
  sub_1E0156E30();
  uint64_t v4 = (void *)sub_1E0156BD0();
  sub_1E0146A58();
  unint64_t v5 = (void *)sub_1E0156E40();
  uint64_t v6 = (void *)sub_1E0156CF0();
  uint64_t v7 = (void *)sub_1E0156D40();
  id v8 = objc_msgSend(v2, sel__msv_errorWithDomain_code_underlyingError_underlyingErrors_userInfo_debugDescriptionFormat_arguments_, v3, v11, v4, v5, v6, v7, a1);

  *a2 = v8;
}

void sub_1E0156764()
{
  OUTLINED_FUNCTION_0_2();
  sub_1E0156610(v0, v1);
}

uint64_t sub_1E015678C(uint64_t a1, void (*a2)(uint64_t *__return_ptr, uint64_t))
{
  sub_1E01571E0();
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = 8;
  v4[3] = 0;
  v4[4] = 0;
  v4[5] = 0;
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v6 = (void *)(a1 + 32);
    do
    {
      __swift_project_boxed_opaque_existential_1(v6, v6[3]);
      sub_1E0157350();
      sub_1E01571C0();
      swift_bridgeObjectRelease();
      v6 += 5;
      --v5;
    }
    while (v5);
  }
  uint64_t v7 = sub_1E01571D0();
  a2(&v9, v7);
  swift_release();
  return v9;
}

uint64_t static NSError.error<A>(domain:code:underlyingError:underlyingErrors:userInfo:debugDescription:)()
{
  return sub_1E015678C(MEMORY[0x1E4FBC860], (void (*)(uint64_t *__return_ptr, uint64_t))sub_1E0156A34);
}

void sub_1E01568C4(uint64_t a1@<X0>, uint64_t a2@<X5>, void *a3@<X6>, void *a4@<X8>)
{
  uint64_t v6 = (void *)sub_1E0156D40();
  sub_1E0156E30();
  if (!a2)
  {
    uint64_t v7 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = (void *)sub_1E0156BD0();
  if (a3)
  {
LABEL_3:
    sub_1E0156A64((unint64_t)a3);
    sub_1E0146A58();
    a3 = (void *)sub_1E0156E40();
    swift_bridgeObjectRelease();
  }
LABEL_4:
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  uint64_t v9 = (void *)sub_1E0156CF0();
  uint64_t v10 = (void *)sub_1E0156D40();
  id v11 = objc_msgSend(ObjCClassFromMetadata, sel__msv_errorWithDomain_code_underlyingError_underlyingErrors_userInfo_debugDescriptionFormat_arguments_, v6, v14, v7, a3, v9, v10, a1);

  *a4 = v11;
}

void sub_1E0156A34()
{
  OUTLINED_FUNCTION_0_2();
  sub_1E01568C4(v0, v1, v2, v3);
}

uint64_t sub_1E0156A64(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1E0157210();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (!v2) {
    return v3;
  }
  uint64_t v10 = MEMORY[0x1E4FBC860];
  sub_1E01441F8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = 0;
    uint64_t v3 = v10;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)MEMORY[0x1E01F1E20](v4, a1);
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      id v6 = v5;
      unint64_t v8 = *(void *)(v10 + 16);
      unint64_t v7 = *(void *)(v10 + 24);
      if (v8 >= v7 >> 1) {
        sub_1E01441F8((void *)(v7 > 1), v8 + 1, 1);
      }
      ++v4;
      *(void *)(v10 + 16) = v8 + 1;
      *(void *)(v10 + 8 * v8 + 32) = v6;
    }
    while (v2 != v4);
    return v3;
  }
  __break(1u);
  return sub_1E0156B90();
}

uint64_t sub_1E0156B90()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1E0156BA0()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1E0156BB0()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1E0156BD0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1E0156BE0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1E0156BF0()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1E0156C00()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1E0156C10()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1E0156C20()
{
  return MEMORY[0x1F40E4CB8]();
}

uint64_t sub_1E0156C30()
{
  return MEMORY[0x1F40E4DF0]();
}

uint64_t sub_1E0156C40()
{
  return MEMORY[0x1F40E4E48]();
}

uint64_t sub_1E0156C50()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1E0156C60()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1E0156C70()
{
  return MEMORY[0x1F41884E0]();
}

uint64_t sub_1E0156C80()
{
  return MEMORY[0x1F41884C0]();
}

uint64_t sub_1E0156C90()
{
  return MEMORY[0x1F41884D0]();
}

uint64_t sub_1E0156CA0()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1E0156CB0()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1E0156CC0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1E0156CD0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1E0156CE0()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1E0156CF0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1E0156D00()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1E0156D10()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1E0156D20()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1E0156D30()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1E0156D40()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1E0156D50()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1E0156D60()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1E0156D70()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1E0156D90()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1E0156DA0()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1E0156DB0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1E0156DC0()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1E0156DD0()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t _sSo14MSVSQLDatabaseC15MediaFoundationE22StatementInterpolationV06StringE0V13appendLiteralyySSF_0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1E0156DF0()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1E0156E00()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1E0156E10()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1E0156E20()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1E0156E30()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1E0156E40()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1E0156E50()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1E0156E60()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1E0156E80()
{
  return MEMORY[0x1F4183EB8]();
}

uint64_t sub_1E0156E90()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1E0156EA0()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1E0156EB0()
{
  return MEMORY[0x1F4183F98]();
}

uint64_t sub_1E0156EC0()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1E0156ED0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1E0156EE0()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1E0156EF0()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1E0156F00()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1E0156F10()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t sub_1E0156F20()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1E0156F30()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1E0156F60()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t sub_1E0156F70()
{
  return MEMORY[0x1F4184280]();
}

uint64_t sub_1E0156F80()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1E0156F90()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1E0156FA0()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1E0156FB0()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1E0156FC0()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1E0156FD0()
{
  return MEMORY[0x1F40E65D8]();
}

uint64_t sub_1E0156FE0()
{
  return MEMORY[0x1F40E65E0]();
}

uint64_t sub_1E0157000()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1E0157010()
{
  return MEMORY[0x1F4187178]();
}

uint64_t sub_1E0157020()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1E0157030()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1E0157040()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1E0157050()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1E0157060()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1E0157070()
{
  return MEMORY[0x1F4184830]();
}

uint64_t sub_1E0157090()
{
  return MEMORY[0x1F40E6D70]();
}

uint64_t sub_1E01570A0()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1E01570B0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1E01570C0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1E01570D0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1E01570E0()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1E01570F0()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1E0157100()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1E0157110()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1E0157120()
{
  return MEMORY[0x1F4184E58]();
}

uint64_t sub_1E0157130()
{
  return MEMORY[0x1F4184E60]();
}

uint64_t sub_1E0157140()
{
  return MEMORY[0x1F4184EB8]();
}

uint64_t sub_1E0157150()
{
  return MEMORY[0x1F4187F30]();
}

uint64_t sub_1E0157170()
{
  return MEMORY[0x1F4187F60]();
}

uint64_t sub_1E0157180()
{
  return MEMORY[0x1F4187F68]();
}

uint64_t sub_1E0157190()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t sub_1E01571A0()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t sub_1E01571B0()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t sub_1E01571C0()
{
  return MEMORY[0x1F4185028]();
}

uint64_t sub_1E01571D0()
{
  return MEMORY[0x1F4185038]();
}

uint64_t sub_1E01571E0()
{
  return MEMORY[0x1F4185040]();
}

uint64_t sub_1E01571F0()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1E0157200()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1E0157210()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1E0157220()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1E0157230()
{
  return MEMORY[0x1F4185488]();
}

uint64_t sub_1E0157240()
{
  return MEMORY[0x1F4185490]();
}

uint64_t sub_1E0157250()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1E0157260()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1E0157280()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1E0157290()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E01572B0()
{
  return MEMORY[0x1F4185D90]();
}

uint64_t sub_1E01572C0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1E01572D0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1E01572E0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1E01572F0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1E0157300()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1E0157310()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E0157320()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1E0157330()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1E0157340()
{
  return MEMORY[0x1F4185F98]();
}

uint64_t sub_1E0157350()
{
  return MEMORY[0x1F4185FA0]();
}

uint64_t sub_1E0157360()
{
  return MEMORY[0x1F4186008]();
}

uint64_t MRMediaRemoteCopyPlaybackQueueInsertionPositionDescription()
{
  return MEMORY[0x1F412E538]();
}

uint64_t MRMediaRemoteGetAvailableOrigins()
{
  return MEMORY[0x1F412E580]();
}

uint64_t MRMediaRemoteNowPlayingResolvePlayerPath()
{
  return MEMORY[0x1F412E650]();
}

uint64_t MRMediaRemoteSendCommandToPlayerWithResult()
{
  return MEMORY[0x1F412E768]();
}

uint64_t MSVNanoIDCreateTaggedPointer()
{
  return MEMORY[0x1F412EC98]();
}

uint64_t MSVProcessIsDebugging()
{
  return MEMORY[0x1F412ECA0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

void free(void *a1)
{
}

int isatty(int a1)
{
  return MEMORY[0x1F40CC6B0](*(void *)&a1);
}

int isprint(int _c)
{
  return MEMORY[0x1F40CC6B8](*(void *)&_c);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1F4186590]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1F41865C0]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1F41865C8]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}