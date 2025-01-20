uint64_t sub_2529396F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  void __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_252951DF8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2529398AC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_252951EA8();
  if (!v8)
  {
    sub_252951F18();
    __break(1u);
LABEL_17:
    result = sub_252951F78();
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

uint64_t sub_2529398AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_252939944(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_252939B24(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_252939B24(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_252939944(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_252939ABC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_252951E58();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_252951F18();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_252951B18();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_252951F78();
    __break(1u);
LABEL_14:
    uint64_t result = sub_252951F18();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_252939ABC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C33370);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_252939B24(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C33370);
    v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x263F8EE78];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
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
  uint64_t result = sub_252951F78();
  __break(1u);
  return result;
}

char *sub_252939C74(uint64_t a1)
{
  return sub_2528C4204(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_252939C88(uint64_t a1)
{
  return sub_2528C45A8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_252939C9C(void *a1)
{
  return sub_2528C4A0C(0, a1[2], 0, a1);
}

void *sub_252939CB0(void *a1)
{
  return sub_2528C4B1C(0, a1[2], 0, a1);
}

void *sub_252939CC4(void *a1)
{
  return sub_2528C5240(0, a1[2], 0, a1);
}

uint64_t sub_252939CD8(unint64_t a1)
{
  return sub_2528C4584(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_252939CEC(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C327F8);
  uint64_t result = sub_252951F58();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    int64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *int64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_252952188();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_252939FA4(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_252923060(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25293A0E0();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_252939CEC(result, a3 & 1);
  uint64_t result = sub_252923060(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_252952128();
  __break(1u);
  return result;
}

void *sub_25293A0E0()
{
  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C327F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_252951F48();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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

uint64_t sub_25293A284(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *int64_t v9 = v2;
  v9[1] = sub_2528A91AC;
  return sub_252933C44(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_25293A358(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_2528C4584(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(sub_252951A08() - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = sub_252951F78();
  __break(1u);
  return result;
}

char *sub_25293A540(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *((void *)v4 + 3) >> 1)
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t result = sub_2528C4204(result, v11, 1, v4);
    unint64_t v4 = result;
    if (!v8) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_27;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    uint64_t result = &v4[4 * a1 + 32];
    uint64_t v15 = &v4[4 * a2 + 32];
    if (a1 != a2 || result >= &v15[4 * v14]) {
      uint64_t result = (char *)memmove(result, v15, 4 * v14);
    }
    uint64_t v16 = *((void *)v4 + 2);
    BOOL v13 = __OFADD__(v16, v8);
    uint64_t v17 = v16 + v8;
    if (!v13)
    {
      *((void *)v4 + 2) = v17;
LABEL_21:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  uint64_t result = (char *)sub_252951F78();
  __break(1u);
  return result;
}

uint64_t sub_25293A69C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_25293284C(a1, a2);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v6 + 16);
  if (!v8) {
    goto LABEL_10;
  }
  if (*(uint64_t *)(v6 + 32) > 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v8 == 1)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return a3;
  }
  uint64_t v10 = 5;
  while (1)
  {
    uint64_t v9 = v10 - 4;
    if (*(uint64_t *)(v6 + 8 * v10) > 0) {
      break;
    }
    uint64_t v11 = v10 - 3;
    if (__OFADD__(v9, 1)) {
      goto LABEL_15;
    }
    ++v10;
    if (v11 == v8) {
      goto LABEL_10;
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (v9 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_16;
  }
  if (v9 <= 0x7FFFFFFF) {
    return v9;
  }
  __break(1u);
LABEL_15:
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t *sub_25293A7A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_252951A08();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t sub_25293A888(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252951A08();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);

  return v7(v5, v4);
}

uint64_t sub_25293A928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252951A08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25293A9C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252951A08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25293AA58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252951A08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25293AAF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_252951A08();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t sub_25293AB88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25293AB9C);
}

uint64_t sub_25293AB9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252951A08();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_25293AC08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25293AC1C);
}

uint64_t sub_25293AC1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_252951A08();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t _s12PreprocessorVMa()
{
  uint64_t result = qword_269C33398;
  if (!qword_269C33398) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25293ACD8()
{
  uint64_t result = sub_252951A08();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25293AD64(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_252951A08();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_252951598();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25293AE80, v1, 0);
}

uint64_t sub_25293AE80()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[3];
  sub_252951588();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  uint64_t v6 = swift_task_alloc();
  v0[11] = v6;
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v1;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[12] = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C333D8);
  *uint64_t v7 = v0;
  v7[1] = sub_25293AF9C;
  uint64_t v9 = v0[10];
  return MEMORY[0x270EE76C0](v0 + 2, v9, &unk_269C333D0, v6, v8);
}

uint64_t sub_25293AF9C()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = *(void *)(*(void *)v1 + 72);
  uint64_t v5 = *(void *)(*(void *)v1 + 64);
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = v2[4];
    uint64_t v7 = sub_25293B1C8;
  }
  else
  {
    uint64_t v8 = v2[4];
    (*(void (**)(void, void))(v2[6] + 8))(v2[7], v2[5]);
    uint64_t v7 = sub_25293B150;
    uint64_t v6 = v8;
  }
  return MEMORY[0x270FA2498](v7, v6, 0);
}

uint64_t sub_25293B150()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_25293B1C8()
{
  (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25293B254(unsigned __int8 *a1)
{
  uint64_t v27 = v2;
  uint64_t v3 = v1;
  v2[2] = v1;
  uint64_t v5 = sub_252951A08();
  v2[3] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[4] = v6;
  uint64_t v25 = swift_task_alloc();
  v2[5] = v25;
  uint64_t v23 = sub_252951598();
  uint64_t v7 = *(void (***)(uint64_t, uint64_t))(v23 - 8);
  uint64_t v8 = swift_task_alloc();
  v2[6] = v8;
  _s12PreprocessorVMa();
  uint64_t v9 = swift_task_alloc();
  v2[7] = v9;
  unsigned __int8 v10 = *a1;
  swift_defaultActor_initialize();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v3 + OBJC_IVAR____TtC5Human17RepetitionCounter_hiddenStates, 1, 1, v5);
  *(unsigned char *)(v3 + 120) = v10;
  sub_252951588();
  ++v7;
  unsigned __int8 v24 = v10;
  sub_252951618();
  uint64_t v11 = *v7;
  (*v7)(v8, v23);
  sub_252951588();
  sub_252951618();
  v11(v8, v23);
  uint64_t v12 = OBJC_IVAR____TtC5Human17RepetitionCounter_preprocessor;
  v2[8] = OBJC_IVAR____TtC5Human17RepetitionCounter_preprocessor;
  sub_25293E9EC(v9, v3 + v12);
  v26[0] = v24;
  _s13PostProcessorCMa();
  swift_allocObject();
  uint64_t v13 = sub_252932B48(v26);
  uint64_t v14 = OBJC_IVAR____TtC5Human17RepetitionCounter_postprocessor;
  v2[9] = OBJC_IVAR____TtC5Human17RepetitionCounter_postprocessor;
  *(void *)(v3 + v14) = v13;
  sub_2529519E8();
  uint64_t v15 = OBJC_IVAR____TtC5Human17RepetitionCounter_initialHiddenStates;
  v2[10] = OBJC_IVAR____TtC5Human17RepetitionCounter_initialHiddenStates;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v3 + v15, v25, v5);
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
  v2[11] = v16;
  objc_msgSend(v16, sel_setComputeUnits_, 0);
  objc_msgSend(v16, sel_setExperimentalMLE5BNNSGraphBackendUsage_, 1);
  if (v24)
  {
    type metadata accessor for Palermo();
    uint64_t v17 = sub_252951268();
    v2[17] = v17;
    v2[18] = *(void *)(v17 - 8);
    uint64_t v18 = swift_task_alloc();
    v2[19] = v18;
    sub_2528C66B4(v18);
    sub_25290A614();
    uint64_t v19 = (void *)swift_task_alloc();
    v2[20] = v19;
    *uint64_t v19 = v2;
    int64_t v20 = sub_25293BB10;
  }
  else
  {
    type metadata accessor for Taormina();
    uint64_t v21 = sub_252951268();
    v2[12] = v21;
    v2[13] = *(void *)(v21 - 8);
    uint64_t v18 = swift_task_alloc();
    v2[14] = v18;
    sub_2528C7840(v18);
    sub_25290A614();
    uint64_t v19 = (void *)swift_task_alloc();
    v2[15] = v19;
    *uint64_t v19 = v2;
    int64_t v20 = sub_25293B788;
  }
  v19[1] = v20;
  return MEMORY[0x270EE7958](v18, v16);
}

uint64_t sub_25293B788(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  uint64_t v5 = (void *)*v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = v4[13];
    uint64_t v7 = v4[14];
    uint64_t v8 = (void *)v4[11];
    uint64_t v9 = v4[12];
    uint64_t v10 = v4[10];
    uint64_t v11 = v4[8];
    uint64_t v12 = v4[4];
    uint64_t v16 = v4[3];
    uint64_t v13 = v4[2];

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v9);
    swift_task_dealloc();
    sub_25293C048(v13 + v11);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13 + v10, v16);
    sub_2528AE5CC(v13 + OBJC_IVAR____TtC5Human17RepetitionCounter_hiddenStates);
    type metadata accessor for RepetitionCounter();
    swift_defaultActor_destroy();
    swift_deallocPartialClassInstance();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v5[1];
    return v14();
  }
  else
  {
    v4[16] = a1;
    return MEMORY[0x270FA2498](sub_25293B9E8, 0, 0);
  }
}

uint64_t sub_25293B9E8()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[2];
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  swift_task_dealloc();
  *(void *)(v2 + 112) = v1;
  return MEMORY[0x270FA2498](sub_25293BA80, v2, 0);
}

uint64_t sub_25293BA80()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 16);
  return v1(v2);
}

uint64_t sub_25293BB10(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  uint64_t v5 = (void *)*v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = v4[18];
    uint64_t v7 = v4[19];
    uint64_t v8 = v4[17];
    uint64_t v10 = v4[10];
    uint64_t v9 = (void *)v4[11];
    uint64_t v11 = v4[8];
    uint64_t v12 = v4[4];
    uint64_t v16 = v4[3];
    uint64_t v13 = v4[2];

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    swift_task_dealloc();
    sub_25293C048(v13 + v11);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13 + v10, v16);
    sub_2528AE5CC(v13 + OBJC_IVAR____TtC5Human17RepetitionCounter_hiddenStates);
    type metadata accessor for RepetitionCounter();
    swift_defaultActor_destroy();
    swift_deallocPartialClassInstance();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = (uint64_t (*)(void))v5[1];
    return v14();
  }
  else
  {
    v4[21] = a1;
    return MEMORY[0x270FA2498](sub_25293BD74, 0, 0);
  }
}

uint64_t sub_25293BD74()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[2];
  (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  swift_task_dealloc();
  *(void *)(v2 + 112) = v1;
  return MEMORY[0x270FA2498](sub_25293EA50, v2, 0);
}

uint64_t sub_25293BE0C()
{
  sub_25293C048(v0 + OBJC_IVAR____TtC5Human17RepetitionCounter_preprocessor);
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC5Human17RepetitionCounter_initialHiddenStates;
  uint64_t v2 = sub_252951A08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_2528AE5CC(v0 + OBJC_IVAR____TtC5Human17RepetitionCounter_hiddenStates);
  swift_defaultActor_destroy();

  return swift_defaultActor_deallocate();
}

uint64_t sub_25293BEC0()
{
  return type metadata accessor for RepetitionCounter();
}

uint64_t type metadata accessor for RepetitionCounter()
{
  uint64_t result = qword_269C333A8;
  if (!qword_269C333A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_25293BF14()
{
  _s12PreprocessorVMa();
  if (v0 <= 0x3F)
  {
    sub_252951A08();
    if (v1 <= 0x3F)
    {
      sub_25290062C();
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t sub_25293C048(uint64_t a1)
{
  uint64_t v2 = _s12PreprocessorVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25293C0A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  uint64_t v5 = sub_252951A08();
  v3[10] = v5;
  v3[11] = *(void *)(v5 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25293C1C8, a2, 0);
}

uint64_t sub_25293C1C8()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[6];
  sub_252951798();
  _s12PreprocessorVMa();
  sub_252951718();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[15] = v6;
  v0[16] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = OBJC_IVAR____TtC5Human17RepetitionCounter_hiddenStates;
  v0[17] = OBJC_IVAR____TtC5Human17RepetitionCounter_hiddenStates;
  uint64_t v8 = v5 + v7;
  swift_beginAccess();
  sub_2528D68A4(v8, v4);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  v0[18] = v9;
  v0[19] = (v3 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  LODWORD(v2) = v9(v4, 1, v2);
  sub_2528AE5CC(v4);
  if (v2 == 1)
  {
    uint64_t v10 = (void *)swift_task_alloc();
    v0[20] = v10;
    void *v10 = v0;
    v10[1] = sub_25293C578;
    uint64_t v11 = v0[14];
    return sub_25293C9A8(v11);
  }
  else
  {
    uint64_t v13 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[18];
    uint64_t v14 = v0[10];
    uint64_t v15 = v0[8];
    sub_2528D68A4(v0[6] + v0[17], v15);
    if (v13(v15, 1, v14) == 1)
    {
      uint64_t result = sub_2528AE5CC(v0[8]);
      __break(1u);
    }
    else
    {
      uint64_t v16 = v0[14];
      uint64_t v32 = (void (*)(uint64_t, uint64_t))v0[15];
      uint64_t v17 = v0[12];
      uint64_t v19 = v0[10];
      uint64_t v18 = v0[11];
      uint64_t v31 = (unint64_t *)v0[5];
      (*(void (**)(uint64_t))(v18 + 32))(v17);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C32FD0);
      int64_t v20 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C327C8) - 8);
      uint64_t v21 = *(void *)(*(void *)v20 + 72);
      unint64_t v22 = (*(unsigned __int8 *)(*(void *)v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v20 + 80);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_252953B00;
      unsigned __int8 v24 = (void *)(v23 + v22);
      uint64_t v25 = (char *)v24 + v20[14];
      *unsigned __int8 v24 = 29800;
      v24[1] = 0xE200000000000000;
      BOOL v26 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
      v26(v25, v17, v19);
      uint64_t v27 = (void *)((char *)v24 + v21);
      uint64_t v28 = (char *)v24 + v21 + v20[14];
      *uint64_t v27 = 0x6F6E5F7365736F70;
      v27[1] = 0xEA00000000006D72;
      v26(v28, v16, v19);
      unint64_t v29 = sub_2528EF7D4(v23);
      v32(v17, v19);
      v32(v16, v19);
      *uint64_t v31 = v29;
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v30 = (uint64_t (*)(void))v0[1];
      return v30();
    }
  }
  return result;
}

uint64_t sub_25293C578()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 168) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  if (v0) {
    uint64_t v4 = sub_25293C8F8;
  }
  else {
    uint64_t v4 = sub_25293C6A4;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_25293C6A4()
{
  uint64_t v1 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[18];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  sub_2528D68A4(v0[6] + v0[17], v3);
  if (v1(v3, 1, v2) == 1)
  {
    uint64_t result = sub_2528AE5CC(v0[8]);
    __break(1u);
  }
  else
  {
    uint64_t v4 = v0[14];
    uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[15];
    uint64_t v5 = v0[12];
    uint64_t v7 = v0[10];
    uint64_t v6 = v0[11];
    int64_t v20 = (unint64_t *)v0[5];
    (*(void (**)(uint64_t))(v6 + 32))(v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C32FD0);
    uint64_t v8 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C327C8) - 8);
    uint64_t v9 = *(void *)(*(void *)v8 + 72);
    unint64_t v10 = (*(unsigned __int8 *)(*(void *)v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v8 + 80);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_252953B00;
    uint64_t v12 = (void *)(v11 + v10);
    uint64_t v13 = (char *)v12 + v8[14];
    void *v12 = 29800;
    v12[1] = 0xE200000000000000;
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v14(v13, v5, v7);
    uint64_t v15 = (void *)((char *)v12 + v9);
    uint64_t v16 = (char *)v12 + v9 + v8[14];
    *uint64_t v15 = 0x6F6E5F7365736F70;
    v15[1] = 0xEA00000000006D72;
    v14(v16, v4, v7);
    unint64_t v17 = sub_2528EF7D4(v11);
    v21(v5, v7);
    v21(v4, v7);
    *int64_t v20 = v17;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
  return result;
}

uint64_t sub_25293C8F8()
{
  (*(void (**)(void, void))(v0 + 120))(*(void *)(v0 + 112), *(void *)(v0 + 80));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25293C9A8(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  uint64_t v3 = sub_252951A08();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25293CAB4, v1, 0);
}

uint64_t sub_25293CAB4()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[6];
  uint64_t v5 = v4 + OBJC_IVAR____TtC5Human17RepetitionCounter_initialHiddenStates;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[13] = v6;
  v0[14] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v5, v3);
  v0[15] = *(void *)(v4 + 112);
  v0[16] = 0;
  uint64_t v7 = (void (*)(char *, uint64_t, uint64_t))v0[13];
  uint64_t v8 = v0[12];
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C32FD0);
  uint64_t v11 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C327C8) - 8);
  uint64_t v12 = *(void *)(*(void *)v11 + 72);
  unint64_t v13 = (*(unsigned __int8 *)(*(void *)v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v11 + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_252953B00;
  uint64_t v15 = (void *)(v14 + v13);
  uint64_t v16 = (char *)v15 + v11[14];
  *uint64_t v15 = 29800;
  v15[1] = 0xE200000000000000;
  v7(v16, v8, v9);
  unint64_t v17 = (void *)((char *)v15 + v12);
  uint64_t v18 = (char *)v15 + v12 + v11[14];
  *unint64_t v17 = 0x6F6E5F7365736F70;
  v17[1] = 0xEA00000000006D72;
  v7(v18, v10, v9);
  unint64_t v19 = sub_2528EF7D4(v14);
  v0[17] = v19;
  int64_t v20 = (void *)swift_task_alloc();
  v0[18] = v20;
  *int64_t v20 = v0;
  v20[1] = sub_25293CCAC;
  return MEMORY[0x270EE7940](v19);
}

uint64_t sub_25293CCAC(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 152) = a1;
  *(void *)(v4 + 160) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 48);
  swift_bridgeObjectRelease();
  if (v1) {
    uint64_t v6 = sub_25293D254;
  }
  else {
    uint64_t v6 = sub_25293CDFC;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_25293CDFC()
{
  if (*(void *)(*(void *)(v0 + 152) + 16)
    && (unint64_t v1 = sub_252922FE8(0x735F6E6564646968, 0xED00007365746174), (v2 & 1) != 0))
  {
    uint64_t v3 = *(void *)(v0 + 80);
    uint64_t v4 = *(void *)(v0 + 88);
    uint64_t v5 = *(void *)(v0 + 72);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v0 + 104))(v5, *(void *)(*(void *)(v0 + 152) + 56) + *(void *)(v4 + 72) * v1, v3);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v6(v5, 0, 1, v3);
  }
  else
  {
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 88) + 56);
    v6(*(void *)(v0 + 72), 1, 1, *(void *)(v0 + 80));
  }
  uint64_t v7 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v9 = *(void *)(v0 + 72);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v9, 1, v7) == 1)
  {
    sub_2528AE5CC(*(void *)(v0 + 72));
    sub_252911D18();
    swift_allocError();
    unsigned char *v10 = 0;
    swift_willThrow();
    (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
LABEL_9:
    return v11();
  }
  uint64_t v12 = *(void *)(v0 + 128);
  uint64_t v14 = *(void *)(v0 + 88);
  uint64_t v13 = *(void *)(v0 + 96);
  uint64_t v16 = *(void *)(v0 + 72);
  uint64_t v15 = *(void *)(v0 + 80);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  unint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32);
  v17(v13, v16, v15);
  if (v12 == 254)
  {
    uint64_t v18 = *(void *)(v0 + 80);
    uint64_t v20 = *(void *)(v0 + 56);
    uint64_t v19 = *(void *)(v0 + 64);
    uint64_t v21 = *(void *)(v0 + 48);
    ((void (*)(uint64_t))v17)(v19);
    v6(v19, 0, 1, v18);
    sub_2529007FC(v19, v20);
    uint64_t v22 = v21 + OBJC_IVAR____TtC5Human17RepetitionCounter_hiddenStates;
    swift_beginAccess();
    sub_2528FA264(v20, v22);
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_9;
  }
  ++*(void *)(v0 + 128);
  unsigned __int8 v24 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 104);
  uint64_t v25 = *(void *)(v0 + 96);
  uint64_t v26 = *(void *)(v0 + 80);
  uint64_t v27 = *(void *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C32FD0);
  uint64_t v28 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C327C8) - 8);
  uint64_t v29 = *(void *)(*(void *)v28 + 72);
  unint64_t v30 = (*(unsigned __int8 *)(*(void *)v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v28 + 80);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_252953B00;
  uint64_t v32 = (void *)(v31 + v30);
  uint64_t v33 = (char *)v32 + v28[14];
  *uint64_t v32 = 29800;
  v32[1] = 0xE200000000000000;
  v24(v33, v25, v26);
  v34 = (void *)((char *)v32 + v29);
  v35 = (char *)v32 + v29 + v28[14];
  void *v34 = 0x6F6E5F7365736F70;
  v34[1] = 0xEA00000000006D72;
  v24(v35, v27, v26);
  unint64_t v36 = sub_2528EF7D4(v31);
  *(void *)(v0 + 136) = v36;
  v37 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v37;
  void *v37 = v0;
  v37[1] = sub_25293CCAC;
  return MEMORY[0x270EE7940](v36);
}

uint64_t sub_25293D254()
{
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25293D300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
  v3[8] = swift_task_alloc();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  uint64_t v5 = sub_252951A08();
  v3[15] = v5;
  v3[16] = *(void *)(v5 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  v3[21] = swift_task_alloc();
  v3[22] = swift_task_alloc();
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25293D4C0, a3, 0);
}

uint64_t sub_25293D4C0()
{
  uint64_t v1 = v0[6];
  if (!v1 || !*(void *)(v1 + 16) || (unint64_t v2 = sub_252922FE8(0x6E6F69746361, 0xE600000000000000), (v3 & 1) == 0))
  {
    uint64_t v5 = v0 + 14;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0[16] + 56))(v0[14], 1, 1, v0[15]);
    goto LABEL_21;
  }
  uint64_t v5 = v0 + 14;
  uint64_t v4 = v0[14];
  uint64_t v6 = v0[15];
  uint64_t v7 = (void *)v0[16];
  uint64_t v8 = v7[9];
  v57 = (void (*)(uint64_t, unint64_t, uint64_t))v7[2];
  v57(v4, *(void *)(v1 + 56) + v8 * v2, v6);
  v58 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v7[7];
  v58(v4, 0, 1, v6);
  uint64_t v9 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v7[6];
  if (v9(v4, 1, v6) != 1)
  {
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[16] + 32);
    v10(v0[27], v0[14], v0[15]);
    if (*(void *)(v1 + 16) && (unint64_t v11 = sub_252922FE8(0x73736572676F7270, 0xE800000000000000), (v12 & 1) != 0))
    {
      v56 = v10;
      uint64_t v13 = v0[15];
      uint64_t v14 = v0[13];
      v57(v14, *(void *)(v1 + 56) + v11 * v8, v13);
      v58(v14, 0, 1, v13);
      if (v9(v14, 1, v13) != 1)
      {
        v56(v0[26], v0[13], v0[15]);
        if (*(void *)(v1 + 16) && (unint64_t v15 = sub_252922FE8(0x79636E65696C6173, 0xE800000000000000), (v16 & 1) != 0))
        {
          uint64_t v17 = v0[15];
          uint64_t v18 = v0[12];
          v57(v18, *(void *)(v1 + 56) + v15 * v8, v17);
          v58(v18, 0, 1, v17);
          if (v9(v18, 1, v17) != 1)
          {
            v56(v0[25], v0[12], v0[15]);
            if (*(void *)(v1 + 16)
              && (unint64_t v19 = sub_252922FE8(0x735F6E6564646968, 0xED00007365746174), (v20 & 1) != 0))
            {
              uint64_t v21 = v0[15];
              uint64_t v22 = v0[11];
              v57(v22, *(void *)(v1 + 56) + v19 * v8, v21);
              v58(v22, 0, 1, v21);
              if (v9(v22, 1, v21) != 1)
              {
                v56(v0[24], v0[11], v0[15]);
                if (*(void *)(v1 + 16)
                  && (unint64_t v23 = sub_252922FE8(0x61735F7472617473, 0xEE0079636E65696CLL), (v24 & 1) != 0))
                {
                  uint64_t v25 = v0[15];
                  uint64_t v26 = v0[10];
                  v57(v26, *(void *)(v1 + 56) + v23 * v8, v25);
                  v58(v26, 0, 1, v25);
                  if (v9(v26, 1, v25) != 1)
                  {
                    uint64_t v27 = v0[24];
                    uint64_t v55 = v0[21];
                    uint64_t v54 = v0[20];
                    uint64_t v28 = v0[15];
                    uint64_t v29 = v0[16];
                    uint64_t v30 = v0[9];
                    uint64_t v52 = v0[8];
                    uint64_t v53 = v0[7];
                    v56(v0[23], v0[10], v28);
                    v57(v30, v27, v28);
                    v58(v30, 0, 1, v28);
                    sub_2529007FC(v30, v52);
                    uint64_t v31 = v53 + OBJC_IVAR____TtC5Human17RepetitionCounter_hiddenStates;
                    swift_beginAccess();
                    sub_2528FA264(v52, v31);
                    swift_endAccess();
                    sub_252951708();
                    sub_252951708();
                    uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
                    v0[28] = (uint64_t)v32;
                    v0[29] = (v29 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
                    v32(v54, v28);
                    sub_25293E7B8(v55);
                    v32(v55, v28);
                    sub_252951938();
                    uint64_t v33 = (void *)swift_task_alloc();
                    v0[30] = (uint64_t)v33;
                    *uint64_t v33 = v0;
                    v33[1] = sub_25293DD34;
                    uint64_t v34 = MEMORY[0x263F8E548];
                    uint64_t v35 = MEMORY[0x263F00CC0];
                    uint64_t v36 = MEMORY[0x263F8E548];
                    return MEMORY[0x270EE7870](v36, v34, v35);
                  }
                }
                else
                {
                  v58(v0[10], 1, 1, v0[15]);
                }
                uint64_t v46 = v0[26];
                uint64_t v47 = v0[27];
                uint64_t v48 = v0[25];
                uint64_t v49 = v0[15];
                v50 = *(void (**)(uint64_t, uint64_t))(v0[16] + 8);
                v50(v0[24], v49);
                v50(v48, v49);
                v50(v46, v49);
                v50(v47, v49);
                uint64_t v5 = v0 + 10;
                goto LABEL_21;
              }
            }
            else
            {
              v58(v0[11], 1, 1, v0[15]);
            }
            uint64_t v42 = v0[26];
            uint64_t v43 = v0[27];
            uint64_t v44 = v0[15];
            v45 = *(void (**)(uint64_t, uint64_t))(v0[16] + 8);
            v45(v0[25], v44);
            v45(v42, v44);
            v45(v43, v44);
            uint64_t v5 = v0 + 11;
            goto LABEL_21;
          }
        }
        else
        {
          v58(v0[12], 1, 1, v0[15]);
        }
        uint64_t v39 = v0[27];
        uint64_t v40 = v0[15];
        v41 = *(void (**)(uint64_t, uint64_t))(v0[16] + 8);
        v41(v0[26], v40);
        v41(v39, v40);
        uint64_t v5 = v0 + 12;
        goto LABEL_21;
      }
    }
    else
    {
      v58(v0[13], 1, 1, v0[15]);
    }
    (*(void (**)(uint64_t, uint64_t))(v0[16] + 8))(v0[27], v0[15]);
    uint64_t v5 = v0 + 13;
  }
