uint64_t sub_22A49B29C(char a1, int64_t a2, char a3, void *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if (a3)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        v7 = a2;
      }
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8) {
    v9 = a4[2];
  }
  else {
    v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268377788);
    v10 = (void *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (void *)MEMORY[0x263F8EE78];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268377790);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A49B444(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268376130);
    v10 = (char *)swift_allocObject();
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
    v10 = (char *)MEMORY[0x263F8EE78];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
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
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A49B5B0(char a1, int64_t a2, char a3, void *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268377780);
    v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268376E30);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A49B73C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683764E0);
    v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A49B8AC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268376000);
    v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A49BA18(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683760E0);
    v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[48 * v8] || v12 >= &v13[48 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A49BBA0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2683760C8);
    v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
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
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

void sub_22A49BD00(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v30 = 0;
  int64_t v6 = 0;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 56);
  int64_t v33 = (unint64_t)(v7 + 63) >> 6;
  while (v9)
  {
    unint64_t v10 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v11 = v10 | (v6 << 6);
LABEL_18:
    id v15 = *(id *)(*(void *)(a3 + 48) + 8 * v11);
    if ((uint64_t)objc_msgSend(v15, sel_enhancedLoggingDuration) <= 0
      && (uint64_t)objc_msgSend(v15, sel_enhancedLoggingRetryCount) < 1)
    {
      goto LABEL_4;
    }
    id v16 = objc_msgSend(v15, sel_matchers);
    if (!v16) {
      goto LABEL_4;
    }
    v17 = v16;
    sub_22A40F5A0(0, &qword_268375FD0);
    sub_22A40FF6C(&qword_268375FD8, &qword_268375FD0);
    uint64_t v18 = sub_22A4B36B8();

    uint64_t v19 = (v18 & 0xC000000000000001) != 0 ? sub_22A4B3A08() : *(void *)(v18 + 16);
    swift_bridgeObjectRelease();
    if (v19 > 0
      && ([a5 tat],
          (id v20 = objc_msgSend(v15, sel_conditions)) != 0))
    {
      v21 = v20;
      sub_22A40F5A0(0, &qword_268375FE0);
      sub_22A40FF6C(&qword_268375FE8, &qword_268375FE0);
      uint64_t v22 = sub_22A4B36B8();

      if ((v22 & 0xC000000000000001) != 0)
      {
        if (!sub_22A4B3A08()) {
          goto LABEL_37;
        }
      }
      else if (!*(void *)(v22 + 16))
      {
        goto LABEL_37;
      }
      if (objc_msgSend(v15, sel_alwaysRequired)
        || (unint64_t v23 = *(void *)(sub_22A40F964(v22) + 16), swift_bridgeObjectRelease(), v23 >= 2))
      {
LABEL_37:

        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v24 = sub_22A40F984(v22);
        swift_bridgeObjectRelease();
        uint64_t v25 = swift_bridgeObjectRetain();
        uint64_t v26 = sub_22A426724(v25);
        swift_bridgeObjectRelease();
        char v27 = sub_22A491EC8(v24, v26);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v27)
        {
          *(unint64_t *)((char *)a1 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
          BOOL v12 = __OFADD__(v30++, 1);
          if (v12)
          {
            __break(1u);
LABEL_42:
            swift_retain();
            sub_22A46920C(a1, a2, v30, a3);
            return;
          }
        }
      }
    }
    else
    {
LABEL_4:
    }
  }
  BOOL v12 = __OFADD__(v6++, 1);
  if (v12)
  {
    __break(1u);
    goto LABEL_44;
  }
  if (v6 >= v33) {
    goto LABEL_42;
  }
  unint64_t v13 = *(void *)(v32 + 8 * v6);
  if (v13)
  {
LABEL_17:
    unint64_t v9 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v6 << 6);
    goto LABEL_18;
  }
  int64_t v14 = v6 + 1;
  if (v6 + 1 >= v33) {
    goto LABEL_42;
  }
  unint64_t v13 = *(void *)(v32 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v6 + 2;
  if (v6 + 2 >= v33) {
    goto LABEL_42;
  }
  unint64_t v13 = *(void *)(v32 + 8 * v14);
  if (v13) {
    goto LABEL_16;
  }
  int64_t v14 = v6 + 3;
  if (v6 + 3 >= v33) {
    goto LABEL_42;
  }
  unint64_t v13 = *(void *)(v32 + 8 * v14);
  if (v13)
  {
LABEL_16:
    int64_t v6 = v14;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v6 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v6 >= v33) {
      goto LABEL_42;
    }
    unint64_t v13 = *(void *)(v32 + 8 * v6);
    ++v14;
    if (v13) {
      goto LABEL_17;
    }
  }
LABEL_44:
  __break(1u);
}

uint64_t sub_22A49C110(uint64_t a1, uint64_t a2, void *a3)
{
  v21[1] = *MEMORY[0x263EF8340];
  char v7 = *(unsigned char *)(a1 + 32);
  unsigned int v8 = v7 & 0x3F;
  unint64_t v9 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v10 = 8 * v9;
  swift_bridgeObjectRetain_n();
  uint64_t isStackAllocationSafe = a3;
  BOOL v12 = (void *)isStackAllocationSafe;
  if (v8 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    unint64_t v13 = (char *)v21 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0);
    bzero(v13, v10);
    swift_bridgeObjectRetain();
    id v14 = v12;
    sub_22A49BD00((unint64_t *)v13, v9, a1, a2, v14);
    uint64_t v16 = v15;
    swift_release();
    swift_bridgeObjectRelease();

    if (v3) {
      swift_willThrow();
    }

    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = (void *)swift_slowAlloc();
    bzero(v17, v10);
    swift_bridgeObjectRetain();
    id v18 = v12;
    sub_22A49BD00((unint64_t *)v17, v9, a1, a2, v18);
    uint64_t v16 = v19;
    swift_release();
    swift_bridgeObjectRelease();

    MEMORY[0x22A6CA7B0](v17, -1, -1);
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_22A49C328(uint64_t a1, uint64_t a2, void *a3)
{
  if ((a1 & 0xC000000000000001) == 0) {
    return sub_22A49C110(a1, a2, a3);
  }
  uint64_t v4 = MEMORY[0x263F8EE88];
  uint64_t v31 = MEMORY[0x263F8EE88];
  swift_bridgeObjectRetain();
  id v29 = a3;
  sub_22A4B39B8();
  if (!sub_22A4B3A38()) {
    goto LABEL_36;
  }
  sub_22A40F5A0(0, &qword_268376300);
  do
  {
    swift_dynamicCast();
    if ((uint64_t)objc_msgSend(v30, sel_enhancedLoggingDuration) <= 0
      && (uint64_t)objc_msgSend(v30, sel_enhancedLoggingRetryCount) < 1)
    {
      goto LABEL_19;
    }
    id v5 = objc_msgSend(v30, sel_matchers);
    if (!v5) {
      goto LABEL_19;
    }
    int64_t v6 = v5;
    sub_22A40F5A0(0, &qword_268375FD0);
    sub_22A40FF6C(&qword_268375FD8, &qword_268375FD0);
    uint64_t v7 = sub_22A4B36B8();

    uint64_t v8 = (v7 & 0xC000000000000001) != 0 ? sub_22A4B3A08() : *(void *)(v7 + 16);
    swift_bridgeObjectRelease();
    if (v8 < 1) {
      goto LABEL_19;
    }

    id v9 = objc_msgSend(v30, sel_conditions);
    if (!v9) {
      goto LABEL_19;
    }
    size_t v10 = v9;
    sub_22A40F5A0(0, &qword_268375FE0);
    sub_22A40FF6C(&qword_268375FE8, &qword_268375FE0);
    uint64_t v11 = sub_22A4B36B8();

    if ((v11 & 0xC000000000000001) != 0)
    {
      if (!sub_22A4B3A08()) {
        goto LABEL_18;
      }
    }
    else if (!*(void *)(v11 + 16))
    {
      goto LABEL_18;
    }
    if ((objc_msgSend(v30, sel_alwaysRequired) & 1) != 0
      || (unint64_t v12 = *(void *)(sub_22A40F964(v11) + 16), swift_bridgeObjectRelease(), v12 > 1))
    {
LABEL_18:
      swift_bridgeObjectRelease();
LABEL_19:

      continue;
    }
    uint64_t v13 = sub_22A40F984(v11);
    swift_bridgeObjectRelease();
    uint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v15 = sub_22A426724(v14);
    swift_bridgeObjectRelease();
    char v16 = sub_22A491EC8(v13, v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0) {
      goto LABEL_19;
    }
    uint64_t v17 = v31;
    unint64_t v18 = *(void *)(v31 + 16);
    if (*(void *)(v31 + 24) <= v18)
    {
      sub_22A421938(v18 + 1);
      uint64_t v17 = v31;
    }
    uint64_t result = sub_22A4B3888();
    uint64_t v20 = v17 + 56;
    uint64_t v21 = -1 << *(unsigned char *)(v17 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v17 + 56 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v17 + 56 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v20 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v20 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    *(void *)(*(void *)(v17 + 48) + 8 * v24) = v30;
    ++*(void *)(v17 + 16);
  }
  while (sub_22A4B3A38());
  uint64_t v4 = v31;
LABEL_36:

  swift_bridgeObjectRelease();
  swift_release();
  return v4;
}

uint64_t sub_22A49C7BC(uint64_t a1)
{
  return sub_22A49C904(a1, qword_268379ED8, &qword_268375D18, (id *)&qword_268379F68);
}

uint64_t sub_22A49C7E8(uint64_t a1)
{
  return sub_22A49C904(a1, qword_268379EF0, &qword_268375D20, (id *)&qword_268379F70);
}

uint64_t sub_22A49C814(uint64_t a1)
{
  return sub_22A49C904(a1, qword_268379F08, &qword_268375D40, (id *)&qword_268379F90);
}

uint64_t sub_22A49C840()
{
  uint64_t v0 = sub_22A4B27C8();
  __swift_allocate_value_buffer(v0, qword_268379F20);
  __swift_project_value_buffer(v0, (uint64_t)qword_268379F20);
  sub_22A4B3458();
  return sub_22A4B27B8();
}

uint64_t sub_22A49C8AC(uint64_t a1)
{
  return sub_22A49C904(a1, qword_268379F38, &qword_268375D50, (id *)&qword_268379FA0);
}

uint64_t sub_22A49C8D8(uint64_t a1)
{
  return sub_22A49C904(a1, qword_268379F50, &qword_268375D58, (id *)&qword_268379FA8);
}

uint64_t sub_22A49C904(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = sub_22A4B27C8();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v8 = *a4;
  return sub_22A4B27D8();
}

id sub_22A49C990(uint64_t a1)
{
  return sub_22A49CAF4(a1, (SEL *)&selRef_data, &qword_268379F68);
}

id sub_22A49C9A4(uint64_t a1, uint64_t a2)
{
  return sub_22A4123F8(a1, a2, &qword_268375D18, (void **)&qword_268379F68);
}

id sub_22A49C9C8(uint64_t a1)
{
  return sub_22A49CAF4(a1, (SEL *)&selRef_model, &qword_268379F70);
}

id sub_22A49C9DC(uint64_t a1, uint64_t a2)
{
  return sub_22A4123F8(a1, a2, &qword_268375D20, (void **)&qword_268379F70);
}

id sub_22A49CA00(uint64_t a1)
{
  return sub_22A49CAF4(a1, (SEL *)&selRef_sp2, &qword_268379F78);
}

id sub_22A49CA14(uint64_t a1, uint64_t a2)
{
  return sub_22A4123F8(a1, a2, &qword_268375D28, (void **)&qword_268379F78);
}

id sub_22A49CA38(uint64_t a1)
{
  return sub_22A49CAF4(a1, (SEL *)&selRef_net, &qword_268379F80);
}

id sub_22A49CA4C(uint64_t a1, uint64_t a2)
{
  return sub_22A4123F8(a1, a2, &qword_268375D30, (void **)&qword_268379F80);
}

id sub_22A49CA70(uint64_t a1)
{
  return sub_22A49CAF4(a1, (SEL *)&selRef_attachHandle, &qword_268379F88);
}

id sub_22A49CA84(uint64_t a1, uint64_t a2)
{
  return sub_22A4123F8(a1, a2, &qword_268375D38, (void **)&qword_268379F88);
}

id sub_22A49CAA8(uint64_t a1)
{
  return sub_22A49CAF4(a1, (SEL *)&selRef_appHandle, &qword_268379F90);
}

id sub_22A49CABC(uint64_t a1, uint64_t a2)
{
  return sub_22A4123F8(a1, a2, &qword_268375D40, (void **)&qword_268379F90);
}

id sub_22A49CAE0(uint64_t a1)
{
  return sub_22A49CAF4(a1, (SEL *)&selRef_ded, &qword_268379F98);
}

id sub_22A49CAF4(uint64_t a1, SEL *a2, void *a3)
{
  id result = [self *a2];
  *a3 = result;
  return result;
}

id sub_22A49CB38(uint64_t a1, uint64_t a2)
{
  return sub_22A4123F8(a1, a2, &qword_268375D48, (void **)&qword_268379F98);
}

uint64_t sub_22A49CB5C(uint64_t a1)
{
  return sub_22A49CBC0(a1, 27749, 0xE200000000000000, &qword_268379FA0);
}

id sub_22A49CB70(uint64_t a1, uint64_t a2)
{
  return sub_22A4123F8(a1, a2, &qword_268375D50, (void **)&qword_268379FA0);
}

uint64_t sub_22A49CB94(uint64_t a1)
{
  return sub_22A49CBC0(a1, 0x6465746567726174, 0xEF7965767275732DLL, &qword_268379FA8);
}

uint64_t sub_22A49CBC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_22A4386E8();
  sub_22A4B3458();
  uint64_t result = sub_22A4B38C8();
  *a4 = result;
  return result;
}

id sub_22A49CC20(uint64_t a1, uint64_t a2)
{
  return sub_22A4123F8(a1, a2, &qword_268375D58, (void **)&qword_268379FA8);
}

uint64_t sub_22A49CC44()
{
  sub_22A4B3458();
  swift_getObjectType();
  sub_22A4B3458();
  uint64_t v0 = sub_22A4B38C8();
  swift_deallocPartialClassInstance();
  return v0;
}

uint64_t sub_22A49CCC4()
{
  uint64_t v0 = sub_22A4B27C8();
  __swift_allocate_value_buffer(v0, qword_2683777C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2683777C0);
  sub_22A4B3458();
  return sub_22A4B27B8();
}

uint64_t sub_22A49CDBC()
{
  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_itemIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_22A49CE80(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_itemIdentifier);
  swift_beginAccess();
  *id v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22A49CEE0(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_itemIdentifier);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22A49CF4C())()
{
  return j__swift_endAccess;
}

uint64_t sub_22A49D0DC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_editorDelegate;
  swift_beginAccess();
  return MEMORY[0x22A6CA870](v1);
}

uint64_t sub_22A49D17C()
{
  return swift_unknownObjectRelease();
}

void (*sub_22A49D1D8(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_editorDelegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x22A6CA870](v5);
  return sub_22A430E38;
}

uint64_t sub_22A49D25C()
{
  return 0x6564696C534B4246;
}

void *sub_22A49D2D4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_question);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_22A49D330(void *a1)
{
}

uint64_t (*sub_22A49D33C(uint64_t a1))()
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22A49D39C;
}

void *sub_22A49D3AC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answer);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_22A49D408(char *a1, uint64_t a2, void *a3, void *a4)
{
  int64_t v6 = (void **)&a1[*a4];
  swift_beginAccess();
  uint64_t v7 = *v6;
  *int64_t v6 = a3;
  id v8 = a3;
  id v9 = a1;

  sub_22A49D5FC();
}

void sub_22A49D484(void *a1)
{
}

void sub_22A49D490(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a1;
  id v6 = a1;

  sub_22A49D5FC();
}

void sub_22A49D4F8(void **a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  id v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = v5;
  id v8 = v5;

  sub_22A49D5FC();
}

uint64_t (*sub_22A49D568(uint64_t a1))()
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22A49D39C;
}

void sub_22A49D5C8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_22A49D5FC();
  }
}

