unint64_t sub_252CFD730()
{
  unint64_t result;

  result = qword_269C49008;
  if (!qword_269C49008)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49008);
  }
  return result;
}

unint64_t sub_252CFD77C()
{
  unint64_t result = qword_269C49010;
  if (!qword_269C49010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49010);
  }
  return result;
}

unint64_t sub_252CFD7C8()
{
  unint64_t result = qword_269C49028;
  if (!qword_269C49028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49028);
  }
  return result;
}

unint64_t sub_252CFD814()
{
  unint64_t result = qword_269C49030;
  if (!qword_269C49030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49030);
  }
  return result;
}

unint64_t sub_252CFD860()
{
  unint64_t result = qword_269C49040;
  if (!qword_269C49040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49040);
  }
  return result;
}

unint64_t sub_252CFD8AC()
{
  unint64_t result = qword_269C49050;
  if (!qword_269C49050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49050);
  }
  return result;
}

unint64_t sub_252CFD8F8()
{
  unint64_t result = qword_269C49058;
  if (!qword_269C49058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49058);
  }
  return result;
}

uint64_t sub_252CFD944(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_252D1A5D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61;
    if (v6 || (sub_252D1A5D8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 1701869940 && a2 == 0xE400000000000000;
      if (v7 || (sub_252D1A5D8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x74616E616C707865 && a2 == 0xEB000000006E6F69)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_252D1A5D8();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_252CFDAFC(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x4E79616C70736964;
      break;
    case 2:
      uint64_t result = 1701869940;
      break;
    case 3:
      uint64_t result = 0x74616E616C707865;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252CFDB8C()
{
  return sub_252CFDAFC(*v0);
}

uint64_t sub_252CFDB94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252CFD944(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252CFDBBC(uint64_t a1)
{
  unint64_t v2 = sub_252CFF170();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252CFDBF8(uint64_t a1)
{
  unint64_t v2 = sub_252CFF170();

  return MEMORY[0x270FA00B8](a1, v2);
}

void ParameterDefinition.encode(to:)()
{
  sub_252AF4380();
  sub_252AC3A24(&qword_269C49060);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v1);
  sub_252B23278();
  sub_252D02F64();
  sub_252CFF170();
  sub_252D03004();
  sub_252D030AC();
  if (!v0)
  {
    sub_252D03130();
    sub_252D1A528();
    sub_252B98C84();
    sub_252CFD77C();
    sub_252D1A578();
    sub_252D03184();
    sub_252B5F80C();
  }
  uint64_t v2 = sub_252D0307C();
  v3(v2);
  sub_252B5FBC4();
  sub_252AF4368();
}

void ParameterDefinition.init(from:)()
{
  sub_252AF4380();
  uint64_t v2 = v1;
  v4 = v3;
  sub_252AC3A24(&qword_269C49070);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v5);
  sub_252B7732C();
  sub_252AC3A68(v2, v2[3]);
  sub_252CFF170();
  sub_252D03144();
  sub_252D1A718();
  if (v0)
  {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v2);
  }
  else
  {
    uint64_t v6 = sub_252D02FA8();
    uint64_t v8 = v7;
    uint64_t v19 = v6;
    sub_252D03048();
    uint64_t v9 = sub_252D02FA8();
    uint64_t v20 = v10;
    uint64_t v18 = v9;
    sub_252B98C84();
    sub_252CFD860();
    swift_bridgeObjectRetain();
    sub_252D1A498();
    sub_252D03184();
    unint64_t v17 = v11;
    sub_252B223A4(v11);
    uint64_t v12 = sub_252D1A408();
    uint64_t v14 = v13;
    uint64_t v16 = v12;
    sub_252B5F658();
    v15();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_252B223A4(v17);
    sub_252B223EC(v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t *v4 = v19;
    v4[1] = v8;
    v4[2] = v18;
    v4[3] = v20;
    v4[4] = v17;
    v4[5] = v16;
    v4[6] = v14;
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_252B223EC(v17);
  }
  swift_bridgeObjectRelease();
  sub_252B5FB60();
  sub_252AF4368();
}

void sub_252CFE04C()
{
}

void sub_252CFE064()
{
}

uint64_t TypeDefinition.nestedDefinitions.getter(unint64_t a1)
{
  switch(a1 >> 61)
  {
    case 1uLL:
      uint64_t v6 = *(void *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + 0x30);
      sub_252AC3A24(&qword_269C44050);
      uint64_t v2 = swift_allocObject();
      *(_OWORD *)(v2 + 16) = xmmword_252D2A140;
      *(void *)(v2 + 32) = a1;
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        sub_252B223A4(a1);
        swift_bridgeObjectRetain();
        uint64_t v8 = v6 + 80;
        while (1)
        {
          unint64_t v9 = *(void *)(v8 - 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_252B223A4(v9);
          swift_bridgeObjectRetain();
          uint64_t v10 = TypeDefinition.nestedDefinitions.getter(v9);
          uint64_t v11 = *(void *)(v10 + 16);
          uint64_t v12 = *(void *)(v2 + 16);
          uint64_t v13 = v12 + v11;
          if (__OFADD__(v12, v11))
          {
            __break(1u);
LABEL_30:
            __break(1u);
LABEL_31:
            __break(1u);
LABEL_32:
            __break(1u);
LABEL_33:
            sub_252D1A3C8();
            __break(1u);
            JUMPOUT(0x252CFE334);
          }
          uint64_t v14 = v10;
          if (v13 > *(void *)(v2 + 24) >> 1)
          {
            if (v12 <= v13) {
              uint64_t v21 = v12 + v11;
            }
            else {
              uint64_t v21 = *(void *)(v2 + 16);
            }
            sub_252BA0E30(1, v21, 1, v2);
            uint64_t v2 = v22;
            if (*(void *)(v14 + 16))
            {
LABEL_11:
              uint64_t v15 = *(void *)(v2 + 16);
              if ((*(void *)(v2 + 24) >> 1) - v15 < v11) {
                goto LABEL_31;
              }
              unint64_t v16 = v2 + 8 * v15 + 32;
              if (v14 + 32 < v16 + 8 * v11 && v16 < v14 + 32 + 8 * v11) {
                goto LABEL_33;
              }
              swift_arrayInitWithCopy();
              if (v11)
              {
                uint64_t v18 = *(void *)(v2 + 16);
                BOOL v19 = __OFADD__(v18, v11);
                uint64_t v20 = v18 + v11;
                if (v19) {
                  goto LABEL_32;
                }
                *(void *)(v2 + 16) = v20;
              }
              goto LABEL_25;
            }
          }
          else if (v11)
          {
            goto LABEL_11;
          }
          if (v11) {
            goto LABEL_30;
          }
LABEL_25:
          v8 += 56;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_252B223EC(v9);
          swift_bridgeObjectRelease();
          if (!--v7)
          {
            swift_bridgeObjectRelease();
            return v2;
          }
        }
      }
      swift_retain();
      return v2;
    case 2uLL:
      unint64_t v3 = *(void *)((a1 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      goto LABEL_5;
    case 3uLL:
    case 4uLL:
      sub_252AC3A24(&qword_269C44050);
      uint64_t v2 = swift_allocObject();
      *(_OWORD *)(v2 + 16) = xmmword_252D2A140;
      *(void *)(v2 + 32) = a1;
      sub_252B223A4(a1);
      return v2;
    default:
      unint64_t v3 = *(void *)(a1 + 16);
LABEL_5:
      sub_252B223A4(v3);
      uint64_t v4 = TypeDefinition.nestedDefinitions.getter(v3);
      sub_252B223EC(v3);
      return v4;
  }
}

unint64_t TypeDefinition.encode(to:)(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 61)
  {
    case 1uLL:
      uint64_t v8 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v7 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
      uint64_t v10 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x20);
      uint64_t v9 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x28);
      uint64_t v12 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x30);
      uint64_t v11 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x38);
      uint64_t v13 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x40);
      uint64_t v14 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x48);
      sub_252AC3A24(&qword_269C49090);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_252D2A140;
      *(void *)(inited + 32) = 0x7463656A626FLL;
      *(void *)(inited + 40) = 0xE600000000000000;
      *(void *)(inited + 48) = v8;
      *(void *)(inited + 56) = v7;
      *(void *)(inited + 64) = v10;
      *(void *)(inited + 72) = v9;
      *(void *)(inited + 80) = v12;
      *(void *)(inited + 88) = v11;
      *(void *)(inited + 96) = v13;
      *(void *)(inited + 104) = v14;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_252D030FC();
      sub_252D01220();
      sub_252D03064();
      goto LABEL_8;
    case 2uLL:
      unint64_t v2 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      sub_252AC3A24(&qword_269C49088);
      uint64_t v3 = swift_initStackObject();
      *(_OWORD *)(v3 + 16) = xmmword_252D2A140;
      uint64_t v4 = 0x6C616E6F6974706FLL;
      unint64_t v5 = 0xE800000000000000;
      goto LABEL_4;
    case 3uLL:
      uint64_t v16 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v17 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x18);
      uint64_t v19 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x20);
      uint64_t v18 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x28);
      uint64_t v20 = *(void *)((a2 & 0x1FFFFFFFFFFFFFFFLL) + 0x30);
      sub_252AC3A24(&qword_269C49078);
      uint64_t v21 = swift_initStackObject();
      *(_OWORD *)(v21 + 16) = xmmword_252D2A140;
      *(void *)(v21 + 32) = 1836412517;
      *(void *)(v21 + 40) = 0xE400000000000000;
      *(void *)(v21 + 48) = v16;
      *(void *)(v21 + 56) = v17;
      *(void *)(v21 + 64) = v19;
      *(void *)(v21 + 72) = v18;
      *(void *)(v21 + 80) = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_252D030FC();
      sub_252D011D4();
      sub_252D03064();
LABEL_8:
      sub_252D19CB8();
      return swift_bridgeObjectRelease();
    case 4uLL:
      return sub_252D19DE8();
    default:
      unint64_t v2 = *(void *)(a2 + 16);
      sub_252AC3A24(&qword_269C49088);
      uint64_t v3 = swift_initStackObject();
      *(_OWORD *)(v3 + 16) = xmmword_252D2A140;
      uint64_t v4 = 0x7961727261;
      unint64_t v5 = 0xE500000000000000;
LABEL_4:
      *(void *)(v3 + 32) = v4;
      *(void *)(v3 + 40) = v5;
      *(void *)(v3 + 48) = v2;
      sub_252B223A4(v2);
      sub_252B223A4(v2);
      sub_252D19CA8();
      sub_252CFD77C();
      sub_252D19CB8();
      swift_bridgeObjectRelease();
      return sub_252B223EC(v2);
  }
}

void TypeDefinition.init(from:)()
{
  sub_252AF4380();
  uint64_t v3 = v2;
  uint64_t v4 = sub_252AC3A24(&qword_269C490A0);
  MEMORY[0x270FA5388](v4 - 8);
  sub_252AF45F0();
  uint64_t v5 = sub_252AC3A24(&qword_269C490A8);
  sub_252AEDBD0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252D02F64();
  sub_252D0126C();
  sub_252D1A718();
  if (v0)
  {

    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v1, 1, 1, v5);
    sub_252D012B8(v1);
    sub_252AC7DA4((uint64_t)v3, (uint64_t)&v49);
    uint64_t v12 = sub_252D19DA8();
    uint64_t v13 = v11;
    BOOL v14 = v12 == 7958113 && v11 == 0xE300000000000000;
    if (v14
      || (sub_252D02F48() & 1) != 0
      || (v12 == 1819242338 ? (BOOL v29 = v13 == 0xE400000000000000) : (BOOL v29 = 0), v29 || (sub_252D02F48() & 1) != 0))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      BOOL v35 = v12 == 7630441 && v13 == 0xE300000000000000;
      if (!v35 && (sub_252D02F48() & 1) == 0)
      {
        BOOL v36 = v12 == 0x656C62756F64 && v13 == 0xE600000000000000;
        if (!v36 && (sub_252D02F48() & 1) == 0)
        {
          BOOL v37 = v12 == 0x676E69727473 && v13 == 0xE600000000000000;
          if (!v37 && (sub_252D02F48() & 1) == 0)
          {
            BOOL v38 = v12 == 7107189 && v13 == 0xE300000000000000;
            if (!v38 && (sub_252D02F48() & 1) == 0)
            {
              BOOL v39 = v12 == 1702125924 && v13 == 0xE400000000000000;
              if (!v39 && (sub_252D1A5D8() & 1) == 0)
              {
                BOOL v40 = v12 == 0x706D6F4365746164 && v13 == 0xEE0073746E656E6FLL;
                if (!v40 && (sub_252D1A5D8() & 1) == 0)
                {
                  if (v12 == 0x72616D6563616C70 && v13 == 0xE90000000000006BLL)
                  {
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    char v42 = sub_252D1A5D8();
                    swift_bridgeObjectRelease();
                    if ((v42 & 1) == 0)
                    {
                      uint64_t v43 = sub_252D1A308();
                      swift_allocError();
                      uint64_t v45 = v44;
                      sub_252AC3A68(v3, v3[3]);
                      sub_252D1A6F8();
                      sub_252D1A2F8();
                      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v43 - 8) + 104))(v45, *MEMORY[0x263F8DCB8], v43);
                      swift_willThrow();
                      goto LABEL_21;
                    }
                  }
                  sub_252D02EF0();
                  goto LABEL_21;
                }
              }
            }
          }
        }
      }
      swift_bridgeObjectRelease();
      sub_252D02EF0();
    }
  }
  else
  {
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v1, 0, 1, v5);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v10, v1, v5);
    uint64_t v15 = sub_252D1A4C8();
    if (*(void *)(v15 + 16))
    {
      uint64_t v16 = *(unsigned __int8 *)(v15 + 32);
      swift_bridgeObjectRelease();
      switch(v16)
      {
        case 2:
          sub_252D013AC();
          sub_252D02EC8();
          uint64_t v23 = sub_252D02EFC();
          v24(v23);
          long long v47 = v50;
          long long v48 = v49;
          long long v46 = v51;
          uint64_t v25 = v52;
          uint64_t v26 = v53;
          uint64_t v27 = swift_allocObject();
          long long v28 = v47;
          *(_OWORD *)(v27 + 16) = v48;
          *(_OWORD *)(v27 + 32) = v28;
          *(_OWORD *)(v27 + 48) = v46;
          *(void *)(v27 + 64) = v25;
          *(void *)(v27 + 72) = v26;
          break;
        case 3:
          sub_252D01318();
          sub_252D02EC8();
          uint64_t v30 = sub_252D02EFC();
          v31(v30);
          long long v47 = v50;
          long long v48 = v49;
          uint64_t v32 = v51;
          uint64_t v33 = swift_allocObject();
          long long v34 = v47;
          *(_OWORD *)(v33 + 16) = v48;
          *(_OWORD *)(v33 + 32) = v34;
          *(void *)(v33 + 48) = v32;
          break;
        default:
          sub_252CFD860();
          sub_252D02EC8();
          uint64_t v17 = sub_252D02EFC();
          v18(v17);
          uint64_t v19 = v49;
          *(void *)(swift_allocObject() + 16) = v19;
          break;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v20 = sub_252D1A308();
      swift_allocError();
      *(void *)&long long v48 = v21;
      sub_252AC3A68(v3, v3[3]);
      sub_252D1A6F8();
      uint64_t v22 = v48;
      sub_252D1A2F8();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB8], v20);
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
    }
  }
LABEL_21:
  _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v3);
  sub_252B5FB60();
  sub_252AF4368();
}

uint64_t static ObjectDefinition.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1 = sub_252CBA2B4(a1);
  uint64_t v4 = v3[1];
  uint64_t v5 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v6 = v3[4];
  uint64_t v8 = v3[5];
  uint64_t v9 = v3[6];
  uint64_t v10 = v3[7];
  uint64_t v12 = v2[2];
  uint64_t v11 = v2[3];
  uint64_t v14 = v2[4];
  uint64_t v13 = v2[5];
  BOOL v15 = v1 == *v2 && v4 == v2[1];
  uint64_t v16 = v2[6];
  uint64_t v25 = v10;
  uint64_t v26 = v2[7];
  if (!v15)
  {
    sub_252D1A5D8();
    uint64_t result = sub_252B5F6F8();
    if ((v18 & 1) == 0) {
      return result;
    }
  }
  if (!v7)
  {
    if (v11) {
      return 0;
    }
    goto LABEL_15;
  }
  if (!v11) {
    return 0;
  }
  BOOL v19 = v5 == v12 && v7 == v11;
  if (v19 || (sub_252D1A5D8(), uint64_t result = sub_252B5F6F8(), (v20 & 1) != 0))
  {
LABEL_15:
    if (sub_252B1DB04(v6, v14))
    {
      if (v9)
      {
        if (!v16) {
          return 0;
        }
        if (v8 != v13 || v9 != v16)
        {
          sub_252D03024();
          uint64_t result = sub_252B5F6F8();
          if ((v22 & 1) == 0) {
            return result;
          }
        }
      }
      else if (v16)
      {
        return 0;
      }
      if (v25)
      {
        if (v26)
        {
          swift_bridgeObjectRetain();
          uint64_t v23 = swift_bridgeObjectRetain();
          char v24 = sub_252B1DD5C(v23, v26);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v24) {
            return 1;
          }
        }
      }
      else if (!v26)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t static EnumDefinition.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1 = sub_252CBA2B4(a1);
  uint64_t v4 = v3[2];
  uint64_t v5 = v3[3];
  uint64_t v7 = v2[2];
  uint64_t v6 = v2[3];
  BOOL v8 = v1 == *v2 && v3[1] == v2[1];
  if (!v8 && (sub_252D1A5D8() & 1) == 0) {
    return 0;
  }
  if (v5)
  {
    if (v6)
    {
      BOOL v9 = v4 == v7 && v5 == v6;
      if (v9 || (sub_252D1A5D8() & 1) != 0) {
        goto LABEL_13;
      }
    }
    return 0;
  }
  if (v6) {
    return 0;
  }
LABEL_13:
  uint64_t v10 = (void *)sub_252AEA3DC();

  return sub_252B1D710(v10, v11);
}

unint64_t sub_252CFF170()
{
  unint64_t result = qword_269C49068;
  if (!qword_269C49068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49068);
  }
  return result;
}

void sub_252CFF1BC(void *a1@<X8>)
{
  TypeDefinition.init(from:)();
  if (!v1) {
    *a1 = v3;
  }
}

unint64_t sub_252CFF1E8(uint64_t a1)
{
  return TypeDefinition.encode(to:)(a1, *v1);
}

uint64_t sub_252CFF204(unint64_t *a1, unint64_t *a2)
{
  return static TypeDefinition.== infix(_:_:)(*a1, *a2);
}

uint64_t ObjectDefinition.id.getter()
{
  return sub_252AEA3DC();
}

uint64_t ObjectDefinition.id.setter()
{
  uint64_t result = sub_252AF46E4();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*ObjectDefinition.id.modify())()
{
  return nullsub_1;
}

uint64_t ObjectDefinition.bundleId.getter()
{
  return sub_252AEA3DC();
}

uint64_t ObjectDefinition.bundleId.setter()
{
  uint64_t result = sub_252CBBB74();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*ObjectDefinition.bundleId.modify())()
{
  return nullsub_1;
}

uint64_t ObjectDefinition.properties.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*ObjectDefinition.properties.modify())()
{
  return nullsub_1;
}

uint64_t ObjectDefinition.explanation.getter()
{
  return sub_252AEA3DC();
}

uint64_t ObjectDefinition.explanation.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*ObjectDefinition.explanation.modify())()
{
  return nullsub_1;
}

uint64_t ObjectDefinition.queries.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ObjectDefinition.queries.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = a1;
  return result;
}

uint64_t (*ObjectDefinition.queries.modify())()
{
  return nullsub_1;
}

