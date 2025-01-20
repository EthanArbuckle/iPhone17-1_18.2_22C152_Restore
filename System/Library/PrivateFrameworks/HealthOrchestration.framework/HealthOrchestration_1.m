uint64_t sub_2511A70C8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  uint64_t v18;
  void (*v19)(char *, unint64_t, uint64_t);
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = a1;
  v6 = sub_2511C9180();
  v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void *)(*v3 + 16);
  v11 = *(void *)(*v3 + 24);
  v28 = v3;
  v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_2511A6228();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2511A7B08(MEMORY[0x263F06EA8], (void (*)(void))sub_2511AB624);
      goto LABEL_12;
    }
    sub_2511A8EDC();
  }
  v12 = *v3;
  sub_2511AB5DC((unint64_t *)&unk_269B21C40, 255, MEMORY[0x263F06EA8]);
  v13 = sub_2511C9440();
  v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  v30 = v12;
  v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    v16 = ~v14;
    v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    v18 = v7 + 16;
    v17 = v19;
    v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_2511AB5DC(qword_269B22110, 255, MEMORY[0x263F06EA8]);
      v21 = sub_2511C9470();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v22 = v29;
  v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  v25 = *(void *)(v23 + 16);
  v26 = __OFADD__(v25, 1);
  v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_2511C9CC0();
  __break(1u);
  return result;
}

void *sub_2511A7398()
{
  v1 = v0;
  sub_2511AB6BC(0, &qword_26B217FE0, (uint64_t (*)(void))sub_25118B794, (uint64_t)&type metadata for Orchestrator.AnyConfiguration, MEMORY[0x263F8DBD8]);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2511C9920();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    uint64_t v16 = 40 * v15;
    result = (void *)sub_251169894(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    uint64_t v17 = *(void *)(v4 + 48) + v16;
    long long v18 = v23[0];
    long long v19 = v23[1];
    *(void *)(v17 + 32) = v24;
    *(_OWORD *)uint64_t v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
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

void *sub_2511A759C()
{
  v1 = v0;
  sub_2511AB4F8(0, &qword_269B22708);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2511C9920();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v15) = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
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

void *sub_2511A7748()
{
  v1 = v0;
  sub_2511AB4F8(0, &qword_26B217FE8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2511C9920();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    long long v19 = (void *)(*(void *)(v4 + 48) + v16);
    *long long v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_2511A7910()
{
  v1 = v0;
  sub_2511AB6BC(0, (unint64_t *)&qword_26B218900, (uint64_t (*)(void))sub_251132188, (uint64_t)&type metadata for InputSignalIdentifier, MEMORY[0x263F8DBD8]);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2511C9920();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23)
      {
        int64_t v9 = v22 + 2;
        if (v22 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v23 = *(void *)(v6 + 8 * v9);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 32 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v20 = v17[2];
    uint64_t v19 = v17[3];
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    v21[2] = v20;
    v21[3] = v19;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v13) {
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2511A7B08(uint64_t (*a1)(void), void (*a2)(void))
{
  uint64_t v4 = v2;
  uint64_t v5 = a1(0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v25 - v7;
  a2(0);
  uint64_t v9 = *v2;
  uint64_t v10 = sub_2511C9920();
  uint64_t v11 = v10;
  if (!*(void *)(v9 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *uint64_t v4 = v11;
    return result;
  }
  result = (void *)(v10 + 56);
  unint64_t v13 = (unint64_t)((1 << *(unsigned char *)(v11 + 32)) + 63) >> 6;
  v26 = v4;
  v27 = (const void *)(v9 + 56);
  if (v11 != v9 || (unint64_t)result >= v9 + 56 + 8 * v13) {
    result = memmove(result, v27, 8 * v13);
  }
  int64_t v15 = 0;
  *(void *)(v11 + 16) = *(void *)(v9 + 16);
  uint64_t v16 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & *(void *)(v9 + 56);
  int64_t v28 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      unint64_t v19 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v20 = v19 | (v15 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v22 >= v28) {
      goto LABEL_28;
    }
    unint64_t v23 = *((void *)v27 + v22);
    ++v15;
    if (!v23)
    {
      int64_t v15 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_28;
      }
      unint64_t v23 = *((void *)v27 + v15);
      if (!v23)
      {
        int64_t v15 = v22 + 2;
        if (v22 + 2 >= v28) {
          goto LABEL_28;
        }
        unint64_t v23 = *((void *)v27 + v15);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v18 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v15 << 6);
LABEL_12:
    unint64_t v21 = *(void *)(v6 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(void *)(v9 + 48) + v21, v5);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(void *)(v11 + 48) + v21, v8, v5);
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v28)
  {
LABEL_28:
    result = (void *)swift_release();
    uint64_t v4 = v26;
    goto LABEL_30;
  }
  unint64_t v23 = *((void *)v27 + v24);
  if (v23)
  {
    int64_t v15 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v15 >= v28) {
      goto LABEL_28;
    }
    unint64_t v23 = *((void *)v27 + v15);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_2511A7DBC()
{
  v1 = v0;
  sub_2511AB6BC(0, (unint64_t *)&unk_269B22710, (uint64_t (*)(void))sub_2511453CC, (uint64_t)&type metadata for WorkPlanIdentifier, MEMORY[0x263F8DBD8]);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2511C9920();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23)
      {
        int64_t v9 = v22 + 2;
        if (v22 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v23 = *(void *)(v6 + 8 * v9);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = v17[2];
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    v21[2] = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v13) {
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2511A7FB0()
{
  uint64_t v1 = *v0;
  sub_2511AB6BC(0, &qword_26B217FE0, (uint64_t (*)(void))sub_25118B794, (uint64_t)&type metadata for Orchestrator.AnyConfiguration, MEMORY[0x263F8DBD8]);
  uint64_t v2 = sub_2511C9930();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v0 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v26 = v1 + 56;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 56);
  int64_t v27 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = v2 + 56;
  uint64_t result = swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v14 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v27) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v26 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v27) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v26 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v27) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v26 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_24:
    sub_251169894(*(void *)(v1 + 48) + 40 * v15, (uint64_t)&v28);
    sub_2511C9D40();
    __swift_project_boxed_opaque_existential_1(&v28, *((uint64_t *)&v29 + 1));
    sub_2511C9450();
    uint64_t result = sub_2511C9D80();
    uint64_t v19 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v7 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1 << v20) & ~*(void *)(v7 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v7 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v10 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    uint64_t v11 = *(void *)(v3 + 48) + 40 * v10;
    long long v12 = v28;
    long long v13 = v29;
    *(void *)(v11 + 32) = v30;
    *(_OWORD *)uint64_t v11 = v12;
    *(_OWORD *)(v11 + 16) = v13;
    ++*(void *)(v3 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v27)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v26 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v27) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v26 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2511A82D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2511C9260();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_2511AB544();
  uint64_t v7 = sub_2511C9930();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_2511AB5DC(&qword_26B218390, 255, MEMORY[0x263F07908]);
    uint64_t result = sub_2511C9440();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2511A8680()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2511AB4F8(0, &qword_269B22708);
  uint64_t result = sub_2511C9930();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v26 = v1;
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    unsigned int v18 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v14);
    uint64_t result = MEMORY[0x253397570](*(void *)(v4 + 40), v18, 4);
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_DWORD *)(*(void *)(v4 + 48) + 4 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2511A88FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2511AB4F8(0, &qword_26B217FE8);
  uint64_t v3 = sub_2511C9930();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_2511C9D40();
    swift_bridgeObjectRetain();
    sub_2511C94F0();
    uint64_t result = sub_2511C9D80();
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
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v20;
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

uint64_t sub_2511A8BC0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2511AB6BC(0, (unint64_t *)&qword_26B218900, (uint64_t (*)(void))sub_251132188, (uint64_t)&type metadata for InputSignalIdentifier, MEMORY[0x263F8DBD8]);
  uint64_t v3 = sub_2511C9930();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v30 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v31 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v31) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v30 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v31) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v30 + 8 * v10);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    int64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v14);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v22 = v18[2];
    uint64_t v21 = v18[3];
    sub_2511C9D40();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    sub_2511C94F0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_2511C9D80();
    uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v8 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v11 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    unint64_t v12 = (void *)(*(void *)(v4 + 48) + 32 * v11);
    *unint64_t v12 = v19;
    v12[1] = v20;
    v12[2] = v22;
    v12[3] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v30 + 8 * v17);
  if (v16)
  {
    int64_t v10 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v10 >= v31) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2511A8EDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2511C9180();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_2511AB624();
  uint64_t v7 = sub_2511C9930();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_2511AB5DC((unint64_t *)&unk_269B21C40, 255, MEMORY[0x263F06EA8]);
    uint64_t result = sub_2511C9440();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2511A928C()
{
  uint64_t v1 = *v0;
  sub_2511AB6BC(0, (unint64_t *)&unk_269B22710, (uint64_t (*)(void))sub_2511453CC, (uint64_t)&type metadata for WorkPlanIdentifier, MEMORY[0x263F8DBD8]);
  uint64_t v2 = sub_2511C9930();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v0 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v28 = v1 + 56;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 56);
  int64_t v29 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = v2 + 56;
  uint64_t result = swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v9;
    if (!v15)
    {
      int64_t v9 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v9);
      if (!v15)
      {
        int64_t v9 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v9);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v9 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v1 + 48) + 24 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = v17[2];
    sub_2511C9D40();
    swift_bridgeObjectRetain_n();
    sub_2511C94F0();
    swift_bridgeObjectRelease();
    sub_2511C9D50();
    uint64_t result = sub_2511C9D80();
    uint64_t v21 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v7 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1 << v22) & ~*(void *)(v7 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v7 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    uint64_t v11 = (void *)(*(void *)(v3 + 48) + 24 * v10);
    *uint64_t v11 = v18;
    v11[1] = v19;
    v11[2] = v20;
    ++*(void *)(v3 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v9 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v9 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v9);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2511A95B0(unsigned int a1, char a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_251167220(a1);
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
  if (v15 >= result && (a2 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a2 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_251187140();
LABEL_7:
    int64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(double *)(v16[7] + 8 * v10) = a3;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_DWORD *)(v16[6] + 4 * v10) = a1;
    *(double *)(v16[7] + 8 * v10) = a3;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_25118424C(result, a2 & 1);
  uint64_t result = sub_251167220(a1);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    int64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_2511C9CD0();
  __break(1u);
  return result;
}

uint64_t sub_2511A96D8(uint64_t a1, uint64_t a2, char a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_251149240(a1, a2);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2511872B8();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(double *)(v18[7] + 8 * v12) = a4;
      return result;
    }
    goto LABEL_11;
  }
  sub_2511844E8(result, a3 & 1);
  uint64_t result = sub_251149240(a1, a2);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_2511C9CD0();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v20 = a1;
  v20[1] = a2;
  *(double *)(v18[7] + 8 * v12) = a4;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

uint64_t sub_2511A9840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_25112F2DC(a2, a3, a4, a5);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a6 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_251187830();
LABEL_7:
    BOOL v22 = (void *)*v7;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];
      uint64_t result = swift_release();
      *(void *)(v23 + 8 * v16) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_251184D00(v19, a6 & 1);
  unint64_t v25 = sub_25112F2DC(a2, a3, a4, a5);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_17:
    uint64_t result = sub_2511C9CD0();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  BOOL v22 = (void *)*v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  uint64_t v27 = (uint64_t *)(v22[6] + 32 * v16);
  uint64_t *v27 = a2;
  v27[1] = a3;
  v27[2] = a4;
  v27[3] = a5;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v28 = v22[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[2] = v30;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_2511A99E0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_2511C9180();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_251167184(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_251187470();
      goto LABEL_7;
    }
    sub_2511847E0(v17, a3 & 1);
    unint64_t v28 = sub_251167184(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      char v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_2511AA2EC(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_2511C9CD0();
    __break(1u);
    return result;
  }
LABEL_7:
  char v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = sub_2511C91E0();
  uint64_t v23 = *(void *)(v22 - 8);
  char v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;

  return v24(v26, a1, v25);
}

void sub_2511A9BE4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_2511C9180();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_251167184(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    char v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];

      *(void *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_251187BFC();
    goto LABEL_7;
  }
  sub_251185374(v17, a3 & 1);
  unint64_t v22 = sub_251167184(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_2511C9CD0();
    __break(1u);
    return;
  }
  unint64_t v14 = v22;
  char v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_2511AA3E0(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_2511A9D8C(uint64_t a1, long long *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_251167268((uint64_t)a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_25118809C();
LABEL_7:
    BOOL v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_251185B34(v13, a3 & 1);
  unint64_t v19 = sub_251167268((uint64_t)a2);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_17:
    uint64_t result = sub_2511C9CD0();
    __break(1u);
    return result;
  }
  unint64_t v10 = v19;
  BOOL v16 = (void *)*v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  v16[(v10 >> 6) + 8] |= 1 << v10;
  uint64_t v21 = (_OWORD *)(v16[6] + 48 * v10);
  long long v22 = *a2;
  long long v23 = a2[2];
  v21[1] = a2[1];
  v21[2] = v23;
  *uint64_t v21 = v22;
  *(void *)(v16[7] + 8 * v10) = a1;
  uint64_t v24 = v16[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v16[2] = v26;

  return sub_25113822C((uint64_t)a2);
}

uint64_t sub_2511A9F00(uint64_t a1, unsigned int a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_251167220(a2);
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
    uint64_t result = (uint64_t)sub_25118849C();
LABEL_7:
    BOOL v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_DWORD *)(v16[6] + 4 * v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_25118657C(result, a3 & 1);
  uint64_t result = sub_251167220(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    BOOL v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_2511C9CD0();
  __break(1u);
  return result;
}

uint64_t sub_2511AA038(uint64_t a1, unsigned int a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_251167220(a2);
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
    uint64_t result = (uint64_t)sub_25118865C();
LABEL_7:
    BOOL v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(void *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_DWORD *)(v16[6] + 4 * v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_251186850(result, a3 & 1);
  uint64_t result = sub_251167220(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    BOOL v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_2511C9CD0();
  __break(1u);
  return result;
}

uint64_t sub_2511AA164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_251149240(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_2511889D8();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_unknownObjectRelease();
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_251186E38(v17, a5 & 1);
  unint64_t v23 = sub_251149240(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_2511C9CD0();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  BOOL v25 = (uint64_t *)(v20[6] + 16 * v14);
  *BOOL v25 = a3;
  v25[1] = a4;
  uint64_t v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;

  return swift_bridgeObjectRetain();
}

uint64_t sub_2511AA2EC(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_2511C9180();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = sub_2511C91E0();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a3, v11);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_2511AA3E0(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_2511C9180();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_2511AA498(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v4 = isStackAllocationSafe;
  v11[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v6 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v7 = 8 * v6;
  if ((v5 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    uint64_t v8 = sub_2511AA9E8((uint64_t)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v6, v4, a2);
    if (v2) {
      swift_willThrow();
    }
    else {
      uint64_t v4 = v8;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = (void *)swift_slowAlloc();
    bzero(v9, v7);
    uint64_t v4 = sub_2511AA9E8((uint64_t)v9, v6, v4, a2);
    MEMORY[0x253397D40](v9, -1, -1);
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_2511AA61C(uint64_t a1, uint64_t (*a2)(void, double))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  uint64_t v26 = (void *)MEMORY[0x263F8EE78];
  if (!v7) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v10 << 6))
  {
    uint64_t result = a2(*(unsigned int *)(*(void *)(a1 + 48) + 4 * i), *(double *)(*(void *)(a1 + 56) + 8 * i));
    if (v14)
    {
      if (v7) {
        goto LABEL_4;
      }
    }
    else
    {
      int v18 = result;
      uint64_t v19 = v13;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_2511BF920(0, v26[2] + 1, 1, v26);
        uint64_t v26 = (void *)result;
      }
      unint64_t v21 = v26[2];
      unint64_t v20 = v26[3];
      unint64_t v22 = v21 + 1;
      if (v21 >= v20 >> 1)
      {
        unint64_t v24 = v26[2];
        unint64_t v25 = v21 + 1;
        uint64_t result = (uint64_t)sub_2511BF920((void *)(v20 > 1), v21 + 1, 1, v26);
        unint64_t v21 = v24;
        unint64_t v22 = v25;
        uint64_t v26 = (void *)result;
      }
      v26[2] = v22;
      unint64_t v23 = &v26[2 * v21];
      *((_DWORD *)v23 + 8) = v18;
      v23[5] = v19;
      if (v7) {
        goto LABEL_4;
      }
    }
LABEL_7:
    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v15 >= v8) {
      goto LABEL_29;
    }
    unint64_t v16 = *(void *)(v4 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v8) {
        goto LABEL_29;
      }
      unint64_t v16 = *(void *)(v4 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v8) {
          goto LABEL_29;
        }
        unint64_t v16 = *(void *)(v4 + 8 * v10);
        if (!v16)
        {
          int64_t v10 = v15 + 3;
          if (v15 + 3 >= v8) {
            goto LABEL_29;
          }
          unint64_t v16 = *(void *)(v4 + 8 * v10);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v8)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v26;
  }
  unint64_t v16 = *(void *)(v4 + 8 * v17);
  if (v16)
  {
    int64_t v10 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_29;
    }
    unint64_t v16 = *(void *)(v4 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_2511AA82C(unsigned int a1)
{
  return sub_2511A2970(a1, *(void *)(v1 + 16));
}

unint64_t sub_2511AA834()
{
  unint64_t result = qword_269B22688;
  if (!qword_269B22688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22688);
  }
  return result;
}

void sub_2511AA888()
{
  if (!qword_269B22690)
  {
    unint64_t v0 = sub_2511C9430();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B22690);
    }
  }
}

uint64_t sub_2511AA8F0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2511AA888();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2511AA954@<X0>(double *a1@<X0>, void *a2@<X8>)
{
  return sub_2511A3FD4(a1, *(_DWORD *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t type metadata accessor for POSIXSignalInputSignal()
{
  return self;
}

uint64_t sub_2511AA998@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_2511A3154(*(void *)(v2 + 24), a1);
  *a2 = a1[2];
  return swift_bridgeObjectRetain();
}

uint64_t sub_2511AA9E8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v24 = (unint64_t *)result;
  uint64_t v5 = 0;
  int64_t v6 = 0;
  uint64_t v7 = a3 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(a3 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = a4 + 56;
  while (1)
  {
    while (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v6 << 6);
      if (*(void *)(a4 + 16))
      {
LABEL_19:
        unsigned int v18 = *(_DWORD *)(*(void *)(a3 + 48) + 4 * v14);
        uint64_t result = MEMORY[0x253397570](*(void *)(a4 + 40), v18, 4);
        uint64_t v19 = -1 << *(unsigned char *)(a4 + 32);
        unint64_t v20 = result & ~v19;
        if ((*(void *)(v12 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20))
        {
          uint64_t v21 = *(void *)(a4 + 48);
          if (*(_DWORD *)(v21 + 4 * v20) == v18)
          {
LABEL_24:
            *(unint64_t *)((char *)v24 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
            BOOL v15 = __OFADD__(v5++, 1);
            if (v15) {
              goto LABEL_33;
            }
          }
          else
          {
            uint64_t v22 = ~v19;
            while (1)
            {
              unint64_t v20 = (v20 + 1) & v22;
              if (((*(void *)(v12 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
                break;
              }
              if (*(_DWORD *)(v21 + 4 * v20) == v18) {
                goto LABEL_24;
              }
            }
          }
        }
      }
    }
    BOOL v15 = __OFADD__(v6++, 1);
    if (v15)
    {
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (v6 >= v11) {
      return sub_2511B8D60(v24, a2, v5, a3);
    }
    unint64_t v16 = *(void *)(v7 + 8 * v6);
    if (!v16) {
      break;
    }
LABEL_18:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v6 << 6);
    if (*(void *)(a4 + 16)) {
      goto LABEL_19;
    }
  }
  int64_t v17 = v6 + 1;
  if (v6 + 1 >= v11) {
    return sub_2511B8D60(v24, a2, v5, a3);
  }
  unint64_t v16 = *(void *)(v7 + 8 * v17);
  if (v16) {
    goto LABEL_17;
  }
  int64_t v17 = v6 + 2;
  if (v6 + 2 >= v11) {
    return sub_2511B8D60(v24, a2, v5, a3);
  }
  unint64_t v16 = *(void *)(v7 + 8 * v17);
  if (v16) {
    goto LABEL_17;
  }
  int64_t v17 = v6 + 3;
  if (v6 + 3 >= v11) {
    return sub_2511B8D60(v24, a2, v5, a3);
  }
  unint64_t v16 = *(void *)(v7 + 8 * v17);
  if (v16)
  {
LABEL_17:
    int64_t v6 = v17;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v6 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v6 >= v11) {
      return sub_2511B8D60(v24, a2, v5, a3);
    }
    unint64_t v16 = *(void *)(v7 + 8 * v6);
    ++v17;
    if (v16) {
      goto LABEL_18;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

void sub_2511AABF8()
{
  if (!qword_26B218028)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_2511C99D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B218028);
    }
  }
}

void sub_2511AAC58()
{
  if (!qword_26B217F30)
  {
    sub_2511C97A0();
    unint64_t v0 = sub_2511C9610();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B217F30);
    }
  }
}

unint64_t sub_2511AACB4()
{
  unint64_t result = qword_269B226B0;
  if (!qword_269B226B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B226B0);
  }
  return result;
}

unint64_t sub_2511AAD08(void *a1)
{
  a1[1] = sub_2511AAD40();
  a1[2] = sub_2511AAD94();
  unint64_t result = sub_2511AADE8();
  a1[3] = result;
  return result;
}

unint64_t sub_2511AAD40()
{
  unint64_t result = qword_269B226C0;
  if (!qword_269B226C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B226C0);
  }
  return result;
}

unint64_t sub_2511AAD94()
{
  unint64_t result = qword_269B226C8;
  if (!qword_269B226C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B226C8);
  }
  return result;
}

unint64_t sub_2511AADE8()
{
  unint64_t result = qword_269B226D0;
  if (!qword_269B226D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B226D0);
  }
  return result;
}

unint64_t sub_2511AAE3C(uint64_t a1)
{
  unint64_t result = sub_2511AAE64();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2511AAE64()
{
  unint64_t result = qword_269B226D8;
  if (!qword_269B226D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B226D8);
  }
  return result;
}

unint64_t sub_2511AAEBC()
{
  unint64_t result = qword_269B226E0;
  if (!qword_269B226E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B226E0);
  }
  return result;
}

unint64_t sub_2511AAF14()
{
  unint64_t result = qword_269B226E8;
  if (!qword_269B226E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B226E8);
  }
  return result;
}

uint64_t sub_2511AAF68(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2511AB5DC(qword_26B218708, a2, (void (*)(uint64_t))type metadata accessor for POSIXSignalInputSignal);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t method lookup function for POSIXSignalInputSignal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for POSIXSignalInputSignal);
}

uint64_t dispatch thunk of POSIXSignalInputSignal.__allocating_init(context:observer:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

ValueMetadata *type metadata accessor for POSIXSignalInputSignal.Anchor()
{
  return &type metadata for POSIXSignalInputSignal.Anchor;
}

ValueMetadata *type metadata accessor for POSIXSignalInputSignal.Configuration()
{
  return &type metadata for POSIXSignalInputSignal.Configuration;
}

uint64_t destroy for POSIXSignalInputSignal.ProtectedState()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s19HealthOrchestration22POSIXSignalInputSignalC14ProtectedStateVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for POSIXSignalInputSignal.ProtectedState(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for POSIXSignalInputSignal.ProtectedState(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for POSIXSignalInputSignal.ProtectedState(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for POSIXSignalInputSignal.ProtectedState(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for POSIXSignalInputSignal.ProtectedState()
{
  return &type metadata for POSIXSignalInputSignal.ProtectedState;
}

unsigned char *storeEnumTagSinglePayload for POSIXSignalInputSignal.Anchor.CodingKeys(unsigned char *result, int a2, int a3)
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
        void *result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      void *result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2511AB2B4);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for POSIXSignalInputSignal.Anchor.CodingKeys()
{
  return &type metadata for POSIXSignalInputSignal.Anchor.CodingKeys;
}

unint64_t sub_2511AB2F0()
{
  unint64_t result = qword_269B226F0;
  if (!qword_269B226F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B226F0);
  }
  return result;
}

unint64_t sub_2511AB348()
{
  unint64_t result = qword_269B226F8;
  if (!qword_269B226F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B226F8);
  }
  return result;
}

unint64_t sub_2511AB3A0()
{
  unint64_t result = qword_269B22700;
  if (!qword_269B22700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22700);
  }
  return result;
}

uint64_t sub_2511AB3F4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x80000002511D1F50)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_2511C9CA0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_2511AB47C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2511AB4B4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 28, 7);
}

uint64_t sub_2511AB4EC()
{
  return sub_2511A37DC(*(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

void sub_2511AB4F8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_2511C9950();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_2511AB544()
{
  if (!qword_269B22720)
  {
    sub_2511C9260();
    sub_2511AB5DC(&qword_26B218390, 255, MEMORY[0x263F07908]);
    unint64_t v0 = sub_2511C9950();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B22720);
    }
  }
}

uint64_t sub_2511AB5DC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void sub_2511AB624()
{
  if (!qword_269B22728)
  {
    sub_2511C9180();
    sub_2511AB5DC((unint64_t *)&unk_269B21C40, 255, MEMORY[0x263F06EA8]);
    unint64_t v0 = sub_2511C9950();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B22728);
    }
  }
}

void sub_2511AB6BC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3();
    unint64_t v10 = a5(a1, a4, v9);
    if (!v11) {
      atomic_store(v10, a2);
    }
  }
}

uint64_t MockContext.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MockContext.logger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthOrchestration11MockContext_logger;
  uint64_t v4 = sub_2511C92A0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t MockContext.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_2511C9290();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  return v4;
}

uint64_t MockContext.init(identifier:)(uint64_t a1, uint64_t a2)
{
  sub_2511C9290();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t MockContext.Description.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MockContext.Description.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MockContext.Description.identifier.modify())()
{
  return nullsub_1;
}

uint64_t sub_2511AB900()
{
  return 0x696669746E656469;
}

uint64_t sub_2511AB91C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2511C9CA0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_2511AB9C0(uint64_t a1)
{
  unint64_t v2 = sub_2511ABB84();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2511AB9FC(uint64_t a1)
{
  unint64_t v2 = sub_2511ABB84();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t MockContext.Description.encode(to:)(void *a1)
{
  sub_2511ABD5C(0, &qword_269B22730, MEMORY[0x263F8E0C0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511ABB84();
  sub_2511C9DA0();
  sub_2511C9BD0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2511ABB84()
{
  unint64_t result = qword_269B22738;
  if (!qword_269B22738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22738);
  }
  return result;
}

uint64_t MockContext.Description.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2511ABD5C(0, &qword_269B22740, MEMORY[0x263F8E040]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511ABB84();
  sub_2511C9D90();
  if (!v2)
  {
    uint64_t v10 = sub_2511C9B60();
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v10;
    a2[1] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

void sub_2511ABD5C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_2511ABB84();
    unint64_t v7 = a3(a1, &type metadata for MockContext.Description.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2511ABDC0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return MockContext.Description.init(from:)(a1, a2);
}

uint64_t sub_2511ABDD8(void *a1)
{
  sub_2511ABD5C(0, &qword_269B22730, MEMORY[0x263F8E0C0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511ABB84();
  sub_2511C9DA0();
  sub_2511C9BD0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MockContext.contextDescription.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t static MockContext.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24)) {
    return 1;
  }
  else {
    return sub_2511C9CA0();
  }
}

uint64_t MockContext.description.getter()
{
  sub_2511C9960();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "<MockContext: ");
  swift_bridgeObjectRetain();
  sub_2511C9520();
  swift_bridgeObjectRelease();
  sub_2511C9520();
  return v1[0];
}

uint64_t MockContext.deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC19HealthOrchestration11MockContext_logger;
  uint64_t v2 = sub_2511C92A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t MockContext.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC19HealthOrchestration11MockContext_logger;
  uint64_t v2 = sub_2511C92A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2511AC11C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2511AC128@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC19HealthOrchestration11MockContext_logger;
  uint64_t v4 = sub_2511C92A0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_2511AC19C()
{
  return MockContext.description.getter();
}

uint64_t sub_2511AC1C0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)a1 + 16) == *(void *)(*(void *)a2 + 16)
    && *(void *)(*(void *)a1 + 24) == *(void *)(*(void *)a2 + 24))
  {
    return 1;
  }
  else
  {
    return sub_2511C9CA0();
  }
}

uint64_t (*MockContextProvider.startHandler.getter())(uint64_t, uint64_t)
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
  sub_2511ADFA4((uint64_t *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  long long v3 = v4;
  swift_release();
  *(_OWORD *)(swift_allocObject() + 16) = v3;
  return sub_2511AD2FC;
}

__n128 sub_2511AC2A8@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 32));
  sub_2511ADFA4((uint64_t *)(v4 + 16), &v7);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
  __n128 v6 = v7;
  swift_release();
  __n128 result = v6;
  *a2 = v6;
  return result;
}

uint64_t MockContextProvider.startHandler.setter(uint64_t a1, uint64_t a2)
{
  sub_2511AD300(a1, a2);

  return swift_release();
}

void (*MockContextProvider.startHandler.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[7] = v1;
  swift_beginAccess();
  uint64_t v4 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v5 = (uint64_t *)&v4[4];
  __n128 v6 = v4 + 8;
  os_unfair_lock_lock(v4 + 8);
  sub_2511ADFA4(v5, &v10);
  v3[8] = 0;
  os_unfair_lock_unlock(v6);
  long long v9 = v10;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = v9;
  v3[3] = sub_2511AD2FC;
  v3[4] = v7;
  return sub_2511AC468;
}

void sub_2511AC468(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v4 = *(void *)(*(void *)a1 + 32);
  if (a2)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    v2[5] = sub_2511AD3C4;
    v2[6] = v5;
    MEMORY[0x270FA5388](v5);
    uint64_t v7 = (void *)(v6 + 16);
    uint64_t v8 = (os_unfair_lock_s *)(v6 + 32);
    swift_retain();
    os_unfair_lock_lock(v8);
    sub_251173D5C(v7);
    os_unfair_lock_unlock(v8);
    swift_release();
  }
  else
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v3;
    *(void *)(v9 + 24) = v4;
    v2[5] = sub_2511ADF9C;
    v2[6] = v9;
    MEMORY[0x270FA5388](v9);
    uint64_t v11 = v10 + 4;
    uint64_t v12 = v10 + 8;
    os_unfair_lock_lock(v10 + 8);
    sub_251173D5C(v11);
    os_unfair_lock_unlock(v12);
  }
  swift_release();
  swift_endAccess();
  free(v2);
}

uint64_t (*MockContextProvider.stopHandler.getter())()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
  sub_2511ADFA4((uint64_t *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  long long v3 = v4;
  swift_release();
  *(_OWORD *)(swift_allocObject() + 16) = v3;
  return sub_2511AD3F4;
}

__n128 sub_2511AC6A4@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 24);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 32));
  sub_2511ADFA4((uint64_t *)(v4 + 16), &v7);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
  __n128 v6 = v7;
  swift_release();
  __n128 result = v6;
  *a2 = v6;
  return result;
}

uint64_t MockContextProvider.stopHandler.setter(uint64_t a1, uint64_t a2)
{
  sub_2511AD3FC(a1, a2);

  return swift_release();
}

void (*MockContextProvider.stopHandler.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[7] = v1;
  swift_beginAccess();
  uint64_t v4 = *(os_unfair_lock_s **)(v1 + 24);
  uint64_t v5 = (uint64_t *)&v4[4];
  __n128 v6 = v4 + 8;
  os_unfair_lock_lock(v4 + 8);
  sub_2511ADFA4(v5, &v10);
  v3[8] = 0;
  os_unfair_lock_unlock(v6);
  long long v9 = v10;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = v9;
  v3[3] = sub_2511ADF54;
  v3[4] = v7;
  return sub_2511AC864;
}

void sub_2511AC864(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v4 = *(void *)(*(void *)a1 + 32);
  if (a2)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    v2[5] = sub_25113321C;
    v2[6] = v5;
    MEMORY[0x270FA5388](v5);
    uint64_t v7 = (void *)(v6 + 16);
    uint64_t v8 = (os_unfair_lock_s *)(v6 + 32);
    swift_retain();
    os_unfair_lock_lock(v8);
    sub_251173D5C(v7);
    os_unfair_lock_unlock(v8);
    swift_release();
  }
  else
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v3;
    *(void *)(v9 + 24) = v4;
    v2[5] = sub_2511ADFBC;
    v2[6] = v9;
    MEMORY[0x270FA5388](v9);
    uint64_t v11 = v10 + 4;
    uint64_t v12 = v10 + 8;
    os_unfair_lock_lock(v10 + 8);
    sub_251173D5C(v11);
    os_unfair_lock_unlock(v12);
  }
  swift_release();
  swift_endAccess();
  free(v2);
}

void *(*MockContextProvider.contextHandler.getter())()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
  sub_251173C38((uint64_t *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  long long v3 = v4;
  swift_release();
  *(_OWORD *)(swift_allocObject() + 16) = v3;
  return sub_2511AD4C0;
}

__n128 sub_2511ACAA0@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 32);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 32));
  sub_251173C38((uint64_t *)(v4 + 16), &v7);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 32));
  __n128 v6 = v7;
  swift_release();
  __n128 result = v6;
  *a2 = v6;
  return result;
}

uint64_t sub_2511ACB40@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  type metadata accessor for MockContext();
  uint64_t v5 = swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t result = sub_2511C9290();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = v5;
  return result;
}

uint64_t sub_2511ACBB8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t))
{
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  *(void *)(v11 + 24) = v10;
  swift_retain();
  a7(a6, v11);

  return swift_release();
}

uint64_t MockContextProvider.contextHandler.setter(uint64_t a1, uint64_t a2)
{
  sub_2511AD4D8(a1, a2);

  return swift_release();
}

void (*MockContextProvider.contextHandler.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[7] = v1;
  swift_beginAccess();
  uint64_t v4 = *(os_unfair_lock_s **)(v1 + 32);
  uint64_t v5 = (uint64_t *)&v4[4];
  __n128 v6 = v4 + 8;
  os_unfair_lock_lock(v4 + 8);
  sub_251173C38(v5, &v10);
  v3[8] = 0;
  os_unfair_lock_unlock(v6);
  long long v9 = v10;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = v9;
  v3[3] = sub_2511AD4C0;
  v3[4] = v7;
  return sub_2511ACD5C;
}

void sub_2511ACD5C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v4 = *(void *)(*(void *)a1 + 32);
  if (a2)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    v2[5] = sub_2511AD59C;
    v2[6] = v5;
    MEMORY[0x270FA5388](v5);
    uint64_t v7 = (void *)(v6 + 16);
    uint64_t v8 = (os_unfair_lock_s *)(v6 + 32);
    swift_retain();
    os_unfair_lock_lock(v8);
    sub_251173D5C(v7);
    os_unfair_lock_unlock(v8);
    swift_release();
  }
  else
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v3;
    *(void *)(v9 + 24) = v4;
    v2[5] = sub_2511AD59C;
    v2[6] = v9;
    MEMORY[0x270FA5388](v9);
    uint64_t v11 = v10 + 4;
    uint64_t v12 = v10 + 8;
    os_unfair_lock_lock(v10 + 8);
    sub_251173D5C(v11);
    os_unfair_lock_unlock(v12);
  }
  swift_release();
  swift_endAccess();
  free(v2);
}

uint64_t MockContextProvider.start(delegate:)(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 32));
  sub_2511ADFA4((uint64_t *)(v5 + 16), v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 32));
  uint64_t v6 = (void (*)(void *))v8[0];
  swift_release();
  v8[0] = a1;
  v8[1] = a2;
  v6(v8);
  return swift_release();
}

Swift::Void __swiftcall MockContextProvider.stop()()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
  sub_2511ADFA4((uint64_t *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  uint64_t v2 = v4;
  uint64_t v3 = swift_release();
  v2(v3);
  swift_release();
}

void MockContextProvider.context(for:)(uint64_t *a1)
{
  void (*v6)(uint64_t *__return_ptr, void *);
  uint64_t v7;
  void v8[2];

  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_beginAccess();
  uint64_t v5 = *(void *)(v1 + 32);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 32));
  sub_251173C38((uint64_t *)(v5 + 16), v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 32));
  if (v2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = (void (*)(uint64_t *__return_ptr, void *))v8[0];
    swift_release();
    v8[0] = v3;
    v8[1] = v4;
    v6(&v7, v8);
    swift_release();
  }
}