LABEL_21:
  sub_2528AE5CC(*v5);
  sub_252911D18();
  swift_allocError();
  unsigned char *v37 = 0;
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = (uint64_t (*)(void))v0[1];
  return v38();
}

uint64_t sub_25293DD34(uint64_t a1)
{
  unint64_t v2 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 224);
  uint64_t v3 = *(void *)(*(void *)v1 + 168);
  uint64_t v4 = *(void *)(*(void *)v1 + 120);
  uint64_t v5 = *(void *)(*(void *)v1 + 56);
  *(void *)(*(void *)v1 + 248) = a1;
  swift_task_dealloc();
  v2(v3, v4);
  return MEMORY[0x270FA2498](sub_25293DEB8, v5, 0);
}

uint64_t sub_25293DEB8()
{
  uint64_t v1 = v0[31];
  unint64_t v2 = (void (*)(uint64_t, uint64_t))v0[28];
  if (*(void *)(v1 + 16))
  {
    uint64_t v4 = v0[20];
    uint64_t v3 = v0[21];
    uint64_t v5 = v0[15];
    uint64_t v6 = *(int *)(v1 + 32);
    swift_bridgeObjectRelease();
    sub_252951708();
    sub_252951708();
    v2(v4, v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C31E08);
    uint64_t v7 = swift_allocObject();
    uint64_t v8 = MEMORY[0x263F8D6C8];
    *(_OWORD *)(v7 + 16) = xmmword_252953740;
    uint64_t v9 = MEMORY[0x263F00C68];
    *(void *)(v7 + 56) = v8;
    *(void *)(v7 + 64) = v9;
    *(void *)(v7 + 32) = v6;
    sub_252951A58();
    swift_bridgeObjectRelease();
    v2(v3, v5);
    sub_252951708();
    sub_252951708();
    v2(v3, v5);
    sub_252951708();
    sub_252951708();
    v2(v4, v5);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_252953740;
    *(void *)(v10 + 56) = MEMORY[0x263F8D6C8];
    *(void *)(v10 + 64) = MEMORY[0x263F00C68];
    *(void *)(v10 + 32) = v6;
    sub_252951A58();
    swift_bridgeObjectRelease();
    v2(v3, v5);
    unint64_t v11 = (void *)swift_task_alloc();
    v0[32] = v11;
    *unint64_t v11 = v0;
    v11[1] = sub_25293E2D0;
    uint64_t v12 = v0[22];
    uint64_t v14 = v0[18];
    uint64_t v13 = v0[19];
    uint64_t v15 = v0[17];
    uint64_t v16 = v0[5];
    return sub_252933820(v16, v12, v13, v15, v14);
  }
  else
  {
    uint64_t v18 = v0[26];
    uint64_t v26 = v0[27];
    uint64_t v20 = v0[24];
    uint64_t v19 = v0[25];
    uint64_t v21 = v0[22];
    uint64_t v22 = v0[23];
    uint64_t v23 = v0[15];
    swift_bridgeObjectRelease();
    sub_252911D18();
    swift_allocError();
    *char v24 = 1;
    swift_willThrow();
    v2(v21, v23);
    v2(v22, v23);
    v2(v20, v23);
    v2(v19, v23);
    v2(v18, v23);
    v2(v26, v23);
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
    uint64_t v25 = (uint64_t (*)(void))v0[1];
    return v25();
  }
}

uint64_t sub_25293E2D0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 264) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v4 = sub_25293E5D8;
  }
  else {
    uint64_t v4 = sub_25293E3FC;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_25293E3FC()
{
  uint64_t v1 = (void (*)(void))v0[28];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[23];
  uint64_t v11 = v0[24];
  uint64_t v12 = v0[25];
  uint64_t v5 = v0[22];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[18];
  uint64_t v8 = v0[15];
  v1();
  ((void (*)(uint64_t, uint64_t))v1)(v7, v8);
  ((void (*)(uint64_t, uint64_t))v1)(v6, v8);
  ((void (*)(uint64_t, uint64_t))v1)(v5, v8);
  ((void (*)(uint64_t, uint64_t))v1)(v4, v8);
  ((void (*)(uint64_t, uint64_t))v1)(v11, v8);
  ((void (*)(uint64_t, uint64_t))v1)(v12, v8);
  ((void (*)(uint64_t, uint64_t))v1)(v2, v8);
  ((void (*)(uint64_t, uint64_t))v1)(v3, v8);
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
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_25293E5D8()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[28];
  uint64_t v2 = v0[25];
  uint64_t v11 = v0[26];
  uint64_t v12 = v0[27];
  uint64_t v4 = v0[23];
  uint64_t v3 = v0[24];
  uint64_t v5 = v0[22];
  uint64_t v7 = v0[18];
  uint64_t v6 = v0[19];
  uint64_t v8 = v0[15];
  v1(v0[17], v8);
  v1(v7, v8);
  v1(v6, v8);
  v1(v5, v8);
  v1(v4, v8);
  v1(v3, v8);
  v1(v2, v8);
  v1(v11, v8);
  v1(v12, v8);
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
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_25293E7B8(uint64_t a1)
{
  uint64_t v2 = sub_252951A08();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v12 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v12 - v7, a1, v2);
  uint64_t v9 = sub_252951898();
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  uint64_t result = v10(v8, v2);
  if (v9 == 1)
  {
    sub_2529516E8();
    sub_252951998();
    v10(v6, v2);
    sub_252951708();
    return v10(v8, v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25293E940(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_2528A91AC;
  return sub_25293C0A4(a1, v5, v4);
}

uint64_t sub_25293E9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s12PreprocessorVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t PersonTrackerErrors.errorDescription.getter()
{
  return 0;
}

uint64_t PersonTrackerErrors.debugDescription.getter()
{
  return 0;
}

uint64_t static PersonTrackerErrors.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_252952108();
  }
}

unint64_t sub_25293EBB8()
{
  unint64_t result = qword_269C333F0;
  if (!qword_269C333F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C333F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for PersonTrackerErrors()
{
  return &type metadata for PersonTrackerErrors;
}

unint64_t CameraSourceError.errorDescription.getter()
{
  if (*(unsigned char *)(v0 + 8) == 1)
  {
    unint64_t result = 0xD000000000000067;
    switch(*(void *)v0)
    {
      case 1:
        unint64_t result = 0xD000000000000063;
        break;
      case 2:
        unint64_t result = 0xD000000000000019;
        break;
      case 3:
        unint64_t result = 0xD000000000000034;
        break;
      default:
        return result;
    }
  }
  else
  {
    sub_252951E48();
    sub_252951B08();
    sub_252951C98();
    sub_252951B08();
    return 0;
  }
  return result;
}

unint64_t CameraSourceError.debugDescription.getter()
{
  if (*(unsigned char *)(v0 + 8) == 1)
  {
    unint64_t result = 0xD000000000000067;
    switch(*(void *)v0)
    {
      case 1:
        unint64_t result = 0xD000000000000063;
        break;
      case 2:
        unint64_t result = 0xD000000000000019;
        break;
      case 3:
        unint64_t result = 0xD000000000000034;
        break;
      default:
        return result;
    }
  }
  else
  {
    sub_252951E48();
    sub_252951B08();
    sub_252951C98();
    sub_252951B08();
    return 0;
  }
  return result;
}

BOOL static CameraSourceError.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    switch(*(void *)&v2)
    {
      case 1:
        if (*(void *)&v3 == 1) {
          char v8 = *(unsigned char *)(a2 + 8);
        }
        else {
          char v8 = 0;
        }
        if ((v8 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      case 2:
        if (*(void *)&v3 == 2) {
          char v6 = *(unsigned char *)(a2 + 8);
        }
        else {
          char v6 = 0;
        }
        if ((v6 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      case 3:
        if (*(void *)&v3 > 2uLL) {
          char v7 = *(unsigned char *)(a2 + 8);
        }
        else {
          char v7 = 0;
        }
        if ((v7 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
      default:
        if (v3 == 0.0) {
          char v4 = *(unsigned char *)(a2 + 8);
        }
        else {
          char v4 = 0;
        }
        if ((v4 & 1) == 0) {
          return 0;
        }
        BOOL result = 1;
        break;
    }
  }
  else
  {
    return (*(unsigned char *)(a2 + 8) & 1) == 0 && v2 == *(double *)a2;
  }
  return result;
}

BOOL sub_25293EF70(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    switch(*(void *)&v2)
    {
      case 1:
        BOOL v4 = *(void *)&v3 == 1;
        goto LABEL_13;
      case 2:
        BOOL v4 = *(void *)&v3 == 2;
        goto LABEL_13;
      case 3:
        if (*(void *)&v3 > 2uLL) {
          int v6 = *(unsigned __int8 *)(a2 + 8);
        }
        else {
          int v6 = 0;
        }
        if (v6 != 1) {
          return 0;
        }
        goto LABEL_17;
      default:
        BOOL v4 = *(void *)&v3 == 0;
LABEL_13:
        if (v4) {
          char v7 = *(unsigned char *)(a2 + 8);
        }
        else {
          char v7 = 0;
        }
        if ((v7 & 1) == 0) {
          return 0;
        }
LABEL_17:
        BOOL result = 1;
        break;
    }
  }
  else
  {
    return (*(unsigned char *)(a2 + 8) & 1) == 0 && v2 == *(double *)a2;
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)BOOL result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CameraSourceError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CameraSourceError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)BOOL result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)BOOL result = a2 - 1;
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_25293F078(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25293F094(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)BOOL result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraSourceError()
{
  return &type metadata for CameraSourceError;
}

uint64_t _s6ActionVwxx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s6ActionVwcp(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

void *_s6ActionVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6ActionVwta(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6ActionVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s6ActionVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)BOOL result = a2 ^ 0x80000000;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s6ActionVMa()
{
  return &_s6ActionVN;
}

void sub_25293F23C()
{
}

void sub_25293F268()
{
}

void sub_25293F294(void *a1, char a2, void *a3)
{
  BOOL v4 = *(void **)(v3 + *a1);
  if (!v4) {
    goto LABEL_6;
  }
  char v7 = *(void **)(v3 + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_cameraSession);
  id v8 = v4;
  if (!objc_msgSend(v7, sel_canAddInput_, v8))
  {

LABEL_6:
    sub_2528BCAB8();
    swift_allocError();
    *(void *)uint64_t v12 = 2;
    *(unsigned char *)(v12 + 8) = 1;
    swift_willThrow();
    return;
  }
  objc_msgSend(v7, sel_addInput_, v8);
  *(unsigned char *)(v3 + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_currentCameraPosition) = a2;
  uint64_t v9 = *(void *)(v3 + *a3);
  if (v9)
  {
    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFA5C8]), sel_initWithDevice_previewLayer_, v9, 0);

    uint64_t v11 = *(void **)(v3 + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_rotationCoordinator);
    *(void *)(v3 + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_rotationCoordinator) = v10;
  }
  else
  {
    __break(1u);
  }
}

uint64_t ColorToGrayConverter.applied(to:)(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  v2[4] = type metadata accessor for ImageDescriptor();
  v2[5] = swift_task_alloc();
  uint64_t v3 = sub_252951598();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25293F4B4, 0, 0);
}

uint64_t sub_25293F4B4()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[3];
  sub_252951588();
  sub_2528AC618(v2, v1);
  uint64_t v3 = swift_task_alloc();
  v0[9] = v3;
  *(void *)(v3 + 16) = v1;
  BOOL v4 = (void *)swift_task_alloc();
  v0[10] = v4;
  *BOOL v4 = v0;
  v4[1] = sub_2528AC3BC;
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[2];
  return MEMORY[0x270EE76C0](v7, v5, &unk_269C33408, v3, v6);
}

uint64_t sub_25293F59C(uint64_t a1, uint64_t a2)
{
  v2[4] = a1;
  v2[5] = a2;
  uint64_t v3 = sub_252951A08();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  uint64_t v4 = swift_task_alloc();
  v2[14] = v4;
  v2[2] = 0xD00000000000001DLL;
  v2[3] = 0x800000025295A0B0;
  uint64_t v5 = (void *)swift_task_alloc();
  v2[15] = (uint64_t)v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25293F718;
  return ImageDescriptor.tensor(for:)(v4, v2 + 2);
}

uint64_t sub_25293F718()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25293FB58;
  }
  else {
    uint64_t v2 = sub_25293F82C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25293F82C()
{
  if (sub_252951898() != 1)
  {
    uint64_t result = sub_252951898();
    if (result == 3)
    {
      uint64_t result = sub_252951908();
      unint64_t v4 = *(void *)(result + 16);
      if (v4)
      {
        uint64_t v5 = v0[7];
        uint64_t v6 = *(void (**)(void))(v5 + 16);
        unint64_t v7 = result + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
        uint64_t result = ((uint64_t (*)(void, unint64_t, void))v6)(v0[13], v7, v0[6]);
        if (v4 != 1)
        {
          uint64_t result = ((uint64_t (*)(void, unint64_t, void))v6)(v0[12], v7 + *(void *)(v0[7] + 72), v0[6]);
          if (v4 >= 3)
          {
            uint64_t v20 = v0[13];
            uint64_t v21 = v0[14];
            uint64_t v18 = v0[11];
            uint64_t v19 = v0[12];
            uint64_t v8 = v0[8];
            uint64_t v14 = v0[9];
            uint64_t v9 = v0[6];
            uint64_t v15 = v0[7];
            uint64_t v16 = v0[10];
            uint64_t v10 = v0[4];
            uint64_t v17 = v0[5];
            v6();
            swift_bridgeObjectRelease();
            sub_252951768();
            sub_252951768();
            uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
            v11(v8, v9);
            sub_2529516C8();
            sub_252951718();
            v11(v8, v9);
            v11(v14, v9);
            sub_2528AC618(v17, v10);
            uint64_t v12 = v10 + *(int *)(type metadata accessor for ImageDescriptor() + 36);
            sub_2528AE5CC(v12);
            ((void (*)(uint64_t, uint64_t, uint64_t))v6)(v12, v16, v9);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v9);
            v11(v16, v9);
            v11(v18, v9);
            v11(v19, v9);
            v11(v20, v9);
            v11(v21, v9);
            goto LABEL_8;
          }
LABEL_14:
          __break(1u);
          return result;
        }
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  (*(void (**)(void, void))(v0[7] + 8))(v0[14], v0[6]);
  sub_2528AC618(v2, v1);
LABEL_8:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_25293FB58()
{
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

uint64_t sub_25293FC08(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2528A91AC;
  return sub_25293F59C(a1, v4);
}

uint64_t sub_25293FCA8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2528A91AC;
  return ColorToGrayConverter.applied(to:)(a1, a2);
}

ValueMetadata *type metadata accessor for ColorToGrayConverter()
{
  return &type metadata for ColorToGrayConverter;
}

double sub_25293FD58()
{
  char v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269C32A40);
  uint64_t v2 = swift_allocObject();
  if (v1)
  {
    *(void *)&double result = 8;
    *(_OWORD *)(v2 + 16) = xmmword_252959490;
    *(void *)(v2 + 32) = 1701736270;
    *(void *)(v2 + 40) = 0xE400000000000000;
    *(void *)(v2 + 48) = 0x7365542070657453;
    *(void *)(v2 + 56) = 0xE900000000000074;
    strcpy((char *)(v2 + 64), "Sit to Stand");
    *(unsigned char *)(v2 + 77) = 0;
    *(_WORD *)(v2 + 78) = -5120;
    *(void *)(v2 + 80) = 0x707568737550;
    *(void *)(v2 + 88) = 0xE600000000000000;
    strcpy((char *)(v2 + 96), "Overhead Squat");
    *(unsigned char *)(v2 + 111) = -18;
    *(void *)(v2 + 112) = 0x7375502065656E4BLL;
    *(void *)(v2 + 120) = 0xEB00000000707568;
    *(void *)(v2 + 128) = 0x6B6E616C50;
    *(void *)(v2 + 136) = 0xE500000000000000;
    *(void *)(v2 + 144) = 0xD000000000000011;
    *(void *)(v2 + 152) = 0x800000025295CEE0;
  }
  else
  {
    *(void *)&double result = 6;
    *(_OWORD *)(v2 + 16) = xmmword_252959480;
    *(void *)(v2 + 32) = 1701736270;
    *(void *)(v2 + 40) = 0xE400000000000000;
    *(void *)(v2 + 48) = 0x656570727542;
    *(void *)(v2 + 56) = 0xE600000000000000;
    *(void *)(v2 + 64) = 0xD000000000000012;
    *(void *)(v2 + 72) = 0x800000025295D140;
    *(void *)(v2 + 80) = 0xD000000000000014;
    *(void *)(v2 + 88) = 0x800000025295D160;
    *(void *)(v2 + 96) = 0x656E4B2068676948;
    *(void *)(v2 + 104) = 0xEA00000000007365;
    *(void *)(v2 + 112) = 0x676F50206F676F50;
    *(void *)(v2 + 120) = 0xEF65676E754C206FLL;
  }
  return result;
}

uint64_t sub_25293FF24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v36 = sub_252951A08();
  uint64_t v32 = *(void *)(v36 - 8);
  uint64_t v2 = v32;
  uint64_t v1 = v32;
  uint64_t v3 = MEMORY[0x270FA5388](v36);
  uint64_t v33 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v34 = (char *)&v29 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)&v29 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31C98);
  uint64_t v9 = *(void *)(v1 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = v10 | 7;
  uint64_t v13 = v8;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2529545B0;
  uint64_t v15 = v14 + v11;
  uint64_t v30 = 3 * v9;
  uint64_t v31 = v14;
  uint64_t v16 = swift_allocObject();
  long long v44 = xmmword_252953970;
  *(_OWORD *)(v16 + 16) = xmmword_252953970;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v29 = v15 + v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v29 = v15 + 2 * v9;
  uint64_t v38 = v15;
  uint64_t v43 = v13;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  v30 += v15;
  uint64_t v41 = v11 + 3 * v9;
  uint64_t v42 = v12;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  uint64_t v40 = 2 * v9;
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v17 = v38;
  uint64_t v30 = v38 + 4 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  uint64_t v39 = v11;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 5 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 6 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = 8 * v9;
  uint64_t v29 = v17 + 7 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v18 = v30;
  uint64_t v29 = v17 + v30;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + v18 + v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 12 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 13 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 14 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 15 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 16 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v19 = v38;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 18 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 19 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 20 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v20 = v38;
  uint64_t v30 = v38 + 21 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v20 + 22 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v21 = v38;
  uint64_t v30 = v38 + 23 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v21 + 24 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v21 + 25 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v45 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D10);
  sub_2528D2658();
  uint64_t v22 = v33;
  sub_252951A28();
  uint64_t v23 = v34;
  sub_252951668();
  char v24 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v25 = v22;
  uint64_t v26 = v36;
  v24(v25, v36);
  uint64_t v27 = v35;
  sub_2529516E8();
  v24(v23, v26);
  sub_2529516E8();
  return ((uint64_t (*)(char *, uint64_t))v24)(v27, v26);
}

uint64_t sub_252940EF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v36 = sub_252951A08();
  uint64_t v32 = *(void *)(v36 - 8);
  uint64_t v2 = v32;
  uint64_t v1 = v32;
  uint64_t v3 = MEMORY[0x270FA5388](v36);
  uint64_t v33 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v34 = (char *)&v29 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)&v29 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31C98);
  uint64_t v9 = *(void *)(v1 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = v10 | 7;
  uint64_t v13 = v8;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2529545B0;
  uint64_t v15 = v14 + v11;
  uint64_t v30 = 3 * v9;
  uint64_t v31 = v14;
  uint64_t v16 = swift_allocObject();
  long long v44 = xmmword_252953970;
  *(_OWORD *)(v16 + 16) = xmmword_252953970;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v29 = v15 + v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v29 = v15 + 2 * v9;
  uint64_t v38 = v15;
  uint64_t v43 = v13;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  v30 += v15;
  uint64_t v41 = v11 + 3 * v9;
  uint64_t v42 = v12;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  uint64_t v40 = 2 * v9;
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v17 = v38;
  uint64_t v30 = v38 + 4 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  uint64_t v39 = v11;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 5 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 6 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = 8 * v9;
  uint64_t v29 = v17 + 7 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v18 = v30;
  uint64_t v29 = v17 + v30;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + v18 + v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 12 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 13 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 14 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 15 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 16 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v19 = v38;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 18 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 19 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 20 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v20 = v38;
  uint64_t v30 = v38 + 21 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v20 + 22 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v21 = v38;
  uint64_t v30 = v38 + 23 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v21 + 24 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v21 + 25 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v45 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D10);
  sub_2528D2658();
  uint64_t v22 = v33;
  sub_252951A28();
  uint64_t v23 = v34;
  sub_252951668();
  char v24 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v25 = v22;
  uint64_t v26 = v36;
  v24(v25, v36);
  uint64_t v27 = v35;
  sub_2529516E8();
  v24(v23, v26);
  sub_2529516E8();
  return ((uint64_t (*)(char *, uint64_t))v24)(v27, v26);
}

uint64_t sub_252941EBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v36 = sub_252951A08();
  uint64_t v32 = *(void *)(v36 - 8);
  uint64_t v2 = v32;
  uint64_t v1 = v32;
  uint64_t v3 = MEMORY[0x270FA5388](v36);
  uint64_t v33 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v34 = (char *)&v29 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)&v29 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31C98);
  uint64_t v9 = *(void *)(v1 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = v10 | 7;
  uint64_t v13 = v8;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2529545B0;
  uint64_t v15 = v14 + v11;
  uint64_t v30 = 3 * v9;
  uint64_t v31 = v14;
  uint64_t v16 = swift_allocObject();
  long long v44 = xmmword_252953970;
  *(_OWORD *)(v16 + 16) = xmmword_252953970;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v29 = v15 + v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v29 = v15 + 2 * v9;
  uint64_t v38 = v15;
  uint64_t v43 = v13;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  v30 += v15;
  uint64_t v41 = v11 + 3 * v9;
  uint64_t v42 = v12;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  uint64_t v40 = 2 * v9;
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v17 = v38;
  uint64_t v30 = v38 + 4 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  uint64_t v39 = v11;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 5 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 6 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = 8 * v9;
  uint64_t v29 = v17 + 7 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v18 = v30;
  uint64_t v29 = v17 + v30;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + v18 + v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 12 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 13 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 14 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 15 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 16 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v19 = v38;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 18 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 19 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 20 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v20 = v38;
  uint64_t v30 = v38 + 21 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v20 + 22 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v21 = v38;
  uint64_t v30 = v38 + 23 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v21 + 24 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v21 + 25 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v45 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D10);
  sub_2528D2658();
  uint64_t v22 = v33;
  sub_252951A28();
  uint64_t v23 = v34;
  sub_252951668();
  char v24 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v25 = v22;
  uint64_t v26 = v36;
  v24(v25, v36);
  uint64_t v27 = v35;
  sub_2529516E8();
  v24(v23, v26);
  sub_2529516E8();
  return ((uint64_t (*)(char *, uint64_t))v24)(v27, v26);
}