uint64_t ObjectDefinition.init(id:bundleId:properties:explanation:queries:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t sub_252CFF42C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_252D1A5D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
    if (v6 || (sub_252D1A5D8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x69747265706F7270 && a2 == 0xEA00000000007365;
      if (v7 || (sub_252D1A5D8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x74616E616C707865 && a2 == 0xEB000000006E6F69;
        if (v8 || (sub_252D1A5D8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x73656972657571 && a2 == 0xE700000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v10 = sub_252D1A5D8();
          swift_bridgeObjectRelease();
          if (v10) {
            return 4;
          }
          else {
            return 5;
          }
        }
      }
    }
  }
}

uint64_t sub_252CFF648(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6449656C646E7562;
      break;
    case 2:
      uint64_t result = 0x69747265706F7270;
      break;
    case 3:
      uint64_t result = 0x74616E616C707865;
      break;
    case 4:
      uint64_t result = 0x73656972657571;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252CFF6F8()
{
  return sub_252CFF648(*v0);
}

uint64_t sub_252CFF700@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252CFF42C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252CFF728(uint64_t a1)
{
  unint64_t v2 = sub_252D01488();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252CFF764(uint64_t a1)
{
  unint64_t v2 = sub_252D01488();

  return MEMORY[0x270FA00B8](a1, v2);
}

void ObjectDefinition.encode(to:)()
{
  sub_252AF4380();
  uint64_t v2 = sub_252AC3A24(&qword_269C490C8);
  sub_252AEDBD0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  sub_252D02F14();
  sub_252D02F64();
  sub_252D01488();
  sub_252D03004();
  sub_252D030AC();
  if (!v0)
  {
    sub_252D0311C();
    sub_252B5F80C();
    sub_252AC3A24(&qword_269C49018);
    sub_252D01520(&qword_269C49020, &qword_269C49018, (void (*)(void))sub_252CFD7C8);
    sub_252D02FE4();
    sub_252D1A578();
    sub_252B5F80C();
    sub_252D03178();
    sub_252AC3A24(&qword_269C490D8);
    sub_252D01520(&qword_269C490E0, &qword_269C490D8, (void (*)(void))sub_252D014D4);
    sub_252D02FE4();
    sub_252D1A518();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
  sub_252B5FBC4();
  sub_252AF4368();
}

void ObjectDefinition.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_252AF4380();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  sub_252AC3A24(&qword_269C490F0);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v15);
  sub_252B7732C();
  sub_252AC3A68(v12, v12[3]);
  sub_252D01488();
  sub_252D1A718();
  if (v10)
  {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v12);
  }
  else
  {
    uint64_t v16 = sub_252D1A448();
    uint64_t v18 = v17;
    uint64_t v32 = v16;
    LOBYTE(a10) = 1;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_252D03158();
    uint64_t v21 = v20;
    uint64_t v30 = v19;
    v31 = v14;
    sub_252AC3A24(&qword_269C49018);
    sub_252D01520(&qword_269C49048, &qword_269C49018, (void (*)(void))sub_252CFD8AC);
    swift_bridgeObjectRetain();
    sub_252D1A498();
    uint64_t v22 = a10;
    LOBYTE(a10) = 3;
    uint64_t v29 = v22;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_252D03158();
    uint64_t v25 = v24;
    uint64_t v28 = v23;
    sub_252AC3A24(&qword_269C490D8);
    sub_252D03178();
    sub_252D01520(&qword_269C490F8, &qword_269C490D8, (void (*)(void))sub_252D0158C);
    swift_bridgeObjectRetain();
    sub_252D1A438();
    uint64_t v26 = sub_252D02EB0();
    v27(v26);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t *v31 = v32;
    v31[1] = v18;
    v31[2] = v30;
    v31[3] = v21;
    v31[4] = v29;
    v31[5] = v28;
    v31[6] = v25;
    v31[7] = a10;
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_252AF4368();
}

void sub_252CFFD3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ObjectDefinition.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_252CFFD54()
{
}

uint64_t EnumDefinition.id.getter()
{
  return sub_252AEA3DC();
}

uint64_t EnumDefinition.id.setter()
{
  uint64_t result = sub_252AF46E4();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*EnumDefinition.id.modify())()
{
  return nullsub_1;
}

uint64_t EnumDefinition.bundleId.getter()
{
  return sub_252AEA3DC();
}

uint64_t EnumDefinition.bundleId.setter()
{
  uint64_t result = sub_252CBBB74();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*EnumDefinition.bundleId.modify())()
{
  return nullsub_1;
}

uint64_t EnumDefinition.cases.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*EnumDefinition.cases.modify())()
{
  return nullsub_1;
}

void __swiftcall EnumDefinition.init(id:bundleId:cases:)(IntelligenceFlow::EnumDefinition *__return_ptr retstr, Swift::String id, Swift::String_optional bundleId, Swift::OpaquePointer cases)
{
  retstr->id = id;
  retstr->bundleId = bundleId;
  retstr->cases = cases;
}

uint64_t sub_252CFFEB0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_252D1A5D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
    if (v6 || (sub_252D1A5D8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x7365736163 && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_252D1A5D8();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_252CFFFE0(char a1)
{
  if (!a1) {
    return 25705;
  }
  if (a1 == 1) {
    return 0x6449656C646E7562;
  }
  return 0x7365736163;
}

uint64_t sub_252D00028()
{
  return sub_252CFFFE0(*v0);
}

uint64_t sub_252D00030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252CFFEB0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D00058(uint64_t a1)
{
  unint64_t v2 = sub_252D015D8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D00094(uint64_t a1)
{
  unint64_t v2 = sub_252D015D8();

  return MEMORY[0x270FA00B8](a1, v2);
}

void EnumDefinition.encode(to:)()
{
  sub_252AF4380();
  unint64_t v2 = v1;
  sub_252AC3A24(&qword_269C49108);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v3);
  sub_252B23278();
  sub_252AC3A68(v2, v2[3]);
  sub_252D015D8();
  sub_252D1A738();
  sub_252D030AC();
  if (!v0)
  {
    sub_252B5F80C();
    sub_252B98C84();
    sub_252AC3A24(qword_269C41E38);
    sub_252D01624(&qword_269C493B0);
    sub_252D1A578();
  }
  uint64_t v4 = sub_252D0307C();
  v5(v4);
  sub_252B5FBC4();
  sub_252AF4368();
}

void EnumDefinition.init(from:)()
{
  sub_252AF4380();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_252AC3A24(&qword_269C49118);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v5);
  sub_252AC3A68(v2, v2[3]);
  sub_252D015D8();
  sub_252D1A718();
  if (v0)
  {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v2);
  }
  else
  {
    uint64_t v6 = sub_252D1A448();
    uint64_t v8 = v7;
    uint64_t v14 = v6;
    sub_252D03048();
    uint64_t v9 = sub_252D1A408();
    uint64_t v11 = v10;
    uint64_t v13 = v9;
    sub_252AC3A24(qword_269C41E38);
    sub_252B98C84();
    sub_252D01624(&qword_269C493C0);
    swift_bridgeObjectRetain();
    sub_252D1A498();
    sub_252B5F658();
    v12();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t *v4 = v14;
    v4[1] = v8;
    v4[2] = v13;
    v4[3] = v11;
    v4[4] = v15;
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_252B5FB60();
  sub_252AF4368();
}

void sub_252D004DC()
{
}

void sub_252D004F4()
{
}

uint64_t QueryDefinition.id.getter()
{
  return sub_252AEA3DC();
}

uint64_t QueryDefinition.id.setter()
{
  uint64_t result = sub_252AF46E4();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*QueryDefinition.id.modify())()
{
  return nullsub_1;
}

uint64_t QueryDefinition.entityId.getter()
{
  return sub_252AEA3DC();
}

uint64_t QueryDefinition.entityId.setter()
{
  uint64_t result = sub_252CBBB74();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*QueryDefinition.entityId.modify())()
{
  return nullsub_1;
}

uint64_t QueryDefinition.bundleId.getter()
{
  return sub_252AEA3DC();
}

uint64_t QueryDefinition.bundleId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*QueryDefinition.bundleId.modify())()
{
  return nullsub_1;
}

uint64_t QueryDefinition.parameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t QueryDefinition.parameters.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*QueryDefinition.parameters.modify())()
{
  return nullsub_1;
}

void __swiftcall QueryDefinition.init(id:entityId:bundleId:parameters:)(IntelligenceFlow::QueryDefinition *__return_ptr retstr, Swift::String id, Swift::String entityId, Swift::String bundleId, Swift::OpaquePointer parameters)
{
  retstr->id = id;
  retstr->entityId = entityId;
  retstr->bundleId = bundleId;
  retstr->parameters = parameters;
}

uint64_t static QueryDefinition.== infix(_:_:)(uint64_t a1)
{
  uint64_t v2 = sub_252D03190(a1);
  uint64_t v7 = v5[3];
  uint64_t v6 = v5[4];
  uint64_t v8 = v5[5];
  uint64_t v9 = v4[2];
  uint64_t v10 = v4[3];
  uint64_t v11 = v4[4];
  uint64_t v12 = v4[5];
  BOOL v13 = v2 == *v4 && v3 == v4[1];
  if (!v13 && (sub_252D1A5D8() & 1) == 0) {
    return 0;
  }
  BOOL v14 = v1 == v9 && v7 == v10;
  if (!v14 && (sub_252D030C4() & 1) == 0) {
    return 0;
  }
  BOOL v15 = v6 == v11 && v8 == v12;
  if (!v15 && (sub_252D03024() & 1) == 0) {
    return 0;
  }
  uint64_t v16 = sub_252AEA3DC();

  return sub_252B1DB04(v16, v17);
}

uint64_t sub_252D007A8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_252D1A5D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6449797469746E65 && a2 == 0xE800000000000000;
    if (v6 || (sub_252D1A5D8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
      if (v7 || (sub_252D1A5D8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6574656D61726170 && a2 == 0xEA00000000007372)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_252D1A5D8();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_252D00954(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x797469746E65;
      goto LABEL_4;
    case 2:
      uint64_t v3 = 0x656C646E7562;
LABEL_4:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6449000000000000;
      break;
    case 3:
      uint64_t result = 0x6574656D61726170;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252D009DC()
{
  return sub_252D00954(*v0);
}

uint64_t sub_252D009E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D007A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D00A0C(uint64_t a1)
{
  unint64_t v2 = sub_252D01688();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D00A48(uint64_t a1)
{
  unint64_t v2 = sub_252D01688();

  return MEMORY[0x270FA00B8](a1, v2);
}

void QueryDefinition.encode(to:)()
{
  sub_252AF4380();
  uint64_t v2 = sub_252AC3A24(&qword_269C49120);
  sub_252AEDBD0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  sub_252D02F14();
  sub_252D02F64();
  sub_252D01688();
  sub_252D03004();
  sub_252D030AC();
  if (!v0)
  {
    sub_252D03130();
    sub_252D1A528();
    sub_252B98C84();
    sub_252D1A528();
    sub_252D03184();
    sub_252AC3A24(&qword_269C49018);
    sub_252D01520(&qword_269C49020, &qword_269C49018, (void (*)(void))sub_252CFD7C8);
    sub_252D1A578();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
  sub_252B5FBC4();
  sub_252AF4368();
}

void QueryDefinition.init(from:)()
{
  sub_252AF4380();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_252AC3A24(&qword_269C49130);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v5);
  sub_252B7732C();
  sub_252AC3A68(v2, v2[3]);
  sub_252D01688();
  sub_252D03144();
  sub_252D1A718();
  if (v0)
  {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v2);
  }
  else
  {
    uint64_t v6 = sub_252D02FA8();
    uint64_t v8 = v7;
    sub_252D03048();
    uint64_t v9 = sub_252D02FA8();
    uint64_t v18 = v10;
    uint64_t v16 = v9;
    uint64_t v17 = v6;
    sub_252B98C84();
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_252D1A448();
    uint64_t v12 = v11;
    sub_252AC3A24(&qword_269C49018);
    sub_252D03184();
    sub_252D01520(&qword_269C49048, &qword_269C49018, (void (*)(void))sub_252CFD8AC);
    swift_bridgeObjectRetain();
    sub_252D1A498();
    uint64_t v13 = sub_252D02E98();
    v14(v13);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t *v4 = v17;
    v4[1] = v8;
    v4[2] = v16;
    v4[3] = v18;
    v4[4] = v15;
    v4[5] = v12;
    v4[6] = v19;
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_252B5FB60();
  sub_252AF4368();
}

uint64_t sub_252D00EF8()
{
  unint64_t v0 = sub_252D1A3D8();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_252D00F48(char a1)
{
  uint64_t result = 0x7961727261;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6C616E6F6974706FLL;
      break;
    case 2:
      uint64_t result = 0x7463656A626FLL;
      break;
    case 3:
      uint64_t result = 1836412517;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252D00FCC(char a1)
{
  uint64_t result = 0x7961727261;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6C616E6F6974706FLL;
      break;
    case 2:
      uint64_t result = 0x7463656A626FLL;
      break;
    case 3:
      uint64_t result = 1836412517;
      break;
    default:
      return result;
  }
  return result;
}

void sub_252D01050()
{
}

void sub_252D01068()
{
}

uint64_t sub_252D01084(unsigned __int8 *a1, char *a2)
{
  return sub_252B01240(*a1, *a2);
}

uint64_t sub_252D01090()
{
  return sub_252CFBF08(*v0, (void (*)(unsigned char *, uint64_t))sub_252B4CFCC);
}

uint64_t sub_252D010C0()
{
  return sub_252B4CFCC();
}

uint64_t sub_252D010C8(uint64_t a1)
{
  return sub_252B4D1BC(a1, *v1);
}

uint64_t sub_252D010D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252D00EF8();
  *a1 = result;
  return result;
}

uint64_t sub_252D01100@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_252D00F48(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_252D0112C()
{
  return sub_252D00FCC(*v0);
}

uint64_t sub_252D01134@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_252D00F44();
  *a1 = result;
  return result;
}

uint64_t sub_252D0115C(uint64_t a1)
{
  unint64_t v2 = sub_252D0126C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D01198(uint64_t a1)
{
  unint64_t v2 = sub_252D0126C();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_252D011D4()
{
  unint64_t result = qword_269C49080;
  if (!qword_269C49080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49080);
  }
  return result;
}

unint64_t sub_252D01220()
{
  unint64_t result = qword_269C49098;
  if (!qword_269C49098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49098);
  }
  return result;
}

unint64_t sub_252D0126C()
{
  unint64_t result = qword_269C490B0;
  if (!qword_269C490B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C490B0);
  }
  return result;
}

uint64_t sub_252D012B8(uint64_t a1)
{
  uint64_t v2 = sub_252AC3A24(&qword_269C490A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_252D01318()
{
  unint64_t result = qword_269C490B8;
  if (!qword_269C490B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C490B8);
  }
  return result;
}

uint64_t sub_252D01364()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

unint64_t sub_252D013AC()
{
  unint64_t result = qword_269C490C0;
  if (!qword_269C490C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C490C0);
  }
  return result;
}

uint64_t sub_252D013F8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_252D01450()
{
  sub_252B223EC(*(void *)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_252D01488()
{
  unint64_t result = qword_269C490D0;
  if (!qword_269C490D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C490D0);
  }
  return result;
}

unint64_t sub_252D014D4()
{
  unint64_t result = qword_269C490E8;
  if (!qword_269C490E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C490E8);
  }
  return result;
}

uint64_t sub_252D01520(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252AEA288(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_252D0158C()
{
  unint64_t result = qword_269C49100;
  if (!qword_269C49100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49100);
  }
  return result;
}

unint64_t sub_252D015D8()
{
  unint64_t result = qword_269C49110;
  if (!qword_269C49110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49110);
  }
  return result;
}

uint64_t sub_252D01624(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252AEA288(qword_269C41E38);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_252D01688()
{
  unint64_t result = qword_269C49128;
  if (!qword_269C49128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49128);
  }
  return result;
}

unint64_t sub_252D016D8()
{
  unint64_t result = qword_269C49138;
  if (!qword_269C49138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49138);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ToolEffect(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D017F0);
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

void type metadata accessor for ToolEffect()
{
}

uint64_t destroy for ToolDefinition(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 64);
  if ((~v2 & 0xF000000000000007) != 0) {
    sub_252B223EC(v2);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ToolDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  unint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((~v8 & 0xF000000000000007) != 0) {
    sub_252B223A4(v8);
  }
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v9;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ToolDefinition(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (unint64_t *)(a1 + 64);
  unint64_t v5 = *(void *)(a2 + 64);
  unint64_t v6 = v5 & 0xF000000000000007;
  if ((~*(void *)(a1 + 64) & 0xF000000000000007) != 0)
  {
    if (v6 == 0xF000000000000007)
    {
      sub_252CF61DC(a1 + 64);
      unint64_t *v4 = *(void *)(a2 + 64);
    }
    else
    {
      sub_252B223A4(*(void *)(a2 + 64));
      unint64_t v7 = *v4;
      unint64_t *v4 = v5;
      sub_252B223EC(v7);
    }
  }
  else
  {
    if (v6 != 0xF000000000000007) {
      sub_252B223A4(*(void *)(a2 + 64));
    }
    unint64_t *v4 = v5;
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t assignWithTake for ToolDefinition(uint64_t a1, uint64_t a2)
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
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)(a1 + 64);
  unint64_t v8 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a2 + 64);
  if ((~v8 & 0xF000000000000007) != 0)
  {
    if ((~v10 & 0xF000000000000007) != 0)
    {
      *uint64_t v9 = v10;
      sub_252B223EC(v8);
      goto LABEL_6;
    }
    sub_252CF61DC(a1 + 64);
  }
  *uint64_t v9 = v10;
LABEL_6:
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolDefinition(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 81))
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

uint64_t storeEnumTagSinglePayload for ToolDefinition(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 81) = 1;
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
    *(unsigned char *)(result + 81) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ToolDefinition()
{
}

uint64_t destroy for ParameterDefinition(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_252B223EC(*(void *)(a1 + 32));

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ParameterDefinition(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  unint64_t v6 = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_252B223A4(v6);
  uint64_t v8 = a2[5];
  uint64_t v7 = a2[6];
  a1[4] = v6;
  a1[5] = v8;
  a1[6] = v7;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ParameterDefinition(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v4 = a2[4];
  sub_252B223A4(v4);
  unint64_t v5 = a1[4];
  a1[4] = v4;
  sub_252B223EC(v5);
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ParameterDefinition(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  swift_bridgeObjectRelease();
  sub_252B223EC(a1[4]);
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  a1[6] = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for ParameterDefinition()
{
}

unint64_t *initializeBufferWithCopyOfBuffer for TypeDefinition(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_252B223A4(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for TypeDefinition(unint64_t *a1)
{
  return sub_252B223EC(*a1);
}

unint64_t *assignWithCopy for TypeDefinition(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  sub_252B223A4(*a2);
  unint64_t v4 = *a1;
  *a1 = v3;
  sub_252B223EC(v4);
  return a1;
}

void *initializeWithTake for TypeDefinition(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for TypeDefinition(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  *a1 = *a2;
  sub_252B223EC(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for TypeDefinition(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7C && *(unsigned char *)(a1 + 8))
    {
      unsigned int v2 = *(_DWORD *)a1 + 123;
    }
    else
    {
      unsigned int v2 = (((*(void *)a1 >> 57) >> 4) | (8 * ((*(void *)a1 >> 57) & 8 | *(void *)a1 & 7))) ^ 0x7F;
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

uint64_t storeEnumTagSinglePayload for TypeDefinition(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7B)
  {
    *(void *)unint64_t result = a2 - 124;
    if (a3 >= 0x7C) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7C) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_252D01F00(void *a1)
{
  uint64_t v1 = *a1 >> 61;
  if (v1 <= 3) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 4;
  }
}

void *sub_252D01F1C(void *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_252D01F2C(unint64_t *result, uint64_t a2)
{
  if (a2 < 4)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 61;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 4);
    unint64_t v3 = 0x8000000000000000;
  }
  *unint64_t result = v2 | v3;
  return result;
}

void type metadata accessor for TypeDefinition()
{
}

uint64_t destroy for ObjectDefinition()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ObjectDefinition(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ObjectDefinition(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ObjectDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for ObjectDefinition()
{
}

uint64_t getEnumTagSinglePayload for EnumDefinition(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
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

uint64_t storeEnumTagSinglePayload for EnumDefinition(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for EnumDefinition()
{
}

uint64_t destroy for QueryDefinition()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for QueryDefinition(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for QueryDefinition(void *a1, void *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for QueryDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16IntelligenceFlow19ParameterDefinitionVwet_0(uint64_t a1, int a2)
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

uint64_t sub_252D0240C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

void type metadata accessor for QueryDefinition()
{
}

ValueMetadata *type metadata accessor for QueryDefinition.CodingKeys()
{
  return &type metadata for QueryDefinition.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for EnumDefinition.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D02544);
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

ValueMetadata *type metadata accessor for EnumDefinition.CodingKeys()
{
  return &type metadata for EnumDefinition.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ObjectDefinition.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D02648);
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

ValueMetadata *type metadata accessor for ObjectDefinition.CodingKeys()
{
  return &type metadata for ObjectDefinition.CodingKeys;
}

ValueMetadata *type metadata accessor for TypeDefinition.ComplexKey()
{
  return &type metadata for TypeDefinition.ComplexKey;
}

unsigned char *_s16IntelligenceFlow15QueryDefinitionV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D0275CLL);
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

ValueMetadata *type metadata accessor for ParameterDefinition.CodingKeys()
{
  return &type metadata for ParameterDefinition.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ToolDefinition.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D02860);
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

ValueMetadata *type metadata accessor for ToolDefinition.CodingKeys()
{
  return &type metadata for ToolDefinition.CodingKeys;
}

unint64_t sub_252D0289C()
{
  unint64_t result = qword_269C49140;
  if (!qword_269C49140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49140);
  }
  return result;
}

unint64_t sub_252D028EC()
{
  unint64_t result = qword_269C49148;
  if (!qword_269C49148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49148);
  }
  return result;
}

unint64_t sub_252D0293C()
{
  unint64_t result = qword_269C49150;
  if (!qword_269C49150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49150);
  }
  return result;
}

unint64_t sub_252D0298C()
{
  unint64_t result = qword_269C49158;
  if (!qword_269C49158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49158);
  }
  return result;
}

unint64_t sub_252D029DC()
{
  unint64_t result = qword_269C49160;
  if (!qword_269C49160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49160);
  }
  return result;
}

unint64_t sub_252D02A2C()
{
  unint64_t result = qword_269C49168;
  if (!qword_269C49168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49168);
  }
  return result;
}

unint64_t sub_252D02A7C()
{
  unint64_t result = qword_269C49170;
  if (!qword_269C49170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49170);
  }
  return result;
}

unint64_t sub_252D02ACC()
{
  unint64_t result = qword_269C49178;
  if (!qword_269C49178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49178);
  }
  return result;
}

unint64_t sub_252D02B1C()
{
  unint64_t result = qword_269C49180;
  if (!qword_269C49180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49180);
  }
  return result;
}

unint64_t sub_252D02B6C()
{
  unint64_t result = qword_269C49188;
  if (!qword_269C49188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49188);
  }
  return result;
}

unint64_t sub_252D02BBC()
{
  unint64_t result = qword_269C49190;
  if (!qword_269C49190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49190);
  }
  return result;
}

unint64_t sub_252D02C0C()
{
  unint64_t result = qword_269C49198;
  if (!qword_269C49198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49198);
  }
  return result;
}

unint64_t sub_252D02C5C()
{
  unint64_t result = qword_269C491A0;
  if (!qword_269C491A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C491A0);
  }
  return result;
}

unint64_t sub_252D02CAC()
{
  unint64_t result = qword_269C491A8;
  if (!qword_269C491A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C491A8);
  }
  return result;
}

unint64_t sub_252D02CFC()
{
  unint64_t result = qword_269C491B0;
  if (!qword_269C491B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C491B0);
  }
  return result;
}

unint64_t sub_252D02D4C()
{
  unint64_t result = qword_269C491B8;
  if (!qword_269C491B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C491B8);
  }
  return result;
}

unint64_t sub_252D02D9C()
{
  unint64_t result = qword_269C491C0;
  if (!qword_269C491C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C491C0);
  }
  return result;
}

unint64_t sub_252D02DEC()
{
  unint64_t result = qword_269C491C8;
  if (!qword_269C491C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C491C8);
  }
  return result;
}

unint64_t sub_252D02E38()
{
  unint64_t result = qword_269C491D0;
  if (!qword_269C491D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C491D0);
  }
  return result;
}

uint64_t sub_252D02E98()
{
  return v0;
}

uint64_t sub_252D02EB0()
{
  return v0;
}

uint64_t sub_252D02EC8()
{
  return sub_252D1A498();
}

uint64_t sub_252D02EFC()
{
  return v0;
}

void sub_252D02F14()
{
  uint64_t v2 = v0[2];
  *(void *)(v1 - 112) = v0[3];
  *(void *)(v1 - 104) = v2;
  uint64_t v3 = v0[4];
  *(void *)(v1 - 128) = v0[5];
  *(void *)(v1 - 120) = v3;
}

uint64_t sub_252D02F48()
{
  return sub_252D1A5D8();
}

void *sub_252D02F64()
{
  return sub_252AC3A68(v0, v0[3]);
}

uint64_t sub_252D02FA8()
{
  return sub_252D1A448();
}

uint64_t sub_252D02FC4()
{
  return sub_252D1A448();
}

uint64_t sub_252D02FE4()
{
  return v0 - 72;
}

uint64_t sub_252D03004()
{
  return sub_252D1A738();
}

uint64_t sub_252D03024()
{
  return sub_252D1A5D8();
}

uint64_t sub_252D03048()
{
  *(unsigned char *)(v0 - 66) = 1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_252D03064()
{
  return v0;
}

uint64_t sub_252D0307C()
{
  return v0;
}

uint64_t sub_252D03094()
{
  return v0 - 72;
}

uint64_t sub_252D030AC()
{
  return sub_252D1A528();
}

uint64_t sub_252D030C4()
{
  return sub_252D1A5D8();
}

uint64_t sub_252D030E8()
{
  return v0;
}

uint64_t sub_252D030FC()
{
  return sub_252D19CA8();
}

uint64_t sub_252D0311C()
{
  *(unsigned char *)(v0 - 72) = 1;
  return *(void *)(v0 - 104);
}

uint64_t sub_252D03130()
{
  *(unsigned char *)(v0 - 66) = 1;
  return *(void *)(v0 - 104);
}

uint64_t sub_252D03158()
{
  return sub_252D1A408();
}

void sub_252D03178()
{
  *(unsigned char *)(v0 - 81) = 4;
}

void sub_252D03184()
{
  *(unsigned char *)(v0 - 68) = 3;
}

uint64_t sub_252D03190(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t UUID.init(namespace:name:)(uint64_t a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_252D19D98();
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_252D19F08();
  *(void *)(v3 + 16) = 20;
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = 0;
  *(_DWORD *)(v3 + 48) = 0;
  v12[0] = v3;
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  uint64_t v4 = sub_252D19568();
  sub_252D035D4(v4, v5, v2, v12, &c);
  uint64_t v6 = v12[0];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_252D037E8(v6);
    uint64_t v6 = v10;
  }
  unint64_t v7 = *(void *)(v6 + 16);
  if (v7 < 7)
  {
    __break(1u);
    goto LABEL_14;
  }
  *(unsigned char *)(v6 + 38) = *(unsigned char *)(v6 + 38) & 0xF | 0x50;
  if (v7 < 9)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  *(unsigned char *)(v6 + 40) = *(unsigned char *)(v6 + 40) & 0x3F | 0x80;
  v12[0] = v6;
  if (v7 == 9)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v7 == 10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v7 < 0xC)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v7 == 12)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v7 < 0xE)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v7 == 14)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
  if (v7 < 0x10) {
    goto LABEL_21;
  }
  sub_252D19558();
  uint64_t v8 = sub_252D19588();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_252D033BC(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, CC_SHA1_CTX *a5)
{
  return sub_252D033F4((const void *)(a3 + 32), a3 + 32 + *(void *)(a3 + 16), a4, a5, a1, a2);
}

uint64_t sub_252D033F4(const void *a1, uint64_t a2, uint64_t *a3, CC_SHA1_CTX *a4, void *a5, uint64_t a6)
{
  uint64_t v12 = *a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v12;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_252D037E8(v12);
    uint64_t v12 = v15;
    *a3 = v15;
  }
  uint64_t result = sub_252D034A4((unsigned __int8 *)(v12 + 32), *(void *)(v12 + 16), a4, a5, a6, a1, a2);
  *a3 = v12;
  return result;
}

uint64_t sub_252D034A4(unsigned __int8 *a1, int a2, CC_SHA1_CTX *c, void *data, uint64_t a5, const void *a6, uint64_t a7)
{
  if (data) {
    unint64_t v8 = a5 - (void)data;
  }
  else {
    unint64_t v8 = 0;
  }
  if ((v8 & 0x8000000000000000) == 0 && !HIDWORD(v8))
  {
    CC_SHA1_Update(c, data, v8);
    uint64_t v12 = a7 - (void)a6;
    if (!a6) {
      uint64_t v12 = 0;
    }
    unint64_t v13 = v12 - 1;
    if (__OFSUB__(v12, 1))
    {
      __break(1u);
    }
    else if ((v13 & 0x8000000000000000) == 0 && !HIDWORD(v13))
    {
      CC_SHA1_Update(c, a6, v13);
      return CC_SHA1_Final(a1, c);
    }
  }
  uint64_t result = sub_252D1A368();
  __break(1u);
  return result;
}

uint64_t sub_252D035D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, CC_SHA1_CTX *a5)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v6[0] = a1;
  v6[1] = a2;
  sub_252D033BC(v6, (uint64_t)&v7, a3, a4, a5);
  return swift_release();
}

uint64_t UUID.init(namespace:name:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252D19588();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_252D19508();
  UUID.init(namespace:name:)((uint64_t)v7);
  unint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(a2, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v8)(a1, v4);
}

void sub_252D037E8(uint64_t a1)
{
}

uint64_t sub_252D037FC(uint64_t a1)
{
  return sub_252BA0F04(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t FixedVariableContextRetriever.init(variables:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t FixedVariableContextRetriever.retrieveVariables()()
{
  return swift_bridgeObjectRetain();
}

uint64_t dispatch thunk of VariableContextRetriever.retrieveVariables()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for FixedVariableContextRetriever()
{
  return &type metadata for FixedVariableContextRetriever;
}

uint64_t sub_252D0384C()
{
  return sub_252D03864();
}

uint64_t sub_252D03864()
{
  uint64_t v0 = sub_252D19868();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F4E320], v0);
  sub_252D19858();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void *sub_252D03958()
{
  qword_269C491D8 = (uint64_t)&unk_270317E18;
  return &unk_270317E18;
}

id static InternalXPCService.interface.getter()
{
  if (qword_269C41888 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_269C491D8;

  return v0;
}

unint64_t static InternalXPCService.serviceName.getter()
{
  return 0xD000000000000023;
}

void sub_252D039E4()
{
  qword_269C491E0 = MEMORY[0x263F8EE78];
}

uint64_t static InternalXPCService.selectorClasses.getter()
{
  if (qword_269C41890 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_252D03A54()
{
  uint64_t v0 = sub_252D19B18();
  sub_252B2279C(v0, qword_269C491E8);
  sub_252B01480(v0, (uint64_t)qword_269C491E8);
  return sub_252D198D8();
}

uint64_t static InternalXPCService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C41898 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252D19B18();
  uint64_t v3 = sub_252B01480(v2, (uint64_t)qword_269C491E8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_252D03B4C()
{
  return 0xD000000000000023;
}

uint64_t InternalClient.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  InternalClient.init()(v0, v1);
  return v0;
}

uint64_t InternalClient.init()(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = 0;
  sub_252D03D7C(&qword_269C49200, a2, (void (*)(uint64_t))type metadata accessor for InternalClient);
  sub_252AC3A24(&qword_269C49208);
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + 16) = sub_252D199C8();
  swift_release();
  return v2;
}

uint64_t type metadata accessor for InternalClient()
{
  return self;
}

uint64_t InternalClient.deinit()
{
  swift_release();
  return v0;
}

uint64_t InternalClient.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_252D03CD8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_252D03D7C(&qword_269C49200, a2, (void (*)(uint64_t))type metadata accessor for InternalClient);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_252D03D30()
{
  return sub_252D03D7C((unint64_t *)&unk_269C49450, 255, MEMORY[0x263F61838]);
}

uint64_t sub_252D03D7C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_252D03DC4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InternalClient();

  return MEMORY[0x270F57798](a1, v2);
}

uint64_t sub_252D03E18()
{
  return sub_252D0384C();
}

ValueMetadata *type metadata accessor for InternalXPCService()
{
  return &type metadata for InternalXPCService;
}

uint64_t method lookup function for InternalClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InternalClient);
}

uint64_t dispatch thunk of InternalClient.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_252D03EA8(uint64_t a1, uint64_t a2)
{
  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  return sub_252B00A84((uint64_t)sub_252D03EC4);
}

uint64_t sub_252D03EC4()
{
  sub_252D05908();
  v0[4] = v0[6];
  uint64_t v1 = sub_252D19888();
  sub_252D057A8(&qword_269C49218, 255, MEMORY[0x263F4E690]);
  uint64_t v2 = sub_252D05934();
  v0[9] = v2;
  v0[10] = v3;
  if (v1)
  {
    sub_252CF8748();
    sub_252D058D8();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  uint64_t v6 = v0[7];
  uint64_t v7 = sub_252D19588();
  sub_252D057A8(&qword_26B231C10, 255, MEMORY[0x263F07508]);
  v0[11] = sub_252D19388();
  v0[12] = v8;
  uint64_t v11 = *(void *)(v0[8] + 16);
  v0[13] = v11;
  if (v11)
  {
    uint64_t v12 = (void *)sub_252D05914();
    v0[14] = v12;
    uint64_t v12[2] = v4;
    v12[3] = v5;
    v12[4] = v6;
    v12[5] = v7;
    swift_retain();
    unint64_t v13 = (void *)swift_task_alloc();
    v0[15] = v13;
    *unint64_t v13 = v0;
    v13[1] = sub_252D040C4;
    sub_252D058D8();
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270F57710]();
}

uint64_t sub_252D040C4()
{
  sub_252AEA2EC();
  uint64_t v3 = v2;
  sub_252AEDE50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_252AEDE50();
  *uint64_t v6 = v5;
  *(void *)(v3 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = sub_252D042DC;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v7 = sub_252D041BC;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

void sub_252D041BC()
{
  sub_252D05908();
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_252D19898();
  sub_252D057A8(&qword_269C49220, 255, MEMORY[0x263F4E6E8]);
  sub_252D05884();
  uint64_t v5 = v0[11];
  unint64_t v4 = v0[12];
  sub_252AC5C14(v0[9], v0[10]);
  sub_252AC5C14(v5, v4);
  sub_252AC5C14(v2, v3);
  if (v1)
  {
    sub_252CF8748();
    sub_252D058C0();
    __asm { BRAA            X1, X16 }
  }
  sub_252D058C0();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_252D042DC()
{
  uint64_t v2 = v0[11];
  unint64_t v1 = v0[12];
  sub_252AC5C14(v0[9], v0[10]);
  sub_252AC5C14(v2, v1);
  swift_release();
  swift_task_dealloc();
  unint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_252D0436C(uint64_t a1, void *a2)
{
  v3[8] = a1;
  v3[9] = v2;
  uint64_t v4 = a2[1];
  v3[10] = *a2;
  v3[11] = v4;
  return sub_252B00A84((uint64_t)sub_252D0438C);
}

uint64_t sub_252D0438C()
{
  sub_252D05908();
  v0[6] = v0[8];
  uint64_t v2 = sub_252D19888();
  sub_252D057A8(&qword_269C49218, 255, MEMORY[0x263F4E690]);
  uint64_t v3 = sub_252D05934();
  v0[12] = v3;
  v0[13] = v4;
  if (v2)
  {
    sub_252CF8748();
    sub_252D058D8();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v5 = v3;
  uint64_t v6 = v4;
  uint64_t v7 = v0[11];
  v0[2] = v0[10];
  v0[3] = v7;
  sub_252B9AE48();
  v0[14] = sub_252D19388();
  v0[15] = v8;
  uint64_t v11 = *(void *)(v0[9] + 16);
  v0[16] = v11;
  if (v11)
  {
    uint64_t v12 = (void *)sub_252D05914();
    v0[17] = v12;
    uint64_t v12[2] = v5;
    v12[3] = v6;
    v12[4] = v0 + 2;
    v12[5] = v1;
    swift_retain();
    unint64_t v13 = (void *)swift_task_alloc();
    v0[18] = v13;
    *unint64_t v13 = v0;
    v13[1] = sub_252D04554;
    sub_252D058D8();
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270F57710]();
}

uint64_t sub_252D04554()
{
  sub_252AEA2EC();
  uint64_t v3 = v2;
  sub_252AEDE50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_252AEDE50();
  *uint64_t v6 = v5;
  *(void *)(v3 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = sub_252D0476C;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v7 = sub_252D0464C;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

void sub_252D0464C()
{
  sub_252D05908();
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[4];
  unint64_t v3 = v0[5];
  sub_252D19898();
  sub_252D057A8(&qword_269C49220, 255, MEMORY[0x263F4E6E8]);
  sub_252D05884();
  uint64_t v5 = v0[14];
  unint64_t v4 = v0[15];
  sub_252AC5C14(v0[12], v0[13]);
  sub_252AC5C14(v5, v4);
  sub_252AC5C14(v2, v3);
  if (v1)
  {
    sub_252CF8748();
    sub_252D058C0();
    __asm { BRAA            X1, X16 }
  }
  sub_252D058C0();
  __asm { BRAA            X2, X16 }
}

uint64_t sub_252D0476C()
{
  uint64_t v2 = v0[14];
  unint64_t v1 = v0[15];
  sub_252AC5C14(v0[12], v0[13]);
  sub_252AC5C14(v2, v1);
  swift_release();
  swift_task_dealloc();
  unint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_252D047FC()
{
  uint64_t v0 = sub_252D19868();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F4E320], v0);
  sub_252D19858();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void *sub_252D048F0()
{
  qword_26B231510 = (uint64_t)&unk_270317E78;
  return &unk_270317E78;
}

id static QueryDecorationXPCService.interface.getter()
{
  if (qword_26B231518 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B231510;

  return v0;
}

unint64_t static QueryDecorationXPCService.serviceName.getter()
{
  return sub_252D058AC();
}

unint64_t static QueryDecorationXPCService.entitlementName.getter()
{
  return sub_252D058AC();
}

void sub_252D04978()
{
  qword_26B2314F0 = MEMORY[0x263F8EE78];
}

uint64_t static QueryDecorationXPCService.selectorClasses.getter()
{
  if (qword_26B2314E8 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_252D049E8()
{
  uint64_t v0 = sub_252D19B18();
  sub_252B2279C(v0, qword_26B2314F8);
  sub_252B01480(v0, (uint64_t)qword_26B2314F8);
  return sub_252D198B8();
}

uint64_t static QueryDecorationXPCService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B231080 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252D19B18();
  uint64_t v3 = sub_252B01480(v2, (uint64_t)qword_26B2314F8);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_252D04AE0()
{
  return 0xD00000000000002ALL;
}

uint64_t sub_252D04B08()
{
  uint64_t v1 = v0;
  sub_252D19B18();
  sub_252AEDBD0();
  uint64_t v50 = v3;
  uint64_t v51 = v2;
  MEMORY[0x270FA5388](v2);
  sub_252AEDE70();
  uint64_t v55 = v4;
  uint64_t v49 = sub_252D19AB8();
  sub_252AEDBD0();
  uint64_t v52 = v5;
  MEMORY[0x270FA5388](v6);
  sub_252AEDE70();
  uint64_t v53 = v7;
  sub_252D19A88();
  sub_252AEDBD0();
  uint64_t v59 = v8;
  uint64_t v60 = v9;
  MEMORY[0x270FA5388](v8);
  sub_252AEDC14();
  v54 = v10;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = &v48[-v13];
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = &v48[-v15];
  uint64_t v17 = sub_252D19AA8();
  sub_252AEDBD0();
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v20);
  sub_252AEDC14();
  v56 = v21;
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = &v48[-v24];
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = &v48[-v26];
  v0[2] = 0;
  sub_252D193A8();
  sub_252D058F0();
  v0[3] = sub_252D19398();
  sub_252D19378();
  sub_252D058F0();
  v0[4] = sub_252D19368();
  sub_252D19878();
  sub_252D19878();
  sub_252D19A98();
  sub_252D19A68();
  v57 = *(void (**)(unsigned char *, uint64_t))(v19 + 8);
  uint64_t v58 = v19 + 8;
  v57(v25, v17);
  uint64_t v28 = sub_252D19A98();
  os_signpost_type_t v29 = sub_252D1A0E8();
  if (sub_252D1A168())
  {
    uint64_t v30 = v17;
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    os_signpost_id_t v32 = sub_252D19A78();
    _os_signpost_emit_with_name_impl(&dword_252AC1000, v28, v29, v32, "QueryDecorationClient.init", "", v31, 2u);
    uint64_t v17 = v30;
    sub_252B5F6E0();
  }

  uint64_t v33 = v59;
  uint64_t v34 = v60;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v60 + 16))(v14, v16, v59);
  sub_252D19AE8();
  sub_252D058F0();
  sub_252D19AD8();
  BOOL v35 = *(void (**)(unsigned char *, uint64_t))(v34 + 8);
  uint64_t v60 = v34 + 8;
  v35(v16, v33);
  v57(v27, v17);
  sub_252D057A8(&qword_26B230EF8, v36, (void (*)(uint64_t))type metadata accessor for QueryDecorationClient);
  sub_252AC3A24(&qword_26B230FB0);
  sub_252D058F0();
  swift_retain();
  v0[2] = sub_252D199C8();
  uint64_t result = swift_release();
  if (v0[2])
  {
    swift_retain();
    sub_252AC3A24(qword_26B230FC0);
    sub_252D19998();
    swift_release();
    swift_release();
    sub_252D19878();
    BOOL v38 = sub_252D19A98();
    BOOL v39 = v54;
    sub_252D19AC8();
    os_signpost_type_t v40 = sub_252D1A0D8();
    char v41 = sub_252D1A168();
    uint64_t v42 = v53;
    if (v41)
    {
      swift_retain();
      sub_252D19AF8();
      swift_release();
      uint64_t v43 = v49;
      uint64_t v44 = v17;
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v52 + 88))(v42, v49) == *MEMORY[0x263F90238])
      {
        uint64_t v45 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v42, v43);
        uint64_t v45 = "";
      }
      long long v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v46 = 0;
      os_signpost_id_t v47 = sub_252D19A78();
      _os_signpost_emit_with_name_impl(&dword_252AC1000, v38, v40, v47, "QueryDecorationClient.init", v45, v46, 2u);
      sub_252B5F6E0();
      uint64_t v17 = v44;
    }

    v35(v39, v59);
    v57(v56, v17);
    swift_release();
    return (uint64_t)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_252D0524C@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_252D05834;
  *(void *)(v5 + 24) = v4;
  *a2 = sub_252D05844;
  a2[1] = (uint64_t (*)())v5;

  return swift_unknownObjectRetain();
}

uint64_t sub_252D052E4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D054AC(a4, a5, a6, a7, (uint64_t)sub_252D0587C, v14, a1, (uint64_t)&unk_270312F58, (SEL *)&selRef_queryDecorationCollectionWithQdInputData_sessionUUIDData_with_);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_252D053C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D054AC(a4, a5, a6, a7, (uint64_t)sub_252D05788, v14, a1, (uint64_t)&unk_270312F08, (SEL *)&selRef_queryDecorationCollectionWithQdInputData_crossAPIAssociationKeyData_with_);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_252D054AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, SEL *a9)
{
  uint64_t v13 = (void *)sub_252D194B8();
  uint64_t v14 = (void *)sub_252D194B8();
  v16[4] = a5;
  v16[5] = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = sub_252D14E0C;
  v16[3] = a8;
  uint64_t v15 = _Block_copy(v16);
  swift_retain();
  swift_release();
  objc_msgSend(a7, *a9, v13, v14, v15);
  _Block_release(v15);
}

uint64_t QueryDecorationClient.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t QueryDecorationClient.__deallocating_deinit()
{
  QueryDecorationClient.deinit();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_252D05608(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_252D057A8(&qword_26B230EF8, a2, (void (*)(uint64_t))type metadata accessor for QueryDecorationClient);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for QueryDecorationClient()
{
  return self;
}

uint64_t sub_252D05684()
{
  return sub_252D057A8((unint64_t *)&unk_269C49450, 255, MEMORY[0x263F61838]);
}

uint64_t sub_252D056D0(uint64_t a1)
{
  return MEMORY[0x270F57798](a1, v1);
}

uint64_t sub_252D056D8()
{
  return sub_252D047FC();
}

uint64_t sub_252D056F0()
{
  return sub_252D199D8();
}

ValueMetadata *type metadata accessor for QueryDecorationXPCService()
{
  return &type metadata for QueryDecorationXPCService;
}

uint64_t method lookup function for QueryDecorationClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QueryDecorationClient);
}

uint64_t sub_252D05744(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252D053C8(a1, a2, a3, v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_252D05750()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_252D05788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_252D14DD0(a1, a2, a3, *(uint64_t (**)(void *, uint64_t))(v3 + 16));
}

uint64_t sub_252D05790(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_252D057A0()
{
  return swift_release();
}

uint64_t sub_252D057A8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_252D057F0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252D052E4(a1, a2, a3, v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_252D057FC()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_252D05834()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_warmup);
}

uint64_t sub_252D05844()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_252D05884()
{
  return sub_252D19358();
}

unint64_t sub_252D058AC()
{
  return 0xD00000000000002ALL;
}

uint64_t sub_252D058F0()
{
  return swift_allocObject();
}

uint64_t sub_252D05914()
{
  return swift_task_alloc();
}

uint64_t sub_252D05934()
{
  return sub_252D19388();
}

uint64_t EventsSubscription.Iterator.next()()
{
  sub_252AEDE44();
  uint64_t v2 = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v3;
  uint64_t v4 = sub_252AC3A24(&qword_269C41A40);
  void *v3 = v0;
  v3[1] = sub_252AC784C;
  return MEMORY[0x270FA2100](v2, v4);
}

uint64_t sub_252D05A04()
{
  sub_252AEA3C4();
  uint64_t v2 = v1;
  v0[3] = v3;
  v0[4] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[5] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_252D05AA0;
  return SessionDebuggerEventsSubscription.Iterator.next()(v2);
}

uint64_t sub_252D05AA0()
{
  sub_252AEDE44();
  sub_252AEA2EC();
  uint64_t v3 = v2;
  sub_252AEDE50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_252AEA32C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    if (*(void *)(v3 + 24))
    {
      swift_getObjectType();
      uint64_t v7 = sub_252D19F48();
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v9 = 0;
    }
    return MEMORY[0x270FA2498](sub_252D0DDA4, v7, v9);
  }
  else
  {
    sub_252AEA41C();
    return v10();
  }
}

uint64_t sub_252D05BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  uint64_t v5 = (void *)swift_task_alloc();
  v3[5] = v5;
  uint64_t v6 = sub_252AC3A24(&qword_269C41A40);
  *uint64_t v5 = v3;
  v5[1] = sub_252D05C90;
  return MEMORY[0x270FA2100](a1, v6);
}

uint64_t sub_252D05C90()
{
  sub_252AEDE44();
  sub_252AEA2EC();
  uint64_t v3 = v2;
  sub_252AEDE50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_252AEA32C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    if (*(void *)(v3 + 24))
    {
      swift_getObjectType();
      uint64_t v7 = sub_252D19F48();
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v9 = 0;
    }
    return MEMORY[0x270FA2498](sub_252D05DC8, v7, v9);
  }
  else
  {
    sub_252AEA41C();
    return v10();
  }
}

uint64_t sub_252D05DC8()
{
  sub_252AEA3C4();
  *(void *)(v0 + 16) = *(void *)(v0 + 48);
  sub_252AC3A24(&qword_26B231758);
  swift_willThrowTypedImpl();
  sub_252AEA41C();
  return v1();
}

void *sub_252D05E48()
{
  qword_26B234768 = (uint64_t)&unk_270317ED8;
  return &unk_270317ED8;
}

id static SessionXPCServerService.interface.getter()
{
  return sub_252D0AE00(&qword_26B232168, (void **)&qword_26B234768);
}

unint64_t static SessionXPCServerService.serviceName.getter()
{
  return sub_252D0DF00();
}

void sub_252D05E8C()
{
  qword_26B234760 = MEMORY[0x263F8EE78];
}

uint64_t static SessionXPCServerService.selectorClasses.getter()
{
  return sub_252D0AE90(&qword_26B234758);
}

uint64_t sub_252D05EC4(uint64_t a1)
{
  return sub_252D0AEE8(a1, qword_26B2311D8);
}

uint64_t static SessionXPCServerService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252D0AF54(&qword_26B2311F0, (uint64_t)qword_26B2311D8, a1);
}

id static SessionXPCServerService.customize(serverInterface:)()
{
  sub_252D19B28();
  uint64_t v0 = (void *)sub_252D0E09C();
  [v0 v1];
  sub_252D19B28();
  uint64_t v2 = (void *)sub_252D0E09C();

  return [v2 v3];
}

uint64_t sub_252D05F64()
{
  SEL v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *SEL v1 = v0;
  v1[1] = sub_252AEA2E8;
  return EventsSubscription.Iterator.next()();
}

uint64_t sub_252D05FFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_269C492C0 + dword_269C492C0);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_252D060C8;
  return v10(a1, a2, a3);
}

