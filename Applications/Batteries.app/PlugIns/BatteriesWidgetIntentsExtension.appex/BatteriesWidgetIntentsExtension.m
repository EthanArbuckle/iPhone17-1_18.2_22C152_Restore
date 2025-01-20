uint64_t sub_100001F20()
{
  uint64_t v0;

  v0 = sub_100006AF8();
  sub_100006890(v0, qword_10000C6F8);
  sub_100006814(v0, (uint64_t)qword_10000C6F8);
  return sub_100006AE8();
}

id sub_100001FD8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return [super dealloc];
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

unint64_t sub_100002118(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    objc_super v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000684C(&qword_10000C660);
  objc_super v2 = (void *)sub_100006D28();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_100002988(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
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

uint64_t sub_10000222C(unint64_t *a1)
{
  unint64_t v2 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    unint64_t v2 = sub_100004E24(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v6[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v6[1] = v4;
  sub_100002AF8(v6);
  return sub_100006B88();
}

uint64_t sub_1000022B4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_1000051EC(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1000032E0(v6);
  return sub_100006CA8();
}

uint64_t sub_100002330(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100002404(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006A7C((uint64_t)v12, *a3);
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
      sub_100006A7C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006A2C((uint64_t)v12);
  return v7;
}

uint64_t sub_100002404(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006C28();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000025C0(a5, a6);
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
  uint64_t v8 = sub_100006C88();
  if (!v8)
  {
    sub_100006CE8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006D38();
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

uint64_t sub_1000025C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100002658(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100002838(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100002838(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100002658(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000027D0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006C58();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006CE8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006B38();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    sub_100006D38();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006CE8();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000027D0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_10000684C(&qword_10000C680);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100002838(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000684C(&qword_10000C680);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
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
  uint64_t result = sub_100006D38();
  __break(1u);
  return result;
}

unint64_t sub_100002988(uint64_t a1, uint64_t a2)
{
  sub_100006D88();
  sub_100006B28();
  Swift::Int v4 = sub_100006D98();

  return sub_100004B94(a1, a2, v4);
}

void *sub_100002A00(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      unint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_10000684C(&qword_10000C668);
      unint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_100004FD8((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100006CF8();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void sub_100002AF8(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int v4 = sub_100006D58(v3);
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_146;
    }
    if (v3) {
      sub_100003C68(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_154;
  }
  Swift::Int v6 = v4;
  v106 = a1;
  if (v3 < 2)
  {
    int64_t v9 = (char *)_swiftEmptyArrayStorage;
    uint64_t v113 = (uint64_t)_swiftEmptyArrayStorage;
    v111 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
LABEL_110:
      if (v13 >= 2)
      {
        uint64_t v96 = *v106;
        do
        {
          unint64_t v97 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_141;
          }
          if (!v96) {
            goto LABEL_153;
          }
          uint64_t v98 = (uint64_t)v9;
          uint64_t v99 = *(void *)&v9[16 * v97 + 32];
          uint64_t v100 = *(void *)&v9[16 * v13 + 24];
          sub_100003F0C((id *)(v96 + 8 * v99), (id *)(v96 + 8 * *(void *)&v9[16 * v13 + 16]), v96 + 8 * v100, v111);
          if (v1) {
            break;
          }
          if (v100 < v99) {
            goto LABEL_142;
          }
          if (swift_isUniquelyReferenced_nonNull_native()) {
            v101 = (char *)v98;
          }
          else {
            v101 = sub_100004874(v98);
          }
          if (v97 >= *((void *)v101 + 2)) {
            goto LABEL_143;
          }
          v102 = &v101[16 * v97 + 32];
          *(void *)v102 = v99;
          *((void *)v102 + 1) = v100;
          unint64_t v103 = *((void *)v101 + 2);
          if (v13 > v103) {
            goto LABEL_144;
          }
          v104 = v101;
          memmove(&v101[16 * v13 + 16], &v101[16 * v13 + 32], 16 * (v103 - v13));
          int64_t v9 = v104;
          *((void *)v104 + 2) = v103 - 1;
          unint64_t v13 = v103 - 1;
        }
        while (v103 > 2);
      }
LABEL_123:
      swift_bridgeObjectRelease();
      *(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_100006B88();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    sub_1000068F4(0, &qword_10000C638);
    uint64_t v8 = sub_100006BA8();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    v111 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v113 = v8;
  }
  Swift::Int v108 = v6;
  Swift::Int v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v107 = *a1 - 8;
  int64_t v9 = (char *)_swiftEmptyArrayStorage;
  uint64_t v12 = &IntentHandler;
  Swift::Int v110 = v3;
  uint64_t v112 = *a1;
  while (1)
  {
    Swift::Int v14 = v10++;
    if (v10 >= v3) {
      goto LABEL_42;
    }
    v15 = v9;
    v16 = *(void **)(v11 + 8 * v14);
    id v17 = *(id *)(v11 + 8 * v10);
    id v18 = v16;
    if (![v17 (SEL)v12[149].count]) {
      break;
    }
    unsigned int v19 = [v18 (SEL)v12[149].count];

    int v20 = v19 ^ 1;
    uint64_t v12 = &IntentHandler;
    Swift::Int v21 = v14 + 2;
    uint64_t v11 = v112;
    if (v14 + 2 < v110) {
      goto LABEL_23;
    }
LABEL_30:
    int64_t v9 = v15;
    Swift::Int v10 = v21;
    if (v20) {
      goto LABEL_31;
    }
LABEL_42:
    Swift::Int v33 = v110;
    if (v10 < v110)
    {
      if (__OFSUB__(v10, v14)) {
        goto LABEL_145;
      }
      if (v10 - v14 < v108)
      {
        if (__OFADD__(v14, v108)) {
          goto LABEL_147;
        }
        if (v14 + v108 < v110) {
          Swift::Int v33 = v14 + v108;
        }
        if (v33 < v14)
        {
LABEL_148:
          __break(1u);
          goto LABEL_149;
        }
        if (v10 != v33)
        {
          Swift::Int v109 = v14;
          v105 = v9;
          uint64_t v34 = v107 + 8 * v10;
          do
          {
            Swift::Int v35 = v33;
            v36 = *(void **)(v11 + 8 * v10);
            Swift::Int v37 = v109;
            uint64_t v38 = v34;
            while (1)
            {
              v39 = *(void **)v38;
              id v40 = v36;
              id v41 = v39;
              if (![v40 (SEL)v12[149].count])
              {

                uint64_t v11 = v112;
                goto LABEL_52;
              }
              unsigned __int8 v42 = [v41 (SEL)v12[149].count];

              if (v42) {
                break;
              }
              uint64_t v11 = v112;
              if (!v112) {
                goto LABEL_150;
              }
              v43 = *(void **)v38;
              v36 = *(void **)(v38 + 8);
              *(void *)uint64_t v38 = v36;
              *(void *)(v38 + 8) = v43;
              v38 -= 8;
              ++v37;
              uint64_t v12 = &IntentHandler;
              if (v10 == v37) {
                goto LABEL_52;
              }
            }
            uint64_t v11 = v112;
            uint64_t v12 = &IntentHandler;
LABEL_52:
            ++v10;
            v34 += 8;
            Swift::Int v33 = v35;
          }
          while (v10 != v35);
          Swift::Int v10 = v35;
          int64_t v9 = v105;
          Swift::Int v14 = v109;
        }
      }
    }
    if (v10 < v14) {
      goto LABEL_140;
    }
    v44 = v9;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      int64_t v9 = v44;
    }
    else {
      int64_t v9 = sub_1000046BC(0, *((void *)v44 + 2) + 1, 1, v44);
    }
    unint64_t v46 = *((void *)v9 + 2);
    unint64_t v45 = *((void *)v9 + 3);
    unint64_t v13 = v46 + 1;
    uint64_t v11 = v112;
    if (v46 >= v45 >> 1)
    {
      v95 = sub_1000046BC((char *)(v45 > 1), v46 + 1, 1, v9);
      uint64_t v11 = v112;
      int64_t v9 = v95;
    }
    *((void *)v9 + 2) = v13;
    v47 = v9 + 32;
    v48 = &v9[16 * v46 + 32];
    *(void *)v48 = v14;
    *((void *)v48 + 1) = v10;
    if (v46)
    {
      while (1)
      {
        unint64_t v49 = v13 - 1;
        if (v13 >= 4)
        {
          v54 = &v47[16 * v13];
          uint64_t v55 = *((void *)v54 - 8);
          uint64_t v56 = *((void *)v54 - 7);
          BOOL v60 = __OFSUB__(v56, v55);
          uint64_t v57 = v56 - v55;
          if (v60) {
            goto LABEL_129;
          }
          uint64_t v59 = *((void *)v54 - 6);
          uint64_t v58 = *((void *)v54 - 5);
          BOOL v60 = __OFSUB__(v58, v59);
          uint64_t v52 = v58 - v59;
          char v53 = v60;
          if (v60) {
            goto LABEL_130;
          }
          unint64_t v61 = v13 - 2;
          v62 = &v47[16 * v13 - 32];
          uint64_t v64 = *(void *)v62;
          uint64_t v63 = *((void *)v62 + 1);
          BOOL v60 = __OFSUB__(v63, v64);
          uint64_t v65 = v63 - v64;
          if (v60) {
            goto LABEL_132;
          }
          BOOL v60 = __OFADD__(v52, v65);
          uint64_t v66 = v52 + v65;
          if (v60) {
            goto LABEL_135;
          }
          if (v66 >= v57)
          {
            v84 = &v47[16 * v49];
            uint64_t v86 = *(void *)v84;
            uint64_t v85 = *((void *)v84 + 1);
            BOOL v60 = __OFSUB__(v85, v86);
            uint64_t v87 = v85 - v86;
            if (v60) {
              goto LABEL_139;
            }
            BOOL v77 = v52 < v87;
            goto LABEL_98;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v78 = *((void *)v9 + 4);
            uint64_t v79 = *((void *)v9 + 5);
            BOOL v60 = __OFSUB__(v79, v78);
            uint64_t v71 = v79 - v78;
            char v72 = v60;
            goto LABEL_92;
          }
          uint64_t v51 = *((void *)v9 + 4);
          uint64_t v50 = *((void *)v9 + 5);
          BOOL v60 = __OFSUB__(v50, v51);
          uint64_t v52 = v50 - v51;
          char v53 = v60;
        }
        if (v53) {
          goto LABEL_131;
        }
        unint64_t v61 = v13 - 2;
        v67 = &v47[16 * v13 - 32];
        uint64_t v69 = *(void *)v67;
        uint64_t v68 = *((void *)v67 + 1);
        BOOL v70 = __OFSUB__(v68, v69);
        uint64_t v71 = v68 - v69;
        char v72 = v70;
        if (v70) {
          goto LABEL_134;
        }
        v73 = &v47[16 * v49];
        uint64_t v75 = *(void *)v73;
        uint64_t v74 = *((void *)v73 + 1);
        BOOL v60 = __OFSUB__(v74, v75);
        uint64_t v76 = v74 - v75;
        if (v60) {
          goto LABEL_137;
        }
        if (__OFADD__(v71, v76)) {
          goto LABEL_138;
        }
        if (v71 + v76 >= v52)
        {
          BOOL v77 = v52 < v76;
LABEL_98:
          if (v77) {
            unint64_t v49 = v61;
          }
          goto LABEL_100;
        }
LABEL_92:
        if (v72) {
          goto LABEL_133;
        }
        v80 = &v47[16 * v49];
        uint64_t v82 = *(void *)v80;
        uint64_t v81 = *((void *)v80 + 1);
        BOOL v60 = __OFSUB__(v81, v82);
        uint64_t v83 = v81 - v82;
        if (v60) {
          goto LABEL_136;
        }
        if (v83 < v71) {
          goto LABEL_14;
        }
LABEL_100:
        unint64_t v88 = v49 - 1;
        if (v49 - 1 >= v13)
        {
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
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
          goto LABEL_148;
        }
        if (!v11) {
          goto LABEL_151;
        }
        v89 = v9;
        v90 = &v47[16 * v88];
        uint64_t v91 = *(void *)v90;
        v92 = &v47[16 * v49];
        uint64_t v93 = *((void *)v92 + 1);
        sub_100003F0C((id *)(v11 + 8 * *(void *)v90), (id *)(v11 + 8 * *(void *)v92), v11 + 8 * v93, v111);
        if (v1) {
          goto LABEL_123;
        }
        if (v93 < v91) {
          goto LABEL_126;
        }
        if (v49 > *((void *)v89 + 2)) {
          goto LABEL_127;
        }
        *(void *)v90 = v91;
        *(void *)&v47[16 * v88 + 8] = v93;
        unint64_t v94 = *((void *)v89 + 2);
        if (v49 >= v94) {
          goto LABEL_128;
        }
        unint64_t v13 = v94 - 1;
        memmove(&v47[16 * v49], v92 + 16, 16 * (v94 - 1 - v49));
        int64_t v9 = v89;
        *((void *)v89 + 2) = v94 - 1;
        uint64_t v11 = v112;
        if (v94 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_14:
    Swift::Int v3 = v110;
    uint64_t v12 = &IntentHandler;
    if (v10 >= v110) {
      goto LABEL_110;
    }
  }

  Swift::Int v21 = v14 + 2;
  if (v14 + 2 >= v110)
  {
    Swift::Int v10 = v14 + 2;
    int64_t v9 = v15;
    uint64_t v11 = v112;
    goto LABEL_42;
  }
  int v20 = 0;
  uint64_t v11 = v112;
LABEL_23:
  while (2)
  {
    v23 = *(void **)(v11 + 8 * v10);
    id v24 = *(id *)(v11 + 8 * v21);
    id v25 = v23;
    if (![v24 (SEL)v12[149].count])
    {

      if (v20)
      {
        int64_t v9 = v15;
        uint64_t v11 = v112;
        if (v21 < v14) {
          goto LABEL_149;
        }
LABEL_34:
        if (v14 < v21)
        {
          v28 = (uint64_t *)(v107 + 8 * v21);
          Swift::Int v29 = v21;
          Swift::Int v30 = v14;
          v31 = (uint64_t *)(v11 + 8 * v14);
          do
          {
            if (v30 != --v29)
            {
              if (!v11) {
                goto LABEL_152;
              }
              uint64_t v32 = *v31;
              uint64_t *v31 = *v28;
              uint64_t *v28 = v32;
            }
            ++v30;
            --v28;
            ++v31;
          }
          while (v30 < v29);
        }
        Swift::Int v10 = v21;
        goto LABEL_42;
      }
      goto LABEL_22;
    }
    unsigned int v26 = [v25 (SEL)v12[149].count];

    BOOL v27 = v20 == v26;
    uint64_t v12 = &IntentHandler;
    if (!v27)
    {
LABEL_22:
      Swift::Int v22 = v21 + 1;
      Swift::Int v10 = v21;
      Swift::Int v21 = v22;
      uint64_t v11 = v112;
      if (v22 >= v110)
      {
        Swift::Int v21 = v22;
        goto LABEL_30;
      }
      continue;
    }
    break;
  }
  int64_t v9 = v15;
  uint64_t v11 = v112;
  Swift::Int v10 = v21;
  if (!v20) {
    goto LABEL_42;
  }
LABEL_31:
  if (v21 >= v14) {
    goto LABEL_34;
  }
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
  sub_100006CE8();
  __break(1u);
}

void sub_1000032E0(uint64_t *a1)
{
  uint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  Swift::Int v4 = sub_100006D58(v3);
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_147;
    }
    if (v3) {
      sub_100003D5C(0, v3, 1, v2);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_155;
  }
  Swift::Int v114 = v4;
  Swift::Int v118 = v3;
  uint64_t v112 = v2;
  if (v3 < 2)
  {
    int64_t v9 = (char *)_swiftEmptyArrayStorage;
    uint64_t v124 = (uint64_t)_swiftEmptyArrayStorage;
    v120 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
LABEL_113:
      if (v13 >= 2)
      {
        uint64_t v106 = *v112;
        do
        {
          unint64_t v107 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_142;
          }
          if (!v106) {
            goto LABEL_154;
          }
          uint64_t v108 = *(void *)&v9[16 * v107 + 32];
          uint64_t v109 = *(void *)&v9[16 * v13 + 24];
          sub_100004244((void **)(v106 + 8 * v108), (id *)(v106 + 8 * *(void *)&v9[16 * v13 + 16]), v106 + 8 * v109, v120);
          if (v1) {
            break;
          }
          if (v109 < v108) {
            goto LABEL_143;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            int64_t v9 = sub_100004874((uint64_t)v9);
          }
          if (v107 >= *((void *)v9 + 2)) {
            goto LABEL_144;
          }
          Swift::Int v110 = &v9[16 * v107 + 32];
          *(void *)Swift::Int v110 = v108;
          *((void *)v110 + 1) = v109;
          unint64_t v111 = *((void *)v9 + 2);
          if (v13 > v111) {
            goto LABEL_145;
          }
          memmove(&v9[16 * v13 + 16], &v9[16 * v13 + 32], 16 * (v111 - v13));
          *((void *)v9 + 2) = v111 - 1;
          unint64_t v13 = v111 - 1;
        }
        while (v111 > 2);
      }
LABEL_124:
      swift_bridgeObjectRelease();
      *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_100006B88();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    Swift::Int v6 = v2;
    uint64_t v7 = v5 >> 1;
    sub_1000068F4(0, &qword_10000C638);
    uint64_t v8 = sub_100006BA8();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    uint64_t v2 = v6;
    v120 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v124 = v8;
  }
  Swift::Int v10 = 0;
  uint64_t v11 = *v2;
  uint64_t v113 = *v2 - 8;
  int64_t v9 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v12 = v3;
  uint64_t v121 = *v2;
LABEL_15:
  Swift::Int v14 = v10;
  Swift::Int v15 = v10 + 1;
  v116 = v9;
  if (v10 + 1 < v12)
  {
    Swift::Int v16 = v10 + 1;
    id v17 = *(void **)(v11 + 8 * v10);
    id v18 = *(id *)(v11 + 8 * v15);
    id v19 = v17;
    id v20 = [v18 name];
    if (!v20)
    {

      Swift::Int v26 = v14 + 2;
      if (v14 + 2 < v118) {
        goto LABEL_21;
      }
      goto LABEL_42;
    }
    Swift::Int v21 = v20;
    sub_100006B18();

    id v22 = [v19 name];
    if (v22)
    {
      v23 = v22;
      sub_100006B18();

      sub_100006930();
      uint64_t v24 = sub_100006C38();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v25 = v24 == -1;
      Swift::Int v26 = v14 + 2;
      uint64_t v11 = v121;
      if (v14 + 2 < v118) {
        goto LABEL_22;
      }
LABEL_32:
      Swift::Int v15 = v26;
      if (v25)
      {
LABEL_33:
        if (v26 < v14) {
          goto LABEL_150;
        }
        if (v14 < v26)
        {
          Swift::Int v37 = (uint64_t *)(v113 + 8 * v26);
          Swift::Int v38 = v26;
          Swift::Int v39 = v14;
          id v40 = (uint64_t *)(v11 + 8 * v14);
          do
          {
            if (v39 != --v38)
            {
              if (!v11) {
                goto LABEL_153;
              }
              uint64_t v41 = *v40;
              *id v40 = *v37;
              *Swift::Int v37 = v41;
            }
            ++v39;
            --v37;
            ++v40;
          }
          while (v39 < v38);
        }
        Swift::Int v15 = v26;
      }
      goto LABEL_43;
    }

    swift_bridgeObjectRelease();
    Swift::Int v26 = v14 + 2;
    if (v14 + 2 >= v118)
    {
LABEL_42:
      Swift::Int v15 = v26;
      uint64_t v11 = v121;
      goto LABEL_43;
    }
LABEL_21:
    BOOL v25 = 0;
    uint64_t v11 = v121;
LABEL_22:
    Swift::Int v27 = v16;
    while (1)
    {
      v31 = *(void **)(v11 + 8 * v27);
      id v32 = *(id *)(v11 + 8 * v26);
      id v33 = v31;
      id v34 = [v32 name];
      if (!v34) {
        break;
      }
      Swift::Int v35 = v34;
      sub_100006B18();

      id v36 = [v33 name];
      if (!v36)
      {

        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
      v28 = v36;
      sub_100006B18();

      sub_100006930();
      uint64_t v29 = sub_100006C38();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int64_t v9 = v116;
      uint64_t v11 = v121;
      if (((v25 ^ (v29 != -1)) & 1) == 0) {
        goto LABEL_32;
      }
LABEL_24:
      Swift::Int v30 = v26 + 1;
      Swift::Int v27 = v26;
      Swift::Int v26 = v30;
      if (v30 >= v118)
      {
        Swift::Int v26 = v30;
        goto LABEL_32;
      }
    }

LABEL_29:
    int64_t v9 = v116;
    uint64_t v11 = v121;
    if (v25) {
      goto LABEL_33;
    }
    goto LABEL_24;
  }
LABEL_43:
  if (v15 >= v118) {
    goto LABEL_65;
  }
  if (__OFSUB__(v15, v14)) {
    goto LABEL_146;
  }
  if (v15 - v14 >= v114) {
    goto LABEL_65;
  }
  if (__OFADD__(v14, v114)) {
    goto LABEL_148;
  }
  Swift::Int v42 = v118;
  if (v14 + v114 < v118) {
    Swift::Int v42 = v14 + v114;
  }
  if (v42 >= v14)
  {
    if (v15 == v42) {
      goto LABEL_65;
    }
    uint64_t v117 = v14;
    uint64_t v43 = v113 + 8 * v15;
    v44 = &IntentHandler;
    Swift::Int v115 = v42;
LABEL_55:
    unint64_t v46 = *(void **)(v11 + 8 * v15);
    uint64_t v47 = v117;
    uint64_t v119 = v43;
    Swift::Int v122 = v15;
    while (1)
    {
      v48 = *(void **)v43;
      id v49 = v46;
      id v50 = v48;
      id v51 = [v49 (SEL)v44[132].count];
      if (!v51) {
        break;
      }
      uint64_t v52 = v51;
      sub_100006B18();

      id v53 = [v50 (SEL)v44[132].count];
      if (!v53)
      {

        swift_bridgeObjectRelease();
        goto LABEL_53;
      }
      v54 = v53;
      sub_100006B18();

      sub_100006930();
      uint64_t v55 = sub_100006C38();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v55 != -1)
      {
        uint64_t v11 = v121;
        Swift::Int v45 = v122;
        v44 = &IntentHandler;
LABEL_54:
        Swift::Int v15 = v45 + 1;
        uint64_t v43 = v119 + 8;
        if (v15 != v115) {
          goto LABEL_55;
        }
        Swift::Int v15 = v115;
        int64_t v9 = v116;
        Swift::Int v14 = v117;
LABEL_65:
        if (v15 < v14) {
          goto LABEL_141;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          int64_t v9 = sub_1000046BC(0, *((void *)v9 + 2) + 1, 1, v9);
        }
        unint64_t v58 = *((void *)v9 + 2);
        unint64_t v57 = *((void *)v9 + 3);
        unint64_t v13 = v58 + 1;
        Swift::Int v123 = v15;
        if (v58 >= v57 >> 1) {
          int64_t v9 = sub_1000046BC((char *)(v57 > 1), v58 + 1, 1, v9);
        }
        *((void *)v9 + 2) = v13;
        uint64_t v59 = v9 + 32;
        BOOL v60 = &v9[16 * v58 + 32];
        *(void *)BOOL v60 = v14;
        *((void *)v60 + 1) = v123;
        if (v58)
        {
          while (2)
          {
            unint64_t v61 = v13 - 1;
            if (v13 >= 4)
            {
              uint64_t v66 = &v59[16 * v13];
              uint64_t v67 = *((void *)v66 - 8);
              uint64_t v68 = *((void *)v66 - 7);
              BOOL v72 = __OFSUB__(v68, v67);
              uint64_t v69 = v68 - v67;
              if (v72) {
                goto LABEL_130;
              }
              uint64_t v71 = *((void *)v66 - 6);
              uint64_t v70 = *((void *)v66 - 5);
              BOOL v72 = __OFSUB__(v70, v71);
              uint64_t v64 = v70 - v71;
              char v65 = v72;
              if (v72) {
                goto LABEL_131;
              }
              unint64_t v73 = v13 - 2;
              uint64_t v74 = &v59[16 * v13 - 32];
              uint64_t v76 = *(void *)v74;
              uint64_t v75 = *((void *)v74 + 1);
              BOOL v72 = __OFSUB__(v75, v76);
              uint64_t v77 = v75 - v76;
              if (v72) {
                goto LABEL_133;
              }
              BOOL v72 = __OFADD__(v64, v77);
              uint64_t v78 = v64 + v77;
              if (v72) {
                goto LABEL_136;
              }
              if (v78 >= v69)
              {
                uint64_t v96 = &v59[16 * v61];
                uint64_t v98 = *(void *)v96;
                uint64_t v97 = *((void *)v96 + 1);
                BOOL v72 = __OFSUB__(v97, v98);
                uint64_t v99 = v97 - v98;
                if (v72) {
                  goto LABEL_140;
                }
                BOOL v89 = v64 < v99;
              }
              else
              {
LABEL_84:
                if (v65) {
                  goto LABEL_132;
                }
                unint64_t v73 = v13 - 2;
                uint64_t v79 = &v59[16 * v13 - 32];
                uint64_t v81 = *(void *)v79;
                uint64_t v80 = *((void *)v79 + 1);
                BOOL v82 = __OFSUB__(v80, v81);
                uint64_t v83 = v80 - v81;
                char v84 = v82;
                if (v82) {
                  goto LABEL_135;
                }
                uint64_t v85 = &v59[16 * v61];
                uint64_t v87 = *(void *)v85;
                uint64_t v86 = *((void *)v85 + 1);
                BOOL v72 = __OFSUB__(v86, v87);
                uint64_t v88 = v86 - v87;
                if (v72) {
                  goto LABEL_138;
                }
                if (__OFADD__(v83, v88)) {
                  goto LABEL_139;
                }
                if (v83 + v88 < v64) {
                  goto LABEL_96;
                }
                BOOL v89 = v64 < v88;
              }
              if (v89) {
                unint64_t v61 = v73;
              }
            }
            else
            {
              if (v13 == 3)
              {
                uint64_t v63 = *((void *)v9 + 4);
                uint64_t v62 = *((void *)v9 + 5);
                BOOL v72 = __OFSUB__(v62, v63);
                uint64_t v64 = v62 - v63;
                char v65 = v72;
                goto LABEL_84;
              }
              uint64_t v90 = *((void *)v9 + 4);
              uint64_t v91 = *((void *)v9 + 5);
              BOOL v72 = __OFSUB__(v91, v90);
              uint64_t v83 = v91 - v90;
              char v84 = v72;
LABEL_96:
              if (v84) {
                goto LABEL_134;
              }
              v92 = &v59[16 * v61];
              uint64_t v94 = *(void *)v92;
              uint64_t v93 = *((void *)v92 + 1);
              BOOL v72 = __OFSUB__(v93, v94);
              uint64_t v95 = v93 - v94;
              if (v72) {
                goto LABEL_137;
              }
              if (v95 < v83) {
                goto LABEL_14;
              }
            }
            unint64_t v100 = v61 - 1;
            if (v61 - 1 >= v13)
            {
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
              goto LABEL_149;
            }
            if (!v11) {
              goto LABEL_152;
            }
            v101 = &v59[16 * v100];
            uint64_t v102 = *(void *)v101;
            unint64_t v103 = &v59[16 * v61];
            uint64_t v104 = *((void *)v103 + 1);
            sub_100004244((void **)(v11 + 8 * *(void *)v101), (id *)(v11 + 8 * *(void *)v103), v11 + 8 * v104, v120);
            if (v1) {
              goto LABEL_124;
            }
            if (v104 < v102) {
              goto LABEL_127;
            }
            if (v61 > *((void *)v9 + 2)) {
              goto LABEL_128;
            }
            *(void *)v101 = v102;
            *(void *)&v59[16 * v100 + 8] = v104;
            unint64_t v105 = *((void *)v9 + 2);
            if (v61 >= v105) {
              goto LABEL_129;
            }
            unint64_t v13 = v105 - 1;
            memmove(&v59[16 * v61], v103 + 16, 16 * (v105 - 1 - v61));
            *((void *)v9 + 2) = v105 - 1;
            if (v105 <= 2) {
              goto LABEL_14;
            }
            continue;
          }
        }
        unint64_t v13 = 1;
LABEL_14:
        Swift::Int v12 = v118;
        Swift::Int v10 = v123;
        if (v123 >= v118) {
          goto LABEL_113;
        }
        goto LABEL_15;
      }
      uint64_t v11 = v121;
      Swift::Int v45 = v122;
      if (!v121) {
        goto LABEL_151;
      }
      uint64_t v56 = *(void **)v43;
      unint64_t v46 = *(void **)(v43 + 8);
      *(void *)uint64_t v43 = v46;
      *(void *)(v43 + 8) = v56;
      v43 -= 8;
      ++v47;
      v44 = &IntentHandler;
      if (v122 == v47) {
        goto LABEL_54;
      }
    }

LABEL_53:
    uint64_t v11 = v121;
    Swift::Int v45 = v122;
    goto LABEL_54;
  }
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
  sub_100006CE8();
  __break(1u);
}

void sub_100003C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
LABEL_6:
    uint64_t v7 = *(void **)(v5 + 8 * v4);
    uint64_t v8 = a1;
    uint64_t v9 = v6;
    while (1)
    {
      Swift::Int v10 = *(void **)v9;
      id v11 = v7;
      id v12 = v10;
      if (![v11 isInternal])
      {

LABEL_5:
        ++v4;
        v6 += 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_6;
      }
      unsigned __int8 v13 = [v12 isInternal];

      if (v13) {
        goto LABEL_5;
      }
      if (!v5) {
        break;
      }
      Swift::Int v14 = *(void **)v9;
      uint64_t v7 = *(void **)(v9 + 8);
      *(void *)uint64_t v9 = v7;
      *(void *)(v9 + 8) = v14;
      v9 -= 8;
      if (v4 == ++v8) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
}

void sub_100003D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v20 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
LABEL_6:
    uint64_t v6 = *(void **)(v20 + 8 * v4);
    uint64_t v7 = a1;
    uint64_t v19 = v5;
    uint64_t v21 = v4;
    while (1)
    {
      uint64_t v8 = *(void **)v5;
      id v9 = v6;
      id v10 = v8;
      id v11 = [v9 name];
      if (!v11) {
        break;
      }
      id v12 = v11;
      sub_100006B18();

      id v13 = [v10 name];
      if (!v13)
      {

        swift_bridgeObjectRelease();
LABEL_5:
        ++v4;
        uint64_t v5 = v19 + 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_6;
      }
      Swift::Int v14 = v13;
      sub_100006B18();

      sub_100006930();
      uint64_t v15 = sub_100006C38();

      swift_bridgeObjectRelease();
      uint64_t v4 = v21;
      swift_bridgeObjectRelease();
      if (v15 != -1) {
        goto LABEL_5;
      }
      if (!v20)
      {
        __break(1u);
        return;
      }
      Swift::Int v16 = *(void **)v5;
      uint64_t v6 = *(void **)(v5 + 8);
      *(void *)uint64_t v5 = v6;
      *(void *)(v5 + 8) = v16;
      v5 -= 8;
      if (v21 == ++v7) {
        goto LABEL_5;
      }
    }

    goto LABEL_5;
  }
}

uint64_t sub_100003F0C(id *__src, id *a2, unint64_t a3, void **a4)
{
  id v36 = __src;
  uint64_t v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = (char *)a2 - (char *)__src;
  int64_t v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v8 = (char *)a2 - (char *)__src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 3;
  Swift::Int v35 = a4;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7) {
      goto LABEL_52;
    }
    if (a4 != a2 || &a2[v12] <= a4) {
      memmove(a4, a2, 8 * v12);
    }
    v23 = &a4[v12];
    id v34 = (char *)v23;
    id v36 = v5;
    if (v6 >= v5 || v10 < 8)
    {
LABEL_51:
      sub_1000047B8((void **)&v36, (const void **)&v35, &v34);
      return 1;
    }
    uint64_t v24 = (id *)(a3 - 8);
    BOOL v25 = v5;
    id v32 = v6;
    while (1)
    {
      Swift::Int v26 = v24 + 1;
      Swift::Int v27 = *--v25;
      id v28 = *(v23 - 1);
      id v29 = v27;
      if ([v28 isInternal])
      {
        unsigned __int8 v30 = [v29 isInternal];

        if ((v30 & 1) == 0)
        {
          if (v26 != v5 || v24 >= v5) {
            *uint64_t v24 = *v25;
          }
          id v36 = v25;
          if (v25 <= v32) {
            goto LABEL_51;
          }
          goto LABEL_48;
        }
      }
      else
      {
      }
      id v34 = (char *)(v23 - 1);
      if (v26 < v23 || v24 >= v23 || v26 != v23) {
        *uint64_t v24 = *(v23 - 1);
      }
      BOOL v25 = v5;
      --v23;
      if (v5 <= v32) {
        goto LABEL_51;
      }
LABEL_48:
      --v24;
      uint64_t v5 = v25;
      if (v23 <= a4) {
        goto LABEL_51;
      }
    }
  }
  if (v7 >= -7)
  {
    if (a4 != __src || &__src[v9] <= a4) {
      memmove(a4, __src, 8 * v9);
    }
    id v13 = &a4[v9];
    id v34 = (char *)v13;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      Swift::Int v14 = &IntentHandler;
      uint64_t v15 = a4;
      while (1)
      {
        Swift::Int v16 = v6;
        id v17 = *v15;
        id v18 = *v5;
        id v19 = v17;
        if (![v18 (SEL)v14[149].count]) {
          break;
        }
        unsigned __int8 v20 = [v19 (SEL)v14[149].count];

        if (v20) {
          goto LABEL_20;
        }
        uint64_t v21 = v5 + 1;
        id v22 = v16;
        if (v16 >= v5 && v16 < v21)
        {
          Swift::Int v14 = &IntentHandler;
          if (v16 != v5) {
            void *v16 = *v5;
          }
          goto LABEL_24;
        }
        void *v16 = *v5;
LABEL_23:
        Swift::Int v14 = &IntentHandler;
LABEL_24:
        uint64_t v6 = v22 + 1;
        if (v15 < v13)
        {
          uint64_t v5 = v21;
          if ((unint64_t)v21 < a3) {
            continue;
          }
        }
        id v36 = v6;
        goto LABEL_51;
      }

LABEL_20:
      id v22 = v16;
      if (v16 != v15) {
        void *v16 = *v15;
      }
      Swift::Int v35 = ++v15;
      uint64_t v21 = v5;
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_52:
  uint64_t result = sub_100006D38();
  __break(1u);
  return result;
}

uint64_t sub_100004244(void **__src, id *a2, unint64_t a3, void **__dst)
{
  uint64_t v4 = __dst;
  uint64_t v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = (char *)a2 - (char *)__src;
  int64_t v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v8 = (char *)a2 - (char *)__src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 3;
  v44 = __src;
  uint64_t v43 = __dst;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7) {
      goto LABEL_53;
    }
    if (__dst != a2 || &a2[v12] <= __dst) {
      memmove(__dst, a2, 8 * v12);
    }
    BOOL v25 = &v4[v12];
    Swift::Int v42 = v25;
    v44 = v5;
    if (v6 >= v5 || v10 < 8)
    {
LABEL_52:
      sub_1000047B8((void **)&v44, (const void **)&v43, &v42);
      return 1;
    }
    Swift::Int v26 = (void **)(a3 - 8);
    Swift::Int v27 = v5;
    while (1)
    {
      Swift::Int v39 = v26 + 1;
      uint64_t v41 = v5;
      id v28 = *--v27;
      id v29 = *(v25 - 1);
      id v30 = v28;
      id v31 = [v29 name];
      if (!v31) {
        break;
      }
      id v32 = v31;
      sub_100006B18();

      id v33 = [v30 name];
      if (!v33)
      {

        swift_bridgeObjectRelease();
LABEL_45:
        Swift::Int v42 = v25 - 1;
        Swift::Int v27 = v41;
        if (v39 < v25 || v26 >= v25 || v39 != v25) {
          *Swift::Int v26 = *(v25 - 1);
        }
        --v25;
        goto LABEL_50;
      }
      id v34 = v33;
      sub_100006B18();

      sub_100006930();
      uint64_t v35 = sub_100006C38();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v35 != -1) {
        goto LABEL_45;
      }
      if (v39 != v41 || v26 >= v41) {
        *Swift::Int v26 = *v27;
      }
      v44 = v27;
LABEL_50:
      if (v27 > v6)
      {
        --v26;
        uint64_t v5 = v27;
        if (v25 > v4) {
          continue;
        }
      }
      goto LABEL_52;
    }

    goto LABEL_45;
  }
  if (v7 >= -7)
  {
    unint64_t v13 = a3;
    if (__dst != __src || &__src[v9] <= __dst) {
      memmove(__dst, __src, 8 * v9);
    }
    Swift::Int v38 = &v4[v9];
    Swift::Int v42 = v38;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      Swift::Int v14 = &IntentHandler;
      while (1)
      {
        id v40 = v5;
        uint64_t v15 = *v4;
        id v16 = *v5;
        id v17 = v15;
        id v18 = [v16 (SEL)v14[132].count];
        if (v18)
        {
          id v19 = v18;
          sub_100006B18();

          id v20 = [v17 (SEL)v14[132].count];
          if (v20)
          {
            uint64_t v21 = v20;
            sub_100006B18();

            unint64_t v13 = a3;
            sub_100006930();
            uint64_t v22 = sub_100006C38();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            BOOL v23 = v22 == -1;
            Swift::Int v14 = &IntentHandler;
            if (v23)
            {
              uint64_t v24 = v40 + 1;
              if (v6 < v40 || v6 >= v24 || v6 != v40) {
                *uint64_t v6 = *v40;
              }
              goto LABEL_26;
            }
          }
          else
          {

            swift_bridgeObjectRelease();
            Swift::Int v14 = &IntentHandler;
          }
        }
        else
        {
        }
        if (v6 != v4) {
          *uint64_t v6 = *v4;
        }
        uint64_t v43 = ++v4;
        uint64_t v24 = v40;
LABEL_26:
        ++v6;
        if (v4 < v38)
        {
          uint64_t v5 = v24;
          if ((unint64_t)v24 < v13) {
            continue;
          }
        }
        v44 = v6;
        goto LABEL_52;
      }
    }
    goto LABEL_52;
  }
LABEL_53:
  uint64_t result = sub_100006D38();
  __break(1u);
  return result;
}

char *sub_1000046BC(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000684C(&qword_10000C688);
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
  unint64_t v13 = v10 + 32;
  Swift::Int v14 = a4 + 32;
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

char *sub_1000047B8(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_100006D38();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_100004874(uint64_t a1)
{
  return sub_1000046BC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100004888(uint64_t a1, char a2)
{
  Swift::Int v3 = v2;
  uint64_t v5 = *v2;
  sub_10000684C(&qword_10000C660);
  char v37 = a2;
  uint64_t v6 = sub_100006D18();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  id v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          Swift::Int v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    char v32 = *(unsigned char *)(*(void *)(v5 + 56) + v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_100006D88();
    sub_100006B28();
    uint64_t result = sub_100006D98();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    id v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *id v18 = v31;
    v18[1] = v30;
    *(unsigned char *)(*(void *)(v7 + 56) + v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  Swift::Int v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *Swift::Int v3 = v7;
  return result;
}

unint64_t sub_100004B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100006D68() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100006D68() & 1) == 0);
    }
  }
  return v6;
}

void *sub_100004C78()
{
  uint64_t v1 = v0;
  sub_10000684C(&qword_10000C660);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100006D08();
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
    unint64_t v16 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    LOBYTE(v16) = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + 16 * v15);
    *unint64_t v19 = v18;
    v19[1] = v17;
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = (_BYTE)v16;
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

uint64_t sub_100004E24(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100006CF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

void (*sub_100004EA0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100004F50(v6, a2, a3);
  return sub_100004F08;
}

void sub_100004F08(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100004F50(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100006C68();
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
    return sub_100004FD0;
  }
  __break(1u);
  return result;
}

void sub_100004FD0(id *a1)
{
}

uint64_t sub_100004FD8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100006CF8();
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
    uint64_t v10 = sub_100006CF8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100006988();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10000684C(&qword_10000C670);
          unint64_t v12 = sub_100004EA0(v16, i, a3);
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
    sub_1000068F4(0, &qword_10000C638);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100006D38();
  __break(1u);
  return result;
}

uint64_t sub_1000051EC(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_100005200()
{
  unint64_t v52 = sub_100002118((uint64_t)_swiftEmptyArrayStorage);
  id v0 = [objc_allocWithZone((Class)BCBatteryDeviceController) init];
  id v1 = [v0 connectedDevices];

  if (!v1) {
    goto LABEL_70;
  }
  uint64_t v49 = sub_1000068F4(0, &qword_10000C638);
  unint64_t v2 = sub_100006B68();

  v53[0] = (uint64_t)_swiftEmptyArrayStorage;
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_4;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v8 = (uint64_t)_swiftEmptyArrayStorage;
    unint64_t v55 = (unint64_t)_swiftEmptyArrayStorage;
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_57;
    }
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_100006CF8();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_18;
  }
LABEL_4:
  if (v3 < 1)
  {
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
LABEL_71:
    sub_100006D78();
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_100006C68();
    }
    else {
      id v5 = *(id *)(v2 + 8 * i + 32);
    }
    unint64_t v6 = v5;
    if (objc_msgSend(v5, "isInternal", v49)) {
      goto LABEL_7;
    }
    id v7 = [v6 accessoryIdentifier];
    if (v7)
    {

LABEL_7:
      sub_100006C98();
      sub_100006CC8();
      sub_100006CD8();
      sub_100006CA8();
      continue;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = v53[0];
  unint64_t v55 = (unint64_t)_swiftEmptyArrayStorage;
  if (v53[0] < 0)
  {
LABEL_57:
    while (2)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_100006CF8();
      swift_release();
      if (!v9) {
        goto LABEL_58;
      }
LABEL_21:
      unint64_t v10 = v8 & 0xC000000000000001;
      uint64_t v11 = 4;
      unint64_t v50 = v8 & 0xC000000000000001;
      uint64_t v51 = v8;
LABEL_27:
      if (v10) {
        id v13 = (id)sub_100006C68();
      }
      else {
        id v13 = *(id *)(v8 + 8 * v11);
      }
      id v12 = v13;
      uint64_t v14 = v11 - 3;
      if (__OFADD__(v11 - 4, 1))
      {
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        __break(1u);
        continue;
      }
      break;
    }
    if (sub_100006BD8() & 1) != 0 || (sub_100006BE8())
    {
      id v15 = [v12 accessoryIdentifier:v49];
      if (v15)
      {
        unint64_t v16 = v15;
        uint64_t v17 = sub_100006B18();
        uint64_t v19 = v18;

        if (*(void *)(v52 + 16))
        {
          swift_bridgeObjectRetain();
          sub_100002988(v17, v19);
          if (v20)
          {

            swift_bridgeObjectRelease_n();
            goto LABEL_26;
          }
          swift_bridgeObjectRelease();
        }
        uint64_t v21 = v9;
        if (![v12 synthesizedRepresentativeDevice]) {
          goto LABEL_69;
        }
        sub_100006B48();
        if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100006B98();
        }
        sub_100006BB8();
        sub_100006B88();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v53[0] = v52;
        unint64_t v24 = sub_100002988(v17, v19);
        uint64_t v25 = *(void *)(v52 + 16);
        BOOL v26 = (v23 & 1) == 0;
        uint64_t v27 = v25 + v26;
        if (__OFADD__(v25, v26)) {
          goto LABEL_55;
        }
        uint64_t v8 = v23;
        if (*(void *)(v52 + 24) >= v27)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_100004C78();
          }
        }
        else
        {
          sub_100004888(v27, isUniquelyReferenced_nonNull_native);
          unint64_t v28 = sub_100002988(v17, v19);
          if ((v8 & 1) != (v29 & 1)) {
            goto LABEL_71;
          }
          unint64_t v24 = v28;
        }
        uint64_t v30 = (void *)v53[0];
        unint64_t v52 = v53[0];
        if (v8)
        {
          *(unsigned char *)(*(void *)(v53[0] + 56) + v24) = 1;
        }
        else
        {
          *(void *)(v53[0] + 8 * (v24 >> 6) + 64) |= 1 << v24;
          uint64_t v31 = (uint64_t *)(v30[6] + 16 * v24);
          uint64_t *v31 = v17;
          v31[1] = v19;
          *(unsigned char *)(v30[7] + v24) = 1;
          uint64_t v32 = v30[2];
          BOOL v33 = __OFADD__(v32, 1);
          uint64_t v34 = v32 + 1;
          if (v33) {
            goto LABEL_56;
          }
          v30[2] = v34;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v9 = v21;
        unint64_t v10 = v50;
        uint64_t v8 = v51;
LABEL_26:
        ++v11;
        if (v14 == v9)
        {
          swift_release();
          unint64_t v35 = v55;
          if ((v55 & 0x8000000000000000) == 0) {
            goto LABEL_59;
          }
          goto LABEL_67;
        }
        goto LABEL_27;
      }
    }
    else
    {
      id v12 = v12;
      sub_100006B48();
      if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_100006B98();
      }
      sub_100006BB8();
      sub_100006B88();
    }

    goto LABEL_26;
  }
LABEL_19:
  if ((v8 & 0x4000000000000000) != 0) {
    goto LABEL_57;
  }
  uint64_t v9 = *(void *)(v8 + 16);
  swift_retain();
  if (v9) {
    goto LABEL_21;
  }
LABEL_58:
  swift_release();
  unint64_t v35 = (unint64_t)_swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
    goto LABEL_67;
  }
LABEL_59:
  if ((v35 & 0x4000000000000000) != 0)
  {
LABEL_67:
    swift_bridgeObjectRetain_n();
    uint64_t v36 = (uint64_t)sub_100002A00(v35);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v36 = v35 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
  }
  v53[0] = v36;
  sub_1000022B4(v53);
  swift_bridgeObjectRelease();
  uint64_t v54 = v53[0];
  sub_10000222C((unint64_t *)&v54);
  swift_bridgeObjectRelease();
  if (qword_10000C6F0 != -1) {
    swift_once();
  }
  uint64_t v37 = sub_100006AF8();
  sub_100006814(v37, (uint64_t)qword_10000C6F8);
  swift_retain();
  Swift::Int v38 = sub_100006AD8();
  os_log_type_t v39 = sub_100006BC8();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = swift_slowAlloc();
    v53[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v40 = 136315394;
    swift_retain();
    uint64_t v41 = sub_100006B78();
    unint64_t v43 = v42;
    swift_release();
    sub_100002330(v41, v43, v53);
    sub_100006C18();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 12) = 2080;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_100006B78();
    unint64_t v46 = v45;
    swift_bridgeObjectRelease();
    sub_100002330(v44, v46, v53);
    sub_100006C18();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "IntentHandler|connectedDevices: %s, preprocessedConnectedDevices: %s", (uint8_t *)v40, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  swift_beginAccess();
  unint64_t v47 = v54;
  swift_bridgeObjectRelease();
  return v47;
}

void sub_100005998(id isa, uint64_t a2)
{
  uint64_t v44 = a2;
  if (qword_10000C6F0 != -1) {
    goto LABEL_30;
  }
  while (1)
  {
    uint64_t v3 = sub_100006AF8();
    sub_100006814(v3, (uint64_t)qword_10000C6F8);
    id v4 = isa;
    id v5 = sub_100006AD8();
    os_log_type_t v6 = sub_100006BC8();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)id v7 = 138412290;
      isa = [v4 automatic];
      if (!isa)
      {
        sub_1000068F4(0, &qword_10000C640);
        isa = sub_100006C08(2).super.super.isa;
      }
      v47[0] = isa;
      sub_100006C18();
      *uint64_t v8 = isa;

      _os_log_impl((void *)&_mh_execute_header, v5, v6, "IntentHandler|provideDeviceOptionsCollection|IsAutomatic : %@", v7, 0xCu);
      sub_10000684C(&qword_10000C648);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v9 = sub_100005200();
    uint64_t v10 = v9;
    if ((unint64_t)v9 >> 62)
    {
      if (v9 < 0) {
        isa = (id)v9;
      }
      else {
        isa = (id)(v9 & 0xFFFFFFFFFFFFFF8);
      }
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_100006CF8();
      swift_bridgeObjectRelease();
      if (!v11)
      {
LABEL_35:
        swift_bridgeObjectRelease();
        id v41 = objc_allocWithZone((Class)INObjectCollection);
        sub_1000068F4(0, &qword_10000C650);
        Class v42 = sub_100006B58().super.isa;
        swift_bridgeObjectRelease();
        id v43 = [v41 initWithItems:v42];

        (*(void (**)(uint64_t, id, void))(v44 + 16))(v44, v43, 0);
        return;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v11) {
        goto LABEL_35;
      }
    }
    sub_100006CB8();
    if (v11 < 0) {
      break;
    }
    uint64_t v12 = 0;
    unint64_t v45 = v10 & 0xC000000000000001;
    uint64_t v46 = v10;
    while (v11 != v12)
    {
      if (v45) {
        id v22 = (id)sub_100006C68();
      }
      else {
        id v22 = *(id *)(v10 + 8 * v12 + 32);
      }
      uint64_t v23 = v22;
      id v24 = [v22 name:v44];
      if (v24)
      {
        uint64_t v25 = v24;
        sub_100006B18();
      }
      id v26 = [v23 identifier];
      if (v26)
      {
        uint64_t v27 = v26;
        sub_100006B18();
        uint64_t v29 = v28;

        if (v29)
        {
          NSString v30 = sub_100006B08();
          swift_bridgeObjectRelease();
        }
        else
        {
          NSString v30 = 0;
        }
      }
      else
      {
        NSString v30 = 0;
      }
      id v31 = objc_allocWithZone((Class)IntentDevice);
      NSString v32 = sub_100006B08();
      swift_bridgeObjectRelease();
      id v33 = [v31 initWithIdentifier:v30 displayString:v32];

      sub_1000068F4(0, &qword_10000C640);
      Class v34 = sub_100006BF8(0).super.super.isa;
      [v33 setIsSynthesized:v34];

      id v35 = [v23 identifier];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = sub_100006B18();
        uint64_t v39 = v38;

        v47[0] = v37;
        v47[1] = v39;
        sub_100006930();
        LOBYTE(v36) = sub_100006C48();
        swift_bridgeObjectRelease();
        if (v36)
        {
          Class v40 = sub_100006BF8(1).super.super.isa;
          [v33 setIsSynthesized:v40];
        }
      }
      id v13 = [objc_allocWithZone((Class)NSNumber) initWithBool:[v23 isLowBattery]];
      [v33 setIsLowBattery:v13];

      id v14 = [objc_allocWithZone((Class)NSNumber) initWithBool:[v23 isLowPowerModeActive]];
      [v33 setIsLowPowerModeActive:v14];

      id v15 = [objc_allocWithZone((Class)NSNumber) initWithInteger:[v23 percentCharge]];
      [v33 setPercentCharge:v15];

      LOBYTE(v47[0]) = 0;
      NSString v16 = [v23 batteryWidgetGlyphName:v47];
      if (!v16)
      {
        sub_100006B18();
        NSString v16 = sub_100006B08();
        swift_bridgeObjectRelease();
      }
      ++v12;
      [v33 setSystemImageName:v16];

      id v17 = [objc_allocWithZone((Class)NSNumber) initWithBool:LOBYTE(v47[0])];
      [v33 setIsCustomImage:v17];

      id v18 = [v23 accessoryIdentifier];
      [v33 setAccessoryIdentifier:v18];

      id v19 = [objc_allocWithZone((Class)NSNumber) initWithBool:[v23 isInternal]];
      [v33 setIsInternal:v19];

      id v20 = [objc_allocWithZone((Class)NSNumber) initWithInteger:[v23 parts]];
      [v33 setParts:v20];

      id v21 = [objc_allocWithZone((Class)NSNumber) initWithBool:[v23 isCharging]];
      [v33 setIsCharging:v21];

      sub_100006C98();
      isa = (id)_swiftEmptyArrayStorage[2];
      sub_100006CC8();
      sub_100006CD8();
      sub_100006CA8();
      uint64_t v10 = v46;
      if (v11 == v12) {
        goto LABEL_35;
      }
    }
    __break(1u);
LABEL_30:
    swift_once();
  }
  __break(1u);
}