uint64_t MockContextProvider.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  MockContextProvider.init()();
  return v0;
}

void *MockContextProvider.init()()
{
  sub_2511AD6A0(0, &qword_269B22748, (void (*)(uint64_t))sub_2511AD5B4);
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 32) = 0;
  *(void *)(v1 + 16) = nullsub_1;
  *(void *)(v1 + 24) = 0;
  v0[2] = v1;
  sub_2511AD6A0(0, &qword_269B22760, (void (*)(uint64_t))sub_2511AD65C);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 32) = 0;
  *(void *)(v2 + 16) = nullsub_1;
  *(void *)(v2 + 24) = 0;
  v0[3] = v2;
  sub_2511AD6A0(0, &qword_269B22768, (void (*)(uint64_t))sub_2511AD70C);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 32) = 0;
  *(void *)(v3 + 16) = sub_2511ACB40;
  *(void *)(v3 + 24) = 0;
  v0[4] = v3;
  return v0;
}

uint64_t MockContextProvider.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t MockContextProvider.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

void sub_2511AD2A4(uint64_t *a1)
{
}

uint64_t sub_2511AD2C4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2511AD300(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = (void *)(v6 + 16);
  uint64_t v8 = (os_unfair_lock_s *)(v6 + 32);
  swift_retain();
  os_unfair_lock_lock(v8);
  sub_251173D5C(v7);
  os_unfair_lock_unlock(v8);
  swift_release();
  return swift_endAccess();
}

uint64_t sub_2511AD3C4(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_2511AD3F4()
{
  return sub_2511AE140(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_2511AD3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v7 = (void *)(v6 + 16);
  uint64_t v8 = (os_unfair_lock_s *)(v6 + 32);
  swift_retain();
  os_unfair_lock_lock(v8);
  sub_251173D5C(v7);
  os_unfair_lock_unlock(v8);
  swift_release();
  return swift_endAccess();
}

void *sub_2511AD4C0()
{
  return sub_2511ADEB0();
}

uint64_t sub_2511AD4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 32);
  uint64_t v7 = (void *)(v6 + 16);
  uint64_t v8 = (os_unfair_lock_s *)(v6 + 32);
  swift_retain();
  os_unfair_lock_lock(v8);
  sub_251173D5C(v7);
  os_unfair_lock_unlock(v8);
  swift_release();
  return swift_endAccess();
}

uint64_t sub_2511AD59C@<X0>(uint64_t *a1@<X8>)
{
  return sub_2511ADF20(a1);
}

unint64_t sub_2511AD5B4()
{
  unint64_t result = qword_269B22750;
  if (!qword_269B22750)
  {
    sub_2511AD608();
    unint64_t result = swift_getFunctionTypeMetadata1();
    atomic_store(result, (unint64_t *)&qword_269B22750);
  }
  return result;
}

unint64_t sub_2511AD608()
{
  unint64_t result = qword_269B22758;
  if (!qword_269B22758)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269B22758);
  }
  return result;
}

unint64_t sub_2511AD65C()
{
  unint64_t result = qword_26B2181A0;
  if (!qword_26B2181A0)
  {
    unint64_t result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_26B2181A0);
  }
  return result;
}

void sub_2511AD6A0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v4 = sub_2511C99D0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_2511AD70C()
{
  unint64_t result = qword_269B22770;
  if (!qword_269B22770)
  {
    type metadata accessor for MockContext();
    unint64_t result = swift_getFunctionTypeMetadata1();
    atomic_store(result, (unint64_t *)&qword_269B22770);
  }
  return result;
}

uint64_t type metadata accessor for MockContext()
{
  uint64_t result = qword_269B227A0;
  if (!qword_269B227A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_2511AD7A8(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_2511AD7D8();
  unint64_t result = sub_2511AD82C();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2511AD7D8()
{
  unint64_t result = qword_269B22778;
  if (!qword_269B22778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22778);
  }
  return result;
}

unint64_t sub_2511AD82C()
{
  unint64_t result = qword_269B22780;
  if (!qword_269B22780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22780);
  }
  return result;
}

unint64_t sub_2511AD884()
{
  unint64_t result = qword_269B22788;
  if (!qword_269B22788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22788);
  }
  return result;
}

uint64_t sub_2511AD8D8(uint64_t a1)
{
  uint64_t result = sub_2511AD950(&qword_269B22790);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2511AD91C()
{
  return sub_2511AD950(&qword_269B22798);
}

uint64_t sub_2511AD950(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MockContext();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2511AD998(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2511ACBB8(a1, a2, a3, a4, (uint64_t)&unk_2702082D8, (uint64_t)sub_2511AD2FC, (void (*)(uint64_t, uint64_t))sub_2511AD300);
}

uint64_t sub_2511AD9E4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2511ACBB8(a1, a2, a3, a4, (uint64_t)&unk_2702082B0, (uint64_t)sub_2511ADF54, (void (*)(uint64_t, uint64_t))sub_2511AD3FC);
}

uint64_t sub_2511ADA30(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2511ACBB8(a1, a2, a3, a4, (uint64_t)&unk_270208288, (uint64_t)sub_2511AD4C0, (void (*)(uint64_t, uint64_t))sub_2511AD4D8);
}

uint64_t sub_2511ADA78()
{
  return type metadata accessor for MockContext();
}

uint64_t sub_2511ADA80()
{
  uint64_t result = sub_2511C92A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for MockContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MockContext);
}

uint64_t dispatch thunk of MockContext.__allocating_init(identifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void *initializeBufferWithCopyOfBuffer for MockContext.Description(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MockContext.Description(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for MockContext.Description(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MockContext.Description(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MockContext.Description(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MockContext.Description()
{
  return &type metadata for MockContext.Description;
}

uint64_t type metadata accessor for MockContextProvider()
{
  return self;
}

uint64_t method lookup function for MockContextProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MockContextProvider);
}

uint64_t dispatch thunk of MockContextProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

unsigned char *storeEnumTagSinglePayload for MockContext.Description.CodingKeys(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2511ADD70);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MockContext.Description.CodingKeys()
{
  return &type metadata for MockContext.Description.CodingKeys;
}

unint64_t sub_2511ADDAC()
{
  unint64_t result = qword_269B227B0;
  if (!qword_269B227B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B227B0);
  }
  return result;
}

unint64_t sub_2511ADE04()
{
  unint64_t result = qword_269B227B8;
  if (!qword_269B227B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B227B8);
  }
  return result;
}

unint64_t sub_2511ADE5C()
{
  unint64_t result = qword_269B227C0;
  if (!qword_269B227C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B227C0);
  }
  return result;
}

void *sub_2511ADEB0()
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v0 + 16))(&v3);
  if (!v1) {
    return (void *)v3;
  }
  return result;
}

uint64_t sub_2511ADEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(void *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

uint64_t sub_2511ADF20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  if (!v2) {
    *a1 = result;
  }
  return result;
}

uint64_t sub_2511ADFA4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_251173C38(a1, a2);
}

uint64_t WorkQueue.__allocating_init(environment:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  WorkQueue.init(environment:)(a1);
  return v2;
}

void WorkQueue.statusObserver.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 19;
  os_unfair_lock_lock(v3 + 19);
  sub_2511AF180(v4, a1);

  os_unfair_lock_unlock(v5);
}

uint64_t WorkQueue.statusObserver.setter(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 19;
  os_unfair_lock_lock(v3 + 19);
  sub_2511AF390(v4);
  os_unfair_lock_unlock(v5);
  return sub_25113DDF8(a1);
}

void WorkQueue.priorityThreshold.getter(unsigned char *a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 19;
  os_unfair_lock_lock(v3 + 19);
  sub_2511AF430(v4, a1);

  os_unfair_lock_unlock(v5);
}

uint64_t sub_2511AE140(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t WorkQueue.debugSnapshot.getter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 19;
  os_unfair_lock_lock(v1 + 19);
  sub_25115A538(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_2511AE1C4(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t, void))
{
  return a3(a1, *a2);
}

uint64_t sub_2511AE1F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t *))
{
  uint64_t v4 = a2;
  return a3(a1, &v4);
}

uint64_t WorkQueue.WorkSet.init(items:executorIdentifier:anchor:context:scheduleTime:onFinish:)@<X0>(uint64_t result@<X0>, long long *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  long long v9 = *a2;
  uint64_t v10 = *((void *)a2 + 2);
  uint64_t v11 = *((void *)a2 + 3);
  *(void *)a8 = result;
  *(_OWORD *)(a8 + 8) = v9;
  *(void *)(a8 + 24) = v10;
  *(void *)(a8 + 32) = v11;
  *(_OWORD *)(a8 + 40) = a2[2];
  *(void *)(a8 + 56) = a3;
  *(void *)(a8 + 64) = a4;
  *(void *)(a8 + 72) = a5;
  *(double *)(a8 + 80) = a9;
  *(void *)(a8 + 88) = a6;
  *(void *)(a8 + 96) = a7;
  return result;
}

uint64_t sub_2511AE258@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = sub_2511C9890();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v24 - v11;
  uint64_t v13 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v10);
  BOOL v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25112FD4C(a1, (uint64_t)&v27);
  sub_25112F678(0, (unint64_t *)&qword_26B217E58);
  int v16 = swift_dynamicCast();
  int64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  if (v16)
  {
    v17(v12, 0, 1, a2);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, a2);
    unsigned int v18 = *(void (**)(char *, uint64_t, uint64_t))(a3 + 40);
    a4[3] = a2;
    a4[4] = a3;
    __swift_allocate_boxed_opaque_existential_1(a4);
    v18(v15, a2, a3);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, a2);
  }
  else
  {
    v17(v12, 1, 1, a2);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    sub_2511463D0(0, &qword_269B227D8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8E0F8]);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_2511CB450;
    uint64_t v27 = 0;
    unint64_t v28 = 0xE000000000000000;
    sub_2511C9960();
    uint64_t v25 = v27;
    unint64_t v26 = v28;
    sub_2511C9520();
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 24))(&v27, a2, a3);
    uint64_t v21 = v29;
    v24[1] = v27;
    v24[2] = v28;
    swift_bridgeObjectRetain();
    sub_2511C9520();
    v24[0] = v21;
    sub_2511C9C50();
    sub_2511C9520();
    swift_bridgeObjectRelease();
    sub_2511C9520();
    sub_2511C9520();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2511C9520();
    uint64_t v22 = v25;
    unint64_t v23 = v26;
    *(void *)(v20 + 56) = MEMORY[0x263F8D310];
    *(void *)(v20 + 32) = v22;
    *(void *)(v20 + 40) = v23;
    sub_2511C9D20();
    swift_bridgeObjectRelease();
    return sub_25112FD4C(a1, (uint64_t)a4);
  }
}

uint64_t WorkSource.nextWorkItem()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_2511AE638, 0, 0);
}

uint64_t sub_2511AE638()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 24);
  *(void *)(v2 + 32) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2511AE738;
  uint64_t v4 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2318](v4, 0, 0, 0x6B726F577478656ELL, 0xEE0029286D657449, sub_2511AFA48, v2, &type metadata for ScheduledWorkPlan);
}

uint64_t sub_2511AE738()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2511AE848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2511B039C();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  (*(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(a4 + 8))(sub_2511B0494, v12, a3, a4);
  return swift_release();
}

uint64_t sub_2511AE9AC(uint64_t a1)
{
  sub_251145778(a1, (uint64_t)v2);
  sub_2511B039C();
  return sub_2511C9640();
}

uint64_t WorkQueue.WorkSet.items.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorkQueue.WorkSet.items.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*WorkQueue.WorkSet.items.modify())()
{
  return nullsub_1;
}

uint64_t WorkQueue.WorkSet.executorIdentifier.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v5 = v1[6];
  *a1 = v1[1];
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v6;
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

__n128 WorkQueue.WorkSet.executorIdentifier.setter(long long *a1)
{
  __n128 v5 = (__n128)a1[1];
  long long v6 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  uint64_t v3 = *((void *)a1 + 5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(v1 + 8) = v6;
  __n128 result = v5;
  *(__n128 *)(v1 + 24) = v5;
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = v3;
  return result;
}

uint64_t (*WorkQueue.WorkSet.executorIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t WorkQueue.WorkSet.anchor.getter()
{
  return swift_retain();
}

uint64_t WorkQueue.WorkSet.anchor.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 56) = a1;
  return result;
}

uint64_t (*WorkQueue.WorkSet.anchor.modify())()
{
  return nullsub_1;
}

uint64_t WorkQueue.WorkSet.context.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t WorkQueue.WorkSet.context.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t (*WorkQueue.WorkSet.context.modify())()
{
  return nullsub_1;
}

double WorkQueue.WorkSet.scheduleTime.getter()
{
  return *(double *)(v0 + 80);
}

void WorkQueue.WorkSet.scheduleTime.setter(double a1)
{
  *(double *)(v1 + 80) = a1;
}

uint64_t (*WorkQueue.WorkSet.scheduleTime.modify())()
{
  return nullsub_1;
}

uint64_t sub_2511AEC3C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 88) = sub_2511B0338;
  *(void *)(a2 + 96) = v5;
  return result;
}

uint64_t WorkQueue.WorkSet.onFinish.getter()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_retain();
  return v1;
}

uint64_t WorkQueue.WorkSet.onFinish.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return result;
}

uint64_t (*WorkQueue.WorkSet.onFinish.modify())()
{
  return nullsub_1;
}

uint64_t WorkQueue.init(environment:)(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v1 + 24) = a1;
  v9[0] = MEMORY[0x263F8EE78];
  v9[1] = MEMORY[0x263F8EE78];
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v12 = 0;
  char v13 = 3;
  sub_2511448BC(0, &qword_26B218928);
  uint64_t v4 = swift_allocObject();
  *(_DWORD *)(v4 + 76) = 0;
  sub_2511AFA54((uint64_t)v9, v4 + 16);
  swift_retain();
  sub_2511AFA8C((uint64_t)v9);
  *(void *)(v2 + 16) = v4;
  uint64_t v5 = *(os_unfair_lock_s **)(a1 + 16);
  uint64_t v6 = (uint64_t)&v5[4];
  uint64_t v7 = v5 + 10;
  swift_retain();
  os_unfair_lock_lock(v7);
  sub_251170984(v6);
  os_unfair_lock_unlock(v7);
  swift_release();
  swift_release();
  return v2;
}

uint64_t WorkQueue.count.getter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t *)&v1[4];
  uint64_t v3 = v1 + 19;
  os_unfair_lock_lock(v1 + 19);
  sub_25113D4A8(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t WorkQueue.activeCount.getter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t *)&v1[4];
  uint64_t v3 = v1 + 19;
  os_unfair_lock_lock(v1 + 19);
  sub_2511AEEF0(v2, (unint64_t)&v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

void sub_2511AEEF0(uint64_t *a1@<X0>, unint64_t a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v6 = *a1;
  if ((unint64_t)*a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v7) {
    goto LABEL_21;
  }
  while (1)
  {
    unint64_t v23 = (void *)MEMORY[0x263F8EE78];
    sub_25113A424(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0) {
      break;
    }
    uint64_t v8 = 0;
    uint64_t v9 = v23;
    uint64_t v20 = (void *)a2;
    unint64_t v21 = v6 & 0xC000000000000001;
    uint64_t v10 = v6;
    while (v7 != v8)
    {
      if (v21)
      {
        uint64_t v11 = MEMORY[0x2533971C0](v8, v6);
      }
      else
      {
        uint64_t v11 = *(void *)(v6 + 8 * v8 + 32);
        swift_retain();
      }
      uint64_t v12 = *(os_unfair_lock_s **)(v11 + 16);
      uint64_t v13 = (uint64_t)&v12[4];
      uint64_t v3 = v12 + 11;
      os_unfair_lock_lock(v12 + 11);
      sub_2511B19D8(v13, &v22);
      if (v4) {
        goto LABEL_25;
      }
      uint64_t v4 = 0;
      os_unfair_lock_unlock(v3);
      uint64_t v3 = v22;
      swift_release();
      unint64_t v23 = v9;
      a2 = v9[2];
      unint64_t v14 = v9[3];
      if (a2 >= v14 >> 1)
      {
        sub_25113A424(v14 > 1, a2 + 1, 1);
        uint64_t v9 = v23;
      }
      ++v8;
      void v9[2] = a2 + 1;
      v9[a2 + 4] = v3;
      uint64_t v6 = v10;
      if (v7 == v8)
      {
        swift_bridgeObjectRelease();
        a2 = (unint64_t)v20;
        uint64_t v15 = v9[2];
        if (v15) {
          goto LABEL_14;
        }
LABEL_22:
        uint64_t v16 = 0;
LABEL_23:
        swift_bridgeObjectRelease();
        *(void *)a2 = v16;
        return;
      }
    }
    __break(1u);
    while (1)
    {
      __break(1u);
LABEL_20:
      swift_bridgeObjectRetain_n();
      uint64_t v7 = sub_2511C9AC0();
      swift_bridgeObjectRelease();
      if (v7) {
        break;
      }
LABEL_21:
      swift_bridgeObjectRelease();
      uint64_t v9 = (void *)MEMORY[0x263F8EE78];
      uint64_t v15 = *(void *)(MEMORY[0x263F8EE78] + 16);
      if (!v15) {
        goto LABEL_22;
      }
LABEL_14:
      uint64_t v16 = 0;
      int64_t v17 = v9 + 4;
      while (1)
      {
        uint64_t v18 = *v17++;
        BOOL v19 = __OFADD__(v16, v18);
        v16 += v18;
        if (v19) {
          break;
        }
        if (!--v15) {
          goto LABEL_23;
        }
      }
    }
  }
  __break(1u);
LABEL_25:
  os_unfair_lock_unlock(v3);
  __break(1u);
}

uint64_t sub_2511AF108(uint64_t a1, uint64_t a2)
{
  sub_25113D3C0(a1, (uint64_t)v7);
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)a2 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 19;
  os_unfair_lock_lock(v3 + 19);
  sub_2511B0784(v4);
  os_unfair_lock_unlock(v5);
  return sub_25113DDF8((uint64_t)v7);
}

uint64_t sub_2511AF180@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25113D3C0(a1 + 16, a2);
}

uint64_t sub_2511AF1B0(uint64_t a1, uint64_t a2)
{
  return sub_2511B070C(a2, a1 + 16);
}

void (*WorkQueue.statusObserver.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  uint64_t v4 = *(os_unfair_lock_s **)(v1 + 16);
  v3[10] = v4;
  uint64_t v5 = (uint64_t)&v4[4];
  uint64_t v6 = v4 + 19;
  os_unfair_lock_lock(v4 + 19);
  sub_2511AF180(v5, (uint64_t)v3);
  v3[11] = 0;
  os_unfair_lock_unlock(v6);
  return sub_2511AF280;
}

void sub_2511AF280(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  uint64_t v3 = *(os_unfair_lock_s **)(*a1 + 80);
  if (a2)
  {
    uint64_t v4 = v3 + 19;
    uint64_t v5 = (uint64_t)&v3[4];
    uint64_t v6 = sub_25113D3C0(*a1, (uint64_t)v2 + 40);
    MEMORY[0x270FA5388](v6);
    os_unfair_lock_lock(v4);
    sub_2511B0784(v5);
    os_unfair_lock_unlock(v4);
    sub_25113DDF8((uint64_t)v2 + 40);
  }
  else
  {
    uint64_t v7 = v3 + 19;
    uint64_t v8 = (uint64_t)&v3[4];
    MEMORY[0x270FA5388](a1);
    os_unfair_lock_lock(v7);
    sub_2511B0784(v8);
    os_unfair_lock_unlock(v7);
  }
  sub_25113DDF8((uint64_t)v2);
  free(v2);
}

uint64_t sub_2511AF390(uint64_t a1)
{
  return sub_2511B070C(*(void *)(v1 + 16), a1 + 16);
}

void sub_2511AF3C4(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)a1 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 19;
  os_unfair_lock_lock(v3 + 19);
  sub_2511AF430(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

uint64_t sub_2511AF430@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(result + 56);
  return result;
}

uint64_t (*WorkQueue.priorityThreshold.modify(void *a1))()
{
  *a1 = v1;
  uint64_t v2 = a1 + 1;
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 19;
  os_unfair_lock_lock(v3 + 19);
  sub_2511AF430(v4, v2);
  os_unfair_lock_unlock(v5);
  return sub_251157188;
}

Swift::Void __swiftcall WorkQueue.pause()()
{
}

Swift::Void __swiftcall WorkQueue.resume()()
{
}

Swift::Void __swiftcall WorkQueue.didUpdate(environmentalState:)(Swift::OpaquePointer environmentalState)
{
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v3 = (uint64_t *)&v2[4];
  uint64_t v4 = v2 + 19;
  os_unfair_lock_lock(v2 + 19);
  sub_25114A910(v3);
  os_unfair_lock_unlock(v4);
}

uint64_t WorkQueue.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t WorkQueue.__deallocating_deinit()
{
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

void *sub_2511AF5E4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = 0xD000000000000011;
  sub_251147348(0, (unint64_t *)&qword_26B2168A0, (uint64_t (*)(uint64_t))sub_25115A3E0, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2511CB580;
  *(void *)(inited + 32) = 0xD000000000000011;
  *(void *)(inited + 40) = 0x80000002511D20A0;
  unint64_t v8 = 0xEB00000000646569;
  uint64_t v9 = 0x6669636570736E75;
  unint64_t v10 = inited;
  switch(*(unsigned char *)(a1 + 56))
  {
    case 1:
      unint64_t v8 = 0xE600000000000000;
      uint64_t v9 = 0x746E65677275;
      break;
    case 2:
      unint64_t v8 = 0xEB0000000065636ELL;
      uint64_t v9 = 0x616E65746E69616DLL;
      break;
    case 3:
      unint64_t v8 = 0xE700000000000000;
      uint64_t v9 = 0x64656B636F6C62;
      break;
    default:
      break;
  }
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 56) = v8;
  *(void *)(inited + 64) = 0x756F4368636F7065;
  *(void *)(inited + 72) = 0xEA0000000000746ELL;
  if (*(void *)a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v11 = *(void *)((*(void *)a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v27 = v11;
    uint64_t v12 = (os_unfair_lock_s *)MEMORY[0x263F8D6C8];
    *(void *)(v10 + 80) = sub_2511C9C50();
    *(void *)(v10 + 88) = v13;
    strcpy((char *)(v10 + 96), "pendingCount");
    *(unsigned char *)(v10 + 109) = 0;
    *(_WORD *)(v10 + 110) = -5120;
    uint64_t v27 = sub_25113A230((uint64_t *)a1);
    *(void *)(v10 + 112) = sub_2511C9C50();
    *(void *)(v10 + 120) = v14;
    *(void *)(v10 + 128) = v6 + 2;
    *(void *)(v10 + 136) = 0x80000002511D20C0;
    uint64_t v27 = *(void *)(*(void *)(a1 + 8) + 16);
    *(void *)(v10 + 144) = sub_2511C9C50();
    *(void *)(v10 + 152) = v15;
    unint64_t v16 = sub_251148A20(v10);
    sub_251147348(0, (unint64_t *)&unk_269B22270, (uint64_t (*)(uint64_t))sub_25115A444, MEMORY[0x263F8E0F8]);
    uint64_t v17 = swift_initStackObject();
    *(_OWORD *)(v17 + 16) = xmmword_2511CB450;
    *(void *)(v17 + 32) = 0x7368636F7065;
    *(void *)(v17 + 40) = 0xE600000000000000;
    a1 = *(void *)a1;
    if ((unint64_t)a1 >> 62) {
      break;
    }
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v6) {
      goto LABEL_24;
    }
LABEL_9:
    uint64_t v27 = MEMORY[0x263F8EE78];
    sub_2511C9A20();
    if (v6 < 0)
    {
      __break(1u);
LABEL_27:
      os_unfair_lock_unlock(v12);
      __break(1u);
      JUMPOUT(0x2511AFA38);
    }
    unint64_t v24 = v16;
    uint64_t v25 = a2;
    a2 = 0;
    unint64_t v10 = a1 & 0xC000000000000001;
    while ((void *)v6 != a2)
    {
      if (v10)
      {
        uint64_t v18 = MEMORY[0x2533971C0](a2, a1);
      }
      else
      {
        uint64_t v18 = *(void *)(a1 + 8 * (void)a2 + 32);
        swift_retain();
      }
      BOOL v19 = *(os_unfair_lock_s **)(v18 + 16);
      uint64_t v20 = (unsigned __int8 *)&v19[4];
      uint64_t v12 = v19 + 11;
      os_unfair_lock_lock(v19 + 11);
      sub_2511B1CE8(v20, &v26);
      if (v3) {
        goto LABEL_27;
      }
      uint64_t v3 = 0;
      a2 = (void *)((char *)a2 + 1);
      os_unfair_lock_unlock(v12);
      swift_release();
      sub_2511C99F0();
      sub_2511C9A30();
      sub_2511C9A40();
      sub_2511C9A00();
      if ((void *)v6 == a2)
      {
        uint64_t v21 = v27;
        swift_bridgeObjectRelease();
        unint64_t v16 = v24;
        a2 = v25;
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_2511C9AC0();
    swift_bridgeObjectRelease();
  }
  if (a1 < 0) {
    uint64_t v12 = (os_unfair_lock_s *)a1;
  }
  else {
    uint64_t v12 = (os_unfair_lock_s *)(a1 & 0xFFFFFFFFFFFFFF8);
  }
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_2511C9AC0();
  swift_bridgeObjectRelease();
  if (v6) {
    goto LABEL_9;
  }
LABEL_24:
  swift_bridgeObjectRelease();
  uint64_t v21 = MEMORY[0x263F8EE78];
LABEL_25:
  *(void *)(v17 + 48) = v21;
  unint64_t v22 = sub_251153530(v17);
  type metadata accessor for DebugSnapshot();
  uint64_t result = (void *)swift_allocObject();
  result[2] = 0x657551206B726F57;
  result[3] = 0xEA00000000006575;
  result[4] = v16;
  result[5] = v22;
  *a2 = result;
  return result;
}

uint64_t sub_2511AFA48(uint64_t a1)
{
  return sub_2511AE848(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_2511AFA54(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2511AFA8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2511AFABC()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 19;
  os_unfair_lock_lock(v1 + 19);
  sub_25115A538(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_2511AFB1C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = sub_2511B0370;
  a2[1] = v5;

  return swift_retain();
}

void sub_2511AFB8C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)a1 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 19;
  os_unfair_lock_lock(v3 + 19);
  sub_2511AF180(v4, a2);

  os_unfair_lock_unlock(v5);
}

uint64_t sub_2511AFC04()
{
  return WorkQueue.priorityThreshold.setter();
}

uint64_t dispatch thunk of WorkSource.fetchNextWorkPlan(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for WorkQueue()
{
  return self;
}

uint64_t method lookup function for WorkQueue(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WorkQueue);
}

uint64_t dispatch thunk of WorkQueue.__allocating_init(environment:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t initializeWithCopy for WorkQueue.WorkSet(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v7 = *(void *)(a2 + 88);
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for WorkQueue.WorkSet(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  uint64_t v4 = a2[9];
  a1[8] = a2[8];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[9] = v4;
  a1[10] = a2[10];
  uint64_t v5 = a2[12];
  a1[11] = a2[11];
  a1[12] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for WorkQueue.WorkSet(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkQueue.WorkSet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkQueue.WorkSet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkQueue.WorkSet()
{
  return &type metadata for WorkQueue.WorkSet;
}

uint64_t destroy for WorkQueue.State(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  }
  return result;
}

uint64_t initializeWithCopy for WorkQueue.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = (_OWORD *)(a1 + 16);
  uint64_t v6 = a2 + 16;
  uint64_t v7 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v7;
    *(void *)(a1 + 48) = v8;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8))(a1 + 16, v6, v7);
  }
  else
  {
    long long v9 = *(_OWORD *)(v6 + 16);
    *uint64_t v5 = *(_OWORD *)v6;
    *(_OWORD *)(a1 + 32) = v9;
    *(void *)(a1 + 48) = *(void *)(v6 + 32);
  }
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t assignWithCopy for WorkQueue.State(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v4)
    {
      *(void *)(a1 + 40) = v4;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 16);
    long long v6 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v5;
    *(_OWORD *)(a1 + 32) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
LABEL_8:
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for WorkQueue.State(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  }
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkQueue.State(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkQueue.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 57) = 1;
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
    *(unsigned char *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkQueue.State()
{
  return &type metadata for WorkQueue.State;
}

uint64_t sub_2511B0300()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2511B0338(uint64_t a1, uint64_t a2)
{
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  return v3(a1, &v5);
}

uint64_t sub_2511B0370(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(a1, *a2);
}

void sub_2511B039C()
{
  if (!qword_269B227D0)
  {
    unint64_t v0 = sub_2511C9650();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B227D0);
    }
  }
}

uint64_t sub_2511B0404()
{
  sub_2511B039C();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2511B0494(uint64_t a1)
{
  sub_2511B039C();

  return sub_2511AE9AC(a1);
}

uint64_t sub_2511B0504()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 248, 7);
}

uint64_t sub_2511B0574()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2511B05AC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 128, 7);
}

uint64_t sub_2511B061C()
{
  if (v0[5]) {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 15));
  swift_release();
  swift_release();
  uint64_t v1 = (void *)v0[30];
  if ((unint64_t)v1 >= 2) {

  }
  swift_release();
  if (v0[32]) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 272, 7);
}