uint64_t sub_252D060C8()
{
  sub_252AEDE44();
  sub_252AEA2EC();
  uint64_t v3 = v2;
  sub_252AEDE50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_252AEA32C();
  *uint64_t v6 = v5;
  swift_task_dealloc();
  if (v0) {
    **(void **)(v3 + 16) = v0;
  }
  uint64_t v7 = *(uint64_t (**)(void))(v5 + 8);
  return v7();
}

uint64_t EventsSubscription.__allocating_init(continuation:stream:)()
{
  uint64_t v0 = sub_252D0DFF4();
  EventsSubscription.init(continuation:stream:)();
  return v0;
}

uint64_t EventsSubscription.init(continuation:stream:)()
{
  sub_252AC3A24(&qword_26B231590);
  sub_252AEA304();
  sub_252B5F53C();
  v1();
  *(void *)(v0 + 16) = 0;
  sub_252AC3A24(&qword_26B231598);
  sub_252AEA304();
  sub_252B4C1CC();
  v2();
  return v0;
}

uint64_t EventsSubscription.__allocating_init(stream:)()
{
  return sub_252D06348();
}

uint64_t EventsSubscription.init(stream:)()
{
  return sub_252D063C4();
}

uint64_t sub_252D062AC()
{
  return sub_252D19FB8();
}

uint64_t EventsSubscription.deinit()
{
  return sub_252D0647C();
}

uint64_t EventsSubscription.__deallocating_deinit()
{
  return sub_252D064EC();
}

uint64_t sub_252D06304()
{
  sub_252D062AC();

  return swift_release();
}

uint64_t ThrowingEventsSubscription.__allocating_init(stream:)()
{
  return sub_252D06348();
}

uint64_t sub_252D06348()
{
  uint64_t v0 = sub_252D0DFF4();
  *(void *)(v0 + 16) = 0;
  sub_252AC3A24(&qword_26B231598);
  sub_252AEA304();
  sub_252B4C1CC();
  v1();
  return v0;
}

uint64_t ThrowingEventsSubscription.init(stream:)()
{
  return sub_252D063C4();
}

uint64_t sub_252D063C4()
{
  *(void *)(v0 + 16) = 0;
  sub_252AC3A24(&qword_26B231598);
  sub_252AEA304();
  sub_252B4C1CC();
  v1();
  return v0;
}

uint64_t sub_252D06430()
{
  return sub_252D19FB8();
}

uint64_t ThrowingEventsSubscription.deinit()
{
  return sub_252D0647C();
}

uint64_t sub_252D0647C()
{
  swift_release();
  sub_252AC3A24(&qword_26B231598);
  sub_252AEA304();
  sub_252B5F53C();
  v1();
  return v0;
}

uint64_t ThrowingEventsSubscription.__deallocating_deinit()
{
  return sub_252D064EC();
}

uint64_t sub_252D064EC()
{
  swift_release();
  sub_252AC3A24(&qword_26B231598);
  sub_252AEA304();
  sub_252B5F53C();
  v1();
  uint64_t v2 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_252D0658C()
{
  sub_252D06430();

  return swift_release();
}

uint64_t SessionClient.__allocating_init(clientIdentifier:)()
{
  swift_bridgeObjectRelease();
  type metadata accessor for SessionClient.ReverseServer();
  uint64_t v1 = swift_allocObject();
  sub_252D0A940();
  uint64_t v2 = swift_retain();
  uint64_t v3 = SessionClient.__allocating_init(localObject:)(v2);
  if (v0)
  {
    swift_release();
  }
  else
  {
    *(void *)(v3 + 56) = v1;
    swift_unknownObjectRelease();
  }
  return v3;
}

uint64_t type metadata accessor for SessionClient.ReverseServer()
{
  return self;
}

uint64_t SessionClient.__allocating_init(localObject:)(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  char v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t *))(v1 + 168))(a1, &v3);
}

uint64_t SessionClient.__allocating_init()()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  char v2 = 0;
  return SessionClient.__allocating_init(configuration:)(&v1);
}

uint64_t SessionClient.__allocating_init(configuration:)(uint64_t *a1)
{
  uint64_t v3 = *a1;
  char v4 = *((unsigned char *)a1 + 8);
  type metadata accessor for SessionClient.ReverseServer();
  uint64_t v5 = swift_allocObject();
  sub_252D0A940();
  uint64_t v10 = v3;
  char v11 = v4;
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t *))(v1 + 168);
  uint64_t v7 = swift_retain();
  uint64_t v8 = v6(v7, &v10);
  if (v2)
  {
    swift_release();
  }
  else
  {
    *(void *)(v8 + 56) = v5;
    swift_unknownObjectRelease();
  }
  return v8;
}

uint64_t SessionClient.__allocating_init(localObject:configuration:)()
{
  sub_252D0DF14();
  sub_252D0DEAC();
  SessionClient.init(localObject:configuration:)();
  return v0;
}

void SessionClient.init(localObject:configuration:)()
{
  sub_252AF4380();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = *v5;
  char v7 = *((unsigned char *)v5 + 8);
  sub_252D193A8();
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v8 = v0 + 16;
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  sub_252D058F0();
  *(void *)(v0 + 64) = sub_252D19398();
  sub_252D19378();
  sub_252D058F0();
  uint64_t v9 = sub_252D19368();
  *(void *)(v0 + 56) = v4;
  *(void *)(v0 + 72) = v9;
  *(void *)(v0 + 80) = v6;
  *(unsigned char *)(v0 + 88) = v7;
  sub_252D0AA80(&qword_26B231468, v10, (void (*)(uint64_t))type metadata accessor for SessionClient);
  uint64_t v11 = sub_252AC3A24(&qword_26B231550);
  sub_252D058F0();
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v12 = sub_252D19A18();
  if (v1)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
LABEL_6:
    sub_252AF4368();
    return;
  }
  uint64_t v13 = v12;
  *((void *)&v21 + 1) = v11;
  uint64_t v22 = sub_252D0BC1C(&qword_26B231548, &qword_26B231550);
  *(void *)&long long v20 = v13;
  swift_beginAccess();
  if (*(void *)(v2 + 40)) {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0(v8);
  }
  sub_252AEA2D0(&v20, v8);
  swift_endAccess();
  *(void *)&long long v20 = v6;
  BYTE8(v20) = v7;
  sub_252D0A9DC();
  uint64_t v14 = sub_252D19388();
  unint64_t v16 = v15;
  swift_bridgeObjectRelease();
  if (*(void *)(v2 + 40))
  {
    sub_252AC7DA4(v8, (uint64_t)&v20);
  }
  else
  {
    long long v17 = *(_OWORD *)(v8 + 16);
    long long v20 = *(_OWORD *)v8;
    long long v21 = v17;
    uint64_t v22 = *(void *)(v8 + 32);
  }
  if (*((void *)&v21 + 1))
  {
    uint64_t v18 = sub_252AC3A68(&v20, *((uint64_t *)&v21 + 1));
    MEMORY[0x270FA5388](v18);
    sub_252D0AA30();
    sub_252D199F8();
    swift_unknownObjectRelease();

    sub_252AC5C14(v14, v16);
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)&v20);
    goto LABEL_6;
  }
  __break(1u);
}

void sub_252D06AE8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  char v7 = (void *)sub_252D194B8();
  v9[4] = sub_252D0DE48;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_252D14EF0;
  v9[3] = &unk_270313658;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_performSetupWithConfigData_reply_, v7, v8);
  _Block_release(v8);
}

uint64_t SessionClient.__allocating_init<A>(clientIdentifier:connection:)()
{
  sub_252AC66B4();
  MEMORY[0x270FA5388](v0);
  sub_252D0DE58(v1, v8);
  sub_252AEDE38();
  v2();
  SessionClient.__allocating_init<A>(clientIdentifier:connection:configuration:)();
  uint64_t v4 = v3;
  uint64_t v5 = sub_252CEE46C();
  v6(v5);
  return v4;
}

void SessionClient.__allocating_init<A>(clientIdentifier:connection:configuration:)()
{
  sub_252AFC730();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  sub_252AC66B4();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  sub_252AC423C();
  swift_bridgeObjectRelease();
  uint64_t v14 = *v8;
  char v15 = *((unsigned char *)v8 + 8);
  type metadata accessor for SessionClient.ReverseServer();
  uint64_t v16 = swift_allocObject();
  sub_252D0A940();
  sub_252AEDE38();
  v17();
  uint64_t v21 = v14;
  char v22 = v15;
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t))(v2 + 176);
  uint64_t v19 = swift_retain();
  uint64_t v20 = v18(v19, v1, &v21, v6, v4);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v6);
  *(void *)(v20 + 56) = v16;
  swift_unknownObjectRelease();
  sub_252AFC718();
}

uint64_t SessionClient.__allocating_init<A>(localObject:connection:)()
{
  sub_252AC66B4();
  MEMORY[0x270FA5388](v0);
  sub_252D0DE58(v1, v9);
  sub_252AEDE38();
  v2();
  uint64_t v3 = sub_252D0E0B0();
  uint64_t v5 = v4(v3);
  uint64_t v6 = sub_252CEE46C();
  v7(v6);
  return v5;
}

uint64_t SessionClient.__allocating_init<A>(localObject:connection:configuration:)()
{
  sub_252D0DE7C();
  uint64_t v1 = sub_252D0DEE4();
  SessionClient.init<A>(localObject:connection:configuration:)(v1, v2, v3, v4, v5);
  return v0;
}

uint64_t SessionClient.init<A>(localObject:connection:configuration:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v10 = *a3;
  char v11 = *((unsigned char *)a3 + 8);
  sub_252D193A8();
  *(_OWORD *)(v5 + 16) = 0u;
  *(_OWORD *)(v5 + 32) = 0u;
  uint64_t v12 = v5 + 16;
  *(void *)(v5 + 48) = 0;
  swift_allocObject();
  *(void *)(v5 + 64) = sub_252D19398();
  sub_252D19378();
  swift_allocObject();
  *(void *)(v5 + 72) = sub_252D19368();
  *(void *)(v5 + 56) = a1;
  *((void *)&v18 + 1) = a4;
  uint64_t v19 = a5;
  sub_252BA5DE4((uint64_t *)&v17);
  sub_252B4C1CC();
  v13();
  swift_beginAccess();
  uint64_t v14 = *((void *)&v18 + 1);
  if (!*(void *)(v12 + 24))
  {
    if (*((void *)&v18 + 1)) {
      goto LABEL_3;
    }
LABEL_5:
    long long v15 = v18;
    *(_OWORD *)uint64_t v12 = v17;
    *(_OWORD *)(v12 + 16) = v15;
    *(void *)(v12 + 32) = v19;
    goto LABEL_6;
  }
  _s16IntelligenceFlow17AnySessionMessageVwxx_0(v12);
  if (!v14) {
    goto LABEL_5;
  }
LABEL_3:
  sub_252AEA2D0(&v17, v12);
LABEL_6:
  swift_endAccess();
  *(void *)(v6 + 80) = v10;
  *(unsigned char *)(v6 + 88) = v11;
  return v6;
}

uint64_t SessionClient.deinit()
{
  _s16IntelligenceFlow13SessionClientC40xpcBidirectionalConnectionWasInvalidatedyyF_0();
  if (*(void *)(v0 + 40)) {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0 + 16);
  }
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SessionClient.__deallocating_deinit()
{
  SessionClient.deinit();

  return MEMORY[0x270FA0228](v0, 89, 7);
}

uint64_t sub_252D070C4()
{
  uint64_t result = sub_252AEDDC0();
  if (*(void *)(v0 + 40))
  {
    uint64_t result = sub_252AC7DA4(v0 + 16, (uint64_t)&v3);
  }
  else
  {
    long long v2 = *(_OWORD *)(v0 + 32);
    long long v3 = *(_OWORD *)(v0 + 16);
    long long v4 = v2;
    uint64_t v5 = *(void *)(v0 + 48);
  }
  if (*((void *)&v4 + 1))
  {
    sub_252AC3A68(&v3, *((uint64_t *)&v4 + 1));
    sub_252D19588();
    sub_252D199F8();
    return _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)&v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_252D071A0(void *a1, uint64_t a2, uint64_t a3)
{
  v5[4] = a2;
  v5[5] = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_252D14F7C;
  v5[3] = &unk_2703135E0;
  long long v4 = _Block_copy(v5);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_fetchSessionClientIdWithReply_, v4);
  _Block_release(v4);
}

void sub_252D07258()
{
}

void sub_252D07284(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  char v7 = (void *)sub_252D19528();
  v9[4] = sub_252D0DE48;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_252D14EF0;
  v9[3] = &unk_2703135B8;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_attachAsObserverTo_with_, v7, v8);
  _Block_release(v8);
}

void sub_252D07384()
{
}

void sub_252D073B0()
{
  sub_252AEDDC0();
  if (*(void *)(v0 + 40)) {
    sub_252AC7DA4(v0 + 16, (uint64_t)&v4);
  }
  else {
    sub_252D0E074();
  }
  if (v5)
  {
    long long v2 = sub_252AC3A68(&v4, v5);
    MEMORY[0x270FA5388](v2);
    sub_252D0AA30();
    sub_252D0E0C4();
    if (!v1) {

    }
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)&v4);
    sub_252B23870();
  }
  else
  {
    __break(1u);
  }
}

void sub_252D074A0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  char v7 = (void *)sub_252D19528();
  v9[4] = sub_252D0DE48;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_252D14EF0;
  v9[3] = &unk_270313568;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_detachObservationFrom_with_, v7, v8);
  _Block_release(v8);
}

void sub_252D075A0()
{
  sub_252AF4380();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  unint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = sub_252AC3A24(&qword_26B231078);
  MEMORY[0x270FA5388](v12 - 8);
  sub_252B7732C();
  uint64_t v13 = (int *)type metadata accessor for SessionConfiguration(0);
  sub_252AEA304();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252D0CDCC(v5, v2, &qword_26B231078);
  int v17 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v2, 1, (uint64_t)v13);
  v31[2] = v11;
  if (v17 == 1)
  {
    *uint64_t v16 = 4;
    *((void *)v16 + 1) = 0;
    *((void *)v16 + 2) = 0;
    v16[24] = 2;
    uint64_t v18 = (uint64_t)&v16[v13[8]];
    uint64_t v19 = type metadata accessor for LocaleSettings(0);
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v18, 1, 1, v19);
    v16[v13[9]] = 2;
    uint64_t v20 = &v16[v13[10]];
    v20[2] = 0;
    *(_WORD *)uint64_t v20 = 512;
    *(void *)&v16[v13[11]] = 0;
    uint64_t v21 = &v16[v13[12]];
    *(void *)uint64_t v21 = 0;
    *((void *)v21 + 1) = 0;
    *((_DWORD *)v21 + 4) = 0;
    char v22 = &v16[v13[13]];
    *(void *)char v22 = 0;
    *((void *)v22 + 1) = 0;
    sub_252B5A4CC(v2, &qword_26B231078);
  }
  else
  {
    sub_252D0AAD8(v2, (uint64_t)v16);
  }
  if (v7) {
    uint64_t v23 = v9;
  }
  else {
    uint64_t v23 = 0;
  }
  if (v7) {
    unint64_t v24 = v7;
  }
  else {
    unint64_t v24 = 0xE000000000000000;
  }
  sub_252D0AA80(&qword_26B2314D0, 255, (void (*)(uint64_t))type metadata accessor for SessionConfiguration);
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_252D19388();
  if (v1)
  {
    sub_252D0D180((uint64_t)v16, (void (*)(void))type metadata accessor for SessionConfiguration);
    swift_bridgeObjectRelease();
LABEL_17:
    sub_252AF4368();
    return;
  }
  uint64_t v27 = v25;
  unint64_t v28 = v26;
  uint64_t v35 = v23;
  xpc_object_t empty = xpc_dictionary_create_empty();
  sub_252BA086C(empty);
  sub_252AEDDC0();
  if (*(void *)(v3 + 40)) {
    sub_252AC7DA4(v3 + 16, (uint64_t)v32);
  }
  else {
    sub_252D0DEC0();
  }
  if (v33)
  {
    v31[0] = v34;
    uint64_t v30 = sub_252AC3A68(v32, v33);
    v31[1] = v31;
    MEMORY[0x270FA5388](v30);
    v31[-6] = v35;
    v31[-5] = v24;
    v31[-4] = v27;
    v31[-3] = v28;
    v31[-2] = empty;
    sub_252D19588();
    sub_252D199F8();
    sub_252D0D180((uint64_t)v16, (void (*)(void))type metadata accessor for SessionConfiguration);
    swift_bridgeObjectRelease();
    sub_252AC5C14(v27, v28);
    swift_unknownObjectRelease();
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v32);
    goto LABEL_17;
  }
  __break(1u);
}

void sub_252D078F8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = (void *)sub_252D19D18();
  uint64_t v13 = (void *)sub_252D194B8();
  v15[4] = a2;
  v15[5] = a3;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  v15[2] = sub_252D14F7C;
  v15[3] = &unk_270313518;
  uint64_t v14 = _Block_copy(v15);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_startSessionWithId_configData_xpcData_with_, v12, v13, a8, v14);
  _Block_release(v14);
}

void sub_252D07A04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  sub_252AF4380();
  uint64_t v12 = *(void **)(v10 + 56);
  if (object_getClass(v12) != (Class)_TtCC16IntelligenceFlow13SessionClient13ReverseServer || v12 == 0) {
    goto LABEL_14;
  }
  swift_unknownObjectRetain();
  uint64_t v15 = sub_252D07BE4();
  sub_252D07C84();
  sub_252AEDDC0();
  if (*(void *)(v10 + 40)) {
    sub_252AC7DA4(v10 + 16, (uint64_t)v16);
  }
  else {
    sub_252D0DEC0();
  }
  if (!v17)
  {
    __break(1u);
LABEL_14:
    sub_252D0DFA8();
    __break(1u);
    return;
  }
  uint64_t v14 = sub_252AC3A68(v16, v17);
  MEMORY[0x270FA5388](v14);
  sub_252D0AA30();
  sub_252D199F8();
  if (v11)
  {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v16);
    sub_252D07C84();
    swift_willThrow();
    sub_252AFEF98((uint64_t)v15);
    swift_unknownObjectRelease();
  }
  else
  {

    sub_252AFEF98((uint64_t)v15);
    swift_unknownObjectRelease();
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v16);
  }
  sub_252AF4368();
}

uint64_t (*sub_252D07BE4())()
{
  sub_252D0E058(*(os_unfair_lock_s **)(v1 + 24));
  sub_252D09EC0(v0, (uint64_t (**)())&v5);
  os_unfair_lock_unlock(v2);
  if (!(void)v5) {
    return 0;
  }
  long long v4 = v5;
  *(_OWORD *)(swift_allocObject() + 16) = v4;
  return sub_252D0DD48;
}

void sub_252D07C84()
{
  sub_252D0E058(*(os_unfair_lock_s **)(v1 + 24));
  sub_252D0DD2C(v0);
  os_unfair_lock_unlock(v2);
}

void sub_252D07CD4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  if (a4)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a4;
    *(void *)(v11 + 24) = a5;
    uint64_t v12 = sub_252D0DD04;
  }
  else
  {
    uint64_t v12 = 0;
  }
  swift_retain();
  sub_252AFEF88(a4);
  sub_252AFEF98((uint64_t)v12);
  id v13 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, a4 != 0);
  v15[4] = sub_252D0DE48;
  v15[5] = v10;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  v15[2] = sub_252D14EF0;
  v15[3] = &unk_270313478;
  uint64_t v14 = _Block_copy(v15);
  swift_release();
  objc_msgSend(a1, sel_updateTransactionHookAttachmentStatus_with_, v13, v14);
  _Block_release(v14);
}

void sub_252D07E58()
{
  sub_252AEDDC0();
  if (*(void *)(v0 + 40)) {
    sub_252AC7DA4(v0 + 16, (uint64_t)&v4);
  }
  else {
    sub_252D0E074();
  }
  if (v5)
  {
    uint64_t v2 = sub_252AC3A68(&v4, v5);
    MEMORY[0x270FA5388](v2);
    sub_252D0AA30();
    sub_252D0E0C4();
    if (!v1) {

    }
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)&v4);
    sub_252B23870();
  }
  else
  {
    __break(1u);
  }
}

void sub_252D07F58(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  unint64_t v7 = (void *)sub_252D19528();
  uint64_t v8 = (void *)sub_252D19EC8();
  v10[4] = sub_252D0DE48;
  v10[5] = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_252D14EF0;
  v10[3] = &unk_270313428;
  uint64_t v9 = _Block_copy(v10);
  swift_release();
  objc_msgSend(a1, sel_postTransactionWithSessionId_eventProtos_with_, v7, v8, v9);
  _Block_release(v9);
}