void sub_22A49D5FC()
{
  uint64_t v3 = v0;
  uint64_t v4 = sub_22A4B27C8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = (FBKQuestion_optional **)(v3 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_question);
  swift_beginAccess();
  id v9 = *v8;
  if (!*v8)
  {
    int64_t v33 = (void *)MEMORY[0x22A6CA870](v3 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_slider);
    if (v33)
    {
      v34 = v33;
      objc_msgSend(v33, sel_setEnabled_, 0);
      goto LABEL_24;
    }
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v1 = (FBKQuestion_optional *)(v3 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_questionLabel);
  uint64_t v10 = MEMORY[0x22A6CA870](v3 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_questionLabel);
  if (!v10)
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v11 = (void *)v10;
  unint64_t v12 = v9;
  uint64_t v2 = (char **)[(FBKQuestion_optional *)v12 text];
  uint64_t v13 = &selRef_setForcePicker_;
  objc_msgSend(v11, sel_setText_, v2);

  uint64_t v14 = (FBKAnswer_optional **)(v3 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answer);
  swift_beginAccess();
  uint64_t v15 = *v14;
  if (!v15)
  {
    uint64_t v35 = MEMORY[0x22A6CA870](v3 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answerLabel);
    if (!v35)
    {
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    v36 = (void *)v35;
    v37 = (void *)sub_22A4B3418();
    objc_msgSend(v36, sel_setText_, v37);

    v38 = (void *)MEMORY[0x22A6CA870](v3 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_slider);
    if (!v38)
    {
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    v34 = v38;
    objc_msgSend(v38, sel_setEnabled_, 0);

LABEL_24:
    return;
  }
  char v16 = v15;
  uint64_t v17 = v12;
  unint64_t v18 = v16;
  FBKSliderConfiguration.init(question:answer:)(&v65, v9, v15);
  object = v65.value.questionText._object;
  if (v65.value.questionText._object)
  {
    v62 = v18;
    v63 = (char **)v17;
    uint64_t v2 = &selRef_setForcePicker_;
    uint64_t countAndFlagsBits = v65.value.questionText._countAndFlagsBits;
    uint64_t v21 = *(void *)&v65.value.value;
    Swift::Int choiceCount = v65.value.choiceCount;
    uint64_t v61 = *(void *)&v65.value.maximumValue;
    Swift::Bool isEnabled = v65.value.isEnabled;
    uint64_t v23 = MEMORY[0x22A6CA870](v1);
    if (v23)
    {
      uint64_t v1 = (FBKQuestion_optional *)v23;
      unint64_t v24 = (void *)sub_22A4B3418();
      objc_msgSend(v1, (SEL)&selRef_setPrimitiveComplete_, v24);

      uint64_t v25 = MEMORY[0x22A6CA870](v3 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answerLabel);
      if (v25)
      {
        uint64_t v1 = (FBKQuestion_optional *)v25;
        unint64_t v26 = (void *)sub_22A4B3418();
        objc_msgSend(v1, (SEL)&selRef_setPrimitiveComplete_, v26);

        BOOL v27 = (void *)MEMORY[0x22A6CA870](v3 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_slider);
        if (v27)
        {
          id v29 = v27;
          LODWORD(v28) = HIDWORD(v21);
          int v30 = v61;
          objc_msgSend(v27, sel_setMinimumValue_, v28);
          LODWORD(v31) = v30;
          objc_msgSend(v29, sel_setMaximumValue_, v31);
          LODWORD(v32) = v21;
          objc_msgSend(v29, sel_setValue_, v32);
          objc_msgSend(v29, sel_setEnabled_, isEnabled);

          sub_22A49E6EC(countAndFlagsBits, (uint64_t)object);
          return;
        }
        goto LABEL_29;
      }
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (qword_268375D60 != -1) {
    swift_once();
  }
  uint64_t v39 = __swift_project_value_buffer(v4, (uint64_t)qword_2683777C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v39, v4);
  v40 = v17;
  v41 = v18;
  uint64_t v1 = v40;
  uint64_t v2 = v41;
  v42 = sub_22A4B27A8();
  int v43 = sub_22A4B3788();
  if (!os_log_type_enabled(v42, (os_log_type_t)v43))
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_21;
  }
  LODWORD(v61) = v43;
  v62 = (FBKAnswer_optional *)v5;
  v63 = v2;
  uint64_t v44 = swift_slowAlloc();
  Swift::Int choiceCount = swift_slowAlloc();
  v65.value.questionText._uint64_t countAndFlagsBits = choiceCount;
  *(_DWORD *)uint64_t v44 = 136446466;
  id v45 = [(FBKQuestion_optional *)v1 role];
  if (!v45)
  {
LABEL_34:

    __break(1u);
    goto LABEL_35;
  }
  v46 = v45;
  uint64_t v47 = sub_22A4B3458();
  unint64_t v49 = v48;

  uint64_t v64 = sub_22A416CC8(v47, v49, &v65.value.questionText._countAndFlagsBits);
  sub_22A4B38F8();

  v59 = v1;
  swift_bridgeObjectRelease();
  *(_WORD *)(v44 + 12) = 2050;
  uint64_t v2 = v63;
  id v50 = [v63 ID];
  if (v50)
  {
    v51 = v50;
    id v52 = objc_msgSend(v50, sel_integerValue);

    uint64_t v64 = (uint64_t)v52;
    sub_22A4B38F8();

    _os_log_impl(&dword_22A36D000, v42, (os_log_type_t)v61, "Failed to get a slider configuration for question %{public}s and answer with ID %{public}ld", (uint8_t *)v44, 0x16u);
    Swift::Int v53 = choiceCount;
    swift_arrayDestroy();
    MEMORY[0x22A6CA7B0](v53, -1, -1);
    MEMORY[0x22A6CA7B0](v44, -1, -1);

    (*(void (**)(char *, uint64_t))&v62->value.super.super._cd_rc)(v7, v4);
    uint64_t v13 = &selRef_setForcePicker_;
    uint64_t v1 = v59;
LABEL_21:
    uint64_t v54 = MEMORY[0x22A6CA870](v3 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answerLabel);
    if (!v54)
    {
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    v55 = (void *)v54;
    v56 = (void *)sub_22A4B3418();
    objc_msgSend(v55, v13[275], v56);

    v57 = (void *)MEMORY[0x22A6CA870](v3 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_slider);
    if (!v57)
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    v34 = v57;
    objc_msgSend(v57, sel_setEnabled_, 0);

    goto LABEL_24;
  }
LABEL_35:

  __break(1u);
}

void sub_22A49DCF0()
{
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for FBKSliderCell();
  objc_msgSendSuper2(&v5, sel_awakeFromNib);
  objc_msgSend(v0, sel_setSelectionStyle_, 0);
  uint64_t v1 = (void *)MEMORY[0x22A6CA870](&v0[OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_questionLabel]);
  if (v1)
  {
    uint64_t v2 = v1;
    objc_msgSend(v1, sel_setAdjustsFontForContentSizeCategory_, 1);

    uint64_t v3 = (void *)MEMORY[0x22A6CA870](&v0[OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answerLabel]);
    if (v3)
    {
      uint64_t v4 = v3;
      objc_msgSend(v3, sel_setAdjustsFontForContentSizeCategory_, 1);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_22A49DDEC(void *a1)
{
  objc_msgSend(a1, sel_value);
  uint64_t v4 = lroundf(v3);
  *(float *)&double v5 = (float)v4;
  objc_msgSend(a1, sel_setValue_animated_, 1, v5);
  uint64_t v6 = (id *)(v1 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_question);
  swift_beginAccess();
  if (!*v6) {
    return;
  }
  id v7 = objc_msgSend(*v6, sel_allChoices);
  if (!v7) {
    return;
  }
  id v8 = v7;
  sub_22A43F014();
  unint64_t v9 = sub_22A4B3628();

  if (!(v9 >> 62))
  {
    if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1) {
      goto LABEL_5;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_22A4B3C18();
  swift_bridgeObjectRelease();
  if (v21 < 1) {
    goto LABEL_18;
  }
LABEL_5:
  if ((v9 & 0xC000000000000001) == 0)
  {
    if (v4 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v4 < *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v10 = *(id *)(v9 + 8 * v4 + 32);
      goto LABEL_9;
    }
    __break(1u);
LABEL_23:
    __break(1u);
    return;
  }
  id v10 = (id)MEMORY[0x22A6C9770](v4, v9);
LABEL_9:
  uint64_t v11 = v10;
  swift_bridgeObjectRelease();
  unint64_t v12 = (id *)(v1 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answer);
  swift_beginAccess();
  if (*v12)
  {
    id v13 = *v12;
    objc_msgSend(v13, sel_setValue_, objc_msgSend(v11, sel_value));

    swift_unknownObjectRelease();
  }
  uint64_t v14 = MEMORY[0x22A6CA870](v1 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answerLabel);
  if (!v14) {
    goto LABEL_23;
  }
  uint64_t v15 = (void *)v14;
  id v16 = objc_msgSend(v11, sel_title);
  if (!v16)
  {
    sub_22A4B3458();
    id v16 = (id)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v15, sel_setText_, v16);

  uint64_t v17 = v1 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_editorDelegate;
  swift_beginAccess();
  uint64_t v18 = MEMORY[0x22A6CA870](v17);
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    id v20 = *v6;
    objc_msgSend(v19, sel_answerDidChangeForQuestion_, v20);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

void sub_22A49E0F8(void *a1)
{
  objc_msgSend(a1, sel_value);
  unint64_t v3 = lroundf(v2);
  uint64_t v4 = (id *)(v1 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_question);
  swift_beginAccess();
  if (!*v4) {
    return;
  }
  id v5 = objc_msgSend(*v4, sel_allChoices);
  if (!v5) {
    return;
  }
  uint64_t v6 = v5;
  sub_22A43F014();
  unint64_t v7 = sub_22A4B3628();

  if (!(v7 >> 62))
  {
    if (*(uint64_t *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1) {
      goto LABEL_5;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_22A4B3C18();
  swift_bridgeObjectRelease();
  if (v13 < 1) {
    goto LABEL_14;
  }
LABEL_5:
  if ((v7 & 0xC000000000000001) == 0)
  {
    if ((v3 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v3 < *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v8 = *(id *)(v7 + 8 * v3 + 32);
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_19;
  }
  id v8 = (id)MEMORY[0x22A6C9770](v3, v7);
LABEL_9:
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  uint64_t v10 = MEMORY[0x22A6CA870](v1 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answerLabel);
  if (!v10)
  {
LABEL_19:
    __break(1u);
    return;
  }
  uint64_t v11 = (void *)v10;
  id v12 = objc_msgSend(v9, sel_title);
  if (!v12)
  {
    sub_22A4B3458();
    id v12 = (id)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v11, sel_setText_, v12);
}

id FBKSliderCell.__allocating_init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (a3)
  {
    uint64_t v6 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id FBKSliderCell.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = &v3[OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_itemIdentifier];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0xE000000000000000;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_question] = 0;
  *(void *)&v3[OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answer] = 0;
  if (a3)
  {
    id v7 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for FBKSliderCell();
  id v8 = objc_msgSendSuper2(&v10, sel_initWithStyle_reuseIdentifier_, a1, v7);

  return v8;
}

id FBKSliderCell.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id FBKSliderCell.init(coder:)(void *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_itemIdentifier];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0xE000000000000000;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_question] = 0;
  *(void *)&v1[OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answer] = 0;
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for FBKSliderCell();
  id v4 = objc_msgSendSuper2(&v6, sel_initWithCoder_, a1);

  return v4;
}

id FBKSliderCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKSliderCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22A49E6EC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for FBKSliderCell()
{
  return self;
}

uint64_t sub_22A49E754@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_itemIdentifier);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22A49E7B0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_editorDelegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x22A6CA870](v3);
  *a2 = result;
  return result;
}

uint64_t sub_22A49E808()
{
  return swift_unknownObjectWeakAssign();
}

id sub_22A49E860@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_question, a2);
}

void sub_22A49E86C(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_22A49E88C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answer, a2);
}

void sub_22A49E898(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

uint64_t method lookup function for FBKSliderCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FBKSliderCell);
}

uint64_t dispatch thunk of FBKSliderCell.itemIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of FBKSliderCell.itemIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of FBKSliderCell.itemIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of FBKSliderCell.editorDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of FBKSliderCell.editorDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of FBKSliderCell.editorDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of static FBKSliderCell.reuseIdentifier()()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of FBKSliderCell.question.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of FBKSliderCell.question.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of FBKSliderCell.question.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of FBKSliderCell.answer.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of FBKSliderCell.answer.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of FBKSliderCell.answer.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of FBKSliderCell.updateSliderAndLabel()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t sub_22A49EBC0(unint64_t a1)
{
  return sub_22A49EF6C(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_22A4A1CB0);
}

uint64_t sub_22A49EBD8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_22A41627C(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(sub_22A4B2358() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A49ED88(unint64_t a1)
{
  return sub_22A49EF6C(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_22A4A1ED0);
}

uint64_t sub_22A49EDA0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_22A4B3C18();
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
    uint64_t v5 = sub_22A4B3C18();
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
    unint64_t v4 = MEMORY[0x22A6C9780](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_22A4A2310(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_22A4B3C18();
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

  return sub_22A4B3648();
}

uint64_t sub_22A49EF6C(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 + v5;
  if (__OFADD__(v7, v5)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v6 = *v2;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v2 = v6;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v7 = 1;
  }
  if (v6 >> 62) {
    goto LABEL_27;
  }
  uint64_t v11 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8) {
      uint64_t v11 = v8;
    }
    swift_bridgeObjectRetain();
    unint64_t v6 = MEMORY[0x22A6C9780](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *unint64_t v2 = v6;
    uint64_t v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = a2(v10 + 8 * *(void *)(v10 + 16) + 32, (*(void *)(v10 + 24) >> 1) - *(void *)(v10 + 16), a1);
    if (v13 >= v5) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
  }
  if (v13 >= 1)
  {
    uint64_t v14 = *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v15 = __OFADD__(v14, v13);
    uint64_t v16 = v14 + v13;
    if (v15)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
  }
  swift_bridgeObjectRelease();

  return sub_22A4B3648();
}

uint64_t sub_22A49F140(uint64_t a1)
{
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v1 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v9 >= v5) {
      goto LABEL_23;
    }
    uint64_t v10 = *(void *)(v1 + 8 * v9);
    ++v7;
    if (!v10)
    {
      int64_t v7 = v9 + 1;
      if (v9 + 1 >= v5) {
        goto LABEL_23;
      }
      uint64_t v10 = *(void *)(v1 + 8 * v7);
      if (!v10)
      {
        int64_t v7 = v9 + 2;
        if (v9 + 2 >= v5) {
          goto LABEL_23;
        }
        uint64_t v10 = *(void *)(v1 + 8 * v7);
        if (!v10)
        {
          int64_t v7 = v9 + 3;
          if (v9 + 3 >= v5) {
            goto LABEL_23;
          }
          uint64_t v10 = *(void *)(v1 + 8 * v7);
          if (!v10) {
            break;
          }
        }
      }
    }
LABEL_22:
    uint64_t v4 = (v10 - 1) & v10;
LABEL_5:
    unint64_t v8 = swift_bridgeObjectRetain();
    uint64_t result = sub_22A49EDA0(v8);
  }
  int64_t v11 = v9 + 4;
  if (v11 >= v5)
  {
LABEL_23:
    swift_release();
    return v12;
  }
  uint64_t v10 = *(void *)(v1 + 8 * v11);
  if (v10)
  {
    int64_t v7 = v11;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v7 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v7 >= v5) {
      goto LABEL_23;
    }
    uint64_t v10 = *(void *)(v1 + 8 * v7);
    ++v11;
    if (v10) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_22A49F2B0(uint64_t a1)
{
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v1 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v9 >= v5) {
      goto LABEL_23;
    }
    uint64_t v10 = *(void *)(v1 + 8 * v9);
    ++v7;
    if (!v10)
    {
      int64_t v7 = v9 + 1;
      if (v9 + 1 >= v5) {
        goto LABEL_23;
      }
      uint64_t v10 = *(void *)(v1 + 8 * v7);
      if (!v10)
      {
        int64_t v7 = v9 + 2;
        if (v9 + 2 >= v5) {
          goto LABEL_23;
        }
        uint64_t v10 = *(void *)(v1 + 8 * v7);
        if (!v10)
        {
          int64_t v7 = v9 + 3;
          if (v9 + 3 >= v5) {
            goto LABEL_23;
          }
          uint64_t v10 = *(void *)(v1 + 8 * v7);
          if (!v10) {
            break;
          }
        }
      }
    }
LABEL_22:
    uint64_t v4 = (v10 - 1) & v10;
LABEL_5:
    unint64_t v8 = swift_bridgeObjectRetain();
    uint64_t result = sub_22A49EF6C(v8, (uint64_t (*)(uint64_t, void, unint64_t))sub_22A4A1CB0);
  }
  int64_t v11 = v9 + 4;
  if (v11 >= v5)
  {
LABEL_23:
    swift_release();
    return v12;
  }
  uint64_t v10 = *(void *)(v1 + 8 * v11);
  if (v10)
  {
    int64_t v7 = v11;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v7 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v7 >= v5) {
      goto LABEL_23;
    }
    uint64_t v10 = *(void *)(v1 + 8 * v7);
    ++v11;
    if (v10) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t FBKDraftModelSnapshot.allQuestions.getter()
{
  id v1 = objc_msgSend(v0, sel_questionGroupIdToQuestions);
  sub_22A40F5A0(0, &qword_268375FC0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268377810);
  sub_22A44BE5C();
  uint64_t v2 = sub_22A4B33F8();

  uint64_t v3 = sub_22A49F140(v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_22A49F7A4()
{
  id v1 = v0;
  id v2 = objc_msgSend(v0, sel_questionGroups);
  sub_22A40F5A0(0, (unint64_t *)&unk_2683762A0);
  unint64_t v3 = sub_22A4B3628();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    uint64_t result = sub_22A4B3B68();
    if (v4 < 0)
    {
      __break(1u);
      goto LABEL_26;
    }
    uint64_t v7 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x22A6C9770](v7, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v7 + 32);
      }
      int64_t v9 = v8;
      ++v7;
      objc_msgSend(objc_allocWithZone((Class)FBKDraftModelSnapshotSection), sel_initWithType_object_, 0, v8);

      sub_22A4B3B48();
      sub_22A4B3B78();
      sub_22A4B3B88();
      sub_22A4B3B58();
    }
    while (v4 != v7);
    uint64_t v10 = v18;
    swift_bridgeObjectRelease();
    unint64_t v5 = MEMORY[0x263F8EE78];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  uint64_t v19 = v10;
  id v11 = objc_msgSend(v1, sel_devices);
  sub_22A40F5A0(0, &qword_268376840);
  unint64_t v12 = sub_22A4B3628();

  if (!(v12 >> 62))
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13) {
      goto LABEL_14;
    }
LABEL_23:
    swift_bridgeObjectRelease();
    unint64_t v17 = MEMORY[0x263F8EE78];
LABEL_24:
    sub_22A49EF6C(v17, (uint64_t (*)(uint64_t, void, unint64_t))sub_22A4A2530);
    return v19;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_22A4B3C18();
  swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_23;
  }
LABEL_14:
  uint64_t result = sub_22A4B3B68();
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t v14 = 0;
    do
    {
      if ((v12 & 0xC000000000000001) != 0) {
        id v15 = (id)MEMORY[0x22A6C9770](v14, v12);
      }
      else {
        id v15 = *(id *)(v12 + 8 * v14 + 32);
      }
      uint64_t v16 = v15;
      ++v14;
      objc_msgSend(objc_allocWithZone((Class)FBKDraftModelSnapshotSection), sel_initWithType_object_, 1, v15);

      sub_22A4B3B48();
      sub_22A4B3B78();
      sub_22A4B3B88();
      sub_22A4B3B58();
    }
    while (v13 != v14);
    unint64_t v17 = v5;
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_22A49FACC(void *a1)
{
  id v3 = objc_msgSend(a1, sel_type);
  if (v3 == (id)1)
  {
    id v4 = objc_msgSend(a1, sel_object);
    self;
    id v5 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_identifier);
    uint64_t v6 = sub_22A4B3458();
    id v8 = v7;

    id v9 = objc_msgSend(v1, sel_deviceIdToAttachments);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268377818);
    uint64_t v10 = sub_22A4B33F8();

    if (*(void *)(v10 + 16))
    {
      unint64_t v11 = sub_22A417934(v6, (uint64_t)v8);
      if (v12)
      {
        unint64_t v13 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v14 = a1;
LABEL_10:
        uint64_t v20 = sub_22A4A2750(v13, (uint64_t)v14);
        swift_bridgeObjectRelease();

        return v20;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_12;
  }
  if (!v3)
  {
    id v4 = objc_msgSend(a1, sel_object);
    self;
    id v15 = [(id)swift_dynamicCastObjCClassUnconditional() ID];
    if (!v15)
    {
LABEL_13:
      __break(1u);
      goto LABEL_14;
    }
    id v8 = v15;
    id v16 = objc_msgSend(v1, sel_questionGroupIdToQuestions);
    sub_22A40F5A0(0, &qword_268375FC0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268377810);
    sub_22A44BE5C();
    uint64_t v17 = sub_22A4B33F8();

    if (*(void *)(v17 + 16))
    {
      unint64_t v18 = sub_22A417AE0((uint64_t)v8);
      if (v19)
      {
        unint64_t v13 = *(void *)(*(void *)(v17 + 56) + 8 * v18);
        swift_bridgeObjectRetain();

        swift_bridgeObjectRelease();
        id v14 = a1;
        goto LABEL_10;
      }
    }
LABEL_12:

    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_13;
  }
LABEL_14:
  uint64_t result = sub_22A4B3BF8();
  __break(1u);
  return result;
}

uint64_t FBKDraftModelSnapshotDiff.removedSections.getter()
{
  return sub_22A49FEC0((SEL *)&selRef_currentSnapshot, (SEL *)&selRef_previousSnapshot);
}

uint64_t FBKDraftModelSnapshotDiff.addedSections.getter()
{
  return sub_22A49FEC0((SEL *)&selRef_previousSnapshot, (SEL *)&selRef_currentSnapshot);
}

uint64_t sub_22A49FEC0(SEL *a1, SEL *a2)
{
  id v5 = [v2 *a1];
  id v6 = objc_msgSend(v5, sel_questionGroups);

  sub_22A40F5A0(0, (unint64_t *)&unk_2683762A0);
  unint64_t v7 = sub_22A4B3628();

  uint64_t v8 = sub_22A42733C(v7);
  swift_bridgeObjectRelease();
  id v9 = [v2 *a2];
  id v10 = objc_msgSend(v9, sel_questionGroups);

  unint64_t v11 = sub_22A4B3628();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_22A4A28B4(v11, v8, (unint64_t *)&unk_2683762A0, (uint64_t)off_2648736C0, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  id v13 = [v2 *a1];
  id v14 = objc_msgSend(v13, sel_devices);

  sub_22A40F5A0(0, &qword_268376840);
  unint64_t v15 = sub_22A4B3628();

  uint64_t v16 = sub_22A426C6C(v15);
  swift_bridgeObjectRelease();
  id v17 = [v2 *a2];
  id v18 = objc_msgSend(v17, sel_devices);

  unint64_t v19 = sub_22A4B3628();
  swift_bridgeObjectRetain();
  unint64_t v20 = sub_22A4A28B4(v19, v16, &qword_268376840, (uint64_t)off_2648735E8, 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  sub_22A49EF6C(v20, (uint64_t (*)(uint64_t, void, unint64_t))sub_22A4A2530);
  return v12;
}

unint64_t FBKDraftModelSnapshotDiff.addedRows.getter()
{
  return sub_22A4A022C((SEL *)&selRef_previousSnapshot, (SEL *)&selRef_currentSnapshot);
}

id sub_22A4A0194(void *a1, uint64_t a2, void (*a3)(void), unint64_t *a4)
{
  id v6 = a1;
  a3();

  sub_22A40F5A0(0, a4);
  unint64_t v7 = (void *)sub_22A4B3618();
  swift_bridgeObjectRelease();

  return v7;
}

unint64_t FBKDraftModelSnapshotDiff.removedRows.getter()
{
  return sub_22A4A022C((SEL *)&selRef_currentSnapshot, (SEL *)&selRef_previousSnapshot);
}

unint64_t sub_22A4A022C(SEL *a1, SEL *a2)
{
  id v5 = v2;
  id v6 = [v2 *a1];
  id v7 = objc_msgSend(v6, sel_allQuestions);

  sub_22A40F5A0(0, &qword_2683762B0);
  unint64_t v8 = sub_22A4B3628();

  uint64_t v9 = sub_22A427534(v8);
  swift_bridgeObjectRelease();
  id v10 = [v5 *a2];
  id v11 = objc_msgSend(v10, sel_allQuestions);

  unint64_t v12 = sub_22A4B3628();
  swift_bridgeObjectRetain();
  unint64_t v13 = (unint64_t)sub_22A4A2B60(v12, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  unint64_t v57 = v13;
  id v14 = [v5 *a1];
  id v15 = objc_msgSend(v14, sel_allAttachments);

  sub_22A40F5A0(0, (unint64_t *)&unk_268376180);
  unint64_t v16 = sub_22A4B3628();

  uint64_t v17 = sub_22A4267BC(v16);
  swift_bridgeObjectRelease();
  id v52 = v5;
  Swift::Int v53 = a2;
  id v18 = [v5 *a2];
  id v19 = objc_msgSend(v18, sel_devices);

  sub_22A40F5A0(0, &qword_268376840);
  unint64_t v20 = sub_22A4B3628();

  if (v20 >> 62) {
    goto LABEL_43;
  }
  uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v21)
  {
LABEL_44:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v13;
  }
LABEL_3:
  unint64_t v13 = 0;
  unint64_t v51 = v20 & 0xC000000000000001;
  unint64_t v47 = v20 + 32;
  uint64_t v48 = v20 & 0xFFFFFFFFFFFFFF8;
  uint64_t v55 = v17 + 56;
  uint64_t v49 = v21;
  unint64_t v50 = v20;
  do
  {
    if (v51)
    {
      id v22 = (id)MEMORY[0x22A6C9770](v13, v20);
    }
    else
    {
      if (v13 >= *(void *)(v48 + 16)) {
        goto LABEL_42;
      }
      id v22 = *(id *)(v47 + 8 * v13);
    }
    id v56 = v22;
    BOOL v23 = __OFADD__(v13++, 1);
    if (v23) {
      goto LABEL_41;
    }
    id v54 = (id)v13;
    id v24 = [v52 *v53];
    id v25 = objc_msgSend(v56, sel_identifier);
    uint64_t v26 = sub_22A4B3458();
    uint64_t v28 = v27;

    id v29 = objc_msgSend(v24, sel_deviceIdToAttachments);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268377818);
    uint64_t v30 = sub_22A4B33F8();

    if (*(void *)(v30 + 16))
    {
      unint64_t v31 = sub_22A417934(v26, v28);
      unint64_t v13 = MEMORY[0x263F8EE78];
      if (v32)
      {
        unint64_t v13 = *(void *)(*(void *)(v30 + 56) + 8 * v31);
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      unint64_t v13 = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v13 >> 62)
    {
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_22A4B3C18();
      swift_bridgeObjectRelease();
      if (!v20) {
        goto LABEL_4;
      }
LABEL_16:
      unint64_t v33 = 0;
      while (1)
      {
        if ((v13 & 0xC000000000000001) != 0)
        {
          id v37 = (id)MEMORY[0x22A6C9770](v33, v13);
        }
        else
        {
          if (v33 >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_40;
          }
          id v37 = *(id *)(v13 + 32 + 8 * v33);
        }
        v36 = v37;
        BOOL v23 = __OFADD__(v33++, 1);
        if (v23)
        {
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
LABEL_43:
          swift_bridgeObjectRetain();
          uint64_t v21 = sub_22A4B3C18();
          swift_bridgeObjectRelease();
          if (!v21) {
            goto LABEL_44;
          }
          goto LABEL_3;
        }
        if ((v17 & 0xC000000000000001) != 0)
        {
          if ((sub_22A4B3A48() & 1) == 0) {
            goto LABEL_17;
          }
        }
        else
        {
          if (!*(void *)(v17 + 16)) {
            goto LABEL_17;
          }
          uint64_t v38 = sub_22A4B3888();
          uint64_t v39 = -1 << *(unsigned char *)(v17 + 32);
          unint64_t v40 = v38 & ~v39;
          if (((*(void *)(v55 + ((v40 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v40) & 1) == 0) {
            goto LABEL_17;
          }
          id v41 = *(id *)(*(void *)(v17 + 48) + 8 * v40);
          char v42 = sub_22A4B3898();

          if ((v42 & 1) == 0)
          {
            uint64_t v43 = ~v39;
            while (1)
            {
              unint64_t v40 = (v40 + 1) & v43;
              if (((*(void *)(v55 + ((v40 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v40) & 1) == 0) {
                break;
              }
              id v44 = *(id *)(*(void *)(v17 + 48) + 8 * v40);
              char v45 = sub_22A4B3898();

              if (v45) {
                goto LABEL_20;
              }
            }
LABEL_17:
            id v34 = objc_msgSend(objc_allocWithZone((Class)FBKDraftModelSnapshotSection), sel_initWithType_object_, 1, v56);
            id v35 = objc_msgSend(objc_allocWithZone((Class)FBKDraftModelSnapshotRow), sel_initWithSection_object_, v34, v36);
            MEMORY[0x22A6C9260]();
            if (*(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_22A4B3658();
            }
            sub_22A4B3678();
            sub_22A4B3648();

            v36 = v34;
          }
        }
LABEL_20:

        if (v33 == v20) {
          goto LABEL_4;
        }
      }
    }
    unint64_t v20 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v20) {
      goto LABEL_16;
    }
LABEL_4:

    swift_bridgeObjectRelease();
    unint64_t v20 = v50;
    unint64_t v13 = (unint64_t)v54;
  }
  while (v54 != (id)v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v57;
}

Swift::UInt __swiftcall FBKDraftModelSnapshotDiff.indexOfRowInNewSnapshot(_:)(FBKDraftModelSnapshotRow a1)
{
  Class isa = a1.super.isa;
  id v3 = [(objc_class *)a1.super.isa section];
  id v4 = objc_msgSend(v3, sel_type);

  if (v4 == (id)1)
  {
    Class isa = (Class)[(objc_class *)isa object];
    self;
    id v5 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v6 = objc_msgSend((id)v1, sel_currentSnapshot);
    id v7 = objc_msgSend(v5, sel_deviceUUID);
    uint64_t v8 = sub_22A4B3458();
    id v10 = v9;

    id v11 = objc_msgSend(v6, sel_deviceIdToAttachments);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268377818);
    uint64_t v12 = sub_22A4B33F8();

    if (!*(void *)(v12 + 16) || (unint64_t v13 = sub_22A417934(v8, (uint64_t)v10), (v14 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_16;
    }
    unint64_t v15 = *(void *)(*(void *)(v12 + 56) + 8 * v13);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22A41CEC4((uint64_t)v5, v15);
    Swift::UInt v1 = v16;
    id v4 = v17;
    swift_bridgeObjectRelease();

    if ((v4 & 1) == 0) {
      goto LABEL_13;
    }
    __break(1u);
  }
  if (!v4)
  {
    id v18 = [(objc_class *)isa object];
    self;
    id v19 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v20 = objc_msgSend((id)v1, sel_currentSnapshot);
    id v21 = objc_msgSend(v19, sel_questionGroup);
    if (!v21)
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    id v22 = v21;
    id v10 = [v21 ID];

    if (!v10)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    id v23 = objc_msgSend(v20, sel_questionGroupIdToQuestions);

    sub_22A40F5A0(0, &qword_268375FC0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268377810);
    sub_22A44BE5C();
    uint64_t v24 = sub_22A4B33F8();

    if (*(void *)(v24 + 16))
    {
      unint64_t v25 = sub_22A417AE0((uint64_t)v10);
      if (v26)
      {
        unint64_t v27 = *(void *)(*(void *)(v24 + 56) + 8 * v25);
        swift_bridgeObjectRetain();

        swift_bridgeObjectRelease();
        sub_22A41D088((uint64_t)v19, v27);
        Swift::UInt v1 = v28;
        char v30 = v29;
        swift_bridgeObjectRelease();
        if ((v30 & 1) == 0)
        {

LABEL_13:
          if ((v1 & 0x8000000000000000) == 0) {
            return v1;
          }
          goto LABEL_20;
        }
LABEL_19:
        __break(1u);
LABEL_20:
        sub_22A4B3BE8();
        __break(1u);
        goto LABEL_21;
      }
    }
LABEL_16:

    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_17;
  }
LABEL_21:
  Swift::UInt result = sub_22A4B3BF8();
  __break(1u);
  return result;
}

BOOL FBKDraftModelSnapshotDiff.containsAnyAdditionsOrRemovals.getter()
{
  id v1 = objc_msgSend(v0, sel_addedRows);
  sub_22A40F5A0(0, &qword_268377820);
  unint64_t v2 = sub_22A4B3628();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v3) {
    return 1;
  }
  id v4 = objc_msgSend(v0, sel_removedRows);
  unint64_t v5 = sub_22A4B3628();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v6) {
    return 1;
  }
  id v7 = objc_msgSend(v0, sel_addedSections);
  sub_22A40F5A0(0, &qword_268377828);
  unint64_t v8 = sub_22A4B3628();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v9) {
    return 1;
  }
  id v11 = objc_msgSend(v0, sel_removedSections);
  unint64_t v12 = sub_22A4B3628();

  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v13 != 0;
}

uint64_t FBKDraftModelSnapshotDiff.hasRemovedAllDevices.getter()
{
  id v1 = objc_msgSend(v0, sel_previousSnapshot);
  unsigned int v2 = objc_msgSend(v1, sel_hasAnyDevices);

  if (!v2) {
    return 0;
  }
  id v3 = objc_msgSend(v0, sel_currentSnapshot);
  unsigned int v4 = objc_msgSend(v3, sel_hasAnyDevices);

  return v4 ^ 1;
}

Swift::UInt __swiftcall FBKDraftModelSnapshotDiff.indexOfSectionInNewSnapshot(_:)(FBKDraftModelSnapshotSection a1)
{
  Class isa = a1.super.isa;
  id v3 = [(objc_class *)a1.super.isa type];
  if (v3 == (id)1)
  {
    id v4 = objc_msgSend(v1, sel_currentSnapshot);
    id v5 = objc_msgSend(v4, sel_devices);

    sub_22A40F5A0(0, &qword_268376840);
    unint64_t v6 = sub_22A4B3628();

    id v7 = [(objc_class *)isa object];
    self;
    uint64_t v8 = swift_dynamicCastObjCClassUnconditional();
    sub_22A41D0B0(v8, v6);
    Swift::UInt v10 = v9;
    LOBYTE(v4) = v11;
    swift_bridgeObjectRelease();

    if (v4)
    {
LABEL_9:
      __break(1u);
      goto LABEL_10;
    }
    if ((v10 & 0x8000000000000000) == 0) {
      return v10;
    }
LABEL_8:
    sub_22A4B3BE8();
    __break(1u);
    goto LABEL_9;
  }
  if (!v3)
  {
    id v13 = objc_msgSend(v1, sel_currentSnapshot);
    id v14 = objc_msgSend(v13, sel_questionGroups);

    sub_22A40F5A0(0, (unint64_t *)&unk_2683762A0);
    unint64_t v15 = sub_22A4B3628();

    id v16 = [(objc_class *)isa object];
    self;
    uint64_t v17 = swift_dynamicCastObjCClassUnconditional();
    sub_22A41D09C(v17, v15);
    Swift::UInt v10 = v18;
    LOBYTE(v13) = v19;
    swift_bridgeObjectRelease();

    if (v13)
    {
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
    if ((v10 & 0x8000000000000000) == 0) {
      return v10;
    }
    goto LABEL_8;
  }
LABEL_11:
  Swift::UInt result = sub_22A4B3BF8();
  __break(1u);
  return result;
}

uint64_t sub_22A4A1350()
{
  id v1 = objc_msgSend(v0, sel_addedSections);
  uint64_t v37 = sub_22A40F5A0(0, &qword_268377828);
  unint64_t v2 = sub_22A4B3628();

  if (v2 >> 62) {
    goto LABEL_23;
  }
  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  for (unint64_t i = v2; v3; unint64_t i = v2)
  {
    unint64_t v4 = 0;
    id v5 = 0;
    uint64_t v44 = v3;
    unint64_t v46 = v2 & 0xC000000000000001;
    unint64_t v38 = v2 + 32;
    uint64_t v40 = v2 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      if (v46)
      {
        id v6 = (id)MEMORY[0x22A6C9770](v4, i);
      }
      else
      {
        if (v4 >= *(void *)(v40 + 16)) {
          goto LABEL_22;
        }
        id v6 = *(id *)(v38 + 8 * v4);
      }
      id v7 = v6;
      BOOL v8 = __OFADD__(v4, 1);
      unint64_t v9 = v4 + 1;
      if (v8) {
        break;
      }
      unint64_t v48 = v9;
      id v10 = objc_msgSend(v6, sel_description);
      sub_22A4B3458();

      sub_22A4B3538();
      swift_bridgeObjectRelease();
      id v11 = objc_msgSend(v50, sel_addedRows);
      sub_22A40F5A0(0, &qword_268377820);
      unint64_t v12 = sub_22A4B3628();

      unint64_t v2 = v7;
      unint64_t v13 = sub_22A4A2E5C(v12);
      unint64_t v51 = v5;
      swift_bridgeObjectRelease();
      id v14 = (void *)v2;

      if (v13 >> 62)
      {
        uint64_t v15 = sub_22A4B3C18();
        if (!v15) {
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v15 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v15) {
          goto LABEL_4;
        }
      }
      if (v15 < 1) {
        goto LABEL_21;
      }
      uint64_t v16 = 0;
      do
      {
        if ((v13 & 0xC000000000000001) != 0) {
          id v17 = (id)MEMORY[0x22A6C9770](v16, v13);
        }
        else {
          id v17 = *(id *)(v13 + 8 * v16 + 32);
        }
        Swift::UInt v18 = v17;
        ++v16;
        id v19 = objc_msgSend(v17, sel_description, v37);
        sub_22A4B3458();

        sub_22A4B3538();
        swift_bridgeObjectRelease();
        unint64_t v2 = 0xE300000000000000;
        sub_22A4B3538();

        swift_bridgeObjectRelease();
      }
      while (v15 != v16);
LABEL_4:

      swift_bridgeObjectRelease();
      unint64_t v4 = v48;
      id v5 = v51;
      if (v48 == v44) {
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
  }
  id v5 = 0;
LABEL_25:
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v50, sel_removedSections);
  unint64_t v21 = sub_22A4B3628();

  if (v21 >> 62) {
    goto LABEL_48;
  }
  uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v22)
  {
LABEL_27:
    unint64_t v23 = 0;
    unint64_t v45 = v21;
    unint64_t v47 = v21 & 0xC000000000000001;
    unint64_t v39 = v21 + 32;
    uint64_t v41 = v21 & 0xFFFFFFFFFFFFFF8;
    uint64_t v43 = v22;
    do
    {
      if (v47)
      {
        id v24 = (id)MEMORY[0x22A6C9770](v23, v21);
      }
      else
      {
        if (v23 >= *(void *)(v41 + 16)) {
          goto LABEL_47;
        }
        id v24 = *(id *)(v39 + 8 * v23);
      }
      unint64_t v25 = v24;
      BOOL v8 = __OFADD__(v23, 1);
      unint64_t v26 = v23 + 1;
      if (v8)
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        swift_bridgeObjectRetain();
        uint64_t v22 = sub_22A4B3C18();
        swift_bridgeObjectRelease();
        if (!v22) {
          break;
        }
        goto LABEL_27;
      }
      unint64_t v49 = v26;
      id v27 = objc_msgSend(v24, sel_description);
      sub_22A4B3458();

      sub_22A4B3538();
      swift_bridgeObjectRelease();
      id v28 = objc_msgSend(v50, sel_removedRows);
      sub_22A40F5A0(0, &qword_268377820);
      unint64_t v21 = sub_22A4B3628();

      id v29 = v25;
      unint64_t v30 = sub_22A4A2E5C(v21);
      id v52 = v5;
      swift_bridgeObjectRelease();
      id v5 = v29;

      if (v30 >> 62)
      {
        uint64_t v31 = sub_22A4B3C18();
        if (!v31) {
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v31) {
          goto LABEL_28;
        }
      }
      if (v31 < 1) {
        goto LABEL_46;
      }
      uint64_t v32 = 0;
      do
      {
        if ((v30 & 0xC000000000000001) != 0) {
          id v33 = (id)MEMORY[0x22A6C9770](v32, v30);
        }
        else {
          id v33 = *(id *)(v30 + 8 * v32 + 32);
        }
        id v34 = v33;
        ++v32;
        id v35 = objc_msgSend(v33, sel_description, v37);
        sub_22A4B3458();

        sub_22A4B3538();
        swift_bridgeObjectRelease();
        sub_22A4B3538();

        swift_bridgeObjectRelease();
      }
      while (v31 != v32);
LABEL_28:

      swift_bridgeObjectRelease();
      unint64_t v21 = v45;
      unint64_t v23 = v49;
      id v5 = v52;
    }
    while (v49 != v43);
  }
  swift_bridgeObjectRelease();
  sub_22A4B3AF8();
  swift_bridgeObjectRelease();
  sub_22A4B3538();
  swift_bridgeObjectRelease();
  sub_22A4B3538();
  sub_22A4B3538();
  swift_bridgeObjectRelease();
  return 0xA3A64656464410ALL;
}

uint64_t FBKDraftModelSnapshotDiff.description.getter()
{
  id v1 = objc_msgSend(v0, sel_descriptionString);
  uint64_t v2 = sub_22A4B3458();

  return v2;
}

uint64_t sub_22A4A1A90(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A4B3C18();
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
    uint64_t v10 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22A4A2FE0(&qword_268377870, &qword_268377868);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_268377868);
          unint64_t v12 = sub_22A43EE78(v16, i, a3);
          id v14 = *v13;
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_22A40F5A0(0, (unint64_t *)&qword_268376040);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A4A1CB0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A4B3C18();
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
    uint64_t v10 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22A4A2FE0(&qword_268377830, &qword_268377818);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_268377818);
          unint64_t v12 = sub_22A43EE78(v16, i, a3);
          id v14 = *v13;
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_22A40F5A0(0, (unint64_t *)&unk_268376180);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A4A1ED0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A4B3C18();
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
    uint64_t v10 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22A4A2FE0(&qword_268377860, &qword_2683772C0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2683772C0);
          unint64_t v12 = sub_22A43EE78(v16, i, a3);
          id v14 = *v13;
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_22A40F5A0(0, (unint64_t *)&qword_268376340);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A4A20F0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A4B3C18();
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
    uint64_t v10 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22A4A2FE0(&qword_268377858, &qword_268377850);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_268377850);
          unint64_t v12 = sub_22A43EE78(v16, i, a3);
          id v14 = *v13;
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_22A40F5A0(0, &qword_268376840);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A4A2310(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A4B3C18();
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
    uint64_t v10 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22A4A2FE0(&qword_268377848, &qword_268377810);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_268377810);
          unint64_t v12 = sub_22A43EEE4(v16, i, a3);
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
    sub_22A40F5A0(0, &qword_2683762B0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A4A2530(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A4B3C18();
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
    uint64_t v10 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22A4A2FE0(&qword_268377840, &qword_268377838);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_268377838);
          unint64_t v12 = sub_22A43EE78(v16, i, a3);
          id v14 = *v13;
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_22A40F5A0(0, &qword_268377828);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A4A2750(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v4) {
      break;
    }
    uint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t result = sub_22A4B3B68();
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v6 = 0;
    while (v4 != v6)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x22A6C9770](v6, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      ++v6;
      objc_msgSend(objc_allocWithZone((Class)FBKDraftModelSnapshotRow), sel_initWithSection_object_, a2, v7);

      sub_22A4B3B48();
      sub_22A4B3B78();
      sub_22A4B3B88();
      sub_22A4B3B58();
      if (v4 == v6) {
        return v9;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22A4A28B4(unint64_t a1, uint64_t a2, unint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = a1;
  uint64_t v30 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A4B3C18();
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
    {
LABEL_3:
      uint64_t v8 = 0;
      unint64_t v28 = v6 & 0xC000000000000001;
      uint64_t v25 = v6 + 32;
      uint64_t v27 = v6;
      uint64_t v29 = a2 + 56;
      while (1)
      {
        if (v28) {
          id v9 = (id)MEMORY[0x22A6C9770](v8, v27);
        }
        else {
          id v9 = *(id *)(v25 + 8 * v8);
        }
        uint64_t v10 = v9;
        if (__OFADD__(v8++, 1))
        {
          __break(1u);
          goto LABEL_26;
        }
        if ((a2 & 0xC000000000000001) != 0)
        {
          uint64_t v6 = (uint64_t)v9;
          char v12 = sub_22A4B3A48();

          if ((v12 & 1) == 0) {
            goto LABEL_20;
          }
        }
        else
        {
          if (!*(void *)(a2 + 16)) {
            goto LABEL_20;
          }
          uint64_t v6 = (uint64_t)v9;
          uint64_t v13 = sub_22A4B3888();
          uint64_t v14 = -1 << *(unsigned char *)(a2 + 32);
          unint64_t v15 = v13 & ~v14;
          if (((*(void *)(v29 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            goto LABEL_20;
          }
          uint64_t v16 = v7;
          uint64_t v6 = sub_22A40F5A0(0, a3);
          id v17 = *(id *)(*(void *)(a2 + 48) + 8 * v15);
          char v18 = sub_22A4B3898();

          if ((v18 & 1) == 0)
          {
            uint64_t v19 = ~v14;
            while (1)
            {
              unint64_t v15 = (v15 + 1) & v19;
              uint64_t v7 = v16;
              if (((*(void *)(v29 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
                break;
              }
              id v20 = *(id *)(*(void *)(a2 + 48) + 8 * v15);
              char v21 = sub_22A4B3898();

              if (v21) {
                goto LABEL_19;
              }
            }
LABEL_20:
            id v22 = objc_msgSend(objc_allocWithZone((Class)FBKDraftModelSnapshotSection), sel_initWithType_object_, a5, v10);

            if (v22)
            {
              uint64_t v6 = (uint64_t)&v30;
              MEMORY[0x22A6C9260]();
              if (*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_22A4B3658();
              }
              sub_22A4B3678();
              sub_22A4B3648();
            }
            goto LABEL_5;
          }
LABEL_19:

          uint64_t v7 = v16;
        }
LABEL_5:
        if (v8 == v7)
        {
          swift_bridgeObjectRelease();
          return v30;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

id sub_22A4A2B60(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v25 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_22A4B3C18();
    if (v4) {
      goto LABEL_3;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    return (id)MEMORY[0x263F8EE78];
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_28;
  }
LABEL_3:
  uint64_t v5 = 0;
  unint64_t v23 = v3 & 0xC000000000000001;
  uint64_t v21 = v3 + 32;
  uint64_t v22 = v3;
  uint64_t v24 = a2 + 56;
  while (1)
  {
    if (v23) {
      id v6 = (id)MEMORY[0x22A6C9770](v5, v22);
    }
    else {
      id v6 = *(id *)(v21 + 8 * v5);
    }
    uint64_t v7 = v6;
    if (__OFADD__(v5++, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    uint64_t v3 = (uint64_t)v6;
    char v9 = sub_22A4B3A48();

    if ((v9 & 1) == 0) {
      goto LABEL_20;
    }

LABEL_5:
    if (v5 == v4)
    {
      swift_bridgeObjectRelease();
      return (id)v25;
    }
  }
  if (!*(void *)(a2 + 16)) {
    goto LABEL_20;
  }
  uint64_t v10 = sub_22A4B3888();
  uint64_t v11 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v12 = v10 & ~v11;
  if (((*(void *)(v24 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
    goto LABEL_20;
  }
  uint64_t v3 = sub_22A40F5A0(0, &qword_2683762B0);
  id v13 = *(id *)(*(void *)(a2 + 48) + 8 * v12);
  char v14 = sub_22A4B3898();

  if (v14)
  {
LABEL_19:

    goto LABEL_5;
  }
  uint64_t v15 = ~v11;
  while (1)
  {
    unint64_t v12 = (v12 + 1) & v15;
    if (((*(void *)(v24 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
      break;
    }
    id v16 = *(id *)(*(void *)(a2 + 48) + 8 * v12);
    char v17 = sub_22A4B3898();

    if (v17) {
      goto LABEL_19;
    }
  }
LABEL_20:
  id result = objc_msgSend(v7, sel_questionGroup);
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    id v19 = objc_msgSend(objc_allocWithZone((Class)FBKDraftModelSnapshotSection), sel_initWithType_object_, 0, result);

    id v20 = objc_msgSend(objc_allocWithZone((Class)FBKDraftModelSnapshotRow), sel_initWithSection_object_, v19, v7);
    if (v20)
    {
      MEMORY[0x22A6C9260]();
      if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_22A4B3658();
      }
      sub_22A4B3678();
      uint64_t v3 = (uint64_t)&v25;
      sub_22A4B3648();
    }
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_22A4A2E5C(unint64_t a1)
{
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x22A6C9770](v3, a1);
LABEL_9:
        uint64_t v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_15;
        }
        sub_22A40F5A0(0, &qword_268376640);
        id v7 = objc_msgSend(v5, sel_section);
        char v8 = sub_22A4B3898();

        if (v8)
        {
          sub_22A4B3B48();
          sub_22A4B3B78();
          sub_22A4B3B88();
          sub_22A4B3B58();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2) {
          return v10;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v2 = sub_22A4B3C18();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_22A4A2FE0(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22A4A3030(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_22A475F80();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_22A4A37E4(v6);
  return sub_22A4B3B58();
}

uint64_t static FBKGroupedDevice.sortedDevices(_:)(uint64_t a1)
{
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    unint64_t v3 = swift_bridgeObjectRetain();
    uint64_t v1 = (uint64_t)sub_22A4A4884(v3, (void (*)(void *, uint64_t, unint64_t))sub_22A4A20F0);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v4 = v1;
  sub_22A4A3030(&v4);
  return v4;
}

uint64_t sub_22A4A314C(id *a1, void **a2)
{
  id v2 = *a1;
  unint64_t v3 = *a2;
  if (objc_msgSend(*a1, sel_isCurrentDevice)) {
    goto LABEL_2;
  }
  if (objc_msgSend(v3, sel_isCurrentDevice))
  {
    char v4 = 0;
    return v4 & 1;
  }
  id v5 = objc_msgSend(v2, sel_platform);
  uint64_t v6 = sub_22A4B3458();
  uint64_t v8 = v7;

  id v9 = objc_msgSend(v3, sel_platform);
  uint64_t v10 = sub_22A4B3458();
  uint64_t v12 = v11;

  if (v6 == v10 && v8 == v12)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  char v14 = sub_22A4B3D28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v14)
  {
LABEL_14:
    id v24 = objc_msgSend(v2, sel_name);
    uint64_t v25 = sub_22A4B3458();
    uint64_t v27 = v26;

    id v28 = objc_msgSend(v3, sel_name);
    goto LABEL_15;
  }
  id v15 = objc_msgSend(v2, sel_platform);
  uint64_t v16 = sub_22A4B3458();
  uint64_t v18 = v17;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v20 = objc_msgSend(ObjCClassFromMetadata, sel_currentDevicePlatform);
  uint64_t v21 = sub_22A4B3458();
  uint64_t v23 = v22;

  if (v16 == v21 && v18 == v23)
  {
    char v4 = 1;
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  char v34 = sub_22A4B3D28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v34 & 1) == 0)
  {
    id v35 = objc_msgSend(v3, sel_platform);
    uint64_t v36 = sub_22A4B3458();
    uint64_t v38 = v37;

    id v39 = objc_msgSend(ObjCClassFromMetadata, sel_currentDevicePlatform);
    uint64_t v40 = sub_22A4B3458();
    uint64_t v42 = v41;

    if (v36 == v40 && v38 == v42)
    {
LABEL_17:
      char v4 = 0;
      goto LABEL_19;
    }
    char v43 = sub_22A4B3D28();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v4 = 0;
    if (v43) {
      return v4 & 1;
    }
    id v44 = objc_msgSend(v2, sel_platform);
    uint64_t v25 = sub_22A4B3458();
    uint64_t v27 = v45;

    id v28 = objc_msgSend(v3, sel_platform);
LABEL_15:
    id v29 = v28;
    uint64_t v30 = sub_22A4B3458();
    uint64_t v32 = v31;

    if (v25 != v30 || v27 != v32)
    {
      char v4 = sub_22A4B3D28();
      goto LABEL_19;
    }
    goto LABEL_17;
  }
LABEL_2:
  char v4 = 1;
  return v4 & 1;
}

uint64_t FBKGroupedDevice.deviceIconPromiseForScale(scale:)(float a1)
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  *(float *)(v3 + 24) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268377878);
  swift_allocObject();
  id v4 = v1;
  return sub_22A4B2978();
}

void sub_22A4A362C(uint64_t a1, uint64_t a2, void *a3, float a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_22A4A525C;
  *(void *)(v9 + 24) = v8;
  v12[4] = sub_22A4A529C;
  v12[5] = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_22A4A374C;
  v12[3] = &block_descriptor_13;
  uint64_t v10 = _Block_copy(v12);
  swift_retain();
  swift_release();
  *(float *)&double v11 = a4;
  objc_msgSend(a3, sel_fetchIconImageDataForScale_completionCompletion_, v10, v11);
  _Block_release(v10);
}

uint64_t sub_22A4A374C(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = *(void (**)(void *, unint64_t))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v4 = v2;
    id v2 = (void *)sub_22A4B24F8();
    unint64_t v6 = v5;
  }
  else
  {
    swift_retain();
    unint64_t v6 = 0xF000000000000000;
  }
  v3(v2, v6);
  sub_22A4384F8((uint64_t)v2, v6);

  return swift_release();
}

void sub_22A4A37E4(uint64_t *a1)
{
  id v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_22A4B3CF8();
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_205;
    }
    if (v3) {
      sub_22A4A4A08(0, v3, 1, v2);
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1)
    {
LABEL_213:
      sub_22A4B3BE8();
      __break(1u);
      return;
    }
    uint64_t v188 = v4;
    uint64_t v191 = v3;
    if (v3 < 2)
    {
      uint64_t v8 = (char *)MEMORY[0x263F8EE78];
      uint64_t v202 = MEMORY[0x263F8EE78];
      v195 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
      if (v3 != 1)
      {
        unint64_t v128 = *(void *)(MEMORY[0x263F8EE78] + 16);
        if (v128 < 2) {
          goto LABEL_180;
        }
        goto LABEL_167;
      }
    }
    else
    {
      uint64_t v6 = v5 >> 1;
      sub_22A40F5A0(0, &qword_268376840);
      uint64_t v7 = sub_22A4B3668();
      *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
      uint64_t v3 = v191;
      v195 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
      uint64_t v202 = v7;
    }
    uint64_t v9 = 0;
    uint64_t v10 = *v2;
    v186 = v2;
    uint64_t v187 = *v2 - 8;
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
    double v11 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
    uint64_t v196 = *v2;
LABEL_13:
    uint64_t v12 = v9;
    uint64_t v13 = v9 + 1;
    uint64_t v193 = v9;
    if (v9 + 1 >= v3)
    {
      ++v9;
      goto LABEL_26;
    }
    v189 = v8;
    char v14 = *(void **)(v10 + 8 * v13);
    v200 = *(void **)(v10 + 8 * v9);
    id v15 = v200;
    id v201 = v14;
    uint64_t v16 = v9;
    id v17 = v14;
    id v18 = v15;
    char v19 = sub_22A4A314C(&v201, &v200);
    if (!v1)
    {
      char v20 = v19;

      uint64_t v21 = v16 + 2;
      uint64_t v3 = v191;
      char v198 = v20;
      if (v21 >= v191)
      {
LABEL_16:
        char v22 = v20;
        uint64_t v9 = v21;
LABEL_17:
        if ((v22 & 1) == 0)
        {
LABEL_64:
          uint64_t v8 = v189;
          uint64_t v10 = v196;
LABEL_65:
          uint64_t v12 = v193;
          if (v9 >= v3) {
            goto LABEL_112;
          }
          goto LABEL_66;
        }
LABEL_18:
        uint64_t v12 = v193;
        uint64_t v8 = v189;
        uint64_t v10 = v196;
        if (v9 < v193)
        {
LABEL_208:
          __break(1u);
LABEL_209:
          __break(1u);
LABEL_210:
          __break(1u);
LABEL_211:
          __break(1u);
LABEL_212:
          __break(1u);
          goto LABEL_213;
        }
        if (v193 < v9)
        {
          uint64_t v23 = (uint64_t *)(v187 + 8 * v9);
          uint64_t v24 = v9;
          uint64_t v25 = v193;
          uint64_t v26 = (uint64_t *)(v196 + 8 * v193);
          while (1)
          {
            if (v25 != --v24)
            {
              if (!v196) {
                goto LABEL_211;
              }
              uint64_t v27 = *v26;
              *uint64_t v26 = *v23;
              *uint64_t v23 = v27;
            }
            ++v25;
            --v23;
            ++v26;
            if (v25 >= v24) {
              goto LABEL_65;
            }
          }
        }
LABEL_26:
        if (v9 >= v3) {
          goto LABEL_112;
        }
LABEL_66:
        if (__OFSUB__(v9, v12)) {
          goto LABEL_204;
        }
        if (v9 - v12 >= v188)
        {
          uint64_t v12 = v193;
          goto LABEL_112;
        }
        uint64_t v12 = v193;
        if (__OFADD__(v193, v188)) {
          goto LABEL_206;
        }
        if (v193 + v188 >= v3) {
          uint64_t v73 = v3;
        }
        else {
          uint64_t v73 = v193 + v188;
        }
        if (v73 >= v193)
        {
          if (v9 != v73)
          {
            v190 = v8;
            uint64_t v74 = v187 + 8 * v9;
            uint64_t v192 = v73;
            while (1)
            {
              v75 = *(void **)(v10 + 8 * v9);
              uint64_t v76 = v12;
              uint64_t v194 = v74;
              uint64_t v197 = v9;
              while (1)
              {
                v77 = *(void **)v74;
                id v78 = v75;
                id v79 = v77;
                if ([v78 v11[232]])
                {

                  if (!v10) {
                    goto LABEL_209;
                  }
                  goto LABEL_91;
                }
                if ([v79 v11[232]])
                {

                  goto LABEL_76;
                }
                id v80 = objc_msgSend(v78, sel_platform);
                uint64_t v81 = sub_22A4B3458();
                uint64_t v83 = v82;

                v199 = v79;
                id v84 = objc_msgSend(v79, sel_platform);
                uint64_t v85 = sub_22A4B3458();
                uint64_t v87 = v86;

                if (v81 == v85 && v83 == v87)
                {
                  swift_bridgeObjectRelease_n();
LABEL_86:
                  id v89 = objc_msgSend(v78, sel_name);
                  uint64_t v90 = sub_22A4B3458();
                  uint64_t v92 = v91;

                  id v93 = objc_msgSend(v199, sel_name);
                  uint64_t v94 = sub_22A4B3458();
                  uint64_t v96 = v95;

                  if (v90 == v94 && v92 == v96)
                  {

                    swift_bridgeObjectRelease_n();
                    goto LABEL_107;
                  }
                  char v97 = sub_22A4B3D28();

                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  goto LABEL_89;
                }
                char v88 = sub_22A4B3D28();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v88) {
                  goto LABEL_86;
                }
                id v99 = objc_msgSend(v78, sel_platform);
                uint64_t v100 = sub_22A4B3458();
                uint64_t v102 = v101;

                ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
                id v104 = objc_msgSend(ObjCClassFromMetadata, sel_currentDevicePlatform);
                uint64_t v105 = sub_22A4B3458();
                uint64_t v107 = v106;

                if (v100 == v105 && v102 == v107)
                {

                  swift_bridgeObjectRelease_n();
                  goto LABEL_98;
                }
                char v108 = sub_22A4B3D28();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v108)
                {

LABEL_98:
                  uint64_t v10 = v196;
                  double v11 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
                  uint64_t v9 = v197;
                  if (!v196) {
                    goto LABEL_209;
                  }
                  goto LABEL_91;
                }
                id v109 = objc_msgSend(v199, sel_platform);
                uint64_t v110 = sub_22A4B3458();
                uint64_t v112 = v111;

                id v113 = objc_msgSend(ObjCClassFromMetadata, sel_currentDevicePlatform);
                uint64_t v114 = sub_22A4B3458();
                uint64_t v116 = v115;

                if (v110 == v114 && v112 == v116)
                {
LABEL_108:

                  swift_bridgeObjectRelease_n();
                  goto LABEL_110;
                }
                char v117 = sub_22A4B3D28();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v117) {
                  break;
                }
                id v118 = objc_msgSend(v78, sel_platform);
                uint64_t v119 = sub_22A4B3458();
                uint64_t v121 = v120;

                id v122 = objc_msgSend(v199, sel_platform);
                uint64_t v123 = sub_22A4B3458();
                uint64_t v125 = v124;

                if (v119 == v123 && v121 == v125) {
                  goto LABEL_108;
                }
                char v97 = sub_22A4B3D28();

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v10 = v196;
LABEL_89:
                double v11 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
                uint64_t v9 = v197;
                if ((v97 & 1) == 0) {
                  goto LABEL_76;
                }
                if (!v10) {
                  goto LABEL_209;
                }
LABEL_91:
                v98 = *(void **)v74;
                v75 = *(void **)(v74 + 8);
                *(void *)uint64_t v74 = v75;
                *(void *)(v74 + 8) = v98;
                v74 -= 8;
                if (v9 == ++v76) {
                  goto LABEL_76;
                }
              }

LABEL_110:
              uint64_t v10 = v196;
LABEL_107:
              double v11 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
              uint64_t v9 = v197;
LABEL_76:
              ++v9;
              uint64_t v12 = v193;
              uint64_t v74 = v194 + 8;
              if (v9 == v192)
              {
                uint64_t v9 = v192;
                uint64_t v8 = v190;
                if (v192 < v193) {
                  goto LABEL_200;
                }
LABEL_113:
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  uint64_t v8 = sub_22A46791C(0, *((void *)v8 + 2) + 1, 1, v8);
                }
                unint64_t v127 = *((void *)v8 + 2);
                unint64_t v126 = *((void *)v8 + 3);
                unint64_t v128 = v127 + 1;
                uint64_t v129 = v193;
                if (v127 >= v126 >> 1)
                {
                  v178 = sub_22A46791C((char *)(v126 > 1), v127 + 1, 1, v8);
                  uint64_t v129 = v193;
                  uint64_t v8 = v178;
                }
                *((void *)v8 + 2) = v128;
                v130 = v8 + 32;
                v131 = &v8[16 * v127 + 32];
                *(void *)v131 = v129;
                *((void *)v131 + 1) = v9;
                if (v127)
                {
                  while (2)
                  {
                    unint64_t v132 = v128 - 1;
                    if (v128 >= 4)
                    {
                      v137 = &v130[16 * v128];
                      uint64_t v138 = *((void *)v137 - 8);
                      uint64_t v139 = *((void *)v137 - 7);
                      BOOL v143 = __OFSUB__(v139, v138);
                      uint64_t v140 = v139 - v138;
                      if (v143) {
                        goto LABEL_188;
                      }
                      uint64_t v142 = *((void *)v137 - 6);
                      uint64_t v141 = *((void *)v137 - 5);
                      BOOL v143 = __OFSUB__(v141, v142);
                      uint64_t v135 = v141 - v142;
                      char v136 = v143;
                      if (v143) {
                        goto LABEL_189;
                      }
                      unint64_t v144 = v128 - 2;
                      v145 = &v130[16 * v128 - 32];
                      uint64_t v147 = *(void *)v145;
                      uint64_t v146 = *((void *)v145 + 1);
                      BOOL v143 = __OFSUB__(v146, v147);
                      uint64_t v148 = v146 - v147;
                      if (v143) {
                        goto LABEL_191;
                      }
                      BOOL v143 = __OFADD__(v135, v148);
                      uint64_t v149 = v135 + v148;
                      if (v143) {
                        goto LABEL_194;
                      }
                      if (v149 >= v140)
                      {
                        v167 = &v130[16 * v132];
                        uint64_t v169 = *(void *)v167;
                        uint64_t v168 = *((void *)v167 + 1);
                        BOOL v143 = __OFSUB__(v168, v169);
                        uint64_t v170 = v168 - v169;
                        if (v143) {
                          goto LABEL_198;
                        }
                        BOOL v160 = v135 < v170;
                      }
                      else
                      {
LABEL_131:
                        if (v136) {
                          goto LABEL_190;
                        }
                        unint64_t v144 = v128 - 2;
                        v150 = &v130[16 * v128 - 32];
                        uint64_t v152 = *(void *)v150;
                        uint64_t v151 = *((void *)v150 + 1);
                        BOOL v153 = __OFSUB__(v151, v152);
                        uint64_t v154 = v151 - v152;
                        char v155 = v153;
                        if (v153) {
                          goto LABEL_193;
                        }
                        v156 = &v130[16 * v132];
                        uint64_t v158 = *(void *)v156;
                        uint64_t v157 = *((void *)v156 + 1);
                        BOOL v143 = __OFSUB__(v157, v158);
                        uint64_t v159 = v157 - v158;
                        if (v143) {
                          goto LABEL_196;
                        }
                        if (__OFADD__(v154, v159)) {
                          goto LABEL_197;
                        }
                        if (v154 + v159 < v135) {
                          goto LABEL_143;
                        }
                        BOOL v160 = v135 < v159;
                      }
                      if (v160) {
                        unint64_t v132 = v144;
                      }
                    }
                    else
                    {
                      if (v128 == 3)
                      {
                        uint64_t v134 = *((void *)v8 + 4);
                        uint64_t v133 = *((void *)v8 + 5);
                        BOOL v143 = __OFSUB__(v133, v134);
                        uint64_t v135 = v133 - v134;
                        char v136 = v143;
                        goto LABEL_131;
                      }
                      uint64_t v161 = *((void *)v8 + 4);
                      uint64_t v162 = *((void *)v8 + 5);
                      BOOL v143 = __OFSUB__(v162, v161);
                      uint64_t v154 = v162 - v161;
                      char v155 = v143;
LABEL_143:
                      if (v155) {
                        goto LABEL_192;
                      }
                      v163 = &v130[16 * v132];
                      uint64_t v165 = *(void *)v163;
                      uint64_t v164 = *((void *)v163 + 1);
                      BOOL v143 = __OFSUB__(v164, v165);
                      uint64_t v166 = v164 - v165;
                      if (v143) {
                        goto LABEL_195;
                      }
                      if (v166 < v154) {
                        goto LABEL_160;
                      }
                    }
                    unint64_t v171 = v132 - 1;
                    if (v132 - 1 >= v128)
                    {
                      __break(1u);
LABEL_185:
                      __break(1u);
LABEL_186:
                      __break(1u);
LABEL_187:
                      __break(1u);
LABEL_188:
                      __break(1u);
LABEL_189:
                      __break(1u);
LABEL_190:
                      __break(1u);
LABEL_191:
                      __break(1u);
LABEL_192:
                      __break(1u);
LABEL_193:
                      __break(1u);
LABEL_194:
                      __break(1u);
LABEL_195:
                      __break(1u);
LABEL_196:
                      __break(1u);
LABEL_197:
                      __break(1u);
LABEL_198:
                      __break(1u);
LABEL_199:
                      __break(1u);
LABEL_200:
                      __break(1u);
LABEL_201:
                      __break(1u);
LABEL_202:
                      __break(1u);
LABEL_203:
                      __break(1u);
LABEL_204:
                      __break(1u);
LABEL_205:
                      __break(1u);
LABEL_206:
                      __break(1u);
                      goto LABEL_207;
                    }
                    if (!v196) {
                      goto LABEL_210;
                    }
                    uint64_t v172 = v9;
                    v173 = &v130[16 * v171];
                    uint64_t v174 = *(void *)v173;
                    v175 = &v130[16 * v132];
                    uint64_t v176 = *((void *)v175 + 1);
                    sub_22A4A4ED8((void **)(v196 + 8 * *(void *)v173), (id *)(v196 + 8 * *(void *)v175), v196 + 8 * v176, v195);
                    if (v1) {
                      goto LABEL_180;
                    }
                    if (v176 < v174) {
                      goto LABEL_185;
                    }
                    if (v132 > *((void *)v8 + 2)) {
                      goto LABEL_186;
                    }
                    *(void *)v173 = v174;
                    *(void *)&v130[16 * v171 + 8] = v176;
                    unint64_t v177 = *((void *)v8 + 2);
                    if (v132 >= v177) {
                      goto LABEL_187;
                    }
                    unint64_t v128 = v177 - 1;
                    memmove(&v130[16 * v132], v175 + 16, 16 * (v177 - 1 - v132));
                    *((void *)v8 + 2) = v177 - 1;
                    BOOL v160 = v177 > 2;
                    uint64_t v10 = v196;
                    double v11 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
                    uint64_t v9 = v172;
                    if (!v160) {
                      goto LABEL_160;
                    }
                    continue;
                  }
                }
                unint64_t v128 = 1;
LABEL_160:
                uint64_t v3 = v191;
                if (v9 >= v191)
                {
                  id v2 = v186;
                  if (v128 < 2)
                  {
LABEL_180:
                    swift_bridgeObjectRelease();
                    goto LABEL_181;
                  }
LABEL_167:
                  uint64_t v179 = *v2;
                  while (1)
                  {
                    unint64_t v180 = v128 - 2;
                    if (v128 < 2) {
                      goto LABEL_199;
                    }
                    if (!v179) {
                      goto LABEL_212;
                    }
                    v181 = v8;
                    uint64_t v182 = *(void *)&v8[16 * v180 + 32];
                    uint64_t v183 = *(void *)&v8[16 * v128 + 24];
                    sub_22A4A4ED8((void **)(v179 + 8 * v182), (id *)(v179 + 8 * *(void *)&v8[16 * v128 + 16]), v179 + 8 * v183, v195);
                    if (v1) {
                      goto LABEL_180;
                    }
                    if (v183 < v182) {
                      goto LABEL_201;
                    }
                    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                      v181 = sub_22A467BA8((uint64_t)v8);
                    }
                    if (v180 >= *((void *)v181 + 2)) {
                      goto LABEL_202;
                    }
                    v184 = &v181[16 * v180 + 32];
                    *(void *)v184 = v182;
                    *((void *)v184 + 1) = v183;
                    unint64_t v185 = *((void *)v181 + 2);
                    if (v128 > v185) {
                      goto LABEL_203;
                    }
                    memmove(&v181[16 * v128 + 16], &v181[16 * v128 + 32], 16 * (v185 - v128));
                    uint64_t v8 = v181;
                    *((void *)v181 + 2) = v185 - 1;
                    unint64_t v128 = v185 - 1;
                    if (v185 <= 2) {
                      goto LABEL_180;
                    }
                  }
                }
                goto LABEL_13;
              }
            }
          }
LABEL_112:
          if (v9 < v12) {
            goto LABEL_200;
          }
          goto LABEL_113;
        }
LABEL_207:
        __break(1u);
        goto LABEL_208;
      }
      while (1)
      {
        uint64_t v30 = *(void **)(v196 + 8 * v13);
        id v31 = *(id *)(v196 + 8 * v21);
        id v32 = v30;
        if ([v31 v11[232]])
        {

          if ((v20 & 1) == 0) {
            goto LABEL_63;
          }
          goto LABEL_33;
        }
        if ([v32 v11[232]])
        {

          if (v20) {
            goto LABEL_164;
          }
LABEL_36:
          char v22 = 0;
          goto LABEL_30;
        }
        id v33 = objc_msgSend(v31, sel_platform);
        uint64_t v34 = sub_22A4B3458();
        uint64_t v36 = v35;

        id v37 = objc_msgSend(v32, sel_platform);
        uint64_t v38 = sub_22A4B3458();
        uint64_t v40 = v39;

        if (v34 == v38 && v36 == v40) {
          break;
        }
        char v42 = sub_22A4B3D28();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v42)
        {
LABEL_46:
          id v52 = objc_msgSend(v31, sel_name);
          uint64_t v53 = sub_22A4B3458();
          uint64_t v55 = v54;

          id v56 = objc_msgSend(v32, sel_name);
LABEL_47:
          id v57 = v56;
          uint64_t v58 = sub_22A4B3458();
          uint64_t v60 = v59;

          if (v53 == v58 && v55 == v60) {
            char v28 = 0;
          }
          else {
            char v28 = sub_22A4B3D28();
          }
          uint64_t v3 = v191;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          char v20 = v198;
          char v29 = v198 ^ v28;
          char v22 = v198;
          double v11 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
          if (v29) {
            goto LABEL_16;
          }
LABEL_30:
          uint64_t v9 = v21 + 1;
          uint64_t v13 = v21;
          uint64_t v21 = v9;
          if (v9 >= v3) {
            goto LABEL_17;
          }
        }
        else
        {
          id v43 = objc_msgSend(v31, sel_platform);
          uint64_t v44 = sub_22A4B3458();
          uint64_t v46 = v45;

          unint64_t v47 = (void *)swift_getObjCClassFromMetadata();
          id v48 = objc_msgSend(v47, sel_currentDevicePlatform);
          uint64_t v49 = sub_22A4B3458();
          uint64_t v51 = v50;

          if (v44 == v49 && v46 == v51)
          {

            swift_bridgeObjectRelease_n();
LABEL_52:
            uint64_t v3 = v191;
            double v11 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
            char v20 = v198;
            if ((v198 & 1) == 0)
            {
LABEL_63:
              uint64_t v9 = v21;
              goto LABEL_64;
            }
LABEL_33:
            char v22 = 1;
            goto LABEL_30;
          }
          char v61 = sub_22A4B3D28();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v61)
          {

            goto LABEL_52;
          }
          id v62 = objc_msgSend(v32, sel_platform);
          uint64_t v63 = sub_22A4B3458();
          uint64_t v65 = v64;

          id v66 = objc_msgSend(v47, sel_currentDevicePlatform);
          uint64_t v67 = sub_22A4B3458();
          uint64_t v69 = v68;

          if (v63 == v67 && v65 == v69)
          {

            swift_bridgeObjectRelease_n();
            uint64_t v3 = v191;
            double v11 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
            char v20 = v198;
            if (v198)
            {
LABEL_164:
              uint64_t v9 = v21;
              goto LABEL_18;
            }
            goto LABEL_36;
          }
          char v70 = sub_22A4B3D28();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v70 & 1) == 0)
          {
            id v71 = objc_msgSend(v31, sel_platform);
            uint64_t v53 = sub_22A4B3458();
            uint64_t v55 = v72;

            id v56 = objc_msgSend(v32, sel_platform);
            goto LABEL_47;
          }

          char v20 = v198;
          if (v198)
          {
            uint64_t v9 = v21;
            uint64_t v3 = v191;
            double v11 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
            goto LABEL_18;
          }
          uint64_t v9 = v21 + 1;
          uint64_t v13 = v21;
          uint64_t v21 = v9;
          uint64_t v3 = v191;
          double v11 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
          if (v9 >= v191) {
            goto LABEL_64;
          }
        }
      }
      swift_bridgeObjectRelease_n();
      goto LABEL_46;
    }
    swift_bridgeObjectRelease();

LABEL_181:
    *(void *)((v202 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
    sub_22A4B3648();
    swift_bridgeObjectRelease();
  }
}

void *sub_22A4A46E0(unint64_t a1)
{
  return sub_22A4A4884(a1, (void (*)(void *, uint64_t, unint64_t))sub_22A4A1A90);
}

uint64_t sub_22A4A46F8(uint64_t a1)
{
  return sub_22A4A4748(a1, (unint64_t *)&unk_268376180, (uint64_t)off_264873460, &qword_268376198);
}

void *sub_22A4A4714(unint64_t a1)
{
  return sub_22A4A4884(a1, (void (*)(void *, uint64_t, unint64_t))sub_22A4A1CB0);
}

uint64_t sub_22A4A472C(uint64_t a1)
{
  return sub_22A4A4748(a1, (unint64_t *)&qword_2683761B0, 0x263F3A128, (unint64_t *)&qword_2683762F0);
}

uint64_t sub_22A4A4748(uint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = sub_22A4B3A08();
    if (v8) {
      goto LABEL_3;
    }
    return MEMORY[0x263F8EE78];
  }
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    return MEMORY[0x263F8EE78];
  }
LABEL_3:
  if (v8 <= 0)
  {
    uint64_t v9 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268376820);
    uint64_t v9 = (void *)swift_allocObject();
    int64_t v10 = _swift_stdlib_malloc_size(v9);
    uint64_t v11 = v10 - 32;
    if (v10 < 32) {
      uint64_t v11 = v10 - 25;
    }
    v9[2] = v8;
    v9[3] = (2 * (v11 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_22A4A52E0(&v14, v9 + 4, v8, a1, a2, a3, a4);
  uint64_t result = sub_22A40F124();
  if (v12 == (void *)v8) {
    return (uint64_t)v9;
  }
  __break(1u);
  return result;
}

void *sub_22A4A486C(unint64_t a1)
{
  return sub_22A4A4884(a1, (void (*)(void *, uint64_t, unint64_t))sub_22A4A20F0);
}

void *sub_22A4A4884(unint64_t a1, void (*a2)(void *, uint64_t, unint64_t))
{
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v4 <= 0)
    {
      uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268376820);
      uint64_t v5 = (void *)swift_allocObject();
      int64_t v6 = _swift_stdlib_malloc_size(v5);
      uint64_t v7 = v6 - 32;
      if (v6 < 32) {
        uint64_t v7 = v6 - 25;
      }
      v5[2] = v4;
      v5[3] = (2 * (v7 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    a2(v5 + 4, v4, a1);
    a2 = v8;
    swift_bridgeObjectRelease();
    if (a2 == (void (*)(void *, uint64_t, unint64_t))v4) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
    if (!v4) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v5;
}

uint64_t sub_22A4A498C()
{
  return MEMORY[0x270FA0238](v0, 28, 7);
}

void sub_22A4A49C4(uint64_t a1, uint64_t a2)
{
  sub_22A4A362C(a1, a2, *(void **)(v2 + 16), *(float *)(v2 + 24));
}

uint64_t sub_22A4A49D0(uint64_t a1)
{
  return sub_22A4A4748(a1, &qword_268376840, (uint64_t)off_2648735E8, (unint64_t *)&qword_268376D00);
}

uint64_t sub_22A4A49EC(uint64_t a1)
{
  return sub_22A4A4748(a1, &qword_268377390, (uint64_t)off_264873758, (unint64_t *)&qword_2683763A8);
}

void sub_22A4A4A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
    uint64_t v7 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
    uint64_t v63 = *a4;
LABEL_6:
    uint64_t v8 = *(void **)(v5 + 8 * v4);
    uint64_t v9 = a1;
    uint64_t v61 = v6;
    uint64_t v62 = v4;
    while (1)
    {
      int64_t v10 = *(void **)v6;
      id v11 = v8;
      id v12 = v10;
      if ([v11 v7[232]])
      {

        if (!v5) {
          goto LABEL_41;
        }
      }
      else
      {
        if ([v12 v7[232]])
        {

          goto LABEL_5;
        }
        id v13 = objc_msgSend(v11, sel_platform);
        uint64_t v14 = sub_22A4B3458();
        uint64_t v16 = v15;

        id v64 = v12;
        id v17 = objc_msgSend(v12, sel_platform);
        uint64_t v18 = sub_22A4B3458();
        uint64_t v20 = v19;

        if (v14 == v18 && v16 == v20)
        {
          swift_bridgeObjectRelease_n();
LABEL_15:
          id v22 = objc_msgSend(v11, sel_name);
          uint64_t v23 = sub_22A4B3458();
          uint64_t v25 = v24;

          id v26 = objc_msgSend(v64, sel_name);
          uint64_t v27 = sub_22A4B3458();
          uint64_t v29 = v28;

          if (v23 == v27 && v25 == v29)
          {

            swift_bridgeObjectRelease_n();
            goto LABEL_36;
          }
          char v30 = sub_22A4B3D28();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_18:
          uint64_t v5 = v63;
          uint64_t v7 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
          if ((v30 & 1) == 0) {
            goto LABEL_5;
          }
          if (!v63) {
            goto LABEL_41;
          }
          goto LABEL_20;
        }
        char v21 = sub_22A4B3D28();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v21) {
          goto LABEL_15;
        }
        id v32 = objc_msgSend(v11, sel_platform);
        uint64_t v33 = sub_22A4B3458();
        uint64_t v35 = v34;

        ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
        id v37 = objc_msgSend(ObjCClassFromMetadata, sel_currentDevicePlatform);
        uint64_t v38 = sub_22A4B3458();
        uint64_t v40 = v39;

        if (v33 == v38 && v35 == v40)
        {

          swift_bridgeObjectRelease_n();
        }
        else
        {
          char v41 = sub_22A4B3D28();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v41 & 1) == 0)
          {
            id v42 = objc_msgSend(v64, sel_platform);
            uint64_t v43 = sub_22A4B3458();
            uint64_t v45 = v44;

            id v46 = objc_msgSend(ObjCClassFromMetadata, sel_currentDevicePlatform);
            uint64_t v47 = sub_22A4B3458();
            uint64_t v49 = v48;

            if (v43 == v47 && v45 == v49)
            {
LABEL_39:

              swift_bridgeObjectRelease_n();
LABEL_40:
              uint64_t v4 = v62;
LABEL_36:
              uint64_t v5 = v63;
              uint64_t v7 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
LABEL_5:
              ++v4;
              uint64_t v6 = v61 + 8;
              if (v4 == a2) {
                return;
              }
              goto LABEL_6;
            }
            char v50 = sub_22A4B3D28();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v50)
            {

              goto LABEL_40;
            }
            id v51 = objc_msgSend(v11, sel_platform);
            uint64_t v52 = sub_22A4B3458();
            uint64_t v54 = v53;

            id v55 = objc_msgSend(v64, sel_platform);
            uint64_t v56 = sub_22A4B3458();
            uint64_t v58 = v57;

            if (v52 == v56 && v54 == v58) {
              goto LABEL_39;
            }
            char v30 = sub_22A4B3D28();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v4 = v62;
            goto LABEL_18;
          }
        }
        uint64_t v4 = v62;
        uint64_t v5 = v63;
        uint64_t v7 = &selRef_generateSectionIdentifierGroupsWithDeviceSectionPrefix_deferredDeviceSectionPrefix_;
        if (!v63)
        {
LABEL_41:
          __break(1u);
          return;
        }
      }
LABEL_20:
      id v31 = *(void **)v6;
      uint64_t v8 = *(void **)(v6 + 8);
      *(void *)uint64_t v6 = v8;
      *(void *)(v6 + 8) = v31;
      v6 -= 8;
      if (v4 == ++v9) {
        goto LABEL_5;
      }
    }
  }
}

uint64_t sub_22A4A4ED8(void **__src, id *a2, unint64_t a3, void **__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v9 = (char *)a2 - (char *)__src;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v44 = __src;
  uint64_t v43 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      uint64_t v24 = &v4[v13];
      id v42 = v24;
      uint64_t v44 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        uint64_t v25 = (id *)(a3 - 8);
        id v26 = v6;
        id v37 = v4;
        uint64_t v38 = v7;
        while (1)
        {
          unint64_t v27 = (unint64_t)v24;
          uint64_t v28 = v24 - 1;
          id v41 = *(v24 - 1);
          uint64_t v29 = *--v26;
          uint64_t v40 = v29;
          id v30 = v41;
          id v31 = v29;
          char v32 = sub_22A4A314C(&v41, &v40);
          if (v39) {
            break;
          }
          char v33 = v32;
          uint64_t v39 = 0;
          uint64_t v34 = v25 + 1;

          if (v33)
          {
            if (v34 != v6 || v25 >= v6) {
              *uint64_t v25 = *v26;
            }
            uint64_t v44 = v26;
            uint64_t v35 = v37;
            uint64_t v24 = (void **)v27;
            if (v26 <= v38) {
              goto LABEL_48;
            }
          }
          else
          {
            id v42 = v28;
            if ((unint64_t)v34 < v27 || (unint64_t)v25 >= v27 || v34 != (id *)v27) {
              *uint64_t v25 = *v28;
            }
            id v26 = v6;
            uint64_t v24 = v28;
            uint64_t v35 = v37;
            if (v6 <= v38) {
              goto LABEL_48;
            }
          }
          --v25;
          uint64_t v6 = v26;
          if (v24 <= v35) {
            goto LABEL_48;
          }
        }
      }
      goto LABEL_48;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    uint64_t v14 = &v4[v10];
    id v42 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      while (1)
      {
        uint64_t v15 = v7;
        id v41 = *v6;
        uint64_t v16 = v4;
        uint64_t v40 = *v4;
        id v17 = v40;
        id v18 = v41;
        id v19 = v17;
        char v20 = sub_22A4A314C(&v41, &v40);
        if (v39) {
          break;
        }
        char v21 = v20;

        if (v21)
        {
          id v22 = v6 + 1;
          uint64_t v23 = v15;
          if (v15 < v6 || v15 >= v22 || v15 != v6) {
            *uint64_t v15 = *v6;
          }
          uint64_t v4 = v16;
        }
        else
        {
          uint64_t v23 = v15;
          if (v15 != v16) {
            *uint64_t v15 = *v16;
          }
          uint64_t v4 = v16 + 1;
          uint64_t v43 = v16 + 1;
          id v22 = v6;
        }
        uint64_t v39 = 0;
        uint64_t v7 = v23 + 1;
        uint64_t v44 = v7;
        if (v4 < v14)
        {
          uint64_t v6 = v22;
          if ((unint64_t)v22 < a3) {
            continue;
          }
        }
        goto LABEL_48;
      }
    }
LABEL_48:
    sub_22A467A18(&v44, &v43, &v42);
    return 1;
  }
  uint64_t result = sub_22A4B3C68();
  __break(1u);
  return result;
}

uint64_t sub_22A4A5224()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A4A525C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = *(uint64_t (**)(void *))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  char v7 = a3 & 1;
  return v4(v6);
}

uint64_t sub_22A4A529C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(a1, a2, 0);
}

uint64_t block_copy_helper_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_13()
{
  return swift_release();
}

void *sub_22A4A52E0(void *result, void *a2, uint64_t a3, uint64_t a4, unint64_t *a5, uint64_t a6, unint64_t *a7)
{
  uint64_t v7 = a4;
  int64_t v9 = a2;
  uint64_t v29 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_22A4B39B8();
    sub_22A40F5A0(0, a5);
    sub_22A40FF6C(a7, a5);
    uint64_t result = (void *)sub_22A4B36F8();
    uint64_t v7 = v33;
    uint64_t v12 = v34;
    uint64_t v13 = v35;
    int64_t v14 = v36;
    unint64_t v15 = v37;
    if (v9) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v16 = 0;
    goto LABEL_38;
  }
  int64_t v14 = 0;
  uint64_t v24 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v12 = a4 + 56;
  uint64_t v13 = ~v24;
  uint64_t v25 = -v24;
  if (v25 < 64) {
    uint64_t v26 = ~(-1 << v25);
  }
  else {
    uint64_t v26 = -1;
  }
  unint64_t v15 = v26 & *(void *)(a4 + 56);
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v16 = 0;
LABEL_38:
    unint64_t v27 = v29;
LABEL_41:
    *unint64_t v27 = v7;
    v27[1] = v12;
    v27[2] = v13;
    v27[3] = v14;
    v27[4] = v15;
    return (void *)v16;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v16 = 0;
  int64_t v30 = (unint64_t)(v13 + 64) >> 6;
  uint64_t v28 = v13;
  while (1)
  {
    if (v7 < 0)
    {
      if (!sub_22A4B3A38()) {
        goto LABEL_40;
      }
      sub_22A40F5A0(0, a5);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v19 = v32;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v32) {
        goto LABEL_40;
      }
      goto LABEL_8;
    }
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v14 << 6);
      goto LABEL_7;
    }
    int64_t v20 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v20 >= v30)
    {
      unint64_t v15 = 0;
      goto LABEL_40;
    }
    unint64_t v21 = *(void *)(v12 + 8 * v20);
    if (v21) {
      goto LABEL_23;
    }
    int64_t v22 = v14 + 2;
    if (v14 + 2 >= v30)
    {
      unint64_t v15 = 0;
      ++v14;
      goto LABEL_40;
    }
    unint64_t v21 = *(void *)(v12 + 8 * v22);
    if (!v21)
    {
      if (v14 + 3 >= v30) {
        goto LABEL_44;
      }
      unint64_t v21 = *(void *)(v12 + 8 * (v14 + 3));
      if (v21)
      {
        int64_t v20 = v14 + 3;
        goto LABEL_23;
      }
      int64_t v22 = v14 + 4;
      if (v14 + 4 >= v30)
      {
        unint64_t v15 = 0;
        v14 += 3;
        goto LABEL_40;
      }
      unint64_t v21 = *(void *)(v12 + 8 * v22);
      if (!v21)
      {
        int64_t v20 = v14 + 5;
        if (v14 + 5 >= v30)
        {
LABEL_44:
          unint64_t v15 = 0;
          int64_t v14 = v22;
          goto LABEL_40;
        }
        unint64_t v21 = *(void *)(v12 + 8 * v20);
        if (!v21)
        {
          int64_t v23 = v14 + 6;
          while (v30 != v23)
          {
            unint64_t v21 = *(void *)(v12 + 8 * v23++);
            if (v21)
            {
              int64_t v20 = v23 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v15 = 0;
          int64_t v14 = v30 - 1;
          goto LABEL_40;
        }
        goto LABEL_23;
      }
    }
    int64_t v20 = v22;
LABEL_23:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v20 << 6);
    int64_t v14 = v20;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v7 + 48) + 8 * v18);
    id v19 = result;
    if (!result) {
      goto LABEL_40;
    }
LABEL_8:
    ++v16;
    *v9++ = v19;
    if (v16 == a3)
    {
      uint64_t v16 = a3;
LABEL_40:
      uint64_t v13 = v28;
      unint64_t v27 = v29;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_22A4A55E0()
{
  uint64_t v0 = sub_22A4B27C8();
  __swift_allocate_value_buffer(v0, qword_268377880);
  __swift_project_value_buffer(v0, (uint64_t)qword_268377880);
  sub_22A4B3458();
  return sub_22A4B27B8();
}

uint64_t sub_22A4A5654()
{
  sub_22A4B3AF8();
  sub_22A4B3538();
  sub_22A4B3B98();
  sub_22A4B3538();
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment);
  id v2 = objc_msgSend(v1, sel_description);
  sub_22A4B3458();

  sub_22A4B3538();
  swift_bridgeObjectRelease();
  sub_22A4B3538();
  return 0;
}

void sub_22A4A5764()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22A4B2998();
  swift_release();
  swift_release();
  id v2 = FBKAttachmentStateToString(v20[0]);
  uint64_t v3 = sub_22A4B3458();
  unint64_t v5 = v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22A4B2998();
  swift_release();
  swift_release();
  if (v20[0] > 8uLL) {
    goto LABEL_17;
  }
  if (((1 << SLOBYTE(v20[0])) & 7) != 0)
  {
    if (qword_268375D68 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_22A4B27C8();
    __swift_project_value_buffer(v6, (uint64_t)qword_268377880);
    swift_retain_n();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A4B27A8();
    os_log_type_t v8 = sub_22A4B37A8();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      v20[0] = v10;
      *(_DWORD *)uint64_t v9 = 136446466;
      id v11 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment), sel_uniqueIdentifier);
      uint64_t v12 = sub_22A4B3458();
      unint64_t v14 = v13;

      sub_22A416CC8(v12, v14, v20);
      sub_22A4B38F8();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2082;
      swift_bridgeObjectRetain();
      sub_22A416CC8(v3, v5, v20);
      sub_22A4B38F8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22A36D000, v7, v8, "Attachment [%{public}s] changed state to [%{public}s]", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A6CA7B0](v10, -1, -1);
      uint64_t v15 = v9;