uint64_t sub_252942E88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v36 = sub_252951A08();
  uint64_t v32 = *(void *)(v36 - 8);
  uint64_t v2 = v32;
  uint64_t v1 = v32;
  uint64_t v3 = MEMORY[0x270FA5388](v36);
  uint64_t v33 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v34 = (char *)&v29 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)&v29 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31C98);
  uint64_t v9 = *(void *)(v1 + 72);
  uint64_t v10 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v12 = v10 | 7;
  uint64_t v13 = v8;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2529545B0;
  uint64_t v15 = v14 + v11;
  uint64_t v30 = 3 * v9;
  uint64_t v31 = v14;
  uint64_t v16 = swift_allocObject();
  long long v44 = xmmword_252953970;
  *(_OWORD *)(v16 + 16) = xmmword_252953970;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v29 = v15 + v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v29 = v15 + 2 * v9;
  uint64_t v38 = v15;
  uint64_t v43 = v13;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  v30 += v15;
  uint64_t v41 = v11 + 3 * v9;
  uint64_t v42 = v12;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  uint64_t v40 = 2 * v9;
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v17 = v38;
  uint64_t v30 = v38 + 4 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  uint64_t v39 = v11;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 5 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 6 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = 8 * v9;
  uint64_t v29 = v17 + 7 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v18 = v30;
  uint64_t v29 = v17 + v30;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + v18 + v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 12 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 13 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 14 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 15 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v17 + 16 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v19 = v38;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 18 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 19 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v19 + 20 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v20 = v38;
  uint64_t v30 = v38 + 21 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v20 + 22 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v21 = v38;
  uint64_t v30 = v38 + 23 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v21 + 24 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v30 = v21 + 25 * v9;
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  *(_OWORD *)(swift_allocObject() + 16) = v44;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  uint64_t v45 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D10);
  sub_2528D2658();
  uint64_t v22 = v33;
  sub_252951A28();
  uint64_t v23 = v34;
  sub_252951668();
  char v24 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v25 = v22;
  uint64_t v26 = v36;
  v24(v25, v36);
  uint64_t v27 = v35;
  sub_2529516E8();
  v24(v23, v26);
  sub_2529516E8();
  return ((uint64_t (*)(char *, uint64_t))v24)(v27, v26);
}

BOOL static RepetitiveActionCounter.ModelType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t RepetitiveActionCounter.ModelType.hash(into:)()
{
  return sub_2529521A8();
}

uint64_t RepetitiveActionCounter.ModelType.hashValue.getter()
{
  return sub_2529521C8();
}

unint64_t sub_252943EE4()
{
  unint64_t result = qword_269C33418;
  if (!qword_269C33418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C33418);
  }
  return result;
}

unsigned char *_s9ModelTypeOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252944004);
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

ValueMetadata *type metadata accessor for RepetitiveActionCounter.ModelType()
{
  return &type metadata for RepetitiveActionCounter.ModelType;
}

uint64_t sub_25294403C(char a1)
{
  return *(void *)&aUnknown[8 * a1];
}

uint64_t SceneDescriptor.tensor(for:)(uint64_t a1, uint64_t *a2)
{
  v3[8] = a1;
  v3[9] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
  v3[10] = swift_task_alloc();
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  uint64_t v5 = sub_252951A08();
  v3[16] = v5;
  v3[17] = *(void *)(v5 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  v3[20] = v6;
  v3[21] = v7;
  v3[22] = v8;
  return MEMORY[0x270FA2498](sub_2529441B4, 0, 0);
}

uint64_t sub_2529441B4()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  if (v1 == 0xD00000000000001DLL && v2 == 0x800000025295A0B0 || (sub_252952108() & 1) != 0)
  {
    v0[6] = 0xD00000000000001DLL;
    int v3 = v0 + 6;
    v0[7] = 0x800000025295A0B0;
    unsigned int v4 = (void *)swift_task_alloc();
    v0[23] = (uint64_t)v4;
    *unsigned int v4 = v0;
    v4[1] = sub_252944A28;
    uint64_t v5 = v0[20];
LABEL_5:
    return ImageDescriptor.tensor(for:)(v5, v3);
  }
  if (v0[21] == 0xD000000000000023 && v0[22] == 0x800000025295A0D0 || (sub_252952108() & 1) != 0)
  {
    v0[4] = 0xD000000000000023;
    int v3 = v0 + 4;
    v0[5] = 0x800000025295A0D0;
    uint64_t v7 = (void *)swift_task_alloc();
    v0[25] = (uint64_t)v7;
    *uint64_t v7 = v0;
    v7[1] = sub_252944C24;
    uint64_t v5 = v0[19];
    goto LABEL_5;
  }
  if (v0[21] == 0xD00000000000002ALL && v0[22] == 0x800000025295A100 || (sub_252952108() & 1) != 0)
  {
    v0[2] = 0xD00000000000002ALL;
    int v3 = v0 + 2;
    v0[3] = 0x800000025295A100;
    uint64_t v8 = (void *)swift_task_alloc();
    v0[27] = (uint64_t)v8;
    *uint64_t v8 = v0;
    v8[1] = sub_252944E20;
    uint64_t v5 = v0[18];
    goto LABEL_5;
  }
  if ((v0[21] != 0xD000000000000017 || v0[22] != 0x800000025295A130) && (sub_252952108() & 1) == 0)
  {
    if (v1 == 0xD00000000000001DLL && v0[22] == 0x800000025295A150 || (sub_252952108() & 1) != 0)
    {
      uint64_t v17 = v0[16];
      uint64_t v18 = v0[17];
      uint64_t v19 = v0[14];
      uint64_t v20 = v0[9];
      uint64_t v21 = type metadata accessor for SceneDescriptor();
      sub_2528D68A4(v20 + *(int *)(v21 + 40), v19);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v19, 1, v17) == 1)
      {
        sub_2528AE5CC(v0[14]);
        sub_2528E5158();
        swift_allocError();
        long long v15 = xmmword_252953750;
        goto LABEL_23;
      }
      uint64_t v22 = v0[16];
      uint64_t v23 = v0[17];
      uint64_t v24 = v0[14];
    }
    else if (v1 == 0xD00000000000001DLL && v0[22] == 0x800000025295A170 || (sub_252952108() & 1) != 0)
    {
      uint64_t v25 = v0[16];
      uint64_t v26 = v0[17];
      uint64_t v27 = v0[13];
      uint64_t v28 = v0[9];
      uint64_t v29 = type metadata accessor for SceneDescriptor();
      sub_2528D68A4(v28 + *(int *)(v29 + 44), v27);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v27, 1, v25) == 1)
      {
        sub_2528AE5CC(v0[13]);
        sub_2528E5158();
        swift_allocError();
        long long v15 = xmmword_252957AD0;
        goto LABEL_23;
      }
      uint64_t v22 = v0[16];
      uint64_t v23 = v0[17];
      uint64_t v24 = v0[13];
    }
    else if (v1 == 0xD00000000000001DLL && v0[22] == 0x800000025295A190 || (sub_252952108() & 1) != 0)
    {
      uint64_t v30 = v0[16];
      uint64_t v31 = v0[17];
      uint64_t v32 = v0[12];
      uint64_t v33 = v0[9];
      uint64_t v34 = type metadata accessor for SceneDescriptor();
      sub_2528D68A4(v33 + *(int *)(v34 + 48), v32);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v32, 1, v30) == 1)
      {
        sub_2528AE5CC(v0[12]);
        sub_2528E5158();
        swift_allocError();
        long long v15 = xmmword_2529598B0;
        goto LABEL_23;
      }
      uint64_t v22 = v0[16];
      uint64_t v23 = v0[17];
      uint64_t v24 = v0[12];
    }
    else if (v0[21] == 0xD00000000000001BLL && v0[22] == 0x800000025295A1B0 || (sub_252952108() & 1) != 0)
    {
      uint64_t v35 = v0[16];
      uint64_t v36 = v0[17];
      uint64_t v37 = v0[11];
      uint64_t v38 = v0[9];
      uint64_t v39 = type metadata accessor for SceneDescriptor();
      sub_2528D68A4(v38 + *(int *)(v39 + 52), v37);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48))(v37, 1, v35) == 1)
      {
        sub_2528AE5CC(v0[11]);
        sub_2528E5158();
        swift_allocError();
        long long v15 = xmmword_2529598A0;
        goto LABEL_23;
      }
      uint64_t v22 = v0[16];
      uint64_t v23 = v0[17];
      uint64_t v24 = v0[11];
    }
    else
    {
      if ((v0[21] != 0xD00000000000001ALL || v0[22] != 0x800000025295A1D0) && (sub_252952108() & 1) == 0)
      {
        uint64_t v45 = v0[21];
        sub_2528E5158();
        swift_allocError();
        *uint64_t v46 = v45;
        v46[1] = v2;
        swift_bridgeObjectRetain();
        goto LABEL_24;
      }
      uint64_t v40 = v0[16];
      uint64_t v41 = v0[17];
      uint64_t v43 = v0[9];
      uint64_t v42 = v0[10];
      uint64_t v44 = type metadata accessor for SceneDescriptor();
      sub_2528D68A4(v43 + *(int *)(v44 + 56), v42);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v42, 1, v40) == 1)
      {
        sub_2528AE5CC(v0[10]);
        MLTensor.init(matrix4x4:)((int8x16_t)xmmword_252959880, (int8x16_t)xmmword_252959890, (int8x16_t)xmmword_252953C00, (int8x16_t)xmmword_252956C00);
        goto LABEL_33;
      }
      uint64_t v22 = v0[16];
      uint64_t v23 = v0[17];
      uint64_t v24 = v0[10];
    }
LABEL_32:
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v0[8], v24, v22);
LABEL_33:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = (uint64_t (*)(void))v0[1];
    goto LABEL_34;
  }
  uint64_t v9 = v0[9];
  uint64_t v10 = *(void *)(v9 + *(int *)(type metadata accessor for SceneDescriptor() + 24));
  if (*(void *)(v10 + 16))
  {
    uint64_t v11 = v0[16];
    uint64_t v12 = v0[17];
    uint64_t v13 = v0[15];
    sub_2529456D0(v10, v13);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v13, 1, v11) == 1)
    {
      sub_2528AE5CC(v0[15]);
      goto LABEL_22;
    }
    uint64_t v22 = v0[16];
    uint64_t v23 = v0[17];
    uint64_t v24 = v0[15];
    goto LABEL_32;
  }
LABEL_22:
  sub_2528E5158();
  swift_allocError();
  long long v15 = xmmword_252958270;
LABEL_23:
  *uint64_t v14 = v15;
LABEL_24:
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
  uint64_t v16 = (uint64_t (*)(void))v0[1];
LABEL_34:
  return v16();
}

uint64_t sub_252944A28()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25294501C;
  }
  else {
    uint64_t v2 = sub_252944B3C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_252944B3C()
{
  (*(void (**)(void, void, void))(v0[17] + 32))(v0[8], v0[20], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_252944C24()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2529450F0;
  }
  else {
    uint64_t v2 = sub_252944D38;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_252944D38()
{
  (*(void (**)(void, void, void))(v0[17] + 32))(v0[8], v0[19], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_252944E20()
{
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2529451C4;
  }
  else {
    uint64_t v2 = sub_252944F34;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_252944F34()
{
  (*(void (**)(void, void, void))(v0[17] + 32))(v0[8], v0[18], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_25294501C()
{
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_2529450F0()
{
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t sub_2529451C4()
{
  swift_task_dealloc();
  swift_task_dealloc();
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

uint64_t type metadata accessor for SceneDescriptor()
{
  uint64_t result = qword_269C33430;
  if (!qword_269C33430) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SceneDescriptor.init(imageDescriptor:boundingBoxes:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = (int *)type metadata accessor for SceneDescriptor();
  uint64_t v7 = a3 + v6[5];
  *(void *)uint64_t v7 = 0;
  *(void *)(v7 + 8) = 0;
  *(_DWORD *)(v7 + 16) = 0;
  *(unsigned char *)(a3 + v6[7]) = 0;
  uint64_t v8 = MEMORY[0x263F8EE78];
  *(void *)(a3 + v6[8]) = MEMORY[0x263F8EE78];
  uint64_t v9 = a3 + v6[9];
  uint64_t v10 = sub_252951A08();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
  v11(v9, 1, 1, v10);
  v11(a3 + v6[10], 1, 1, v10);
  v11(a3 + v6[11], 1, 1, v10);
  v11(a3 + v6[12], 1, 1, v10);
  v11(a3 + v6[13], 1, 1, v10);
  v11(a3 + v6[14], 1, 1, v10);
  *(void *)(a3 + v6[15]) = v8;
  *(void *)(a3 + v6[16]) = v8;
  uint64_t result = sub_2528AE62C(a1, a3);
  *(void *)(a3 + v6[6]) = a2;
  return result;
}

uint64_t SceneDescriptor.imageDescriptor.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2528AC618(v1, a1);
}

uint64_t SceneDescriptor.action.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for SceneDescriptor() + 20));
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  LODWORD(v3) = *((_DWORD *)v3 + 4);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = v3;

  return swift_bridgeObjectRetain();
}

uint64_t SceneDescriptor.action.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  int v4 = *((_DWORD *)a1 + 4);
  uint64_t v5 = v1 + *(int *)(type metadata accessor for SceneDescriptor() + 20);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = v3;
  *(_DWORD *)(v5 + 16) = v4;
  return result;
}

uint64_t (*SceneDescriptor.action.modify())(void)
{
  return nullsub_1;
}

uint64_t SceneDescriptor.detectedBoundingBoxes.getter()
{
  type metadata accessor for SceneDescriptor();

  return swift_bridgeObjectRetain();
}

uint64_t SceneDescriptor.detectedBoundingBoxes.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for SceneDescriptor() + 24);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*SceneDescriptor.detectedBoundingBoxes.modify())(void)
{
  return nullsub_1;
}

uint64_t SceneDescriptor.topology.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for SceneDescriptor();
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t SceneDescriptor.topology.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for SceneDescriptor();
  *(unsigned char *)(v1 + *(int *)(result + 28)) = v2;
  return result;
}

uint64_t (*SceneDescriptor.topology.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_2529456D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_252951A08();
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16))
  {
    uint64_t v26 = v5;
    uint64_t v27 = a1;
    swift_bridgeObjectRetain();
    sub_2529286B8(&v27);
    uint64_t v8 = v27;
    uint64_t v9 = *(void *)(v27 + 16);
    if (v9)
    {
      uint64_t v23 = a2;
      uint64_t v25 = v26 + 32;
      unint64_t v10 = MEMORY[0x263F8EE78];
      uint64_t v11 = 40;
      long long v24 = xmmword_252953B10;
      uint64_t v12 = v4;
      do
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C31C60);
        uint64_t v13 = swift_allocObject();
        long long v14 = *(_OWORD *)(v8 + v11);
        *(_OWORD *)(v13 + 16) = v24;
        *(_OWORD *)(v13 + 32) = v14;
        uint64_t v27 = v13;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C31C30);
        sub_2528CA548((unint64_t *)&qword_269C31C58, &qword_269C31C30);
        sub_252951A18();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v10 = sub_2528C4584(0, *(void *)(v10 + 16) + 1, 1, v10);
        }
        unint64_t v16 = *(void *)(v10 + 16);
        unint64_t v15 = *(void *)(v10 + 24);
        uint64_t v17 = v26;
        if (v16 >= v15 >> 1)
        {
          uint64_t v19 = sub_2528C4584(v15 > 1, v16 + 1, 1, v10);
          uint64_t v17 = v26;
          unint64_t v10 = v19;
        }
        *(void *)(v10 + 16) = v16 + 1;
        unint64_t v18 = v10
            + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))
            + *(void *)(v17 + 72) * v16;
        uint64_t v4 = v12;
        (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(v18, v7, v12);
        v11 += 40;
        --v9;
      }
      while (v9);
      swift_release();
      a2 = v23;
    }
    else
    {
      swift_release();
      unint64_t v10 = MEMORY[0x263F8EE78];
    }
    uint64_t v27 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D10);
    sub_2528CA548((unint64_t *)&qword_269C31D18, &qword_269C31D10);
    sub_252951A28();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(a2, 0, 1, v4);
  }
  else
  {
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    return v20(a2, 1, 1, v4);
  }
}

uint64_t sub_2529459F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2528A91AC;
  return SceneDescriptor.tensor(for:)(a1, a2);
}

char *initializeBufferWithCopyOfBuffer for SceneDescriptor(char *a1, char **a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v6 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v6 = a1;
    *((void *)a1 + 1) = a2[1];
    *((_WORD *)a1 + 8) = *((_WORD *)a2 + 8);
    *((void *)a1 + 3) = a2[3];
    v60 = (int *)type metadata accessor for ImageDescriptor();
    uint64_t v7 = v60[9];
    uint64_t v8 = &v6[v7];
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_252951A08();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    uint64_t v13 = v4;
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v15 = v11;
    uint64_t v16 = v60[10];
    uint64_t v17 = &v6[v16];
    unint64_t v18 = (char *)a2 + v16;
    if (v12((char *)a2 + v16, 1, v10))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v17, v18, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v17, 0, 1, v10);
    }
    uint64_t v20 = v60[11];
    uint64_t v21 = &v6[v20];
    uint64_t v22 = (char *)a2 + v20;
    if (v12((char *)a2 + v20, 1, v10))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v21, v22, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v21, 0, 1, v10);
    }
    uint64_t v24 = v60[12];
    uint64_t v25 = *(char **)((char *)a2 + v24);
    *(void *)&v6[v24] = v25;
    uint64_t v26 = a3[5];
    uint64_t v27 = a3[6];
    uint64_t v28 = &v6[v26];
    uint64_t v29 = (uint64_t)a2 + v26;
    uint64_t v30 = *(void *)(v29 + 8);
    *(void *)uint64_t v28 = *(void *)v29;
    *((void *)v28 + 1) = v30;
    *((_DWORD *)v28 + 4) = *(_DWORD *)(v29 + 16);
    *(void *)&v6[v27] = *(char **)((char *)a2 + v27);
    uint64_t v31 = a3[8];
    v6[a3[7]] = *((unsigned char *)a2 + a3[7]);
    *(void *)&v6[v31] = *(char **)((char *)a2 + v31);
    uint64_t v32 = a3[9];
    uint64_t v33 = &v6[v32];
    uint64_t v34 = (char *)a2 + v32;
    id v35 = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v34, 1, v10))
    {
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v33, v34, *(void *)(*(void *)(v36 - 8) + 64));
      uint64_t v37 = v15;
    }
    else
    {
      uint64_t v37 = v15;
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v33, v34, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v33, 0, 1, v10);
    }
    uint64_t v38 = a3[10];
    uint64_t v39 = &v6[v38];
    uint64_t v40 = (char *)a2 + v38;
    if (v12((char *)a2 + v38, 1, v10))
    {
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v39, v40, *(void *)(*(void *)(v41 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v39, v40, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v39, 0, 1, v10);
    }
    uint64_t v42 = a3[11];
    uint64_t v43 = &v6[v42];
    uint64_t v44 = (char *)a2 + v42;
    if (v12((char *)a2 + v42, 1, v10))
    {
      uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v43, v44, *(void *)(*(void *)(v45 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v43, v44, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v43, 0, 1, v10);
    }
    uint64_t v46 = a3[12];
    uint64_t v47 = &v6[v46];
    uint64_t v48 = (char *)a2 + v46;
    if (v12((char *)a2 + v46, 1, v10))
    {
      uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v47, v48, *(void *)(*(void *)(v49 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v47, v48, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v47, 0, 1, v10);
    }
    uint64_t v50 = a3[13];
    v51 = &v6[v50];
    uint64_t v52 = (char *)a2 + v50;
    if (v12((char *)a2 + v50, 1, v10))
    {
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v51, v52, *(void *)(*(void *)(v53 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v51, v52, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v51, 0, 1, v10);
    }
    uint64_t v54 = a3[14];
    uint64_t v55 = &v6[v54];
    v56 = (char *)a2 + v54;
    if (v12((char *)a2 + v54, 1, v10))
    {
      uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v55, v56, *(void *)(*(void *)(v57 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v55, v56, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v55, 0, 1, v10);
    }
    uint64_t v58 = a3[16];
    *(void *)&v6[a3[15]] = *(char **)((char *)a2 + a3[15]);
    *(void *)&v6[v58] = *(char **)((char *)a2 + v58);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v6;
}

uint64_t destroy for SceneDescriptor(id *a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for ImageDescriptor();
  uint64_t v5 = (char *)a1 + v4[9];
  uint64_t v6 = sub_252951A08();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6)) {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v9 = (char *)a1 + v4[10];
  if (!v8(v9, 1, v6)) {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v10 = (char *)a1 + v4[11];
  if (!v8(v10, 1, v6)) {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = (char *)a1 + a2[9];
  if (!v8(v11, 1, v6)) {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
  uint64_t v12 = (char *)a1 + a2[10];
  if (!v8(v12, 1, v6)) {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  uint64_t v13 = (char *)a1 + a2[11];
  if (!v8(v13, 1, v6)) {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  }
  uint64_t v14 = (char *)a1 + a2[12];
  if (!v8(v14, 1, v6)) {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
  }
  uint64_t v15 = (char *)a1 + a2[13];
  if (!v8(v15, 1, v6)) {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
  }
  uint64_t v16 = (char *)a1 + a2[14];
  if (!v8(v16, 1, v6)) {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SceneDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v59 = (int *)type metadata accessor for ImageDescriptor();
  uint64_t v7 = v59[9];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_252951A08();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  id v13 = v6;
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v15 = v59[10];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (const void *)(a2 + v15);
  if (v12((const void *)(a2 + v15), 1, v10))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v16, v17, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
  }
  uint64_t v19 = v59[11];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (const void *)(a2 + v19);
  if (v12((const void *)(a2 + v19), 1, v10))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v20, v21, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
  }
  uint64_t v23 = v59[12];
  uint64_t v24 = *(void **)(a2 + v23);
  *(void *)(a1 + v23) = v24;
  uint64_t v25 = a3[5];
  uint64_t v26 = a3[6];
  uint64_t v27 = a1 + v25;
  uint64_t v28 = a2 + v25;
  uint64_t v29 = *(void *)(v28 + 8);
  *(void *)uint64_t v27 = *(void *)v28;
  *(void *)(v27 + 8) = v29;
  *(_DWORD *)(v27 + 16) = *(_DWORD *)(v28 + 16);
  *(void *)(a1 + v26) = *(void *)(a2 + v26);
  uint64_t v30 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v30) = *(void *)(a2 + v30);
  uint64_t v31 = a3[9];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (const void *)(a2 + v31);
  id v34 = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v33, 1, v10))
  {
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
    uint64_t v36 = v11;
  }
  else
  {
    uint64_t v36 = v11;
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v32, v33, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v32, 0, 1, v10);
  }
  uint64_t v37 = a3[10];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (const void *)(a2 + v37);
  if (v12((const void *)(a2 + v37), 1, v10))
  {
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v38, v39, *(void *)(*(void *)(v40 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v36 + 16))(v38, v39, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v36 + 56))(v38, 0, 1, v10);
  }
  uint64_t v41 = a3[11];
  uint64_t v42 = (void *)(a1 + v41);
  uint64_t v43 = (const void *)(a2 + v41);
  if (v12((const void *)(a2 + v41), 1, v10))
  {
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v42, v43, *(void *)(*(void *)(v44 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v36 + 16))(v42, v43, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v36 + 56))(v42, 0, 1, v10);
  }
  uint64_t v45 = a3[12];
  uint64_t v46 = (void *)(a1 + v45);
  uint64_t v47 = (const void *)(a2 + v45);
  if (v12((const void *)(a2 + v45), 1, v10))
  {
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v46, v47, *(void *)(*(void *)(v48 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v36 + 16))(v46, v47, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v36 + 56))(v46, 0, 1, v10);
  }
  uint64_t v49 = a3[13];
  uint64_t v50 = (void *)(a1 + v49);
  v51 = (const void *)(a2 + v49);
  if (v12((const void *)(a2 + v49), 1, v10))
  {
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v50, v51, *(void *)(*(void *)(v52 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v36 + 16))(v50, v51, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v36 + 56))(v50, 0, 1, v10);
  }
  uint64_t v53 = a3[14];
  uint64_t v54 = (void *)(a1 + v53);
  uint64_t v55 = (const void *)(a2 + v53);
  if (v12((const void *)(a2 + v53), 1, v10))
  {
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v54, v55, *(void *)(*(void *)(v56 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v36 + 16))(v54, v55, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v36 + 56))(v54, 0, 1, v10);
  }
  uint64_t v57 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)(a1 + v57) = *(void *)(a2 + v57);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SceneDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = (int *)type metadata accessor for ImageDescriptor();
  uint64_t v10 = v9[9];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = sub_252951A08();
  uint64_t v75 = *(void *)(v13 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v75 + 48);
  int v15 = v14(v11, 1, v13);
  int v16 = v14(v12, 1, v13);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v75 + 16))(v11, v12, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v75 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v75 + 8))(v11, v13);
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v75 + 24))(v11, v12, v13);
LABEL_7:
  uint64_t v18 = v9[10];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  int v21 = v14((void *)(a1 + v18), 1, v13);
  int v22 = v14(v20, 1, v13);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v75 + 16))(v19, v20, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v75 + 56))(v19, 0, 1, v13);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v75 + 8))(v19, v13);