void sub_252D08078()
{
  sub_252AF4380();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = sub_252AC3A24(&qword_26B231078);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_252B5FA38();
  uint64_t v12 = (int *)type metadata accessor for SessionConfiguration(v11);
  sub_252AEA304();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252D0CDCC(v5, v2, &qword_26B231078);
  uint64_t v30 = v7;
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v2, 1, (uint64_t)v12) == 1)
  {
    *uint64_t v15 = 4;
    *((void *)v15 + 1) = 0;
    *((void *)v15 + 2) = 0;
    v15[24] = 2;
    uint64_t v16 = (uint64_t)&v15[v12[8]];
    uint64_t v17 = type metadata accessor for LocaleSettings(0);
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v16, 1, 1, v17);
    v15[v12[9]] = 2;
    uint64_t v18 = &v15[v12[10]];
    v18[2] = 0;
    *(_WORD *)uint64_t v18 = 512;
    *(void *)&v15[v12[11]] = 0;
    uint64_t v19 = &v15[v12[12]];
    *(void *)uint64_t v19 = 0;
    *((void *)v19 + 1) = 0;
    *((_DWORD *)v19 + 4) = 0;
    uint64_t v20 = &v15[v12[13]];
    *(void *)uint64_t v20 = 0;
    *((void *)v20 + 1) = 0;
    sub_252B5A4CC(v2, &qword_26B231078);
  }
  else
  {
    sub_252D0AAD8(v2, (uint64_t)v15);
  }
  sub_252D0AA80(&qword_26B2314D0, 255, (void (*)(uint64_t))type metadata accessor for SessionConfiguration);
  uint64_t v21 = sub_252D19388();
  if (v1)
  {
    sub_252D0D180((uint64_t)v15, (void (*)(void))type metadata accessor for SessionConfiguration);
LABEL_11:
    sub_252AF4368();
    return;
  }
  uint64_t v23 = v21;
  unint64_t v24 = v22;
  xpc_object_t empty = xpc_dictionary_create_empty();
  sub_252BA086C(empty);
  sub_252AEDDC0();
  if (*(void *)(v3 + 40)) {
    sub_252AC7DA4(v3 + 16, (uint64_t)v28);
  }
  else {
    sub_252D0DEC0();
  }
  v27[2] = v9;
  if (v29)
  {
    unint64_t v26 = sub_252AC3A68(v28, v29);
    v27[1] = v27;
    MEMORY[0x270FA5388](v26);
    v27[-4] = v30;
    v27[-3] = v23;
    v27[-2] = v24;
    v27[-1] = empty;
    sub_252D19588();
    sub_252D199F8();
    sub_252D0D180((uint64_t)v15, (void (*)(void))type metadata accessor for SessionConfiguration);
    sub_252AC5C14(v23, v24);
    swift_unknownObjectRelease();
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v28);
    goto LABEL_11;
  }
  __break(1u);
}

void sub_252D08394(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = (void *)sub_252D19EC8();
  uint64_t v12 = (void *)sub_252D194B8();
  v14[4] = a2;
  v14[5] = a3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_252D14F7C;
  v14[3] = &unk_2703133D8;
  uint64_t v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_createSessionFromProtoEventsWithEventProtos_configData_xpcData_with_, v11, v12, a7, v13);
  _Block_release(v13);
}

void sub_252D084A4()
{
  sub_252AEDDC0();
  if (*(void *)(v0 + 40))
  {
    sub_252AC7DA4(v0 + 16, (uint64_t)&v5);
  }
  else
  {
    long long v2 = *(_OWORD *)(v0 + 32);
    long long v5 = *(_OWORD *)(v0 + 16);
    long long v6 = v2;
    uint64_t v7 = *(void *)(v0 + 48);
  }
  if (*((void *)&v6 + 1))
  {
    uint64_t v3 = sub_252AC3A68(&v5, *((uint64_t *)&v6 + 1));
    MEMORY[0x270FA5388](v3);
    sub_252D0AA30();
    sub_252D199F8();
    if (v1)
    {
      _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)&v5);
    }
    else
    {
      uint64_t v4 = v8;
      _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)&v5);
      objc_msgSend(v4, sel_unsignedIntValue);
    }
    sub_252B23870();
  }
  else
  {
    __break(1u);
  }
}

void sub_252D085E0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  uint64_t v7 = (void *)sub_252D19528();
  v9[4] = sub_252D0DE48;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_252D14EF0;
  v9[3] = &unk_2703133B0;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_generateStatementIdWithId_with_, v7, v8);
  _Block_release(v8);
}

void sub_252D086E0()
{
}

void sub_252D0870C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  uint64_t v7 = (void *)sub_252D19528();
  v9[4] = sub_252D0DE48;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_252D14EF0;
  v9[3] = &unk_270313360;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_endSessionWithId_with_, v7, v8);
  _Block_release(v8);
}

void sub_252D0880C()
{
  sub_252D0883C();
  if (!v0) {
    swift_bridgeObjectRelease();
  }
}

void sub_252D0883C()
{
  uint64_t v2 = v0;
  type metadata accessor for SessionClientMessage(0);
  sub_252D0AA80(&qword_269C49240, 255, (void (*)(uint64_t))type metadata accessor for SessionClientMessage);
  uint64_t v3 = sub_252D19388();
  if (v1) {
    goto LABEL_7;
  }
  uint64_t v5 = v3;
  unint64_t v6 = v4;
  uint64_t v7 = (long long *)(v0 + 16);
  sub_252AEDDC0();
  if (*(void *)(v2 + 40))
  {
    sub_252AC7DA4(v2 + 16, (uint64_t)&v12);
  }
  else
  {
    long long v8 = *(_OWORD *)(v2 + 32);
    long long v12 = *v7;
    long long v13 = v8;
    uint64_t v14 = *(void *)(v2 + 48);
  }
  if (*((void *)&v13 + 1))
  {
    uint64_t v9 = sub_252AC3A68(&v12, *((uint64_t *)&v13 + 1));
    MEMORY[0x270FA5388](v9);
    sub_252D199F8();
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)&v12);
    sub_252AC3A24(&qword_269C49248);
    sub_252D0AB70();
    sub_252D19358();
    sub_252AC5C14(v5, v6);
    sub_252AC5C14(v10, v11);
LABEL_7:
    sub_252B23870();
    return;
  }
  __break(1u);
}

void sub_252D08A34(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  uint64_t v7 = (void *)sub_252D194B8();
  v9[4] = sub_252D05788;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_252D14E0C;
  v9[3] = &unk_270313310;
  long long v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_sendWithMessageData_with_, v7, v8);
  _Block_release(v8);
}

uint64_t sub_252D08B40()
{
  return sub_252D08C90((uint64_t (*)(uint64_t))sub_252D08B70);
}

void sub_252D08B70()
{
  sub_252D0DF3C();
  sub_252D0E088();
  sub_252D0D9E4();
  os_unfair_lock_unlock(v0);
}

uint64_t sub_252D08BC4(uint64_t a1)
{
  uint64_t v3 = v1;
  sub_252AC7DA4(a1, (uint64_t)v7);
  uint64_t v4 = sub_252D08B40();
  if (v2)
  {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v7);
  }
  else
  {
    uint64_t v5 = v4;
    type metadata accessor for SessionDebuggerEventsSubscription();
    swift_allocObject();
    uint64_t v2 = sub_252AC7ACC(v3, v7, v5);
    swift_retain();
  }
  return v2;
}

uint64_t sub_252D08C60()
{
  return sub_252D08C90((uint64_t (*)(uint64_t))sub_252D08D54);
}

uint64_t sub_252D08C90(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = v1;
  uint64_t v4 = *(void **)(v1 + 56);
  if (object_getClass(v4) != (Class)_TtCC16IntelligenceFlow13SessionClient13ReverseServer || v4 == 0)
  {
    uint64_t result = sub_252D0DFA8();
    __break(1u);
  }
  else
  {
    swift_unknownObjectRetain();
    uint64_t v6 = a1(v3);
    swift_unknownObjectRelease();
    return v6;
  }
  return result;
}

void sub_252D08D54()
{
  sub_252D0DF3C();
  sub_252D0E088();
  sub_252D0D22C();
  os_unfair_lock_unlock(v0);
}

uint64_t _s16IntelligenceFlow13SessionClientC40xpcBidirectionalConnectionWasInvalidatedyyF_0()
{
  v2[4] = nullsub_1;
  v2[5] = 0;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 1107296256;
  v2[2] = sub_252D14EF0;
  v2[3] = &unk_270313608;
  uint64_t v0 = _Block_copy(v2);
  objc_msgSend((id)swift_unknownObjectRetain(), sel_connectionClosedWith_, v0);
  _Block_release(v0);
  return swift_unknownObjectRelease();
}

uint64_t sub_252D08E5C()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_252D08E68(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SessionClient();

  return MEMORY[0x270F57798](a1, v2);
}

uint64_t sub_252D08EBC()
{
  return sub_252D0384C();
}

uint64_t IntelligenceFlowClient.__allocating_init(localObject:configuration:)()
{
  sub_252D0DF14();
  sub_252D0DEAC();
  IntelligenceFlowClient.init(localObject:configuration:)();
  return v0;
}

uint64_t IntelligenceFlowClient.init(localObject:configuration:)()
{
  SessionClient.init(localObject:configuration:)();
  return v0;
}

uint64_t IntelligenceFlowClient.__allocating_init<A>(localObject:connection:configuration:)()
{
  sub_252D0DE7C();
  sub_252D0DEE4();
  IntelligenceFlowClient.init<A>(localObject:connection:configuration:)();
  return v0;
}

void IntelligenceFlowClient.init<A>(localObject:connection:configuration:)()
{
  sub_252AFC730();
  sub_252AC66B4();
  MEMORY[0x270FA5388](v0);
  sub_252AC423C();
  sub_252AEDE38();
  v1();
  uint64_t v2 = sub_252D0E0B0();
  SessionClient.init<A>(localObject:connection:configuration:)(v2, v3, v4, v5, v6);
  uint64_t v7 = sub_252CEE46C();
  v8(v7);
  sub_252AFC718();
}

uint64_t IntelligenceFlowClient.__deallocating_deinit()
{
  SessionClient.deinit();

  return MEMORY[0x270FA0228](v0, 89, 7);
}

void sub_252D090AC(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void, void))
{
  sub_252D0911C();
  sub_252D0AA30();
  uint64_t v5 = (void *)sub_252D1A138();
  ((void (**)(void, void *, void))a4)[2](a4, v5, 0);

  _Block_release(a4);
}

void sub_252D0911C()
{
  sub_252AFC730();
  char v41 = v2;
  uint64_t v42 = v3;
  sub_252D19B18();
  sub_252AC66B4();
  uint64_t v39 = v5;
  uint64_t v40 = v4;
  MEMORY[0x270FA5388](v4);
  sub_252AEDE70();
  uint64_t v43 = v6;
  uint64_t v44 = sub_252AC3A24(&qword_26B231088);
  sub_252AC66B4();
  uint64_t v38 = v7;
  MEMORY[0x270FA5388](v8);
  sub_252AEDE70();
  uint64_t v37 = v9;
  uint64_t v10 = sub_252AC3A24(&qword_26B231438);
  sub_252AC66B4();
  uint64_t v36 = v11;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v35 - v16;
  type metadata accessor for SessionServerMessage(0);
  sub_252AEA304();
  MEMORY[0x270FA5388](v18);
  sub_252B22BB4();
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v35 - v20;
  unint64_t v22 = *(os_unfair_lock_s **)(v1 + 24);
  uint64_t v23 = v22 + 4;
  unint64_t v24 = v22 + 12;
  os_unfair_lock_lock(v22 + 12);
  sub_252D096A4(v23, &v45);
  uint64_t v25 = v24;
  uint64_t v26 = (uint64_t)v21;
  os_unfair_lock_unlock(v25);
  uint64_t v27 = v45;
  sub_252D0AA80(&qword_26B2314D8, 255, (void (*)(uint64_t))type metadata accessor for SessionServerMessage);
  sub_252D19358();
  uint64_t v28 = v37;
  uint64_t v43 = v10;
  uint64_t v29 = *(void *)(v27 + 16);
  if (v29)
  {
    char v41 = &v17[*(int *)(v43 + 48)];
    uint64_t v42 = v26;
    uint64_t v30 = v27 + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
    uint64_t v31 = *(void *)(v36 + 72);
    uint64_t v39 = v27;
    uint64_t v40 = v31;
    os_signpost_id_t v32 = (void (**)(uint64_t, uint64_t))(v38 + 8);
    do
    {
      sub_252D0CDCC(v30, (uint64_t)v17, &qword_26B231438);
      sub_252D19588();
      sub_252AEA304();
      sub_252B4C1CC();
      v33();
      sub_252AC3A24(&qword_26B231590);
      sub_252AEA304();
      sub_252B4C1CC();
      v34();
      sub_252D0D11C(v42, v0);
      sub_252D19F98();
      (*v32)(v28, v44);
      sub_252B5A4CC((uint64_t)v15, &qword_26B231438);
      v30 += v40;
      --v29;
    }
    while (v29);
    swift_bridgeObjectRelease();
    uint64_t v26 = v42;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_252D0D180(v26, (void (*)(void))type metadata accessor for SessionServerMessage);
  sub_252AFC718();
}

uint64_t sub_252D096A4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

void sub_252D096C4(uint64_t a1, void (**a2)(void, void, void))
{
  uint64_t v4 = sub_252AC3A24(&qword_26B231438);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = *(os_unfair_lock_s **)(a1 + 24);
  uint64_t v12 = (uint64_t *)&v11[4];
  uint64_t v13 = v11 + 12;
  os_unfair_lock_lock(v11 + 12);
  sub_252D09954(v12, &v24);
  os_unfair_lock_unlock(v13);
  uint64_t v14 = *(void *)(v24 + 16);
  if (v14)
  {
    uint64_t v22 = v24;
    uint64_t v23 = a2;
    uint64_t v15 = &v10[*(int *)(v4 + 48)];
    uint64_t v16 = v24 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v17 = *(void *)(v5 + 72);
    do
    {
      sub_252D0CDCC(v16, (uint64_t)v10, &qword_26B231438);
      uint64_t v18 = &v8[*(int *)(v4 + 48)];
      uint64_t v19 = sub_252D19588();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v8, v10, v19);
      uint64_t v20 = sub_252AC3A24(&qword_26B231590);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v15, v20);
      sub_252D0CE28();
      uint64_t v24 = swift_allocError();
      sub_252D19FA8();
      sub_252B5A4CC((uint64_t)v8, &qword_26B231438);
      v16 += v17;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
    a2 = v23;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_252D0AA30();
  uint64_t v21 = (void *)sub_252D1A148();
  ((void (**)(void, void *, void))a2)[2](a2, v21, 0);

  _Block_release(a2);
}

uint64_t *sub_252D09954@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  *((unsigned char *)result + 8) = 1;
  uint64_t v2 = *result;
  *uint64_t result = MEMORY[0x263F8EE78];
  *a2 = v2;
  return result;
}

void sub_252D099D0()
{
  sub_252D0E058(*(os_unfair_lock_s **)(v1 + 24));
  sub_252D0CDAC(v0);
  os_unfair_lock_unlock(v2);
}

void sub_252D09A24(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, void *))
{
  uint64_t v18 = a4;
  uint64_t v8 = sub_252D19B18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t *))(a1 + 16);
  if (v12)
  {
    uint64_t v19 = a2;
    sub_252AFEF88((uint64_t)v12);
    swift_bridgeObjectRetain();
    v12(a3, &v19);
    if (v4)
    {
      swift_bridgeObjectRelease();
      sub_252AFEF98((uint64_t)v12);
      id v13 = v4;
      v18(0, v4);
    }
    else
    {
      v18(v19, 0);
      sub_252AFEF98((uint64_t)v12);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_252D198D8();
    uint64_t v14 = sub_252D19B08();
    os_log_type_t v15 = sub_252D1A0A8();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_252AC1000, v14, v15, "Unexpected execution of transaction hook from Server. This should not happen and may have performance impact. Responding with no changes to the transaction.", v16, 2u);
      MEMORY[0x2533CA020](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v18(a2, 0);
  }
}

void sub_252D09DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v5 = (void *)sub_252D19EC8();
    if (a2)
    {
LABEL_3:
      uint64_t v6 = sub_252D193E8();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (a2) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  id v7 = (id)v6;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);
}

uint64_t sub_252D09E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  sub_252AFEF88(a2);
  uint64_t result = sub_252AFEF98(v6);
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  return result;
}

uint64_t sub_252D09EC0@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  if (v3)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_252D0DD8C;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  *a2 = v6;
  a2[1] = (uint64_t (*)())v5;
  return sub_252AFEF88(v3);
}

uint64_t sub_252D09F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_252D09F60, 0, 0);
}

uint64_t sub_252D09F60()
{
  sub_252AEA410();
  uint64_t v2 = sub_252D0E0E4();
  sub_252D0DFD0(v2);
  sub_252D0DCA4(v0);
  os_unfair_lock_unlock(v1);
  swift_task_dealloc();
  sub_252AEA41C();
  return v3();
}

uint64_t sub_252D0A004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252D19F68();
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(a1, 1, v6) == 1)
  {
    sub_252B5A4CC(a1, &qword_269C492D0);
  }
  else
  {
    sub_252D19F58();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_252D19F48();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_252D0A174()
{
  sub_252AF4380();
  v70 = v4;
  uint64_t v71 = v3;
  v67 = v5;
  uint64_t v64 = v6;
  uint64_t v65 = v7;
  uint64_t v63 = v8;
  uint64_t v10 = v9;
  v75 = v11;
  uint64_t v69 = sub_252AC3A24(&qword_26B231438);
  sub_252AC66B4();
  uint64_t v73 = v12;
  MEMORY[0x270FA5388](v13);
  sub_252AEDE70();
  uint64_t v72 = v14;
  uint64_t v15 = sub_252AC3A24(&qword_26B231588);
  sub_252AC66B4();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  sub_252B7732C();
  uint64_t v77 = sub_252AC3A24(&qword_26B231590);
  sub_252AC66B4();
  uint64_t v68 = v19;
  MEMORY[0x270FA5388](v20);
  sub_252AEDE70();
  uint64_t v79 = v21;
  uint64_t v76 = sub_252AC3A24(&qword_26B231598);
  sub_252AC66B4();
  uint64_t v66 = v22;
  MEMORY[0x270FA5388](v23);
  sub_252B22BB4();
  MEMORY[0x270FA5388](v24);
  v78 = (char *)v58 - v25;
  sub_252D19588();
  sub_252AC66B4();
  uint64_t v27 = *(void *)(v26 + 64);
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)v58 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = (char *)v58 - v33;
  v74 = v10;
  if (v10[1])
  {
    sub_252D0CE28();
    swift_allocError();
    swift_willThrow();
  }
  else
  {
    uint64_t v60 = v0;
    uint64_t v35 = v31;
    uint64_t v36 = v32;
    _s16IntelligenceFlow15SessionClientIDVACycfC_0();
    type metadata accessor for SessionServerMessage(0);
    uint64_t v62 = v1;
    (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v2, *MEMORY[0x263F8F680], v15);
    sub_252D19F78();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v2, v15);
    uint64_t v37 = v36;
    uint64_t v38 = *(void (**)(uint64_t, char *, uint64_t))(v36 + 16);
    v58[2] = v34;
    uint64_t v59 = v38;
    uint64_t v39 = v35;
    v38((uint64_t)v30, v34, v35);
    uint64_t v40 = *(unsigned __int8 *)(v37 + 80);
    uint64_t v61 = v37;
    uint64_t v41 = (v40 + 24) & ~v40;
    uint64_t v42 = swift_allocObject();
    *(void *)(v42 + 16) = v64;
    uint64_t v43 = *(void (**)(uint64_t, char *, uint64_t))(v37 + 32);
    v58[1] = v35;
    v43(v42 + v41, v30, v35);
    swift_retain();
    sub_252D19F88();
    uint64_t v44 = v66;
    uint64_t v45 = v60;
    uint64_t v46 = v76;
    sub_252AEDE38();
    v47();
    v67(0);
    uint64_t v48 = sub_252D058F0();
    uint64_t v49 = v70;
    *(void *)(v48 + 16) = v71;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v48 + *v49, v45, v46);
    uint64_t v50 = v72;
    v59(v72, v34, v39);
    uint64_t v51 = v68;
    uint64_t v52 = v77;
    sub_252AEDE38();
    v53();
    swift_retain();
    v54 = v74;
    sub_252D0D048((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_252BA0F04);
    uint64_t v55 = *(void *)(*v54 + 16);
    sub_252D0D0D4(v55, (uint64_t (*)(BOOL))sub_252BA0F04);
    uint64_t v56 = *v54;
    *(void *)(v56 + 16) = v55 + 1;
    sub_252D0D2A4(v50, v56+ ((*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80))+ *(void *)(v73 + 72) * v55);
    uint64_t *v54 = v56;
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v79, v52);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v78, v76);
    sub_252B5F53C();
    v57();
    uint64_t *v75 = v48;
  }
  sub_252AF4368();
}

void sub_252D0A66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_252AFC730();
  a19 = v21;
  a20 = v22;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v27 = sub_252D19588();
  sub_252AC66B4();
  uint64_t v29 = v28;
  uint64_t v31 = *(void *)(v30 + 64);
  MEMORY[0x270FA5388](v32);
  uint64_t v33 = sub_252AC3A24(&qword_269C492D0);
  MEMORY[0x270FA5388](v33 - 8);
  sub_252B5FA38();
  uint64_t v34 = sub_252D19F68();
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v20, 1, 1, v34);
  sub_252AEDE38();
  v35();
  unint64_t v36 = (*(unsigned __int8 *)(v29 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v37 = (char *)swift_allocObject();
  *((void *)v37 + 2) = 0;
  *((void *)v37 + 3) = 0;
  *((void *)v37 + 4) = v26;
  (*(void (**)(char *, char *, uint64_t))(v29 + 32))(&v37[v36], (char *)&a9 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0), v27);
  swift_retain();
  sub_252D0A004(v20, v24, (uint64_t)v37);
  swift_release();
  sub_252AFC718();
}

uint64_t sub_252D0A7CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_252D0A7F0, 0, 0);
}

uint64_t sub_252D0A7F0()
{
  sub_252AEA410();
  uint64_t v2 = sub_252D0E0E4();
  sub_252D0DFD0(v2);
  sub_252D0D498(v0);
  os_unfair_lock_unlock(v1);
  swift_task_dealloc();
  sub_252AEA41C();
  return v3();
}

void sub_252D0A894(uint64_t a1, uint64_t a2, uint64_t (*a3)(unint64_t))
{
  uint64_t v4 = sub_252D0D620(a3);
  uint64_t v5 = *(void *)(*(void *)a1 + 16);
  if (v5 < v4) {
    __break(1u);
  }
  else {
    sub_252D0D4C8(v4, v5);
  }
}

uint64_t sub_252D0A8EC()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_252D0A914()
{
  sub_252D0A8EC();
  uint64_t v0 = sub_252D0DED4();

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_252D0A940()
{
  sub_252D19378();
  swift_allocObject();
  *(void *)(v0 + 16) = sub_252D19368();
  sub_252AC3A24(&qword_26B2315A8);
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 48) = 0;
  *(void *)(v1 + 16) = MEMORY[0x263F8EE78];
  *(unsigned char *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = 0;
  *(void *)(v0 + 24) = v1;
  return v0;
}

uint64_t type metadata accessor for SessionClient()
{
  return self;
}

unint64_t sub_252D0A9DC()
{
  unint64_t result = qword_26B231520;
  if (!qword_26B231520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B231520);
  }
  return result;
}

void sub_252D0AA28(void *a1, uint64_t a2, uint64_t a3)
{
}

unint64_t sub_252D0AA30()
{
  unint64_t result = qword_26B232180[0];
  if (!qword_26B232180[0])
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, qword_26B232180);
  }
  return result;
}