LABEL_12:
      MEMORY[0x22A6CA7B0](v15, -1, -1);

      return;
    }

    swift_bridgeObjectRelease_n();
    swift_release_n();
    return;
  }
  if (((1 << SLOBYTE(v20[0])) & 0x28) == 0)
  {
    sub_22A4B3AF8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v20[0] = v3;
    v20[1] = v5;
    sub_22A4B3538();
LABEL_17:
    sub_22A4B3BF8();
    __break(1u);
    return;
  }
  if (qword_268375D68 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_22A4B27C8();
  __swift_project_value_buffer(v16, (uint64_t)qword_268377880);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_22A4B27A8();
  os_log_type_t v17 = sub_22A4B3788();
  if (os_log_type_enabled(v7, v17))
  {
    unint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    v20[0] = v19;
    *(_DWORD *)unint64_t v18 = 136315138;
    swift_bridgeObjectRetain();
    sub_22A416CC8(v3, v5, v20);
    sub_22A4B38F8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22A36D000, v7, v17, "[%s] attachment found in view.", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6CA7B0](v19, -1, -1);
    uint64_t v15 = (uint64_t)v18;
    goto LABEL_12;
  }

  swift_bridgeObjectRelease_n();
}

uint64_t sub_22A4A5C98()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22A4B2998();
  swift_release();
  swift_release();
  return v1;
}