uint64_t sub_2511B06BC()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2511B070C(uint64_t a1, uint64_t a2)
{
  sub_25113D424();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2511B0784(uint64_t a1)
{
  return sub_2511AF390(a1);
}

uint64_t sub_2511B079C(uint64_t a1)
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
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
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
  uint64_t v3 = sub_2511BFB80(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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
  unint64_t v9 = (unint64_t)&v3[5 * v8 + 4];
  if (a1 + 32 < v9 + 40 * v2 && v9 < a1 + 32 + 40 * v2) {
    goto LABEL_24;
  }
  sub_2511B32DC();
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
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511B0904(unint64_t a1)
{
  return sub_2511B1350(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_2511C54A0);
}

uint64_t sub_2511B091C(unint64_t a1)
{
  return sub_2511B1350(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_2511C56F0);
}

uint64_t sub_2511B0934(uint64_t a1)
{
  uint64_t v84 = sub_2511C9180();
  uint64_t v4 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  v85 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2511B3158(0, &qword_269B21F98, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  unint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  MEMORY[0x270FA5388](v10);
  int64_t v14 = (char *)&v68 - v13;
  uint64_t v15 = *(void *)(a1 + 16);
  unint64_t v16 = *v1;
  int64_t v17 = *(void *)(*v1 + 16);
  int64_t v18 = v17 + v15;
  if (__OFADD__(v17, v15))
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v83 = v11;
  uint64_t v2 = v4;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t *v1 = v16;
  if (!isUniquelyReferenced_nonNull_native || (int64_t v20 = *(void *)(v16 + 24) >> 1, v20 < v18))
  {
    if (v17 <= v18) {
      int64_t v21 = v17 + v15;
    }
    else {
      int64_t v21 = v17;
    }
    unint64_t v16 = sub_2511C00AC(isUniquelyReferenced_nonNull_native, v21, 1, v16);
    unint64_t *v1 = v16;
    int64_t v20 = *(void *)(v16 + 24) >> 1;
  }
  uint64_t v22 = *(void *)(v16 + 16);
  int64_t v17 = *(void *)(v4 + 72);
  uint64_t v23 = v20 - v22;
  unint64_t v82 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v24 = sub_2511C5DD4(&v86, v16 + v82 + v17 * v22, v20 - v22, a1);
  if (v24 < v15) {
    goto LABEL_17;
  }
  if (v24)
  {
    uint64_t v27 = *(void *)(v16 + 16);
    BOOL v28 = __OFADD__(v27, v24);
    uint64_t v29 = v27 + v24;
    if (v28)
    {
      __break(1u);
      goto LABEL_22;
    }
    *(void *)(v16 + 16) = v29;
  }
  if (v24 == v23)
  {
LABEL_18:
    uint64_t v31 = *(void *)(v16 + 16);
    uint64_t v15 = v86;
    unint64_t v26 = v87;
    unint64_t v25 = v88;
    unint64_t v16 = v89;
    unint64_t v76 = v87;
    unint64_t v80 = v88;
    int64_t v81 = v31;
    if (v90)
    {
      unint64_t v32 = (v90 - 1) & v90;
      unint64_t v33 = __clz(__rbit64(v90)) | (v89 << 6);
      uint64_t v34 = v84;
LABEL_20:
      (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v14, *(void *)(v15 + 48) + v33 * v17, v34);
      v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
      v72(v14, 0, 1, v34);
      unint64_t v35 = v32;
LABEL_44:
      v77 = (uint64_t (**)(unint64_t, char *, uint64_t))v35;
      unint64_t v79 = v16;
      uint64_t v86 = v15;
      unint64_t v87 = v76;
      unint64_t v88 = v80;
      unint64_t v89 = v16;
      unint64_t v90 = v35;
      uint64_t v41 = v83;
      sub_2511B31BC((uint64_t)v14, v83);
      v78 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
      if (v78(v41, 1, v34) == 1)
      {
LABEL_82:
        sub_2511B3250((uint64_t)v14);
        sub_25112EB80();
        return sub_2511B3250(v83);
      }
      v77 = (uint64_t (**)(unint64_t, char *, uint64_t))(v4 + 32);
      v70 = (void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      uint64_t v71 = v4 + 56;
      v68 = (void (**)(char *, uint64_t))(v4 + 8);
      uint64_t v42 = v83;
      int64_t v43 = v81;
      v44 = v85;
      v73 = v9;
      while (1)
      {
        sub_2511B3250(v42);
        uint64_t v46 = *v1;
        unint64_t v47 = *(void *)(*v1 + 24);
        int64_t v48 = v47 >> 1;
        if ((uint64_t)(v47 >> 1) < v43 + 1)
        {
          uint64_t v46 = sub_2511C00AC(v47 > 1, v43 + 1, 1, *v1);
          unint64_t *v1 = v46;
          int64_t v48 = *(void *)(v46 + 24) >> 1;
        }
        sub_2511B31BC((uint64_t)v14, (uint64_t)v9);
        if (v78((uint64_t)v9, 1, v34) != 1) {
          break;
        }
LABEL_46:
        sub_2511B3250((uint64_t)v9);
        int64_t v45 = v43;
LABEL_47:
        *(void *)(*v1 + 16) = v45;
        uint64_t v42 = v83;
        sub_2511B31BC((uint64_t)v14, v83);
        if (v78(v42, 1, v34) == 1)
        {
          unint64_t v80 = v88;
          v77 = (uint64_t (**)(unint64_t, char *, uint64_t))v90;
          goto LABEL_82;
        }
      }
      unint64_t v76 = v46 + v82;
      v49 = *v77;
      if (v43 <= v48) {
        int64_t v45 = v48;
      }
      else {
        int64_t v45 = v43;
      }
      v74 = *v77;
      int64_t v75 = v45;
      while (1)
      {
        v55 = v44;
        v56 = v9;
        uint64_t v57 = v34;
        v58 = v44;
        int64_t v59 = v43;
        uint64_t v50 = v34;
        v60 = v49;
        v49((unint64_t)v55, v56, v57);
        if (v59 == v45)
        {
          (*v68)(v58, v50);
          uint64_t v34 = v50;
          int64_t v43 = v45;
          v44 = v58;
          unint64_t v9 = v73;
          goto LABEL_47;
        }
        sub_2511B3250((uint64_t)v14);
        int64_t v81 = v59;
        uint64_t result = v60(v76 + v59 * v17, v58, v50);
        uint64_t v53 = v86;
        int64_t v61 = v89;
        unint64_t v79 = v88;
        unint64_t v80 = v87;
        if (v90) {
          break;
        }
        uint64_t v69 = v86;
        int64_t v63 = v89 + 1;
        unint64_t v9 = v73;
        if (__OFADD__(v89, 1))
        {
          __break(1u);
          return result;
        }
        int64_t v64 = (v88 + 64) >> 6;
        if (v63 < v64)
        {
          unint64_t v65 = *(void *)(v87 + 8 * v63);
          if (v65) {
            goto LABEL_65;
          }
          int64_t v66 = v89 + 2;
          int64_t v61 = v89 + 1;
          if ((uint64_t)(v89 + 2) < v64)
          {
            unint64_t v65 = *(void *)(v87 + 8 * v66);
            if (v65) {
              goto LABEL_68;
            }
            int64_t v61 = v89 + 2;
            if ((uint64_t)(v89 + 3) < v64)
            {
              unint64_t v65 = *(void *)(v87 + 8 * (v89 + 3));
              if (v65)
              {
                int64_t v63 = v89 + 3;
                goto LABEL_65;
              }
              int64_t v66 = v89 + 4;
              int64_t v61 = v89 + 3;
              if ((uint64_t)(v89 + 4) < v64)
              {
                unint64_t v65 = *(void *)(v87 + 8 * v66);
                if (v65)
                {
LABEL_68:
                  int64_t v63 = v66;
                  goto LABEL_65;
                }
                int64_t v63 = v89 + 5;
                int64_t v61 = v89 + 4;
                uint64_t v50 = v84;
                if ((uint64_t)(v89 + 5) < v64)
                {
                  unint64_t v65 = *(void *)(v87 + 8 * v63);
                  if (!v65)
                  {
                    int64_t v61 = v64 - 1;
                    unint64_t v67 = v89 + 6;
                    do
                    {
                      if (v64 == v67)
                      {
                        uint64_t v50 = v84;
                        unint64_t v9 = v73;
                        goto LABEL_56;
                      }
                      unint64_t v65 = *(void *)(v87 + 8 * v67++);
                    }
                    while (!v65);
                    int64_t v63 = v67 - 1;
                    unint64_t v9 = v73;
                  }
LABEL_65:
                  unint64_t v51 = (v65 - 1) & v65;
                  unint64_t v62 = __clz(__rbit64(v65)) + (v63 << 6);
                  int64_t v61 = v63;
                  uint64_t v52 = v81;
                  uint64_t v53 = v69;
LABEL_61:
                  uint64_t v34 = v84;
                  (*v70)(v14, *(void *)(v53 + 48) + v62 * v17, v84);
                  v72(v14, 0, 1, v34);
                  goto LABEL_57;
                }
              }
            }
          }
        }
LABEL_56:
        v72(v14, 1, 1, v50);
        uint64_t v34 = v50;
        unint64_t v51 = 0;
        uint64_t v52 = v81;
        uint64_t v53 = v69;
LABEL_57:
        int64_t v43 = v52 + 1;
        uint64_t v86 = v53;
        unint64_t v87 = v80;
        unint64_t v88 = v79;
        unint64_t v89 = v61;
        unint64_t v90 = v51;
        sub_2511B31BC((uint64_t)v14, (uint64_t)v9);
        unsigned int v54 = v78((uint64_t)v9, 1, v34);
        v44 = v85;
        v49 = v74;
        int64_t v45 = v75;
        if (v54 == 1) {
          goto LABEL_46;
        }
      }
      unint64_t v51 = (v90 - 1) & v90;
      unint64_t v62 = __clz(__rbit64(v90)) | (v89 << 6);
      uint64_t v52 = v81;
      unint64_t v9 = v73;
      goto LABEL_61;
    }
LABEL_22:
    int64_t v36 = v16 + 1;
    uint64_t v34 = v84;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
LABEL_42:
      uint64_t v34 = v84;
      uint64_t v15 = v11;
      unint64_t v9 = v12;
    }
    else
    {
      int64_t v37 = (v25 + 64) >> 6;
      unint64_t v79 = v16;
      if (v36 < v37)
      {
        unint64_t v38 = *(void *)(v26 + 8 * v36);
        if (v38)
        {
LABEL_25:
          unint64_t v32 = (v38 - 1) & v38;
          unint64_t v33 = __clz(__rbit64(v38)) + (v36 << 6);
          unint64_t v16 = v36;
          goto LABEL_20;
        }
        unint64_t v39 = v16 + 2;
        unint64_t v79 = v16 + 1;
        if ((uint64_t)(v16 + 2) < v37)
        {
          BOOL v12 = v9;
          uint64_t v11 = v15;
          unint64_t v38 = *(void *)(v26 + 8 * v39);
          if (v38)
          {
LABEL_28:
            int64_t v36 = v39;
LABEL_29:
            uint64_t v34 = v84;
            goto LABEL_25;
          }
          unint64_t v79 = v16 + 2;
          uint64_t v34 = v84;
          if ((uint64_t)(v16 + 3) < v37)
          {
            unint64_t v38 = *(void *)(v76 + 8 * (v16 + 3));
            if (v38)
            {
              int64_t v36 = v16 + 3;
              goto LABEL_29;
            }
            unint64_t v39 = v16 + 4;
            unint64_t v79 = v16 + 3;
            uint64_t v34 = v84;
            if ((uint64_t)(v16 + 4) < v37)
            {
              unint64_t v38 = *(void *)(v76 + 8 * v39);
              if (v38) {
                goto LABEL_28;
              }
              int64_t v36 = v16 + 5;
              unint64_t v79 = v16 + 4;
              uint64_t v34 = v84;
              if ((uint64_t)(v16 + 5) < v37)
              {
                unint64_t v38 = *(void *)(v76 + 8 * v36);
                if (v38) {
                  goto LABEL_25;
                }
                unint64_t v79 = v37 - 1;
                unint64_t v40 = v16 + 6;
                do
                {
                  if (v37 == v40) {
                    goto LABEL_42;
                  }
                  unint64_t v38 = *(void *)(v76 + 8 * v40++);
                }
                while (!v38);
                int64_t v36 = v40 - 1;
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
    v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    v72(v14, 1, 1, v34);
    unint64_t v35 = 0;
    unint64_t v16 = v79;
    goto LABEL_44;
  }

  return sub_25112EB80();
}

uint64_t sub_2511B11E4(uint64_t a1)
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
  uint64_t v3 = sub_2511C0340(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511B1338(unint64_t a1)
{
  return sub_2511B1350(a1, (uint64_t (*)(uint64_t, void, unint64_t))sub_2511C5B90);
}

uint64_t sub_2511B1350(unint64_t a1, uint64_t (*a2)(uint64_t, void, unint64_t))
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2511C9AC0();
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
    uint64_t v7 = sub_2511C9AC0();
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
  *uint64_t v2 = v6;
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
    unint64_t v6 = MEMORY[0x2533971D0](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *uint64_t v2 = v6;
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
    uint64_t v11 = sub_2511C9AC0();
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

  return sub_2511C95C0();
}

uint64_t WorkEpoch.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  sub_2511B1978();
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 44) = 0;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v2;
  *(_WORD *)(v1 + 40) = 3;
  *(void *)(v0 + 16) = v1;
  return v0;
}

void WorkEpoch.priorityThreshold.setter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 11;
  os_unfair_lock_lock(v1 + 11);
  sub_2511450C4(v2);
  os_unfair_lock_unlock(v3);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> WorkEpoch.enqueue(_:environment:)(Swift::OpaquePointer _, Swift::OpaquePointer environment)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v2 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 11;
  os_unfair_lock_lock(v3 + 11);
  sub_25113A5C4(v4);
  os_unfair_lock_unlock(v5);
}

void WorkEpoch.enqueue(_:)()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 11;
  os_unfair_lock_lock(v1 + 11);
  sub_251144CB0(v2);
  os_unfair_lock_unlock(v3);
}

void WorkEpoch.finish(_:)(uint64_t a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 11;
  os_unfair_lock_lock(v3 + 11);
  sub_25113D9F8(v4, a1);
  os_unfair_lock_unlock(v5);
}

void WorkEpoch.pop()(uint64_t a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 11;
  os_unfair_lock_lock(v3 + 11);
  sub_251146818(v4, a1);

  os_unfair_lock_unlock(v5);
}

void WorkEpoch.finish()(void *a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v4 = (uint64_t *)&v3[4];
  uint64_t v5 = v3 + 11;
  os_unfair_lock_lock(v3 + 11);
  sub_251145034(v4, a1);
  os_unfair_lock_unlock(v5);
}

Swift::Void __swiftcall WorkEpoch.didUpdate(environmentalState:)(Swift::OpaquePointer environmentalState)
{
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v3 = v2 + 4;
  uint64_t v4 = v2 + 11;
  os_unfair_lock_lock(v2 + 11);
  sub_25114AD2C(v3);
  os_unfair_lock_unlock(v4);
}

uint64_t WorkEpoch.debugSnapshot.getter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (unsigned __int8 *)&v1[4];
  uint64_t v3 = v1 + 11;
  os_unfair_lock_lock(v1 + 11);
  sub_2511B1CE8(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

BOOL static WorkEpoch.Errors.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t WorkEpoch.Errors.hash(into:)()
{
  return sub_2511C9D50();
}

uint64_t WorkEpoch.Errors.hashValue.getter()
{
  return sub_2511C9D80();
}

uint64_t WorkEpoch.init()()
{
  sub_2511B1978();
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 44) = 0;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = v2;
  *(void *)(v1 + 32) = v2;
  *(_WORD *)(v1 + 40) = 3;
  *(void *)(v0 + 16) = v1;
  return v0;
}

void sub_2511B1978()
{
  if (!qword_26B218920)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_2511C99D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B218920);
    }
  }
}

uint64_t sub_2511B19D8@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(*(void *)(result + 16) + 16);
  return result;
}

void WorkEpoch.priorityThreshold.getter(unsigned char *a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 11;
  os_unfair_lock_lock(v3 + 11);
  sub_251156248(v4, a1);

  os_unfair_lock_unlock(v5);
}

void sub_2511B1A64(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)a1 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 11;
  os_unfair_lock_lock(v3 + 11);
  sub_251156248(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

void sub_2511B1AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)a2 + 16);
  uint64_t v3 = (uint64_t)&v2[4];
  uint64_t v4 = v2 + 11;
  os_unfair_lock_lock(v2 + 11);
  sub_25114AE24(v3);
  os_unfair_lock_unlock(v4);
}

void (*WorkEpoch.priorityThreshold.modify(os_unfair_lock_s **a1))(os_unfair_lock_s **a1)
{
  uint64_t v3 = a1 + 2;
  uint64_t v4 = *(os_unfair_lock_s **)(v1 + 16);
  *a1 = v4;
  uint64_t v5 = (uint64_t)&v4[4];
  char v6 = v4 + 11;
  os_unfair_lock_lock(v4 + 11);
  sub_251156248(v5, v3);
  a1[1] = 0;
  os_unfair_lock_unlock(v6);
  return sub_2511B1BD4;
}

void sub_2511B1BD4(os_unfair_lock_s **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = *a1 + 11;
  os_unfair_lock_lock(v2);
  sub_25114AE24((uint64_t)&v1[4]);
  os_unfair_lock_unlock(v2);
}

uint64_t WorkEpoch.deinit()
{
  swift_release();
  return v0;
}

void sub_2511B1C8C()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 11;
  os_unfair_lock_lock(v1 + 11);
  sub_2511B3338(v2);
  os_unfair_lock_unlock(v3);
}

void *sub_2511B1CE8@<X0>(unsigned __int8 *a1@<X0>, void *a2@<X8>)
{
  sub_2511B3158(0, (unint64_t *)&qword_26B2168A0, (uint64_t (*)(uint64_t))sub_25115A3E0, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  uint64_t v5 = (void *)inited;
  *(_OWORD *)(inited + 16) = xmmword_2511CB590;
  *(void *)(inited + 32) = 0x6574617473;
  *(void *)(inited + 40) = 0xE500000000000000;
  if (a1[25])
  {
    unint64_t v6 = 0xE800000000000000;
    uint64_t v7 = 0x64656873696E6966;
  }
  else
  {
    uint64_t v7 = 1852141679;
    if (*(void *)a1)
    {
      uint64_t v7 = 0x6465736F6C63;
      unint64_t v6 = 0xE600000000000000;
    }
    else
    {
      unint64_t v6 = 0xE400000000000000;
    }
  }
  unint64_t v8 = 0xEB00000000646569;
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = v6;
  *(void *)(inited + 64) = 0xD000000000000011;
  *(void *)(inited + 72) = 0x80000002511D20A0;
  int v9 = a1[24];
  uint64_t v10 = 0x6669636570736E75;
  unint64_t v11 = 0xEB00000000646569;
  switch(a1[24])
  {
    case 1u:
      unint64_t v11 = 0xE600000000000000;
      uint64_t v10 = 0x746E65677275;
      break;
    case 2u:
      uint64_t v10 = 0x616E65746E69616DLL;
      unint64_t v11 = 0xEB0000000065636ELL;
      break;
    case 3u:
      unint64_t v11 = 0xE700000000000000;
      uint64_t v10 = 0x64656B636F6C62;
      break;
    default:
      break;
  }
  *(void *)(inited + 80) = v10;
  *(void *)(inited + 88) = v11;
  *(void *)(inited + 96) = 0xD000000000000019;
  *(void *)(inited + 104) = 0x80000002511D2110;
  if (*(void *)a1 && *(unsigned char *)(*(void *)a1 + 40) != 4) {
    int v9 = *(unsigned __int8 *)(*(void *)a1 + 40);
  }
  uint64_t v12 = 0x6669636570736E75;
  switch(v9)
  {
    case 0:
      break;
    case 1:
      unint64_t v8 = 0xE600000000000000;
      uint64_t v12 = 0x746E65677275;
      break;
    case 2:
      uint64_t v12 = 0x616E65746E69616DLL;
      unint64_t v8 = 0xEB0000000065636ELL;
      break;
    case 3:
      unint64_t v8 = 0xE700000000000000;
      uint64_t v12 = 0x64656B636F6C62;
      break;
    default:
      JUMPOUT(0);
  }
  *(void *)(inited + 112) = v12;
  *(void *)(inited + 120) = v8;
  strcpy((char *)(inited + 128), "pendingCount");
  *(unsigned char *)(inited + 141) = 0;
  *(_WORD *)(inited + 142) = -5120;
  *(void *)(inited + 144) = sub_2511C9C50();
  v5[19] = v13;
  v5[20] = 0x6F43657669746361;
  v5[21] = 0xEB00000000746E75;
  v5[22] = sub_2511C9C50();
  v5[23] = v14;
  unint64_t v15 = sub_251148A20((uint64_t)v5);
  unint64_t v16 = sub_251153530(MEMORY[0x263F8EE78]);
  type metadata accessor for DebugSnapshot();
  uint64_t result = (void *)swift_allocObject();
  result[2] = 0x6F7045206B726F57;
  result[3] = 0xEA00000000006863;
  result[4] = v15;
  result[5] = v16;
  *a2 = result;
  return result;
}

unint64_t sub_2511B2054()
{
  unint64_t result = qword_269B227E0;
  if (!qword_269B227E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B227E0);
  }
  return result;
}

uint64_t sub_2511B20A8()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)v0 + 16);
  uint64_t v2 = (unsigned __int8 *)&v1[4];
  uint64_t v3 = v1 + 11;
  os_unfair_lock_lock(v1 + 11);
  sub_2511B1CE8(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t method lookup function for WorkEpoch(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WorkEpoch);
}

uint64_t dispatch thunk of WorkEpoch.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

unsigned char *storeEnumTagSinglePayload for WorkEpoch.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 4;
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
        JUMPOUT(0x2511B220CLL);
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
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkEpoch.Errors()
{
  return &type metadata for WorkEpoch.Errors;
}

uint64_t destroy for WorkEpoch.Result()
{
  swift_release();

  return swift_bridgeObjectRelease();
}

void *_s19HealthOrchestration9WorkEpochC6ResultVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WorkEpoch.Result(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for WorkEpoch.Result(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for WorkEpoch.Result()
{
  return &type metadata for WorkEpoch.Result;
}

uint64_t initializeWithCopy for WorkEpoch.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorkEpoch.State(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

uint64_t assignWithTake for WorkEpoch.State(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkEpoch.State(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 26)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkEpoch.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 26) = 1;
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
    *(unsigned char *)(result + 26) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkEpoch.State()
{
  return &type metadata for WorkEpoch.State;
}

uint64_t sub_2511B2558(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  unsigned int v6 = a2;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 216;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 216;
  unint64_t v35 = __src;
  uint64_t v34 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -215)
    {
      if (__dst != a2 || &a2[216 * v11] <= __dst) {
        memmove(__dst, a2, 216 * v11);
      }
      int64_t v20 = &v4[216 * v11];
      unint64_t v33 = (unint64_t)v20;
      unint64_t v35 = v6;
      if (__src < v6 && v10 >= 216)
      {
        int64_t v21 = (char *)(a3 - 216);
        do
        {
          sub_251146D6C((uint64_t)(v20 - 216), (uint64_t)v31);
          unint64_t v22 = (unint64_t)(v6 - 216);
          sub_251146D6C((uint64_t)(v6 - 216), (uint64_t)v29);
          unint64_t v23 = qword_2511CF618[v31[0]];
          unint64_t v24 = qword_2511CF618[v29[0]];
          BOOL v25 = v23 < v24 || v24 >= v23 && v32 < v30;
          unint64_t v26 = v21 + 216;
          sub_251146EDC((uint64_t)v29);
          sub_251146EDC((uint64_t)v31);
          if (v25)
          {
            if (v26 != v6 || v21 >= v6) {
              memmove(v21, v6 - 216, 0xD8uLL);
            }
            v35 -= 216;
            int64_t v20 = (char *)v33;
            if (v33 <= (unint64_t)v4) {
              break;
            }
          }
          else
          {
            unint64_t v27 = v33;
            int64_t v20 = (char *)(v33 - 216);
            v33 -= 216;
            if ((unint64_t)v26 < v27 || (unint64_t)v21 >= v27 || v26 != (char *)v27) {
              memmove(v21, (const void *)(v27 - 216), 0xD8uLL);
            }
            unint64_t v22 = (unint64_t)v6;
            if (v20 <= v4) {
              break;
            }
          }
          v21 -= 216;
          unsigned int v6 = (char *)v22;
        }
        while (v22 > (unint64_t)__src);
      }
LABEL_49:
      sub_2511B2E1C((void **)&v35, (const void **)&v34, &v33);
      return 1;
    }
  }
  else if (v8 >= -215)
  {
    if (__dst != __src || &__src[216 * v9] <= __dst) {
      memmove(__dst, __src, 216 * v9);
    }
    unint64_t v12 = (unint64_t)&v4[216 * v9];
    unint64_t v33 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 216)
    {
      while (1)
      {
        sub_251146D6C((uint64_t)v6, (uint64_t)v31);
        sub_251146D6C((uint64_t)v4, (uint64_t)v29);
        unint64_t v13 = qword_2511CF618[v31[0]];
        unint64_t v14 = qword_2511CF618[v29[0]];
        if (v13 >= v14)
        {
          if (v14 < v13)
          {
            sub_251146EDC((uint64_t)v29);
            sub_251146EDC((uint64_t)v31);
LABEL_17:
            unint64_t v15 = v35;
            BOOL v19 = v34 + 216;
            if (v35 != v34 || v35 >= v19) {
              memmove(v35, v34, 0xD8uLL);
            }
            uint64_t v34 = v19;
            unint64_t v16 = (unint64_t)v6;
            goto LABEL_22;
          }
          double v17 = v32;
          double v18 = v30;
          sub_251146EDC((uint64_t)v29);
          sub_251146EDC((uint64_t)v31);
          if (v17 >= v18) {
            goto LABEL_17;
          }
        }
        else
        {
          sub_251146EDC((uint64_t)v29);
          sub_251146EDC((uint64_t)v31);
        }
        unint64_t v15 = v35;
        unint64_t v16 = (unint64_t)(v6 + 216);
        if (v35 >= v6 && (unint64_t)v35 < v16 && v35 == v6) {
          unint64_t v15 = v6;
        }
        else {
          memmove(v35, v6, 0xD8uLL);
        }
LABEL_22:
        unint64_t v35 = v15 + 216;
        uint64_t v4 = v34;
        if ((unint64_t)v34 < v12)
        {
          unsigned int v6 = (char *)v16;
          if (v16 < a3) {
            continue;
          }
        }
        goto LABEL_49;
      }
    }
    goto LABEL_49;
  }
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

char *sub_2511B2920(char *result, int64_t a2, char a3, char *a4)
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
    sub_2511B3158(0, &qword_26B2189D8, (uint64_t (*)(uint64_t))sub_2511B3030, MEMORY[0x263F8E0F8]);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2511B2A48(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_2511C9B10();
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

char *sub_2511B2B04(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 31;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -32)
  {
    uint64_t result = (char *)sub_2511C9B10();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 5;
    if (result != v3 || result >= &v3[32 * v7])
    {
      return (char *)memmove(result, v3, 32 * v7);
    }
  }
  return result;
}

char *sub_2511B2BC0(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_2511C9B10();
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

char *sub_2511B2C80(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -48)
  {
    uint64_t result = (char *)sub_2511C9B10();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 48;
    if (result != v3 || result >= &v3[48 * v6])
    {
      return (char *)memmove(result, v3, 48 * v6);
    }
  }
  return result;
}

char *sub_2511B2D50(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -40)
  {
    uint64_t result = (char *)sub_2511C9B10();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 40;
    if (result != v3 || result >= &v3[40 * v6])
    {
      return (char *)memmove(result, v3, 40 * v6);
    }
  }
  return result;
}

char *sub_2511B2E1C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -216)
  {
    uint64_t result = (char *)sub_2511C9B10();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 216;
    if (result != v3 || result >= &v3[216 * v6])
    {
      return (char *)memmove(result, v3, 216 * v6);
    }
  }
  return result;
}

char *sub_2511B2EF0(uint64_t a1)
{
  return sub_2511B2920(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2511B2F04(uint64_t a1)
{
  return sub_251141AB4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2511B2F18(void *a1)
{
  return sub_25116B938(0, a1[2], 0, a1);
}

uint64_t sub_2511B2F2C(uint64_t a1)
{
  return sub_25116BC7C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_2511B2F40()
{
}

uint64_t sub_2511B2F54(uint64_t a1)
{
  return sub_25116C334(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2511B2F68(uint64_t a1)
{
  return sub_25116C4DC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2511B2F7C(uint64_t a1)
{
  return sub_251130724(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2511B2F90(void *a1)
{
  return sub_25116C150(0, a1[2], 0, a1);
}

uint64_t sub_2511B2FD4(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_2511B3030()
{
  if (!qword_26B2189D0)
  {
    unint64_t v0 = sub_2511C9730();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2189D0);
    }
  }
}

unint64_t sub_2511B3090()
{
  unint64_t result = qword_269B227E8;
  if (!qword_269B227E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B227E8);
  }
  return result;
}

void sub_2511B30F4()
{
  if (!qword_26B2189E0)
  {
    sub_25114647C();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26B2189E0);
    }
  }
}

void sub_2511B3158(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2511B31BC(uint64_t a1, uint64_t a2)
{
  sub_2511B3158(0, &qword_269B21F98, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2511B3250(uint64_t a1)
{
  sub_2511B3158(0, &qword_269B21F98, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2511B32DC()
{
  unint64_t result = qword_26B216860;
  if (!qword_26B216860)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B216860);
  }
  return result;
}

uint64_t sub_2511B3338(unsigned char *a1)
{
  return sub_25114AD2C(a1);
}

uint64_t dispatch thunk of WorkContext.contextDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of WorkContext.logger.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ContextProviderDelegate.didUpdate(contexts:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ContextProvider.context(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ContextProvider.start(delegate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of ContextProvider.stop()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t OptionalValueAnchor.init(identifier:value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)a3 = *(void *)a1;
  *(void *)(a3 + 8) = v4;
  *(_OWORD *)(a3 + 16) = *(_OWORD *)(a1 + 16);
  uint64_t v5 = a3 + *(int *)(type metadata accessor for OptionalValueAnchor() + 52);
  uint64_t v6 = sub_2511C9890();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a2, v6);
}

uint64_t OptionalValueAnchor.identifier.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v3 = v1[3];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v3;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t OptionalValueAnchor.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  uint64_t v5 = sub_2511C9890();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t OptionalValueAnchor.hasDifference(from:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v59 = *(void *)(*(void *)(a3 + 16) - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v53 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = v6;
  uint64_t v7 = sub_2511C9890();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v55 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v56 = TupleTypeMetadata2;
  uint64_t v9 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  v58 = (char *)&v52 - v10;
  uint64_t v61 = v7;
  uint64_t v11 = *(void *)(v7 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  unint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  unsigned int v54 = (char *)&v52 - v16;
  MEMORY[0x270FA5388](v15);
  double v18 = (char *)&v52 - v17;
  uint64_t v19 = sub_2511C9890();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  unint64_t v23 = (char *)&v52 - v22;
  uint64_t v24 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v21);
  unint64_t v26 = (char *)&v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, a1, v19);
  unint64_t v27 = (void (**)(char *))(v11 + 16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v23, 1, a3) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v26, v23, a3);
    double v30 = *v27;
    uint64_t v31 = v61;
    ((void (*)(char *, char *, uint64_t))*v27)(v18, &v57[*(int *)(a3 + 52)], v61);
    double v32 = &v26[*(int *)(a3 + 52)];
    unint64_t v33 = v58;
    uint64_t v34 = v18;
    unint64_t v35 = &v58[*(int *)(v56 + 48)];
    uint64_t v52 = v34;
    v30(v58);
    uint64_t v57 = v35;
    ((void (*)(char *, char *, uint64_t))v30)(v35, v32, v31);
    int64_t v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48);
    if (v36(v33, 1, v60) == 1)
    {
      int64_t v37 = v58;
      unint64_t v38 = *(void (**)(char *, uint64_t))(v11 + 8);
      v38(v52, v61);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, a3);
      if (v36(v57, 1, v60) == 1)
      {
        v38(v37, v61);
        char v29 = 0;
        return v29 & 1;
      }
    }
    else
    {
      unint64_t v39 = v52;
      unint64_t v40 = v54;
      ((void (*)(char *, char *, uint64_t))v30)(v54, v58, v61);
      uint64_t v41 = v57;
      if (v36(v57, 1, v60) != 1)
      {
        uint64_t v42 = v59;
        int64_t v43 = v53;
        v44 = v41;
        uint64_t v45 = v60;
        (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v53, v44, v60);
        LODWORD(v57) = sub_2511C9470();
        uint64_t v46 = v40;
        unint64_t v47 = *(void (**)(char *, uint64_t))(v42 + 8);
        v47(v43, v45);
        int64_t v48 = *(void (**)(char *, uint64_t))(v11 + 8);
        v49 = v39;
        uint64_t v50 = v61;
        v48(v49, v61);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v26, a3);
        v47(v46, v45);
        v48(v58, v50);
        char v29 = v57 ^ 1;
        return v29 & 1;
      }
      int64_t v37 = v58;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v39, v61);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, a3);
      (*(void (**)(char *, uint64_t))(v59 + 8))(v40, v60);
    }
    (*(void (**)(char *, uint64_t))(v55 + 8))(v37, v56);
    char v29 = 1;
    return v29 & 1;
  }
  (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
  uint64_t v28 = v61;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, &v57[*(int *)(a3 + 52)], v61);
  char v29 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v14, 1, v60) != 1;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v28);
  return v29 & 1;
}

uint64_t OptionalValueAnchor.merged(with:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16))(a2, v2, a1);
}

uint64_t sub_2511B3BCC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_2511B3C20(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t OptionalValueAnchor.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  long long v5 = *(_OWORD *)(a2 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  v14[1] = a2;
  long long v15 = v6;
  long long v16 = v5;
  long long v18 = v5;
  long long v19 = v6;
  type metadata accessor for OptionalValueAnchor.CodingKeys();
  swift_getWitnessTable();
  uint64_t v7 = sub_2511C9C20();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v14 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511C9DA0();
  uint64_t v11 = *(void *)(v3 + 8);
  *(void *)&long long v18 = *(void *)v3;
  *((void *)&v18 + 1) = v11;
  long long v19 = *(_OWORD *)(v3 + 16);
  char v20 = 0;
  sub_2511512C4();
  uint64_t v12 = v17;
  sub_2511C9C00();
  if (!v12)
  {
    LOBYTE(v18) = 1;
    sub_2511C9BC0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t type metadata accessor for OptionalValueAnchor.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t OptionalValueAnchor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v28 = a6;
  uint64_t v11 = sub_2511C9890();
  uint64_t v26 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v31 = (char *)&v25 - v12;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  *(void *)&long long v39 = a4;
  *((void *)&v39 + 1) = a5;
  type metadata accessor for OptionalValueAnchor.CodingKeys();
  swift_getWitnessTable();
  uint64_t v35 = sub_2511C9BA0();
  uint64_t v30 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  unint64_t v14 = (char *)&v25 - v13;
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  *(void *)&long long v39 = a4;
  *((void *)&v39 + 1) = a5;
  uint64_t v15 = type metadata accessor for OptionalValueAnchor();
  uint64_t v29 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v25 - v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v34 = v14;
  uint64_t v18 = (uint64_t)v36;
  sub_2511C9D90();
  if (v18) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v20 = v29;
  uint64_t v19 = v30;
  int64_t v36 = a1;
  uint64_t v25 = v15;
  uint64_t v21 = v31;
  char v40 = 0;
  sub_251150F3C();
  sub_2511C9B90();
  uint64_t v22 = v38;
  *(void *)uint64_t v17 = v37;
  *((void *)v17 + 1) = v22;
  *((_OWORD *)v17 + 1) = v39;
  LOBYTE(v37) = 1;
  sub_2511C9B50();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v34, v35);
  uint64_t v23 = v25;
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(&v17[*(int *)(v25 + 52)], v21, v27);
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 16))(v28, v17, v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v17, v23);
}

uint64_t sub_2511B4220(void *a1)
{
  a1[1] = swift_getWitnessTable();
  a1[2] = swift_getWitnessTable();
  uint64_t result = swift_getWitnessTable();
  a1[3] = result;
  return result;
}

uint64_t sub_2511B42A0@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return OptionalValueAnchor.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a3);
}

uint64_t sub_2511B42C4(void *a1, uint64_t a2)
{
  return OptionalValueAnchor.encode(to:)(a1, a2);
}

uint64_t sub_2511B42DC()
{
  uint64_t result = sub_2511C9890();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_2511B4378(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (void *)(((unint64_t)a1 + v8 + 32) & ~v8);
  uint64_t v10 = (void *)(((unint64_t)a2 + v8 + 32) & ~v8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v12 = v11(v9, 1, v6);
  int v13 = v11(v10, 1, v6);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v9, v10, v6);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
      return a1;
    }
    int v14 = *(_DWORD *)(v7 + 84);
    size_t v15 = *(void *)(v7 + 64);
  }
  else
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(v9, v10, v6);
      return a1;
    }
    uint64_t v17 = *(void (**)(void *, uint64_t))(v7 + 8);
    uint64_t v16 = v7 + 8;
    v17(v9, v6);
    int v14 = *(_DWORD *)(v16 + 76);
    size_t v15 = *(void *)(v16 + 56);
  }
  if (v14) {
    size_t v18 = v15;
  }
  else {
    size_t v18 = v15 + 1;
  }
  memcpy(v9, v10, v18);
  return a1;
}

_OWORD *sub_2511B4530(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (void *)(((unint64_t)a1 + v7 + 32) & ~v7);
  uint64_t v9 = (const void *)(((unint64_t)a2 + v7 + 32) & ~v7);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(v9, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v10 = *(void *)(v6 + 64);
    }
    else {
      size_t v10 = *(void *)(v6 + 64) + 1;
    }
    memcpy(v8, v9, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v8, v9, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v8, 0, 1, v5);
  }
  return a1;
}

void *sub_2511B464C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (void *)(((unint64_t)a1 + v10 + 32) & ~v10);
  int v12 = (void *)(((unint64_t)a2 + v10 + 32) & ~v10);
  int v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v9 + 48);
  int v14 = v13(v11, 1, v8);
  int v15 = v13(v12, 1, v8);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v9 + 32))(v11, v12, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v11, 0, 1, v8);
      return a1;
    }
    int v16 = *(_DWORD *)(v9 + 84);
    size_t v17 = *(void *)(v9 + 64);
  }
  else
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v9 + 40))(v11, v12, v8);
      return a1;
    }
    uint64_t v19 = *(void (**)(void *, uint64_t))(v9 + 8);
    uint64_t v18 = v9 + 8;
    v19(v11, v8);
    int v16 = *(_DWORD *)(v18 + 76);
    size_t v17 = *(void *)(v18 + 56);
  }
  if (v16) {
    size_t v20 = v17;
  }
  else {
    size_t v20 = v17 + 1;
  }
  memcpy(v11, v12, v20);
  return a1;
}

uint64_t sub_2511B47E4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  int v5 = *(_DWORD *)(v4 + 84);
  if (v5) {
    unsigned int v6 = v5 - 1;
  }
  else {
    unsigned int v6 = 0;
  }
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v9;
  }
  if (!a2) {
    return 0;
  }
  int v10 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_28;
  }
  uint64_t v11 = v9 + ((v8 + 32) & ~v8);
  char v12 = 8 * v11;
  if (v11 <= 3)
  {
    unsigned int v15 = ((v10 + ~(-1 << v12)) >> v12) + 1;
    if (HIWORD(v15))
    {
      int v13 = *(_DWORD *)((char *)a1 + v11);
      if (!v13) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    if (v15 > 0xFF)
    {
      int v13 = *(unsigned __int16 *)((char *)a1 + v11);
      if (!*(unsigned __int16 *)((char *)a1 + v11)) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    if (v15 < 2)
    {
LABEL_28:
      if ((v6 & 0x80000000) != 0)
      {
        unsigned int v18 = (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v8 + 32) & ~v8);
        if (v18 >= 2) {
          return v18 - 1;
        }
        else {
          return 0;
        }
      }
      else
      {
        unint64_t v17 = *((void *)a1 + 1);
        if (v17 >= 0xFFFFFFFF) {
          LODWORD(v17) = -1;
        }
        return (v17 + 1);
      }
    }
  }
  int v13 = *((unsigned __int8 *)a1 + v11);
  if (!*((unsigned char *)a1 + v11)) {
    goto LABEL_28;
  }
LABEL_20:
  int v16 = (v13 - 1) << v12;
  if (v11 > 3) {
    int v16 = 0;
  }
  if (v11)
  {
    if (v11 > 3) {
      LODWORD(v11) = 4;
    }
    switch((int)v11)
    {
      case 2:
        LODWORD(v11) = *a1;
        break;
      case 3:
        LODWORD(v11) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v11) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v11) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v11 | v16) + 1;
}

unsigned char *sub_2511B49F8(unsigned char *result, unsigned int a2, unsigned int a3)
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
    char *result = a2 + 1;
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
        JUMPOUT(0x2511B4AC4);
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
          char *result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_2511B4AEC()
{
  return swift_getWitnessTable();
}

uint64_t sub_2511B4B08()
{
  return swift_getWitnessTable();
}

uint64_t sub_2511B4B24()
{
  return swift_getWitnessTable();
}

uint64_t MockDispatchTarget.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  sub_2511B4E34();
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 32) = 0;
  *(void *)(v1 + 16) = sub_2511B4DE0;
  *(void *)(v1 + 24) = 0;
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t MockDispatchTarget.init()()
{
  sub_2511B4E34();
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 32) = 0;
  *(void *)(v1 + 16) = sub_2511B4DE0;
  *(void *)(v1 + 24) = 0;
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t MockDispatchTarget.run(_:for:context:completion:)(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v17 = a2[1];
  long long v18 = *a2;
  uint64_t v12 = *((void *)a2 + 4);
  uint64_t v11 = *((void *)a2 + 5);
  swift_beginAccess();
  uint64_t v13 = *(void *)(v6 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v13 + 32));
  sub_251173C38((uint64_t *)(v13 + 16), v22);
  os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 32));
  int v14 = *(void (**)(uint64_t, _OWORD *, void *, void *))&v22[0];
  swift_release();
  v22[0] = v18;
  v22[1] = v17;
  uint64_t v23 = v12;
  uint64_t v24 = v11;
  v21[0] = a3;
  v21[1] = a4;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a5;
  *(void *)(v15 + 24) = a6;
  v20[0] = sub_25118CE5C;
  v20[1] = v15;
  swift_retain();
  v14(a1, v22, v21, v20);
  swift_release();
  return swift_release();
}

uint64_t (*MockDispatchTarget.runHandler.getter())(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
  sub_251173C38((uint64_t *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  long long v3 = v4;
  swift_release();
  *(_OWORD *)(swift_allocObject() + 16) = v3;
  return sub_2511B5584;
}

uint64_t sub_2511B4DE0(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(uint64_t *))
{
  long long v4 = *a4;
  uint64_t v6 = 0;
  swift_retain();
  v4(&v6);

  return swift_release();
}

void sub_2511B4E34()
{
  if (!qword_269B227F0)
  {
    sub_2511B4E9C();
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_2511C99D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B227F0);
    }
  }
}