void sub_252D0AA70(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_252D0AA78(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_252D0AA80(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void sub_252D0AAC8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_252D078F8(a1, a2, a3, v3[2], v3[3], v3[4], v3[5], v3[6]);
}

uint64_t sub_252D0AAD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SessionConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_252D0AB3C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_252D07CD4(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

void sub_252D0AB44(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_252D0AB4C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_252D08394(a1, a2, a3, v3[2], v3[3], v3[4], v3[5]);
}

void sub_252D0AB58(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_252D0AB60(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_252D0AB68(void *a1, uint64_t a2, uint64_t a3)
{
}

unint64_t sub_252D0AB70()
{
  unint64_t result = qword_269C49250[0];
  if (!qword_269C49250[0])
  {
    sub_252AEA288(&qword_269C49248);
    sub_252D0AA80(&qword_26B231070, 255, MEMORY[0x263F07508]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269C49250);
  }
  return result;
}

uint64_t static SessionClientError.== infix(_:_:)()
{
  return 1;
}

uint64_t SessionClientError.hash(into:)()
{
  return sub_252D1A6B8();
}

uint64_t SessionClientError.hashValue.getter()
{
  return sub_252D1A6E8();
}

uint64_t sub_252D0AC8C()
{
  return SessionClientError.hashValue.getter();
}

uint64_t sub_252D0ACA4()
{
  return SessionClientError.hash(into:)();
}

Swift::String __swiftcall String.escapedForIntelligenceFlowPrescribedPlanStringLiteral()()
{
  uint64_t v13 = v0;
  uint64_t v14 = v1;
  uint64_t v11 = 92;
  unint64_t v12 = 0xE100000000000000;
  uint64_t v9 = 23644;
  unint64_t v10 = 0xE200000000000000;
  sub_252D0AD7C();
  uint64_t v13 = sub_252D0DF64((uint64_t)&v11, (uint64_t)&v9);
  uint64_t v14 = v2;
  uint64_t v11 = 34;
  unint64_t v12 = 0xE100000000000000;
  uint64_t v9 = 8796;
  unint64_t v10 = 0xE200000000000000;
  uint64_t v3 = sub_252D0DF64((uint64_t)&v11, (uint64_t)&v9);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  uint64_t v6 = v3;
  uint64_t v7 = v5;
  result._object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

unint64_t sub_252D0AD7C()
{
  unint64_t result = qword_26B230E50;
  if (!qword_26B230E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B230E50);
  }
  return result;
}

void *sub_252D0ADC8()
{
  qword_26B234748 = (uint64_t)&unk_270317108;
  return &unk_270317108;
}

id static SessionXPCClientService.interface.getter()
{
  return sub_252D0AE00(&qword_26B234750, (void **)&qword_26B234748);
}

id sub_252D0AE00(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;

  return v3;
}

unint64_t static SessionXPCClientService.serviceName.getter()
{
  return sub_252D0DF00();
}

void sub_252D0AE58()
{
  qword_26B234740 = MEMORY[0x263F8EE78];
}

uint64_t static SessionXPCClientService.selectorClasses.getter()
{
  return sub_252D0AE90(&qword_26B234738);
}

uint64_t sub_252D0AE90(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_252D0AEDC(uint64_t a1)
{
  return sub_252D0AEE8(a1, qword_26B2311C0);
}

uint64_t sub_252D0AEE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_252D19B18();
  sub_252B2279C(v3, a2);
  sub_252B01480(v3, (uint64_t)a2);
  return sub_252D198D8();
}

uint64_t static SessionXPCClientService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252D0AF54(&qword_26B231D18, (uint64_t)qword_26B2311C0, a1);
}

uint64_t sub_252D0AF54@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_252D19B18();
  uint64_t v6 = sub_252B01480(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

unint64_t sub_252D0AFF0()
{
  return 0xD000000000000027;
}

uint64_t SessionReverseClient.__allocating_init(existingConnection:localObject:)()
{
  sub_252D0DED4();
  swift_allocObject();
  sub_252D0DEAC();
  SessionReverseClient.init(existingConnection:localObject:)();
  return v0;
}

uint64_t SessionReverseClient.init(existingConnection:localObject:)()
{
  sub_252D193A8();
  sub_252D058F0();
  *(void *)(v0 + 16) = sub_252D19398();
  *(void *)(v0 + 24) = 0;
  sub_252D0AA80(&qword_26B231D00, v2, (void (*)(uint64_t))type metadata accessor for SessionReverseClient);
  sub_252AC3A24(&qword_26B231DD0);
  sub_252D058F0();
  swift_retain();
  uint64_t v3 = sub_252D19A08();
  if (!v1) {
    *(void *)(v0 + 24) = v3;
  }
  swift_release();
  return v0;
}

uint64_t type metadata accessor for SessionReverseClient()
{
  return self;
}

uint64_t sub_252D0B16C(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return sub_252B00A84((uint64_t)sub_252D0B184);
}

uint64_t sub_252D0B184()
{
  sub_252AEA410();
  type metadata accessor for SessionServerMessage(0);
  sub_252D0AA80(&qword_26B231D08, 255, (void (*)(uint64_t))type metadata accessor for SessionServerMessage);
  uint64_t v1 = sub_252D19388();
  v0[5] = v1;
  v0[6] = v2;
  uint64_t v5 = *(void *)(v0[4] + 24);
  v0[7] = v5;
  if (v5)
  {
    uint64_t v6 = v1;
    uint64_t v7 = v2;
    uint64_t v8 = swift_task_alloc();
    v0[8] = v8;
    *(void *)(v8 + 16) = v6;
    *(void *)(v8 + 24) = v7;
    swift_retain();
    uint64_t v9 = (void *)swift_task_alloc();
    v0[9] = v9;
    unint64_t v4 = sub_252D0AA30();
    *uint64_t v9 = v0;
    v9[1] = sub_252D0B32C;
    uint64_t v2 = sub_252D0B60C;
    uint64_t v1 = (uint64_t)(v0 + 2);
    uint64_t v3 = v8;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270F577F0](v1, v2, v3, v4);
}

uint64_t sub_252D0B32C()
{
  sub_252AEDE44();
  sub_252AEA2EC();
  uint64_t v3 = v2;
  sub_252AEDE50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_252AEA32C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = sub_252D0B490;
  }
  else
  {

    swift_release();
    swift_task_dealloc();
    uint64_t v7 = sub_252D0B430;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_252D0B430()
{
  sub_252AEA3C4();
  sub_252AC5C14(v0[5], v0[6]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_252D0B490()
{
  sub_252AEA3C4();
  sub_252AC5C14(*(void *)(v0 + 40), *(void *)(v0 + 48));
  swift_release();
  swift_task_dealloc();
  sub_252AEA41C();
  return v1();
}

void sub_252D0B500(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  uint64_t v7 = (void *)sub_252D194B8();
  v9[4] = sub_252D0D224;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_252D14EF0;
  v9[3] = &unk_2703131F8;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_sendWithMessageData_with_, v7, v8);
  _Block_release(v8);
}

void sub_252D0B60C(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_252D0B614(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return sub_252B00A84((uint64_t)sub_252D0B630);
}

uint64_t sub_252D0B630()
{
  sub_252AEDE44();
  uint64_t v5 = *(void *)(*(void *)(v0 + 40) + 24);
  *(void *)(v0 + 48) = v5;
  if (v5)
  {
    uint64_t v6 = swift_task_alloc();
    *(void *)(v0 + 56) = v6;
    *(_OWORD *)(v6 + 16) = *(_OWORD *)(v0 + 24);
    swift_retain();
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v7;
    uint64_t v4 = sub_252AC3A24(&qword_269C48208);
    *uint64_t v7 = v0;
    v7[1] = sub_252D0B730;
    uint64_t v2 = sub_252D0B9C0;
    uint64_t v1 = v0 + 16;
    uint64_t v3 = v6;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270F577F0](v1, v2, v3, v4);
}

uint64_t sub_252D0B730()
{
  sub_252AEA3C4();
  sub_252AEA2EC();
  uint64_t v3 = v2;
  sub_252AEDE50();
  void *v4 = v3;
  uint64_t v5 = *v1;
  sub_252AEA32C();
  *uint64_t v6 = v5;
  *(void *)(v3 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = sub_252D0B83C;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v7 = sub_252D0B820;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_252D0B820()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_252D0B83C()
{
  sub_252AEA3C4();
  swift_release();
  swift_task_dealloc();
  sub_252AEA41C();
  return v0();
}

void sub_252D0B8A0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  uint64_t v7 = (void *)sub_252D19528();
  uint64_t v8 = (void *)sub_252D19EC8();
  v10[4] = sub_252D0D1D4;
  v10[5] = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_252D0B9C8;
  v10[3] = &unk_2703131A8;
  uint64_t v9 = _Block_copy(v10);
  swift_release();
  objc_msgSend(a1, sel_runTransactionHookWithSessionId_transaction_with_, v7, v8, v9);
  _Block_release(v9);
}

void sub_252D0B9C0(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_252D0B9C8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_252D19ED8();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t SessionReverseClient.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t SessionReverseClient.__deallocating_deinit()
{
  SessionReverseClient.deinit();
  uint64_t v0 = sub_252D0DED4();

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_252D0BAB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SessionReverseClient.__allocating_init(existingConnection:localObject:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_252D0BAE0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SessionReverseClient();

  return MEMORY[0x270F57798](a1, v2);
}

uint64_t sub_252D0BB34()
{
  return sub_252D19A48();
}

uint64_t static SessionXPCDictionaryKeys.identityTokenKey.getter()
{
  return 0x797469746E656469;
}

uint64_t sub_252D0BB74()
{
  return sub_252D0AA80(&qword_269C49278, 255, (void (*)(uint64_t))type metadata accessor for EventsSubscription.Iterator);
}

uint64_t type metadata accessor for EventsSubscription.Iterator(uint64_t a1)
{
  return sub_252AC76C8(a1, (uint64_t *)&unk_269C492A0);
}

uint64_t sub_252D0BBE0()
{
  return sub_252D0BC1C(&qword_269C49280, &qword_269C41A40);
}

uint64_t sub_252D0BC1C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252AEA288(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_252D0BC60(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_252D0AA80(&qword_26B231468, a2, (void (*)(uint64_t))type metadata accessor for SessionClient);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_252D0BCB8()
{
  return sub_252D0AA80((unint64_t *)&unk_269C49450, 255, MEMORY[0x263F61838]);
}

unint64_t sub_252D0BD08()
{
  unint64_t result = qword_269C49288;
  if (!qword_269C49288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49288);
  }
  return result;
}

unint64_t sub_252D0BD58()
{
  unint64_t result = qword_26B230CC8[0];
  if (!qword_26B230CC8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B230CC8);
  }
  return result;
}

void type metadata accessor for SessionXPCServerService()
{
}

uint64_t sub_252D0BDB0()
{
  return type metadata accessor for EventsSubscription(0);
}

uint64_t type metadata accessor for EventsSubscription(uint64_t a1)
{
  return sub_252AC76C8(a1, (uint64_t *)&unk_269C49290);
}

uint64_t method lookup function for EventsSubscription(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EventsSubscription);
}

uint64_t dispatch thunk of EventsSubscription.__allocating_init(continuation:stream:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of EventsSubscription.__allocating_init(stream:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of EventsSubscription.makeAsyncIterator()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t initializeBufferWithCopyOfBuffer for EventsSubscription.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252AC3A24(&qword_269C41A40);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for EventsSubscription.Iterator(uint64_t a1)
{
  uint64_t v2 = sub_252AC3A24(&qword_269C41A40);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for EventsSubscription.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252AC3A24(&qword_269C41A40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for EventsSubscription.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252AC3A24(&qword_269C41A40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for EventsSubscription.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252AC3A24(&qword_269C41A40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for EventsSubscription.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252AC3A24(&qword_269C41A40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for EventsSubscription.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252D0C0CC);
}

uint64_t sub_252D0C0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252AC3A24(&qword_269C41A40);

  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for EventsSubscription.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252D0C12C);
}

uint64_t sub_252D0C12C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252AC3A24(&qword_269C41A40);

  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(a1, a2, a2, v4);
}

void sub_252D0C17C()
{
  sub_252D0C224(319, (unint64_t *)&qword_269C41B20, MEMORY[0x263F8F6A8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_252D0C224(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, void))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for SessionServerMessage(255);
    uint64_t v7 = sub_252AEA288(&qword_26B231758);
    unint64_t v8 = a3(a1, v6, v7, MEMORY[0x263F8E4E0]);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_252D0C2A0()
{
  return type metadata accessor for ThrowingEventsSubscription(0);
}

uint64_t type metadata accessor for ThrowingEventsSubscription(uint64_t a1)
{
  return sub_252AC76C8(a1, (uint64_t *)&unk_26B231530);
}

void sub_252D0C2C8()
{
  sub_252D0C224(319, &qword_26B2315A0, MEMORY[0x263F8F6B8]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ThrowingEventsSubscription(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ThrowingEventsSubscription);
}

uint64_t dispatch thunk of ThrowingEventsSubscription.__allocating_init(stream:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ThrowingEventsSubscription.makeAsyncIterator()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t method lookup function for SessionClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SessionClient);
}

uint64_t dispatch thunk of SessionClient.__allocating_init(localObject:configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of SessionClient.__allocating_init<A>(localObject:connection:configuration:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of SessionClient.fetchSessionClientId()()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of SessionClient.attachAsObserver(sessionClientId:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of SessionClient.detachObservation(sessionClientId:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of SessionClient.startSession(id:config:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of SessionClient.setTransactionPostingHook(_:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of SessionClient.postTransaction(sessionId:events:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of SessionClient.createSessionFromProtos(eventProtos:config:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of SessionClient.generateStatementId(id:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of SessionClient.endSession(id:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of SessionClient.send(message:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 256))();
}

{
  uint64_t v0;

  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of SessionClient.subscribe()()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of SessionClient.subscribeWithDebugger(breakpointPredicate:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of SessionClient.trySubscribe()()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of SessionClient.leakInternallyRetainedReverseServer()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t type metadata accessor for IntelligenceFlowClient()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for SessionClientError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x252D0C810);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for SessionClientError()
{
}

void type metadata accessor for SessionXPCClientService()
{
}

uint64_t method lookup function for SessionReverseClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SessionReverseClient);
}

uint64_t dispatch thunk of SessionReverseClient.__allocating_init(existingConnection:localObject:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SessionReverseClient.send(message:)()
{
  sub_252AEDE44();
  uint64_t v2 = v1;
  sub_252D0DE4C();
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v3 + 128) + **(int **)(v3 + 128));
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v4;
  void *v4 = v0;
  v4[1] = sub_252AC784C;
  return v6(v2);
}

uint64_t dispatch thunk of SessionReverseClient.runTransactionHook(sessionId:transaction:)()
{
  sub_252AEA410();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_252D0DE4C();
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v5 + 136) + **(int **)(v5 + 136));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_252D0CA90;
  return v8(v4, v2);
}

uint64_t sub_252D0CA90()
{
  sub_252AEA3C4();
  uint64_t v2 = v1;
  sub_252AEA2EC();
  uint64_t v3 = *v0;
  sub_252AEA32C();
  void *v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

void type metadata accessor for SessionXPCDictionaryKeys()
{
}

uint64_t sub_252D0CB68(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 16))
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_252D0CBB8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v5 = (_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *v5;
  }
  return a1;
}

uint64_t sub_252D0CC24(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a1 + 16);
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  if (!v4)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v5;
      *(void *)(a1 + 24) = v7;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_252D0CCCC(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 16);
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  if (!v5)
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = v7;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v6;
  swift_release();
  return a1;
}

void type metadata accessor for SessionClient.ReverseServer.State()
{
}

uint64_t sub_252D0CD6C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_252D0CDA4(uint64_t a1, uint64_t a2)
{
  sub_252D09DC8(a1, a2, *(void *)(v2 + 16));
}

void sub_252D0CDAC(uint64_t a1)
{
  sub_252D09A24(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t, void *))(v1 + 32));
}

uint64_t sub_252D0CDCC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_252AC3A24(a3);
  sub_252AEA304();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

unint64_t sub_252D0CE28()
{
  unint64_t result = qword_26B2314B0;
  if (!qword_26B2314B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2314B0);
  }
  return result;
}

uint64_t sub_252D0CE74(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_252D0CF50;
  return v6(a1);
}

uint64_t sub_252D0CF50()
{
  sub_252AEA3C4();
  sub_252AEA2EC();
  uint64_t v1 = *v0;
  sub_252AEA32C();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_252D0D018()
{
  return sub_252D0D048((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_252BA09EC);
}

uint64_t sub_252D0D030()
{
  return sub_252D0D048((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_252BA0A20);
}

uint64_t sub_252D0D048(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (!result)
  {
    uint64_t result = a1(result, *(void *)(v3 + 16) + 1, 1, v3);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_252D0D0A4(uint64_t a1)
{
  return sub_252D0D0D4(a1, (uint64_t (*)(BOOL))sub_252BA09EC);
}

uint64_t sub_252D0D0BC(uint64_t a1)
{
  return sub_252D0D0D4(a1, (uint64_t (*)(BOOL))sub_252BA0A20);
}

uint64_t sub_252D0D0D4(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }
  return result;
}

uint64_t sub_252D0D11C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SessionServerMessage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_252D0D180(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_252AEA304();
  sub_252B5F53C();
  v3();
  return a1;
}

uint64_t sub_252D0D1D4(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_252D0D20C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_252D0D21C()
{
  return swift_release();
}

uint64_t sub_252D0D224(uint64_t a1, uint64_t a2)
{
  return sub_252D14EB8(a1, a2, *(uint64_t (**)(uint64_t *))(v2 + 16));
}

void sub_252D0D22C()
{
}

uint64_t sub_252D0D284(uint64_t a1)
{
  return sub_252D0DAF4(a1, &unk_270313258, &unk_269C492E0);
}

uint64_t sub_252D0D2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252AC3A24(&qword_26B231438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_252D0D310()
{
  sub_252AEA410();
  uint64_t v0 = sub_252D19588();
  sub_252CB8544(v0);
  sub_252D0E040();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_252D0E030(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_252AEA2E8;
  uint64_t v4 = sub_252D0DF8C();
  return sub_252D0A7CC(v4, v5, v6, v7, v8);
}

uint64_t sub_252D0D3BC()
{
  swift_release();
  uint64_t v0 = sub_252D0DED4();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t sub_252D0D3EC()
{
  sub_252AEDE44();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_252D0E030(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_252AEA2E8;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269C492E8 + dword_269C492E8);
  return v7(v2, v3);
}

void sub_252D0D498(uint64_t a1)
{
  sub_252D0A894(a1, *(void *)(v1 + 16), (uint64_t (*)(unint64_t))sub_252D0DD70);
}

void sub_252D0D4C8(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v6 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v7 = a1 - a2;
  if (__OFSUB__(0, v6))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v8 = v5 - v6;
  if (__OFADD__(v5, v7))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v8 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v8) {
      uint64_t v10 = v5 + v7;
    }
    else {
      uint64_t v10 = v5;
    }
    uint64_t v4 = sub_252BA0F04(isUniquelyReferenced_nonNull_native, v10, 1, v4);
  }
  uint64_t v11 = *(void *)(sub_252AC3A24(&qword_26B231438) - 8);
  unint64_t v12 = v4 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  uint64_t v13 = *(void *)(v11 + 72);
  swift_arrayDestroy();
  if (!v6) {
    goto LABEL_16;
  }
  uint64_t v14 = *(void *)(v4 + 16);
  if (__OFSUB__(v14, a2)) {
    goto LABEL_22;
  }
  sub_252B7B928(v12 + v13 * a2, v14 - a2);
  uint64_t v15 = *(void *)(v4 + 16);
  BOOL v16 = __OFADD__(v15, v7);
  uint64_t v17 = v15 - v6;
  if (!v16)
  {
    *(void *)(v4 + 16) = v17;
LABEL_16:
    *uint64_t v2 = v4;
    return;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_252D0D620(uint64_t (*a1)(unint64_t))
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_252AC3A24(&qword_26B231438) - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v34 = (uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v33 = (uint64_t)&v30 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v35 = (uint64_t)&v30 - v11;
  uint64_t v12 = *v1;
  uint64_t v13 = *(void *)(*v1 + 16);
  if (!v13) {
    return 0;
  }
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = *(void *)(v10 + 72);
  swift_bridgeObjectRetain();
  unint64_t v16 = 0;
  unint64_t v31 = v14;
  while (1)
  {
    char v17 = a1(v12 + v14);
    if (v2)
    {
      swift_bridgeObjectRelease();
      return v16;
    }
    if (v17) {
      break;
    }
    ++v16;
    v14 += v15;
    if (v13 == v16)
    {
      swift_bridgeObjectRelease();
      return *(void *)(v12 + 16);
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v16, 1))
  {
    unint64_t v19 = *(void *)(v12 + 16);
    if (v16 + 1 == v19) {
      return v16;
    }
    uint64_t v20 = v15 + v14;
    unint64_t v21 = v16 + 1;
    uint64_t v30 = v1;
    uint64_t v32 = v15;
    while (v21 < v19)
    {
      uint64_t v22 = v3;
      uint64_t v36 = v20;
      uint64_t v23 = v35;
      sub_252D0CDCC(v12 + v20, v35, &qword_26B231438);
      char v24 = a1(v23);
      uint64_t result = sub_252B5A4CC(v23, &qword_26B231438);
      if (v24)
      {
        uint64_t v3 = v22;
        uint64_t v25 = v32;
      }
      else
      {
        uint64_t v3 = v22;
        uint64_t v25 = v32;
        if (v21 != v16)
        {
          if ((v16 & 0x8000000000000000) != 0) {
            goto LABEL_32;
          }
          uint64_t v26 = *v3;
          unint64_t v27 = *(void *)(*v3 + 16);
          if (v16 >= v27) {
            goto LABEL_33;
          }
          uint64_t result = sub_252D0CDCC(v26 + v31 + v16 * v32, v33, &qword_26B231438);
          if (v21 >= v27) {
            goto LABEL_34;
          }
          sub_252D0CDCC(v26 + v36, v34, &qword_26B231438);
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v3 = v30;
          *uint64_t v30 = v26;
          if ((result & 1) == 0)
          {
            uint64_t result = sub_252D037FC(v26);
            uint64_t v26 = result;
            uint64_t *v3 = result;
          }
          if (v16 >= *(void *)(v26 + 16)) {
            goto LABEL_35;
          }
          uint64_t result = sub_252D0D97C(v34, v26 + v31 + v16 * v25);
          if (v21 >= *(void *)(*v3 + 16)) {
            goto LABEL_36;
          }
          uint64_t result = sub_252D0D97C(v33, *v3 + v36);
        }
        if (__OFADD__(v16++, 1)) {
          goto LABEL_31;
        }
      }
      unint64_t v29 = v21 + 1;
      if (__OFADD__(v21, 1)) {
        goto LABEL_30;
      }
      uint64_t v12 = *v3;
      unint64_t v19 = *(void *)(*v3 + 16);
      ++v21;
      uint64_t v20 = v36 + v25;
      if (v29 == v19) {
        return v16;
      }
    }
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_252D0D97C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252AC3A24(&qword_26B231438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_252D0D9E4()
{
}

uint64_t sub_252D0DA3C()
{
  sub_252D19588();
  sub_252AC66B4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 24) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_release();
  uint64_t v8 = sub_252D0E018();
  v9(v8);

  return MEMORY[0x270FA0238](v0, v6, v7);
}

uint64_t sub_252D0DAD4(uint64_t a1)
{
  return sub_252D0DAF4(a1, &unk_2703132D0, &unk_269C49300);
}

#error "252D0DB40: call analysis failed (funcsize=24)"

uint64_t sub_252D0DB58()
{
  sub_252D19588();
  sub_252AC66B4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 40) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v8 = sub_252D0E018();
  v9(v8);

  return MEMORY[0x270FA0238](v0, v6, v7);
}

uint64_t sub_252D0DBF8()
{
  sub_252AEA410();
  uint64_t v0 = sub_252D19588();
  sub_252CB8544(v0);
  sub_252D0E040();
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = (void *)sub_252D0E030(v1);
  *uint64_t v2 = v3;
  v2[1] = sub_252AC784C;
  uint64_t v4 = sub_252D0DF8C();
  return sub_252D09F3C(v4, v5, v6, v7, v8);
}

void sub_252D0DCA4(uint64_t a1)
{
  sub_252D0A894(a1, *(void *)(v1 + 16), (uint64_t (*)(unint64_t))sub_252D0DCD4);
}

uint64_t sub_252D0DCD4()
{
  return _s16IntelligenceFlow15SessionClientIDV2eeoiySbAC_ACtFZ_0() & 1;
}

uint64_t sub_252D0DD04()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_252D0DD2C(uint64_t a1)
{
  return sub_252D09E60(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_252D0DD48()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_252D0DD70()
{
  return sub_252D0DCD4() & 1;
}

uint64_t sub_252D0DD8C()
{
  return sub_252D0DD04();
}

char *sub_252D0DE58@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_252D0DE7C()
{
  return swift_allocObject();
}

uint64_t sub_252D0DEAC()
{
  return v0;
}

__n128 sub_252D0DEC0()
{
  __n128 result = *(__n128 *)v0;
  long long v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 128) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 112) = v3;
  *(void *)(v1 - 96) = *(void *)(v0 + 32);
  return result;
}

uint64_t sub_252D0DED4()
{
  return v0;
}

uint64_t sub_252D0DEE4()
{
  return v0;
}

unint64_t sub_252D0DF00()
{
  return 0xD000000000000027;
}

uint64_t sub_252D0DF14()
{
  return swift_allocObject();
}

void sub_252D0DF3C()
{
  uint64_t v2 = *(os_unfair_lock_s **)(v0 + 24);
  os_unfair_lock_lock(v2 + 12);
}

uint64_t sub_252D0DF64(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270EF24A0](a1, a2, 0, 0, 0, 1, v2, v2);
}

uint64_t sub_252D0DF8C()
{
  return v0;
}

uint64_t sub_252D0DFA8()
{
  return sub_252D1A378();
}

void sub_252D0DFD0(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  os_unfair_lock_lock(v2 + 12);
}

uint64_t sub_252D0DFF4()
{
  return swift_allocObject();
}

uint64_t sub_252D0E018()
{
  return v0 + v1;
}

uint64_t sub_252D0E030(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

void sub_252D0E058(os_unfair_lock_s *a1@<X8>)
{
  os_unfair_lock_lock(a1 + 12);
}

__n128 sub_252D0E074()
{
  __n128 result = *(__n128 *)v0;
  long long v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 112) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 96) = v3;
  *(void *)(v1 - 80) = *(void *)(v0 + 32);
  return result;
}

uint64_t sub_252D0E088()
{
  return v0;
}

uint64_t sub_252D0E09C()
{
  return v0;
}

uint64_t sub_252D0E0B0()
{
  return v0;
}

uint64_t sub_252D0E0C4()
{
  return sub_252D199F8();
}

uint64_t sub_252D0E0E4()
{
  return swift_task_alloc();
}

void *sub_252D0E104()
{
  qword_269C49310 = (uint64_t)&unk_270317F38;
  return &unk_270317F38;
}

id static ToolboxXPCService.interface.getter()
{
  if (qword_269C418A0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_269C49310;

  return v0;
}

unint64_t static ToolboxXPCService.serviceName.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_252D0E190()
{
  sub_252AC3A24(&qword_269C49500);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_252D2A120;
  *(void *)(v0 + 32) = sel_queryWithPlannerType_query_k_clientIdentifier_availableClientActions_with_;
  *(void *)(v0 + 40) = 0;
  sub_252AC3A24(&qword_269C49508);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_252D2A100;
  uint64_t v2 = type metadata accessor for ToolboxSearchResult();
  uint64_t v3 = sub_252AC3A24(&qword_269C49510);
  *(void *)(v1 + 56) = v3;
  uint64_t v4 = v3;
  *(void *)(v1 + 32) = v2;
  uint64_t v20 = sub_252C0CBD4(0, &qword_269C49518);
  uint64_t v5 = sub_252AC3A24(&qword_269C49520);
  *(void *)(v1 + 88) = v5;
  uint64_t v6 = v5;
  uint64_t v19 = v5;
  *(void *)(v1 + 64) = v20;
  sub_252C0CBD4(0, &qword_269C49528);
  uint64_t v7 = (void *)MEMORY[0x2533C91C0](v1);
  sub_252C0CBD4(0, (unint64_t *)&qword_269C49530);
  sub_252D14890();
  uint64_t v8 = sub_252D19FF8();

  uint64_t v9 = sub_252D0E3F0(v8);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 48) = v9;
  *(void *)(v0 + 56) = sel_queryWithPlannerType_query_bundleIDs_with_;
  *(void *)(v0 + 64) = 0;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_252D2A100;
  *(void *)(v10 + 32) = v2;
  *(void *)(v10 + 88) = v6;
  *(void *)(v10 + 56) = v4;
  *(void *)(v10 + 64) = v20;
  uint64_t v11 = (void *)MEMORY[0x2533C91C0]();
  uint64_t v12 = sub_252D19FF8();

  uint64_t v13 = sub_252D0E3F0(v12);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 72) = v13;
  *(void *)(v0 + 80) = sel_queryWithPlannerType_query_toolIDs_with_;
  *(void *)(v0 + 88) = 0;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_252D2A100;
  *(void *)(v14 + 32) = v2;
  *(void *)(v14 + 88) = v19;
  *(void *)(v14 + 56) = v4;
  *(void *)(v14 + 64) = v20;
  uint64_t v15 = (void *)MEMORY[0x2533C91C0]();
  uint64_t v16 = sub_252D19FF8();

  uint64_t v17 = sub_252D0E3F0(v16);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v0 + 96) = v17;
  qword_269C49318 = v0;
  return result;
}

uint64_t sub_252D0E3F0(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_252D1A1F8()) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = MEMORY[0x263F8EE88];
    if (v2) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_6;
  }
LABEL_3:
  sub_252AC3A24((uint64_t *)&unk_269C49540);
  uint64_t v3 = sub_252D1A248();
  if (v2)
  {
LABEL_4:
    swift_bridgeObjectRetain();
    swift_retain();
    sub_252D1A1E8();
    sub_252C0CBD4(0, (unint64_t *)&qword_269C49530);
    sub_252D14890();
    uint64_t result = sub_252D1A058();
    uint64_t v1 = v34;
    uint64_t v30 = v35;
    uint64_t v5 = v36;
    int64_t v6 = v37;
    unint64_t v7 = v38;
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v8 = -1 << *(unsigned char *)(v1 + 32);
  uint64_t v30 = v1 + 56;
  uint64_t v5 = ~v8;
  uint64_t v9 = -v8;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v7 = v10 & *(void *)(v1 + 56);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v6 = 0;
LABEL_11:
  int64_t v29 = (unint64_t)(v5 + 64) >> 6;
  uint64_t v11 = v3 + 56;
  if (v1 < 0) {
    goto LABEL_14;
  }
LABEL_12:
  if (v7)
  {
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v13 = v12 | (v6 << 6);
    goto LABEL_32;
  }
  int64_t v15 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v15 < v29)
    {
      unint64_t v16 = *(void *)(v30 + 8 * v15);
      int64_t v17 = v6 + 1;
      if (v16) {
        goto LABEL_31;
      }
      int64_t v17 = v6 + 2;
      if (v6 + 2 < v29)
      {
        unint64_t v16 = *(void *)(v30 + 8 * v17);
        if (v16) {
          goto LABEL_31;
        }
        int64_t v17 = v6 + 3;
        if (v6 + 3 < v29)
        {
          unint64_t v16 = *(void *)(v30 + 8 * v17);
          if (v16) {
            goto LABEL_31;
          }
          int64_t v17 = v6 + 4;
          if (v6 + 4 < v29)
          {
            unint64_t v16 = *(void *)(v30 + 8 * v17);
            if (v16) {
              goto LABEL_31;
            }
            int64_t v17 = v6 + 5;
            if (v6 + 5 < v29)
            {
              unint64_t v16 = *(void *)(v30 + 8 * v17);
              if (!v16)
              {
                int64_t v18 = v6 + 6;
                while (v18 < v29)
                {
                  unint64_t v16 = *(void *)(v30 + 8 * v18++);
                  if (v16)
                  {
                    int64_t v17 = v18 - 1;
                    goto LABEL_31;
                  }
                }
                goto LABEL_44;
              }
LABEL_31:
              unint64_t v7 = (v16 - 1) & v16;
              unint64_t v13 = __clz(__rbit64(v16)) + (v17 << 6);
              int64_t v6 = v17;
LABEL_32:
              id v19 = *(id *)(*(void *)(v1 + 48) + 8 * v13);
              while (1)
              {
                sub_252C0CBD4(0, (unint64_t *)&qword_269C49530);
                swift_dynamicCast();
                uint64_t result = sub_252D1A218();
                uint64_t v20 = -1 << *(unsigned char *)(v3 + 32);
                unint64_t v21 = result & ~v20;
                unint64_t v22 = v21 >> 6;
                if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) == 0) {
                  break;
                }
                unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_42:
                *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
                uint64_t v28 = *(void *)(v3 + 48) + 40 * v23;
                *(_OWORD *)uint64_t v28 = v31;
                *(_OWORD *)(v28 + 16) = v32;
                *(void *)(v28 + 32) = v33;
                ++*(void *)(v3 + 16);
                if ((v1 & 0x8000000000000000) == 0) {
                  goto LABEL_12;
                }
LABEL_14:
                uint64_t v14 = sub_252D1A208();
                if (!v14) {
                  goto LABEL_44;
                }
                *(void *)&long long v31 = v14;
                sub_252C0CBD4(0, (unint64_t *)&qword_269C49530);
                swift_dynamicCast();
              }
              char v24 = 0;
              unint64_t v25 = (unint64_t)(63 - v20) >> 6;
              while (++v22 != v25 || (v24 & 1) == 0)
              {
                BOOL v26 = v22 == v25;
                if (v22 == v25) {
                  unint64_t v22 = 0;
                }
                v24 |= v26;
                uint64_t v27 = *(void *)(v11 + 8 * v22);
                if (v27 != -1)
                {
                  unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
                  goto LABEL_42;
                }
              }
              __break(1u);
              goto LABEL_46;
            }
          }
        }
      }
    }
LABEL_44:
    swift_release();
    sub_252CB7DF8();
    return v3;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t static ToolboxXPCService.selectorClasses.getter()
{
  if (qword_269C418A8 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_252D0E870()
{
  uint64_t v0 = sub_252D19B18();
  sub_252B2279C(v0, qword_269C49320);
  sub_252B01480(v0, (uint64_t)qword_269C49320);
  return sub_252D198D8();
}

uint64_t static ToolboxXPCService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C418B0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252D19B18();
  uint64_t v3 = sub_252B01480(v2, (uint64_t)qword_269C49320);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_252D0E968()
{
  return 0xD000000000000022;
}

id Readiness.toolKitTools.getter()
{
  return sub_252D14C00(OBJC_IVAR____TtC16IntelligenceFlow9Readiness_toolKitTools);
}

id Readiness.assistantSchemas.getter()
{
  return sub_252D14C00(OBJC_IVAR____TtC16IntelligenceFlow9Readiness_assistantSchemas);
}

uint64_t Readiness.totalEmbeddings.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow9Readiness_totalEmbeddings);
}

id Readiness.__allocating_init(toolKitTools:assistantSchemas:totalEmbeddings:)(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)sub_252D14D3C());
  return Readiness.init(toolKitTools:assistantSchemas:totalEmbeddings:)(v2, a2);
}

id Readiness.init(toolKitTools:assistantSchemas:totalEmbeddings:)(uint64_t a1, uint64_t a2)
{
  sub_252D14D3C();
  swift_getObjectType();
  *(void *)(v2 + OBJC_IVAR____TtC16IntelligenceFlow9Readiness_toolKitTools) = v3;
  *(void *)(v2 + OBJC_IVAR____TtC16IntelligenceFlow9Readiness_assistantSchemas) = a2;
  sub_252D14D1C(OBJC_IVAR____TtC16IntelligenceFlow9Readiness_totalEmbeddings);
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t static Readiness.supportsSecureCoding.getter()
{
  return byte_269C49338;
}

uint64_t static Readiness.supportsSecureCoding.setter(char a1)
{
  uint64_t result = sub_252D14984();
  byte_269C49338 = a1;
  return result;
}

uint64_t (*static Readiness.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess_0;
}

Swift::Void __swiftcall Readiness.encode(with:)(NSCoder with)
{
  sub_252AFC6D4();
  uint64_t v3 = v2;
  id v4 = (void *)sub_252D19D18();
  sub_252D14A8C((uint64_t)v4, sel_encodeObject_forKey_);

  uint64_t v5 = (void *)sub_252D14D74();
  sub_252D14A8C((uint64_t)v5, sel_encodeObject_forKey_);

  objc_msgSend(v3, sel_encodeInteger_forKey_, *(void *)(v1 + OBJC_IVAR____TtC16IntelligenceFlow9Readiness_totalEmbeddings), sub_252D14AA8());
  sub_252AFC6B4();
}

#error "252D0ECB4: call analysis failed (funcsize=10)"

void Readiness.init(coder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  sub_252AFC6D4();
  a16 = v19;
  a17 = v20;
  unint64_t v21 = (objc_class *)sub_252D14BA0();
  type metadata accessor for ToolBoxIndexedSource();
  unint64_t v22 = v18;
  sub_252D14D48();
  uint64_t v23 = sub_252D1A108();
  if (v23)
  {
    *(void *)&v18[OBJC_IVAR____TtC16IntelligenceFlow9Readiness_toolKitTools] = v23;
    sub_252D14C08();
    uint64_t v24 = sub_252D1A108();
    if (v24)
    {
      *(void *)&v18[OBJC_IVAR____TtC16IntelligenceFlow9Readiness_assistantSchemas] = v24;
      unint64_t v25 = (void *)sub_252D14AA8();
      id v26 = objc_msgSend(v17, sel_decodeIntegerForKey_, v25);

      *(void *)&v18[OBJC_IVAR____TtC16IntelligenceFlow9Readiness_totalEmbeddings] = v26;
      a9.receiver = v18;
      a9.super_class = v21;
      objc_msgSendSuper2(&a9, sel_init);

      sub_252AFC6B4();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t type metadata accessor for ToolBoxIndexedSource()
{
  return self;
}

#error "252D0EDEC: call analysis failed (funcsize=10)"

void Readiness.init()()
{
}

uint64_t ToolBoxIndexedSource.upToDateWithSource.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_upToDateWithSource);
}

uint64_t ToolBoxIndexedSource.eligibleTools.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_eligibleTools);
}

id ToolBoxIndexedSource.__allocating_init(upToDateWithSource:eligibleTools:)(char a1)
{
  id v3 = objc_allocWithZone(v1);
  return ToolBoxIndexedSource.init(upToDateWithSource:eligibleTools:)(a1);
}

id ToolBoxIndexedSource.init(upToDateWithSource:eligibleTools:)(char a1)
{
  swift_getObjectType();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_upToDateWithSource) = a1;
  sub_252D14D1C(OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_eligibleTools);
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t static ToolBoxIndexedSource.supportsSecureCoding.getter()
{
  return byte_269C49339;
}

uint64_t static ToolBoxIndexedSource.supportsSecureCoding.setter(char a1)
{
  uint64_t result = sub_252D14984();
  byte_269C49339 = a1;
  return result;
}

uint64_t (*static ToolBoxIndexedSource.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess_0;
}

Swift::Void __swiftcall ToolBoxIndexedSource.encode(with:)(NSCoder with)
{
  uint64_t v3 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_upToDateWithSource);
  objc_super v4 = (void *)sub_252D14A04();
  [(objc_class *)with.super.isa encodeBool:v3 forKey:v4];

  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_eligibleTools);
  id v6 = (id)sub_252D14AD8();
  [(objc_class *)with.super.isa encodeInteger:v5 forKey:v6];
}

#error "252D0F160: call analysis failed (funcsize=10)"

void ToolBoxIndexedSource.init(coder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  sub_252AFC6D4();
  a16 = v18;
  a17 = v19;
  uint64_t v20 = v17;
  unint64_t v22 = v21;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v24 = v20;
  unint64_t v25 = (void *)sub_252D14A04();
  unsigned __int8 v26 = objc_msgSend(v22, sel_decodeBoolForKey_, v25);

  v24[OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_upToDateWithSource] = v26;
  uint64_t v27 = (void *)sub_252D14AD8();
  id v28 = objc_msgSend(v22, sel_decodeIntegerForKey_, v27);

  *(void *)&v24[OBJC_IVAR____TtC16IntelligenceFlow20ToolBoxIndexedSource_eligibleTools] = v28;
  a9.receiver = v24;
  a9.super_class = ObjectType;
  objc_msgSendSuper2(&a9, sel_init);

  sub_252AFC6B4();
}

#error "252D0F25C: call analysis failed (funcsize=10)"

void ToolBoxIndexedSource.init()()
{
}

uint64_t ToolboxIndexedMetadata.id.getter()
{
  return sub_252AEA3DC();
}

uint64_t ToolboxIndexedMetadata.name.getter()
{
  return sub_252AEA3DC();
}

uint64_t ToolboxIndexedMetadata.toolDescription.getter()
{
  return sub_252AEA3DC();
}

uint64_t ToolboxIndexedMetadata.positiveUtterances.getter()
{
  return sub_252D1497C();
}

uint64_t ToolboxIndexedMetadata.negativeUtterances.getter()
{
  return sub_252D1497C();
}

id ToolboxIndexedMetadata.__allocating_init(id:name:toolDescription:positiveUtterances:negativeUtterances:)()
{
  id v0 = objc_allocWithZone((Class)sub_252D14A64());
  return ToolboxIndexedMetadata.init(id:name:toolDescription:positiveUtterances:negativeUtterances:)();
}

id ToolboxIndexedMetadata.init(id:name:toolDescription:positiveUtterances:negativeUtterances:)()
{
  sub_252D14A64();
  swift_getObjectType();
  uint64_t v8 = (void *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_id);
  *uint64_t v8 = v7;
  v8[1] = v6;
  uint64_t v9 = (void *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_name);
  *uint64_t v9 = v5;
  v9[1] = v4;
  uint64_t v10 = (void *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_toolDescription);
  *uint64_t v10 = v3;
  v10[1] = v2;
  *(void *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_positiveUtterances) = v1;
  sub_252D14D1C(OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_negativeUtterances);
  return objc_msgSendSuper2(&v12, sel_init);
}

uint64_t static ToolboxIndexedMetadata.supportsSecureCoding.getter()
{
  return byte_269C4933A;
}

uint64_t static ToolboxIndexedMetadata.supportsSecureCoding.setter(char a1)
{
  uint64_t result = sub_252D14984();
  byte_269C4933A = a1;
  return result;
}

uint64_t (*static ToolboxIndexedMetadata.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess_0;
}

#error "252D0F6B4: call analysis failed (funcsize=96)"

unint64_t ToolboxIndexedMetadata.__allocating_init(coder:)()
{
  return ToolboxIndexedMetadata.init(coder:)();
}

unint64_t ToolboxIndexedMetadata.init(coder:)()
{
  uint64_t v2 = (objc_class *)sub_252D14BA0();
  sub_252C0CBD4(0, &qword_269C49390);
  uint64_t v3 = v1;
  unint64_t result = sub_252D1A108();
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = (void *)result;
  uint64_t v6 = sub_252D19D48();
  uint64_t v8 = v7;

  uint64_t v9 = (uint64_t *)&v3[OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_id];
  *uint64_t v9 = v6;
  v9[1] = v8;
  unint64_t result = sub_252D1A108();
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v10 = (void *)result;
  uint64_t v11 = sub_252D19D48();
  uint64_t v13 = v12;

  uint64_t v14 = (uint64_t *)&v3[OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_name];
  *uint64_t v14 = v11;
  v14[1] = v13;
  unint64_t result = sub_252D1A108();
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  int64_t v15 = (void *)result;
  uint64_t v16 = sub_252D19D48();
  uint64_t v18 = v17;

  uint64_t v19 = (uint64_t *)&v3[OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_toolDescription];
  *uint64_t v19 = v16;
  v19[1] = v18;
  unint64_t result = sub_252D14C24();
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v20 = sub_252D0F940(result);
  swift_bridgeObjectRelease();
  *(void *)&v3[OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_positiveUtterances] = v20;
  unint64_t result = sub_252D14C24();
  if (result)
  {
    uint64_t v21 = sub_252D0F940(result);
    swift_bridgeObjectRelease();
    *(void *)&v3[OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_negativeUtterances] = v21;

    v23.receiver = v3;
    v23.super_class = v2;
    id v22 = objc_msgSendSuper2(&v23, sel_init);

    return (unint64_t)v22;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_252D0F940(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_252D1A388();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = (uint64_t)sub_252B7D0F4(0, v2 & ~(v2 >> 63), 0);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    if ((a1 & 0xC000000000000001) != 0) {
      MEMORY[0x2533C93B0](0, a1);
    }
    else {
      id v4 = *(id *)(a1 + 32);
    }
    uint64_t result = sub_252D19D28();
  }
  __break(1u);
  return result;
}

void ToolboxIndexedMetadata.init()()
{
}

uint64_t sub_252D0FAF4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_252D1A5D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 1701667182 && a2 == 0xE400000000000000;
    if (v6 || (sub_252D1A5D8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x637365446C6F6F74 && a2 == 0xEF6E6F6974706972;
      if (v7 || (sub_252D1A5D8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000012 && a2 == 0x8000000252D1F0E0 || (sub_252D1A5D8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000012 && a2 == 0x8000000252D1F100)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        char v8 = sub_252D1A5D8();
        swift_bridgeObjectRelease();
        if (v8) {
          return 4;
        }
        else {
          return 5;
        }
      }
    }
  }
}

unint64_t sub_252D0FCFC(char a1)
{
  unint64_t result = 25705;
  switch(a1)
  {
    case 1:
      unint64_t result = 1701667182;
      break;
    case 2:
      unint64_t result = 0x637365446C6F6F74;
      break;
    case 3:
    case 4:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_252D0FD9C()
{
  return sub_252D0FCFC(*v0);
}

uint64_t sub_252D0FDA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D0FAF4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D0FDCC(uint64_t a1)
{
  unint64_t v2 = sub_252D10098();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D0FE08(uint64_t a1)
{
  unint64_t v2 = sub_252D10098();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ToolboxIndexedMetadata.encode(to:)(void *a1)
{
  sub_252AC3A24(&qword_269C49398);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v3);
  sub_252AC3A68(a1, a1[3]);
  sub_252D10098();
  sub_252AF4784();
  sub_252D1A528();
  if (!v1)
  {
    sub_252D14CB0(1);
    sub_252D1A528();
    sub_252D14CB0(2);
    sub_252D1A4E8();
    sub_252AC3A24(qword_269C41E38);
    sub_252D01624(&qword_269C493B0);
    sub_252D14B34();
    sub_252D14B34();
  }
  uint64_t v4 = sub_252AF4620();
  return v5(v4);
}

unint64_t sub_252D10098()
{
  unint64_t result = qword_269C493A0;
  if (!qword_269C493A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C493A0);
  }
  return result;
}

unint64_t ToolboxIndexedMetadata.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ToolboxIndexedMetadata.init(from:)(a1);
}

unint64_t ToolboxIndexedMetadata.init(from:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_252AC3A24(&qword_269C493B8);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v4);
  sub_252AF45D8();
  sub_252AC3A68(a1, a1[3]);
  unint64_t v5 = sub_252D10098();
  BOOL v6 = v1;
  sub_252D1A718();
  if (v2)
  {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)a1);

    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v7 = sub_252D1A448();
    uint64_t v9 = (uint64_t *)&v6[OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_id];
    *uint64_t v9 = v7;
    v9[1] = v10;
    uint64_t v11 = sub_252D1A448();
    uint64_t v12 = (uint64_t *)&v6[OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_name];
    *uint64_t v12 = v11;
    v12[1] = v13;
    LOBYTE(v22) = 2;
    uint64_t v14 = sub_252D1A408();
    int64_t v15 = (uint64_t *)&v6[OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_toolDescription];
    *int64_t v15 = v14;
    v15[1] = v16;
    sub_252AC3A24(qword_269C41E38);
    sub_252D01624(&qword_269C493C0);
    sub_252D1A498();
    *(void *)&v6[OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_positiveUtterances] = v22;
    char v21 = 4;
    sub_252D1A498();
    *(void *)&v6[OBJC_IVAR____TtC16IntelligenceFlow22ToolboxIndexedMetadata_negativeUtterances] = v22;

    v20.receiver = v6;
    v20.super_class = ObjectType;
    unint64_t v5 = (unint64_t)objc_msgSendSuper2(&v20, sel_init);
    uint64_t v17 = sub_252CE9648();
    v18(v17);
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)a1);
  }
  return v5;
}

unint64_t sub_252D104BC@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = ToolboxIndexedMetadata.__allocating_init(from:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_252D104E8(void *a1)
{
  return ToolboxIndexedMetadata.encode(to:)(a1);
}

uint64_t ToolboxIndexedTools.tools.getter()
{
  return sub_252D1497C();
}

uint64_t ToolboxIndexedTools.assistantSchemas.getter()
{
  return sub_252D1497C();
}

id ToolboxIndexedTools.__allocating_init(tools:assistantSchemas:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return ToolboxIndexedTools.init(tools:assistantSchemas:)(a1);
}

id ToolboxIndexedTools.init(tools:assistantSchemas:)(uint64_t a1)
{
  swift_getObjectType();
  *(void *)(v1 + OBJC_IVAR____TtC16IntelligenceFlow19ToolboxIndexedTools_tools) = a1;
  sub_252D14D1C(OBJC_IVAR____TtC16IntelligenceFlow19ToolboxIndexedTools_assistantSchemas);
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t static ToolboxIndexedTools.supportsSecureCoding.getter()
{
  return byte_269C4933B;
}

uint64_t static ToolboxIndexedTools.supportsSecureCoding.setter(char a1)
{
  uint64_t result = sub_252D14984();
  byte_269C4933B = a1;
  return result;
}

uint64_t (*static ToolboxIndexedTools.supportsSecureCoding.modify())()
{
  return j__swift_endAccess_0;
}

#error "252D10758: call analysis failed (funcsize=48)"

uint64_t type metadata accessor for ToolboxIndexedMetadata()
{
  return self;
}

uint64_t ToolboxIndexedTools.__allocating_init(coder:)()
{
  return ToolboxIndexedTools.init(coder:)();
}

uint64_t ToolboxIndexedTools.init(coder:)()
{
  uint64_t v2 = (objc_class *)sub_252D14BA0();
  type metadata accessor for ToolboxIndexedMetadata();
  id v3 = v1;
  sub_252D14D48();
  uint64_t result = sub_252D1A118();
  if (result)
  {
    *(void *)&v1[OBJC_IVAR____TtC16IntelligenceFlow19ToolboxIndexedTools_tools] = result;
    sub_252D14C08();
    uint64_t result = sub_252D1A118();
    if (result)
    {
      *(void *)&v1[OBJC_IVAR____TtC16IntelligenceFlow19ToolboxIndexedTools_assistantSchemas] = result;

      v6.receiver = v1;
      v6.super_class = v2;
      id v5 = objc_msgSendSuper2(&v6, sel_init);

      return (uint64_t)v5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id ToolboxIndexedTools.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void ToolboxIndexedTools.init()()
{
}

uint64_t sub_252D10980(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x736C6F6F74 && a2 == 0xE500000000000000;
  if (v2 || (sub_252D1A5D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000252D1F040)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_252D1A5D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_252D10A68(char a1)
{
  if (a1) {
    return 0xD000000000000010;
  }
  else {
    return 0x736C6F6F74;
  }
}

uint64_t sub_252D10AA0()
{
  return sub_252D10A68(*v0);
}

uint64_t sub_252D10AA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D10980(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D10AD0(uint64_t a1)
{
  unint64_t v2 = sub_252D10CF8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D10B0C(uint64_t a1)
{
  unint64_t v2 = sub_252D10CF8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ToolboxIndexedTools.encode(to:)(void *a1)
{
  sub_252AC3A24(&qword_269C493D8);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v3);
  sub_252AC3A68(a1, a1[3]);
  sub_252D10CF8();
  sub_252AF4784();
  sub_252AC3A24(&qword_269C493E8);
  sub_252D10FC4();
  sub_252D14B08();
  if (!v1) {
    sub_252D14B08();
  }
  uint64_t v4 = sub_252AF4620();
  return v5(v4);
}

unint64_t sub_252D10CF8()
{
  unint64_t result = qword_269C493E0;
  if (!qword_269C493E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C493E0);
  }
  return result;
}

unint64_t ToolboxIndexedTools.__allocating_init(from:)()
{
  id v1 = objc_allocWithZone(v0);
  return ToolboxIndexedTools.init(from:)();
}

unint64_t ToolboxIndexedTools.init(from:)()
{
  sub_252D14D3C();
  ObjectType = (objc_class *)swift_getObjectType();
  sub_252AC3A24(&qword_269C49400);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v3);
  sub_252AF45D8();
  sub_252AC3A68(v2, v2[3]);
  unint64_t v4 = sub_252D10CF8();
  id v5 = v0;
  sub_252D1A718();
  if (v1)
  {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v2);

    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_252AC3A24(&qword_269C493E8);
    sub_252D10FC4();
    sub_252D14C68();
    *(void *)&v5[OBJC_IVAR____TtC16IntelligenceFlow19ToolboxIndexedTools_tools] = v12;
    char v11 = 1;
    sub_252D14C68();
    *(void *)&v5[OBJC_IVAR____TtC16IntelligenceFlow19ToolboxIndexedTools_assistantSchemas] = v12;

    v10.receiver = v5;
    v10.super_class = ObjectType;
    unint64_t v4 = (unint64_t)objc_msgSendSuper2(&v10, sel_init);
    uint64_t v7 = sub_252D14C4C();
    v8(v7);
    _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v2);
  }
  return v4;
}

void sub_252D10FC4()
{
  sub_252AFC6D4();
  unint64_t v2 = v1;
  if (!*v1)
  {
    uint64_t v3 = v0;
    sub_252AEA288(&qword_269C493E8);
    sub_252D11050(v3, v4, (void (*)(uint64_t))type metadata accessor for ToolboxIndexedMetadata);
    atomic_store(swift_getWitnessTable(), v2);
  }
  sub_252AFC6B4();
}

uint64_t sub_252D11050(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_252D11098@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ToolboxIndexedTools.__allocating_init(from:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_252D110C4(void *a1)
{
  return ToolboxIndexedTools.encode(to:)(a1);
}

float ToolboxSearchResult.similarity.getter()
{
  return *(float *)(v0 + OBJC_IVAR____TtC16IntelligenceFlow19ToolboxSearchResult_similarity);
}

uint64_t ToolboxSearchResult.toolEmbeddingSnippet.getter()
{
  return sub_252AEA3DC();
}

id ToolboxSearchResult.__allocating_init(similarity:toolEmbeddingSnippet:)()
{
  id v0 = objc_allocWithZone((Class)sub_252D14D28());
  return ToolboxSearchResult.init(similarity:toolEmbeddingSnippet:)();
}

id ToolboxSearchResult.init(similarity:toolEmbeddingSnippet:)()
{
  sub_252D14D28();
  ObjectType = (objc_class *)swift_getObjectType();
  *(_DWORD *)&v1[OBJC_IVAR____TtC16IntelligenceFlow19ToolboxSearchResult_similarity] = v3;
  id v5 = &v1[OBJC_IVAR____TtC16IntelligenceFlow19ToolboxSearchResult_toolEmbeddingSnippet];
  *(void *)id v5 = v2;
  *((void *)v5 + 1) = v0;
  v7.receiver = v1;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t static ToolboxSearchResult.supportsSecureCoding.getter()
{
  return byte_269C4933C;
}

uint64_t static ToolboxSearchResult.supportsSecureCoding.setter(char a1)
{
  uint64_t result = sub_252D14984();
  byte_269C4933C = a1;
  return result;
}

uint64_t (*static ToolboxSearchResult.supportsSecureCoding.modify())()
{
  return j_j__swift_endAccess_0;
}

Swift::Void __swiftcall ToolboxSearchResult.encode(with:)(NSCoder with)
{
  int v3 = *(_DWORD *)(v1 + OBJC_IVAR____TtC16IntelligenceFlow19ToolboxSearchResult_similarity);
  uint64_t v4 = (void *)sub_252D14BD8();
  LODWORD(v5) = v3;
  [(objc_class *)with.super.isa encodeFloat:v4 forKey:v5];

  char v6 = (void *)sub_252D19D18();
  id v7 = (id)sub_252D19D18();
  [(objc_class *)with.super.isa encodeObject:v6 forKey:v7];
}

uint64_t ToolboxSearchResult.__allocating_init(coder:)()
{
  return ToolboxSearchResult.init(coder:)();
}

uint64_t ToolboxSearchResult.init(coder:)()
{
  sub_252D14BA0();
  sub_252C0CBD4(0, &qword_269C49390);
  id v2 = v1;
  uint64_t v3 = sub_252D1A108();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v6 = 0;
    sub_252D19D38();
  }
  swift_deallocPartialClassInstance();
  return 0;
}

void ToolboxSearchResult.init()()
{
}

id _s16IntelligenceFlow9ReadinessCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ToolboxClient.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  ToolboxClient.init()(v0, v1);
  return v0;
}

uint64_t ToolboxClient.init()(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = 0;
  sub_252D11050(&qword_269C49428, a2, (void (*)(uint64_t))type metadata accessor for ToolboxClient);
  sub_252AC3A24(&qword_269C49430);
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + 16) = sub_252D199C8();
  swift_release();
  return v2;
}

uint64_t type metadata accessor for ToolboxClient()
{
  return self;
}

uint64_t sub_252D11710()
{
  uint64_t v0 = sub_252D19868();
  sub_252AEDBD0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  double v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, *MEMORY[0x263F4E348], v0);
  sub_252D19858();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v0);
}

void sub_252D117DC()
{
  if (*(void *)(v0 + 16))
  {
    sub_252D14DBC();
    MEMORY[0x270FA5388](v1);
    sub_252D14B60();
    type metadata accessor for Readiness();
    sub_252D14D5C();
    sub_252D149E4();
    sub_252D14A30();
    sub_252D14A24();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252D11860(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  uint64_t v9 = 0xE800000000000000;
  uint64_t v10 = 0x647261646E617473;
  uint64_t v11 = v8;
  switch(a4)
  {
    case 1:
      uint64_t v9 = 0xE500000000000000;
      uint64_t v10 = 0x796D6D7564;
      break;
    case 2:
      uint64_t v9 = 0xE700000000000000;
      uint64_t v10 = 0x676E6974736574;
      break;
    case 3:
      uint64_t v9 = 0xE300000000000000;
      uint64_t v10 = 7169123;
      break;
    default:
      break;
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D119C0(v10, v9, (uint64_t)sub_252D14978, v11, a1);
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D11994(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252D11860(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t type metadata accessor for Readiness()
{
  return self;
}

void sub_252D119C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)sub_252D19D18();
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_252D11A94;
  v10[3] = &unk_270313B80;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a5, sel_readinessWithPlannerType_with_, v8, v9);
  _Block_release(v9);
}

void sub_252D11A98()
{
  if (*(void *)(v1 + 16))
  {
    sub_252D14DBC();
    MEMORY[0x270FA5388](v2);
    sub_252D14B60();
    sub_252C0CBD4(0, qword_26B232180);
    sub_252D14D5C();
    sub_252D149E4();
    sub_252D14A30();
    if (!v0)
    {
      objc_msgSend(v3, sel_integerValue);
    }
    sub_252D14A24();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252D11B4C(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  uint64_t v9 = 0xE800000000000000;
  uint64_t v10 = 0x647261646E617473;
  uint64_t v11 = v8;
  switch(a4)
  {
    case 1:
      uint64_t v9 = 0xE500000000000000;
      uint64_t v10 = 0x796D6D7564;
      break;
    case 2:
      uint64_t v9 = 0xE700000000000000;
      uint64_t v10 = 0x676E6974736574;
      break;
    case 3:
      uint64_t v9 = 0xE300000000000000;
      uint64_t v10 = 7169123;
      break;
    default:
      break;
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D11C88(v10, v9, (uint64_t)sub_252D0DE48, v11, a1);
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D11C80(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252D11B4C(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

void sub_252D11C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)sub_252D19D18();
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_252D14EF0;
  v10[3] = &unk_270313B30;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a5, sel_populateWithPlannerType_with_, v8, v9);
  _Block_release(v9);
}

uint64_t sub_252D11D5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v27 = sub_252D19418();
  sub_252AEDBD0();
  uint64_t v24 = v3;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_252D19498();
  sub_252AEDBD0();
  uint64_t v22 = v8;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  int64_t v15 = (char *)&v21 - v14;
  if (*(void *)(v1 + 16))
  {
    MEMORY[0x270FA5388](result);
    *((unsigned char *)&v21 - 16) = v16;
    swift_retain();
    sub_252D199A8();
    uint64_t result = swift_release();
    if (!v2)
    {
      sub_252D198A8();
      uint64_t v25 = sub_252D19458();
      uint64_t v26 = v17;
      uint64_t v18 = v24;
      uint64_t v19 = v27;
      (*(void (**)(char *, void, uint64_t))(v24 + 104))(v6, *MEMORY[0x263F06E50], v27);
      sub_252D0AD7C();
      sub_252D19488();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v19);
      swift_bridgeObjectRelease();
      objc_super v20 = *(void (**)(char *, uint64_t))(v22 + 8);
      v20(v12, v7);
      return ((uint64_t (*)(char *, uint64_t))v20)(v15, v7);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_252D11FAC(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = 0xE800000000000000;
  uint64_t v5 = 0x647261646E617473;
  switch(a4)
  {
    case 1:
      uint64_t v4 = 0xE500000000000000;
      uint64_t v5 = 0x796D6D7564;
      break;
    case 2:
      uint64_t v4 = 0xE700000000000000;
      uint64_t v5 = 0x676E6974736574;
      break;
    case 3:
      uint64_t v4 = 0xE300000000000000;
      uint64_t v5 = 7169123;
      break;
    default:
      break;
  }
  swift_unknownObjectRetain();
  sub_252D120A8(v5, v4, a2, a3, a1);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D120A0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252D11FAC(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

void sub_252D120A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (void *)sub_252D19D18();
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_252D1217C;
  v10[3] = &unk_270313AE0;
  uint64_t v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(a5, sel_baseRelativeURLWithPlannerType_with_, v8, v9);
  _Block_release(v9);
}

uint64_t sub_252D1217C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_252AC3A24(&qword_26B230E38);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_252D19448();
    uint64_t v10 = sub_252D19498();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = sub_252D19498();
    uint64_t v11 = 1;
  }
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v8, v11, 1, v10);
  swift_retain();
  id v12 = a3;
  v9(v8, a3);
  swift_release();

  return sub_252D14830((uint64_t)v8);
}

void sub_252D12278(uint64_t a1)
{
  if (*(void *)(v1 + 16))
  {
    MEMORY[0x270FA5388](a1);
    swift_retain();
    sub_252AC3A24(&qword_269C49438);
    sub_252D14A48();
    sub_252D14A30();
    sub_252D14A24();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252D12330(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  uint64_t v17 = 0xE800000000000000;
  uint64_t v18 = 0x647261646E617473;
  uint64_t v19 = v16;
  switch(a4)
  {
    case 1:
      uint64_t v17 = 0xE500000000000000;
      uint64_t v18 = 0x796D6D7564;
      break;
    case 2:
      uint64_t v17 = 0xE700000000000000;
      uint64_t v18 = 0x676E6974736574;
      break;
    case 3:
      uint64_t v17 = 0xE300000000000000;
      uint64_t v18 = 7169123;
      break;
    default:
      break;
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D124D0(v18, v17, a5, a6, a7, a8, a9, a10, (uint64_t)sub_252D14978, v19, a1);
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D1249C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252D12330(a1, a2, a3, *(unsigned char *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void **)(v3 + 56), *(void *)(v3 + 64));
}

void sub_252D124D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  uint64_t v13 = (void *)sub_252D19D18();
  uint64_t v14 = (void *)sub_252D19D18();
  if (a7) {
    a7 = (void *)sub_252D19D18();
  }
  int64_t v15 = (void *)sub_252D19FE8();
  v17[4] = a9;
  v17[5] = a10;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = sub_252D12624;
  v17[3] = &unk_270313AB8;
  uint64_t v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  objc_msgSend(a11, sel_queryWithPlannerType_query_k_clientIdentifier_availableClientActions_with_, v13, v14, a5, a7, v15, v16);
  _Block_release(v16);
}

uint64_t sub_252D12624(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for ToolboxSearchResult();
    uint64_t v4 = sub_252D19ED8();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_252D126B4()
{
  if (*(void *)(v0 + 16))
  {
    sub_252D14D94();
    MEMORY[0x270FA5388](v1);
    sub_252D14B74();
    sub_252AC3A24(&qword_269C49438);
    sub_252D14A48();
    sub_252D14A30();
    sub_252D14A24();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252D12740(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  uint64_t v15 = 0xE800000000000000;
  uint64_t v16 = 0x647261646E617473;
  uint64_t v17 = v14;
  switch(a4)
  {
    case 1:
      uint64_t v15 = 0xE500000000000000;
      uint64_t v16 = 0x796D6D7564;
      break;
    case 2:
      uint64_t v15 = 0xE700000000000000;
      uint64_t v16 = 0x676E6974736574;
      break;
    case 3:
      uint64_t v15 = 0xE300000000000000;
      uint64_t v16 = 7169123;
      break;
    default:
      break;
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D12ADC(v16, v15, a5, a6, a7, (uint64_t)sub_252D14978, v17, a1, (uint64_t)&unk_270313A68, (SEL *)&selRef_queryWithPlannerType_query_bundleIDs_with_);
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D128B8(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252D12740(a1, a2, a3, *(unsigned char *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40));
}

void sub_252D128C8()
{
  if (*(void *)(v0 + 16))
  {
    sub_252D14D94();
    MEMORY[0x270FA5388](v1);
    sub_252D14B74();
    sub_252AC3A24(&qword_269C49438);
    sub_252D14A48();
    sub_252D14A30();
    sub_252D14A24();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252D12954(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  uint64_t v15 = 0xE800000000000000;
  uint64_t v16 = 0x647261646E617473;
  uint64_t v17 = v14;
  switch(a4)
  {
    case 1:
      uint64_t v15 = 0xE500000000000000;
      uint64_t v16 = 0x796D6D7564;
      break;
    case 2:
      uint64_t v15 = 0xE700000000000000;
      uint64_t v16 = 0x676E6974736574;
      break;
    case 3:
      uint64_t v15 = 0xE300000000000000;
      uint64_t v16 = 7169123;
      break;
    default:
      break;
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D12ADC(v16, v15, a5, a6, a7, (uint64_t)sub_252D14978, v17, a1, (uint64_t)&unk_270313A18, (SEL *)&selRef_queryWithPlannerType_query_toolIDs_with_);
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D12ACC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252D12954(a1, a2, a3, *(unsigned char *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40));
}

void sub_252D12ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, SEL *a10)
{
  uint64_t v13 = (void *)sub_252D19D18();
  uint64_t v14 = (void *)sub_252D19D18();
  uint64_t v15 = (void *)sub_252D19EC8();
  v17[4] = a6;
  v17[5] = a7;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = sub_252D12624;
  v17[3] = a9;
  uint64_t v16 = _Block_copy(v17);
  swift_retain();
  swift_release();
  objc_msgSend(a8, *a10, v13, v14, v15, v16);
  _Block_release(v16);
}

void sub_252D12BF8(uint64_t a1)
{
  if (*(void *)(v1 + 16))
  {
    MEMORY[0x270FA5388](a1);
    swift_retain();
    sub_252AC3A24(&qword_269C49440);
    sub_252D14A48();
    sub_252D14A30();
    if (v2)
    {
LABEL_5:
      sub_252D14A24();
      return;
    }
    if (*(void *)(v3 + 16))
    {
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_252D12CC0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  uint64_t v13 = 0xE800000000000000;
  uint64_t v14 = 0x647261646E617473;
  uint64_t v15 = v12;
  switch(a6)
  {
    case 1:
      uint64_t v13 = 0xE500000000000000;
      uint64_t v14 = 0x796D6D7564;
      break;
    case 2:
      uint64_t v13 = 0xE700000000000000;
      uint64_t v14 = 0x676E6974736574;
      break;
    case 3:
      uint64_t v13 = 0xE300000000000000;
      uint64_t v14 = 7169123;
      break;
    default:
      break;
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D12E18(a4, a5, v14, v13, (uint64_t)sub_252D14978, v15, a1);
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D12E0C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252D12CC0(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32));
}

void sub_252D12E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v10 = (void *)sub_252D19D18();
  uint64_t v11 = (void *)sub_252D19D18();
  v13[4] = a5;
  v13[5] = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_252D12F0C;
  v13[3] = &unk_2703139C8;
  uint64_t v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(a7, sel_sandboxWithInjectionId_plannerType_with_, v10, v11, v12);
  _Block_release(v12);
}

uint64_t sub_252D12F0C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_252D19ED8();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_252D12FA4()
{
  if (*(void *)(v1 + 16))
  {
    sub_252D14DA8();
    MEMORY[0x270FA5388](v2);
    sub_252D14BBC();
    sub_252C0CBD4(0, qword_26B232180);
    sub_252D14D5C();
    sub_252D149E4();
    sub_252D14A30();
    if (!v0)
    {
      objc_msgSend(v3, sel_integerValue);
    }
    sub_252D14A24();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252D13058(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  uint64_t v17 = 0xE800000000000000;
  uint64_t v18 = 0x647261646E617473;
  uint64_t v19 = v16;
  switch(a4)
  {
    case 1:
      uint64_t v17 = 0xE500000000000000;
      uint64_t v18 = 0x796D6D7564;
      break;
    case 2:
      uint64_t v17 = 0xE700000000000000;
      uint64_t v18 = 0x676E6974736574;
      break;
    case 3:
      uint64_t v17 = 0xE300000000000000;
      uint64_t v18 = 7169123;
      break;
    default:
      break;
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D131DC(v18, v17, a5, a6, a7, a8, (uint64_t)sub_252D0D224, v19, a1);
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D131C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_252D13514(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void, void, void, void, void))sub_252D13058);
}

void sub_252D131DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v12 = (void *)sub_252D19D18();
  uint64_t v13 = (void *)sub_252D19D18();
  if (a6) {
    a6 = (void *)sub_252D19D18();
  }
  v15[4] = a7;
  v15[5] = a8;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  v15[2] = sub_252D14EF0;
  v15[3] = &unk_270313978;
  uint64_t v14 = _Block_copy(v15);
  swift_retain();
  swift_release();
  objc_msgSend(a9, sel_countWithPlannerType_toolType_clientIdentifier_with_, v12, v13, a6, v14);
  _Block_release(v14);
}

void sub_252D132FC()
{
  if (*(void *)(v0 + 16))
  {
    sub_252D14DA8();
    MEMORY[0x270FA5388](v1);
    sub_252D14BBC();
    swift_retain();
    sub_252AC3A24(&qword_269C49448);
    sub_252D14A48();
    sub_252D14A30();
    sub_252D14A24();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252D13390(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  uint64_t v17 = 0xE800000000000000;
  uint64_t v18 = 0x647261646E617473;
  uint64_t v19 = v16;
  switch(a4)
  {
    case 1:
      uint64_t v17 = 0xE500000000000000;
      uint64_t v18 = 0x796D6D7564;
      break;
    case 2:
      uint64_t v17 = 0xE700000000000000;
      uint64_t v18 = 0x676E6974736574;
      break;
    case 3:
      uint64_t v17 = 0xE300000000000000;
      uint64_t v18 = 7169123;
      break;
    default:
      break;
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D1352C(v18, v17, a5, a6, a7, a8, (uint64_t)sub_252D14978, v19, a1);
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D134FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_252D13514(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void, void, void, void, void))sub_252D13390);
}

uint64_t sub_252D13514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, void, void, void, void, void))
{
  return a4(a1, a2, a3, *(unsigned __int8 *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48));
}

void sub_252D1352C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v12 = (void *)sub_252D19D18();
  uint64_t v13 = (void *)sub_252D19D18();
  if (a6) {
    a6 = (void *)sub_252D19D18();
  }
  v15[4] = a7;
  v15[5] = a8;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  v15[2] = sub_252D1364C;
  v15[3] = &unk_270313928;
  uint64_t v14 = _Block_copy(v15);
  swift_retain();
  swift_release();
  objc_msgSend(a9, sel_listToolsWithPlannerType_toolType_clientIdentifier_with_, v12, v13, a6, v14);
  _Block_release(v14);
}

uint64_t sub_252D1364C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = sub_252D19FF8();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_252D136EC(uint64_t a1)
{
  if (*(void *)(v1 + 16))
  {
    MEMORY[0x270FA5388](a1);
    char v5 = v2;
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    swift_retain();
    sub_252D199A8();
    sub_252D14A30();
    sub_252D14A24();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252D13798(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  uint64_t v13 = 0xE800000000000000;
  uint64_t v14 = 0x647261646E617473;
  uint64_t v15 = v12;
  switch(a4)
  {
    case 1:
      uint64_t v13 = 0xE500000000000000;
      uint64_t v14 = 0x796D6D7564;
      break;
    case 2:
      uint64_t v13 = 0xE700000000000000;
      uint64_t v14 = 0x676E6974736574;
      break;
    case 3:
      uint64_t v13 = 0xE300000000000000;
      uint64_t v14 = 7169123;
      break;
    default:
      break;
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D138F0(v14, v13, a5, a6, (uint64_t)sub_252D147F4, v15, a1);
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D138E4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252D13798(a1, a2, a3, *(unsigned char *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32));
}

void sub_252D138F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v10 = (void *)sub_252D19D18();
  uint64_t v11 = (void *)sub_252D19D18();
  v13[4] = a5;
  v13[5] = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_252D139E4;
  v13[3] = &unk_2703138D8;
  uint64_t v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(a7, sel_toolMappingWithPlannerType_customKey_with_, v10, v11, v12);
  _Block_release(v12);
}

uint64_t sub_252D139E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    uint64_t v5 = sub_252D19D48();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  swift_retain();
  id v8 = a3;
  v4(v5, v7, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_252D13A7C(uint64_t a1)
{
  if (*(void *)(v1 + 16))
  {
    MEMORY[0x270FA5388](a1);
    sub_252D14B60();
    *(unsigned char *)(v3 - 15) = v2 & 1;
    type metadata accessor for ToolboxIndexedTools();
    sub_252D14D5C();
    sub_252D149E4();
    sub_252D14A30();
    sub_252D14A24();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_252D13B14(void *a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  uint64_t v11 = 0xE800000000000000;
  uint64_t v12 = 0x647261646E617473;
  uint64_t v13 = v10;
  switch(a4)
  {
    case 1:
      uint64_t v11 = 0xE500000000000000;
      uint64_t v12 = 0x796D6D7564;
      break;
    case 2:
      uint64_t v11 = 0xE700000000000000;
      uint64_t v12 = 0x676E6974736574;
      break;
    case 3:
      uint64_t v11 = 0xE300000000000000;
      uint64_t v12 = 7169123;
      break;
    default:
      break;
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_252D13C88(v12, v11, a5 & 1, (uint64_t)sub_252D0D1D4, v13, a1);
  swift_release();
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_252D13C58(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_252D13B14(a1, a2, a3, *(unsigned char *)(v3 + 16), *(unsigned char *)(v3 + 17));
}

uint64_t type metadata accessor for ToolboxIndexedTools()
{
  return self;
}

void sub_252D13C88(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10 = (void *)sub_252D19D18();
  v12[4] = a4;
  v12[5] = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  uint64_t v12[2] = sub_252D11A94;
  v12[3] = &unk_270313888;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  objc_msgSend(a6, sel_metadataWithPlannerType_enableAllowList_with_, v10, a3 & 1, v11);
  _Block_release(v11);
}

void sub_252D13D64()
{
  sub_252AFC6D4();
  char v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = *(void (**)(uint64_t, void *))(v5 + 32);
  swift_retain();
  v4;
  id v7 = v2;
  uint64_t v8 = sub_252D14D3C();
  v6(v8, v2);
  swift_release();

  sub_252AFC6B4();
}

uint64_t ToolboxClient.deinit()
{
  swift_release();
  return v0;
}

uint64_t ToolboxClient.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_252D13E3C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_252D11050(&qword_269C49428, a2, (void (*)(uint64_t))type metadata accessor for ToolboxClient);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_252D13E94()
{
  return sub_252D11050((unint64_t *)&unk_269C49450, 255, MEMORY[0x263F61838]);
}

uint64_t sub_252D13EE0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ToolboxClient();

  return MEMORY[0x270F57798](a1, v2);
}

uint64_t sub_252D13F34()
{
  return sub_252D11710();
}

ValueMetadata *type metadata accessor for ToolboxXPCService()
{
  return &type metadata for ToolboxXPCService;
}

uint64_t method lookup function for Readiness(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Readiness);
}

uint64_t dispatch thunk of Readiness.__allocating_init(toolKitTools:assistantSchemas:totalEmbeddings:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of Readiness.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t method lookup function for ToolBoxIndexedSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ToolBoxIndexedSource);
}

uint64_t dispatch thunk of ToolBoxIndexedSource.__allocating_init(upToDateWithSource:eligibleTools:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ToolBoxIndexedSource.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for ToolboxIndexedMetadata(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ToolboxIndexedMetadata);
}

uint64_t dispatch thunk of ToolboxIndexedMetadata.__allocating_init(id:name:toolDescription:positiveUtterances:negativeUtterances:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ToolboxIndexedMetadata.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ToolboxIndexedMetadata.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t method lookup function for ToolboxIndexedTools(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ToolboxIndexedTools);
}

uint64_t dispatch thunk of ToolboxIndexedTools.__allocating_init(tools:assistantSchemas:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ToolboxIndexedTools.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of ToolboxIndexedTools.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for ToolboxSearchResult()
{
  return self;
}

uint64_t method lookup function for ToolboxSearchResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ToolboxSearchResult);
}

uint64_t dispatch thunk of ToolboxSearchResult.__allocating_init(similarity:toolEmbeddingSnippet:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ToolboxSearchResult.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for ToolboxClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ToolboxClient);
}

uint64_t dispatch thunk of ToolboxClient.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ToolboxClient.xpcConnectionIsAllowed()()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ToolboxClient.readiness(plannerType:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ToolboxClient.populate(plannerType:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of ToolboxClient.baseURL(plannerType:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ToolboxClient.query(plannerType:query:k:clientIdentifier:availableClientActions:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of ToolboxClient.query(plannerType:query:bundleIDs:clientIdentifier:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ToolboxClient.query(plannerType:query:toolIDs:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of ToolboxClient.sandbox(injectionId:plannerType:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of ToolboxClient.count(plannerType:toolType:clientIdentifier:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of ToolboxClient.listTools(plannerType:toolType:clientIdentifier:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of ToolboxClient.toolMapping(plannerType:customKey:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of ToolboxClient.metadata(plannerType:enableAllowList:)()
{
  sub_252D0DE4C();
  return (*(uint64_t (**)(void))(v0 + 208))();
}

ValueMetadata *type metadata accessor for ToolboxClient.ToolboxClientError()
{
  return &type metadata for ToolboxClient.ToolboxClientError;
}

unsigned char *storeEnumTagSinglePayload for ToolboxIndexedTools.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D14488);
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

ValueMetadata *type metadata accessor for ToolboxIndexedTools.CodingKeys()
{
  return &type metadata for ToolboxIndexedTools.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ToolboxIndexedMetadata.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D1458CLL);
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

ValueMetadata *type metadata accessor for ToolboxIndexedMetadata.CodingKeys()
{
  return &type metadata for ToolboxIndexedMetadata.CodingKeys;
}

unint64_t sub_252D145C8()
{
  unint64_t result = qword_269C494C8;
  if (!qword_269C494C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C494C8);
  }
  return result;
}

unint64_t sub_252D14618()
{
  unint64_t result = qword_269C494D0;
  if (!qword_269C494D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C494D0);
  }
  return result;
}

unint64_t sub_252D14668()
{
  unint64_t result = qword_269C494D8;
  if (!qword_269C494D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C494D8);
  }
  return result;
}

unint64_t sub_252D146B8()
{
  unint64_t result = qword_269C494E0;
  if (!qword_269C494E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C494E0);
  }
  return result;
}

unint64_t sub_252D14708()
{
  unint64_t result = qword_269C494E8;
  if (!qword_269C494E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C494E8);
  }
  return result;
}

unint64_t sub_252D14758()
{
  unint64_t result = qword_269C494F0;
  if (!qword_269C494F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C494F0);
  }
  return result;
}

uint64_t sub_252D147A4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_252D147DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_252D147EC()
{
  return swift_release();
}

uint64_t sub_252D147F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = *(uint64_t (**)(void *, uint64_t))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  return v4(v6, a3);
}

uint64_t sub_252D14830(uint64_t a1)
{
  uint64_t v2 = sub_252AC3A24(&qword_26B230E38);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_252D14890()
{
  unint64_t result = qword_269C49538;
  if (!qword_269C49538)
  {
    sub_252C0CBD4(255, (unint64_t *)&qword_269C49530);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49538);
  }
  return result;
}

uint64_t sub_252D1497C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_252D14984()
{
  return swift_beginAccess();
}

uint64_t sub_252D149A4()
{
  return swift_beginAccess();
}

uint64_t sub_252D149C4()
{
  return swift_beginAccess();
}

uint64_t sub_252D149E4()
{
  return sub_252D199A8();
}

uint64_t sub_252D14A04()
{
  return sub_252D19D18();
}

uint64_t sub_252D14A30()
{
  return swift_release();
}

uint64_t sub_252D14A48()
{
  return sub_252D199A8();
}

uint64_t sub_252D14A64()
{
  return v0;
}

id sub_252D14A8C(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3, v4);
}

uint64_t sub_252D14AA8()
{
  return sub_252D19D18();
}

uint64_t sub_252D14AD8()
{
  return sub_252D19D18();
}

uint64_t sub_252D14B08()
{
  return sub_252D1A578();
}

uint64_t sub_252D14B34()
{
  return sub_252D1A578();
}

uint64_t sub_252D14B74()
{
  return swift_retain();
}

uint64_t sub_252D14BA0()
{
  return swift_getObjectType();
}

uint64_t sub_252D14BD8()
{
  return sub_252D19D18();
}

id sub_252D14C00@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(v1 + a1);
}

uint64_t sub_252D14C08()
{
  return v0;
}

uint64_t sub_252D14C24()
{
  return sub_252D1A118();
}

uint64_t sub_252D14C4C()
{
  return v0;
}

uint64_t sub_252D14C68()
{
  return sub_252D1A498();
}

id sub_252D14C8C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  return objc_msgSend(v10, (SEL)(v12 + 2501), v11, a1);
}

void sub_252D14CB0(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
}

id sub_252D14CC8()
{
  return objc_allocWithZone(v0);
}

uint64_t sub_252D14CE0()
{
  return v0;
}

uint64_t sub_252D14CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0160](a1, a2, a3, 6, 0);
}

uint64_t sub_252D14D10()
{
  return v0;
}

void sub_252D14D1C(uint64_t a1@<X8>)
{
  *(void *)(v2 + a1) = v1;
}

uint64_t sub_252D14D28()
{
  return v0;
}

uint64_t sub_252D14D3C()
{
  return v0;
}

uint64_t sub_252D14D48()
{
  return v0;
}

uint64_t sub_252D14D5C()
{
  return swift_retain();
}

uint64_t sub_252D14D74()
{
  return sub_252D19D18();
}

uint64_t sub_252D14DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t))
{
  v5[0] = a1;
  v5[1] = a2;
  return a4(v5, a3);
}

uint64_t sub_252D14E0C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)sub_252D194D8();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_252B592E8((uint64_t)v4, v8);

  return swift_release();
}

uint64_t sub_252D14EB8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *))
{
  uint64_t v4 = a1;
  return a3(&v4);
}

void sub_252D14EF0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_252D14F7C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = sub_252AC3A24(&qword_26B2320E8);
  MEMORY[0x270FA5388](v7 - 8);
  sub_252B4C81C();
  unint64_t v8 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_252D19548();
    uint64_t v9 = sub_252D19588();
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = sub_252D19588();
    uint64_t v10 = 1;
  }
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v3, v10, 1, v9);
  swift_retain();
  id v11 = a3;
  v8(v3, a3);
  swift_release();

  return sub_252AC8104(v3, &qword_26B2320E8);
}

void *sub_252D15070()
{
  qword_269C495B0 = (uint64_t)&unk_270317F98;
  return &unk_270317F98;
}

id static TranscriptEntityQueryingXPCServerService.interface.getter()
{
  return sub_252D0AE00(&qword_269C418B8, (void **)&qword_269C495B0);
}

unint64_t static TranscriptEntityQueryingXPCServerService.serviceName.getter()
{
  return sub_252D192DC();
}

void sub_252D150B4()
{
  qword_269C495B8 = MEMORY[0x263F8EE78];
}

uint64_t static TranscriptEntityQueryingXPCServerService.selectorClasses.getter()
{
  return sub_252D0AE90(&qword_269C418C0);
}

uint64_t sub_252D150EC(uint64_t a1)
{
  return sub_252D0AEE8(a1, qword_269C495C0);
}

uint64_t static TranscriptEntityQueryingXPCServerService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252D0AF54(&qword_269C418C8, (uint64_t)qword_269C495C0, a1);
}

uint64_t TranscriptEntityQueryingClient.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  TranscriptEntityQueryingClient.init()();
  return v0;
}

uint64_t TranscriptEntityQueryingClient.init()()
{
  sub_252D193A8();
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v2 = v0 + 16;
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  sub_252D058F0();
  *(void *)(v0 + 64) = sub_252D19398();
  sub_252D19378();
  sub_252D058F0();
  *(void *)(v0 + 72) = sub_252D19368();
  type metadata accessor for TranscriptEntityQueryingClient.ReverseServer();
  *(void *)(v0 + 56) = swift_allocObject();
  sub_252D157AC(&qword_269C49600, v3, (void (*)(uint64_t))type metadata accessor for TranscriptEntityQueryingClient);
  uint64_t v4 = sub_252AC3A24(&qword_269C49608);
  sub_252D058F0();
  swift_retain_n();
  swift_retain();
  uint64_t v5 = sub_252D19A18();
  if (v1)
  {
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v6 = v5;
    uint64_t v9 = v4;
    unint64_t v10 = sub_252D1533C();
    swift_release();
    *(void *)&long long v8 = v6;
    swift_beginAccess();
    if (*(void *)(v0 + 40)) {
      _s16IntelligenceFlow17AnySessionMessageVwxx_0(v2);
    }
    sub_252AEA2D0(&v8, v2);
    swift_endAccess();
  }
  return v0;
}

uint64_t type metadata accessor for TranscriptEntityQueryingClient.ReverseServer()
{
  return self;
}

uint64_t type metadata accessor for TranscriptEntityQueryingClient()
{
  return self;
}

unint64_t sub_252D1533C()
{
  unint64_t result = qword_269C49610;
  if (!qword_269C49610)
  {
    sub_252AEA288(&qword_269C49608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49610);
  }
  return result;
}

void sub_252D15390(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v30 = a3;
  uint64_t v7 = sub_252D19588();
  sub_252AEDBD0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TranscriptEntityEnumerationParameters(0);
  sub_252D157AC(&qword_269C49618, 255, (void (*)(uint64_t))type metadata accessor for TranscriptEntityEnumerationParameters);
  swift_retain();
  uint64_t v13 = sub_252D19388();
  unint64_t v15 = v14;
  swift_release();
  if (!v4)
  {
    long long v31 = a2;
    swift_beginAccess();
    uint64_t v26 = v5;
    uint64_t v16 = *(void *)(v5 + 40);
    unint64_t v28 = v15;
    if (v16) {
      sub_252AC7DA4(v5 + 16, (uint64_t)v34);
    }
    else {
      sub_252D19344();
    }
    uint64_t v27 = v13;
    uint64_t v24 = v9;
    uint64_t v29 = v7;
    if (v35)
    {
      uint64_t v17 = sub_252AC3A68(v34, v35);
      uint64_t v25 = &v23;
      MEMORY[0x270FA5388](v17);
      unint64_t v18 = v28;
      *(&v23 - 2) = v27;
      *(&v23 - 1) = v18;
      sub_252D199F8();
      uint64_t v19 = v26;
      _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v34);
      while (1)
      {
        if (*(void *)(v19 + 40)) {
          sub_252AC7DA4(v5 + 16, (uint64_t)v34);
        }
        else {
          sub_252D19344();
        }
        if (!v35) {
          break;
        }
        objc_super v20 = sub_252AC3A68(v34, v35);
        MEMORY[0x270FA5388](v20);
        *(&v23 - 2) = (uint64_t)v12;
        sub_252D199F8();
        uint64_t v21 = v32;
        unint64_t v22 = v33;
        _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)v34);
        sub_252AC3A24(&qword_269C49620);
        sub_252D15CF4();
        swift_retain();
        sub_252D19358();
        swift_release();
        if (!*(void *)(v36 + 16))
        {
          swift_bridgeObjectRelease();
          sub_252AC5C14(v21, v22);
          sub_252D158D8(v19, v12);
          sub_252AC5C14(v27, v28);
          (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v29);
          return;
        }
        v31(v36);
        sub_252AC5C14(v21, v22);
        swift_bridgeObjectRelease();
      }
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t type metadata accessor for TranscriptEntityEnumerationParameters(uint64_t a1)
{
  return sub_252AC76C8(a1, (uint64_t *)&unk_269C49698);
}

uint64_t sub_252D157AC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void sub_252D157F4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)sub_252D194B8();
  v8[4] = a2;
  v8[5] = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_252D14F7C;
  v8[3] = &unk_270313E38;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_getTranscriptEntitiesWithParameters_reply_, v6, v7);
  _Block_release(v7);
}

void sub_252D158D0(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_252D158D8(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_252D19B18();
  MEMORY[0x270FA5388](v4);
  uint64_t result = swift_beginAccess();
  if (*(void *)(a1 + 40))
  {
    uint64_t result = sub_252AC7DA4(a1 + 16, (uint64_t)&v9);
  }
  else
  {
    long long v6 = *(_OWORD *)(a1 + 32);
    long long v9 = *(_OWORD *)(a1 + 16);
    long long v10 = v6;
    uint64_t v11 = *(void *)(a1 + 48);
  }
  if (*((void *)&v10 + 1))
  {
    uint64_t v7 = sub_252AC3A68(&v9, *((uint64_t *)&v10 + 1));
    MEMORY[0x270FA5388](v7);
    v8[-2] = a2;
    sub_252D0AA30();
    sub_252D199F8();

    return _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)&v9);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_252D15BEC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  uint64_t v7 = (void *)sub_252D19528();
  v9[4] = sub_252D147F4;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_252D14E0C;
  v9[3] = &unk_270313E10;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_getTranscriptEntitiesBatchWithId_reply_, v7, v8);
  _Block_release(v8);
}

void sub_252D15CEC(void *a1, uint64_t a2, uint64_t a3)
{
}

unint64_t sub_252D15CF4()
{
  unint64_t result = qword_269C49628;
  if (!qword_269C49628)
  {
    sub_252AEA288(&qword_269C49620);
    sub_252D157AC(&qword_269C49630, 255, (void (*)(uint64_t))type metadata accessor for TranscriptEntityItem);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49628);
  }
  return result;
}

uint64_t type metadata accessor for TranscriptEntityItem(uint64_t a1)
{
  return sub_252AC76C8(a1, (uint64_t *)&unk_269C496B0);
}

uint64_t TranscriptEntityQueryingClient.deinit()
{
  if (*(void *)(v0 + 40)) {
    _s16IntelligenceFlow17AnySessionMessageVwxx_0(v0 + 16);
  }
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t TranscriptEntityQueryingClient.__deallocating_deinit()
{
  TranscriptEntityQueryingClient.deinit();

  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t sub_252D15E30(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TranscriptEntityQueryingClient();

  return MEMORY[0x270F57798](a1, v2);
}

uint64_t TranscriptEntityEnumerationParameters.tolerantMode.getter()
{
  return *v0;
}

uint64_t TranscriptEntityEnumerationParameters.tolerantMode.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*TranscriptEntityEnumerationParameters.tolerantMode.modify())()
{
  return nullsub_1;
}

uint64_t TranscriptEntityEnumerationParameters.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TranscriptEntityEnumerationParameters(0) + 20);

  return sub_252D15EF8(v3, a1);
}

uint64_t sub_252D15EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252AC3A24(&qword_269C49638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t TranscriptEntityEnumerationParameters.init()@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = (uint64_t)&a1[*(int *)(type metadata accessor for TranscriptEntityEnumerationParameters(0) + 20)];
  uint64_t v3 = sub_252D194F8();
  uint64_t result = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v2, 1, 1, v3);
  *a1 = 1;
  return result;
}

uint64_t TranscriptEntityEnumerationParameters.init(startDate:)@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  *a2 = 1;
  uint64_t v3 = (uint64_t)&a2[*(int *)(type metadata accessor for TranscriptEntityEnumerationParameters(0) + 20)];

  return sub_252D1600C(a1, v3);
}

uint64_t sub_252D1600C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252AC3A24(&qword_269C49638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL static TranscriptEntityEnumerationParameters.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v6 = sub_252D194F8();
  sub_252AEDBD0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  sub_252B4C81C();
  uint64_t v10 = sub_252AC3A24(&qword_269C49640);
  sub_252AEA304();
  MEMORY[0x270FA5388](v11);
  sub_252B5F6A0();
  uint64_t v12 = sub_252AC3A24(&qword_269C49638);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  unint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  unint64_t v18 = (char *)&v28 - v17;
  MEMORY[0x270FA5388](v16);
  objc_super v20 = (char *)&v28 - v19;
  if (*a1 != *a2) {
    return 0;
  }
  uint64_t v29 = v8;
  uint64_t v21 = type metadata accessor for TranscriptEntityEnumerationParameters(0);
  sub_252D15EF8((uint64_t)&a1[*(int *)(v21 + 20)], (uint64_t)v20);
  sub_252D15EF8((uint64_t)&a2[*(int *)(v21 + 20)], (uint64_t)v18);
  uint64_t v22 = v2 + *(int *)(v10 + 48);
  sub_252D15EF8((uint64_t)v20, v2);
  sub_252D15EF8((uint64_t)v18, v22);
  sub_252CB8170(v2);
  if (v23)
  {
    sub_252AC8104((uint64_t)v18, &qword_269C49638);
    sub_252AC8104((uint64_t)v20, &qword_269C49638);
    sub_252CB8170(v22);
    if (v23)
    {
      sub_252AC8104(v2, &qword_269C49638);
      return 1;
    }
    goto LABEL_10;
  }
  sub_252D15EF8(v2, (uint64_t)v15);
  sub_252CB8170(v22);
  if (v23)
  {
    sub_252AC8104((uint64_t)v18, &qword_269C49638);
    sub_252AC8104((uint64_t)v20, &qword_269C49638);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v6);
LABEL_10:
    sub_252AC8104(v2, &qword_269C49640);
    return 0;
  }
  uint64_t v24 = v29;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v3, v22, v6);
  sub_252D157AC(&qword_269C49648, 255, MEMORY[0x263F07490]);
  char v25 = sub_252D19CF8();
  uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
  v26(v3, v6);
  sub_252AC8104((uint64_t)v18, &qword_269C49638);
  sub_252AC8104((uint64_t)v20, &qword_269C49638);
  v26((uint64_t)v15, v6);
  sub_252AC8104(v2, &qword_269C49638);
  return (v25 & 1) != 0;
}

uint64_t sub_252D163B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E6172656C6F74 && a2 == 0xEC00000065646F4DLL;
  if (v2 || (sub_252D1A5D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7461447472617473 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_252D1A5D8();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_252D164C4(char a1)
{
  if (a1) {
    return 0x7461447472617473;
  }
  else {
    return 0x746E6172656C6F74;
  }
}

uint64_t sub_252D16508()
{
  return sub_252D164C4(*v0);
}

uint64_t sub_252D16510@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D163B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D16538(uint64_t a1)
{
  unint64_t v2 = sub_252D16700();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D16574(uint64_t a1)
{
  unint64_t v2 = sub_252D16700();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TranscriptEntityEnumerationParameters.encode(to:)(void *a1)
{
  sub_252AC3A24(&qword_269C49650);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v3);
  sub_252AC3A68(a1, a1[3]);
  sub_252D16700();
  sub_252AF4784();
  sub_252D1A538();
  if (!v1)
  {
    type metadata accessor for TranscriptEntityEnumerationParameters(0);
    sub_252D19320();
    sub_252D157AC(&qword_26B231C08, 255, MEMORY[0x263F07490]);
    sub_252D192F0();
    sub_252D1A518();
  }
  uint64_t v4 = sub_252AF4620();
  return v5(v4);
}

unint64_t sub_252D16700()
{
  unint64_t result = qword_269C49658;
  if (!qword_269C49658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49658);
  }
  return result;
}

uint64_t TranscriptEntityEnumerationParameters.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_252AC3A24(&qword_269C49638);
  MEMORY[0x270FA5388](v4 - 8);
  sub_252B0011C();
  uint64_t v7 = v6 - v5;
  sub_252AC3A24(&qword_269C49660);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = sub_252B5FA38();
  uint64_t v10 = type metadata accessor for TranscriptEntityEnumerationParameters(v9);
  sub_252AEA304();
  MEMORY[0x270FA5388](v11);
  sub_252B0011C();
  uint64_t v14 = (unsigned char *)(v13 - v12);
  sub_252AC3A68(a1, a1[3]);
  sub_252D16700();
  sub_252D1A718();
  if (v2) {
    return _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)a1);
  }
  *uint64_t v14 = sub_252D1A458() & 1;
  sub_252D194F8();
  sub_252D157AC(&qword_26B231430, 255, MEMORY[0x263F07490]);
  sub_252D1A438();
  uint64_t v15 = sub_252D19308();
  v16(v15);
  sub_252D1600C(v7, (uint64_t)&v14[*(int *)(v10 + 20)]);
  sub_252D175E8((uint64_t)v14, a2, (void (*)(void))type metadata accessor for TranscriptEntityEnumerationParameters);
  _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)a1);
  return sub_252D17648((uint64_t)v14, (void (*)(void))type metadata accessor for TranscriptEntityEnumerationParameters);
}