id sub_22A4A5D0C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683766E0);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22A4B24C8();
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  os_log_type_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  id v11 = (char *)&v42 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v43 = (char *)&v42 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268376890);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22A4B2668();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment;
  id v21 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment), sel_annotation);
  if (!v21)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
    goto LABEL_9;
  }
  int64_t v22 = v21;
  sub_22A447C44((uint64_t)v15);

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
LABEL_9:
    sub_22A40A09C((uint64_t)v15, &qword_268376890);
    goto LABEL_10;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  sub_22A408028();
  if (!v23)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    goto LABEL_10;
  }
  id v42 = v8;
  uint64_t v46 = 1601400681;
  unint64_t v47 = 0xE400000000000000;
  sub_22A4B3538();
  swift_bridgeObjectRelease();
  if (qword_268375C28 != -1) {
    swift_once();
  }
  id v24 = (id)qword_268376028;
  uint64_t v25 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();
  id v26 = objc_msgSend(self, sel_imageNamed_inBundle_, v25, v24);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  os_log_type_t v8 = v42;
  if (!v26)
  {
LABEL_10:
    id v27 = sub_22A4A62EC();
    if (v27) {
      return v27;
    }
    uint64_t v28 = v8;
    id v29 = objc_msgSend(*(id *)(v1 + v20), sel_fileURL);
    if (v29)
    {
      int64_t v30 = v29;
      sub_22A4B2488();

      uint64_t v32 = v44;
      uint64_t v31 = v45;
      uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
      v33(v4, v11, v45);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v4, 0, 1, v31);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v4, 1, v31) != 1)
      {
        uint64_t v34 = v43;
        v33(v43, v4, v31);
        sub_22A4A76B0();
        id v26 = v35;
        (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v31);
        int64_t v36 = v28;
        if (v26) {
          return v26;
        }
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v32 = v44;
      uint64_t v31 = v45;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v4, 1, 1, v45);
    }
    sub_22A40A09C((uint64_t)v4, &qword_2683766E0);
    int64_t v36 = v28;