unint64_t sub_2511B4E9C()
{
  unint64_t result = qword_269B227F8;
  if (!qword_269B227F8)
  {
    sub_251131944(255, (unint64_t *)&qword_26B217E58);
    sub_251131944(255, (unint64_t *)&qword_26B216848);
    sub_2511B4F48();
    unint64_t result = swift_getFunctionTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269B227F8);
  }
  return result;
}

unint64_t sub_2511B4F48()
{
  unint64_t result = qword_269B22800;
  if (!qword_269B22800)
  {
    sub_2511B4F9C();
    unint64_t result = swift_getFunctionTypeMetadata1();
    atomic_store(result, (unint64_t *)&qword_269B22800);
  }
  return result;
}

void sub_2511B4F9C()
{
  if (!qword_269B22808)
  {
    sub_2511B4FF4();
    unint64_t v0 = sub_2511C9890();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B22808);
    }
  }
}

unint64_t sub_2511B4FF4()
{
  unint64_t result = qword_269B22810;
  if (!qword_269B22810)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B22810);
  }
  return result;
}

uint64_t sub_2511B5034(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t a1), uint64_t))
{
  uint64_t v8 = *a3;
  uint64_t v9 = a3[1];
  uint64_t v11 = *a4;
  uint64_t v10 = a4[1];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v10;
  swift_retain();
  a5(a1, a2, v8, v9, sub_2511B56B0, v12);

  return swift_release();
}

uint64_t sub_2511B50F0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  swift_retain();
  sub_2511B558C((uint64_t)sub_2511B570C, v3);

  return swift_release();
}

uint64_t sub_2511B5174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, void *, void *))
{
  v15[0] = a3;
  v15[1] = a4;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a5;
  *(void *)(v12 + 24) = a6;
  v14[0] = sub_2511B56E8;
  v14[1] = v12;
  swift_retain();
  a7(a1, a2, v15, v14);

  return swift_release();
}

uint64_t MockDispatchTarget.runHandler.setter(uint64_t a1, uint64_t a2)
{
  sub_2511B558C(a1, a2);

  return swift_release();
}

void (*MockDispatchTarget.runHandler.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[7] = v1;
  swift_beginAccess();
  long long v4 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v5 = (uint64_t *)&v4[4];
  uint64_t v6 = v4 + 8;
  os_unfair_lock_lock(v4 + 8);
  sub_251173C38(v5, &v10);
  v3[8] = 0;
  os_unfair_lock_unlock(v6);
  long long v9 = v10;
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = v9;
  v3[3] = sub_2511B570C;
  v3[4] = v7;
  return sub_2511B5350;
}

void sub_2511B5350(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v4 = *(void *)(*(void *)a1 + 32);
  if (a2)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    v2[5] = sub_2511B5650;
    v2[6] = v5;
    MEMORY[0x270FA5388](v5);
    uint64_t v7 = (void *)(v6 + 16);
    uint64_t v8 = (os_unfair_lock_s *)(v6 + 32);
    swift_retain();
    os_unfair_lock_lock(v8);
    sub_251173D5C(v7);
    os_unfair_lock_unlock(v8);
    swift_release();
  }
  else
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v3;
    *(void *)(v9 + 24) = v4;
    v2[5] = sub_2511B5710;
    v2[6] = v9;
    MEMORY[0x270FA5388](v9);
    uint64_t v11 = v10 + 4;
    uint64_t v12 = v10 + 8;
    os_unfair_lock_lock(v10 + 8);
    sub_251173D5C(v11);
    os_unfair_lock_unlock(v12);
  }
  swift_release();
  swift_endAccess();
  free(v2);
}

uint64_t MockDispatchTarget.deinit()
{
  swift_release();
  return v0;
}

uint64_t MockDispatchTarget.__deallocating_deinit()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_2511B5528(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MockDispatchTarget.run(_:for:context:completion:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_2511B554C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2511B5584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_2511B5174(a1, a2, a3, a4, a5, a6, *(void (**)(uint64_t, uint64_t, void *, void *))(v6 + 16));
}

uint64_t sub_2511B558C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_beginAccess();
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = (void *)(v6 + 16);
  uint64_t v8 = (os_unfair_lock_s *)(v6 + 32);
  swift_retain();
  os_unfair_lock_lock(v8);
  sub_251173D5C(v7);
  os_unfair_lock_unlock(v8);
  swift_release();
  return swift_endAccess();
}

uint64_t sub_2511B5650(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  return sub_2511B5034(a1, a2, a3, a4, *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t))(v4 + 16));
}

uint64_t type metadata accessor for MockDispatchTarget()
{
  return self;
}

uint64_t method lookup function for MockDispatchTarget(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MockDispatchTarget);
}

uint64_t dispatch thunk of MockDispatchTarget.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2511B56B0(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

BOOL static WorkPlanIdentifier.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return v2 == v3;
  }
  char v5 = sub_2511C9CA0();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

uint64_t WorkPlanIdentifier.domain.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*WorkPlanIdentifier.domain.modify())()
{
  return nullsub_1;
}

uint64_t WorkPlanIdentifier.code.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*WorkPlanIdentifier.code.modify())()
{
  return nullsub_1;
}

void static WorkPlanIdentifier.singleWorkPlanIdentifier.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 15) = -18;
  *(void *)(a1 + 16) = 0;
}

uint64_t WorkPlanIdentifier.hash(into:)()
{
  return sub_2511C9D50();
}

uint64_t sub_2511B5878()
{
  if (*v0) {
    return 1701080931;
  }
  else {
    return 0x6E69616D6F64;
  }
}

uint64_t sub_2511B58A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2511B642C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2511B58D0(uint64_t a1)
{
  unint64_t v2 = sub_2511B5AD0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2511B590C(uint64_t a1)
{
  unint64_t v2 = sub_2511B5AD0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WorkPlanIdentifier.encode(to:)(void *a1)
{
  sub_2511B5EFC(0, &qword_269B22818, MEMORY[0x263F8E0C0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v10 - v6;
  v10[0] = *(void *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511B5AD0();
  sub_2511C9DA0();
  char v12 = 0;
  uint64_t v8 = v10[1];
  sub_2511C9BD0();
  if (!v8)
  {
    char v11 = 1;
    sub_2511C9BF0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2511B5AD0()
{
  unint64_t result = qword_269B22820;
  if (!qword_269B22820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22820);
  }
  return result;
}

uint64_t WorkPlanIdentifier.hashValue.getter()
{
  return sub_2511C9D80();
}

uint64_t WorkPlanIdentifier.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2511B5EFC(0, &qword_269B22828, MEMORY[0x263F8E040]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v15 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511B5AD0();
  sub_2511C9D90();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v17 = 0;
  uint64_t v10 = sub_2511C9B60();
  uint64_t v12 = v11;
  char v16 = 1;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_2511C9B80();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2511B5D8C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return WorkPlanIdentifier.init(from:)(a1, a2);
}

uint64_t sub_2511B5DA4(void *a1)
{
  return WorkPlanIdentifier.encode(to:)(a1);
}

uint64_t sub_2511B5DBC()
{
  return sub_2511C9D80();
}

uint64_t sub_2511B5E30()
{
  return sub_2511C9D50();
}

uint64_t sub_2511B5E8C()
{
  return sub_2511C9D80();
}

void sub_2511B5EFC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_2511B5AD0();
    unint64_t v7 = a3(a1, &type metadata for WorkPlanIdentifier.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

BOOL sub_2511B5F60(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return v2 == v3;
  }
  char v5 = sub_2511C9CA0();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

uint64_t WorkPlanIdentifier.description.getter()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  sub_2511C9520();
  sub_2511C9C50();
  sub_2511C9520();
  swift_bridgeObjectRelease();
  sub_2511C9520();
  return v2;
}

unint64_t sub_2511B6048()
{
  unint64_t result = qword_26B217B18[0];
  if (!qword_26B217B18[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B217B18);
  }
  return result;
}

void *sub_2511B60A0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WorkPlanIdentifier(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for WorkPlanIdentifier(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkPlanIdentifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkPlanIdentifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

uint64_t dispatch thunk of WorkPlan.priority.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of WorkPlan.merged(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

unsigned char *storeEnumTagSinglePayload for WorkPlanIdentifier.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    char *result = a2 + 1;
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
        JUMPOUT(0x2511B62ECLL);
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
          char *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkPlanIdentifier.CodingKeys()
{
  return &type metadata for WorkPlanIdentifier.CodingKeys;
}

unint64_t sub_2511B6328()
{
  unint64_t result = qword_269B22830;
  if (!qword_269B22830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22830);
  }
  return result;
}

unint64_t sub_2511B6380()
{
  unint64_t result = qword_269B22838;
  if (!qword_269B22838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22838);
  }
  return result;
}

unint64_t sub_2511B63D8()
{
  unint64_t result = qword_269B22840;
  if (!qword_269B22840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22840);
  }
  return result;
}

uint64_t sub_2511B642C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000;
  if (v2 || (sub_2511C9CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701080931 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2511C9CA0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t MultiDispatcher.__allocating_init(target:width:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  MultiDispatcher.init(target:width:)(a1, a2);
  return v4;
}

uint64_t MultiDispatcher.init(target:width:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v17 = a2;
  uint64_t v15 = a1;
  uint64_t v16 = sub_2511C97B0();
  uint64_t v5 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2511C97A0();
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = sub_2511C9390();
  MEMORY[0x270FA5388](v9 - 8);
  sub_25112FD4C(a1, v2 + 16);
  v14[1] = sub_251155968();
  sub_2511C9380();
  uint64_t v10 = (uint64_t (*)(uint64_t))MEMORY[0x263F8F0F8];
  sub_251147CB8(0, (unint64_t *)&unk_26B2189A0, MEMORY[0x263F8F0F8], MEMORY[0x263F8E0F8]);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_2511CB450;
  sub_2511C9790();
  uint64_t v18 = v11;
  sub_251148424((unint64_t *)&qword_26B217F90, MEMORY[0x263F8F0F8]);
  sub_251147CB8(0, (unint64_t *)&qword_26B217F30, v10, MEMORY[0x263F8D488]);
  sub_251148378((unint64_t *)&qword_26B217F40, (unint64_t *)&qword_26B217F30, v10);
  sub_2511C9900();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F130], v16);
  *(void *)(v2 + 56) = sub_2511C97D0();
  sub_2511B68AC();
  uint64_t v12 = swift_allocObject();
  *(_DWORD *)(v12 + 36) = 0;
  *(void *)(v12 + 16) = v17;
  *(void *)(v12 + 24) = 0;
  *(unsigned char *)(v12 + 32) = 0;
  __swift_destroy_boxed_opaque_existential_1(v15);
  *(void *)(v3 + 64) = v12;
  return v3;
}

void sub_2511B68AC()
{
  if (!qword_26B218908)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_2511C99D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B218908);
    }
  }
}

uint64_t MultiDispatcher.width.getter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 64);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 9;
  os_unfair_lock_lock(v1 + 9);
  sub_25119A144(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

void sub_2511B6970(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)a1 + 64);
  uint64_t v4 = v3 + 4;
  uint64_t v5 = v3 + 9;
  os_unfair_lock_lock(v3 + 9);
  sub_25119A144(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

void sub_2511B69DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)a2 + 64);
  uint64_t v3 = v2 + 4;
  uint64_t v4 = v2 + 9;
  os_unfair_lock_lock(v2 + 9);
  sub_2511B6EB8(v3);
  os_unfair_lock_unlock(v4);
}

void MultiDispatcher.width.setter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 64);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 9;
  os_unfair_lock_lock(v1 + 9);
  sub_2511B6A9C(v2);
  os_unfair_lock_unlock(v3);
}

void *sub_2511B6A9C(void *result)
{
  char *result = *(void *)(v1 + 16);
  return result;
}

void (*MultiDispatcher.width.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 64);
  a1[1] = v3;
  uint64_t v4 = v3 + 4;
  uint64_t v5 = v3 + 9;
  os_unfair_lock_lock(v3 + 9);
  sub_25119A144(v4, &v7);
  a1[2] = 0;
  os_unfair_lock_unlock(v5);
  *a1 = v7;
  return sub_2511B6B34;
}

void sub_2511B6B34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 36));
  sub_2511B6EB8((void *)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 36));
}

uint64_t MultiDispatcher.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_release();
  return v0;
}

uint64_t MultiDispatcher.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_release();

  return swift_deallocClassInstance();
}

void sub_2511B6C2C(void *a1)
{
}

uint64_t type metadata accessor for MultiDispatcher()
{
  return self;
}

uint64_t method lookup function for MultiDispatcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MultiDispatcher);
}

uint64_t dispatch thunk of MultiDispatcher.__allocating_init(target:width:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t getEnumTagSinglePayload for MultiDispatcher.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MultiDispatcher.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
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
      *(unsigned char *)(result + 16) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MultiDispatcher.State()
{
  return &type metadata for MultiDispatcher.State;
}

uint64_t sub_2511B6D50()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2511B6D88()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2511B6DC8()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);

  return MEMORY[0x270FA0238](v0, 200, 7);
}

uint64_t sub_2511B6E40()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);

  return MEMORY[0x270FA0238](v0, 200, 7);
}

void *sub_2511B6EB8(void *a1)
{
  return sub_2511B6A9C(a1);
}

uint64_t sub_2511B6ED0(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t NotificationInputSignal.__allocating_init(context:observer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  NotificationInputSignal.init(context:observer:)(a1, a2, a3, a4);
  return v8;
}

void static InputSignalSet.LookupKey.notification.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x80000002511CFB70;
  a1[2] = 0;
  a1[3] = 0;
}

uint64_t (*NotificationInputSignal.Anchor.notificationTimestamps.modify())()
{
  return nullsub_1;
}

uint64_t NotificationInputSignal.Anchor.relevantTimestamps(for:)(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_bridgeObjectRetain();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_2511B9800(v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

BOOL NotificationInputSignal.Anchor.hasDifference(from:for:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = *v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2511B9800(v5, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v8 = sub_2511B9800(v7, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = sub_2511532B0(MEMORY[0x263F8EE78]);
  }
  char v9 = sub_25116400C(v6, v8);
  swift_release();
  swift_bridgeObjectRelease();
  return (v9 & 1) == 0;
}

HealthOrchestration::NotificationInputSignal::Anchor __swiftcall NotificationInputSignal.Anchor.merged(with:)(HealthOrchestration::NotificationInputSignal::Anchor with)
{
  uint64_t v2 = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_2511B92C4(v3, (uint64_t (*)(uint64_t, uint64_t, double))sub_2511B99BC);
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_2511532B0(MEMORY[0x263F8EE78]);
  uint64_t v6 = *(void *)(v4 + 16);
  if (!v6)
  {
LABEL_17:
    result.notificationTimestamps._rawValue = (void *)swift_bridgeObjectRelease();
    *uint64_t v2 = v5;
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = (uint64_t *)(v4 + 48);
  while (1)
  {
    uint64_t v9 = *(v7 - 2);
    uint64_t v8 = *(v7 - 1);
    uint64_t v10 = *v7;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v13 = sub_251149240(v9, v8);
    uint64_t v14 = v5[2];
    BOOL v15 = (v12 & 1) == 0;
    uint64_t v16 = v14 + v15;
    if (__OFADD__(v14, v15)) {
      break;
    }
    char v17 = v12;
    if (v5[3] >= v16)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v12) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_2511872B8();
        if (v17) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_2511844E8(v16, isUniquelyReferenced_nonNull_native);
      unint64_t v18 = sub_251149240(v9, v8);
      if ((v17 & 1) != (v19 & 1)) {
        goto LABEL_20;
      }
      unint64_t v13 = v18;
      if (v17)
      {
LABEL_3:
        *(void *)(v5[7] + 8 * v13) = v10;
        goto LABEL_4;
      }
    }
    v5[(v13 >> 6) + 8] |= 1 << v13;
    size_t v20 = (uint64_t *)(v5[6] + 16 * v13);
    *size_t v20 = v9;
    v20[1] = v8;
    *(void *)(v5[7] + 8 * v13) = v10;
    uint64_t v21 = v5[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_19;
    }
    void v5[2] = v23;
    swift_bridgeObjectRetain();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7 += 3;
    if (!--v6)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  result.notificationTimestamps._rawValue = (void *)sub_2511C9CD0();
  __break(1u);
  return result;
}

uint64_t sub_2511B7324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  sub_251149240(a1, a2);
  if ((v5 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t static NotificationInputSignal.Anchor.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_25116400C(*a1, *a2);
}

unint64_t sub_2511B73D4()
{
  return 0xD000000000000016;
}

uint64_t sub_2511B73F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2511BA13C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2511B741C(uint64_t a1)
{
  unint64_t v2 = sub_2511B99C4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2511B7458(uint64_t a1)
{
  unint64_t v2 = sub_2511B99C4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NotificationInputSignal.Anchor.encode(to:)(void *a1)
{
  sub_2511B9A18(0, &qword_269B22848, MEMORY[0x263F8E0C0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v10 - v6;
  uint64_t v8 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511B99C4();
  sub_2511C9DA0();
  v10[1] = v8;
  sub_2511BA268(0, &qword_269B22858, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8D060]);
  sub_2511B9A7C(&qword_269B22860);
  sub_2511C9C00();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t NotificationInputSignal.Anchor.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_2511B9A18(0, &qword_269B22868, MEMORY[0x263F8E040]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v11 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511B99C4();
  sub_2511C9D90();
  if (!v2)
  {
    sub_2511BA268(0, &qword_269B22858, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8D060]);
    sub_2511B9A7C(&qword_269B22870);
    sub_2511C9B90();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a2 = v11[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2511B7850@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return NotificationInputSignal.Anchor.init(from:)(a1, a2);
}

uint64_t sub_2511B7868(void *a1)
{
  return NotificationInputSignal.Anchor.encode(to:)(a1);
}

uint64_t sub_2511B7880(uint64_t *a1, uint64_t *a2)
{
  return sub_25116400C(*a1, *a2);
}

void NotificationInputSignal.Configuration.identifier.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x80000002511CFB70;
  a1[2] = 0;
  a1[3] = 0;
}

uint64_t NotificationInputSignal.Configuration.notifications.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NotificationInputSignal.Configuration.notifications.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*NotificationInputSignal.Configuration.notifications.modify())()
{
  return nullsub_1;
}

uint64_t NotificationInputSignal.Configuration.init(notifications:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t static NotificationInputSignal.Configuration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_251161FAC(*a1, *a2);
}

uint64_t NotificationInputSignal.Configuration.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_bridgeObjectRetain();
  sub_251169524(a1, v3);

  return swift_bridgeObjectRelease();
}

uint64_t NotificationInputSignal.Configuration.hashValue.getter()
{
  uint64_t v1 = *v0;
  sub_2511C9D40();
  swift_bridgeObjectRetain();
  sub_251169524((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_2511C9D80();
}

uint64_t sub_2511B79BC(uint64_t *a1, uint64_t *a2)
{
  return sub_251161FAC(*a1, *a2);
}

void sub_2511B79C8(void *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x80000002511CFB70;
  a1[2] = 0;
  a1[3] = 0;
}

uint64_t sub_2511B79EC()
{
  uint64_t v1 = *v0;
  sub_2511C9D40();
  swift_bridgeObjectRetain();
  sub_251169524((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_2511C9D80();
}

uint64_t sub_2511B7A44(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_bridgeObjectRetain();
  sub_251169524(a1, v3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_2511B7A90()
{
  uint64_t v1 = *v0;
  sub_2511C9D40();
  swift_bridgeObjectRetain();
  sub_251169524((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_2511C9D80();
}

void NotificationInputSignal.identifier.getter(void *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x80000002511CFB70;
  a1[2] = 0;
  a1[3] = 0;
}

uint64_t NotificationInputSignal.observer.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_2511B7B30(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  aBlock[6] = *MEMORY[0x263EF8340];
  uint64_t v6 = sub_2511C92A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v2 + 40);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v10 + 40))(ObjectType, v10);
  swift_bridgeObjectRetain_n();
  char v12 = sub_2511C9280();
  os_log_type_t v13 = sub_2511C9770();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v24 = v6;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = a1;
    uint64_t v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)out_token = sub_251140E4C(v25, a2, aBlock);
    sub_2511C98A0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25112A000, v12, v13, "Beginning observation for %s", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v17 = v16;
    a1 = v25;
    MEMORY[0x253397D40](v17, -1, -1);
    MEMORY[0x253397D40](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v24);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  out_token[0] = -1;
  unint64_t v18 = *(NSObject **)(v3 + 56);
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  size_t v20 = (void *)swift_allocObject();
  void v20[2] = v19;
  v20[3] = a1;
  v20[4] = a2;
  aBlock[4] = (uint64_t)sub_2511BA23C;
  aBlock[5] = (uint64_t)v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2511B6ED0;
  aBlock[3] = (uint64_t)&block_descriptor_12;
  uint64_t v21 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v22 = sub_2511C94D0();
  notify_register_dispatch((const char *)(v22 + 32), out_token, v18, v21);
  swift_release();
  _Block_release(v21);
  return out_token[0];
}

uint64_t sub_2511B7E9C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = sub_2511C92A0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v11 = (void *)result;
    uint64_t v32 = v6;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    os_log_type_t v13 = (os_unfair_lock_s *)v11[6];
    double v15 = MEMORY[0x270FA5388](v14);
    *(&v31 - 4) = a3;
    *(&v31 - 3) = a4;
    *((double *)&v31 - 2) = v15;
    swift_retain();
    os_unfair_lock_lock(v13 + 8);
    sub_2511BA248((uint64_t)&v13[4], &v34);
    os_unfair_lock_unlock(v13 + 8);
    swift_release();
    uint64_t v16 = v34;
    uint64_t v17 = v11[5];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v17 + 40))(ObjectType, v17);
    swift_bridgeObjectRetain_n();
    uint64_t v19 = sub_2511C9280();
    os_log_type_t v20 = sub_2511C9770();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v31 = v16;
      uint64_t v23 = v22;
      uint64_t v34 = v22;
      *(_DWORD *)uint64_t v21 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_251140E4C(a3, a4, &v34);
      sub_2511C98A0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v21 + 12) = 2048;
      uint64_t v33 = *(void *)&Current;
      sub_2511C98A0();
      _os_log_impl(&dword_25112A000, v19, v20, "Received notification %s at %f", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      uint64_t v24 = v23;
      uint64_t v16 = v31;
      MEMORY[0x253397D40](v24, -1, -1);
      MEMORY[0x253397D40](v21, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v32);
    uint64_t v25 = v11[3];
    uint64_t v26 = swift_getObjectType();
    uint64_t v34 = v16;
    uint64_t v33 = (uint64_t)v11;
    uint64_t v27 = *(void (**)(uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 8);
    uint64_t v28 = type metadata accessor for NotificationInputSignal();
    uint64_t v30 = sub_2511B9EBC(qword_26B217C68, v29, (void (*)(uint64_t))type metadata accessor for NotificationInputSignal);
    v27(&v34, &v33, v28, v30, v26, v25);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_2511B8224@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>, double a5@<D0>)
{
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = 0x8000000000000000;
  sub_2511A96D8(a2, a3, isUniquelyReferenced_nonNull_native, a5);
  *(void *)(a1 + 8) = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a4 = *(void *)(a1 + 8);
  return swift_bridgeObjectRetain();
}

Swift::Void __swiftcall NotificationInputSignal.beginObservation(from:configurations:)(HealthOrchestration::NotificationInputSignal::Anchor_optional from, Swift::OpaquePointer configurations)
{
  uint64_t v3 = *(void *)&from.is_nil;
  uint64_t v4 = (os_unfair_lock_s *)v2[6];
  p_os_unfair_lock_opaque = (unint64_t *)&v4[4]._os_unfair_lock_opaque;
  uint64_t v6 = v4 + 8;
  uint64_t v7 = *v2;
  os_unfair_lock_lock(v4 + 8);
  sub_2511B87F8(p_os_unfair_lock_opaque);
  os_unfair_lock_unlock(v6);
  v19[0] = MEMORY[0x263F8EE88];
  uint64_t v9 = *(void *)(v3 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v9; ++i)
    {
      uint64_t v11 = swift_bridgeObjectRetain();
      sub_2511A3C68(v11);
    }
    uint64_t v8 = swift_bridgeObjectRelease();
  }
  MEMORY[0x270FA5388](v8);
  os_unfair_lock_lock(v6);
  sub_2511B9B0C(p_os_unfair_lock_opaque, v19);
  os_unfair_lock_unlock(v6);
  swift_bridgeObjectRelease();
  uint64_t v12 = v19[0];
  uint64_t v13 = v2[3];
  uint64_t ObjectType = swift_getObjectType();
  unint64_t v18 = v2;
  v19[0] = v12;
  double v15 = *(void (**)(void *, void **, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 8);
  uint64_t v17 = sub_2511B9EBC(qword_26B217C68, v16, (void (*)(uint64_t))type metadata accessor for NotificationInputSignal);
  v15(v19, &v18, v7, v17, ObjectType, v13);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall NotificationInputSignal.stopObservation()()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 48);
  p_os_unfair_lock_opaque = (unint64_t *)&v1[4]._os_unfair_lock_opaque;
  uint64_t v3 = v1 + 8;
  os_unfair_lock_lock(v1 + 8);
  sub_2511B87F8(p_os_unfair_lock_opaque);

  os_unfair_lock_unlock(v3);
}

uint64_t sub_2511B8500@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v35 = a2 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a2 + 56);
  int64_t v36 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v38)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v38 = i;
      unint64_t v9 = v8 | (i << 6);
    }
    else
    {
      int64_t v10 = i + 1;
      if (__OFADD__(i, 1)) {
        goto LABEL_36;
      }
      if (v10 >= v36)
      {
LABEL_33:
        swift_release();
        *a3 = a1[1];
        return swift_bridgeObjectRetain();
      }
      unint64_t v11 = *(void *)(v35 + 8 * v10);
      int64_t v12 = i + 1;
      if (!v11)
      {
        int64_t v12 = i + 2;
        if (i + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v11 = *(void *)(v35 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = i + 3;
          if (i + 3 >= v36) {
            goto LABEL_33;
          }
          unint64_t v11 = *(void *)(v35 + 8 * v12);
          if (!v11)
          {
            uint64_t v13 = i + 4;
            if (i + 4 >= v36) {
              goto LABEL_33;
            }
            unint64_t v11 = *(void *)(v35 + 8 * v13);
            if (!v11)
            {
              while (1)
              {
                int64_t v12 = v13 + 1;
                if (__OFADD__(v13, 1)) {
                  goto LABEL_37;
                }
                if (v12 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v11 = *(void *)(v35 + 8 * v12);
                ++v13;
                if (v11) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v12 = i + 4;
          }
        }
      }
LABEL_21:
      unint64_t v6 = (v11 - 1) & v11;
      int64_t v38 = v12;
      unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    }
    uint64_t v14 = (uint64_t *)(*(void *)(a2 + 48) + 16 * v9);
    uint64_t v16 = *v14;
    unint64_t v15 = v14[1];
    swift_bridgeObjectRetain();
    int v17 = sub_2511B7B30(v16, v15);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = (void *)*a1;
    long long v39 = (void *)*a1;
    *a1 = 0x8000000000000000;
    unint64_t v21 = sub_251149240(v16, v15);
    uint64_t v22 = v19[2];
    BOOL v23 = (v20 & 1) == 0;
    uint64_t v24 = v22 + v23;
    if (__OFADD__(v22, v23)) {
      break;
    }
    char v25 = v20;
    if (v19[3] >= v24)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v28 = v39;
        if (v20) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_251188808();
        uint64_t v28 = v39;
        if (v25) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_251186B0C(v24, isUniquelyReferenced_nonNull_native);
      unint64_t v26 = sub_251149240(v16, v15);
      if ((v25 & 1) != (v27 & 1)) {
        goto LABEL_38;
      }
      unint64_t v21 = v26;
      uint64_t v28 = v39;
      if (v25)
      {
LABEL_4:
        *(_DWORD *)(v28[7] + 4 * v21) = v17;
        goto LABEL_5;
      }
    }
    v28[(v21 >> 6) + 8] |= 1 << v21;
    uint64_t v29 = (uint64_t *)(v28[6] + 16 * v21);
    *uint64_t v29 = v16;
    v29[1] = v15;
    *(_DWORD *)(v28[7] + 4 * v21) = v17;
    uint64_t v30 = v28[2];
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31) {
      goto LABEL_35;
    }
    v28[2] = v32;
    swift_bridgeObjectRetain();
LABEL_5:
    *a1 = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  uint64_t result = sub_2511C9CD0();
  __break(1u);
  return result;
}

uint64_t sub_2511B87F8(unint64_t *a1)
{
  unint64_t v2 = *a1;
  uint64_t v3 = *a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(*a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(*a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v7) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v13 = *(void *)(v3 + 8 * v9);
      if (!v13)
      {
        int64_t v9 = v12 + 2;
        if (v12 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v13 = *(void *)(v3 + 8 * v9);
        if (!v13)
        {
          int64_t v9 = v12 + 3;
          if (v12 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v13 = *(void *)(v3 + 8 * v9);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_5:
    uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(v2 + 56) + 4 * v11));
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v7)
  {
LABEL_23:
    swift_release();
    unint64_t v15 = sub_25115355C(MEMORY[0x263F8EE78]);
    uint64_t result = swift_bridgeObjectRelease();
    *a1 = v15;
    return result;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *NotificationInputSignal.init(context:observer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v5 = sub_2511C97B0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2511C97A0();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = sub_2511C9390();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = MEMORY[0x263F8EE78];
  unint64_t v12 = sub_25115355C(MEMORY[0x263F8EE78]);
  sub_2511B9B4C();
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 32) = 0;
  uint64_t v14 = MEMORY[0x263F8EE80];
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = v14;
  v4[6] = v13;
  sub_251155968();
  sub_2511C9380();
  uint64_t v23 = v11;
  sub_2511B9EBC((unint64_t *)&qword_26B217F90, 255, MEMORY[0x263F8F0F8]);
  sub_2511AAC58();
  sub_2511B9EBC((unint64_t *)&qword_26B217F40, 255, (void (*)(uint64_t))sub_2511AAC58);
  sub_2511C9900();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F130], v5);
  v4[7] = sub_2511C97D0();
  uint64_t v15 = v20;
  v4[4] = v19;
  v4[5] = v15;
  uint64_t v16 = v22;
  v4[2] = v21;
  v4[3] = v16;
  return v4;
}

uint64_t NotificationInputSignal.deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return v0;
}

uint64_t NotificationInputSignal.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

void sub_2511B8CB8(HealthOrchestration::NotificationInputSignal::Anchor_optional a1, Swift::OpaquePointer a2)
{
}

void sub_2511B8CDC()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)v0 + 48);
  p_os_unfair_lock_opaque = (unint64_t *)&v1[4]._os_unfair_lock_opaque;
  uint64_t v3 = v1 + 8;
  os_unfair_lock_lock(v1 + 8);
  sub_2511B87F8(p_os_unfair_lock_opaque);

  os_unfair_lock_unlock(v3);
}

unint64_t sub_2511B8D44()
{
  return 0xD000000000000017;
}

uint64_t sub_2511B8D60(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_2511BA268(0, (unint64_t *)&qword_269B21C18, MEMORY[0x263F8E548], MEMORY[0x263F8E558], MEMORY[0x263F8DFB0]);
  uint64_t result = sub_2511C9AF0();
  uint64_t v9 = result;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= a2) {
        return v9;
      }
      unint64_t v16 = a1[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= a2) {
          return v9;
        }
        unint64_t v16 = a1[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= a2) {
            return v9;
          }
          unint64_t v16 = a1[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= a2) {
              return v9;
            }
            unint64_t v16 = a1[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= a2) {
                  return v9;
                }
                unint64_t v16 = a1[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    unsigned int v18 = *(_DWORD *)(*(void *)(v4 + 48) + 4 * v14);
    uint64_t v19 = *(void *)(*(void *)(v4 + 56) + 8 * v14);
    uint64_t result = MEMORY[0x253397570](*(void *)(v9 + 40), v18, 4);
    uint64_t v20 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_39;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v12 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v12 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(_DWORD *)(*(void *)(v9 + 48) + 4 * v23) = v18;
    *(void *)(*(void *)(v9 + 56) + 8 * v23) = v19;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2511B8FEC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_2511BA268(0, &qword_269B21BE0, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8DFB0]);
  uint64_t result = sub_2511C9AF0();
  uint64_t v8 = result;
  uint64_t v31 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v31) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v31) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v31) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v31) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v31) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = *(void *)(*(void *)(v4 + 56) + 8 * v13);
    sub_2511C9D40();
    swift_bridgeObjectRetain();
    sub_2511C94F0();
    uint64_t result = sub_2511C9D80();
    uint64_t v21 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_39;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t v29 = (void *)(*(void *)(v8 + 48) + 16 * v24);
    *uint64_t v29 = v19;
    v29[1] = v18;
    *(void *)(*(void *)(v8 + 56) + 8 * v24) = v20;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v8;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2511B92C4(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, double))
{
  uint64_t v28 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v29 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  BOOL v27 = (void *)MEMORY[0x263F8EE78];
  if (!v6) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v9 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v8 << 6))
  {
    uint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    double v14 = *(double *)(*(void *)(a1 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    uint64_t v15 = a2(v12, v13, v14);
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t result = swift_bridgeObjectRelease();
    if (v17)
    {
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_2511BFA44(0, v27[2] + 1, 1, v27);
        BOOL v27 = (void *)result;
      }
      unint64_t v24 = v27[2];
      unint64_t v23 = v27[3];
      unint64_t v25 = v24 + 1;
      if (v24 >= v23 >> 1)
      {
        uint64_t result = (uint64_t)sub_2511BFA44((void *)(v23 > 1), v24 + 1, 1, v27);
        unint64_t v25 = v24 + 1;
        BOOL v27 = (void *)result;
      }
      v27[2] = v25;
      unint64_t v26 = &v27[3 * v24];
      v26[4] = v15;
      v26[5] = v17;
      v26[6] = v19;
      if (v6) {
        goto LABEL_4;
      }
    }
    else if (v6)
    {
      goto LABEL_4;
    }
LABEL_7:
    int64_t v20 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v20 >= v29) {
      goto LABEL_29;
    }
    unint64_t v21 = *(void *)(v28 + 8 * v20);
    ++v8;
    if (!v21)
    {
      int64_t v8 = v20 + 1;
      if (v20 + 1 >= v29) {
        goto LABEL_29;
      }
      unint64_t v21 = *(void *)(v28 + 8 * v8);
      if (!v21)
      {
        int64_t v8 = v20 + 2;
        if (v20 + 2 >= v29) {
          goto LABEL_29;
        }
        unint64_t v21 = *(void *)(v28 + 8 * v8);
        if (!v21)
        {
          int64_t v8 = v20 + 3;
          if (v20 + 3 >= v29) {
            goto LABEL_29;
          }
          unint64_t v21 = *(void *)(v28 + 8 * v8);
          if (!v21) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v21 - 1) & v21;
  }
  int64_t v22 = v20 + 4;
  if (v22 >= v29)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v27;
  }
  unint64_t v21 = *(void *)(v28 + 8 * v22);
  if (v21)
  {
    int64_t v8 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v8 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v8 >= v29) {
      goto LABEL_29;
    }
    unint64_t v21 = *(void *)(v28 + 8 * v8);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_2511B9540(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v32 = (unint64_t *)result;
  uint64_t v33 = 0;
  int64_t v5 = 0;
  uint64_t v8 = *(void *)(a3 + 64);
  uint64_t v6 = a3 + 64;
  uint64_t v7 = v8;
  uint64_t v9 = 1 << *(unsigned char *)(v6 - 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v7;
  uint64_t v35 = v6;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = a4 + 56;
  while (1)
  {
    while (v11)
    {
      unint64_t v12 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v13 = v12 | (v5 << 6);
      if (*(void *)(v4 + 16)) {
        goto LABEL_23;
      }
    }
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    if (v14 >= v36) {
      return sub_2511B8FEC(v32, a2, v33, a3);
    }
    unint64_t v15 = *(void *)(v35 + 8 * v14);
    ++v5;
    if (!v15)
    {
      int64_t v5 = v14 + 1;
      if (v14 + 1 >= v36) {
        return sub_2511B8FEC(v32, a2, v33, a3);
      }
      unint64_t v15 = *(void *)(v35 + 8 * v5);
      if (!v15)
      {
        int64_t v5 = v14 + 2;
        if (v14 + 2 >= v36) {
          return sub_2511B8FEC(v32, a2, v33, a3);
        }
        unint64_t v15 = *(void *)(v35 + 8 * v5);
        if (!v15) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v11 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v5 << 6);
    if (*(void *)(v4 + 16))
    {
LABEL_23:
      uint64_t v17 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v13);
      uint64_t v19 = *v17;
      uint64_t v18 = v17[1];
      sub_2511C9D40();
      swift_bridgeObjectRetain();
      sub_2511C94F0();
      uint64_t v20 = sub_2511C9D80();
      uint64_t v21 = v4;
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = v20 & ~v22;
      if (((*(void *)(v37 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
        goto LABEL_5;
      }
      uint64_t v24 = *(void *)(v21 + 48);
      unint64_t v25 = (void *)(v24 + 16 * v23);
      BOOL v26 = *v25 == v19 && v25[1] == v18;
      if (v26 || (sub_2511C9CA0() & 1) != 0)
      {
LABEL_36:
        uint64_t result = swift_bridgeObjectRelease();
        *(unint64_t *)((char *)v32 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
        BOOL v30 = __OFADD__(v33++, 1);
        uint64_t v4 = v21;
        if (v30)
        {
          __break(1u);
          return sub_2511B8FEC(v32, a2, v33, a3);
        }
      }
      else
      {
        uint64_t v27 = ~v22;
        while (1)
        {
          unint64_t v23 = (v23 + 1) & v27;
          if (((*(void *)(v37 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
            break;
          }
          uint64_t v28 = (void *)(v24 + 16 * v23);
          BOOL v29 = *v28 == v19 && v28[1] == v18;
          if (v29 || (sub_2511C9CA0() & 1) != 0) {
            goto LABEL_36;
          }
        }
LABEL_5:
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v4 = v21;
      }
    }
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v36) {
    return sub_2511B8FEC(v32, a2, v33, a3);
  }
  unint64_t v15 = *(void *)(v35 + 8 * v16);
  if (v15)
  {
    int64_t v5 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v36) {
      return sub_2511B8FEC(v32, a2, v33, a3);
    }
    unint64_t v15 = *(void *)(v35 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2511B9800(uint64_t a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2511B9540((uint64_t)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2511B9540((uint64_t)v11, v7, a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x253397D40](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_2511B99BC(uint64_t a1, uint64_t a2)
{
  return sub_2511B7324(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_2511B99C4()
{
  unint64_t result = qword_269B22850;
  if (!qword_269B22850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22850);
  }
  return result;
}

void sub_2511B9A18(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_2511B99C4();
    unint64_t v7 = a3(a1, &type metadata for NotificationInputSignal.Anchor.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2511B9A7C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2511BA268(255, &qword_269B22858, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8D060]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2511B9B0C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_2511B8500(a1, *(void *)(v2 + 16), a2);
}

uint64_t type metadata accessor for NotificationInputSignal()
{
  return self;
}

void sub_2511B9B4C()
{
  if (!qword_26B218030)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_2511C99D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B218030);
    }
  }
}

unint64_t sub_2511B9BB0()
{
  unint64_t result = qword_269B22878;
  if (!qword_269B22878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22878);
  }
  return result;
}

unint64_t sub_2511B9C04(void *a1)
{
  a1[1] = sub_2511B9C3C();
  a1[2] = sub_2511B9C90();
  unint64_t result = sub_2511B9CE4();
  a1[3] = result;
  return result;
}

unint64_t sub_2511B9C3C()
{
  unint64_t result = qword_269B22880;
  if (!qword_269B22880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22880);
  }
  return result;
}

unint64_t sub_2511B9C90()
{
  unint64_t result = qword_269B22888;
  if (!qword_269B22888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22888);
  }
  return result;
}

unint64_t sub_2511B9CE4()
{
  unint64_t result = qword_269B22890;
  if (!qword_269B22890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22890);
  }
  return result;
}

unint64_t sub_2511B9D38(uint64_t a1)
{
  unint64_t result = sub_2511B9D60();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2511B9D60()
{
  unint64_t result = qword_269B22898;
  if (!qword_269B22898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22898);
  }
  return result;
}

unint64_t sub_2511B9DB8()
{
  unint64_t result = qword_269B228A0;
  if (!qword_269B228A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B228A0);
  }
  return result;
}

unint64_t sub_2511B9E10()
{
  unint64_t result = qword_269B228A8;
  if (!qword_269B228A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B228A8);
  }
  return result;
}

uint64_t sub_2511B9E64(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_2511B9EBC(&qword_26B218790, a2, (void (*)(uint64_t))type metadata accessor for NotificationInputSignal);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2511B9EBC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t method lookup function for NotificationInputSignal(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NotificationInputSignal);
}

uint64_t dispatch thunk of NotificationInputSignal.__allocating_init(context:observer:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for NotificationInputSignal.Anchor()
{
  return &type metadata for NotificationInputSignal.Anchor;
}

ValueMetadata *type metadata accessor for NotificationInputSignal.Configuration()
{
  return &type metadata for NotificationInputSignal.Configuration;
}

ValueMetadata *type metadata accessor for NotificationInputSignal.State()
{
  return &type metadata for NotificationInputSignal.State;
}

unsigned char *storeEnumTagSinglePayload for NotificationInputSignal.Anchor.CodingKeys(unsigned char *result, int a2, int a3)
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
        char *result = a2;
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
      char *result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2511B9FFCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for NotificationInputSignal.Anchor.CodingKeys()
{
  return &type metadata for NotificationInputSignal.Anchor.CodingKeys;
}

unint64_t sub_2511BA038()
{
  unint64_t result = qword_269B228B0;
  if (!qword_269B228B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B228B0);
  }
  return result;
}

unint64_t sub_2511BA090()
{
  unint64_t result = qword_269B228B8;
  if (!qword_269B228B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B228B8);
  }
  return result;
}

unint64_t sub_2511BA0E8()
{
  unint64_t result = qword_269B228C0;
  if (!qword_269B228C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B228C0);
  }
  return result;
}

uint64_t sub_2511BA13C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000016 && a2 == 0x80000002511D2200)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_2511C9CA0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_2511BA1C4()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2511BA1FC()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2511BA23C(uint64_t a1)
{
  return sub_2511B7E9C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_2511BA248@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_2511B8224(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2, *(double *)(v2 + 32));
}

void sub_2511BA268(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, void))
{
  if (!*a2)
  {
    unint64_t v6 = a5(0, a3, MEMORY[0x263F8D538]);
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t InputSignalAnchorSet.merged(with:)()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_2511BBEB8(v0, (void (*)(_OWORD *__return_ptr, void *, unsigned char *))sub_2511BA9E4);
  swift_bridgeObjectRelease();
  uint64_t v2 = (void *)sub_2511382C8(MEMORY[0x263F8EE78]);
  uint64_t v3 = *(void *)(v1 + 16);
  if (!v3)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v2;
    return result;
  }
  uint64_t v4 = v1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_2511555A4(v4, (uint64_t)&v35);
    uint64_t v7 = v35;
    uint64_t v6 = v36;
    uint64_t v8 = v37;
    uint64_t v9 = v38;
    uint64_t v30 = v35;
    uint64_t v31 = v36;
    uint64_t v32 = v37;
    uint64_t v33 = v38;
    sub_25112FD4C((uint64_t)v39, (uint64_t)v34);
    uint64_t v25 = v7;
    uint64_t v26 = v6;
    uint64_t v27 = v8;
    uint64_t v28 = v9;
    sub_25112FD4C((uint64_t)v39, (uint64_t)v29);
    sub_25112F14C(v29, (uint64_t)v24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v12 = sub_25112F2DC(v7, v6, v8, v9);
    uint64_t v13 = v2[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14)) {
      break;
    }
    char v16 = v11;
    if (v2[3] >= v15)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v11) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_251131420();
        if (v16) {
          goto LABEL_3;
        }
      }
    }
    else
    {
      sub_251131918(v15, isUniquelyReferenced_nonNull_native);
      unint64_t v17 = sub_25112F2DC(v7, v6, v8, v9);
      if ((v16 & 1) != (v18 & 1)) {
        goto LABEL_20;
      }
      unint64_t v12 = v17;
      if (v16)
      {
LABEL_3:
        uint64_t v5 = v2[7] + 40 * v12;
        __swift_destroy_boxed_opaque_existential_1(v5);
        sub_25112F14C(v24, v5);
        goto LABEL_4;
      }
    }
    v2[(v12 >> 6) + 8] |= 1 << v12;
    uint64_t v19 = (uint64_t *)(v2[6] + 32 * v12);
    *uint64_t v19 = v7;
    v19[1] = v6;
    void v19[2] = v8;
    v19[3] = v9;
    sub_25112F14C(v24, v2[7] + 40 * v12);
    uint64_t v20 = v2[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_19;
    }
    v2[2] = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    sub_2511BC83C((uint64_t)&v35, (uint64_t (*)(void))sub_251155608);
    v4 += 72;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  uint64_t result = sub_2511C9CD0();
  __break(1u);
  return result;
}