LABEL_12:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v75 + 24))(v19, v20, v13);
LABEL_13:
  uint64_t v24 = v9[11];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  int v27 = v14((void *)(a1 + v24), 1, v13);
  int v28 = v14(v26, 1, v13);
  if (v27)
  {
    if (v28)
    {
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
      uint64_t v30 = v75;
    }
    else
    {
      uint64_t v30 = v75;
      (*(void (**)(void *, void *, uint64_t))(v75 + 16))(v25, v26, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v75 + 56))(v25, 0, 1, v13);
    }
  }
  else
  {
    uint64_t v30 = v75;
    if (v28)
    {
      (*(void (**)(void *, uint64_t))(v75 + 8))(v25, v13);
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v25, v26, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v75 + 24))(v25, v26, v13);
    }
  }
  uint64_t v32 = v9[12];
  uint64_t v33 = *(void **)(a2 + v32);
  id v34 = *(void **)(a1 + v32);
  *(void *)(a1 + v32) = v33;
  id v35 = v33;

  uint64_t v36 = a3[5];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  *(void *)uint64_t v37 = *(void *)(a2 + v36);
  *(void *)(v37 + 8) = *(void *)(a2 + v36 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(v37 + 16) = *(_DWORD *)(v38 + 16);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[9];
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = (void *)(a2 + v39);
  LODWORD(v38) = v14((void *)(a1 + v39), 1, v13);
  int v42 = v14(v41, 1, v13);
  if (v38)
  {
    if (!v42)
    {
      (*(void (**)(void *, void *, uint64_t))(v30 + 16))(v40, v41, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v40, 0, 1, v13);
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v42)
  {
    (*(void (**)(void *, uint64_t))(v30 + 8))(v40, v13);
LABEL_27:
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v40, v41, *(void *)(*(void *)(v43 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(void *, void *, uint64_t))(v30 + 24))(v40, v41, v13);
LABEL_28:
  uint64_t v44 = a3[10];
  uint64_t v45 = (void *)(a1 + v44);
  uint64_t v46 = (void *)(a2 + v44);
  int v47 = v14((void *)(a1 + v44), 1, v13);
  int v48 = v14(v46, 1, v13);
  if (v47)
  {
    if (!v48)
    {
      (*(void (**)(void *, void *, uint64_t))(v30 + 16))(v45, v46, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v45, 0, 1, v13);
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (v48)
  {
    (*(void (**)(void *, uint64_t))(v30 + 8))(v45, v13);
LABEL_33:
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v45, v46, *(void *)(*(void *)(v49 - 8) + 64));
    goto LABEL_34;
  }
  (*(void (**)(void *, void *, uint64_t))(v30 + 24))(v45, v46, v13);
LABEL_34:
  uint64_t v50 = a3[11];
  v51 = (void *)(a1 + v50);
  uint64_t v52 = (void *)(a2 + v50);
  int v53 = v14((void *)(a1 + v50), 1, v13);
  int v54 = v14(v52, 1, v13);
  if (v53)
  {
    if (!v54)
    {
      (*(void (**)(void *, void *, uint64_t))(v30 + 16))(v51, v52, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v51, 0, 1, v13);
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if (v54)
  {
    (*(void (**)(void *, uint64_t))(v30 + 8))(v51, v13);
LABEL_39:
    uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v51, v52, *(void *)(*(void *)(v55 - 8) + 64));
    goto LABEL_40;
  }
  (*(void (**)(void *, void *, uint64_t))(v30 + 24))(v51, v52, v13);
LABEL_40:
  uint64_t v56 = a3[12];
  uint64_t v57 = (void *)(a1 + v56);
  uint64_t v58 = (void *)(a2 + v56);
  int v59 = v14((void *)(a1 + v56), 1, v13);
  int v60 = v14(v58, 1, v13);
  if (v59)
  {
    if (!v60)
    {
      (*(void (**)(void *, void *, uint64_t))(v30 + 16))(v57, v58, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v57, 0, 1, v13);
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if (v60)
  {
    (*(void (**)(void *, uint64_t))(v30 + 8))(v57, v13);
LABEL_45:
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v57, v58, *(void *)(*(void *)(v61 - 8) + 64));
    goto LABEL_46;
  }
  (*(void (**)(void *, void *, uint64_t))(v30 + 24))(v57, v58, v13);
LABEL_46:
  uint64_t v62 = a3[13];
  v63 = (void *)(a1 + v62);
  v64 = (void *)(a2 + v62);
  int v65 = v14((void *)(a1 + v62), 1, v13);
  int v66 = v14(v64, 1, v13);
  if (v65)
  {
    if (!v66)
    {
      (*(void (**)(void *, void *, uint64_t))(v30 + 16))(v63, v64, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v63, 0, 1, v13);
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  if (v66)
  {
    (*(void (**)(void *, uint64_t))(v30 + 8))(v63, v13);
LABEL_51:
    uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v63, v64, *(void *)(*(void *)(v67 - 8) + 64));
    goto LABEL_52;
  }
  (*(void (**)(void *, void *, uint64_t))(v30 + 24))(v63, v64, v13);
LABEL_52:
  uint64_t v68 = a3[14];
  v69 = (void *)(a1 + v68);
  v70 = (void *)(a2 + v68);
  int v71 = v14((void *)(a1 + v68), 1, v13);
  int v72 = v14(v70, 1, v13);
  if (!v71)
  {
    if (!v72)
    {
      (*(void (**)(void *, void *, uint64_t))(v30 + 24))(v69, v70, v13);
      goto LABEL_58;
    }
    (*(void (**)(void *, uint64_t))(v30 + 8))(v69, v13);
    goto LABEL_57;
  }
  if (v72)
  {
LABEL_57:
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v69, v70, *(void *)(*(void *)(v73 - 8) + 64));
    goto LABEL_58;
  }
  (*(void (**)(void *, void *, uint64_t))(v30 + 16))(v69, v70, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v69, 0, 1, v13);
LABEL_58:
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SceneDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v6 = (int *)type metadata accessor for ImageDescriptor();
  uint64_t v7 = v6[9];
  id v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_252951A08();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = v6[10];
  int v15 = (void *)(a1 + v14);
  int v16 = (const void *)(a2 + v14);
  if (v12((const void *)(a2 + v14), 1, v10))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v15, v16, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v15, 0, 1, v10);
  }
  uint64_t v18 = v6[11];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  if (v12((const void *)(a2 + v18), 1, v10))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v19, v20, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v19, 0, 1, v10);
  }
  *(void *)(a1 + v6[12]) = *(void *)(a2 + v6[12]);
  uint64_t v22 = a3[5];
  uint64_t v23 = a3[6];
  uint64_t v24 = a1 + v22;
  uint64_t v25 = a2 + v22;
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  *(_DWORD *)(v24 + 16) = *(_DWORD *)(v25 + 16);
  *(void *)(a1 + v23) = *(void *)(a2 + v23);
  uint64_t v26 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v26) = *(void *)(a2 + v26);
  uint64_t v27 = a3[9];
  int v28 = (void *)(a1 + v27);
  uint64_t v29 = (const void *)(a2 + v27);
  if (v12((const void *)(a2 + v27), 1, v10))
  {
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v28, v29, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v28, 0, 1, v10);
  }
  uint64_t v31 = a3[10];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (const void *)(a2 + v31);
  if (v12((const void *)(a2 + v31), 1, v10))
  {
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v32, v33, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v32, 0, 1, v10);
  }
  uint64_t v35 = a3[11];
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (const void *)(a2 + v35);
  if (v12((const void *)(a2 + v35), 1, v10))
  {
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v36, v37, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v36, 0, 1, v10);
  }
  uint64_t v39 = a3[12];
  uint64_t v40 = (void *)(a1 + v39);
  uint64_t v41 = (const void *)(a2 + v39);
  if (v12((const void *)(a2 + v39), 1, v10))
  {
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v40, v41, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v40, 0, 1, v10);
  }
  uint64_t v43 = a3[13];
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = (const void *)(a2 + v43);
  if (v12((const void *)(a2 + v43), 1, v10))
  {
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v44, v45, *(void *)(*(void *)(v46 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v44, v45, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v44, 0, 1, v10);
  }
  uint64_t v47 = a3[14];
  int v48 = (void *)(a1 + v47);
  uint64_t v49 = (const void *)(a2 + v47);
  if (v12((const void *)(a2 + v47), 1, v10))
  {
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v48, v49, *(void *)(*(void *)(v50 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v48, v49, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v48, 0, 1, v10);
  }
  uint64_t v51 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)(a1 + v51) = *(void *)(a2 + v51);
  return a1;
}

uint64_t assignWithTake for SceneDescriptor(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v7 = (int *)type metadata accessor for ImageDescriptor();
  uint64_t v8 = v7[9];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = sub_252951A08();
  uint64_t v74 = *(void *)(v11 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v74 + 48);
  int v13 = v12(v9, 1, v11);
  int v14 = v12(v10, 1, v11);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v74 + 32))(v9, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v74 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v74 + 8))(v9, v11);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v74 + 40))(v9, v10, v11);
LABEL_7:
  uint64_t v16 = v7[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  int v19 = v12((void *)(a1 + v16), 1, v11);
  int v20 = v12(v18, 1, v11);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v74 + 32))(v17, v18, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v74 + 56))(v17, 0, 1, v11);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v74 + 8))(v17, v11);
LABEL_12:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v74 + 40))(v17, v18, v11);
LABEL_13:
  uint64_t v22 = v7[11];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  int v25 = v12((void *)(a1 + v22), 1, v11);
  int v26 = v12(v24, 1, v11);
  if (v25)
  {
    if (v26)
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
      uint64_t v28 = v74;
    }
    else
    {
      uint64_t v28 = v74;
      (*(void (**)(void *, void *, uint64_t))(v74 + 32))(v23, v24, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v74 + 56))(v23, 0, 1, v11);
    }
  }
  else
  {
    uint64_t v28 = v74;
    if (v26)
    {
      (*(void (**)(void *, uint64_t))(v74 + 8))(v23, v11);
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
      memcpy(v23, v24, *(void *)(*(void *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v74 + 40))(v23, v24, v11);
    }
  }
  uint64_t v30 = v7[12];
  uint64_t v31 = *(void **)(a1 + v30);
  *(void *)(a1 + v30) = *(void *)(a2 + v30);

  uint64_t v32 = a3[5];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  uint64_t v35 = *(void *)(a2 + v32 + 8);
  *(void *)uint64_t v33 = *(void *)(a2 + v32);
  *(void *)(v33 + 8) = v35;
  swift_bridgeObjectRelease();
  *(_DWORD *)(v33 + 16) = *(_DWORD *)(v34 + 16);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  uint64_t v36 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(void *)(a1 + v36) = *(void *)(a2 + v36);
  swift_bridgeObjectRelease();
  uint64_t v37 = a3[9];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  int v40 = v12((void *)(a1 + v37), 1, v11);
  int v41 = v12(v39, 1, v11);
  if (v40)
  {
    if (!v41)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v38, v39, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v38, 0, 1, v11);
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v41)
  {
    (*(void (**)(void *, uint64_t))(v28 + 8))(v38, v11);
LABEL_27:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v38, v39, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v38, v39, v11);
LABEL_28:
  uint64_t v43 = a3[10];
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = (void *)(a2 + v43);
  int v46 = v12((void *)(a1 + v43), 1, v11);
  int v47 = v12(v45, 1, v11);
  if (v46)
  {
    if (!v47)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v44, v45, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v44, 0, 1, v11);
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (v47)
  {
    (*(void (**)(void *, uint64_t))(v28 + 8))(v44, v11);
LABEL_33:
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v44, v45, *(void *)(*(void *)(v48 - 8) + 64));
    goto LABEL_34;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v44, v45, v11);
LABEL_34:
  uint64_t v49 = a3[11];
  uint64_t v50 = (void *)(a1 + v49);
  uint64_t v51 = (void *)(a2 + v49);
  int v52 = v12((void *)(a1 + v49), 1, v11);
  int v53 = v12(v51, 1, v11);
  if (v52)
  {
    if (!v53)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v50, v51, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v50, 0, 1, v11);
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if (v53)
  {
    (*(void (**)(void *, uint64_t))(v28 + 8))(v50, v11);
LABEL_39:
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v50, v51, *(void *)(*(void *)(v54 - 8) + 64));
    goto LABEL_40;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v50, v51, v11);
LABEL_40:
  uint64_t v55 = a3[12];
  uint64_t v56 = (void *)(a1 + v55);
  uint64_t v57 = (void *)(a2 + v55);
  int v58 = v12((void *)(a1 + v55), 1, v11);
  int v59 = v12(v57, 1, v11);
  if (v58)
  {
    if (!v59)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v56, v57, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v56, 0, 1, v11);
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  if (v59)
  {
    (*(void (**)(void *, uint64_t))(v28 + 8))(v56, v11);
LABEL_45:
    uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v56, v57, *(void *)(*(void *)(v60 - 8) + 64));
    goto LABEL_46;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v56, v57, v11);
LABEL_46:
  uint64_t v61 = a3[13];
  uint64_t v62 = (void *)(a1 + v61);
  v63 = (void *)(a2 + v61);
  int v64 = v12((void *)(a1 + v61), 1, v11);
  int v65 = v12(v63, 1, v11);
  if (v64)
  {
    if (!v65)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v62, v63, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v62, 0, 1, v11);
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  if (v65)
  {
    (*(void (**)(void *, uint64_t))(v28 + 8))(v62, v11);
LABEL_51:
    uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v62, v63, *(void *)(*(void *)(v66 - 8) + 64));
    goto LABEL_52;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v62, v63, v11);
LABEL_52:
  uint64_t v67 = a3[14];
  uint64_t v68 = (void *)(a1 + v67);
  v69 = (void *)(a2 + v67);
  int v70 = v12((void *)(a1 + v67), 1, v11);
  int v71 = v12(v69, 1, v11);
  if (!v70)
  {
    if (!v71)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v68, v69, v11);
      goto LABEL_58;
    }
    (*(void (**)(void *, uint64_t))(v28 + 8))(v68, v11);
    goto LABEL_57;
  }
  if (v71)
  {
LABEL_57:
    uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    memcpy(v68, v69, *(void *)(*(void *)(v72 - 8) + 64));
    goto LABEL_58;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v68, v69, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v68, 0, 1, v11);
LABEL_58:
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneDescriptor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2529487CC);
}

uint64_t sub_2529487CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ImageDescriptor();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 36);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for SceneDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252948910);
}

uint64_t sub_252948910(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for ImageDescriptor();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 36);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_252948A40()
{
  type metadata accessor for ImageDescriptor();
  if (v0 <= 0x3F)
  {
    sub_25290062C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_252948B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C325C8);
  v4[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252948BD0, 0, 0);
}

uint64_t sub_252948BD0()
{
  id v1 = objc_msgSend(self, sel_processInfo);
  objc_msgSend(v1, sel_systemUptime);
  v0[8] = v2;

  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_252948C9C;
  uint64_t v4 = v0[7];
  return sub_2528DE6B8(v4);
}

uint64_t sub_252948C9C()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_252948E34;
  }
  else {
    uint64_t v2 = sub_252948DB0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_252948DB0()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 24);
  sub_2528D01CC(0, *(double *)(v0 + 64));
  sub_252949B84(v1, v2);
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_252948E34()
{
  if (*(void *)(v0 + 32))
  {
    swift_getObjectType();
    uint64_t v1 = sub_252951BF8();
    uint64_t v3 = v2;
  }
  else
  {
    uint64_t v1 = 0;
    uint64_t v3 = 0;
  }
  return MEMORY[0x270FA2498](sub_252948EC0, v1, v3);
}

uint64_t sub_252948EC0()
{
  v0[2] = v0[10];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269C323B0);
  swift_willThrowTypedImpl();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_252948F54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[19] = a3;
  v4[20] = v3;
  v4[17] = a1;
  v4[18] = a2;
  uint64_t v5 = type metadata accessor for ImageDescriptor();
  v4[21] = v5;
  v4[22] = *(void *)(v5 - 8);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252949028, 0, 0);
}

uint64_t sub_252949028()
{
  *(void *)(v0 + 200) = **(void **)(v0 + 160);
  return MEMORY[0x270FA2498](sub_252949050, 0, 0);
}

uint64_t sub_252949050()
{
  uint64_t v1 = v0 + 2;
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[23];
  v0[2] = v0;
  v0[7] = v3;
  v0[3] = sub_252949120;
  uint64_t v4 = swift_continuation_init();
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_continuation);
  swift_beginAccess();
  *uint64_t v5 = v4;
  return MEMORY[0x270FA23F0](v1);
}

uint64_t sub_252949120()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 208) = v2;
  if (v2)
  {
    swift_willThrow();
    uint64_t v3 = sub_252949328;
  }
  else
  {
    sub_2528AE62C(*(void *)(v1 + 184), *(void *)(v1 + 192));
    uint64_t v3 = sub_252949244;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_252949244()
{
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 176);
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v5 = (void *)(**(void **)(v0 + 160) + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_continuation);
  swift_beginAccess();
  *uint64_t v5 = 0;
  sub_2528AE62C(v1, v4);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_252949328()
{
  if (*(void *)(v0 + 144))
  {
    swift_getObjectType();
    uint64_t v1 = sub_252951BF8();
    uint64_t v3 = v2;
  }
  else
  {
    uint64_t v1 = 0;
    uint64_t v3 = 0;
  }
  return MEMORY[0x270FA2498](sub_2529493B4, v1, v3);
}

uint64_t sub_2529493B4()
{
  v0[16] = v0[26];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269C323B0);
  swift_willThrowTypedImpl();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

id CameraSource.ImageDescriptors.makeAsyncIterator()@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)((char *)*v1 + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_cameraSession);
  id v5 = v3;
  id result = objc_msgSend(v4, sel_startRunning);
  *a1 = v5;
  return result;
}

id sub_2529494B0@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  id result = objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_cameraSession), sel_startRunning);
  *a1 = v3;
  return result;
}

uint64_t CameraSource.ImageDescriptors.Iterator.next()(uint64_t a1)
{
  v2[16] = a1;
  v2[17] = v1;
  uint64_t v3 = type metadata accessor for ImageDescriptor();
  v2[18] = v3;
  v2[19] = *(void *)(v3 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2529495C4, 0, 0);
}

uint64_t sub_2529495C4()
{
  *(void *)(v0 + 176) = **(void **)(v0 + 136);
  return MEMORY[0x270FA2498](sub_2529495EC, 0, 0);
}

uint64_t sub_2529495EC()
{
  uint64_t v1 = v0 + 2;
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[20];
  v0[2] = v0;
  v0[7] = v3;
  v0[3] = sub_2529496BC;
  uint64_t v4 = swift_continuation_init();
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_continuation);
  swift_beginAccess();
  *uint64_t v5 = v4;
  return MEMORY[0x270FA23F0](v1);
}

uint64_t sub_2529496BC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 184) = v2;
  if (v2)
  {
    swift_willThrow();
    uint64_t v3 = sub_2529498C0;
  }
  else
  {
    sub_2528AE62C(*(void *)(v1 + 160), *(void *)(v1 + 168));
    uint64_t v3 = sub_2529497E0;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2529497E0()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v5 = (void *)(**(void **)(v0 + 136) + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_continuation);
  swift_beginAccess();
  *uint64_t v5 = 0;
  sub_2528AE62C(v1, v4);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_2529498C0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_25294992C(uint64_t a1)
{
  unint64_t result = sub_252949954();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_252949954()
{
  unint64_t result = qword_269C33448;
  if (!qword_269C33448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C33448);
  }
  return result;
}

unint64_t sub_2529499AC()
{
  unint64_t result = qword_269C33450[0];
  if (!qword_269C33450[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269C33450);
  }
  return result;
}

uint64_t sub_252949A00(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2528A91AC;
  return CameraSource.ImageDescriptors.Iterator.next()(a1);
}

uint64_t sub_252949A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  unint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_269C33468 + dword_269C33468);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_2528DF0F8;
  return v10(a1, a2, a3);
}

ValueMetadata *type metadata accessor for CameraSource.ImageDescriptors()
{
  return &type metadata for CameraSource.ImageDescriptors;
}

ValueMetadata *type metadata accessor for CameraSource.ImageDescriptors.Iterator()
{
  return &type metadata for CameraSource.ImageDescriptors.Iterator;
}

uint64_t sub_252949B84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C325C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for Yuv2RgbKernel.Dummy()
{
  return self;
}

uint64_t sub_252949C10(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = objc_msgSend(a1, sel_computeCommandEncoder);
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = (void *)sub_252951AB8();
    objc_msgSend(v10, sel_setLabel_, v11);

    objc_msgSend(v10, sel_setComputePipelineState_, a5);
    objc_msgSend(v10, sel_setTexture_atIndex_, a2, 0);
    objc_msgSend(v10, sel_setTexture_atIndex_, a3, 1);
    objc_msgSend(v10, sel_setTexture_atIndex_, a4, 2);
    uint64_t v12 = (uint64_t)objc_msgSend(a5, sel_threadExecutionWidth);
    uint64_t v13 = (uint64_t)objc_msgSend(a5, sel_maxTotalThreadsPerThreadgroup);
    if (v12)
    {
      if (v13 != 0x8000000000000000 || v12 != -1)
      {
        uint64_t v14 = v13 / v12;
        v17[0] = objc_msgSend(a4, sel_width);
        v17[1] = objc_msgSend(a4, sel_height);
        v17[2] = 1;
        v16[0] = v12;
        v16[1] = v14;
        v16[2] = 1;
        objc_msgSend(v10, sel_dispatchThreads_threadsPerThreadgroup_, v17, v16);
        objc_msgSend(v10, sel_endEncoding);
        return swift_unknownObjectRelease();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  uint64_t result = sub_252951F28();
  __break(1u);
  return result;
}

void sub_252949E0C(void *a1)
{
  v23[1] = *(id *)MEMORY[0x263EF8340];
  type metadata accessor for Yuv2RgbKernel.Dummy();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_269C32880);
  uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (void *)sub_252951AB8();
  uint64_t v8 = (void *)sub_252951AB8();
  id v9 = objc_msgSend(v3, sel_URLForResource_withExtension_, v7, v8);

  MEMORY[0x270FA5388](v10);
  if (v9)
  {
    sub_252951238();

    uint64_t v11 = sub_252951268();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 0, 1, v11);
  }
  else
  {
    uint64_t v11 = sub_252951268();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  }
  uint64_t v12 = sub_2528F1B8C((uint64_t)v6, (uint64_t)v6);
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2528F1BF4((uint64_t)v6, (uint64_t)v13);
  sub_252951268();
  uint64_t v14 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v11) == 1) {
    __break(1u);
  }
  uint64_t v15 = (void *)sub_252951208();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v13, v11);
  v23[0] = 0;
  id v16 = objc_msgSend(a1, sel_newLibraryWithURL_error_, v15, v23);

  id v17 = v23[0];
  if (!v16)
  {
    uint64_t v21 = v17;
    sub_2529511A8();

    swift_willThrow();
    swift_unknownObjectRelease();

LABEL_11:
    sub_2528F1C5C((uint64_t)v6);
    return;
  }
  uint64_t v18 = (void *)sub_252951AB8();
  id v19 = objc_msgSend(v16, sel_newFunctionWithName_, v18);

  if (v19)
  {
    v23[0] = 0;
    if (objc_msgSend(a1, sel_newComputePipelineStateWithFunction_error_, v19, v23))
    {
      id v20 = v23[0];
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
      sub_2528F1C5C((uint64_t)v6);
      return;
    }
    id v22 = v23[0];
    sub_2529511A8();

    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    goto LABEL_11;
  }
  __break(1u);
}