LABEL_18:
    id v37 = objc_msgSend(*(id *)(v1 + v20), sel_promisedFileName);
    if (v37)
    {
      uint64_t v38 = v37;
      sub_22A4B3458();
    }
    else
    {
      if (!*(void *)(v1 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_sanitizedDisplayName + 8))
      {
        id v39 = objc_msgSend(*(id *)(v1 + v20), sel_displayName);
        sub_22A4B3458();

        int64_t v36 = v28;
      }
      swift_bridgeObjectRetain();
    }
    sub_22A4B2428();
    swift_bridgeObjectRelease();
    sub_22A4A76B0();
    if (!v40) {
      id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
    }
    id v26 = v40;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v36, v31);
  }
  return v26;
}

id sub_22A4A62EC()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683766E0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = &v26[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_22A4B24C8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v26[-v8];
  MEMORY[0x270FA5388](v7);
  id v11 = &v26[-v10];
  id v12 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment), sel_fileURL);
  if (!v12)
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_6;
  }
  uint64_t v13 = v12;
  sub_22A4B2488();

  uint64_t v14 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32);
  v14(v3, v9, v4);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_6:
    sub_22A40A09C((uint64_t)v3, &qword_2683766E0);
    return 0;
  }
  v14(v11, v3, v4);
  sub_22A4B2418();
  uint64_t v15 = sub_22A4B34C8();
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  char v18 = sub_22A47D6F8(v15, v17, qword_26DDF32C0);
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v11, v4);
    return 0;
  }
  uint64_t v20 = sub_22A4B24D8();
  unint64_t v22 = v21;
  id v23 = objc_allocWithZone(MEMORY[0x263F827E8]);
  id v24 = (void *)sub_22A4B24E8();
  id v25 = objc_msgSend(v23, sel_initWithData_, v24);
  sub_22A40EFD0(v20, v22);

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v11, v4);
  return v25;
}