uint64_t InputSignalAnchorSet.updated(from:)()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_25112E580(v2, v1);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v3;
  return result;
}

uint64_t InputSignalAnchorSet.__allocating_init(signalAnchors:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

{
  uint64_t v2;

  swift_allocObject();
  uint64_t v2 = sub_2511BC19C(a1);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t InputSignalAnchorSet.updated(anchor:)(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(a1, v2);

  return sub_25113840C((uint64_t)v4, v1, v2, v3);
}

uint64_t InputSignalAnchorSet.signalAnchors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InputSignalAnchorSet.subscript.getter@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  if (*(void *)(v4 + 16))
  {
    uint64_t v6 = *a1;
    uint64_t v5 = a1[1];
    uint64_t v8 = a1[2];
    uint64_t v7 = a1[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_25112F2DC(v6, v5, v8, v7);
    if (v10)
    {
      sub_25112FD4C(*(void *)(v4 + 56) + 40 * v9, (uint64_t)&v14);
    }
    else
    {
      uint64_t v16 = 0;
      long long v14 = 0u;
      long long v15 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
  }
  sub_251138C78(0, (unint64_t *)&qword_26B217A30, qword_26B216650);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  int v12 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(a2, v12 ^ 1u, 1, AssociatedTypeWitness);
}

double sub_2511BA86C@<D0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = *(void *)(a3 + 16);
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = *a1;
    uint64_t v7 = a1[1];
    uint64_t v10 = a1[2];
    uint64_t v9 = a1[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_25112F2DC(v8, v7, v10, v9);
    if (v12)
    {
      sub_25112FD4C(*(void *)(v5 + 56) + 40 * v11, (uint64_t)&v17);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v18 + 1))
      {
        sub_25112F14C(&v17, (uint64_t)v20);
        *(void *)a4 = v8;
        *(void *)(a4 + 8) = v7;
        *(void *)(a4 + 16) = v10;
        *(void *)(a4 + 24) = v9;
        uint64_t v13 = a2[3];
        uint64_t v14 = a2[4];
        __swift_project_boxed_opaque_existential_1(a2, v13);
        *(void *)(a4 + 56) = v13;
        *(void *)(a4 + 64) = v14;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(a4 + 32));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_2511503D4((uint64_t)v20, v13, v14, (uint64_t)boxed_opaque_existential_1);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
        return result;
      }
    }
    else
    {
      uint64_t v19 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_2511BC500((uint64_t)&v17, (unint64_t *)&qword_26B217A30, qword_26B216650);
  *(void *)(a4 + 64) = 0;
  double result = 0.0;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  return result;
}

double sub_2511BA9E4@<D0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2511BA86C(a1, a2, v3, a3);
}

uint64_t InputSignalAnchorSet.hasDifference(from:for:)(uint64_t a1, void *a2)
{
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    uint64_t v5 = a2[3];
    uint64_t v6 = a2[4];
    __swift_project_boxed_opaque_existential_1(a2, v5);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v6 + 16))(v22, v5, v6);
    if (*(void *)(v4 + 16) && (unint64_t v7 = sub_25112F2DC(v22[0], v22[1], v22[2], v23), (v8 & 1) != 0))
    {
      sub_25112FD4C(*(void *)(v4 + 56) + 40 * v7, (uint64_t)&v25);
    }
    else
    {
      uint64_t v27 = 0;
      long long v25 = 0u;
      long long v26 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
  }
  uint64_t v9 = *(void *)(v2 + 16);
  uint64_t v10 = a2[3];
  uint64_t v11 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v10);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v11 + 16))(v21, v10, v11);
  if (*(void *)(v9 + 16) && (unint64_t v12 = sub_25112F2DC(v21[0], v21[1], v21[2], v21[3]), (v13 & 1) != 0))
  {
    sub_25112FD4C(*(void *)(v9 + 56) + 40 * v12, (uint64_t)&v18);
  }
  else
  {
    uint64_t v20 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v19 + 1))
  {
    sub_25112F14C(&v18, (uint64_t)v22);
    uint64_t v14 = v23;
    uint64_t v15 = v24;
    __swift_project_boxed_opaque_existential_1(v22, v23);
    char v16 = sub_25112D6FC((uint64_t)&v25, (uint64_t)a2, v14, v15);
    sub_2511BC500((uint64_t)&v25, (unint64_t *)&qword_26B217A30, qword_26B216650);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }
  else
  {
    sub_2511BC500((uint64_t)&v25, (unint64_t *)&qword_26B217A30, qword_26B216650);
    sub_2511BC500((uint64_t)&v18, (unint64_t *)&qword_26B217A30, qword_26B216650);
    char v16 = 0;
  }
  return v16 & 1;
}

uint64_t InputSignalAnchorSet.init(signalAnchors:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

{
  uint64_t v1;

  uint64_t v1 = sub_2511BC19C(a1);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t InputSignalAnchorSet.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2511BACD0(void *a1)
{
  sub_2511BC7D8(0, &qword_26B2180F0, MEMORY[0x263F8E0C0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v7 = (char *)&v13 - v6;
  long long v15 = *v1;
  uint64_t v9 = *((void *)v1 + 2);
  uint64_t v8 = *((void *)v1 + 3);
  uint64_t v10 = *((void *)v1 + 4);
  uint64_t v13 = *((void *)v1 + 5);
  uint64_t v14 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511BC784();
  sub_2511C9DA0();
  long long v17 = v15;
  uint64_t v18 = v9;
  uint64_t v19 = v8;
  char v20 = 0;
  sub_2511512C4();
  uint64_t v11 = v16;
  sub_2511C9C00();
  if (!v11)
  {
    *(void *)&long long v17 = v14;
    *((void *)&v17 + 1) = v13;
    char v20 = 1;
    sub_251151270();
    sub_2511C9C00();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2511BAE98@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2511BC7D8(0, &qword_26B2180E0, MEMORY[0x263F8E040]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v15 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511BC784();
  sub_2511C9D90();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v21 = 0;
  sub_251150F3C();
  sub_2511C9B90();
  unint64_t v10 = v18;
  uint64_t v11 = v20;
  uint64_t v15 = v19;
  uint64_t v16 = v17;
  char v21 = 1;
  sub_251150E90();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2511C9B90();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v12 = v17;
  unint64_t v13 = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_251171E6C(v12, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a2 = v16;
  a2[1] = v10;
  a2[2] = v15;
  a2[3] = v11;
  a2[4] = v12;
  a2[5] = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_251150EE4(v12, v13);
}

uint64_t sub_2511BB13C(uint64_t *a1, uint64_t *a2)
{
  return _s19HealthOrchestration20InputSignalAnchorSetC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_2511BB148()
{
  if (*v0) {
    return 0x536465646F636E65;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_2511BB194@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2511BCAA8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2511BB1BC(uint64_t a1)
{
  unint64_t v2 = sub_2511BC784();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2511BB1F8(uint64_t a1)
{
  unint64_t v2 = sub_2511BC784();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2511BB234@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2511BAE98(a1, a2);
}

uint64_t sub_2511BB24C(void *a1)
{
  return sub_2511BACD0(a1);
}

uint64_t InputSignalAnchorSet.archived()()
{
  uint64_t v2 = v0;
  sub_2511C90D0();
  swift_allocObject();
  uint64_t v3 = sub_2511C90C0();
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = swift_bridgeObjectRetain();
  sub_2511BBB6C(v5, (void (*)(void *__return_ptr, _OWORD *, _OWORD *))sub_2511BC378, v3);
  if (v1)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2511BC394();
    sub_2511BC440(&qword_26B217EC8, (void (*)(void))sub_2511BC3EC);
    uint64_t v4 = sub_2511C90B0();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return v4;
}

uint64_t sub_2511BB390@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v8 = a1[2];
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t result = sub_2511C90B0();
  if (!v3)
  {
    *a3 = v6;
    a3[1] = v5;
    a3[2] = v8;
    a3[3] = v7;
    a3[4] = result;
    a3[5] = v10;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t InputSignalAnchorSet.__allocating_init(from:signals:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v40 = *a3;
  sub_2511C90A0();
  swift_allocObject();
  uint64_t v7 = sub_2511C9090();
  sub_2511BC394();
  sub_2511BC440((unint64_t *)&unk_26B217ED0, (void (*)(void))sub_2511BC4AC);
  sub_2511C9080();
  uint64_t v39 = v4;
  if (v4)
  {
    sub_251150EE4(a1, a2);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  uint64_t v9 = *(void *)(v47[0] + 16);
  if (v9)
  {
    uint64_t v30 = v3;
    uint64_t v32 = v7;
    uint64_t v33 = a1;
    unint64_t v34 = a2;
    uint64_t v31 = swift_bridgeObjectRetain();
    uint64_t v10 = (unint64_t *)(v31 + 72);
    uint64_t v11 = MEMORY[0x263F8EE80];
    while (1)
    {
      uint64_t v13 = *(v10 - 4);
      uint64_t v15 = *(v10 - 2);
      uint64_t v14 = *(v10 - 1);
      unint64_t v16 = *v10;
      if (!*(void *)(v40 + 16)) {
        break;
      }
      uint64_t v17 = *(v10 - 5);
      uint64_t v18 = *(v10 - 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_251171E6C(v14, v16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v38 = v18;
      unint64_t v19 = sub_25112F2DC(v17, v13, v18, v15);
      if (v20)
      {
        sub_25112FD4C(*(void *)(v40 + 56) + 40 * v19, (uint64_t)&v44);
      }
      else
      {
        uint64_t AssociatedConformanceWitness = 0;
        long long v44 = 0u;
        long long v45 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!*((void *)&v45 + 1)) {
        goto LABEL_6;
      }
      uint64_t v35 = v17;
      uint64_t v37 = v11;
      sub_25112F14C(&v44, (uint64_t)v47);
      uint64_t v36 = __swift_project_boxed_opaque_existential_1(v47, v47[3]);
      *((void *)&v45 + 1) = swift_getAssociatedTypeWitness();
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v44);
      uint64_t v21 = v39;
      sub_2511BB980();
      uint64_t v39 = v21;
      if (v21)
      {
        __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v44);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_251150EE4(v14, v16);
        swift_bridgeObjectRelease();
        sub_251150EE4(v33, v34);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return swift_release();
      }
      sub_25112FD4C((uint64_t)&v44, (uint64_t)v41);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v22 = v37;
      LODWORD(v36) = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v48 = v22;
      uint64_t v24 = v42;
      uint64_t v23 = v43;
      uint64_t v25 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v41, v42);
      double v26 = MEMORY[0x270FA5388](v25);
      uint64_t v37 = v14;
      uint64_t v28 = (char *)&v30 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v29 + 16))(v28, v26);
      sub_251138704((uint64_t)v28, v35, v13, v38, v15, (char)v36, &v48, v24, v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
      uint64_t v11 = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v44);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v12 = v37;
LABEL_7:
      sub_251150EE4(v12, v16);
      v10 += 6;
      if (!--v9)
      {
        swift_bridgeObjectRelease();
        a2 = v34;
        a1 = v33;
        goto LABEL_17;
      }
    }
    uint64_t AssociatedConformanceWitness = 0;
    long long v44 = 0u;
    long long v45 = 0u;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_251171E6C(v14, v16);
LABEL_6:
    sub_2511BC500((uint64_t)&v44, qword_26B2178F8, (unint64_t *)&qword_26B2178E8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v12 = v14;
    goto LABEL_7;
  }
  uint64_t v11 = MEMORY[0x263F8EE80];
LABEL_17:
  swift_release();
  sub_251150EE4(a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v11;
  return result;
}

uint64_t sub_2511BB980()
{
  return swift_release();
}

unint64_t InputSignalAnchorSet.description.getter()
{
  return 0xD000000000000015;
}

unint64_t sub_2511BBB44()
{
  return InputSignalAnchorSet.description.getter();
}

uint64_t sub_2511BBB6C(uint64_t a1, void (*a2)(void *__return_ptr, _OWORD *, _OWORD *), uint64_t a3)
{
  uint64_t v4 = v3;
  int64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (!v5) {
    return v6;
  }
  uint64_t v7 = a1;
  uint64_t v55 = MEMORY[0x263F8EE78];
  sub_25116B918(0, v5, 0);
  uint64_t result = sub_25118947C(v7);
  uint64_t v10 = result;
  uint64_t v11 = 0;
  uint64_t v12 = v7 + 64;
  uint64_t v39 = v7;
  char v13 = *(unsigned char *)(v7 + 32);
  uint64_t v35 = v7 + 80;
  int64_t v36 = v5;
  int v37 = v9;
  uint64_t v38 = v7 + 64;
  while ((v10 & 0x8000000000000000) == 0 && v10 < 1 << v13)
  {
    unint64_t v16 = (unint64_t)v10 >> 6;
    if ((*(void *)(v12 + 8 * ((unint64_t)v10 >> 6)) & (1 << v10)) == 0) {
      goto LABEL_27;
    }
    if (*(_DWORD *)(v7 + 36) != v9) {
      goto LABEL_28;
    }
    uint64_t v44 = v11;
    uint64_t v17 = *(void *)(v7 + 56);
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 32 * v10);
    uint64_t v20 = v18[1];
    uint64_t v21 = v18[2];
    uint64_t v22 = v18[3];
    v52[0] = *v18;
    uint64_t v19 = v52[0];
    v52[1] = v20;
    v52[2] = v21;
    v52[3] = v22;
    sub_25112FD4C(v17 + 40 * v10, (uint64_t)v53);
    *(void *)&long long v48 = v19;
    *((void *)&v48 + 1) = v20;
    *(void *)&long long v49 = v21;
    *((void *)&v49 + 1) = v22;
    sub_25112FD4C((uint64_t)v53, (uint64_t)v50);
    v46[0] = v50[0];
    v46[1] = v50[1];
    uint64_t v47 = v51;
    v45[0] = v48;
    v45[1] = v49;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_2511BC83C((uint64_t)v52, (uint64_t (*)(void))sub_251130158);
    uint64_t v6 = a3;
    a2(v54, v45, v46);
    sub_2511BC83C((uint64_t)v45, (uint64_t (*)(void))sub_251130158);
    if (v4)
    {
      swift_release();
      return v6;
    }
    uint64_t v23 = v54[0];
    uint64_t v24 = v54[1];
    uint64_t v26 = v54[2];
    uint64_t v25 = v54[3];
    uint64_t v42 = v54[5];
    uint64_t v43 = v54[4];
    uint64_t v6 = v55;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_25116B918(0, *(void *)(v6 + 16) + 1, 1);
      uint64_t v6 = v55;
    }
    unint64_t v28 = *(void *)(v6 + 16);
    unint64_t v27 = *(void *)(v6 + 24);
    if (v28 >= v27 >> 1)
    {
      uint64_t result = sub_25116B918(v27 > 1, v28 + 1, 1);
      uint64_t v6 = v55;
    }
    *(void *)(v6 + 16) = v28 + 1;
    uint64_t v29 = (void *)(v6 + 48 * v28);
    v29[4] = v23;
    v29[5] = v24;
    v29[6] = v26;
    v29[7] = v25;
    v29[8] = v43;
    v29[9] = v42;
    uint64_t v7 = v39;
    char v13 = *(unsigned char *)(v39 + 32);
    unint64_t v14 = 1 << v13;
    if (v10 >= 1 << v13) {
      goto LABEL_29;
    }
    uint64_t v12 = v38;
    uint64_t v30 = *(void *)(v38 + 8 * v16);
    if ((v30 & (1 << v10)) == 0) {
      goto LABEL_30;
    }
    int v9 = v37;
    if (*(_DWORD *)(v39 + 36) != v37) {
      goto LABEL_31;
    }
    unint64_t v31 = v30 & (-2 << (v10 & 0x3F));
    if (v31)
    {
      unint64_t v14 = __clz(__rbit64(v31)) | v10 & 0xFFFFFFFFFFFFFFC0;
      uint64_t v4 = 0;
      int64_t v15 = v36;
    }
    else
    {
      unint64_t v32 = v16 + 1;
      unint64_t v33 = (v14 + 63) >> 6;
      uint64_t v4 = 0;
      int64_t v15 = v36;
      if (v16 + 1 < v33)
      {
        unint64_t v34 = *(void *)(v38 + 8 * v32);
        if (v34)
        {
LABEL_23:
          unint64_t v14 = __clz(__rbit64(v34)) + (v32 << 6);
        }
        else
        {
          while (v33 - 2 != v16)
          {
            unint64_t v34 = *(void *)(v35 + 8 * v16++);
            if (v34)
            {
              unint64_t v32 = v16 + 1;
              goto LABEL_23;
            }
          }
        }
      }
    }
    uint64_t v11 = v44 + 1;
    uint64_t v10 = v14;
    if (v44 + 1 == v15) {
      return v6;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_2511BBEB8(uint64_t a1, void (*a2)(_OWORD *__return_ptr, void *, unsigned char *))
{
  void (*v33)(_OWORD *__return_ptr, void *, unsigned char *);

  unint64_t v33 = a2;
  uint64_t v22 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v23 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  uint64_t v21 = (void *)MEMORY[0x263F8EE78];
  if (!v5) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (unint64_t i = v8 | (v7 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v7 << 6))
  {
    uint64_t v10 = (uint64_t *)(*(void *)(a1 + 48) + 32 * i);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    uint64_t v13 = v10[2];
    uint64_t v14 = v10[3];
    sub_25112FD4C(*(void *)(a1 + 56) + 40 * i, (uint64_t)v32);
    v31[0] = v11;
    v31[1] = v12;
    v31[2] = v13;
    v31[3] = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33(v29, v31, v32);
    sub_2511BC83C((uint64_t)v31, (uint64_t (*)(void))sub_251130158);
    if (*((void *)&v29[0] + 1))
    {
      long long v26 = v29[2];
      long long v27 = v29[3];
      uint64_t v28 = v30;
      long long v24 = v29[0];
      long long v25 = v29[1];
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_2511BFCB8(0, v21[2] + 1, 1, v21);
        uint64_t v21 = (void *)result;
      }
      unint64_t v19 = v21[2];
      unint64_t v18 = v21[3];
      if (v19 >= v18 >> 1)
      {
        uint64_t result = (uint64_t)sub_2511BFCB8((void *)(v18 > 1), v19 + 1, 1, v21);
        uint64_t v21 = (void *)result;
      }
      void v21[2] = v19 + 1;
      uint64_t v20 = &v21[9 * v19];
      *((_OWORD *)v20 + 2) = v24;
      v20[12] = v28;
      *((_OWORD *)v20 + 4) = v26;
      *((_OWORD *)v20 + 5) = v27;
      *((_OWORD *)v20 + 3) = v25;
      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t result = sub_25118B6A4((uint64_t)v29);
      if (v5) {
        goto LABEL_4;
      }
    }
LABEL_7:
    int64_t v15 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v15 >= v23) {
      goto LABEL_29;
    }
    unint64_t v16 = *(void *)(v22 + 8 * v15);
    ++v7;
    if (!v16)
    {
      int64_t v7 = v15 + 1;
      if (v15 + 1 >= v23) {
        goto LABEL_29;
      }
      unint64_t v16 = *(void *)(v22 + 8 * v7);
      if (!v16)
      {
        int64_t v7 = v15 + 2;
        if (v15 + 2 >= v23) {
          goto LABEL_29;
        }
        unint64_t v16 = *(void *)(v22 + 8 * v7);
        if (!v16)
        {
          int64_t v7 = v15 + 3;
          if (v15 + 3 >= v23) {
            goto LABEL_29;
          }
          unint64_t v16 = *(void *)(v22 + 8 * v7);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v5 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v23)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v21;
  }
  unint64_t v16 = *(void *)(v22 + 8 * v17);
  if (v16)
  {
    int64_t v7 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v7 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v7 >= v23) {
      goto LABEL_29;
    }
    unint64_t v16 = *(void *)(v22 + 8 * v7);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_2511BC19C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = a1 + 32;
    uint64_t v3 = MEMORY[0x263F8EE80];
    do
    {
      sub_25112FD4C(v2, (uint64_t)v26);
      uint64_t v4 = v27;
      uint64_t v5 = v28;
      __swift_project_boxed_opaque_existential_1(v26, v27);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v5 + 48))(v25, v4, v5);
      uint64_t v6 = v25[1];
      uint64_t v20 = v25[0];
      uint64_t v8 = v25[2];
      uint64_t v7 = v25[3];
      sub_25112FD4C((uint64_t)v26, (uint64_t)v22);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v21 = v3;
      uint64_t v11 = v23;
      uint64_t v10 = v24;
      uint64_t v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
      double v13 = MEMORY[0x270FA5388](v12);
      int64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, double))(v16 + 16))(v15, v13);
      sub_251138704((uint64_t)v15, v20, v6, v8, v7, isUniquelyReferenced_nonNull_native, &v21, v11, v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
      uint64_t v3 = v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      v2 += 40;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE80];
  }
  uint64_t result = v19;
  *(void *)(v19 + 16) = v3;
  return result;
}

uint64_t sub_2511BC378@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  return sub_2511BB390(a1, a2, a3);
}

void sub_2511BC394()
{
  if (!qword_26B216878)
  {
    unint64_t v0 = sub_2511C9610();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B216878);
    }
  }
}

unint64_t sub_2511BC3EC()
{
  unint64_t result = qword_26B216850;
  if (!qword_26B216850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B216850);
  }
  return result;
}

uint64_t sub_2511BC440(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2511BC394();
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2511BC4AC()
{
  unint64_t result = qword_26B217C38;
  if (!qword_26B217C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B217C38);
  }
  return result;
}

uint64_t sub_2511BC500(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  sub_251138C78(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x253397D40);
  }
  return result;
}

uint64_t method lookup function for InputSignalAnchorSet(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InputSignalAnchorSet);
}

uint64_t dispatch thunk of InputSignalAnchorSet.__allocating_init(signalAnchors:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t destroy for InputSignalAnchorSet.EncodedAnchor(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(a1 + 40);

  return sub_251150EE4(v2, v3);
}

void *initializeWithCopy for InputSignalAnchorSet.EncodedAnchor(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[4];
  unint64_t v6 = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_251171E6C(v5, v6);
  a1[4] = v5;
  a1[5] = v6;
  return a1;
}

void *assignWithCopy for InputSignalAnchorSet.EncodedAnchor(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[4];
  unint64_t v4 = a2[5];
  sub_251171E6C(v5, v4);
  uint64_t v6 = a1[4];
  unint64_t v7 = a1[5];
  a1[4] = v5;
  a1[5] = v4;
  sub_251150EE4(v6, v7);
  return a1;
}

void *assignWithTake for InputSignalAnchorSet.EncodedAnchor(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a1[4];
  unint64_t v7 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_251150EE4(v6, v7);
  return a1;
}

ValueMetadata *type metadata accessor for InputSignalAnchorSet.EncodedAnchor()
{
  return &type metadata for InputSignalAnchorSet.EncodedAnchor;
}

unint64_t sub_2511BC784()
{
  unint64_t result = qword_26B217C20;
  if (!qword_26B217C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B217C20);
  }
  return result;
}

void sub_2511BC7D8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_2511BC784();
    unint64_t v7 = a3(a1, &type metadata for InputSignalAnchorSet.EncodedAnchor.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2511BC83C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for InputSignalAnchorSet.EncodedAnchor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    char *result = a2 + 1;
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
        JUMPOUT(0x2511BC968);
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
          char *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InputSignalAnchorSet.EncodedAnchor.CodingKeys()
{
  return &type metadata for InputSignalAnchorSet.EncodedAnchor.CodingKeys;
}

unint64_t sub_2511BC9A4()
{
  unint64_t result = qword_269B228C8[0];
  if (!qword_269B228C8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269B228C8);
  }
  return result;
}

unint64_t sub_2511BC9FC()
{
  unint64_t result = qword_26B217C30;
  if (!qword_26B217C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B217C30);
  }
  return result;
}

unint64_t sub_2511BCA54()
{
  unint64_t result = qword_26B217C28;
  if (!qword_26B217C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B217C28);
  }
  return result;
}

uint64_t sub_2511BCAA8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x80000002511D2280 || (sub_2511C9CA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x536465646F636E65 && a2 == 0xED00006C616E6769)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_2511C9CA0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void *AutoPriorityThresholdController.__allocating_init(target:environment:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = (void *)swift_allocObject();
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8))(&v14, ObjectType, a2);
  char v8 = v14;
  sub_2511BD708();
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 36) = 0;
  *(_WORD *)(v9 + 16) = 1028;
  *(unsigned char *)(v9 + 18) = v8;
  *(void *)(v9 + 24) = 0;
  *(unsigned char *)(v9 + 32) = 0;
  v6[2] = v9;
  v6[3] = a1;
  v6[4] = a2;
  v6[5] = a3;
  uint64_t v10 = *(os_unfair_lock_s **)(a3 + 16);
  uint64_t v11 = (uint64_t)&v10[4];
  uint64_t v12 = v10 + 10;
  swift_retain_n();
  swift_unknownObjectRetain();
  swift_retain();
  os_unfair_lock_lock(v12);
  sub_251170984(v11);
  os_unfair_lock_unlock(v12);
  swift_release();
  swift_unknownObjectRelease();
  swift_release_n();
  return v6;
}

void *AutoPriorityThresholdController.init(target:environment:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = sub_2511BD5F8(a1, a2, a3);
  swift_release();
  return v3;
}

Swift::Void __swiftcall AutoPriorityThresholdController.autoUpdatePriorityThreshold(using:)(HealthOrchestration::PriorityRuleSet using)
{
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 16);
  int v3 = (unsigned __int8 *)&v2[4];
  unsigned int v4 = v2 + 9;
  os_unfair_lock_lock(v2 + 9);
  sub_2511BD768(v3);
  os_unfair_lock_unlock(v4);
}

void sub_2511BCD84(unsigned __int8 *a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  *((void *)a1 + 1) = a2;
  a1[16] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v9 = *a1;
  unsigned __int8 v10 = a1[2];
  uint64_t v19 = a2;
  unsigned __int8 v20 = a3;
  uint64_t v11 = *(void *)(*(void *)(a4 + 40) + 16);
  uint64_t v12 = (void *)(v11 + 16);
  double v13 = (os_unfair_lock_s *)(v11 + 40);
  swift_bridgeObjectRetain();
  os_unfair_lock_lock(v13);
  sub_251144C54(v12, &fora);
  if (v4)
  {
    os_unfair_lock_unlock(v13);
    __break(1u);
  }
  else
  {
    os_unfair_lock_unlock(v13);
    PriorityRuleSet.priority(for:)(fora);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char rawValue = (char)fora._rawValue;
    a1[1] = fora._rawValue;
    if (v9 == 4) {
      char v15 = rawValue;
    }
    else {
      char v15 = v9;
    }
    if ((sub_25114DC38(v10, v15) & 1) == 0)
    {
      a1[2] = v15;
      uint64_t v16 = *(void *)(a4 + 32);
      uint64_t ObjectType = swift_getObjectType();
      LOBYTE(v19) = v15;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v16 + 16))(&v19, ObjectType, v16);
    }
  }
}

Swift::Void __swiftcall AutoPriorityThresholdController.autoUpdatePriorityThreshold(pauseIfAnyMatches:)(Swift::OpaquePointer pauseIfAnyMatches)
{
  sub_2511BD78C();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2511CB450;
  *(Swift::OpaquePointer *)(v3 + 32) = pauseIfAnyMatches;
  *(unsigned char *)(v3 + 40) = 1;
  uint64_t v4 = *(void *)(v1 + 16);
  char v5 = (unsigned __int8 *)(v4 + 16);
  unsigned int v6 = (os_unfair_lock_s *)(v4 + 36);
  swift_bridgeObjectRetain();
  os_unfair_lock_lock(v6);
  sub_2511BDA74(v5);
  os_unfair_lock_unlock(v6);
  swift_bridgeObjectRelease();
}