uint64_t destroy for Yuv2RgbKernel()
{
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

void *_s5Human13Yuv2RgbKernelVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

void *assignWithCopy for Yuv2RgbKernel(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t assignWithTake for Yuv2RgbKernel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Yuv2RgbKernel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Yuv2RgbKernel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Yuv2RgbKernel()
{
  return &type metadata for Yuv2RgbKernel;
}

uint64_t initializeBufferWithCopyOfBuffer for PersonDetector(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for PersonDetector(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
}

uint64_t assignWithCopy for PersonDetector(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v7 = *(void **)(a2 + 16);
  uint64_t v8 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v7;
  id v9 = v7;

  return a1;
}

uint64_t assignWithTake for PersonDetector(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for PersonDetector(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PersonDetector(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PersonDetector()
{
  return &type metadata for PersonDetector;
}

__CVBuffer *sub_25294A5B8(__CVBuffer *a1, unsigned __int8 *a2, char a3, void *a4, uint64_t a5, void *a6)
{
  pixelBufferOut[1] = *(CVPixelBufferRef *)MEMORY[0x263EF8340];
  uint64_t v10 = *a2;
  int64_t Width = CVPixelBufferGetWidth(a1);
  int64_t Height = CVPixelBufferGetHeight(a1);
  CVPixelBufferRef pixelBuffer = a1;
  if (Width >= Height)
  {
    uint64_t v21 = a1;
  }
  else
  {
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00648]), sel_initWithCVPixelBuffer_, a1);
    id v14 = objc_msgSend(v13, sel_imageByApplyingCGOrientation_, 5);

    pixelBufferOut[0] = 0;
    id v15 = v14;
    objc_msgSend(v15, sel_extent);
    double v16 = CGRectGetWidth(v72);
    if ((~*(void *)&v16 & 0x7FF0000000000000) == 0)
    {
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }
    if (v16 <= -9.22337204e18)
    {
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    if (v16 >= 9.22337204e18)
    {
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    objc_msgSend(v15, sel_extent);
    double v17 = CGRectGetHeight(v73);
    if ((~*(void *)&v17 & 0x7FF0000000000000) == 0)
    {
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    if (v17 <= -9.22337204e18)
    {
LABEL_55:
      __break(1u);
      goto LABEL_56;
    }
    if (v17 >= 9.22337204e18)
    {
LABEL_56:
      __break(1u);
LABEL_57:
      __break(1u);
    }
    CVPixelBufferCreate(0, (uint64_t)v16, (uint64_t)v17, 0x42475241u, 0, pixelBufferOut);
    if (pixelBufferOut[0])
    {
      uint64_t v18 = pixelBufferOut[0];
      id v19 = a6;
      id v20 = v18;
      objc_msgSend(v19, sel_render_toCVPixelBuffer_, v15, v18);

      goto LABEL_13;
    }

    uint64_t v21 = pixelBuffer;
  }
  id v20 = v21;
LABEL_13:
  pixelBufferOut[0] = 0;
  id v22 = objc_msgSend(a4, sel_resultForPixelBuffer_orientation_error_, v20, 1, pixelBufferOut);
  uint64_t v23 = v20;
  if (!v22)
  {
    uint64_t v56 = pixelBufferOut[0];
    sub_2529511A8();

    swift_willThrow();
    return v56;
  }
  int v65 = v20;
  uint64_t v24 = *MEMORY[0x263F20A00];
  int v25 = v22;
  int v26 = pixelBufferOut[0];
  int v64 = v25;
  id v27 = objc_msgSend(v25, sel_detectedObjectsForCategory_, v24);
  if (!v27)
  {
    unint64_t v29 = MEMORY[0x263F8EE78];
    if (!(MEMORY[0x263F8EE78] >> 62)) {
      goto LABEL_16;
    }
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_252951F38();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  uint64_t v28 = v27;
  sub_25294B4C0();
  unint64_t v29 = sub_252951B98();

  if (v29 >> 62) {
    goto LABEL_34;
  }
LABEL_16:
  uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  int64_t v67 = Width;
  char v63 = a3;
  uint64_t v62 = v10;
  int64_t v66 = Height;
  if (v30)
  {
    if (v30 < 1) {
      goto LABEL_57;
    }
    uint64_t v31 = 0;
    uint64_t v32 = (void *)MEMORY[0x263F8EE78];
    unint64_t v69 = v29;
    unint64_t v70 = v29 & 0xC000000000000001;
    while (1)
    {
      id v33 = v70 ? (id)MEMORY[0x2533C0860](v31, v29) : *(id *)(v29 + 8 * v31 + 32);
      uint64_t v34 = v33;
      unint64_t v35 = (unint64_t)objc_msgSend(v33, sel_objectID, v62);
      if ((v35 & 0x8000000000000000) != 0) {
        break;
      }
      unint64_t v36 = v35;
      unint64_t v37 = (unint64_t)objc_msgSend(v34, sel_groupID);
      if ((v37 & 0x8000000000000000) != 0) {
        goto LABEL_49;
      }
      unint64_t v38 = v37;
      unint64_t v39 = (unint64_t)objc_msgSend(v34, sel_confidence);
      if ((v39 & 0x8000000000000000) != 0) {
        goto LABEL_50;
      }
      unint64_t v40 = v39;
      objc_msgSend(v34, sel_boundingBox);
      double v42 = v41;
      double v44 = v43;
      objc_msgSend(v34, sel_boundingBox);
      double v46 = v45;
      double v48 = v47;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v32 = sub_2528C4E78(0, v32[2] + 1, 1, v32);
      }
      unint64_t v50 = v32[2];
      unint64_t v49 = v32[3];
      if (v50 >= v49 >> 1) {
        uint64_t v32 = sub_2528C4E78((void *)(v49 > 1), v50 + 1, 1, v32);
      }
      ++v31;
      float v51 = v42;
      float v52 = v44;
      float v53 = v46;
      v32[2] = v50 + 1;
      uint64_t v54 = (float *)&v32[5 * v50];
      *((void *)v54 + 4) = v36;
      float v55 = v48;
      v54[10] = v51;
      v54[11] = v52;
      v54[12] = v53;
      v54[13] = v55;
      *((void *)v54 + 7) = v38;
      *((void *)v54 + 8) = v40;

      unint64_t v29 = v69;
      if (v30 == v31) {
        goto LABEL_36;
      }
    }
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  uint64_t v32 = (void *)MEMORY[0x263F8EE78];
LABEL_36:
  swift_bridgeObjectRelease();
  if (CVPixelBufferGetPlaneCount(pixelBuffer) == 2)
  {
    int64_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
    int64_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  }
  else
  {
    int64_t WidthOfPlane = CVPixelBufferGetWidth(pixelBuffer);
    int64_t HeightOfPlane = CVPixelBufferGetHeight(pixelBuffer);
  }
  int v59 = sub_25294B298((uint64_t)v32, (float)WidthOfPlane, (float)HeightOfPlane);
  swift_bridgeObjectRelease();
  if (v67 >= v66)
  {
    switch(v62)
    {
      case 1:
        uint64_t v60 = (__CVBuffer *)sub_25294B0A4((uint64_t)v59, v63 & 1);
        break;
      case 2:
        uint64_t v60 = (__CVBuffer *)sub_25294AEB8((uint64_t)v59, v63 & 1);
        break;
      case 3:
        uint64_t v60 = (__CVBuffer *)sub_25294AB84((uint64_t)v59, v63 & 1);
        break;
      default:
        uint64_t v60 = (__CVBuffer *)sub_25294ACD0((uint64_t)v59, v63 & 1);
        break;
    }
  }
  else
  {
    uint64_t v60 = (__CVBuffer *)sub_25294B3B8((uint64_t)v59);
  }
  uint64_t v56 = v60;

  swift_bridgeObjectRelease();
  return v56;
}

void *sub_25294AB84(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    if (v3)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_2528C4E78(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v6 = 0;
      unint64_t v7 = v4[2];
      uint64_t v8 = 5 * v7;
      do
      {
        uint64_t v9 = *(void *)(a1 + v6 + 32);
        float v10 = *(float *)(a1 + v6 + 40);
        *(void *)&long long v5 = *(void *)(a1 + v6 + 44);
        int v11 = *(_DWORD *)(a1 + v6 + 52);
        long long v12 = *(_OWORD *)(a1 + v6 + 56);
        unint64_t v13 = v4[3];
        unint64_t v14 = v7 + 1;
        if (v7 >= v13 >> 1)
        {
          long long v18 = v5;
          long long v19 = *(_OWORD *)(a1 + v6 + 56);
          double v16 = sub_2528C4E78((void *)(v13 > 1), v7 + 1, 1, v4);
          long long v5 = v18;
          long long v12 = v19;
          uint64_t v4 = v16;
        }
        v4[2] = v14;
        id v15 = &v4[v8 + v6 / 8];
        v15[4] = v9;
        *((float *)v15 + 10) = 1.0 - (float)(v10 + *((float *)&v5 + 1));
        *(void *)((char *)v15 + 44) = v5;
        *((_DWORD *)v15 + 13) = v11;
        *(_OWORD *)(v15 + 7) = v12;
        v6 += 40;
        unint64_t v7 = v14;
        --v3;
      }
      while (v3);
      swift_bridgeObjectRelease();
    }
    else
    {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    return (void *)a1;
  }
  return v4;
}

void *sub_25294ACD0(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if ((a2 & 1) == 0)
  {
    if (v3)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_2528C4E78(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v15 = 0;
      unint64_t v16 = v4[2];
      uint64_t v17 = 5 * v16;
      do
      {
        uint64_t v18 = *(void *)(a1 + v15 + 32);
        int v19 = *(_DWORD *)(a1 + v15 + 40);
        float v20 = *(float *)(a1 + v15 + 44);
        int v21 = *(_DWORD *)(a1 + v15 + 48);
        float v22 = *(float *)(a1 + v15 + 52);
        long long v23 = *(_OWORD *)(a1 + v15 + 56);
        unint64_t v24 = v4[3];
        unint64_t v25 = v16 + 1;
        if (v16 >= v24 >> 1)
        {
          long long v31 = *(_OWORD *)(a1 + v15 + 56);
          id v27 = sub_2528C4E78((void *)(v24 > 1), v16 + 1, 1, v4);
          long long v23 = v31;
          uint64_t v4 = v27;
        }
        v4[2] = v25;
        int v26 = &v4[v17 + v15 / 8];
        v26[4] = v18;
        *((float *)v26 + 10) = 1.0 - (float)(v20 + v22);
        *((_DWORD *)v26 + 11) = v19;
        *((float *)v26 + 12) = v22;
        *((_DWORD *)v26 + 13) = v21;
        *(_OWORD *)(v26 + 7) = v23;
        v15 += 40;
        unint64_t v16 = v25;
        --v3;
      }
      while (v3);
      goto LABEL_13;
    }
    return (void *)MEMORY[0x263F8EE78];
  }
  if (!v3) {
    return (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2528C4E78(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v5 = 0;
  unint64_t v6 = v4[2];
  uint64_t v7 = 5 * v6;
  do
  {
    uint64_t v8 = *(void *)(a1 + v5 + 32);
    int32x4_t v9 = *(int32x4_t *)(a1 + v5 + 40);
    long long v10 = *(_OWORD *)(a1 + v5 + 56);
    unint64_t v11 = v4[3];
    unint64_t v12 = v6 + 1;
    if (v6 >= v11 >> 1)
    {
      int32x4_t v29 = *(int32x4_t *)(a1 + v5 + 40);
      long long v30 = *(_OWORD *)(a1 + v5 + 56);
      unint64_t v14 = sub_2528C4E78((void *)(v11 > 1), v6 + 1, 1, v4);
      int32x4_t v9 = v29;
      long long v10 = v30;
      uint64_t v4 = v14;
    }
    v4[2] = v12;
    unint64_t v13 = &v4[v7 + v5 / 8];
    v13[4] = v8;
    *(int32x4_t *)(v13 + 5) = vrev64q_s32(v9);
    *(_OWORD *)(v13 + 7) = v10;
    v5 += 40;
    unint64_t v6 = v12;
    --v3;
  }
  while (v3);
LABEL_13:
  swift_bridgeObjectRelease();
  return v4;
}

void *sub_25294AEB8(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if ((a2 & 1) == 0)
  {
    if (v3)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_2528C4E78(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v17 = 0;
      unint64_t v18 = v4[2];
      uint64_t v19 = 5 * v18;
      __asm { FMOV            V8.2S, #1.0 }
      do
      {
        uint64_t v25 = *(void *)(a1 + v17 + 32);
        long long v26 = *(_OWORD *)(a1 + v17 + 56);
        float32x2_t v28 = *(float32x2_t *)(a1 + v17 + 40);
        float32x2_t v27 = *(float32x2_t *)(a1 + v17 + 48);
        unint64_t v29 = v4[3];
        unint64_t v30 = v18 + 1;
        if (v18 >= v29 >> 1)
        {
          long long v36 = *(_OWORD *)(a1 + v17 + 56);
          uint64_t v32 = sub_2528C4E78((void *)(v29 > 1), v18 + 1, 1, v4);
          long long v26 = v36;
          uint64_t v4 = v32;
        }
        v4[2] = v30;
        long long v31 = &v4[v19 + v17 / 8];
        v31[4] = v25;
        v31[5] = vsub_f32(_D8, vadd_f32(v28, v27));
        v31[6] = v27;
        *(_OWORD *)(v31 + 7) = v26;
        v17 += 40;
        unint64_t v18 = v30;
        --v3;
      }
      while (v3);
      goto LABEL_13;
    }
    return (void *)MEMORY[0x263F8EE78];
  }
  if (!v3) {
    return (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2528C4E78(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v6 = 0;
  unint64_t v7 = v4[2];
  uint64_t v8 = 5 * v7;
  do
  {
    uint64_t v9 = *(void *)(a1 + v6 + 32);
    int v10 = *(_DWORD *)(a1 + v6 + 40);
    float v11 = *(float *)(a1 + v6 + 44);
    *(void *)&long long v5 = *(void *)(a1 + v6 + 48);
    long long v12 = *(_OWORD *)(a1 + v6 + 56);
    unint64_t v13 = v4[3];
    unint64_t v14 = v7 + 1;
    if (v7 >= v13 >> 1)
    {
      long long v34 = v5;
      long long v35 = *(_OWORD *)(a1 + v6 + 56);
      unint64_t v16 = sub_2528C4E78((void *)(v13 > 1), v7 + 1, 1, v4);
      long long v5 = v34;
      long long v12 = v35;
      uint64_t v4 = v16;
    }
    v4[2] = v14;
    unint64_t v15 = &v4[v8 + v6 / 8];
    v15[4] = v9;
    *((_DWORD *)v15 + 10) = v10;
    *((float *)v15 + 11) = 1.0 - (float)(v11 + *((float *)&v5 + 1));
    v15[6] = v5;
    *(_OWORD *)(v15 + 7) = v12;
    v6 += 40;
    unint64_t v7 = v14;
    --v3;
  }
  while (v3);
LABEL_13:
  swift_bridgeObjectRelease();
  return v4;
}

void *sub_25294B0A4(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if ((a2 & 1) == 0)
  {
    if (v3)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_2528C4E78(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v22 = 0;
      unint64_t v23 = v4[2];
      uint64_t v24 = 5 * v23;
      do
      {
        uint64_t v25 = *(void *)(a1 + v22 + 32);
        float v27 = *(float *)(a1 + v22 + 40);
        int v26 = *(_DWORD *)(a1 + v22 + 44);
        *(void *)&long long v21 = *(void *)(a1 + v22 + 48);
        long long v28 = *(_OWORD *)(a1 + v22 + 56);
        unint64_t v29 = v4[3];
        unint64_t v30 = v23 + 1;
        if (v23 >= v29 >> 1)
        {
          long long v34 = v21;
          long long v36 = *(_OWORD *)(a1 + v22 + 56);
          uint64_t v32 = sub_2528C4E78((void *)(v29 > 1), v23 + 1, 1, v4);
          long long v21 = v34;
          long long v28 = v36;
          uint64_t v4 = v32;
        }
        v4[2] = v30;
        long long v31 = &v4[v24 + v22 / 8];
        v31[4] = v25;
        *((_DWORD *)v31 + 10) = v26;
        *((float *)v31 + 11) = 1.0 - (float)(v27 + *(float *)&v21);
        v31[6] = vrev64_s32(*(int32x2_t *)&v21);
        *(_OWORD *)(v31 + 7) = v28;
        v22 += 40;
        unint64_t v23 = v30;
        --v3;
      }
      while (v3);
      goto LABEL_13;
    }
    return (void *)MEMORY[0x263F8EE78];
  }
  if (!v3) {
    return (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2528C4E78(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v5 = 0;
  unint64_t v6 = v4[2];
  uint64_t v7 = 5 * v6;
  __asm { FMOV            V8.2S, #1.0 }
  do
  {
    uint64_t v13 = *(void *)(a1 + v5 + 32);
    long long v14 = *(_OWORD *)(a1 + v5 + 56);
    float32x2_t v16 = *(float32x2_t *)(a1 + v5 + 40);
    float32x2_t v15 = *(float32x2_t *)(a1 + v5 + 48);
    unint64_t v17 = v4[3];
    unint64_t v18 = v6 + 1;
    if (v6 >= v17 >> 1)
    {
      long long v35 = *(_OWORD *)(a1 + v5 + 56);
      float v20 = sub_2528C4E78((void *)(v17 > 1), v6 + 1, 1, v4);
      long long v14 = v35;
      uint64_t v4 = v20;
    }
    v4[2] = v18;
    uint64_t v19 = &v4[v7 + v5 / 8];
    v19[4] = v13;
    v19[5] = vrev64_s32((int32x2_t)vsub_f32(_D8, vadd_f32(v16, v15)));
    v19[6] = vrev64_s32((int32x2_t)v15);
    *(_OWORD *)(v19 + 7) = v14;
    v5 += 40;
    unint64_t v6 = v18;
    --v3;
  }
  while (v3);
LABEL_13:
  swift_bridgeObjectRelease();
  return v4;
}

void *sub_25294B298(uint64_t a1, float a2, float a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v4) {
    return (void *)a1;
  }
  unint64_t v5 = sub_2528C4E78(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v6 = 0;
  unint64_t v7 = v5[2];
  float32x4_t v8 = (float32x4_t)vdupq_lane_s64(__SPAIR64__(LODWORD(a3), LODWORD(a2)), 0);
  uint64_t v9 = 5 * v7;
  do
  {
    uint64_t v10 = *(void *)(a1 + v6 + 32);
    float32x4_t v11 = *(float32x4_t *)(a1 + v6 + 40);
    long long v12 = *(_OWORD *)(a1 + v6 + 56);
    unint64_t v13 = v5[3];
    unint64_t v14 = v7 + 1;
    if (v7 >= v13 >> 1)
    {
      long long v20 = *(_OWORD *)(a1 + v6 + 56);
      float32x4_t v22 = v8;
      float32x4_t v18 = *(float32x4_t *)(a1 + v6 + 40);
      float32x2_t v16 = sub_2528C4E78((void *)(v13 > 1), v7 + 1, 1, v5);
      float32x4_t v11 = v18;
      long long v12 = v20;
      float32x4_t v8 = v22;
      unint64_t v5 = v16;
    }
    v5[2] = v14;
    float32x2_t v15 = &v5[v9 + v6 / 8];
    v15[4] = v10;
    *(float32x4_t *)(v15 + 5) = vdivq_f32(v11, v8);
    *(_OWORD *)(v15 + 7) = v12;
    v6 += 40;
    unint64_t v7 = v14;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
  return v5;
}

void *sub_25294B3B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_2528C4E78(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v4 = 0;
  unint64_t v5 = v3[2];
  uint64_t v6 = 5 * v5;
  do
  {
    uint64_t v7 = *(void *)(a1 + v4 + 32);
    int32x4_t v8 = *(int32x4_t *)(a1 + v4 + 40);
    long long v9 = *(_OWORD *)(a1 + v4 + 56);
    unint64_t v10 = v3[3];
    unint64_t v11 = v5 + 1;
    if (v5 >= v10 >> 1)
    {
      int32x4_t v15 = *(int32x4_t *)(a1 + v4 + 40);
      long long v16 = *(_OWORD *)(a1 + v4 + 56);
      unint64_t v13 = sub_2528C4E78((void *)(v10 > 1), v5 + 1, 1, v3);
      int32x4_t v8 = v15;
      long long v9 = v16;
      uint64_t v3 = v13;
    }
    v3[2] = v11;
    long long v12 = &v3[v6 + v4 / 8];
    v12[4] = v7;
    *(int32x4_t *)(v12 + 5) = vrev64q_s32(v8);
    *(_OWORD *)(v12 + 7) = v9;
    v4 += 40;
    unint64_t v5 = v11;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t sub_25294B4C0()
{
  unint64_t result = qword_269C33478;
  if (!qword_269C33478)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_269C33478);
  }
  return result;
}

id sub_25294B500()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00620]), sel_init);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F20A40]), sel_initWithVersion_, 0x10000);
  objc_msgSend(v1, sel_setEnableObjectTracking_, 1);
  objc_msgSend(v1, sel_setEnableSegmentation_, 1);
  objc_msgSend(v1, sel_setNetworkResolution_, 0);
  objc_msgSend(v1, sel_setRunningFrameRate_, 0);
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F20A38]), sel_initWithConfiguration_, v1);
  v6[0] = 0;
  if (objc_msgSend(v2, sel_prepareWithError_, v6))
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_2529511A8();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_25294B678(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = sub_252952108(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    long long v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_252952108() & 1) == 0) {
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

BOOL sub_25294B740(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  BOOL v5 = a1 + 5;
  char v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t sub_25294B7B4(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 136) = a3;
  *(void *)(v3 + 32) = a1;
  *(void *)(v3 + 40) = a2;
  uint64_t v4 = sub_252951A08();
  *(void *)(v3 + 48) = v4;
  *(void *)(v3 + 56) = *(void *)(v4 - 8);
  *(void *)(v3 + 64) = swift_task_alloc();
  *(void *)(v3 + 72) = swift_task_alloc();
  *(void *)(v3 + 80) = swift_task_alloc();
  *(void *)(v3 + 88) = swift_task_alloc();
  *(void *)(v3 + 96) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25294B8AC, 0, 0);
}

uint64_t sub_25294B8AC()
{
  uint64_t v1 = *(void *)(v0 + 56);
  int v30 = *(unsigned __int8 *)(v0 + 136);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31C98);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_252953740;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_252953740;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_252953970;
  sub_2529516C8();
  uint64_t v29 = v2;
  sub_2529516C8();
  sub_2529516C8();
  sub_2529516B8();
  sub_2529516B8();
  *(void *)(v0 + 16) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D10);
  sub_2528AB6E8((unint64_t *)&qword_269C31D18, &qword_269C31D10);
  uint64_t result = sub_252951A28();
  if (v30 == 1) {
    goto LABEL_11;
  }
  uint64_t v6 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 48);
  uint64_t v7 = *(void *)(v0 + 56);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v9(v6, *(void *)(v0 + 40), v8);
  uint64_t v10 = (void *)sub_2529518F8();
  BOOL v11 = sub_25294B740(v10, qword_2702CFF40);
  swift_bridgeObjectRelease();
  BOOL v12 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  *(void *)(v0 + 104) = v12;
  *(void *)(v0 + 112) = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t result = v12(v6, v8);
  if (!v11)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v14 = *(void *)(v0 + 88);
  uint64_t v13 = *(void *)(v0 + 96);
  int v15 = *(unsigned __int8 *)(v0 + 136);
  uint64_t v16 = *(void *)(v0 + 48);
  sub_252951708();
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_252953B00;
  unint64_t v18 = v17 + v3;
  v9(v18, v13, v16);
  v9(v18 + v29, v14, v16);
  *(void *)(v0 + 24) = v17;
  sub_2529516D8();
  if (v15)
  {
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 104);
    uint64_t v20 = *(void *)(v0 + 96);
    uint64_t v21 = *(void *)(v0 + 72);
    uint64_t v22 = *(void *)(v0 + 56);
    uint64_t v23 = *(void *)(v0 + 48);
    uint64_t v24 = *(void *)(v0 + 32);
    v19(*(void *)(v0 + 88), v23);
    v19(v20, v23);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v24, v21, v23);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
    return v25();
  }
  else
  {
    int v26 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v26;
    *int v26 = v0;
    v26[1] = sub_25294BC94;
    uint64_t v27 = *(void *)(v0 + 64);
    uint64_t v28 = *(void *)(v0 + 72);
    return sub_25294BF80(v27, v28, 0);
  }
}

uint64_t sub_25294BC94()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25294BEAC;
  }
  else {
    uint64_t v2 = sub_25294BDA8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25294BDA8()
{
  (*(void (**)(void, void))(v0 + 104))(*(void *)(v0 + 72), *(void *)(v0 + 48));
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 32);
  v1(*(void *)(v0 + 88), v5);
  v1(v2, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v6, v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_25294BEAC()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[13];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[6];
  v1(v0[9], v4);
  v1(v2, v4);
  v1(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_25294BF80(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 232) = a3;
  *(void *)(v3 + 72) = a1;
  *(void *)(v3 + 80) = a2;
  uint64_t v4 = sub_252951A08();
  *(void *)(v3 + 88) = v4;
  *(void *)(v3 + 96) = *(void *)(v4 - 8);
  *(void *)(v3 + 104) = swift_task_alloc();
  *(void *)(v3 + 112) = swift_task_alloc();
  *(void *)(v3 + 120) = swift_task_alloc();
  *(void *)(v3 + 128) = swift_task_alloc();
  *(void *)(v3 + 136) = swift_task_alloc();
  *(void *)(v3 + 144) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25294C084, 0, 0);
}

void *sub_25294C084()
{
  if (*(unsigned __int8 *)(v0 + 232) - 1 <= 1)
  {
    uint64_t v1 = *(void *)(v0 + 88);
    uint64_t v2 = *(void *)(v0 + 96);
    uint64_t v4 = *(void *)(v0 + 72);
    uint64_t v3 = *(void *)(v0 + 80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C32D28);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_252953740;
    *(void *)(v5 + 56) = MEMORY[0x263F8D310];
    *(void *)(v5 + 32) = 0xD00000000000003BLL;
    *(void *)(v5 + 40) = 0x800000025295D240;
    sub_252952178();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v3, v1);
LABEL_17:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    long long v36 = *(uint64_t (**)(void))(v0 + 8);
    return (void *)v36();
  }
  uint64_t v6 = *(void *)(v0 + 144);
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 96);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  *(void *)(v0 + 152) = v10;
  *(void *)(v0 + 160) = (v8 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v10(v6, v9, v7);
  uint64_t v11 = *(void *)(sub_2529518F8() + 16);
  swift_bridgeObjectRelease();
  BOOL v12 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
  *(void *)(v0 + 168) = v12;
  *(void *)(v0 + 176) = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t result = (void *)v12(v6, v7);
  if (v11 != 3)
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v14 = *(void *)(v0 + 136);
  uint64_t v16 = *(void *)(v0 + 80);
  uint64_t v15 = *(void *)(v0 + 88);
  uint64_t v17 = *(void *)(sub_2528CC540() + 16);
  *(void *)(v0 + 184) = v17;
  swift_bridgeObjectRelease();
  v10(v14, v16, v15);
  uint64_t result = (void *)sub_2529518F8();
  if (result[2] < 2uLL)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v18 = *(void *)(v0 + 136);
  uint64_t v19 = *(void *)(v0 + 88);
  uint64_t v20 = result[5];
  swift_bridgeObjectRelease();
  uint64_t result = (void *)v12(v18, v19);
  if (v20 != v17)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10(*(void *)(v0 + 128), *(void *)(v0 + 80), *(void *)(v0 + 88));
  uint64_t result = (void *)sub_2529518F8();
  if (result[2] < 3uLL)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v21 = *(void *)(v0 + 128);
  uint64_t v22 = *(void *)(v0 + 88);
  uint64_t v23 = result[6];
  swift_bridgeObjectRelease();
  uint64_t result = (void *)v12(v21, v22);
  if (v23 != 3)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t result = (void *)sub_2529518F8();
  if (!result[2])
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v24 = result[4];
  *(void *)(v0 + 192) = v24;
  uint64_t result = (void *)swift_bridgeObjectRelease();
  if (v24 < 0)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (!v24)
  {
    *(void *)(v0 + 64) = MEMORY[0x263F8EE78];
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D10);
    sub_2528AB6E8((unint64_t *)&qword_269C31D18, &qword_269C31D10);
    sub_2529519B8();
    goto LABEL_17;
  }
  uint64_t v25 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 200) = 0;
  *(void *)(v0 + 208) = v25;
  if (!*(void *)(v0 + 192)) {
    goto LABEL_27;
  }
  uint64_t v26 = *(void *)(v0 + 184);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31E08);
  uint64_t v27 = swift_allocObject();
  uint64_t v28 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v27 + 16) = xmmword_252953740;
  uint64_t v29 = MEMORY[0x263F00C68];
  *(void *)(v27 + 56) = v28;
  *(void *)(v27 + 64) = v29;
  *(void *)(v27 + 32) = 0;
  sub_252951A58();
  swift_bridgeObjectRelease();
  int v30 = (void *)sub_2529518F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31C28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252953B00;
  *(void *)(inited + 32) = v26;
  *(void *)(inited + 40) = 3;
  BOOL v32 = sub_25294B740(v30, (void *)inited);
  swift_setDeallocating();
  uint64_t result = (void *)swift_bridgeObjectRelease();
  if (!v32)
  {
LABEL_28:
    __break(1u);
    return result;
  }
  id v33 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v33;
  *id v33 = v0;
  v33[1] = sub_25294C4F4;
  uint64_t v34 = *(void *)(v0 + 112);
  uint64_t v35 = *(void *)(v0 + 120);
  return (void *)sub_25294CAC0(v34, v35);
}