uint64_t sub_22A4A6858()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22A4B2998();
  swift_release();
  swift_release();
  if (v1 == 1) {
    return sub_22A4A6938();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22A4B2998();
  swift_release();
  swift_release();
  if (v1) {
    return 0;
  }
  else {
    return sub_22A4A6A80();
  }
}

uint64_t sub_22A4A6938()
{
  unsigned int v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment), sel_fileComesFromFBK);
  sub_22A4B3458();
  if (v1)
  {
    if (qword_268375C20 != -1) {
      swift_once();
    }
  }
  else if (qword_268375C20 != -1)
  {
    swift_once();
  }
  id v2 = (id)qword_268376020;
  uint64_t v3 = sub_22A4B23C8();
  swift_bridgeObjectRelease();

  return v3;
}

uint64_t sub_22A4A6A80()
{
  uint64_t v1 = OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment;
  if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment), sel_attachmentType) != (id)1|| !objc_msgSend(*(id *)(v0 + v1), sel_isRequired))
  {
    return 0;
  }
  id v2 = objc_msgSend(self, sel_FeedbackCore);
  uint64_t v3 = sub_22A4B23C8();

  return v3;
}

uint64_t sub_22A4A6B78()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22A4B2998();
  swift_release();
  swift_release();
  if (v12
    || (uint64_t v1 = OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment,
        objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment), sel_attachmentType) != (id)1))
  {
    if (*(void *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_sanitizedDisplayName + 8))
    {
      uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_sanitizedDisplayName);
    }
    else
    {
      id v8 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment), sel_displayName);
      uint64_t v7 = sub_22A4B3458();
    }
    swift_bridgeObjectRetain();
  }
  else
  {
    id v2 = objc_msgSend(self, sel_FeedbackCore);
    sub_22A4B23C8();

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683761A0);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_22A4BF070;
    uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_sanitizedDisplayName + 8);
    if (v4)
    {
      uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_sanitizedDisplayName);
      uint64_t v6 = v4;
    }
    else
    {
      id v10 = objc_msgSend(*(id *)(v0 + v1), sel_displayName, 0x800000022A4CCE80);
      uint64_t v5 = sub_22A4B3458();
      uint64_t v6 = v11;
    }
    *(void *)(v3 + 56) = MEMORY[0x263F8D310];
    *(void *)(v3 + 64) = sub_22A40E844();
    *(void *)(v3 + 32) = v5;
    *(void *)(v3 + 40) = v6;
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A4B3488();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_22A4A6DC8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22A4B2998();
  swift_release();
  swift_release();
  uint64_t v1 = OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment;
  id v2 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment), sel_attachmentType);
  int v3 = objc_msgSend(*(id *)(v0 + v1), sel_fileComesFromFBK);
  sub_22A4A6B78();
  uint64_t v4 = (void *)sub_22A4B3418();
  swift_bridgeObjectRelease();
  sub_22A4A6858();
  if (v5)
  {
    uint64_t v6 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = FBKAccessoryAccessibilityLabel(v10, (uint64_t)v2, v3, v4, v6);

  if (!v7) {
    return 0;
  }
  uint64_t v8 = sub_22A4B3458();

  return v8;
}