void AutoPriorityThresholdController.manualPriorityThreshold.getter(unsigned char *a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v4 = v3 + 4;
  char v5 = v3 + 9;
  os_unfair_lock_lock(v3 + 9);
  sub_2511BD148(v4, a1);

  os_unfair_lock_unlock(v5);
}

void sub_2511BD010(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)a1 + 16);
  uint64_t v4 = v3 + 4;
  char v5 = v3 + 9;
  os_unfair_lock_lock(v3 + 9);
  sub_2511BD148(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

void sub_2511BD07C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)a2 + 16);
  uint64_t v3 = (unsigned __int8 *)&v2[4];
  uint64_t v4 = v2 + 9;
  os_unfair_lock_lock(v2 + 9);
  sub_2511BDA5C(v3);
  os_unfair_lock_unlock(v4);
}

void AutoPriorityThresholdController.manualPriorityThreshold.setter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (unsigned __int8 *)&v1[4];
  uint64_t v3 = v1 + 9;
  os_unfair_lock_lock(v1 + 9);
  sub_2511BD7E4(v2);
  os_unfair_lock_unlock(v3);
}

unsigned char *sub_2511BD148@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2511BD154(unsigned __int8 *a1, unsigned __int8 a2, uint64_t a3)
{
  unint64_t v4 = 0xEB00000000646569;
  uint64_t v5 = 0x6669636570736E75;
  *a1 = a2;
  unsigned int v6 = a1[1];
  uint64_t v7 = a1[2];
  if (v6 == 4) {
    unsigned int v6 = a1[2];
  }
  if (a2 == 4) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = a2;
  }
  uint64_t v10 = 0x6669636570736E75;
  unint64_t v11 = 0xEB00000000646569;
  switch(v7)
  {
    case 1:
      unint64_t v11 = 0xE600000000000000;
      uint64_t v10 = 0x746E65677275;
      break;
    case 2:
      uint64_t v10 = 0x616E65746E69616DLL;
      unint64_t v11 = 0xEB0000000065636ELL;
      break;
    case 3:
      unint64_t v11 = 0xE700000000000000;
      uint64_t v10 = 0x64656B636F6C62;
      break;
    default:
      break;
  }
  switch(v8)
  {
    case 1:
      unint64_t v4 = 0xE600000000000000;
      if (v10 == 0x746E65677275) {
        goto LABEL_17;
      }
      goto LABEL_19;
    case 2:
      uint64_t v5 = 0x616E65746E69616DLL;
      unint64_t v4 = 0xEB0000000065636ELL;
      goto LABEL_14;
    case 3:
      unint64_t v4 = 0xE700000000000000;
      if (v10 == 0x64656B636F6C62) {
        goto LABEL_17;
      }
      goto LABEL_19;
    default:
LABEL_14:
      if (v10 != v5) {
        goto LABEL_19;
      }
LABEL_17:
      if (v11 == v4) {
        return swift_bridgeObjectRelease_n();
      }
LABEL_19:
      char v13 = sub_2511C9CA0();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v13 & 1) == 0)
      {
        a1[2] = v8;
        uint64_t v14 = *(void *)(a3 + 32);
        uint64_t ObjectType = swift_getObjectType();
        char v16 = v8;
        return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 16))(&v16, ObjectType, v14);
      }
      return result;
  }
}

void (*AutoPriorityThresholdController.manualPriorityThreshold.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  unint64_t v4 = a1 + 3;
  *a1 = v1;
  a1[1] = v3;
  uint64_t v5 = v3 + 4;
  unsigned int v6 = v3 + 9;
  os_unfair_lock_lock(v3 + 9);
  sub_2511BD148(v5, v4);
  a1[2] = 0;
  os_unfair_lock_unlock(v6);
  return sub_2511BD404;
}

void sub_2511BD404(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 36));
  sub_2511BDA5C((unsigned __int8 *)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 36));
}

void AutoPriorityThresholdController.priorityThreshold.getter(unsigned char *a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  unint64_t v4 = (unsigned __int8 *)&v3[4];
  uint64_t v5 = v3 + 9;
  os_unfair_lock_lock(v3 + 9);
  sub_2511BD4FC(v4, a1);

  os_unfair_lock_unlock(v5);
}

unsigned __int8 *sub_2511BD4FC@<X0>(unsigned __int8 *result@<X0>, unsigned char *a2@<X8>)
{
  int v2 = *result;
  int v3 = result[1];
  if (v3 == 4) {
    LOBYTE(v3) = result[2];
  }
  if (v2 == 4) {
    LOBYTE(v2) = v3;
  }
  *a2 = v2;
  return result;
}

Swift::Void __swiftcall AutoPriorityThresholdController.didUpdate(environmentalState:)(Swift::OpaquePointer environmentalState)
{
  int v2 = *(os_unfair_lock_s **)(v1 + 16);
  uint64_t v3 = (uint64_t)&v2[4];
  unint64_t v4 = v2 + 9;
  os_unfair_lock_lock(v2 + 9);
  sub_25114AE9C(v3);

  os_unfair_lock_unlock(v4);
}

uint64_t AutoPriorityThresholdController.deinit()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t AutoPriorityThresholdController.__deallocating_deinit()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

void *sub_2511BD5F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = v3;
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8))(&v15, ObjectType, a2);
  char v9 = v15;
  sub_2511BD708();
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 36) = 0;
  *(_WORD *)(v10 + 16) = 1028;
  *(unsigned char *)(v10 + 18) = v9;
  *(void *)(v10 + 24) = 0;
  *(unsigned char *)(v10 + 32) = 0;
  v4[2] = v10;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = a3;
  unint64_t v11 = *(os_unfair_lock_s **)(a3 + 16);
  uint64_t v12 = (uint64_t)&v11[4];
  char v13 = v11 + 10;
  swift_retain_n();
  swift_unknownObjectRetain();
  swift_retain();
  os_unfair_lock_lock(v13);
  sub_251170C5C(v12);
  os_unfair_lock_unlock(v13);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  return v4;
}

void sub_2511BD708()
{
  if (!qword_26B218918)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_2511C99D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B218918);
    }
  }
}

void sub_2511BD768(unsigned __int8 *a1)
{
  sub_2511BCD84(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32));
}

void sub_2511BD78C()
{
  if (!qword_26B218980)
  {
    unint64_t v0 = sub_2511C9C60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B218980);
    }
  }
}

uint64_t sub_2511BD7E4(unsigned __int8 *a1)
{
  return sub_2511BD154(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t dispatch thunk of PriorityThresholdControllable.priorityThreshold.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PriorityThresholdControllable.priorityThreshold.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of PriorityThresholdControllable.priorityThreshold.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t type metadata accessor for AutoPriorityThresholdController()
{
  return self;
}

uint64_t method lookup function for AutoPriorityThresholdController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AutoPriorityThresholdController);
}

uint64_t dispatch thunk of AutoPriorityThresholdController.__allocating_init(target:environment:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_2511BD89C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AutoPriorityThresholdController.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for AutoPriorityThresholdController.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoPriorityThresholdController.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 17)) {
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

uint64_t storeEnumTagSinglePayload for AutoPriorityThresholdController.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AutoPriorityThresholdController.State()
{
  return &type metadata for AutoPriorityThresholdController.State;
}

uint64_t sub_2511BDA5C(unsigned __int8 *a1)
{
  return sub_2511BD7E4(a1);
}

void sub_2511BDA74(unsigned __int8 *a1)
{
}

void sub_2511BDA8C(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)(a3 + ((*(unsigned int *)(*(void *)a3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  a1(v4);
  os_unfair_lock_unlock(v5);
}

void IndependentAtomicProperty.wrappedValue.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = **v1;
  uint64_t v4 = (uint64_t)*v1 + *(void *)(*MEMORY[0x263F8DD00] + v3 + 16);
  uint64_t v5 = (os_unfair_lock_s *)((char *)*v1 + ((*(unsigned int *)(v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_25118BF70(v4, a1);
  os_unfair_lock_unlock(v5);
}

uint64_t IndependentAtomicProperty.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  sub_2511BDF18();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8);

  return v4(a1);
}

uint64_t IndependentAtomicProperty.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_2511BDE98();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  *a3 = v6;
  return result;
}

void (*IndependentAtomicProperty.wrappedValue.modify(void *a1, uint64_t a2))(uint64_t a1, char a2)
{
  uint64_t v5 = malloc(0x30uLL);
  *a1 = v5;
  *uint64_t v5 = a2;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a2 + 16);
  void v5[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[3] = v7;
  size_t v8 = *(void *)(v7 + 64);
  v5[4] = malloc(v8);
  char v9 = malloc(v8);
  v5[5] = v9;
  IndependentAtomicProperty.wrappedValue.getter((uint64_t)v9);
  return sub_2511BDDAC;
}

void sub_2511BDDAC(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 32);
  uint64_t v4 = *(void **)(*(void *)a1 + 40);
  uint64_t v5 = *(void *)(*(void *)a1 + 16);
  uint64_t v6 = *(void *)(*(void *)a1 + 24);
  if (a2)
  {
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 32), v4, v5);
    sub_2511BDF18();
    uint64_t v7 = *(void (**)(void *, uint64_t))(v6 + 8);
    v7(v3, v5);
    v7(v4, v5);
  }
  else
  {
    sub_2511BDF18();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t sub_2511BDE98()
{
  return sub_2511C99C0();
}

void sub_2511BDF18()
{
  uint64_t v1 = **v0;
  uint64_t v2 = (uint64_t)*v0 + *(void *)(*MEMORY[0x263F8DD00] + v1 + 16);
  uint64_t v3 = (os_unfair_lock_s *)((char *)*v0 + ((*(unsigned int *)(v1 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v3);
  sub_25118C548(v2);
  os_unfair_lock_unlock(v3);
}

void sub_2511BDFBC(uint64_t a1@<X8>)
{
}

void sub_2511BE008()
{
}

uint64_t sub_2511BE048()
{
  return 8;
}

void *sub_2511BE054(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t type metadata accessor for IndependentAtomicProperty()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2511BE078@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(v4 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(v4 + *MEMORY[0x263F8DD00]) - 8) + 16))(a2, v3);
}

uint64_t sub_2511BE110@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *a2 = sub_2511BE51C;
  a2[1] = v6;
  return swift_retain();
}

uint64_t sub_2511BE190(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = *a2;
  swift_beginAccess();
  *(void *)(v6 + 16) = sub_2511B56B0;
  *(void *)(v6 + 24) = v5;
  swift_retain();
  return swift_release();
}

uint64_t MockContextProviderDelegate.updateHandler.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t MockContextProviderDelegate.updateHandler.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_release();
}

uint64_t (*MockContextProviderDelegate.updateHandler.modify())()
{
  return j__swift_endAccess;
}

Swift::Void __swiftcall MockContextProviderDelegate.didUpdate(contexts:)(Swift::OpaquePointer contexts)
{
  swift_beginAccess();
  uint64_t v3 = *(void (**)(void *))(v1 + 16);
  swift_retain();
  v3(contexts._rawValue);
  swift_release();
}

uint64_t MockContextProviderDelegate.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = nullsub_1;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t MockContextProviderDelegate.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = nullsub_1;
  *(void *)(v0 + 24) = 0;
  return result;
}

uint64_t MockContextProviderDelegate.deinit()
{
  swift_release();
  return v0;
}

uint64_t MockContextProviderDelegate.__deallocating_deinit()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_2511BE428(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void (**)(uint64_t))(v1 + 16);
  swift_retain();
  v3(a1);
  return swift_release();
}

uint64_t type metadata accessor for MockContextProviderDelegate()
{
  return self;
}

uint64_t method lookup function for MockContextProviderDelegate(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MockContextProviderDelegate);
}

uint64_t dispatch thunk of MockContextProviderDelegate.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2511BE4E4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2511BE51C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t dispatch thunk of InputSignalProvider.inputSignals(for:observer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t sub_2511BE560(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v3 = a1;
  uint64_t v29 = MEMORY[0x263F8EE78];
  sub_2511C9A20();
  uint64_t result = sub_2511BBB68(v3);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = v3 + 64;
  uint64_t v24 = v3 + 80;
  uint64_t v25 = v1;
  int v26 = v5;
  uint64_t v27 = v3;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(v3 + 32))
  {
    unint64_t v10 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_22;
    }
    if (*(_DWORD *)(v3 + 36) != v5) {
      goto LABEL_23;
    }
    uint64_t v11 = v8;
    uint64_t v28 = v7;
    uint64_t v12 = *(void *)(v3 + 56);
    char v13 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v6);
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    uint64_t v16 = *(void *)(v12 + 8 * v6);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    unint64_t v17 = sub_251153530(v2);
    type metadata accessor for DebugSnapshot();
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = v15;
    v18[3] = v14;
    uint64_t v3 = v27;
    v18[4] = v16;
    v18[5] = v17;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2511C99F0();
    sub_2511C9A30();
    sub_2511C9A40();
    uint64_t result = sub_2511C9A00();
    int64_t v9 = 1 << *(unsigned char *)(v27 + 32);
    if (v6 >= v9) {
      goto LABEL_24;
    }
    uint64_t v19 = *(void *)(v11 + 8 * v10);
    if ((v19 & (1 << v6)) == 0) {
      goto LABEL_25;
    }
    int v5 = v26;
    if (*(_DWORD *)(v27 + 36) != v26) {
      goto LABEL_26;
    }
    uint64_t v8 = v11;
    unint64_t v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      int64_t v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      uint64_t v2 = MEMORY[0x263F8EE78];
    }
    else
    {
      unint64_t v21 = v10 + 1;
      unint64_t v22 = (unint64_t)(v9 + 63) >> 6;
      uint64_t v2 = MEMORY[0x263F8EE78];
      if (v10 + 1 < v22)
      {
        unint64_t v23 = *(void *)(v11 + 8 * v21);
        if (v23)
        {
LABEL_18:
          int64_t v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v10)
          {
            unint64_t v23 = *(void *)(v24 + 8 * v10++);
            if (v23)
            {
              unint64_t v21 = v10 + 1;
              goto LABEL_18;
            }
          }
        }
      }
    }
    uint64_t v7 = v28 + 1;
    uint64_t v6 = v9;
    if (v28 + 1 == v25) {
      return v29;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t EnvironmentalStateManager.debugSnapshot.getter()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 40);
  os_unfair_lock_lock(v1);
  sub_2511BF60C(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

void EnvironmentalStateManager.register(observer:)(uint64_t a1)
{
  swift_getObjectType();

  sub_2511C0540(a1, v1);
}

uint64_t EnvironmentalStateManager.currentState.getter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = v1 + 4;
  uint64_t v3 = v1 + 10;
  os_unfair_lock_lock(v1 + 10);
  sub_251144C54(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_2511BE8CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v9)(uint64_t *__return_ptr, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;

  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = v6 + 40;
    do
    {
      int64_t v9 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v8 - 8);
      unint64_t v10 = swift_retain();
      v9(&v18, v10);
      uint64_t v11 = v18;
      swift_release();
      if (v11)
      {
        swift_unknownObjectRelease();
        if (v11 == a2) {
          return swift_bridgeObjectRelease();
        }
      }
      v8 += 16;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  char v13 = swift_allocObject();
  *(void *)(v13 + 24) = a3;
  swift_unknownObjectWeakInit();
  uint64_t v14 = *(void **)(a1 + 16);
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v14 = sub_2511470B4(0, v14[2] + 1, 1, v14, &qword_26B218138, (uint64_t (*)(uint64_t))sub_2511C14E0);
  }
  uint64_t v16 = v14[2];
  uint64_t v15 = v14[3];
  if (v16 >= v15 >> 1) {
    uint64_t v14 = sub_2511470B4((void *)(v15 > 1), v16 + 1, 1, v14, &qword_26B218138, (uint64_t (*)(uint64_t))sub_2511C14E0);
  }
  void v14[2] = v16 + 1;
  unint64_t v17 = &v14[2 * v16];
  v17[4] = sub_25112D0A4;
  v17[5] = v13;
  uint64_t result = swift_release();
  *(void *)(a1 + 16) = v14;
  return result;
}

void EnvironmentalStateManager.remove(observer:)()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 10;
  os_unfair_lock_lock(v1 + 10);
  sub_2511C059C(v2);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_2511BEAE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 16;
  swift_unknownObjectRetain();
  uint64_t v5 = sub_2511C12E0(v4, a2);
  uint64_t result = swift_unknownObjectRelease();
  int64_t v7 = *(void *)(*(void *)(a1 + 16) + 16);
  if (v7 >= v5) {
    return sub_251147534(v5, v7, &qword_26B218138, (uint64_t (*)(uint64_t))sub_2511C14E0);
  }
  __break(1u);
  return result;
}

uint64_t EnvironmentalStateManager.__allocating_init(logger:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_2511448BC(0, &qword_26B218068);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 16) = 0;
  *(void *)(v2 + 24) = v3;
  uint64_t v4 = MEMORY[0x263F8EE78];
  unint64_t v5 = sub_251148DEC(MEMORY[0x263F8EE78]);
  unint64_t v6 = sub_251153D04(v4);
  sub_2511448BC(0, &qword_26B216818);
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 40) = 0;
  *(void *)(v7 + 16) = v5;
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 32) = v4;
  *(void *)(v2 + 16) = v7;
  uint64_t v8 = v2 + OBJC_IVAR____TtC19HealthOrchestration25EnvironmentalStateManager_logger;
  uint64_t v9 = sub_2511C92A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, a1, v9);
  return v2;
}

uint64_t EnvironmentalStateManager.init(logger:)(uint64_t a1)
{
  sub_2511448BC(0, &qword_26B218068);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 16) = 0;
  *(void *)(v1 + 24) = v3;
  uint64_t v4 = MEMORY[0x263F8EE78];
  unint64_t v5 = sub_251148DEC(MEMORY[0x263F8EE78]);
  unint64_t v6 = sub_251153D04(v4);
  sub_2511448BC(0, &qword_26B216818);
  uint64_t v7 = swift_allocObject();
  *(_DWORD *)(v7 + 40) = 0;
  *(void *)(v7 + 16) = v5;
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 32) = v4;
  *(void *)(v1 + 16) = v7;
  uint64_t v8 = v1 + OBJC_IVAR____TtC19HealthOrchestration25EnvironmentalStateManager_logger;
  uint64_t v9 = sub_2511C92A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, a1, v9);
  return v1;
}

Swift::Void __swiftcall EnvironmentalStateManager.start(providers:)(Swift::OpaquePointer providers)
{
  type metadata accessor for EnvironmentalStateManager.ObservationShim();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(v3 + 24) = &protocol witness table for EnvironmentalStateManager;
  swift_unknownObjectWeakAssign();
  swift_retain();
  sub_2511C0F54((uint64_t)providers._rawValue, v3);
  swift_release();
  uint64_t v4 = *(os_unfair_lock_s **)(v1 + 16);
  unint64_t v5 = (uint64_t *)&v4[4];
  unint64_t v6 = v4 + 10;
  os_unfair_lock_lock(v4 + 10);
  sub_2511C1180(v5);
  os_unfair_lock_unlock(v6);
  swift_bridgeObjectRelease();
  swift_release();
}

void sub_2511BEE6C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (*(void *)(a1[1] + 16))
  {
    swift_retain_n();
    uint64_t v7 = sub_2511C9280();
    os_log_type_t v8 = sub_2511C9760();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      *(void *)&long long v17 = v10;
      *(_DWORD *)uint64_t v9 = 136315138;
      uint64_t v18 = a2;
      type metadata accessor for EnvironmentalStateManager();
      swift_retain();
      uint64_t v11 = sub_2511C94C0();
      uint64_t v18 = sub_251140E4C(v11, v12, (uint64_t *)&v17);
      sub_2511C98A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25112A000, v7, v8, "Attempt to start %s more than once.", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x253397D40](v10, -1, -1);
      MEMORY[0x253397D40](v9, -1, -1);
    }
    else
    {
      swift_release_n();
    }
  }
  else
  {
    uint64_t v14 = MEMORY[0x263F8EE80];
    uint64_t v18 = MEMORY[0x263F8EE80];
    uint64_t v15 = *(void *)(a3 + 16);
    if (v15)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = 0;
      while (1)
      {
        long long v17 = *(_OWORD *)(a3 + 16 * v16 + 32);
        swift_unknownObjectRetain();
        sub_2511BF0BC(&v18, (uint64_t *)&v17, a2, a1);
        if (v4) {
          break;
        }
        uint64_t v4 = 0;
        ++v16;
        swift_unknownObjectRelease();
        if (v15 == v16)
        {
          swift_bridgeObjectRelease();
          uint64_t v14 = v18;
          goto LABEL_9;
        }
      }
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      __break(1u);
    }
    else
    {
LABEL_9:
      swift_bridgeObjectRelease();
      a1[1] = v14;
    }
  }
}

void sub_2511BF0BC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  uint64_t v9 = v30(ObjectType, v6);
  if (!*(void *)(*a1 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  sub_251149240(v9, v10);
  char v12 = v11;
  swift_bridgeObjectRelease();
  if ((v12 & 1) == 0)
  {
LABEL_6:
    uint64_t v20 = v30(ObjectType, v6);
    uint64_t v22 = v21;
    swift_unknownObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v31 = *a1;
    *a1 = 0x8000000000000000;
    sub_2511AA164(v7, v6, v20, v22, isUniquelyReferenced_nonNull_native);
    *a1 = v31;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v24 = v30(ObjectType, v6);
    uint64_t v26 = v25;
    uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16))(ObjectType, v6);
    char v28 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v32 = *a4;
    *a4 = 0x8000000000000000;
    sub_251149C60(v27, v24, v26, v28);
    *a4 = v32;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  swift_unknownObjectRetain_n();
  char v13 = sub_2511C9280();
  os_log_type_t v14 = sub_2511C9760();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v33 = v29;
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v16 = v30(ObjectType, v6);
    sub_251140E4C(v16, v17, &v33);
    sub_2511C98A0();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    sub_251131944(0, qword_26B216760);
    swift_unknownObjectRetain();
    uint64_t v18 = sub_2511C94C0();
    sub_251140E4C(v18, v19, &v33);
    sub_2511C98A0();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25112A000, v13, v14, "Two environmental state components have the same identifier (%s). Ignoring the second (%s)", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253397D40](v29, -1, -1);
    MEMORY[0x253397D40](v15, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }
}

uint64_t sub_2511BF440()
{
  sub_25117E35C(v0 + 16);

  return swift_deallocClassInstance();
}

void EnvironmentalStateManager.didUpdate(state:for:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 24) + 16);
  os_unfair_lock_lock(v1);
  sub_25114A874();
  os_unfair_lock_unlock(v1);
}

uint64_t EnvironmentalStateManager.deinit()
{
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC19HealthOrchestration25EnvironmentalStateManager_logger;
  uint64_t v2 = sub_2511C92A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t EnvironmentalStateManager.__deallocating_deinit()
{
  swift_release();
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC19HealthOrchestration25EnvironmentalStateManager_logger;
  uint64_t v2 = sub_2511C92A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

void *sub_2511BF60C@<X0>(void *a1@<X8>)
{
  unint64_t v3 = sub_251148A20(MEMORY[0x263F8EE78]);
  sub_2511473AC(0, (unint64_t *)&unk_269B22270, (uint64_t (*)(uint64_t))sub_25115A444, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2511CB450;
  *(void *)(inited + 32) = 0x6E656E6F706D6F43;
  *(void *)(inited + 40) = 0xEA00000000007374;
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_2511BE560(v5);
  swift_bridgeObjectRelease();
  if (v6 < 0 || (v6 & 0x4000000000000000) != 0)
  {
    unint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v7 = (uint64_t)sub_2511C4284(v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  uint64_t v11 = v7;
  sub_251158C80(&v11);
  if (v1)
  {
    uint64_t result = (void *)swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(inited + 48) = v11;
    unint64_t v8 = sub_251153530(inited);
    type metadata accessor for DebugSnapshot();
    uint64_t result = (void *)swift_allocObject();
    result[2] = 0x6D6E6F7269766E45;
    result[3] = 0xEB00000000746E65;
    result[4] = v3;
    result[5] = v8;
    *a1 = result;
  }
  return result;
}

uint64_t sub_2511BF7A0()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 16) + 40);
  os_unfair_lock_lock(v1);
  sub_2511BF60C(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

void *sub_2511BF804(void *result, int64_t a2, char a3, void *a4)
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
      sub_25113B21C(0, &qword_269B22970);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2511C05DC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2511BF920(void *result, int64_t a2, char a3, void *a4)
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
      sub_2511C1550(0, &qword_269B22960, &qword_269B22968);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_2511C06D0(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2511BFA44(void *result, int64_t a2, char a3, void *a4)
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
      sub_2511C1550(0, &qword_269B22950, &qword_269B22958);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
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
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2511C07BC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2511BFB80(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_2511BFF68(a1, a2, a3, a4, &qword_26B218128, (unint64_t *)&qword_26B216860);
}

void *sub_2511BFB9C(void *result, int64_t a2, char a3, void *a4)
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
      sub_25113B21C(0, &qword_26B218178);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_2511C0CF8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2511BFCB8(void *result, int64_t a2, char a3, void *a4)
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
      sub_2511473AC(0, &qword_26B218998, (uint64_t (*)(uint64_t))sub_251155608, MEMORY[0x263F8E0F8]);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      void v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 72);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[9 * v8 + 4]) {
          memmove(v12, a4 + 4, 72 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2511C0BEC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2511BFE10(void *result, int64_t a2, char a3, void *a4)
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
      sub_2511473AC(0, &qword_26B218158, (uint64_t (*)(uint64_t))sub_25116C880, MEMORY[0x263F8E0F8]);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2511C09CC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2511BFF4C(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_2511BFF68(a1, a2, a3, a4, &qword_26B2180F8, (unint64_t *)&qword_26B2178E8);
}

void *sub_2511BFF68(void *result, int64_t a2, char a3, void *a4, unint64_t *a5, unint64_t *a6)
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
      sub_2511C168C(0, a5, a6);
      char v13 = (void *)swift_allocObject();
      size_t v14 = _swift_stdlib_malloc_size(v13);
      void v13[2] = v11;
      v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
      uint64_t v15 = v13 + 4;
      if (v8)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[5 * v11 + 4]) {
          memmove(v15, a4 + 4, 40 * v11);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      char v13 = (void *)MEMORY[0x263F8EE78];
      uint64_t v15 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2511C0AD4(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_2511C00AC(char a1, int64_t a2, char a3, unint64_t a4)
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
    char v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_2511473AC(0, &qword_269B22978, MEMORY[0x263F06EA8], MEMORY[0x263F8E0F8]);
  uint64_t v10 = *(void *)(sub_2511C9180() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  char v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_2511C9AA0();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_2511C9180() - 8);
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
    sub_2511C0DFC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

void *sub_2511C0340(void *result, int64_t a2, char a3, void *a4)
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
      sub_25113B21C(0, &qword_26B218150);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      char v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_2511C08D8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2511C045C(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_2511470B4(a1, a2, a3, a4, &qword_26B216830, (uint64_t (*)(uint64_t))sub_2511C15A8);
}

void *sub_2511C0480(void *a1)
{
  return sub_2511470B4(0, a1[2], 0, a1, &qword_26B218138, (uint64_t (*)(uint64_t))sub_2511C14E0);
}

void sub_2511C04C4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2511C9AC0();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x2533971D0);
}

void sub_2511C0540(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(os_unfair_lock_s **)(a2 + 16);
  uint64_t v3 = (uint64_t)&v2[4];
  uint64_t v4 = v2 + 10;
  os_unfair_lock_lock(v2 + 10);
  sub_251170984(v3);
  os_unfair_lock_unlock(v4);
}

uint64_t sub_2511C059C(uint64_t a1)
{
  return sub_2511BEAE8(a1, *(void *)(v1 + 16));
}

uint64_t type metadata accessor for EnvironmentalStateManager.ObservationShim()
{
  return self;
}

uint64_t sub_2511C05DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

char *sub_2511C06D0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  uint64_t result = (char *)sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511C07BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_2511C15F8(0, &qword_269B22958);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511C08D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511C09CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      sub_25116C880();
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511C0AD4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 40 * a1 + 32;
    unint64_t v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      sub_251131944(0, a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511C0BEC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 72 * a1 + 32;
    unint64_t v6 = a3 + 72 * v4;
    if (v5 >= v6 || v5 + 72 * v4 <= a3)
    {
      sub_251155608();
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

char *sub_2511C0CF8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511C0DE4(uint64_t a1, uint64_t a2)
{
  return sub_25114491C(a1, a2, (void (*)(void))type metadata accessor for Orchestrator);
}

uint64_t sub_2511C0DFC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_2511C9180() - 8);
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
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511C0F54(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v4 = (void *)(a1 + 32);
  swift_bridgeObjectRetain();
  unint64_t v5 = (void *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v6 = v4[3];
    uint64_t v7 = v4[4];
    __swift_project_boxed_opaque_existential_1(v4, v6);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v7 + 8))(a2, &off_2702091A0, v6, v7);
    uint64_t v9 = *(void *)(v8 + 16);
    int64_t v10 = v5[2];
    int64_t v11 = v10 + v9;
    if (__OFADD__(v10, v9)) {
      break;
    }
    uint64_t v12 = v8;
    char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v11 <= v5[3] >> 1)
    {
      if (*(void *)(v12 + 16)) {
        goto LABEL_14;
      }
    }
    else
    {
      if (v10 <= v11) {
        int64_t v14 = v10 + v9;
      }
      else {
        int64_t v14 = v10;
      }
      unint64_t v5 = sub_25112D0FC(isUniquelyReferenced_nonNull_native, v14, 1, v5, &qword_26B218130, qword_26B216760, (uint64_t)&protocol descriptor for EnvironmentalStateComponent);
      if (*(void *)(v12 + 16))
      {
LABEL_14:
        uint64_t v15 = v5[2];
        if ((v5[3] >> 1) - v15 < v9) {
          goto LABEL_28;
        }
        unint64_t v16 = (unint64_t)&v5[2 * v15 + 4];
        if (v12 + 32 < v16 + 16 * v9 && v16 < v12 + 32 + 16 * v9) {
          goto LABEL_30;
        }
        sub_251131944(0, qword_26B216760);
        swift_arrayInitWithCopy();
        if (v9)
        {
          uint64_t v18 = v5[2];
          BOOL v19 = __OFADD__(v18, v9);
          uint64_t v20 = v18 + v9;
          if (v19) {
            goto LABEL_29;
          }
          void v5[2] = v20;
        }
        goto LABEL_4;
      }
    }
    if (v9) {
      goto LABEL_27;
    }
LABEL_4:
    swift_bridgeObjectRelease();
    v4 += 5;
    if (!--v2)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v5;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  swift_release();
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

void sub_2511C1180(uint64_t *a1)
{
  sub_2511BEE6C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t dispatch thunk of EnvironmentalStateManagerObserver.didUpdate(environmentalState:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_2511C11B0()
{
  return type metadata accessor for EnvironmentalStateManager();
}

uint64_t type metadata accessor for EnvironmentalStateManager()
{
  uint64_t result = qword_26B217D08;
  if (!qword_26B217D08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2511C1204()
{
  uint64_t result = sub_2511C92A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for EnvironmentalStateManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EnvironmentalStateManager);
}

uint64_t dispatch thunk of EnvironmentalStateManager.__allocating_init(logger:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for EnvironmentalStateManager.State()
{
  return &type metadata for EnvironmentalStateManager.State;
}

uint64_t sub_2511C12E0(uint64_t a1, uint64_t a2)
{
  void (*v8)(void *__return_ptr, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  unint64_t v13;
  void *v15;
  void (*v16)(void *__return_ptr, uint64_t);
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  long long v23;
  void v24[2];

  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  if (!v3) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = (void (*)(void *__return_ptr, uint64_t))v2[v6 + 4];
    uint64_t v9 = swift_retain();
    v8(v24, v9);
    int64_t v10 = v24[0];
    swift_release();
    if (v10)
    {
      swift_unknownObjectRelease();
      if (v10 == a2) {
        break;
      }
    }
    ++v7;
    v6 += 2;
    if (v3 == v7)
    {
      swift_bridgeObjectRelease();
      return v2[2];
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v12 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    char v13 = v2[2];
    while (v12 != v13)
    {
      if (v12 >= v13)
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      uint64_t v15 = &v2[v6];
      unint64_t v16 = (void (*)(void *__return_ptr, uint64_t))v2[v6 + 6];
      unint64_t v17 = swift_retain();
      v16(v24, v17);
      uint64_t v18 = v24[0];
      uint64_t result = swift_release();
      if (!v18 || (uint64_t result = swift_unknownObjectRelease(), v18 != a2))
      {
        if (v12 != v7)
        {
          if ((v7 & 0x8000000000000000) != 0) {
            goto LABEL_28;
          }
          BOOL v19 = v2[2];
          if (v7 >= v19) {
            goto LABEL_29;
          }
          if (v12 >= v19) {
            goto LABEL_30;
          }
          uint64_t v21 = v15[6];
          uint64_t v20 = v15[7];
          unint64_t v23 = *(_OWORD *)&v2[2 * v7 + 4];
          swift_retain();
          swift_retain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v2 = sub_2511C0480(v2);
          }
          uint64_t v22 = &v2[2 * v7];
          v22[4] = v21;
          v22[5] = v20;
          uint64_t result = swift_release();
          if (v12 >= v2[2]) {
            goto LABEL_31;
          }
          *(_OWORD *)&v2[v6 + 6] = v23;
          uint64_t result = swift_release();
          *(void *)a1 = v2;
        }
        if (__OFADD__(v7++, 1)) {
          goto LABEL_27;
        }
      }
      ++v12;
      char v13 = v2[2];
      v6 += 2;
    }
    return v7;
  }
LABEL_32:
  __break(1u);
  return result;
}

unint64_t sub_2511C14E0()
{
  unint64_t result = qword_26B217E30;
  if (!qword_26B217E30)
  {
    sub_25112D240(255, &qword_26B217E28, &qword_26B217E20, (uint64_t)&protocol descriptor for EnvironmentalStateManagerObserver, MEMORY[0x263F8D8F0]);
    unint64_t result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_26B217E30);
  }
  return result;
}

void sub_2511C1550(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_2511C15F8(255, a3);
    unint64_t v4 = sub_2511C9C60();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_2511C15A8()
{
  unint64_t result = qword_26B216838;
  if (!qword_26B216838)
  {
    unint64_t result = swift_getFunctionTypeMetadata1();
    atomic_store(result, (unint64_t *)&qword_26B216838);
  }
  return result;
}

void sub_2511C15F8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v4) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

uint64_t sub_2511C1654()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2511C168C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_251131944(255, a3);
    unint64_t v4 = sub_2511C9C60();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t static InputSignalIdentifier.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_2511C9CA0();
  }
}

__n128 InputSignalSet.LookupKey.init(identifier:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  unint64_t v2 = a1->n128_u64[1];
  a2->n128_u64[0] = a1->n128_u64[0];
  a2->n128_u64[1] = v2;
  __n128 result = a1[1];
  a2[1] = result;
  return result;
}

uint64_t sub_2511C172C()
{
  return MEMORY[0x263F8EE78];
}

uint64_t InputSignal.dependencyConfigurations(for:)()
{
  return MEMORY[0x263F8EE78];
}

uint64_t InputSignal.description.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void *__return_ptr))(a2 + 40))(v4);
  if (v4[3])
  {
    uint64_t v2 = v4[2];
  }
  else
  {
    uint64_t v2 = v4[0];
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v2;
}

HealthOrchestration::InputSignalSet __swiftcall InputSignalSet.init(signals:)(HealthOrchestration::InputSignalSet signals)
{
  v1->signals._char rawValue = signals.signals._rawValue;
  return signals;
}

uint64_t static InputSignalIdentifier.< infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 0;
  }
  else {
    return sub_2511C9CA0();
  }
}

uint64_t InputSignalIdentifier.value.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InputSignalIdentifier.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*InputSignalIdentifier.value.modify())()
{
  return nullsub_1;
}

uint64_t InputSignalIdentifier.logDescription.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InputSignalIdentifier.logDescription.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*InputSignalIdentifier.logDescription.modify())()
{
  return nullsub_1;
}