uint64_t sub_25294C4F4()
{
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_25294C958;
  }
  else
  {
    uint64_t v2 = sub_25294C610;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25294C610()
{
  (*(void (**)(void, void, void))(v0 + 152))(*(void *)(v0 + 104), *(void *)(v0 + 112), *(void *)(v0 + 88));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v2 = *(void *)(v0 + 208);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    unint64_t v2 = sub_2528C4584(0, *(void *)(v2 + 16) + 1, 1, *(void *)(v0 + 208));
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    unint64_t v2 = sub_2528C4584(v3 > 1, v4 + 1, 1, v2);
  }
  uint64_t v26 = *(void *)(v0 + 192);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
  uint64_t v7 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 120);
  uint64_t v9 = *(void *)(v0 + 96);
  uint64_t v8 = *(void *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 88);
  uint64_t v11 = *(void *)(v0 + 200) + 1;
  *(void *)(v2 + 16) = v4 + 1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 32))(v2+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v4, v8, v10);
  v5(v7, v10);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v5)(v6, v10);
  if (v11 == v26)
  {
    *(void *)(v0 + 64) = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D10);
    sub_2528AB6E8((unint64_t *)&qword_269C31D18, &qword_269C31D10);
    sub_2529519B8();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
  uint64_t v14 = *(void *)(v0 + 192);
  uint64_t v15 = *(void *)(v0 + 200) + 1;
  *(void *)(v0 + 200) = v15;
  *(void *)(v0 + 208) = v2;
  if (v15 == v14)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v16 = *(void *)(v0 + 184);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31E08);
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v17 + 16) = xmmword_252953740;
  uint64_t v19 = MEMORY[0x263F00C68];
  *(void *)(v17 + 56) = v18;
  *(void *)(v17 + 64) = v19;
  *(void *)(v17 + 32) = v15;
  sub_252951A58();
  swift_bridgeObjectRelease();
  uint64_t v20 = (void *)sub_2529518F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31C28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_252953B00;
  *(void *)(inited + 32) = v16;
  *(void *)(inited + 40) = 3;
  BOOL v22 = sub_25294B740(v20, (void *)inited);
  swift_setDeallocating();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v22)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  uint64_t v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v23;
  *uint64_t v23 = v0;
  v23[1] = sub_25294C4F4;
  uint64_t v24 = *(void *)(v0 + 112);
  uint64_t v25 = *(void *)(v0 + 120);
  return sub_25294CAC0(v24, v25);
}

uint64_t sub_25294C958()
{
  (*(void (**)(void, void))(v0 + 168))(*(void *)(v0 + 120), *(void *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25294CA10(uint64_t a1, uint64_t a2)
{
  char v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_2528A91AC;
  return sub_25294B7B4(a1, a2, v6);
}

uint64_t sub_25294CAC0(uint64_t a1, uint64_t a2)
{
  v2[11] = a1;
  v2[12] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269C32A30);
  v2[13] = v3;
  v2[14] = *(void *)(v3 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v4 = sub_252951A08();
  v2[16] = v4;
  v2[17] = *(void *)(v4 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25294CD10, 0, 0);
}

uint64_t sub_25294CD10()
{
  uint64_t v112 = *(void *)(v0 + 344);
  uint64_t v113 = *(void *)(v0 + 336);
  uint64_t v105 = *(void *)(v0 + 328);
  uint64_t v117 = *(void *)(v0 + 320);
  uint64_t v120 = *(void *)(v0 + 312);
  uint64_t v106 = *(void *)(v0 + 304);
  uint64_t v107 = *(void *)(v0 + 296);
  uint64_t v108 = *(void *)(v0 + 288);
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v115 = *(void *)(v0 + 128);
  *(void *)(v0 + 352) = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31E08);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_252953B00;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C32F78);
  *(void *)(v0 + 360) = v3;
  *(void *)(v2 + 56) = v3;
  uint64_t v4 = sub_2528AB6E8(&qword_269C32F80, &qword_269C32F78);
  *(void *)(v0 + 368) = v4;
  *(void *)(v2 + 64) = v4;
  *(_OWORD *)(v2 + 32) = xmmword_252959A40;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(void *)(v2 + 104) = 0;
  sub_252951A58();
  swift_bridgeObjectRelease();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 56) = v3;
  *(void *)(v5 + 64) = v4;
  *(_OWORD *)(v5 + 16) = xmmword_252953B00;
  *(_OWORD *)(v5 + 32) = xmmword_252959A50;
  *(_OWORD *)(v5 + 72) = 0u;
  *(_OWORD *)(v5 + 88) = 0u;
  *(void *)(v5 + 104) = 0;
  sub_252951A58();
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 56) = v3;
  *(void *)(v6 + 64) = v4;
  *(_OWORD *)(v6 + 16) = xmmword_252953B00;
  *(_OWORD *)(v6 + 32) = xmmword_252959A60;
  *(_OWORD *)(v6 + 72) = 0u;
  *(_OWORD *)(v6 + 88) = 0u;
  *(void *)(v6 + 104) = 0;
  sub_252951A58();
  swift_bridgeObjectRelease();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 56) = v3;
  *(void *)(v7 + 64) = v4;
  *(_OWORD *)(v7 + 16) = xmmword_252953B00;
  *(_OWORD *)(v7 + 32) = xmmword_252959A70;
  *(_OWORD *)(v7 + 72) = 0u;
  *(_OWORD *)(v7 + 88) = 0u;
  *(void *)(v7 + 104) = 0;
  sub_252951A58();
  swift_bridgeObjectRelease();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 56) = v3;
  *(void *)(v8 + 64) = v4;
  *(_OWORD *)(v8 + 16) = xmmword_252953B00;
  *(_OWORD *)(v8 + 32) = xmmword_252959A80;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(void *)(v8 + 104) = 0;
  sub_252951A58();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 376) = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31C98);
  uint64_t v9 = *(void *)(v1 + 72);
  *(void *)(v0 + 384) = v9;
  int v10 = *(_DWORD *)(v1 + 80);
  *(_DWORD *)(v0 + 460) = v10;
  uint64_t v11 = v9;
  uint64_t v104 = v9;
  unint64_t v12 = (v10 + 32) & ~(unint64_t)v10;
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_252953B00;
  uint64_t v14 = *(void (**)(unint64_t, uint64_t, uint64_t))(v1 + 16);
  *(void *)(v0 + 392) = v14;
  *(void *)(v0 + 400) = (v1 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v14(v13 + v12, v112, v115);
  v14(v13 + v12 + v11, v113, v115);
  *(void *)(v0 + 16) = v13;
  *(void *)(v0 + 408) = __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D10);
  *(void *)(v0 + 416) = sub_2528AB6E8((unint64_t *)&qword_269C31D18, &qword_269C31D10);
  sub_2529516D8();
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_252953B00;
  unint64_t v16 = v12;
  unint64_t v103 = v12;
  unint64_t v17 = v15 + v12;
  v14(v17, v106, v115);
  v14(v17 + v104, v105, v115);
  *(void *)(v0 + 24) = v15;
  sub_2529516D8();
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_252953B00;
  v14(v18 + v16, v107, v115);
  v14(v18 + v16 + v104, v117, v115);
  *(void *)(v0 + 32) = v18;
  sub_2529516D8();
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_252953B00;
  v14(v19 + v103, v108, v115);
  v14(v19 + v103 + v104, v120, v115);
  *(void *)(v0 + 40) = v19;
  sub_2529516D8();
  uint64_t v20 = *(void *)(sub_2528CCCF8() + 16);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31C28);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_252953740;
  *(void *)(v21 + 32) = v20;
  *(void *)(v0 + 48) = &unk_2702CFE88;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C32790);
  sub_2528AB6E8((unint64_t *)&qword_269C32798, &qword_269C32790);
  sub_2529518D8();
  sub_2529519D8();
  if (qword_269C31708 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_269C335F0;
  uint64_t v23 = *(void *)algn_269C335F8;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_2528CC540();
  uint64_t v25 = *(void *)(v24 + 16);
  if (!v25) {
    goto LABEL_22;
  }
  uint64_t v26 = 0;
  uint64_t v27 = (void *)(v24 + 40);
  while (1)
  {
    BOOL v28 = *(v27 - 1) == v22 && *v27 == v23;
    if (v28 || (sub_252952108() & 1) != 0) {
      break;
    }
    ++v26;
    v27 += 2;
    if (v25 == v26) {
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_269C31718 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_269C33610;
  uint64_t v30 = *(void *)algn_269C33618;
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_2528CC540();
  uint64_t v32 = *(void *)(v31 + 16);
  if (!v32)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v36 = *(void *)(v0 + 136);
    sub_2528EBDAC();
    swift_allocError();
    unsigned char *v37 = 0;
    swift_willThrow();
    unint64_t v38 = *(void (**)(void))(v36 + 8);
LABEL_23:
    uint64_t v39 = *(void *)(v0 + 336);
    uint64_t v40 = *(void *)(v0 + 312);
    uint64_t v100 = *(void *)(v0 + 320);
    uint64_t v101 = *(void *)(v0 + 328);
    uint64_t v41 = *(void *)(v0 + 296);
    uint64_t v42 = *(void *)(v0 + 304);
    uint64_t v43 = *(void *)(v0 + 288);
    uint64_t v102 = *(void *)(v0 + 344);
    uint64_t v122 = *(void *)(v0 + 280);
    uint64_t v44 = *(void *)(v0 + 272);
    uint64_t v45 = *(void *)(v0 + 128);
    v38();
    ((void (*)(uint64_t, uint64_t))v38)(v44, v45);
    ((void (*)(uint64_t, uint64_t))v38)(v122, v45);
    ((void (*)(uint64_t, uint64_t))v38)(v43, v45);
    ((void (*)(uint64_t, uint64_t))v38)(v41, v45);
    ((void (*)(uint64_t, uint64_t))v38)(v42, v45);
    ((void (*)(uint64_t, uint64_t))v38)(v40, v45);
    ((void (*)(uint64_t, uint64_t))v38)(v100, v45);
    ((void (*)(uint64_t, uint64_t))v38)(v101, v45);
    ((void (*)(uint64_t, uint64_t))v38)(v39, v45);
    ((void (*)(uint64_t, uint64_t))v38)(v102, v45);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    double v46 = *(uint64_t (**)(void))(v0 + 8);
    return v46();
  }
  uint64_t v33 = 0;
  uint64_t v34 = (void *)(v31 + 40);
  while (1)
  {
    BOOL v35 = *(v34 - 1) == v29 && *v34 == v30;
    if (v35 || (sub_252952108() & 1) != 0) {
      break;
    }
    ++v33;
    v34 += 2;
    if (v32 == v33) {
      goto LABEL_22;
    }
  }
  uint64_t v48 = *(void *)(v0 + 240);
  uint64_t v114 = *(void *)(v0 + 248);
  uint64_t v49 = *(void *)(v0 + 232);
  uint64_t v121 = *(void *)(v0 + 136);
  uint64_t v118 = *(void *)(v0 + 128);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v50 = swift_allocObject();
  uint64_t v51 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v50 + 16) = xmmword_252953740;
  uint64_t v52 = MEMORY[0x263F00C68];
  *(void *)(v50 + 56) = v51;
  *(void *)(v50 + 64) = v52;
  *(void *)(v50 + 32) = v26;
  sub_252951A58();
  swift_bridgeObjectRelease();
  uint64_t v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_252953740;
  *(void *)(v53 + 56) = v51;
  *(void *)(v53 + 64) = v52;
  *(void *)(v53 + 32) = v33;
  sub_252951A58();
  swift_bridgeObjectRelease();
  sub_252951768();
  uint64_t v54 = *(void (**)(void))(v121 + 8);
  *(void *)(v0 + 424) = v54;
  *(void *)(v0 + 432) = (v121 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v55 = v118;
  ((void (*)(uint64_t, uint64_t))v54)(v49, v118);
  ((void (*)(uint64_t, uint64_t))v54)(v48, v118);
  sub_2529516F8();
  sub_252951718();
  ((void (*)(uint64_t, uint64_t))v54)(v48, v118);
  v119 = v54;
  ((void (*)(uint64_t, uint64_t))v54)(v114, v55);
  sub_2529516E8();
  if (qword_269C31810 != -1) {
    swift_once();
  }
  uint64_t v56 = qword_269C33800;
  uint64_t v57 = *(void *)algn_269C33808;
  swift_bridgeObjectRetain();
  uint64_t v58 = sub_2528CC540();
  uint64_t v59 = *(void *)(v58 + 16);
  if (!v59) {
    goto LABEL_69;
  }
  uint64_t v60 = 0;
  uint64_t v61 = (void *)(v58 + 40);
  while (1)
  {
    BOOL v62 = *(v61 - 1) == v56 && *v61 == v57;
    if (v62 || (sub_252952108() & 1) != 0) {
      break;
    }
    ++v60;
    v61 += 2;
    if (v59 == v60) {
      goto LABEL_69;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_269C31840 != -1) {
    swift_once();
  }
  uint64_t v63 = qword_269C33860;
  uint64_t v64 = *(void *)algn_269C33868;
  swift_bridgeObjectRetain();
  uint64_t v65 = sub_2528CC540();
  uint64_t v66 = *(void *)(v65 + 16);
  if (!v66) {
    goto LABEL_69;
  }
  uint64_t v67 = 0;
  uint64_t v68 = (void *)(v65 + 40);
  while (1)
  {
    BOOL v69 = *(v68 - 1) == v63 && *v68 == v64;
    if (v69 || (sub_252952108() & 1) != 0) {
      break;
    }
    ++v67;
    v68 += 2;
    if (v66 == v67) {
      goto LABEL_69;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_269C317D8 != -1) {
    swift_once();
  }
  uint64_t v70 = qword_269C33790;
  uint64_t v71 = *(void *)algn_269C33798;
  swift_bridgeObjectRetain();
  uint64_t v72 = sub_2528CC540();
  uint64_t v73 = *(void *)(v72 + 16);
  if (!v73) {
    goto LABEL_69;
  }
  uint64_t v74 = 0;
  uint64_t v75 = (void *)(v72 + 40);
  while (1)
  {
    *(void *)(v0 + 440) = v74;
    BOOL v76 = *(v75 - 1) == v70 && *v75 == v71;
    if (v76 || (sub_252952108() & 1) != 0) {
      break;
    }
    ++v74;
    v75 += 2;
    if (v73 == v74) {
      goto LABEL_69;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_269C317E8 != -1) {
    swift_once();
  }
  uint64_t v77 = qword_269C337B0;
  uint64_t v78 = *(void *)algn_269C337B8;
  swift_bridgeObjectRetain();
  uint64_t v79 = sub_2528CC540();
  uint64_t v116 = *(void *)(v79 + 16);
  if (!v116)
  {
LABEL_69:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v83 = *(void *)(v0 + 256);
    uint64_t v84 = *(void *)(v0 + 224);
    uint64_t v85 = *(void *)(v0 + 128);
    sub_2528EBDAC();
    swift_allocError();
    unsigned char *v86 = 0;
    swift_willThrow();
    ((void (*)(uint64_t, uint64_t))v119)(v84, v85);
    ((void (*)(uint64_t, uint64_t))v119)(v83, v85);
    unint64_t v38 = v119;
    goto LABEL_23;
  }
  uint64_t v80 = 0;
  v81 = (void *)(v79 + 40);
  while (1)
  {
    BOOL v82 = *(v81 - 1) == v77 && *v81 == v78;
    if (v82 || (sub_252952108() & 1) != 0) {
      break;
    }
    ++v80;
    v81 += 2;
    if (v116 == v80) {
      goto LABEL_69;
    }
  }
  uint64_t v87 = *(void *)(v0 + 240);
  uint64_t v109 = *(void *)(v0 + 232);
  uint64_t v110 = *(void *)(v0 + 248);
  uint64_t v111 = *(void *)(v0 + 128);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v88 = swift_allocObject();
  *(_OWORD *)(v88 + 16) = xmmword_252953740;
  *(void *)(v88 + 56) = MEMORY[0x263F8D6C8];
  uint64_t v89 = MEMORY[0x263F00C68];
  *(void *)(v88 + 64) = MEMORY[0x263F00C68];
  *(void *)(v88 + 32) = v60;
  sub_252951A58();
  swift_bridgeObjectRelease();
  uint64_t v90 = swift_allocObject();
  *(_OWORD *)(v90 + 16) = xmmword_252953740;
  *(void *)(v90 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v90 + 64) = v89;
  *(void *)(v90 + 32) = v67;
  sub_252951A58();
  swift_bridgeObjectRelease();
  sub_252951768();
  ((void (*)(uint64_t, uint64_t))v119)(v109, v111);
  ((void (*)(uint64_t, uint64_t))v119)(v87, v111);
  sub_2529516F8();
  sub_252951718();
  ((void (*)(uint64_t, uint64_t))v119)(v87, v111);
  ((void (*)(uint64_t, uint64_t))v119)(v110, v111);
  uint64_t v91 = swift_allocObject();
  *(_OWORD *)(v91 + 16) = xmmword_252953740;
  *(void *)(v91 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v91 + 64) = MEMORY[0x263F00C68];
  *(void *)(v91 + 32) = v74;
  sub_252951A58();
  swift_bridgeObjectRelease();
  sub_252951798();
  ((void (*)(uint64_t, uint64_t))v119)(v110, v111);
  uint64_t v92 = swift_allocObject();
  *(_OWORD *)(v92 + 16) = xmmword_252953740;
  *(void *)(v92 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v92 + 64) = MEMORY[0x263F00C68];
  *(void *)(v92 + 32) = v80;
  sub_252951A58();
  swift_bridgeObjectRelease();
  uint64_t v93 = swift_allocObject();
  *(_OWORD *)(v93 + 16) = xmmword_252953740;
  *(void *)(v93 + 56) = MEMORY[0x263F8D6C8];
  *(void *)(v93 + 64) = MEMORY[0x263F00C68];
  *(void *)(v93 + 32) = v74;
  sub_252951A58();
  swift_bridgeObjectRelease();
  sub_252951798();
  ((void (*)(uint64_t, uint64_t))v119)(v87, v111);
  ((void (*)(uint64_t, uint64_t))v119)(v110, v111);
  v94 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v94;
  void *v94 = v0;
  v94[1] = sub_25294DE04;
  uint64_t v95 = *(void *)(v0 + 120);
  uint64_t v96 = MEMORY[0x263F8D5C8];
  uint64_t v97 = MEMORY[0x263F00C58];
  uint64_t v98 = MEMORY[0x263F00C50];
  uint64_t v99 = MEMORY[0x263F8D5C8];
  return MEMORY[0x270EE76F8](v95, v96, v99, v97, v98);
}

uint64_t sub_25294DE04()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25294DF00, 0, 0);
}

uint64_t sub_25294DF00()
{
  sub_2528AB6E8((unint64_t *)&qword_269C31C50, (uint64_t *)&unk_269C32A30);
  uint64_t v1 = sub_2529515D8();
  int64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8EE78];
    uint64_t v8 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (v8) {
      goto LABEL_7;
    }
LABEL_10:
    float v10 = 0.0;
    goto LABEL_16;
  }
  uint64_t v66 = MEMORY[0x263F8EE78];
  sub_252922EC8(0, v2, 0);
  uint64_t v3 = 0;
  uint64_t v4 = v66;
  unint64_t v5 = *(void *)(v66 + 16);
  do
  {
    float v6 = *(float *)(v1 + 4 * v3 + 32);
    unint64_t v7 = *(void *)(v66 + 24);
    if (v5 >= v7 >> 1) {
      sub_252922EC8(v7 > 1, v5 + 1, 1);
    }
    ++v3;
    *(void *)(v66 + 16) = v5 + 1;
    *(float *)(v66 + 4 * v5++ + 32) = v6 * v6;
  }
  while (v2 != v3);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v66 + 16);
  if (!v8) {
    goto LABEL_10;
  }
LABEL_7:
  if (v8 == 1)
  {
    uint64_t v9 = 0;
    float v10 = 0.0;
LABEL_14:
    uint64_t v13 = v8 - v9;
    uint64_t v14 = (float *)(v4 + 4 * v9 + 32);
    do
    {
      float v15 = *v14++;
      float v10 = v10 + v15;
      --v13;
    }
    while (v13);
    goto LABEL_16;
  }
  uint64_t v9 = v8 & 0x7FFFFFFFFFFFFFFELL;
  uint64_t v11 = (float *)(v4 + 36);
  float v10 = 0.0;
  uint64_t v12 = v8 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    float v10 = (float)(v10 + *(v11 - 1)) + *v11;
    v11 += 2;
    v12 -= 2;
  }
  while (v12);
  if (v8 != v9) {
    goto LABEL_14;
  }