id sub_100006180(void *a1)
{
  if (qword_10000C6F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100006AF8();
  sub_100006814(v2, (uint64_t)qword_10000C6F8);
  id v3 = a1;
  id v4 = sub_100006AD8();
  os_log_type_t v5 = sub_100006BC8();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    id v7 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v6 = 138412290;
    Class isa = (Class)[v3 automatic];
    if (!isa)
    {
      sub_1000068F4(0, &qword_10000C640);
      Class isa = sub_100006C08(2).super.super.isa;
    }
    Class v36 = isa;
    sub_100006C18();
    *id v7 = isa;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "IntentHandler|DefaultDevice|IsAutomatic : %@", v6, 0xCu);
    sub_10000684C(&qword_10000C648);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v9 = [objc_allocWithZone((Class)BCBatteryDeviceController) init];
  id v10 = [v9 connectedDevices];

  if (!v10) {
LABEL_30:
  }
    __break(1u);
  sub_1000068F4(0, &qword_10000C638);
  unint64_t v11 = sub_100006B68();

  if (!(v11 >> 62))
  {
    if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_11;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_100006CF8();
  swift_bridgeObjectRelease();
  if (!v34) {
    goto LABEL_26;
  }
LABEL_11:
  if ((v11 & 0xC000000000000001) != 0)
  {
    id v12 = (id)sub_100006C68();
    goto LABEL_14;
  }
  if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_30;
  }
  id v12 = *(id *)(v11 + 32);
LABEL_14:
  id v13 = v12;
  swift_bridgeObjectRelease();
  id v14 = [v13 name];
  if (v14)
  {
    id v15 = v14;
    sub_100006B18();
  }
  id v16 = [v13 identifier:v36];
  if (v16)
  {
    id v17 = v16;
    sub_100006B18();
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = 0;
  }
  if (v19)
  {
    NSString v20 = sub_100006B08();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v20 = 0;
  }
  id v21 = objc_allocWithZone((Class)IntentDevice);
  NSString v22 = sub_100006B08();
  swift_bridgeObjectRelease();
  id v23 = [v21 initWithIdentifier:v20 displayString:v22];

  sub_1000068F4(0, &qword_10000C640);
  Class v24 = sub_100006BF8(0).super.super.isa;
  [v23 setIsSynthesized:v24];

  id v25 = [objc_allocWithZone((Class)NSNumber) initWithBool:[v13 isLowBattery]];
  [v23 setIsLowBattery:v25];

  id v26 = [objc_allocWithZone((Class)NSNumber) initWithBool:[v13 isLowPowerModeActive]];
  [v23 setIsLowPowerModeActive:v26];

  id v27 = [objc_allocWithZone((Class)NSNumber) initWithInteger:[v13 percentCharge]];
  [v23 setPercentCharge:v27];

  LOBYTE(v36) = 0;
  NSString v28 = [v13 batteryWidgetGlyphName:&v36];
  if (!v28)
  {
    sub_100006B18();
    NSString v28 = sub_100006B08();
    swift_bridgeObjectRelease();
  }
  [v23 setSystemImageName:v28];

  id v29 = [objc_allocWithZone((Class)NSNumber) initWithBool:v36];
  [v23 setIsCustomImage:v29];

  id v30 = [v13 accessoryIdentifier];
  [v23 setAccessoryIdentifier:v30];

  id v31 = [objc_allocWithZone((Class)NSNumber) initWithBool:[v13 isInternal]];
  [v23 setIsInternal:v31];

  id v32 = [objc_allocWithZone((Class)NSNumber) initWithInteger:[v13 parts]];
  [v23 setParts:v32];

  id v33 = [objc_allocWithZone((Class)NSNumber) initWithBool:[v13 isCharging]];
  [v23 setIsCharging:v33];

  return v23;
}