HealthOrchestration::InputSignalIdentifier __swiftcall InputSignalIdentifier.init(_:logDescription:)(Swift::String _, Swift::String_optional logDescription)
{
  v2->value = _;
  v2[1] = logDescription;
  result.logDescription = logDescription;
  result.value = _;
  return result;
}

uint64_t sub_2511C1904(uint64_t a1)
{
  unint64_t v2 = sub_2511C1E6C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2511C1940(uint64_t a1)
{
  unint64_t v2 = sub_2511C1E6C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t InputSignalIdentifier.encode(to:)(void *a1)
{
  sub_2511C1EC0(0, &qword_26B218970, MEMORY[0x263F8E0C0]);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v7 = (char *)v11 - v6;
  uint64_t v8 = *(void *)(v1 + 16);
  v11[1] = *(void *)(v1 + 24);
  void v11[2] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511C1E6C();
  sub_2511C9DA0();
  char v13 = 0;
  uint64_t v9 = v11[3];
  sub_2511C9BD0();
  if (!v9)
  {
    char v12 = 1;
    sub_2511C9BB0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t InputSignalIdentifier.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2511C1EC0(0, &qword_26B218960, MEMORY[0x263F8E040]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v18 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2511C1E6C();
  sub_2511C9D90();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    char v21 = 0;
    uint64_t v11 = sub_2511C9B60();
    uint64_t v13 = v12;
    char v20 = 1;
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_2511C9B40();
    uint64_t v16 = v15;
    unint64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v19 = v14;
    v17(v9, v6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v11;
    a2[1] = v13;
    a2[2] = v19;
    a2[3] = v16;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2511C1D34@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return InputSignalIdentifier.init(from:)(a1, a2);
}

uint64_t sub_2511C1D4C(void *a1)
{
  return InputSignalIdentifier.encode(to:)(a1);
}

uint64_t InputSignalIdentifier.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2511C94F0();

  return swift_bridgeObjectRelease();
}

uint64_t InputSignalIdentifier.hashValue.getter()
{
  return sub_2511C9D80();
}

uint64_t InputSignalIdentifier.description.getter()
{
  if (v0[3])
  {
    uint64_t v1 = v0[2];
  }
  else
  {
    uint64_t v1 = *v0;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_2511C1E6C()
{
  unint64_t result = qword_26B2185F0;
  if (!qword_26B2185F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2185F0);
  }
  return result;
}

void sub_2511C1EC0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_2511C1E6C();
    unint64_t v7 = a3(a1, &type metadata for InputSignalIdentifier.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t InputSignalSet.LookupKey.identifier.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v3 = v1[3];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v3;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

__n128 InputSignalSet.LookupKey.identifier.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __n128 result = v5;
  __n128 *v1 = v5;
  v1[1].n128_u64[0] = v2;
  v1[1].n128_u64[1] = v3;
  return result;
}

uint64_t (*InputSignalSet.LookupKey.identifier.modify())()
{
  return nullsub_1;
}

uint64_t static InputSignalSet.LookupKey.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_2511C9CA0();
  }
}

uint64_t InputSignalSet.LookupKey.hash(into:)()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t InputSignalSet.LookupKey.hashValue.getter()
{
  return sub_2511C9D80();
}

uint64_t sub_2511C20D8()
{
  return sub_2511C9D80();
}

uint64_t InputSignalSet.signals.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InputSignalSet.signals.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*InputSignalSet.signals.modify())()
{
  return nullsub_1;
}

uint64_t InputSignalSet.subscript.getter@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *v3;
  if (*(void *)(v6 + 16))
  {
    uint64_t v8 = *a1;
    uint64_t v7 = a1[1];
    uint64_t v10 = a1[2];
    uint64_t v9 = a1[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v11 = sub_25112F2DC(v8, v7, v10, v9);
    if (v12)
    {
      sub_25112FD4C(*(void *)(v6 + 56) + 40 * v11, (uint64_t)&v15);
    }
    else
    {
      uint64_t v17 = 0;
      long long v15 = 0u;
      long long v16 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
  }
  sub_2511C2284();
  int v13 = swift_dynamicCast();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a3, v13 ^ 1u, 1, a2);
}

void sub_2511C2284()
{
  if (!qword_26B2178F8[0])
  {
    sub_2511C22DC();
    unint64_t v0 = sub_2511C9890();
    if (!v1) {
      atomic_store(v0, qword_26B2178F8);
    }
  }
}

unint64_t sub_2511C22DC()
{
  unint64_t result = qword_26B2178E8;
  if (!qword_26B2178E8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B2178E8);
  }
  return result;
}

unint64_t sub_2511C2338()
{
  unint64_t result = qword_269B22980;
  if (!qword_269B22980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22980);
  }
  return result;
}

unint64_t sub_2511C2390()
{
  unint64_t result = qword_269B22988;
  if (!qword_269B22988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22988);
  }
  return result;
}

unint64_t sub_2511C23E8()
{
  unint64_t result = qword_269B22990;
  if (!qword_269B22990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22990);
  }
  return result;
}

unint64_t sub_2511C2440()
{
  unint64_t result = qword_26B218628;
  if (!qword_26B218628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B218628);
  }
  return result;
}

uint64_t sub_2511C2494()
{
  return swift_getWitnessTable();
}

uint64_t dispatch thunk of InputSignal.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of InputSignal.observer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of InputSignal.beginObservation(from:configurations:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of InputSignal.stopObservation()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of InputSignal.dependencyConfigurations(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of InputSignal.dependencyDidUpdate(anchors:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

ValueMetadata *type metadata accessor for InputSignalSet()
{
  return &type metadata for InputSignalSet;
}

uint64_t type metadata accessor for InputSignalSet.LookupKey()
{
  return __swift_instantiateGenericMetadata();
}

unsigned char *storeEnumTagSinglePayload for InputSignalIdentifier.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    char *result = a2 + 1;
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
        JUMPOUT(0x2511C262CLL);
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
          char *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InputSignalIdentifier.CodingKeys()
{
  return &type metadata for InputSignalIdentifier.CodingKeys;
}

unint64_t sub_2511C2668()
{
  unint64_t result = qword_269B22998;
  if (!qword_269B22998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B22998);
  }
  return result;
}

unint64_t sub_2511C26C0()
{
  unint64_t result = qword_26B218600;
  if (!qword_26B218600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B218600);
  }
  return result;
}

unint64_t sub_2511C2718()
{
  unint64_t result = qword_26B2185F8;
  if (!qword_26B2185F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2185F8);
  }
  return result;
}

uint64_t dispatch thunk of InputSignalConfiguration.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t XPCDispatcher.maxConcurrentItems.getter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  int v3 = v1 + 18;
  os_unfair_lock_lock(v1 + 18);
  sub_2511C290C(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

void sub_2511C27E0(uint64_t a1@<X0>, void *a2@<X8>)
{
  int v3 = *(os_unfair_lock_s **)(*(void *)a1 + 16);
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 18;
  os_unfair_lock_lock(v3 + 18);
  sub_2511C290C(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

void sub_2511C284C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(os_unfair_lock_s **)(*(void *)a2 + 16);
  uint64_t v3 = (uint64_t)&v2[4];
  uint64_t v4 = v2 + 18;
  os_unfair_lock_lock(v2 + 18);
  sub_2511C3C18(v3);
  os_unfair_lock_unlock(v4);
}

void XPCDispatcher.maxConcurrentItems.setter()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 18;
  os_unfair_lock_lock(v1 + 18);
  sub_2511C2918(v2);
  os_unfair_lock_unlock(v3);
}

uint64_t sub_2511C290C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(result + 40);
  return result;
}

uint64_t sub_2511C2918(uint64_t result)
{
  *(void *)(result + 40) = *(void *)(v1 + 16);
  return result;
}

void (*XPCDispatcher.maxConcurrentItems.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  a1[1] = v3;
  uint64_t v4 = (uint64_t)&v3[4];
  uint64_t v5 = v3 + 18;
  os_unfair_lock_lock(v3 + 18);
  sub_2511C290C(v4, &v7);
  a1[2] = 0;
  os_unfair_lock_unlock(v5);
  *a1 = v7;
  return sub_2511C29B0;
}

void sub_2511C29B0(uint64_t a1)
{
  uint64_t v1 = *(os_unfair_lock_s **)(a1 + 8);
  os_unfair_lock_lock(v1 + 18);
  sub_2511C3C18((uint64_t)&v1[4]);
  os_unfair_lock_unlock(v1 + 18);
}

uint64_t XPCDispatcher.__allocating_init(serviceName:)()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v1 = (void *)sub_2511C9480();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithServiceName_, v1);

  swift_allocObject();
  uint64_t v3 = sub_2511C349C(v2);

  return v3;
}

uint64_t XPCDispatcher.__allocating_init(connection:)(void *a1)
{
  swift_allocObject();
  uint64_t v2 = sub_2511C349C(a1);

  return v2;
}

uint64_t XPCDispatcher.init(connection:)(void *a1)
{
  uint64_t v2 = sub_2511C349C(a1);

  return v2;
}

uint64_t XPCDispatcher.start(source:)()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 18;
  os_unfair_lock_lock(v1 + 18);
  sub_2511C3584(v2);
  os_unfair_lock_unlock(v3);
  return sub_2511C2BA8();
}

uint64_t sub_2511C2BA8()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 18;
  os_unfair_lock_lock(v1 + 18);
  sub_2511C3340(v2, (uint64_t)&v9);
  os_unfair_lock_unlock(v3);
  if (!v10) {
    return sub_2511C38B4((uint64_t)&v9);
  }
  sub_25112F14C(&v9, (uint64_t)v11);
  while (1)
  {
    os_unfair_lock_lock(v3);
    sub_2511C2D04(v2, &v9);
    os_unfair_lock_unlock(v3);
    if ((v9 & 1) == 0) {
      break;
    }
    uint64_t v4 = v12;
    uint64_t v5 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    uint64_t v6 = swift_allocObject();
    swift_weakInit();
    uint64_t v7 = *(void (**)(uint64_t (*)(uint64_t *), uint64_t, uint64_t, uint64_t))(v5 + 8);
    swift_retain();
    v7(sub_2511C39F8, v6, v4, v5);
    swift_release_n();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t sub_2511C2D04@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 48);
  if (v2 >= *(void *)(result + 40))
  {
    *a2 = 0;
  }
  else
  {
    *(void *)(result + 48) = v2 + 1;
    *a2 = 1;
  }
  return result;
}

uint64_t sub_2511C2D2C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 48);
  BOOL v2 = __OFSUB__(v1, 1);
  uint64_t v3 = v1 - 1;
  if (v2) {
    __break(1u);
  }
  else {
    *(void *)(result + 48) = v3;
  }
  return result;
}

void sub_2511C2D44(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v1 + 24);
  sub_251145778((uint64_t)a1, (uint64_t)&v29);
  uint64_t v5 = swift_allocObject();
  long long v6 = v35;
  *(_OWORD *)(v5 + 104) = v34;
  *(_OWORD *)(v5 + 120) = v6;
  *(_OWORD *)(v5 + 136) = v36;
  long long v7 = v29;
  *(_OWORD *)(v5 + 40) = v30;
  long long v8 = v32;
  *(_OWORD *)(v5 + 56) = v31;
  *(_OWORD *)(v5 + 72) = v8;
  *(_OWORD *)(v5 + 88) = v33;
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 152) = v37;
  *(_OWORD *)(v5 + 24) = v7;
  uint64_t v27 = sub_2511C3A04;
  uint64_t v28 = v5;
  aBlock = (void *)MEMORY[0x263EF8330];
  uint64_t v24 = 1107296256;
  uint64_t v25 = sub_2511C315C;
  uint64_t v26 = &block_descriptor_13;
  long long v9 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v4, sel_remoteObjectProxyWithErrorHandler_, v9);
  _Block_release(v9);
  sub_2511C98E0();
  swift_unknownObjectRelease();
  sub_2511C3A10();
  if (swift_dynamicCast())
  {
    unint64_t v11 = aBlock;
    sub_25112FD4C((uint64_t)(a1 + 8), (uint64_t)&v29);
    uint64_t v12 = *a1;
    uint64_t v13 = a1[1];
    id v14 = objc_allocWithZone((Class)type metadata accessor for SecurelyCodableWorkPlan());
    swift_unknownObjectRetain();
    long long v15 = SecurelyCodableWorkPlan.init(_:context:)(&v29, v12, v13);
    long long v16 = (void *)sub_2511C9480();
    swift_bridgeObjectRetain();
    uint64_t v17 = (void *)sub_2511C9480();
    swift_bridgeObjectRelease();
    sub_251145778((uint64_t)a1, (uint64_t)&v29);
    uint64_t v18 = swift_allocObject();
    long long v19 = v35;
    *(_OWORD *)(v18 + 104) = v34;
    *(_OWORD *)(v18 + 120) = v19;
    *(_OWORD *)(v18 + 136) = v36;
    long long v20 = v29;
    *(_OWORD *)(v18 + 40) = v30;
    long long v21 = v32;
    *(_OWORD *)(v18 + 56) = v31;
    *(_OWORD *)(v18 + 72) = v21;
    *(_OWORD *)(v18 + 88) = v33;
    *(void *)(v18 + 16) = v2;
    *(void *)(v18 + 152) = v37;
    *(_OWORD *)(v18 + 24) = v20;
    uint64_t v27 = sub_2511C3ADC;
    uint64_t v28 = v18;
    aBlock = (void *)MEMORY[0x263EF8330];
    uint64_t v24 = 1107296256;
    uint64_t v25 = sub_2511C32D4;
    uint64_t v26 = &block_descriptor_15_0;
    uint64_t v22 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_remote_runWithWorkPlan_provider_executor_with_, v15, v16, v17, v22);
    swift_unknownObjectRelease();
    _Block_release(v22);
  }
}

uint64_t sub_2511C30E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t))(a3 + 120))(a3, a1);
  uint64_t v4 = *(os_unfair_lock_s **)(a2 + 16);
  uint64_t v5 = (uint64_t)&v4[4];
  long long v6 = v4 + 18;
  os_unfair_lock_lock(v4 + 18);
  sub_2511C2D2C(v5);
  os_unfair_lock_unlock(v6);
  return sub_2511C2BA8();
}

void sub_2511C315C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_2511C31C4(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    long long v6 = *(void (**)(uint64_t, void *))(a3 + 120);
    id v13 = a1;
    v6(a3, a1);
    long long v7 = *(os_unfair_lock_s **)(a2 + 16);
    uint64_t v8 = (uint64_t)&v7[4];
    long long v9 = v7 + 18;
    os_unfair_lock_lock(v7 + 18);
    sub_2511C2D2C(v8);
    os_unfair_lock_unlock(v9);
    sub_2511C2BA8();
  }
  else
  {
    (*(void (**)(uint64_t, void))(a3 + 120))(a3, 0);
    id v10 = *(os_unfair_lock_s **)(a2 + 16);
    uint64_t v11 = (uint64_t)&v10[4];
    uint64_t v12 = v10 + 18;
    os_unfair_lock_lock(v10 + 18);
    sub_2511C2D2C(v11);
    os_unfair_lock_unlock(v12);
    sub_2511C2BA8();
  }
}

void sub_2511C32D4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_2511C3340@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2511C3AE8(a1, a2);
}

uint64_t sub_2511C336C(uint64_t *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_2511C2D44(a1);
    return swift_release();
  }
  return result;
}

uint64_t XPCDispatcher.deinit()
{
  swift_release();

  return v0;
}

uint64_t XPCDispatcher.__deallocating_deinit()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_2511C3434()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)v0 + 16);
  uint64_t v2 = (uint64_t)&v1[4];
  uint64_t v3 = v1 + 18;
  os_unfair_lock_lock(v1 + 18);
  sub_2511C3584(v2);
  os_unfair_lock_unlock(v3);
  return sub_2511C2BA8();
}

uint64_t sub_2511C349C(void *a1)
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v11 = xmmword_2511D0720;
  sub_2511C3B4C();
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 72) = 0;
  sub_2511C3BAC((uint64_t)&v8, v3 + 16);
  sub_2511C3BE4((uint64_t)&v8);
  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 24) = a1;
  id v4 = self;
  id v5 = a1;
  id v6 = objc_msgSend(v4, sel_interfaceWithProtocol_, &unk_27020EC48, v8, v9, v10, v11);
  objc_msgSend(v5, sel_setRemoteObjectInterface_, v6);

  objc_msgSend(v5, sel_resume);
  return v1;
}

uint64_t sub_2511C3584(uint64_t a1)
{
  return sub_2511C3870(a1);
}

uint64_t type metadata accessor for XPCDispatcher()
{
  return self;
}

uint64_t method lookup function for XPCDispatcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCDispatcher);
}

uint64_t dispatch thunk of XPCDispatcher.__allocating_init(connection:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t destroy for XPCDispatcher.State(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

uint64_t initializeWithCopy for XPCDispatcher.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t assignWithCopy for XPCDispatcher.State(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 3);
  if (!*(void *)(a1 + 24))
  {
    if (v4)
    {
      *(void *)(a1 + 24) = v4;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *a2;
    long long v6 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
LABEL_8:
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  *(void *)(a1 + 48) = *((void *)a2 + 6);
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

uint64_t assignWithTake for XPCDispatcher.State(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCDispatcher.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCDispatcher.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCDispatcher.State()
{
  return &type metadata for XPCDispatcher.State;
}

uint64_t sub_2511C3870(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  sub_2511C38B4(a1);
  return sub_25112FD4C(v3, a1);
}

uint64_t sub_2511C38B4(uint64_t a1)
{
  sub_2511C3910();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2511C3910()
{
  if (!qword_26B2178E0)
  {
    sub_2511C3968();
    unint64_t v0 = sub_2511C9890();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2178E0);
    }
  }
}

unint64_t sub_2511C3968()
{
  unint64_t result = qword_26B216840;
  if (!qword_26B216840)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B216840);
  }
  return result;
}

uint64_t sub_2511C39C0()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2511C39F8(uint64_t *a1)
{
  return sub_2511C336C(a1);
}

uint64_t sub_2511C3A04(uint64_t a1)
{
  return sub_2511C30E4(a1, *(void *)(v1 + 16), v1 + 24);
}

unint64_t sub_2511C3A10()
{
  unint64_t result = qword_269B229A0;
  if (!qword_269B229A0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269B229A0);
  }
  return result;
}

uint64_t objectdestroy_8Tm()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 160, 7);
}

void sub_2511C3ADC(void *a1)
{
  sub_2511C31C4(a1, *(void *)(v1 + 16), v1 + 24);
}

uint64_t sub_2511C3AE8(uint64_t a1, uint64_t a2)
{
  sub_2511C3910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2511C3B4C()
{
  if (!qword_269B229A8)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_2511C99D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B229A8);
    }
  }
}

uint64_t sub_2511C3BAC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2511C3BE4(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

uint64_t sub_2511C3C18(uint64_t a1)
{
  return sub_2511C2918(a1);
}

uint64_t dispatch thunk of WorkQueueStatusObserver.didEnqueue(count:context:queueLength:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of WorkQueueStatusObserver.didFinish(workPlan:after:analytics:result:executor:context:remaining:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(a9 + 16))();
}

uint64_t WorkCriteriaRecord.__allocating_init(context:executorIdentifier:planner:criteria:)(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_allocObject();
  uint64_t v12 = sub_2511C686C(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return v12;
}

void WorkCriteriaRecord.recheck(timestamp:)(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 112);
  uint64_t v4 = (uint64_t)&v3[4];
  long long v5 = v3 + 16;
  os_unfair_lock_lock(v3 + 16);
  sub_25112CB90(v4, a1);
  os_unfair_lock_unlock(v5);
}

void WorkCriteriaRecord.check(timestamp:anchorUpdates:)(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 112);
  uint64_t v4 = (uint64_t *)&v3[4];
  long long v5 = v3 + 16;
  os_unfair_lock_lock(v3 + 16);
  sub_2511381C4(v4, a1);
  os_unfair_lock_unlock(v5);
}