uint64_t sub_252D169B0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TranscriptEntityEnumerationParameters.init(from:)(a1, a2);
}

uint64_t sub_252D169C8(void *a1)
{
  return TranscriptEntityEnumerationParameters.encode(to:)(a1);
}

uint64_t TranscriptEntityItem.eventId.getter()
{
  sub_252D19588();
  sub_252AEA304();
  uint64_t v0 = sub_252CB9030();

  return v1(v0);
}

uint64_t TranscriptEntityItem.eventTimestamp.getter()
{
  type metadata accessor for TranscriptEntityItem(0);
  sub_252D194F8();
  sub_252AEA304();
  uint64_t v0 = sub_252CB9030();

  return v1(v0);
}

uint64_t TranscriptEntityItem.entity.getter()
{
  type metadata accessor for TranscriptEntityItem(0);
  sub_252D19BE8();
  sub_252AEA304();
  uint64_t v0 = sub_252CB9030();

  return v1(v0);
}

uint64_t TranscriptEntityItem.init(eventId:eventTimestamp:entity:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_252D19588();
  sub_252AEA304();
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(a4, a1);
  uint64_t v9 = type metadata accessor for TranscriptEntityItem(0);
  uint64_t v10 = a4 + *(int *)(v9 + 20);
  sub_252D194F8();
  sub_252AEA304();
  (*(void (**)(uint64_t, uint64_t))(v11 + 32))(v10, a2);
  uint64_t v12 = a4 + *(int *)(v9 + 24);
  sub_252D19BE8();
  sub_252AEA304();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 32);

  return v15(v12, a3, v13);
}