uint64_t sub_22A4A6F08()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment;
  int v3 = (char *)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment), sel_annotation);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v6 = *(void *)&v3[OBJC_IVAR____TtC12FeedbackCore23FBKAttachmentAnnotation_displayName];
    uint64_t v5 = *(void *)&v3[OBJC_IVAR____TtC12FeedbackCore23FBKAttachmentAnnotation_displayName + 8];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = _s12FeedbackCore18DisplayStringUtilsV08sanitizecD0ySSSgAEFZ_0(v6, v5);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  uint64_t v10 = (uint64_t *)(v1 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_sanitizedDisplayName);
  uint64_t *v10 = v7;
  v10[1] = v9;
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(*(id *)(v1 + v2), sel_annotation);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_22A447E88();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  uint64_t v16 = _s12FeedbackCore18DisplayStringUtilsV08sanitizecD0ySSSgAEFZ_0(v13, v15);
  uint64_t v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = (uint64_t *)(v1 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_displaySubtitle);
  *uint64_t v19 = v16;
  v19[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = (char *)objc_msgSend(*(id *)(v1 + v2), sel_annotation);
  if (v20)
  {
    unint64_t v21 = v20;
    uint64_t v23 = *(void *)&v20[OBJC_IVAR____TtC12FeedbackCore23FBKAttachmentAnnotation_localizedDescription];
    uint64_t v22 = *(void *)&v20[OBJC_IVAR____TtC12FeedbackCore23FBKAttachmentAnnotation_localizedDescription + 8];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v22 = 0;
  }
  uint64_t v24 = _s12FeedbackCore18DisplayStringUtilsV08sanitizecD0ySSSgAEFZ_0(v23, v22);
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  id v27 = (uint64_t *)(v1 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_displayDescription);
  *id v27 = v24;
  v27[1] = v26;

  return swift_bridgeObjectRelease();
}

uint64_t sub_22A4A70B8(void **a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    objc_msgSend(v1, sel_state);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_22A4B29A8();
    sub_22A4A5764();
    swift_release();
  }
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_22A4A6F08();
    return swift_release();
  }
  return result;
}

uint64_t sub_22A4A71A8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268376408);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_22A4A72A8()
{
  return type metadata accessor for FBKViewAttachmentModel();
}

uint64_t type metadata accessor for FBKViewAttachmentModel()
{
  uint64_t result = qword_2683778A0;
  if (!qword_2683778A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_22A4A72FC()
{
  sub_22A4A73B0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_22A4A73B0()
{
  if (!qword_2683778B0)
  {
    type metadata accessor for FBKAttachmentState(255);
    unint64_t v0 = sub_22A4B29B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2683778B0);
    }
  }
}

uint64_t sub_22A4A7408@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FBKViewAttachmentModel();
  uint64_t result = sub_22A4B2928();
  *a1 = result;
  return result;
}

uint64_t sub_22A4A7448()
{
  return sub_22A4A5654();
}

uint64_t sub_22A4A746C(uint64_t *a1, uint64_t *a2)
{
  return sub_22A4A757C(*a1, *a2);
}

uint64_t sub_22A4A7478()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_22A4A7484@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22A4B2998();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

void sub_22A4A7504()
{
}

uint64_t sub_22A4A757C(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment), sel_uniqueIdentifier);
  uint64_t v4 = sub_22A4B3458();
  uint64_t v6 = v5;

  id v7 = objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC12FeedbackCore22FBKViewAttachmentModel_actualAttachment), sel_uniqueIdentifier);
  uint64_t v8 = sub_22A4B3458();
  uint64_t v10 = v9;

  if (v4 == v8 && v6 == v10) {
    char v12 = 1;
  }
  else {
    char v12 = sub_22A4B3D28();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

__CFString *FBKAttachmentStateToString(unint64_t a1)
{
  if (a1 <= 8)
  {
    uint64_t v1 = off_264877B68[a1];
    uint64_t v2 = off_264877B20[a1];
  }

  return v1;
}

void sub_22A4A76B0()
{
  unint64_t v0 = (void *)sub_22A4B2458();
  id v1 = objc_msgSend(self, sel_interactionControllerWithURL_, v0);

  id v2 = objc_msgSend(v1, sel_icons);
  sub_22A4A77CC();
  unint64_t v3 = sub_22A4B3628();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_22A4B3C18();
    swift_bridgeObjectRelease();
    if (!v5) {
      goto LABEL_6;
    }
  }
  else if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_6:
    swift_bridgeObjectRelease();

    return;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
    MEMORY[0x22A6C9770](0, v3);
    goto LABEL_6;
  }
  if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v4 = *(id *)(v3 + 32);
    goto LABEL_6;
  }
  __break(1u);
}

unint64_t sub_22A4A77CC()
{
  unint64_t result = qword_268376800;
  if (!qword_268376800)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268376800);
  }
  return result;
}

uint64_t sub_22A4A780C()
{
  id v1 = objc_msgSend(v0, sel_modalConfigurations);
  if (v1)
  {
    sub_22A484CB0();
    unint64_t v2 = sub_22A4B3628();

    if (v2 >> 62) {
      goto LABEL_17;
    }
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v3; uint64_t v3 = sub_22A4B3C18())
    {
      for (uint64_t i = 4; ; ++i)
      {
        id v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22A6C9770](i - 4, v2) : *(id *)(v2 + 8 * i);
        uint64_t v6 = v5;
        uint64_t v7 = i - 3;
        if (__OFADD__(i - 4, 1)) {
          break;
        }
        id v8 = objc_msgSend(v5, sel_iconName);
        if (v8)
        {
          uint64_t v9 = v8;
          swift_bridgeObjectRelease_n();

          id v10 = objc_msgSend(v6, sel_iconName);
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = sub_22A4B3458();

            return v12;
          }

          return 0;
        }

        if (v7 == v3)
        {
          swift_bridgeObjectRelease_n();
          return 0;
        }
      }
      __break(1u);
LABEL_17:
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease_n();
  }
  return 0;
}

void *sub_22A4A79EC()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_question);
  swift_beginAccess();
  unint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_22A4A7A98(void *a1)
{
  sub_22A4A84EC(a1);
}

void (*sub_22A4A7AD0(void *a1))(uint64_t *a1, char a2)
{
  id v3 = malloc(0xB8uLL);
  *a1 = v3;
  v3[18] = v1;
  uint64_t v4 = sub_22A4B28F8();
  v3[19] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[20] = v5;
  uint64_t v6 = malloc(*(void *)(v5 + 64));
  uint64_t v7 = OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_question;
  v3[21] = v6;
  v3[22] = v7;
  swift_beginAccess();
  return sub_22A4A7BA0;
}

void sub_22A4A7BA0(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void **)(*(void *)(v3 + 144) + *(void *)(v3 + 176));
    if (v4)
    {
      id v5 = v4;
      MEMORY[0x22A6C9410]();
      if (!*(void *)(v3 + 64))
      {
        __break(1u);
        return;
      }
      sub_22A48C060((long long *)(v3 + 40), v3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268377478);
      swift_dynamicCast();
      id v6 = objc_msgSend(v5, sel_text);
      if (v6)
      {
        uint64_t v7 = v6;
        sub_22A4B3458();
      }
      sub_22A4B28D8();
      sub_22A4A780C();
      if (v8)
      {
        uint64_t v9 = (void *)sub_22A4B3418();
        swift_bridgeObjectRelease();
        id v10 = objc_msgSend(self, sel_systemImageNamed_, v9);

        sub_22A4B28E8();
      }
      uint64_t v12 = *(void *)(v3 + 160);
      uint64_t v11 = *(void *)(v3 + 168);
      uint64_t v13 = *(void *)(v3 + 152);
      uint64_t v14 = MEMORY[0x263F81F20];
      *(void *)(v3 + 104) = v13;
      *(void *)(v3 + 112) = v14;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v3 + 80));
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v12 + 16))(boxed_opaque_existential_1, v11, v13);
      MEMORY[0x22A6C9420](v3 + 80);

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    }
  }
  free(*(void **)(v3 + 168));

  free((void *)v3);
}

uint64_t sub_22A4A7DEC()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_itemIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_22A4A7EB0(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_itemIdentifier);
  swift_beginAccess();
  *id v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22A4A7F10(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_itemIdentifier);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_22A4A7F7C())()
{
  return j__swift_endAccess;
}

uint64_t static FBKModalQuestionCell.reuseIdentifier.getter()
{
  swift_beginAccess();
  uint64_t v0 = qword_2683778C0;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static FBKModalQuestionCell.reuseIdentifier.setter(uint64_t a1, void *a2)
{
  qword_2683778C0 = a1;
  off_2683778C8 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static FBKModalQuestionCell.reuseIdentifier.modify())()
{
  return j_j__swift_endAccess;
}

id sub_22A4A8224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22A4B28F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v21[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v3[OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_question] = 0;
  id v10 = &v3[OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_itemIdentifier];
  *(void *)id v10 = 0;
  *((void *)v10 + 1) = 0xE000000000000000;
  if (a3)
  {
    uint64_t v11 = (void *)sub_22A4B3418();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = (objc_class *)type metadata accessor for FBKModalQuestionCell();
  v22.receiver = v3;
  v22.super_class = v12;
  id v13 = objc_msgSendSuper2(&v22, sel_initWithStyle_reuseIdentifier_, a1, v11);

  id v14 = v13;
  sub_22A4B28C8();
  id v15 = objc_msgSend(self, sel_tintColor);
  uint64_t v16 = (void (*)(uint64_t *, void))sub_22A4B2858();
  sub_22A4B2848();
  v16(v21, 0);
  v21[3] = v6;
  v21[4] = MEMORY[0x263F81F20];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 16))(boxed_opaque_existential_1, v9, v6);
  id v18 = v14;
  MEMORY[0x22A6C9420](v21);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v18;
}

id FBKModalQuestionCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBKModalQuestionCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_22A4A84EC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22A4B28F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (id *)(v2 + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_question);
  swift_beginAccess();
  id v9 = *v8;
  *uint64_t v8 = a1;
  id v10 = a1;

  if (*v8)
  {
    id v11 = *v8;
    MEMORY[0x22A6C9410](&v19);
    if (v20)
    {
      sub_22A48C060(&v19, (uint64_t)v21);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268377478);
      swift_dynamicCast();
      id v12 = objc_msgSend(v11, sel_text);
      if (v12)
      {
        id v13 = v12;
        sub_22A4B3458();
      }
      sub_22A4B28D8();
      sub_22A4A780C();
      if (v14)
      {
        id v15 = (void *)sub_22A4B3418();
        swift_bridgeObjectRelease();
        id v16 = objc_msgSend(self, sel_systemImageNamed_, v15);

        sub_22A4B28E8();
      }
      v21[3] = v4;
      v21[4] = MEMORY[0x263F81F20];
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
      (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 16))(boxed_opaque_existential_1, v7, v4);
      MEMORY[0x22A6C9420](v21);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t type metadata accessor for FBKModalQuestionCell()
{
  return self;
}

id sub_22A4A8750@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_question);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;

  return v4;
}

void sub_22A4A87B4(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_22A4A84EC(v1);
}

uint64_t sub_22A4A8804@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_itemIdentifier);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for FBKModalQuestionCell(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FBKModalQuestionCell);
}

uint64_t dispatch thunk of FBKModalQuestionCell.question.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of FBKModalQuestionCell.question.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of FBKModalQuestionCell.question.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of FBKModalQuestionCell.itemIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of FBKModalQuestionCell.itemIdentifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FBKModalQuestionCell.itemIdentifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getPLDatabaseReaderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __34__FBKAnnouncement_fullHTMLContent__block_invoke_cold_1(v0);
}

void __saveRequest_block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Failed to save request [%@] to file [%@]", (uint8_t *)&v4, 0x16u);
}

void __saveRequest_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Failed to create file [%@]", (uint8_t *)&v2, 0xCu);
}

void FBKErrorOfType_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Error creation with type [%li] not implemented", (uint8_t *)&v2, 0xCu);
}

void _answerQuestions_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "has remaining Q&As", v1, 2u);
}

void _answerQuestions_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "given answers is empty", buf, 2u);
}

void _answerQuestions_cold_3(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_2_0(a1, a2), "answerType");
  *(_DWORD *)uint64_t v4 = 134217984;
  *uint64_t v3 = v5;
  _os_log_error_impl(&dword_22A36D000, v2, OS_LOG_TYPE_ERROR, "question type is unknown. Cannot prefill [%lu]", v4, 0xCu);
}

void deviceWithIdentifier_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Device Identifier is null in [%{public}@]. Cannot match to active device", (uint8_t *)&v1, 0xCu);
}

void FBKLoginWithAppleConnect_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "ACMobileAuthenticationContext class not found.", v1, 2u);
}

void FBKLoginWithAppleConnect_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "ACAuthenticationRequestClass or ACAuthenticationResponseClass class not found.", v1, 2u);
}

void __FBKLoginWithAppleConnect_block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 error];
  uint64_t v4 = [v3 localizedDescription];
  int v5 = 138543362;
  __int16 v6 = v4;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "ErrorSignIn: [%{public}@]", (uint8_t *)&v5, 0xCu);
}

uint64_t __getACMobileAuthenticationContextClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getACAuthenticationRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getACAuthenticationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getACAuthenticationResponseClass_block_invoke_cold_1(v0);
}

uint64_t __getACAuthenticationResponseClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[FBKUser bugFormStubsForPickerWithPredicate:team:](v0);
}

uint64_t sub_22A4B2208()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_22A4B2218()
{
  return MEMORY[0x270EEDC48]();
}