uint64_t WorkCriteriaRecord.init(context:executorIdentifier:planner:criteria:)(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = sub_2511C686C(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return v6;
}

unint64_t sub_2511C3E28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6 = *(void *)(a1 + 40);
  if (!(v6 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7) {
      goto LABEL_3;
    }
LABEL_10:
    unint64_t result = swift_bridgeObjectRelease();
    if (*(unsigned char *)(a1 + 24)) {
      goto LABEL_11;
    }
    swift_retain();
    unint64_t result = swift_release();
    *(void *)a1 = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(void *)(a3 + 96) = 0;
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_2511C9AC0();
  if (!v7) {
    goto LABEL_10;
  }
LABEL_3:
  unint64_t result = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
    goto LABEL_14;
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
LABEL_14:
    uint64_t v9 = MEMORY[0x2533971C0](result, v6);
    goto LABEL_8;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v9 = *(void *)(v6 + 8 * result + 32);
    swift_retain();
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v9 + 16);
    long long v11 = (void *)(v10 + 16);
    uint64_t v12 = (os_unfair_lock_s *)(v10 + 36);
    swift_retain();
    os_unfair_lock_lock(v12);
    sub_2511C7F08(v11);
    os_unfair_lock_unlock(v12);
    swift_release();
    unint64_t result = swift_release();
LABEL_11:
    *(void *)a3 = 2;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 72) = 0u;
    *(_OWORD *)(a3 + 88) = 0u;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_2511C3FAC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t WorkCriteriaRecord.deinit()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t WorkCriteriaRecord.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t WorkCriteriaRecord.description.getter()
{
  swift_retain();
  WorkCriteria.description.getter();
  sub_2511C9520();
  swift_release();
  swift_bridgeObjectRelease();
  sub_2511C9520();
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_2511C9520();
  swift_bridgeObjectRelease();
  sub_2511C9520();
  if (!v1) {
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  sub_2511C9520();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2511C9520();
  sub_2511C9520();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2511C9520();
  return 60;
}

uint64_t sub_2511C4260()
{
  return WorkCriteriaRecord.description.getter();
}

void *sub_2511C4284(unint64_t a1)
{
  return sub_2511C44E8(a1, (void (*)(void *, uint64_t, unint64_t))sub_2511C5940);
}

uint64_t sub_2511C429C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  sub_251130900(0, &qword_26B218108, (uint64_t)&type metadata for Orchestrator.InputSignalRecord, MEMORY[0x263F8E0F8]);
  uint64_t v3 = swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 48);
  uint64_t v5 = sub_2511C6210((uint64_t)&v7, (_OWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_25112EB80();
  if (v5 != v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_2511C43B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_251130900(0, &qword_269B221B8, (uint64_t)&type metadata for ScopedExecutorIdentifier, MEMORY[0x263F8E0F8]);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 48);
  uint64_t v5 = sub_2511C6634(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25112EB80();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_2511C44D0(unint64_t a1)
{
  return sub_2511C44E8(a1, (void (*)(void *, uint64_t, unint64_t))sub_2511C5B90);
}

void *sub_2511C44E8(unint64_t a1, void (*a2)(void *, uint64_t, unint64_t))
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
      sub_251130900(0, (unint64_t *)&qword_26B218188, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
      uint64_t v5 = (void *)swift_allocObject();
      int64_t v6 = _swift_stdlib_malloc_size(v5);
      uint64_t v7 = v6 - 32;
      if (v6 < 32) {
        uint64_t v7 = v6 - 25;
      }
      void v5[2] = v4;
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
    uint64_t v4 = sub_2511C9AC0();
    swift_bridgeObjectRelease();
    if (!v4) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v5;
}

void *sub_2511C4614(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_251130900(0, &qword_26B218990, (uint64_t)&type metadata for InputSignalIdentifier, MEMORY[0x263F8E0F8]);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 1;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 5);
  uint64_t v6 = sub_2511C6418((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25112EB80();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2511C471C(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    unint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    long long v11 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2511C4DA8(v12, v13, (uint64_t)v17);
    sub_2511C8014(v17[0], v17[1]);
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    unint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:

  return swift_release();
}

uint64_t sub_2511C48FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v37 = a1 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v38 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v9 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v10 = v9 | (v38 << 6);
      }
      else
      {
        int64_t v11 = v38 + 1;
        if (__OFADD__(v38, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v11 >= v36) {
          goto LABEL_47;
        }
        unint64_t v12 = *(void *)(v37 + 8 * v11);
        int64_t v13 = v38 + 1;
        if (!v12)
        {
          int64_t v13 = v38 + 2;
          if (v38 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v12 = *(void *)(v37 + 8 * v13);
          if (!v12)
          {
            int64_t v13 = v38 + 3;
            if (v38 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v12 = *(void *)(v37 + 8 * v13);
            if (!v12)
            {
              int64_t v13 = v38 + 4;
              if (v38 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v12 = *(void *)(v37 + 8 * v13);
              if (!v12)
              {
                int64_t v14 = v38 + 5;
                if (v38 + 5 >= v36)
                {
LABEL_47:
                  sub_25112EB80();
                  return v2;
                }
                unint64_t v12 = *(void *)(v37 + 8 * v14);
                if (!v12)
                {
                  while (1)
                  {
                    int64_t v13 = v14 + 1;
                    if (__OFADD__(v14, 1)) {
                      break;
                    }
                    if (v13 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v12 = *(void *)(v37 + 8 * v13);
                    ++v14;
                    if (v12) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v13 = v38 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v12 - 1) & v12;
        unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
        int64_t v38 = v13;
      }
      unint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 32 * v10);
      uint64_t v17 = *v15;
      uint64_t v16 = v15[1];
      sub_2511C9D40();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      sub_2511C94F0();
      swift_bridgeObjectRelease();
      uint64_t v18 = sub_2511C9D80();
      uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v20 = v18 & ~v19;
      if ((*(void *)(v8 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    uint64_t v21 = *(void *)(v2 + 48);
    uint64_t v22 = (void *)(v21 + 32 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (v23 || (sub_2511C9CA0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v39 = a1;
      uint64_t v40 = v37;
      uint64_t v41 = v35;
      int64_t v42 = v38;
      unint64_t v43 = v7;
    }
    else
    {
      uint64_t v24 = ~v19;
      do
      {
        unint64_t v20 = (v20 + 1) & v24;
        if (((*(void *)(v8 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
          goto LABEL_6;
        }
        uint64_t v25 = (void *)(v21 + 32 * v20);
        BOOL v26 = *v25 == v17 && v25[1] == v16;
      }
      while (!v26 && (sub_2511C9CA0() & 1) == 0);
      uint64_t v39 = a1;
      uint64_t v40 = v37;
      uint64_t v41 = v35;
      int64_t v42 = v38;
      unint64_t v43 = v7;
      swift_bridgeObjectRelease();
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v28 = *(unsigned char *)(v2 + 32);
    unint64_t v29 = (unint64_t)((1 << v28) + 63) >> 6;
    size_t v30 = 8 * v29;
    if ((v28 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      memcpy((char *)&v34 - ((v30 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v30);
      uint64_t v31 = sub_2511C4F80((uint64_t)&v34 - ((v30 + 15) & 0x3FFFFFFFFFFFFFF0), v29, v2, v20, &v39);
      swift_release();
      sub_25112EB80();
    }
    else
    {
      long long v32 = (void *)swift_slowAlloc();
      memcpy(v32, (const void *)(v2 + 56), v30);
      uint64_t v31 = sub_2511C4F80((uint64_t)v32, v29, v2, v20, &v39);
      swift_release();
      sub_25112EB80();
      MEMORY[0x253397D40](v32, -1, -1);
    }
    return v31;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

double sub_2511C4DA8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *v3;
  sub_2511C9D40();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2511C94F0();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_2511C9D80();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    double result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return result;
  }
  uint64_t v11 = *(void *)(v7 + 48);
  unint64_t v12 = (void *)(v11 + 32 * v10);
  BOOL v13 = *v12 == a1 && v12[1] == a2;
  if (!v13 && (sub_2511C9CA0() & 1) == 0)
  {
    uint64_t v19 = ~v9;
    do
    {
      unint64_t v10 = (v10 + 1) & v19;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_20;
      }
      unint64_t v20 = (void *)(v11 + 32 * v10);
      BOOL v21 = *v20 == a1 && v20[1] == a2;
    }
    while (!v21 && (sub_2511C9CA0() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v15 = *v3;
  uint64_t v22 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2511A7910();
    uint64_t v15 = v22;
  }
  uint64_t v16 = *(void *)(v15 + 48) + 32 * v10;
  uint64_t v17 = *(void *)(v16 + 8);
  *(void *)a3 = *(void *)v16;
  *(void *)(a3 + 8) = v17;
  *(_OWORD *)(a3 + 16) = *(_OWORD *)(v16 + 16);
  sub_2511C52B0(v10);
  *uint64_t v3 = v22;

  swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_2511C4F80(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  int64_t v38 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v7 = v6 - 1;
  uint64_t v40 = a3 + 56;
  while (2)
  {
    uint64_t v37 = v7;
    do
    {
      while (1)
      {
        int64_t v8 = a5[3];
        unint64_t v9 = a5[4];
        if (v9)
        {
          uint64_t v10 = (v9 - 1) & v9;
          unint64_t v11 = __clz(__rbit64(v9)) | (v8 << 6);
          goto LABEL_16;
        }
        int64_t v12 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        int64_t v13 = (unint64_t)(a5[2] + 64) >> 6;
        int64_t v14 = a5[3];
        if (v12 >= v13) {
          goto LABEL_45;
        }
        uint64_t v15 = a5[1];
        unint64_t v16 = *(void *)(v15 + 8 * v12);
        if (!v16)
        {
          int64_t v17 = v8 + 2;
          int64_t v14 = v8 + 1;
          if (v8 + 2 >= v13) {
            goto LABEL_45;
          }
          unint64_t v16 = *(void *)(v15 + 8 * v17);
          if (!v16)
          {
            int64_t v14 = v8 + 2;
            if (v8 + 3 >= v13) {
              goto LABEL_45;
            }
            unint64_t v16 = *(void *)(v15 + 8 * (v8 + 3));
            if (v16)
            {
              int64_t v12 = v8 + 3;
              goto LABEL_15;
            }
            int64_t v17 = v8 + 4;
            int64_t v14 = v8 + 3;
            if (v8 + 4 >= v13) {
              goto LABEL_45;
            }
            unint64_t v16 = *(void *)(v15 + 8 * v17);
            if (!v16)
            {
              int64_t v12 = v8 + 5;
              int64_t v14 = v8 + 4;
              if (v8 + 5 >= v13) {
                goto LABEL_45;
              }
              unint64_t v16 = *(void *)(v15 + 8 * v12);
              if (!v16)
              {
                int64_t v14 = v13 - 1;
                int64_t v35 = v8 + 6;
                while (v13 != v35)
                {
                  unint64_t v16 = *(void *)(v15 + 8 * v35++);
                  if (v16)
                  {
                    int64_t v12 = v35 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v14;
                a5[4] = 0;
                swift_retain();
                return sub_251188D94(v38, a2, v37, a3);
              }
              goto LABEL_15;
            }
          }
          int64_t v12 = v17;
        }
LABEL_15:
        uint64_t v10 = (v16 - 1) & v16;
        unint64_t v11 = __clz(__rbit64(v16)) + (v12 << 6);
        int64_t v8 = v12;
LABEL_16:
        uint64_t v18 = (uint64_t *)(*(void *)(*a5 + 48) + 32 * v11);
        uint64_t v19 = *v18;
        uint64_t v20 = v18[1];
        a5[3] = v8;
        a5[4] = v10;
        sub_2511C9D40();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        sub_2511C94F0();
        swift_bridgeObjectRelease();
        uint64_t v21 = sub_2511C9D80();
        uint64_t v22 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v23 = v21 & ~v22;
        unint64_t v24 = v23 >> 6;
        uint64_t v25 = 1 << v23;
        if (((1 << v23) & *(void *)(v40 + 8 * (v23 >> 6))) == 0) {
          goto LABEL_3;
        }
        uint64_t v26 = *(void *)(a3 + 48);
        uint64_t v27 = (void *)(v26 + 32 * v23);
        BOOL v28 = *v27 == v19 && v27[1] == v20;
        if (v28 || (sub_2511C9CA0() & 1) != 0) {
          break;
        }
        uint64_t v30 = ~v22;
        for (unint64_t i = v23 + 1; ; unint64_t i = v32 + 1)
        {
          unint64_t v32 = i & v30;
          if (((*(void *)(v40 + (((i & v30) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v30)) & 1) == 0) {
            break;
          }
          long long v33 = (void *)(v26 + 32 * v32);
          BOOL v34 = *v33 == v19 && v33[1] == v20;
          if (v34 || (sub_2511C9CA0() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            double result = swift_bridgeObjectRelease();
            unint64_t v24 = v32 >> 6;
            uint64_t v25 = 1 << v32;
            goto LABEL_23;
          }
        }
LABEL_3:
        swift_bridgeObjectRelease();
        double result = swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      double result = swift_bridgeObjectRelease();
LABEL_23:
      unint64_t v29 = v38[v24];
      v38[v24] = v29 & ~v25;
    }
    while ((v25 & v29) == 0);
    uint64_t v7 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v37 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

unint64_t sub_2511C52B0(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_2511C9910();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_2511C9D40();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        sub_2511C94F0();
        swift_bridgeObjectRelease();
        uint64_t v11 = sub_2511C9D80();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 < v9) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(v3 + 48);
          int64_t v14 = (_OWORD *)(v13 + 32 * v2);
          uint64_t v15 = (_OWORD *)(v13 + 32 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v14 >= v15 + 2))
          {
            long long v10 = v15[1];
            *int64_t v14 = *v15;
            v14[1] = v10;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    double result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v16 = *(void *)(v3 + 16);
  BOOL v17 = __OFSUB__(v16, 1);
  uint64_t v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_2511C54A0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2511C9AC0();
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
    uint64_t v10 = sub_2511C9AC0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2511484D0(0, &qword_269B229D0, 255, (uint64_t (*)(uint64_t))type metadata accessor for WorkCriteria, MEMORY[0x263F8D488]);
        sub_2511C8058(&qword_269B229D8, &qword_269B229D0, 255, (uint64_t (*)(uint64_t))type metadata accessor for WorkCriteria);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          unint64_t v12 = sub_251159B48(v16, i, a3);
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for WorkCriteria();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511C56F0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2511C9AC0();
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
    uint64_t v10 = sub_2511C9AC0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2511484D0(0, &qword_269B229C0, 255, (uint64_t (*)(uint64_t))type metadata accessor for Orchestrator, MEMORY[0x263F8D488]);
        sub_2511C8058(&qword_269B229C8, &qword_269B229C0, 255, (uint64_t (*)(uint64_t))type metadata accessor for Orchestrator);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          unint64_t v12 = sub_251159ADC(v16, i, a3);
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for Orchestrator();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511C5940(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2511C9AC0();
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
    uint64_t v10 = sub_2511C9AC0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2511484D0(0, (unint64_t *)&qword_269B21BF0, 255, (uint64_t (*)(uint64_t))type metadata accessor for DebugSnapshot, MEMORY[0x263F8D488]);
        sub_2511C8058(&qword_269B229B8, (unint64_t *)&qword_269B21BF0, 255, (uint64_t (*)(uint64_t))type metadata accessor for DebugSnapshot);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          unint64_t v12 = sub_251159B48(v16, i, a3);
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for DebugSnapshot();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511C5B90(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2511C9AC0();
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
    uint64_t v10 = sub_2511C9AC0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2511484D0(0, (unint64_t *)&unk_26B217EB0, v11, (uint64_t (*)(uint64_t))type metadata accessor for WorkCriteriaRecord, MEMORY[0x263F8D488]);
        sub_2511C8058(qword_269B229E0, (unint64_t *)&unk_26B217EB0, v12, (uint64_t (*)(uint64_t))type metadata accessor for WorkCriteriaRecord);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          uint64_t v14 = sub_251159B48(v18, i, a3);
          uint64_t v16 = *v15;
          swift_retain();
          ((void (*)(uint64_t (**)(), void))v14)(v18, 0);
          *(void *)(a1 + 8 * i) = v16;
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
    type metadata accessor for WorkCriteriaRecord();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2511C9B10();
  __break(1u);
  return result;
}

uint64_t sub_2511C5DD4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2511484D0(0, &qword_269B21F98, 255, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v31 - v9;
  uint64_t v11 = sub_2511C9180();
  uint64_t v42 = *(void *)(v11 - 8);
  uint64_t result = MEMORY[0x270FA5388](v11);
  uint64_t v41 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = a4;
  uint64_t v16 = *(void *)(a4 + 56);
  uint64_t v15 = a4 + 56;
  uint64_t v14 = v16;
  uint64_t v33 = -1 << *(unsigned char *)(v15 - 24);
  if (-v33 < 64) {
    uint64_t v17 = ~(-1 << -(char)v33);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v14;
  if (!a2)
  {
    int64_t v19 = 0;
    uint64_t result = 0;
LABEL_39:
    uint64_t v30 = ~v33;
    *a1 = v43;
    a1[1] = v15;
    a1[2] = v30;
    a1[3] = v19;
    a1[4] = v18;
    return result;
  }
  if (!a3)
  {
    int64_t v19 = 0;
    uint64_t result = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  int64_t v19 = 0;
  uint64_t v44 = 0;
  uint64_t v39 = v42 + 16;
  uint64_t v40 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56);
  uint64_t v37 = (void (**)(char *))(v42 + 32);
  uint64_t v38 = v42 + 48;
  uint64_t v34 = v15;
  int64_t v35 = (unint64_t)(63 - v33) >> 6;
  int64_t v31 = v35 - 1;
  unint64_t v32 = a1;
  uint64_t v36 = a3;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v20 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  unint64_t v21 = v20 | (v19 << 6);
  while (1)
  {
    uint64_t v25 = v42;
    uint64_t v26 = *(void *)(v42 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + 16))(v10, *(void *)(v43 + 48) + v26 * v21, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v10, 1, v11) == 1)
    {
      uint64_t v15 = v34;
      goto LABEL_38;
    }
    uint64_t v27 = v44 + 1;
    BOOL v28 = *v37;
    unint64_t v29 = v41;
    (*v37)(v41);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v28)(a2, v29, v11);
    uint64_t v44 = v27;
    if (v27 == v36)
    {
      uint64_t result = v36;
      a1 = v32;
      uint64_t v15 = v34;
      goto LABEL_39;
    }
    a2 += v26;
    if (v18) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v22 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    uint64_t v15 = v34;
    if (v22 >= v35) {
      goto LABEL_37;
    }
    unint64_t v23 = *(void *)(v34 + 8 * v22);
    if (!v23)
    {
      int64_t v24 = v19 + 2;
      ++v19;
      if (v22 + 1 >= v35) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v34 + 8 * v24);
      if (v23) {
        goto LABEL_14;
      }
      int64_t v19 = v22 + 1;
      if (v22 + 2 >= v35) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v34 + 8 * (v22 + 2));
      if (v23)
      {
        v22 += 2;
      }
      else
      {
        int64_t v19 = v22 + 2;
        if (v22 + 3 >= v35) {
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v34 + 8 * (v22 + 3));
        if (!v23)
        {
          int64_t v24 = v22 + 4;
          int64_t v19 = v22 + 3;
          if (v22 + 4 < v35)
          {
            unint64_t v23 = *(void *)(v34 + 8 * v24);
            if (!v23)
            {
              while (1)
              {
                int64_t v22 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_42;
                }
                if (v22 >= v35)
                {
                  int64_t v19 = v31;
                  goto LABEL_37;
                }
                unint64_t v23 = *(void *)(v34 + 8 * v22);
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
LABEL_14:
            int64_t v22 = v24;
            goto LABEL_21;
          }
LABEL_37:
          (*v40)(v10, 1, 1, v11);
          unint64_t v18 = 0;
LABEL_38:
          sub_2511B3250((uint64_t)v10);
          a1 = v32;
          uint64_t result = v44;
          goto LABEL_39;
        }
        v22 += 3;
      }
    }
LABEL_21:
    unint64_t v18 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v22 << 6);
    int64_t v19 = v22;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_2511C6210(uint64_t result, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
LABEL_36:
    *uint64_t v5 = a4;
    v5[1] = v6;
    void v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v13;
  }
  if (!a3)
  {
    int64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v22 = -1 << *(unsigned char *)(a4 + 32);
  while (v9)
  {
    unint64_t v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v16 = v15 | (v12 << 6);
LABEL_9:
    ++v13;
    uint64_t result = sub_251139AA0(*(void *)(a4 + 56) + 48 * v16, (uint64_t)v23);
    long long v18 = v23[1];
    long long v17 = v23[2];
    *uint64_t v11 = v23[0];
    v11[1] = v18;
    void v11[2] = v17;
    v11 += 3;
    if (v13 == a3)
    {
      uint64_t v13 = a3;
LABEL_35:
      uint64_t v7 = v22;
      goto LABEL_36;
    }
  }
  int64_t v19 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v19 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v19);
  if (v20) {
    goto LABEL_23;
  }
  int64_t v21 = v12 + 2;
  ++v12;
  if (v19 + 1 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20) {
    goto LABEL_16;
  }
  int64_t v12 = v19 + 1;
  if (v19 + 2 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * (v19 + 2));
  if (v20)
  {
    v19 += 2;
    goto LABEL_23;
  }
  int64_t v12 = v19 + 2;
  if (v19 + 3 >= v14) {
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v6 + 8 * (v19 + 3));
  if (v20)
  {
    v19 += 3;
    goto LABEL_23;
  }
  int64_t v21 = v19 + 4;
  int64_t v12 = v19 + 3;
  if (v19 + 4 >= v14)
  {
LABEL_34:
    unint64_t v9 = 0;
    goto LABEL_35;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
LABEL_16:
    int64_t v19 = v21;
LABEL_23:
    unint64_t v9 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v19 << 6);
    int64_t v12 = v19;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v19 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v19 >= v14)
    {
      int64_t v12 = v14 - 1;
      goto LABEL_34;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v21;
    if (v20) {
      goto LABEL_23;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2511C6418(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
LABEL_39:
    *uint64_t v5 = a4;
    v5[1] = v6;
    void v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v24 = -1 << *(unsigned char *)(a4 + 32);
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
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 32 * v16);
    uint64_t v21 = v20[1];
    uint64_t v23 = v20[2];
    uint64_t v22 = v20[3];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    void v11[2] = v23;
    void v11[3] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 4;
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v24;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void *sub_2511C6634(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v11 = 0;
    uint64_t v9 = 0;
LABEL_39:
    char *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (void *)v9;
  }
  uint64_t v9 = a3;
  if (!a3)
  {
    int64_t v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v10 = a2;
  uint64_t v25 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v26 = result;
  int64_t v11 = 0;
  uint64_t v12 = 0;
  int64_t v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  unint64_t v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    int64_t v19 = (void *)(*(void *)(a4 + 48) + 48 * v15);
    uint64_t v20 = v19[1];
    uint64_t v21 = v19[2];
    uint64_t v22 = v19[3];
    uint64_t v24 = v19[4];
    uint64_t v23 = v19[5];
    *uint64_t v10 = *v19;
    v10[1] = v20;
    void v10[2] = v21;
    v10[3] = v22;
    v10[4] = v24;
    v10[5] = v23;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v10 += 6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v16 >= v13) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        unint64_t v8 = 0;
        int64_t v11 = v16;
      }
      else
      {
        unint64_t v17 = *(void *)(v5 + 8 * v11);
        if (v17) {
          goto LABEL_14;
        }
        int64_t v18 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          int64_t v16 = v18;
          goto LABEL_18;
        }
        int64_t v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          unint64_t v17 = *(void *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            int64_t v16 = v11;
            goto LABEL_18;
          }
          int64_t v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            unint64_t v8 = 0;
            goto LABEL_37;
          }
          unint64_t v17 = *(void *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              int64_t v16 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_42;
              }
              if (v16 >= v13)
              {
                unint64_t v8 = 0;
                int64_t v11 = v13 - 1;
                goto LABEL_37;
              }
              unint64_t v17 = *(void *)(v5 + 8 * v16);
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v8 = 0;
        int64_t v11 = v16 + 2;
      }
LABEL_37:
      uint64_t v9 = v12;
LABEL_38:
      uint64_t v6 = v25;
      uint64_t result = v26;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_2511C686C(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v93 = sub_2511C92A0();
  uint64_t v14 = *(void *)(v93 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v93);
  unint64_t v17 = (char *)v82 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  int64_t v19 = (char *)v82 - v18;
  long long v20 = *a3;
  uint64_t v21 = *((void *)a3 + 2);
  uint64_t v22 = *((void *)a3 + 3);
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(_OWORD *)(v7 + 32) = v20;
  *(void *)(v7 + 48) = v21;
  *(void *)(v7 + 56) = v22;
  *(_OWORD *)(v7 + 64) = a3[2];
  *(void *)(v7 + 80) = a4;
  *(void *)(v7 + 88) = a5;
  *(void *)(v7 + 96) = a6;
  int64_t v23 = *(void *)(a6 + 56);
  int64_t v24 = *(void *)(v23 + 16);
  unint64_t v87 = v17;
  if (v24)
  {
    v92 = (char *)v82 - v18;
    uint64_t v94 = v14;
    uint64_t v91 = v7;
    v100[0] = MEMORY[0x263F8EE78];
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    uint64_t v90 = a6;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_251130704(0, v24, 0);
    int64_t v89 = v23;
    uint64_t v25 = v23 + 32;
    uint64_t v26 = v100[0];
    do
    {
      sub_25112FD4C(v25, (uint64_t)&v104);
      uint64_t v27 = v105;
      uint64_t v28 = v106;
      __swift_project_boxed_opaque_existential_1(&v104, v105);
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v28 + 16))(v103, v27, v28);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v104);
      uint64_t v29 = v103[0];
      uint64_t v30 = v103[1];
      uint64_t v31 = v103[2];
      uint64_t v32 = v103[3];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_251130704(0, *(void *)(v26 + 16) + 1, 1);
        uint64_t v26 = v100[0];
      }
      unint64_t v34 = *(void *)(v26 + 16);
      unint64_t v33 = *(void *)(v26 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_251130704(v33 > 1, v34 + 1, 1);
        uint64_t v26 = v100[0];
      }
      *(void *)(v26 + 16) = v34 + 1;
      int64_t v35 = (void *)(v26 + 32 * v34);
      v35[4] = v29;
      v35[5] = v30;
      v35[6] = v31;
      v35[7] = v32;
      v25 += 40;
      --v24;
    }
    while (v24);
    swift_bridgeObjectRelease();
    uint64_t v7 = v91;
    unint64_t v17 = v87;
    uint64_t v14 = v94;
    int64_t v19 = v92;
    uint64_t v36 = v90;
  }
  else
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_retain();
    uint64_t v36 = a6;
    uint64_t v26 = MEMORY[0x263F8EE78];
  }
  uint64_t v37 = sub_25118A6EC(v26);
  swift_bridgeObjectRelease();
  *(void *)(v7 + 104) = v37;
  if (!*(void *)(v36 + 48))
  {
    uint64_t v69 = *(void *)(v7 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v69 + 40))(ObjectType, v69);
    swift_retain_n();
    uint64_t v71 = sub_2511C9280();
    int v72 = sub_2511C9740();
    if (os_log_type_enabled(v71, (os_log_type_t)v72))
    {
      LODWORD(v91) = v72;
      v92 = v19;
      uint64_t v94 = v14;
      uint64_t v73 = swift_slowAlloc();
      uint64_t v90 = swift_slowAlloc();
      v103[0] = v90;
      *(_DWORD *)uint64_t v73 = 136315394;
      uint64_t v74 = *(void *)(v7 + 72);
      *(void *)&long long v104 = 60;
      *((void *)&v104 + 1) = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_2511C9520();
      swift_bridgeObjectRelease();
      sub_2511C9520();
      if (!v74) {
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      sub_2511C9520();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2511C9520();
      *(void *)&long long v104 = sub_251140E4C(v104, *((unint64_t *)&v104 + 1), v103);
      sub_2511C98A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v73 + 12) = 2080;
      int64_t v75 = *(void **)(v7 + 96);
      if (v75[5])
      {
        uint64_t v76 = v75[4];
        unint64_t v77 = v75[5];
      }
      else
      {
        uint64_t v76 = v75[2];
        unint64_t v77 = v75[3];
        swift_bridgeObjectRetain();
      }
      uint64_t v78 = v94;
      unint64_t v79 = v92;
      swift_bridgeObjectRetain();
      *(void *)&long long v104 = sub_251140E4C(v76, v77, v103);
      sub_2511C98A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25112A000, v71, (os_log_type_t)v91, "%s:%s: Nil initial anchor.", (uint8_t *)v73, 0x16u);
      uint64_t v80 = v90;
      swift_arrayDestroy();
      MEMORY[0x253397D40](v80, -1, -1);
      MEMORY[0x253397D40](v73, -1, -1);

      (*(void (**)(char *, uint64_t))(v78 + 8))(v79, v93);
    }
    else
    {

      swift_release_n();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v93);
    }
    uint64_t v68 = 0;
LABEL_55:
    sub_2511448BC(0, &qword_26B216810);
    uint64_t v81 = swift_allocObject();
    *(_DWORD *)(v81 + 64) = 0;
    *(void *)(v81 + 16) = v68;
    *(void *)(v81 + 24) = v68;
    *(void *)(v81 + 32) = 0;
    *(unsigned char *)(v81 + 40) = 0;
    *(void *)(v81 + 48) = 0;
    *(void *)(v81 + 56) = MEMORY[0x263F8EE78];
    *(void *)(v7 + 112) = v81;
    swift_retain();
    return v7;
  }
  swift_retain();
  uint64_t v38 = swift_retain();
  v82[0] = sub_25112EBE0(v38, v36);
  uint64_t v39 = *(void *)(v82[0] + 16);
  uint64_t v40 = *(void *)(v39 + 64);
  uint64_t v88 = v39 + 64;
  uint64_t v41 = 1 << *(unsigned char *)(v39 + 32);
  uint64_t v42 = -1;
  if (v41 < 64) {
    uint64_t v42 = ~(-1 << v41);
  }
  unint64_t v43 = v42 & v40;
  int64_t v89 = (unint64_t)(v41 + 63) >> 6;
  uint64_t v44 = (void (**)(char *, uint64_t))(v14 + 8);
  uint64_t result = swift_bridgeObjectRetain_n();
  int64_t v46 = 0;
  *(void *)&long long v47 = 136315906;
  long long v83 = v47;
  v82[1] = MEMORY[0x263F8EE58] + 8;
  uint64_t v86 = v39;
  v85 = v44;
  uint64_t v84 = v96;
  while (1)
  {
    if (v43)
    {
      uint64_t v94 = (v43 - 1) & v43;
      unint64_t v48 = __clz(__rbit64(v43)) | (v46 << 6);
      goto LABEL_34;
    }
    int64_t v49 = v46 + 1;
    if (__OFADD__(v46, 1))
    {
      __break(1u);
      goto LABEL_57;
    }
    if (v49 >= v89) {
      goto LABEL_44;
    }
    unint64_t v50 = *(void *)(v88 + 8 * v49);
    ++v46;
    if (!v50)
    {
      int64_t v46 = v49 + 1;
      if (v49 + 1 >= v89) {
        goto LABEL_44;
      }
      unint64_t v50 = *(void *)(v88 + 8 * v46);
      if (!v50)
      {
        int64_t v46 = v49 + 2;
        if (v49 + 2 >= v89) {
          goto LABEL_44;
        }
        unint64_t v50 = *(void *)(v88 + 8 * v46);
        if (!v50)
        {
          int64_t v46 = v49 + 3;
          if (v49 + 3 >= v89) {
            goto LABEL_44;
          }
          unint64_t v50 = *(void *)(v88 + 8 * v46);
          if (!v50) {
            break;
          }
        }
      }
    }
LABEL_33:
    uint64_t v94 = (v50 - 1) & v50;
    unint64_t v48 = __clz(__rbit64(v50)) + (v46 << 6);
LABEL_34:
    sub_25112FD4C(*(void *)(v39 + 56) + 40 * v48, (uint64_t)&v104);
    sub_25112F14C(&v104, (uint64_t)v103);
    uint64_t v52 = *(void *)(v7 + 24);
    uint64_t v53 = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v52 + 40))(v53, v52);
    sub_25112FD4C((uint64_t)v103, (uint64_t)v100);
    sub_25112FD4C((uint64_t)v103, (uint64_t)v99);
    swift_retain_n();
    unsigned int v54 = sub_2511C9280();
    int v55 = sub_2511C9740();
    if (os_log_type_enabled(v54, (os_log_type_t)v55))
    {
      LODWORD(v91) = v55;
      v92 = (char *)v46;
      uint64_t v56 = swift_slowAlloc();
      uint64_t v90 = swift_slowAlloc();
      uint64_t v98 = v90;
      *(_DWORD *)uint64_t v56 = v83;
      uint64_t v57 = *(void *)(v7 + 72);
      uint64_t v95 = 60;
      v96[0] = 0xE100000000000000;
      swift_bridgeObjectRetain();
      sub_2511C9520();
      swift_bridgeObjectRelease();
      sub_2511C9520();
      if (!v57) {
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain_n();
      sub_2511C9520();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2511C9520();
      uint64_t v95 = sub_251140E4C(v95, v96[0], &v98);
      sub_2511C98A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 12) = 2080;
      v58 = *(void **)(v7 + 96);
      if (v58[5])
      {
        uint64_t v59 = v58[4];
        unint64_t v60 = v58[5];
      }
      else
      {
        uint64_t v59 = v58[2];
        unint64_t v60 = v58[3];
        swift_bridgeObjectRetain();
      }
      unint64_t v17 = v87;
      uint64_t v44 = v85;
      swift_bridgeObjectRetain();
      uint64_t v95 = sub_251140E4C(v59, v60, &v98);
      sub_2511C98A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 22) = 2080;
      uint64_t v61 = v101;
      uint64_t v62 = v102;
      __swift_project_boxed_opaque_existential_1(v100, v101);
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v62 + 48))(&v95, v61, v62);
      unint64_t v63 = v97;
      if (v97)
      {
        uint64_t v64 = v96[1];
      }
      else
      {
        uint64_t v64 = v95;
        unint64_t v63 = swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      uint64_t v95 = sub_251140E4C(v64, v63, &v98);
      sub_2511C98A0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v100);
      *(_WORD *)(v56 + 32) = 2080;
      sub_25112FD4C((uint64_t)v99, (uint64_t)&v95);
      sub_251131944(0, qword_26B216650);
      uint64_t v65 = sub_2511C94C0();
      uint64_t v95 = sub_251140E4C(v65, v66, &v98);
      sub_2511C98A0();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
      _os_log_impl(&dword_25112A000, v54, (os_log_type_t)v91, "%s:%s: Initial anchor: %s %s.", (uint8_t *)v56, 0x2Au);
      uint64_t v67 = v90;
      swift_arrayDestroy();
      MEMORY[0x253397D40](v67, -1, -1);
      MEMORY[0x253397D40](v56, -1, -1);

      (*v44)(v17, v93);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v103);
      uint64_t v39 = v86;
      int64_t v46 = (int64_t)v92;
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v100);
      swift_release_n();
      (*v44)(v17, v93);
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v103);
    }
    unint64_t v43 = v94;
  }
  int64_t v51 = v49 + 4;
  if (v51 >= v89)
  {
LABEL_44:
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v68 = v82[0];
    goto LABEL_55;
  }
  unint64_t v50 = *(void *)(v88 + 8 * v51);
  if (v50)
  {
    int64_t v46 = v51;
    goto LABEL_33;
  }
  while (1)
  {
    int64_t v46 = v51 + 1;
    if (__OFADD__(v51, 1)) {
      break;
    }
    if (v46 >= v89) {
      goto LABEL_44;
    }
    unint64_t v50 = *(void *)(v88 + 8 * v46);
    ++v51;
    if (v50) {
      goto LABEL_33;
    }
  }
LABEL_57:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for WorkCriteriaRecord()
{
  return self;
}

uint64_t method lookup function for WorkCriteriaRecord(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WorkCriteriaRecord);
}

uint64_t dispatch thunk of WorkCriteriaRecord.__allocating_init(context:executorIdentifier:planner:criteria:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

unint64_t destroy for WorkCriteriaRecord.CheckResult(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for WorkCriteriaRecord.CheckResult(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    long long v12 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v12;
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    long long v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    long long v14 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v14;
  }
  else
  {
    uint64_t v3 = *(void *)(a2 + 8);
    uint64_t v4 = *(void *)(a2 + 16);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    uint64_t v5 = *(void *)(a2 + 24);
    uint64_t v6 = *(void *)(a2 + 32);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v5;
    uint64_t v7 = *(void *)(a2 + 40);
    uint64_t v8 = *(void *)(a2 + 48);
    *(void *)(a1 + 32) = v6;
    *(void *)(a1 + 40) = v7;
    uint64_t v9 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = v9;
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    uint64_t v10 = *(void *)(a2 + 88);
    uint64_t v11 = *(void *)(a2 + 96);
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 88) = v10;
    *(void *)(a1 + 96) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_unknownObjectRetain();
    swift_retain();
  }
  return a1;
}

uint64_t assignWithCopy for WorkCriteriaRecord.CheckResult(uint64_t a1, long long *a2)
{
  unint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *(void *)a1 = v5;
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      *(void *)(a1 + 24) = *((void *)a2 + 3);
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      *(void *)(a1 + 40) = *((void *)a2 + 5);
      *(void *)(a1 + 48) = *((void *)a2 + 6);
      *(void *)(a1 + 56) = *((void *)a2 + 7);
      *(_OWORD *)(a1 + 64) = a2[4];
      *(void *)(a1 + 80) = *((void *)a2 + 10);
      uint64_t v8 = *((void *)a2 + 12);
      *(void *)(a1 + 88) = *((void *)a2 + 11);
      *(void *)(a1 + 96) = v8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_unknownObjectRetain();
      swift_retain();
      return a1;
    }
LABEL_7:
    long long v9 = *a2;
    long long v10 = a2[2];
    *(_OWORD *)(a1 + 16) = a2[1];
    *(_OWORD *)(a1 + 32) = v10;
    *(_OWORD *)a1 = v9;
    long long v11 = a2[3];
    long long v12 = a2[4];
    long long v13 = a2[5];
    *(void *)(a1 + 96) = *((void *)a2 + 12);
    *(_OWORD *)(a1 + 64) = v12;
    *(_OWORD *)(a1 + 80) = v13;
    *(_OWORD *)(a1 + 48) = v11;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
    goto LABEL_7;
  }
  *(void *)a1 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *((void *)a2 + 3);
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  swift_retain();
  swift_release();
  uint64_t v6 = *((void *)a2 + 9);
  *(void *)(a1 + 64) = *((void *)a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 72) = v6;
  *(void *)(a1 + 80) = *((void *)a2 + 10);
  uint64_t v7 = *((void *)a2 + 12);
  *(void *)(a1 + 88) = *((void *)a2 + 11);
  *(void *)(a1 + 96) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for WorkCriteriaRecord.CheckResult(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  if (*(void *)a2 < 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
    swift_release();
LABEL_5:
    long long v6 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v6;
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    long long v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    long long v8 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v8;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkCriteriaRecord.CheckResult(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *((unsigned char *)a1 + 104)) {
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

uint64_t storeEnumTagSinglePayload for WorkCriteriaRecord.CheckResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)(result + 96) = 0;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)unint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 104) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 104) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_2511C7AD4(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    uint64_t v2 = a2 ^ 0x80000000;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v2 = (a2 - 1);
  }
  *(void *)unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for WorkCriteriaRecord.CheckResult()
{
  return &type metadata for WorkCriteriaRecord.CheckResult;
}

uint64_t sub_2511C7B20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorkCriteriaRecord.Epoch.State(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for WorkCriteriaRecord.Epoch.State(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkCriteriaRecord.Epoch.State(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkCriteriaRecord.Epoch.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkCriteriaRecord.Epoch.State()
{
  return &type metadata for WorkCriteriaRecord.Epoch.State;
}

uint64_t destroy for WorkCriteriaRecord.State()
{
  swift_release();
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WorkCriteriaRecord.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorkCriteriaRecord.State(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for WorkCriteriaRecord.State(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkCriteriaRecord.State(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkCriteriaRecord.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkCriteriaRecord.State()
{
  return &type metadata for WorkCriteriaRecord.State;
}

uint64_t sub_2511C7F08(void *a1)
{
  swift_retain();
  uint64_t result = swift_release();
  *a1 = v1;
  return result;
}

uint64_t sub_2511C7F48()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2511C7F80()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_2511C7FC0()
{
  unint64_t result = qword_269B229B0;
  if (!qword_269B229B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B229B0);
  }
  return result;
}

uint64_t sub_2511C8014(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2511C8058(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2511484D0(255, a2, a3, a4, MEMORY[0x263F8D488]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for InternalError()
{
  return &type metadata for InternalError;
}

ValueMetadata *type metadata accessor for SanitizedAnchorSet()
{
  return &type metadata for SanitizedAnchorSet;
}

uint64_t sub_2511C80DC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v5 = *a1;
  long long v10 = *(_OWORD *)(a3 + a2 - 16);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v5 + 16);
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = v7;
  *(void *)(v8 + 40) = v6;
  *a4 = sub_2511C9048;
  a4[1] = (uint64_t (*)())v8;
  return swift_retain();
}

uint64_t sub_2511C8170(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 + a3;
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = *(_OWORD *)(v5 - 16);
  *(void *)(v8 + 32) = v7;
  *(void *)(v8 + 40) = v6;
  uint64_t v9 = *a2;
  swift_beginAccess();
  *(void *)(v9 + 16) = sub_2511C9020;
  *(void *)(v9 + 24) = v8;
  swift_retain();
  return swift_release();
}

uint64_t (*MockInputSignalObserver.handler.modify())()
{
  return j__swift_endAccess;
}

uint64_t MockInputSignalObserver.didUpdate<A>(anchor:signal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v53 = a2;
  uint64_t v57 = a1;
  uint64_t v7 = *(void *)(*v4 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = sub_2511C9890();
  uint64_t v47 = *(void *)(v9 - 8);
  uint64_t v48 = v9;
  MEMORY[0x270FA5388](v9);
  unsigned int v54 = (char *)&v44 - v10;
  uint64_t v50 = a4;
  uint64_t v55 = swift_getAssociatedTypeWitness();
  uint64_t v58 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  int64_t v49 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  int64_t v51 = (char *)&v44 - v13;
  uint64_t v56 = AssociatedTypeWitness;
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v52 = (char *)&v44 - v16;
  uint64_t v17 = sub_2511C9890();
  uint64_t v44 = *(void *)(v17 - 8);
  uint64_t v45 = v17;
  MEMORY[0x270FA5388](v17);
  int64_t v19 = (char *)&v44 - v18;
  uint64_t v20 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v21);
  int64_t v46 = (char *)&v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v44 - v24;
  uint64_t v26 = *(void *)(v7 - 8);
  double v28 = MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)&v44 - v29;
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, double))(v20 + 16);
  v31(v25, v53, a3, v28);
  int v32 = swift_dynamicCast();
  unint64_t v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
  if (v32)
  {
    v33(v19, 0, 1, v7);
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v30, v19, v7);
    uint64_t v34 = v57;
    int64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
    uint64_t v36 = v55;
    v58 += 16;
    v35(v51, v57, v55);
    uint64_t v37 = v54;
    uint64_t v38 = v56;
    int v39 = swift_dynamicCast();
    uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    if (v39)
    {
      v40(v37, 0, 1, v38);
      uint64_t v41 = v52;
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v52, v37, v38);
      swift_beginAccess();
      uint64_t v42 = (void (*)(char *, char *))v4[2];
      swift_retain();
      v42(v41, v30);
      swift_release();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v41, v38);
      return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v30, v7);
    }
    v40(v37, 1, 1, v38);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v37, v48);
    v35(v49, v34, v36);
    uint64_t v59 = 0;
    unint64_t v60 = 0xE000000000000000;
    sub_2511C9960();
    sub_2511C9520();
    sub_2511C9C80();
  }
  else
  {
    v33(v19, 1, 1, v7);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v45);
    ((void (*)(char *, uint64_t, uint64_t))v31)(v46, v53, a3);
    uint64_t v59 = 0;
    unint64_t v60 = 0xE000000000000000;
    sub_2511C9960();
    sub_2511C9520();
    sub_2511C9C90();
  }
  uint64_t result = sub_2511C9AB0();
  __break(1u);
  return result;
}

uint64_t *MockInputSignalObserver.__allocating_init()()
{
  uint64_t v0 = (uint64_t *)swift_allocObject();
  uint64_t v1 = *v0;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = *(void *)(v1 + 80);
  *(void *)(v2 + 24) = *(void *)(v1 + 88);
  v0[2] = (uint64_t)nullsub_1;
  v0[3] = v2;
  return v0;
}

uint64_t *MockInputSignalObserver.init()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = *(void *)(v1 + 80);
  *(void *)(v2 + 24) = *(void *)(v1 + 88);
  v0[2] = (uint64_t)nullsub_1;
  v0[3] = v2;
  return v0;
}

uint64_t sub_2511C8A30()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t MockInputSignalObserver.deinit()
{
  swift_release();
  return v0;
}

uint64_t sub_2511C8A68@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *a2 = sub_2511C8FC0;
  a2[1] = (uint64_t (*)())v6;
  return swift_retain();
}

uint64_t sub_2511C8AE8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = *a2;
  swift_beginAccess();
  *(void *)(v6 + 16) = sub_2511C8F60;
  *(void *)(v6 + 24) = v5;
  swift_retain();
  return swift_release();
}

uint64_t _s19HealthOrchestration23MockInputSignalObserverC7handleryy6AnchorQz_xtcvg_0()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t _s19HealthOrchestration23MockInputSignalObserverC7handleryy6AnchorQz_xtcvs_0(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_release();
}

uint64_t (*MockAnyInputSignalObserver.handler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t MockAnyInputSignalObserver.didUpdate<A>(anchor:signal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t v9 = *(void (**)(uint64_t *, uint64_t *))(v4 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v15[3] = AssociatedTypeWitness;
  v15[4] = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_1, a1, AssociatedTypeWitness);
  v14[3] = a3;
  v14[4] = a4;
  uint64_t v12 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(v12, a2, a3);
  swift_retain();
  v9(v15, v14);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

uint64_t MockAnyInputSignalObserver.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = nullsub_1;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t MockAnyInputSignalObserver.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = nullsub_1;
  *(void *)(v0 + 24) = 0;
  return result;
}

uint64_t _s19HealthOrchestration23MockInputSignalObserverCfD_0()
{
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_2511C8E64()
{
  return 16;
}

__n128 sub_2511C8E70(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_2511C8E84()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for MockInputSignalObserver()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for MockInputSignalObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MockInputSignalObserver);
}

uint64_t dispatch thunk of MockInputSignalObserver.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t type metadata accessor for MockAnyInputSignalObserver()
{
  return self;
}

uint64_t method lookup function for MockAnyInputSignalObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MockAnyInputSignalObserver);
}

uint64_t dispatch thunk of MockAnyInputSignalObserver.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2511C8F60()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2511C8F88()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2511C8FC0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2511C8FE8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2511C9020()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_2511C9048()
{
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_2511C9080()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_2511C9090()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2511C90A0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2511C90B0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_2511C90C0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_2511C90D0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_2511C90E0()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_2511C90F0()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2511C9100()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_2511C9110()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_2511C9120()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2511C9130()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2511C9140()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2511C9150()
{
  return MEMORY[0x270EEFBB0]();
}

uint64_t sub_2511C9160()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2511C9170()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_2511C9180()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2511C9190()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2511C91A0()
{
  return MEMORY[0x270EF0168]();
}

uint64_t sub_2511C91B0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2511C91C0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_2511C91D0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2511C91E0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2511C91F0()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_2511C9200()
{
  return MEMORY[0x270EF0E50]();
}

uint64_t sub_2511C9210()
{
  return MEMORY[0x270EF0EA8]();
}

uint64_t sub_2511C9220()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_2511C9230()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2511C9240()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_2511C9250()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_2511C9260()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_2511C9270()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2511C9280()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2511C9290()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_2511C92A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2511C92B0()
{
  return MEMORY[0x270FA2C50]();
}

uint64_t sub_2511C92C0()
{
  return MEMORY[0x270EF7578]();
}

uint64_t sub_2511C92D0()
{
  return MEMORY[0x270EF7590]();
}

uint64_t sub_2511C92E0()
{
  return MEMORY[0x270EF75A0]();
}

uint64_t sub_2511C92F0()
{
  return MEMORY[0x270EF75A8]();
}

uint64_t sub_2511C9300()
{
  return MEMORY[0x270EF7760]();
}

uint64_t sub_2511C9310()
{
  return MEMORY[0x270EF77B0]();
}

uint64_t sub_2511C9320()
{
  return MEMORY[0x270EF77B8]();
}

uint64_t sub_2511C9330()
{
  return MEMORY[0x270EF77C0]();
}

uint64_t sub_2511C9340()
{
  return MEMORY[0x270EF77D0]();
}

uint64_t sub_2511C9350()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_2511C9360()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2511C9370()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_2511C9380()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2511C9390()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2511C93A0()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2511C93B0()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_2511C93C0()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2511C93D0()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_2511C93E0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2511C93F0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_2511C9400()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2511C9410()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2511C9420()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2511C9430()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_2511C9440()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2511C9450()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2511C9460()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2511C9470()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2511C9480()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2511C9490()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2511C94A0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2511C94B0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2511C94C0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2511C94D0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_2511C94E0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2511C94F0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2511C9500()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2511C9510()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_2511C9520()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2511C9530()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2511C9540()
{
  return MEMORY[0x270F9D898]();
}

uint64_t sub_2511C9550()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2511C9560()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2511C9570()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_2511C9580()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2511C9590()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2511C95A0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2511C95B0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2511C95C0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2511C95D0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2511C95E0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2511C95F0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2511C9600()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2511C9610()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2511C9620()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_2511C9630()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2511C9640()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2511C9650()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_2511C9660()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2511C9670()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2511C9680()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2511C9690()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2511C96A0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_2511C96B0()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2511C96C0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2511C96D0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_2511C96E0()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_2511C96F0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2511C9700()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2511C9710()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2511C9720()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2511C9730()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_2511C9740()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2511C9750()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2511C9760()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2511C9770()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2511C9780()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_2511C9790()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_2511C97A0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2511C97B0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2511C97C0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2511C97D0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2511C97E0()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2511C97F0()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_2511C9800()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_2511C9810()
{
  return MEMORY[0x270FA0E38]();
}

uint64_t sub_2511C9820()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_2511C9830()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_2511C9840()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_2511C9850()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_2511C9860()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_2511C9870()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_2511C9880()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2511C9890()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2511C98A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2511C98B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2511C98C0()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_2511C98D0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2511C98E0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2511C9900()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2511C9910()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2511C9920()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2511C9930()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2511C9940()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2511C9950()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_2511C9960()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2511C9970()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2511C9980()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2511C9990()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2511C99A0()
{
  return MEMORY[0x270F9EA70]();
}

uint64_t sub_2511C99B0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2511C99C0()
{
  return MEMORY[0x270F9EAD0]();
}

uint64_t sub_2511C99D0()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_2511C99E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2511C99F0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2511C9A00()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2511C9A10()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2511C9A20()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2511C9A30()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2511C9A40()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2511C9A50()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2511C9A60()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2511C9A70()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2511C9A80()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_2511C9A90()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2511C9AA0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2511C9AB0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2511C9AC0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2511C9AD0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2511C9AE0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2511C9AF0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2511C9B00()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_2511C9B10()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2511C9B30()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2511C9B40()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2511C9B50()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2511C9B60()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2511C9B70()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2511C9B80()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2511C9B90()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2511C9BA0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_2511C9BB0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2511C9BC0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2511C9BD0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2511C9BE0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_2511C9BF0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2511C9C00()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2511C9C10()
{
  return MEMORY[0x270F9F4A0]();
}

uint64_t sub_2511C9C20()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_2511C9C30()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_2511C9C40()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2511C9C50()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2511C9C60()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_2511C9C80()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_2511C9C90()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_2511C9CA0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2511C9CC0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2511C9CD0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2511C9CE0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2511C9CF0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2511C9D00()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2511C9D10()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2511C9D20()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2511C9D30()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_2511C9D40()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2511C9D50()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2511C9D60()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2511C9D70()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2511C9D80()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2511C9D90()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2511C9DA0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2511C9DD0()
{
  return MEMORY[0x270FA0128]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t MobileGestalt_copy_buildVersion_obj()
{
  return MEMORY[0x270F96038]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x270EDB4D0](*(void *)&a1, a2);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getFunctionTypeMetadata()
{
  return MEMORY[0x270FA0380]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x270FA0388]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x270FA0390]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x270FA0398]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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