uint64_t static TranscriptEntityItem.== infix(_:_:)()
{
  if ((_s16IntelligenceFlow15SessionClientIDV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  type metadata accessor for TranscriptEntityItem(0);
  if ((sub_252D194E8() & 1) == 0) {
    return 0;
  }

  return _s16IntelligenceFlow14MessagePayloadO17ActionWillExecuteV18ToolParameterValueO0J0V2eeoiySbAI_AItFZ_0();
}

uint64_t sub_252D16C8C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6449746E657665 && a2 == 0xE700000000000000;
  if (v2 || (sub_252D1A5D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6D6954746E657665 && a2 == 0xEE00706D61747365;
    if (v6 || (sub_252D1A5D8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x797469746E65 && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_252D1A5D8();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_252D16DF8(char a1)
{
  if (!a1) {
    return 0x6449746E657665;
  }
  if (a1 == 1) {
    return 0x6D6954746E657665;
  }
  return 0x797469746E65;
}

uint64_t sub_252D16E58()
{
  return sub_252D16DF8(*v0);
}

uint64_t sub_252D16E60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252D16C8C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_252D16E88(uint64_t a1)
{
  unint64_t v2 = sub_252D1711C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252D16EC4(uint64_t a1)
{
  unint64_t v2 = sub_252D1711C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TranscriptEntityItem.encode(to:)(void *a1)
{
  sub_252AC3A24(&qword_269C49668);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v3);
  sub_252AC3A68(a1, a1[3]);
  sub_252D1711C();
  sub_252AF4784();
  sub_252D19588();
  sub_252D157AC(&qword_26B231C10, 255, MEMORY[0x263F07508]);
  sub_252D1A578();
  if (!v1)
  {
    type metadata accessor for TranscriptEntityItem(0);
    sub_252D19320();
    sub_252D157AC(&qword_26B231C08, 255, MEMORY[0x263F07490]);
    sub_252D1A578();
    sub_252D19BE8();
    sub_252D157AC(&qword_269C440E0, 255, MEMORY[0x263F80508]);
    sub_252D192F0();
    sub_252D1A578();
  }
  uint64_t v4 = sub_252AF4620();
  return v5(v4);
}

unint64_t sub_252D1711C()
{
  unint64_t result = qword_269C49670;
  if (!qword_269C49670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49670);
  }
  return result;
}

uint64_t TranscriptEntityItem.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = sub_252D19BE8();
  sub_252AEDBD0();
  uint64_t v20 = v5;
  MEMORY[0x270FA5388](v6);
  sub_252AEDE70();
  uint64_t v23 = v7;
  uint64_t v26 = sub_252D194F8();
  sub_252AEDBD0();
  uint64_t v24 = v8;
  MEMORY[0x270FA5388](v9);
  sub_252B5FA38();
  uint64_t v10 = sub_252D19588();
  sub_252AEDBD0();
  uint64_t v25 = v11;
  MEMORY[0x270FA5388](v12);
  sub_252AEDE70();
  uint64_t v27 = v13;
  sub_252AC3A24(&qword_269C49678);
  sub_252AEDBD0();
  MEMORY[0x270FA5388](v14);
  sub_252B0011C();
  uint64_t v15 = type metadata accessor for TranscriptEntityItem(0);
  sub_252AEA304();
  MEMORY[0x270FA5388](v16);
  sub_252B5F6A0();
  sub_252AC3A68(a1, a1[3]);
  sub_252D1711C();
  sub_252D1A718();
  if (v28) {
    return _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)a1);
  }
  sub_252D157AC(&qword_26B231070, 255, MEMORY[0x263F07508]);
  sub_252D1A498();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v2, v27, v10);
  sub_252D157AC(&qword_26B231430, 255, MEMORY[0x263F07490]);
  sub_252D1A498();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v2 + *(int *)(v15 + 20), v3, v26);
  sub_252D157AC(&qword_269C440F0, 255, MEMORY[0x263F80508]);
  sub_252D1A498();
  uint64_t v17 = sub_252D192C8();
  v18(v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v2 + *(int *)(v15 + 24), v23, v22);
  sub_252D175E8(v2, a2, (void (*)(void))type metadata accessor for TranscriptEntityItem);
  _s16IntelligenceFlow17AnySessionMessageVwxx_0((uint64_t)a1);
  return sub_252D17648(v2, (void (*)(void))type metadata accessor for TranscriptEntityItem);
}

uint64_t sub_252D175E8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_252AEA304();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_252D17648(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_252AEA304();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_252D176A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TranscriptEntityItem.init(from:)(a1, a2);
}

uint64_t sub_252D176BC(void *a1)
{
  return TranscriptEntityItem.encode(to:)(a1);
}

void *sub_252D176D4()
{
  qword_269C495D8 = (uint64_t)&unk_2703174C8;
  return &unk_2703174C8;
}

id static TranscriptEntityQueryingXPCClientService.interface.getter()
{
  return sub_252D0AE00(&qword_269C418D0, (void **)&qword_269C495D8);
}

unint64_t static TranscriptEntityQueryingXPCClientService.serviceName.getter()
{
  return sub_252D192DC();
}

void sub_252D17718()
{
  qword_269C495E0 = MEMORY[0x263F8EE78];
}

uint64_t static TranscriptEntityQueryingXPCClientService.selectorClasses.getter()
{
  return sub_252D0AE90(&qword_269C418D8);
}

uint64_t sub_252D17750(uint64_t a1)
{
  return sub_252D0AEE8(a1, qword_269C495E8);
}

uint64_t static TranscriptEntityQueryingXPCClientService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252D0AF54(&qword_269C418E0, (uint64_t)qword_269C495E8, a1);
}