LABEL_16:
  uint64_t v65 = *(void *)(v0 + 440);
  unint64_t v16 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
  uint64_t v17 = *(unsigned __int8 *)(v0 + 460);
  uint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 392);
  uint64_t v56 = *(void *)(v0 + 384);
  uint64_t v33 = *(void *)(v0 + 360);
  uint64_t v34 = *(void *)(v0 + 368);
  uint64_t v41 = *(void *)(v0 + 336);
  uint64_t v42 = *(void *)(v0 + 344);
  uint64_t v39 = *(void *)(v0 + 320);
  uint64_t v40 = *(void *)(v0 + 328);
  uint64_t v37 = *(void *)(v0 + 304);
  uint64_t v38 = *(void *)(v0 + 312);
  uint64_t v47 = *(void *)(v0 + 296);
  uint64_t v48 = *(void *)(v0 + 288);
  uint64_t v49 = *(void *)(v0 + 280);
  uint64_t v50 = *(void *)(v0 + 272);
  uint64_t v58 = *(void *)(v0 + 264);
  uint64_t v52 = *(void *)(v0 + 256);
  uint64_t v18 = *(void *)(v0 + 232);
  uint64_t v61 = *(void *)(v0 + 240);
  uint64_t v62 = *(void *)(v0 + 248);
  uint64_t v57 = *(void *)(v0 + 224);
  uint64_t v53 = *(void *)(v0 + 216);
  uint64_t v51 = *(void *)(v0 + 208);
  uint64_t v54 = *(void *)(v0 + 200);
  uint64_t v19 = *(void *)(v0 + 184);
  uint64_t v63 = *(void *)(v0 + 192);
  uint64_t v64 = *(void *)(v0 + 176);
  uint64_t v59 = *(void *)(v0 + 160);
  uint64_t v60 = *(void *)(v0 + 168);
  uint64_t v45 = *(void *)(v0 + 152);
  uint64_t v46 = *(void *)(v0 + 144);
  uint64_t v20 = *(void *)(v0 + 128);
  uint64_t v55 = *(void *)(v0 + 120);
  uint64_t v35 = *(void *)(v0 + 112);
  uint64_t v36 = *(void *)(v0 + 104);
  swift_bridgeObjectRelease();
  uint64_t v43 = (v17 + 32) & ~v17;
  *(float *)(v0 + 456) = sqrtf(v10);
  sub_252951728();
  sub_252951738();
  sub_252951868();
  v16(v63, v20);
  sub_252951738();
  v16(v18, v20);
  sub_2529516F8();
  sub_252951738();
  v16(v64, v20);
  sub_2529516F8();
  sub_252951718();
  v16(v64, v20);
  v16(v19, v20);
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v21 + 16) = xmmword_252953740;
  uint64_t v23 = MEMORY[0x263F00C68];
  *(void *)(v21 + 56) = v22;
  *(void *)(v21 + 64) = v23;
  *(void *)(v21 + 32) = v65;
  sub_252951A58();
  swift_bridgeObjectRelease();
  sub_252951768();
  v16(v19, v20);
  v16(v63, v20);
  sub_2529516E8();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 56) = v33;
  *(void *)(v24 + 64) = v34;
  *(_OWORD *)(v24 + 16) = xmmword_252953B00;
  *(_OWORD *)(v24 + 32) = xmmword_252958270;
  *(_OWORD *)(v24 + 72) = 0u;
  *(_OWORD *)(v24 + 88) = 0u;
  *(void *)(v24 + 104) = 0;
  sub_252951A58();
  swift_bridgeObjectRelease();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 56) = v33;
  *(void *)(v25 + 64) = v34;
  *(_OWORD *)(v25 + 16) = xmmword_252953B00;
  *(_OWORD *)(v25 + 32) = xmmword_252959A90;
  *(_OWORD *)(v25 + 72) = 0u;
  *(_OWORD *)(v25 + 88) = 0u;
  *(void *)(v25 + 104) = 0;
  sub_252951A58();
  swift_bridgeObjectRelease();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 56) = v33;
  *(void *)(v26 + 64) = v34;
  *(_OWORD *)(v26 + 16) = xmmword_252953B00;
  *(_OWORD *)(v26 + 32) = xmmword_252959AA0;
  *(_OWORD *)(v26 + 72) = 0u;
  *(_OWORD *)(v26 + 88) = 0u;
  *(void *)(v26 + 104) = 0;
  sub_252951A58();
  swift_bridgeObjectRelease();
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_252953B00;
  v44(v27 + v43, v19, v20);
  v44(v27 + v43 + v56, v57, v20);
  *(void *)(v0 + 64) = v27;
  sub_2529516D8();
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_252953B00;
  v44(v28 + v43, v59, v20);
  v44(v28 + v43 + v56, v64, v20);
  *(void *)(v0 + 72) = v28;
  sub_2529516D8();
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_252953B00;
  v44(v29 + v43, v45, v20);
  v44(v29 + v43 + v56, v63, v20);
  *(void *)(v0 + 80) = v29;
  sub_2529516D8();
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_252953B00;
  v44(v30 + v43, v46, v20);
  v44(v30 + v43 + v56, v60, v20);
  *(void *)(v0 + 56) = v30;
  sub_2529516D8();
  v16(v46, v20);
  v16(v45, v20);
  v16(v59, v20);
  v16(v60, v20);
  v16(v64, v20);
  v16(v19, v20);
  v16(v63, v20);
  v16(v18, v20);
  v16(v61, v20);
  v16(v62, v20);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v55, v36);
  v16(v54, v20);
  v16(v51, v20);
  v16(v53, v20);
  v16(v57, v20);
  v16(v52, v20);
  v16(v58, v20);
  v16(v50, v20);
  v16(v49, v20);
  v16(v48, v20);
  v16(v47, v20);
  v16(v37, v20);
  v16(v38, v20);
  v16(v39, v20);
  v16(v40, v20);
  v16(v41, v20);
  v16(v42, v20);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
  return v31();
}

unsigned char *storeEnumTagSinglePayload for Lifting3DPostprocessor(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25294E9A0);
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

ValueMetadata *type metadata accessor for Lifting3DPostprocessor()
{
  return &type metadata for Lifting3DPostprocessor;
}

uint64_t Skeleton.Joint.Kind.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Skeleton.Joint.Kind.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

void sub_25294EA10()
{
  qword_269C334A0 = 1953460082;
  *(void *)algn_269C334A8 = 0xE400000000000000;
}

uint64_t static Skeleton.Joint.Kind.root.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31660, &qword_269C334A0, (uint64_t *)algn_269C334A8, a1);
}

void sub_25294EA54()
{
  qword_269C334B0 = 1936746856;
  *(void *)algn_269C334B8 = 0xE400000000000000;
}

uint64_t static Skeleton.Joint.Kind.hips.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31668, &qword_269C334B0, (uint64_t *)algn_269C334B8, a1);
}

void sub_25294EA98()
{
  qword_269C334C0 = 0x7069687466656CLL;
  *(void *)algn_269C334C8 = 0xE700000000000000;
}

uint64_t static Skeleton.Joint.Kind.leftHip.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31670, &qword_269C334C0, (uint64_t *)algn_269C334C8, a1);
}

void sub_25294EAE4()
{
  qword_269C334D0 = 0x7069487468676972;
  *(void *)algn_269C334D8 = 0xE800000000000000;
}

uint64_t static Skeleton.Joint.Kind.rightHip.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31678, &qword_269C334D0, (uint64_t *)algn_269C334D8, a1);
}

void sub_25294EB30()
{
  qword_269C334E0 = 0x656C70757466656CLL;
  *(void *)algn_269C334E8 = 0xE900000000000067;
}

uint64_t static Skeleton.Joint.Kind.leftUpLeg.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31680, &qword_269C334E0, (uint64_t *)algn_269C334E8, a1);
}

void sub_25294EB80()
{
  qword_269C334F0 = 0x67656C7466656CLL;
  *(void *)algn_269C334F8 = 0xE700000000000000;
}

uint64_t static Skeleton.Joint.Kind.leftLeg.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31688, &qword_269C334F0, (uint64_t *)algn_269C334F8, a1);
}

void sub_25294EBCC()
{
  qword_269C33500 = 0x65656E6B7466656CLL;
  *(void *)algn_269C33508 = 0xE800000000000000;
}

uint64_t static Skeleton.Joint.Kind.leftKnee.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31690, &qword_269C33500, (uint64_t *)algn_269C33508, a1);
}

void sub_25294EC18()
{
  qword_269C33510 = 0x746F6F667466656CLL;
  *(void *)algn_269C33518 = 0xE800000000000000;
}

uint64_t static Skeleton.Joint.Kind.leftFoot.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31698, &qword_269C33510, (uint64_t *)algn_269C33518, a1);
}

void sub_25294EC64()
{
  qword_269C33520 = 0x6C6B6E617466656CLL;
  *(void *)algn_269C33528 = 0xE900000000000065;
}

uint64_t static Skeleton.Joint.Kind.leftAnkle.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316A0, &qword_269C33520, (uint64_t *)algn_269C33528, a1);
}

void sub_25294ECB4()
{
  qword_269C33530 = 0x73656F747466656CLL;
  *(void *)algn_269C33538 = 0xE800000000000000;
}

uint64_t static Skeleton.Joint.Kind.leftToes.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316A8, &qword_269C33530, (uint64_t *)algn_269C33538, a1);
}

void sub_25294ED00()
{
  qword_269C33540 = 0x73656F747466656CLL;
  *(void *)algn_269C33548 = 0xEB00000000646E65;
}

uint64_t static Skeleton.Joint.Kind.leftToesEnd.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316B0, &qword_269C33540, (uint64_t *)algn_269C33548, a1);
}

void sub_25294ED54()
{
  qword_269C33550 = 0x6C70757468676972;
  *(void *)algn_269C33558 = 0xEA00000000006765;
}

uint64_t static Skeleton.Joint.Kind.rightUpLeg.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316B8, &qword_269C33550, (uint64_t *)algn_269C33558, a1);
}

void sub_25294EDA4()
{
  qword_269C33560 = 0x67656C7468676972;
  *(void *)algn_269C33568 = 0xE800000000000000;
}

uint64_t static Skeleton.Joint.Kind.rightLeg.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316C0, &qword_269C33560, (uint64_t *)algn_269C33568, a1);
}

void sub_25294EDF0()
{
  qword_269C33570 = 0x656E6B7468676972;
  *(void *)algn_269C33578 = 0xE900000000000065;
}

uint64_t static Skeleton.Joint.Kind.rightKnee.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316C8, &qword_269C33570, (uint64_t *)algn_269C33578, a1);
}

void sub_25294EE40()
{
  qword_269C33580 = 0x6B6E617468676972;
  *(void *)algn_269C33588 = 0xEA0000000000656CLL;
}

uint64_t static Skeleton.Joint.Kind.rightAnkle.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316D0, &qword_269C33580, (uint64_t *)algn_269C33588, a1);
}

void sub_25294EE90()
{
  qword_269C33590 = 0x6F6F667468676972;
  *(void *)algn_269C33598 = 0xE900000000000074;
}

uint64_t static Skeleton.Joint.Kind.rightFoot.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316D8, &qword_269C33590, (uint64_t *)algn_269C33598, a1);
}

void sub_25294EEE0()
{
  qword_269C335A0 = 0x656F747468676972;
  *(void *)algn_269C335A8 = 0xE900000000000073;
}

uint64_t static Skeleton.Joint.Kind.rightToes.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316E0, &qword_269C335A0, (uint64_t *)algn_269C335A8, a1);
}

void sub_25294EF30()
{
  algn_269C335B8[5] = 0;
  *(_WORD *)&algn_269C335B8[6] = -5120;
}

uint64_t static Skeleton.Joint.Kind.rightToesEnd.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316E8, &qword_269C335B0, (uint64_t *)algn_269C335B8, a1);
}

void sub_25294EF84()
{
  qword_269C335C0 = 0x31656E697073;
  *(void *)algn_269C335C8 = 0xE600000000000000;
}

uint64_t static Skeleton.Joint.Kind.spine1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316F0, &qword_269C335C0, (uint64_t *)algn_269C335C8, a1);
}

void sub_25294EFCC()
{
  qword_269C335D0 = 0x32656E697073;
  *(void *)algn_269C335D8 = 0xE600000000000000;
}

uint64_t static Skeleton.Joint.Kind.spine2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C316F8, &qword_269C335D0, (uint64_t *)algn_269C335D8, a1);
}

void sub_25294F014()
{
  qword_269C335E0 = 0x33656E697073;
  *(void *)algn_269C335E8 = 0xE600000000000000;
}

uint64_t static Skeleton.Joint.Kind.spine3.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31700, &qword_269C335E0, (uint64_t *)algn_269C335E8, a1);
}

void sub_25294F05C()
{
  qword_269C335F0 = 0x34656E697073;
  *(void *)algn_269C335F8 = 0xE600000000000000;
}

uint64_t static Skeleton.Joint.Kind.spine4.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31708, &qword_269C335F0, (uint64_t *)algn_269C335F8, a1);
}

void sub_25294F0A4()
{
  qword_269C33600 = 0x35656E697073;
  *(void *)algn_269C33608 = 0xE600000000000000;
}

uint64_t static Skeleton.Joint.Kind.spine5.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31710, &qword_269C33600, (uint64_t *)algn_269C33608, a1);
}

void sub_25294F0EC()
{
  qword_269C33610 = 0x36656E697073;
  *(void *)algn_269C33618 = 0xE600000000000000;
}

uint64_t static Skeleton.Joint.Kind.spine6.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31718, &qword_269C33610, (uint64_t *)algn_269C33618, a1);
}

void sub_25294F134()
{
  qword_269C33620 = 0x37656E697073;
  *(void *)algn_269C33628 = 0xE600000000000000;
}

uint64_t static Skeleton.Joint.Kind.spine7.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31720, &qword_269C33620, (uint64_t *)algn_269C33628, a1);
}

void sub_25294F17C()
{
  *(_WORD *)&algn_269C33638[6] = -4864;
}

uint64_t static Skeleton.Joint.Kind.leftShoulder.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31728, &qword_269C33630, (uint64_t *)algn_269C33638, a1);
}

void sub_25294F1D4()
{
  qword_269C33640 = 0x6D72617466656CLL;
  *(void *)algn_269C33648 = 0xE700000000000000;
}

uint64_t static Skeleton.Joint.Kind.leftArm.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31730, &qword_269C33640, (uint64_t *)algn_269C33648, a1);
}

void sub_25294F220()
{
  qword_269C33650 = 0x65726F667466656CLL;
  *(void *)algn_269C33658 = 0xEB000000006D7261;
}

uint64_t static Skeleton.Joint.Kind.leftForearm.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31738, &qword_269C33650, (uint64_t *)algn_269C33658, a1);
}

void static Skeleton.Joint.Kind.leftForearmWrist.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000025295B160;
}

void sub_25294F294()
{
  qword_269C33660 = 0x6F626C657466656CLL;
  *(void *)algn_269C33668 = 0xE900000000000077;
}

uint64_t static Skeleton.Joint.Kind.leftElbow.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31740, &qword_269C33660, (uint64_t *)algn_269C33668, a1);
}

void sub_25294F2E4()
{
  qword_269C33670 = 0x736972777466656CLL;
  *(void *)algn_269C33678 = 0xE900000000000074;
}

uint64_t static Skeleton.Joint.Kind.leftWrist.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31748, &qword_269C33670, (uint64_t *)algn_269C33678, a1);
}

void sub_25294F334()
{
  qword_269C33680 = 0x646E61687466656CLL;
  *(void *)algn_269C33688 = 0xE800000000000000;
}

uint64_t static Skeleton.Joint.Kind.leftHand.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31750, &qword_269C33680, (uint64_t *)algn_269C33688, a1);
}

void static Skeleton.Joint.Kind.leftHandIndexStart.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000012;
  a1[1] = 0x800000025295A9B0;
}

void sub_25294F3A0()
{
  algn_269C33698[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.leftHandIndex1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31758, &qword_269C33690, (uint64_t *)algn_269C33698, a1);
}

void sub_25294F3F8()
{
  algn_269C336A8[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.leftHandIndex2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31760, &qword_269C336A0, (uint64_t *)algn_269C336A8, a1);
}

void sub_25294F450()
{
  algn_269C336B8[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.leftHandIndex3.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31768, &qword_269C336B0, (uint64_t *)algn_269C336B8, a1);
}

void static Skeleton.Joint.Kind.leftHandIndexEnd.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000025295A9D0;
}

void static Skeleton.Joint.Kind.leftHandMidStart.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000025295A990;
}

void sub_25294F4E8()
{
  algn_269C336C8[5] = 0;
  *(_WORD *)&algn_269C336C8[6] = -5120;
}

uint64_t static Skeleton.Joint.Kind.leftHandMid1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31770, &qword_269C336C0, (uint64_t *)algn_269C336C8, a1);
}

void sub_25294F53C()
{
  algn_269C336D8[5] = 0;
  *(_WORD *)&algn_269C336D8[6] = -5120;
}

uint64_t static Skeleton.Joint.Kind.leftHandMid2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31778, &qword_269C336D0, (uint64_t *)algn_269C336D8, a1);
}

void sub_25294F590()
{
  algn_269C336E8[5] = 0;
  *(_WORD *)&algn_269C336E8[6] = -5120;
}

uint64_t static Skeleton.Joint.Kind.leftHandMid3.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31780, &qword_269C336E0, (uint64_t *)algn_269C336E8, a1);
}

void sub_25294F5E4()
{
  algn_269C336F8[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.leftHandMidEnd.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31788, &qword_269C336F0, (uint64_t *)algn_269C336F8, a1);
}

void static Skeleton.Joint.Kind.leftHandPinkyStart.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000012;
  a1[1] = 0x800000025295A930;
}

void sub_25294F65C()
{
  algn_269C33708[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.leftHandPinky1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31790, &qword_269C33700, (uint64_t *)algn_269C33708, a1);
}

void sub_25294F6B4()
{
  algn_269C33718[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.leftHandPinky2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31798, &qword_269C33710, (uint64_t *)algn_269C33718, a1);
}

void sub_25294F70C()
{
  algn_269C33728[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.leftHandPinky3.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317A0, &qword_269C33720, (uint64_t *)algn_269C33728, a1);
}

void static Skeleton.Joint.Kind.leftHandPinkyEnd.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000025295A950;
}

void static Skeleton.Joint.Kind.leftHandRingStart.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x800000025295A970;
}

void sub_25294F7A4()
{
  *(_WORD *)&algn_269C33738[6] = -4864;
}

uint64_t static Skeleton.Joint.Kind.leftHandRing1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317A8, &qword_269C33730, (uint64_t *)algn_269C33738, a1);
}

void sub_25294F7FC()
{
  *(_WORD *)&algn_269C33748[6] = -4864;
}

uint64_t static Skeleton.Joint.Kind.leftHandRing2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317B0, &qword_269C33740, (uint64_t *)algn_269C33748, a1);
}

void sub_25294F854()
{
  *(_WORD *)&algn_269C33758[6] = -4864;
}

uint64_t static Skeleton.Joint.Kind.leftHandRing3.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317B8, &qword_269C33750, (uint64_t *)algn_269C33758, a1);
}

void sub_25294F8AC()
{
  qword_269C33760 = 0x646E61687466656CLL;
  *(void *)algn_269C33768 = 0xEF646E65676E6972;
}

uint64_t static Skeleton.Joint.Kind.leftHandRingEnd.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317C0, &qword_269C33760, (uint64_t *)algn_269C33768, a1);
}

void static Skeleton.Joint.Kind.leftHandThumbStart.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000012;
  a1[1] = 0x800000025295A9F0;
}

void sub_25294F924()
{
  algn_269C33778[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.leftHandThumb1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317C8, &qword_269C33770, (uint64_t *)algn_269C33778, a1);
}

void sub_25294F97C()
{
  algn_269C33788[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.leftHandThumb2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317D0, &qword_269C33780, (uint64_t *)algn_269C33788, a1);
}

void static Skeleton.Joint.Kind.leftHandThumbEnd.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000025295AA10;
}

void sub_25294F9F4()
{
  qword_269C33790 = 0x316B63656ELL;
  *(void *)algn_269C33798 = 0xE500000000000000;
}

uint64_t static Skeleton.Joint.Kind.neck1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317D8, &qword_269C33790, (uint64_t *)algn_269C33798, a1);
}

void sub_25294FA3C()
{
  qword_269C337A0 = 0x326B63656ELL;
  *(void *)algn_269C337A8 = 0xE500000000000000;
}

uint64_t static Skeleton.Joint.Kind.neck2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317E0, &qword_269C337A0, (uint64_t *)algn_269C337A8, a1);
}

void sub_25294FA84()
{
  qword_269C337B0 = 0x336B63656ELL;
  *(void *)algn_269C337B8 = 0xE500000000000000;
}

uint64_t static Skeleton.Joint.Kind.neck3.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317E8, &qword_269C337B0, (uint64_t *)algn_269C337B8, a1);
}

void sub_25294FACC()
{
  qword_269C337C0 = 0x346B63656ELL;
  *(void *)algn_269C337C8 = 0xE500000000000000;
}

uint64_t static Skeleton.Joint.Kind.neck4.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317F0, &qword_269C337C0, (uint64_t *)algn_269C337C8, a1);
}

void sub_25294FB14()
{
  qword_269C337D0 = 1684104552;
  *(void *)algn_269C337D8 = 0xE400000000000000;
}

uint64_t static Skeleton.Joint.Kind.head.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C317F8, &qword_269C337D0, (uint64_t *)algn_269C337D8, a1);
}

void sub_25294FB58()
{
  qword_269C337E0 = 7823722;
  *(void *)algn_269C337E8 = 0xE300000000000000;
}

uint64_t static Skeleton.Joint.Kind.jaw.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31800, &qword_269C337E0, (uint64_t *)algn_269C337E8, a1);
}

void sub_25294FB9C()
{
  qword_269C337F0 = 1852401763;
  *(void *)algn_269C337F8 = 0xE400000000000000;
}

uint64_t static Skeleton.Joint.Kind.chin.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31808, &qword_269C337F0, (uint64_t *)algn_269C337F8, a1);
}

void sub_25294FBE0()
{
  qword_269C33800 = 0x6579657466656CLL;
  *(void *)algn_269C33808 = 0xE700000000000000;
}

uint64_t static Skeleton.Joint.Kind.leftEye.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31810, &qword_269C33800, (uint64_t *)algn_269C33808, a1);
}

void sub_25294FC2C()
{
  qword_269C33810 = 0x6C6579657466656CLL;
  *(void *)algn_269C33818 = 0xEF64696C7265776FLL;
}

uint64_t static Skeleton.Joint.Kind.leftEyeLowerLid.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31818, &qword_269C33810, (uint64_t *)algn_269C33818, a1);
}

void sub_25294FC84()
{
  qword_269C33820 = 0x756579657466656CLL;
  *(void *)algn_269C33828 = 0xEF64696C72657070;
}

uint64_t static Skeleton.Joint.Kind.leftEyeUpperLid.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31820, &qword_269C33820, (uint64_t *)algn_269C33828, a1);
}

void sub_25294FCDC()
{
  qword_269C33830 = 0x626579657466656CLL;
  *(void *)algn_269C33838 = 0xEB000000006C6C61;
}

uint64_t static Skeleton.Joint.Kind.leftEyeball.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31828, &qword_269C33830, (uint64_t *)algn_269C33838, a1);
}

void sub_25294FD30()
{
  qword_269C33840 = 0x7261657466656CLL;
  *(void *)algn_269C33848 = 0xE700000000000000;
}

uint64_t static Skeleton.Joint.Kind.leftEar.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31830, &qword_269C33840, (uint64_t *)algn_269C33848, a1);
}

void sub_25294FD7C()
{
  qword_269C33850 = 1702063982;
  *(void *)algn_269C33858 = 0xE400000000000000;
}

uint64_t static Skeleton.Joint.Kind.nose.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31838, &qword_269C33850, (uint64_t *)algn_269C33858, a1);
}

void sub_25294FDC0()
{
  qword_269C33860 = 0x6579657468676972;
  *(void *)algn_269C33868 = 0xE800000000000000;
}

uint64_t static Skeleton.Joint.Kind.rightEye.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31840, &qword_269C33860, (uint64_t *)algn_269C33868, a1);
}

void static Skeleton.Joint.Kind.rightEyeLowerLid.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000025295A910;
}

void static Skeleton.Joint.Kind.rightEyeUpperLid.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000025295A8F0;
}

void sub_25294FE4C()
{
  algn_269C33878[5] = 0;
  *(_WORD *)&algn_269C33878[6] = -5120;
}

uint64_t static Skeleton.Joint.Kind.rightEyeball.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31848, &qword_269C33870, (uint64_t *)algn_269C33878, a1);
}

void sub_25294FEA0()
{
  qword_269C33880 = 0x7261657468676972;
  *(void *)algn_269C33888 = 0xE800000000000000;
}

uint64_t static Skeleton.Joint.Kind.rightEar.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31850, &qword_269C33880, (uint64_t *)algn_269C33888, a1);
}

void sub_25294FEEC()
{
  algn_269C33898[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.rightShoulder.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31858, &qword_269C33890, (uint64_t *)algn_269C33898, a1);
}

void sub_25294FF44()
{
  qword_269C338A0 = 0x6D72617468676972;
  *(void *)algn_269C338A8 = 0xE800000000000000;
}

uint64_t static Skeleton.Joint.Kind.rightArm.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31860, &qword_269C338A0, (uint64_t *)algn_269C338A8, a1);
}

void sub_25294FF90()
{
  algn_269C338B8[5] = 0;
  *(_WORD *)&algn_269C338B8[6] = -5120;
}

uint64_t static Skeleton.Joint.Kind.rightForearm.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31868, &qword_269C338B0, (uint64_t *)algn_269C338B8, a1);
}

void static Skeleton.Joint.Kind.rightForearmWrist.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x800000025295B180;
}

void sub_252950004()
{
  qword_269C338C0 = 0x6E61687468676972;
  *(void *)algn_269C338C8 = 0xE900000000000064;
}

uint64_t static Skeleton.Joint.Kind.rightHand.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31870, &qword_269C338C0, (uint64_t *)algn_269C338C8, a1);
}

void sub_252950054()
{
  qword_269C338D0 = 0x6972777468676972;
  *(void *)algn_269C338D8 = 0xEA00000000007473;
}

uint64_t static Skeleton.Joint.Kind.rightWrist.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31878, &qword_269C338D0, (uint64_t *)algn_269C338D8, a1);
}

void sub_2529500A4()
{
  qword_269C338E0 = 0x626C657468676972;
  *(void *)algn_269C338E8 = 0xEA0000000000776FLL;
}

uint64_t static Skeleton.Joint.Kind.rightElbow.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31880, &qword_269C338E0, (uint64_t *)algn_269C338E8, a1);
}

void static Skeleton.Joint.Kind.rightHandIndexStart.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000013;
  a1[1] = 0x800000025295AAD0;
}

void sub_252950114()
{
  qword_269C338F0 = 0x6E61687468676972;
  *(void *)algn_269C338F8 = 0xEF317865646E6964;
}

uint64_t static Skeleton.Joint.Kind.rightHandIndex1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31888, &qword_269C338F0, (uint64_t *)algn_269C338F8, a1);
}

void sub_25295016C()
{
  qword_269C33900 = 0x6E61687468676972;
  *(void *)algn_269C33908 = 0xEF327865646E6964;
}

uint64_t static Skeleton.Joint.Kind.rightHandIndex2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31890, &qword_269C33900, (uint64_t *)algn_269C33908, a1);
}

void sub_2529501C4()
{
  qword_269C33910 = 0x6E61687468676972;
  *(void *)algn_269C33918 = 0xEF337865646E6964;
}

uint64_t static Skeleton.Joint.Kind.rightHandIndex3.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C31898, &qword_269C33910, (uint64_t *)algn_269C33918, a1);
}

void static Skeleton.Joint.Kind.rightHandIndexEnd.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x800000025295AAF0;
}

void static Skeleton.Joint.Kind.rightHandMidStart.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x800000025295AAB0;
}

void sub_25295025C()
{
  *(_WORD *)&algn_269C33928[6] = -4864;
}

uint64_t static Skeleton.Joint.Kind.rightHandMid1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318A0, &qword_269C33920, (uint64_t *)algn_269C33928, a1);
}