uint64_t sub_22A4B2228()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_22A4B2238()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_22A4B2248()
{
  return MEMORY[0x270EEDD88]();
}

uint64_t sub_22A4B2258()
{
  return MEMORY[0x270EEDDA0]();
}

uint64_t sub_22A4B2268()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_22A4B2278()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_22A4B2288()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_22A4B2298()
{
  return MEMORY[0x270EEDEA0]();
}

uint64_t sub_22A4B22A8()
{
  return MEMORY[0x270EEDEB8]();
}

uint64_t sub_22A4B22B8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_22A4B22C8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_22A4B22D8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_22A4B22E8()
{
  return MEMORY[0x270EEE130]();
}

uint64_t sub_22A4B22F8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_22A4B2308()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_22A4B2318()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_22A4B2328()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_22A4B2338()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_22A4B2348()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_22A4B2358()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_22A4B2368()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_22A4B2378()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_22A4B2388()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_22A4B2398()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_22A4B23A8()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_22A4B23B8()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t sub_22A4B23C8()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_22A4B23D8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22A4B23E8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22A4B23F8()
{
  return MEMORY[0x270EEFA78]();
}

uint64_t sub_22A4B2408()
{
  return MEMORY[0x270EEFBD8]();
}

uint64_t sub_22A4B2418()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_22A4B2428()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_22A4B2438()
{
  return MEMORY[0x270EEFCD0]();
}

uint64_t sub_22A4B2448()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_22A4B2458()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22A4B2468()
{
  return MEMORY[0x270EEFD38]();
}

uint64_t sub_22A4B2478()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_22A4B2488()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22A4B2498()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_22A4B24A8()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_22A4B24B8()
{
  return MEMORY[0x270EEFEA8]();
}

uint64_t sub_22A4B24C8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22A4B24D8()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_22A4B24E8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22A4B24F8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22A4B2508()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_22A4B2518()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_22A4B2528()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_22A4B2538()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22A4B2548()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22A4B2558()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22A4B2568()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_22A4B2578()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_22A4B2588()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_22A4B2598()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_22A4B25A8()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_22A4B25B8()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_22A4B25C8()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_22A4B25D8()
{
  return MEMORY[0x270F81718]();
}

uint64_t sub_22A4B25E8()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_22A4B25F8()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_22A4B2608()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_22A4B2618()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_22A4B2628()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_22A4B2638()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_22A4B2648()
{
  return MEMORY[0x270F28818]();
}

uint64_t sub_22A4B2658()
{
  return MEMORY[0x270F289A0]();
}

uint64_t sub_22A4B2668()
{
  return MEMORY[0x270F289A8]();
}

uint64_t sub_22A4B2678()
{
  return MEMORY[0x270F28A58]();
}

uint64_t sub_22A4B2688()
{
  return MEMORY[0x270F28A60]();
}

uint64_t sub_22A4B2698()
{
  return MEMORY[0x270F28A68]();
}

uint64_t sub_22A4B26A8()
{
  return MEMORY[0x270F28A70]();
}

uint64_t sub_22A4B26B8()
{
  return MEMORY[0x270F28A78]();
}

uint64_t sub_22A4B26C8()
{
  return MEMORY[0x270F28A80]();
}

uint64_t sub_22A4B26D8()
{
  return MEMORY[0x270F28A88]();
}

uint64_t sub_22A4B26E8()
{
  return MEMORY[0x270F28A90]();
}

uint64_t sub_22A4B26F8()
{
  return MEMORY[0x270F28AE0]();
}

uint64_t sub_22A4B2708()
{
  return MEMORY[0x270F28AE8]();
}

uint64_t sub_22A4B2718()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_22A4B2728()
{
  return MEMORY[0x270FA2A78]();
}

uint64_t sub_22A4B2738()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_22A4B2748()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_22A4B2758()
{
  return MEMORY[0x270FA1820]();
}

uint64_t sub_22A4B2768()
{
  return MEMORY[0x270FA1870]();
}

uint64_t sub_22A4B2778()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_22A4B2788()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_22A4B2798()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_22A4B27A8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22A4B27B8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22A4B27C8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22A4B27D8()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_22A4B27E8()
{
  return MEMORY[0x270F81C68]();
}

uint64_t sub_22A4B27F8()
{
  return MEMORY[0x270F81C80]();
}

uint64_t sub_22A4B2808()
{
  return MEMORY[0x270F81D48]();
}

uint64_t sub_22A4B2818()
{
  return MEMORY[0x270F81D68]();
}

uint64_t sub_22A4B2828()
{
  return MEMORY[0x270F81D90]();
}

uint64_t sub_22A4B2838()
{
  return MEMORY[0x270F81DB8]();
}

uint64_t sub_22A4B2848()
{
  return MEMORY[0x270F81DC8]();
}

uint64_t sub_22A4B2858()
{
  return MEMORY[0x270F81DF0]();
}

uint64_t sub_22A4B2868()
{
  return MEMORY[0x270F81E08]();
}

uint64_t sub_22A4B2878()
{
  return MEMORY[0x270F81E10]();
}

uint64_t sub_22A4B2888()
{
  return MEMORY[0x270F81E28]();
}

uint64_t sub_22A4B2898()
{
  return MEMORY[0x270F81E30]();
}

uint64_t sub_22A4B28A8()
{
  return MEMORY[0x270F81E50]();
}

uint64_t sub_22A4B28B8()
{
  return MEMORY[0x270F81E70]();
}

uint64_t sub_22A4B28C8()
{
  return MEMORY[0x270F81EA0]();
}

uint64_t sub_22A4B28D8()
{
  return MEMORY[0x270F81EB0]();
}

uint64_t sub_22A4B28E8()
{
  return MEMORY[0x270F81EC0]();
}

uint64_t sub_22A4B28F8()
{
  return MEMORY[0x270F81EE0]();
}

uint64_t sub_22A4B2908()
{
  return MEMORY[0x270EE3A78]();
}

uint64_t sub_22A4B2918()
{
  return MEMORY[0x270EE3A88]();
}

uint64_t sub_22A4B2928()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_22A4B2938()
{
  return MEMORY[0x270EE3C50]();
}

uint64_t sub_22A4B2948()
{
  return MEMORY[0x270EE3C70]();
}

uint64_t sub_22A4B2958()
{
  return MEMORY[0x270EE3C88]();
}

uint64_t sub_22A4B2968()
{
  return MEMORY[0x270EE3CB8]();
}

uint64_t sub_22A4B2978()
{
  return MEMORY[0x270EE3D78]();
}

uint64_t sub_22A4B2988()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_22A4B2998()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_22A4B29A8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_22A4B29B8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_22A4B29C8()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_22A4B29D8()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_22A4B29E8()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_22A4B29F8()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_22A4B2A08()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_22A4B2A18()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_22A4B2A28()
{
  return MEMORY[0x270EFEE28]();
}

uint64_t sub_22A4B2A38()
{
  return MEMORY[0x270EFEE40]();
}

uint64_t sub_22A4B2A58()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_22A4B2A68()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_22A4B2A78()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_22A4B2A88()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_22A4B2A98()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_22A4B2AA8()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_22A4B2AB8()
{
  return MEMORY[0x270EFF7D0]();
}

uint64_t sub_22A4B2AC8()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_22A4B2AD8()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_22A4B2AE8()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_22A4B2AF8()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_22A4B2B08()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_22A4B2B18()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_22A4B2B28()
{
  return MEMORY[0x270EFFD10]();
}

uint64_t sub_22A4B2B38()
{
  return MEMORY[0x270EFFD18]();
}

uint64_t sub_22A4B2B48()
{
  return MEMORY[0x270F002E8]();
}

uint64_t sub_22A4B2B58()
{
  return MEMORY[0x270F002F0]();
}

uint64_t sub_22A4B2B68()
{
  return MEMORY[0x270F00528]();
}

uint64_t sub_22A4B2B78()
{
  return MEMORY[0x270F00530]();
}

uint64_t sub_22A4B2B88()
{
  return MEMORY[0x270F00538]();
}

uint64_t sub_22A4B2B98()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_22A4B2BA8()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_22A4B2BB8()
{
  return MEMORY[0x270F006F8]();
}

uint64_t sub_22A4B2BC8()
{
  return MEMORY[0x270F00700]();
}

uint64_t sub_22A4B2BD8()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_22A4B2BE8()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_22A4B2BF8()
{
  return MEMORY[0x270F009D0]();
}

uint64_t sub_22A4B2C08()
{
  return MEMORY[0x270F009D8]();
}

uint64_t sub_22A4B2C18()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t sub_22A4B2C28()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_22A4B2C38()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_22A4B2C48()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_22A4B2C58()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_22A4B2C68()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_22A4B2C78()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_22A4B2C88()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_22A4B2C98()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_22A4B2CA8()
{
  return MEMORY[0x270F01060]();
}

uint64_t sub_22A4B2CB8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_22A4B2CC8()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_22A4B2CD8()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_22A4B2CE8()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_22A4B2CF8()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_22A4B2D08()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_22A4B2D18()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_22A4B2D28()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_22A4B2D38()
{
  return MEMORY[0x270F01468]();
}

uint64_t sub_22A4B2D48()
{
  return MEMORY[0x270F01470]();
}

uint64_t sub_22A4B2D58()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_22A4B2D68()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_22A4B2D78()
{
  return MEMORY[0x270F01678]();
}

uint64_t sub_22A4B2D88()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_22A4B2D98()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_22A4B2DA8()
{
  return MEMORY[0x270F01B80]();
}

uint64_t sub_22A4B2DB8()
{
  return MEMORY[0x270F01B88]();
}

uint64_t sub_22A4B2DC8()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_22A4B2DD8()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_22A4B2DE8()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_22A4B2DF8()
{
  return MEMORY[0x270F01E18]();
}

uint64_t sub_22A4B2E08()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_22A4B2E18()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_22A4B2E28()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_22A4B2E38()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_22A4B2E48()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_22A4B2E58()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_22A4B2E68()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_22A4B2E78()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_22A4B2E88()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_22A4B2E98()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_22A4B2EA8()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_22A4B2EB8()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_22A4B2EC8()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_22A4B2ED8()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_22A4B2EE8()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_22A4B2EF8()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_22A4B2F08()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_22A4B2F18()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_22A4B2F28()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_22A4B2F38()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_22A4B2F48()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_22A4B2F58()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_22A4B2F68()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_22A4B2F78()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_22A4B2F88()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_22A4B2F98()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_22A4B2FA8()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_22A4B2FB8()
{
  return MEMORY[0x270F02FE8]();
}

uint64_t sub_22A4B2FC8()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_22A4B2FD8()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_22A4B2FE8()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_22A4B2FF8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_22A4B3008()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_22A4B3018()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_22A4B3028()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_22A4B3038()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_22A4B3048()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_22A4B3058()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_22A4B3068()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_22A4B3078()
{
  return MEMORY[0x270F03548]();
}

uint64_t sub_22A4B3088()
{
  return MEMORY[0x270F03648]();
}

uint64_t sub_22A4B3098()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_22A4B30A8()
{
  return MEMORY[0x270F03710]();
}

uint64_t sub_22A4B30B8()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_22A4B30C8()
{
  return MEMORY[0x270F03B50]();
}

uint64_t sub_22A4B30D8()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_22A4B30E8()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_22A4B30F8()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_22A4B3108()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_22A4B3118()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_22A4B3128()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_22A4B3138()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_22A4B3148()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_22A4B3158()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_22A4B3168()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_22A4B3178()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_22A4B3188()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_22A4B3198()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_22A4B31A8()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_22A4B31B8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_22A4B31C8()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_22A4B31D8()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_22A4B31E8()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_22A4B31F8()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_22A4B3208()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_22A4B3218()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_22A4B3228()
{
  return MEMORY[0x270F04AB0]();
}

uint64_t sub_22A4B3238()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_22A4B3248()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_22A4B3258()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_22A4B3268()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_22A4B3278()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_22A4B3288()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_22A4B3298()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_22A4B32A8()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_22A4B32B8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_22A4B32C8()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_22A4B32D8()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_22A4B32E8()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_22A4B32F8()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_22A4B3308()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22A4B3318()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22A4B3328()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22A4B3338()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_22A4B3348()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_22A4B3358()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_22A4B3368()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_22A4B3378()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_22A4B3388()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_22A4B3398()
{
  return MEMORY[0x270EFA380]();
}

uint64_t sub_22A4B33A8()
{
  return MEMORY[0x270EFA398]();
}

uint64_t sub_22A4B33B8()
{
  return MEMORY[0x270EFA3E0]();
}

uint64_t sub_22A4B33C8()
{
  return MEMORY[0x270EFA4B0]();
}

uint64_t sub_22A4B33D8()
{
  return MEMORY[0x270EFA4B8]();
}

uint64_t sub_22A4B33E8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22A4B33F8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22A4B3408()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_22A4B3418()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22A4B3428()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_22A4B3438()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_22A4B3448()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_22A4B3458()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22A4B3468()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_22A4B3478()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_22A4B3488()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_22A4B3498()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_22A4B34A8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_22A4B34B8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22A4B34C8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_22A4B34D8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_22A4B34E8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_22A4B34F8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22A4B3508()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_22A4B3518()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_22A4B3528()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_22A4B3538()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22A4B3548()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22A4B3558()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_22A4B3568()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_22A4B3578()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_22A4B3588()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_22A4B3598()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_22A4B35A8()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_22A4B35B8()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_22A4B35C8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22A4B35D8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22A4B35E8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_22A4B35F8()
{
  return MEMORY[0x270EE4040]();
}

uint64_t sub_22A4B3608()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22A4B3618()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22A4B3628()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22A4B3638()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22A4B3648()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22A4B3658()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22A4B3668()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22A4B3678()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22A4B3688()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_22A4B3698()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_22A4B36A8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_22A4B36B8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_22A4B36C8()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_22A4B36D8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_22A4B36E8()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_22A4B36F8()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_22A4B3708()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22A4B3718()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22A4B3728()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_22A4B3738()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_22A4B3748()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22A4B3758()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22A4B3768()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22A4B3778()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22A4B3788()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22A4B3798()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_22A4B37A8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22A4B37B8()
{
  return MEMORY[0x270F82498]();
}

uint64_t sub_22A4B37C8()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_22A4B37D8()
{
  return MEMORY[0x270F824B8]();
}

uint64_t sub_22A4B37E8()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_22A4B37F8()
{
  return MEMORY[0x270FA0C30]();
}

uint64_t sub_22A4B3808()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_22A4B3818()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22A4B3828()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22A4B3838()
{
  return MEMORY[0x270F82688]();
}

uint64_t sub_22A4B3848()
{
  return MEMORY[0x270EE4238]();
}

uint64_t sub_22A4B3858()
{
  return MEMORY[0x270EFA518]();
}

uint64_t sub_22A4B3868()
{
  return MEMORY[0x270EFA520]();
}

uint64_t sub_22A4B3878()
{
  return MEMORY[0x270F828A8]();
}

uint64_t sub_22A4B3888()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_22A4B3898()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22A4B38A8()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_22A4B38B8()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_22A4B38C8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_22A4B38D8()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t sub_22A4B38E8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22A4B38F8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22A4B3908()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22A4B3918()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_22A4B3928()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_22A4B3938()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_22A4B3948()
{
  return MEMORY[0x270EF2590]();
}

uint64_t sub_22A4B3958()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_22A4B3968()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22A4B3978()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22A4B3988()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_22A4B3998()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_22A4B39A8()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_22A4B39B8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_22A4B39C8()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_22A4B39D8()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_22A4B39E8()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_22A4B39F8()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_22A4B3A08()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_22A4B3A18()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_22A4B3A28()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_22A4B3A38()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_22A4B3A48()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_22A4B3A58()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_22A4B3A68()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_22A4B3A78()
{
  return MEMORY[0x270EF2608]();
}

uint64_t sub_22A4B3A88()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_22A4B3A98()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_22A4B3AA8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_22A4B3AB8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22A4B3AC8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22A4B3AD8()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_22A4B3AE8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22A4B3AF8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22A4B3B08()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22A4B3B18()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22A4B3B28()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_22A4B3B38()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22A4B3B48()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22A4B3B58()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22A4B3B68()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22A4B3B78()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22A4B3B88()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22A4B3B98()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22A4B3BA8()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_22A4B3BB8()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_22A4B3BC8()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_22A4B3BD8()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_22A4B3BE8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22A4B3BF8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22A4B3C08()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_22A4B3C18()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22A4B3C28()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22A4B3C38()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22A4B3C48()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_22A4B3C58()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22A4B3C68()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22A4B3C88()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_22A4B3C98()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_22A4B3CA8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_22A4B3CB8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_22A4B3CC8()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_22A4B3CD8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_22A4B3CE8()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_22A4B3CF8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_22A4B3D08()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22A4B3D18()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_22A4B3D28()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22A4B3D38()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_22A4B3D48()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_22A4B3D58()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_22A4B3D68()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_22A4B3D78()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22A4B3D88()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22A4B3D98()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22A4B3DA8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22A4B3DB8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22A4B3DC8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22A4B3DD8()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_22A4B3DE8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_22A4B3DF8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22A4B3E08()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22A4B3E18()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22A4B3E28()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_22A4B3E38()
{
  return MEMORY[0x270F9FD98]();
}

OSStatus AudioServicesAddSystemSoundCompletion(SystemSoundID inSystemSoundID, CFRunLoopRef inRunLoop, CFStringRef inRunLoopMode, AudioServicesSystemSoundCompletionProc inCompletionRoutine, void *inClientData)
{
  return MEMORY[0x270EE21F8](*(void *)&inSystemSoundID, inRunLoop, inRunLoopMode, inCompletionRoutine, inClientData);
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x270EE2200](inFileURL, outSystemSoundID);
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x270EE2210](*(void *)&inSystemSoundID);
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t FBKSErrorContainsSP2ErrorCode()
{
  return MEMORY[0x270F28AF8]();
}

uint64_t FBKSIsInternalInstall()
{
  return MEMORY[0x270F28B00]();
}

uint64_t FBKSIsValidErrorResponse()
{
  return MEMORY[0x270F28B08]();
}

uint64_t FBKSStringFromEnvironment()
{
  return MEMORY[0x270F28B10]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x270EFDB40]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x270EFDDE0](trust, policies);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

htmlDocPtr htmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (htmlDocPtr)MEMORY[0x270F9BAC0](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

uint64_t lroundf(float a1)
{
  return MEMORY[0x270EDA110](a1);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x270F9B5A8](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x270F9B658](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x270F9B708](filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x270FA05C8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}

xmlChar *__cdecl xmlCharStrdup(const char *cur)
{
  return (xmlChar *)MEMORY[0x270F9BB88](cur);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x270F9BFE0](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x270F9C3D8](str, ctxt);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x270F9C458](doc);
}