unint64_t sub_252D17784()
{
  return 0xD000000000000035;
}

uint64_t sub_252D177AC()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t TranscriptEntityQueryingReverseClient.__allocating_init(existingConnection:localObject:)()
{
  sub_252D0DED4();
  uint64_t v0 = swift_allocObject();
  TranscriptEntityQueryingReverseClient.init(existingConnection:localObject:)();
  return v0;
}

uint64_t TranscriptEntityQueryingReverseClient.init(existingConnection:localObject:)()
{
  sub_252D193A8();
  sub_252D058F0();
  *(void *)(v0 + 16) = sub_252D19398();
  *(void *)(v0 + 24) = 0;
  sub_252D157AC(&qword_269C49680, v2, (void (*)(uint64_t))type metadata accessor for TranscriptEntityQueryingReverseClient);
  sub_252AC3A24(&qword_269C49688);
  sub_252D058F0();
  swift_retain();
  uint64_t v3 = sub_252D19A08();
  if (!v1) {
    *(void *)(v0 + 24) = v3;
  }
  swift_release();
  return v0;
}

uint64_t type metadata accessor for TranscriptEntityQueryingReverseClient()
{
  return self;
}

uint64_t TranscriptEntityQueryingReverseClient.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t TranscriptEntityQueryingReverseClient.__deallocating_deinit()
{
  TranscriptEntityQueryingReverseClient.deinit();
  uint64_t v0 = sub_252D0DED4();

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_252D17970@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TranscriptEntityQueryingReverseClient.__allocating_init(existingConnection:localObject:)();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_252D1799C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TranscriptEntityQueryingReverseClient();

  return MEMORY[0x270F57798](a1, v2);
}

BOOL static TranscriptEntityQueryingServiceError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TranscriptEntityQueryingServiceError.hash(into:)()
{
  return sub_252D1A6B8();
}

uint64_t TranscriptEntityQueryingServiceError.hashValue.getter()
{
  return sub_252D1A6E8();
}

uint64_t sub_252D17A88()
{
  return sub_252D157AC((unint64_t *)&unk_269C49450, 255, MEMORY[0x263F61838]);
}

unint64_t sub_252D17AD8()
{
  unint64_t result = qword_26B230E48;
  if (!qword_26B230E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B230E48);
  }
  return result;
}

unint64_t sub_252D17B28()
{
  unint64_t result = qword_269C49690;
  if (!qword_269C49690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C49690);
  }
  return result;
}

void type metadata accessor for TranscriptEntityQueryingXPCServerService()
{
}

uint64_t method lookup function for TranscriptEntityQueryingClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TranscriptEntityQueryingClient);
}

uint64_t dispatch thunk of TranscriptEntityQueryingClient.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of TranscriptEntityQueryingClient.enumerateTranscriptEntities(parameters:body:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t *initializeBufferWithCopyOfBuffer for TranscriptEntityEnumerationParameters(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_252D194F8();
    if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v7, 1, v8))
    {
      uint64_t v9 = sub_252AC3A24(&qword_269C49638);
      memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
      _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t destroy for TranscriptEntityEnumerationParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_252D194F8();
  uint64_t result = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v2, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v5(v2, v3);
  }
  return result;
}

unsigned char *initializeWithCopy for TranscriptEntityEnumerationParameters(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_252D194F8();
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = sub_252AC3A24(&qword_269C49638);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *assignWithCopy for TranscriptEntityEnumerationParameters(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_252D194F8();
  int v8 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v5, 1, v7);
  int v9 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v6, 1, v7);
  if (!v8)
  {
    uint64_t v10 = *(void *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    uint64_t v11 = sub_252AC3A24(&qword_269C49638);
    memcpy(v5, v6, *(void *)(*(void *)(v11 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v5, 0, 1, v7);
  return a1;
}

unsigned char *initializeWithTake for TranscriptEntityEnumerationParameters(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_252D194F8();
  if (_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = sub_252AC3A24(&qword_269C49638);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
    _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *assignWithTake for TranscriptEntityEnumerationParameters(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_252D194F8();
  int v8 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v5, 1, v7);
  int v9 = _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0((uint64_t)v6, 1, v7);
  if (!v8)
  {
    uint64_t v10 = *(void *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    uint64_t v11 = sub_252AC3A24(&qword_269C49638);
    memcpy(v5, v6, *(void *)(*(void *)(v11 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0((uint64_t)v5, 0, 1, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for TranscriptEntityEnumerationParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252D18230);
}

uint64_t sub_252D18230(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v10 = sub_252AC3A24(&qword_269C49638);
    uint64_t v11 = (uint64_t)&a1[*(int *)(a3 + 20)];
    return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for TranscriptEntityEnumerationParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252D182D0);
}

unsigned char *sub_252D182D0(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  BOOL v5 = result;
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
  }
  else
  {
    uint64_t v7 = sub_252AC3A24(&qword_269C49638);
    uint64_t v8 = (uint64_t)&v5[*(int *)(a4 + 20)];
    return (unsigned char *)_s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v8, a2, a2, v7);
  }
  return result;
}

void sub_252D18350()
{
  sub_252D183E8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_252D183E8()
{
  if (!qword_269C496A8)
  {
    sub_252D194F8();
    unint64_t v0 = sub_252D1A178();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269C496A8);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for TranscriptEntityItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_252D19588();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    int v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_252D194F8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = sub_252D19BE8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for TranscriptEntityItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252D19588();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_252D194F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_252D19BE8();
  int v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

uint64_t initializeWithCopy for TranscriptEntityItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252D19588();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_252D194F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_252D19BE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for TranscriptEntityItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252D19588();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_252D194F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_252D19BE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for TranscriptEntityItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252D19588();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_252D194F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_252D19BE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for TranscriptEntityItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252D19588();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_252D194F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_252D19BE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for TranscriptEntityItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252D18ABC);
}

uint64_t sub_252D18ABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_252D19588();
  sub_252AEA314();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    sub_252D194F8();
    sub_252AEA314();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v8 = sub_252D19BE8();
      uint64_t v12 = *(int *)(a3 + 24);
    }
    uint64_t v9 = a1 + v12;
  }

  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwet_0(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for TranscriptEntityItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252D18B70);
}

uint64_t sub_252D18B70(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_252D19588();
  sub_252AEA314();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_252D194F8();
    sub_252AEA314();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_252D19BE8();
      uint64_t v14 = *(int *)(a4 + 24);
    }
    uint64_t v11 = a1 + v14;
  }

  return _s16IntelligenceFlow26SessionServerDebuggerEventV7PayloadOwst_0(v11, a2, a2, v10);
}

uint64_t sub_252D18C18()
{
  uint64_t result = sub_252D19588();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_252D194F8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_252D19BE8();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

void type metadata accessor for TranscriptEntityQueryingXPCClientService()
{
}

uint64_t method lookup function for TranscriptEntityQueryingReverseClient(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TranscriptEntityQueryingReverseClient);
}

uint64_t dispatch thunk of TranscriptEntityQueryingReverseClient.__allocating_init(existingConnection:localObject:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

void type metadata accessor for TranscriptEntityQueryingServiceError()
{
}

unsigned char *storeEnumTagSinglePayload for TranscriptEntityItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D18E44);
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

ValueMetadata *type metadata accessor for TranscriptEntityItem.CodingKeys()
{
  return &type metadata for TranscriptEntityItem.CodingKeys;
}

unsigned char *_s16IntelligenceFlow36TranscriptEntityQueryingServiceErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252D18F48);
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

ValueMetadata *type metadata accessor for TranscriptEntityEnumerationParameters.CodingKeys()
{
  return &type metadata for TranscriptEntityEnumerationParameters.CodingKeys;
}

unint64_t sub_252D18F84()
{
  unint64_t result = qword_269C496C0;
  if (!qword_269C496C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C496C0);
  }
  return result;
}

unint64_t sub_252D18FD4()
{
  unint64_t result = qword_269C496C8;
  if (!qword_269C496C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C496C8);
  }
  return result;
}

unint64_t sub_252D19024()
{
  unint64_t result = qword_269C496D0;
  if (!qword_269C496D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C496D0);
  }
  return result;
}

unint64_t sub_252D19074()
{
  unint64_t result = qword_269C496D8;
  if (!qword_269C496D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C496D8);
  }
  return result;
}

unint64_t sub_252D190C4()
{
  unint64_t result = qword_269C496E0;
  if (!qword_269C496E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C496E0);
  }
  return result;
}

unint64_t sub_252D19114()
{
  unint64_t result = qword_269C496E8;
  if (!qword_269C496E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C496E8);
  }
  return result;
}

void sub_252D19160(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  swift_retain();
  uint64_t v7 = (void *)sub_252D19528();
  v9[4] = sub_252D0D1D4;
  v9[5] = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_252D14EF0;
  v9[3] = &unk_270313DC0;
  uint64_t v8 = _Block_copy(v9);
  swift_release();
  objc_msgSend(a1, sel_stopTranscriptEntitiesEnumerationWithId_reply_, v7, v8);
  _Block_release(v8);
}

void sub_252D19260(void *a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_252D19268()
{
  swift_release();
  uint64_t v0 = sub_252D0DED4();

  return MEMORY[0x270FA0238](v0, v1, v2);
}

uint64_t sub_252D19298(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_252D192A8()
{
  return swift_release();
}

uint64_t sub_252D192C8()
{
  return *(void *)(v0 - 104);
}

unint64_t sub_252D192DC()
{
  return 0xD000000000000035;
}

uint64_t sub_252D192F0()
{
  return v0;
}

uint64_t sub_252D19308()
{
  return v0;
}

uint64_t sub_252D19320()
{
  *(unsigned char *)(v0 - 66) = 1;
  return sub_252D194F8();
}

__n128 sub_252D19344()
{
  __n128 result = *(__n128 *)v0;
  long long v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 128) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 112) = v3;
  *(void *)(v1 - 96) = *(void *)(v0 + 32);
  return result;
}

uint64_t sub_252D19358()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_252D19368()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_252D19378()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_252D19388()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_252D19398()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_252D193A8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_252D193B8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_252D193C8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_252D193D8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_252D193E8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_252D193F8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_252D19408()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_252D19418()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_252D19428()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_252D19438()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_252D19448()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_252D19458()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_252D19468()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_252D19478()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_252D19488()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_252D19498()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_252D194A8()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_252D194B8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_252D194C8()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_252D194D8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_252D194E8()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_252D194F8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_252D19508()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t _s16IntelligenceFlow15SessionClientIDV11descriptionSSvg_0()
{
  return MEMORY[0x270EF0C70]();
}

uint64_t sub_252D19528()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t _s16IntelligenceFlow15SessionClientIDV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_252D19548()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_252D19558()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_252D19568()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t _s16IntelligenceFlow15SessionClientIDVACycfC_0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_252D19588()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_252D19598()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_252D195A8()
{
  return MEMORY[0x270EF0D90]();
}

uint64_t sub_252D195B8()
{
  return MEMORY[0x270EF0E00]();
}

uint64_t sub_252D195C8()
{
  return MEMORY[0x270EF0F30]();
}

uint64_t sub_252D195D8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_252D195E8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_252D195F8()
{
  return MEMORY[0x270F739D8]();
}

uint64_t sub_252D19608()
{
  return MEMORY[0x270F739E0]();
}

uint64_t sub_252D19618()
{
  return MEMORY[0x270FA2A48]();
}

uint64_t sub_252D19628()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_252D19638()
{
  return MEMORY[0x270F44A18]();
}

uint64_t _s16IntelligenceFlow45ResponseGenerationOverrides_KeyValuePredicateV0fH0V03AnygH0VAGycfC_0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_252D19658()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_252D19668()
{
  return MEMORY[0x270F44A78]();
}

uint64_t sub_252D19678()
{
  return MEMORY[0x270F44A80]();
}

uint64_t sub_252D19688()
{
  return MEMORY[0x270F44AA8]();
}

uint64_t sub_252D19698()
{
  return MEMORY[0x270F44AB0]();
}

uint64_t sub_252D196A8()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_252D196D8()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_252D196E8()
{
  return MEMORY[0x270F44B20]();
}

uint64_t sub_252D19708()
{
  return MEMORY[0x270F44B50]();
}

uint64_t sub_252D19718()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_252D19728()
{
  return MEMORY[0x270F44BF8]();
}

uint64_t sub_252D19738()
{
  return MEMORY[0x270F44C08]();
}

uint64_t sub_252D19748()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_252D19758()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_252D19768()
{
  return MEMORY[0x270F44C78]();
}

uint64_t sub_252D19778()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_252D19788()
{
  return MEMORY[0x270F44CB8]();
}

uint64_t sub_252D197A8()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_252D197B8()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_252D197D8()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_252D197E8()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_252D197F8()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_252D19808()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_252D19818()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_252D19828()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_252D19838()
{
  return MEMORY[0x270F44E20]();
}

uint64_t sub_252D19848()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_252D19858()
{
  return MEMORY[0x270F412D0]();
}

uint64_t sub_252D19868()
{
  return MEMORY[0x270F412E0]();
}

uint64_t sub_252D19878()
{
  return MEMORY[0x270F41308]();
}

uint64_t sub_252D19888()
{
  return MEMORY[0x270F41888]();
}

uint64_t sub_252D19898()
{
  return MEMORY[0x270F41930]();
}

uint64_t sub_252D198A8()
{
  return MEMORY[0x270F419E8]();
}

uint64_t sub_252D198B8()
{
  return MEMORY[0x270F41A50]();
}

uint64_t sub_252D198C8()
{
  return MEMORY[0x270F41A80]();
}

uint64_t sub_252D198D8()
{
  return MEMORY[0x270F41AC8]();
}

uint64_t sub_252D198E8()
{
  return MEMORY[0x270F575F8]();
}

uint64_t sub_252D19908()
{
  return MEMORY[0x270F57610]();
}

uint64_t sub_252D19918()
{
  return MEMORY[0x270F57618]();
}

uint64_t sub_252D19928()
{
  return MEMORY[0x270F57630]();
}

uint64_t sub_252D19938()
{
  return MEMORY[0x270F57638]();
}

uint64_t sub_252D19948()
{
  return MEMORY[0x270F57658]();
}

uint64_t sub_252D19958()
{
  return MEMORY[0x270F57670]();
}

uint64_t sub_252D19968()
{
  return MEMORY[0x270F57678]();
}

uint64_t sub_252D19978()
{
  return MEMORY[0x270F57680]();
}

uint64_t sub_252D19988()
{
  return MEMORY[0x270F57688]();
}

uint64_t sub_252D19998()
{
  return MEMORY[0x270F57700]();
}

uint64_t sub_252D199A8()
{
  return MEMORY[0x270F57708]();
}

uint64_t sub_252D199C8()
{
  return MEMORY[0x270F57718]();
}

uint64_t sub_252D199D8()
{
  return MEMORY[0x270F57788]();
}

uint64_t sub_252D199F8()
{
  return MEMORY[0x270F577D8]();
}

uint64_t sub_252D19A08()
{
  return MEMORY[0x270F577E0]();
}

uint64_t sub_252D19A18()
{
  return MEMORY[0x270F577E8]();
}

uint64_t sub_252D19A38()
{
  return MEMORY[0x270F577F8]();
}

uint64_t sub_252D19A48()
{
  return MEMORY[0x270F57800]();
}

uint64_t sub_252D19A58()
{
  return MEMORY[0x270F57808]();
}

uint64_t sub_252D19A68()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_252D19A78()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_252D19A88()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_252D19A98()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_252D19AA8()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_252D19AB8()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_252D19AC8()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_252D19AD8()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_252D19AE8()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_252D19AF8()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_252D19B08()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_252D19B18()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_252D19B28()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t _s16IntelligenceFlow17PlannerPromptDataV4ToolV10DefinitionO0fG0V2eeoiySbAI_AItFZ_0()
{
  return MEMORY[0x270F7F9C8]();
}

uint64_t sub_252D19B48()
{
  return MEMORY[0x270F7F9E0]();
}

uint64_t sub_252D19B58()
{
  return MEMORY[0x270F7FA08]();
}

uint64_t sub_252D19B68()
{
  return MEMORY[0x270F7FE48]();
}

uint64_t sub_252D19B78()
{
  return MEMORY[0x270F7FE50]();
}

uint64_t sub_252D19B88()
{
  return MEMORY[0x270F7FEB8]();
}

uint64_t sub_252D19B98()
{
  return MEMORY[0x270F7FEE8]();
}

uint64_t sub_252D19BA8()
{
  return MEMORY[0x270F7FEF0]();
}

uint64_t sub_252D19BB8()
{
  return MEMORY[0x270F7FFA8]();
}

uint64_t sub_252D19BC8()
{
  return MEMORY[0x270F7FFD0]();
}

uint64_t _s16IntelligenceFlow14MessagePayloadO17ActionWillExecuteV18ToolParameterValueO0J0V2eeoiySbAI_AItFZ_0()
{
  return MEMORY[0x270F7FFE8]();
}

uint64_t sub_252D19BE8()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_252D19BF8()
{
  return MEMORY[0x270F80030]();
}

uint64_t sub_252D19C08()
{
  return MEMORY[0x270F80048]();
}

uint64_t sub_252D19C18()
{
  return MEMORY[0x270F80068]();
}

uint64_t sub_252D19C28()
{
  return MEMORY[0x270F80070]();
}

uint64_t sub_252D19C38()
{
  return MEMORY[0x270F800D8]();
}

uint64_t sub_252D19C48()
{
  return MEMORY[0x270F800F0]();
}

uint64_t sub_252D19C58()
{
  return MEMORY[0x270F80168]();
}

uint64_t sub_252D19C68()
{
  return MEMORY[0x270F80420]();
}

uint64_t _s16IntelligenceFlow17PlannerPromptDataV4ToolV10DefinitionO15AssistantSchemaV2eeoiySbAI_AItFZ_0()
{
  return MEMORY[0x270F805B8]();
}

uint64_t sub_252D19C88()
{
  return MEMORY[0x270F805E8]();
}

uint64_t sub_252D19C98()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_252D19CA8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_252D19CB8()
{
  return MEMORY[0x270F9D1E0]();
}

uint64_t sub_252D19CC8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_252D19CD8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_252D19CE8()
{
  return MEMORY[0x270FA2B78]();
}

uint64_t sub_252D19CF8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_252D19D08()
{
  return MEMORY[0x270EF18A8]();
}

uint64_t sub_252D19D18()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_252D19D28()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_252D19D38()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_252D19D48()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_252D19D58()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_252D19D68()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_252D19D78()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_252D19D88()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_252D19D98()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_252D19DA8()
{
  return MEMORY[0x270F9D700]();
}

uint64_t sub_252D19DB8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_252D19DC8()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_252D19DD8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_252D19DE8()
{
  return MEMORY[0x270F9D7A0]();
}

uint64_t sub_252D19DF8()
{
  return MEMORY[0x270F9D7B8]();
}

uint64_t sub_252D19E08()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_252D19E18()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_252D19E28()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_252D19E38()
{
  return MEMORY[0x270F9D958]();
}

uint64_t sub_252D19E48()
{
  return MEMORY[0x270F9D960]();
}

uint64_t sub_252D19E58()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_252D19E68()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_252D19E78()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_252D19E88()
{
  return MEMORY[0x270F9DAB8]();
}

uint64_t sub_252D19E98()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_252D19EA8()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_252D19EB8()
{
  return MEMORY[0x270F9DB38]();
}

uint64_t sub_252D19EC8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_252D19ED8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_252D19EE8()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_252D19EF8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_252D19F08()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_252D19F18()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_252D19F28()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_252D19F38()
{
  return MEMORY[0x270F9DCB0]();
}

uint64_t sub_252D19F48()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_252D19F58()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_252D19F68()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_252D19F78()
{
  return MEMORY[0x270FA20B0]();
}

uint64_t sub_252D19F88()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_252D19F98()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_252D19FA8()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_252D19FB8()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_252D19FD8()
{
  return MEMORY[0x270FA2108]();
}

uint64_t sub_252D19FE8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_252D19FF8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_252D1A008()
{
  return MEMORY[0x270F9DED8]();
}

uint64_t sub_252D1A018()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_252D1A028()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_252D1A038()
{
  return MEMORY[0x270F9DF60]();
}

uint64_t sub_252D1A048()
{
  return MEMORY[0x270F9DF70]();
}

uint64_t sub_252D1A058()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_252D1A068()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_252D1A078()
{
  return MEMORY[0x270F9E0C0]();
}

uint64_t sub_252D1A088()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_252D1A098()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_252D1A0A8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_252D1A0B8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_252D1A0C8()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_252D1A0D8()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_252D1A0E8()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_252D1A0F8()
{
  return MEMORY[0x270EF2050]();
}

uint64_t sub_252D1A108()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_252D1A118()
{
  return MEMORY[0x270EF2128]();
}

uint64_t sub_252D1A128()
{
  return MEMORY[0x270F57840]();
}

uint64_t sub_252D1A138()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_252D1A148()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_252D1A158()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_252D1A168()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_252D1A178()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_252D1A188()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_252D1A198()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_252D1A1B8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_252D1A1C8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_252D1A1D8()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_252D1A1E8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_252D1A1F8()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_252D1A208()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_252D1A218()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_252D1A228()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_252D1A238()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_252D1A248()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_252D1A258()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_252D1A268()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_252D1A278()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_252D1A298()
{
  return MEMORY[0x270F9E9F0]();
}

uint64_t sub_252D1A2A8()
{
  return MEMORY[0x270F9E9F8]();
}

uint64_t sub_252D1A2B8()
{
  return MEMORY[0x270F9EA00]();
}

uint64_t sub_252D1A2C8()
{
  return MEMORY[0x270F9EA08]();
}

uint64_t sub_252D1A2D8()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_252D1A2E8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_252D1A2F8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_252D1A308()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_252D1A318()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_252D1A328()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_252D1A338()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_252D1A348()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_252D1A358()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_252D1A368()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_252D1A378()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_252D1A388()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_252D1A398()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_252D1A3A8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_252D1A3B8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_252D1A3C8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_252D1A3D8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_252D1A3E8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_252D1A3F8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_252D1A408()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_252D1A418()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_252D1A428()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_252D1A438()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_252D1A448()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_252D1A458()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_252D1A468()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_252D1A478()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_252D1A488()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_252D1A498()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_252D1A4A8()
{
  return MEMORY[0x270F9F350]();
}

uint64_t sub_252D1A4B8()
{
  return MEMORY[0x270F9F358]();
}

uint64_t sub_252D1A4C8()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_252D1A4D8()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_252D1A4E8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_252D1A4F8()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_252D1A508()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_252D1A518()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_252D1A528()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_252D1A538()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_252D1A548()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_252D1A558()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_252D1A568()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_252D1A578()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_252D1A588()
{
  return MEMORY[0x270F9F490]();
}

uint64_t sub_252D1A598()
{
  return MEMORY[0x270F9F498]();
}

uint64_t sub_252D1A5A8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_252D1A5B8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_252D1A5C8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_252D1A5D8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_252D1A5E8()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_252D1A5F8()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_252D1A608()
{
  return MEMORY[0x270F9FAB8]();
}

uint64_t sub_252D1A618()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_252D1A628()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_252D1A638()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_252D1A648()
{
  return MEMORY[0x270F57848]();
}

uint64_t sub_252D1A658()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_252D1A668()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_252D1A678()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_252D1A688()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_252D1A698()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_252D1A6A8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_252D1A6B8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_252D1A6C8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_252D1A6D8()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_252D1A6E8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_252D1A6F8()
{
  return MEMORY[0x270F9FD50]();
}

uint64_t sub_252D1A708()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_252D1A718()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_252D1A728()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_252D1A738()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_252D1A748()
{
  return MEMORY[0x270F9FDD0]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x270F3C9A8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x270F960F0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
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

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x270FA0390]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x270FA0500]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}