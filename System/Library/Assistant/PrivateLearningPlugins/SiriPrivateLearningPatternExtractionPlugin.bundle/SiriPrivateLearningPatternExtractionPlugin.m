uint64_t variable initialization expression of ExtractPatternsRectifi.minLength()
{
  return 3;
}

uint64_t variable initialization expression of ExtractPatternsRectifi.maxLength()
{
  return 15;
}

uint64_t variable initialization expression of ExtractPatternsRectifi.defaultTopK()
{
  return 5;
}

uint64_t variable initialization expression of ExtractPatternsRectifi.closedPatternUtil()
{
  type metadata accessor for ClosedPatternUtil();

  return swift_allocObject();
}

uint64_t sub_2D6C(uint64_t result, uint64_t a2)
{
  int64_t v3 = *(void *)(a2 + 16);
  if (v3 < *(void *)(v2 + 24)) {
    return result;
  }
  uint64_t v5 = result;
  uint64_t v6 = v2 + 56;
  swift_beginAccess();
  uint64_t v7 = *(void *)(v2 + 56);
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v9 = v7 + 40 * v8;
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(void *)v9;
    uint64_t v12 = *(void *)(v9 + 8);
    uint64_t v13 = *(void *)(v9 + 16);
    char v14 = *(unsigned char *)(v9 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    char v14 = 0;
  }
  v31[0] = v10;
  v31[1] = v11;
  v31[2] = v12;
  v31[3] = v13;
  char v32 = v14;
  char v15 = sub_420C((uint64_t)v31, v5);
  sub_4FD4(v10, v11);
  if (v15)
  {
    swift_beginAccess();
    v16 = *(void **)v6;
    if (*(void *)(*(void *)v6 + 16))
    {
      result = swift_isUniquelyReferenced_nonNull_native();
      if (result)
      {
        uint64_t v17 = v16[2];
        if (v17)
        {
LABEL_9:
          v16[2] = v17 - 1;
          *(void *)uint64_t v6 = v16;
          swift_endAccess();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_10;
        }
LABEL_31:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    result = (uint64_t)sub_2F340(v16);
    v16 = (void *)result;
    uint64_t v17 = *(void *)(result + 16);
    if (v17) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_10:
  uint64_t v18 = *(void *)(v5 + 16);
  if (v18)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)(v5 + 8 * i + 32))
      {
        swift_retain();
        sub_30D40();
        if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
          sub_30D70();
        }
        sub_30D90();
        sub_30D60();
      }
    }
    swift_bridgeObjectRelease();
  }
  if (v3)
  {
    sub_2AFD0(0, v3, 0);
    v20 = (uint64_t *)(a2 + 32);
    unint64_t v21 = _swiftEmptyArrayStorage[2];
    int64_t v22 = v3;
    do
    {
      uint64_t v24 = *v20;
      v20 += 2;
      uint64_t v23 = v24;
      unint64_t v25 = _swiftEmptyArrayStorage[3];
      if (v21 >= v25 >> 1) {
        sub_2AFD0(v25 > 1, v21 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v21 + 1;
      _swiftEmptyArrayStorage[v21++ + 4] = v23;
      --v22;
    }
    while (v22);
  }
  swift_beginAccess();
  v26 = *(void **)v6;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v6 = v26;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v26 = sub_22D14(0, v26[2] + 1, 1, v26);
    *(void *)uint64_t v6 = v26;
  }
  unint64_t v29 = v26[2];
  unint64_t v28 = v26[3];
  if (v29 >= v28 >> 1)
  {
    v26 = sub_22D14((void *)(v28 > 1), v29 + 1, 1, v26);
    *(void *)uint64_t v6 = v26;
  }
  v26[2] = v29 + 1;
  v30 = &v26[5 * v29];
  v30[4] = v3;
  v30[5] = _swiftEmptyArrayStorage;
  v30[6] = _swiftEmptyArrayStorage;
  v30[7] = 0;
  *((unsigned char *)v30 + 64) = 1;
  return swift_endAccess();
}

uint64_t sub_30AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1;
  unint64_t v5 = *(void *)(a1 + 16);
  if (v5 < 3 || (uint64_t result = sub_2D6C(a1, a2), v5 != 15))
  {
    uint64_t v22 = *(void *)(v2 + 16);
    uint64_t result = sub_4C14(v22, a2);
    uint64_t v8 = result;
    unint64_t v9 = v7;
    uint64_t v10 = v2;
    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_31090();
      uint64_t result = swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
      if (v11)
      {
LABEL_5:
        if (v11 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v12 = 0;
        unint64_t v13 = v9 & 0xC000000000000001;
        unint64_t v23 = v9;
        uint64_t v24 = v4;
        while (1)
        {
          if (v13)
          {
            uint64_t v14 = sub_30FB0();
            if (!*(void *)(v8 + 16)) {
              goto LABEL_7;
            }
          }
          else
          {
            uint64_t v14 = *(void *)(v9 + 8 * v12 + 32);
            swift_retain();
            if (!*(void *)(v8 + 16)) {
              goto LABEL_7;
            }
          }
          unint64_t v15 = sub_A778(v14);
          if (v16)
          {
            uint64_t v17 = *(void *)(*(void *)(v8 + 56) + 8 * v15);
            swift_retain_n();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_30D40();
            if (*(void *)(v4 + 16) >= *(void *)(v4 + 24) >> 1) {
              sub_30D70();
            }
            sub_30D90();
            sub_30D60();
            swift_release();
            uint64_t v18 = v10;
            if (*(void *)(v17 + 16) < *(void *)(v10 + 24)) {
              goto LABEL_18;
            }
            sub_4F90(&qword_3D8A0);
            uint64_t inited = swift_initStackObject();
            *(_OWORD *)(inited + 16) = xmmword_31A40;
            *(void *)(inited + 32) = 0;
            uint64_t v25 = inited;
            sub_30D60();
            uint64_t v20 = swift_bridgeObjectRetain();
            sub_15FCC(v20);
            char v21 = sub_10E80(v22, v25, v17);
            swift_bridgeObjectRelease();
            if (v21)
            {
LABEL_18:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_release();
              uint64_t v10 = v18;
            }
            else
            {
              uint64_t v10 = v18;
              sub_30AC(v4, v17);
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            unint64_t v9 = v23;
            uint64_t v4 = v24;
            goto LABEL_8;
          }
LABEL_7:
          swift_release();
LABEL_8:
          if (v11 == ++v12)
          {
            swift_bridgeObjectRelease();
            return swift_bridgeObjectRelease();
          }
        }
      }
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_3394(uint64_t a1, char a2)
{
  if (a2) {
    a1 = 5;
  }
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 56);
  if (a1 >= *(void *)(v5 + 16))
  {
    swift_bridgeObjectRetain();
    return (void *)v5;
  }
  uint64_t v9 = v5;
  swift_bridgeObjectRetain_n();
  sub_37C8(&v9);
  swift_bridgeObjectRelease();
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v2 = v9;
  if (*(void *)(v9 + 16) < (unint64_t)a1)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    swift_release();
    uint64_t v5 = (uint64_t)sub_240B4(v2, v2 + 32, 0, (2 * a1) | 1);
    swift_release();
    return (void *)v5;
  }
  sub_311D0();
  swift_unknownObjectRetain_n();
  uint64_t v6 = (void *)swift_dynamicCastClass();
  if (!v6)
  {
    swift_release();
    uint64_t v6 = _swiftEmptyArrayStorage;
  }
  uint64_t v7 = v6[2];
  swift_release();
  if (v7 != a1) {
    goto LABEL_16;
  }
  uint64_t v5 = swift_dynamicCastClass();
  swift_release();
  if (!v5)
  {
    swift_release();
    return _swiftEmptyArrayStorage;
  }
  return (void *)v5;
}

uint64_t ExtractPatternsRectifi.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t ExtractPatternsRectifi.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for ExtractPatternsRectifi()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for FrequentPattern(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FrequentPattern()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FrequentPattern(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FrequentPattern(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  return a1;
}

__n128 initializeWithTake for FrequentPattern(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FrequentPattern(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for FrequentPattern(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FrequentPattern(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FrequentPattern()
{
  return &type metadata for FrequentPattern;
}

Swift::Int sub_37C8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1B1E4(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_3834(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_3834(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_311A0(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v93 = *a1;
      uint64_t v94 = -1;
      uint64_t v95 = 1;
      uint64_t v96 = *a1;
      do
      {
        uint64_t v97 = v94;
        uint64_t v98 = v96;
        do
        {
          uint64_t v99 = v98 + 40;
          uint64_t v100 = *(void *)(v98 + 40);
          if (*(void *)v98 >= v100) {
            break;
          }
          if (!v93) {
            goto LABEL_141;
          }
          uint64_t v101 = *(void *)(v98 + 48);
          char v102 = *(unsigned char *)(v98 + 72);
          long long v103 = *(_OWORD *)(v98 + 56);
          long long v104 = *(_OWORD *)(v98 + 16);
          *(_OWORD *)uint64_t v99 = *(_OWORD *)v98;
          *(_OWORD *)(v98 + 56) = v104;
          uint64_t v105 = *(void *)(v98 + 32);
          *(void *)uint64_t v98 = v100;
          *(void *)(v98 + 8) = v101;
          *(_OWORD *)(v98 + 16) = v103;
          *(unsigned char *)(v98 + 32) = v102;
          v98 -= 40;
          *(void *)(v99 + 32) = v105;
        }
        while (!__CFADD__(v97++, 1));
        ++v95;
        v96 += 40;
        --v94;
      }
      while (v95 != v3);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_146;
  }
  Swift::Int v6 = result;
  uint64_t v123 = v1;
  v116 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      uint64_t v12 = (char *)_swiftEmptyArrayStorage;
LABEL_103:
      v107 = v12;
      v118 = v9;
      if (v13 >= 2)
      {
        uint64_t v108 = *v116;
        do
        {
          unint64_t v109 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_132;
          }
          if (!v108) {
            goto LABEL_145;
          }
          v110 = v107;
          uint64_t v111 = *(void *)&v107[16 * v109 + 32];
          uint64_t v112 = *(void *)&v107[16 * v13 + 24];
          sub_3F6C((char *)(v108 + 40 * v111), (char *)(v108 + 40 * *(void *)&v107[16 * v13 + 16]), v108 + 40 * v112, __dst);
          if (v123) {
            break;
          }
          if (v112 < v111) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v110 = sub_1A454((uint64_t)v110);
          }
          if (v109 >= *((void *)v110 + 2)) {
            goto LABEL_134;
          }
          v113 = &v110[16 * v109 + 32];
          *(void *)v113 = v111;
          *((void *)v113 + 1) = v112;
          unint64_t v114 = *((void *)v110 + 2);
          if (v13 > v114) {
            goto LABEL_135;
          }
          memmove(&v110[16 * v13 + 16], &v110[16 * v13 + 32], 16 * (v114 - v13));
          v107 = v110;
          *((void *)v110 + 2) = v114 - 1;
          unint64_t v13 = v114 - 1;
        }
        while (v114 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      v118[2] = 0;
      return swift_bridgeObjectRelease();
    }
    v118 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    uint64_t v8 = sub_30D80();
    *(void *)(v8 + 16) = v7;
    v118 = (void *)v8;
    __dst = (char *)(v8 + 32);
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v117 = *a1 + 40;
  uint64_t v115 = *a1 - 40;
  uint64_t v12 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v119 = v6;
  Swift::Int v120 = v3;
  uint64_t v121 = v11;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 40 * v10);
      uint64_t v16 = *(void *)(v11 + 40 * v14);
      Swift::Int v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v17 = (void *)(v117 + 40 * v14);
        uint64_t v18 = v17;
        while (1)
        {
          uint64_t v19 = v18[5];
          v18 += 5;
          if (v16 < v15 == *v17 >= v19) {
            break;
          }
          ++v10;
          uint64_t v17 = v18;
          if (v3 == v10)
          {
            Swift::Int v10 = v3;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v10 < v14) {
          goto LABEL_138;
        }
        if (v14 < v10)
        {
          uint64_t v20 = 40 * v10;
          uint64_t v21 = 40 * v14;
          Swift::Int v22 = v10;
          Swift::Int v23 = v14;
          do
          {
            if (v23 != --v22)
            {
              if (!v11) {
                goto LABEL_144;
              }
              uint64_t v24 = v11 + v21;
              uint64_t v25 = v11 + v20;
              uint64_t v26 = *(void *)(v11 + v21);
              uint64_t v27 = *(void *)(v11 + v21 + 8);
              char v28 = *(unsigned char *)(v11 + v21 + 32);
              long long v29 = *(_OWORD *)(v11 + v21 + 16);
              uint64_t v30 = *(void *)(v11 + v20 - 8);
              long long v31 = *(_OWORD *)(v11 + v20 - 24);
              *(_OWORD *)uint64_t v24 = *(_OWORD *)(v11 + v20 - 40);
              *(_OWORD *)(v24 + 16) = v31;
              *(void *)(v24 + 32) = v30;
              *(void *)(v25 - 40) = v26;
              *(void *)(v25 - 32) = v27;
              *(_OWORD *)(v25 - 24) = v29;
              *(unsigned char *)(v25 - 8) = v28;
            }
            ++v23;
            v20 -= 40;
            v21 += 40;
          }
          while (v23 < v22);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_136;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    Swift::Int v32 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_139;
    }
    if (v32 >= v3) {
      Swift::Int v32 = v3;
    }
    if (v32 < v14) {
      break;
    }
    if (v10 != v32)
    {
      uint64_t v33 = v115 + 40 * v10;
      do
      {
        Swift::Int v34 = v14;
        uint64_t v35 = v33;
        do
        {
          uint64_t v36 = v35 + 40;
          uint64_t v37 = *(void *)(v35 + 40);
          if (*(void *)v35 >= v37) {
            break;
          }
          if (!v11) {
            goto LABEL_142;
          }
          uint64_t v38 = *(void *)(v35 + 48);
          char v39 = *(unsigned char *)(v35 + 72);
          long long v40 = *(_OWORD *)(v35 + 56);
          long long v41 = *(_OWORD *)(v35 + 16);
          *(_OWORD *)uint64_t v36 = *(_OWORD *)v35;
          *(_OWORD *)(v35 + 56) = v41;
          uint64_t v42 = *(void *)(v35 + 32);
          *(void *)uint64_t v35 = v37;
          *(void *)(v35 + 8) = v38;
          *(_OWORD *)(v35 + 16) = v40;
          *(unsigned char *)(v35 + 32) = v39;
          v35 -= 40;
          ++v34;
          *(void *)(v36 + 32) = v42;
        }
        while (v10 != v34);
        ++v10;
        v33 += 40;
      }
      while (v10 != v32);
      Swift::Int v10 = v32;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v12 = sub_19F50(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v44 = *((void *)v12 + 2);
    unint64_t v43 = *((void *)v12 + 3);
    unint64_t v13 = v44 + 1;
    uint64_t v11 = v121;
    if (v44 >= v43 >> 1)
    {
      uint64_t v11 = v121;
      uint64_t v12 = sub_19F50((char *)(v43 > 1), v44 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v13;
    v45 = v12 + 32;
    v46 = &v12[16 * v44 + 32];
    *(void *)v46 = v14;
    *((void *)v46 + 1) = v10;
    if (v44)
    {
      while (1)
      {
        unint64_t v47 = v13 - 1;
        if (v13 >= 4)
        {
          v52 = &v45[16 * v13];
          uint64_t v53 = *((void *)v52 - 8);
          uint64_t v54 = *((void *)v52 - 7);
          BOOL v58 = __OFSUB__(v54, v53);
          uint64_t v55 = v54 - v53;
          if (v58) {
            goto LABEL_120;
          }
          uint64_t v57 = *((void *)v52 - 6);
          uint64_t v56 = *((void *)v52 - 5);
          BOOL v58 = __OFSUB__(v56, v57);
          uint64_t v50 = v56 - v57;
          char v51 = v58;
          if (v58) {
            goto LABEL_121;
          }
          unint64_t v59 = v13 - 2;
          v60 = &v45[16 * v13 - 32];
          uint64_t v62 = *(void *)v60;
          uint64_t v61 = *((void *)v60 + 1);
          BOOL v58 = __OFSUB__(v61, v62);
          uint64_t v63 = v61 - v62;
          if (v58) {
            goto LABEL_123;
          }
          BOOL v58 = __OFADD__(v50, v63);
          uint64_t v64 = v50 + v63;
          if (v58) {
            goto LABEL_126;
          }
          if (v64 >= v55)
          {
            v82 = &v45[16 * v47];
            uint64_t v84 = *(void *)v82;
            uint64_t v83 = *((void *)v82 + 1);
            BOOL v58 = __OFSUB__(v83, v84);
            uint64_t v85 = v83 - v84;
            if (v58) {
              goto LABEL_130;
            }
            BOOL v75 = v50 < v85;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v76 = *((void *)v12 + 4);
            uint64_t v77 = *((void *)v12 + 5);
            BOOL v58 = __OFSUB__(v77, v76);
            uint64_t v69 = v77 - v76;
            char v70 = v58;
            goto LABEL_77;
          }
          uint64_t v49 = *((void *)v12 + 4);
          uint64_t v48 = *((void *)v12 + 5);
          BOOL v58 = __OFSUB__(v48, v49);
          uint64_t v50 = v48 - v49;
          char v51 = v58;
        }
        if (v51) {
          goto LABEL_122;
        }
        unint64_t v59 = v13 - 2;
        v65 = &v45[16 * v13 - 32];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v68 = __OFSUB__(v66, v67);
        uint64_t v69 = v66 - v67;
        char v70 = v68;
        if (v68) {
          goto LABEL_125;
        }
        v71 = &v45[16 * v47];
        uint64_t v73 = *(void *)v71;
        uint64_t v72 = *((void *)v71 + 1);
        BOOL v58 = __OFSUB__(v72, v73);
        uint64_t v74 = v72 - v73;
        if (v58) {
          goto LABEL_128;
        }
        if (__OFADD__(v69, v74)) {
          goto LABEL_129;
        }
        if (v69 + v74 >= v50)
        {
          BOOL v75 = v50 < v74;
LABEL_83:
          if (v75) {
            unint64_t v47 = v59;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v70) {
          goto LABEL_124;
        }
        v78 = &v45[16 * v47];
        uint64_t v80 = *(void *)v78;
        uint64_t v79 = *((void *)v78 + 1);
        BOOL v58 = __OFSUB__(v79, v80);
        uint64_t v81 = v79 - v80;
        if (v58) {
          goto LABEL_127;
        }
        if (v81 < v69) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v86 = v47 - 1;
        if (v47 - 1 >= v13)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v11) {
          goto LABEL_143;
        }
        v87 = v12;
        v88 = &v45[16 * v86];
        uint64_t v89 = *(void *)v88;
        v90 = &v45[16 * v47];
        uint64_t v91 = *((void *)v90 + 1);
        sub_3F6C((char *)(v11 + 40 * *(void *)v88), (char *)(v11 + 40 * *(void *)v90), v11 + 40 * v91, __dst);
        if (v123) {
          goto LABEL_93;
        }
        if (v91 < v89) {
          goto LABEL_117;
        }
        if (v47 > *((void *)v87 + 2)) {
          goto LABEL_118;
        }
        *(void *)v88 = v89;
        *(void *)&v45[16 * v86 + 8] = v91;
        unint64_t v92 = *((void *)v87 + 2);
        if (v47 >= v92) {
          goto LABEL_119;
        }
        uint64_t v12 = v87;
        unint64_t v13 = v92 - 1;
        memmove(&v45[16 * v47], v90 + 16, 16 * (v92 - 1 - v47));
        *((void *)v87 + 2) = v92 - 1;
        uint64_t v11 = v121;
        if (v92 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    Swift::Int v6 = v119;
    Swift::Int v3 = v120;
    if (v10 >= v120)
    {
      uint64_t v9 = v118;
      goto LABEL_103;
    }
  }
LABEL_140:
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
  Swift::Int result = sub_31080();
  __break(1u);
  return result;
}

uint64_t sub_3F6C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  Swift::Int v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 40;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 40;
  long long v31 = __dst;
  Swift::Int v32 = __src;
  if (v9 >= v11)
  {
    if (v10 >= -39)
    {
      uint64_t v19 = 40 * v11;
      if (__dst != a2 || &a2[v19] <= __dst) {
        memmove(__dst, a2, 40 * v11);
      }
      uint64_t v20 = &v4[v19];
      uint64_t v30 = &v4[v19];
      Swift::Int v32 = v6;
      if (v7 < v6 && v10 >= 40)
      {
        unint64_t v21 = a3 - 40;
        Swift::Int v22 = v6;
        while (1)
        {
          Swift::Int v23 = (char *)(v21 + 40);
          uint64_t v24 = *((void *)v22 - 5);
          v22 -= 40;
          if (v24 >= *((void *)v20 - 5))
          {
            uint64_t v30 = v20 - 40;
            if (v23 < v20 || v21 >= (unint64_t)v20 || v23 != v20)
            {
              long long v27 = *(_OWORD *)(v20 - 40);
              long long v28 = *(_OWORD *)(v20 - 24);
              *(void *)(v21 + 32) = *((void *)v20 - 1);
              *(_OWORD *)unint64_t v21 = v27;
              *(_OWORD *)(v21 + 16) = v28;
            }
            Swift::Int v22 = v6;
            v20 -= 40;
            if (v6 <= v7) {
              goto LABEL_38;
            }
          }
          else
          {
            if (v23 != v6 || v21 >= (unint64_t)v6)
            {
              long long v25 = *(_OWORD *)v22;
              long long v26 = *((_OWORD *)v22 + 1);
              *(void *)(v21 + 32) = *((void *)v22 + 4);
              *(_OWORD *)unint64_t v21 = v25;
              *(_OWORD *)(v21 + 16) = v26;
            }
            Swift::Int v32 = v22;
            if (v22 <= v7) {
              goto LABEL_38;
            }
          }
          v21 -= 40;
          Swift::Int v6 = v22;
          if (v20 <= v4) {
            goto LABEL_38;
          }
        }
      }
      goto LABEL_38;
    }
  }
  else if (v8 >= -39)
  {
    size_t v12 = 40 * v9;
    if (__dst != __src || &__src[v12] <= __dst) {
      memmove(__dst, __src, v12);
    }
    unint64_t v13 = &v4[v12];
    uint64_t v30 = &v4[v12];
    if ((unint64_t)v6 < a3 && v8 >= 40)
    {
      do
      {
        if (*(void *)v4 >= *(void *)v6)
        {
          if (v7 != v4)
          {
            long long v17 = *(_OWORD *)v4;
            long long v18 = *((_OWORD *)v4 + 1);
            *((void *)v7 + 4) = *((void *)v4 + 4);
            *(_OWORD *)uint64_t v7 = v17;
            *((_OWORD *)v7 + 1) = v18;
          }
          v4 += 40;
          long long v31 = v4;
          Swift::Int v14 = v6;
        }
        else
        {
          Swift::Int v14 = v6 + 40;
          if (v7 < v6 || v7 >= v14 || v7 != v6)
          {
            long long v15 = *(_OWORD *)v6;
            long long v16 = *((_OWORD *)v6 + 1);
            *((void *)v7 + 4) = *((void *)v6 + 4);
            *(_OWORD *)uint64_t v7 = v15;
            *((_OWORD *)v7 + 1) = v16;
          }
        }
        v7 += 40;
        if (v4 >= v13) {
          break;
        }
        Swift::Int v6 = v14;
      }
      while ((unint64_t)v14 < a3);
      Swift::Int v32 = v7;
    }
LABEL_38:
    sub_1A04C((void **)&v32, (const void **)&v31, &v30);
    return 1;
  }
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_420C(uint64_t a1, uint64_t a2)
{
  sub_5018(a1, (uint64_t)v22);
  uint64_t v3 = v23;
  if (v23)
  {
    unint64_t v24 = v23;
    if (v23 >> 62)
    {
LABEL_70:
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_31090();
      sub_5080((uint64_t)&v24);
      unint64_t v5 = *(void *)(a2 + 16);
      if ((uint64_t)v5 < v20) {
        return 0;
      }
      swift_bridgeObjectRetain_n();
      unint64_t v4 = sub_31090();
      sub_5080((uint64_t)&v24);
      if (v4)
      {
LABEL_6:
        uint64_t v6 = 0;
        uint64_t v7 = a2 + 32;
        while (1)
        {
          if ((v3 & 0xC000000000000001) != 0)
          {
            a2 = sub_30FB0();
            if (v5 == v6) {
              goto LABEL_69;
            }
          }
          else
          {
            a2 = *(void *)(v3 + 8 * v6 + 32);
            swift_retain();
            if (v5 == v6)
            {
LABEL_69:
              __break(1u);
              goto LABEL_70;
            }
          }
          uint64_t v9 = *(void *)(v7 + 8 * v6);
          if (!v9) {
            break;
          }
          BOOL v10 = *(void *)(a2 + 24) == *(void *)(v9 + 24) && *(void *)(a2 + 32) == *(void *)(v9 + 32);
          if (!v10 && (sub_311C0() & 1) == 0 || *(unsigned __int8 *)(a2 + 40) != *(unsigned __int8 *)(v9 + 40)) {
            break;
          }
          ++v6;
          uint64_t v11 = *(unsigned __int8 *)(v9 + 41);
          unint64_t v12 = 0x8000000000032B10;
          unint64_t v13 = 0xD000000000000017;
          switch(*(unsigned char *)(a2 + 41))
          {
            case 1:
              unint64_t v12 = 0xE300000000000000;
              unint64_t v13 = 5786702;
              break;
            case 2:
              unint64_t v12 = 0xE300000000000000;
              unint64_t v13 = 4801877;
              break;
            case 3:
              unint64_t v12 = 0xE800000000000000;
              unint64_t v13 = 0x505041454E4F4850;
              break;
            case 4:
              unint64_t v13 = 0x414547415353454DLL;
              unint64_t v12 = 0xEA00000000005050;
              break;
            case 5:
              unint64_t v13 = 0x5245444E494D4552;
              unsigned int v14 = 1096041811;
              goto LABEL_31;
            case 6:
              break;
            case 7:
              unint64_t v13 = 0x4552434D52414C41;
              goto LABEL_30;
            case 8:
              unint64_t v12 = 0xEE00505041454C47;
              unint64_t v13 = 0x474F544D52414C41;
              break;
            case 9:
              unint64_t v13 = 0x4450554D52414C41;
LABEL_30:
              unsigned int v14 = 1095062593;
LABEL_31:
              unint64_t v12 = v14 | 0xEE00505000000000;
              break;
            case 0xA:
              unint64_t v13 = 0x4145524345544F4ELL;
              goto LABEL_34;
            case 0xB:
              unint64_t v13 = 0x454C454445544F4ELL;
LABEL_34:
              unint64_t v12 = 0xED00005050414554;
              break;
            case 0xC:
              unint64_t v13 = 0x5041594D444E4946;
              unint64_t v12 = 0xE900000000000050;
              break;
            case 0xD:
              unint64_t v12 = 0xE700000000000000;
              unint64_t v13 = 0x4E574F4E4B4E55;
              break;
            default:
              unint64_t v12 = 0xE300000000000000;
              unint64_t v13 = 5395265;
              break;
          }
          unint64_t v15 = 0x8000000000032B10;
          unint64_t v16 = 0xD000000000000017;
          switch(v11)
          {
            case 1:
              unint64_t v15 = 0xE300000000000000;
              if (v13 == 5786702) {
                goto LABEL_62;
              }
              goto LABEL_7;
            case 2:
              unint64_t v15 = 0xE300000000000000;
              if (v13 != 4801877) {
                goto LABEL_7;
              }
              goto LABEL_62;
            case 3:
              unint64_t v15 = 0xE800000000000000;
              if (v13 != 0x505041454E4F4850) {
                goto LABEL_7;
              }
              goto LABEL_62;
            case 4:
              unint64_t v15 = 0xEA00000000005050;
              if (v13 != 0x414547415353454DLL) {
                goto LABEL_7;
              }
              goto LABEL_62;
            case 5:
              uint64_t v17 = 0x5245444E494D4552;
              unsigned int v18 = 1096041811;
              goto LABEL_54;
            case 6:
              goto LABEL_61;
            case 7:
              uint64_t v17 = 0x4552434D52414C41;
              goto LABEL_53;
            case 8:
              unint64_t v15 = 0xEE00505041454C47;
              if (v13 != 0x474F544D52414C41) {
                goto LABEL_7;
              }
              goto LABEL_62;
            case 9:
              uint64_t v17 = 0x4450554D52414C41;
LABEL_53:
              unsigned int v18 = 1095062593;
LABEL_54:
              unint64_t v15 = v18 | 0xEE00505000000000;
              if (v13 != v17) {
                goto LABEL_7;
              }
              goto LABEL_62;
            case 10:
              uint64_t v19 = 0x4145524345544F4ELL;
              goto LABEL_58;
            case 11:
              uint64_t v19 = 0x454C454445544F4ELL;
LABEL_58:
              unint64_t v15 = 0xED00005050414554;
              if (v13 != v19) {
                goto LABEL_7;
              }
              goto LABEL_62;
            case 12:
              unint64_t v16 = 0x5041594D444E4946;
              unint64_t v15 = 0xE900000000000050;
LABEL_61:
              if (v13 == v16) {
                goto LABEL_62;
              }
              goto LABEL_7;
            case 13:
              unint64_t v15 = 0xE700000000000000;
              if (v13 != 0x4E574F4E4B4E55) {
                goto LABEL_7;
              }
              goto LABEL_62;
            default:
              unint64_t v15 = 0xE300000000000000;
              if (v13 != 5395265) {
                goto LABEL_7;
              }
LABEL_62:
              if (v12 == v15)
              {
                swift_retain_n();
                swift_release_n();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v4 == v6) {
                  goto LABEL_72;
                }
              }
              else
              {
LABEL_7:
                char v8 = sub_311C0();
                swift_retain_n();
                swift_release_n();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v8 & 1) == 0) {
                  goto LABEL_68;
                }
                if (v4 == v6) {
                  goto LABEL_72;
                }
              }
              break;
          }
        }
        swift_release();
LABEL_68:
        uint64_t v3 = 0;
        goto LABEL_73;
      }
    }
    else
    {
      unint64_t v4 = *(void *)((char *)&dword_10 + (v23 & 0xFFFFFFFFFFFFFF8));
      unint64_t v5 = *(void *)(a2 + 16);
      if (v5 < v4) {
        return 0;
      }
      swift_bridgeObjectRetain();
      if (v4) {
        goto LABEL_6;
      }
    }
LABEL_72:
    uint64_t v3 = 1;
LABEL_73:
    sub_5080((uint64_t)&v24);
  }
  return v3;
}

void *sub_47D8(uint64_t a1, uint64_t a2)
{
  uint64_t v35 = *(void *)(a1 + 16);
  if (!v35) {
    return _swiftEmptyDictionarySingleton;
  }
  uint64_t v33 = a1 + 32;
  unint64_t v34 = *(void *)(a2 + 16);
  uint64_t v32 = a2 + 32;
  swift_bridgeObjectRetain();
  unint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = *(void *)(v33 + 8 * v2);
    unint64_t v36 = v2;
    if (v2 >= v34)
    {
      uint64_t v5 = -1;
      if (v3 < 0)
      {
        unint64_t v40 = v2;
      }
      else
      {
        unint64_t v40 = v2;
        if ((v3 & 0x4000000000000000) == 0) {
          goto LABEL_10;
        }
      }
    }
    else
    {
      unint64_t v4 = (uint64_t *)(v32 + 16 * v2);
      uint64_t v5 = v4[1];
      unint64_t v40 = *v4;
      if ((v3 & 0x8000000000000000) == 0 && (v3 & 0x4000000000000000) == 0)
      {
LABEL_10:
        uint64_t v6 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
        swift_bridgeObjectRetain();
        if (v6) {
          break;
        }
        goto LABEL_3;
      }
    }
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_31090();
    swift_bridgeObjectRelease();
    if (v6) {
      break;
    }
LABEL_3:
    unint64_t v2 = v36 + 1;
    swift_bridgeObjectRelease();
    if (v36 + 1 == v35)
    {
      swift_bridgeObjectRelease();
      return _swiftEmptyDictionarySingleton;
    }
  }
  uint64_t v38 = v5 + 1;
  if (__OFADD__(v5, 1)) {
    goto LABEL_55;
  }
  unint64_t v39 = v3 & 0xC000000000000001;
  uint64_t v7 = 4;
  uint64_t v37 = v3;
  while (2)
  {
    uint64_t v8 = v7 - 4;
    if (v39)
    {
      uint64_t v9 = sub_30FB0();
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v8, 1)) {
        goto LABEL_51;
      }
LABEL_21:
      if (__OFADD__(v8, v38)) {
        goto LABEL_52;
      }
      if (_swiftEmptyDictionarySingleton[2])
      {
        uint64_t v11 = swift_retain();
        unint64_t v12 = sub_A778(v11);
        unint64_t v13 = _swiftEmptyArrayStorage;
        if (v14)
        {
          unint64_t v13 = *(void **)(_swiftEmptyDictionarySingleton[7] + 8 * v12);
          swift_bridgeObjectRetain();
        }
        swift_release();
        uint64_t v15 = v13[2];
        if (v15)
        {
LABEL_26:
          if (v13[2 * v15 + 2] == v40)
          {
            swift_bridgeObjectRelease();
            swift_release();
LABEL_15:
            ++v7;
            if (v10 == v6) {
              goto LABEL_3;
            }
            continue;
          }
LABEL_32:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v13 = sub_22E34(0, v13[2] + 1, 1, v13);
          }
          unint64_t v17 = v13[2];
          unint64_t v16 = v13[3];
          if (v17 >= v16 >> 1) {
            unint64_t v13 = sub_22E34((void *)(v16 > 1), v17 + 1, 1, v13);
          }
          v13[2] = v17 + 1;
          unsigned int v18 = &v13[2 * v17];
          v18[4] = v40;
          v18[5] = v8 + v38;
          swift_bridgeObjectRetain();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v21 = sub_A778(v9);
          uint64_t v22 = _swiftEmptyDictionarySingleton[2];
          BOOL v23 = (v20 & 1) == 0;
          uint64_t v24 = v22 + v23;
          if (__OFADD__(v22, v23)) {
            goto LABEL_53;
          }
          char v25 = v20;
          if (_swiftEmptyDictionarySingleton[3] >= v24)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_B5AC();
            }
          }
          else
          {
            sub_A89C(v24, isUniquelyReferenced_nonNull_native);
            unint64_t v26 = sub_A778(v9);
            if ((v25 & 1) != (v27 & 1)) {
              goto LABEL_56;
            }
            unint64_t v21 = v26;
          }
          uint64_t v3 = v37;
          if (v25)
          {
            *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v21) = v13;
          }
          else
          {
            _swiftEmptyDictionarySingleton[(v21 >> 6) + 8] |= 1 << v21;
            *(void *)(_swiftEmptyDictionarySingleton[6] + 8 * v21) = v9;
            *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v21) = v13;
            uint64_t v28 = _swiftEmptyDictionarySingleton[2];
            BOOL v29 = __OFADD__(v28, 1);
            uint64_t v30 = v28 + 1;
            if (v29) {
              goto LABEL_54;
            }
            _swiftEmptyDictionarySingleton[2] = v30;
            swift_retain();
          }
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_15;
        }
      }
      else
      {
        unint64_t v13 = _swiftEmptyArrayStorage;
        uint64_t v15 = _swiftEmptyArrayStorage[2];
        if (v15) {
          goto LABEL_26;
        }
      }
      swift_retain();
      sub_30D40();
      if (*(void *)((char *)&dword_10 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18 + ((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8)) >> 1) {
        sub_30D70();
      }
      sub_30D90();
      sub_30D60();
      goto LABEL_32;
    }
    break;
  }
  uint64_t v9 = *(void *)(v3 + 8 * v7);
  swift_retain();
  uint64_t v10 = v7 - 3;
  if (!__OFADD__(v8, 1)) {
    goto LABEL_21;
  }
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  type metadata accessor for PatternItem();
  uint64_t result = (void *)sub_311F0();
  __break(1u);
  return result;
}

uint64_t sub_4C14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void *)(a2 + 16);
  if (!v3)
  {
    uint64_t v7 = _swiftEmptyArrayStorage;
LABEL_41:
    uint64_t v30 = sub_47D8((uint64_t)v7, v2);
    swift_bridgeObjectRelease();
    return (uint64_t)v30;
  }
  uint64_t v4 = a2 + 32;
  uint64_t v32 = a1 + 32;
  unint64_t v33 = *(void *)(a1 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  uint64_t v7 = _swiftEmptyArrayStorage;
  while (1)
  {
    unint64_t v8 = *(void *)(v4 + 16 * v6);
    if (v8 >= v33) {
      break;
    }
    uint64_t v9 = *(void *)(v4 + 16 * v6 + 8);
    uint64_t v10 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      goto LABEL_43;
    }
    unint64_t v11 = *(void *)(v32 + 8 * v8);
    unint64_t v12 = v11 >> 62;
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_31090();
      if (result < v10) {
        goto LABEL_51;
      }
      unint64_t v14 = result;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_31090();
      uint64_t result = swift_bridgeObjectRelease();
      if (v29 < v10) {
        goto LABEL_45;
      }
    }
    else
    {
      uint64_t v13 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8));
      if (v13 < v10) {
        goto LABEL_44;
      }
      uint64_t result = swift_bridgeObjectRetain();
      unint64_t v14 = v13;
    }
    if (v10 < 0) {
      goto LABEL_46;
    }
    if (v12)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_31090();
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8));
    }
    if (v15 < (uint64_t)v14) {
      goto LABEL_47;
    }
    if ((v14 & 0x8000000000000000) != 0) {
      goto LABEL_48;
    }
    if ((v11 & 0xC000000000000001) != 0 && v10 != v14)
    {
      if (v10 >= v14) {
        goto LABEL_49;
      }
      type metadata accessor for PatternItem();
      Swift::Int v16 = v10;
      do
      {
        Swift::Int v17 = v16 + 1;
        sub_30FA0(v16);
        Swift::Int v16 = v17;
      }
      while (v14 != v17);
    }
    if (v12)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_310A0();
      uint64_t v19 = v21;
      uint64_t v10 = v22;
      unint64_t v20 = v23;
      swift_bridgeObjectRelease_n();
      if ((v20 & 1) == 0) {
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v18 = v11 & 0xFFFFFFFFFFFFFF8;
      uint64_t v19 = (v11 & 0xFFFFFFFFFFFFFF8) + 32;
      unint64_t v20 = (2 * v14) | 1;
      if ((v20 & 1) == 0) {
        goto LABEL_23;
      }
    }
    sub_311D0();
    swift_unknownObjectRetain_n();
    char v25 = (void *)swift_dynamicCastClass();
    if (!v25)
    {
      swift_unknownObjectRelease();
      char v25 = _swiftEmptyArrayStorage;
    }
    uint64_t v26 = v25[2];
    uint64_t result = swift_release();
    if (__OFSUB__(v20 >> 1, v10)) {
      goto LABEL_50;
    }
    if (v26 == (v20 >> 1) - v10)
    {
      uint64_t v24 = (void *)swift_dynamicCastClass();
      if (!v24)
      {
        swift_unknownObjectRelease();
        uint64_t v24 = _swiftEmptyArrayStorage;
      }
      goto LABEL_30;
    }
    swift_unknownObjectRelease();
LABEL_23:
    uint64_t v24 = sub_23F30(v18, v19, v10, v20);
LABEL_30:
    swift_unknownObjectRelease();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_22F44(0, v7[2] + 1, 1, v7);
      uint64_t v7 = (void *)result;
    }
    unint64_t v28 = v7[2];
    unint64_t v27 = v7[3];
    if (v28 >= v27 >> 1)
    {
      uint64_t result = (uint64_t)sub_22F44((void *)(v27 > 1), v28 + 1, 1, v7);
      uint64_t v7 = (void *)result;
    }
    ++v6;
    v7[2] = v28 + 1;
    v7[v28 + 4] = v24;
    if (v6 == v3)
    {
      uint64_t v2 = a2;
      swift_bridgeObjectRelease();
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

uint64_t sub_4F90(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_4FD4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_5018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4F90(&qword_3D8A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_5080(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for RectifiCoreDataStore(uint64_t a1)
{
  return sub_9AA0(a1, (uint64_t *)&unk_3D8D0);
}

uint64_t sub_50CC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_512C(uint64_t a1)
{
  uint64_t v50 = sub_4F90(&qword_3DA10);
  uint64_t v3 = __chkstk_darwin(v50);
  uint64_t v49 = (uint64_t *)((char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v48 = (uint64_t *)((char *)&v39 - v6);
  __chkstk_darwin(v5);
  unint64_t v47 = (char *)&v39 - v7;
  uint64_t v8 = sub_4F90(&qword_3D9F0);
  uint64_t v45 = *(void *)(v8 - 8);
  uint64_t v46 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = *(void *)(a1 + 16);
  unint64_t v12 = _swiftEmptyArrayStorage;
  if (!v11) {
    return (uint64_t)v12;
  }
  uint64_t v39 = v1;
  uint64_t v53 = _swiftEmptyArrayStorage;
  sub_2B010(0, v11, 0);
  uint64_t result = sub_DBD0(a1);
  uint64_t v15 = result;
  uint64_t v16 = 0;
  uint64_t v17 = a1 + 64;
  uint64_t v40 = a1 + 80;
  int64_t v41 = v11;
  uint64_t v43 = a1 + 64;
  uint64_t v44 = a1;
  uint64_t v42 = v14;
  uint64_t v18 = v50;
  while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v20 = (unint64_t)v15 >> 6;
    if ((*(void *)(v17 + 8 * ((unint64_t)v15 >> 6)) & (1 << v15)) == 0) {
      goto LABEL_25;
    }
    if (*(_DWORD *)(a1 + 36) != v14) {
      goto LABEL_26;
    }
    uint64_t v51 = v16;
    uint64_t v52 = 1 << v15;
    uint64_t v21 = v10;
    uint64_t v22 = v47;
    uint64_t v23 = (uint64_t)&v47[*(int *)(v18 + 48)];
    uint64_t v24 = *(void *)(a1 + 56);
    uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8 * v15);
    uint64_t v26 = type metadata accessor for PatternStoreValue(0);
    sub_D250(v24 + *(void *)(*(void *)(v26 - 8) + 72) * v15, v23);
    *uint64_t v22 = v25;
    unint64_t v27 = v48;
    *uint64_t v48 = v25;
    sub_D250(v23, (uint64_t)v27 + *(int *)(v18 + 48));
    uint64_t v28 = (uint64_t)v27;
    uint64_t v29 = v49;
    sub_DD84(v28, (uint64_t)v49, &qword_3DA10);
    swift_bridgeObjectRetain_n();
    uint64_t v30 = (uint64_t)v22;
    uint64_t v10 = v21;
    sub_DD28(v30, &qword_3DA10);
    uint64_t v31 = *v29;
    sub_D250((uint64_t)v29 + *(int *)(v18 + 48), (uint64_t)&v21[*(int *)(v46 + 48)]);
    *(void *)uint64_t v21 = v31;
    swift_bridgeObjectRetain();
    sub_DD28((uint64_t)v29, &qword_3DA10);
    unint64_t v12 = v53;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2B010(0, v12[2] + 1, 1);
      unint64_t v12 = v53;
    }
    unint64_t v33 = v12[2];
    unint64_t v32 = v12[3];
    if (v33 >= v32 >> 1)
    {
      sub_2B010(v32 > 1, v33 + 1, 1);
      unint64_t v12 = v53;
    }
    v12[2] = v33 + 1;
    uint64_t result = sub_DD84((uint64_t)v21, (uint64_t)v12+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v45 + 72) * v33, &qword_3D9F0);
    a1 = v44;
    int64_t v19 = 1 << *(unsigned char *)(v44 + 32);
    if (v15 >= v19) {
      goto LABEL_27;
    }
    uint64_t v17 = v43;
    uint64_t v34 = *(void *)(v43 + 8 * v20);
    if ((v34 & v52) == 0) {
      goto LABEL_28;
    }
    LODWORD(v14) = v42;
    if (*(_DWORD *)(v44 + 36) != v42) {
      goto LABEL_29;
    }
    unint64_t v35 = v34 & (-2 << (v15 & 0x3F));
    if (v35)
    {
      int64_t v19 = __clz(__rbit64(v35)) | v15 & 0xFFFFFFFFFFFFFFC0;
    }
    else
    {
      unint64_t v36 = v20 + 1;
      unint64_t v37 = (unint64_t)(v19 + 63) >> 6;
      if (v20 + 1 < v37)
      {
        unint64_t v38 = *(void *)(v43 + 8 * v36);
        if (v38)
        {
LABEL_22:
          int64_t v19 = __clz(__rbit64(v38)) + (v36 << 6);
        }
        else
        {
          while (v37 - 2 != v20)
          {
            unint64_t v38 = *(void *)(v40 + 8 * v20++);
            if (v38)
            {
              unint64_t v36 = v20 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    uint64_t v16 = v51 + 1;
    uint64_t v15 = v19;
    if (v51 + 1 == v41) {
      return (uint64_t)v12;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void sub_555C()
{
  qword_3EB68 = 0x49464954434552;
  unk_3EB70 = 0xE700000000000000;
}

uint64_t sub_5580()
{
  uint64_t v0 = sub_30AB0();
  uint64_t v2 = v1;
  if (qword_3D710 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = 0x2F49464954434552;
  v4._object = (void *)0xE800000000000000;
  sub_30D00(v4);
  uint64_t result = swift_bridgeObjectRelease();
  qword_3EB78 = v0;
  unk_3EB80 = v2;
  return result;
}

uint64_t sub_5620(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + qword_3D8B0) = 20;
  *(void *)(v2 + qword_3D8B8) = 10;
  uint64_t v5 = qword_3D8C0;
  sub_30400();
  swift_allocObject();
  swift_retain();
  *(void *)(v2 + v5) = sub_303F0();
  uint64_t v6 = qword_3D8C8;
  sub_303D0();
  swift_allocObject();
  *(void *)(v2 + v6) = sub_303C0();
  swift_release();

  return CoreDataStore.init(path:modelFileName:)(a1, a2, 0xD000000000000013, 0x8000000000032E60);
}

void sub_5708(uint64_t a1, id *a2, int a3)
{
  Swift::String v4 = v3;
  int v75 = a3;
  uint64_t v83 = a2;
  sub_4F90(&qword_3D920);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v84 = (char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = type metadata accessor for PatternStoreValue(0);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v81 = (uint64_t)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v80 = (char *)&v73 - v9;
  uint64_t v10 = sub_4F90(&qword_3D9C8);
  __chkstk_darwin(v10 - 8);
  uint64_t v98 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_304D0();
  unint64_t v97 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v73 - v17;
  __chkstk_darwin(v16);
  unint64_t v20 = (char *)&v73 - v19;
  id v21 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v22 = sub_30CA0();
  id v23 = [v21 initWithEntityName:v22];

  uint64_t v24 = (void *)sub_30640();
  type metadata accessor for RECTIFISelfPatternStore();
  uint64_t v25 = sub_30E70();
  if (v3)
  {

    return;
  }
  unint64_t v26 = v25;
  uint64_t v91 = v15;
  unint64_t v92 = v20;
  uint64_t v96 = v18;
  uint64_t v79 = a1;
  uint64_t v100 = v12;

  if (v26 >> 62)
  {
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_31090();
  }
  else
  {
    uint64_t v27 = *(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
  }
  uint64_t v28 = v96;
  id v29 = v23;
  if (v27)
  {
    id v74 = v23;
    uint64_t v93 = v4;
    unint64_t v101 = v26 & 0xC000000000000001;
    uint64_t v78 = qword_3D8C8;
    uint64_t v99 = (void (**)(char *, char *, uint64_t))(v97 + 32);
    uint64_t v95 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v97 + 56);
    v90 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v97 + 48);
    uint64_t v76 = (void (**)(char *, char *, uint64_t))(v97 + 16);
    uint64_t v77 = (void (**)(char *, uint64_t))(v97 + 8);
    uint64_t v30 = 4;
    unint64_t v97 = v26;
    uint64_t v94 = v27;
    while (1)
    {
      id v23 = (id)(v30 - 4);
      if (v101) {
        id v32 = (id)sub_30FB0();
      }
      else {
        id v32 = *(id *)(v26 + 8 * v30);
      }
      Swift::String v4 = v32;
      uint64_t v33 = v30 - 3;
      if (__OFADD__(v23, 1))
      {
        __break(1u);
        goto LABEL_39;
      }
      id v34 = [v32 pattern];
      if (!v34) {
        goto LABEL_9;
      }
      unint64_t v35 = v34;
      uint64_t v36 = sub_30430();
      unint64_t v38 = v37;

      id v39 = [v4 timestamp];
      if (!v39) {
        break;
      }
      uint64_t v40 = v39;
      sub_304A0();

      uint64_t v31 = (uint64_t)v98;
      int64_t v41 = *v99;
      uint64_t v42 = v28;
      uint64_t v43 = v100;
      (*v99)(v98, v42, v100);
      (*v95)(v31, 0, 1, v43);
      uint64_t v44 = v43;
      uint64_t v28 = v96;
      if ((*v90)(v31, 1, v44) == 1) {
        goto LABEL_8;
      }
      uint64_t v45 = v41;
      uint64_t v46 = v36;
      unint64_t v47 = v38;
      uint64_t v48 = v92;
      uint64_t v49 = v100;
      v87 = v45;
      v45(v92, (char *)v31, v100);
      sub_4F90(&qword_3D9D0);
      sub_DB0C(&qword_3D9D8, &qword_3D9E0);
      uint64_t v88 = v46;
      unint64_t v89 = v47;
      uint64_t v50 = v93;
      sub_303B0();
      uint64_t v93 = v50;
      if (v50)
      {
        (*v77)(v48, v49);
        sub_D0E8(v88, v89);

        swift_bridgeObjectRelease_n();
        return;
      }
      unint64_t v86 = (unint64_t)v102;
      (*v76)(v91, v48, v49);
      id v85 = [v4 frequency];
      id v51 = [v4 plusId];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = (uint64_t)v84;
        sub_304F0();

        uint64_t v54 = sub_30510();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v53, 0, 1, v54);
      }
      else
      {
        uint64_t v55 = sub_30510();
        uint64_t v53 = (uint64_t)v84;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v84, 1, 1, v55);
      }
      uint64_t v57 = v87;
      uint64_t v56 = v88;
      unsigned __int8 v58 = [v4 appLevelAggregation];
      uint64_t v59 = (uint64_t)v80;
      uint64_t v60 = v100;
      v57(v80, v91, v100);
      uint64_t v61 = v82;
      *(void *)(v59 + *(int *)(v82 + 20)) = v85;
      sub_DD84(v53, v59 + *(int *)(v61 + 24), &qword_3D920);
      *(unsigned char *)(v59 + *(int *)(v61 + 28)) = v58;
      uint64_t v62 = v81;
      sub_D188(v59, v81);
      uint64_t v63 = v83;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      id v102 = *v63;
      *uint64_t v63 = (id)0x8000000000000000;
      sub_CF90(v62, v86, isUniquelyReferenced_nonNull_native);
      *uint64_t v63 = v102;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_D0E8(v56, v89);
      (*v77)(v92, v60);

      uint64_t v27 = v94;
      uint64_t v28 = v96;
      unint64_t v26 = v97;
      if (v33 == v94)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        if ((v75 & 1) == 0)
        {
          id v29 = v74;
          goto LABEL_33;
        }
        id v29 = v74;
        if (v27 < 1) {
          __break(1u);
        }
        swift_bridgeObjectRetain();
        uint64_t v65 = 0;
        do
        {
          if (v101) {
            id v66 = (id)sub_30FB0();
          }
          else {
            id v66 = *(id *)(v26 + 8 * v65 + 32);
          }
          uint64_t v67 = v66;
          ++v65;
          BOOL v68 = (void *)sub_30640();
          [v68 deleteObject:v67];

          unint64_t v26 = v97;
        }
        while (v27 != v65);
        goto LABEL_32;
      }
LABEL_10:
      ++v30;
    }
    uint64_t v31 = (uint64_t)v98;
    (*v95)((uint64_t)v98, 1, 1, v100);
LABEL_8:
    sub_D0E8(v36, v38);
    sub_DD28(v31, &qword_3D9C8);
    uint64_t v27 = v94;
LABEL_9:

    if (v33 == v27) {
      goto LABEL_23;
    }
    goto LABEL_10;
  }
LABEL_32:
  swift_bridgeObjectRelease();
LABEL_33:
  swift_bridgeObjectRelease();
  uint64_t v69 = (void *)sub_30640();
  id v102 = 0;
  unsigned __int8 v70 = [v69 save:&v102];

  if (v70)
  {
    id v71 = v102;
  }
  else
  {
    id v72 = v102;
    sub_30410();

    swift_willThrow();
  }
}

void sub_6040(unint64_t *a1, unint64_t *a2, int a3)
{
  int v75 = a3;
  v87 = a2;
  uint64_t v83 = type metadata accessor for PatternStoreValue(0);
  uint64_t v81 = *(void *)(v83 - 8);
  uint64_t v5 = __chkstk_darwin(v83);
  uint64_t v88 = (uint64_t)v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v82 = (char *)v74 - v7;
  uint64_t v8 = sub_4F90(&qword_3D9C8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_304D0();
  unint64_t v96 = *(void *)(v11 - 8);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v74 - v15;
  id v17 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v18 = sub_30CA0();
  id v19 = [v17 initWithEntityName:v18];

  unint64_t v20 = v19;
  id v21 = (void *)sub_30640();
  type metadata accessor for RECTIFIInfrequentPatternStore();
  uint64_t v22 = sub_30E70();
  unint64_t v23 = v3;
  if (v3)
  {

    return;
  }
  unint64_t v24 = v22;
  v74[0] = v20;
  unint64_t v86 = v16;
  uint64_t v91 = v14;
  uint64_t v94 = v11;
  uint64_t v80 = v10;

  unint64_t v25 = v24;
  if (v24 >> 62)
  {
LABEL_48:
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_31090();
  }
  else
  {
    uint64_t v26 = *(void *)((char *)&dword_10 + (v24 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
  }
  uint64_t v27 = (uint64_t)v80;
  uint64_t v28 = v91;
  if (v26)
  {
    unint64_t v97 = v25 & 0xC000000000000001;
    uint64_t v79 = qword_3D8C8;
    unint64_t v89 = (void (**)(uint64_t, char *, uint64_t))(v96 + 32);
    v90 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v96 + 56);
    id v85 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v96 + 48);
    uint64_t v77 = (void (**)(char *, char *, uint64_t))(v96 + 16);
    uint64_t v78 = (void (**)(char *, uint64_t))(v96 + 8);
    uint64_t v29 = 4;
    unint64_t v92 = (void *)v25;
    uint64_t v76 = a1;
    uint64_t v93 = v26;
    while (1)
    {
      if (v97) {
        id v31 = (id)sub_30FB0();
      }
      else {
        id v31 = *(id *)(v25 + 8 * v29);
      }
      id v32 = v31;
      uint64_t v33 = v29 - 3;
      if (__OFADD__(v29 - 4, 1))
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
      id v34 = [v31 pattern];
      if (!v34) {
        goto LABEL_9;
      }
      unint64_t v35 = v34;
      uint64_t v95 = sub_30430();
      unint64_t v96 = v36;

      id v37 = [v32 timestamp];
      if (!v37) {
        break;
      }
      unint64_t v38 = v37;
      sub_304A0();

      id v39 = *v89;
      uint64_t v40 = v28;
      uint64_t v41 = v94;
      (*v89)(v27, v40, v94);
      (*v90)(v27, 0, 1, v41);
      uint64_t v42 = v41;
      uint64_t v28 = v91;
      if ((*v85)(v27, 1, v42) == 1) {
        goto LABEL_8;
      }
      uint64_t v43 = v86;
      uint64_t v44 = v27;
      uint64_t v45 = v94;
      v39((uint64_t)v86, (char *)v44, v94);
      uint64_t v46 = (void *)sub_4F90(&qword_3D9D0);
      sub_DB0C(&qword_3D9D8, &qword_3D9E0);
      sub_303B0();
      if (v23)
      {
        (*v78)(v43, v45);
        sub_D0E8(v95, v96);

        swift_bridgeObjectRelease_n();
        return;
      }
      v74[1] = v46;
      unint64_t v84 = 0;
      uint64_t v47 = v45;
      unint64_t v48 = (unint64_t)v98;
      uint64_t v49 = (uint64_t)v82;
      (*v77)(v82, v43, v47);
      id v50 = [v32 frequency];
      uint64_t v51 = v83;
      a1 = v87;
      uint64_t v52 = v49 + *(int *)(v83 + 24);
      uint64_t v53 = sub_30510();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v52, 1, 1, v53);
      *(void *)(v49 + *(int *)(v51 + 20)) = v50;
      *(unsigned char *)(v49 + *(int *)(v51 + 28)) = 2;
      sub_D188(v49, v88);
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v98 = (void *)*a1;
      unint64_t v25 = (unint64_t)v98;
      *a1 = 0x8000000000000000;
      unint64_t v23 = sub_A830(v48);
      uint64_t v56 = *(void *)(v25 + 16);
      BOOL v57 = (v55 & 1) == 0;
      uint64_t v58 = v56 + v57;
      if (__OFADD__(v56, v57)) {
        goto LABEL_46;
      }
      a1 = v55;
      if (*(void *)(v25 + 24) >= v58)
      {
        uint64_t v61 = v81;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_B758();
        }
      }
      else
      {
        sub_AA8C(v58, isUniquelyReferenced_nonNull_native);
        unint64_t v59 = sub_A830(v48);
        if ((a1 & 1) != (v60 & 1))
        {
          sub_311F0();
          __break(1u);
          return;
        }
        unint64_t v23 = v59;
        uint64_t v61 = v81;
      }
      uint64_t v28 = v91;
      unint64_t v25 = (unint64_t)v98;
      if (a1)
      {
        sub_D1EC(v88, v98[7] + *(void *)(v61 + 72) * v23);
      }
      else
      {
        v98[(v23 >> 6) + 8] |= 1 << v23;
        *(void *)(*(void *)(v25 + 48) + 8 * v23) = v48;
        sub_D188(v88, *(void *)(v25 + 56) + *(void *)(v61 + 72) * v23);
        uint64_t v62 = *(void *)(v25 + 16);
        BOOL v63 = __OFADD__(v62, 1);
        uint64_t v64 = v62 + 1;
        if (v63) {
          goto LABEL_47;
        }
        *(void *)(v25 + 16) = v64;
        swift_bridgeObjectRetain();
      }
      unint64_t *v87 = v25;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_D0E8(v95, v96);
      (*v78)(v86, v94);

      unint64_t v25 = (unint64_t)v92;
      uint64_t v30 = v93;
      a1 = v76;
      unint64_t v23 = v84;
      uint64_t v27 = (uint64_t)v80;
      if (v33 == v93)
      {
LABEL_30:
        swift_bridgeObjectRelease();
        if ((v75 & 1) == 0) {
          goto LABEL_38;
        }
        id v65 = v74[0];
        if (v30 < 1) {
          __break(1u);
        }
        swift_bridgeObjectRetain();
        uint64_t v66 = 0;
        do
        {
          if (v97) {
            id v67 = (id)sub_30FB0();
          }
          else {
            id v67 = *(id *)(v25 + 8 * v66 + 32);
          }
          BOOL v68 = v67;
          ++v66;
          uint64_t v69 = (void *)sub_30640();
          [v69 deleteObject:v68];

          unint64_t v25 = (unint64_t)v92;
        }
        while (v30 != v66);
        swift_bridgeObjectRelease();
        goto LABEL_40;
      }
LABEL_10:
      ++v29;
    }
    (*v90)(v27, 1, 1, v94);
LABEL_8:
    sub_D0E8(v95, v96);
    sub_DD28(v27, &qword_3D9C8);
LABEL_9:

    uint64_t v30 = v93;
    if (v33 == v93) {
      goto LABEL_30;
    }
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
LABEL_38:
  id v65 = v74[0];
LABEL_40:
  swift_bridgeObjectRelease();
  unsigned __int8 v70 = (void *)sub_30640();
  uint64_t v98 = 0;
  unsigned __int8 v71 = [v70 save:&v98];

  if (v71)
  {
    id v72 = v98;
  }
  else
  {
    uint64_t v73 = v98;
    sub_30410();

    swift_willThrow();
  }
}

uint64_t sub_6924(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = (int *)type metadata accessor for PatternStoreValue(0);
  uint64_t v74 = *((void *)v5 - 1);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v75 = (uint64_t)v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v67 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v71 = (uint64_t)v67 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  unsigned __int8 v70 = (char *)v67 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v69 = (uint64_t)v67 - v16;
  __chkstk_darwin(v15);
  uint64_t v72 = (uint64_t)v67 - v17;
  unint64_t v18 = sub_21CD4((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v77 = (void *)v18;
  uint64_t v73 = *(void *)(a1 + 16);
  if (v73)
  {
    id v19 = (void *)v18;
    v67[0] = v3;
    v67[1] = v2;
    swift_bridgeObjectRetain();
    uint64_t v20 = 0;
    uint64_t v68 = a1;
    while (1)
    {
      unint64_t v21 = *(void *)(a1 + 8 * v20 + 32);
      uint64_t v22 = v19[2];
      swift_bridgeObjectRetain();
      if (v22)
      {
        unint64_t v23 = sub_A830(v21);
        if (v24)
        {
          uint64_t v25 = *(void *)(v74 + 72);
          uint64_t v26 = v19[7] + v25 * v23;
          uint64_t v27 = v69;
          sub_D250(v26, v69);
          uint64_t v28 = v72;
          sub_D188(v27, v72);
          uint64_t v29 = (uint64_t)v70;
          sub_304B0();
          uint64_t v30 = *(void *)(v28 + v5[5]);
          uint64_t v31 = v30 + 1;
          if (__OFADD__(v30, 1)) {
            goto LABEL_39;
          }
          uint64_t v32 = v29 + v5[6];
          uint64_t v33 = sub_30510();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 1, 1, v33);
          *(void *)(v29 + v5[5]) = v31;
          *(unsigned char *)(v29 + v5[7]) = 2;
          sub_D188(v29, v71);
          id v34 = v77;
          int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v76 = v34;
          unint64_t v37 = sub_A830(v21);
          uint64_t v38 = v34[2];
          BOOL v39 = (v36 & 1) == 0;
          uint64_t v40 = v38 + v39;
          if (__OFADD__(v38, v39)) {
            goto LABEL_40;
          }
          char v41 = v36;
          if (v34[3] >= v40)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              id v19 = v76;
              if ((v36 & 1) == 0) {
                goto LABEL_29;
              }
            }
            else
            {
              sub_B758();
              id v19 = v76;
              if ((v41 & 1) == 0) {
                goto LABEL_29;
              }
            }
          }
          else
          {
            sub_AA8C(v40, isUniquelyReferenced_nonNull_native);
            unint64_t v42 = sub_A830(v21);
            if ((v41 & 1) != (v43 & 1)) {
              goto LABEL_43;
            }
            unint64_t v37 = v42;
            id v19 = v76;
            if ((v41 & 1) == 0)
            {
LABEL_29:
              v19[(v37 >> 6) + 8] |= 1 << v37;
              *(void *)(v19[6] + 8 * v37) = v21;
              sub_D188(v71, v19[7] + v37 * v25);
              uint64_t v59 = v19[2];
              BOOL v57 = __OFADD__(v59, 1);
              uint64_t v60 = v59 + 1;
              if (v57) {
                goto LABEL_41;
              }
              v19[2] = v60;
              swift_bridgeObjectRetain();
              goto LABEL_31;
            }
          }
          sub_D1EC(v71, v19[7] + v37 * v25);
LABEL_31:
          uint64_t v77 = v19;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_DAB0(v72);
          a1 = v68;
          goto LABEL_5;
        }
      }
      sub_304B0();
      uint64_t v44 = &v10[v5[6]];
      uint64_t v45 = sub_30510();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 1, 1, v45);
      *(void *)&v10[v5[5]] = 1;
      v10[v5[7]] = 2;
      sub_D188((uint64_t)v10, v75);
      uint64_t v46 = v77;
      int v47 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v76 = v46;
      unint64_t v49 = sub_A830(v21);
      uint64_t v50 = v46[2];
      BOOL v51 = (v48 & 1) == 0;
      uint64_t v52 = v50 + v51;
      if (__OFADD__(v50, v51))
      {
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
      char v53 = v48;
      if (v46[3] >= v52)
      {
        if (v47)
        {
          id v19 = v76;
          if ((v48 & 1) == 0) {
            goto LABEL_21;
          }
        }
        else
        {
          sub_B758();
          id v19 = v76;
          if ((v53 & 1) == 0) {
            goto LABEL_21;
          }
        }
      }
      else
      {
        sub_AA8C(v52, v47);
        unint64_t v54 = sub_A830(v21);
        if ((v53 & 1) != (v55 & 1))
        {
LABEL_43:
          sub_4F90(&qword_3D9D0);
          uint64_t result = sub_311F0();
          __break(1u);
          return result;
        }
        unint64_t v49 = v54;
        id v19 = v76;
        if ((v53 & 1) == 0)
        {
LABEL_21:
          v19[(v49 >> 6) + 8] |= 1 << v49;
          *(void *)(v19[6] + 8 * v49) = v21;
          sub_D188(v75, v19[7] + *(void *)(v74 + 72) * v49);
          uint64_t v56 = v19[2];
          BOOL v57 = __OFADD__(v56, 1);
          uint64_t v58 = v56 + 1;
          if (v57) {
            goto LABEL_38;
          }
          v19[2] = v58;
          swift_bridgeObjectRetain();
          goto LABEL_4;
        }
      }
      sub_D1EC(v75, v19[7] + *(void *)(v74 + 72) * v49);
LABEL_4:
      uint64_t v77 = v19;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_5:
      if (v73 == ++v20)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  if (qword_3D730 != -1) {
LABEL_42:
  }
    swift_once();
  uint64_t v61 = sub_30C50();
  sub_DA38(v61, (uint64_t)qword_3EB98);
  uint64_t v62 = sub_30C30();
  os_log_type_t v63 = sub_30E20();
  if (os_log_type_enabled(v62, v63))
  {
    uint64_t v64 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v64 = 134217984;
    swift_beginAccess();
    uint64_t v76 = (void *)v77[2];
    sub_30EA0();
    _os_log_impl(&dword_0, v62, v63, "Writing %ld Incomplete patterns", v64, 0xCu);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t v65 = swift_bridgeObjectRetain();
  sub_83B4(v65);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_6FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v80 = a2;
  uint64_t v5 = sub_4F90(&qword_3DA18);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for PatternStoreValue(0);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v89 = (uint64_t)v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v88 = (char *)v76 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v81 = (uint64_t)v76 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  unint64_t v18 = (char *)v76 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)v76 - v19;
  uint64_t v21 = sub_4F90(&qword_3D920);
  __chkstk_darwin(v21 - 8);
  unint64_t v23 = (char *)v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v93 = sub_21CD4((uint64_t)_swiftEmptyArrayStorage);
  char v24 = (void *)sub_30640();
  v76[2] = v3;
  uint64_t v90 = v3;
  uint64_t v91 = &v93;
  char v92 = 1;
  uint64_t v25 = v87;
  sub_30E60();

  if (v25) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v79 = v20;
  uint64_t v77 = v18;
  uint64_t v94 = (void *)v93;
  uint64_t v87 = *(void *)(a1 + 16);
  if (!v87)
  {
LABEL_41:
    if (qword_3D730 != -1) {
LABEL_52:
    }
      swift_once();
    uint64_t v70 = sub_30C50();
    sub_DA38(v70, (uint64_t)qword_3EB98);
    uint64_t v71 = sub_30C30();
    os_log_type_t v72 = sub_30E20();
    if (os_log_type_enabled(v71, v72))
    {
      uint64_t v73 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v73 = 134217984;
      swift_beginAccess();
      unint64_t v93 = v94[2];
      sub_30EA0();
      _os_log_impl(&dword_0, v71, v72, "Writing %ld self patterns", v73, 0xCu);
      swift_slowDealloc();
    }

    swift_beginAccess();
    uint64_t v74 = swift_bridgeObjectRetain();
    sub_7938(v74);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  v76[1] = 0;
  unint64_t v26 = *(void *)(v80 + 16);
  unint64_t v86 = (void (**)(char *, uint64_t, uint64_t, int *))(v9 + 56);
  uint64_t v78 = (unsigned int (**)(char *, uint64_t, int *))(v9 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v27 = 0;
  unint64_t v28 = 0;
  uint64_t v83 = v7;
  uint64_t v84 = a1;
  uint64_t v85 = v9;
  unint64_t v82 = v26;
  while (1)
  {
    unint64_t v29 = *(void *)(a1 + 8 * v27 + 32);
    if (v28 == v26)
    {
      uint64_t v30 = sub_30510();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v23, 1, 1, v30);
      unint64_t v28 = v26;
    }
    else
    {
      if (v28 >= v26) {
        goto LABEL_47;
      }
      uint64_t v31 = sub_30510();
      uint64_t v32 = *(void *)(v31 - 8);
      (*(void (**)(char *, unint64_t, uint64_t))(v32 + 16))(v23, v80+ ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))+ *(void *)(v32 + 72) * v28++, v31);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v23, 0, 1, v31);
    }
    uint64_t v33 = v94;
    uint64_t v34 = (uint64_t)v88;
    if (!v94[2])
    {
      (*v86)(v7, 1, 1, v8);
      swift_bridgeObjectRetain();
LABEL_17:
      sub_DD28((uint64_t)v7, &qword_3DA18);
      sub_304B0();
      sub_DCA4((uint64_t)v23, v34 + v8[6], &qword_3D920);
      *(void *)(v34 + v8[5]) = 1;
      *(unsigned char *)(v34 + v8[7]) = 0;
      sub_D188(v34, v89);
      unint64_t v38 = (unint64_t)v94;
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v93 = v38;
      unint64_t v41 = sub_A830(v29);
      uint64_t v42 = *(void *)(v38 + 16);
      BOOL v43 = (v40 & 1) == 0;
      uint64_t v44 = v42 + v43;
      if (__OFADD__(v42, v43))
      {
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
LABEL_51:
        __break(1u);
        goto LABEL_52;
      }
      char v45 = v40;
      if (*(void *)(v38 + 24) < v44)
      {
        sub_AA8C(v44, isUniquelyReferenced_nonNull_native);
        unint64_t v46 = sub_A830(v29);
        if ((v45 & 1) != (v47 & 1)) {
          break;
        }
        unint64_t v41 = v46;
        char v48 = (void *)v93;
        if ((v45 & 1) == 0) {
          goto LABEL_24;
        }
LABEL_4:
        uint64_t v9 = v85;
        sub_D1EC(v89, v48[7] + *(void *)(v85 + 72) * v41);
LABEL_5:
        uint64_t v94 = v48;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        char v48 = (void *)v93;
        if (v40) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_B758();
        char v48 = (void *)v93;
        if (v45) {
          goto LABEL_4;
        }
      }
LABEL_24:
      v48[(v41 >> 6) + 8] |= 1 << v41;
      *(void *)(v48[6] + 8 * v41) = v29;
      uint64_t v9 = v85;
      sub_D188(v89, v48[7] + *(void *)(v85 + 72) * v41);
      uint64_t v49 = v48[2];
      BOOL v50 = __OFADD__(v49, 1);
      uint64_t v51 = v49 + 1;
      if (v50) {
        goto LABEL_48;
      }
      v48[2] = v51;
      swift_bridgeObjectRetain();
      goto LABEL_5;
    }
    swift_bridgeObjectRetain_n();
    unint64_t v35 = sub_A830(v29);
    if (v36)
    {
      sub_D250(v33[7] + *(void *)(v9 + 72) * v35, (uint64_t)v7);
      uint64_t v37 = 0;
    }
    else
    {
      uint64_t v37 = 1;
    }
    (*v86)(v7, v37, 1, v8);
    swift_bridgeObjectRelease();
    if ((*v78)(v7, 1, v8) == 1) {
      goto LABEL_17;
    }
    uint64_t v52 = (uint64_t)v79;
    sub_D188((uint64_t)v7, (uint64_t)v79);
    uint64_t v53 = (uint64_t)v77;
    sub_304B0();
    uint64_t v54 = *(void *)(v52 + v8[5]);
    uint64_t v55 = v54 + 1;
    if (__OFADD__(v54, 1)) {
      goto LABEL_49;
    }
    sub_DCA4((uint64_t)v23, v53 + v8[6], &qword_3D920);
    *(void *)(v53 + v8[5]) = v55;
    *(unsigned char *)(v53 + v8[7]) = 0;
    sub_D188(v53, v81);
    unint64_t v56 = (unint64_t)v94;
    int v57 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v93 = v56;
    unint64_t v59 = sub_A830(v29);
    uint64_t v60 = *(void *)(v56 + 16);
    BOOL v61 = (v58 & 1) == 0;
    uint64_t v62 = v60 + v61;
    if (__OFADD__(v60, v61)) {
      goto LABEL_50;
    }
    char v63 = v58;
    if (*(void *)(v56 + 24) >= v62)
    {
      if ((v57 & 1) == 0) {
        sub_B758();
      }
      goto LABEL_33;
    }
    sub_AA8C(v62, v57);
    unint64_t v64 = sub_A830(v29);
    if ((v63 & 1) != (v65 & 1)) {
      break;
    }
    unint64_t v59 = v64;
LABEL_33:
    uint64_t v66 = v81;
    id v67 = (void *)v93;
    if (v63)
    {
      uint64_t v9 = v85;
      sub_D1EC(v81, *(void *)(v93 + 56) + *(void *)(v85 + 72) * v59);
    }
    else
    {
      *(void *)(v93 + 8 * (v59 >> 6) + 64) |= 1 << v59;
      *(void *)(v67[6] + 8 * v59) = v29;
      uint64_t v9 = v85;
      sub_D188(v66, v67[7] + *(void *)(v85 + 72) * v59);
      uint64_t v68 = v67[2];
      BOOL v50 = __OFADD__(v68, 1);
      uint64_t v69 = v68 + 1;
      if (v50) {
        goto LABEL_51;
      }
      void v67[2] = v69;
      swift_bridgeObjectRetain();
    }
    uint64_t v94 = v67;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_DAB0((uint64_t)v79);
LABEL_6:
    uint64_t v7 = v83;
    a1 = v84;
    ++v27;
    sub_DD28((uint64_t)v23, &qword_3D920);
    unint64_t v26 = v82;
    if (v87 == v27)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_41;
    }
  }
  sub_4F90(&qword_3D9D0);
  uint64_t result = sub_311F0();
  __break(1u);
  return result;
}

void sub_7938(uint64_t a1)
{
  aBlock[0] = (void *)sub_512C(a1);
  swift_bridgeObjectRetain();
  sub_B9B4(aBlock);
  if (v2)
  {
    swift_release();
    __break(1u);
    return;
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = aBlock[0];
  if (aBlock[0][2] <= 0x14uLL)
  {
    uint64_t v6 = aBlock[0];
  }
  else
  {
    sub_311D0();
    swift_unknownObjectRetain_n();
    Swift::String v4 = (void *)swift_dynamicCastClass();
    if (!v4)
    {
      swift_release();
      Swift::String v4 = _swiftEmptyArrayStorage;
    }
    uint64_t v5 = v4[2];
    swift_release();
    if (v5 == 20)
    {
      uint64_t v6 = (void *)swift_dynamicCastClass();
      swift_release();
      if (v6) {
        goto LABEL_10;
      }
      uint64_t v6 = _swiftEmptyArrayStorage;
    }
    else
    {
      swift_release();
      uint64_t v21 = *(void *)(sub_4F90(&qword_3D9F0) - 8);
      uint64_t v6 = sub_24240((uint64_t)v3, (uint64_t)v3 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80)), 0, 0x29uLL);
    }
    swift_release();
  }
LABEL_10:
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = 0;
  uint64_t v8 = self;
  NSString v9 = sub_30CA0();
  uint64_t v10 = (void *)sub_30640();
  id v11 = [v8 entityForName:v9 inManagedObjectContext:v10];

  if (v11)
  {
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = v7;
    v12[3] = v1;
    id v13 = objc_allocWithZone((Class)NSBatchInsertRequest);
    aBlock[4] = sub_DC9C;
    aBlock[5] = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (void *)1107296256;
    aBlock[2] = sub_9C0C;
    aBlock[3] = &unk_39478;
    uint64_t v14 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    id v15 = [v13 initWithEntity:v11 managedObjectHandler:v14];
    _Block_release(v14);
    swift_release();
    uint64_t v16 = (void *)sub_30640();
    __chkstk_darwin(v16);
    sub_30E60();
    swift_release();
  }
  else
  {
    if (qword_3D730 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_30C50();
    sub_DA38(v17, (uint64_t)qword_3EB98);
    unint64_t v18 = sub_30C30();
    os_log_type_t v19 = sub_30E30();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_0, v18, v19, "Could not write to RECTIFI on-device SELF Pattern storage", v20, 2u);
      swift_slowDealloc();
    }
    swift_release();
  }
}

BOOL sub_7D1C(void *a1, uint64_t a2)
{
  id v41 = a1;
  uint64_t v3 = sub_4F90(&qword_3D920);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_4F90(&qword_3D9F8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (uint64_t *)((char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  NSString v9 = (int *)type metadata accessor for PatternStoreValue(0);
  __chkstk_darwin(v9);
  id v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v13 = *(void *)(a2 + 16);
  unint64_t v12 = *(void *)(a2 + 24);
  unint64_t v14 = *(void *)(v13 + 16);
  if (v12 == v14)
  {
    uint64_t v15 = sub_4F90(&qword_3D9F0);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 1, 1, v15);
  }
  else
  {
    if (v12 >= v14)
    {
      __break(1u);
      swift_once();
      uint64_t v25 = sub_30C50();
      sub_DA38(v25, (uint64_t)qword_3EB98);
      swift_errorRetain();
      swift_errorRetain();
      unint64_t v26 = sub_30C30();
      os_log_type_t v27 = sub_30E30();
      if (os_log_type_enabled(v26, v27))
      {
        unint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v43 = swift_slowAlloc();
        *(_DWORD *)unint64_t v28 = 136315138;
        swift_getErrorValue();
        uint64_t v29 = sub_31200();
        uint64_t v42 = sub_23830(v29, v30, &v43);
        sub_30EA0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v26, v27, "Could not write a record to RECTIFI on-device Self Pattern storage %s", v28, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
      }
      return a2 == 1;
    }
    uint64_t v16 = sub_4F90(&qword_3D9F0);
    uint64_t v17 = v9;
    unint64_t v18 = v5;
    uint64_t v19 = *(void *)(v16 - 8);
    sub_DCA4(v13+ ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(void *)(v19 + 72) * v12, (uint64_t)v8, &qword_3D9F0);
    *(void *)(a2 + 24) = v12 + 1;
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v19 + 56))(v8, 0, 1, v16);
    uint64_t v5 = v18;
    NSString v9 = v17;
  }
  uint64_t v20 = sub_4F90(&qword_3D9F0);
  LODWORD(a2) = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v8, 1, v20);
  if (a2 == 1)
  {
    sub_DD28((uint64_t)v8, &qword_3D9F8);
  }
  else
  {
    uint64_t v21 = *v8;
    sub_D188((uint64_t)v8 + *(int *)(v20 + 48), (uint64_t)v11);
    type metadata accessor for RECTIFISelfPatternStore();
    uint64_t v22 = swift_dynamicCastClass();
    if (v22)
    {
      unint64_t v23 = (void *)v22;
      uint64_t v43 = v21;
      id v24 = v41;
      sub_4F90(&qword_3D9D0);
      sub_DB0C(&qword_3DA00, &qword_3DA08);
      uint64_t v31 = sub_303E0();
      unint64_t v33 = v32;
      swift_bridgeObjectRelease();
      Class isa = sub_30420().super.isa;
      sub_D0E8(v31, v33);
      [v23 setPattern:isa];

      [v23 setFrequency:*(void *)&v11[v9[5]]];
      Class v35 = sub_30470().super.isa;
      [v23 setTimestamp:v35];

      sub_DCA4((uint64_t)&v11[v9[6]], (uint64_t)v5, &qword_3D920);
      uint64_t v36 = sub_30510();
      uint64_t v37 = *(void *)(v36 - 8);
      Class v38 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v5, 1, v36) != 1)
      {
        Class v38 = sub_304E0().super.isa;
        (*(void (**)(char *, uint64_t))(v37 + 8))(v5, v36);
      }
      [v23 setPlusId:v38];

      [v23 setAppLevelAggregation:v11[v9[7]] & 1];
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_DAB0((uint64_t)v11);
  }
  return a2 == 1;
}

void sub_83B4(uint64_t a1)
{
  aBlock[0] = (void *)sub_512C(a1);
  swift_bridgeObjectRetain();
  sub_B9B4(aBlock);
  if (v2)
  {
    swift_release();
    __break(1u);
    return;
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = aBlock[0];
  if (aBlock[0][2] <= 0xAuLL)
  {
    uint64_t v6 = aBlock[0];
  }
  else
  {
    sub_311D0();
    swift_unknownObjectRetain_n();
    uint64_t v4 = (void *)swift_dynamicCastClass();
    if (!v4)
    {
      swift_release();
      uint64_t v4 = _swiftEmptyArrayStorage;
    }
    uint64_t v5 = v4[2];
    swift_release();
    if (v5 == 10)
    {
      uint64_t v6 = (void *)swift_dynamicCastClass();
      swift_release();
      if (v6) {
        goto LABEL_10;
      }
      uint64_t v6 = _swiftEmptyArrayStorage;
    }
    else
    {
      swift_release();
      uint64_t v21 = *(void *)(sub_4F90(&qword_3D9F0) - 8);
      uint64_t v6 = sub_24240((uint64_t)v3, (uint64_t)v3 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80)), 0, 0x15uLL);
    }
    swift_release();
  }
LABEL_10:
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = 0;
  uint64_t v8 = self;
  NSString v9 = sub_30CA0();
  uint64_t v10 = (void *)sub_30640();
  id v11 = [v8 entityForName:v9 inManagedObjectContext:v10];

  if (v11)
  {
    unint64_t v12 = (void *)swift_allocObject();
    v12[2] = v7;
    v12[3] = v1;
    id v13 = objc_allocWithZone((Class)NSBatchInsertRequest);
    aBlock[4] = sub_DA74;
    aBlock[5] = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (void *)1107296256;
    aBlock[2] = sub_9C0C;
    aBlock[3] = &unk_39428;
    unint64_t v14 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    id v15 = [v13 initWithEntity:v11 managedObjectHandler:v14];
    _Block_release(v14);
    swift_release();
    uint64_t v16 = (void *)sub_30640();
    __chkstk_darwin(v16);
    sub_30E60();
    swift_release();
  }
  else
  {
    if (qword_3D730 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_30C50();
    sub_DA38(v17, (uint64_t)qword_3EB98);
    unint64_t v18 = sub_30C30();
    os_log_type_t v19 = sub_30E30();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_0, v18, v19, "Could not write to RECTIFI on-device Infrequent Pattern storage", v20, 2u);
      swift_slowDealloc();
    }
    swift_release();
  }
}

BOOL sub_8798(void *a1, uint64_t a2)
{
  id v33 = a1;
  uint64_t v3 = sub_4F90(&qword_3D9F8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for PatternStoreValue(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v10 = *(void *)(a2 + 16);
  unint64_t v9 = *(void *)(a2 + 24);
  unint64_t v11 = *(void *)(v10 + 16);
  if (v9 == v11)
  {
    uint64_t v12 = sub_4F90(&qword_3D9F0);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 1, 1, v12);
  }
  else
  {
    if (v9 >= v11)
    {
      __break(1u);
      swift_once();
      uint64_t v20 = sub_30C50();
      sub_DA38(v20, (uint64_t)qword_3EB98);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v21 = sub_30C30();
      os_log_type_t v22 = sub_30E30();
      if (os_log_type_enabled(v21, v22))
      {
        unint64_t v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        *(_DWORD *)unint64_t v23 = 136315138;
        swift_getErrorValue();
        uint64_t v24 = sub_31200();
        uint64_t v34 = sub_23830(v24, v25, &v35);
        sub_30EA0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v21, v22, "Could not write a record to RECTIFI on-device Infrequent Pattern storage %s", v23, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_errorRelease();
        swift_errorRelease();
      }
      swift_errorRelease();
      goto LABEL_14;
    }
    uint64_t v13 = sub_4F90(&qword_3D9F0);
    uint64_t v14 = *(void *)(v13 - 8);
    sub_DCA4(v10+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(void *)(v14 + 72) * v9, (uint64_t)v5, &qword_3D9F0);
    *(void *)(a2 + 24) = v9 + 1;
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  }
  uint64_t v15 = sub_4F90(&qword_3D9F0);
  LODWORD(a2) = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v5, 1, v15);
  if (a2 != 1)
  {
    uint64_t v16 = *v5;
    sub_D188((uint64_t)v5 + *(int *)(v15 + 48), (uint64_t)v8);
    type metadata accessor for RECTIFIInfrequentPatternStore();
    uint64_t v17 = swift_dynamicCastClass();
    if (v17)
    {
      unint64_t v18 = (void *)v17;
      uint64_t v35 = v16;
      id v19 = v33;
      sub_4F90(&qword_3D9D0);
      sub_DB0C(&qword_3DA00, &qword_3DA08);
      uint64_t v26 = sub_303E0();
      unint64_t v28 = v27;
      swift_bridgeObjectRelease();
      Class isa = sub_30420().super.isa;
      sub_D0E8(v26, v28);
      [v18 setPattern:isa];

      [v18 setFrequency:*(void *)&v8[*(int *)(v6 + 20)]];
      Class v30 = sub_30470().super.isa;
      [v18 setTimestamp:v30];
    }
    else
    {
      swift_bridgeObjectRelease();
    }
LABEL_14:
    sub_DAB0((uint64_t)v8);
    return a2 == 1;
  }
  sub_DD28((uint64_t)v5, &qword_3D9F8);
  return a2 == 1;
}

id sub_8CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)sub_30640();
  id v11 = 0;
  id v4 = [v3 executeRequest:a2 error:&v11];

  id v5 = v11;
  if (v4)
  {
    id v6 = v11;

    uint64_t v7 = (void *)sub_30640();
    id v11 = 0;
    unsigned int v8 = [v7 save:&v11];

    id v5 = v11;
    if (v8) {
      return v11;
    }
  }
  id v10 = v5;
  sub_30410();

  return (id)swift_willThrow();
}

void sub_8E00()
{
}

uint64_t sub_8E30()
{
  swift_release();

  return swift_release();
}

uint64_t sub_8E70()
{
  uint64_t v0 = sub_30650();
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t sub_8ED0()
{
  return type metadata accessor for RectifiCoreDataStore(0);
}

void *sub_8ED8(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_304D0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    unint64_t v9 = (char *)a1 + v8;
    id v10 = (char *)a2 + v8;
    uint64_t v11 = sub_30510();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_4F90(&qword_3D920);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_9094(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_304D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_30510();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t sub_9194(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_304D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_30510();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_4F90(&qword_3D920);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_9300(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_304D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_30510();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_4F90(&qword_3D920);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_94D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_304D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_30510();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_4F90(&qword_3D920);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_9640(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_304D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_30510();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_4F90(&qword_3D920);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_9810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_9824);
}

uint64_t sub_9824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_304D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_4F90(&qword_3D920);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unsigned int v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 2) {
    int v15 = ((v14 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v15 = -2;
  }
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t sub_9958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_996C);
}

uint64_t sub_996C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_304D0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_4F90(&qword_3D920);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(unsigned char *)(a1 + *(int *)(a4 + 28)) = a2 + 2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 24);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for PatternStoreValue(uint64_t a1)
{
  return sub_9AA0(a1, (uint64_t *)&unk_3D980);
}

uint64_t sub_9AA0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_9AD8()
{
  sub_304D0();
  if (v0 <= 0x3F)
  {
    sub_9BB4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_9BB4()
{
  if (!qword_3D990)
  {
    sub_30510();
    unint64_t v0 = sub_30E90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_3D990);
    }
  }
}

uint64_t sub_9C0C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_9C64(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = sub_311C0(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a1 + 7;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_311C0() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_9D2C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
LABEL_132:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_31090();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_31090();
    swift_bridgeObjectRelease();
    if (v5 != v37) {
      return 0;
    }
  }
  else if (v5 != *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)))
  {
    return 0;
  }
  if (v5)
  {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 < 0) {
      uint64_t v6 = a1;
    }
    if (!v4) {
      uint64_t v6 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
    }
    uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
    uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
    if (a2 < 0) {
      uint64_t v7 = a2;
    }
    if ((unint64_t)a2 >> 62) {
      uint64_t v8 = v7;
    }
    if (v6 != v8)
    {
      if ((v5 & 0x8000000000000000) == 0)
      {
        if (((a2 | a1) & 0xC000000000000001) != 0)
        {
          unint64_t v9 = 0;
          unint64_t v38 = a2 & 0xC000000000000001;
          while (1)
          {
            if (v5 == v9)
            {
              __break(1u);
              goto LABEL_132;
            }
            if ((a1 & 0xC000000000000001) != 0)
            {
              unint64_t v4 = sub_30FB0();
              if (v38) {
                goto LABEL_23;
              }
            }
            else
            {
              unint64_t v4 = *(void *)(a1 + 8 * v9 + 32);
              swift_retain();
              if (v38)
              {
LABEL_23:
                uint64_t v11 = sub_30FB0();
                goto LABEL_27;
              }
            }
            if (v9 >= *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8))) {
              goto LABEL_136;
            }
            uint64_t v11 = *(void *)(a2 + 8 * v9 + 32);
            swift_retain();
LABEL_27:
            BOOL v12 = *(void *)(v4 + 24) == *(void *)(v11 + 24) && *(void *)(v4 + 32) == *(void *)(v11 + 32);
            if (!v12 && (sub_311C0() & 1) == 0 || *(unsigned __int8 *)(v4 + 40) != *(unsigned __int8 *)(v11 + 40))
            {
              swift_release();
              swift_release();
              return 0;
            }
            ++v9;
            unint64_t v13 = 0x8000000000032B10;
            unint64_t v14 = 0xD000000000000017;
            switch(*(unsigned char *)(v4 + 41))
            {
              case 1:
                unint64_t v13 = 0xE300000000000000;
                unint64_t v14 = 5786702;
                break;
              case 2:
                unint64_t v13 = 0xE300000000000000;
                unint64_t v14 = 4801877;
                break;
              case 3:
                unint64_t v13 = 0xE800000000000000;
                unint64_t v14 = 0x505041454E4F4850;
                break;
              case 4:
                unint64_t v14 = 0x414547415353454DLL;
                unint64_t v13 = 0xEA00000000005050;
                break;
              case 5:
                unint64_t v14 = 0x5245444E494D4552;
                unsigned int v15 = 1096041811;
                goto LABEL_44;
              case 6:
                break;
              case 7:
                unint64_t v14 = 0x4552434D52414C41;
                goto LABEL_43;
              case 8:
                unint64_t v13 = 0xEE00505041454C47;
                unint64_t v14 = 0x474F544D52414C41;
                break;
              case 9:
                unint64_t v14 = 0x4450554D52414C41;
LABEL_43:
                unsigned int v15 = 1095062593;
LABEL_44:
                unint64_t v13 = v15 | 0xEE00505000000000;
                break;
              case 0xA:
                unint64_t v14 = 0x4145524345544F4ELL;
                goto LABEL_47;
              case 0xB:
                unint64_t v14 = 0x454C454445544F4ELL;
LABEL_47:
                unint64_t v13 = 0xED00005050414554;
                break;
              case 0xC:
                unint64_t v14 = 0x5041594D444E4946;
                unint64_t v13 = 0xE900000000000050;
                break;
              case 0xD:
                unint64_t v13 = 0xE700000000000000;
                unint64_t v14 = 0x4E574F4E4B4E55;
                break;
              default:
                unint64_t v13 = 0xE300000000000000;
                unint64_t v14 = 5395265;
                break;
            }
            unint64_t v16 = 0x8000000000032B10;
            unint64_t v17 = 0xD000000000000017;
            switch(*(unsigned char *)(v11 + 41))
            {
              case 1:
                unint64_t v16 = 0xE300000000000000;
                if (v14 != 5786702) {
                  goto LABEL_18;
                }
                goto LABEL_75;
              case 2:
                unint64_t v16 = 0xE300000000000000;
                if (v14 != 4801877) {
                  goto LABEL_18;
                }
                goto LABEL_75;
              case 3:
                unint64_t v16 = 0xE800000000000000;
                if (v14 != 0x505041454E4F4850) {
                  goto LABEL_18;
                }
                goto LABEL_75;
              case 4:
                unint64_t v16 = 0xEA00000000005050;
                if (v14 != 0x414547415353454DLL) {
                  goto LABEL_18;
                }
                goto LABEL_75;
              case 5:
                uint64_t v18 = 0x5245444E494D4552;
                unsigned int v19 = 1096041811;
                goto LABEL_67;
              case 6:
                goto LABEL_74;
              case 7:
                uint64_t v18 = 0x4552434D52414C41;
                goto LABEL_66;
              case 8:
                unint64_t v16 = 0xEE00505041454C47;
                if (v14 != 0x474F544D52414C41) {
                  goto LABEL_18;
                }
                goto LABEL_75;
              case 9:
                uint64_t v18 = 0x4450554D52414C41;
LABEL_66:
                unsigned int v19 = 1095062593;
LABEL_67:
                unint64_t v16 = v19 | 0xEE00505000000000;
                if (v14 != v18) {
                  goto LABEL_18;
                }
                goto LABEL_75;
              case 0xA:
                uint64_t v20 = 0x4145524345544F4ELL;
                goto LABEL_71;
              case 0xB:
                uint64_t v20 = 0x454C454445544F4ELL;
LABEL_71:
                unint64_t v16 = 0xED00005050414554;
                if (v14 != v20) {
                  goto LABEL_18;
                }
                goto LABEL_75;
              case 0xC:
                unint64_t v17 = 0x5041594D444E4946;
                unint64_t v16 = 0xE900000000000050;
LABEL_74:
                if (v14 == v17) {
                  goto LABEL_75;
                }
                goto LABEL_18;
              case 0xD:
                unint64_t v16 = 0xE700000000000000;
                if (v14 != 0x4E574F4E4B4E55) {
                  goto LABEL_18;
                }
                goto LABEL_75;
              default:
                unint64_t v16 = 0xE300000000000000;
                if (v14 != 5395265) {
                  goto LABEL_18;
                }
LABEL_75:
                if (v13 == v16)
                {
                  swift_release();
                  swift_release();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (v5 == v9) {
                    return 1;
                  }
                }
                else
                {
LABEL_18:
                  char v10 = sub_311C0();
                  swift_release();
                  swift_release();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v10 & 1) == 0) {
                    return 0;
                  }
                  if (v5 == v9) {
                    return 1;
                  }
                }
                break;
            }
          }
        }
        uint64_t v22 = a1 + 32;
        uint64_t v23 = a2 + 32;
        uint64_t v24 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
        while (v24)
        {
          uint64_t v26 = *(void *)v22;
          uint64_t v27 = *(void *)v23;
          BOOL v28 = *(void *)(*(void *)v22 + 24) == *(void *)(*(void *)v23 + 24)
             && *(void *)(*(void *)v22 + 32) == *(void *)(*(void *)v23 + 32);
          if (!v28 && (sub_311C0() & 1) == 0 || *(unsigned __int8 *)(v26 + 40) != *(unsigned __int8 *)(v27 + 40)) {
            return 0;
          }
          uint64_t v29 = *(unsigned __int8 *)(v26 + 41);
          uint64_t v30 = *(unsigned __int8 *)(v27 + 41);
          unint64_t v31 = 0x8000000000032B10;
          unint64_t v32 = 0xD000000000000017;
          switch(v29)
          {
            case 1:
              unint64_t v31 = 0xE300000000000000;
              unint64_t v32 = 5786702;
              break;
            case 2:
              unint64_t v31 = 0xE300000000000000;
              unint64_t v32 = 4801877;
              break;
            case 3:
              unint64_t v31 = 0xE800000000000000;
              unint64_t v32 = 0x505041454E4F4850;
              break;
            case 4:
              unint64_t v32 = 0x414547415353454DLL;
              unint64_t v31 = 0xEA00000000005050;
              break;
            case 5:
              unint64_t v32 = 0x5245444E494D4552;
              unsigned int v33 = 1096041811;
              goto LABEL_102;
            case 6:
              break;
            case 7:
              unint64_t v32 = 0x4552434D52414C41;
              goto LABEL_101;
            case 8:
              unint64_t v31 = 0xEE00505041454C47;
              unint64_t v32 = 0x474F544D52414C41;
              break;
            case 9:
              unint64_t v32 = 0x4450554D52414C41;
LABEL_101:
              unsigned int v33 = 1095062593;
LABEL_102:
              unint64_t v31 = v33 | 0xEE00505000000000;
              break;
            case 10:
              unint64_t v32 = 0x4145524345544F4ELL;
              goto LABEL_105;
            case 11:
              unint64_t v32 = 0x454C454445544F4ELL;
LABEL_105:
              unint64_t v31 = 0xED00005050414554;
              break;
            case 12:
              unint64_t v32 = 0x5041594D444E4946;
              unint64_t v31 = 0xE900000000000050;
              break;
            case 13:
              unint64_t v31 = 0xE700000000000000;
              unint64_t v32 = 0x4E574F4E4B4E55;
              break;
            default:
              unint64_t v31 = 0xE300000000000000;
              unint64_t v32 = 5395265;
              break;
          }
          unint64_t v34 = 0x8000000000032B10;
          unint64_t v35 = 0xD000000000000017;
          switch(v30)
          {
            case 1:
              unint64_t v34 = 0xE300000000000000;
              unint64_t v35 = 5786702;
              break;
            case 2:
              unint64_t v34 = 0xE300000000000000;
              unint64_t v35 = 4801877;
              break;
            case 3:
              unint64_t v34 = 0xE800000000000000;
              unint64_t v35 = 0x505041454E4F4850;
              break;
            case 4:
              unint64_t v35 = 0x414547415353454DLL;
              unint64_t v34 = 0xEA00000000005050;
              break;
            case 5:
              unint64_t v35 = 0x5245444E494D4552;
              unsigned int v36 = 1096041811;
              goto LABEL_119;
            case 6:
              break;
            case 7:
              unint64_t v35 = 0x4552434D52414C41;
              goto LABEL_118;
            case 8:
              unint64_t v34 = 0xEE00505041454C47;
              unint64_t v35 = 0x474F544D52414C41;
              break;
            case 9:
              unint64_t v35 = 0x4450554D52414C41;
LABEL_118:
              unsigned int v36 = 1095062593;
LABEL_119:
              unint64_t v34 = v36 | 0xEE00505000000000;
              break;
            case 10:
              unint64_t v35 = 0x4145524345544F4ELL;
              goto LABEL_122;
            case 11:
              unint64_t v35 = 0x454C454445544F4ELL;
LABEL_122:
              unint64_t v34 = 0xED00005050414554;
              break;
            case 12:
              unint64_t v35 = 0x5041594D444E4946;
              unint64_t v34 = 0xE900000000000050;
              break;
            case 13:
              unint64_t v34 = 0xE700000000000000;
              unint64_t v35 = 0x4E574F4E4B4E55;
              break;
            default:
              unint64_t v34 = 0xE300000000000000;
              unint64_t v35 = 5395265;
              break;
          }
          if (v32 == v35 && v31 == v34)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            char v25 = sub_311C0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v25 & 1) == 0) {
              return 0;
            }
          }
          --v24;
          v22 += 8;
          v23 += 8;
          uint64_t result = 1;
          if (!--v5) {
            return result;
          }
        }
        __break(1u);
LABEL_136:
        __break(1u);
      }
      __break(1u);
      JUMPOUT(0xA698);
    }
  }
  return 1;
}

unint64_t sub_A778(uint64_t a1)
{
  sub_31210();
  swift_bridgeObjectRetain();
  sub_30CF0();
  swift_bridgeObjectRelease();
  sub_31220(*(unsigned __int8 *)(a1 + 40));
  sub_1E12C(*(unsigned char *)(a1 + 41));
  sub_30CF0();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_31230();

  return sub_AFC0(a1, v2);
}

unint64_t sub_A830(unint64_t a1)
{
  sub_31210();
  sub_D2B4((uint64_t)v4, a1);
  Swift::Int v2 = sub_31230();

  return sub_B4A8(a1, v2);
}

unint64_t sub_A89C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_4F90(&qword_3DA20);
  uint64_t v6 = (void *)sub_310C0();
  if (*(void *)(v5 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v8 = (void *)(v5 + 64);
    uint64_t v9 = -1;
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    unint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v14 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v15 = v14 | (v13 << 6);
      }
      else
      {
        int64_t v16 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
          __break(1u);
LABEL_29:
          __break(1u);
          return result;
        }
        if (v16 >= v11) {
          goto LABEL_22;
        }
        unint64_t v17 = v8[v16];
        ++v13;
        if (!v17)
        {
          int64_t v13 = v16 + 1;
          if (v16 + 1 >= v11) {
            goto LABEL_22;
          }
          unint64_t v17 = v8[v13];
          if (!v17)
          {
            int64_t v18 = v16 + 2;
            if (v18 >= v11)
            {
LABEL_22:
              swift_release();
              if (a2)
              {
                uint64_t v22 = 1 << *(unsigned char *)(v5 + 32);
                if (v22 > 63) {
                  bzero((void *)(v5 + 64), ((unint64_t)(v22 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v8 = -1 << v22;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v17 = v8[v18];
            if (!v17)
            {
              while (1)
              {
                int64_t v13 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_29;
                }
                if (v13 >= v11) {
                  goto LABEL_22;
                }
                unint64_t v17 = v8[v13];
                ++v18;
                if (v17) {
                  goto LABEL_19;
                }
              }
            }
            int64_t v13 = v18;
          }
        }
LABEL_19:
        unint64_t v10 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v13 << 6);
      }
      uint64_t v19 = 8 * v15;
      uint64_t v20 = *(void *)(*(void *)(v5 + 48) + v19);
      uint64_t v21 = *(void *)(*(void *)(v5 + 56) + v19);
      if ((a2 & 1) == 0)
      {
        swift_retain();
        swift_bridgeObjectRetain();
      }
      unint64_t result = sub_AE24(v20, v21, v6);
    }
  }
  unint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

uint64_t sub_AA8C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v38 = *(void *)(type metadata accessor for PatternStoreValue(0) - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_4F90(&qword_3D9E8);
  int v39 = a2;
  uint64_t v8 = sub_310C0();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  unint64_t v35 = v2;
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v37 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  int64_t v36 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v14 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_22;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v20 >= v36) {
      break;
    }
    uint64_t v21 = v37;
    unint64_t v22 = v37[v20];
    ++v16;
    if (!v22)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_34;
      }
      unint64_t v22 = v37[v16];
      if (!v22)
      {
        int64_t v23 = v20 + 2;
        if (v23 >= v36)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v35;
          if ((v39 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v22 = v37[v23];
        if (!v22)
        {
          while (1)
          {
            int64_t v16 = v23 + 1;
            if (__OFADD__(v23, 1)) {
              goto LABEL_43;
            }
            if (v16 >= v36) {
              goto LABEL_34;
            }
            unint64_t v22 = v37[v16];
            ++v23;
            if (v22) {
              goto LABEL_21;
            }
          }
        }
        int64_t v16 = v23;
      }
    }
LABEL_21:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v19 = __clz(__rbit64(v22)) + (v16 << 6);
LABEL_22:
    unint64_t v24 = *(void *)(*(void *)(v7 + 48) + 8 * v19);
    uint64_t v25 = *(void *)(v38 + 72);
    uint64_t v26 = *(void *)(v7 + 56) + v25 * v19;
    if (v39)
    {
      sub_D188(v26, (uint64_t)v6);
    }
    else
    {
      sub_D250(v26, (uint64_t)v6);
      swift_bridgeObjectRetain();
    }
    sub_31210();
    sub_D2B4((uint64_t)v40, v24);
    uint64_t result = sub_31230();
    uint64_t v27 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v14 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v28) & ~*(void *)(v14 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v32 = v29 == v31;
        if (v29 == v31) {
          unint64_t v29 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v14 + 8 * v29);
      }
      while (v33 == -1);
      unint64_t v17 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(void *)(*(void *)(v9 + 48) + 8 * v17) = v24;
    uint64_t result = sub_D188((uint64_t)v6, *(void *)(v9 + 56) + v25 * v17);
    ++*(void *)(v9 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v21 = v37;
  if ((v39 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v34 = 1 << *(unsigned char *)(v7 + 32);
  if (v34 >= 64) {
    bzero(v21, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v21 = -1 << v34;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

unint64_t sub_AE24(uint64_t a1, uint64_t a2, void *a3)
{
  sub_31210();
  swift_bridgeObjectRetain();
  sub_30CF0();
  swift_bridgeObjectRelease();
  sub_31220(*(unsigned __int8 *)(a1 + 40));
  sub_1E12C(*(unsigned char *)(a1 + 41));
  sub_30CF0();
  swift_bridgeObjectRelease();
  sub_31230();
  unint64_t result = sub_30EE0();
  *(void *)((char *)a3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
  uint64_t v7 = 8 * result;
  *(void *)(a3[6] + v7) = a1;
  *(void *)(a3[7] + v7) = a2;
  ++a3[2];
  return result;
}

uint64_t sub_AF2C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for PatternStoreValue(0);
  uint64_t result = sub_D188(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

unint64_t sub_AFC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      uint64_t v8 = *(void *)(*(void *)(v2 + 48) + 8 * v4);
      BOOL v9 = *(void *)(v8 + 24) == *(void *)(a1 + 24) && *(void *)(v8 + 32) == *(void *)(a1 + 32);
      if (v9 || (sub_311C0()) && *(unsigned __int8 *)(v8 + 40) == *(unsigned __int8 *)(a1 + 40))
      {
        uint64_t v10 = *(unsigned __int8 *)(v8 + 41);
        unint64_t v11 = 0x8000000000032B10;
        unint64_t v12 = 0xD000000000000017;
        switch(v10)
        {
          case 1:
            unint64_t v11 = 0xE300000000000000;
            unint64_t v12 = 5786702;
            break;
          case 2:
            unint64_t v11 = 0xE300000000000000;
            unint64_t v12 = 4801877;
            break;
          case 3:
            unint64_t v11 = 0xE800000000000000;
            unint64_t v12 = 0x505041454E4F4850;
            break;
          case 4:
            unint64_t v11 = 0xEA00000000005050;
            unint64_t v12 = 0x414547415353454DLL;
            break;
          case 5:
            unint64_t v11 = 0xEE00505041544553;
            unint64_t v12 = 0x5245444E494D4552;
            break;
          case 6:
            break;
          case 7:
            unint64_t v12 = 0x4552434D52414C41;
            goto LABEL_21;
          case 8:
            unint64_t v12 = 0x474F544D52414C41;
            unint64_t v11 = 0xEE00505041454C47;
            break;
          case 9:
            unint64_t v12 = 0x4450554D52414C41;
LABEL_21:
            unint64_t v11 = 0xEE00505041455441;
            break;
          case 10:
            unint64_t v12 = 0x4145524345544F4ELL;
            goto LABEL_24;
          case 11:
            unint64_t v12 = 0x454C454445544F4ELL;
LABEL_24:
            unint64_t v11 = 0xED00005050414554;
            break;
          case 12:
            unint64_t v11 = 0xE900000000000050;
            unint64_t v12 = 0x5041594D444E4946;
            break;
          case 13:
            unint64_t v11 = 0xE700000000000000;
            unint64_t v12 = 0x4E574F4E4B4E55;
            break;
          default:
            unint64_t v11 = 0xE300000000000000;
            unint64_t v12 = 5395265;
            break;
        }
        unint64_t v13 = 0x8000000000032B10;
        unint64_t v14 = 0xD000000000000017;
        switch(*(unsigned char *)(a1 + 41))
        {
          case 1:
            unint64_t v13 = 0xE300000000000000;
            if (v12 == 5786702) {
              goto LABEL_52;
            }
            goto LABEL_3;
          case 2:
            unint64_t v13 = 0xE300000000000000;
            if (v12 != 4801877) {
              goto LABEL_3;
            }
            goto LABEL_52;
          case 3:
            unint64_t v13 = 0xE800000000000000;
            if (v12 != 0x505041454E4F4850) {
              goto LABEL_3;
            }
            goto LABEL_52;
          case 4:
            unint64_t v13 = 0xEA00000000005050;
            if (v12 != 0x414547415353454DLL) {
              goto LABEL_3;
            }
            goto LABEL_52;
          case 5:
            unint64_t v13 = 0xEE00505041544553;
            if (v12 != 0x5245444E494D4552) {
              goto LABEL_3;
            }
            goto LABEL_52;
          case 6:
            goto LABEL_51;
          case 7:
            uint64_t v15 = 0x4552434D52414C41;
            goto LABEL_44;
          case 8:
            unint64_t v13 = 0xEE00505041454C47;
            if (v12 != 0x474F544D52414C41) {
              goto LABEL_3;
            }
            goto LABEL_52;
          case 9:
            uint64_t v15 = 0x4450554D52414C41;
LABEL_44:
            unint64_t v13 = 0xEE00505041455441;
            if (v12 != v15) {
              goto LABEL_3;
            }
            goto LABEL_52;
          case 0xA:
            uint64_t v16 = 0x4145524345544F4ELL;
            goto LABEL_48;
          case 0xB:
            uint64_t v16 = 0x454C454445544F4ELL;
LABEL_48:
            unint64_t v13 = 0xED00005050414554;
            if (v12 != v16) {
              goto LABEL_3;
            }
            goto LABEL_52;
          case 0xC:
            unint64_t v13 = 0xE900000000000050;
            unint64_t v14 = 0x5041594D444E4946;
LABEL_51:
            if (v12 == v14) {
              goto LABEL_52;
            }
            goto LABEL_3;
          case 0xD:
            unint64_t v13 = 0xE700000000000000;
            if (v12 != 0x4E574F4E4B4E55) {
              goto LABEL_3;
            }
            goto LABEL_52;
          default:
            unint64_t v13 = 0xE300000000000000;
            if (v12 != 5395265) {
              goto LABEL_3;
            }
LABEL_52:
            if (v11 == v13)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return v4;
            }
LABEL_3:
            char v7 = sub_311C0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v7) {
              return v4;
            }
            break;
        }
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_B4A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v7 = swift_bridgeObjectRetain();
    char v8 = sub_9D2C(v7, a1);
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        uint64_t v10 = swift_bridgeObjectRetain();
        char v11 = sub_9D2C(v10, a1);
        swift_bridgeObjectRelease();
        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

void *sub_B5AC()
{
  uint64_t v1 = v0;
  sub_4F90(&qword_3DA20);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_310B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    swift_retain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_B758()
{
  uint64_t v1 = v0;
  uint64_t v24 = *(void *)(type metadata accessor for PatternStoreValue(0) - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4F90(&qword_3D9E8);
  uint64_t v4 = *v0;
  uint64_t v5 = sub_310B0();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v6;
    return result;
  }
  int64_t v23 = v1;
  uint64_t result = (void *)(v5 + 64);
  uint64_t v8 = v4 + 64;
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v4 || (unint64_t)result >= v8 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v6 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v14) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v8 + 8 * v20);
    ++v10;
    if (!v21)
    {
      int64_t v10 = v20 + 1;
      if (v20 + 1 >= v14) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v8 + 8 * v10);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 8 * v16;
    uint64_t v18 = *(void *)(*(void *)(v4 + 48) + 8 * v16);
    unint64_t v19 = *(void *)(v24 + 72) * v16;
    sub_D250(*(void *)(v4 + 56) + v19, (uint64_t)v3);
    *(void *)(*(void *)(v6 + 48) + v17) = v18;
    sub_D188((uint64_t)v3, *(void *)(v6 + 56) + v19);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v22);
  if (v21)
  {
    int64_t v10 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v8 + 8 * v10);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

Swift::Int sub_B9B4(void **a1)
{
  uint64_t v2 = *(void *)(sub_4F90(&qword_3D9F0) - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_1B1F8(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = sub_BA60(v6);
  *a1 = v3;
  return result;
}

Swift::Int sub_BA60(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v158 = sub_4F90(&qword_3D9F0);
  uint64_t v4 = *(void *)(v158 - 8);
  uint64_t v5 = __chkstk_darwin(v158);
  uint64_t v145 = (uint64_t)&v140 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v159 = (uint64_t)&v140 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  v156 = (uint64_t *)((char *)&v140 - v10);
  uint64_t v11 = __chkstk_darwin(v9);
  v155 = (uint64_t *)((char *)&v140 - v12);
  uint64_t v13 = __chkstk_darwin(v11);
  v154 = (uint64_t *)((char *)&v140 - v14);
  __chkstk_darwin(v13);
  v153 = (uint64_t *)((char *)&v140 - v15);
  Swift::Int v16 = a1[1];
  Swift::Int result = sub_311A0(v16);
  if (result >= v16)
  {
    if (v16 < 0) {
      goto LABEL_137;
    }
    if (v16) {
      return sub_C614(0, v16, 1, a1);
    }
    return result;
  }
  if (v16 >= 0) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v16 + 1;
  }
  if (v16 < -1) {
    goto LABEL_145;
  }
  Swift::Int v142 = result;
  uint64_t v149 = v4;
  if (v16 < 2)
  {
    int64_t v22 = (char *)_swiftEmptyArrayStorage;
    unint64_t v147 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v141 = _swiftEmptyArrayStorage;
    if (v16 != 1)
    {
      unint64_t v24 = _swiftEmptyArrayStorage[2];
LABEL_103:
      v133 = v22;
      if (v24 >= 2)
      {
        uint64_t v134 = *a1;
        do
        {
          unint64_t v135 = v24 - 2;
          if (v24 < 2) {
            goto LABEL_132;
          }
          if (!v134) {
            goto LABEL_144;
          }
          uint64_t v136 = *(void *)&v133[16 * v135 + 32];
          uint64_t v137 = *(void *)&v133[16 * v24 + 24];
          sub_C954(v134 + *(void *)(v149 + 72) * v136, v134 + *(void *)(v149 + 72) * *(void *)&v133[16 * v24 + 16], v134 + *(void *)(v149 + 72) * v137, v147);
          if (v2) {
            break;
          }
          if (v137 < v136) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v133 = sub_1A454((uint64_t)v133);
          }
          if (v135 >= *((void *)v133 + 2)) {
            goto LABEL_134;
          }
          v138 = &v133[16 * v135 + 32];
          *(void *)v138 = v136;
          *((void *)v138 + 1) = v137;
          unint64_t v139 = *((void *)v133 + 2);
          if (v24 > v139) {
            goto LABEL_135;
          }
          memmove(&v133[16 * v24 + 16], &v133[16 * v24 + 32], 16 * (v139 - v24));
          *((void *)v133 + 2) = v139 - 1;
          unint64_t v24 = v139 - 1;
        }
        while (v139 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      v141[2] = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v19 = v18 >> 1;
    uint64_t v20 = sub_30D80();
    *(void *)(v20 + 16) = v19;
    uint64_t v21 = *(unsigned __int8 *)(v4 + 80);
    v141 = (void *)v20;
    unint64_t v147 = v20 + ((v21 + 32) & ~v21);
  }
  Swift::Int v23 = 0;
  int64_t v22 = (char *)_swiftEmptyArrayStorage;
  v148 = a1;
  while (1)
  {
    Swift::Int v25 = v23;
    Swift::Int v26 = v23 + 1;
    if (v23 + 1 >= v16)
    {
      Swift::Int v40 = v23 + 1;
    }
    else
    {
      Swift::Int v144 = *a1;
      Swift::Int v27 = v144;
      uint64_t v28 = *(void *)(v149 + 72);
      uint64_t v161 = v28;
      Swift::Int v146 = v23;
      unint64_t v29 = v153;
      sub_DCA4(v144 + v28 * v26, (uint64_t)v153, &qword_3D9F0);
      char v30 = v154;
      sub_DCA4(v27 + v28 * v146, (uint64_t)v154, &qword_3D9F0);
      Swift::Int v160 = v16;
      uint64_t v31 = v158;
      uint64_t v32 = *(int *)(v158 + 48);
      uint64_t v33 = (uint64_t)v155 + v32;
      void *v155 = *v29;
      sub_D250((uint64_t)v29 + v32, v33);
      uint64_t v34 = type metadata accessor for PatternStoreValue(0);
      uint64_t v152 = *(void *)(v33 + *(int *)(v34 + 20));
      sub_DAB0(v33);
      uint64_t v35 = *(int *)(v31 + 48);
      Swift::Int v16 = v160;
      uint64_t v36 = (uint64_t)v156 + v35;
      void *v156 = *v30;
      sub_D250((uint64_t)v30 + v35, v36);
      uint64_t v151 = *(void *)(v36 + *(int *)(v34 + 20));
      sub_DAB0(v36);
      uint64_t v37 = (uint64_t)v30;
      Swift::Int v38 = v144;
      sub_DD28(v37, &qword_3D9F0);
      uint64_t v39 = (uint64_t)v29;
      Swift::Int v25 = v146;
      sub_DD28(v39, &qword_3D9F0);
      Swift::Int v40 = v25 + 2;
      if (v25 + 2 < v16)
      {
        v143 = v22;
        uint64_t v140 = v2;
        Swift::Int v157 = v161 * v26;
        Swift::Int v41 = v25 + 2;
        Swift::Int v150 = v161 * v40;
        while (1)
        {
          BOOL v42 = v151 < v152;
          uint64_t v43 = v153;
          sub_DCA4(v38 + v150, (uint64_t)v153, &qword_3D9F0);
          uint64_t v44 = v154;
          sub_DCA4(v38 + v157, (uint64_t)v154, &qword_3D9F0);
          uint64_t v45 = v158;
          uint64_t v46 = *(int *)(v158 + 48);
          uint64_t v47 = (uint64_t)v155 + v46;
          void *v155 = *v43;
          sub_D250((uint64_t)v43 + v46, v47);
          uint64_t v48 = *(void *)(v47 + *(int *)(v34 + 20));
          sub_DAB0(v47);
          uint64_t v49 = *(int *)(v45 + 48);
          uint64_t v50 = (uint64_t)v156 + v49;
          void *v156 = *v44;
          sub_D250((uint64_t)v44 + v49, v50);
          uint64_t v51 = *(void *)(v50 + *(int *)(v34 + 20));
          sub_DAB0(v50);
          sub_DD28((uint64_t)v44, &qword_3D9F0);
          sub_DD28((uint64_t)v43, &qword_3D9F0);
          if (v42 == v51 >= v48) {
            break;
          }
          v38 += v161;
          ++v41;
          Swift::Int v16 = v160;
          if (v160 == v41)
          {
            Swift::Int v40 = v160;
            uint64_t v2 = v140;
            a1 = v148;
            int64_t v22 = v143;
            Swift::Int v25 = v146;
            goto LABEL_23;
          }
        }
        uint64_t v2 = v140;
        a1 = v148;
        int64_t v22 = v143;
        Swift::Int v40 = v41;
        Swift::Int v25 = v146;
        Swift::Int v16 = v160;
      }
LABEL_23:
      if (v151 < v152)
      {
        uint64_t v52 = v161;
        if (v40 < v25) {
          goto LABEL_138;
        }
        if (v25 < v40)
        {
          v143 = v22;
          uint64_t v53 = 0;
          uint64_t v54 = v161 * (v40 - 1);
          Swift::Int v55 = v40 * v161;
          uint64_t v56 = v25 * v161;
          Swift::Int v157 = v40;
          do
          {
            if (v25 != v40 + v53 - 1)
            {
              Swift::Int v57 = v144;
              if (!v144) {
                goto LABEL_143;
              }
              unint64_t v58 = v144 + v56;
              uint64_t v59 = v144 + v54;
              sub_DD84(v144 + v56, v145, &qword_3D9F0);
              if (v56 < v54 || v58 >= v57 + v55)
              {
                swift_arrayInitWithTakeFrontToBack();
                uint64_t v52 = v161;
              }
              else
              {
                uint64_t v52 = v161;
                if (v56 != v54) {
                  swift_arrayInitWithTakeBackToFront();
                }
              }
              sub_DD84(v145, v59, &qword_3D9F0);
              Swift::Int v40 = v157;
            }
            ++v25;
            --v53;
            v54 -= v52;
            v55 -= v52;
            v56 += v52;
          }
          while (v25 < v40 + v53);
          a1 = v148;
          int64_t v22 = v143;
          Swift::Int v25 = v146;
          Swift::Int v16 = v160;
        }
      }
    }
    if (v40 < v16)
    {
      if (__OFSUB__(v40, v25)) {
        goto LABEL_136;
      }
      if (v40 - v25 < v142) {
        break;
      }
    }
LABEL_55:
    if (v40 < v25) {
      goto LABEL_131;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    Swift::Int v157 = v40;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      int64_t v22 = sub_19F50(0, *((void *)v22 + 2) + 1, 1, v22);
    }
    unint64_t v83 = *((void *)v22 + 2);
    unint64_t v82 = *((void *)v22 + 3);
    unint64_t v24 = v83 + 1;
    if (v83 >= v82 >> 1) {
      int64_t v22 = sub_19F50((char *)(v82 > 1), v83 + 1, 1, v22);
    }
    *((void *)v22 + 2) = v24;
    uint64_t v84 = v22 + 32;
    uint64_t v85 = &v22[16 * v83 + 32];
    Swift::Int v86 = v157;
    *(void *)uint64_t v85 = v25;
    *((void *)v85 + 1) = v86;
    if (v83)
    {
      while (1)
      {
        unint64_t v87 = v24 - 1;
        if (v24 >= 4)
        {
          char v92 = &v84[16 * v24];
          uint64_t v93 = *((void *)v92 - 8);
          uint64_t v94 = *((void *)v92 - 7);
          BOOL v98 = __OFSUB__(v94, v93);
          uint64_t v95 = v94 - v93;
          if (v98) {
            goto LABEL_120;
          }
          uint64_t v97 = *((void *)v92 - 6);
          uint64_t v96 = *((void *)v92 - 5);
          BOOL v98 = __OFSUB__(v96, v97);
          uint64_t v90 = v96 - v97;
          char v91 = v98;
          if (v98) {
            goto LABEL_121;
          }
          unint64_t v99 = v24 - 2;
          uint64_t v100 = &v84[16 * v24 - 32];
          uint64_t v102 = *(void *)v100;
          uint64_t v101 = *((void *)v100 + 1);
          BOOL v98 = __OFSUB__(v101, v102);
          uint64_t v103 = v101 - v102;
          if (v98) {
            goto LABEL_123;
          }
          BOOL v98 = __OFADD__(v90, v103);
          uint64_t v104 = v90 + v103;
          if (v98) {
            goto LABEL_126;
          }
          if (v104 >= v95)
          {
            v122 = &v84[16 * v87];
            uint64_t v124 = *(void *)v122;
            uint64_t v123 = *((void *)v122 + 1);
            BOOL v98 = __OFSUB__(v123, v124);
            uint64_t v125 = v123 - v124;
            if (v98) {
              goto LABEL_130;
            }
            BOOL v115 = v90 < v125;
            goto LABEL_92;
          }
        }
        else
        {
          if (v24 != 3)
          {
            uint64_t v116 = *((void *)v22 + 4);
            uint64_t v117 = *((void *)v22 + 5);
            BOOL v98 = __OFSUB__(v117, v116);
            uint64_t v109 = v117 - v116;
            char v110 = v98;
            goto LABEL_86;
          }
          uint64_t v89 = *((void *)v22 + 4);
          uint64_t v88 = *((void *)v22 + 5);
          BOOL v98 = __OFSUB__(v88, v89);
          uint64_t v90 = v88 - v89;
          char v91 = v98;
        }
        if (v91) {
          goto LABEL_122;
        }
        unint64_t v99 = v24 - 2;
        uint64_t v105 = &v84[16 * v24 - 32];
        uint64_t v107 = *(void *)v105;
        uint64_t v106 = *((void *)v105 + 1);
        BOOL v108 = __OFSUB__(v106, v107);
        uint64_t v109 = v106 - v107;
        char v110 = v108;
        if (v108) {
          goto LABEL_125;
        }
        uint64_t v111 = &v84[16 * v87];
        uint64_t v113 = *(void *)v111;
        uint64_t v112 = *((void *)v111 + 1);
        BOOL v98 = __OFSUB__(v112, v113);
        uint64_t v114 = v112 - v113;
        if (v98) {
          goto LABEL_128;
        }
        if (__OFADD__(v109, v114)) {
          goto LABEL_129;
        }
        if (v109 + v114 >= v90)
        {
          BOOL v115 = v90 < v114;
LABEL_92:
          if (v115) {
            unint64_t v87 = v99;
          }
          goto LABEL_94;
        }
LABEL_86:
        if (v110) {
          goto LABEL_124;
        }
        v118 = &v84[16 * v87];
        uint64_t v120 = *(void *)v118;
        uint64_t v119 = *((void *)v118 + 1);
        BOOL v98 = __OFSUB__(v119, v120);
        uint64_t v121 = v119 - v120;
        if (v98) {
          goto LABEL_127;
        }
        if (v121 < v109) {
          goto LABEL_14;
        }
LABEL_94:
        unint64_t v126 = v87 - 1;
        if (v87 - 1 >= v24)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!*v148) {
          goto LABEL_142;
        }
        v127 = v22;
        v128 = &v84[16 * v126];
        uint64_t v129 = *(void *)v128;
        v130 = &v84[16 * v87];
        uint64_t v131 = *((void *)v130 + 1);
        sub_C954(*v148 + *(void *)(v149 + 72) * *(void *)v128, *v148 + *(void *)(v149 + 72) * *(void *)v130, *v148 + *(void *)(v149 + 72) * v131, v147);
        if (v2) {
          goto LABEL_114;
        }
        if (v131 < v129) {
          goto LABEL_117;
        }
        if (v87 > *((void *)v127 + 2)) {
          goto LABEL_118;
        }
        *(void *)v128 = v129;
        *(void *)&v84[16 * v126 + 8] = v131;
        unint64_t v132 = *((void *)v127 + 2);
        if (v87 >= v132) {
          goto LABEL_119;
        }
        int64_t v22 = v127;
        unint64_t v24 = v132 - 1;
        memmove(&v84[16 * v87], v130 + 16, 16 * (v132 - 1 - v87));
        *((void *)v127 + 2) = v132 - 1;
        if (v132 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v24 = 1;
LABEL_14:
    a1 = v148;
    Swift::Int v16 = v148[1];
    Swift::Int v23 = v157;
    if (v157 >= v16) {
      goto LABEL_103;
    }
  }
  if (__OFADD__(v25, v142)) {
    goto LABEL_139;
  }
  if (v25 + v142 >= v16) {
    Swift::Int v60 = v16;
  }
  else {
    Swift::Int v60 = v25 + v142;
  }
  if (v60 >= v25)
  {
    if (v40 != v60)
    {
      Swift::Int v146 = v25;
      v143 = v22;
      Swift::Int v144 = v60;
      uint64_t v140 = v2;
      Swift::Int v61 = *(void *)(v149 + 72);
      uint64_t v62 = v61 * (v40 - 1);
      Swift::Int v150 = v61;
      Swift::Int v63 = v40 * v61;
      do
      {
        uint64_t v65 = 0;
        Swift::Int v66 = v146;
        Swift::Int v157 = v40;
        uint64_t v151 = v63;
        uint64_t v152 = v62;
        while (1)
        {
          Swift::Int v160 = v66;
          uint64_t v67 = *a1;
          uint64_t v68 = v63 + v65 + *a1;
          uint64_t v69 = v153;
          sub_DCA4(v68, (uint64_t)v153, &qword_3D9F0);
          uint64_t v70 = v62 + v65 + v67;
          uint64_t v71 = v154;
          sub_DCA4(v70, (uint64_t)v154, &qword_3D9F0);
          uint64_t v72 = v158;
          uint64_t v73 = *(int *)(v158 + 48);
          uint64_t v74 = (uint64_t)v155 + v73;
          void *v155 = *v69;
          sub_D250((uint64_t)v69 + v73, v74);
          uint64_t v75 = type metadata accessor for PatternStoreValue(0);
          uint64_t v161 = *(void *)(v74 + *(int *)(v75 + 20));
          sub_DAB0(v74);
          uint64_t v76 = *(int *)(v72 + 48);
          uint64_t v77 = (uint64_t)v156 + v76;
          void *v156 = *v71;
          sub_D250((uint64_t)v71 + v76, v77);
          uint64_t v78 = *(void *)(v77 + *(int *)(v75 + 20));
          sub_DAB0(v77);
          sub_DD28((uint64_t)v71, &qword_3D9F0);
          sub_DD28((uint64_t)v69, &qword_3D9F0);
          if (v78 >= v161) {
            break;
          }
          uint64_t v79 = *a1;
          if (!*a1) {
            goto LABEL_141;
          }
          Swift::Int v63 = v151;
          uint64_t v62 = v152;
          uint64_t v80 = v79 + v152 + v65;
          sub_DD84(v79 + v151 + v65, v159, &qword_3D9F0);
          swift_arrayInitWithTakeFrontToBack();
          sub_DD84(v159, v80, &qword_3D9F0);
          v65 -= v150;
          Swift::Int v66 = v160 + 1;
          Swift::Int v64 = v157;
          if (v157 == v160 + 1) {
            goto LABEL_48;
          }
        }
        Swift::Int v64 = v157;
        Swift::Int v63 = v151;
        uint64_t v62 = v152;
LABEL_48:
        Swift::Int v40 = v64 + 1;
        v62 += v150;
        v63 += v150;
      }
      while (v40 != v144);
      Swift::Int v40 = v144;
      uint64_t v2 = v140;
      int64_t v22 = v143;
      Swift::Int v25 = v146;
    }
    goto LABEL_55;
  }
LABEL_140:
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
  Swift::Int result = sub_31080();
  __break(1u);
  return result;
}

uint64_t sub_C614(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v42 = a1;
  uint64_t v52 = sub_4F90(&qword_3D9F0);
  uint64_t v7 = __chkstk_darwin(v52);
  uint64_t v53 = (uint64_t)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v47 = (uint64_t *)((char *)&v40 - v10);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v46 = (uint64_t *)((char *)&v40 - v12);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v45 = (uint64_t *)((char *)&v40 - v14);
  uint64_t result = __chkstk_darwin(v13);
  uint64_t v44 = (uint64_t *)((char *)&v40 - v17);
  uint64_t v51 = a3;
  uint64_t v41 = a2;
  if (a3 != a2)
  {
    uint64_t v18 = *(void *)(v16 + 72);
    uint64_t v19 = v18 * (v51 - 1);
    uint64_t v48 = v18;
    uint64_t v20 = v18 * v51;
    uint64_t v21 = &qword_3D9F0;
    uint64_t v43 = a4;
LABEL_5:
    uint64_t v22 = 0;
    uint64_t v23 = v42;
    uint64_t v49 = v20;
    uint64_t v50 = v19;
    while (1)
    {
      unint64_t v24 = v21;
      uint64_t v25 = *a4;
      uint64_t v54 = v20 + v22;
      Swift::Int v26 = v44;
      sub_DCA4(v20 + v22 + v25, (uint64_t)v44, v24);
      uint64_t v27 = v19 + v22 + v25;
      uint64_t v28 = v45;
      sub_DCA4(v27, (uint64_t)v45, v24);
      uint64_t v29 = v52;
      uint64_t v30 = *(int *)(v52 + 48);
      uint64_t v31 = (uint64_t)v46 + v30;
      void *v46 = *v26;
      sub_D250((uint64_t)v26 + v30, v31);
      uint64_t v32 = type metadata accessor for PatternStoreValue(0);
      uint64_t v55 = *(void *)(v31 + *(int *)(v32 + 20));
      sub_DAB0(v31);
      uint64_t v33 = *(int *)(v29 + 48);
      uint64_t v20 = v49;
      uint64_t v34 = (uint64_t)v47 + v33;
      *uint64_t v47 = *v28;
      sub_D250((uint64_t)v28 + v33, v34);
      uint64_t v35 = *(void *)(v34 + *(int *)(v32 + 20));
      uint64_t v36 = v34;
      uint64_t v21 = v24;
      sub_DAB0(v36);
      uint64_t v37 = (uint64_t)v28;
      uint64_t v19 = v50;
      sub_DD28(v37, v24);
      uint64_t result = sub_DD28((uint64_t)v26, v24);
      a4 = v43;
      if (v35 >= v55)
      {
LABEL_4:
        v19 += v48;
        v20 += v48;
        if (++v51 == v41) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v38 = *v43;
      if (!*v43) {
        break;
      }
      uint64_t v39 = v38 + v19 + v22;
      sub_DD84(v38 + v20 + v22, v53, v24);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t v21 = v24;
      uint64_t result = sub_DD84(v53, v39, v24);
      v22 -= v48;
      if (v51 == ++v23) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_C954(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v67 = sub_4F90(&qword_3D9F0);
  uint64_t v8 = __chkstk_darwin(v67);
  Swift::Int v66 = (uint64_t *)((char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v65 = (uint64_t *)((char *)&v57 - v11);
  uint64_t v12 = __chkstk_darwin(v10);
  Swift::Int v64 = (uint64_t *)((char *)&v57 - v13);
  __chkstk_darwin(v12);
  Swift::Int v63 = (uint64_t *)((char *)&v57 - v14);
  uint64_t v16 = *(void *)(v15 + 72);
  if (!v16)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v16 == -1) {
    goto LABEL_62;
  }
  int64_t v17 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v16 == -1) {
    goto LABEL_63;
  }
  uint64_t v18 = (uint64_t)(a2 - a1) / v16;
  unint64_t v70 = a1;
  unint64_t v69 = a4;
  uint64_t v19 = v17 / v16;
  if (v18 >= v17 / v16)
  {
    if ((v19 & 0x8000000000000000) == 0)
    {
      uint64_t v21 = v19 * v16;
      if (a4 < a2 || a2 + v21 <= a4)
      {
        uint64_t v22 = v67;
        swift_arrayInitWithTakeFrontToBack();
      }
      else
      {
        uint64_t v22 = v67;
        if (a4 != a2) {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v39 = a4 + v21;
      unint64_t v68 = a4 + v21;
      unint64_t v70 = a2;
      if (v21 >= 1 && a1 < a2)
      {
        uint64_t v41 = -v16;
        unint64_t v60 = a1;
        unint64_t v61 = a4;
        uint64_t v58 = v41;
        do
        {
          unint64_t v62 = a3 + v41;
          uint64_t v42 = v63;
          sub_DCA4(v39 + v41, (uint64_t)v63, &qword_3D9F0);
          unint64_t v43 = a2 + v41;
          uint64_t v44 = v64;
          sub_DCA4(a2 + v41, (uint64_t)v64, &qword_3D9F0);
          uint64_t v45 = *(int *)(v22 + 48);
          uint64_t v46 = (uint64_t)v65 + v45;
          void *v65 = *v42;
          sub_D250((uint64_t)v42 + v45, v46);
          unint64_t v47 = a3;
          uint64_t v48 = type metadata accessor for PatternStoreValue(0);
          uint64_t v49 = *(void *)(v46 + *(int *)(v48 + 20));
          sub_DAB0(v46);
          uint64_t v50 = *(int *)(v22 + 48);
          uint64_t v51 = (uint64_t)v66 + v50;
          *Swift::Int v66 = *v44;
          sub_D250((uint64_t)v44 + v50, v51);
          uint64_t v52 = *(void *)(v51 + *(int *)(v48 + 20));
          sub_DAB0(v51);
          sub_DD28((uint64_t)v44, &qword_3D9F0);
          sub_DD28((uint64_t)v42, &qword_3D9F0);
          if (v52 >= v49)
          {
            unint64_t v55 = v68;
            v68 += v58;
            uint64_t v41 = v58;
            a3 = v62;
            if (v47 < v55 || v62 >= v55)
            {
              uint64_t v22 = v67;
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v43 = a2;
              unint64_t v53 = v60;
              unint64_t v54 = v61;
            }
            else
            {
              uint64_t v22 = v67;
              unint64_t v53 = v60;
              unint64_t v54 = v61;
              if (v47 != v55) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v43 = a2;
            }
          }
          else
          {
            uint64_t v41 = v58;
            a3 = v62;
            if (v47 < a2 || v62 >= a2)
            {
              uint64_t v22 = v67;
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v53 = v60;
              unint64_t v54 = v61;
            }
            else
            {
              uint64_t v22 = v67;
              unint64_t v53 = v60;
              unint64_t v54 = v61;
              if (v47 != a2) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v70 += v41;
          }
          unint64_t v39 = v68;
          if (v68 <= v54) {
            break;
          }
          a2 = v43;
        }
        while (v43 > v53);
      }
      goto LABEL_60;
    }
  }
  else if ((v18 & 0x8000000000000000) == 0)
  {
    uint64_t v20 = v18 * v16;
    if (a4 < a1 || a1 + v20 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v62 = a4 + v20;
    unint64_t v68 = a4 + v20;
    if (v20 >= 1 && a2 < a3)
    {
      unint64_t v59 = a3;
      uint64_t v24 = v67;
      do
      {
        uint64_t v25 = v16;
        Swift::Int v26 = v63;
        sub_DCA4(a2, (uint64_t)v63, &qword_3D9F0);
        uint64_t v27 = v64;
        sub_DCA4(a4, (uint64_t)v64, &qword_3D9F0);
        uint64_t v28 = *(int *)(v24 + 48);
        uint64_t v29 = (uint64_t)v65 + v28;
        void *v65 = *v26;
        sub_D250((uint64_t)v26 + v28, v29);
        uint64_t v30 = type metadata accessor for PatternStoreValue(0);
        uint64_t v31 = *(void *)(v29 + *(int *)(v30 + 20));
        sub_DAB0(v29);
        uint64_t v32 = *(int *)(v24 + 48);
        uint64_t v33 = (uint64_t)v66 + v32;
        *Swift::Int v66 = *v27;
        sub_D250((uint64_t)v27 + v32, v33);
        uint64_t v34 = *(void *)(v33 + *(int *)(v30 + 20));
        sub_DAB0(v33);
        sub_DD28((uint64_t)v27, &qword_3D9F0);
        sub_DD28((uint64_t)v26, &qword_3D9F0);
        unint64_t v35 = v70;
        if (v34 >= v31)
        {
          uint64_t v16 = v25;
          unint64_t v38 = v69 + v25;
          if (v70 < v69 || v70 >= v38)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v37 = v59;
          }
          else
          {
            unint64_t v37 = v59;
            if (v70 != v69) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          unint64_t v69 = v38;
          unint64_t v36 = a2;
        }
        else
        {
          uint64_t v16 = v25;
          unint64_t v36 = a2 + v25;
          if (v70 < a2 || v70 >= v36)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v37 = v59;
          }
          else
          {
            unint64_t v37 = v59;
            if (v70 == a2) {
              unint64_t v35 = a2;
            }
            else {
              swift_arrayInitWithTakeBackToFront();
            }
          }
        }
        unint64_t v70 = v35 + v16;
        a4 = v69;
        if (v69 >= v62) {
          break;
        }
        a2 = v36;
      }
      while (v36 < v37);
    }
LABEL_60:
    sub_1A114(&v70, &v69, (uint64_t *)&v68);
    return 1;
  }
LABEL_64:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_CF90(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_A830(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_B758();
      goto LABEL_7;
    }
    sub_AA8C(v13, a3 & 1);
    unint64_t v20 = sub_A830(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      unint64_t v10 = v20;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    sub_4F90(&qword_3D9D0);
    uint64_t result = sub_311F0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = v17 + *(void *)(*(void *)(type metadata accessor for PatternStoreValue(0) - 8) + 72) * v10;
    return sub_D1EC(a1, v18);
  }
LABEL_13:
  sub_AF2C(v10, a2, a1, v16);

  return swift_bridgeObjectRetain();
}

uint64_t sub_D0E8(uint64_t a1, unint64_t a2)
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

uint64_t sub_D140(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_D188(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PatternStoreValue(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_D1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PatternStoreValue(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_D250(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PatternStoreValue(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_D2B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    Swift::UInt v10 = sub_31090();
    swift_bridgeObjectRelease();
    sub_31220(v10);
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_31090();
    swift_bridgeObjectRelease();
    if (!v3) {
      return;
    }
  }
  else
  {
    sub_31220(*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)));
    uint64_t v3 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
    if (!v3) {
      return;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    JUMPOUT(0xD958);
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
    if (sub_2AFC4(a2))
    {
      uint64_t v4 = (uint64_t *)(a2 + 32);
      do
      {
        uint64_t v5 = *v4;
        swift_retain();
        swift_bridgeObjectRetain();
        sub_30CF0();
        swift_bridgeObjectRelease();
        sub_31220(*(unsigned __int8 *)(v5 + 40));
        sub_30CF0();
        swift_release();
        swift_bridgeObjectRelease();
        ++v4;
        --v3;
      }
      while (v3);
    }
    else
    {
      uint64_t v8 = 0;
      do
      {
        uint64_t v9 = sub_30FB0();
        swift_bridgeObjectRetain();
        sub_30CF0();
        swift_bridgeObjectRelease();
        sub_31220(*(unsigned __int8 *)(v9 + 40));
        ++v8;
        sub_30CF0();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      while (v3 != v8);
    }
  }
  else
  {
    uint64_t v6 = (uint64_t *)(a2 + 32);
    do
    {
      uint64_t v7 = *v6;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_30CF0();
      swift_bridgeObjectRelease();
      sub_31220(*(unsigned __int8 *)(v7 + 40));
      sub_30CF0();
      swift_release();
      swift_bridgeObjectRelease();
      ++v6;
      --v3;
    }
    while (v3);
  }
}

uint64_t sub_DA00()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_DA38(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

BOOL sub_DA74(void *a1)
{
  return sub_8798(a1, *(void *)(v1 + 16));
}

uint64_t sub_DA7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_DA8C()
{
  return swift_release();
}

id sub_DA94()
{
  return sub_8CFC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_DAB0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PatternStoreValue(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_DB0C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_D140(&qword_3D9D0);
    sub_DB8C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_DB8C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PatternItem();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_DBD0(uint64_t a1)
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

uint64_t sub_DC5C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

BOOL sub_DC9C(void *a1)
{
  return sub_7D1C(a1, *(void *)(v1 + 16));
}

uint64_t sub_DCA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4F90(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_DD08()
{
  sub_5708(*(void *)(v0 + 16), *(id **)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_DD28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4F90(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_DD84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4F90(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_DDF0()
{
  return sub_DA94();
}

id static RECTIFISelfPatternStore.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_30CA0();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

void *sub_DE74()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_DE80@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for RECTIFISelfPatternStore();
  uint64_t result = sub_30F90();
  *a1 = result;
  return result;
}

BOOL sub_DEC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)&_swiftEmptySetSingleton;
  uint64_t v44 = &_swiftEmptySetSingleton;
  swift_beginAccess();
  uint64_t v35 = a2;
  uint64_t v37 = *(void *)(*(void *)a2 + 16);
  if (!v37) {
    goto LABEL_78;
  }
  uint64_t v38 = *(void *)a2 + 32;
  uint64_t v7 = a3 + 32;
  uint64_t v8 = swift_bridgeObjectRetain();
  unint64_t v9 = 0;
  uint64_t v41 = a3 + 32;
  uint64_t v36 = v8;
  while (2)
  {
    if (v9 >= *(void *)(v8 + 16)) {
      goto LABEL_85;
    }
    uint64_t v13 = (unint64_t *)(v38 + 16 * v9);
    unint64_t v15 = *v13;
    unint64_t v14 = v13[1];
    unint64_t v43 = &_swiftEmptySetSingleton;
    uint64_t v16 = v14 - 1;
    if (__OFSUB__(v14, 1))
    {
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
      JUMPOUT(0xE524);
    }
    char v17 = 0;
    unint64_t v39 = v9 + 1;
    unint64_t v40 = v9;
    while (1)
    {
      unint64_t v19 = v16;
      if (v16 <= 0)
      {
        if ((v16 != 0) | v17 & 1) {
          goto LABEL_75;
        }
        uint64_t v16 = 0;
        char v17 = 1;
        if ((v15 & 0x8000000000000000) != 0)
        {
LABEL_82:
          __break(1u);
LABEL_83:
          __break(1u);
LABEL_84:
          __break(1u);
LABEL_85:
          __break(1u);
          goto LABEL_86;
        }
      }
      else
      {
        --v16;
        if ((v15 & 0x8000000000000000) != 0) {
          goto LABEL_82;
        }
      }
      if (v15 >= *(void *)(a3 + 16)) {
        goto LABEL_83;
      }
      uint64_t v20 = *(void *)(v7 + 8 * v15);
      if ((v20 & 0xC000000000000001) != 0) {
        break;
      }
      if (v19 >= *(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8))) {
        goto LABEL_84;
      }
      uint64_t v21 = *(void *)(v20 + 8 * v19 + 32);
      swift_retain();
      if (a1) {
        goto LABEL_19;
      }
LABEL_9:
      sub_2C568(v42, v21);
      swift_release();
    }
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_30FB0();
    swift_bridgeObjectRelease();
    if (!a1) {
      goto LABEL_9;
    }
LABEL_19:
    BOOL v22 = *(void *)(v21 + 24) == *(void *)(a1 + 24) && *(void *)(v21 + 32) == *(void *)(a1 + 32);
    if (!v22 && (sub_311C0() & 1) == 0 || *(unsigned __int8 *)(v21 + 40) != *(unsigned __int8 *)(a1 + 40)) {
      goto LABEL_9;
    }
    unint64_t v23 = 0x8000000000032B10;
    uint64_t v24 = a3;
    unint64_t v25 = 0xD000000000000017;
    switch(*(unsigned char *)(v21 + 41))
    {
      case 1:
        unint64_t v23 = 0xE300000000000000;
        unint64_t v25 = 5786702;
        break;
      case 2:
        unint64_t v23 = 0xE300000000000000;
        unint64_t v25 = 4801877;
        break;
      case 3:
        unint64_t v23 = 0xE800000000000000;
        unint64_t v25 = 0x505041454E4F4850;
        break;
      case 4:
        unint64_t v25 = 0x414547415353454DLL;
        unint64_t v23 = 0xEA00000000005050;
        break;
      case 5:
        unint64_t v25 = 0x5245444E494D4552;
        unsigned int v26 = 1096041811;
        goto LABEL_36;
      case 6:
        break;
      case 7:
        unint64_t v25 = 0x4552434D52414C41;
        goto LABEL_35;
      case 8:
        unint64_t v23 = 0xEE00505041454C47;
        unint64_t v25 = 0x474F544D52414C41;
        break;
      case 9:
        unint64_t v25 = 0x4450554D52414C41;
LABEL_35:
        unsigned int v26 = 1095062593;
LABEL_36:
        unint64_t v23 = v26 | 0xEE00505000000000;
        break;
      case 0xA:
        unint64_t v25 = 0x4145524345544F4ELL;
        goto LABEL_39;
      case 0xB:
        unint64_t v25 = 0x454C454445544F4ELL;
LABEL_39:
        unint64_t v23 = 0xED00005050414554;
        break;
      case 0xC:
        unint64_t v25 = 0x5041594D444E4946;
        unint64_t v23 = 0xE900000000000050;
        break;
      case 0xD:
        unint64_t v23 = 0xE700000000000000;
        unint64_t v25 = 0x4E574F4E4B4E55;
        break;
      default:
        unint64_t v23 = 0xE300000000000000;
        unint64_t v25 = 5395265;
        break;
    }
    unint64_t v27 = 0x8000000000032B10;
    unint64_t v28 = 0xD000000000000017;
    switch(*(unsigned char *)(a1 + 41))
    {
      case 1:
        unint64_t v27 = 0xE300000000000000;
        if (v25 != 5786702) {
          goto LABEL_8;
        }
        goto LABEL_67;
      case 2:
        unint64_t v27 = 0xE300000000000000;
        if (v25 != 4801877) {
          goto LABEL_8;
        }
        goto LABEL_67;
      case 3:
        unint64_t v27 = 0xE800000000000000;
        if (v25 != 0x505041454E4F4850) {
          goto LABEL_8;
        }
        goto LABEL_67;
      case 4:
        unint64_t v27 = 0xEA00000000005050;
        if (v25 != 0x414547415353454DLL) {
          goto LABEL_8;
        }
        goto LABEL_67;
      case 5:
        uint64_t v29 = 0x5245444E494D4552;
        unsigned int v30 = 1096041811;
        goto LABEL_59;
      case 6:
        goto LABEL_66;
      case 7:
        uint64_t v29 = 0x4552434D52414C41;
        goto LABEL_58;
      case 8:
        unint64_t v27 = 0xEE00505041454C47;
        if (v25 != 0x474F544D52414C41) {
          goto LABEL_8;
        }
        goto LABEL_67;
      case 9:
        uint64_t v29 = 0x4450554D52414C41;
LABEL_58:
        unsigned int v30 = 1095062593;
LABEL_59:
        unint64_t v27 = v30 | 0xEE00505000000000;
        if (v25 != v29) {
          goto LABEL_8;
        }
        goto LABEL_67;
      case 0xA:
        uint64_t v31 = 0x4145524345544F4ELL;
        goto LABEL_63;
      case 0xB:
        uint64_t v31 = 0x454C454445544F4ELL;
LABEL_63:
        unint64_t v27 = 0xED00005050414554;
        if (v25 != v31) {
          goto LABEL_8;
        }
        goto LABEL_67;
      case 0xC:
        unint64_t v28 = 0x5041594D444E4946;
        unint64_t v27 = 0xE900000000000050;
LABEL_66:
        if (v25 == v28) {
          goto LABEL_67;
        }
        goto LABEL_8;
      case 0xD:
        unint64_t v27 = 0xE700000000000000;
        if (v25 != 0x4E574F4E4B4E55) {
          goto LABEL_8;
        }
        goto LABEL_67;
      default:
        unint64_t v27 = 0xE300000000000000;
        if (v25 != 5395265) {
          goto LABEL_8;
        }
LABEL_67:
        if (v23 != v27)
        {
LABEL_8:
          char v18 = sub_311C0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          a3 = v24;
          uint64_t v7 = v41;
          if (v18) {
            goto LABEL_73;
          }
          goto LABEL_9;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        a3 = v24;
        uint64_t v7 = v41;
LABEL_73:
        swift_beginAccess();
        sub_E848();
        if (*(void *)(*(void *)v35 + 16) <= v40) {
          goto LABEL_87;
        }
        uint64_t v32 = *(void *)v35 + 16 * v40;
        *(void *)(v32 + 32) = v15;
        *(void *)(v32 + 40) = v19;
        swift_endAccess();
        swift_release();
LABEL_75:
        if (v40)
        {
          uint64_t v10 = (uint64_t)v44;
          uint64_t v11 = swift_bridgeObjectRetain();
          BOOL v12 = sub_EA10(v11, v10);
          swift_bridgeObjectRelease_n();
          uint64_t v44 = v12;
        }
        else
        {
          sub_E594((uint64_t)v43);
        }
        uint64_t v8 = v36;
        unint64_t v9 = v39;
        if (v39 != v37) {
          continue;
        }
        swift_bridgeObjectRelease();
        unint64_t v6 = (unint64_t)v44;
LABEL_78:
        if ((v6 & 0xC000000000000001) != 0) {
          uint64_t v33 = sub_30F00();
        }
        else {
          uint64_t v33 = *(void *)(v6 + 16);
        }
        swift_bridgeObjectRelease();
        return v33 != 0;
    }
  }
}

uint64_t sub_E594(uint64_t result)
{
  uint64_t v1 = result;
  if ((result & 0xC000000000000001) != 0)
  {
    sub_30EF0();
    type metadata accessor for PatternItem();
    sub_10FC8();
    uint64_t result = sub_30E00();
    uint64_t v1 = v17[1];
    uint64_t v16 = v17[2];
    uint64_t v2 = v17[3];
    uint64_t v3 = v17[4];
    unint64_t v4 = v17[5];
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = -1 << *(unsigned char *)(result + 32);
    uint64_t v16 = result + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(result + 56);
  }
  int64_t v8 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v4)
    {
      uint64_t v9 = (v4 - 1) & v4;
      unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
      uint64_t v11 = v3;
      goto LABEL_29;
    }
    int64_t v13 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v13 >= v8) {
      return sub_11020();
    }
    unint64_t v14 = *(void *)(v16 + 8 * v13);
    uint64_t v11 = v3 + 1;
    if (!v14)
    {
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v8) {
        return sub_11020();
      }
      unint64_t v14 = *(void *)(v16 + 8 * v11);
      if (!v14)
      {
        uint64_t v11 = v3 + 3;
        if (v3 + 3 >= v8) {
          return sub_11020();
        }
        unint64_t v14 = *(void *)(v16 + 8 * v11);
        if (!v14)
        {
          uint64_t v11 = v3 + 4;
          if (v3 + 4 >= v8) {
            return sub_11020();
          }
          unint64_t v14 = *(void *)(v16 + 8 * v11);
          if (!v14)
          {
            uint64_t v11 = v3 + 5;
            if (v3 + 5 >= v8) {
              return sub_11020();
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
                  goto LABEL_28;
                }
              }
              return sub_11020();
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v9 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_29:
    uint64_t v12 = *(void *)(*(void *)(v1 + 48) + 8 * v10);
    swift_retain();
    if (!v12) {
      return sub_11020();
    }
    while (1)
    {
      sub_2C568(v17, v12);
      uint64_t result = swift_release();
      uint64_t v3 = v11;
      unint64_t v4 = v9;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_30F20())
      {
        type metadata accessor for PatternItem();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        uint64_t v12 = v17[0];
        swift_unknownObjectRelease();
        uint64_t v11 = v3;
        uint64_t v9 = v4;
        if (v12) {
          continue;
        }
      }
      return sub_11020();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_E810()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ClosedPatternUtil()
{
  return self;
}

uint64_t sub_E848()
{
  uint64_t v1 = (void *)*v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = (uint64_t)v1;
  if (!result)
  {
    uint64_t result = (uint64_t)sub_2F354(v1);
    *uint64_t v0 = result;
  }
  return result;
}

void *sub_E888(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_F258((uint64_t *)((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3, a2);
    swift_release();
  }
  else
  {
    int64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_F258((uint64_t *)v8, v5, v3, a2);
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

void *sub_EA10(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1 & 0xC000000000000001;
  if ((a2 & 0xC000000000000001) != 0)
  {
    if (!v3)
    {
      sub_30EF0();
      if (!sub_30F20())
      {
LABEL_78:
        swift_release();
        return &_swiftEmptySetSingleton;
      }
      type metadata accessor for PatternItem();
      uint64_t v7 = a1 + 56;
LABEL_15:
      swift_dynamicCast();
      if (!*(void *)(a1 + 16)) {
        goto LABEL_13;
      }
      sub_31210();
      swift_bridgeObjectRetain();
      sub_30CF0();
      swift_bridgeObjectRelease();
      sub_31220(*(unsigned __int8 *)(v23 + 40));
      sub_30CF0();
      swift_bridgeObjectRelease();
      Swift::Int v8 = sub_31230();
      uint64_t v9 = -1 << *(unsigned char *)(a1 + 32);
      unint64_t v10 = v8 & ~v9;
      if (((*(void *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
      {
LABEL_13:
        swift_release();
        goto LABEL_14;
      }
      uint64_t v11 = ~v9;
      while (1)
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8 * v10);
        BOOL v14 = *(void *)(v13 + 24) == *(void *)(v23 + 24) && *(void *)(v13 + 32) == *(void *)(v23 + 32);
        if (v14 || (sub_311C0()) && *(unsigned __int8 *)(v13 + 40) == *(unsigned __int8 *)(v23 + 40))
        {
          unint64_t v15 = 0x8000000000032B10;
          unint64_t v16 = 0xD000000000000017;
          switch(*(unsigned char *)(v13 + 41))
          {
            case 1:
              unint64_t v15 = 0xE300000000000000;
              unint64_t v16 = 5786702;
              break;
            case 2:
              unint64_t v15 = 0xE300000000000000;
              unint64_t v16 = 4801877;
              break;
            case 3:
              unint64_t v15 = 0xE800000000000000;
              unint64_t v16 = 0x505041454E4F4850;
              break;
            case 4:
              unint64_t v16 = 0x414547415353454DLL;
              unint64_t v15 = 0xEA00000000005050;
              break;
            case 5:
              unint64_t v16 = 0x5245444E494D4552;
              unsigned int v17 = 1096041811;
              goto LABEL_37;
            case 6:
              break;
            case 7:
              unint64_t v16 = 0x4552434D52414C41;
              goto LABEL_36;
            case 8:
              unint64_t v15 = 0xEE00505041454C47;
              unint64_t v16 = 0x474F544D52414C41;
              break;
            case 9:
              unint64_t v16 = 0x4450554D52414C41;
LABEL_36:
              unsigned int v17 = 1095062593;
LABEL_37:
              unint64_t v15 = v17 | 0xEE00505000000000;
              break;
            case 0xA:
              unint64_t v16 = 0x4145524345544F4ELL;
              goto LABEL_40;
            case 0xB:
              unint64_t v16 = 0x454C454445544F4ELL;
LABEL_40:
              unint64_t v15 = 0xED00005050414554;
              break;
            case 0xC:
              unint64_t v16 = 0x5041594D444E4946;
              unint64_t v15 = 0xE900000000000050;
              break;
            case 0xD:
              unint64_t v15 = 0xE700000000000000;
              unint64_t v16 = 0x4E574F4E4B4E55;
              break;
            default:
              unint64_t v15 = 0xE300000000000000;
              unint64_t v16 = 5395265;
              break;
          }
          unint64_t v18 = 0x8000000000032B10;
          unint64_t v19 = 0xD000000000000017;
          switch(*(unsigned char *)(v23 + 41))
          {
            case 1:
              unint64_t v18 = 0xE300000000000000;
              if (v16 == 5786702) {
                goto LABEL_68;
              }
              goto LABEL_18;
            case 2:
              unint64_t v18 = 0xE300000000000000;
              if (v16 != 4801877) {
                goto LABEL_18;
              }
              goto LABEL_68;
            case 3:
              unint64_t v18 = 0xE800000000000000;
              if (v16 != 0x505041454E4F4850) {
                goto LABEL_18;
              }
              goto LABEL_68;
            case 4:
              unint64_t v18 = 0xEA00000000005050;
              if (v16 != 0x414547415353454DLL) {
                goto LABEL_18;
              }
              goto LABEL_68;
            case 5:
              uint64_t v20 = 0x5245444E494D4552;
              unsigned int v21 = 1096041811;
              goto LABEL_60;
            case 6:
              goto LABEL_67;
            case 7:
              uint64_t v20 = 0x4552434D52414C41;
              goto LABEL_59;
            case 8:
              unint64_t v18 = 0xEE00505041454C47;
              if (v16 != 0x474F544D52414C41) {
                goto LABEL_18;
              }
              goto LABEL_68;
            case 9:
              uint64_t v20 = 0x4450554D52414C41;
LABEL_59:
              unsigned int v21 = 1095062593;
LABEL_60:
              unint64_t v18 = v21 | 0xEE00505000000000;
              if (v16 != v20) {
                goto LABEL_18;
              }
              goto LABEL_68;
            case 0xA:
              uint64_t v22 = 0x4145524345544F4ELL;
              goto LABEL_64;
            case 0xB:
              uint64_t v22 = 0x454C454445544F4ELL;
LABEL_64:
              unint64_t v18 = 0xED00005050414554;
              if (v16 != v22) {
                goto LABEL_18;
              }
              goto LABEL_68;
            case 0xC:
              unint64_t v19 = 0x5041594D444E4946;
              unint64_t v18 = 0xE900000000000050;
LABEL_67:
              if (v16 == v19) {
                goto LABEL_68;
              }
              goto LABEL_18;
            case 0xD:
              unint64_t v18 = 0xE700000000000000;
              if (v16 != 0x4E574F4E4B4E55) {
                goto LABEL_18;
              }
              goto LABEL_68;
            default:
              unint64_t v18 = 0xE300000000000000;
              if (v16 != 5395265) {
                goto LABEL_18;
              }
LABEL_68:
              if (v15 == v18)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
LABEL_72:
                if (*((void *)&_swiftEmptySetSingleton + 3) <= *((void *)&_swiftEmptySetSingleton + 2)) {
                  sub_2D25C();
                }
                sub_2DAB4(v23, (uint64_t)&_swiftEmptySetSingleton);
LABEL_14:
                if (!sub_30F20()) {
                  goto LABEL_78;
                }
                goto LABEL_15;
              }
LABEL_18:
              char v12 = sub_311C0();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v12) {
                goto LABEL_72;
              }
              break;
          }
        }
        unint64_t v10 = (v10 + 1) & v11;
        if (((*(void *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
          goto LABEL_13;
        }
      }
    }
    if (a2 < 0) {
      uint64_t v4 = a2;
    }
    else {
      uint64_t v4 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t v5 = sub_30F00();
    a2 = (uint64_t)sub_2D140(v4, v5);
    goto LABEL_8;
  }
  if (v3)
  {
LABEL_8:
    return sub_E888(a1, a2);
  }

  return sub_FC1C(a1, a2);
}

void *sub_F258(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  if ((a3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_30EF0();
    type metadata accessor for PatternItem();
    sub_10FC8();
    sub_30E00();
    uint64_t v5 = v50;
    uint64_t v46 = v51;
    uint64_t v7 = v52;
    int64_t v6 = v53;
    unint64_t v8 = v54;
  }
  else
  {
    uint64_t v9 = -1 << *(unsigned char *)(a3 + 32);
    uint64_t v46 = a3 + 56;
    uint64_t v7 = ~v9;
    uint64_t v10 = -v9;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v8 = v11 & *(void *)(a3 + 56);
    swift_bridgeObjectRetain();
    int64_t v6 = 0;
  }
  uint64_t v43 = 0;
  int64_t v45 = (unint64_t)(v7 + 64) >> 6;
  uint64_t v12 = a4 + 56;
  uint64_t v47 = v5;
  while (2)
  {
    int64_t v13 = v6;
    unint64_t v14 = v8;
    while (1)
    {
LABEL_10:
      if (v5 < 0)
      {
        if (!sub_30F20()) {
          goto LABEL_95;
        }
        type metadata accessor for PatternItem();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        uint64_t v18 = v49;
        swift_unknownObjectRelease();
        int64_t v17 = v13;
        uint64_t v15 = v14;
        if (!v49) {
          goto LABEL_95;
        }
      }
      else
      {
        if (v14)
        {
          uint64_t v15 = (v14 - 1) & v14;
          unint64_t v16 = __clz(__rbit64(v14)) | (v13 << 6);
          int64_t v17 = v13;
        }
        else
        {
          int64_t v17 = v13 + 1;
          if (__OFADD__(v13, 1))
          {
            __break(1u);
            JUMPOUT(0xFB74);
          }
          if (v17 >= v45) {
            goto LABEL_95;
          }
          unint64_t v19 = *(void *)(v46 + 8 * v17);
          if (!v19)
          {
            int64_t v20 = v13 + 2;
            if (v13 + 2 >= v45) {
              goto LABEL_95;
            }
            unint64_t v19 = *(void *)(v46 + 8 * v20);
            if (v19) {
              goto LABEL_25;
            }
            int64_t v20 = v13 + 3;
            if (v13 + 3 >= v45) {
              goto LABEL_95;
            }
            unint64_t v19 = *(void *)(v46 + 8 * v20);
            if (v19) {
              goto LABEL_25;
            }
            int64_t v20 = v13 + 4;
            if (v13 + 4 >= v45) {
              goto LABEL_95;
            }
            unint64_t v19 = *(void *)(v46 + 8 * v20);
            if (v19)
            {
LABEL_25:
              int64_t v17 = v20;
            }
            else
            {
              int64_t v17 = v13 + 5;
              if (v13 + 5 >= v45) {
                goto LABEL_95;
              }
              unint64_t v19 = *(void *)(v46 + 8 * v17);
              if (!v19)
              {
                int64_t v39 = v13 + 6;
                do
                {
                  if (v45 == v39) {
                    goto LABEL_95;
                  }
                  unint64_t v19 = *(void *)(v46 + 8 * v39++);
                }
                while (!v19);
                int64_t v17 = v39 - 1;
              }
            }
          }
          uint64_t v15 = (v19 - 1) & v19;
          unint64_t v16 = __clz(__rbit64(v19)) + (v17 << 6);
        }
        uint64_t v18 = *(void *)(*(void *)(v5 + 48) + 8 * v16);
        swift_retain();
        if (!v18) {
          goto LABEL_95;
        }
      }
      unint64_t v48 = v15;
      sub_31210();
      swift_bridgeObjectRetain();
      sub_30CF0();
      swift_bridgeObjectRelease();
      sub_31220(*(unsigned __int8 *)(v18 + 40));
      sub_30CF0();
      swift_bridgeObjectRelease();
      Swift::Int v21 = sub_31230();
      uint64_t v22 = -1 << *(unsigned char *)(a4 + 32);
      unint64_t v23 = v21 & ~v22;
      if ((*(void *)(v12 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23)) {
        break;
      }
LABEL_9:
      swift_release();
      unint64_t v14 = v48;
      int64_t v13 = v17;
      uint64_t v5 = v47;
    }
    uint64_t v24 = ~v22;
    while (1)
    {
      uint64_t v26 = *(void *)(*(void *)(a4 + 48) + 8 * v23);
      BOOL v27 = *(void *)(v26 + 24) == *(void *)(v18 + 24) && *(void *)(v26 + 32) == *(void *)(v18 + 32);
      if (v27 || (sub_311C0()) && *(unsigned __int8 *)(v26 + 40) == *(unsigned __int8 *)(v18 + 40)) {
        break;
      }
LABEL_31:
      unint64_t v23 = (v23 + 1) & v24;
      if (((*(void *)(v12 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
        goto LABEL_9;
      }
    }
    uint64_t v28 = *(unsigned __int8 *)(v26 + 41);
    unint64_t v29 = 0x8000000000032B10;
    unint64_t v30 = 0xD000000000000017;
    switch(v28)
    {
      case 1:
        unint64_t v29 = 0xE300000000000000;
        unint64_t v30 = 5786702;
        break;
      case 2:
        unint64_t v29 = 0xE300000000000000;
        unint64_t v30 = 4801877;
        break;
      case 3:
        unint64_t v29 = 0xE800000000000000;
        unint64_t v30 = 0x505041454E4F4850;
        break;
      case 4:
        unint64_t v30 = 0x414547415353454DLL;
        unint64_t v29 = 0xEA00000000005050;
        break;
      case 5:
        unint64_t v30 = 0x5245444E494D4552;
        unsigned int v31 = 1096041811;
        goto LABEL_49;
      case 6:
        break;
      case 7:
        unint64_t v30 = 0x4552434D52414C41;
        goto LABEL_48;
      case 8:
        unint64_t v29 = 0xEE00505041454C47;
        unint64_t v30 = 0x474F544D52414C41;
        break;
      case 9:
        unint64_t v30 = 0x4450554D52414C41;
LABEL_48:
        unsigned int v31 = 1095062593;
LABEL_49:
        unint64_t v29 = v31 | 0xEE00505000000000;
        break;
      case 10:
        unint64_t v30 = 0x4145524345544F4ELL;
        goto LABEL_52;
      case 11:
        unint64_t v30 = 0x454C454445544F4ELL;
LABEL_52:
        unint64_t v29 = 0xED00005050414554;
        break;
      case 12:
        unint64_t v30 = 0x5041594D444E4946;
        unint64_t v29 = 0xE900000000000050;
        break;
      case 13:
        unint64_t v29 = 0xE700000000000000;
        unint64_t v30 = 0x4E574F4E4B4E55;
        break;
      default:
        unint64_t v29 = 0xE300000000000000;
        unint64_t v30 = 5395265;
        break;
    }
    unint64_t v32 = 0x8000000000032B10;
    unint64_t v33 = 0xD000000000000017;
    switch(*(unsigned char *)(v18 + 41))
    {
      case 1:
        unint64_t v32 = 0xE300000000000000;
        if (v30 != 5786702) {
          goto LABEL_30;
        }
        goto LABEL_80;
      case 2:
        unint64_t v32 = 0xE300000000000000;
        if (v30 != 4801877) {
          goto LABEL_30;
        }
        goto LABEL_80;
      case 3:
        unint64_t v32 = 0xE800000000000000;
        if (v30 != 0x505041454E4F4850) {
          goto LABEL_30;
        }
        goto LABEL_80;
      case 4:
        unint64_t v32 = 0xEA00000000005050;
        if (v30 != 0x414547415353454DLL) {
          goto LABEL_30;
        }
        goto LABEL_80;
      case 5:
        uint64_t v34 = 0x5245444E494D4552;
        unsigned int v35 = 1096041811;
        goto LABEL_72;
      case 6:
        goto LABEL_79;
      case 7:
        uint64_t v34 = 0x4552434D52414C41;
        goto LABEL_71;
      case 8:
        unint64_t v32 = 0xEE00505041454C47;
        if (v30 != 0x474F544D52414C41) {
          goto LABEL_30;
        }
        goto LABEL_80;
      case 9:
        uint64_t v34 = 0x4450554D52414C41;
LABEL_71:
        unsigned int v35 = 1095062593;
LABEL_72:
        unint64_t v32 = v35 | 0xEE00505000000000;
        if (v30 != v34) {
          goto LABEL_30;
        }
        goto LABEL_80;
      case 0xA:
        uint64_t v36 = 0x4145524345544F4ELL;
        goto LABEL_76;
      case 0xB:
        uint64_t v36 = 0x454C454445544F4ELL;
LABEL_76:
        unint64_t v32 = 0xED00005050414554;
        if (v30 != v36) {
          goto LABEL_30;
        }
        goto LABEL_80;
      case 0xC:
        unint64_t v33 = 0x5041594D444E4946;
        unint64_t v32 = 0xE900000000000050;
LABEL_79:
        if (v30 == v33) {
          goto LABEL_80;
        }
        goto LABEL_30;
      case 0xD:
        unint64_t v32 = 0xE700000000000000;
        if (v30 != 0x4E574F4E4B4E55) {
          goto LABEL_30;
        }
        goto LABEL_80;
      default:
        unint64_t v32 = 0xE300000000000000;
        if (v30 != 5395265) {
          goto LABEL_30;
        }
LABEL_80:
        if (v29 != v32)
        {
LABEL_30:
          char v25 = sub_311C0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v25) {
            goto LABEL_84;
          }
          goto LABEL_31;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_84:
        swift_release();
        uint64_t v37 = (v23 >> 3) & 0x1FFFFFFFFFFFFFF8;
        uint64_t v38 = *(uint64_t *)((char *)a1 + v37);
        *(uint64_t *)((char *)a1 + v37) = v38 | (1 << v23);
        unint64_t v8 = v48;
        int64_t v6 = v17;
        int64_t v13 = v17;
        unint64_t v14 = v48;
        uint64_t v5 = v47;
        if ((v38 & (1 << v23)) != 0) {
          goto LABEL_10;
        }
        if (!__OFADD__(v43++, 1)) {
          continue;
        }
        __break(1u);
LABEL_95:
        sub_11020();
        swift_retain();
        return sub_1A468(a1, a2, v43, a4);
    }
  }
}

void *sub_FC1C(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_FDA4((uint64_t *)((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, a2, v3);
    swift_release();
  }
  else
  {
    unint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_FDA4((uint64_t *)v8, v5, a2, v3);
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

void *sub_FDA4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  size_t v6 = "REMINDERSETATTRIBUTEAPP";
  if (*(void *)(a4 + 16) >= *(void *)(a3 + 16)) {
    goto LABEL_85;
  }
  int64_t v7 = 0;
  uint64_t v62 = a4 + 56;
  uint64_t v64 = 0;
  uint64_t v8 = 1 << *(unsigned char *)(a4 + 32);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(a4 + 56);
  int64_t v65 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = a3 + 56;
LABEL_7:
  while (v10)
  {
    unint64_t v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v13 = v12 | (v7 << 6);
LABEL_20:
    uint64_t v17 = *(void *)(*(void *)(a4 + 48) + 8 * v13);
    sub_31210();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_30CF0();
    swift_bridgeObjectRelease();
    sub_31220(*(unsigned __int8 *)(v17 + 40));
    sub_30CF0();
    swift_bridgeObjectRelease();
    Swift::Int v18 = sub_31230();
    uint64_t v5 = a3;
    uint64_t v19 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v11 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
    {
      swift_release();
      continue;
    }
    unint64_t v67 = v10;
    int64_t v69 = v7;
    uint64_t v21 = ~v19;
    while (1)
    {
      uint64_t v23 = *(void *)(*(void *)(v5 + 48) + 8 * v20);
      BOOL v24 = *(void *)(v23 + 24) == *(void *)(v17 + 24) && *(void *)(v23 + 32) == *(void *)(v17 + 32);
      if (v24 || (sub_311C0()) && *(unsigned __int8 *)(v23 + 40) == *(unsigned __int8 *)(v17 + 40)) {
        break;
      }
LABEL_28:
      unint64_t v20 = (v20 + 1) & v21;
      if (((*(void *)(v11 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      {
        swift_release();
        unint64_t v10 = v67;
        int64_t v7 = v69;
        goto LABEL_7;
      }
    }
    unint64_t v25 = 0x8000000000032B10;
    unint64_t v26 = 0xD000000000000017;
    switch(*(unsigned char *)(v23 + 41))
    {
      case 1:
        unint64_t v25 = 0xE300000000000000;
        unint64_t v26 = 5786702;
        break;
      case 2:
        unint64_t v25 = 0xE300000000000000;
        unint64_t v26 = 4801877;
        break;
      case 3:
        unint64_t v25 = 0xE800000000000000;
        unint64_t v26 = 0x505041454E4F4850;
        break;
      case 4:
        unint64_t v26 = 0x414547415353454DLL;
        unint64_t v25 = 0xEA00000000005050;
        break;
      case 5:
        unint64_t v26 = 0x5245444E494D4552;
        unsigned int v27 = 1096041811;
        goto LABEL_46;
      case 6:
        break;
      case 7:
        unint64_t v26 = 0x4552434D52414C41;
        goto LABEL_45;
      case 8:
        unint64_t v25 = 0xEE00505041454C47;
        unint64_t v26 = 0x474F544D52414C41;
        break;
      case 9:
        unint64_t v26 = 0x4450554D52414C41;
LABEL_45:
        unsigned int v27 = 1095062593;
LABEL_46:
        unint64_t v25 = v27 | 0xEE00505000000000;
        break;
      case 0xA:
        unint64_t v26 = 0x4145524345544F4ELL;
        goto LABEL_49;
      case 0xB:
        unint64_t v26 = 0x454C454445544F4ELL;
LABEL_49:
        unint64_t v25 = 0xED00005050414554;
        break;
      case 0xC:
        unint64_t v26 = 0x5041594D444E4946;
        unint64_t v25 = 0xE900000000000050;
        break;
      case 0xD:
        unint64_t v25 = 0xE700000000000000;
        unint64_t v26 = 0x4E574F4E4B4E55;
        break;
      default:
        unint64_t v25 = 0xE300000000000000;
        unint64_t v26 = 5395265;
        break;
    }
    unint64_t v28 = 0x8000000000032B10;
    unint64_t v29 = 0xD000000000000017;
    switch(*(unsigned char *)(v17 + 41))
    {
      case 1:
        unint64_t v28 = 0xE300000000000000;
        if (v26 != 5786702) {
          goto LABEL_27;
        }
        goto LABEL_77;
      case 2:
        unint64_t v28 = 0xE300000000000000;
        if (v26 != 4801877) {
          goto LABEL_27;
        }
        goto LABEL_77;
      case 3:
        unint64_t v28 = 0xE800000000000000;
        if (v26 != 0x505041454E4F4850) {
          goto LABEL_27;
        }
        goto LABEL_77;
      case 4:
        unint64_t v28 = 0xEA00000000005050;
        if (v26 != 0x414547415353454DLL) {
          goto LABEL_27;
        }
        goto LABEL_77;
      case 5:
        uint64_t v30 = 0x5245444E494D4552;
        unsigned int v31 = 1096041811;
        goto LABEL_69;
      case 6:
        goto LABEL_76;
      case 7:
        uint64_t v30 = 0x4552434D52414C41;
        goto LABEL_68;
      case 8:
        unint64_t v28 = 0xEE00505041454C47;
        if (v26 != 0x474F544D52414C41) {
          goto LABEL_27;
        }
        goto LABEL_77;
      case 9:
        uint64_t v30 = 0x4450554D52414C41;
LABEL_68:
        unsigned int v31 = 1095062593;
LABEL_69:
        unint64_t v28 = v31 | 0xEE00505000000000;
        if (v26 != v30) {
          goto LABEL_27;
        }
        goto LABEL_77;
      case 0xA:
        uint64_t v32 = 0x4145524345544F4ELL;
        goto LABEL_73;
      case 0xB:
        uint64_t v32 = 0x454C454445544F4ELL;
LABEL_73:
        unint64_t v28 = 0xED00005050414554;
        if (v26 != v32) {
          goto LABEL_27;
        }
        goto LABEL_77;
      case 0xC:
        unint64_t v29 = 0x5041594D444E4946;
        unint64_t v28 = 0xE900000000000050;
LABEL_76:
        if (v26 == v29) {
          goto LABEL_77;
        }
        goto LABEL_27;
      case 0xD:
        unint64_t v28 = 0xE700000000000000;
        if (v26 != 0x4E574F4E4B4E55) {
          goto LABEL_27;
        }
        goto LABEL_77;
      default:
        unint64_t v28 = 0xE300000000000000;
        if (v26 != 5395265) {
          goto LABEL_27;
        }
LABEL_77:
        if (v25 != v28)
        {
LABEL_27:
          char v22 = sub_311C0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v5 = a3;
          if (v22) {
            goto LABEL_82;
          }
          goto LABEL_28;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v5 = a3;
LABEL_82:
        swift_release();
        *(uint64_t *)((char *)a1 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
        BOOL v14 = __OFADD__(v64, 1);
        size_t v6 = (const char *)++v64;
        unint64_t v10 = v67;
        int64_t v7 = v69;
        if (v14)
        {
          __break(1u);
LABEL_85:
          int64_t v33 = 0;
          uint64_t v61 = v5 + 56;
          uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
          if (v34 < 64) {
            uint64_t v35 = ~(-1 << v34);
          }
          else {
            uint64_t v35 = -1;
          }
          unint64_t v36 = v35 & *(void *)(v5 + 56);
          int64_t v63 = (unint64_t)(v34 + 63) >> 6;
          uint64_t v64 = 0;
          uint64_t v37 = a4 + 56;
          uint64_t v38 = v6 - 32;
LABEL_91:
          while (2)
          {
            if (v36)
            {
              uint64_t v70 = (v36 - 1) & v36;
              unint64_t v39 = __clz(__rbit64(v36)) | (v33 << 6);
            }
            else
            {
              BOOL v14 = __OFADD__(v33++, 1);
              if (v14) {
                goto LABEL_171;
              }
              if (v33 >= v63) {
                goto LABEL_169;
              }
              unint64_t v40 = *(void *)(v61 + 8 * v33);
              if (!v40)
              {
                int64_t v41 = v33 + 1;
                if (v33 + 1 >= v63) {
                  goto LABEL_169;
                }
                unint64_t v40 = *(void *)(v61 + 8 * v41);
                if (!v40)
                {
                  int64_t v41 = v33 + 2;
                  if (v33 + 2 >= v63) {
                    goto LABEL_169;
                  }
                  unint64_t v40 = *(void *)(v61 + 8 * v41);
                  if (!v40)
                  {
                    int64_t v41 = v33 + 3;
                    if (v33 + 3 >= v63) {
                      goto LABEL_169;
                    }
                    unint64_t v40 = *(void *)(v61 + 8 * v41);
                    if (!v40)
                    {
                      while (1)
                      {
                        int64_t v33 = v41 + 1;
                        if (__OFADD__(v41, 1)) {
                          break;
                        }
                        if (v33 >= v63) {
                          goto LABEL_169;
                        }
                        unint64_t v40 = *(void *)(v61 + 8 * v33);
                        ++v41;
                        if (v40) {
                          goto LABEL_103;
                        }
                      }
LABEL_173:
                      __break(1u);
                      JUMPOUT(0x10D30);
                    }
                  }
                }
                int64_t v33 = v41;
              }
LABEL_103:
              uint64_t v70 = (v40 - 1) & v40;
              unint64_t v39 = __clz(__rbit64(v40)) + (v33 << 6);
            }
            unint64_t v68 = v39;
            uint64_t v42 = *(void *)(*(void *)(v5 + 48) + 8 * v39);
            sub_31210();
            swift_retain();
            swift_bridgeObjectRetain();
            sub_30CF0();
            swift_bridgeObjectRelease();
            sub_31220(*(unsigned __int8 *)(v42 + 40));
            sub_30CF0();
            swift_bridgeObjectRelease();
            Swift::Int v43 = sub_31230();
            uint64_t v44 = -1 << *(unsigned char *)(a4 + 32);
            unint64_t v45 = v43 & ~v44;
            if ((*(void *)(v37 + ((v45 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v45))
            {
              int64_t v66 = v33;
              uint64_t v46 = ~v44;
              do
              {
                uint64_t v48 = *(void *)(*(void *)(a4 + 48) + 8 * v45);
                BOOL v49 = *(void *)(v48 + 24) == *(void *)(v42 + 24) && *(void *)(v48 + 32) == *(void *)(v42 + 32);
                if (v49 || (sub_311C0()) && *(unsigned __int8 *)(v48 + 40) == *(unsigned __int8 *)(v42 + 40))
                {
                  unint64_t v50 = (unint64_t)v38 | 0x8000000000000000;
                  unint64_t v51 = 0xD000000000000017;
                  switch(*(unsigned char *)(v48 + 41))
                  {
                    case 1:
                      unint64_t v50 = 0xE300000000000000;
                      unint64_t v51 = 5786702;
                      break;
                    case 2:
                      unint64_t v50 = 0xE300000000000000;
                      unint64_t v51 = 4801877;
                      break;
                    case 3:
                      unint64_t v50 = 0xE800000000000000;
                      unint64_t v51 = 0x505041454E4F4850;
                      break;
                    case 4:
                      unint64_t v51 = 0x414547415353454DLL;
                      unint64_t v50 = 0xEA00000000005050;
                      break;
                    case 5:
                      unint64_t v51 = 0x5245444E494D4552;
                      unsigned int v52 = 1096041811;
                      goto LABEL_130;
                    case 6:
                      break;
                    case 7:
                      unint64_t v51 = 0x4552434D52414C41;
                      goto LABEL_129;
                    case 8:
                      unint64_t v50 = 0xEE00505041454C47;
                      unint64_t v51 = 0x474F544D52414C41;
                      break;
                    case 9:
                      unint64_t v51 = 0x4450554D52414C41;
LABEL_129:
                      unsigned int v52 = 1095062593;
LABEL_130:
                      unint64_t v50 = v52 | 0xEE00505000000000;
                      break;
                    case 0xA:
                      unint64_t v51 = 0x4145524345544F4ELL;
                      goto LABEL_133;
                    case 0xB:
                      unint64_t v51 = 0x454C454445544F4ELL;
LABEL_133:
                      unint64_t v50 = 0xED00005050414554;
                      break;
                    case 0xC:
                      unint64_t v51 = 0x5041594D444E4946;
                      unint64_t v50 = 0xE900000000000050;
                      break;
                    case 0xD:
                      unint64_t v50 = 0xE700000000000000;
                      unint64_t v51 = 0x4E574F4E4B4E55;
                      break;
                    default:
                      unint64_t v50 = 0xE300000000000000;
                      unint64_t v51 = 5395265;
                      break;
                  }
                  unint64_t v53 = (unint64_t)v38 | 0x8000000000000000;
                  unint64_t v54 = 0xD000000000000017;
                  switch(*(unsigned char *)(v42 + 41))
                  {
                    case 1:
                      unint64_t v53 = 0xE300000000000000;
                      if (v51 != 5786702) {
                        goto LABEL_111;
                      }
                      goto LABEL_161;
                    case 2:
                      unint64_t v53 = 0xE300000000000000;
                      if (v51 != 4801877) {
                        goto LABEL_111;
                      }
                      goto LABEL_161;
                    case 3:
                      unint64_t v53 = 0xE800000000000000;
                      if (v51 != 0x505041454E4F4850) {
                        goto LABEL_111;
                      }
                      goto LABEL_161;
                    case 4:
                      unint64_t v53 = 0xEA00000000005050;
                      if (v51 != 0x414547415353454DLL) {
                        goto LABEL_111;
                      }
                      goto LABEL_161;
                    case 5:
                      uint64_t v55 = 0x5245444E494D4552;
                      unsigned int v56 = 1096041811;
                      goto LABEL_153;
                    case 6:
                      goto LABEL_160;
                    case 7:
                      uint64_t v55 = 0x4552434D52414C41;
                      goto LABEL_152;
                    case 8:
                      unint64_t v53 = 0xEE00505041454C47;
                      if (v51 != 0x474F544D52414C41) {
                        goto LABEL_111;
                      }
                      goto LABEL_161;
                    case 9:
                      uint64_t v55 = 0x4450554D52414C41;
LABEL_152:
                      unsigned int v56 = 1095062593;
LABEL_153:
                      unint64_t v53 = v56 | 0xEE00505000000000;
                      if (v51 != v55) {
                        goto LABEL_111;
                      }
                      goto LABEL_161;
                    case 0xA:
                      uint64_t v57 = 0x4145524345544F4ELL;
                      goto LABEL_157;
                    case 0xB:
                      uint64_t v57 = 0x454C454445544F4ELL;
LABEL_157:
                      unint64_t v53 = 0xED00005050414554;
                      if (v51 != v57) {
                        goto LABEL_111;
                      }
                      goto LABEL_161;
                    case 0xC:
                      unint64_t v54 = 0x5041594D444E4946;
                      unint64_t v53 = 0xE900000000000050;
LABEL_160:
                      if (v51 == v54) {
                        goto LABEL_161;
                      }
                      goto LABEL_111;
                    case 0xD:
                      unint64_t v53 = 0xE700000000000000;
                      if (v51 != 0x4E574F4E4B4E55) {
                        goto LABEL_111;
                      }
                      goto LABEL_161;
                    default:
                      unint64_t v53 = 0xE300000000000000;
                      if (v51 != 5395265) {
                        goto LABEL_111;
                      }
LABEL_161:
                      if (v50 == v53)
                      {
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
LABEL_166:
                        swift_release();
                        int64_t v33 = v66;
                        *(uint64_t *)((char *)a1 + ((v68 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v68;
                        BOOL v14 = __OFADD__(v64++, 1);
                        uint64_t v5 = a3;
                        unint64_t v36 = v70;
                        if (v14)
                        {
                          __break(1u);
                          goto LABEL_169;
                        }
                        goto LABEL_91;
                      }
LABEL_111:
                      char v47 = sub_311C0();
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      if (v47) {
                        goto LABEL_166;
                      }
                      break;
                  }
                }
                unint64_t v45 = (v45 + 1) & v46;
              }
              while (((*(void *)(v37 + ((v45 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v45) & 1) != 0);
              swift_release();
              uint64_t v5 = a3;
              int64_t v33 = v66;
            }
            else
            {
              swift_release();
              uint64_t v5 = a3;
            }
            unint64_t v36 = v70;
            continue;
          }
        }
        break;
    }
  }
  BOOL v14 = __OFADD__(v7++, 1);
  if (v14)
  {
    __break(1u);
LABEL_171:
    __break(1u);
    goto LABEL_172;
  }
  if (v7 >= v65) {
    goto LABEL_169;
  }
  unint64_t v15 = *(void *)(v62 + 8 * v7);
  if (v15)
  {
LABEL_19:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v7 << 6);
    goto LABEL_20;
  }
  int64_t v16 = v7 + 1;
  if (v7 + 1 >= v65) {
    goto LABEL_169;
  }
  unint64_t v15 = *(void *)(v62 + 8 * v16);
  if (v15) {
    goto LABEL_18;
  }
  int64_t v16 = v7 + 2;
  if (v7 + 2 >= v65) {
    goto LABEL_169;
  }
  unint64_t v15 = *(void *)(v62 + 8 * v16);
  if (v15)
  {
LABEL_18:
    int64_t v7 = v16;
    goto LABEL_19;
  }
  int64_t v16 = v7 + 3;
  if (v7 + 3 < v65)
  {
    unint64_t v15 = *(void *)(v62 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v7 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          break;
        }
        if (v7 >= v65) {
          goto LABEL_169;
        }
        unint64_t v15 = *(void *)(v62 + 8 * v7);
        ++v16;
        if (v15) {
          goto LABEL_19;
        }
      }
LABEL_172:
      __break(1u);
      goto LABEL_173;
    }
    goto LABEL_18;
  }
LABEL_169:
  swift_retain();
  return sub_1A468(a1, a2, v64, v5);
}

uint64_t sub_10E80(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = a3;
  unint64_t v3 = *(void *)(a2 + 16);
  if (v3) {
    int64_t v4 = v3 - 1;
  }
  else {
    int64_t v4 = 0;
  }
  if (v3 < 2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
LABEL_15:
    swift_bridgeObjectRelease();
    return v5;
  }
  if (v4 - 1 < v3)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)(a2 + 8 * (v4 - 1) + 32);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    BOOL v8 = sub_DEC4(v7, (uint64_t)&v12, v6);
    uint64_t result = swift_release();
    if (v8)
    {
LABEL_13:
      swift_bridgeObjectRelease();
      uint64_t v5 = 1;
      goto LABEL_15;
    }
    unint64_t v9 = v3 + 1;
    while (1)
    {
      if (v9 == 3)
      {
        swift_bridgeObjectRelease();
        uint64_t v5 = 0;
        goto LABEL_15;
      }
      if (v4 < (uint64_t)(v9 - 3)) {
        break;
      }
      if ((uint64_t)(v9 - 4) >= (uint64_t)v3) {
        goto LABEL_17;
      }
      uint64_t v10 = swift_retain();
      BOOL v11 = sub_DEC4(v10, (uint64_t)&v12, v6);
      uint64_t result = swift_release();
      --v9;
      if (v11) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_10FC8()
{
  unint64_t result = qword_3DAD0;
  if (!qword_3DAD0)
  {
    type metadata accessor for PatternItem();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3DAD0);
  }
  return result;
}

uint64_t sub_11020()
{
  return swift_release();
}

id RECTIFIInfrequentPatternStore.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = [objc_allocWithZone(v2) initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

id RECTIFISelfPatternStore.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for RECTIFISelfPatternStore();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for RECTIFISelfPatternStore()
{
  return self;
}

id RECTIFISelfPatternStore.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RECTIFISelfPatternStore();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_11194(uint64_t a1)
{
  uint64_t v2 = a1 + 56;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 56);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v6) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v2 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v6) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v2 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v6) {
          return swift_release();
        }
        unint64_t v15 = *(void *)(v2 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v6) {
            return swift_release();
          }
          unint64_t v15 = *(void *)(v2 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v5 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_5:
    BOOL v11 = (Swift::Int *)(*(void *)(a1 + 48) + 16 * v10);
    Swift::Int v12 = *v11;
    Swift::Int v13 = v11[1];
    swift_bridgeObjectRetain_n();
    sub_2CC70(&v17, v12, v13);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v6) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v2 + 8 * v16);
  if (v15)
  {
    int64_t v8 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v8 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v8 >= v6) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v2 + 8 * v8);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_11330@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = sub_30490();
  if ((~*(void *)&v5 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v5 < 9.22337204e18)
  {
    uint64_t v6 = (uint64_t)v5;
    type metadata accessor for SequenceItem();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 48) = 0;
    *(void *)(v7 + 56) = 0;
    *(void *)(v7 + 64) = v3;
    *(void *)(v7 + 16) = v6;
    *(void *)(v7 + 24) = 0;
    *(void *)(v7 + 32) = 0xE000000000000000;
    *(_WORD *)(v7 + 40) = 0;
    *a2 = v7;
    return swift_bridgeObjectRetain();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ItemSequenceHelper.AsrFeatureProcessing()
{
  return self;
}

uint64_t type metadata accessor for ItemSequenceHelper.NlxFeatureProcessing()
{
  return self;
}

uint64_t sub_11430@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_30490();
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 < 9.22337204e18)
  {
    uint64_t v4 = (uint64_t)v3;
    swift_bridgeObjectRetain();
    sub_4F90(&qword_3DEC0);
    sub_126C8();
    uint64_t v5 = sub_30C80();
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    type metadata accessor for SequenceItem();
    uint64_t result = swift_allocObject();
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    *(void *)(result + 64) = _swiftEmptyArrayStorage;
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    *(void *)(result + 32) = v7;
    *(_WORD *)(result + 40) = 512;
    *a1 = result;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ItemSequenceHelper.UeiFeatureProcessing()
{
  return self;
}

uint64_t type metadata accessor for ItemSequenceHelper.PhoneCallFeatureProcessing()
{
  return self;
}

uint64_t type metadata accessor for ItemSequenceHelper.SmsFeatureProcessing()
{
  return self;
}

uint64_t sub_115AC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) < *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v3 = a2;
  uint64_t v4 = a1;
  uint64_t v31 = a2 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1 << -(char)v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v30 = (unint64_t)(63 - v5) >> 6;
  uint64_t v32 = a1 + 56;
  uint64_t result = swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v12)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (i << 6);
      int64_t v12 = i;
      if (!*(void *)(v4 + 16)) {
        goto LABEL_40;
      }
      goto LABEL_25;
    }
    int64_t v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v13 >= v30) {
      goto LABEL_41;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v13);
    int64_t v12 = i + 1;
    if (!v14)
    {
      int64_t v12 = i + 2;
      if (i + 2 >= v30) {
        goto LABEL_41;
      }
      unint64_t v14 = *(void *)(v31 + 8 * v12);
      if (!v14)
      {
        int64_t v12 = i + 3;
        if (i + 3 >= v30) {
          goto LABEL_41;
        }
        unint64_t v14 = *(void *)(v31 + 8 * v12);
        if (!v14) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    if (!*(void *)(v4 + 16))
    {
LABEL_40:
      uint64_t v2 = 0;
      goto LABEL_42;
    }
LABEL_25:
    uint64_t v16 = v3;
    Swift::Int v17 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v11);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_31210();
    swift_bridgeObjectRetain();
    sub_30CF0();
    Swift::Int v20 = sub_31230();
    uint64_t v21 = v4;
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = v20 & ~v22;
    if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v24 = *(void *)(v21 + 48);
    unint64_t v25 = (void *)(v24 + 16 * v23);
    BOOL v26 = *v25 == v19 && v25[1] == v18;
    if (!v26 && (sub_311C0() & 1) == 0)
    {
      uint64_t v27 = ~v22;
      while (1)
      {
        unint64_t v23 = (v23 + 1) & v27;
        if (((*(void *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
          break;
        }
        unint64_t v28 = (void *)(v24 + 16 * v23);
        BOOL v29 = *v28 == v19 && v28[1] == v18;
        if (v29 || (sub_311C0() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_39:
      swift_bridgeObjectRelease();
      uint64_t v2 = 0;
LABEL_42:
      sub_11020();
      return v2;
    }
LABEL_7:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = v16;
    uint64_t v4 = v21;
  }
  int64_t v15 = i + 4;
  if (i + 4 >= v30)
  {
LABEL_41:
    uint64_t v2 = 1;
    goto LABEL_42;
  }
  unint64_t v14 = *(void *)(v31 + 8 * v15);
  if (v14)
  {
    int64_t v12 = i + 4;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v12 >= v30) {
      goto LABEL_41;
    }
    unint64_t v14 = *(void *)(v31 + 8 * v12);
    ++v15;
    if (v14) {
      goto LABEL_24;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ItemSequenceHelper.CommonEventFeatureProcessing()
{
  return self;
}

uint64_t sub_118C4(uint64_t a1)
{
  uint64_t v1 = _swiftEmptyArrayStorage;
  if (!*(void *)(a1 + 16)) {
    return (uint64_t)v1;
  }
  sub_4F90(&qword_3DED0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_31C90;
  swift_bridgeObjectRetain();
  uint64_t result = sub_30490();
  if ((~*(void *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 9.22337204e18)
  {
    uint64_t v5 = (uint64_t)v4;
    sub_4F90(&qword_3DEC0);
    sub_126C8();
    uint64_t v6 = sub_30C80();
    uint64_t v8 = v7;
    swift_bridgeObjectRelease();
    type metadata accessor for SequenceItem();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 48) = 0;
    *(void *)(v9 + 56) = 0;
    *(void *)(v9 + 64) = _swiftEmptyArrayStorage;
    *(void *)(v9 + 16) = v5;
    *(void *)(v9 + 24) = v6;
    *(void *)(v9 + 32) = v8;
    *(_WORD *)(v9 + 40) = 256;
    *(void *)(v2 + 32) = v9;
    sub_30D60();
    return v2;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_11A14(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = a2;
  uint64_t v3 = sub_304D0();
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = &_swiftEmptySetSingleton;
  uint64_t v7 = _swiftEmptyArrayStorage;
  unint64_t v45 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v42 = *(void *)(a1 + 16);
  if (!v42)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    return (uint64_t)v7;
  }
  uint64_t v41 = a1 + 32;
  uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v4 + 8);
  uint64_t v38 = (void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v33 = a1;
  swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  unint64_t v36 = 0x8000000000033250;
  uint64_t v34 = v3;
  uint64_t v35 = v6;
  while (1)
  {
    uint64_t v9 = (double *)(v41 + 24 * v8);
    uint64_t v10 = *(void *)v9;
    if (!*(void *)(*(void *)v9 + 16)) {
      goto LABEL_4;
    }
    double v11 = v9[1];
    int v12 = *((unsigned __int8 *)v9 + 16);
    int v13 = *((unsigned __int8 *)v9 + 17);
    Swift::Int v15 = *(void *)(v10 + 32);
    Swift::Int v14 = *(void *)(v10 + 40);
    uint64_t v16 = v46;
    if (v46[2])
    {
      int v40 = *((unsigned __int8 *)v9 + 17);
      sub_31210();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_30CF0();
      Swift::Int v17 = sub_31230();
      uint64_t v18 = -1 << *((unsigned char *)v16 + 32);
      unint64_t v19 = v17 & ~v18;
      if ((*(void *)((char *)v16 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v19))
      {
        uint64_t v20 = v16[6];
        uint64_t v21 = (void *)(v20 + 16 * v19);
        BOOL v22 = *v21 == v15 && v21[1] == v14;
        if (v22 || (sub_311C0() & 1) != 0)
        {
LABEL_3:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v3 = v34;
          uint64_t v6 = v35;
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v23 = ~v18;
        while (1)
        {
          unint64_t v19 = (v19 + 1) & v23;
          if (((*(void *)((char *)v16 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v19) & 1) == 0) {
            break;
          }
          uint64_t v24 = (void *)(v20 + 16 * v19);
          BOOL v25 = *v24 == v15 && v24[1] == v14;
          if (v25 || (sub_311C0() & 1) != 0) {
            goto LABEL_3;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v3 = v34;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v6 = v35;
      int v13 = v40;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2CC70(&v43, v15, v14);
    swift_bridgeObjectRelease();
    (*v38)(v6, v39, v3);
    if (v12)
    {
      sub_30490();
      double v11 = v26;
    }
    uint64_t result = (*v37)(v6, v3);
    if ((~*(void *)&v11 & 0x7FF0000000000000) == 0) {
      break;
    }
    if (v11 <= -9.22337204e18) {
      goto LABEL_42;
    }
    if (v11 >= 9.22337204e18) {
      goto LABEL_43;
    }
    Swift::Int v43 = 0;
    unint64_t v44 = 0xE000000000000000;
    sub_30F70(21);
    swift_bridgeObjectRelease();
    Swift::Int v43 = 0xD000000000000013;
    unint64_t v44 = v36;
    if (v13) {
      v28._countAndFlagsBits = 1702195828;
    }
    else {
      v28._countAndFlagsBits = 0x65736C6166;
    }
    if (v13) {
      BOOL v29 = (void *)0xE400000000000000;
    }
    else {
      BOOL v29 = (void *)0xE500000000000000;
    }
    v28._object = v29;
    sub_30D00(v28);
    swift_bridgeObjectRelease();
    Swift::Int v30 = v43;
    unint64_t v31 = v44;
    type metadata accessor for SequenceItem();
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 48) = 0;
    *(void *)(v32 + 56) = 0;
    *(void *)(v32 + 64) = v10;
    *(void *)(v32 + 16) = (uint64_t)v11;
    *(void *)(v32 + 24) = v30;
    *(void *)(v32 + 32) = v31;
    *(_WORD *)(v32 + 40) = 769;
    sub_30D40();
    if (*(void *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v45 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_30D70();
    sub_30D90();
    sub_30D60();
LABEL_4:
    if (++v8 == v42)
    {
      swift_bridgeObjectRelease();
      uint64_t v7 = (void *)v45;
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_11E74(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = a2;
  uint64_t v3 = sub_304D0();
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = &_swiftEmptySetSingleton;
  uint64_t v7 = _swiftEmptyArrayStorage;
  unint64_t v45 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v42 = *(void *)(a1 + 16);
  if (!v42)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    return (uint64_t)v7;
  }
  uint64_t v41 = a1 + 32;
  uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v4 + 8);
  uint64_t v38 = (void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v33 = a1;
  swift_bridgeObjectRetain();
  uint64_t v8 = 0;
  unint64_t v36 = 0x8000000000033250;
  uint64_t v34 = v3;
  uint64_t v35 = v6;
  while (1)
  {
    uint64_t v9 = (double *)(v41 + 24 * v8);
    uint64_t v10 = *(void *)v9;
    if (!*(void *)(*(void *)v9 + 16)) {
      goto LABEL_4;
    }
    double v11 = v9[1];
    int v12 = *((unsigned __int8 *)v9 + 16);
    int v13 = *((unsigned __int8 *)v9 + 17);
    Swift::Int v15 = *(void *)(v10 + 32);
    Swift::Int v14 = *(void *)(v10 + 40);
    uint64_t v16 = v46;
    if (v46[2])
    {
      int v40 = *((unsigned __int8 *)v9 + 17);
      sub_31210();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_30CF0();
      Swift::Int v17 = sub_31230();
      uint64_t v18 = -1 << *((unsigned char *)v16 + 32);
      unint64_t v19 = v17 & ~v18;
      if ((*(void *)((char *)v16 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v19))
      {
        uint64_t v20 = v16[6];
        uint64_t v21 = (void *)(v20 + 16 * v19);
        BOOL v22 = *v21 == v15 && v21[1] == v14;
        if (v22 || (sub_311C0() & 1) != 0)
        {
LABEL_3:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v3 = v34;
          uint64_t v6 = v35;
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v23 = ~v18;
        while (1)
        {
          unint64_t v19 = (v19 + 1) & v23;
          if (((*(void *)((char *)v16 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) >> v19) & 1) == 0) {
            break;
          }
          uint64_t v24 = (void *)(v20 + 16 * v19);
          BOOL v25 = *v24 == v15 && v24[1] == v14;
          if (v25 || (sub_311C0() & 1) != 0) {
            goto LABEL_3;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v3 = v34;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v6 = v35;
      int v13 = v40;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2CC70(&v43, v15, v14);
    swift_bridgeObjectRelease();
    (*v38)(v6, v39, v3);
    if (v12)
    {
      sub_30490();
      double v11 = v26;
    }
    uint64_t result = (*v37)(v6, v3);
    if ((~*(void *)&v11 & 0x7FF0000000000000) == 0) {
      break;
    }
    if (v11 <= -9.22337204e18) {
      goto LABEL_42;
    }
    if (v11 >= 9.22337204e18) {
      goto LABEL_43;
    }
    Swift::Int v43 = 0;
    unint64_t v44 = 0xE000000000000000;
    sub_30F70(21);
    swift_bridgeObjectRelease();
    Swift::Int v43 = 0xD000000000000013;
    unint64_t v44 = v36;
    if (v13) {
      v28._countAndFlagsBits = 1702195828;
    }
    else {
      v28._countAndFlagsBits = 0x65736C6166;
    }
    if (v13) {
      BOOL v29 = (void *)0xE400000000000000;
    }
    else {
      BOOL v29 = (void *)0xE500000000000000;
    }
    v28._object = v29;
    sub_30D00(v28);
    swift_bridgeObjectRelease();
    Swift::Int v30 = v43;
    unint64_t v31 = v44;
    type metadata accessor for SequenceItem();
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 48) = 0;
    *(void *)(v32 + 56) = 0;
    *(void *)(v32 + 64) = v10;
    *(void *)(v32 + 16) = (uint64_t)v11;
    *(void *)(v32 + 24) = v30;
    *(void *)(v32 + 32) = v31;
    *(_WORD *)(v32 + 40) = 1025;
    sub_30D40();
    if (*(void *)((char *)&dword_10 + (v45 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v45 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_30D70();
    sub_30D90();
    sub_30D60();
LABEL_4:
    if (++v8 == v42)
    {
      swift_bridgeObjectRelease();
      uint64_t v7 = (void *)v45;
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_122D4(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v39 = sub_304D0();
  __chkstk_darwin(v39);
  unint64_t v44 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v49 = &_swiftEmptySetSingleton;
  uint64_t v5 = _swiftEmptyArrayStorage;
  unint64_t v48 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v43 = *(void *)(a1 + 16);
  if (!v43)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    return (uint64_t)v5;
  }
  uint64_t v42 = a1 + 32;
  uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v3 + 8);
  uint64_t v38 = (void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v35 = a1;
  swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  uint64_t v41 = 0;
  unint64_t v36 = 0x8000000000033250;
  while (1)
  {
    uint64_t v7 = (double *)(v42 + 24 * v6);
    double v8 = *v7;
    double v9 = v7[1];
    int v10 = *((unsigned __int8 *)v7 + 16);
    int v11 = *((unsigned __int8 *)v7 + 17);
    int v12 = *((unsigned __int8 *)v7 + 18);
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_30DF0();
    uint64_t v47 = v13;
    uint64_t v14 = *(void *)(*(void *)&v8 + 16);
    if (v14)
    {
      int v15 = v10;
      int v16 = v12;
      int v17 = v11;
      uint64_t v18 = (Swift::Int *)(*(void *)&v8 + 40);
      do
      {
        Swift::Int v19 = *(v18 - 1);
        Swift::Int v20 = *v18;
        swift_bridgeObjectRetain();
        sub_2CC70(&v45, v19, v20);
        swift_bridgeObjectRelease();
        v18 += 2;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease();
      uint64_t v21 = v47;
      int v11 = v17;
      int v12 = v16;
      int v10 = v15;
    }
    else
    {
      uint64_t v21 = v13;
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = swift_bridgeObjectRetain();
    char v23 = sub_115AC(v22, v21);
    swift_bridgeObjectRelease();
    if (v23)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    uint64_t v24 = v41;
    sub_11194(v21);
    uint64_t v41 = v24;
    swift_bridgeObjectRelease();
    uint64_t v25 = v39;
    double v26 = v44;
    (*v38)(v44, v40, v39);
    if (v10)
    {
      sub_30490();
      double v26 = v44;
      double v9 = v27;
    }
    uint64_t result = (*v37)(v26, v25);
    if ((~*(void *)&v9 & 0x7FF0000000000000) == 0) {
      break;
    }
    if (v9 <= -9.22337204e18) {
      goto LABEL_31;
    }
    if (v9 >= 9.22337204e18) {
      goto LABEL_32;
    }
    Swift::Int v45 = 0;
    unint64_t v46 = 0xE000000000000000;
    sub_30F70(21);
    swift_bridgeObjectRelease();
    Swift::Int v45 = 0xD000000000000013;
    unint64_t v46 = v36;
    if (v11) {
      v29._countAndFlagsBits = 1702195828;
    }
    else {
      v29._countAndFlagsBits = 0x65736C6166;
    }
    if (v11) {
      Swift::Int v30 = (void *)0xE400000000000000;
    }
    else {
      Swift::Int v30 = (void *)0xE500000000000000;
    }
    v29._object = v30;
    sub_30D00(v29);
    swift_bridgeObjectRelease();
    Swift::Int v31 = v45;
    unint64_t v32 = v46;
    if (v12 == 14) {
      char v33 = 13;
    }
    else {
      char v33 = v12;
    }
    type metadata accessor for SequenceItem();
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 48) = 0;
    *(void *)(v34 + 56) = 0;
    *(double *)(v34 + 64) = v8;
    *(void *)(v34 + 16) = (uint64_t)v9;
    *(void *)(v34 + 24) = v31;
    *(void *)(v34 + 32) = v32;
    *(unsigned char *)(v34 + 40) = 1;
    *(unsigned char *)(v34 + 41) = v33;
    sub_30D40();
    if (*(void *)((char *)&dword_10 + (v48 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v48 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_30D70();
    sub_30D90();
    sub_30D60();
LABEL_4:
    if (++v6 == v43)
    {
      swift_bridgeObjectRelease();
      uint64_t v5 = (void *)v48;
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
  return result;
}

unint64_t sub_126C8()
{
  unint64_t result = qword_3DEC8;
  if (!qword_3DEC8)
  {
    sub_D140(&qword_3DEC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3DEC8);
  }
  return result;
}

uint64_t destroy for ProcessedFeature()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s42SiriPrivateLearningPatternExtractionPlugin16ProcessedFeatureVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ProcessedFeature(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  return a1;
}

__n128 initializeWithTake for ProcessedFeature(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_DWORD *)(a1 + 15) = *(_DWORD *)(a2 + 15);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ProcessedFeature(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessedFeature(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 19)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProcessedFeature(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 18) = 0;
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 19) = 1;
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
    *(unsigned char *)(result + 19) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProcessedFeature()
{
  return &type metadata for ProcessedFeature;
}

uint64_t type metadata accessor for NLXUsoEntityFeatureExtractor()
{
  return self;
}

void *sub_12908(uint64_t a1)
{
  uint64_t v40 = sub_30530();
  uint64_t v2 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v4 = (char *)v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_30570();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  double v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 result = _swiftEmptyArrayStorage;
  uint64_t v42 = _swiftEmptyArrayStorage;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    int v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v11 = v6 + 16;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v38 = *(void *)(v11 + 56);
    uint64_t v39 = v12;
    uint64_t v37 = (void (**)(char *, uint64_t))(v2 + 8);
    uint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    v35[1] = a1;
    swift_bridgeObjectRetain();
    v35[2] = v11;
    uint64_t v36 = v5;
    while (1)
    {
      v39(v8, v13, v5);
      sub_30560();
      uint64_t v16 = sub_30520();
      uint64_t v18 = v17;
      (*v37)(v4, v40);
      if (v16 == 0x797469746E45 && v18 == 0xE600000000000000) {
        break;
      }
      char v19 = sub_311C0();
      swift_bridgeObjectRelease();
      Swift::Int v20 = _swiftEmptyArrayStorage;
      if (v19) {
        goto LABEL_9;
      }
LABEL_4:
      (*v14)(v8, v5);
      sub_16174((uint64_t)v20);
      v13 += v38;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        return v42;
      }
    }
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t v21 = sub_30550();
    if (v22)
    {
      uint64_t v23 = v21;
      uint64_t v24 = v22;
      Swift::Int v20 = sub_22F58(0, 1, 1, _swiftEmptyArrayStorage);
      unint64_t v26 = v20[2];
      unint64_t v25 = v20[3];
      if (v26 >= v25 >> 1) {
        Swift::Int v20 = sub_22F58((void *)(v25 > 1), v26 + 1, 1, v20);
      }
      v20[2] = v26 + 1;
      double v27 = &v20[2 * v26];
      v27[4] = v23;
      v27[5] = v24;
      uint64_t v5 = v36;
    }
    else
    {
      Swift::Int v20 = _swiftEmptyArrayStorage;
    }
    uint64_t v28 = sub_30540();
    if ((v29 & 1) == 0)
    {
      uint64_t v41 = v28;
      uint64_t v30 = sub_311B0();
      uint64_t v32 = v31;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        Swift::Int v20 = sub_22F58(0, v20[2] + 1, 1, v20);
      }
      unint64_t v34 = v20[2];
      unint64_t v33 = v20[3];
      if (v34 >= v33 >> 1) {
        Swift::Int v20 = sub_22F58((void *)(v33 > 1), v34 + 1, 1, v20);
      }
      v20[2] = v34 + 1;
      int v15 = &v20[2 * v34];
      v15[4] = v30;
      v15[5] = v32;
      uint64_t v5 = v36;
    }
    goto LABEL_4;
  }
  return result;
}

void *sub_12CA4(void (*a1)(uint64_t *__return_ptr, void *), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  __n128 result = _swiftEmptyArrayStorage;
  if (v5)
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
    sub_31020();
    for (int64_t i = (char *)(a3 + 50); ; i += 24)
    {
      uint64_t v9 = *(void *)(i - 10);
      char v10 = *(i - 2);
      char v11 = *(i - 1);
      char v12 = *i;
      v13[0] = *(void *)(i - 18);
      v13[1] = v9;
      char v14 = v10;
      char v15 = v11;
      char v16 = v12;
      swift_bridgeObjectRetain();
      a1(&v17, v13);
      swift_bridgeObjectRelease();
      if (v3) {
        break;
      }
      sub_31000();
      sub_31030();
      sub_31040();
      sub_31010();
      if (!--v5) {
        return v18;
      }
    }
    return (void *)swift_release();
  }
  return result;
}

void *sub_12DC4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_2B030(0, v1, 0);
    uint64_t v3 = (unsigned char *)(a1 + 56);
    do
    {
      uint64_t v4 = *((void *)v3 - 3);
      uint64_t v5 = *((void *)v3 - 2);
      uint64_t v6 = *((void *)v3 - 1);
      char v7 = *v3;
      sub_4F90(&qword_3E1B8);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_31A40;
      *(void *)(v8 + 32) = v4;
      *(void *)(v8 + 40) = v5;
      unint64_t v9 = _swiftEmptyArrayStorage[2];
      unint64_t v10 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v9 >= v10 >> 1) {
        sub_2B030(v10 > 1, v9 + 1, 1);
      }
      v3 += 32;
      _swiftEmptyArrayStorage[2] = v9 + 1;
      char v11 = &_swiftEmptyArrayStorage[3 * v9];
      v11[4] = v8;
      v11[5] = v6;
      *((unsigned char *)v11 + 48) = 0;
      *((unsigned char *)v11 + 49) = v7;
      *((unsigned char *)v11 + 50) = 13;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

void *sub_12EF4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_2B030(0, v1, 0);
    uint64_t v3 = (unsigned char *)(a1 + 48);
    do
    {
      uint64_t v4 = *((void *)v3 - 2);
      uint64_t v5 = *((void *)v3 - 1);
      char v6 = *v3;
      sub_4F90(&qword_3E1B8);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_31A40;
      *(void *)(v7 + 32) = v4;
      *(void *)(v7 + 40) = v5;
      unint64_t v8 = _swiftEmptyArrayStorage[2];
      unint64_t v9 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v8 >= v9 >> 1) {
        sub_2B030(v9 > 1, v8 + 1, 1);
      }
      v3 += 24;
      _swiftEmptyArrayStorage[2] = v8 + 1;
      unint64_t v10 = &_swiftEmptyArrayStorage[3 * v8];
      v10[4] = v7;
      v10[5] = 0;
      *((unsigned char *)v10 + 48) = 1;
      *((unsigned char *)v10 + 49) = v6;
      *((unsigned char *)v10 + 50) = 13;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_13024(unint64_t a1, unint64_t *a2)
{
  unint64_t v3 = a1;
  if (a1 >> 62)
  {
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_31090();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v5 = _swiftEmptyArrayStorage;
  if (!v4) {
    return (uint64_t)v5;
  }
  uint64_t result = sub_2B0B0(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = 0;
    uint64_t v5 = _swiftEmptyArrayStorage;
    unint64_t v8 = v3 & 0xC000000000000001;
    unint64_t v25 = a2;
    unint64_t v26 = v3 + 32;
    uint64_t v23 = v4;
    unint64_t v24 = v3;
    unint64_t v22 = v3 & 0xC000000000000001;
    while (1)
    {
      if (v7 == v4)
      {
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
      if (v8)
      {
        uint64_t v9 = sub_30FB0();
      }
      else
      {
        uint64_t v9 = *(void *)(v26 + 8 * v7);
        swift_retain();
      }
      unint64_t v30 = *(void *)(v9 + 64);
      uint64_t v10 = *(void *)(v30 + 16);
      if (v10)
      {
        char v29 = *(void **)(*a2 + 16);
        if (v29)
        {
          uint64_t v27 = v7;
          uint64_t v28 = v5;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          double v11 = -1.0;
          uint64_t v5 = (void *)(&dword_0 + 1);
          while (1)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            char v12 = (void **)(v30 + 40);
            for (uint64_t i = 1; ; ++i)
            {
              uint64_t v14 = (uint64_t)*(v12 - 1);
              char v15 = *v12;
              swift_bridgeObjectRetain();
              v31._countAndFlagsBits = v14;
              v31._object = v15;
              sub_30CE0(v31);
              a2 = v16;
              char v18 = v17;
              swift_bridgeObjectRelease();
              if (v18)
              {
                if (v11 <= -1.0) {
                  double v11 = -1.0;
                }
              }
              else if (v11 <= *(double *)&a2)
              {
                double v11 = *(double *)&a2;
              }
              if (v10 == i) {
                break;
              }
              v12 += 2;
              BOOL v19 = __OFADD__(i, 1);
              if (v19)
              {
                __break(1u);
                return (uint64_t)v5;
              }
            }
            swift_bridgeObjectRelease();
            unint64_t v3 = v30;
            swift_bridgeObjectRelease();
            if (v5 == v29) {
              break;
            }
            BOOL v19 = __OFADD__(v5, 1);
            uint64_t v5 = (void *)((char *)v5 + 1);
            if (v19)
            {
              __break(1u);
              goto LABEL_36;
            }
          }
          swift_bridgeObjectRelease();
          a2 = v25;
          *unint64_t v25 = v30;
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v4 = v23;
          unint64_t v3 = v24;
          uint64_t v7 = v27;
          uint64_t v5 = v28;
          unint64_t v8 = v22;
          goto LABEL_32;
        }
        *a2 = v30;
        swift_bridgeObjectRetain();
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();
      }
      double v11 = -1.0;
LABEL_32:
      unint64_t v21 = v5[2];
      unint64_t v20 = v5[3];
      if (v21 >= v20 >> 1) {
        sub_2B0B0(v20 > 1, v21 + 1, 1);
      }
      ++v7;
      uint64_t v5[2] = v21 + 1;
      *(double *)&v5[v21 + 4] = v11;
      if (v7 == v4) {
        return (uint64_t)v5;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_13318(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1C5CC(v4, (uint64_t)&v7);
      sub_1C5CC((uint64_t)&v7, (uint64_t)v9);
      sub_4F90(&qword_3E1A8);
      a2(0);
      if (swift_dynamicCast()) {
        break;
      }
      sub_1C630((uint64_t)&v7);
      v4 += 40;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_1C680(&v7, (uint64_t)v9);
  }
  else
  {
LABEL_6:
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
  }
  sub_DCA4((uint64_t)v9, (uint64_t)&v7, &qword_3E1B0);
  if (!v8)
  {
    sub_DD28((uint64_t)&v7, &qword_3E1B0);
    goto LABEL_12;
  }
  sub_4F90(&qword_3E1A8);
  a2(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  swift_retain();
  sub_30710();
  swift_release_n();
  uint64_t v5 = v7;
LABEL_13:
  sub_DD28((uint64_t)v9, &qword_3E1B0);
  return v5;
}

uint64_t sub_134A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1C5CC(v2, (uint64_t)&v5);
      sub_1C5CC((uint64_t)&v5, (uint64_t)v7);
      sub_4F90(&qword_3E1A8);
      sub_30AC0();
      if (swift_dynamicCast()) {
        break;
      }
      sub_1C630((uint64_t)&v5);
      v2 += 40;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_1C680(&v5, (uint64_t)v7);
  }
  else
  {
LABEL_6:
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
  }
  sub_DCA4((uint64_t)v7, (uint64_t)&v5, &qword_3E1B0);
  if (!v6)
  {
    sub_DD28((uint64_t)&v5, &qword_3E1B0);
    goto LABEL_12;
  }
  sub_4F90(&qword_3E1A8);
  sub_30AC0();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v3 = 0;
    goto LABEL_13;
  }
  swift_retain();
  sub_30710();
  swift_release_n();
  uint64_t v3 = v5;
LABEL_13:
  sub_DD28((uint64_t)v7, &qword_3E1B0);
  return v3;
}

uint64_t sub_13638(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1C5CC(v4, (uint64_t)&v7);
      sub_1C5CC((uint64_t)&v7, (uint64_t)v9);
      sub_4F90(&qword_3E1A8);
      a2(0);
      if (swift_dynamicCast()) {
        break;
      }
      sub_1C630((uint64_t)&v7);
      v4 += 40;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_1C680(&v7, (uint64_t)v9);
  }
  else
  {
LABEL_6:
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
  }
  sub_DCA4((uint64_t)v9, (uint64_t)&v7, &qword_3E1B0);
  if (!v8)
  {
    sub_DD28((uint64_t)&v7, &qword_3E1B0);
    goto LABEL_12;
  }
  sub_4F90(&qword_3E1A8);
  a2(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v5 = 2;
    goto LABEL_13;
  }
  swift_retain();
  sub_30710();
  swift_release_n();
  uint64_t v5 = v7;
LABEL_13:
  sub_DD28((uint64_t)v9, &qword_3E1B0);
  return v5;
}

uint64_t sub_137C8(uint64_t a1, void (*a2)(void))
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1C5CC(v4, (uint64_t)&v7);
      sub_1C5CC((uint64_t)&v7, (uint64_t)v9);
      sub_4F90(&qword_3E1A8);
      a2(0);
      if (swift_dynamicCast()) {
        break;
      }
      sub_1C630((uint64_t)&v7);
      v4 += 40;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_1C680(&v7, (uint64_t)v9);
  }
  else
  {
LABEL_6:
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
  }
  sub_DCA4((uint64_t)v9, (uint64_t)&v7, &qword_3E1B0);
  if (!v8)
  {
    sub_DD28((uint64_t)&v7, &qword_3E1B0);
    goto LABEL_12;
  }
  sub_4F90(&qword_3E1A8);
  a2(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  swift_retain();
  sub_30710();
  swift_release_n();
  uint64_t v5 = v7;
LABEL_13:
  sub_DD28((uint64_t)v9, &qword_3E1B0);
  return v5;
}

uint64_t sub_13960@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    uint64_t v6 = a1 + 32;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1C5CC(v6, (uint64_t)&v10);
      sub_1C5CC((uint64_t)&v10, (uint64_t)v12);
      sub_4F90(&qword_3E1A8);
      a2(0);
      if (swift_dynamicCast()) {
        break;
      }
      sub_1C630((uint64_t)&v10);
      v6 += 40;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    sub_1C680(&v10, (uint64_t)v12);
  }
  else
  {
LABEL_6:
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
  }
  sub_DCA4((uint64_t)v12, (uint64_t)&v10, &qword_3E1B0);
  if (v11)
  {
    sub_4F90(&qword_3E1A8);
    a2(0);
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_30710();
      swift_release_n();
      sub_DD28((uint64_t)v12, &qword_3E1B0);
      uint64_t v7 = sub_304D0();
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a3, 0, 1, v7);
    }
  }
  else
  {
    sub_DD28((uint64_t)&v10, &qword_3E1B0);
  }
  sub_DD28((uint64_t)v12, &qword_3E1B0);
  uint64_t v9 = sub_304D0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a3, 1, 1, v9);
}

uint64_t sub_13B70()
{
  sub_4F90(&qword_3E1B8);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_31EA0;
  strcpy((char *)(result + 32), "\\contact-first");
  *(unsigned char *)(result + 47) = -18;
  *(void *)(result + 48) = 0x746361746E6F635CLL;
  *(void *)(result + 56) = 0xEF656C6464696D2DLL;
  strcpy((char *)(result + 64), "\\contact-last");
  *(_WORD *)(result + 78) = -4864;
  *(void *)(result + 80) = 0xD000000000000011;
  *(void *)(result + 88) = 0x80000000000334D0;
  off_3DF80 = (int *)result;
  return result;
}

void sub_13C18()
{
  id v0 = [self standardUserDefaults];
  NSString v1 = sub_30CA0();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_3DF88 = v2;
}

uint64_t sub_13CA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_4F90(&qword_3E1D8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_30B20();
  swift_allocObject();
  sub_30B10();
  uint64_t v6 = sub_30B00();
  swift_release();
  sub_30B50();
  swift_allocObject();
  sub_30B40();
  uint64_t v7 = sub_30B30();
  swift_release();
  uint64_t v8 = sub_13318(v7, (void (*)(void))&type metadata accessor for CommonContactFeature.RecipientContactReferences);
  swift_bridgeObjectRelease();
  if (!v8)
  {
    uint64_t result = swift_bridgeObjectRelease();
LABEL_8:
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0xE000000000000000;
    *(void *)(a1 + 16) = 0;
LABEL_9:
    *(unsigned char *)(a1 + 24) = 0;
    return result;
  }
  v21[1] = v1;
  uint64_t v9 = *(void *)(v8 + 16);
  uint64_t v10 = sub_30AF0();
  uint64_t v11 = *(void *)(v10 - 8);
  if (v9)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v5, v8 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v5, 0, 1, v10);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v5, 1, 1, v10);
  }
  swift_bridgeObjectRelease();
  sub_30AF0();
  uint64_t v13 = v11;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t result = sub_DD28((uint64_t)v5, &qword_3E1D8);
    goto LABEL_8;
  }
  uint64_t v14 = sub_30AE0();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v5, v10);
  uint64_t v17 = sub_134A8(v6);
  if (v18)
  {
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v16;
    *(void *)(a1 + 16) = 0;
    *(unsigned char *)(a1 + 24) = 0;
  }
  else
  {
    uint64_t v19 = v17;
    char v20 = sub_13638(v6, (void (*)(void))&type metadata accessor for CommonFeature.DonatedBySiri);
    uint64_t result = swift_bridgeObjectRelease();
    if (v20 == 2)
    {
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v16;
      *(void *)(a1 + 16) = v19;
      goto LABEL_9;
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v16;
    *(void *)(a1 + 16) = v19;
    *(unsigned char *)(a1 + 24) = v20 & 1;
  }
  return result;
}

uint64_t sub_13FCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_4F90(&qword_3E1D8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_30B20();
  swift_allocObject();
  sub_30B10();
  uint64_t v5 = sub_30B00();
  swift_release();
  sub_30B70();
  swift_allocObject();
  v17[1] = sub_30B60();
  sub_1C698(&qword_3E1E0, (void (*)(uint64_t))&type metadata accessor for INSendMessageIntentFeatureExtractor);
  uint64_t v6 = sub_307E0();
  swift_release();
  uint64_t v7 = sub_13318(v6, (void (*)(void))&type metadata accessor for CommonContactFeature.RecipientContactReferences);
  swift_bridgeObjectRelease();
  if (v7)
  {
    uint64_t v8 = *(void *)(v7 + 16);
    uint64_t v9 = sub_30AF0();
    uint64_t v10 = *(void *)(v9 - 8);
    if (v8)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v4, v7+ ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80)), v9);
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v4, v11, 1, v9);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v4, 1, v9) != 1)
    {
      uint64_t v7 = sub_30AE0();
      unint64_t v14 = v15;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v4, v9);
      char v16 = sub_13638(v5, (void (*)(void))&type metadata accessor for CommonFeature.DonatedBySiri);
      uint64_t result = swift_bridgeObjectRelease();
      char v13 = v16 & 1;
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
    uint64_t result = sub_DD28((uint64_t)v4, &qword_3E1D8);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
  }
  char v13 = 0;
  unint64_t v14 = 0xE000000000000000;
LABEL_10:
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v14;
  *(unsigned char *)(a1 + 16) = v13;
  return result;
}

uint64_t sub_14294(uint64_t a1, uint64_t *a2)
{
  sub_30950();
  swift_allocObject();
  sub_30940();
  uint64_t v3 = sub_30930();
  swift_release();
  sub_30980();
  swift_allocObject();
  sub_30970();
  uint64_t v4 = sub_30960();
  swift_release();
  uint64_t v5 = sub_137C8(v3, (void (*)(void))&type metadata accessor for CreateNoteEventFeature.NoteTextContent);
  if (v6
    && (uint64_t v7 = v5,
        uint64_t v8 = v6,
        char v9 = sub_13638(v3, (void (*)(void))&type metadata accessor for CreateNoteEventFeature.DonatedBySiri), swift_bridgeObjectRelease(), v9 != 2))
  {
    char v10 = v9 & 1;
    sub_4F90(&qword_3E1B8);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_31A40;
    *(void *)(v11 + 32) = v7;
    *(void *)(v11 + 40) = v8;
    char v12 = (void *)*a2;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (uint64_t)v12;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      char v12 = sub_23068(0, v12[2] + 1, 1, v12);
      *a2 = (uint64_t)v12;
    }
    unint64_t v15 = v12[2];
    unint64_t v14 = v12[3];
    if (v15 >= v14 >> 1)
    {
      char v12 = sub_23068((void *)(v14 > 1), v15 + 1, 1, v12);
      *a2 = (uint64_t)v12;
    }
    _OWORD v12[2] = v15 + 1;
    char v16 = &v12[3 * v15];
    v16[4] = v11;
    v16[5] = 0;
    *((unsigned char *)v16 + 48) = 1;
    *((unsigned char *)v16 + 49) = v10;
    *((unsigned char *)v16 + 50) = 10;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v17 = sub_137C8(v4, (void (*)(void))&type metadata accessor for DeleteNoteEventFeature.NoteTextContent);
  if (!v18) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v19 = v17;
  uint64_t v20 = v18;
  char v21 = sub_13638(v4, (void (*)(void))&type metadata accessor for DeleteNoteEventFeature.DonatedBySiri);
  swift_bridgeObjectRelease();
  if (v21 == 2) {
    return swift_bridgeObjectRelease();
  }
  char v23 = v21 & 1;
  sub_4F90(&qword_3E1B8);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_31A40;
  *(void *)(v24 + 32) = v19;
  *(void *)(v24 + 40) = v20;
  unint64_t v25 = (void *)*a2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *a2 = (uint64_t)v25;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_23068(0, v25[2] + 1, 1, v25);
    unint64_t v25 = (void *)result;
    *a2 = result;
  }
  unint64_t v27 = v25[2];
  unint64_t v26 = v25[3];
  if (v27 >= v26 >> 1)
  {
    uint64_t result = (uint64_t)sub_23068((void *)(v26 > 1), v27 + 1, 1, v25);
    unint64_t v25 = (void *)result;
    *a2 = result;
  }
  v25[2] = v27 + 1;
  uint64_t v28 = &v25[3 * v27];
  v28[4] = v24;
  v28[5] = 0;
  *((unsigned char *)v28 + 48) = 1;
  *((unsigned char *)v28 + 49) = v23;
  *((unsigned char *)v28 + 50) = 11;
  return result;
}

uint64_t sub_145A8(uint64_t a1, uint64_t *a2)
{
  unint64_t v68 = a2;
  uint64_t v2 = sub_4F90(&qword_3D9C8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v65 - v6;
  uint64_t v8 = sub_304D0();
  uint64_t v69 = *(void *)(v8 - 8);
  uint64_t v70 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  char v13 = (char *)&v65 - v12;
  sub_309B0();
  swift_allocObject();
  sub_309A0();
  uint64_t v14 = sub_30990();
  swift_release();
  sub_30A10();
  swift_allocObject();
  sub_30A00();
  uint64_t v15 = sub_309F0();
  swift_release();
  sub_309E0();
  swift_allocObject();
  sub_309D0();
  uint64_t v16 = sub_309C0();
  swift_release();
  uint64_t v17 = sub_137C8(v14, (void (*)(void))&type metadata accessor for MTCreateAlarmEventFeature.AlarmName);
  if (v18)
  {
    uint64_t v19 = v17;
    uint64_t v20 = v18;
    unint64_t v67 = v5;
    char v21 = sub_13638(v14, (void (*)(void))&type metadata accessor for MTCreateAlarmEventFeature.DonatedBySiri);
    if (v21 == 2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v22 = v21;
      int64_t v66 = v11;
      sub_13960(v14, (void (*)(void))&type metadata accessor for MTCreateAlarmEventFeature.AlarmTime, (uint64_t)v7);
      swift_bridgeObjectRelease();
      uint64_t v24 = v69;
      uint64_t v23 = v70;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48))(v7, 1, v70) == 1)
      {
        swift_bridgeObjectRelease();
        sub_DD28((uint64_t)v7, &qword_3D9C8);
        uint64_t v11 = v66;
      }
      else
      {
        char v25 = v22 & 1;
        (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v13, v7, v23);
        sub_4F90(&qword_3E1B8);
        uint64_t v26 = swift_allocObject();
        *(_OWORD *)(v26 + 16) = xmmword_31EB0;
        *(void *)(v26 + 32) = v19;
        *(void *)(v26 + 40) = v20;
        *(void *)(v26 + 48) = sub_30440();
        *(void *)(v26 + 56) = v27;
        uint64_t v28 = v68;
        char v29 = (void *)*v68;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *uint64_t v28 = (uint64_t)v29;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          char v29 = sub_23068(0, v29[2] + 1, 1, v29);
          *unint64_t v68 = (uint64_t)v29;
        }
        uint64_t v11 = v66;
        unint64_t v32 = v29[2];
        unint64_t v31 = v29[3];
        if (v32 >= v31 >> 1)
        {
          char v29 = sub_23068((void *)(v31 > 1), v32 + 1, 1, v29);
          *unint64_t v68 = (uint64_t)v29;
        }
        v29[2] = v32 + 1;
        unint64_t v33 = &v29[3 * v32];
        v33[4] = v26;
        v33[5] = 0;
        *((unsigned char *)v33 + 48) = 1;
        *((unsigned char *)v33 + 49) = v25;
        *((unsigned char *)v33 + 50) = 7;
        (*(void (**)(char *, uint64_t))(v69 + 8))(v13, v70);
      }
    }
    uint64_t v5 = v67;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v34 = sub_137C8(v15, (void (*)(void))&type metadata accessor for MTUpdateAlarmEventFeature.AlarmName);
  if (v35)
  {
    uint64_t v36 = v34;
    uint64_t v37 = v35;
    char v38 = sub_13638(v15, (void (*)(void))&type metadata accessor for MTUpdateAlarmEventFeature.DonatedBySiri);
    if (v38 == 2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v39 = v38;
      sub_13960(v15, (void (*)(void))&type metadata accessor for MTUpdateAlarmEventFeature.AlarmTime, (uint64_t)v5);
      swift_bridgeObjectRelease();
      uint64_t v41 = v69;
      uint64_t v40 = v70;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v69 + 48))(v5, 1, v70) == 1)
      {
        swift_bridgeObjectRelease();
        sub_DD28((uint64_t)v5, &qword_3D9C8);
      }
      else
      {
        uint64_t v42 = v5;
        char v43 = v39 & 1;
        (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v11, v42, v40);
        sub_4F90(&qword_3E1B8);
        uint64_t v44 = swift_allocObject();
        *(_OWORD *)(v44 + 16) = xmmword_31EB0;
        *(void *)(v44 + 32) = v36;
        *(void *)(v44 + 40) = v37;
        *(void *)(v44 + 48) = sub_30440();
        *(void *)(v44 + 56) = v45;
        unint64_t v46 = v68;
        uint64_t v47 = (void *)*v68;
        char v48 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t *v46 = (uint64_t)v47;
        if ((v48 & 1) == 0)
        {
          uint64_t v47 = sub_23068(0, v47[2] + 1, 1, v47);
          *unint64_t v68 = (uint64_t)v47;
        }
        unint64_t v50 = v47[2];
        unint64_t v49 = v47[3];
        if (v50 >= v49 >> 1)
        {
          uint64_t v47 = sub_23068((void *)(v49 > 1), v50 + 1, 1, v47);
          *unint64_t v68 = (uint64_t)v47;
        }
        v47[2] = v50 + 1;
        unint64_t v51 = &v47[3 * v50];
        v51[4] = v44;
        v51[5] = 0;
        *((unsigned char *)v51 + 48) = 1;
        *((unsigned char *)v51 + 49) = v43;
        *((unsigned char *)v51 + 50) = 9;
        (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v40);
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v52 = sub_137C8(v16, (void (*)(void))&type metadata accessor for MTToggleAlarmEventFeature.AlarmName);
  if (!v53) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v54 = v52;
  uint64_t v55 = v53;
  char v56 = sub_13638(v16, (void (*)(void))&type metadata accessor for MTToggleAlarmEventFeature.DonatedBySiri);
  swift_bridgeObjectRelease();
  if (v56 == 2) {
    return swift_bridgeObjectRelease();
  }
  char v58 = v56 & 1;
  sub_4F90(&qword_3E1B8);
  uint64_t v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = xmmword_31A40;
  *(void *)(v59 + 32) = v54;
  *(void *)(v59 + 40) = v55;
  unint64_t v60 = v68;
  uint64_t v61 = (void *)*v68;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v60 = (uint64_t)v61;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_23068(0, v61[2] + 1, 1, v61);
    uint64_t v61 = (void *)result;
    *unint64_t v68 = result;
  }
  unint64_t v63 = v61[2];
  unint64_t v62 = v61[3];
  if (v63 >= v62 >> 1)
  {
    uint64_t result = (uint64_t)sub_23068((void *)(v62 > 1), v63 + 1, 1, v61);
    uint64_t v61 = (void *)result;
    *unint64_t v68 = result;
  }
  v61[2] = v63 + 1;
  uint64_t v64 = &v61[3 * v63];
  v64[4] = v59;
  v64[5] = 0;
  *((unsigned char *)v64 + 48) = 1;
  *((unsigned char *)v64 + 49) = v58;
  *((unsigned char *)v64 + 50) = 8;
  return result;
}

uint64_t sub_14CCC(uint64_t a1, uint64_t *a2)
{
  sub_30920();
  swift_allocObject();
  sub_30910();
  uint64_t v3 = sub_30900();
  swift_release();
  sub_30A40();
  swift_allocObject();
  sub_30A30();
  uint64_t v4 = sub_30A20();
  swift_release();
  uint64_t v5 = sub_137C8(v3, (void (*)(void))&type metadata accessor for AddTaskEventFeature.TargetTaskListTitle);
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v7 = v5;
  uint64_t v8 = v6;
  char v9 = sub_13638(v3, (void (*)(void))&type metadata accessor for AddTaskEventFeature.DonatedBySiri);
  if (v9 == 2)
  {
    swift_bridgeObjectRelease();
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  char v10 = v9;
  uint64_t v11 = (void *)sub_13318(v3, (void (*)(void))&type metadata accessor for AddTaskEventFeature.TaskContents);
  swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_15;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v11 = sub_22F58(0, v11[2] + 1, 1, v11);
  }
  unint64_t v12 = v11[2];
  unint64_t v13 = v11[3];
  unint64_t v14 = v12 + 1;
  if (v12 >= v13 >> 1)
  {
    uint64_t v34 = v11;
    unint64_t v35 = v11[2];
    uint64_t v36 = sub_22F58((void *)(v13 > 1), v12 + 1, 1, v34);
    unint64_t v12 = v35;
    uint64_t v11 = v36;
  }
  char v15 = v10 & 1;
  v11[2] = v14;
  uint64_t v16 = &v11[2 * v12];
  v16[4] = v7;
  v16[5] = v8;
  uint64_t v17 = (void *)*a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a2 = (uint64_t)v17;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v17 = sub_23068(0, v17[2] + 1, 1, v17);
    *a2 = (uint64_t)v17;
  }
  unint64_t v20 = v17[2];
  unint64_t v19 = v17[3];
  if (v20 >= v19 >> 1)
  {
    uint64_t v17 = sub_23068((void *)(v19 > 1), v20 + 1, 1, v17);
    *a2 = (uint64_t)v17;
  }
  void v17[2] = v20 + 1;
  char v21 = &v17[3 * v20];
  v21[4] = v11;
  v21[5] = 0;
  *((unsigned char *)v21 + 48) = 1;
  *((unsigned char *)v21 + 49) = v15;
  *((unsigned char *)v21 + 50) = 5;
LABEL_16:
  char v22 = sub_13638(v4, (void (*)(void))&type metadata accessor for SetTaskAttributeFeature.DonatedBySiri);
  if (v22 == 2) {
    return swift_bridgeObjectRelease();
  }
  char v24 = v22;
  uint64_t v25 = sub_137C8(v4, (void (*)(void))&type metadata accessor for SetTaskAttributeFeature.TaskContents);
  uint64_t v27 = v26;
  uint64_t result = swift_bridgeObjectRelease();
  if (v27)
  {
    char v28 = v24 & 1;
    sub_4F90(&qword_3E1B8);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_31A40;
    *(void *)(v29 + 32) = v25;
    *(void *)(v29 + 40) = v27;
    unint64_t v30 = (void *)*a2;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a2 = (uint64_t)v30;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_23068(0, v30[2] + 1, 1, v30);
      unint64_t v30 = (void *)result;
      *a2 = result;
    }
    unint64_t v32 = v30[2];
    unint64_t v31 = v30[3];
    if (v32 >= v31 >> 1)
    {
      uint64_t result = (uint64_t)sub_23068((void *)(v31 > 1), v32 + 1, 1, v30);
      unint64_t v30 = (void *)result;
      *a2 = result;
    }
    v30[2] = v32 + 1;
    unint64_t v33 = &v30[3 * v32];
    v33[4] = v29;
    v33[5] = 0;
    *((unsigned char *)v33 + 48) = 1;
    *((unsigned char *)v33 + 49) = v28;
    *((unsigned char *)v33 + 50) = 6;
  }
  return result;
}

void sub_15048(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = sub_4F90(&qword_3D9C8);
  __chkstk_darwin(v6 - 8);
  unint64_t v99 = (char *)&v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_304D0();
  __chkstk_darwin(v8);
  uint64_t v11 = _swiftEmptyArrayStorage;
  uint64_t v120 = _swiftEmptyArrayStorage;
  uint64_t v98 = *(void *)(a1 + 16);
  if (!v98)
  {
    uint64_t v88 = 0;
    goto LABEL_91;
  }
  uint64_t v108 = (uint64_t)&v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = a3;
  uint64_t v97 = a2[12];
  uint64_t v96 = a2[13];
  uint64_t v95 = a1 + 32;
  uint64_t v94 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  char v91 = (void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
  char v92 = (void (**)(uint64_t, uint64_t))(v9 + 8);
  uint64_t v93 = a2[14];
  uint64_t v89 = a1;
  swift_bridgeObjectRetain();
  uint64_t v100 = 0;
  uint64_t v12 = 0;
  long long v105 = xmmword_31A40;
  uint64_t v101 = v8;
  while (1)
  {
    uint64_t v104 = v12;
    unint64_t v19 = (uint64_t *)(v95 + 16 * v12);
    uint64_t v20 = *v19;
    uint64_t v107 = v19[1];
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v21 = (uint64_t)v99;
    uint64_t v106 = v20;
    sub_30A80();
    if ((*v94)(v21, 1, v8) == 1)
    {
      sub_304C0();
      sub_DD28(v21, &qword_3D9C8);
    }
    else
    {
      (*v91)(v108, v21, v8);
    }
    *(void *)&long long v117 = v97;
    sub_30760();
    swift_retain();
    uint64_t v22 = sub_307B0();
    swift_release();
    uint64_t v23 = sub_1B3B8(v22);
    swift_bridgeObjectRelease();
    sub_30A90();
    uint64_t v24 = sub_30720();
    swift_bridgeObjectRelease();
    uint64_t v25 = sub_1BDF4(v24);
    *(void *)&long long v117 = v93;
    sub_307A0();
    swift_retain();
    uint64_t v26 = sub_307B0();
    swift_release();
    uint64_t v27 = sub_1BB14(v26);
    swift_bridgeObjectRelease();
    uint64_t v28 = *(void *)(v24 + 16);
    swift_bridgeObjectRelease();
    uint64_t v113 = v27;
    if (!v28)
    {
      uint64_t v29 = v107;
      goto LABEL_34;
    }
    uint64_t v29 = v107;
    if (v100) {
      goto LABEL_34;
    }
    uint64_t v112 = v23;
    unint64_t v30 = sub_30A90();
    unint64_t v31 = v30;
    if (v30 >> 62)
    {
      uint64_t v32 = sub_31090();
      if (!v32)
      {
LABEL_31:
        uint64_t v100 = 0;
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v32 = *(void *)((char *)&dword_10 + (v30 & 0xFFFFFFFFFFFFFF8));
      if (!v32) {
        goto LABEL_31;
      }
    }
    unint64_t v33 = 0;
    unint64_t v34 = v31 & 0xC000000000000001;
    while (1)
    {
      if (v34)
      {
        swift_bridgeObjectRetain();
        id v35 = (id)sub_30FB0();
      }
      else
      {
        uint64_t v36 = *(void **)(v31 + 8 * v33 + 32);
        swift_bridgeObjectRetain();
        id v35 = v36;
      }
      uint64_t v37 = v35;
      char v38 = (void *)sub_305E0();
      swift_bridgeObjectRelease();

      if (v38) {
        break;
      }
      unint64_t v39 = v33 + 1;
      if (__OFADD__(v33, 1))
      {
        __break(1u);
LABEL_93:
        __break(1u);
        goto LABEL_94;
      }
      ++v33;
      if (v39 == v32) {
        goto LABEL_22;
      }
    }
    if (v32 != v33) {
      break;
    }
LABEL_22:
    uint64_t v100 = 0;
    uint64_t v29 = v107;
LABEL_32:
    uint64_t v23 = v112;
LABEL_33:
    swift_bridgeObjectRelease();
LABEL_34:
    uint64_t v102 = sub_1C2A8(v29);
    uint64_t v103 = sub_1C420(v29);
    sub_30A90();
    uint64_t v43 = sub_30620();
    swift_bridgeObjectRelease();
    if (v43)
    {
      sub_4F90(&qword_3E1C0);
      uint64_t v44 = (void *)swift_allocObject();
      *((_OWORD *)v44 + 1) = v105;
      uint64_t v45 = sub_30580();
      unint64_t v46 = sub_12908(v45);
      swift_bridgeObjectRelease();
      v44[4] = v46;
      v44[5] = 0;
      *((unsigned char *)v44 + 48) = 1;
      *(_WORD *)((char *)v44 + 49) = 3328;
      swift_release();
      if (*(void *)(v25 + 16)) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v44 = _swiftEmptyArrayStorage;
      if (*(void *)(v25 + 16))
      {
LABEL_36:
        uint64_t v47 = swift_bridgeObjectRelease();
        __chkstk_darwin(v47);
        uint64_t v48 = v108;
        *(&v89 - 2) = v108;
        unint64_t v49 = sub_12CA4((void (*)(uint64_t *__return_ptr, void *))sub_1C58C, (uint64_t)(&v89 - 4), v25);
        goto LABEL_40;
      }
    }
    uint64_t v50 = swift_bridgeObjectRelease();
    if (!v44[2])
    {
      swift_bridgeObjectRelease();
      uint64_t v8 = v101;
      uint64_t v48 = v108;
      goto LABEL_41;
    }
    __chkstk_darwin(v50);
    uint64_t v48 = v108;
    *(&v89 - 2) = v108;
    unint64_t v49 = sub_12CA4((void (*)(uint64_t *__return_ptr, void *))sub_1D034, (uint64_t)(&v89 - 4), (uint64_t)v44);
LABEL_40:
    swift_bridgeObjectRelease();
    sub_162C8((unint64_t)v49);
    uint64_t v8 = v101;
LABEL_41:
    unint64_t v51 = sub_118C4((uint64_t)v23);
    swift_bridgeObjectRelease();
    uint64_t v52 = sub_162C8(v51);
    __chkstk_darwin(v52);
    *(&v89 - 2) = v48;
    uint64_t v53 = sub_12CA4((void (*)(uint64_t *__return_ptr, void *))sub_1C5AC, (uint64_t)(&v89 - 4), (uint64_t)v113);
    swift_bridgeObjectRelease();
    sub_162C8((unint64_t)v53);
    *(void *)&long long v117 = _swiftEmptyArrayStorage;
    uint64_t v54 = v107;
    uint64_t v55 = *(void *)(v107 + 16);
    if (v55)
    {
      uint64_t v56 = *(void *)(sub_30660() - 8);
      uint64_t v57 = v54 + ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80));
      uint64_t v58 = *(void *)(v56 + 72);
      swift_bridgeObjectRetain();
      do
      {
        sub_14294(v57, (uint64_t *)&v117);
        v57 += v58;
        --v55;
      }
      while (v55);
      uint64_t v54 = v107;
      swift_bridgeObjectRelease();
      uint64_t v59 = (void *)v117;
    }
    else
    {
      uint64_t v59 = _swiftEmptyArrayStorage;
    }
    unint64_t v60 = sub_122D4((uint64_t)v59, v108);
    swift_bridgeObjectRelease();
    sub_162C8(v60);
    *(void *)&long long v117 = _swiftEmptyArrayStorage;
    uint64_t v61 = *(void *)(v54 + 16);
    if (v61)
    {
      uint64_t v62 = *(void *)(sub_30660() - 8);
      uint64_t v63 = v54 + ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80));
      uint64_t v64 = *(void *)(v62 + 72);
      swift_bridgeObjectRetain();
      do
      {
        sub_14CCC(v63, (uint64_t *)&v117);
        v63 += v64;
        --v61;
      }
      while (v61);
      uint64_t v54 = v107;
      swift_bridgeObjectRelease();
      uint64_t v65 = (void *)v117;
    }
    else
    {
      uint64_t v65 = _swiftEmptyArrayStorage;
    }
    unint64_t v66 = sub_122D4((uint64_t)v65, v108);
    swift_bridgeObjectRelease();
    sub_162C8(v66);
    *(void *)&long long v117 = _swiftEmptyArrayStorage;
    uint64_t v67 = *(void *)(v54 + 16);
    if (v67)
    {
      uint64_t v68 = *(void *)(sub_30660() - 8);
      uint64_t v69 = v54 + ((*(unsigned __int8 *)(v68 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80));
      uint64_t v70 = *(void *)(v68 + 72);
      swift_bridgeObjectRetain();
      do
      {
        sub_145A8(v69, (uint64_t *)&v117);
        v69 += v70;
        --v67;
      }
      while (v67);
      uint64_t v54 = v107;
      swift_bridgeObjectRelease();
      uint64_t v71 = (void *)v117;
    }
    else
    {
      uint64_t v71 = _swiftEmptyArrayStorage;
    }
    unint64_t v72 = sub_122D4((uint64_t)v71, v108);
    swift_bridgeObjectRelease();
    sub_162C8(v72);
    uint64_t v113 = *(void **)(v54 + 16);
    if (v113)
    {
      uint64_t v73 = *(void *)(sub_30660() - 8);
      uint64_t v112 = (void *)(v54
                      + ((*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80)));
      uint64_t v111 = *(void *)(v73 + 72);
      sub_30A70();
      swift_bridgeObjectRetain();
      uint64_t v74 = 0;
      uint64_t v109 = _swiftEmptyArrayStorage;
      while (1)
      {
        swift_allocObject();
        sub_30A60();
        uint64_t v75 = sub_30A50();
        swift_release();
        uint64_t v76 = *(void *)(v75 + 16);
        if (v76)
        {
          uint64_t v77 = v75 + 32;
          swift_bridgeObjectRetain();
          while (1)
          {
            sub_1C5CC(v77, (uint64_t)&v115);
            sub_1C5CC((uint64_t)&v115, (uint64_t)v114);
            sub_4F90(&qword_3E1A8);
            sub_30850();
            if (swift_dynamicCast()) {
              break;
            }
            sub_1C630((uint64_t)&v115);
            v77 += 40;
            if (!--v76)
            {
              swift_bridgeObjectRelease();
              goto LABEL_67;
            }
          }
          swift_bridgeObjectRelease();
          swift_release();
          sub_1C680(&v115, (uint64_t)&v117);
        }
        else
        {
LABEL_67:
          uint64_t v119 = 0;
          long long v117 = 0u;
          long long v118 = 0u;
        }
        sub_DCA4((uint64_t)&v117, (uint64_t)&v115, &qword_3E1B0);
        if (!v116) {
          break;
        }
        sub_4F90(&qword_3E1A8);
        sub_30850();
        if ((swift_dynamicCast() & 1) == 0) {
          goto LABEL_59;
        }
        swift_retain();
        sub_30710();
        swift_release_n();
        uint64_t v78 = *((void *)&v115 + 1);
        uint64_t v110 = v115;
        sub_DD28((uint64_t)&v117, &qword_3E1B0);
        uint64_t v79 = *(void *)(v75 + 16);
        if (v79)
        {
          uint64_t v80 = v75 + 32;
          swift_bridgeObjectRetain();
          while (1)
          {
            sub_1C5CC(v80, (uint64_t)&v115);
            sub_1C5CC((uint64_t)&v115, (uint64_t)v114);
            sub_30840();
            if (swift_dynamicCast()) {
              break;
            }
            sub_1C630((uint64_t)&v115);
            v80 += 40;
            if (!--v79)
            {
              swift_bridgeObjectRelease();
              goto LABEL_76;
            }
          }
          swift_bridgeObjectRelease();
          swift_release();
          sub_1C680(&v115, (uint64_t)&v117);
        }
        else
        {
LABEL_76:
          uint64_t v119 = 0;
          long long v117 = 0u;
          long long v118 = 0u;
        }
        sub_DCA4((uint64_t)&v117, (uint64_t)&v115, &qword_3E1B0);
        if (v116)
        {
          sub_30840();
          if (swift_dynamicCast())
          {
            swift_retain();
            sub_30710();
            swift_release_n();
            char v81 = v115;
            sub_DD28((uint64_t)&v117, &qword_3E1B0);
            swift_bridgeObjectRelease();
            sub_4F90(&qword_3E1B8);
            uint64_t v82 = swift_allocObject();
            *(_OWORD *)(v82 + 16) = v105;
            *(void *)(v82 + 32) = v110;
            *(void *)(v82 + 40) = v78;
            unint64_t v83 = v109;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v83 = sub_23068(0, v83[2] + 1, 1, v83);
            }
            uint64_t v109 = v83;
            unint64_t v85 = v83[2];
            unint64_t v84 = v83[3];
            if (v85 >= v84 >> 1) {
              uint64_t v109 = sub_23068((void *)(v84 > 1), v85 + 1, 1, v109);
            }
            Swift::Int v86 = v109;
            v109[2] = v85 + 1;
            unint64_t v87 = &v86[3 * v85];
            v87[4] = v82;
            v87[5] = 0;
            *((unsigned char *)v87 + 48) = 1;
            *((unsigned char *)v87 + 49) = v81;
            *((unsigned char *)v87 + 50) = 12;
            goto LABEL_61;
          }
        }
        else
        {
          sub_DD28((uint64_t)&v115, &qword_3E1B0);
        }
        sub_DD28((uint64_t)&v117, &qword_3E1B0);
        swift_bridgeObjectRelease();
LABEL_60:
        swift_bridgeObjectRelease();
LABEL_61:
        if ((void *)++v74 == v113)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v8 = v101;
          unint64_t v13 = v109;
          goto LABEL_4;
        }
      }
      sub_DD28((uint64_t)&v115, &qword_3E1B0);
LABEL_59:
      sub_DD28((uint64_t)&v117, &qword_3E1B0);
      goto LABEL_60;
    }
    swift_bridgeObjectRelease();
    unint64_t v13 = _swiftEmptyArrayStorage;
LABEL_4:
    uint64_t v14 = v104 + 1;
    uint64_t v15 = v108;
    unint64_t v16 = sub_122D4((uint64_t)v13, v108);
    swift_bridgeObjectRelease();
    sub_162C8(v16);
    unint64_t v17 = sub_11A14((uint64_t)v102, v15);
    swift_bridgeObjectRelease();
    sub_162C8(v17);
    unint64_t v18 = sub_11E74((uint64_t)v103, v15);
    swift_bridgeObjectRelease();
    sub_162C8(v18);
    swift_release();
    (*v92)(v15, v8);
    uint64_t v12 = v14;
    if (v14 == v98)
    {
      swift_bridgeObjectRelease();
      uint64_t v11 = v120;
      a3 = v90;
      uint64_t v88 = v100;
LABEL_91:
      *a3 = v11;
      a3[1] = v88;
      return;
    }
  }
  uint64_t v23 = v112;
  if (v34)
  {
    id v40 = (id)sub_30FB0();
    goto LABEL_28;
  }
  if ((v33 & 0x8000000000000000) != 0) {
    goto LABEL_93;
  }
  if (v33 < *(void *)((char *)&dword_10 + (v31 & 0xFFFFFFFFFFFFFF8)))
  {
    id v40 = *(id *)(v31 + 8 * v33 + 32);
LABEL_28:
    uint64_t v41 = v40;
    uint64_t v42 = sub_305E0();

    uint64_t v29 = v107;
    uint64_t v100 = v42;
    if (!v42) {
      goto LABEL_95;
    }
    goto LABEL_33;
  }
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
}

uint64_t sub_15FCC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (isUniquelyReferenced_nonNull_native)
  {
    uint64_t v7 = *(void *)(v3 + 24) >> 1;
    if (v7 >= v4 + v2)
    {
      if (*(void *)(a1 + 16)) {
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_30FC0();
  swift_bridgeObjectRelease();
  *uint64_t v1 = v3;
  uint64_t v7 = *(void *)(v3 + 24) >> 1;
  if (!*(void *)(a1 + 16))
  {
LABEL_15:
    if (!v2) {
      goto LABEL_16;
    }
    goto LABEL_20;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  if (v7 - v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v9 = v3 + 8 * v8 + 32;
  if (a1 + 32 < v9 + 8 * v2 && v9 < a1 + 32 + 8 * v2) {
    goto LABEL_23;
  }
  sub_4F90(&qword_3E228);
  swift_arrayInitWithCopy();
  if (v2)
  {
    uint64_t v11 = *(void *)(*v1 + 16);
    BOOL v12 = __OFADD__(v11, v2);
    uint64_t v13 = v11 + v2;
    if (!v12)
    {
      *(void *)(*v1 + 16) = v13;
      goto LABEL_16;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    uint64_t result = sub_310E0();
    __break(1u);
    return result;
  }
LABEL_16:
  swift_bridgeObjectRelease();

  return sub_30D60();
}

uint64_t sub_16174(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_22F58(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_162C8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_31090();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_31090();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((char *)&dword_18 + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_30FC0();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1AFC0(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_31090();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_30D60();
}

uint64_t sub_16494(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v62 = a3;
  uint64_t v69 = a2;
  uint64_t v5 = sub_304D0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ItemSequenceData();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  BOOL v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  __chkstk_darwin(v14);
  unint64_t v17 = (unint64_t *)((char *)&v57 - v15);
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void *)(*(void *)a1 + 16);
  if (!v19) {
    goto LABEL_27;
  }
  uint64_t v65 = v6;
  unint64_t v60 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v20 = *(void *)(v10 + 72);
  uint64_t v58 = (void *)v16;
  uint64_t v59 = v20;
  sub_1C788(v18 + v60 + v20 * (v19 - 1), (uint64_t)&v57 - v15);
  uint64_t v61 = v9;
  uint64_t v57 = (char *)v17 + *(int *)(v9 + 28);
  sub_30460();
  unint64_t v66 = v17;
  uint64_t v67 = v8;
  unint64_t v21 = *v17;
  if (*v17 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v8 = v67;
    unint64_t v22 = sub_31090();
    if (v22) {
      goto LABEL_4;
    }
    goto LABEL_53;
  }
  unint64_t v22 = *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain_n();
  if (!v22)
  {
LABEL_53:
    swift_bridgeObjectRelease_n();
LABEL_26:
    (*(void (**)(char *, uint64_t))(v65 + 8))(v8, v5);
    sub_1C7EC((uint64_t)v66);
LABEL_27:
    sub_1C788((uint64_t)v69, (uint64_t)v13);
    unint64_t v21 = *(void *)a1;
    if (swift_isUniquelyReferenced_nonNull_native())
    {
LABEL_28:
      unint64_t v30 = *(void *)(v21 + 16);
      unint64_t v29 = *(void *)(v21 + 24);
      if (v30 >= v29 >> 1) {
        unint64_t v21 = sub_2318C(v29 > 1, v30 + 1, 1, v21);
      }
      *(void *)(v21 + 16) = v30 + 1;
      uint64_t result = sub_1AF5C((uint64_t)v13, v21+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v30);
      *(void *)a1 = v21;
      return result;
    }
LABEL_51:
    unint64_t v21 = sub_2318C(0, *(void *)(v21 + 16) + 1, 1, v21);
    goto LABEL_28;
  }
LABEL_4:
  uint64_t v68 = v5;
  uint64_t v63 = v3;
  while (1)
  {
    BOOL v23 = __OFSUB__(v22--, 1);
    if (v23)
    {
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }
    if ((v21 & 0xC000000000000001) != 0)
    {
      uint64_t v24 = sub_30FB0();
    }
    else
    {
      if ((v22 & 0x8000000000000000) != 0) {
        goto LABEL_48;
      }
      if (v22 >= *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8))) {
        goto LABEL_49;
      }
      uint64_t v24 = *(void *)(v21 + 32 + 8 * v22);
      swift_retain();
    }
    if (*(void *)(*(void *)(v24 + 64) + 16)) {
      break;
    }
    swift_release();
    if (!v22)
    {
      swift_bridgeObjectRelease_n();
LABEL_25:
      uint64_t v8 = v67;
      uint64_t v5 = v68;
      goto LABEL_26;
    }
  }
  swift_bridgeObjectRelease_n();
  unint64_t v21 = *v69;
  uint64_t v64 = (unint64_t *)a1;
  if (v21 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v25 = sub_31090();
    if (v25) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }
  uint64_t v25 = *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain_n();
  if (!v25)
  {
LABEL_24:
    swift_bridgeObjectRelease_n();
    swift_release();
    a1 = (uint64_t)v64;
    goto LABEL_25;
  }
LABEL_16:
  a1 = 4;
  while (1)
  {
    uint64_t v26 = a1 - 4;
    if ((v21 & 0xC000000000000001) != 0)
    {
      uint64_t v27 = sub_30FB0();
      BOOL v23 = __OFADD__(v26, 1);
      uint64_t v28 = a1 - 3;
      if (v23) {
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v27 = *(void *)(v21 + 8 * a1);
      swift_retain();
      BOOL v23 = __OFADD__(v26, 1);
      uint64_t v28 = a1 - 3;
      if (v23) {
        goto LABEL_50;
      }
    }
    if (*(void *)(*(void *)(v27 + 64) + 16)) {
      break;
    }
    swift_release();
    ++a1;
    if (v28 == v25) {
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease_n();
  sub_1C698(&qword_3E170, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v8 = v67;
  uint64_t v5 = v68;
  if (sub_30C90())
  {
    swift_release();
    swift_release();
    a1 = (uint64_t)v64;
    goto LABEL_26;
  }
  sub_4F90(&qword_3DED0);
  uint64_t inited = (void *)swift_initStackObject();
  *((_OWORD *)inited + 1) = xmmword_31EC0;
  inited[4] = v24;
  inited[5] = v27;
  uint64_t v70 = inited;
  sub_30D60();
  unint64_t v33 = (unint64_t)v70;
  uint64_t v70 = _swiftEmptyArrayStorage;
  swift_retain();
  swift_retain();
  uint64_t v34 = sub_13024(v33, (unint64_t *)&v70);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v35 = *(void *)(v34 + 16);
  a1 = (uint64_t)v64;
  if (v35) {
    double v36 = *(double *)(v34 + 8 * v35 + 24);
  }
  else {
    double v36 = -1.0;
  }
  swift_bridgeObjectRelease();
  uint64_t v37 = sub_1ABC0((void *)(v62 + 160), *(void *)(v62 + 184));
  sub_30890();
  if (v38 >= v36)
  {
    swift_release();
    swift_release();
    goto LABEL_25;
  }
  unint64_t v39 = *(void *)a1;
  if (*(void *)(*(void *)a1 + 16))
  {
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      uint64_t v40 = *(void *)(v39 + 16);
      if (v40) {
        goto LABEL_40;
      }
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
  }
  else
  {
    __break(1u);
  }
  unint64_t v39 = sub_2F368(v39);
  uint64_t v40 = *(void *)(v39 + 16);
  if (!v40) {
    goto LABEL_58;
  }
LABEL_40:
  uint64_t v41 = v40 - 1;
  sub_1C7EC(v39 + v60 + (v40 - 1) * v59);
  *(void *)(v39 + 16) = v41;
  uint64_t v42 = v66;
  uint64_t v70 = (void *)*v66;
  swift_bridgeObjectRetain();
  unint64_t v43 = swift_bridgeObjectRetain();
  sub_162C8(v43);
  uint64_t v63 = v70;
  uint64_t v37 = (void *)v42[1];
  swift_bridgeObjectRetain_n();
  unint64_t v44 = (unint64_t)v37;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_59:
  }
    unint64_t v44 = (unint64_t)sub_231B0(0, v37[2] + 1, 1, v37);
  unint64_t v46 = *(void *)(v44 + 16);
  unint64_t v45 = *(void *)(v44 + 24);
  unint64_t v47 = v46 + 1;
  if (v46 >= v45 >> 1) {
    unint64_t v44 = (unint64_t)sub_231B0((void *)(v45 > 1), v46 + 1, 1, (void *)v44);
  }
  *(void *)(v44 + 16) = v47;
  *(double *)(v44 + 8 * v46 + 32) = v36;
  swift_bridgeObjectRelease();
  unint64_t v48 = v69[1];
  uint64_t v49 = *(void *)(v48 + 16);
  if (v49)
  {
    unint64_t v50 = (2 * v49) | 1;
    uint64_t v70 = (void *)v44;
    uint64_t v51 = swift_bridgeObjectRetain();
    sub_1C848(v51, v48 + 32, 1, v50);
    swift_bridgeObjectRelease();
    uint64_t v52 = v70;
    uint64_t v53 = (void *)v66[2];
    uint64_t v54 = v58;
    (*(void (**)(uint64_t, char *, uint64_t))(v65 + 16))((uint64_t)v58 + *(int *)(v61 + 28), v57, v68);
    *uint64_t v54 = v63;
    v54[1] = v52;
    v54[2] = v53;
    unint64_t v47 = *(void *)(v39 + 16);
    unint64_t v44 = *(void *)(v39 + 24);
    uint64_t v37 = (void *)(v47 + 1);
    id v55 = v53;
    if (v47 < v44 >> 1) {
      goto LABEL_45;
    }
  }
  else
  {
    __break(1u);
  }
  unint64_t v39 = sub_2318C(v44 > 1, (int64_t)v37, 1, v39);
LABEL_45:
  uint64_t v56 = v64;
  *(void *)(v39 + 16) = v37;
  sub_1AF5C((uint64_t)v58, v39 + v60 + v47 * v59);
  swift_release();
  swift_release();
  *uint64_t v56 = v39;
  (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v68);
  return sub_1C7EC((uint64_t)v66);
}

uint64_t sub_16C8C()
{
  v1[15] = v0;
  uint64_t v2 = type metadata accessor for ItemSequenceData();
  v1[16] = v2;
  v1[17] = *(void *)(v2 - 8);
  v1[18] = swift_task_alloc();
  uint64_t v3 = sub_304D0();
  v1[19] = v3;
  v1[20] = *(void *)(v3 - 8);
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  uint64_t v4 = sub_30610();
  v1[25] = v4;
  v1[26] = *(void *)(v4 - 8);
  v1[27] = swift_task_alloc();
  sub_4F90(&qword_3E0E8);
  v1[28] = swift_task_alloc();
  uint64_t v5 = sub_4F90(&qword_3E0F0);
  v1[29] = v5;
  v1[30] = *(void *)(v5 - 8);
  v1[31] = swift_task_alloc();
  uint64_t v6 = sub_4F90(&qword_3E0F8);
  v1[32] = v6;
  v1[33] = *(void *)(v6 - 8);
  v1[34] = swift_task_alloc();
  uint64_t v7 = sub_4F90(&qword_3E100);
  v1[35] = v7;
  v1[36] = *(void *)(v7 - 8);
  v1[37] = swift_task_alloc();
  sub_4F90(&qword_3E108);
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  sub_4F90(&qword_3D9C8);
  v1[41] = swift_task_alloc();
  v1[42] = swift_task_alloc();
  v1[43] = swift_task_alloc();
  uint64_t v8 = sub_4F90(&qword_3E110);
  v1[44] = v8;
  v1[45] = *(void *)(v8 - 8);
  v1[46] = swift_task_alloc();
  uint64_t v9 = sub_4F90(&qword_3E118);
  v1[47] = v9;
  v1[48] = *(void *)(v9 - 8);
  v1[49] = swift_task_alloc();
  uint64_t v10 = sub_4F90(&qword_3E120);
  v1[50] = v10;
  v1[51] = *(void *)(v10 - 8);
  v1[52] = swift_task_alloc();
  v1[53] = swift_task_alloc();
  return _swift_task_switch(sub_17144, 0, 0);
}

uint64_t sub_17144()
{
  sub_1ABC0((void *)(v0[15] + 56), *(void *)(v0[15] + 80));
  uint64_t v1 = sub_30770();
  if (!v1)
  {
    sub_30680();
    uint64_t v1 = sub_30670();
  }
  v0[54] = v1;
  uint64_t v3 = v0[45];
  uint64_t v2 = v0[46];
  uint64_t v4 = v0[44];
  uint64_t v5 = v0[15];
  sub_1ABC0((void *)(v5 + 16), *(void *)(v5 + 40));
  sub_308F0();
  sub_1ABC0((void *)(v5 + 16), *(void *)(v5 + 40));
  sub_308E0();
  sub_306F0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[55] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_17300;
  uint64_t v7 = v0[47];
  uint64_t v8 = v0[40];
  return AnyAsyncIterator.next()(v8, v7);
}

uint64_t sub_17300()
{
  *(void *)(*(void *)v1 + 448) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_18FA0;
  }
  else {
    uint64_t v2 = sub_17414;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_17414()
{
  uint64_t v1 = *(void *)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  *(void *)(v0 + 456) = v4;
  *(void *)(v0 + 464) = (v3 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v4(v1, 1, v2) == 1)
  {
    uint64_t v5 = &qword_3E108;
LABEL_5:
    sub_DD28(v1, v5);
    double v10 = 0.0;
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(v0 + 344);
  uint64_t v7 = *(void *)(v0 + 152);
  uint64_t v8 = *(void *)(v0 + 160);
  sub_305F0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  int v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  uint64_t v1 = *(void *)(v0 + 344);
  if (v9 == 1)
  {
    uint64_t v5 = &qword_3D9C8;
    goto LABEL_5;
  }
  uint64_t v11 = *(void *)(v0 + 152);
  uint64_t v12 = *(void *)(v0 + 160);
  sub_30480();
  double v10 = v13;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v11);
LABEL_7:
  double v14 = fabs(v10);
  if (qword_3D730 != -1) {
    swift_once();
  }
  double v15 = v14 / 86400.0;
  uint64_t v16 = sub_30C50();
  *(void *)(v0 + 472) = sub_DA38(v16, (uint64_t)qword_3EB98);
  unint64_t v17 = sub_30C30();
  os_log_type_t v18 = sub_30E10();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 134217984;
    *(double *)(v0 + 112) = v15;
    sub_30EA0();
    _os_log_impl(&dword_0, v17, v18, "Oldest conversation relative day: %f", v19, 0xCu);
    swift_slowDealloc();
  }

  if (qword_3D728 != -1) {
    swift_once();
  }
  if (byte_3DF88)
  {
    uint64_t v20 = sub_30C30();
    os_log_type_t v21 = sub_30E10();
    if (os_log_type_enabled(v20, v21))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v22 = 0;
      _os_log_impl(&dword_0, v20, v21, "Debug mode is on for RECTIFI. Running without bookmarking.", v22, 2u);
      swift_slowDealloc();
    }

    goto LABEL_23;
  }
  sub_1ABC0((void *)(*(void *)(v0 + 120) + 160), *(void *)(*(void *)(v0 + 120) + 184));
  sub_30880();
  if (v15 >= v23)
  {
LABEL_23:
    uint64_t v35 = sub_30C30();
    os_log_type_t v36 = sub_30E10();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_0, v35, v36, "Starting to process conversations in fetchRecentSequence", v37, 2u);
      swift_slowDealloc();
    }
    uint64_t v39 = *(void *)(v0 + 416);
    uint64_t v38 = *(void *)(v0 + 424);
    uint64_t v41 = *(void *)(v0 + 400);
    uint64_t v40 = *(void *)(v0 + 408);
    uint64_t v43 = *(void *)(v0 + 240);
    uint64_t v42 = *(void *)(v0 + 248);
    uint64_t v50 = *(void *)(v0 + 232);
    uint64_t v44 = *(void *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v39, v38, v41);
    uint64_t v45 = swift_allocObject();
    *(void *)(v45 + 16) = &unk_3E130;
    *(void *)(v45 + 24) = v44;
    sub_1C740(&qword_3E148, &qword_3E120);
    swift_retain();
    sub_31070();
    *(void *)(v0 + 80) = _swiftEmptyArrayStorage;
    sub_1C740(&qword_3E150, &qword_3E100);
    sub_30DE0();
    sub_307D0();
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v42, v50);
    uint64_t v46 = sub_1C740(&qword_3E158, &qword_3E0F8);
    unint64_t v47 = (void *)swift_task_alloc();
    *(void *)(v0 + 480) = v47;
    *unint64_t v47 = v0;
    v47[1] = sub_17B88;
    uint64_t v48 = *(void *)(v0 + 256);
    uint64_t v49 = *(void *)(v0 + 224);
    return dispatch thunk of AsyncIteratorProtocol.next()(v49, v48, v46);
  }
  uint64_t v24 = sub_30C30();
  os_log_type_t v25 = sub_30E10();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 134217984;
    *(double *)(v0 + 104) = v15;
    sub_30EA0();
    _os_log_impl(&dword_0, v24, v25, "PatternExtractionPlugin fetchRecentSequence did not run because oldest conversation is still %f days old", v26, 0xCu);
    swift_slowDealloc();
  }
  uint64_t v27 = *(void *)(v0 + 424);
  uint64_t v28 = *(void *)(v0 + 400);
  uint64_t v29 = *(void *)(v0 + 408);
  uint64_t v31 = *(void *)(v0 + 384);
  uint64_t v30 = *(void *)(v0 + 392);
  uint64_t v32 = *(void *)(v0 + 376);

  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v33 = *(uint64_t (**)(void *))(v0 + 8);
  return v33(_swiftEmptyArrayStorage);
}

uint64_t sub_17B88()
{
  *(void *)(*(void *)v1 + 488) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_18D14;
  }
  else {
    uint64_t v2 = sub_17C9C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_17C9C()
{
  Swift::Int v144 = v0;
  uint64_t v1 = v0[28];
  uint64_t v2 = sub_4F90(&qword_3E168);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) != 1)
  {
    uint64_t v7 = v0[42];
    uint64_t v8 = v0[39];
    uint64_t v9 = v0[19];
    uint64_t v10 = v0[20];
    uint64_t v11 = v1 + *(int *)(v2 + 48);
    (*(void (**)(void, uint64_t, void))(v0[26] + 32))(v0[27], v1, v0[25]);
    sub_1AEB8(v11, v8);
    sub_305F0();
    uint64_t v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    if (v12(v7, 1, v9) == 1)
    {
      uint64_t v13 = v0[42];
      uint64_t v15 = v0[26];
      uint64_t v14 = v0[27];
      uint64_t v16 = v0[25];
      sub_DD28(v0[39], &qword_3E108);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
      sub_DD28(v13, &qword_3D9C8);
LABEL_6:
      uint64_t v17 = sub_1C740(&qword_3E158, &qword_3E0F8);
      os_log_type_t v18 = (void *)swift_task_alloc();
      v0[60] = v18;
      *os_log_type_t v18 = v0;
      v18[1] = sub_17B88;
      uint64_t v19 = v0[32];
      uint64_t v20 = v0[28];
      return dispatch thunk of AsyncIteratorProtocol.next()(v20, v19, v17);
    }
    uint64_t v28 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[57];
    uint64_t v30 = v0[38];
    uint64_t v29 = v0[39];
    uint64_t v31 = v0[25];
    uint64_t v134 = *(void (**)(void, void, void))(v0[20] + 32);
    v134(v0[24], v0[42], v0[19]);
    sub_30460();
    sub_DCA4(v29, v30, &qword_3E108);
    int v32 = v28(v30, 1, v31);
    uint64_t v33 = v0[41];
    uint64_t v34 = v0[38];
    if (v32 == 1)
    {
      uint64_t v35 = v0[19];
      uint64_t v36 = v0[20];
      sub_DD28(v0[38], &qword_3E108);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v36 + 56))(v33, 1, 1, v35);
    }
    else
    {
      uint64_t v38 = v0[25];
      uint64_t v39 = v0[26];
      uint64_t v40 = v0[19];
      sub_305F0();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v34, v38);
      if (v12(v33, 1, v40) != 1)
      {
        v134(v0[21], v0[41], v0[19]);
LABEL_31:
        uint64_t v140 = v0[61];
        uint64_t v57 = v0[23];
        uint64_t v59 = v0[21];
        uint64_t v58 = v0[22];
        uint64_t v61 = v0[19];
        uint64_t v60 = v0[20];
        uint64_t v62 = v0[15];
        sub_1C698(&qword_3E170, (void (*)(uint64_t))&type metadata accessor for Date);
        char v63 = sub_30C90();
        uint64_t v64 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16);
        if (v63) {
          uint64_t v65 = v59;
        }
        else {
          uint64_t v65 = v58;
        }
        v64(v57, v65, v61);
        unint64_t v66 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
        v66(v59, v61);
        v128 = v66;
        v66(v58, v61);
        sub_1ABC0((void *)(v62 + 120), *(void *)(v62 + 144));
        sub_1942C();
        uint64_t v67 = swift_allocObject();
        *(_OWORD *)(v67 + 16) = xmmword_31ED0;
        *(void *)(v67 + 32) = sub_1AF20(0, &qword_3E178);
        *(void *)(v67 + 40) = sub_1AF20(0, &qword_3E180);
        *(void *)(v67 + 48) = sub_1AF20(0, &qword_3E188);
        *(void *)(v67 + 56) = sub_1AF20(0, &qword_3E190);
        *(void *)(v67 + 64) = sub_1AF20(0, &qword_3E198);
        *(void *)(v67 + 72) = sub_1AF20(0, &qword_3E1A0);
        *(void *)(v67 + 80) = type metadata accessor for MTCreateAlarmIntent();
        *(void *)(v67 + 88) = type metadata accessor for MTUpdateAlarmIntent();
        *(void *)(v67 + 96) = type metadata accessor for MTToggleAlarmIntent();
        *(void *)(v67 + 104) = type metadata accessor for LocateDeviceIntent();
        *(void *)(v67 + 112) = type metadata accessor for LocateIntent();
        *(void *)(v67 + 120) = type metadata accessor for PlaySoundIntent();
        sub_30700();
        if (v140)
        {
          uint64_t v130 = v0[51];
          uint64_t v132 = v0[50];
          uint64_t v136 = v0[53];
          uint64_t v126 = v0[49];
          uint64_t v68 = v0[48];
          uint64_t v69 = v0[36];
          uint64_t v123 = v0[37];
          uint64_t v125 = v0[47];
          uint64_t v70 = v0[33];
          uint64_t v121 = v0[34];
          uint64_t v122 = v0[35];
          uint64_t v119 = v0[39];
          uint64_t v120 = v0[32];
          uint64_t v71 = v0[26];
          uint64_t v72 = v0[24];
          uint64_t v117 = v0[25];
          uint64_t v118 = v0[27];
          uint64_t v73 = v0[23];
          uint64_t v74 = v0[19];

          swift_bridgeObjectRelease();
          v128(v73, v74);
          v128(v72, v74);
          sub_DD28(v119, &qword_3E108);
          (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v118, v117);
          (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v121, v120);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v123, v122);
          (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v126, v125);
          (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v136, v132);
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
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          swift_task_dealloc();
          uint64_t v75 = (uint64_t (*)(void))v0[1];
          return v75();
        }
        v141 = (void (*)(char *, uint64_t, uint64_t))v64;
        uint64_t v76 = (void *)v0[15];
        swift_bridgeObjectRelease();
        sub_31050();
        swift_release();
        sub_30600();
        sub_31050();
        swift_release();
        sub_30AA0();
        sub_30660();
        uint64_t v77 = sub_30AD0();
        swift_release();
        swift_release();
        sub_15048(v77, v76, v0 + 5);
        swift_bridgeObjectRelease();
        unint64_t v80 = v0[5];
        uint64_t v79 = (void *)v0[6];
        if (v80 >> 62)
        {
LABEL_56:
          swift_bridgeObjectRetain_n();
          char v81 = (void *)sub_31090();
          swift_bridgeObjectRelease();
        }
        else
        {
          char v81 = *(void **)((char *)&dword_10 + (v80 & 0xFFFFFFFFFFFFFF8));
          swift_bridgeObjectRetain();
        }
        uint64_t v137 = (uint64_t)v81;
        if (!v81)
        {
          uint64_t v109 = v0[39];
          uint64_t v142 = v0[27];
          uint64_t v110 = v79;
          uint64_t v112 = v0[25];
          uint64_t v111 = v0[26];
          uint64_t v114 = v0[23];
          uint64_t v113 = v0[24];
          uint64_t v115 = v0[19];
          swift_bridgeObjectRelease_n();

          v128(v114, v115);
          v128(v113, v115);
          sub_DD28(v109, &qword_3E108);
          (*(void (**)(uint64_t, uint64_t))(v111 + 8))(v142, v112);
          goto LABEL_6;
        }
        if (*(void *)((char *)&dword_10 + (v80 & 0xFFFFFFFFFFFFFF8)))
        {
          char v81 = v0 + 11;
          uint64_t v82 = *(void *)(v80 + 32);
          uint64_t v83 = *(void *)(v82 + 16);
          v0[11] = _swiftEmptyArrayStorage;
          if (v137 >= 1)
          {
            uint64_t v124 = v79;
            swift_bridgeObjectRetain();
            swift_retain();
            uint64_t v84 = 0;
            uint64_t v131 = v82;
            unint64_t v133 = v80;
            uint64_t v129 = v0;
            do
            {
              uint64_t v85 = *(void *)(v80 + 8 * v84 + 32);
              uint64_t v86 = *(void *)(v85 + 16);
              uint64_t v79 = (void *)(v86 - v83);
              if (__OFSUB__(v86, v83))
              {
                __break(1u);
LABEL_55:
                __break(1u);
                goto LABEL_56;
              }
              uint64_t v87 = *(void *)(v82 + 16);
              uint64_t v88 = v86 - v87;
              if (__OFSUB__(v86, v87)) {
                goto LABEL_55;
              }
              uint64_t v89 = *(void *)(v85 + 24);
              uint64_t v90 = *(void *)(v85 + 32);
              __int16 v91 = *(_WORD *)(v85 + 40);
              uint64_t v92 = *(void *)(v85 + 64);
              type metadata accessor for SequenceItem();
              uint64_t v93 = swift_allocObject();
              *(void *)(v93 + 48) = v84;
              *(void *)(v93 + 56) = v79;
              *(void *)(v93 + 64) = v92;
              *(void *)(v93 + 16) = v88;
              *(void *)(v93 + 24) = v89;
              *(void *)(v93 + 32) = v90;
              *(_WORD *)(v93 + 40) = v91;
              swift_retain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              sub_30D40();
              if (*(void *)((char *)&dword_10 + (*v81 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                              + (*v81 & 0xFFFFFFFFFFFFFF8)) >> 1)
                sub_30D70();
              ++v84;
              sub_30D90();
              sub_30D60();
              uint64_t v83 = *(void *)(v85 + 16);
              swift_release();
              unint64_t v80 = v133;
              uint64_t v0 = v129;
              uint64_t v82 = v131;
            }
            while (v137 != v84);
            uint64_t v94 = v129[24];
            uint64_t v95 = v129[19];
            uint64_t v96 = (char *)v129[18];
            uint64_t v97 = v129[16];
            swift_bridgeObjectRelease();
            uint64_t v98 = v129[11];
            v143[0] = (unint64_t)_swiftEmptyArrayStorage;
            uint64_t v99 = sub_13024(v133, v143);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v141(&v96[*(int *)(v97 + 28)], v94, v95);
            *(void *)uint64_t v96 = v98;
            *((void *)v96 + 1) = v99;
            *((void *)v96 + 2) = v124;
            char v81 = (void *)v129[10];
            v141 = v124;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              goto LABEL_59;
            }
            goto LABEL_50;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
LABEL_59:
        char v81 = (void *)sub_2318C(0, v81[2] + 1, 1, (unint64_t)v81);
LABEL_50:
        unint64_t v101 = v81[2];
        unint64_t v100 = v81[3];
        if (v101 >= v100 >> 1) {
          char v81 = (void *)sub_2318C(v100 > 1, v101 + 1, 1, (unint64_t)v81);
        }
        uint64_t v102 = v0[39];
        uint64_t v103 = v0[26];
        uint64_t v138 = v0[27];
        uint64_t v104 = v0[24];
        uint64_t v127 = v0[25];
        uint64_t v105 = v0[23];
        uint64_t v106 = v0[18];
        uint64_t v107 = v0[19];
        uint64_t v108 = v0[17];
        v81[2] = v101 + 1;
        sub_1AF5C(v106, (uint64_t)v81+ ((*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80))+ *(void *)(v108 + 72) * v101);
        swift_bridgeObjectRelease();

        swift_release();
        v0[10] = v81;
        v128(v105, v107);
        v128(v104, v107);
        sub_DD28(v102, &qword_3E108);
        (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v138, v127);
        goto LABEL_6;
      }
    }
    uint64_t v41 = v0[41];
    sub_30450();
    sub_DD28(v41, &qword_3D9C8);
    goto LABEL_31;
  }
  (*(void (**)(void, void))(v0[33] + 8))(v0[34], v0[32]);
  uint64_t v3 = v0[10];
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_30C30();
  os_log_type_t v5 = sub_30E10();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 134217984;
    v0[9] = *(void *)(v3 + 16);
    sub_30EA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v4, v5, "Completed processing conversations in fetchRecentSequence. Computed a total of %ld sequences", v6, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_beginAccess();
  uint64_t v21 = v0[10];
  v143[0] = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v22 = *(void *)(v21 + 16);
  if (v22)
  {
    uint64_t v23 = v0[17];
    unint64_t v24 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    uint64_t v25 = *(void *)(v23 + 72);
    uint64_t v26 = v0[61];
    uint64_t v27 = v0[15];
    swift_bridgeObjectRetain();
    sub_16494((uint64_t)v143, (unint64_t *)(v21 + v24), v27);
    if (v26)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t v42 = v22 - 1;
    if (v22 != 1)
    {
      uint64_t v43 = (unint64_t *)(v21 + v25 + v24);
      do
      {
        sub_16494((uint64_t)v143, v43, v0[15]);
        uint64_t v43 = (unint64_t *)((char *)v43 + v25);
        --v42;
      }
      while (v42);
    }
    swift_bridgeObjectRelease_n();
    uint64_t v37 = (void *)v143[0];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v37 = _swiftEmptyArrayStorage;
  }
  unint64_t v139 = v37;
  swift_bridgeObjectRetain();
  uint64_t v44 = sub_30C30();
  os_log_type_t v45 = sub_30E10();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 134217984;
    v0[8] = v139[2];
    sub_30EA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v44, v45, "Completed stitching conversations in fetchRecentSequence. Computed a total of %ld sequences", v46, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  unint64_t v47 = v44;
  uint64_t v135 = v0[53];
  uint64_t v49 = v0[50];
  uint64_t v48 = v0[51];
  uint64_t v51 = v0[48];
  uint64_t v50 = v0[49];
  uint64_t v52 = v0[47];
  uint64_t v53 = v0[36];
  uint64_t v54 = v0[37];
  uint64_t v55 = v0[35];

  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v54, v55);
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v52);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v135, v49);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v56 = (uint64_t (*)(void *))v0[1];
  return v56(v139);
}

uint64_t sub_18D14()
{
  *(void *)(v0 + 56) = *(void *)(v0 + 488);
  sub_4F90(&qword_3E160);
  swift_willThrowTypedImpl();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_18DA8, 0, 0);
}

uint64_t sub_18DA8()
{
  uint64_t v1 = *(void *)(v0 + 408);
  uint64_t v13 = *(void *)(v0 + 400);
  uint64_t v14 = *(void *)(v0 + 424);
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v12 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 376);
  uint64_t v4 = *(void *)(v0 + 288);
  uint64_t v5 = *(void *)(v0 + 296);
  uint64_t v7 = *(void *)(v0 + 272);
  uint64_t v6 = *(void *)(v0 + 280);
  uint64_t v9 = *(void *)(v0 + 256);
  uint64_t v8 = *(void *)(v0 + 264);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v3);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v14, v13);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_18FA0()
{
  uint64_t v1 = *(void *)(v0 + 424);
  uint64_t v2 = *(void *)(v0 + 400);
  uint64_t v3 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 384);
  uint64_t v4 = *(void *)(v0 + 392);
  uint64_t v6 = *(void *)(v0 + 376);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_19158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return _swift_task_switch(sub_1917C, 0, 0);
}

uint64_t sub_1917C()
{
  uint64_t v1 = (void *)v0[4];
  if (v1)
  {
    uint64_t v2 = qword_3D728;
    id v3 = v1;
    if (v2 != -1) {
      swift_once();
    }
    if ((byte_3DF88 & 1) == 0)
    {
      sub_1ABC0((void *)(v0[5] + 56), *(void *)(v0[5] + 80));
      sub_30780();
    }
  }
  uint64_t v4 = v0[2];
  uint64_t v5 = v0[3];
  uint64_t v6 = sub_30610();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v4, v5, v6);
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_19294(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = *(void *)(a2 + *(int *)(sub_4F90(&qword_3E218) + 48));
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_1D04C;
  return v10(a1, a2, v7);
}

uint64_t sub_193A0()
{
  sub_1C630(v0 + 16);
  sub_1C630(v0 + 56);
  swift_release();
  swift_release();
  swift_release();
  sub_1C630(v0 + 120);
  sub_1C630(v0 + 160);

  return _swift_deallocClassInstance(v0, 224, 7);
}

uint64_t type metadata accessor for ItemSequenceFetcher()
{
  return self;
}

uint64_t sub_1942C()
{
  uint64_t v0 = sub_4F90(&qword_3E208);
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1) {
    uint64_t v2 = &qword_3DED0;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_3E210;
  }

  return sub_4F90(v2);
}

Swift::Int sub_1948C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1B20C(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_194F8(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_194F8(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = sub_311A0(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_19BE4(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  Swift::Int v105 = result;
  uint64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      uint64_t v11 = (char *)_swiftEmptyArrayStorage;
LABEL_118:
      uint64_t v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          uint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_19CB4((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v97 = sub_1A454((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          unint64_t v100 = &v97[16 * v96 + 32];
          *(void *)unint64_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      v104[2] = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_30D80();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_311C0();
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_311C0()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      Swift::Int v22 = v20 + 1;
      Swift::Int v9 = v20;
      Swift::Int v20 = v22;
    }
    while (v22 < v3);
    Swift::Int v20 = v22;
LABEL_36:
    Swift::Int v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        Swift::Int v27 = v20;
        Swift::Int v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      Swift::Int v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_19F50(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_19F50((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v42 = v11 + 32;
    uint64_t v43 = &v11[16 * v41 + 32];
    *(void *)uint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      Swift::Int v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          uint64_t v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        uint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        uint64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
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
          __break(1u);
LABEL_148:
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
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        uint64_t v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_19CB4((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        uint64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        uint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        Swift::Int v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    Swift::Int v32 = v3;
  }
  else {
    Swift::Int v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      uint64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        uint64_t v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        Swift::Int v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_311C0() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)uint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      Swift::Int v9 = v32;
    }
    goto LABEL_67;
  }
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
  Swift::Int result = sub_31080();
  __break(1u);
  return result;
}

uint64_t sub_19BE4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = sub_311C0(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_19CB4(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  Swift::Int v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      Swift::Int v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        os_log_type_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          Swift::Int v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_311C0() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)os_log_type_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)os_log_type_t v18 = *(_OWORD *)v19;
            }
            Swift::Int v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_311C0() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      Swift::Int v27 = v7;
    }
LABEL_50:
    sub_1A258((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

char *sub_19F50(char *result, int64_t a2, char a3, char *a4)
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
    sub_4F90(&qword_3E200);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1A04C(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -40)
  {
    uint64_t result = (char *)sub_310E0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    size_t v6 = 40 * (v4 / 40);
    if (result != v3 || result >= &v3[v6])
    {
      return (char *)memmove(result, v3, v6);
    }
  }
  return result;
}

uint64_t sub_1A114(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_4F90(&qword_3D9F0);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_310E0();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_1A258(void **a1, const void **a2, void *a3)
{
  unint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_310E0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

uint64_t sub_1A314(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for PatternStoreValue(0);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_310E0();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_1A454(uint64_t a1)
{
  return sub_19F50(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_1A468(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3)
  {
    swift_release();
    return &_swiftEmptySetSingleton;
  }
  uint64_t v4 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return (void *)a4;
  }
  sub_4F90(&qword_3E220);
  uint64_t result = (void *)sub_30F60();
  uint64_t v5 = (uint64_t)result;
  if (a2 < 1) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  while (1)
  {
    if (v9)
    {
      v9 &= v9 - 1;
    }
    else
    {
      uint64_t v11 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_30;
      }
      if (v11 >= a2)
      {
LABEL_27:
        swift_release();
        return (void *)v5;
      }
      uint64_t v12 = a1[v11];
      ++v10;
      if (!v12)
      {
        uint64_t v10 = v11 + 1;
        if (v11 + 1 >= a2) {
          goto LABEL_27;
        }
        uint64_t v12 = a1[v10];
        if (!v12)
        {
          uint64_t v10 = v11 + 2;
          if (v11 + 2 >= a2) {
            goto LABEL_27;
          }
          uint64_t v12 = a1[v10];
          if (!v12)
          {
            uint64_t v13 = v11 + 3;
            if (v13 >= a2) {
              goto LABEL_27;
            }
            uint64_t v12 = a1[v13];
            if (!v12)
            {
              while (1)
              {
                uint64_t v10 = v13 + 1;
                if (__OFADD__(v13, 1)) {
                  goto LABEL_31;
                }
                if (v10 >= a2) {
                  goto LABEL_27;
                }
                uint64_t v12 = a1[v10];
                ++v13;
                if (v12) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v13;
          }
        }
      }
LABEL_24:
      uint64_t v9 = (v12 - 1) & v12;
    }
    uint64_t v14 = swift_retain();
    uint64_t result = (void *)sub_2DAB4(v14, v5);
    if (__OFSUB__(v4--, 1)) {
      break;
    }
    if (!v4) {
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_1A5F0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_4F90(&qword_3E1E8);
  uint64_t result = sub_30F60();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_31210();
    swift_bridgeObjectRetain();
    sub_30CF0();
    uint64_t result = sub_31230();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    Swift::Int v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    *Swift::Int v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1A888(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_1A9EC((uint64_t)&v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v4, v2);
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v6 = sub_1A9EC((uint64_t)v7, v4, v2);
    swift_release();
    swift_slowDealloc();
  }
  return v6;
}

uint64_t sub_1A9EC(uint64_t result, uint64_t a2, uint64_t a3)
{
  size_t v5 = (unint64_t *)result;
  uint64_t v6 = 0;
  int64_t v7 = 0;
  uint64_t v8 = a3 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a3 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (v11)
  {
    unint64_t v13 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v14 = v13 | (v7 << 6);
LABEL_5:
    unint64_t v15 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v14);
    uint64_t v17 = *v15;
    unint64_t v16 = v15[1];
    uint64_t v18 = v17 & 0xFFFFFFFFFFFFLL;
    if ((v16 & 0x2000000000000000) != 0) {
      uint64_t v19 = HIBYTE(v16) & 0xF;
    }
    else {
      uint64_t v19 = v18;
    }
    if (v19)
    {
      *(void *)(result + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      if (__OFADD__(v6++, 1))
      {
        __break(1u);
LABEL_27:
        swift_retain();
        return sub_1A5F0(v5, a2, v6, a3);
      }
    }
  }
  int64_t v20 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v20 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v20);
  ++v7;
  if (v21) {
    goto LABEL_23;
  }
  int64_t v7 = v20 + 1;
  if (v20 + 1 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v7);
  if (v21) {
    goto LABEL_23;
  }
  int64_t v7 = v20 + 2;
  if (v20 + 2 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v7);
  if (v21)
  {
LABEL_23:
    unint64_t v11 = (v21 - 1) & v21;
    unint64_t v14 = __clz(__rbit64(v21)) + (v7 << 6);
    goto LABEL_5;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v12) {
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v8 + 8 * v22);
  if (v21)
  {
    int64_t v7 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v7 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_27;
    }
    unint64_t v21 = *(void *)(v8 + 8 * v7);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ItemSequenceData()
{
  uint64_t result = qword_3E288;
  if (!qword_3E288) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_1ABC0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1AC04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[4] = a3;
  v8[5] = v3;
  v8[2] = a1;
  v8[3] = a2;
  v8[1] = sub_1D04C;
  return _swift_task_switch(sub_1917C, 0, 0);
}

uint64_t sub_1ACC4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1ACFC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  int64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int64_t v7 = v3;
  v7[1] = sub_1ADC4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_3E138 + dword_3E138);
  return v8(a1, a2, v6);
}

uint64_t sub_1ADC4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1AEB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4F90(&qword_3E108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF20(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1AF5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ItemSequenceData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AFC0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_31090();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
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
    uint64_t v10 = sub_31090();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1C740(&qword_3E1D0, &qword_3E1C8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_4F90(&qword_3E1C8);
          int64_t v12 = sub_2F37C(v16, i, a3);
          uint64_t v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
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
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for SequenceItem();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_1B1E4(uint64_t a1)
{
  return sub_2B358(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1B1F8(void *a1)
{
  return sub_2B630(0, a1[2], 0, a1);
}

uint64_t sub_1B20C(uint64_t a1)
{
  return sub_2B9F4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1B220(void *a1)
{
  return sub_2BFE4(0, a1[2], 0, a1);
}

uint64_t sub_1B234(uint64_t a1)
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

int64_t sub_1B2D4(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void *sub_1B3B8(uint64_t a1)
{
  unint64_t v1 = &_swiftEmptySetSingleton;
  uint64_t v49 = &_swiftEmptySetSingleton;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v46 = v3;
    uint64_t v47 = v2;
    while (1)
    {
      sub_1C5CC(v3 + 40 * v4, (uint64_t)&v48);
      sub_4F90(&qword_3E1A8);
      sub_4F90(&qword_3E1F8);
      if (!swift_dynamicCast()) {
        goto LABEL_4;
      }
      sub_30710();
      unint64_t v5 = v48;
      int64_t v6 = v48[2];
      if (v6) {
        break;
      }
      swift_bridgeObjectRelease();
      uint64_t v14 = _swiftEmptyArrayStorage[2];
      if (v14) {
        goto LABEL_14;
      }
LABEL_3:
      swift_release();
      swift_bridgeObjectRelease();
LABEL_4:
      if (++v4 == v2)
      {
        swift_bridgeObjectRelease();
        unint64_t v1 = v49;
        goto LABEL_18;
      }
    }
    sub_2B050(0, v6, 0);
    unint64_t v7 = v5 + 5;
    do
    {
      uint64_t v8 = sub_30CD0();
      uint64_t v10 = v9;
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_2B050(v11 > 1, v12 + 1, 1);
      }
      v7 += 2;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      unint64_t v13 = &_swiftEmptyArrayStorage[2 * v12];
      v13[4] = v8;
      v13[5] = v10;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    uint64_t v3 = v46;
    uint64_t v2 = v47;
    uint64_t v14 = _swiftEmptyArrayStorage[2];
    if (!v14) {
      goto LABEL_3;
    }
LABEL_14:
    unint64_t v15 = &_swiftEmptyArrayStorage[5];
    do
    {
      Swift::Int v16 = *(v15 - 1);
      Swift::Int v17 = *v15;
      swift_bridgeObjectRetain();
      sub_2CC70((Swift::Int *)&v48, v16, v17);
      swift_bridgeObjectRelease();
      v15 += 2;
      --v14;
    }
    while (v14);
    goto LABEL_3;
  }
LABEL_18:
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_24488((uint64_t)v1);
  swift_bridgeObjectRelease();
  char v48 = v18;
  sub_1948C((uint64_t *)&v48);
  swift_bridgeObjectRelease();
  sub_4F90(&qword_3DEC0);
  sub_1C740((unint64_t *)&qword_3DEC8, &qword_3DEC0);
  uint64_t v19 = sub_30C80();
  uint64_t v21 = v20;
  swift_release();
  int64_t v22 = sub_22F58(0, 1, 1, _swiftEmptyArrayStorage);
  unint64_t v24 = v22[2];
  unint64_t v23 = v22[3];
  unint64_t v25 = v24 + 1;
  if (v24 >= v23 >> 1) {
    int64_t v22 = sub_22F58((void *)(v23 > 1), v24 + 1, 1, v22);
  }
  v22[2] = v25;
  BOOL v26 = &v22[2 * v24];
  v26[4] = v19;
  v26[5] = v21;
  swift_bridgeObjectRetain();
  uint64_t v27 = v22 + 5;
  Swift::Int v28 = _swiftEmptyArrayStorage;
  do
  {
    uint64_t v32 = *(v27 - 1);
    uint64_t v33 = *v27;
    uint64_t v34 = HIBYTE(*v27) & 0xF;
    if ((*v27 & 0x2000000000000000) == 0) {
      uint64_t v34 = v32 & 0xFFFFFFFFFFFFLL;
    }
    if (v34)
    {
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      char v48 = v28;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_2B050(0, v28[2] + 1, 1);
        Swift::Int v28 = v48;
      }
      unint64_t v30 = v28[2];
      unint64_t v29 = v28[3];
      if (v30 >= v29 >> 1)
      {
        sub_2B050(v29 > 1, v30 + 1, 1);
        Swift::Int v28 = v48;
      }
      v28[2] = v30 + 1;
      uint64_t v31 = &v28[2 * v30];
      void v31[4] = v32;
      v31[5] = v33;
    }
    v27 += 2;
    --v25;
  }
  while (v25);
  swift_bridgeObjectRelease();
  int64_t v36 = v28[2];
  if (v36)
  {
    char v48 = _swiftEmptyArrayStorage;
    sub_2B030(0, v36, 0);
    Swift::Int v37 = v48;
    uint64_t v38 = v28 + 5;
    do
    {
      uint64_t v39 = *(v38 - 1);
      uint64_t v40 = *v38;
      sub_4F90(&qword_3E1B8);
      uint64_t v41 = swift_allocObject();
      *(_OWORD *)(v41 + 16) = xmmword_31A40;
      *(void *)(v41 + 32) = v39;
      *(void *)(v41 + 40) = v40;
      char v48 = v37;
      unint64_t v43 = v37[2];
      unint64_t v42 = v37[3];
      swift_bridgeObjectRetain();
      if (v43 >= v42 >> 1)
      {
        sub_2B030(v42 > 1, v43 + 1, 1);
        Swift::Int v37 = v48;
      }
      v38 += 2;
      v37[2] = v43 + 1;
      unint64_t v44 = &v37[3 * v43];
      v44[4] = v41;
      v44[5] = 0;
      *((unsigned char *)v44 + 48) = 1;
      *(_WORD *)((char *)v44 + 49) = 3328;
      --v36;
    }
    while (v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    return _swiftEmptyArrayStorage;
  }
  return v37;
}

uint64_t sub_1B89C(uint64_t result)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = result + 24;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  unint64_t v5 = v4 + 1;
  uint64_t v6 = v3 + 32 * v1;
  while (1)
  {
    if (v2 == v1) {
      return (uint64_t)_swiftEmptyArrayStorage;
    }
    if (v5 == ++v1) {
      break;
    }
    unint64_t v7 = (unsigned char *)(v6 + 32);
    uint64_t v9 = *(void *)(v6 + 8);
    unint64_t v8 = *(void *)(v6 + 16);
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFLL;
    if ((v8 & 0x2000000000000000) != 0) {
      uint64_t v10 = HIBYTE(v8) & 0xF;
    }
    v6 += 32;
    if (v10)
    {
      uint64_t v11 = *((void *)v7 - 1);
      char v15 = *v7;
      swift_bridgeObjectRetain();
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = sub_2B070(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        uint64_t result = sub_2B070(v12 > 1, v13 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v13 + 1;
      uint64_t v14 = &_swiftEmptyArrayStorage[4 * v13];
      v14[4] = v9;
      v14[5] = v8;
      v14[6] = v11;
      *((unsigned char *)v14 + 56) = v15;
      goto LABEL_2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1B9DC(uint64_t result)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = result + 40;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  unint64_t v5 = v4 + 1;
  uint64_t v6 = (uint64_t *)(v3 + 24 * v1);
  while (1)
  {
    if (v2 == v1) {
      return (uint64_t)_swiftEmptyArrayStorage;
    }
    if (v5 == ++v1) {
      break;
    }
    unint64_t v7 = v6 + 3;
    uint64_t v9 = *(v6 - 1);
    uint64_t v8 = *v6;
    uint64_t v10 = HIBYTE(*v6) & 0xF;
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFLL;
    if ((v8 & 0x2000000000000000) != 0) {
      uint64_t v11 = v10;
    }
    uint64_t v6 = v7;
    if (v11)
    {
      uint64_t v16 = v3;
      char v12 = *((unsigned char *)v7 - 16);
      swift_bridgeObjectRetain();
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = sub_2B090(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v14 = _swiftEmptyArrayStorage[2];
      unint64_t v13 = _swiftEmptyArrayStorage[3];
      if (v14 >= v13 >> 1) {
        uint64_t result = sub_2B090(v13 > 1, v14 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v14 + 1;
      char v15 = &_swiftEmptyArrayStorage[3 * v14];
      v15[4] = v9;
      v15[5] = v8;
      *((unsigned char *)v15 + 48) = v12;
      uint64_t v3 = v16;
      goto LABEL_2;
    }
  }
  __break(1u);
  return result;
}

void *sub_1BB14(uint64_t a1)
{
  v32[3] = (Swift::Int)&_swiftEmptySetSingleton;
  uint64_t v2 = sub_13318(a1, (void (*)(void))&type metadata accessor for UEISaidDialogIdentifier);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3)
    {
      unint64_t v4 = (Swift::Int *)(v2 + 40);
      do
      {
        Swift::Int v5 = *(v4 - 1);
        Swift::Int v6 = *v4;
        swift_bridgeObjectRetain();
        sub_2CC70(v32, v5, v6);
        swift_bridgeObjectRelease();
        v4 += 2;
        --v3;
      }
      while (v3);
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v7 = sub_13318(a1, (void (*)(void))&type metadata accessor for UEIShownDialogIdentifier);
  if (v7)
  {
    uint64_t v8 = *(void *)(v7 + 16);
    if (v8)
    {
      uint64_t v9 = (Swift::Int *)(v7 + 40);
      do
      {
        Swift::Int v10 = *(v9 - 1);
        Swift::Int v11 = *v9;
        swift_bridgeObjectRetain();
        sub_2CC70(v32, v10, v11);
        swift_bridgeObjectRelease();
        v9 += 2;
        --v8;
      }
      while (v8);
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = swift_bridgeObjectRetain();
  uint64_t v13 = sub_1A888(v12);
  int64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    v32[0] = (Swift::Int)_swiftEmptyArrayStorage;
    sub_2B030(0, v14, 0);
    Swift::Int v15 = v32[0];
    uint64_t result = (void *)sub_1B234(v13);
    int64_t v17 = (int64_t)result;
    int v19 = v18;
    char v21 = v20 & 1;
    while ((v17 & 0x8000000000000000) == 0 && v17 < 1 << *(unsigned char *)(v13 + 32))
    {
      if (((*(void *)(v13 + 56 + (((unint64_t)v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v17) & 1) == 0) {
        goto LABEL_24;
      }
      if (*(_DWORD *)(v13 + 36) != v19) {
        goto LABEL_25;
      }
      char v31 = v21;
      int64_t v22 = (uint64_t *)(*(void *)(v13 + 48) + 16 * v17);
      uint64_t v24 = *v22;
      uint64_t v23 = v22[1];
      sub_4F90(&qword_3E1B8);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_31A40;
      *(void *)(v25 + 32) = v24;
      *(void *)(v25 + 40) = v23;
      v32[0] = v15;
      unint64_t v27 = *(void *)(v15 + 16);
      unint64_t v26 = *(void *)(v15 + 24);
      swift_bridgeObjectRetain();
      if (v27 >= v26 >> 1)
      {
        sub_2B030(v26 > 1, v27 + 1, 1);
        Swift::Int v15 = v32[0];
      }
      *(void *)(v15 + 16) = v27 + 1;
      Swift::Int v28 = v15 + 24 * v27;
      *(void *)(v28 + 32) = v25;
      *(void *)(v28 + 40) = 0;
      *(unsigned char *)(v28 + 48) = 1;
      *(_WORD *)(v28 + 49) = 3328;
      uint64_t result = (void *)sub_1B2D4(v17, v19, v31 & 1, v13);
      int64_t v17 = (int64_t)result;
      int v19 = v29;
      char v21 = v30 & 1;
      if (!--v14)
      {
        sub_1C6E0((uint64_t)result, v29, v21);
        swift_bridgeObjectRelease();
        swift_release();
        return (void *)v15;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_1BDF4(uint64_t a1)
{
  uint64_t result = sub_13318(a1, (void (*)(void))&type metadata accessor for ASRBestRawRecognitionUtterance);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v41 = *(void *)(result + 16);
    if (v41)
    {
      unint64_t v3 = 0;
      uint64_t v40 = result + 32;
      uint64_t v39 = result;
      do
      {
        if (v3 >= *(void *)(v2 + 16))
        {
          __break(1u);
          return result;
        }
        unint64_t v4 = (uint64_t *)(v40 + 16 * v3);
        uint64_t v5 = *v4;
        uint64_t v6 = v4[1];
        uint64_t v7 = qword_3D720;
        swift_bridgeObjectRetain();
        if (v7 != -1) {
          swift_once();
        }
        ++v3;
        uint64_t v8 = off_3DF80;
        uint64_t v9 = *(void *)((char *)&dword_10 + (void)off_3DF80);
        if (v9)
        {
          sub_1C6EC();
          swift_bridgeObjectRetain();
          Swift::Int v10 = v8 + 10;
          while ((sub_30ED0() & 1) == 0)
          {
            v10 += 4;
            if (!--v9)
            {
              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
              uint64_t v2 = v39;
              goto LABEL_5;
            }
          }
          swift_bridgeObjectRelease();
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0) {
            uint64_t result = sub_2B050(0, _swiftEmptyArrayStorage[2] + 1, 1);
          }
          uint64_t v2 = v39;
          unint64_t v12 = _swiftEmptyArrayStorage[2];
          unint64_t v11 = _swiftEmptyArrayStorage[3];
          if (v12 >= v11 >> 1) {
            uint64_t result = sub_2B050(v11 > 1, v12 + 1, 1);
          }
          _swiftEmptyArrayStorage[2] = v12 + 1;
          uint64_t v13 = &_swiftEmptyArrayStorage[2 * v12];
          v13[4] = v5;
          v13[5] = v6;
        }
        else
        {
          uint64_t result = swift_bridgeObjectRelease();
        }
LABEL_5:
        ;
      }
      while (v3 != v41);
      swift_bridgeObjectRelease();
      int64_t v14 = _swiftEmptyArrayStorage[2];
      if (v14)
      {
        sub_2B050(0, v14, 0);
        uint64_t v15 = 0;
        uint64_t v16 = _swiftEmptyArrayStorage;
        int64_t v38 = v14;
        do
        {
          int64_t v17 = &_swiftEmptyArrayStorage[2 * v15 + 4];
          uint64_t v19 = *v17;
          uint64_t v18 = v17[1];
          uint64_t v20 = qword_3D720;
          swift_bridgeObjectRetain_n();
          if (v20 != -1) {
            swift_once();
          }
          char v21 = off_3DF80;
          uint64_t v22 = *(void *)((char *)&dword_10 + (void)off_3DF80);
          if (v22)
          {
            unint64_t v42 = v16;
            swift_bridgeObjectRetain();
            sub_1C6EC();
            uint64_t v23 = v21 + 10;
            do
            {
              swift_bridgeObjectRetain();
              uint64_t v19 = sub_30EC0();
              uint64_t v25 = v24;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v23 += 4;
              --v22;
            }
            while (v22);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v26 = v25;
            uint64_t v16 = v42;
            int64_t v14 = v38;
          }
          else
          {
            uint64_t v26 = v18;
            swift_bridgeObjectRelease();
          }
          unint64_t v28 = v16[2];
          unint64_t v27 = v16[3];
          if (v28 >= v27 >> 1) {
            sub_2B050(v27 > 1, v28 + 1, 1);
          }
          ++v15;
          v16[2] = v28 + 1;
          uint64_t v29 = &v16[2 * v28];
          v29[4] = v19;
          v29[5] = v26;
        }
        while (v15 != v14);
        swift_release();
        int64_t v30 = v16[2];
        if (v30)
        {
          sub_2B030(0, v30, 0);
          char v31 = v16 + 5;
          do
          {
            uint64_t v32 = *(v31 - 1);
            uint64_t v33 = *v31;
            sub_4F90(&qword_3E1B8);
            uint64_t v34 = swift_allocObject();
            *(_OWORD *)(v34 + 16) = xmmword_31A40;
            *(void *)(v34 + 32) = v32;
            *(void *)(v34 + 40) = v33;
            unint64_t v35 = _swiftEmptyArrayStorage[2];
            unint64_t v36 = _swiftEmptyArrayStorage[3];
            swift_bridgeObjectRetain();
            if (v35 >= v36 >> 1) {
              sub_2B030(v36 > 1, v35 + 1, 1);
            }
            v31 += 2;
            _swiftEmptyArrayStorage[2] = v35 + 1;
            Swift::Int v37 = &_swiftEmptyArrayStorage[3 * v35];
            v37[4] = v34;
            v37[5] = 0;
            *((unsigned char *)v37 + 48) = 1;
            *(_WORD *)((char *)v37 + 49) = 3328;
            --v30;
          }
          while (v30);
        }
      }
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return (uint64_t)_swiftEmptyArrayStorage;
}

void *sub_1C2A8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v19 = _swiftEmptyArrayStorage;
    sub_2B070(0, v1, 0);
    uint64_t v2 = _swiftEmptyArrayStorage;
    uint64_t v4 = *(void *)(sub_30660() - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      sub_13CA8((uint64_t)v17);
      uint64_t v7 = v17[0];
      uint64_t v8 = v17[1];
      uint64_t v9 = v17[2];
      char v10 = v18;
      uint64_t v19 = v2;
      unint64_t v12 = v2[2];
      unint64_t v11 = v2[3];
      if (v12 >= v11 >> 1)
      {
        sub_2B070(v11 > 1, v12 + 1, 1);
        uint64_t v2 = v19;
      }
      v2[2] = v12 + 1;
      uint64_t v13 = &v2[4 * v12];
      v13[4] = v7;
      v13[5] = v8;
      v13[6] = v9;
      *((unsigned char *)v13 + 56) = v10;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  uint64_t v14 = sub_1B89C((uint64_t)v2);
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_12DC4(v14);
  swift_bridgeObjectRelease();
  return v15;
}

void *sub_1C420(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    char v18 = _swiftEmptyArrayStorage;
    sub_2B090(0, v1, 0);
    uint64_t v2 = _swiftEmptyArrayStorage;
    uint64_t v4 = *(void *)(sub_30660() - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      sub_13FCC((uint64_t)v16);
      uint64_t v7 = v16[0];
      uint64_t v8 = v16[1];
      char v9 = v17;
      char v18 = v2;
      unint64_t v11 = v2[2];
      unint64_t v10 = v2[3];
      if (v11 >= v10 >> 1)
      {
        sub_2B090(v10 > 1, v11 + 1, 1);
        uint64_t v2 = v18;
      }
      v2[2] = v11 + 1;
      unint64_t v12 = &v2[3 * v11];
      v12[4] = v7;
      v12[5] = v8;
      *((unsigned char *)v12 + 48) = v9;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  uint64_t v13 = sub_1B9DC((uint64_t)v2);
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_12EF4(v13);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1C58C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_11330(a1, a2);
}

uint64_t sub_1C5AC@<X0>(uint64_t *a1@<X8>)
{
  return sub_11430(a1);
}

uint64_t sub_1C5CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C630(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1C680(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1C698(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1C6E0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1C6EC()
{
  unint64_t result = qword_3E1F0;
  if (!qword_3E1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E1F0);
  }
  return result;
}

uint64_t sub_1C740(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_D140(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C788(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ItemSequenceData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C7EC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ItemSequenceData();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1C848(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = *(void **)v4;
  int64_t v8 = *(void *)(*(void *)v4 + 16);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v9 > v7[3] >> 1) {
    goto LABEL_8;
  }
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9) {
        int64_t v13 = v8 + v6;
      }
      else {
        int64_t v13 = v8;
      }
      uint64_t result = sub_231B0(result, v13, 1, v7);
      uint64_t v7 = result;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }
    goto LABEL_22;
  }
LABEL_12:
  uint64_t v14 = v7[2];
  if ((v7[3] >> 1) - v14 < v6) {
    goto LABEL_25;
  }
  if (v6 < 0) {
    goto LABEL_27;
  }
  uint64_t v15 = (char *)&v7[v14 + 4];
  uint64_t v16 = (char *)(a2 + 8 * a3);
  if (v16 < &v15[8 * v6] && v15 < &v16[8 * v6]) {
    goto LABEL_27;
  }
  uint64_t result = memcpy(v15, v16, 8 * v6);
  if (!v6)
  {
LABEL_22:
    *(void *)uint64_t v4 = v7;
    return result;
  }
  uint64_t v18 = v7[2];
  BOOL v19 = __OFADD__(v18, v6);
  uint64_t v20 = v18 + v6;
  if (!v19)
  {
    _OWORD v7[2] = v20;
    goto LABEL_22;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  uint64_t result = (void *)sub_310E0();
  __break(1u);
  return result;
}

uint64_t *sub_1C9E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    unint64_t v5 = a1;
    uint64_t v6 = (void *)a2[2];
    a1[1] = a2[1];
    a1[2] = (uint64_t)v6;
    uint64_t v7 = *(int *)(a3 + 28);
    int64_t v8 = (char *)a1 + v7;
    int64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_304D0();
    unint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v12 = v6;
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_1CAE0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_304D0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_1CB68(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = (void *)a2[2];
  a1[2] = v5;
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  int64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_304D0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

void *sub_1CC1C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a1[2];
  uint64_t v7 = (void *)a2[2];
  a1[2] = v7;
  id v8 = v7;

  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)a1 + v9;
  id v11 = (char *)a2 + v9;
  uint64_t v12 = sub_304D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_1CCDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_304D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_1CD60(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)a1[2];
  a1[2] = a2[2];

  uint64_t v7 = *(int *)(a3 + 28);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_304D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1CE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1CE20);
}

uint64_t sub_1CE20(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_304D0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    id v11 = (char *)a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1CED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1CEE4);
}

void *sub_1CEE4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_304D0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1CF8C()
{
  uint64_t result = sub_304D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1D034@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1C58C(a1, a2);
}

uint64_t sub_1D050(uint64_t a1)
{
  return sub_1D098(a1, qword_3EB98);
}

uint64_t sub_1D074(uint64_t a1)
{
  return sub_1D098(a1, qword_3EBB0);
}

uint64_t sub_1D098(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_30C50();
  sub_1D5D0(v3, a2);
  sub_DA38(v3, (uint64_t)a2);
  return sub_30C40();
}

uint64_t sub_1D110()
{
  uint64_t v0 = sub_30C50();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_30BD0();
  sub_1D5D0(v4, qword_3EBC8);
  sub_DA38(v4, (uint64_t)qword_3EBC8);
  if (qword_3D738 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_DA38(v0, (uint64_t)qword_3EBB0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_30BB0();
}

void sub_1D24C()
{
  id v0 = [self standardUserDefaults];
  NSString v1 = sub_30CA0();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_3EBE0 = v2;
}

uint64_t sub_1D2DC(const char *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = sub_30BA0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_3D748 != -1) {
    swift_once();
  }
  int v11 = byte_3EBE0;
  uint64_t v12 = sub_30BC0();
  int v13 = sub_30E50();
  uint64_t result = sub_30E80();
  if (v11 == 1)
  {
    if ((result & 1) == 0)
    {
LABEL_12:

      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
LABEL_24:
      sub_30C10();
      swift_allocObject();
      return sub_30C00();
    }
    int v21 = v13;
    if (a3)
    {
      if ((unint64_t)a1 >> 32)
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      if (a1 >> 11 == 27)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
      if (a1 >> 16 > 0x10) {
        goto LABEL_27;
      }
      a1 = &v22;
    }
    else if (!a1)
    {
      __break(1u);
      goto LABEL_8;
    }
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v15(v10, a4, v7);
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    os_signpost_id_t v17 = sub_30B90();
    os_signpost_type_t v18 = v21;
    BOOL v19 = "";
LABEL_23:
    _os_signpost_emit_with_name_impl(&dword_0, v12, v18, v17, a1, v19, v16, 2u);
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v15(v10, a4, v7);
    goto LABEL_24;
  }
LABEL_8:
  if ((result & 1) == 0) {
    goto LABEL_12;
  }
  int v21 = v13;
  if ((a3 & 1) == 0)
  {
    if (!a1)
    {
      __break(1u);
      goto LABEL_12;
    }
    goto LABEL_22;
  }
  if ((unint64_t)a1 >> 32) {
    goto LABEL_26;
  }
  if (a1 >> 11 != 27)
  {
    if (a1 >> 16 <= 0x10)
    {
      a1 = &v23;
LABEL_22:
      uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
      v15(v10, a4, v7);
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      os_signpost_id_t v17 = sub_30B90();
      os_signpost_type_t v18 = v21;
      BOOL v19 = "enableTelemetry=YES";
      goto LABEL_23;
    }
    goto LABEL_28;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t *sub_1D5D0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id sub_1D694()
{
  return sub_1DC30(type metadata accessor for LocateDeviceIntent);
}

uint64_t type metadata accessor for LocateDeviceIntent()
{
  return self;
}

id sub_1D730()
{
  return sub_1DC30(type metadata accessor for LocateIntent);
}

uint64_t type metadata accessor for LocateIntent()
{
  return self;
}

id sub_1D7CC()
{
  return sub_1DC30(type metadata accessor for PlaySoundIntent);
}

uint64_t type metadata accessor for PlaySoundIntent()
{
  return self;
}

id sub_1D868()
{
  return sub_1DC30(type metadata accessor for MTCreateAlarmIntent);
}

uint64_t type metadata accessor for MTCreateAlarmIntent()
{
  return self;
}

id sub_1D904()
{
  return sub_1DC30(type metadata accessor for MTToggleAlarmIntent);
}

uint64_t type metadata accessor for MTToggleAlarmIntent()
{
  return self;
}

id sub_1D958(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, "init");
}

id sub_1D9B4(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  v6.receiver = a1;
  v6.super_class = (Class)a4();
  return objc_msgSendSuper2(&v6, "initWithCoder:", a3);
}

id sub_1DA18(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(id))
{
  if (a3)
  {
    sub_30CB0();
    id v8 = a4;
    NSString v9 = sub_30CA0();
    id v10 = (id)swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = a4;
    NSString v9 = 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)a5(v10);
  id v11 = objc_msgSendSuper2(&v13, "initWithIdentifier:backingStore:", v9, a4);

  return v11;
}

id sub_1DAE0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  sub_30CB0();
  sub_30CB0();
  if (a5) {
    a5 = sub_30C70();
  }
  NSString v9 = sub_30CA0();
  swift_bridgeObjectRelease();
  NSString v10 = sub_30CA0();
  uint64_t v11 = swift_bridgeObjectRelease();
  if (a5)
  {
    v12.super.Class isa = sub_30C60().super.isa;
    uint64_t v11 = swift_bridgeObjectRelease();
  }
  else
  {
    v12.super.Class isa = 0;
  }
  v15.receiver = a1;
  v15.super_class = (Class)a6(v11);
  id v13 = objc_msgSendSuper2(&v15, "initWithDomain:verb:parametersByName:", v9, v10, v12.super.isa);

  return v13;
}

id sub_1DC18()
{
  return sub_1DC30(type metadata accessor for MTUpdateAlarmIntent);
}

id sub_1DC30(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for MTUpdateAlarmIntent()
{
  return self;
}

uint64_t sub_1DC8C()
{
  return 0;
}

uint64_t sub_1DC98@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1DCC8()
{
  return 0;
}

void sub_1DCD4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1DCE0(uint64_t a1)
{
  unint64_t v2 = sub_202FC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1DD1C(uint64_t a1)
{
  unint64_t v2 = sub_202FC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1DD58(char a1)
{
  return *(void *)&aSiri_0[8 * a1];
}

BOOL sub_1DD78(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_1DD90()
{
  sub_31220(*v0);
}

uint64_t sub_1DDC0(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = sub_4F90(&qword_3E720);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  __chkstk_darwin();
  int v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_4F90(&qword_3E728);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  __chkstk_darwin();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_4F90(&qword_3E730);
  uint64_t v18 = *(void *)(v8 - 8);
  __chkstk_darwin();
  NSString v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_4F90(&qword_3E738);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABC0(a1, a1[3]);
  sub_20254();
  sub_31250();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_202FC();
      sub_31160();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_202A8();
      objc_super v15 = v21;
      sub_31160();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_20350();
    sub_31160();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

unint64_t sub_1E12C(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 5786702;
      break;
    case 2:
      unint64_t result = 4801877;
      break;
    case 3:
      unint64_t result = 0x505041454E4F4850;
      break;
    case 4:
      unint64_t result = 0x414547415353454DLL;
      break;
    case 5:
      unint64_t result = 0x5245444E494D4552;
      break;
    case 6:
      return result;
    case 7:
      unint64_t result = 0x4552434D52414C41;
      break;
    case 8:
      unint64_t result = 0x474F544D52414C41;
      break;
    case 9:
      unint64_t result = 0x4450554D52414C41;
      break;
    case 10:
      unint64_t result = 0x4145524345544F4ELL;
      break;
    case 11:
      unint64_t result = 0x454C454445544F4ELL;
      break;
    case 12:
      unint64_t result = 0x5041594D444E4946;
      break;
    case 13:
      unint64_t result = 0x4E574F4E4B4E55;
      break;
    default:
      unint64_t result = 5395265;
      break;
  }
  return result;
}

uint64_t sub_1E2F8()
{
  return sub_1DD58(*v0);
}

uint64_t sub_1E300@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1FB1C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1E328(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1E334(uint64_t a1)
{
  unint64_t v2 = sub_20254();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1E370(uint64_t a1)
{
  unint64_t v2 = sub_20254();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1E3AC(uint64_t a1)
{
  unint64_t v2 = sub_20350();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1E3E8(uint64_t a1)
{
  unint64_t v2 = sub_20350();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1E424(uint64_t a1)
{
  unint64_t v2 = sub_202A8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1E460(uint64_t a1)
{
  unint64_t v2 = sub_202A8();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_1E49C()
{
  Swift::UInt v1 = *v0;
  sub_31210();
  sub_31220(v1);
  return sub_31230();
}

Swift::Int sub_1E4E4()
{
  Swift::UInt v1 = *v0;
  sub_31210();
  sub_31220(v1);
  return sub_31230();
}

void *sub_1E528@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1FC44(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_1E554(void *a1)
{
  return sub_1DDC0(a1, *v1);
}

uint64_t sub_1E570(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_1E12C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_1E12C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_311C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1E5FC(char a1, char a2)
{
  if (*(void *)&aTimestampayloa[8 * a1] == *(void *)&aTimestampayloa[8 * a2]
    && *(void *)&aP[8 * a1] == *(void *)&aP[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_311C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_1E684()
{
  char v1 = *v0;
  sub_31210();
  sub_1E12C(v1);
  sub_30CF0();
  swift_bridgeObjectRelease();
  return sub_31230();
}

Swift::Int sub_1E6E8()
{
  return sub_31230();
}

uint64_t sub_1E754()
{
  sub_1E12C(*v0);
  sub_30CF0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1E7A8()
{
  sub_30CF0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1E7FC()
{
  char v1 = *v0;
  sub_31210();
  sub_1E12C(v1);
  sub_30CF0();
  swift_bridgeObjectRelease();
  return sub_31230();
}

Swift::Int sub_1E85C()
{
  return sub_31230();
}

uint64_t sub_1E8C4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_201B4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1E8F4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1E12C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1E920()
{
  return sub_30D30();
}

uint64_t sub_1E980()
{
  return sub_30D20();
}

uint64_t sub_1E9D0()
{
  sub_30F70(62);
  v4._object = (void *)0x80000000000338E0;
  v4._countAndFlagsBits = 0xD000000000000018;
  sub_30D00(v4);
  v5._countAndFlagsBits = sub_311B0();
  sub_30D00(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 0x616F6C796170202CLL;
  v6._object = (void *)0xEB00000000203A64;
  sub_30D00(v6);
  uint64_t v1 = *(void *)(v0 + 24);
  char v2 = *(void **)(v0 + 32);
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v1;
  v7._object = v2;
  sub_30D00(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x656372756F73202CLL;
  v8._object = (void *)0xEA0000000000203ALL;
  sub_30D00(v8);
  sub_31060();
  v9._countAndFlagsBits = 0x203A65707974202CLL;
  v9._object = (void *)0xE800000000000000;
  sub_30D00(v9);
  sub_31060();
  v10._countAndFlagsBits = 41;
  v10._object = (void *)0xE100000000000000;
  sub_30D00(v10);
  return 0;
}

uint64_t sub_1EB60()
{
  swift_bridgeObjectRetain();
  sub_30CF0();
  swift_bridgeObjectRelease();
  sub_31220(*(unsigned __int8 *)(v0 + 40));
  sub_1E12C(*(unsigned char *)(v0 + 41));
  sub_30CF0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1EBEC(uint64_t a1)
{
  BOOL v3 = *(void *)(v1 + 24) == *(void *)(a1 + 24) && *(void *)(v1 + 32) == *(void *)(a1 + 32);
  if (v3 || (char v4 = 0, (sub_311C0() & 1) != 0))
  {
    if (*(unsigned __int8 *)(v1 + 40) == *(unsigned __int8 *)(a1 + 40))
    {
      char v5 = *(unsigned char *)(v1 + 41);
      char v6 = *(unsigned char *)(a1 + 41);
      unint64_t v7 = sub_1E12C(v5);
      uint64_t v9 = v8;
      if (v7 == sub_1E12C(v6) && v9 == v10) {
        char v4 = 1;
      }
      else {
        char v4 = sub_311C0();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v4 = 0;
    }
  }
  return v4 & 1;
}

uint64_t sub_1ECB8(char a1)
{
  return *(void *)&aTimestampayloa[8 * a1];
}

uint64_t sub_1ECD8(char *a1, char *a2)
{
  return sub_1E5FC(*a1, *a2);
}

Swift::Int sub_1ECE4()
{
  return sub_1E6E8();
}

uint64_t sub_1ECEC()
{
  return sub_1E7A8();
}

Swift::Int sub_1ECF4()
{
  return sub_1E85C();
}

uint64_t sub_1ECFC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_20CD0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1ED2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1ECB8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1ED58()
{
  return sub_1ECB8(*v0);
}

uint64_t sub_1ED60@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_20CD0(a1, a2);
  *a3 = result;
  return result;
}

void sub_1ED88(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1ED94(uint64_t a1)
{
  unint64_t v2 = sub_203A4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1EDD0(uint64_t a1)
{
  unint64_t v2 = sub_203A4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1EE0C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_4F90(&qword_3E760);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1ABC0(a1, a1[3]);
  sub_203A4();
  sub_31250();
  v10[15] = 0;
  sub_31190();
  if (!v2)
  {
    v10[14] = 1;
    swift_bridgeObjectRetain();
    sub_31170();
    swift_bridgeObjectRelease();
    v10[13] = *(unsigned char *)(v3 + 40);
    v10[12] = 2;
    sub_204A0();
    sub_31180();
    v10[11] = *(unsigned char *)(v3 + 41);
    v10[10] = 3;
    sub_204F4();
    sub_31180();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1F02C(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_1F07C(a1);
  return v2;
}

uint64_t sub_1F07C(void *a1)
{
  uint64_t v4 = sub_4F90(&qword_3E740);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABC0(a1, a1[3]);
  sub_203A4();
  sub_31240();
  if (v2)
  {
    type metadata accessor for PatternItem();
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v16 = 0;
    *(void *)(v1 + 16) = sub_31140();
    char v15 = 1;
    *(void *)(v1 + 24) = sub_31120();
    *(void *)(v1 + 32) = v9;
    char v13 = 2;
    sub_203F8();
    sub_31130();
    *(unsigned char *)(v1 + 40) = v14;
    char v11 = 3;
    sub_2044C();
    sub_31130();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(unsigned char *)(v1 + 41) = v12;
  }
  sub_1C630((uint64_t)a1);
  return v1;
}

uint64_t sub_1F2DC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 42, 7);
}

uint64_t type metadata accessor for PatternItem()
{
  return self;
}

Swift::Int sub_1F338()
{
  sub_31210();
  swift_bridgeObjectRetain();
  sub_30CF0();
  swift_bridgeObjectRelease();
  sub_31220(*(unsigned __int8 *)(v0 + 40));
  sub_1E12C(*(unsigned char *)(v0 + 41));
  sub_30CF0();
  swift_bridgeObjectRelease();
  return sub_31230();
}

uint64_t sub_1F3D8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 208))();
}

Swift::Int sub_1F41C()
{
  return sub_1F338();
}

uint64_t sub_1F440()
{
  return sub_1EB60();
}

Swift::Int sub_1F464()
{
  return sub_31230();
}

uint64_t sub_1F4A4(uint64_t a1, uint64_t *a2)
{
  return sub_1EBEC(*a2) & 1;
}

uint64_t sub_1F4D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 248))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_1F50C(void *a1)
{
  return sub_1EE0C(a1);
}

uint64_t sub_1F530()
{
  sub_30F70(82);
  v4._countAndFlagsBits = 0x203A646928;
  v4._object = (void *)0xE500000000000000;
  sub_30D00(v4);
  v5._countAndFlagsBits = sub_311B0();
  sub_30D00(v5);
  swift_bridgeObjectRelease();
  v6._object = (void *)0x80000000000338C0;
  v6._countAndFlagsBits = 0xD000000000000019;
  sub_30D00(v6);
  v7._countAndFlagsBits = sub_311B0();
  sub_30D00(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x797469746E65202CLL;
  v8._object = (void *)0xEA0000000000203ALL;
  sub_30D00(v8);
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = sub_30D50();
  sub_30D00(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0x616F6C796170202CLL;
  v10._object = (void *)0xEB00000000203A64;
  sub_30D00(v10);
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void **)(v0 + 32);
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = v1;
  v11._object = v2;
  sub_30D00(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0x656372756F73202CLL;
  v12._object = (void *)0xEA0000000000203ALL;
  sub_30D00(v12);
  sub_31060();
  v13._countAndFlagsBits = 0x203A65707974202CLL;
  v13._object = (void *)0xE800000000000000;
  sub_30D00(v13);
  sub_31060();
  v14._countAndFlagsBits = 41;
  v14._object = (void *)0xE100000000000000;
  sub_30D00(v14);
  return 0;
}

void *sub_1F768(uint64_t a1)
{
  uint64_t v2 = (void *)swift_allocObject();
  v2[6] = 0;
  v2[7] = 0;
  v2[8] = &_swiftEmptyArrayStorage;
  sub_1C5CC(a1, (uint64_t)v4);
  sub_1F07C(v4);
  sub_1C630(a1);
  return v2;
}

uint64_t sub_1F7EC()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1F7F4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 72, 7);
}

uint64_t type metadata accessor for SequenceItem()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for Source(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EventType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for EventType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *uint64_t result = a2 + 13;
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
        JUMPOUT(0x1F9C4);
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
          *uint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EventType()
{
  return &type metadata for EventType;
}

ValueMetadata *type metadata accessor for Source()
{
  return &type metadata for Source;
}

unint64_t sub_1FA18()
{
  unint64_t result = qword_3E6B8;
  if (!qword_3E6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E6B8);
  }
  return result;
}

unint64_t sub_1FA70()
{
  unint64_t result = qword_3E6C0;
  if (!qword_3E6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E6C0);
  }
  return result;
}

unint64_t sub_1FAC8()
{
  unint64_t result = qword_3E6C8;
  if (!qword_3E6C8)
  {
    type metadata accessor for PatternItem();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E6C8);
  }
  return result;
}

uint64_t sub_1FB1C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1230129491 && a2 == 0xE400000000000000;
  if (v3 || (sub_311C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 5263425 && a2 == 0xE300000000000000 || (sub_311C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4E574F4E4B4E55 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_311C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_1FC44(void *a1)
{
  uint64_t v2 = sub_4F90(&qword_3E6D8);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  __chkstk_darwin();
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_4F90(&qword_3E6E0);
  uint64_t v24 = *(void *)(v27 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_4F90(&qword_3E6E8);
  uint64_t v23 = *(void *)(v6 - 8);
  __chkstk_darwin();
  int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_4F90(&qword_3E6F0);
  uint64_t v28 = *(void *)(v9 - 8);
  __chkstk_darwin();
  Swift::String v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1ABC0(a1, a1[3]);
  sub_20254();
  uint64_t v12 = (uint64_t)v30;
  sub_31240();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  Swift::String v13 = v29;
  int64_t v30 = a1;
  Swift::String v14 = v11;
  uint64_t v15 = sub_31150();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_30FE0();
    swift_allocError();
    Swift::String v11 = v18;
    sub_4F90(&qword_3E700);
    *Swift::String v11 = &type metadata for Source;
    sub_31110();
    sub_30FD0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, enum case for DecodingError.typeMismatch(_:), v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    sub_1C630((uint64_t)a1);
    return v11;
  }
  Swift::String v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_202FC();
      sub_31100();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_202A8();
      sub_31100();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_20350();
    sub_31100();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  sub_1C630((uint64_t)v30);
  return v11;
}

uint64_t sub_201B4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_39130;
  v6._object = a2;
  unint64_t v4 = sub_310F0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xE) {
    return 14;
  }
  else {
    return v4;
  }
}

unint64_t sub_20200()
{
  unint64_t result = qword_3E6D0;
  if (!qword_3E6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E6D0);
  }
  return result;
}

unint64_t sub_20254()
{
  unint64_t result = qword_3E6F8;
  if (!qword_3E6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E6F8);
  }
  return result;
}

unint64_t sub_202A8()
{
  unint64_t result = qword_3E708;
  if (!qword_3E708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E708);
  }
  return result;
}

unint64_t sub_202FC()
{
  unint64_t result = qword_3E710;
  if (!qword_3E710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E710);
  }
  return result;
}

unint64_t sub_20350()
{
  unint64_t result = qword_3E718;
  if (!qword_3E718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E718);
  }
  return result;
}

unint64_t sub_203A4()
{
  unint64_t result = qword_3E748;
  if (!qword_3E748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E748);
  }
  return result;
}

unint64_t sub_203F8()
{
  unint64_t result = qword_3E750;
  if (!qword_3E750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E750);
  }
  return result;
}

unint64_t sub_2044C()
{
  unint64_t result = qword_3E758;
  if (!qword_3E758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E758);
  }
  return result;
}

unint64_t sub_204A0()
{
  unint64_t result = qword_3E768;
  if (!qword_3E768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E768);
  }
  return result;
}

unint64_t sub_204F4()
{
  unint64_t result = qword_3E770;
  if (!qword_3E770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E770);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PatternItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PatternItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x206A4);
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

uint64_t sub_206CC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_206D4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PatternItem.CodingKeys()
{
  return &type metadata for PatternItem.CodingKeys;
}

uint64_t _s42SiriPrivateLearningPatternExtractionPlugin6SourceOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s42SiriPrivateLearningPatternExtractionPlugin6SourceOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20848);
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

ValueMetadata *type metadata accessor for Source.CodingKeys()
{
  return &type metadata for Source.CodingKeys;
}

ValueMetadata *type metadata accessor for Source.SIRICodingKeys()
{
  return &type metadata for Source.SIRICodingKeys;
}

ValueMetadata *type metadata accessor for Source.APPCodingKeys()
{
  return &type metadata for Source.APPCodingKeys;
}

ValueMetadata *type metadata accessor for Source.UNKNOWNCodingKeys()
{
  return &type metadata for Source.UNKNOWNCodingKeys;
}

unint64_t sub_208B4()
{
  unint64_t result = qword_3E778;
  if (!qword_3E778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E778);
  }
  return result;
}

unint64_t sub_2090C()
{
  unint64_t result = qword_3E780;
  if (!qword_3E780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E780);
  }
  return result;
}

unint64_t sub_20964()
{
  unint64_t result = qword_3E788;
  if (!qword_3E788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E788);
  }
  return result;
}

unint64_t sub_209BC()
{
  unint64_t result = qword_3E790;
  if (!qword_3E790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E790);
  }
  return result;
}

unint64_t sub_20A14()
{
  unint64_t result = qword_3E798;
  if (!qword_3E798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E798);
  }
  return result;
}

unint64_t sub_20A6C()
{
  unint64_t result = qword_3E7A0;
  if (!qword_3E7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E7A0);
  }
  return result;
}

unint64_t sub_20AC4()
{
  unint64_t result = qword_3E7A8;
  if (!qword_3E7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E7A8);
  }
  return result;
}

unint64_t sub_20B1C()
{
  unint64_t result = qword_3E7B0;
  if (!qword_3E7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E7B0);
  }
  return result;
}

unint64_t sub_20B74()
{
  unint64_t result = qword_3E7B8;
  if (!qword_3E7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E7B8);
  }
  return result;
}

unint64_t sub_20BCC()
{
  unint64_t result = qword_3E7C0;
  if (!qword_3E7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E7C0);
  }
  return result;
}

unint64_t sub_20C24()
{
  unint64_t result = qword_3E7C8;
  if (!qword_3E7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E7C8);
  }
  return result;
}

unint64_t sub_20C7C()
{
  unint64_t result = qword_3E7D0;
  if (!qword_3E7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3E7D0);
  }
  return result;
}

uint64_t sub_20CD0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_392A0;
  v6._object = a2;
  unint64_t v4 = sub_310F0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

void sub_20D30()
{
  id v0 = [self standardUserDefaults];
  NSString v1 = sub_30CA0();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_3E7D8 = v2;
}

uint64_t type metadata accessor for PatternLogger()
{
  return self;
}

id sub_20DE4(unint64_t a1, unint64_t a2, unint64_t a3, char a4, unint64_t a5, uint64_t a6)
{
  id v9 = [objc_allocWithZone((Class)PLUSSchemaPLUSRECTIFIPatternSequenceGenerated) init];
  if (!v9) {
    return v9;
  }
  unint64_t v28 = a2;
  if (a5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_31090();
    if (v10) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v10 = *(void *)((char *)&dword_10 + (a5 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v10)
    {
LABEL_4:
      if (v10 < 1)
      {
        __break(1u);
LABEL_34:
        sub_31080();
        __break(1u);
        JUMPOUT(0x21328);
      }
      for (uint64_t i = 0; i != v10; ++i)
      {
        if ((a5 & 0xC000000000000001) != 0) {
          id v12 = (id)sub_30FB0();
        }
        else {
          id v12 = *(id *)(a5 + 8 * i + 32);
        }
        Swift::String v13 = v12;
        [v9 addConstraints:v12];
      }
    }
  }
  swift_bridgeObjectRelease();
  if (a2 >> 62) {
    goto LABEL_30;
  }
  uint64_t v14 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v14; uint64_t v14 = sub_31090())
  {
    unint64_t v15 = a2 & 0xC000000000000001;
    uint64_t v16 = 4;
    while (1)
    {
      uint64_t v17 = v16 - 4;
      if (!v15) {
        break;
      }
      uint64_t v18 = sub_30FB0();
      uint64_t v19 = v16 - 3;
      if (__OFADD__(v17, 1)) {
        goto LABEL_29;
      }
LABEL_21:
      id v20 = [objc_allocWithZone((Class)PLUSSchemaPLUSRECTIFIPatternItem) init];
      if (v20)
      {
        if ((*(void *)(v18 + 16) & 0x8000000000000000) != 0) {
          goto LABEL_34;
        }
        uint64_t v21 = v20;
        objc_msgSend(v20, "setRelativeTimestampInMs:");
        [v21 setItemSource:dword_328EC[*(char *)(v18 + 40)]];
        NSString v22 = sub_30CA0();
        swift_bridgeObjectRelease();
        [v21 setItemDomainName:v22];

        swift_bridgeObjectRetain();
        NSString v23 = sub_30CA0();
        swift_bridgeObjectRelease();
        [v21 setItemPayload:v23];

        [v9 addSequence:v21];
        if ((a1 & 0x8000000000000000) != 0) {
          goto LABEL_34;
        }
        a2 = v28;
        if (HIDWORD(a1)) {
          goto LABEL_34;
        }
        [v9 setNumberOfRequestsReviewed:a1];
        [v9 setOriginalRequestId:a6];
        if ((a4 & 1) == 0 && ((a3 & 0x8000000000000000) != 0 || HIDWORD(a3))) {
          goto LABEL_34;
        }
        objc_msgSend(v9, "setNumberOfUniqueRequestsReviewed:");
        swift_release();
      }
      else
      {
        swift_release();
      }
      ++v16;
      if (v19 == v14) {
        goto LABEL_31;
      }
    }
    uint64_t v18 = *(void *)(a2 + 8 * v16);
    swift_retain();
    uint64_t v19 = v16 - 3;
    if (!__OFADD__(v17, 1)) {
      goto LABEL_21;
    }
LABEL_29:
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:
  swift_bridgeObjectRelease();
  return v9;
}

void sub_21360(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v62 = a3;
  uint64_t v5 = sub_4F90(&qword_3D920);
  __chkstk_darwin(v5 - 8);
  BOOL v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_30510();
  uint64_t v61 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v59 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_3D750 != -1) {
LABEL_34:
  }
    swift_once();
  if (byte_3E7D8)
  {
    if (qword_3D730 != -1) {
LABEL_36:
    }
      swift_once();
    uint64_t v10 = sub_30C50();
    sub_DA38(v10, (uint64_t)qword_3EB98);
    unint64_t v64 = sub_30C30();
    os_log_type_t v11 = sub_30E20();
    if (os_log_type_enabled((os_log_t)v64, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_0, (os_log_t)v64, v11, "Omitting SELF logging call as UsageLoggingDisabled flag present", v12, 2u);
      swift_slowDealloc();
    }
    os_log_t v13 = (os_log_t)v64;
  }
  else
  {
    uint64_t v57 = *((void *)a1 + 2);
    if (v57)
    {
      uint64_t v49 = v62 + 32;
      uint64_t v53 = v61 + 16;
      uint64_t v54 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56);
      uint64_t v52 = v61 + 48;
      uint64_t v51 = (void (**)(char *, char *, uint64_t))(v61 + 32);
      uint64_t v50 = (void (**)(char *, uint64_t))(v61 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v14 = 0;
      unint64_t v63 = 0;
      char v48 = a1;
      unint64_t v15 = a1 + 64;
      uint64_t v16 = &selRef_initWithEntityName_;
      long long v58 = xmmword_31C90;
      uint64_t v55 = v8;
      unint64_t v56 = v7;
      while (1)
      {
        unint64_t v64 = (unint64_t)v14;
        uint64_t v17 = a2;
        unint64_t v19 = *((void *)v15 - 4);
        unint64_t v18 = *((void *)v15 - 3);
        char v20 = *v15;
        unint64_t v21 = *((void *)v15 - 1);
        id v22 = objc_allocWithZone((Class)PLUSSchemaPLUSRECTIFIPatternConstraint);
        swift_bridgeObjectRetain();
        NSString v23 = v16[23];
        swift_bridgeObjectRetain();
        id v24 = objc_msgSend(v22, v23, v48);
        LODWORD(v25) = 1060320051;
        [v24 setConstraintValue:v25];
        [v24 setConstraintType:1];
        if (!v24)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_26;
        }
        sub_4F90(&qword_3DED0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v58;
        *(void *)(inited + 32) = v24;
        unint64_t v65 = inited;
        sub_30D60();
        unint64_t v27 = v65;
        unint64_t v28 = *(void *)(v62 + 16);
        if (v63 == v28)
        {
          uint64_t v29 = 0;
        }
        else
        {
          if (v63 >= v28)
          {
            __break(1u);
            goto LABEL_36;
          }
          uint64_t v29 = *(void **)(v49 + 8 * v63++);
          if (v29) {
            id v30 = v29;
          }
        }
        id v31 = v24;
        id v32 = sub_20DE4(v19, v18, v21, v20, v27, (uint64_t)v29);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        if (!v32)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          return;
        }
        char v33 = (char *)[objc_allocWithZone((Class)PLUSSchemaPLUSClientEvent) init];
        a2 = v17;
        if (!v33)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          return;
        }
        a1 = v33;
        id v34 = [objc_allocWithZone((Class)PLUSSchemaPLUSClientEventMetadata) init];
        if (!v34)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          return;
        }
        unint64_t v35 = v34;
        unint64_t v36 = *(NSObject **)(v17 + 16);
        unint64_t v37 = v64;
        if (v64 == v36) {
          break;
        }
        uint64_t v8 = v55;
        BOOL v7 = v56;
        if (v64 >= (unint64_t)v36)
        {
          __break(1u);
          goto LABEL_34;
        }
        uint64_t v38 = v61;
        (*(void (**)(char *, unint64_t, uint64_t))(v61 + 16))(v56, a2+ ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80))+ *(void *)(v38 + 72) * v64, v55);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v7, 0, 1, v8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v7, 1, v8) == 1) {
          goto LABEL_31;
        }
        unint64_t v64 = v37 + 1;
        uint64_t v39 = *v51;
        id v60 = v31;
        uint64_t v40 = v59;
        v39(v59, v7, v8);
        id v41 = objc_allocWithZone((Class)SISchemaUUID);
        Class isa = sub_304E0().super.isa;
        id v43 = [v41 initWithNSUUID:isa];

        [v35 setPlusId:v43];
        [a1 setPatternSequenceGenerated:v32];
        [a1 setEventMetadata:v35];
        id v44 = [self sharedAnalytics];
        id v45 = [v44 defaultMessageStream];

        Class v46 = sub_304E0().super.isa;
        [v45 emitMessage:a1 isolatedStreamUUID:v46];

        uint64_t v14 = v64;
        uint64_t v47 = v40;
        uint64_t v16 = &selRef_initWithEntityName_;
        (*v50)(v47, v8);
        v15 += 40;
        if (v57 == v14)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_26:
          swift_bridgeObjectRelease();
          return;
        }
      }
      BOOL v7 = v56;
      (*v54)(v56, 1, 1, v55);
LABEL_31:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      sub_21AB0((uint64_t)v7);
    }
  }
}

uint64_t sub_21AB0(uint64_t a1)
{
  uint64_t v2 = sub_4F90(&qword_3D920);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id RECTIFIInfrequentPatternStore.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for RECTIFIInfrequentPatternStore();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for RECTIFIInfrequentPatternStore()
{
  return self;
}

id RECTIFIInfrequentPatternStore.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RECTIFIInfrequentPatternStore();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static RECTIFIInfrequentPatternStore.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_30CA0();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_21C90@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for RECTIFIInfrequentPatternStore();
  uint64_t result = sub_30F90();
  *a1 = result;
  return result;
}

unint64_t sub_21CD4(uint64_t a1)
{
  uint64_t v2 = sub_4F90(&qword_3D9F0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (void *)((char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    objc_super v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4F90(&qword_3D9E8);
  uint64_t v6 = sub_310D0();
  objc_super v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (uint64_t)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_DCA4(v12, (uint64_t)v5, &qword_3D9F0);
    unint64_t v14 = *v5;
    unint64_t result = sub_A830(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v7[6] + 8 * result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = type metadata accessor for PatternStoreValue(0);
    unint64_t result = sub_D188(v9, v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    _OWORD v7[2] = v22;
    v12 += v13;
    if (!--v8)
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

uint64_t RectifiStoreApi.__allocating_init(storePath:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  RectifiStoreApi.init(storePath:)(a1, a2);
  return v4;
}

uint64_t RectifiStoreApi.init(storePath:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_30830();
  swift_allocObject();
  sub_30820();
  if (qword_3D718 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_3EB78;
  uint64_t v6 = unk_3EB80;
  uint64_t v8 = sub_30810();
  uint64_t v10 = v9;
  *(void *)&long long v16 = v7;
  *((void *)&v16 + 1) = v6;
  swift_bridgeObjectRetain();
  v19._countAndFlagsBits = v8;
  v19._object = v10;
  sub_30D00(v19);
  swift_bridgeObjectRelease();
  uint64_t v11 = v6;
  if (a2)
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = a2;
  }
  else
  {
    a1 = v16;
  }
  uint64_t v12 = type metadata accessor for RectifiCoreDataStore(0);
  swift_allocObject();
  uint64_t v13 = sub_5620(a1, v11);
  if (v13)
  {
    uint64_t v14 = v13;
    *((void *)&v17 + 1) = v12;
    uint64_t v18 = &off_393A8;
    swift_release();
    *(void *)&long long v16 = v14;
  }
  else
  {
    swift_release();
    uint64_t v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
  }
  sub_22074((uint64_t)&v16, v3 + 16);
  return v3;
}

uint64_t sub_22074(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4F90(&qword_3E8C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *RectifiStoreApi.getTopKRectifiPatternUuids(topK:appLevelAggregation:)(uint64_t a1, char a2)
{
  uint64_t v5 = sub_4F90(&qword_3D920);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_30510();
  uint64_t v45 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v39 - v12;
  sub_DCA4(v2 + 16, (uint64_t)&v48, &qword_3E8C0);
  if (v49)
  {
    id v43 = v11;
    id v44 = v13;
    sub_1C680(&v48, (uint64_t)v50);
    uint64_t v14 = (void *)*sub_1ABC0(v50, v50[3]);
    *(void *)&long long v48 = sub_21CD4((uint64_t)_swiftEmptyArrayStorage);
    unint64_t v15 = (void *)sub_30640();
    __chkstk_darwin(v15);
    *(&v39 - 4) = v14;
    *(&v39 - 3) = &v48;
    *((unsigned char *)&v39 - 16) = 0;
    sub_30E60();

    *(void *)&long long v48 = sub_22914(v48, a2 & 1);
    swift_bridgeObjectRetain();
    sub_23E88((void **)&v48);
    swift_bridgeObjectRelease();
    uint64_t v21 = v48;
    uint64_t v22 = v44;
    if (*(void *)(v48 + 16) <= a1)
    {
      double v25 = (void *)v48;
      goto LABEL_17;
    }
    if (a1 < 0)
    {
      __break(1u);
    }
    else
    {
      sub_311D0();
      swift_unknownObjectRetain_n();
      NSString v23 = (void *)swift_dynamicCastClass();
      if (!v23)
      {
        swift_release();
        NSString v23 = _swiftEmptyArrayStorage;
      }
      uint64_t v24 = v23[2];
      swift_release();
      if (v24 == a1)
      {
        double v25 = (void *)swift_dynamicCastClass();
        swift_release();
        if (v25)
        {
LABEL_17:
          uint64_t v26 = v25[2];
          if (v26)
          {
            uint64_t v47 = type metadata accessor for PatternStoreValue(0);
            unint64_t v27 = (char *)v25
                + ((*(unsigned __int8 *)(*(void *)(v47 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v47 - 8) + 80));
            uint64_t v46 = *(void *)(*(void *)(v47 - 8) + 72);
            unint64_t v28 = (unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48);
            uint64_t v29 = (void (**)(char *, char *, uint64_t))(v45 + 32);
            unint64_t v42 = (void (**)(char *, char *, uint64_t))(v45 + 16);
            uint64_t v41 = v45 + 8;
            uint64_t v39 = v25;
            swift_bridgeObjectRetain();
            uint64_t v20 = _swiftEmptyArrayStorage;
            id v30 = v43;
            uint64_t v40 = v7;
            do
            {
              sub_DCA4((uint64_t)&v27[*(int *)(v47 + 24)], (uint64_t)v7, &qword_3D920);
              if ((*v28)(v7, 1, v8) == 1)
              {
                sub_DD28((uint64_t)v7, &qword_3D920);
              }
              else
              {
                id v31 = *v29;
                (*v29)(v22, v7, v8);
                (*v42)(v30, v22, v8);
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  uint64_t v20 = (void *)sub_232C0(0, v20[2] + 1, 1, (unint64_t)v20, &qword_3E9B8, (uint64_t (*)(void))&type metadata accessor for UUID, (uint64_t (*)(void))&type metadata accessor for UUID);
                }
                unint64_t v33 = v20[2];
                unint64_t v32 = v20[3];
                if (v33 >= v32 >> 1) {
                  uint64_t v20 = (void *)sub_232C0(v32 > 1, v33 + 1, 1, (unint64_t)v20, &qword_3E9B8, (uint64_t (*)(void))&type metadata accessor for UUID, (uint64_t (*)(void))&type metadata accessor for UUID);
                }
                v20[2] = v33 + 1;
                uint64_t v34 = v45;
                unint64_t v35 = (unint64_t)v20
                    + ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))
                    + *(void *)(v45 + 72) * v33;
                id v30 = v43;
                v31((char *)v35, v43, v8);
                unint64_t v36 = *(void (**)(char *, uint64_t))(v34 + 8);
                uint64_t v22 = v44;
                v36(v44, v8);
                uint64_t v7 = v40;
              }
              v27 += v46;
              --v26;
            }
            while (v26);
            swift_bridgeObjectRelease_n();
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v20 = _swiftEmptyArrayStorage;
          }
          sub_1C630((uint64_t)v50);
          return v20;
        }
        double v25 = _swiftEmptyArrayStorage;
LABEL_15:
        swift_release();
        goto LABEL_17;
      }
    }
    swift_release();
    uint64_t v38 = *(void *)(type metadata accessor for PatternStoreValue(0) - 8);
    double v25 = sub_24570(v21, v21 + ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80)), 0, (2 * a1) | 1);
    goto LABEL_15;
  }
  sub_DD28((uint64_t)&v48, &qword_3E8C0);
  if (qword_3D730 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_30C50();
  sub_DA38(v16, (uint64_t)qword_3EB98);
  long long v17 = sub_30C30();
  os_log_type_t v18 = sub_30E30();
  if (os_log_type_enabled(v17, v18))
  {
    Swift::String v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::String v19 = 0;
    _os_log_impl(&dword_0, v17, v18, "RECTIFI API: Unable to read from RECTIFI Store", v19, 2u);
    swift_slowDealloc();
  }

  return _swiftEmptyArrayStorage;
}

uint64_t sub_22914(uint64_t a1, int a2)
{
  int v35 = a2;
  uint64_t v3 = type metadata accessor for PatternStoreValue(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v32 = (uint64_t)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v29 - v8;
  uint64_t result = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v29 - v11;
  int64_t v13 = 0;
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v33 = a1 + 64;
  uint64_t v15 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  long long v17 = (unint64_t *)&_swiftEmptyArrayStorage;
  unint64_t v36 = (unint64_t *)&_swiftEmptyArrayStorage;
  unint64_t v18 = v16 & v14;
  int64_t v34 = (unint64_t)(v15 + 63) >> 6;
  if ((v16 & v14) != 0) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v21 = v13 + 1;
  if (!__OFADD__(v13, 1))
  {
    if (v21 < v34)
    {
      unint64_t v22 = *(void *)(v33 + 8 * v21);
      ++v13;
      if (v22) {
        goto LABEL_23;
      }
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v33 + 8 * v13);
      if (v22) {
        goto LABEL_23;
      }
      int64_t v13 = v21 + 2;
      if (v21 + 2 >= v34) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v33 + 8 * v13);
      if (v22) {
        goto LABEL_23;
      }
      int64_t v13 = v21 + 3;
      if (v21 + 3 >= v34) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v33 + 8 * v13);
      if (v22)
      {
LABEL_23:
        unint64_t v18 = (v22 - 1) & v22;
        for (unint64_t i = __clz(__rbit64(v22)) + (v13 << 6); ; unint64_t i = v19 | (v13 << 6))
        {
          uint64_t v24 = *(void *)(v4 + 72);
          sub_D250(*(void *)(a1 + 56) + v24 * i, (uint64_t)v9);
          sub_D188((uint64_t)v9, (uint64_t)v12);
          int v25 = v12[*(int *)(v3 + 28)];
          if (v25 == 2)
          {
            if (v35)
            {
LABEL_6:
              uint64_t result = sub_DAB0((uint64_t)v12);
              if (!v18) {
                goto LABEL_8;
              }
              goto LABEL_7;
            }
          }
          else if (((((v25 & 1) == 0) ^ v35) & 1) == 0)
          {
            goto LABEL_6;
          }
          sub_D188((uint64_t)v12, v32);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_2B0D0(0, v17[2] + 1, 1);
          }
          long long v17 = v36;
          unint64_t v27 = v36[2];
          unint64_t v26 = v36[3];
          unint64_t v28 = v27 + 1;
          if (v27 >= v26 >> 1)
          {
            unint64_t v30 = v36[2];
            unint64_t v31 = v27 + 1;
            sub_2B0D0(v26 > 1, v27 + 1, 1);
            unint64_t v27 = v30;
            unint64_t v28 = v31;
            long long v17 = v36;
          }
          void v17[2] = v28;
          uint64_t result = sub_D188(v32, (uint64_t)v17+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ v27 * v24);
          if (!v18) {
            goto LABEL_8;
          }
LABEL_7:
          unint64_t v19 = __clz(__rbit64(v18));
          v18 &= v18 - 1;
        }
      }
      int64_t v23 = v21 + 4;
      if (v23 < v34)
      {
        unint64_t v22 = *(void *)(v33 + 8 * v23);
        if (v22)
        {
          int64_t v13 = v23;
          goto LABEL_23;
        }
        while (1)
        {
          int64_t v13 = v23 + 1;
          if (__OFADD__(v23, 1)) {
            goto LABEL_34;
          }
          if (v13 >= v34) {
            break;
          }
          unint64_t v22 = *(void *)(v33 + 8 * v13);
          ++v23;
          if (v22) {
            goto LABEL_23;
          }
        }
      }
    }
LABEL_32:
    swift_release();
    return (uint64_t)v17;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t RectifiStoreApi.deinit()
{
  sub_DD28(v0 + 16, &qword_3E8C0);
  return v0;
}

uint64_t RectifiStoreApi.__deallocating_deinit()
{
  sub_DD28(v0 + 16, &qword_3E8C0);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t sub_22CC8(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_22CD8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void *sub_22D14(void *result, int64_t a2, char a3, void *a4)
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
      sub_4F90(&qword_3E980);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25AC4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_22E34(void *result, int64_t a2, char a3, void *a4)
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
      sub_4F90(&qword_3E9A8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      int64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      int64_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_25BBC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_22F44(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_23554(a1, a2, a3, a4, &qword_3E970, &qword_3D9D0);
}

void *sub_22F58(void *result, int64_t a2, char a3, void *a4)
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
      sub_4F90(&qword_3E1B8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      int64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      int64_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_25CA8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_23068(void *result, int64_t a2, char a3, void *a4)
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
      sub_4F90(&qword_3E1C0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25D9C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2318C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_232C0(a1, a2, a3, a4, &qword_3E990, (uint64_t (*)(void))type metadata accessor for ItemSequenceData, (uint64_t (*)(void))type metadata accessor for ItemSequenceData);
}

void *sub_231B0(void *result, int64_t a2, char a3, void *a4)
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
      sub_4F90(&qword_3E998);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      int64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      int64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25E94(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_232C0(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    unint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_4F90(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_31080();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25F80(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

void *sub_23540(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_23554(a1, a2, a3, a4, &qword_3E988, &qword_3E1C8);
}

void *sub_23554(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      sub_4F90(a5);
      uint64_t v13 = (void *)swift_allocObject();
      int64_t v14 = j__malloc_size(v13);
      uint64_t v15 = v14 - 32;
      if (v14 < 32) {
        uint64_t v15 = v14 - 25;
      }
      void v13[2] = v11;
      v13[3] = 2 * (v15 >> 3);
      uint64_t v16 = v13 + 4;
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v13 = _swiftEmptyArrayStorage;
      uint64_t v16 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[v11 + 4]) {
          memmove(v16, a4 + 4, 8 * v11);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_260DC(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

void *sub_23670(void *result, int64_t a2, char a3, void *a4)
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
      sub_4F90(&qword_3E978);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
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
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
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
    sub_261E4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unsigned char **sub_23780(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_23790(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_237B8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_23830(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_30EA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_23830(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23904(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_262D8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_262D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1C630((uint64_t)v12);
  return v7;
}

uint64_t sub_23904(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_30EB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_23AC0(a5, a6);
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
  uint64_t v8 = sub_30FF0();
  if (!v8)
  {
    sub_31080();
    __break(1u);
LABEL_17:
    uint64_t result = sub_310E0();
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

uint64_t sub_23AC0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_23B58(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23D38(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_23D38(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_23B58(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_23CD0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_30F80();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_31080();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_30D10();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_310E0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_31080();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_23CD0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_4F90(&qword_3E9C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23D38(char a1, int64_t a2, char a3, char *a4)
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
    sub_4F90(&qword_3E9C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

Swift::Int sub_23E88(void **a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for PatternStoreValue(0) - 8);
  unint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v3 = (void *)sub_1B220(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  Swift::Int result = sub_247D4(v6);
  *a1 = v3;
  return result;
}

void *sub_23F30(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return _swiftEmptyArrayStorage;
    }
    uint64_t v8 = v5;
    if (v5 <= 0)
    {
      int64_t v9 = _swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        type metadata accessor for PatternItem();
        swift_arrayInitWithCopy();
        return v9;
      }
    }
    else
    {
      sub_4F90(&qword_3DED0);
      int64_t v9 = (void *)swift_allocObject();
      int64_t v10 = j__malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      _OWORD v9[2] = v5;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  Swift::Int result = (void *)sub_310E0();
  __break(1u);
  return result;
}

void *sub_240B4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return _swiftEmptyArrayStorage;
    }
    if (v5 <= 0)
    {
      uint64_t v8 = _swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0) {
          goto LABEL_17;
        }
        unint64_t v10 = a2 + 40 * a3;
        if (v10 < (unint64_t)&v8[5 * v5 + 4] && (unint64_t)(v8 + 4) < v10 + 40 * v5) {
          goto LABEL_17;
        }
        swift_arrayInitWithCopy();
        return v8;
      }
    }
    else
    {
      sub_4F90(&qword_3E980);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = j__malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 40);
      if (v4 != a3) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  Swift::Int result = (void *)sub_310E0();
  __break(1u);
  return result;
}

void *sub_24240(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return _swiftEmptyArrayStorage;
  }
  if (v5 <= 0)
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)(sub_4F90(&qword_3D9F0) - 8);
      uint64_t v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      uint64_t v16 = *(void *)(v14 + 72);
      unint64_t v17 = a2 + v16 * a3;
      uint64_t v18 = v16 * v5;
      size_t v19 = &v15[v18];
      unint64_t v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20) {
        goto LABEL_24;
      }
      swift_arrayInitWithCopy();
      return v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_4F90(&qword_3E9A0);
  uint64_t v8 = *(void *)(sub_4F90(&qword_3D9F0) - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (void *)swift_allocObject();
  size_t v12 = j__malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1) {
      goto LABEL_23;
    }
    v11[2] = v5;
    v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
    if (v4 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  Swift::Int result = (void *)sub_310E0();
  __break(1u);
  return result;
}

void *sub_24488(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_4F90(&qword_3E1B8);
  unint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_258C4((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_11020();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_24570(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3)) {
    goto LABEL_21;
  }
  if (!v5) {
    return _swiftEmptyArrayStorage;
  }
  if (v5 <= 0)
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
    if (v4 != a3)
    {
LABEL_10:
      if (v5 < 0) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)(type metadata accessor for PatternStoreValue(0) - 8);
      uint64_t v15 = (char *)v11 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
      uint64_t v16 = *(void *)(v14 + 72);
      unint64_t v17 = a2 + v16 * a3;
      uint64_t v18 = v16 * v5;
      size_t v19 = &v15[v18];
      unint64_t v20 = v17 + v18;
      if (v17 < (unint64_t)v19 && (unint64_t)v15 < v20) {
        goto LABEL_24;
      }
      swift_arrayInitWithCopy();
      return v11;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  sub_4F90(&qword_3E9B0);
  uint64_t v8 = *(void *)(type metadata accessor for PatternStoreValue(0) - 8);
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = (void *)swift_allocObject();
  size_t v12 = j__malloc_size(v11);
  if (v9)
  {
    if (v12 - v10 == 0x8000000000000000 && v9 == -1) {
      goto LABEL_23;
    }
    v11[2] = v5;
    v11[3] = 2 * ((uint64_t)(v12 - v10) / v9);
    if (v4 != a3) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  Swift::Int result = (void *)sub_310E0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for RectifiStoreApi()
{
  return self;
}

Swift::Int sub_247D4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v136 = type metadata accessor for PatternStoreValue(0);
  uint64_t v130 = *(void *)(v136 - 8);
  uint64_t v4 = __chkstk_darwin(v136);
  uint64_t v127 = (uint64_t)&v121 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v137 = (uint64_t)&v121 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v133 = (uint64_t)&v121 - v9;
  __chkstk_darwin(v8);
  uint64_t v132 = (uint64_t)&v121 - v10;
  Swift::Int v11 = a1[1];
  Swift::Int result = sub_311A0(v11);
  if (result >= v11)
  {
    if (v11 < 0) {
      goto LABEL_141;
    }
    if (v11) {
      return sub_251BC(0, v11, 1, a1);
    }
    return result;
  }
  if (v11 >= 0) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v11 + 1;
  }
  if (v11 < -1) {
    goto LABEL_149;
  }
  Swift::Int v123 = result;
  if (v11 < 2)
  {
    unint64_t v17 = (char *)&_swiftEmptyArrayStorage;
    unint64_t v129 = (unint64_t)&_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v130 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v130 + 80));
    uint64_t v122 = &_swiftEmptyArrayStorage;
    if (v11 != 1)
    {
      unint64_t v19 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_107:
      uint64_t v114 = v17;
      if (v19 >= 2)
      {
        uint64_t v115 = *a1;
        do
        {
          unint64_t v116 = v19 - 2;
          if (v19 < 2) {
            goto LABEL_136;
          }
          if (!v115) {
            goto LABEL_148;
          }
          uint64_t v117 = *(void *)&v114[16 * v116 + 32];
          uint64_t v118 = *(void *)&v114[16 * v19 + 24];
          sub_2541C(v115 + *(void *)(v130 + 72) * v117, v115 + *(void *)(v130 + 72) * *(void *)&v114[16 * v19 + 16], v115 + *(void *)(v130 + 72) * v118, v129);
          if (v2) {
            break;
          }
          if (v118 < v117) {
            goto LABEL_137;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v114 = sub_1A454((uint64_t)v114);
          }
          if (v116 >= *((void *)v114 + 2)) {
            goto LABEL_138;
          }
          uint64_t v119 = &v114[16 * v116 + 32];
          *(void *)uint64_t v119 = v117;
          *((void *)v119 + 1) = v118;
          unint64_t v120 = *((void *)v114 + 2);
          if (v19 > v120) {
            goto LABEL_139;
          }
          memmove(&v114[16 * v19 + 16], &v114[16 * v19 + 32], 16 * (v120 - v19));
          *((void *)v114 + 2) = v120 - 1;
          unint64_t v19 = v120 - 1;
        }
        while (v120 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      v122[2] = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v14 = v13 >> 1;
    uint64_t v15 = sub_30D80();
    *(void *)(v15 + 16) = v14;
    uint64_t v16 = *(unsigned __int8 *)(v130 + 80);
    uint64_t v122 = (void *)v15;
    unint64_t v129 = v15 + ((v16 + 32) & ~v16);
  }
  Swift::Int v18 = 0;
  unint64_t v17 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v135 = a1;
  while (1)
  {
    Swift::Int v20 = v18;
    Swift::Int v21 = v18 + 1;
    Swift::Int v128 = v18;
    if (v18 + 1 >= v11) {
      goto LABEL_39;
    }
    uint64_t v125 = v2;
    uint64_t v22 = *a1;
    uint64_t v23 = *(void *)(v130 + 72);
    uint64_t v24 = v132;
    sub_D250(*a1 + v23 * v21, v132);
    uint64_t v25 = v133;
    sub_D250(v22 + v23 * v20, v133);
    uint64_t v26 = *(int *)(v136 + 20);
    Swift::Int v138 = *(void *)(v24 + v26);
    Swift::Int v134 = *(void *)(v25 + v26);
    sub_DAB0(v25);
    sub_DAB0(v24);
    uint64_t v131 = v22;
    uint64_t v139 = v23;
    if (v20 + 2 >= v11)
    {
      Swift::Int v29 = v20 + 2;
      uint64_t v36 = v23;
    }
    else
    {
      uint64_t v124 = v17;
      Swift::Int v27 = v23 * v21;
      uint64_t v28 = v22;
      Swift::Int v29 = v20 + 2;
      uint64_t v30 = v23 * (v20 + 2);
      while (1)
      {
        Swift::Int v31 = v11;
        int v32 = v134 < v138;
        uint64_t v33 = v132;
        sub_D250(v28 + v30, v132);
        uint64_t v34 = v133;
        sub_D250(v28 + v27, v133);
        int v35 = *(void *)(v34 + *(int *)(v136 + 20)) >= *(void *)(v33 + *(int *)(v136 + 20));
        sub_DAB0(v34);
        sub_DAB0(v33);
        if (v32 == v35) {
          break;
        }
        uint64_t v36 = v139;
        v28 += v139;
        ++v29;
        Swift::Int v11 = v31;
        if (v31 == v29)
        {
          Swift::Int v29 = v31;
          a1 = v135;
          unint64_t v17 = v124;
          Swift::Int v20 = v128;
          goto LABEL_23;
        }
      }
      a1 = v135;
      unint64_t v17 = v124;
      Swift::Int v20 = v128;
      Swift::Int v11 = v31;
      uint64_t v36 = v139;
    }
LABEL_23:
    if (v134 >= v138) {
      break;
    }
    if (v29 < v20) {
      goto LABEL_142;
    }
    Swift::Int v21 = v29;
    if (v20 >= v29)
    {
      uint64_t v2 = v125;
LABEL_39:
      if (v21 >= v11) {
        goto LABEL_59;
      }
      goto LABEL_40;
    }
    Swift::Int v138 = v11;
    uint64_t v124 = v17;
    uint64_t v37 = 0;
    uint64_t v38 = v36 * (v29 - 1);
    Swift::Int v39 = v29 * v36;
    uint64_t v40 = v20 * v36;
    do
    {
      if (v20 != v21 + v37 - 1)
      {
        uint64_t v41 = v131;
        if (!v131) {
          goto LABEL_147;
        }
        unint64_t v42 = v131 + v40;
        sub_D188(v131 + v40, v127);
        if (v40 < v38 || v42 >= v41 + v39)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v40 != v38)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        sub_D188(v127, v41 + v38);
        Swift::Int v21 = v29;
        uint64_t v36 = v139;
      }
      ++v20;
      --v37;
      v38 -= v36;
      v39 -= v36;
      v40 += v36;
    }
    while (v20 < v21 + v37);
    a1 = v135;
    unint64_t v17 = v124;
    uint64_t v2 = v125;
    Swift::Int v20 = v128;
    Swift::Int v11 = v138;
    if (v21 < v138) {
      goto LABEL_40;
    }
LABEL_59:
    if (v21 < v20) {
      goto LABEL_135;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    Swift::Int v134 = v21;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      unint64_t v17 = sub_19F50(0, *((void *)v17 + 2) + 1, 1, v17);
    }
    unint64_t v63 = *((void *)v17 + 2);
    unint64_t v62 = *((void *)v17 + 3);
    unint64_t v19 = v63 + 1;
    if (v63 >= v62 >> 1) {
      unint64_t v17 = sub_19F50((char *)(v62 > 1), v63 + 1, 1, v17);
    }
    *((void *)v17 + 2) = v19;
    unint64_t v64 = v17 + 32;
    unint64_t v65 = &v17[16 * v63 + 32];
    Swift::Int v66 = v134;
    *(void *)unint64_t v65 = v128;
    *((void *)v65 + 1) = v66;
    if (v63)
    {
      while (1)
      {
        unint64_t v67 = v19 - 1;
        if (v19 >= 4)
        {
          BOOL v72 = &v64[16 * v19];
          uint64_t v73 = *((void *)v72 - 8);
          uint64_t v74 = *((void *)v72 - 7);
          BOOL v78 = __OFSUB__(v74, v73);
          uint64_t v75 = v74 - v73;
          if (v78) {
            goto LABEL_124;
          }
          uint64_t v77 = *((void *)v72 - 6);
          uint64_t v76 = *((void *)v72 - 5);
          BOOL v78 = __OFSUB__(v76, v77);
          uint64_t v70 = v76 - v77;
          char v71 = v78;
          if (v78) {
            goto LABEL_125;
          }
          unint64_t v79 = v19 - 2;
          uint64_t v80 = &v64[16 * v19 - 32];
          uint64_t v82 = *(void *)v80;
          uint64_t v81 = *((void *)v80 + 1);
          BOOL v78 = __OFSUB__(v81, v82);
          uint64_t v83 = v81 - v82;
          if (v78) {
            goto LABEL_127;
          }
          BOOL v78 = __OFADD__(v70, v83);
          uint64_t v84 = v70 + v83;
          if (v78) {
            goto LABEL_130;
          }
          if (v84 >= v75)
          {
            uint64_t v102 = &v64[16 * v67];
            uint64_t v104 = *(void *)v102;
            uint64_t v103 = *((void *)v102 + 1);
            BOOL v78 = __OFSUB__(v103, v104);
            uint64_t v105 = v103 - v104;
            if (v78) {
              goto LABEL_134;
            }
            BOOL v95 = v70 < v105;
            goto LABEL_96;
          }
        }
        else
        {
          if (v19 != 3)
          {
            uint64_t v96 = *((void *)v17 + 4);
            uint64_t v97 = *((void *)v17 + 5);
            BOOL v78 = __OFSUB__(v97, v96);
            uint64_t v89 = v97 - v96;
            char v90 = v78;
            goto LABEL_90;
          }
          uint64_t v69 = *((void *)v17 + 4);
          uint64_t v68 = *((void *)v17 + 5);
          BOOL v78 = __OFSUB__(v68, v69);
          uint64_t v70 = v68 - v69;
          char v71 = v78;
        }
        if (v71) {
          goto LABEL_126;
        }
        unint64_t v79 = v19 - 2;
        uint64_t v85 = &v64[16 * v19 - 32];
        uint64_t v87 = *(void *)v85;
        uint64_t v86 = *((void *)v85 + 1);
        BOOL v88 = __OFSUB__(v86, v87);
        uint64_t v89 = v86 - v87;
        char v90 = v88;
        if (v88) {
          goto LABEL_129;
        }
        uint64_t v91 = &v64[16 * v67];
        uint64_t v93 = *(void *)v91;
        uint64_t v92 = *((void *)v91 + 1);
        BOOL v78 = __OFSUB__(v92, v93);
        uint64_t v94 = v92 - v93;
        if (v78) {
          goto LABEL_132;
        }
        if (__OFADD__(v89, v94)) {
          goto LABEL_133;
        }
        if (v89 + v94 >= v70)
        {
          BOOL v95 = v70 < v94;
LABEL_96:
          if (v95) {
            unint64_t v67 = v79;
          }
          goto LABEL_98;
        }
LABEL_90:
        if (v90) {
          goto LABEL_128;
        }
        uint64_t v98 = &v64[16 * v67];
        uint64_t v100 = *(void *)v98;
        uint64_t v99 = *((void *)v98 + 1);
        BOOL v78 = __OFSUB__(v99, v100);
        uint64_t v101 = v99 - v100;
        if (v78) {
          goto LABEL_131;
        }
        if (v101 < v89) {
          goto LABEL_14;
        }
LABEL_98:
        unint64_t v106 = v67 - 1;
        if (v67 - 1 >= v19)
        {
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
          goto LABEL_144;
        }
        uint64_t v107 = *a1;
        if (!*a1) {
          goto LABEL_146;
        }
        uint64_t v108 = v17;
        uint64_t v109 = &v64[16 * v106];
        uint64_t v110 = *(void *)v109;
        uint64_t v111 = &v64[16 * v67];
        uint64_t v112 = *((void *)v111 + 1);
        sub_2541C(v107 + *(void *)(v130 + 72) * *(void *)v109, v107 + *(void *)(v130 + 72) * *(void *)v111, v107 + *(void *)(v130 + 72) * v112, v129);
        if (v2) {
          goto LABEL_118;
        }
        if (v112 < v110) {
          goto LABEL_121;
        }
        if (v67 > *((void *)v108 + 2)) {
          goto LABEL_122;
        }
        *(void *)uint64_t v109 = v110;
        *(void *)&v64[16 * v106 + 8] = v112;
        unint64_t v113 = *((void *)v108 + 2);
        if (v67 >= v113) {
          goto LABEL_123;
        }
        unint64_t v17 = v108;
        unint64_t v19 = v113 - 1;
        memmove(&v64[16 * v67], v111 + 16, 16 * (v113 - 1 - v67));
        *((void *)v108 + 2) = v113 - 1;
        a1 = v135;
        if (v113 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v19 = 1;
LABEL_14:
    Swift::Int v11 = a1[1];
    Swift::Int v18 = v134;
    if (v134 >= v11) {
      goto LABEL_107;
    }
  }
  Swift::Int v21 = v29;
  uint64_t v2 = v125;
  if (v21 >= v11) {
    goto LABEL_59;
  }
LABEL_40:
  if (__OFSUB__(v21, v20)) {
    goto LABEL_140;
  }
  if (v21 - v20 >= v123) {
    goto LABEL_59;
  }
  if (__OFADD__(v20, v123)) {
    goto LABEL_143;
  }
  if (v20 + v123 >= v11) {
    Swift::Int v43 = v11;
  }
  else {
    Swift::Int v43 = v20 + v123;
  }
  if (v43 >= v20)
  {
    if (v21 != v43)
    {
      uint64_t v124 = v17;
      uint64_t v125 = v2;
      uint64_t v44 = *(void *)(v130 + 72);
      uint64_t v45 = v44 * (v21 - 1);
      uint64_t v131 = v44;
      Swift::Int v46 = v21 * v44;
      Swift::Int v126 = v43;
      do
      {
        uint64_t v48 = 0;
        Swift::Int v134 = v21;
        while (1)
        {
          Swift::Int v138 = v20;
          uint64_t v49 = v135;
          uint64_t v50 = *v135;
          Swift::Int v51 = v46;
          uint64_t v52 = v46 + v48 + *v135;
          uint64_t v53 = v132;
          sub_D250(v52, v132);
          uint64_t v54 = v45;
          uint64_t v55 = v45 + v48 + v50;
          uint64_t v56 = v133;
          sub_D250(v55, v133);
          uint64_t v57 = *(int *)(v136 + 20);
          uint64_t v139 = *(void *)(v53 + v57);
          uint64_t v58 = *(void *)(v56 + v57);
          sub_DAB0(v56);
          sub_DAB0(v53);
          if (v58 >= v139) {
            break;
          }
          uint64_t v59 = *v49;
          if (!*v49) {
            goto LABEL_145;
          }
          Swift::Int v46 = v51;
          uint64_t v45 = v54;
          uint64_t v60 = v59 + v54 + v48;
          sub_D188(v59 + v51 + v48, v137);
          swift_arrayInitWithTakeFrontToBack();
          sub_D188(v137, v60);
          v48 -= v131;
          Swift::Int v20 = v138 + 1;
          Swift::Int v47 = v134;
          if (v134 == v138 + 1) {
            goto LABEL_50;
          }
        }
        Swift::Int v47 = v134;
        uint64_t v45 = v54;
        Swift::Int v46 = v51;
LABEL_50:
        Swift::Int v21 = v47 + 1;
        v45 += v131;
        v46 += v131;
        Swift::Int v20 = v128;
      }
      while (v21 != v126);
      Swift::Int v21 = v126;
      unint64_t v17 = v124;
      uint64_t v2 = v125;
      a1 = v135;
    }
    goto LABEL_59;
  }
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  Swift::Int result = sub_31080();
  __break(1u);
  return result;
}

uint64_t sub_251BC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v29 = a1;
  uint64_t v32 = type metadata accessor for PatternStoreValue(0);
  uint64_t v7 = __chkstk_darwin(v32);
  uint64_t v33 = (uint64_t)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  Swift::Int v11 = (char *)&v27 - v10;
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v15 = (char *)&v27 - v14;
  uint64_t v31 = a3;
  uint64_t v28 = a2;
  if (a3 != a2)
  {
    uint64_t v16 = *(void *)(v13 + 72);
    uint64_t v35 = v16 * (v31 - 1);
    uint64_t v30 = v16;
    uint64_t v34 = v16 * v31;
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v18 = v29;
    while (1)
    {
      unint64_t v19 = a4;
      uint64_t v20 = *a4;
      sub_D250(v34 + v17 + v20, (uint64_t)v15);
      sub_D250(v35 + v17 + v20, (uint64_t)v11);
      uint64_t v21 = *(int *)(v32 + 20);
      uint64_t v22 = *(void *)&v15[v21];
      uint64_t v23 = *(void *)&v11[v21];
      sub_DAB0((uint64_t)v11);
      uint64_t result = sub_DAB0((uint64_t)v15);
      BOOL v24 = v23 < v22;
      a4 = v19;
      if (!v24)
      {
LABEL_4:
        v35 += v30;
        v34 += v30;
        if (++v31 == v28) {
          return result;
        }
        goto LABEL_5;
      }
      uint64_t v25 = *v19;
      if (!*v19) {
        break;
      }
      uint64_t v26 = v25 + v35 + v17;
      sub_D188(v25 + v34 + v17, v33);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_D188(v33, v26);
      v17 -= v30;
      ++v18;
      a4 = v19;
      if (v31 == v18) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2541C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = type metadata accessor for PatternStoreValue(0);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v49 = (uint64_t)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  size_t v12 = (char *)&v45 - v11;
  uint64_t v14 = *(void *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_71;
  }
  int64_t v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_72;
  }
  uint64_t v16 = (uint64_t)(a2 - a1) / v14;
  unint64_t v52 = a1;
  unint64_t v51 = a4;
  uint64_t v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    unint64_t v48 = a1;
    if ((v17 & 0x8000000000000000) == 0)
    {
      uint64_t v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v30 = a4 + v19;
      unint64_t v50 = a4 + v19;
      unint64_t v52 = a2;
      if (v19 >= 1 && v48 < a2)
      {
        uint64_t v32 = -v14;
        uint64_t v46 = v8;
        unint64_t v47 = a4;
        do
        {
          unint64_t v33 = a3 + v32;
          sub_D250(v30 + v32, (uint64_t)v12);
          unint64_t v34 = a2 + v32;
          uint64_t v35 = (uint64_t)v12;
          uint64_t v36 = v49;
          sub_D250(a2 + v32, v49);
          uint64_t v37 = *(int *)(v8 + 20);
          uint64_t v38 = *(void *)(v35 + v37);
          uint64_t v39 = *(void *)(v36 + v37);
          uint64_t v40 = v36;
          size_t v12 = (char *)v35;
          sub_DAB0(v40);
          sub_DAB0(v35);
          if (v39 >= v38)
          {
            unint64_t v42 = v50;
            v50 += v32;
            if (a3 < v42 || v33 >= v42)
            {
              uint64_t v8 = v46;
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v34 = a2;
              unint64_t v41 = v47;
            }
            else
            {
              uint64_t v8 = v46;
              unint64_t v41 = v47;
              if (a3 != v42) {
                swift_arrayInitWithTakeBackToFront();
              }
              unint64_t v34 = a2;
            }
          }
          else
          {
            if (a3 < a2 || v33 >= a2)
            {
              uint64_t v8 = v46;
              swift_arrayInitWithTakeFrontToBack();
              unint64_t v41 = v47;
            }
            else
            {
              uint64_t v8 = v46;
              unint64_t v41 = v47;
              if (a3 != a2) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v52 += v32;
          }
          unint64_t v30 = v50;
          if (v50 <= v41) {
            break;
          }
          a2 = v34;
          a3 += v32;
        }
        while (v34 > v48);
      }
      goto LABEL_69;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    uint64_t v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v48 = a4 + v18;
    unint64_t v50 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      uint64_t v21 = v49;
      do
      {
        sub_D250(a2, (uint64_t)v12);
        sub_D250(a4, v21);
        uint64_t v22 = *(int *)(v8 + 20);
        uint64_t v23 = *(void *)&v12[v22];
        uint64_t v24 = *(void *)(v21 + v22);
        sub_DAB0(v21);
        sub_DAB0((uint64_t)v12);
        unint64_t v25 = v52;
        if (v24 >= v23)
        {
          unint64_t v28 = v51 + v14;
          if (v52 < v51 || v52 >= v28)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v52 != v51)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v51 = v28;
          unint64_t v26 = a2;
        }
        else
        {
          unint64_t v26 = a2 + v14;
          if (v52 < a2 || v52 >= v26)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v52 == a2)
          {
            unint64_t v25 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        unint64_t v52 = v25 + v14;
        a4 = v51;
        if (v51 >= v48) {
          break;
        }
        a2 = v26;
      }
      while (v26 < a3);
    }
LABEL_69:
    sub_1A314(&v52, &v51, (uint64_t *)&v50);
    return 1;
  }
LABEL_73:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_258C4(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_25AC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

char *sub_25BBC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_25CA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_25D9C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

char *sub_25E94(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_25F80(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_260DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 8 * a1 + 32;
    unint64_t v7 = a3 + 8 * v5;
    if (v6 >= v7 || v6 + 8 * v5 <= a3)
    {
      sub_4F90(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_261E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_262D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_26334(uint64_t a1)
{
  sub_2AFF0(0, 0, 0);
  uint64_t v2 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = _swiftEmptyArrayStorage[2];
    uint64_t v5 = 2 * v4;
    do
    {
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      if (v4 + v3 >= v6 >> 1) {
        sub_2AFF0(v6 > 1, v4 + v3 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v4 + v3 + 1;
      unint64_t v7 = &_swiftEmptyArrayStorage[v5];
      v7[4] = v3;
      v7[5] = -1;
      v5 += 2;
      ++v3;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

void sub_26428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::UInt v5 = *(void *)(a2 + 16);
  sub_31220(v5);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = a2 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_30CF0();
      swift_bridgeObjectRelease();
      v6 += 16;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  Swift::UInt v7 = *(void *)(a3 + 16);
  sub_31220(v7);
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = a3 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_30CF0();
      swift_bridgeObjectRelease();
      v8 += 16;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
}

Swift::Int sub_26534()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  sub_31210();
  sub_26428((uint64_t)v4, v1, v2);
  return sub_31230();
}

void sub_26580(uint64_t a1)
{
  sub_26428(a1, *v1, v1[1]);
}

Swift::Int sub_26588()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  sub_31210();
  sub_26428((uint64_t)v4, v1, v2);
  return sub_31230();
}

uint64_t sub_265D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void **)(a2 + 8);
  if ((sub_9C64(*(void **)a1, *(void **)a2) & 1) == 0) {
    return 0;
  }

  return sub_9C64(v2, v3);
}

uint64_t SiriPrivateLearningPatternExtractionPlugin.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  SiriPrivateLearningPatternExtractionPlugin.init()();
  return v0;
}

void *SiriPrivateLearningPatternExtractionPlugin.init()()
{
  uint64_t v1 = v0;
  *(void *)&long long v23 = sub_30800();
  *((void *)&v23 + 1) = &protocol witness table for EnvironmentFeatureFlags;
  sub_2696C((uint64_t *)&v22);
  sub_307F0();
  sub_1C680(&v22, (uint64_t)(v0 + 12));
  uint64_t v2 = type metadata accessor for PatternLogger();
  uint64_t v3 = swift_allocObject();
  v1[20] = v2;
  v1[21] = &off_39860;
  v1[17] = v3;
  uint64_t v4 = sub_30830();
  swift_allocObject();
  v1[2] = sub_30820();
  v1[5] = v4;
  v1[6] = &protocol witness table for RECTIFITrialStatusResolver;
  sub_1C5CC((uint64_t)(v1 + 2), (uint64_t)v25);
  sub_306D0();
  sub_306C0();
  sub_30690();
  swift_release();
  long long v20 = v23;
  uint64_t v5 = v23;
  uint64_t v6 = sub_1ABC0(&v22, v23);
  *(_OWORD *)&v24[3] = v20;
  Swift::UInt v7 = sub_2696C(v24);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(v7, v6, v5);
  sub_1C630((uint64_t)&v22);
  sub_306C0();
  sub_306B0();
  swift_release();
  sub_306C0();
  sub_306A0();
  swift_release();
  sub_30760();
  swift_allocObject();
  uint64_t v8 = sub_30750();
  sub_30740();
  swift_allocObject();
  uint64_t v9 = sub_30730();
  sub_307A0();
  swift_allocObject();
  uint64_t v10 = sub_30790();
  uint64_t v11 = type metadata accessor for ItemSequenceFetcher();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 200) = xmmword_329E0;
  *(void *)(v12 + 216) = 0x404E000000000000;
  sub_1C680((long long *)v24, v12 + 16);
  sub_1C680(&v22, v12 + 56);
  *(void *)(v12 + 96) = v8;
  *(void *)(v12 + 104) = v9;
  *(void *)(v12 + 112) = v10;
  sub_1C680(&v21, v12 + 120);
  sub_1C680(v25, v12 + 160);
  v1[10] = v11;
  v1[11] = &off_39588;
  v1[7] = v12;
  if (qword_3D718 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_3EB78;
  uint64_t v13 = unk_3EB80;
  sub_1ABC0(v1 + 2, v1[5]);
  uint64_t v15 = sub_308B0();
  int64_t v17 = v16;
  *(void *)&long long v22 = v14;
  *((void *)&v22 + 1) = v13;
  swift_bridgeObjectRetain();
  v26._countAndFlagsBits = v15;
  v26._object = v17;
  sub_30D00(v26);
  swift_bridgeObjectRelease();
  uint64_t v18 = *((void *)&v22 + 1);
  v1[22] = v22;
  v1[23] = v18;
  return v1;
}

uint64_t *sub_2696C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t SiriPrivateLearningPatternExtractionPlugin.run(context:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_305D0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = sub_4F90(&qword_3E9C8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_30DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = (char *)swift_allocObject();
  *((void *)v15 + 2) = 0;
  *((void *)v15 + 3) = 0;
  *((void *)v15 + 4) = v3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v15[v14], (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  unint64_t v16 = &v15[(v9 + v14 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(void *)unint64_t v16 = a2;
  *((void *)v16 + 1) = a3;
  swift_retain();
  swift_retain();
  sub_272D0((uint64_t)v12, (uint64_t)&unk_3E9D8, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_26BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[10] = a6;
  v7[11] = a7;
  v7[8] = a4;
  v7[9] = a5;
  uint64_t v8 = sub_305B0();
  v7[12] = v8;
  v7[13] = *(void *)(v8 - 8);
  v7[14] = swift_task_alloc();
  return _swift_task_switch(sub_26C90, 0, 0);
}

uint64_t sub_26C90()
{
  sub_1ABC0((void *)(v0[8] + 96), *(void *)(v0[8] + 120));
  uint64_t v1 = sub_30590();
  v0[5] = v1;
  v0[6] = sub_30158(&qword_3EB58, (void (*)(uint64_t))&type metadata accessor for SiriPrivateLearningFeatureFlag);
  uint64_t v2 = sub_2696C(v0 + 2);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v2, enum case for SiriPrivateLearningFeatureFlag.rectifiPatternExtraction(_:), v1);
  char v3 = sub_307C0();
  sub_1C630((uint64_t)(v0 + 2));
  if (v3 & 1) != 0 || (sub_1ABC0((void *)(v0[8] + 16), *(void *)(v0[8] + 40)), (sub_308D0()))
  {
    uint64_t v4 = (void *)swift_task_alloc();
    v0[15] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_26EB4;
    uint64_t v5 = v0[9];
    return sub_27D7C(v5);
  }
  else
  {
    uint64_t v7 = v0[14];
    uint64_t v8 = (void (*)(uint64_t))v0[10];
    (*(void (**)(uint64_t, void, void))(v0[13] + 104))(v7, enum case for PrivateLearningPluginResult.success(_:), v0[12]);
    v8(v7);
    (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(void))v0[1];
    return v9();
  }
}

uint64_t sub_26EB4()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_27084;
  }
  else {
    uint64_t v2 = sub_26FC8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_26FC8()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = (void (*)(uint64_t))v0[10];
  (*(void (**)(uint64_t, void, void))(v0[13] + 104))(v1, enum case for PrivateLearningPluginResult.success(_:), v0[12]);
  v2(v1);
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  swift_task_dealloc();
  char v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_27084()
{
  uint64_t v2 = v0[13];
  uint64_t v1 = v0[14];
  uint64_t v3 = v0[12];
  uint64_t v4 = (void (*)(uint64_t))v0[10];
  v0[7] = v0[16];
  swift_errorRetain();
  sub_4F90(&qword_3E160);
  sub_30CC0();
  sub_305A0();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for PrivateLearningPluginResult.failure(_:), v3);
  v4(v1);
  swift_errorRelease();
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_27194(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_305D0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_1D04C;
  return sub_26BCC(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_272D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_30DD0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_30DC0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_30008(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_30DA0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t sub_27474(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ItemSequenceData();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3 - 8);
  uint64_t v61 = (char *)v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = 0;
  unint64_t v76 = 0xE000000000000000;
  uint64_t v77 = _swiftEmptyArrayStorage;
  sub_1ABC0((void *)(v1 + 16), *(void *)(v1 + 40));
  sub_30890();
  double v7 = v6;
  sub_1ABC0((void *)(v1 + 16), *(void *)(v1 + 40));
  sub_308A0();
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
    uint64_t v54 = _swiftEmptyArrayStorage;
LABEL_67:
    swift_bridgeObjectRelease();
    return (unint64_t)v54;
  }
  double v10 = v8;
  uint64_t v11 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v55[0] = a1;
  swift_bridgeObjectRetain();
  swift_beginAccess();
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)(v4 + 72);
  uint64_t v57 = &v71;
  *(void *)&long long v14 = 136315138;
  long long v56 = v14;
  v55[1] = (char *)&type metadata for Any + 8;
  unint64_t v65 = _swiftEmptyArrayStorage;
  unint64_t v64 = _swiftEmptyArrayStorage;
  uint64_t v15 = (uint64_t)v61;
  uint64_t v58 = v13;
  uint64_t v60 = v9;
  uint64_t v59 = v11;
  while (1)
  {
    sub_2FD0C(v11 + v13 * v12, v15, (uint64_t (*)(void))type metadata accessor for ItemSequenceData);
    uint64_t v16 = *(void *)(v15 + 8);
    uint64_t v17 = *(void *)(v16 + 16);
    if (v17) {
      break;
    }
LABEL_3:
    sub_2FD74(v15, (uint64_t (*)(void))type metadata accessor for ItemSequenceData);
LABEL_4:
    if (++v12 == v9)
    {
      swift_bridgeObjectRelease();
      uint64_t v54 = v64;
      goto LABEL_67;
    }
  }
  uint64_t v18 = 0;
  uint64_t v69 = v16 + 32;
  while (1)
  {
    double v19 = *(double *)(v16 + 8 * v18 + 32);
    if (v7 < v19 && v19 < 1.0) {
      break;
    }
    if (v17 == ++v18) {
      goto LABEL_3;
    }
  }
  uint64_t v75 = 0x65636E6575716553;
  unint64_t v76 = 0xEA00000000000A3ALL;
  swift_bridgeObjectRelease();
  unint64_t v73 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v74 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v21 = *(void *)v15;
  if (!(*(void *)v15 >> 62))
  {
    uint64_t v22 = *(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    unint64_t result = swift_bridgeObjectRetain();
    if (v22) {
      goto LABEL_15;
    }
LABEL_41:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_42:
    unint64_t v38 = v74;
    if (v74 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_31090();
      swift_bridgeObjectRelease();
      if (v47) {
        goto LABEL_44;
      }
    }
    else if (*(void *)((char *)&dword_10 + (v74 & 0xFFFFFFFFFFFFFF8)))
    {
LABEL_44:
      if (swift_isUniquelyReferenced_nonNull_native()) {
        uint64_t v39 = v65;
      }
      else {
        uint64_t v39 = sub_22F44(0, v65[2] + 1, 1, v65);
      }
      unint64_t v41 = v39[2];
      unint64_t v40 = v39[3];
      if (v41 >= v40 >> 1) {
        uint64_t v39 = sub_22F44((void *)(v40 > 1), v41 + 1, 1, v39);
      }
      v39[2] = v41 + 1;
      unint64_t v65 = v39;
      v39[v41 + 4] = v38;
      unint64_t v42 = v73;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        Swift::Int v43 = v64;
      }
      else {
        Swift::Int v43 = sub_23540(0, v64[2] + 1, 1, v64);
      }
      unint64_t v45 = v43[2];
      unint64_t v44 = v43[3];
      if (v45 >= v44 >> 1) {
        Swift::Int v43 = sub_23540((void *)(v44 > 1), v45 + 1, 1, v43);
      }
      v43[2] = v45 + 1;
      unint64_t v64 = v43;
      v43[v45 + 4] = v42;
      id v46 = *(id *)(v15 + 16);
      sub_30D40();
      if (v77[2] >= v77[3] >> 1) {
        sub_30D70();
      }
      sub_30D90();
      sub_30D60();
      goto LABEL_57;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_57:
    if (qword_3D730 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_30C50();
    sub_DA38(v48, (uint64_t)qword_3EB98);
    uint64_t v49 = sub_30C30();
    os_log_type_t v50 = sub_30E20();
    if (os_log_type_enabled(v49, v50))
    {
      unint64_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      *(_DWORD *)unint64_t v51 = v56;
      uint64_t v52 = v75;
      unint64_t v53 = v76;
      swift_bridgeObjectRetain();
      uint64_t v70 = sub_23830(v52, v53, &v71);
      sub_30EA0();
      uint64_t v15 = (uint64_t)v61;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v49, v50, "%s", v51, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_2FD74(v15, (uint64_t (*)(void))type metadata accessor for ItemSequenceData);
    uint64_t v9 = v60;
    uint64_t v11 = v59;
    uint64_t v13 = v58;
    goto LABEL_4;
  }
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_31090();
  unint64_t result = swift_bridgeObjectRelease();
  if (!v22) {
    goto LABEL_41;
  }
LABEL_15:
  unint64_t v68 = v21 & 0xC000000000000001;
  if ((v21 & 0xC000000000000001) != 0)
  {
    unint64_t result = sub_30FB0();
    unint64_t v24 = result;
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v21 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_70;
    }
    unint64_t v24 = *(void *)(v21 + 32);
    unint64_t result = swift_retain();
  }
  uint64_t v67 = *(void *)(v16 + 16);
  if (!v67)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_42;
  }
  unint64_t v25 = 0;
  uint64_t v63 = v21 & 0xFFFFFFFFFFFFFF8;
  uint64_t v62 = v21 + 40;
  uint64_t v66 = v22 - 1;
  while (v25 < *(void *)(v16 + 16))
  {
    double v26 = *(double *)(v69 + 8 * v25);
    if (v26 != -1.0 && v26 < v10)
    {
      swift_release();
LABEL_37:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_39:
      uint64_t v15 = (uint64_t)v61;
      goto LABEL_42;
    }
    swift_retain();
    uint64_t v28 = sub_1F530();
    unint64_t v30 = v29;
    swift_release();
    uint64_t v71 = v28;
    BOOL v72 = v30;
    swift_bridgeObjectRetain();
    v78._countAndFlagsBits = 10;
    v78._object = (void *)0xE100000000000000;
    sub_30D00(v78);
    swift_bridgeObjectRelease();
    uint64_t v31 = v71;
    uint64_t v32 = v72;
    swift_beginAccess();
    v79._countAndFlagsBits = v31;
    v79._object = v32;
    sub_30D00(v79);
    swift_endAccess();
    swift_bridgeObjectRelease();
    uint64_t v34 = *(void *)(v24 + 16);
    uint64_t v33 = *(void *)(v24 + 24);
    uint64_t v35 = *(void *)(v24 + 32);
    __int16 v36 = *(_WORD *)(v24 + 40);
    type metadata accessor for PatternItem();
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v34;
    *(void *)(v37 + 24) = v33;
    *(void *)(v37 + 32) = v35;
    *(_WORD *)(v37 + 40) = v36;
    swift_bridgeObjectRetain();
    sub_30D40();
    if (*(void *)((char *)&dword_10 + (v74 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v74 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_30D70();
    sub_30D90();
    sub_30D60();
    swift_retain();
    sub_30D40();
    if (*(void *)((char *)&dword_10 + (v73 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                   + (v73 & 0xFFFFFFFFFFFFFF8)) >> 1)
      sub_30D70();
    sub_30D90();
    sub_30D60();
    swift_release();
    if (v66 == v25) {
      goto LABEL_37;
    }
    unint64_t result = v25 + 1;
    if (v68)
    {
      unint64_t result = sub_30FB0();
      unint64_t v24 = result;
    }
    else
    {
      if (result >= *(void *)(v63 + 16)) {
        goto LABEL_69;
      }
      unint64_t v24 = *(void *)(v62 + 8 * v25);
      unint64_t result = swift_retain();
    }
    if (v67 == ++v25)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_39;
    }
  }
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
  return result;
}

uint64_t sub_27D7C(uint64_t a1)
{
  v2[58] = a1;
  v2[59] = v1;
  uint64_t v3 = sub_30510();
  v2[60] = v3;
  v2[61] = *(void *)(v3 - 8);
  v2[62] = swift_task_alloc();
  sub_4F90(&qword_3EAE0);
  v2[63] = swift_task_alloc();
  v2[64] = swift_task_alloc();
  uint64_t v4 = sub_30BE0();
  v2[65] = v4;
  v2[66] = *(void *)(v4 - 8);
  v2[67] = swift_task_alloc();
  v2[68] = swift_task_alloc();
  v2[69] = swift_task_alloc();
  v2[70] = swift_task_alloc();
  v2[71] = swift_task_alloc();
  v2[72] = swift_task_alloc();
  uint64_t v5 = sub_30BA0();
  v2[73] = v5;
  v2[74] = *(void *)(v5 - 8);
  v2[75] = swift_task_alloc();
  v2[76] = swift_task_alloc();
  v2[77] = swift_task_alloc();
  v2[78] = swift_task_alloc();
  v2[79] = swift_task_alloc();
  v2[80] = swift_task_alloc();
  v2[81] = swift_task_alloc();
  uint64_t v6 = sub_305D0();
  v2[82] = v6;
  v2[83] = *(void *)(v6 - 8);
  v2[84] = swift_task_alloc();
  v2[85] = swift_task_alloc();
  return _swift_task_switch(sub_2802C, 0, 0);
}

uint64_t sub_2802C()
{
  uint64_t v57 = v0;
  uint64_t v1 = *(void *)(v0 + 680);
  uint64_t v2 = *(void *)(v0 + 664);
  uint64_t v3 = *(void *)(v0 + 656);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for PrivateLearningPluginRunContext.maintenance(_:), v3);
  char v4 = sub_305C0();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v5(v1, v3);
  if (v4)
  {
    if (qword_3D740 != -1) {
      swift_once();
    }
    uint64_t v6 = *(void *)(v0 + 648);
    uint64_t v7 = *(void *)(v0 + 592);
    uint64_t v8 = *(void *)(v0 + 584);
    uint64_t v9 = sub_30BD0();
    *(void *)(v0 + 688) = sub_DA38(v9, (uint64_t)qword_3EBC8);
    sub_30BC0();
    sub_30B80();
    *(void *)(v0 + 696) = sub_1D2DC("runPatternExtractionPlugin", 26, 2, v6);
    double v10 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    *(void *)(v0 + 704) = v10;
    *(void *)(v0 + 712) = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v10(v6, v8);
    if (qword_3D730 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_30C50();
    *(void *)(v0 + 720) = sub_DA38(v11, (uint64_t)qword_3EB98);
    uint64_t v12 = sub_30C30();
    os_log_type_t v13 = sub_30E10();
    if (os_log_type_enabled(v12, v13))
    {
      long long v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v14 = 0;
      _os_log_impl(&dword_0, v12, v13, "SiriPrivateLearningPatternExtractionPlugin.run() started", v14, 2u);
      swift_slowDealloc();
    }
    uint64_t v15 = *(void *)(v0 + 472);

    uint64_t v16 = *(void *)(v15 + 176);
    uint64_t v17 = *(void *)(v15 + 184);
    uint64_t v18 = type metadata accessor for RectifiCoreDataStore(0);
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_5620(v16, v17);
    if (v19)
    {
      uint64_t v20 = *(void *)(v0 + 472);
      *(void *)(v0 + 152) = v18;
      *(void *)(v0 + 160) = &off_393A8;
      *(void *)(v0 + 128) = v19;
      sub_1C680((long long *)(v0 + 128), v0 + 88);
      sub_1ABC0((void *)(v20 + 56), *(void *)(v20 + 80));
      uint64_t v21 = (void *)swift_task_alloc();
      *(void *)(v0 + 728) = v21;
      *uint64_t v21 = v0;
      v21[1] = sub_2889C;
      return sub_16C8C();
    }
    uint64_t v37 = sub_30C30();
    os_log_type_t v38 = sub_30E20();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl(&dword_0, v37, v38, "RECTIFI on-device store error", v39, 2u);
      swift_slowDealloc();
    }

    unint64_t v40 = sub_30C30();
    os_log_type_t v41 = sub_30E10();
    if (os_log_type_enabled(v40, v41))
    {
      unint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v42 = 0;
      _os_log_impl(&dword_0, v40, v41, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v42, 2u);
      swift_slowDealloc();
    }

    Swift::Int v43 = sub_30BC0();
    sub_30BF0();
    os_signpost_type_t v44 = sub_30E40();
    if (sub_30E80())
    {
      uint64_t v45 = *(void *)(v0 + 536);
      uint64_t v46 = *(void *)(v0 + 528);
      uint64_t v47 = *(void *)(v0 + 520);
      swift_retain();
      sub_30C20();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v46 + 88))(v45, v47) == enum case for OSSignpostError.doubleEnd(_:))
      {
        uint64_t v48 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 528) + 8))(*(void *)(v0 + 536), *(void *)(v0 + 520));
        uint64_t v48 = "";
      }
      uint64_t v51 = *(void *)(v0 + 648);
      uint64_t v52 = *(void *)(v0 + 600);
      uint64_t v53 = *(void *)(v0 + 584);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 592) + 16))(v51, v52, v53);
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v54 = 0;
      os_signpost_id_t v55 = sub_30B90();
      _os_signpost_emit_with_name_impl(&dword_0, v43, v44, v55, "runPatternExtractionPlugin", v48, v54, 2u);
      swift_slowDealloc();

      v10(v52, v53);
      v10(v51, v53);
      swift_release();
    }
    else
    {
      uint64_t v49 = *(void *)(v0 + 600);
      uint64_t v50 = *(void *)(v0 + 584);

      v10(v49, v50);
      swift_release();
    }
  }
  else
  {
    if (qword_3D730 != -1) {
      swift_once();
    }
    uint64_t v23 = *(void *)(v0 + 672);
    uint64_t v24 = *(void *)(v0 + 664);
    uint64_t v25 = *(void *)(v0 + 656);
    uint64_t v26 = *(void *)(v0 + 464);
    uint64_t v27 = sub_30C50();
    sub_DA38(v27, (uint64_t)qword_3EB98);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v26, v25);
    uint64_t v28 = sub_30C30();
    os_log_type_t v29 = sub_30E10();
    BOOL v30 = os_log_type_enabled(v28, v29);
    uint64_t v31 = *(void *)(v0 + 672);
    uint64_t v32 = *(void *)(v0 + 656);
    if (v30)
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136315138;
      sub_30158(&qword_3EAE8, (void (*)(uint64_t))&type metadata accessor for PrivateLearningPluginRunContext);
      uint64_t v34 = sub_311B0();
      *(void *)(v0 + 376) = sub_23830(v34, v35, &v56);
      sub_30EA0();
      swift_bridgeObjectRelease();
      v5(v31, v32);
      _os_log_impl(&dword_0, v28, v29, "SiriPrivateLearningPatternExtractionPlugin.run() is skipped because context is %s", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v5(*(void *)(v0 + 672), *(void *)(v0 + 656));
    }
  }
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
  swift_task_dealloc();
  swift_task_dealloc();
  __int16 v36 = *(uint64_t (**)(void))(v0 + 8);
  return v36();
}

uint64_t sub_2889C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 736) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_2A628;
  }
  else
  {
    *(void *)(v4 + 744) = a1;
    uint64_t v5 = sub_289C4;
  }
  return _swift_task_switch(v5, 0, 0);
}

void sub_289C4()
{
  v195 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 11;
  v180 = v1 + 56;
  uint64_t v3 = v1[59];
  unint64_t v4 = sub_27474(v1[93]);
  uint64_t v6 = v5;
  uint64_t v190 = v7;
  swift_bridgeObjectRelease();
  v1[56] = v6;
  v177 = (void *)(v3 + 16);
  uint64_t v178 = v3;
  sub_1ABC0((void *)(v3 + 16), *(void *)(v3 + 40));
  swift_bridgeObjectRetain();
  char v8 = sub_308C0();
  unint64_t v9 = v1[92];
  v192 = v1;
  uint64_t v182 = v4;
  if (v8)
  {
    uint64_t v10 = *sub_1ABC0(v2, v1[14]);
    v1[55] = sub_21CD4((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v11 = (void *)sub_30640();
    uint64_t v12 = swift_task_alloc();
    *(void *)(v12 + 16) = v10;
    *(void *)(v12 + 24) = v1 + 55;
    *(unsigned char *)(v12 + 32) = 1;
    sub_30E60();
    if (v9)
    {

      swift_task_dealloc();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C630((uint64_t)v2);
      os_log_type_t v13 = sub_30C30();
      os_log_type_t v14 = sub_30E10();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_0, v13, v14, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v15, 2u);
        swift_slowDealloc();
      }

      uint64_t v16 = sub_30BC0();
      sub_30BF0();
      os_signpost_type_t v17 = sub_30E40();
      if (sub_30E80())
      {
        uint64_t v18 = v1[71];
        uint64_t v19 = v1[66];
        uint64_t v20 = v1[65];
        swift_retain();
        sub_30C20();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v19 + 88))(v18, v20) == enum case for OSSignpostError.doubleEnd(_:))
        {
          uint64_t v21 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(void, void))(v1[66] + 8))(v1[71], v1[65]);
          uint64_t v21 = "";
        }
        uint64_t v122 = (void (*)(uint64_t, uint64_t))v1[88];
        uint64_t v135 = v1[81];
        uint64_t v136 = v1[79];
        uint64_t v137 = v1[74];
        uint64_t v138 = v1[73];
        (*(void (**)(uint64_t, uint64_t, void))(v137 + 16))(v135, v136, v192[73]);
        uint64_t v139 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v139 = 0;
        os_signpost_id_t v140 = sub_30B90();
        _os_signpost_emit_with_name_impl(&dword_0, v16, v17, v140, "runPatternExtractionPlugin", v21, v139, 2u);
        swift_slowDealloc();

        v122(v136, v138);
        uint64_t v125 = v135;
        uint64_t v126 = v138;
        uint64_t v1 = v192;
      }
      else
      {
        uint64_t v122 = (void (*)(uint64_t, uint64_t))v1[88];
        uint64_t v123 = v1[79];
        uint64_t v124 = v1[73];

        uint64_t v125 = v123;
        uint64_t v126 = v124;
      }
      v122(v125, v126);
      goto LABEL_150;
    }

    swift_task_dealloc();
    uint64_t v22 = v1[55];
    uint64_t v186 = v22 + 64;
    uint64_t v23 = -1;
    uint64_t v24 = -1 << *(unsigned char *)(v22 + 32);
    if (-v24 < 64) {
      uint64_t v23 = ~(-1 << -(char)v24);
    }
    unint64_t v25 = v23 & *(void *)(v22 + 64);
    unint64_t v26 = (unint64_t)(63 - v24) >> 6;
    unint64_t v175 = v26 - 1;
    int64_t v188 = v26;
    unint64_t v179 = v26 - 5;
    if (!v25) {
      goto LABEL_15;
    }
LABEL_13:
    unint64_t v27 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    unint64_t v28 = v27 | (v9 << 6);
LABEL_14:
    uint64_t v1 = v192;
    os_log_type_t v29 = (void *)v192[63];
    *os_log_type_t v29 = *(void *)(*(void *)(v22 + 48) + 8 * v28);
    uint64_t v30 = *(void *)(v22 + 56);
    uint64_t v31 = v30 + *(void *)(*(void *)(type metadata accessor for PatternStoreValue(0) - 8) + 72) * v28;
    uint64_t v32 = sub_4F90(&qword_3DA10);
    sub_2FD0C(v31, (uint64_t)v29 + *(int *)(v32 + 48), type metadata accessor for PatternStoreValue);
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v29, 0, 1, v32);
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v37 = v1[64];
      sub_2FC50(v1[63], v37);
      uint64_t v38 = sub_4F90(&qword_3DA10);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 48))(v37, 1, v38) == 1) {
        break;
      }
      uint64_t v39 = (uint64_t *)v1[64];
      uint64_t v40 = *v39;
      uint64_t v41 = (uint64_t)v39 + *(int *)(v38 + 48);
      uint64_t v42 = *(void *)(v41 + *(int *)(type metadata accessor for PatternStoreValue(0) + 20));
      sub_2FD74(v41, type metadata accessor for PatternStoreValue);
      if (v42 < 0) {
        goto LABEL_155;
      }
      if (v42)
      {
        Swift::Int v43 = (void *)*v180;
        do
        {
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            Swift::Int v43 = sub_22F44(0, v43[2] + 1, 1, v43);
          }
          unint64_t v45 = v43[2];
          unint64_t v44 = v43[3];
          if (v45 >= v44 >> 1) {
            Swift::Int v43 = sub_22F44((void *)(v44 > 1), v45 + 1, 1, v43);
          }
          v43[2] = v45 + 1;
          v43[v45 + 4] = v40;
          --v42;
        }
        while (v42);
        swift_bridgeObjectRelease();
        void *v180 = v43;
        if (v25) {
          goto LABEL_13;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        if (v25) {
          goto LABEL_13;
        }
      }
LABEL_15:
      int64_t v33 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        goto LABEL_159;
      }
      if (v33 < v188)
      {
        unint64_t v34 = *(void *)(v186 + 8 * v33);
        if (v34) {
          goto LABEL_18;
        }
        if ((uint64_t)(v9 + 2) >= v188)
        {
          ++v9;
        }
        else
        {
          unint64_t v34 = *(void *)(v186 + 8 * (v9 + 2));
          if (v34)
          {
            int64_t v33 = v9 + 2;
LABEL_18:
            unint64_t v25 = (v34 - 1) & v34;
            unint64_t v28 = __clz(__rbit64(v34)) + (v33 << 6);
            unint64_t v9 = v33;
            goto LABEL_14;
          }
          if ((uint64_t)(v9 + 3) >= v188)
          {
            v9 += 2;
          }
          else
          {
            unint64_t v34 = *(void *)(v186 + 8 * (v9 + 3));
            if (v34)
            {
              int64_t v33 = v9 + 3;
              goto LABEL_18;
            }
            int64_t v33 = v9 + 4;
            if ((uint64_t)(v9 + 4) >= v188)
            {
              v9 += 3;
            }
            else
            {
              unint64_t v34 = *(void *)(v186 + 8 * v33);
              if (v34) {
                goto LABEL_18;
              }
              while (v179 != v9)
              {
                unint64_t v34 = *(void *)(v22 + 104 + 8 * v9++);
                if (v34)
                {
                  int64_t v33 = v9 + 4;
                  goto LABEL_18;
                }
              }
              unint64_t v9 = v175;
            }
          }
        }
      }
      uint64_t v1 = v192;
      uint64_t v35 = v192[63];
      uint64_t v36 = sub_4F90(&qword_3DA10);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 1, 1, v36);
      unint64_t v25 = 0;
    }
    swift_release();
    uint64_t v46 = sub_30C30();
    os_log_type_t v47 = sub_30E20();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 134217984;
      swift_beginAccess();
      v1[57] = *(void *)(v1[56] + 16);
      sub_30EA0();
      _os_log_impl(&dword_0, v46, v47, "Total sequences after fetching from infrequent on-device store: %ld", v48, 0xCu);
      swift_slowDealloc();
    }

    unint64_t v9 = 0;
  }
  uint64_t v49 = sub_30C30();
  os_log_type_t v50 = sub_30E10();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v51 = 0;
    _os_log_impl(&dword_0, v49, v50, "Calling RECTIFI Algorithm", v51, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t v52 = (void *)*v180;
  sub_1ABC0(v177, *(void *)(v178 + 40));
  swift_bridgeObjectRetain();
  sub_30860();
  if ((~*(void *)&v53 & 0x7FF0000000000000) == 0) {
    goto LABEL_160;
  }
  if (v53 <= -9.22337204e18)
  {
LABEL_161:
    __break(1u);
    goto LABEL_162;
  }
  if (v53 >= 9.22337204e18)
  {
LABEL_162:
    __break(1u);
    goto LABEL_163;
  }
  v174 = v2;
  uint64_t v54 = (uint64_t)v53;
  type metadata accessor for ExtractPatternsRectifi();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 32) = xmmword_329F0;
  *(void *)(inited + 48) = 5;
  type metadata accessor for ClosedPatternUtil();
  *(void *)(inited + 64) = swift_allocObject();
  *(void *)(inited + 16) = v52;
  *(void *)(inited + 24) = v54;
  *(void *)(inited + 56) = _swiftEmptyArrayStorage;
  swift_beginAccess();
  *(void *)(inited + 56) = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  uint64_t v56 = swift_bridgeObjectRetain();
  uint64_t v57 = sub_26334(v56);
  swift_bridgeObjectRelease();
  sub_30AC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v57);
  swift_bridgeObjectRelease();
  sub_1ABC0(v177, *(void *)(v178 + 40));
  sub_30870();
  if ((~*(void *)&v58 & 0x7FF0000000000000) == 0)
  {
LABEL_163:
    __break(1u);
    goto LABEL_164;
  }
  if (v58 <= -9.22337204e18)
  {
LABEL_164:
    __break(1u);
    goto LABEL_165;
  }
  if (v58 >= 9.22337204e18)
  {
LABEL_165:
    __break(1u);
    return;
  }
  unint64_t v189 = v9;
  uint64_t v59 = sub_3394((uint64_t)v58, 0);
  uint64_t v176 = (uint64_t)(v1 + 49);
  v1[49] = v59;
  uint64_t v60 = v59[2];
  uint64_t v193 = (uint64_t)_swiftEmptyArrayStorage;
  sub_2B1BC(0, 0, 0);
  uint64_t v61 = _swiftEmptyArrayStorage;
  if (v60)
  {
    uint64_t v62 = v1[61];
    do
    {
      sub_30500();
      uint64_t v193 = (uint64_t)v61;
      unint64_t v64 = v61[2];
      unint64_t v63 = v61[3];
      if (v64 >= v63 >> 1)
      {
        sub_2B1BC(v63 > 1, v64 + 1, 1);
        uint64_t v61 = (void *)v193;
      }
      uint64_t v65 = v1[62];
      uint64_t v66 = v1[60];
      v61[2] = v64 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v62 + 32))((unint64_t)v61+ ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80))+ *(void *)(v62 + 72) * v64, v65, v66);
      --v60;
    }
    while (v60);
  }
  uint64_t v67 = sub_30C30();
  os_log_type_t v68 = sub_30E10();
  uint64_t v187 = (uint64_t)v61;
  if (os_log_type_enabled(v67, v68))
  {
    uint64_t v69 = v1 + 54;
    uint64_t v70 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v70 = 134217984;
    swift_beginAccess();
    *uint64_t v69 = *(void *)(*(void *)v176 + 16);
    uint64_t v61 = (void *)v187;
    sub_30EA0();
    _os_log_impl(&dword_0, v67, v68, "Fetched %ld patterns from RECTIFI", v70, 0xCu);
    uint64_t v1 = v192;
    swift_slowDealloc();
  }
  v181 = v1 + 51;

  swift_beginAccess();
  uint64_t v71 = *(void *)v176;
  uint64_t v193 = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v72 = *(void *)(v71 + 16);
  if (v72)
  {
    unint64_t v73 = v1 + 52;
    uint64_t v74 = v71 + 32;
    swift_bridgeObjectRetain_n();
    uint64_t v75 = 0;
    while (1)
    {
      uint64_t v76 = *(void *)(v74 + 40 * v75 + 16);
      if (v76)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v77 = sub_2F4B4(v76, v190);
        swift_bridgeObjectRelease();
        unint64_t v78 = *(void *)(v77 + 16);
        if (v78)
        {
          void *v181 = 0;
          swift_stdlib_random();
          unint64_t v79 = *v181 * v78;
          uint64_t v80 = ((unint64_t)*v181 * (unsigned __int128)v78) >> 64;
          if (v78 > v79)
          {
            unint64_t v81 = -(uint64_t)v78 % v78;
            if (v81 > v79)
            {
              do
              {
                *unint64_t v73 = 0;
                swift_stdlib_random();
              }
              while (v81 > *v73 * v78);
              uint64_t v80 = ((unint64_t)*v73 * (unsigned __int128)v78) >> 64;
            }
          }
          if (v80 >= *(void *)(v77 + 16)) {
            goto LABEL_156;
          }
          unint64_t v82 = *(void *)(v77 + 8 * v80 + 32);
          swift_bridgeObjectRelease();
          if ((v82 & 0x8000000000000000) != 0)
          {
LABEL_157:
            __break(1u);
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
LABEL_160:
            __break(1u);
            goto LABEL_161;
          }
          if (v82 >= *(void *)(v190 + 16)) {
            goto LABEL_158;
          }
          id v83 = *(id *)(v190 + 32 + 8 * v82);
          sub_30D40();
          if (*(void *)(v193 + 16) >= *(void *)(v193 + 24) >> 1) {
            sub_30D70();
          }
          goto LABEL_70;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      sub_30D40();
      if (*(void *)(v193 + 16) >= *(void *)(v193 + 24) >> 1) {
        sub_30D70();
      }
LABEL_70:
      sub_30D90();
      sub_30D60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (++v75 == v72)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v1 = v192;
        uint64_t v84 = (void *)v193;
        uint64_t v61 = (void *)v187;
        goto LABEL_86;
      }
    }
  }
  uint64_t v84 = _swiftEmptyArrayStorage;
LABEL_86:
  swift_beginAccess();
  sub_2F5B0(v176, v182);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[45] = 0;
  v1[46] = 0xE000000000000000;
  uint64_t v85 = v1[49];
  uint64_t v185 = *(void *)(v85 + 16);
  if (v185)
  {
    v173 = v84;
    uint64_t v86 = v1 + 48;
    uint64_t v184 = v85 + 32;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    unint64_t v87 = 0;
    uint64_t v183 = v85;
    while (1)
    {
      if (v87 >= *(void *)(v85 + 16))
      {
        __break(1u);
LABEL_154:
        __break(1u);
LABEL_155:
        __break(1u);
LABEL_156:
        __break(1u);
        goto LABEL_157;
      }
      BOOL v88 = (uint64_t *)(v184 + 40 * v87);
      uint64_t v89 = *v88;
      unint64_t v90 = v88[1];
      uint64_t v193 = 0x636E657571657246;
      unint64_t v194 = 0xEA00000000002079;
      v1[48] = v89;
      swift_bridgeObjectRetain();
      v197._countAndFlagsBits = sub_311B0();
      sub_30D00(v197);
      swift_bridgeObjectRelease();
      v198._countAndFlagsBits = 10;
      v198._object = (void *)0xE100000000000000;
      sub_30D00(v198);
      unint64_t v91 = v194;
      v1[45] = v193;
      v1[46] = v91;
      swift_bridgeObjectRelease();
      if (v90 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v92 = sub_31090();
        swift_bridgeObjectRelease();
        unint64_t v191 = v87;
        if (!v92) {
          goto LABEL_99;
        }
      }
      else
      {
        uint64_t v92 = *(void *)((char *)&dword_10 + (v90 & 0xFFFFFFFFFFFFFF8));
        unint64_t v191 = v87;
        if (!v92) {
          goto LABEL_99;
        }
      }
      if (v92 < 1) {
        goto LABEL_154;
      }
      uint64_t v93 = 0;
      do
      {
        if ((v90 & 0xC000000000000001) != 0)
        {
          uint64_t v94 = sub_30FB0();
        }
        else
        {
          uint64_t v94 = *(void *)(v90 + 8 * v93 + 32);
          swift_retain();
        }
        ++v93;
        uint64_t v193 = (*(uint64_t (**)(void))(*(void *)v94 + 208))();
        unint64_t v194 = v95;
        swift_bridgeObjectRetain();
        v199._countAndFlagsBits = 10;
        v199._object = (void *)0xE100000000000000;
        sub_30D00(v199);
        swift_bridgeObjectRelease();
        uint64_t v96 = v193;
        uint64_t v97 = (void *)v194;
        swift_beginAccess();
        v200._countAndFlagsBits = v96;
        v200._object = v97;
        sub_30D00(v200);
        swift_endAccess();
        swift_bridgeObjectRelease();
        swift_release();
      }
      while (v92 != v93);
LABEL_99:
      uint64_t v1 = v192;
      swift_bridgeObjectRelease();
      uint64_t v98 = sub_30C30();
      os_log_type_t v99 = sub_30E20();
      if (os_log_type_enabled(v98, v99))
      {
        uint64_t v100 = (uint8_t *)swift_slowAlloc();
        uint64_t v193 = swift_slowAlloc();
        *(_DWORD *)uint64_t v100 = 136315138;
        uint64_t v101 = v86;
        uint64_t v102 = v192[45];
        unint64_t v103 = v192[46];
        swift_bridgeObjectRetain();
        uint64_t v104 = v102;
        uint64_t v86 = v101;
        v192[50] = sub_23830(v104, v103, &v193);
        sub_30EA0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v98, v99, "%s", v100, 0xCu);
        swift_arrayDestroy();
        uint64_t v1 = v192;
        swift_slowDealloc();
        swift_slowDealloc();
      }

      uint64_t v61 = (void *)v187;
      unint64_t v87 = v191 + 1;
      uint64_t v85 = v183;
      if (v191 + 1 == v185)
      {
        swift_bridgeObjectRelease();
        uint64_t v85 = *(void *)v176;
        uint64_t v84 = v173;
        break;
      }
    }
  }
  uint64_t v105 = (char *)swift_bridgeObjectRetain();
  sub_21360(v105, (uint64_t)v61, (uint64_t)v84);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1ABC0(v177, *(void *)(v178 + 40));
  if ((sub_308C0() & 1) == 0)
  {
    swift_release();
    goto LABEL_110;
  }
  int64_t v106 = *(void *)(v85 + 16);
  if (v106)
  {
    uint64_t v193 = (uint64_t)_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_2B18C(0, v106, 0);
    uint64_t v107 = v193;
    unint64_t v108 = *(void *)(v193 + 16);
    uint64_t v109 = 40;
    do
    {
      uint64_t v110 = *(void *)(v85 + v109);
      uint64_t v193 = v107;
      unint64_t v111 = *(void *)(v107 + 24);
      swift_bridgeObjectRetain();
      if (v108 >= v111 >> 1)
      {
        sub_2B18C(v111 > 1, v108 + 1, 1);
        uint64_t v107 = v193;
      }
      *(void *)(v107 + 16) = v108 + 1;
      *(void *)(v107 + 8 * v108 + 32) = v110;
      v109 += 40;
      ++v108;
      --v106;
    }
    while (v106);
    swift_bridgeObjectRelease();
    uint64_t v112 = (uint64_t)v174;
    sub_1ABC0(v174, v1[14]);
    sub_6FDC(v107, v187);
    if (v189)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      sub_1C630((uint64_t)v174);
      unint64_t v113 = sub_30C30();
      os_log_type_t v114 = sub_30E10();
      if (os_log_type_enabled(v113, v114))
      {
        uint64_t v115 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v115 = 0;
        _os_log_impl(&dword_0, v113, v114, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v115, 2u);
        swift_slowDealloc();
      }

      unint64_t v116 = sub_30BC0();
      sub_30BF0();
      os_signpost_type_t v117 = sub_30E40();
      if (sub_30E80())
      {
        uint64_t v118 = v1[69];
        uint64_t v119 = v1[66];
        uint64_t v120 = v1[65];
        swift_retain();
        sub_30C20();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v119 + 88))(v118, v120) == enum case for OSSignpostError.doubleEnd(_:))
        {
          uint64_t v121 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(void, void))(v1[66] + 8))(v1[69], v1[65]);
          uint64_t v121 = "";
        }
        unint64_t v147 = (void (*)(uint64_t, uint64_t))v1[88];
        uint64_t v148 = v1[81];
        uint64_t v149 = v1[77];
LABEL_149:
        uint64_t v169 = v1[73];
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v1[74] + 16))(v148, v149, v169);
        v170 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v170 = 0;
        os_signpost_id_t v171 = sub_30B90();
        _os_signpost_emit_with_name_impl(&dword_0, v116, v117, v171, "runPatternExtractionPlugin", v121, v170, 2u);
        uint64_t v1 = v192;
        swift_slowDealloc();

        v147(v149, v169);
        v147(v148, v169);
        goto LABEL_150;
      }
      uint64_t v145 = (void (*)(uint64_t, uint64_t))v1[88];
      uint64_t v146 = v1[77];
      goto LABEL_146;
    }
    swift_release();
    swift_release();
    v141 = sub_30C30();
    os_log_type_t v142 = sub_30E10();
    if (!os_log_type_enabled(v141, v142)) {
      goto LABEL_136;
    }
    v143 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v143 = 0;
    Swift::Int v144 = "Self patterns written to CoreData";
    goto LABEL_135;
  }
  uint64_t v127 = *(void *)(*v180 + 16);
  swift_release();
  if (!v127)
  {
LABEL_110:
    swift_setDeallocating();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v112 = (uint64_t)v174;
LABEL_137:
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1C630(v112);
    Swift::Int v150 = sub_30C30();
    os_log_type_t v151 = sub_30E10();
    if (os_log_type_enabled(v150, v151))
    {
      uint64_t v152 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v152 = 0;
      _os_log_impl(&dword_0, v150, v151, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v152, 2u);
      swift_slowDealloc();
    }

    v153 = sub_30BC0();
    sub_30BF0();
    os_signpost_type_t v154 = sub_30E40();
    if (sub_30E80())
    {
      uint64_t v155 = v1[68];
      uint64_t v156 = v1[66];
      uint64_t v157 = v1[65];
      swift_retain();
      sub_30C20();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v156 + 88))(v155, v157) == enum case for OSSignpostError.doubleEnd(_:))
      {
        uint64_t v158 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(v1[66] + 8))(v1[68], v1[65]);
        uint64_t v158 = "";
      }
      v162 = (void (*)(uint64_t, uint64_t))v1[88];
      uint64_t v163 = v1[81];
      uint64_t v164 = v1[76];
      uint64_t v165 = v1[73];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v1[74] + 16))(v163, v164, v165);
      v166 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v166 = 0;
      os_signpost_id_t v167 = sub_30B90();
      _os_signpost_emit_with_name_impl(&dword_0, v153, v154, v167, "runPatternExtractionPlugin", v158, v166, 2u);
      uint64_t v1 = v192;
      swift_slowDealloc();

      v162(v164, v165);
      v162(v163, v165);
    }
    else
    {
      uint64_t v159 = (void (*)(uint64_t, uint64_t))v1[88];
      uint64_t v160 = v1[76];
      uint64_t v161 = v1[73];

      v159(v160, v161);
    }
    goto LABEL_150;
  }
  uint64_t v112 = (uint64_t)v174;
  sub_1ABC0(v174, v1[14]);
  uint64_t v128 = swift_bridgeObjectRetain();
  sub_6924(v128);
  swift_bridgeObjectRelease();
  if (!v189)
  {
    v141 = sub_30C30();
    os_log_type_t v142 = sub_30E10();
    if (!os_log_type_enabled(v141, v142))
    {
LABEL_136:
      swift_setDeallocating();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      goto LABEL_137;
    }
    v143 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v143 = 0;
    Swift::Int v144 = "Incomplete patterns written to CoreData";
LABEL_135:
    _os_log_impl(&dword_0, v141, v142, v144, v143, 2u);
    uint64_t v112 = (uint64_t)v174;
    swift_slowDealloc();
    goto LABEL_136;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1C630((uint64_t)v174);
  unint64_t v129 = sub_30C30();
  os_log_type_t v130 = sub_30E10();
  if (os_log_type_enabled(v129, v130))
  {
    uint64_t v131 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v131 = 0;
    _os_log_impl(&dword_0, v129, v130, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v131, 2u);
    swift_slowDealloc();
  }

  unint64_t v116 = sub_30BC0();
  sub_30BF0();
  os_signpost_type_t v117 = sub_30E40();
  if (sub_30E80())
  {
    uint64_t v132 = v1[70];
    uint64_t v133 = v1[66];
    uint64_t v134 = v1[65];
    swift_retain();
    sub_30C20();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v133 + 88))(v132, v134) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v121 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(v1[66] + 8))(v1[70], v1[65]);
      uint64_t v121 = "";
    }
    unint64_t v147 = (void (*)(uint64_t, uint64_t))v1[88];
    uint64_t v148 = v1[81];
    uint64_t v149 = v1[78];
    goto LABEL_149;
  }
  uint64_t v145 = (void (*)(uint64_t, uint64_t))v1[88];
  uint64_t v146 = v1[78];
LABEL_146:
  uint64_t v168 = v1[73];

  v145(v146, v168);
LABEL_150:
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  v172 = (void (*)(void))v1[1];
  v172();
}

uint64_t sub_2A628()
{
  sub_1C630((uint64_t)(v0 + 11));
  uint64_t v1 = sub_30C30();
  os_log_type_t v2 = sub_30E10();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v1, v2, "SiriPrivateLearningPatternExtractionPlugin.run() ended", v3, 2u);
    swift_slowDealloc();
  }

  unint64_t v4 = sub_30BC0();
  sub_30BF0();
  os_signpost_type_t v5 = sub_30E40();
  if (sub_30E80())
  {
    uint64_t v6 = v0[72];
    uint64_t v7 = v0[66];
    uint64_t v8 = v0[65];
    swift_retain();
    sub_30C20();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v7 + 88))(v6, v8) == enum case for OSSignpostError.doubleEnd(_:))
    {
      unint64_t v9 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(v0[66] + 8))(v0[72], v0[65]);
      unint64_t v9 = "";
    }
    os_log_type_t v13 = (void (*)(uint64_t, uint64_t))v0[88];
    uint64_t v14 = v0[81];
    uint64_t v15 = v0[80];
    uint64_t v16 = v0[73];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[74] + 16))(v14, v15, v16);
    os_signpost_type_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_signpost_type_t v17 = 0;
    os_signpost_id_t v18 = sub_30B90();
    _os_signpost_emit_with_name_impl(&dword_0, v4, v5, v18, "runPatternExtractionPlugin", v9, v17, 2u);
    swift_slowDealloc();

    v13(v15, v16);
    v13(v14, v16);
  }
  else
  {
    uint64_t v10 = (void (*)(uint64_t, uint64_t))v0[88];
    uint64_t v11 = v0[80];
    uint64_t v12 = v0[73];

    v10(v11, v12);
  }
  swift_release();
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t SiriPrivateLearningPatternExtractionPlugin.deinit()
{
  sub_1C630(v0 + 16);
  sub_1C630(v0 + 56);
  sub_1C630(v0 + 96);
  sub_1C630(v0 + 136);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SiriPrivateLearningPatternExtractionPlugin.__deallocating_deinit()
{
  sub_1C630(v0 + 16);
  sub_1C630(v0 + 56);
  sub_1C630(v0 + 96);
  sub_1C630(v0 + 136);
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 192, 7);
}

uint64_t sub_2AA30()
{
  type metadata accessor for SiriPrivateLearningPatternExtractionPlugin();
  uint64_t v0 = swift_allocObject();
  SiriPrivateLearningPatternExtractionPlugin.init()();
  return v0;
}

uint64_t sub_2AA68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_305D0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = sub_4F90(&qword_3E9C8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_30DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v14 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v15 = (char *)swift_allocObject();
  *((void *)v15 + 2) = 0;
  *((void *)v15 + 3) = 0;
  *((void *)v15 + 4) = v3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v15[v14], (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  uint64_t v16 = &v15[(v9 + v14 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(void *)uint64_t v16 = a2;
  *((void *)v16 + 1) = a3;
  swift_retain();
  swift_retain();
  sub_272D0((uint64_t)v12, (uint64_t)&unk_3EB40, (uint64_t)v15);
  return swift_release();
}

uint64_t type metadata accessor for SiriPrivateLearningPatternExtractionPlugin()
{
  return self;
}

uint64_t sub_2AC88@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result) {
    *a2 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

void sub_2AC98(uint8_t *a1, uint32_t a2, NSObject *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v13 = sub_30B90();
  _os_signpost_emit_with_name_impl(&dword_0, a3, a4, v13, a6, a7, a1, a2);
}

uint64_t sub_2AD1C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_2ADF8;
  return v6(a1);
}

uint64_t sub_2ADF8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2AEF0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_2AF20(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_310E0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

BOOL sub_2AFC4(uint64_t a1)
{
  return (a1 & 0xC000000000000001) == 0;
}

uint64_t sub_2AFD0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2B1F8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2AFF0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2B4D0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2B010(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2B630(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2B030(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2B878(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2B050(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2B9F4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2B070(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2BB60(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2B090(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2BCE8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2B0B0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2BE84(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2B0D0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2C320(a1, a2, a3, (void *)*v3, &qword_3E9B0, type metadata accessor for PatternStoreValue);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2B10C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2C190(a1, a2, a3, (void *)*v3, &qword_3E988, &qword_3E1C8);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2B13C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2C004(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2B15C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2C190(a1, a2, a3, (void *)*v3, &qword_3EB18, &qword_3DEC0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2B18C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2C190(a1, a2, a3, (void *)*v3, &qword_3E970, &qword_3D9D0);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2B1BC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2C320(a1, a2, a3, (void *)*v3, &qword_3E9B8, (uint64_t (*)(void))&type metadata accessor for UUID);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2B1F8(char a1, int64_t a2, char a3, char *a4)
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
    sub_4F90(&qword_3EAF0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  os_signpost_id_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2B358(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_4F90(&qword_3E980);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  os_signpost_id_t v13 = a4 + 32;
  size_t v14 = 40 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2B4D0(char a1, int64_t a2, char a3, char *a4)
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
    sub_4F90(&qword_3E9A8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  os_signpost_id_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2B630(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    os_signpost_id_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_4F90(&qword_3E9A0);
  uint64_t v10 = *(void *)(sub_4F90(&qword_3D9F0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  os_signpost_id_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_4F90(&qword_3D9F0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2B878(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_4F90(&qword_3E1C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  os_signpost_id_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2B9F4(char a1, int64_t a2, char a3, char *a4)
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
    sub_4F90(&qword_3E1B8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  os_signpost_id_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2BB60(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_4F90(&qword_3EB30);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  os_signpost_id_t v13 = v10 + 4;
  size_t v14 = a4 + 4;
  size_t v15 = 4 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v10 + 4, a4 + 4, v15 * 8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    sub_4F90(&qword_3EB38);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2BCE8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_4F90(&qword_3EB20);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 4;
  os_signpost_id_t v13 = a4 + 4;
  size_t v14 = 3 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v10 + 4, a4 + 4, v14 * 8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    sub_4F90(&qword_3EB28);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2BE84(char a1, int64_t a2, char a3, char *a4)
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
    sub_4F90(&qword_3E998);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  os_signpost_id_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2BFE4(char a1, int64_t a2, char a3, void *a4)
{
  return sub_2C320(a1, a2, a3, a4, &qword_3E9B0, type metadata accessor for PatternStoreValue);
}

uint64_t sub_2C004(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_4F90(&qword_3EB00);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    sub_4F90(&qword_3EB08);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2C190(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_4F90(a5);
    unint64_t v13 = (void *)swift_allocObject();
    int64_t v14 = j__malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 25;
    }
    void v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    unint64_t v13 = _swiftEmptyArrayStorage;
  }
  unint64_t v16 = (unint64_t)(v13 + 4);
  unint64_t v17 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v16 >= v17 + 8 * v11) {
      memmove(v13 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v17 >= v16 + 8 * v11 || v16 >= v17 + 8 * v11)
  {
    sub_4F90(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2C320(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    unint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_4F90(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v16 = (void *)swift_allocObject();
  size_t v17 = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  void v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  unint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_310E0();
  __break(1u);
  return result;
}

uint64_t sub_2C568(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v8 = sub_30F10();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      type metadata accessor for PatternItem();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v30;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t v26 = sub_30F00();
    if (__OFADD__(v26, 1))
    {
      __break(1u);
      JUMPOUT(0x2CC00);
    }
    unint64_t v27 = sub_2D140(v7, v26 + 1);
    uint64_t v32 = (uint64_t)v27;
    if (v27[3] <= v27[2])
    {
      swift_retain();
      sub_2D25C();
      uint64_t v28 = v32;
    }
    else
    {
      uint64_t v28 = (uint64_t)v27;
      swift_retain();
    }
    sub_2DAB4(a2, v28);
    *uint64_t v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  sub_31210();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_30CF0();
  swift_bridgeObjectRelease();
  sub_31220(*(unsigned __int8 *)(a2 + 40));
  sub_1E12C(*(unsigned char *)(a2 + 41));
  sub_30CF0();
  swift_bridgeObjectRelease();
  Swift::Int v10 = sub_31230();
  uint64_t v11 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
  {
LABEL_62:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v31 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    Swift::Int v25 = swift_retain();
    sub_2DBA4(v25, v12, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v31;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1;
  }
  uint64_t v13 = ~v11;
  while (1)
  {
    uint64_t v15 = *(void *)(*(void *)(v6 + 48) + 8 * v12);
    BOOL v16 = *(void *)(v15 + 24) == *(void *)(a2 + 24) && *(void *)(v15 + 32) == *(void *)(a2 + 32);
    if (v16 || (sub_311C0()) && *(unsigned __int8 *)(v15 + 40) == *(unsigned __int8 *)(a2 + 40)) {
      break;
    }
LABEL_10:
    unint64_t v12 = (v12 + 1) & v13;
    if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
      goto LABEL_62;
    }
  }
  uint64_t v17 = *(unsigned __int8 *)(v15 + 41);
  unint64_t v18 = 0x8000000000032B10;
  unint64_t v19 = 0xD000000000000017;
  switch(v17)
  {
    case 1:
      unint64_t v18 = 0xE300000000000000;
      unint64_t v19 = 5786702;
      break;
    case 2:
      unint64_t v18 = 0xE300000000000000;
      unint64_t v19 = 4801877;
      break;
    case 3:
      unint64_t v18 = 0xE800000000000000;
      unint64_t v19 = 0x505041454E4F4850;
      break;
    case 4:
      unint64_t v18 = 0xEA00000000005050;
      unint64_t v19 = 0x414547415353454DLL;
      break;
    case 5:
      unint64_t v18 = 0xEE00505041544553;
      unint64_t v19 = 0x5245444E494D4552;
      break;
    case 6:
      break;
    case 7:
      unint64_t v19 = 0x4552434D52414C41;
      goto LABEL_27;
    case 8:
      unint64_t v19 = 0x474F544D52414C41;
      unint64_t v18 = 0xEE00505041454C47;
      break;
    case 9:
      unint64_t v19 = 0x4450554D52414C41;
LABEL_27:
      unint64_t v18 = 0xEE00505041455441;
      break;
    case 10:
      unint64_t v19 = 0x4145524345544F4ELL;
      goto LABEL_30;
    case 11:
      unint64_t v19 = 0x454C454445544F4ELL;
LABEL_30:
      unint64_t v18 = 0xED00005050414554;
      break;
    case 12:
      unint64_t v18 = 0xE900000000000050;
      unint64_t v19 = 0x5041594D444E4946;
      break;
    case 13:
      unint64_t v18 = 0xE700000000000000;
      unint64_t v19 = 0x4E574F4E4B4E55;
      break;
    default:
      unint64_t v18 = 0xE300000000000000;
      unint64_t v19 = 5395265;
      break;
  }
  unint64_t v20 = 0x8000000000032B10;
  unint64_t v21 = 0xD000000000000017;
  switch(*(unsigned char *)(a2 + 41))
  {
    case 1:
      unint64_t v20 = 0xE300000000000000;
      if (v19 == 5786702) {
        goto LABEL_58;
      }
      goto LABEL_9;
    case 2:
      unint64_t v20 = 0xE300000000000000;
      if (v19 != 4801877) {
        goto LABEL_9;
      }
      goto LABEL_58;
    case 3:
      unint64_t v20 = 0xE800000000000000;
      if (v19 != 0x505041454E4F4850) {
        goto LABEL_9;
      }
      goto LABEL_58;
    case 4:
      unint64_t v20 = 0xEA00000000005050;
      if (v19 != 0x414547415353454DLL) {
        goto LABEL_9;
      }
      goto LABEL_58;
    case 5:
      unint64_t v20 = 0xEE00505041544553;
      if (v19 != 0x5245444E494D4552) {
        goto LABEL_9;
      }
      goto LABEL_58;
    case 6:
      goto LABEL_57;
    case 7:
      uint64_t v22 = 0x4552434D52414C41;
      goto LABEL_50;
    case 8:
      unint64_t v20 = 0xEE00505041454C47;
      if (v19 != 0x474F544D52414C41) {
        goto LABEL_9;
      }
      goto LABEL_58;
    case 9:
      uint64_t v22 = 0x4450554D52414C41;
LABEL_50:
      unint64_t v20 = 0xEE00505041455441;
      if (v19 != v22) {
        goto LABEL_9;
      }
      goto LABEL_58;
    case 0xA:
      uint64_t v23 = 0x4145524345544F4ELL;
      goto LABEL_54;
    case 0xB:
      uint64_t v23 = 0x454C454445544F4ELL;
LABEL_54:
      unint64_t v20 = 0xED00005050414554;
      if (v19 != v23) {
        goto LABEL_9;
      }
      goto LABEL_58;
    case 0xC:
      unint64_t v20 = 0xE900000000000050;
      unint64_t v21 = 0x5041594D444E4946;
LABEL_57:
      if (v19 == v21) {
        goto LABEL_58;
      }
      goto LABEL_9;
    case 0xD:
      unint64_t v20 = 0xE700000000000000;
      if (v19 != 0x4E574F4E4B4E55) {
        goto LABEL_9;
      }
      goto LABEL_58;
    default:
      unint64_t v20 = 0xE300000000000000;
      if (v19 != 5395265) {
        goto LABEL_9;
      }
LABEL_58:
      if (v18 != v20)
      {
LABEL_9:
        char v14 = sub_311C0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v14) {
          goto LABEL_70;
        }
        goto LABEL_10;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_70:
      swift_release();
      swift_bridgeObjectRelease();
      *a1 = *(void *)(*(void *)(*v3 + 48) + 8 * v12);
      swift_retain();
      return 0;
  }
}

uint64_t sub_2CC70(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_31210();
  swift_bridgeObjectRetain();
  sub_30CF0();
  Swift::Int v8 = sub_31230();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_311C0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_311C0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2E194(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2CE20(void *a1, void *a2, void *a3)
{
  uint64_t v6 = *v3;
  sub_31210();
  swift_bridgeObjectRetain();
  sub_26428((uint64_t)v35, (uint64_t)a2, (uint64_t)a3);
  Swift::Int v7 = sub_31230();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  uint64_t v10 = v6 + 56;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_53:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v35[0] = *(void *)v32;
    *(void *)uint64_t v32 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2E330((Swift::Int)a2, a3, v9, isUniquelyReferenced_nonNull_native);
    *(void *)uint64_t v32 = v35[0];
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    return 1;
  }
  uint64_t v34 = ~v8;
  uint64_t v11 = a2[2];
  uint64_t v12 = *(void *)(v6 + 48);
  while (1)
  {
    BOOL v13 = (void *)(v12 + 16 * v9);
    char v14 = (void *)*v13;
    if (*(void *)(*v13 + 16) != v11) {
      goto LABEL_3;
    }
    Swift::Int v15 = (void *)v13[1];
    if (v11 && v14 != a2)
    {
      BOOL v16 = v14[4] == a2[4] && v14[5] == a2[5];
      if (!v16 && (sub_311C0() & 1) == 0) {
        goto LABEL_3;
      }
      if (v11 != 1)
      {
        uint64_t result = v14[6];
        if (result != a2[6] || v14[7] != a2[7])
        {
          uint64_t result = sub_311C0();
          if ((result & 1) == 0) {
            goto LABEL_3;
          }
        }
        if (v11 != 2) {
          break;
        }
      }
    }
LABEL_19:
    uint64_t v19 = v15[2];
    if (v19 == a3[2])
    {
      if (v19) {
        BOOL v20 = v15 == a3;
      }
      else {
        BOOL v20 = 1;
      }
      if (v20)
      {
LABEL_54:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(_OWORD *)a1 = *(_OWORD *)(*(void *)(*(void *)v32 + 48) + 16 * v9);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        return 0;
      }
      BOOL v21 = v15[4] == a3[4] && v15[5] == a3[5];
      if (v21 || (sub_311C0() & 1) != 0)
      {
        if (v19 == 1) {
          goto LABEL_54;
        }
        BOOL v22 = v15[6] == a3[6] && v15[7] == a3[7];
        if (v22 || (sub_311C0() & 1) != 0)
        {
          uint64_t v23 = v19 - 2;
          if (!v23) {
            goto LABEL_54;
          }
          uint64_t v24 = v15 + 9;
          Swift::Int v25 = a3 + 9;
          while (1)
          {
            BOOL v26 = *(v24 - 1) == *(v25 - 1) && *v24 == *v25;
            if (!v26 && (sub_311C0() & 1) == 0) {
              break;
            }
            v24 += 2;
            v25 += 2;
            if (!--v23) {
              goto LABEL_54;
            }
          }
        }
      }
    }
LABEL_3:
    unint64_t v9 = (v9 + 1) & v34;
    if (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
      goto LABEL_53;
    }
  }
  unint64_t v27 = v14 + 9;
  os_log_type_t v29 = a2 + 9;
  uint64_t v28 = v11 - 2;
  while (v28)
  {
    uint64_t result = *(v27 - 1);
    if (result != *(v29 - 1) || *v27 != *v29)
    {
      uint64_t result = sub_311C0();
      if ((result & 1) == 0) {
        goto LABEL_3;
      }
    }
    v27 += 2;
    v29 += 2;
    if (!--v28) {
      goto LABEL_19;
    }
  }
  __break(1u);
  return result;
}

void *sub_2D140(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_4F90(&qword_3E220);
    uint64_t v2 = sub_30F50();
    uint64_t v5 = v2;
    sub_30EF0();
    if (sub_30F20())
    {
      type metadata accessor for PatternItem();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v5;
        if (*(void *)(v5 + 24) <= *(void *)(v5 + 16))
        {
          sub_2D25C();
          uint64_t v2 = v5;
        }
        sub_2DAB4(v4, v2);
      }
      while (sub_30F20());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return &_swiftEmptySetSingleton;
  }
  return (void *)v2;
}

unint64_t sub_2D25C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_4F90(&qword_3E220);
  uint64_t v3 = sub_30F40();
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v5 = (void *)(v2 + 56);
    uint64_t v6 = -1;
    if (v4 < 64) {
      uint64_t v6 = ~(-1 << v4);
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v4 + 63) >> 6;
    unint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v11 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v12 = v11 | (v10 << 6);
      }
      else
      {
        int64_t v13 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          return result;
        }
        if (v13 >= v8) {
          goto LABEL_22;
        }
        unint64_t v14 = v5[v13];
        ++v10;
        if (!v14)
        {
          int64_t v10 = v13 + 1;
          if (v13 + 1 >= v8) {
            goto LABEL_22;
          }
          unint64_t v14 = v5[v10];
          if (!v14)
          {
            int64_t v10 = v13 + 2;
            if (v13 + 2 >= v8) {
              goto LABEL_22;
            }
            unint64_t v14 = v5[v10];
            if (!v14)
            {
              int64_t v15 = v13 + 3;
              if (v15 >= v8)
              {
LABEL_22:
                swift_release();
                uint64_t v16 = 1 << *(unsigned char *)(v2 + 32);
                if (v16 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v16 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v5 = -1 << v16;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v14 = v5[v15];
              if (!v14)
              {
                while (1)
                {
                  int64_t v10 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_28;
                  }
                  if (v10 >= v8) {
                    goto LABEL_22;
                  }
                  unint64_t v14 = v5[v10];
                  ++v15;
                  if (v14) {
                    goto LABEL_21;
                  }
                }
              }
              int64_t v10 = v15;
            }
          }
        }
LABEL_21:
        unint64_t v7 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
      }
      unint64_t result = sub_2DAB4(*(void *)(*(void *)(v2 + 48) + 8 * v12), v3);
    }
  }
  unint64_t result = swift_release();
  *uint64_t v1 = v3;
  return result;
}

uint64_t sub_2D428()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_4F90(&qword_3E1E8);
  uint64_t v3 = sub_30F40();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_31210();
      sub_30CF0();
      uint64_t result = sub_31230();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *int64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2D708()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_4F90(&qword_3EB10);
  uint64_t v3 = sub_30F40();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v29 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
          return result;
        }
        if (v14 >= v29) {
          goto LABEL_41;
        }
        unint64_t v15 = v30[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v29) {
            goto LABEL_41;
          }
          unint64_t v15 = v30[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v29) {
              goto LABEL_41;
            }
            unint64_t v15 = v30[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v29)
              {
LABEL_41:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v28;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v30[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_47;
                  }
                  if (v10 >= v29) {
                    goto LABEL_41;
                  }
                  unint64_t v15 = v30[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      long long v31 = *(_OWORD *)(*(void *)(v2 + 48) + 16 * v13);
      sub_31210();
      sub_31220(*(void *)(v31 + 16));
      uint64_t v17 = *(void *)(v31 + 16);
      if (v17)
      {
        swift_bridgeObjectRetain();
        uint64_t v18 = v31 + 40;
        do
        {
          swift_bridgeObjectRetain();
          sub_30CF0();
          swift_bridgeObjectRelease();
          v18 += 16;
          --v17;
        }
        while (v17);
        swift_bridgeObjectRelease();
      }
      sub_31220(*(void *)(*((void *)&v31 + 1) + 16));
      uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 16);
      if (v19)
      {
        swift_bridgeObjectRetain();
        uint64_t v20 = *((void *)&v31 + 1) + 40;
        do
        {
          swift_bridgeObjectRetain();
          sub_30CF0();
          swift_bridgeObjectRelease();
          v20 += 16;
          --v19;
        }
        while (v19);
        swift_bridgeObjectRelease();
      }
      uint64_t result = sub_31230();
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v8 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v22) & ~*(void *)(v8 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_46;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v8 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(_OWORD *)(*(void *)(v4 + 48) + 16 * v11) = v31;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_2DAB4(uint64_t a1, uint64_t a2)
{
  sub_31210();
  swift_bridgeObjectRetain();
  sub_30CF0();
  swift_bridgeObjectRelease();
  sub_31220(*(unsigned __int8 *)(a1 + 40));
  sub_1E12C(*(unsigned char *)(a1 + 41));
  sub_30CF0();
  swift_bridgeObjectRelease();
  sub_31230();
  unint64_t result = sub_30EE0();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

Swift::Int sub_2DBA4(Swift::Int result, unint64_t a2, char a3)
{
  Swift::Int v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_2D25C();
    }
    else
    {
      if (v7 > v6)
      {
        unint64_t result = (Swift::Int)sub_2E620();
        goto LABEL_64;
      }
      sub_2EB48();
    }
    uint64_t v8 = *v3;
    sub_31210();
    swift_bridgeObjectRetain();
    sub_30CF0();
    swift_bridgeObjectRelease();
    sub_31220(*(unsigned __int8 *)(v5 + 40));
    sub_1E12C(*(unsigned char *)(v5 + 41));
    sub_30CF0();
    swift_bridgeObjectRelease();
    unint64_t result = sub_31230();
    uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v9;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v10 = ~v9;
      type metadata accessor for PatternItem();
      do
      {
        uint64_t v12 = *(void *)(*(void *)(v8 + 48) + 8 * a2);
        unint64_t result = *(void *)(v12 + 24);
        BOOL v13 = result == *(void *)(v5 + 24) && *(void *)(v12 + 32) == *(void *)(v5 + 32);
        if (v13 || (unint64_t result = sub_311C0(), (result & 1) != 0))
        {
          if (*(unsigned __int8 *)(v12 + 40) == *(unsigned __int8 *)(v5 + 40))
          {
            uint64_t v14 = *(unsigned __int8 *)(v12 + 41);
            unint64_t v15 = 0x8000000000032B10;
            unint64_t v16 = 0xD000000000000017;
            switch(v14)
            {
              case 1:
                unint64_t v15 = 0xE300000000000000;
                unint64_t v16 = 5786702;
                break;
              case 2:
                unint64_t v15 = 0xE300000000000000;
                unint64_t v16 = 4801877;
                break;
              case 3:
                unint64_t v15 = 0xE800000000000000;
                unint64_t v16 = 0x505041454E4F4850;
                break;
              case 4:
                unint64_t v16 = 0x414547415353454DLL;
                unint64_t v15 = 0xEA00000000005050;
                break;
              case 5:
                unint64_t v16 = 0x5245444E494D4552;
                unsigned int v17 = 1096041811;
                goto LABEL_30;
              case 6:
                break;
              case 7:
                unint64_t v16 = 0x4552434D52414C41;
                goto LABEL_27;
              case 8:
                unint64_t v15 = 0xEE00505041454C47;
                unint64_t v16 = 0x474F544D52414C41;
                break;
              case 9:
                unint64_t v16 = 0x4450554D52414C41;
LABEL_27:
                unsigned int v17 = 1095062593;
LABEL_30:
                unint64_t v15 = v17 | 0xEE00505000000000;
                break;
              case 10:
                unint64_t v16 = 0x4145524345544F4ELL;
                goto LABEL_33;
              case 11:
                unint64_t v16 = 0x454C454445544F4ELL;
LABEL_33:
                unint64_t v15 = 0xED00005050414554;
                break;
              case 12:
                unint64_t v16 = 0x5041594D444E4946;
                unint64_t v15 = 0xE900000000000050;
                break;
              case 13:
                unint64_t v15 = 0xE700000000000000;
                unint64_t v16 = 0x4E574F4E4B4E55;
                break;
              default:
                unint64_t v15 = 0xE300000000000000;
                unint64_t v16 = 5395265;
                break;
            }
            unint64_t v18 = 0x8000000000032B10;
            unint64_t v19 = 0xD000000000000017;
            switch(*(unsigned char *)(v5 + 41))
            {
              case 1:
                unint64_t v18 = 0xE300000000000000;
                if (v16 == 5786702) {
                  goto LABEL_60;
                }
                goto LABEL_10;
              case 2:
                unint64_t v18 = 0xE300000000000000;
                if (v16 == 4801877) {
                  goto LABEL_60;
                }
                goto LABEL_10;
              case 3:
                unint64_t v18 = 0xE800000000000000;
                if (v16 == 0x505041454E4F4850) {
                  goto LABEL_60;
                }
                goto LABEL_10;
              case 4:
                unint64_t v18 = 0xEA00000000005050;
                if (v16 == 0x414547415353454DLL) {
                  goto LABEL_60;
                }
                goto LABEL_10;
              case 5:
                uint64_t v20 = 0x5245444E494D4552;
                unsigned int v21 = 1096041811;
                goto LABEL_54;
              case 6:
                goto LABEL_59;
              case 7:
                uint64_t v20 = 0x4552434D52414C41;
                goto LABEL_50;
              case 8:
                unint64_t v18 = 0xEE00505041454C47;
                if (v16 == 0x474F544D52414C41) {
                  goto LABEL_60;
                }
                goto LABEL_10;
              case 9:
                uint64_t v20 = 0x4450554D52414C41;
LABEL_50:
                unsigned int v21 = 1095062593;
LABEL_54:
                unint64_t v18 = v21 | 0xEE00505000000000;
                if (v16 == v20) {
                  goto LABEL_60;
                }
                goto LABEL_10;
              case 0xA:
                unint64_t v19 = 0x4145524345544F4ELL;
                unint64_t v18 = 0xED00005050414554;
LABEL_59:
                if (v16 == v19) {
                  goto LABEL_60;
                }
                goto LABEL_10;
              case 0xB:
                unint64_t v18 = 0xED00005050414554;
                if (v16 == 0x454C454445544F4ELL) {
                  goto LABEL_60;
                }
                goto LABEL_10;
              case 0xC:
                unint64_t v18 = 0xE900000000000050;
                if (v16 == 0x5041594D444E4946) {
                  goto LABEL_60;
                }
                goto LABEL_10;
              case 0xD:
                unint64_t v18 = 0xE700000000000000;
                if (v16 == 0x4E574F4E4B4E55) {
                  goto LABEL_60;
                }
                goto LABEL_10;
              default:
                unint64_t v18 = 0xE300000000000000;
                if (v16 != 5395265) {
                  goto LABEL_10;
                }
LABEL_60:
                if (v15 == v18) {
                  goto LABEL_67;
                }
LABEL_10:
                char v11 = sub_311C0();
                swift_bridgeObjectRelease();
                unint64_t result = swift_bridgeObjectRelease();
                if ((v11 & 1) == 0) {
                  break;
                }
                goto LABEL_68;
            }
          }
        }
        a2 = (a2 + 1) & v10;
      }
      while (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_64:
  uint64_t v22 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v22 + 48) + 8 * a2) = v5;
  uint64_t v23 = *(void *)(v22 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
    __break(1u);
LABEL_67:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_68:
    sub_311E0();
    __break(1u);
    JUMPOUT(0x2E124);
  }
  *(void *)(v22 + 16) = v25;
  return result;
}

Swift::Int sub_2E194(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  Swift::Int v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_2D428();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (Swift::Int)sub_2E7CC();
      goto LABEL_22;
    }
    sub_2ECDC();
  }
  uint64_t v11 = *v4;
  sub_31210();
  sub_30CF0();
  unint64_t result = sub_31230();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_311C0(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_311E0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        unint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_311C0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unsigned int v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *unsigned int v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

Swift::Int sub_2E330(Swift::Int result, void *a2, unint64_t a3, char a4)
{
  uint64_t v7 = result;
  unint64_t v8 = *(void *)(*v4 + 16);
  unint64_t v9 = *(void *)(*v4 + 24);
  uint64_t v40 = (void *)result;
  if (v9 <= v8 || (a4 & 1) == 0)
  {
    if (a4)
    {
      sub_2D708();
    }
    else
    {
      if (v9 > v8)
      {
        unint64_t result = (Swift::Int)sub_2E980();
        goto LABEL_60;
      }
      sub_2EF8C();
    }
    uint64_t v10 = *v4;
    sub_31210();
    sub_26428((uint64_t)v41, v7, (uint64_t)a2);
    unint64_t result = sub_31230();
    uint64_t v11 = -1 << *(unsigned char *)(v10 + 32);
    a3 = result & ~v11;
    uint64_t v12 = v10 + 56;
    if ((*(void *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
    {
      uint64_t v13 = ~v11;
      uint64_t v14 = *(void *)(v7 + 16);
      uint64_t v15 = *(void *)(v10 + 48);
      uint64_t v38 = (void *)(v7 + 72);
      do
      {
        BOOL v16 = (void *)(v15 + 16 * a3);
        uint64_t v17 = (void *)*v16;
        if (*(void *)(*v16 + 16) == v14)
        {
          unint64_t v18 = (void *)v16[1];
          if (v14 && v17 != v40)
          {
            unint64_t result = v17[4];
            if (result != v40[4] || v17[5] != v40[5])
            {
              unint64_t result = sub_311C0();
              if ((result & 1) == 0) {
                goto LABEL_10;
              }
            }
            if (v14 != 1)
            {
              unint64_t result = v17[6];
              if (result != v40[6] || v17[7] != v40[7])
              {
                unint64_t result = sub_311C0();
                if ((result & 1) == 0) {
                  goto LABEL_10;
                }
              }
              if (v14 != 2)
              {
                int64_t v29 = v17 + 9;
                long long v31 = v38;
                uint64_t v30 = v14 - 2;
                while (v30)
                {
                  unint64_t result = *(v29 - 1);
                  if (result != *(v31 - 1) || *v29 != *v31)
                  {
                    unint64_t result = sub_311C0();
                    if ((result & 1) == 0) {
                      goto LABEL_10;
                    }
                  }
                  v29 += 2;
                  v31 += 2;
                  if (!--v30) {
                    goto LABEL_26;
                  }
                }
                __break(1u);
                goto LABEL_63;
              }
            }
          }
LABEL_26:
          uint64_t v21 = v18[2];
          if (v21 == a2[2])
          {
            if (v21) {
              BOOL v22 = v18 == a2;
            }
            else {
              BOOL v22 = 1;
            }
            if (v22) {
              goto LABEL_64;
            }
            BOOL v23 = v18[4] == a2[4] && v18[5] == a2[5];
            if (v23 || (unint64_t result = sub_311C0(), (result & 1) != 0))
            {
              if (v21 == 1) {
                goto LABEL_64;
              }
              BOOL v24 = v18[6] == a2[6] && v18[7] == a2[7];
              if (v24 || (unint64_t result = sub_311C0(), (result & 1) != 0))
              {
                uint64_t v25 = v21 - 2;
                if (!v25) {
                  goto LABEL_64;
                }
                BOOL v26 = v18 + 9;
                uint64_t v27 = a2 + 9;
                while (1)
                {
                  if (*(v26 - 1) != *(v27 - 1) || *v26 != *v27)
                  {
                    unint64_t result = sub_311C0();
                    if ((result & 1) == 0) {
                      break;
                    }
                  }
                  v26 += 2;
                  v27 += 2;
                  if (!--v25) {
                    goto LABEL_64;
                  }
                }
              }
            }
          }
        }
LABEL_10:
        a3 = (a3 + 1) & v13;
      }
      while (((*(void *)(v12 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
    }
  }
LABEL_60:
  uint64_t v33 = *v39;
  *(void *)(*v39 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v34 = (void *)(*(void *)(v33 + 48) + 16 * a3);
  *uint64_t v34 = v40;
  v34[1] = a2;
  uint64_t v35 = *(void *)(v33 + 16);
  BOOL v36 = __OFADD__(v35, 1);
  uint64_t v37 = v35 + 1;
  if (v36)
  {
LABEL_63:
    __break(1u);
LABEL_64:
    unint64_t result = sub_311E0();
    __break(1u);
  }
  else
  {
    *(void *)(v33 + 16) = v37;
  }
  return result;
}

void *sub_2E620()
{
  uint64_t v1 = v0;
  sub_4F90(&qword_3E220);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_30F30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    unint64_t result = (void *)swift_retain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2E7CC()
{
  uint64_t v1 = v0;
  sub_4F90(&qword_3E1E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_30F30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
    v19[1] = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2E980()
{
  uint64_t v1 = v0;
  sub_4F90(&qword_3EB10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_30F30();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_OWORD *)(*(void *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(void *)(v2 + 48) + 16 * v15);
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_2EB48()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_4F90(&qword_3E220);
  uint64_t v3 = sub_30F40();
  if (!*(void *)(v2 + 16))
  {
LABEL_23:
    unint64_t result = swift_release();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = v2 + 56;
  uint64_t v6 = -1;
  if (v4 < 64) {
    uint64_t v6 = ~(-1 << v4);
  }
  uint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v8 = (unint64_t)(v4 + 63) >> 6;
  unint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      v7 &= v7 - 1;
      goto LABEL_6;
    }
    int64_t v12 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v8) {
      goto LABEL_22;
    }
    uint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v10;
    if (!v13)
    {
      int64_t v10 = v12 + 1;
      if (v12 + 1 >= v8) {
        goto LABEL_22;
      }
      uint64_t v13 = *(void *)(v5 + 8 * v10);
      if (!v13)
      {
        int64_t v10 = v12 + 2;
        if (v12 + 2 >= v8) {
          goto LABEL_22;
        }
        uint64_t v13 = *(void *)(v5 + 8 * v10);
        if (!v13) {
          break;
        }
      }
    }
LABEL_21:
    uint64_t v7 = (v13 - 1) & v13;
LABEL_6:
    uint64_t v11 = swift_retain();
    unint64_t result = sub_2DAB4(v11, v3);
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v8)
  {
LABEL_22:
    swift_release();
    goto LABEL_23;
  }
  uint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v10 = v14;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v10 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_22;
    }
    uint64_t v13 = *(void *)(v5 + 8 * v10);
    ++v14;
    if (v13) {
      goto LABEL_21;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2ECDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_4F90(&qword_3E1E8);
  uint64_t v3 = sub_30F40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_31210();
    swift_bridgeObjectRetain();
    sub_30CF0();
    uint64_t result = sub_31230();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2EF8C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_4F90(&qword_3EB10);
  uint64_t v3 = sub_30F40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_44:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v31 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v32 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    if (v14 >= v32) {
      goto LABEL_42;
    }
    unint64_t v15 = *(void *)(v31 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v32) {
        goto LABEL_42;
      }
      unint64_t v15 = *(void *)(v31 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v32) {
          goto LABEL_42;
        }
        unint64_t v15 = *(void *)(v31 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    long long v34 = *(_OWORD *)(*(void *)(v2 + 48) + 16 * v13);
    sub_31210();
    sub_31220(*(void *)(v34 + 16));
    uint64_t v17 = *(void *)(v34 + 16);
    if (v17)
    {
      unint64_t v33 = v7;
      uint64_t v18 = v4;
      int64_t v19 = v10;
      uint64_t v20 = v2;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v21 = v34 + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_30CF0();
        swift_bridgeObjectRelease();
        v21 += 16;
        --v17;
      }
      while (v17);
      swift_bridgeObjectRelease();
      uint64_t v2 = v20;
      int64_t v10 = v19;
      uint64_t v4 = v18;
      unint64_t v7 = v33;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_31220(*(void *)(*((void *)&v34 + 1) + 16));
    uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 16);
    if (v22)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = *((void *)&v34 + 1) + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_30CF0();
        swift_bridgeObjectRelease();
        v23 += 16;
        --v22;
      }
      while (v22);
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_31230();
    uint64_t v24 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }
        BOOL v29 = v26 == v28;
        if (v26 == v28) {
          unint64_t v26 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v8 + 8 * v26);
      }
      while (v30 == -1);
      unint64_t v11 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_OWORD *)(*(void *)(v4 + 48) + 16 * v11) = v34;
    ++*(void *)(v4 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v32)
  {
LABEL_42:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_44;
  }
  unint64_t v15 = *(void *)(v31 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_42;
    }
    unint64_t v15 = *(void *)(v31 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_46:
  __break(1u);
  return result;
}

void *sub_2F340(void *a1)
{
  return sub_22D14(0, a1[2], 0, a1);
}

void *sub_2F354(void *a1)
{
  return sub_22E34(0, a1[2], 0, a1);
}

uint64_t sub_2F368(unint64_t a1)
{
  return sub_2318C(0, *(void *)(a1 + 16), 0, a1);
}

void (*sub_2F37C(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2F42C(v6, a2, a3);
  return sub_2F3E4;
}

void sub_2F3E4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_2F42C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_30FB0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    uint64_t v4 = swift_retain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_2F4AC;
  }
  __break(1u);
  return result;
}

uint64_t sub_2F4AC()
{
  return swift_release();
}

uint64_t sub_2F4B4(uint64_t result, uint64_t a2)
{
  unint64_t v3 = 0;
  unint64_t v4 = *(void *)(result + 16);
  uint64_t v5 = result + 32;
LABEL_2:
  if (v3 <= v4) {
    unint64_t v6 = v4;
  }
  else {
    unint64_t v6 = v3;
  }
  while (1)
  {
    if (v4 == v3) {
      return (uint64_t)_swiftEmptyArrayStorage;
    }
    if (v6 == v3) {
      break;
    }
    uint64_t v7 = *(void *)(v5 + 8 * v3++);
    if (v7 < *(void *)(a2 + 16))
    {
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = sub_2AFD0(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v9 = _swiftEmptyArrayStorage[2];
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      if (v9 >= v8 >> 1) {
        uint64_t result = sub_2AFD0(v8 > 1, v9 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v9 + 1;
      _swiftEmptyArrayStorage[v9 + 4] = v7;
      goto LABEL_2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2F5B0(uint64_t result, uint64_t a2)
{
  uint64_t v51 = (void *)result;
  uint64_t v2 = *(void *)result;
  unint64_t v3 = *(void *)(*(void *)result + 16);
  if (v3)
  {
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0) {
      goto LABEL_84;
    }
LABEL_3:
    unint64_t v4 = 0;
    unint64_t v53 = v3;
    uint64_t v54 = (void *)(v2 + 32);
    uint64_t v5 = a2;
    uint64_t v52 = (void *)v2;
    while (1)
    {
      if (v4 == v3) {
        goto LABEL_81;
      }
      if (v4 >= *(void *)(v2 + 16))
      {
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
LABEL_84:
        uint64_t result = (uint64_t)sub_2F340((void *)v2);
        uint64_t v2 = result;
        goto LABEL_3;
      }
      unint64_t v6 = (void *)v54[5 * v4 + 2];
      if (!v6) {
        goto LABEL_4;
      }
      uint64_t v56 = &v54[5 * v4];
      unint64_t v57 = v4;
      uint64_t v2 = *(void *)(v5 + 16);
      if (!v2)
      {
        unint64_t v9 = _swiftEmptyArrayStorage;
        int64_t v17 = _swiftEmptyArrayStorage[2];
        if (v17) {
          goto LABEL_27;
        }
LABEL_33:
        swift_release();
        uint64_t v18 = _swiftEmptyArrayStorage;
        goto LABEL_34;
      }
      uint64_t v7 = v6[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v8 = 0;
      unint64_t v9 = _swiftEmptyArrayStorage;
      do
      {
        if (!v7) {
          goto LABEL_13;
        }
        uint64_t v13 = *(void *)(a2 + 32 + 8 * (void)v8);
        if ((void *)v6[4] == v8) {
          goto LABEL_16;
        }
        if (v7 == 1) {
          goto LABEL_13;
        }
        if ((void *)v6[5] == v8)
        {
LABEL_16:
          swift_bridgeObjectRetain();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v61 = v9;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_2B13C(0, v9[2] + 1, 1);
            unint64_t v9 = v61;
          }
          unint64_t v11 = v9[2];
          unint64_t v10 = v9[3];
          unint64_t v3 = v11 + 1;
          if (v11 >= v10 >> 1)
          {
            sub_2B13C(v10 > 1, v11 + 1, 1);
            unint64_t v9 = v61;
          }
          _OWORD v9[2] = v3;
          unint64_t v12 = &v9[2 * v11];
          v12[4] = v8;
          v12[5] = v13;
        }
        else if (v7 != 2)
        {
          uint64_t v15 = 6;
          while (1)
          {
            uint64_t v16 = v15 - 3;
            if (__OFADD__(v15 - 4, 1)) {
              break;
            }
            if ((void *)v6[v15] == v8) {
              goto LABEL_16;
            }
            ++v15;
            if (v16 == v7) {
              goto LABEL_13;
            }
          }
          __break(1u);
LABEL_80:
          __break(1u);
LABEL_81:
          __break(1u);
          goto LABEL_82;
        }
LABEL_13:
        unint64_t v8 = (void *)((char *)v8 + 1);
      }
      while (v8 != (void *)v2);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v17 = v9[2];
      if (!v17) {
        goto LABEL_33;
      }
LABEL_27:
      uint64_t v61 = _swiftEmptyArrayStorage;
      sub_2B10C(0, v17, 0);
      uint64_t v18 = v61;
      uint64_t v19 = 5;
      do
      {
        unint64_t v3 = v9[v19];
        uint64_t v61 = v18;
        unint64_t v21 = v18[2];
        unint64_t v20 = v18[3];
        swift_bridgeObjectRetain();
        if (v21 >= v20 >> 1)
        {
          sub_2B10C(v20 > 1, v21 + 1, 1);
          uint64_t v18 = v61;
        }
        v18[2] = v21 + 1;
        v18[v21 + 4] = v3;
        v19 += 2;
        --v17;
      }
      while (v17);
      swift_release();
LABEL_34:
      uint64_t v59 = (void *)v18[2];
      if (v59)
      {
        double v58 = v18 + 4;
        swift_bridgeObjectRetain();
        uint64_t v2 = 0;
        uint64_t v22 = _swiftEmptyArrayStorage;
        while (1)
        {
          unint64_t v23 = v58[v2];
          if (v23 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v24 = sub_31090();
            uint64_t v60 = v22;
            if (v24)
            {
LABEL_40:
              uint64_t v61 = _swiftEmptyArrayStorage;
              sub_2B15C(0, v24 & ~(v24 >> 63), 0);
              if (v24 < 0) {
                goto LABEL_80;
              }
              uint64_t v25 = 0;
              unint64_t v26 = v61;
              do
              {
                if ((v23 & 0xC000000000000001) != 0)
                {
                  uint64_t v27 = sub_30FB0();
                }
                else
                {
                  uint64_t v27 = *(void *)(v23 + 8 * v25 + 32);
                  swift_retain();
                }
                unint64_t v3 = *(void *)(v27 + 64);
                swift_bridgeObjectRetain();
                swift_release();
                uint64_t v61 = v26;
                unint64_t v29 = v26[2];
                unint64_t v28 = v26[3];
                unint64_t v30 = v29 + 1;
                if (v29 >= v28 >> 1)
                {
                  sub_2B15C(v28 > 1, v29 + 1, 1);
                  unint64_t v26 = v61;
                }
                ++v25;
                v26[2] = v30;
                v26[v29 + 4] = v3;
              }
              while (v24 != v25);
LABEL_51:
              uint64_t v32 = 0;
              uint64_t v31 = _swiftEmptyArrayStorage;
              do
              {
                uint64_t v35 = (void *)v26[v32 + 4];
                if (v35[2])
                {
                  unint64_t v36 = v35[5];
                  uint64_t v37 = v35[4] & 0xFFFFFFFFFFFFLL;
                  if ((v36 & 0x2000000000000000) != 0) {
                    uint64_t v37 = HIBYTE(v36) & 0xF;
                  }
                  if (v37)
                  {
                    swift_bridgeObjectRetain();
                    char v38 = swift_isUniquelyReferenced_nonNull_native();
                    uint64_t v61 = v31;
                    if ((v38 & 1) == 0)
                    {
                      sub_2B15C(0, v31[2] + 1, 1);
                      uint64_t v31 = v61;
                    }
                    unint64_t v34 = v31[2];
                    unint64_t v33 = v31[3];
                    unint64_t v3 = v34 + 1;
                    if (v34 >= v33 >> 1)
                    {
                      sub_2B15C(v33 > 1, v34 + 1, 1);
                      uint64_t v31 = v61;
                    }
                    v31[2] = v3;
                    v31[v34 + 4] = v35;
                  }
                }
                ++v32;
              }
              while (v30 != v32);
              goto LABEL_62;
            }
          }
          else
          {
            uint64_t v24 = *(void *)((char *)&dword_10 + (v23 & 0xFFFFFFFFFFFFFF8));
            swift_bridgeObjectRetain();
            uint64_t v60 = v22;
            if (v24) {
              goto LABEL_40;
            }
          }
          uint64_t v31 = _swiftEmptyArrayStorage;
          unint64_t v30 = _swiftEmptyArrayStorage[2];
          unint64_t v26 = _swiftEmptyArrayStorage;
          if (v30) {
            goto LABEL_51;
          }
LABEL_62:
          swift_bridgeObjectRelease();
          unint64_t v39 = v31[2];
          if (v39 < 2)
          {
            swift_bridgeObjectRelease();
            swift_release();
            uint64_t v22 = v60;
          }
          else
          {
            uint64_t v40 = v31[4];
            uint64_t v41 = v31[v39 + 3];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_release();
            uint64_t v22 = v60;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v22 = sub_23670(0, v60[2] + 1, 1, v60);
            }
            unint64_t v3 = v22[2];
            unint64_t v42 = v22[3];
            if (v3 >= v42 >> 1) {
              uint64_t v22 = sub_23670((void *)(v42 > 1), v3 + 1, 1, v22);
            }
            v22[2] = v3 + 1;
            Swift::Int v43 = &v22[2 * v3];
            v43[4] = v40;
            v43[5] = v41;
          }
          if ((void *)++v2 == v59)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_70;
          }
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v22 = _swiftEmptyArrayStorage;
LABEL_70:
      sub_2FCB8();
      uint64_t v44 = sub_30DF0();
      uint64_t v62 = v44;
      uint64_t v45 = v22[2];
      if (v45)
      {
        uint64_t v46 = (void **)(v22 + 5);
        do
        {
          os_log_type_t v47 = *(v46 - 1);
          uint64_t v48 = *v46;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_2CE20(&v61, v47, v48);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v46 += 2;
          --v45;
        }
        while (v45);
        swift_bridgeObjectRelease();
        uint64_t v49 = v62;
      }
      else
      {
        uint64_t v49 = v44;
        swift_bridgeObjectRelease();
      }
      uint64_t v50 = *(void *)(v49 + 16);
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v2 = (uint64_t)v52;
      unint64_t v3 = v53;
      unint64_t v4 = v57;
      if (v57 >= v52[2]) {
        goto LABEL_83;
      }
      uint64_t v5 = a2;
      v56[3] = v50;
      *((unsigned char *)v56 + 32) = 0;
LABEL_4:
      if (++v4 == v3)
      {
        *uint64_t v51 = v2;
        return result;
      }
    }
  }
  return result;
}

void sub_2FC30()
{
  sub_6040(*(unint64_t **)(v0 + 16), *(unint64_t **)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_2FC50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_4F90(&qword_3EAE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2FCB8()
{
  unint64_t result = qword_3EAF8;
  if (!qword_3EAF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3EAF8);
  }
  return result;
}

uint64_t sub_2FD0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2FD74(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2FDD8()
{
  uint64_t v1 = sub_305D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_2FECC(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_305D0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  unint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_1ADC4;
  return sub_26BCC(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_30008(uint64_t a1)
{
  uint64_t v2 = sub_4F90(&qword_3E9C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_30068()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_300A0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_1ADC4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_3EB48 + dword_3EB48);
  return v6(a1, v4);
}

uint64_t sub_30158(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t destroy for EntityPair()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s42SiriPrivateLearningPatternExtractionPlugin10EntityPairVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EntityPair(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for EntityPair(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for EntityPair(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EntityPair(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EntityPair(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for EntityPair()
{
  return &type metadata for EntityPair;
}

unint64_t sub_3035C()
{
  unint64_t result = qword_3EB60;
  if (!qword_3EB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_3EB60);
  }
  return result;
}

uint64_t sub_303B0()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_303C0()
{
  return JSONDecoder.init()();
}

uint64_t sub_303D0()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_303E0()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_303F0()
{
  return JSONEncoder.init()();
}

uint64_t sub_30400()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_30410()
{
  return _convertNSErrorToError(_:)();
}

NSData sub_30420()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_30430()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_30440()
{
  return Date.description.getter();
}

uint64_t sub_30450()
{
  return static Date.distantFuture.getter();
}

uint64_t sub_30460()
{
  return Date.addingTimeInterval(_:)();
}

NSDate sub_30470()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_30480()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t sub_30490()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t sub_304A0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_304B0()
{
  return static Date.now.getter();
}

uint64_t sub_304C0()
{
  return Date.init()();
}

uint64_t sub_304D0()
{
  return type metadata accessor for Date();
}

NSUUID sub_304E0()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_304F0()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_30500()
{
  return UUID.init()();
}

uint64_t sub_30510()
{
  return type metadata accessor for UUID();
}

uint64_t sub_30520()
{
  return Kind.rawValue.getter();
}

uint64_t sub_30530()
{
  return type metadata accessor for Kind();
}

uint64_t sub_30540()
{
  return Node.int64Value.getter();
}

uint64_t sub_30550()
{
  return Node.stringValue.getter();
}

uint64_t sub_30560()
{
  return Node.kind.getter();
}

uint64_t sub_30570()
{
  return type metadata accessor for Node();
}

uint64_t sub_30580()
{
  return dispatch thunk of Graph.nodes.getter();
}

uint64_t sub_30590()
{
  return type metadata accessor for SiriPrivateLearningFeatureFlag();
}

uint64_t sub_305A0()
{
  return PrivateLearningPluginError.init(message:)();
}

uint64_t sub_305B0()
{
  return type metadata accessor for PrivateLearningPluginResult();
}

uint64_t sub_305C0()
{
  return static PrivateLearningPluginRunContext.== infix(_:_:)();
}

uint64_t sub_305D0()
{
  return type metadata accessor for PrivateLearningPluginRunContext();
}

uint64_t sub_305E0()
{
  return static ORCHEvents.requestID(_:)();
}

uint64_t sub_305F0()
{
  return Conversation.getTimestamp()();
}

uint64_t sub_30600()
{
  return Conversation.allTurnsChronologically.getter();
}

uint64_t sub_30610()
{
  return type metadata accessor for Conversation();
}

uint64_t sub_30620()
{
  return static NlxSELFUtils.getTopNlxUsoGraph(from:)();
}

uint64_t sub_30640()
{
  return dispatch thunk of CoreDataStore.context.getter();
}

uint64_t sub_30650()
{
  return CoreDataStore.deinit();
}

uint64_t sub_30660()
{
  return type metadata accessor for AppInteraction();
}

uint64_t sub_30670()
{
  return StreamBookmark.__allocating_init(name:)();
}

uint64_t sub_30680()
{
  return type metadata accessor for StreamBookmark();
}

uint64_t sub_30690()
{
  return PLLoggingReader.asyncSignalReader.getter();
}

uint64_t sub_306A0()
{
  return PLLoggingReader.interactionReader.getter();
}

uint64_t sub_306B0()
{
  return PLLoggingReader.streamBookmarkStore.getter();
}

uint64_t sub_306C0()
{
  return static PLLoggingReader.shared.getter();
}

uint64_t sub_306D0()
{
  return type metadata accessor for PLLoggingReader();
}

uint64_t sub_306F0()
{
  return AnyAsyncSequence.makeAsyncIterator()();
}

uint64_t sub_30700()
{
  return InteractionReader.appInteractions(since:intentTypes:until:)();
}

uint64_t sub_30710()
{
  return TypedNamedFeature.value.getter();
}

uint64_t sub_30720()
{
  return dispatch thunk of ASRFeatureExtractor.extract(from:)();
}

uint64_t sub_30730()
{
  return ASRFeatureExtractor.init()();
}

uint64_t sub_30740()
{
  return type metadata accessor for ASRFeatureExtractor();
}

uint64_t sub_30750()
{
  return NLXFeatureExtractor.init()();
}

uint64_t sub_30760()
{
  return type metadata accessor for NLXFeatureExtractor();
}

uint64_t sub_30770()
{
  return dispatch thunk of StreamBookmarkStore.read(name:)();
}

uint64_t sub_30780()
{
  return dispatch thunk of StreamBookmarkStore.write(bookmark:)();
}

uint64_t sub_30790()
{
  return UEIFeatureExtractor.init()();
}

uint64_t sub_307A0()
{
  return type metadata accessor for UEIFeatureExtractor();
}

uint64_t sub_307B0()
{
  return SELFFeatureExtractor.extract(from:)();
}

uint64_t sub_307C0()
{
  return dispatch thunk of FeatureFlagsResolving.isFeatureEnabled(_:)();
}

uint64_t sub_307D0()
{
  return WindowedAsyncSequence.makeAsyncIterator()();
}

uint64_t sub_307E0()
{
  return IntentFeatureExtractor.extract(from:)();
}

uint64_t sub_307F0()
{
  return EnvironmentFeatureFlags.init()();
}

uint64_t sub_30800()
{
  return type metadata accessor for EnvironmentFeatureFlags();
}

uint64_t sub_30810()
{
  return dispatch thunk of RECTIFITrialStatusResolver.getRECTIFICoreDataStoreName()();
}

uint64_t sub_30820()
{
  return RECTIFITrialStatusResolver.init()();
}

uint64_t sub_30830()
{
  return type metadata accessor for RECTIFITrialStatusResolver();
}

uint64_t sub_30840()
{
  return type metadata accessor for FindDeviceAndFriendsFeature.DonatedBySiri();
}

uint64_t sub_30850()
{
  return type metadata accessor for FindDeviceAndFriendsFeature.Name();
}

uint64_t sub_30860()
{
  return dispatch thunk of RECTIFITrialStatusResolving.getMinSupport()();
}

uint64_t sub_30870()
{
  return dispatch thunk of RECTIFITrialStatusResolving.getTopKPatterns()();
}

uint64_t sub_30880()
{
  return dispatch thunk of RECTIFITrialStatusResolving.getDaysUntilNextRun()();
}

uint64_t sub_30890()
{
  return dispatch thunk of RECTIFITrialStatusResolving.getSimilarityThreshold()();
}

uint64_t sub_308A0()
{
  return dispatch thunk of RECTIFITrialStatusResolving.getSimilarityMinThreshold()();
}

uint64_t sub_308B0()
{
  return dispatch thunk of RECTIFITrialStatusResolving.getRECTIFICoreDataStoreName()();
}

uint64_t sub_308C0()
{
  return dispatch thunk of RECTIFITrialStatusResolving.isRECTIFIOnDeviceStorageEnabled()();
}

uint64_t sub_308D0()
{
  return dispatch thunk of RECTIFITrialStatusResolving.isRECTIFIPatternExtractionEnabled()();
}

uint64_t sub_308E0()
{
  return dispatch thunk of AsyncBookmarkingSignalReader.conversations(startBookmark:)();
}

uint64_t sub_308F0()
{
  return dispatch thunk of AsyncBookmarkingSignalReader.conversationsBookmarked(startBookmark:)();
}

uint64_t sub_30900()
{
  return dispatch thunk of INAddTaskIntentFeatureExtractor.extract(from:)();
}

uint64_t sub_30910()
{
  return INAddTaskIntentFeatureExtractor.init()();
}

uint64_t sub_30920()
{
  return type metadata accessor for INAddTaskIntentFeatureExtractor();
}

uint64_t sub_30930()
{
  return dispatch thunk of INCreateNoteIntentFeatureExtractor.extract(from:)();
}

uint64_t sub_30940()
{
  return INCreateNoteIntentFeatureExtractor.init()();
}

uint64_t sub_30950()
{
  return type metadata accessor for INCreateNoteIntentFeatureExtractor();
}

uint64_t sub_30960()
{
  return dispatch thunk of INDeleteNoteIntentFeatureExtractor.extract(from:)();
}

uint64_t sub_30970()
{
  return INDeleteNoteIntentFeatureExtractor.init()();
}

uint64_t sub_30980()
{
  return type metadata accessor for INDeleteNoteIntentFeatureExtractor();
}

uint64_t sub_30990()
{
  return dispatch thunk of MTCreateAlarmIntentFeatureExtractor.extract(from:)();
}

uint64_t sub_309A0()
{
  return MTCreateAlarmIntentFeatureExtractor.init()();
}

uint64_t sub_309B0()
{
  return type metadata accessor for MTCreateAlarmIntentFeatureExtractor();
}

uint64_t sub_309C0()
{
  return dispatch thunk of MTToggleAlarmIntentFeatureExtractor.extract(from:)();
}

uint64_t sub_309D0()
{
  return MTToggleAlarmIntentFeatureExtractor.init()();
}

uint64_t sub_309E0()
{
  return type metadata accessor for MTToggleAlarmIntentFeatureExtractor();
}

uint64_t sub_309F0()
{
  return dispatch thunk of MTUpdateAlarmIntentFeatureExtractor.extract(from:)();
}

uint64_t sub_30A00()
{
  return MTUpdateAlarmIntentFeatureExtractor.init()();
}

uint64_t sub_30A10()
{
  return type metadata accessor for MTUpdateAlarmIntentFeatureExtractor();
}

uint64_t sub_30A20()
{
  return dispatch thunk of INSetTaskAttributeIntentFeatureExtractor.extract(from:)();
}

uint64_t sub_30A30()
{
  return INSetTaskAttributeIntentFeatureExtractor.init()();
}

uint64_t sub_30A40()
{
  return type metadata accessor for INSetTaskAttributeIntentFeatureExtractor();
}

uint64_t sub_30A50()
{
  return dispatch thunk of FindDeviceAndFriendsIntentFeatureExtractor.extract(from:)();
}

uint64_t sub_30A60()
{
  return FindDeviceAndFriendsIntentFeatureExtractor.init()();
}

uint64_t sub_30A70()
{
  return type metadata accessor for FindDeviceAndFriendsIntentFeatureExtractor();
}

uint64_t sub_30A80()
{
  return Turn.getTimestamp()();
}

uint64_t sub_30A90()
{
  return Turn.events.getter();
}

uint64_t sub_30AA0()
{
  return type metadata accessor for Turn();
}

uint64_t sub_30AB0()
{
  return static Config.baseLocation.getter();
}

uint64_t sub_30AC0()
{
  return type metadata accessor for CommonFeature.StartTimestamp();
}

uint64_t sub_30AD0()
{
  return static TimeEventUtils.groupAndJoinEvents<A, B>(milestoneEvents:eventsToJoin:)();
}

uint64_t sub_30AE0()
{
  return CommonContactReference.displayName.getter();
}

uint64_t sub_30AF0()
{
  return type metadata accessor for CommonContactReference();
}

uint64_t sub_30B00()
{
  return dispatch thunk of CommonInteractionFeatureExtractor.extract(from:)();
}

uint64_t sub_30B10()
{
  return CommonInteractionFeatureExtractor.init()();
}

uint64_t sub_30B20()
{
  return type metadata accessor for CommonInteractionFeatureExtractor();
}

uint64_t sub_30B30()
{
  return dispatch thunk of INStartCallIntentFeatureExtractor.extract(from:)();
}

uint64_t sub_30B40()
{
  return INStartCallIntentFeatureExtractor.init()();
}

uint64_t sub_30B50()
{
  return type metadata accessor for INStartCallIntentFeatureExtractor();
}

uint64_t sub_30B60()
{
  return INSendMessageIntentFeatureExtractor.init()();
}

uint64_t sub_30B70()
{
  return type metadata accessor for INSendMessageIntentFeatureExtractor();
}

uint64_t sub_30B80()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_30B90()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_30BA0()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_30BB0()
{
  return OSSignposter.init(logger:)();
}

uint64_t sub_30BC0()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_30BD0()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_30BE0()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_30BF0()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_30C00()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_30C10()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_30C20()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_30C30()
{
  return Logger.logObject.getter();
}

uint64_t sub_30C40()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_30C50()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_30C60()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_30C70()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_30C80()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_30C90()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

NSString sub_30CA0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_30CB0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_30CC0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_30CD0()
{
  return String.lowercased()()._countAndFlagsBits;
}

double sub_30CE0(Swift::String between)
{
  *(void *)&double result = (unint64_t)String.scoreRatcliffObershelp(between:)(between);
  return result;
}

uint64_t sub_30CF0()
{
  return String.hash(into:)();
}

void sub_30D00(Swift::String a1)
{
}

Swift::Int sub_30D10()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_30D20()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_30D30()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_30D40()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_30D50()
{
  return Array.description.getter();
}

uint64_t sub_30D60()
{
  return specialized Array._endMutation()();
}

uint64_t sub_30D70()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_30D80()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_30D90()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_30DA0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_30DC0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_30DD0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_30DE0()
{
  return AsyncSequence.window2()();
}

uint64_t sub_30DF0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_30E00()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_30E10()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_30E20()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_30E30()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_30E40()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_30E50()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_30E60()
{
  return NSManagedObjectContext.performAndWait<A>(_:)();
}

uint64_t sub_30E70()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

uint64_t sub_30E80()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_30E90()
{
  return type metadata accessor for Optional();
}

uint64_t sub_30EA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_30EB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_30EC0()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_30ED0()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_30EE0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_30EF0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_30F00()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_30F10()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_30F20()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_30F30()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_30F40()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_30F50()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_30F60()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_30F70(Swift::Int a1)
{
}

uint64_t sub_30F80()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_30F90()
{
  return Identifiable<>.id.getter();
}

void sub_30FA0(Swift::Int a1)
{
}

uint64_t sub_30FB0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_30FC0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_30FD0()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_30FE0()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_30FF0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_31000()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_31010()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_31020()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_31030()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_31040()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_31050()
{
  return dispatch thunk of _AnySequenceBox.__copyToContiguousArray()();
}

uint64_t sub_31060()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_31070()
{
  return AsyncMapSequence.init(_:transform:)();
}

uint64_t sub_31080()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_31090()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_310A0()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_310B0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_310C0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_310D0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_310E0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_310F0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_31100()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_31110()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_31120()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_31130()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_31140()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_31150()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_31160()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_31170()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_31180()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_31190()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

Swift::Int sub_311A0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_311B0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_311C0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_311D0()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_311E0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_311F0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_31200()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_31210()
{
  return Hasher.init(_seed:)();
}

void sub_31220(Swift::UInt a1)
{
}

Swift::Int sub_31230()
{
  return Hasher._finalize()();
}

uint64_t sub_31240()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_31250()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_isClassType()
{
  return _swift_isClassType();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}