void sub_2529502B4()
{
  *(_WORD *)&algn_269C33938[6] = -4864;
}

uint64_t static Skeleton.Joint.Kind.rightHandMid2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318A8, &qword_269C33930, (uint64_t *)algn_269C33938, a1);
}

void sub_25295030C()
{
  *(_WORD *)&algn_269C33948[6] = -4864;
}

uint64_t static Skeleton.Joint.Kind.rightHandMid3.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318B0, &qword_269C33940, (uint64_t *)algn_269C33948, a1);
}

void sub_252950364()
{
  qword_269C33950 = 0x6E61687468676972;
  *(void *)algn_269C33958 = 0xEF646E6564696D64;
}

uint64_t static Skeleton.Joint.Kind.rightHandMidEnd.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318B8, &qword_269C33950, (uint64_t *)algn_269C33958, a1);
}

void static Skeleton.Joint.Kind.rightHandPinkyStart.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000013;
  a1[1] = 0x800000025295AA30;
}

void sub_2529503DC()
{
  qword_269C33960 = 0x6E61687468676972;
  *(void *)algn_269C33968 = 0xEF31796B6E697064;
}

uint64_t static Skeleton.Joint.Kind.rightHandPinky1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318C0, &qword_269C33960, (uint64_t *)algn_269C33968, a1);
}

void sub_252950434()
{
  qword_269C33970 = 0x6E61687468676972;
  *(void *)algn_269C33978 = 0xEF32796B6E697064;
}

uint64_t static Skeleton.Joint.Kind.rightHandPinky2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318C8, &qword_269C33970, (uint64_t *)algn_269C33978, a1);
}

void sub_25295048C()
{
  qword_269C33980 = 0x6E61687468676972;
  *(void *)algn_269C33988 = 0xEF33796B6E697064;
}

uint64_t static Skeleton.Joint.Kind.rightHandPinky3.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318D0, &qword_269C33980, (uint64_t *)algn_269C33988, a1);
}

void static Skeleton.Joint.Kind.rightHandPinkyEnd.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x800000025295AA50;
}

void static Skeleton.Joint.Kind.rightHandRingStart.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000012;
  a1[1] = 0x800000025295AA70;
}

void sub_252950524()
{
  algn_269C33998[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.rightHandRing1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318D8, &qword_269C33990, (uint64_t *)algn_269C33998, a1);
}

void sub_25295057C()
{
  algn_269C339A8[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.rightHandRing2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318E0, &qword_269C339A0, (uint64_t *)algn_269C339A8, a1);
}

void sub_2529505D4()
{
  algn_269C339B8[7] = -18;
}

uint64_t static Skeleton.Joint.Kind.rightHandRing3.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318E8, &qword_269C339B0, (uint64_t *)algn_269C339B8, a1);
}

void static Skeleton.Joint.Kind.rightHandRingEnd.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000025295AA90;
}

void static Skeleton.Joint.Kind.rightHandThumbStart.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000013;
  a1[1] = 0x800000025295AB10;
}

void sub_25295066C()
{
  qword_269C339C0 = 0x6E61687468676972;
  *(void *)algn_269C339C8 = 0xEF31626D75687464;
}

uint64_t static Skeleton.Joint.Kind.rightHandThumb1.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318F0, &qword_269C339C0, (uint64_t *)algn_269C339C8, a1);
}

void sub_2529506C4()
{
  qword_269C339D0 = 0x6E61687468676972;
  *(void *)algn_269C339D8 = 0xEF32626D75687464;
}

uint64_t static Skeleton.Joint.Kind.rightHandThumb2.getter@<X0>(void *a1@<X8>)
{
  return sub_25295071C(&qword_269C318F8, &qword_269C339D0, (uint64_t *)algn_269C339D8, a1);
}

uint64_t sub_25295071C@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;

  return swift_bridgeObjectRetain();
}

void static Skeleton.Joint.Kind.rightHandThumbEnd.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x800000025295AB30;
}

unint64_t sub_2529507A4()
{
  unint64_t result = qword_269C339E0;
  if (!qword_269C339E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269C339E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for Skeleton.Joint.Kind()
{
  return &type metadata for Skeleton.Joint.Kind;
}

uint64_t VideoSource.Configuration.repeats.getter()
{
  return *v0;
}

uint64_t VideoSource.Configuration.repeats.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*VideoSource.Configuration.repeats.modify())()
{
  return nullsub_1;
}

__n128 VideoSource.Configuration.cameraIntrinsics.getter@<Q0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 64);
  long long v3 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = *(__n128 *)(v1 + 48);
  *(__n128 *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 48) = v2;
  return result;
}

uint64_t VideoSource.Configuration.cameraIntrinsics.setter(uint64_t a1)
{
  return sub_2528EB258(a1, v1 + 16);
}

uint64_t (*VideoSource.Configuration.cameraIntrinsics.modify())()
{
  return nullsub_1;
}

double VideoSource.Configuration.init()@<D0>(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(unsigned char *)(a1 + 64) = 1;
  return result;
}

double VideoSource.Configuration.init(repeats:cameraIntrinsics:)@<D0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_2528EB258(a2, (uint64_t)v8);
  char v5 = v10;
  *(unsigned char *)a3 = a1;
  long long v6 = v8[1];
  *(_OWORD *)(a3 + 16) = v8[0];
  *(_OWORD *)(a3 + 32) = v6;
  double result = *(double *)&v9;
  *(_OWORD *)(a3 + 48) = v9;
  *(unsigned char *)(a3 + 64) = v5;
  return result;
}

__n128 __swift_memcpy65_16(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t _s13ConfigurationVwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[65]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t _s13ConfigurationVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 65) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 65) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoSource.Configuration()
{
  return &type metadata for VideoSource.Configuration;
}

uint64_t sub_2529509D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C31D20);
  v3[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252950A68, 0, 0);
}

uint64_t sub_252950A68()
{
  uint64_t v1 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C32FD0);
  char v2 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C327C8) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_252953740;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v2[14];
  *uint64_t v5 = 0x643265736F70;
  v5[1] = 0xE600000000000000;
  uint64_t v7 = sub_252951A08();
  v0[6] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v0[7] = v8;
  long long v9 = *(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 16);
  v0[8] = v9;
  v0[9] = (v8 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v9(v6, v1, v7);
  unint64_t v10 = sub_2528EF7D4(v4);
  v0[10] = v10;
  uint64_t v11 = (void *)swift_task_alloc();
  v0[11] = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_252950C34;
  return MEMORY[0x270EE7940](v10);
}

uint64_t sub_252950C34(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_252950E8C;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_252950D50;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_252950D50()
{
  if (*(void *)(*(void *)(v0 + 96) + 16)
    && (unint64_t v1 = sub_252922FE8(0x643365736F70, 0xE600000000000000), (v2 & 1) != 0))
  {
    (*(void (**)(void, unint64_t, void))(v0 + 64))(*(void *)(v0 + 40), *(void *)(*(void *)(v0 + 96) + 56) + *(void *)(*(void *)(v0 + 56) + 72) * v1, *(void *)(v0 + 48));
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 1;
  }
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 40);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v6, v3, 1, v4);
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(void, void, void))(*(void *)(v0 + 56) + 32))(*(void *)(v0 + 16), *(void *)(v0 + 40), *(void *)(v0 + 48));
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
  return result;
}

uint64_t sub_252950E8C()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t initializeBufferWithCopyOfBuffer for BodySkeleton3DEstimator(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t destroy for BodySkeleton3DEstimator()
{
  return swift_release();
}

uint64_t assignWithCopy for BodySkeleton3DEstimator(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for BodySkeleton3DEstimator(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for BodySkeleton3DEstimator(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BodySkeleton3DEstimator(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BodySkeleton3DEstimator()
{
  return &type metadata for BodySkeleton3DEstimator;
}

ValueMetadata *type metadata accessor for BodySkeleton3DEstimator.Model()
{
  return &type metadata for BodySkeleton3DEstimator.Model;
}

void cva::PoseRefiner<double>::refinePose()
{
}

void cva::MatrixData<int,0ul,0ul,false>::allocate()
{
}

{
  __assert_rtn("allocate", "matrixdata.h", 479, "(!m_data) || cva::detail::assertMessage(\"No matrix data must be allocated.\")");
}

void cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::SE3GroupStorage()
{
  __assert_rtn("operator=", "matrixref.h", 490, "(it == list.end()) || cva::detail::assertMessage(\"Bad number of items in initializer list.\")");
}

uint64_t sub_252951128()
{
  return MEMORY[0x270EEE2A0]();
}

uint64_t sub_252951138()
{
  return MEMORY[0x270EEE630]();
}

uint64_t sub_252951148()
{
  return MEMORY[0x270EEE690]();
}

uint64_t sub_252951158()
{
  return MEMORY[0x270EEE918]();
}

uint64_t sub_252951168()
{
  return MEMORY[0x270EEE928]();
}

uint64_t sub_252951178()
{
  return MEMORY[0x270EEE948]();
}

uint64_t sub_252951188()
{
  return MEMORY[0x270EEEEE8]();
}

uint64_t sub_252951198()
{
  return MEMORY[0x270EEF000]();
}

uint64_t sub_2529511A8()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_2529511B8()
{
  return MEMORY[0x270EEFBC8]();
}

uint64_t sub_2529511C8()
{
  return MEMORY[0x270EEFC60]();
}

uint64_t sub_2529511D8()
{
  return MEMORY[0x270EEFC80]();
}

uint64_t sub_2529511E8()
{
  return MEMORY[0x270EEFCA8]();
}

uint64_t sub_2529511F8()
{
  return MEMORY[0x270EEFCD8]();
}

uint64_t sub_252951208()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_252951218()
{
  return MEMORY[0x270EEFDC8]();
}

uint64_t sub_252951228()
{
  return MEMORY[0x270EEFDE8]();
}

uint64_t sub_252951238()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_252951248()
{
  return MEMORY[0x270EEFE70]();
}

uint64_t sub_252951258()
{
  return MEMORY[0x270EEFE78]();
}

uint64_t sub_252951268()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_252951278()
{
  return MEMORY[0x270EEFFD0]();
}

uint64_t sub_252951288()
{
  return MEMORY[0x270EEFFF0]();
}

uint64_t sub_252951298()
{
  return MEMORY[0x270EF0068]();
}

uint64_t sub_2529512A8()
{
  return MEMORY[0x270EF0110]();
}

uint64_t sub_2529512B8()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_2529512C8()
{
  return MEMORY[0x270F9C7F0]();
}

uint64_t sub_2529512D8()
{
  return MEMORY[0x270F9C7F8]();
}

uint64_t sub_2529512E8()
{
  return MEMORY[0x270F9C808]();
}

uint64_t sub_2529512F8()
{
  return MEMORY[0x270F9C828]();
}

uint64_t sub_252951308()
{
  return MEMORY[0x270F9C888]();
}

uint64_t sub_252951318()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_252951328()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_252951338()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_252951348()
{
  return MEMORY[0x270F30938]();
}

uint64_t sub_252951358()
{
  return MEMORY[0x270F30940]();
}

uint64_t sub_252951368()
{
  return MEMORY[0x270F30948]();
}

uint64_t sub_252951378()
{
  return MEMORY[0x270F30950]();
}

uint64_t sub_252951388()
{
  return MEMORY[0x270F30958]();
}

uint64_t sub_252951398()
{
  return MEMORY[0x270F30960]();
}

uint64_t sub_2529513A8()
{
  return MEMORY[0x270F30968]();
}

uint64_t sub_2529513B8()
{
  return MEMORY[0x270F30970]();
}

uint64_t sub_2529513C8()
{
  return MEMORY[0x270F30978]();
}

uint64_t sub_2529513D8()
{
  return MEMORY[0x270F30980]();
}

uint64_t sub_2529513E8()
{
  return MEMORY[0x270F30988]();
}

uint64_t sub_2529513F8()
{
  return MEMORY[0x270F30990]();
}

uint64_t sub_252951408()
{
  return MEMORY[0x270F30998]();
}

uint64_t sub_252951418()
{
  return MEMORY[0x270F309A0]();
}

uint64_t sub_252951428()
{
  return MEMORY[0x270F309A8]();
}

uint64_t sub_252951438()
{
  return MEMORY[0x270F309B0]();
}

uint64_t sub_252951448()
{
  return MEMORY[0x270F309B8]();
}

uint64_t sub_252951458()
{
  return MEMORY[0x270F309C0]();
}

uint64_t sub_252951468()
{
  return MEMORY[0x270F309C8]();
}

uint64_t sub_252951478()
{
  return MEMORY[0x270F309D0]();
}

uint64_t sub_252951488()
{
  return MEMORY[0x270F309D8]();
}

uint64_t sub_252951498()
{
  return MEMORY[0x270F309E0]();
}

uint64_t sub_2529514A8()
{
  return MEMORY[0x270F309E8]();
}

uint64_t sub_2529514B8()
{
  return MEMORY[0x270F309F0]();
}

uint64_t sub_2529514C8()
{
  return MEMORY[0x270F309F8]();
}

uint64_t sub_2529514D8()
{
  return MEMORY[0x270F30A00]();
}

uint64_t sub_2529514E8()
{
  return MEMORY[0x270F30A08]();
}

uint64_t sub_2529514F8()
{
  return MEMORY[0x270F30A10]();
}

uint64_t sub_252951508()
{
  return MEMORY[0x270F30A18]();
}

uint64_t sub_252951518()
{
  return MEMORY[0x270EE74E0]();
}

uint64_t sub_252951528()
{
  return MEMORY[0x270EE74E8]();
}

uint64_t sub_252951538()
{
  return MEMORY[0x270EE7500]();
}

uint64_t sub_252951548()
{
  return MEMORY[0x270EE7528]();
}

uint64_t sub_252951558()
{
  return MEMORY[0x270EE7530]();
}

uint64_t sub_252951568()
{
  return MEMORY[0x270EE7540]();
}

uint64_t sub_252951578()
{
  return MEMORY[0x270EE7588]();
}

uint64_t sub_252951588()
{
  return MEMORY[0x270EE75B8]();
}

uint64_t sub_252951598()
{
  return MEMORY[0x270EE75C0]();
}

uint64_t sub_2529515A8()
{
  return MEMORY[0x270EE75C8]();
}

uint64_t sub_2529515B8()
{
  return MEMORY[0x270EE75E8]();
}

uint64_t sub_2529515C8()
{
  return MEMORY[0x270EE7648]();
}

uint64_t sub_2529515D8()
{
  return MEMORY[0x270EE7650]();
}

uint64_t sub_2529515E8()
{
  return MEMORY[0x270EE7658]();
}

uint64_t sub_2529515F8()
{
  return MEMORY[0x270EE7660]();
}

uint64_t sub_252951608()
{
  return MEMORY[0x270EE7668]();
}

uint64_t sub_252951618()
{
  return MEMORY[0x270EE76B8]();
}

uint64_t sub_252951638()
{
  return MEMORY[0x270EE76C8]();
}

uint64_t sub_252951648()
{
  return MEMORY[0x270EE76D0]();
}

uint64_t sub_252951658()
{
  return MEMORY[0x270EE76D8]();
}

uint64_t sub_252951668()
{
  return MEMORY[0x270EE76E0]();
}

uint64_t sub_252951678()
{
  return MEMORY[0x270EE76E8]();
}

uint64_t sub_252951688()
{
  return MEMORY[0x270EE76F0]();
}

uint64_t sub_2529516A8()
{
  return MEMORY[0x270EE7700]();
}

uint64_t sub_2529516B8()
{
  return MEMORY[0x270EE7708]();
}

uint64_t sub_2529516C8()
{
  return MEMORY[0x270EE7710]();
}

uint64_t sub_2529516D8()
{
  return MEMORY[0x270EE7718]();
}

uint64_t sub_2529516E8()
{
  return MEMORY[0x270EE7720]();
}

uint64_t sub_2529516F8()
{
  return MEMORY[0x270EE7728]();
}

uint64_t sub_252951708()
{
  return MEMORY[0x270EE7730]();
}

uint64_t sub_252951718()
{
  return MEMORY[0x270EE7738]();
}

uint64_t sub_252951728()
{
  return MEMORY[0x270EE7740]();
}

uint64_t sub_252951738()
{
  return MEMORY[0x270EE7748]();
}

uint64_t sub_252951748()
{
  return MEMORY[0x270EE7750]();
}

uint64_t sub_252951758()
{
  return MEMORY[0x270EE7758]();
}

uint64_t sub_252951768()
{
  return MEMORY[0x270EE7760]();
}

uint64_t sub_252951778()
{
  return MEMORY[0x270EE7768]();
}

uint64_t sub_252951788()
{
  return MEMORY[0x270EE7770]();
}

uint64_t sub_252951798()
{
  return MEMORY[0x270EE7778]();
}

uint64_t sub_2529517A8()
{
  return MEMORY[0x270EE7780]();
}

uint64_t sub_2529517B8()
{
  return MEMORY[0x270EE7788]();
}

uint64_t sub_2529517C8()
{
  return MEMORY[0x270EE7790]();
}

uint64_t sub_2529517D8()
{
  return MEMORY[0x270EE7798]();
}

uint64_t sub_2529517E8()
{
  return MEMORY[0x270EE77A0]();
}

uint64_t sub_2529517F8()
{
  return MEMORY[0x270EE77A8]();
}

uint64_t sub_252951808()
{
  return MEMORY[0x270EE77B0]();
}

uint64_t sub_252951818()
{
  return MEMORY[0x270EE77B8]();
}

uint64_t sub_252951828()
{
  return MEMORY[0x270EE77C0]();
}

uint64_t sub_252951838()
{
  return MEMORY[0x270EE77C8]();
}

uint64_t sub_252951848()
{
  return MEMORY[0x270EE77D0]();
}

uint64_t sub_252951858()
{
  return MEMORY[0x270EE77D8]();
}

uint64_t sub_252951868()
{
  return MEMORY[0x270EE77E0]();
}

uint64_t sub_252951878()
{
  return MEMORY[0x270EE77E8]();
}

uint64_t sub_252951888()
{
  return MEMORY[0x270EE77F0]();
}

uint64_t sub_252951898()
{
  return MEMORY[0x270EE77F8]();
}

uint64_t sub_2529518A8()
{
  return MEMORY[0x270EE7800]();
}

uint64_t sub_2529518B8()
{
  return MEMORY[0x270EE7808]();
}

uint64_t sub_2529518C8()
{
  return MEMORY[0x270EE7810]();
}

uint64_t sub_2529518D8()
{
  return MEMORY[0x270EE7818]();
}

uint64_t sub_2529518E8()
{
  return MEMORY[0x270EE7820]();
}

uint64_t sub_2529518F8()
{
  return MEMORY[0x270EE7828]();
}

uint64_t sub_252951908()
{
  return MEMORY[0x270EE7830]();
}

uint64_t sub_252951918()
{
  return MEMORY[0x270EE7838]();
}

uint64_t sub_252951928()
{
  return MEMORY[0x270EE7840]();
}

uint64_t sub_252951938()
{
  return MEMORY[0x270EE7848]();
}

uint64_t sub_252951948()
{
  return MEMORY[0x270EE7850]();
}

uint64_t sub_252951958()
{
  return MEMORY[0x270EE7858]();
}

uint64_t sub_252951968()
{
  return MEMORY[0x270EE7860]();
}

uint64_t sub_252951978()
{
  return MEMORY[0x270EE7868]();
}

uint64_t sub_252951998()
{
  return MEMORY[0x270EE7878]();
}

uint64_t sub_2529519A8()
{
  return MEMORY[0x270EE7880]();
}

uint64_t sub_2529519B8()
{
  return MEMORY[0x270EE7888]();
}

uint64_t sub_2529519C8()
{
  return MEMORY[0x270EE7890]();
}

uint64_t sub_2529519D8()
{
  return MEMORY[0x270EE7898]();
}

uint64_t sub_2529519E8()
{
  return MEMORY[0x270EE78A0]();
}

uint64_t sub_2529519F8()
{
  return MEMORY[0x270EE78A8]();
}

uint64_t sub_252951A08()
{
  return MEMORY[0x270EE78B0]();
}

uint64_t sub_252951A18()
{
  return MEMORY[0x270EE78B8]();
}

uint64_t sub_252951A28()
{
  return MEMORY[0x270EE78C0]();
}

uint64_t sub_252951A38()
{
  return MEMORY[0x270EE78C8]();
}

uint64_t sub_252951A48()
{
  return MEMORY[0x270EE78D0]();
}

uint64_t sub_252951A58()
{
  return MEMORY[0x270EE78D8]();
}

uint64_t sub_252951A68()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_252951A78()
{
  return MEMORY[0x270FA09F8]();
}

uint64_t sub_252951A88()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_252951A98()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_252951AA8()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_252951AB8()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_252951AC8()
{
  return MEMORY[0x270EF19D0]();
}

uint64_t sub_252951AD8()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_252951AE8()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_252951AF8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_252951B08()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_252951B18()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_252951B28()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_252951B38()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_252951B48()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_252951B58()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_252951B68()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_252951B78()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_252951B88()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_252951B98()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_252951BA8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_252951BB8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_252951BC8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_252951BD8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_252951BE8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_252951BF8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_252951C38()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_252951C48()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_252951C58()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_252951C68()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_252951C78()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_252951C88()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_252951C98()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_252951CA8()
{
  return MEMORY[0x270EF1C68]();
}

uint64_t sub_252951CB8()
{
  return MEMORY[0x270EF1CA0]();
}

uint64_t sub_252951CC8()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_252951CD8()
{
  return MEMORY[0x270EF1CD0]();
}

uint64_t sub_252951CE8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_252951CF8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_252951D08()
{
  return MEMORY[0x270FA2F18]();
}

uint64_t sub_252951D18()
{
  return MEMORY[0x270EE7928]();
}

uint64_t sub_252951D28()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_252951D38()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_252951D48()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_252951D58()
{
  return MEMORY[0x270FA0800]();
}

uint64_t sub_252951D78()
{
  return MEMORY[0x270FA0878]();
}

uint64_t sub_252951DB8()
{
  return MEMORY[0x270EF2190]();
}

uint64_t sub_252951DC8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_252951DD8()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_252951DE8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_252951DF8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_252951E08()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_252951E18()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_252951E28()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_252951E38()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_252951E48()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_252951E58()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_252951E68()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_252951E78()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_252951E88()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_252951E98()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_252951EA8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_252951EB8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_252951EC8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_252951ED8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_252951EE8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_252951EF8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_252951F08()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_252951F18()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_252951F28()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_252951F38()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_252951F48()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_252951F58()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_252951F68()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_252951F78()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_252951F98()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_252951FA8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_252951FB8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_252951FC8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_252951FD8()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_252951FE8()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_252951FF8()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_252952008()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_252952018()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_252952028()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_252952038()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_252952048()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_252952058()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_252952068()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_252952078()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_252952088()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_252952098()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2529520A8()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_2529520B8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2529520C8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2529520D8()
{
  return MEMORY[0x270F9F578]();
}

uint64_t sub_2529520E8()
{
  return MEMORY[0x270F9F658]();
}

uint64_t sub_2529520F8()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_252952108()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_252952118()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_252952128()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_252952138()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_252952148()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_252952158()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_252952168()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_252952178()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_252952188()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_252952198()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2529521A8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2529521B8()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2529521C8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2529521D8()
{
  return MEMORY[0x270F9FD58]();
}

uint64_t sub_2529521E8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2529521F8()
{
  return MEMORY[0x270F9FD80]();
}

uint64_t sub_252952208()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t ANSTActionToNSString()
{
  return MEMORY[0x270F08AC0]();
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5988](t);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59F0](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE5A00](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C58]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CB0](name);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6798](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A8](image);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7220]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B38](target, key, attachmentModeOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C40](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C70](retstr, sbuf);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E00](time);
  return result;
}

CGSize CVImageBufferGetEncodedSize(CVImageBufferRef imageBuffer)
{
  MEMORY[0x270EEA0C0](imageBuffer);
  result.height = v2;
  result.width = v1;
  return result;
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0D8](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x270EEA0E8](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x270EEA108](image);
}

CFDictionaryRef CVPixelBufferCopyCreationAttributes(CVPixelBufferRef pixelBuffer)
{
  return (CFDictionaryRef)MEMORY[0x270EEA138](pixelBuffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA148](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA160](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA198](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B8](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F0](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA210](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA228](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA238](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA248](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA268](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA338](pixelBuffer, unlockFlags);
}

uint64_t CoreIKCreateAltruisticSolverInstance()
{
  return MEMORY[0x270F1A458]();
}

uint64_t CoreIKDestroySolver()
{
  return MEMORY[0x270F1A498]();
}

uint64_t CoreIKSolveModelSpaceSource()
{
  return MEMORY[0x270F1A728]();
}

uint64_t CoreIKSolverGetSourceBufferSize()
{
  return MEMORY[0x270F1A738]();
}

uint64_t CoreIKSolverGetTargetBufferSize()
{
  return MEMORY[0x270F1A740]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E18]();
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

uint64_t cva::Logger::logInCategory()
{
  return MEMORY[0x270F18AC0]();
}

uint64_t cva::Logger::instance(cva::Logger *this)
{
  return MEMORY[0x270F18AC8](this);
}

uint64_t cva::vecLib::sysv<double>()
{
  return MEMORY[0x270F18AD8]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

{
  return MEMORY[0x270F9A3B8]();
}

{
  return MEMORY[0x270F9A3D0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
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

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD08](a1, a2);
  return result;
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x270FA2410]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x270FA2418]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}