uint64_t sub_100006814(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000684C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100006890(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000068F4(uint64_t a1, unint64_t *a2)
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

unint64_t sub_100006930()
{
  unint64_t result = qword_10000C658;
  if (!qword_10000C658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C658);
  }
  return result;
}

unint64_t sub_100006988()
{
  unint64_t result = qword_10000C678;
  if (!qword_10000C678)
  {
    sub_1000069E4(&qword_10000C670);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C678);
  }
  return result;
}

uint64_t sub_1000069E4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006A2C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006AD8()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006AE8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100006AF8()
{
  return type metadata accessor for Logger();
}

NSString sub_100006B08()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006B18()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006B28()
{
  return String.hash(into:)();
}

Swift::Int sub_100006B38()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006B48()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100006B58()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100006B68()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006B78()
{
  return Array.description.getter();
}

uint64_t sub_100006B88()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100006B98()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100006BA8()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100006BB8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100006BC8()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100006BD8()
{
  return BCBatteryDevice.isLeftHeadPhone.getter();
}

uint64_t sub_100006BE8()
{
  return BCBatteryDevice.isRightHeadPhone.getter();
}

NSNumber sub_100006BF8(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

NSNumber sub_100006C08(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_100006C18()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006C28()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006C38()
{
  return StringProtocol.localizedStandardCompare<A>(_:)();
}

uint64_t sub_100006C48()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_100006C58()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006C68()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100006C88()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006C98()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100006CA8()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100006CB8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100006CC8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100006CD8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100006CE8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006CF8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100006D08()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100006D18()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100006D28()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100006D38()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100006D58(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100006D68()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006D78()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100006D88()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006D98()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}