uint64_t sub_24922D634(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_24922D650, a1, 0);
}

uint64_t sub_24922D650()
{
  uint64_t v1 = sub_249252A90();
  sub_24922E068();
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v1 - 8) + 104))(v2, *MEMORY[0x263F69890], v1);
  swift_willThrow();
  v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24922D720()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248DD0484;
  return MEMORY[0x270FA2498](sub_24922D650, v0, 0);
}

uint64_t sub_24922D7C4()
{
  return sub_24922E058(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0);
}

uint64_t sub_24922D7FC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24922D88C;
  return sub_24922D88C(0);
}

uint64_t sub_24922D88C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_24922D988(uint64_t a1, uint64_t a2, int *a3)
{
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24922DA6C;
  return v8(a1, a2);
}

uint64_t sub_24922DA6C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_24922DB6C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24922DBA4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248BF9EC4;
  v8 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2696837A8 + dword_2696837A8);
  return v8(a1, a2, v6);
}

uint64_t sub_24922DC68()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248B97464;
  return sub_248B941DC();
}

uint64_t sub_24922DCF8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_248BF9EC4(0);
}

uint64_t sub_24922DD8C(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696837F8);
  v2[3] = v4;
  v2[4] = *(void *)(v4 - 8);
  v2[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24922DE54, a2, 0);
}

uint64_t sub_24922DE54()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  sub_249257820();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F8F580], v3);
  sub_24925DF00();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24922DF28(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B941DC;
  return sub_24922DD8C(a1, v1);
}

uint64_t sub_24922DFC4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_248BF9EC4(0);
}

uint64_t sub_24922E058(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

unint64_t sub_24922E068()
{
  unint64_t result = qword_269683800;
  if (!qword_269683800)
  {
    sub_249252A90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269683800);
  }
  return result;
}

uint64_t sub_24922E0C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  sub_24925EA40();
  swift_bridgeObjectRetain();
  sub_249251BE0();
  uint64_t v7 = sub_24925EA90();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if ((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = 40 * v9;
    sub_248C17BD0(*(void *)(v6 + 48) + 40 * v9, (uint64_t)v23);
    sub_24922ED8C((uint64_t)v23, (void (*)(void, void, void, void, void))sub_248C6D96C);
    char v11 = MEMORY[0x24C58D040](v23, a2);
    sub_24922ED8C((uint64_t)v23, (void (*)(void, void, void, void, void))sub_248D52E38);
    if (v11)
    {
LABEL_6:
      swift_bridgeObjectRelease();
      sub_24922ED8C(a2, (void (*)(void, void, void, void, void))sub_248D52E38);
      uint64_t v14 = *(void *)(*v3 + 48) + v10;
      uint64_t v15 = *(void *)v14;
      uint64_t v16 = *(void *)(v14 + 8);
      uint64_t v17 = *(void *)(v14 + 16);
      uint64_t v18 = *(void *)(v14 + 24);
      char v19 = *(unsigned char *)(v14 + 32);
      *(void *)a1 = *(void *)v14;
      *(void *)(a1 + 8) = v16;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = v18;
      *(unsigned char *)(a1 + 32) = v19;
      sub_248C6D96C(v15, v16, v17, v18, v19);
      return 0;
    }
    uint64_t v12 = ~v8;
    while (1)
    {
      unint64_t v9 = (v9 + 1) & v12;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        break;
      }
      uint64_t v10 = 40 * v9;
      sub_248C17BD0(*(void *)(v6 + 48) + 40 * v9, (uint64_t)v24);
      sub_24922ED8C((uint64_t)v24, (void (*)(void, void, void, void, void))sub_248C6D96C);
      char v13 = MEMORY[0x24C58D040](v24, a2);
      sub_24922ED8C((uint64_t)v24, (void (*)(void, void, void, void, void))sub_248D52E38);
      if (v13) {
        goto LABEL_6;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v22 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_24922ED8C(a2, (void (*)(void, void, void, void, void))sub_248C6D96C);
  sub_24922E5E4(a2, v9, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v22;
  swift_bridgeObjectRelease();
  sub_248C17BD0(a2, a1);
  return 1;
}

uint64_t sub_24922E314()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683810);
  uint64_t v3 = sub_24925E560();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v26;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      sub_248C17BD0(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v27);
      sub_24925EA40();
      sub_249251BE0();
      uint64_t result = sub_24925EA90();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v10 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v13 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t result = sub_248C17BD0((uint64_t)v27, *(void *)(v4 + 48) + 40 * v13);
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24922E5E4(uint64_t a1, unint64_t i, char a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_13;
  }
  if (a3)
  {
    sub_24922E314();
  }
  else
  {
    if (v8 > v7)
    {
      sub_24922E808();
      goto LABEL_13;
    }
    sub_24922E9D0();
  }
  uint64_t v9 = *v3;
  sub_24925EA40();
  sub_249251BE0();
  uint64_t v10 = sub_24925EA90();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  i = v10 & ~v11;
  uint64_t v12 = v9 + 56;
  if ((*(void *)(v9 + 56 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_248C17BD0(*(void *)(v9 + 48) + 40 * i, (uint64_t)v21);
    sub_24922ED8C((uint64_t)v21, (void (*)(void, void, void, void, void))sub_248C6D96C);
    char v13 = MEMORY[0x24C58D040](v21, a1);
    sub_24922ED8C((uint64_t)v21, (void (*)(void, void, void, void, void))sub_248D52E38);
    if (v13) {
      goto LABEL_16;
    }
    uint64_t v14 = ~v11;
    for (i = (i + 1) & v14; ((*(void *)(v12 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v14)
    {
      sub_248C17BD0(*(void *)(v9 + 48) + 40 * i, (uint64_t)v22);
      sub_24922ED8C((uint64_t)v22, (void (*)(void, void, void, void, void))sub_248C6D96C);
      char v15 = MEMORY[0x24C58D040](v22, a1);
      sub_24922ED8C((uint64_t)v22, (void (*)(void, void, void, void, void))sub_248D52E38);
      if (v15) {
        goto LABEL_16;
      }
    }
  }
LABEL_13:
  uint64_t v16 = *v4;
  *(void *)(*v4 + 8 * (i >> 6) + 56) |= 1 << i;
  uint64_t result = sub_248C17BD0(a1, *(void *)(v16 + 48) + 40 * i);
  uint64_t v18 = *(void *)(v16 + 16);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (!v19)
  {
    *(void *)(v16 + 16) = v20;
    return result;
  }
  __break(1u);
LABEL_16:
  uint64_t result = sub_24925E970();
  __break(1u);
  return result;
}

void *sub_24922E808()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683810);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24925E550();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v13) {
      goto LABEL_28;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25)
      {
        int64_t v9 = v24 + 2;
        if (v24 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v25 = *(void *)(v6 + 8 * v9);
        if (!v25) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v20 = *(void *)(v17 + 16);
    uint64_t v21 = *(void *)(v17 + 24);
    char v22 = *(unsigned char *)(v17 + 32);
    uint64_t v23 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v23 = *(void *)v17;
    *(void *)(v23 + 8) = v19;
    *(void *)(v23 + 16) = v20;
    *(void *)(v23 + 24) = v21;
    *(unsigned char *)(v23 + 32) = v22;
    uint64_t result = (void *)sub_248C6D96C(v18, v19, v20, v21, v22);
  }
  int64_t v26 = v24 + 3;
  if (v26 >= v13) {
    goto LABEL_28;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24922E9D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683810);
  uint64_t v3 = sub_24925E560();
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    sub_248C17BD0(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v26);
    sub_24925EA40();
    sub_24922ED8C((uint64_t)v26, (void (*)(void, void, void, void, void))sub_248C6D96C);
    sub_249251BE0();
    uint64_t result = sub_24925EA90();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v20) & ~*(void *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v25 = *(void *)(v10 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v13 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    uint64_t result = sub_248C17BD0((uint64_t)v26, *(void *)(v4 + 48) + 40 * v13);
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24922EC88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_24922ED38();
  uint64_t result = sub_24925E000();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = a1 + 32;
    do
    {
      sub_248C17BD0(v4, (uint64_t)v8);
      sub_24922ED8C((uint64_t)v8, (void (*)(void, void, void, void, void))sub_248C6D96C);
      sub_24922E0C0((uint64_t)v5, (uint64_t)v8);
      sub_248D52E38(v5[0], v5[1], v5[2], v5[3], v6);
      v4 += 40;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

unint64_t sub_24922ED38()
{
  unint64_t result = qword_269683808;
  if (!qword_269683808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269683808);
  }
  return result;
}

uint64_t sub_24922ED8C(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t ServiceSubscriptionService.queryServiceSubscription.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t ServiceSubscriptionService.fetchServiceSubscription.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t ServiceSubscriptionService.makeServiceSubscriptionStatusStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t ServiceSubscriptionService.makeServiceSubscriptionPurchasedStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t ServiceSubscriptionService.makeSubscriptionPurchaseRequest.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_retain();
  return v1;
}

uint64_t ServiceSubscriptionService.performPurchase.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_retain();
  return v1;
}

ValueMetadata *type metadata accessor for ServiceSubscriptionService()
{
  return &type metadata for ServiceSubscriptionService;
}

uint64_t static ServiceSubscriptionService.simulator()@<X0>(void *a1@<X8>)
{
  type metadata accessor for SimulatorServiceSubscriptionService();
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *a1 = &unk_269683820;
  a1[1] = v2;
  a1[2] = &unk_269683830;
  a1[3] = v2;
  a1[4] = &unk_269683840;
  a1[5] = v2;
  a1[6] = &unk_269683850;
  a1[7] = v2;
  a1[8] = &unk_269683860;
  a1[9] = v2;
  a1[10] = &unk_269683870;
  a1[11] = v2;
  return swift_retain_n();
}

uint64_t type metadata accessor for SimulatorServiceSubscriptionService()
{
  return self;
}

uint64_t sub_24922EFDC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24922F9D8, a2, 0);
}

uint64_t sub_24922EFF8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_24922F9D8, v1, 0);
}

uint64_t sub_24922F0A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2491ED9AC, a3, 0);
}

uint64_t sub_24922F0C0(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B941DC;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_2491ED9AC, v1, 0);
}

uint64_t sub_24922F168(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269683880);
  v2[3] = v4;
  v2[4] = *(void *)(v4 - 8);
  v2[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24922F230, a2, 0);
}

uint64_t sub_24922F230()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  sub_2492532E0();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F8F580], v3);
  sub_24925DF00();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24922F304(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B941DC;
  return sub_24922F168(a1, v1);
}

uint64_t sub_24922F3A0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683878);
  v2[3] = v4;
  v2[4] = *(void *)(v4 - 8);
  v2[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24922F468, a2, 0);
}

uint64_t sub_24922F468()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  sub_249255180();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F8F580], v3);
  sub_24925DF00();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24922F53C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  return sub_24922F3A0(a1, v1);
}

uint64_t sub_24922F5D8(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522D0);
  v2[3] = v4;
  v2[4] = *(void *)(v4 - 8);
  v2[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24922F6A0, a2, 0);
}

uint64_t sub_24922F6A0()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v4 = (uint64_t *)v0[2];
  uint64_t v3 = v0[3];
  type metadata accessor for SubscriptionPurchaseRequest();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F8F580], v3);
  v4[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B152340);
  v4[4] = sub_24922F97C();
  __swift_allocate_boxed_opaque_existential_1(v4);
  sub_24925DF00();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24922F794(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  return sub_24922F5D8(a1, v1);
}

uint64_t sub_24922F830(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA2498](sub_24922F848, a2, 0);
}

uint64_t sub_24922F848()
{
  sub_248D27EEC();
  swift_allocError();
  *uint64_t v1 = 4;
  swift_willThrow();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24922F8D8()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248BF9EC4;
  return MEMORY[0x270FA2498](sub_24922F848, v0, 0);
}

unint64_t sub_24922F97C()
{
  unint64_t result = qword_26B152350;
  if (!qword_26B152350)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26B152340);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B152350);
  }
  return result;
}

id SubscriptionPurchaseRequest.buyParams.getter()
{
  return *v0;
}

uint64_t SubscriptionPurchaseRequest.continuation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SubscriptionPurchaseRequest() + 20);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522A0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for SubscriptionPurchaseRequest()
{
  uint64_t result = qword_26B14F4F8;
  if (!qword_26B14F4F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24922FAAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[10] = a1;
  v3[11] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150DD8);
  v3[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24922FB40, 0, 0);
}

uint64_t sub_24922FB40()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[13] = Strong;
  if (Strong)
  {
    return MEMORY[0x270FA2498](sub_24922FC8C, Strong, 0);
  }
  else
  {
    uint64_t v2 = v0[12];
    uint64_t v3 = sub_2492532E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
    sub_248B94494(v0[12], &qword_26B150DD8);
    sub_248D27EEC();
    swift_allocError();
    *uint64_t v4 = 0;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_24922FC8C()
{
  sub_248BAFFD8(*(void *)(v0 + 104) + 128, v0 + 16);
  swift_release();
  return MEMORY[0x270FA2498](sub_24922FD04, 0, 0);
}

uint64_t sub_24922FD04()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[14] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24922FDC0;
  uint64_t v4 = v0[12];
  return MEMORY[0x270F629D8](v4, v1, v2);
}

uint64_t sub_24922FDC0()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_249230060;
  }
  else {
    uint64_t v2 = sub_24922FED4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24922FED4()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = sub_2492532E0();
  uint64_t v3 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_248B94494(v0[12], &qword_26B150DD8);
    sub_248D27EEC();
    swift_allocError();
    *uint64_t v4 = 0;
    swift_willThrow();
  }
  else
  {
    (*(void (**)(void, void, uint64_t))(v3 + 32))(v0[10], v0[12], v2);
  }
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_249230060()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2492300CC(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 104) = a2;
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = v2;
  uint64_t v4 = sub_249255190();
  *(void *)(v3 + 40) = v4;
  *(void *)(v3 + 48) = *(void *)(v4 - 8);
  *(void *)(v3 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249230190, v2, 0);
}

uint64_t sub_249230190()
{
  uint64_t v1 = *(void **)(v0 + 32);
  int v2 = *(unsigned __int8 *)(v0 + 104);
  uint64_t v3 = v1[19];
  uint64_t v4 = v1[20];
  __swift_project_boxed_opaque_existential_1(v1 + 16, v3);
  if (v2 == 1)
  {
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 64) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_2492302D8;
    uint64_t v6 = *(void *)(v0 + 24);
    return MEMORY[0x270F629D0](v6, v3, v4);
  }
  else
  {
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v7;
    void *v7 = v0;
    v7[1] = sub_2492303F0;
    uint64_t v8 = *(void *)(v0 + 24);
    return MEMORY[0x270F629D8](v8, v3, v4);
  }
}

uint64_t sub_2492302D8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2492303F0()
{
  int v2 = (void *)*v1;
  v2[10] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[4];
    return MEMORY[0x270FA2498](sub_24923052C, v3, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_24923052C()
{
  uint64_t v1 = *(void **)(v0 + 80);
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B152BD0);
  if (swift_dynamicCast())
  {
    if ((*(unsigned int (**)(void, void))(*(void *)(v0 + 48) + 88))(*(void *)(v0 + 56), *(void *)(v0 + 40)) == *MEMORY[0x263F6B850])
    {
      uint64_t v3 = *(void **)(v0 + 32);
      uint64_t v4 = v3 + 16;

      uint64_t v5 = v3[19];
      uint64_t v6 = v3[20];
      __swift_project_boxed_opaque_existential_1(v4, v5);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 88) = v7;
      void *v7 = v0;
      v7[1] = sub_2492306CC;
      uint64_t v8 = *(void *)(v0 + 24);
      return MEMORY[0x270F629D0](v8, v5, v6);
    }
    (*(void (**)(void, void))(*(void *)(v0 + 48) + 8))(*(void *)(v0 + 56), *(void *)(v0 + 40));
  }

  swift_willThrow();
  swift_task_dealloc();
  int64_t v9 = *(uint64_t (**)(void))(v0 + 8);
  return v9();
}

uint64_t sub_2492306CC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 32);
  if (v0) {
    uint64_t v4 = sub_249230864;
  }
  else {
    uint64_t v4 = sub_2492307F8;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_2492307F8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249230864()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2492308D0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522C0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SubscriptionPurchaseRequest();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v9 - 8);
  unint64_t v13 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  int64_t v16 = (uint64_t *)((char *)&v26 - v15);
  unint64_t v17 = (char *)&v26 + *(int *)(v14 + 28) - v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522A0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v17, a1, v18);
  *int64_t v16 = a2;
  uint64_t v19 = sub_24925DE80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v8, 1, 1, v19);
  sub_249231FF8((uint64_t)v16, (uint64_t)v13);
  uint64_t v21 = sub_2492323F0((unint64_t *)&unk_2696838F8, v20, (void (*)(uint64_t))type metadata accessor for LiveServiceSubscriptionService);
  unint64_t v22 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v23 = (void *)swift_allocObject();
  v23[2] = a3;
  v23[3] = v21;
  v23[4] = a3;
  sub_249232164((uint64_t)v13, (uint64_t)v23 + v22);
  swift_retain_n();
  id v24 = a2;
  sub_24912E778((uint64_t)v8, (uint64_t)&unk_269683910, (uint64_t)v23);
  swift_release();
  return sub_2492322B0((uint64_t)v16);
}

uint64_t sub_249230B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_249230B58, a4, 0);
}

uint64_t sub_249230B58()
{
  *(void *)(v0 + 32) = *(void *)(*(void *)(v0 + 16) + 168);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151758);
  sub_248BFED38((unint64_t *)&unk_26B151748, &qword_26B151758);
  uint64_t v2 = sub_24925DDB0();
  return MEMORY[0x270FA2498](sub_249230C18, v2, v1);
}

uint64_t sub_249230C18()
{
  sub_24925A840();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249230C78()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 128);
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t static ServiceSubscriptionService.live(with:)@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151840);
  sub_249252070();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B152520);
  sub_249252070();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151290);
  sub_249252070();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B151030);
  long long v5 = *(_OWORD *)&v6[5];
  sub_249252070();
  type metadata accessor for LiveServiceSubscriptionService();
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151758);
  uint64_t v3 = sub_24925A850();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  *(void *)(v2 + 168) = v3;
  *(_OWORD *)(v2 + 112) = v5;
  sub_248B9CDEC((long long *)v6, v2 + 128);
  *a1 = &unk_269683898;
  a1[1] = v2;
  a1[2] = &unk_2696838A8;
  a1[3] = v2;
  a1[4] = &unk_2696838B8;
  a1[5] = v2;
  a1[6] = &unk_2696838C8;
  a1[7] = v2;
  a1[8] = &unk_2696838D8;
  a1[9] = v2;
  a1[10] = &unk_2696838E8;
  a1[11] = v2;
  return swift_retain_n();
}

uint64_t type metadata accessor for LiveServiceSubscriptionService()
{
  return self;
}

uint64_t sub_249230E80(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_249230E9C, a2, 0);
}

uint64_t sub_249230E9C()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[19];
  uint64_t v3 = v1[20];
  __swift_project_boxed_opaque_existential_1(v1 + 16, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[4] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_248F330EC;
  uint64_t v5 = v0[2];
  return MEMORY[0x270F629D8](v5, v2, v3);
}

uint64_t sub_249230F5C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_248B97464;
  return MEMORY[0x270FA2498](sub_249230E9C, v1, 0);
}

uint64_t sub_249231008(uint64_t a1, char a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_248B941DC;
  return sub_2492300CC(a1, a2);
}

uint64_t sub_2492310B4(uint64_t a1, char a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_248B97464;
  return sub_249231008(a1, a2);
}

uint64_t sub_249231160(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24923117C, a2, 0);
}

uint64_t sub_24923117C()
{
  swift_getObjectType();
  sub_2492551D0();
  swift_allocObject();
  swift_weakInit();
  sub_2492532E0();
  sub_2492323F0(&qword_26B151060, 255, MEMORY[0x263F6B890]);
  sub_249257480();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2492312B4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_248B97464;
  return MEMORY[0x270FA2498](sub_24923117C, v1, 0);
}

uint64_t sub_249231360(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24923137C, a2, 0);
}

uint64_t sub_24923137C()
{
  swift_getObjectType();
  sub_249255180();
  sub_2492323F0(&qword_26B151040, 255, MEMORY[0x263F6B838]);
  sub_249257490();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24923145C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_248B97464;
  return MEMORY[0x270FA2498](sub_24923137C, v1, 0);
}

uint64_t sub_249231508(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522D0);
  v2[4] = v4;
  v2[5] = *(void *)(v4 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2492315D0, a2, 0);
}

uint64_t sub_2492315D0()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = (void *)v0[6];
  uint64_t v3 = (uint64_t *)v0[2];
  v0[7] = *(void *)(v0[3] + 168);
  *uint64_t v1 = 1;
  (*(void (**)(void))(v2 + 104))();
  v3[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B152340);
  v3[4] = sub_248BFED38((unint64_t *)&qword_26B152350, (uint64_t *)&unk_26B152340);
  v0[8] = __swift_allocate_boxed_opaque_existential_1(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151758);
  sub_248BFED38((unint64_t *)&unk_26B151748, &qword_26B151758);
  uint64_t v5 = sub_24925DDB0();
  return MEMORY[0x270FA2498](sub_248C1C830, v5, v4);
}

uint64_t sub_249231704(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  return sub_249231508(a1, v1);
}

uint64_t sub_2492317A0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_2492317BC, a2, 0);
}

uint64_t sub_2492317BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2[3];
  uint64_t v3 = v2[4];
  uint64_t v5 = sub_2492323F0((unint64_t *)&unk_2696838F8, a2, (void (*)(uint64_t))type metadata accessor for LiveServiceSubscriptionService);
  uint64_t v6 = swift_task_alloc();
  v2[5] = v6;
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v3;
  uint64_t v7 = (void *)swift_task_alloc();
  v2[6] = v7;
  unint64_t v8 = sub_249231FB0();
  void *v7 = v2;
  v7[1] = sub_2492215D4;
  return MEMORY[0x270FA2360](v2 + 2, v3, v5, 0xD000000000000018, 0x800000024927DF40, sub_249231FF0, v6, v8);
}

uint64_t sub_2492318FC(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248BF9EC4;
  v4[3] = a1;
  v4[4] = v1;
  return MEMORY[0x270FA2498](sub_2492317BC, v1, 0);
}

void **initializeBufferWithCopyOfBuffer for SubscriptionPurchaseRequest(void **a1, void **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = (char *)*a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void **)&v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    unint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = v5;
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522A0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v7, v8, v10);
  }
  return a1;
}

uint64_t destroy for SubscriptionPurchaseRequest(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522A0);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void **initializeWithCopy for SubscriptionPurchaseRequest(void **a1, void **a2, uint64_t a3)
{
  int v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  id v8 = v4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522A0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v6, v7, v9);
  return a1;
}

void **assignWithCopy for SubscriptionPurchaseRequest(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522A0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

void *initializeWithTake for SubscriptionPurchaseRequest(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522A0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void **assignWithTake for SubscriptionPurchaseRequest(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522A0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionPurchaseRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249231D2C);
}

uint64_t sub_249231D2C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522A0);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SubscriptionPurchaseRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249231DF4);
}

void *sub_249231DF4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522A0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_249231EA0()
{
  sub_249231F3C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_249231F3C()
{
  if (!qword_26B1522A8)
  {
    sub_249231FB0();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B152BD0);
    unint64_t v0 = sub_24925DDE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B1522A8);
    }
  }
}

unint64_t sub_249231FB0()
{
  unint64_t result = qword_26B152590;
  if (!qword_26B152590)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B152590);
  }
  return result;
}

uint64_t sub_249231FF0(uint64_t a1)
{
  return sub_2492308D0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_249231FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SubscriptionPurchaseRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24923205C()
{
  uint64_t v1 = (int *)(type metadata accessor for SubscriptionPurchaseRequest() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v3 = (id *)(v0 + v2);

  uint64_t v4 = (char *)v3 + v1[7];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1522A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_249232164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SubscriptionPurchaseRequest();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2492321C8()
{
  uint64_t v2 = *(void *)(type metadata accessor for SubscriptionPurchaseRequest() - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[2] = v3;
  v5[3] = v4;
  v5[1] = sub_248B941DC;
  return MEMORY[0x270FA2498](sub_249230B58, v3, 0);
}

uint64_t sub_2492322B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SubscriptionPurchaseRequest();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24923230C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_249232344(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_248B941DC;
  return sub_24922FAAC(a1, a2, v2);
}

uint64_t sub_2492323F0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t CatalogService.fetchRemoteCatalogEditorialCollectionDetail.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteCatalogLockups.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteCatalogModalityDetail.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteCatalogProgramDetail.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteCatalogWorkoutDetail.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteCatalogWorkouts.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteNavigationEditorialContent.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteExploreShelfLockupDescriptors.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteGalleryLockups.getter()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteLegacyShelfLockupDescriptors.getter()
{
  uint64_t v1 = *(void *)(v0 + 144);
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteExploreTrainerTipShelfLockupDescriptor.getter()
{
  uint64_t v1 = *(void *)(v0 + 160);
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteTrainerDetail.getter()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_retain();
  return v1;
}

uint64_t CatalogService.fetchRemoteTrainerTipGalleryDetail.getter()
{
  uint64_t v1 = *(void *)(v0 + 192);
  swift_retain();
  return v1;
}

uint64_t CatalogService.filterCatalog.getter()
{
  uint64_t v1 = *(void *)(v0 + 208);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryAllBodyFocuses.getter()
{
  uint64_t v1 = *(void *)(v0 + 224);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryAllCatalogModalityReferences.getter()
{
  uint64_t v1 = *(void *)(v0 + 240);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryAllCatalogThemeCategories.getter()
{
  uint64_t v1 = *(void *)(v0 + 256);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryAllCatalogThemes.getter()
{
  uint64_t v1 = *(void *)(v0 + 272);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryAllEquipment.getter()
{
  uint64_t v1 = *(void *)(v0 + 288);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryAllMusicGenres.getter()
{
  uint64_t v1 = *(void *)(v0 + 304);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryAllSkillLevels.getter()
{
  uint64_t v1 = *(void *)(v0 + 320);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryAllTrainerReferences.getter()
{
  uint64_t v1 = *(void *)(v0 + 336);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryCachedCatalogWorkoutDetail.getter()
{
  uint64_t v1 = *(void *)(v0 + 352);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryCachedCatalogWorkoutLockups.getter()
{
  uint64_t v1 = *(void *)(v0 + 368);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryCatalogFilterOptions.getter()
{
  uint64_t v1 = *(void *)(v0 + 384);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryCatalogWorkoutReferences.getter()
{
  uint64_t v1 = *(void *)(v0 + 400);
  swift_retain();
  return v1;
}

uint64_t CatalogService.makeCatalogDeletedStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 416);
  swift_retain();
  return v1;
}

uint64_t CatalogService.makeCatalogUpdatedStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 432);
  swift_retain();
  return v1;
}

uint64_t CatalogService.makeTrainerTipJournalsUpdatedStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 448);
  swift_retain();
  return v1;
}

uint64_t CatalogService.requestCatalogSync.getter()
{
  uint64_t v1 = *(void *)(v0 + 464);
  swift_retain();
  return v1;
}

uint64_t CatalogService.requestCatalogLockupPlaceholderBackfill.getter()
{
  uint64_t v1 = *(void *)(v0 + 480);
  swift_retain();
  return v1;
}

uint64_t CatalogService.queryCatalogWorkoutReferencesReleasedSince.getter()
{
  uint64_t v1 = *(void *)(v0 + 496);
  swift_retain();
  return v1;
}

uint64_t destroy for CatalogService()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CatalogService(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  uint64_t v3 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = v3;
  uint64_t v4 = *(void *)(a2 + 288);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = v4;
  uint64_t v5 = *(void *)(a2 + 304);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(void *)(a1 + 304) = v5;
  uint64_t v6 = *(void *)(a2 + 320);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(void *)(a1 + 320) = v6;
  uint64_t v7 = *(void *)(a2 + 336);
  *(void *)(a1 + 328) = *(void *)(a2 + 328);
  *(void *)(a1 + 336) = v7;
  uint64_t v8 = *(void *)(a2 + 352);
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  *(void *)(a1 + 352) = v8;
  uint64_t v9 = *(void *)(a2 + 368);
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  *(void *)(a1 + 368) = v9;
  uint64_t v10 = *(void *)(a2 + 384);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = v10;
  uint64_t v11 = *(void *)(a2 + 400);
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  *(void *)(a1 + 400) = v11;
  uint64_t v12 = *(void *)(a2 + 416);
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  *(void *)(a1 + 416) = v12;
  uint64_t v13 = *(void *)(a2 + 432);
  *(void *)(a1 + 424) = *(void *)(a2 + 424);
  *(void *)(a1 + 432) = v13;
  uint64_t v14 = *(void *)(a2 + 448);
  *(void *)(a1 + 440) = *(void *)(a2 + 440);
  *(void *)(a1 + 448) = v14;
  uint64_t v15 = *(void *)(a2 + 464);
  *(void *)(a1 + 456) = *(void *)(a2 + 456);
  *(void *)(a1 + 464) = v15;
  uint64_t v16 = *(void *)(a2 + 480);
  *(void *)(a1 + 472) = *(void *)(a2 + 472);
  *(void *)(a1 + 480) = v16;
  uint64_t v17 = *(void *)(a2 + 496);
  uint64_t v18 = *(void *)(a2 + 504);
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  *(void *)(a1 + 496) = v17;
  *(void *)(a1 + 504) = v18;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for CatalogService(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_retain();
  swift_release();
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_retain();
  swift_release();
  uint64_t v12 = a2[17];
  a1[16] = a2[16];
  a1[17] = v12;
  swift_retain();
  swift_release();
  uint64_t v13 = a2[19];
  a1[18] = a2[18];
  a1[19] = v13;
  swift_retain();
  swift_release();
  uint64_t v14 = a2[21];
  a1[20] = a2[20];
  a1[21] = v14;
  swift_retain();
  swift_release();
  uint64_t v15 = a2[23];
  a1[22] = a2[22];
  a1[23] = v15;
  swift_retain();
  swift_release();
  uint64_t v16 = a2[25];
  a1[24] = a2[24];
  a1[25] = v16;
  swift_retain();
  swift_release();
  uint64_t v17 = a2[27];
  a1[26] = a2[26];
  a1[27] = v17;
  swift_retain();
  swift_release();
  uint64_t v18 = a2[29];
  a1[28] = a2[28];
  a1[29] = v18;
  swift_retain();
  swift_release();
  uint64_t v19 = a2[31];
  a1[30] = a2[30];
  a1[31] = v19;
  swift_retain();
  swift_release();
  uint64_t v20 = a2[33];
  a1[32] = a2[32];
  a1[33] = v20;
  swift_retain();
  swift_release();
  uint64_t v21 = a2[35];
  a1[34] = a2[34];
  a1[35] = v21;
  swift_retain();
  swift_release();
  uint64_t v22 = a2[37];
  a1[36] = a2[36];
  a1[37] = v22;
  swift_retain();
  swift_release();
  uint64_t v23 = a2[39];
  a1[38] = a2[38];
  a1[39] = v23;
  swift_retain();
  swift_release();
  uint64_t v24 = a2[41];
  a1[40] = a2[40];
  a1[41] = v24;
  swift_retain();
  swift_release();
  uint64_t v25 = a2[43];
  a1[42] = a2[42];
  a1[43] = v25;
  swift_retain();
  swift_release();
  uint64_t v26 = a2[45];
  a1[44] = a2[44];
  a1[45] = v26;
  swift_retain();
  swift_release();
  uint64_t v27 = a2[47];
  a1[46] = a2[46];
  a1[47] = v27;
  swift_retain();
  swift_release();
  uint64_t v28 = a2[49];
  a1[48] = a2[48];
  a1[49] = v28;
  swift_retain();
  swift_release();
  uint64_t v29 = a2[51];
  a1[50] = a2[50];
  a1[51] = v29;
  swift_retain();
  swift_release();
  uint64_t v30 = a2[53];
  a1[52] = a2[52];
  a1[53] = v30;
  swift_retain();
  swift_release();
  uint64_t v31 = a2[55];
  a1[54] = a2[54];
  a1[55] = v31;
  swift_retain();
  swift_release();
  uint64_t v32 = a2[57];
  a1[56] = a2[56];
  a1[57] = v32;
  swift_retain();
  swift_release();
  uint64_t v33 = a2[59];
  a1[58] = a2[58];
  a1[59] = v33;
  swift_retain();
  swift_release();
  uint64_t v34 = a2[61];
  a1[60] = a2[60];
  a1[61] = v34;
  swift_retain();
  swift_release();
  uint64_t v35 = a2[63];
  a1[62] = a2[62];
  a1[63] = v35;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy512_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x200uLL);
}

_OWORD *assignWithTake for CatalogService(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  a1[5] = a2[5];
  swift_release();
  a1[6] = a2[6];
  swift_release();
  a1[7] = a2[7];
  swift_release();
  a1[8] = a2[8];
  swift_release();
  a1[9] = a2[9];
  swift_release();
  a1[10] = a2[10];
  swift_release();
  a1[11] = a2[11];
  swift_release();
  a1[12] = a2[12];
  swift_release();
  a1[13] = a2[13];
  swift_release();
  a1[14] = a2[14];
  swift_release();
  a1[15] = a2[15];
  swift_release();
  a1[16] = a2[16];
  swift_release();
  a1[17] = a2[17];
  swift_release();
  a1[18] = a2[18];
  swift_release();
  a1[19] = a2[19];
  swift_release();
  a1[20] = a2[20];
  swift_release();
  a1[21] = a2[21];
  swift_release();
  a1[22] = a2[22];
  swift_release();
  a1[23] = a2[23];
  swift_release();
  a1[24] = a2[24];
  swift_release();
  a1[25] = a2[25];
  swift_release();
  a1[26] = a2[26];
  swift_release();
  a1[27] = a2[27];
  swift_release();
  a1[28] = a2[28];
  swift_release();
  a1[29] = a2[29];
  swift_release();
  a1[30] = a2[30];
  swift_release();
  a1[31] = a2[31];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CatalogService(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 512)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CatalogService(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 504) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 512) = 1;
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
    *(unsigned char *)(result + 512) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CatalogService()
{
  return &type metadata for CatalogService;
}

__n128 sub_2492334C4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, long long a10, long long a11, long long a12, long long a13, long long a14, long long a15, long long a16, long long a17, long long a18, long long a19, long long a20,long long a21,long long a22,long long a23,long long a24,long long a25,long long a26,long long a27,long long a28,long long a29,long long a30,long long a31,long long a32,long long a33,long long a34,long long a35,__n128 a36,uint64_t a37,uint64_t a38)
{
  __n128 result = a36;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(_OWORD *)(a9 + 96) = a12;
  *(_OWORD *)(a9 + 112) = a13;
  *(_OWORD *)(a9 + 128) = a14;
  *(_OWORD *)(a9 + 144) = a15;
  *(_OWORD *)(a9 + 160) = a16;
  *(_OWORD *)(a9 + 176) = a17;
  *(_OWORD *)(a9 + 192) = a18;
  *(_OWORD *)(a9 + 208) = a19;
  *(_OWORD *)(a9 + 224) = a20;
  *(_OWORD *)(a9 + 240) = a21;
  *(_OWORD *)(a9 + 256) = a22;
  *(_OWORD *)(a9 + 272) = a23;
  *(_OWORD *)(a9 + 288) = a24;
  *(_OWORD *)(a9 + 304) = a25;
  *(_OWORD *)(a9 + 320) = a26;
  *(_OWORD *)(a9 + 336) = a27;
  *(_OWORD *)(a9 + 352) = a28;
  *(_OWORD *)(a9 + 368) = a29;
  *(_OWORD *)(a9 + 384) = a30;
  *(_OWORD *)(a9 + 400) = a31;
  *(_OWORD *)(a9 + 416) = a32;
  *(_OWORD *)(a9 + 432) = a33;
  *(_OWORD *)(a9 + 448) = a34;
  *(_OWORD *)(a9 + 464) = a35;
  *(__n128 *)(a9 + 480) = a36;
  *(void *)(a9 + 496) = a37;
  *(void *)(a9 + 504) = a38;
  return result;
}

uint64_t sub_249233568(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D70);
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24923362C, v1, 0);
}

uint64_t sub_24923362C()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 32) + 112), *(void *)(*(void *)(v0 + 32) + 136));
  sub_249257050();
  return MEMORY[0x270FA2498](sub_2492336C8, 0, 0);
}

uint64_t sub_2492336C8()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = swift_task_alloc();
  v0[8] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 28;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D78);
  *uint64_t v3 = v0;
  v3[1] = sub_2491C5ACC;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241954, v2, v4);
}

uint64_t sub_2492337E8(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 160) = a2;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = v2;
  uint64_t v4 = sub_249257580();
  *(void *)(v3 + 80) = v4;
  *(void *)(v3 + 88) = *(void *)(v4 - 8);
  *(void *)(v3 + 96) = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696819F0);
  *(void *)(v3 + 104) = v5;
  *(void *)(v3 + 112) = *(void *)(v5 - 8);
  *(void *)(v3 + 120) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24923390C, v2, 0);
}

uint64_t sub_24923390C()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  sub_249256FD0();
  sub_248DE64EC();
  sub_24925E160();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F68950], v3);
  uint64_t v4 = sub_249257570();
  uint64_t v5 = MEMORY[0x263F68940];
  v0[5] = v4;
  v0[6] = v5;
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_249257560();
  sub_249257980();
  swift_allocObject();
  sub_249257970();
  sub_24925E160();
  sub_249256FC0();
  sub_249256FB0();
  swift_release();
  return MEMORY[0x270FA2498](sub_249233A74, 0, 0);
}

uint64_t sub_249233A74()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = swift_task_alloc();
  v0[16] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 34;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[17] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269681A38);
  *uint64_t v3 = v0;
  v3[1] = sub_249233B94;
  return MEMORY[0x270FA2360](v0 + 7, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492412B4, v2, v4);
}

uint64_t sub_249233B94()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_249233D80;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = v2[15];
    uint64_t v6 = v2[13];
    uint64_t v7 = v2[14];
    uint64_t v8 = v2[9];
    v2[19] = v2[7];
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    uint64_t v3 = sub_249233CF0;
    uint64_t v4 = v8;
  }
  return MEMORY[0x270FA2498](v3, v4, 0);
}

uint64_t sub_249233CF0()
{
  uint64_t v1 = sub_249233E80(*(void *)(v0 + 152), *(unsigned __int8 *)(v0 + 160));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249233D80()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[9];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  return MEMORY[0x270FA2498](sub_249233E10, v4, 0);
}

uint64_t sub_249233E10()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249233E80(uint64_t a1, int a2)
{
  int v47 = a2;
  uint64_t v3 = sub_2492539F0();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  v44 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  v46 = (char *)&v39 - v7;
  uint64_t result = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v39 - v10;
  int64_t v12 = 0;
  uint64_t v56 = MEMORY[0x263F8EE78];
  uint64_t v48 = a1;
  uint64_t v49 = v9;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v14 = a1 + 56;
  uint64_t v13 = v15;
  uint64_t v16 = 1 << *(unsigned char *)(v14 - 24);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & v13;
  uint64_t v42 = v14;
  int64_t v43 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v45 = v9 + 16;
  v40 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  v41 = v11;
  while (1)
  {
    if (v18)
    {
      uint64_t v50 = (v18 - 1) & v18;
      int64_t v51 = v12;
      unint64_t v19 = __clz(__rbit64(v18)) | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v20 >= v43) {
      goto LABEL_30;
    }
    unint64_t v21 = *(void *)(v42 + 8 * v20);
    int64_t v22 = v12 + 1;
    if (!v21)
    {
      int64_t v22 = v12 + 2;
      if (v12 + 2 >= v43) {
        goto LABEL_30;
      }
      unint64_t v21 = *(void *)(v42 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = v12 + 3;
        if (v12 + 3 >= v43) {
          goto LABEL_30;
        }
        unint64_t v21 = *(void *)(v42 + 8 * v22);
        if (!v21)
        {
          int64_t v22 = v12 + 4;
          if (v12 + 4 >= v43) {
            goto LABEL_30;
          }
          unint64_t v21 = *(void *)(v42 + 8 * v22);
          if (!v21) {
            break;
          }
        }
      }
    }
LABEL_23:
    uint64_t v50 = (v21 - 1) & v21;
    int64_t v51 = v22;
    unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
LABEL_24:
    uint64_t v24 = v49;
    uint64_t v25 = *(void *)(v49 + 72);
    uint64_t v26 = v46;
    (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))(v46, *(void *)(v48 + 48) + v25 * v19, v3);
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v27(v11, v26, v3);
    uint64_t v28 = sub_2492539E0();
    uint64_t v30 = v29;
    uint64_t v53 = v28;
    uint64_t v54 = v29;
    uint64_t v31 = v3;
    char v33 = v32 & 1;
    char v55 = v32 & 1;
    char v52 = v47;
    sub_248EE0704();
    uint64_t v34 = v11;
    sub_248EE0758();
    char v35 = sub_249252140();
    sub_248BC9154(v28, v30, v33);
    if (v35)
    {
      v27(v44, v34, v31);
      uint64_t v36 = v56;
      uint64_t v3 = v31;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24924662C(0, *(void *)(v36 + 16) + 1, 1);
        uint64_t v36 = v56;
      }
      unint64_t v38 = *(void *)(v36 + 16);
      unint64_t v37 = *(void *)(v36 + 24);
      if (v38 >= v37 >> 1)
      {
        sub_24924662C(v37 > 1, v38 + 1, 1);
        uint64_t v36 = v56;
      }
      *(void *)(v36 + 16) = v38 + 1;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v27)(v36+ ((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80))+ v38 * v25, v44, v31);
      uint64_t v56 = v36;
      uint64_t v11 = v41;
    }
    else
    {
      uint64_t result = (*v40)(v34, v31);
      uint64_t v3 = v31;
      uint64_t v11 = v34;
    }
    unint64_t v18 = v50;
    int64_t v12 = v51;
  }
  uint64_t v23 = v12 + 5;
  if (v12 + 5 >= v43)
  {
LABEL_30:
    swift_release();
    return v56;
  }
  unint64_t v21 = *(void *)(v42 + 8 * v23);
  if (v21)
  {
    int64_t v22 = v12 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v22 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v22 >= v43) {
      goto LABEL_30;
    }
    unint64_t v21 = *(void *)(v42 + 8 * v22);
    ++v23;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_24923428C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D58);
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249234354, v3, 0);
}

uint64_t sub_249234354()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 40) + 112), *(void *)(*(void *)(v0 + 40) + 136));
  sub_249257000();
  return MEMORY[0x270FA2498](sub_249234400, 0, 0);
}

uint64_t sub_249234400()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = swift_task_alloc();
  v0[9] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 41;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  uint64_t v4 = sub_249254510();
  *uint64_t v3 = v0;
  v3[1] = sub_249234510;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241864, v2, v4);
}

uint64_t sub_249234510()
{
  uint64_t v2 = (void *)*v1;
  v2[11] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_249234680, 0, 0);
  }
  else
  {
    uint64_t v3 = v2[8];
    uint64_t v4 = v2[6];
    uint64_t v5 = v2[7];
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v2[1];
    return v6();
  }
}

uint64_t sub_249234680()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[5];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  return MEMORY[0x270FA2498](sub_2492419A0, v4, 0);
}

uint64_t sub_249234710(char a1, uint64_t a2)
{
  *(void *)(v3 + 24) = a2;
  *(void *)(v3 + 32) = v2;
  *(unsigned char *)(v3 + 88) = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F00);
  *(void *)(v3 + 40) = v4;
  *(void *)(v3 + 48) = *(void *)(v4 - 8);
  *(void *)(v3 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2492347D8, v2, 0);
}

uint64_t sub_2492347D8()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 32) + 112), *(void *)(*(void *)(v0 + 32) + 136));
  sub_249257010();
  return MEMORY[0x270FA2498](sub_249234884, 0, 0);
}

uint64_t sub_249234884()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = swift_task_alloc();
  v0[8] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 52;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B152130);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA6EC;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492413AC, v2, v4);
}

uint64_t sub_2492349A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D40);
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249234A6C, v3, 0);
}

uint64_t sub_249234A6C()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 40) + 112), *(void *)(*(void *)(v0 + 40) + 136));
  sub_249256FF0();
  return MEMORY[0x270FA2498](sub_249234B18, 0, 0);
}

uint64_t sub_249234B18()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = swift_task_alloc();
  v0[9] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 56;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  uint64_t v4 = sub_249253700();
  *uint64_t v3 = v0;
  v3[1] = sub_249234510;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241814, v2, v4);
}

uint64_t sub_249234C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D28);
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249234CF0, v3, 0);
}

uint64_t sub_249234CF0()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 40) + 112), *(void *)(*(void *)(v0 + 40) + 136));
  sub_249256FE0();
  return MEMORY[0x270FA2498](sub_249234D9C, 0, 0);
}

uint64_t sub_249234D9C()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = swift_task_alloc();
  v0[9] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 60;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  uint64_t v4 = sub_2492534B0();
  *uint64_t v3 = v0;
  v3[1] = sub_249228468;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492417C4, v2, v4);
}

uint64_t sub_249234EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150EC8);
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249234F74, v3, 0);
}

uint64_t sub_249234F74()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 40) + 112), *(void *)(*(void *)(v0 + 40) + 136));
  sub_249257170();
  return MEMORY[0x270FA2498](sub_249235020, 0, 0);
}

uint64_t sub_249235020()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = swift_task_alloc();
  v0[9] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 64;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  uint64_t v4 = sub_249253600();
  *uint64_t v3 = v0;
  v3[1] = sub_249234510;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492413E0, v2, v4);
}

uint64_t sub_249235138(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_2492540D0();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D10);
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249235258, v1, 0);
}

uint64_t sub_249235258()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  __swift_project_boxed_opaque_existential_1((void *)(v0[4] + 112), *(void *)(v0[4] + 136));
  swift_bridgeObjectRetain();
  sub_2492540C0();
  sub_249257020();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return MEMORY[0x270FA2498](sub_249235334, 0, 0);
}

uint64_t sub_249235334()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = swift_task_alloc();
  v0[11] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 70;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D18);
  *uint64_t v3 = v0;
  v3[1] = sub_249235454;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241790, v2, v4);
}

uint64_t sub_249235454()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_249235648;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = v2[10];
    uint64_t v6 = v2[8];
    uint64_t v7 = v2[9];
    uint64_t v8 = v2[4];
    v2[14] = v2[2];
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    uint64_t v3 = sub_2492355B0;
    uint64_t v4 = v8;
  }
  return MEMORY[0x270FA2498](v3, v4, 0);
}

uint64_t sub_2492355B0()
{
  uint64_t v1 = sub_249247894(*(void *)(v0 + 112));
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249235648()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[4];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  return MEMORY[0x270FA2498](sub_248BF2C48, v4, 0);
}

uint64_t sub_2492356D8(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683CF8);
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24923579C, v1, 0);
}

uint64_t sub_24923579C()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_249257140();
  return MEMORY[0x270FA2498](sub_249235830, 0, 0);
}

uint64_t sub_249235830()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 75;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = sub_249254000();
  *uint64_t v3 = v0;
  v3[1] = sub_2491EE880;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241740, v2, v4);
}

uint64_t sub_249235940()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683CD0);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249235A04, v0, 0);
}

uint64_t sub_249235A04()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_249257150();
  return MEMORY[0x270FA2498](sub_249235A98, 0, 0);
}

uint64_t sub_249235A98()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 79;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269681588);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA264;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492416D8, v2, v4);
}

uint64_t sub_249235BB8(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 + 32) = a3;
  *(void *)(v4 + 40) = v3;
  *(void *)(v4 + 24) = a2;
  *(unsigned char *)(v4 + 96) = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683CE0);
  *(void *)(v4 + 48) = v5;
  *(void *)(v4 + 56) = *(void *)(v5 - 8);
  *(void *)(v4 + 64) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249235C84, v3, 0);
}

uint64_t sub_249235C84()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 40) + 112), *(void *)(*(void *)(v0 + 40) + 136));
  sub_249257100();
  return MEMORY[0x270FA2498](sub_249235D38, 0, 0);
}

uint64_t sub_249235D38()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = swift_task_alloc();
  v0[9] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 89;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683CE8);
  *uint64_t v3 = v0;
  v3[1] = sub_249235E58;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_24924170C, v2, v4);
}

uint64_t sub_249235E58()
{
  uint64_t v2 = (void *)*v1;
  v2[11] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2492285D8, 0, 0);
  }
  else
  {
    uint64_t v3 = v2[8];
    uint64_t v4 = v2[6];
    uint64_t v5 = v2[7];
    uint64_t v6 = v2[2];
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(uint64_t))v2[1];
    return v7(v6);
  }
}

uint64_t sub_249235FD0()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683CD0);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249236094, v0, 0);
}

uint64_t sub_249236094()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_249257120();
  return MEMORY[0x270FA2498](sub_249236128, 0, 0);
}

uint64_t sub_249236128()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 93;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269681588);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA264;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492416D8, v2, v4);
}

uint64_t sub_249236248(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683CB8);
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24923630C, v1, 0);
}

uint64_t sub_24923630C()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_249257160();
  return MEMORY[0x270FA2498](sub_2492363A0, 0, 0);
}

uint64_t sub_2492363A0()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 97;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = sub_2492537F0();
  *uint64_t v3 = v0;
  v3[1] = sub_2491EE880;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241688, v2, v4);
}

uint64_t sub_2492364B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683CA0);
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249236578, v3, 0);
}

uint64_t sub_249236578()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 40) + 112), *(void *)(*(void *)(v0 + 40) + 136));
  sub_2492570F0();
  return MEMORY[0x270FA2498](sub_249236624, 0, 0);
}

uint64_t sub_249236624()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = swift_task_alloc();
  v0[9] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 101;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  uint64_t v4 = sub_249252510();
  *uint64_t v3 = v0;
  v3[1] = sub_249234510;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241638, v2, v4);
}

uint64_t sub_249236734(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C88);
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2492367F8, v1, 0);
}

uint64_t sub_2492367F8()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_249257130();
  return MEMORY[0x270FA2498](sub_24923688C, 0, 0);
}

uint64_t sub_24923688C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 105;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = sub_249253AE0();
  *uint64_t v3 = v0;
  v3[1] = sub_2491CE6D4;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492415E8, v2, v4);
}

uint64_t sub_249236998(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C70);
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249236A60, v2, 0);
}

uint64_t sub_249236A60()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 32) + 112), *(void *)(*(void *)(v0 + 32) + 136));
  sub_249257040();
  return MEMORY[0x270FA2498](sub_249236AFC, 0, 0);
}

uint64_t sub_249236AFC()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = swift_task_alloc();
  v0[8] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 111;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  uint64_t v4 = sub_249253170();
  *uint64_t v3 = v0;
  v3[1] = sub_249236C0C;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241598, v2, v4);
}

uint64_t sub_249236C0C()
{
  uint64_t v2 = (void *)*v1;
  v2[10] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2491C4E18, 0, 0);
  }
  else
  {
    uint64_t v3 = v2[7];
    uint64_t v4 = v2[5];
    uint64_t v5 = v2[6];
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v2[1];
    return v6();
  }
}

uint64_t sub_249236D7C()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F58);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249236E40, v0, 0);
}

uint64_t sub_249236E40()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_2492570C0();
  return MEMORY[0x270FA2498](sub_249236ED4, 0, 0);
}

uint64_t sub_249236ED4()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 117;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1524E8);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA264;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241564, v2, v4);
}

uint64_t sub_249236FF4()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F50);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2492370B8, v0, 0);
}

uint64_t sub_2492370B8()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_249257080();
  return MEMORY[0x270FA2498](sub_24923714C, 0, 0);
}

uint64_t sub_24923714C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 121;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1524E0);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA264;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241530, v2, v4);
}

uint64_t sub_24923726C()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C58);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249237330, v0, 0);
}

uint64_t sub_249237330()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_249257070();
  return MEMORY[0x270FA2498](sub_2492373C4, 0, 0);
}

uint64_t sub_2492373C4()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 125;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C60);
  *uint64_t v3 = v0;
  v3[1] = sub_2491A9DE4;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492414FC, v2, v4);
}

uint64_t sub_2492374E4()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F38);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2492375A8, v0, 0);
}

uint64_t sub_2492375A8()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_249257090();
  return MEMORY[0x270FA2498](sub_24923763C, 0, 0);
}

uint64_t sub_24923763C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 129;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1524C8);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA264;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492414C8, v2, v4);
}

uint64_t sub_24923775C()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C40);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249237820, v0, 0);
}

uint64_t sub_249237820()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_2492570A0();
  return MEMORY[0x270FA2498](sub_2492378B4, 0, 0);
}

uint64_t sub_2492378B4()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 133;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C48);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA264;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241494, v2, v4);
}

uint64_t sub_2492379D4()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F20);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249237A98, v0, 0);
}

uint64_t sub_249237A98()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_2492570D0();
  return MEMORY[0x270FA2498](sub_249237B2C, 0, 0);
}

uint64_t sub_249237B2C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 137;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1524B0);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA264;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249241460, v2, v4);
}

uint64_t sub_249237C4C()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F28);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249237D10, v0, 0);
}

uint64_t sub_249237D10()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_2492570E0();
  return MEMORY[0x270FA2498](sub_249237DA4, 0, 0);
}

uint64_t sub_249237DA4()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 141;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1524B8);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA264;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_24924142C, v2, v4);
}

uint64_t sub_249237EC4()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F48);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249237F88, v0, 0);
}

uint64_t sub_249237F88()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 112), *(void *)(*(void *)(v0 + 24) + 136));
  sub_249257110();
  return MEMORY[0x270FA2498](sub_24923801C, 0, 0);
}

uint64_t sub_24923801C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 145;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1524D8);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA264;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492413F8, v2, v4);
}

uint64_t sub_24923813C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150EC8);
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249238204, v3, 0);
}

uint64_t sub_249238204()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 40) + 112), *(void *)(*(void *)(v0 + 40) + 136));
  sub_249257180();
  return MEMORY[0x270FA2498](sub_2492382B0, 0, 0);
}

uint64_t sub_2492382B0()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = swift_task_alloc();
  v0[9] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 149;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  uint64_t v4 = sub_249253600();
  *uint64_t v3 = v0;
  v3[1] = sub_249234510;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492413E0, v2, v4);
}

uint64_t sub_2492383C0(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(v4 + 89) = a3;
  *(unsigned char *)(v4 + 88) = a2;
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F00);
  *(void *)(v4 + 40) = v5;
  *(void *)(v4 + 48) = *(void *)(v5 - 8);
  *(void *)(v4 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24923848C, v3, 0);
}

uint64_t sub_24923848C()
{
  uint64_t v5 = v0;
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 32) + 112), *(void *)(*(void *)(v0 + 32) + 136));
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_248FAFB34(v1);
  swift_bridgeObjectRelease();
  uint64_t v4 = v2;
  sub_248FAF8AC((uint64_t *)&v4);
  sub_249257190();
  swift_release();
  return MEMORY[0x270FA2498](sub_24923859C, 0, 0);
}

uint64_t sub_24923859C()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = swift_task_alloc();
  v0[8] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 161;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B152130);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA6EC;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492413AC, v2, v4);
}

uint64_t sub_2492386BC(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C28);
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249238784, v2, 0);
}

uint64_t sub_249238784()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 32) + 112), *(void *)(*(void *)(v0 + 32) + 136));
  sub_2492570B0();
  return MEMORY[0x270FA2498](sub_249238820, 0, 0);
}

uint64_t sub_249238820()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = swift_task_alloc();
  v0[8] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 167;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  uint64_t v4 = sub_249253430();
  *uint64_t v3 = v0;
  v3[1] = sub_2491C0888;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_24924135C, v2, v4);
}

uint64_t sub_249238930(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696819F0);
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2492389F4, v1, 0);
}

uint64_t sub_2492389F4()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 32) + 112), *(void *)(*(void *)(v0 + 32) + 136));
  sub_249257030();
  return MEMORY[0x270FA2498](sub_249238A90, 0, 0);
}

uint64_t sub_249238A90()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = swift_task_alloc();
  v0[8] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 171;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269681A38);
  *uint64_t v3 = v0;
  v3[1] = sub_2491AA6EC;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_2492412B4, v2, v4);
}

uint64_t sub_249238BB0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_249238BD0, 0, 0);
}

uint64_t sub_249238BD0()
{
  uint64_t v1 = *(uint64_t **)(v0 + 16);
  *uint64_t v1 = sub_249257650();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_249238C38(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 72) = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F60);
  *(void *)(v2 + 24) = v3;
  *(void *)(v2 + 32) = *(void *)(v3 - 8);
  *(void *)(v2 + 40) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249238D00, v1, 0);
}

uint64_t sub_249238D00()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 16) + 112), *(void *)(*(void *)(v0 + 16) + 136));
  sub_249257060();
  return MEMORY[0x270FA2498](sub_249238DA0, 0, 0);
}

uint64_t sub_249238DA0()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = swift_task_alloc();
  v0[6] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/CatalogService/LiveCatalogService.swift";
  *(void *)(v2 + 24) = 105;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 191;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[7] = v3;
  *uint64_t v3 = v0;
  uint64_t v4 = MEMORY[0x263F8EE60];
  v3[1] = sub_2491AABDC;
  return MEMORY[0x270FA2360](v3, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249240CD8, v2, v4 + 8);
}

uint64_t static CatalogService.live(with:)@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151260);
  sub_249252070();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151290);
  sub_249252070();
  type metadata accessor for LiveCatalogService();
  unint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  sub_248B9CDEC(&v32, v2 + 112);
  *(_OWORD *)(v2 + 152) = v31;
  swift_retain_n();
  v30.n128_u64[0] = (unint64_t)&unk_269683B28;
  v30.n128_u64[1] = v2;
  *(void *)&long long v29 = &unk_269683B18;
  *((void *)&v29 + 1) = v2;
  *(void *)&long long v28 = &unk_269683B08;
  *((void *)&v28 + 1) = v2;
  *(void *)&long long v27 = &unk_269683AF8;
  *((void *)&v27 + 1) = v2;
  *(void *)&long long v26 = &unk_269683AE8;
  *((void *)&v26 + 1) = v2;
  *(void *)&long long v25 = &unk_269683AD8;
  *((void *)&v25 + 1) = v2;
  *(void *)&long long v24 = &unk_269683AC8;
  *((void *)&v24 + 1) = v2;
  *(void *)&long long v23 = &unk_269683AB8;
  *((void *)&v23 + 1) = v2;
  *(void *)&long long v22 = &unk_269683AA8;
  *((void *)&v22 + 1) = v2;
  *(void *)&long long v21 = &unk_269683A98;
  *((void *)&v21 + 1) = v2;
  *(void *)&long long v20 = &unk_269683A88;
  *((void *)&v20 + 1) = v2;
  *(void *)&long long v19 = &unk_269683A78;
  *((void *)&v19 + 1) = v2;
  *(void *)&long long v18 = &unk_269683A68;
  *((void *)&v18 + 1) = v2;
  *(void *)&long long v17 = &unk_269683A58;
  *((void *)&v17 + 1) = v2;
  *(void *)&long long v16 = &unk_269683A48;
  *((void *)&v16 + 1) = v2;
  *(void *)&long long v15 = &unk_269683A38;
  *((void *)&v15 + 1) = v2;
  *(void *)&long long v14 = &unk_269683A28;
  *((void *)&v14 + 1) = v2;
  *(void *)&long long v13 = &unk_269683A18;
  *((void *)&v13 + 1) = v2;
  *(void *)&long long v12 = &unk_269683A08;
  *((void *)&v12 + 1) = v2;
  *(void *)&long long v11 = &unk_2696839F8;
  *((void *)&v11 + 1) = v2;
  *(void *)&long long v10 = &unk_2696839E8;
  *((void *)&v10 + 1) = v2;
  *(void *)&long long v9 = &unk_2696839D8;
  *((void *)&v9 + 1) = v2;
  *(void *)&long long v8 = &unk_2696839C8;
  *((void *)&v8 + 1) = v2;
  *(void *)&long long v7 = &unk_2696839B8;
  *((void *)&v7 + 1) = v2;
  *(void *)&long long v6 = &unk_2696839A8;
  *((void *)&v6 + 1) = v2;
  *(void *)&long long v5 = &unk_269683998;
  *((void *)&v5 + 1) = v2;
  *(void *)&long long v4 = &unk_269683988;
  *((void *)&v4 + 1) = v2;
  sub_2492334C4((uint64_t)&unk_269683948, v2, (uint64_t)&unk_269683958, v2, (uint64_t)&unk_269683968, v2, (uint64_t)&unk_269683978, v2, a1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    (uint64_t)&unk_269683B38,
    v2);
  return swift_retain_n();
}

uint64_t type metadata accessor for LiveCatalogService()
{
  return self;
}

uint64_t sub_249239228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_24923428C(a1, a2, a3);
}

uint64_t sub_2492392DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_249239228(a1, a2, a3);
}

uint64_t sub_249239390(char a1, uint64_t a2)
{
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *long long v5 = v2;
  v5[1] = sub_248CEE04C;
  return sub_249234710(a1, a2);
}

uint64_t sub_249239438(char a1, uint64_t a2)
{
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *long long v5 = v2;
  v5[1] = sub_248C03C54;
  return sub_249239390(a1, a2);
}

uint64_t sub_2492394E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_2492349A4(a1, a2, a3);
}

uint64_t sub_249239594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_2492394E0(a1, a2, a3);
}

uint64_t sub_249239648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_249234C28(a1, a2, a3);
}

uint64_t sub_2492396FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_249239648(a1, a2, a3);
}

uint64_t sub_2492397B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_249234EAC(a1, a2, a3);
}

uint64_t sub_249239864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_2492397B0(a1, a2, a3);
}

uint64_t sub_249239918(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248CEE04C;
  return sub_249235138(a1);
}

uint64_t sub_2492399B0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248C03C54;
  return sub_249239918(a1);
}

uint64_t sub_249239A48(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_2492356D8(a1);
}

uint64_t sub_249239AE4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_249239A48(a1);
}

uint64_t sub_249239B80()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CEE04C;
  return sub_249235940();
}

uint64_t sub_249239C10()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_249239B80();
}

uint64_t sub_249239CA0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248CEE04C;
  return sub_249235BB8(a1, a2, a3);
}

uint64_t sub_249239D50(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248C03C54;
  return sub_249239CA0(a1, a2, a3);
}

uint64_t sub_249239E00()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CEE04C;
  return sub_249235FD0();
}

uint64_t sub_249239E90()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_249239E00();
}

uint64_t sub_249239F20(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_249236248(a1);
}

uint64_t sub_249239FBC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_249239F20(a1);
}

uint64_t sub_24923A058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_2492364B0(a1, a2, a3);
}

uint64_t sub_24923A10C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_24923A058(a1, a2, a3);
}

uint64_t sub_24923A1C0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_249236734(a1);
}

uint64_t sub_24923A25C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_24923A1C0(a1);
}

uint64_t sub_24923A2F8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_248B941DC;
  return sub_249236998(a1, a2);
}

uint64_t sub_24923A3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_248B941DC;
  return sub_24923A2F8(a1, a2);
}

uint64_t sub_24923A450()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CEE04C;
  return sub_249236D7C();
}

uint64_t sub_24923A4E0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_24923A450();
}

uint64_t sub_24923A570()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CEE04C;
  return sub_249236FF4();
}

uint64_t sub_24923A600()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_24923A570();
}

uint64_t sub_24923A690()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CEE04C;
  return sub_24923726C();
}

uint64_t sub_24923A720()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_24923A690();
}

uint64_t sub_24923A7B0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CEE04C;
  return sub_2492374E4();
}

uint64_t sub_24923A840()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_24923A7B0();
}

uint64_t sub_24923A8D0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CEE04C;
  return sub_24923775C();
}

uint64_t sub_24923A960()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_24923A8D0();
}

uint64_t sub_24923A9F0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CEE04C;
  return sub_2492379D4();
}

uint64_t sub_24923AA80()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_24923A9F0();
}

uint64_t sub_24923AB10()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CEE04C;
  return sub_249237C4C();
}

uint64_t sub_24923ABA0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_24923AB10();
}

uint64_t sub_24923AC30()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CEE04C;
  return sub_249237EC4();
}

uint64_t sub_24923ACC0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_24923AC30();
}

uint64_t sub_24923AD50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_24923813C(a1, a2, a3);
}

uint64_t sub_24923AE04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_24923AD50(a1, a2, a3);
}

uint64_t sub_24923AEB8(uint64_t a1, char a2, char a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248CEE04C;
  return sub_2492383C0(a1, a2, a3);
}

uint64_t sub_24923AF68(uint64_t a1, char a2, char a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248C03C54;
  return sub_24923AEB8(a1, a2, a3);
}

uint64_t sub_24923B018(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_248B97464;
  return sub_2492386BC(a1, a2);
}

uint64_t sub_24923B0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_248B97464;
  return sub_24923B018(a1, a2);
}

uint64_t sub_24923B170(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248CEE04C;
  return sub_249238930(a1);
}

uint64_t sub_24923B208(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248C03C54;
  return sub_24923B170(a1);
}

uint64_t sub_24923B2A0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24923B2BC, a2, 0);
}

uint64_t sub_24923B2BC()
{
  swift_getObjectType();
  sub_2492573D0();
  sub_249257480();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24923B380(uint64_t a1)
{
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *long long v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_248B97464;
  return MEMORY[0x270FA2498](sub_24923B2BC, v1, 0);
}

uint64_t sub_24923B42C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24923B448, a2, 0);
}

uint64_t sub_24923B448()
{
  swift_getObjectType();
  sub_2492573E0();
  sub_249257480();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24923B50C(uint64_t a1)
{
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *long long v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_248B97464;
  return MEMORY[0x270FA2498](sub_24923B448, v1, 0);
}

uint64_t sub_24923B5B8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24923B5D4, a2, 0);
}

uint64_t sub_24923B5D4()
{
  swift_getObjectType();
  sub_249257660();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269681818);
  sub_249257480();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24923B6AC(uint64_t a1)
{
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *long long v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_248B97464;
  return MEMORY[0x270FA2498](sub_24923B5D4, v1, 0);
}

uint64_t sub_24923B758(char a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_249238C38(a1);
}

uint64_t sub_24923B7F0(char a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_24923B758(a1);
}

uint64_t sub_24923B888(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248CEE04C;
  return sub_249233568(a1);
}

uint64_t sub_24923B920(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248C03C54;
  return sub_24923B888(a1);
}

uint64_t sub_24923B9B8(uint64_t a1, char a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_248CD0BFC;
  return sub_2492337E8(a1, a2);
}

uint64_t sub_24923BA60(uint64_t a1, char a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_248BF9EC4;
  return sub_24923B9B8(a1, a2);
}

uint64_t sub_24923BB08(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D80);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683D70);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_249241990;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923BEC0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D60);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683D58);
  __n128 v30 = (void (*)(uint64_t (*)(), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_249241888;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_2491D8B08, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923C278(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B152240);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F00);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_2492413D0;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923C630(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D48);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683D40);
  __n128 v30 = (void (*)(uint64_t (*)(), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_249241838;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_2491D8B08, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923C9E8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D30);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683D28);
  __n128 v30 = (void (*)(uint64_t (*)(), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_2492417E8;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_2491D8B08, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923CDA0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D20);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683D10);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_2492417B4;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923D158(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D00);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683CF8);
  __n128 v30 = (void (*)(uint64_t (*)(), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_249241764;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_2491D8B08, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923D510(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683CD8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683CD0);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_2492416FC;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923D8C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683CF0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683CE0);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_249241730;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923DC80(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683CC0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683CB8);
  __n128 v30 = (void (*)(uint64_t (*)(), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_2492416AC;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_2491D8B08, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923E038(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683CA8);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683CA0);
  __n128 v30 = (void (*)(uint64_t (*)(), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_24924165C;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_2491D8B08, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923E3F0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C90);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683C88);
  __n128 v30 = (void (*)(uint64_t (*)(), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_24924160C;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_2491D8B08, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923E7A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C78);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683C70);
  __n128 v30 = (void (*)(uint64_t (*)(), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_2492415BC;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_2491D8B08, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923EB60(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B152298);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F58);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_249241588;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923EF18(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B152290);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F50);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_249241554;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923F2D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C68);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683C58);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_249241520;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923F688(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B152278);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F38);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_2492414EC;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923FA40(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C50);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683C40);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_2492414B8;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24923FDF8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B152260);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F20);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_249241484;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_2492401B0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B152268);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F28);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_249241450;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_249240568(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B152288);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F48);
  __n128 v30 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_24924141C;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_248BC8504, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_249240920(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683C30);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  unint64_t v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683C28);
  __n128 v30 = (void (*)(uint64_t (*)(), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_249241380;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_2491D8B08, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_249240CD8(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2491AC0F4);
}

uint64_t sub_249240CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(void), uint64_t *a9, uint64_t *a10)
{
  uint64_t v39 = a6;
  int v38 = a5;
  uint64_t v36 = a3;
  uint64_t v37 = a4;
  uint64_t v35 = a2;
  uint64_t v12 = a8(0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  long long v15 = (char *)&v31 - v14;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(a9);
  MEMORY[0x270FA5388](v42);
  int64_t v43 = (uint64_t *)((char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = sub_24925BCA0();
  uint64_t v40 = *(void *)(v17 - 8);
  uint64_t v41 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2492578E0();
  uint64_t v20 = sub_24925BC80();
  os_log_type_t v21 = sub_24925E0D0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v33 = v12;
    uint64_t v23 = v22;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v34 = a7;
    uint64_t v32 = v24;
    uint64_t v44 = v24;
    *(_DWORD *)uint64_t v23 = 134218498;
    *(void *)(v23 + 4) = v35;
    *(_WORD *)(v23 + 12) = 2080;
    uint64_t v25 = sub_24925E5A0();
    *(void *)(v23 + 14) = sub_248C1DFA8(v25, v26, &v44);
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 22) = 2048;
    *(void *)(v23 + 24) = v39;
    _os_log_impl(&dword_248B72000, v20, v21, "Finished P->A conversion: %ld:%s:%lu", (uint8_t *)v23, 0x20u);
    uint64_t v27 = v32;
    swift_arrayDestroy();
    MEMORY[0x24C59A8D0](v27, -1, -1);
    uint64_t v28 = v23;
    uint64_t v12 = v33;
    MEMORY[0x24C59A8D0](v28, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v40 + 8))(v19, v41);
  uint64_t v29 = v43;
  sub_248BB35D4(a1, (uint64_t)v43, a9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v44 = *v29;
    __swift_instantiateConcreteTypeFromMangledName(a10);
    return sub_24925DDC0();
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v13 + 32))(v15, v29, v12);
    __swift_instantiateConcreteTypeFromMangledName(a10);
    return sub_24925DDD0();
  }
}

uint64_t sub_24924105C(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t *a9)
{
  uint64_t v33 = a7;
  int v32 = a6;
  uint64_t v31 = a5;
  int v34 = a2;
  uint64_t v12 = a9;
  uint64_t v13 = sub_24925BCA0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2492578E0();
  uint64_t v17 = sub_24925BC80();
  os_log_type_t v18 = sub_24925E0D0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v30 = a8;
    uint64_t v20 = v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v29 = a9;
    uint64_t v22 = v21;
    uint64_t v35 = v21;
    *(_DWORD *)uint64_t v20 = 134218498;
    *(void *)(v20 + 4) = a3;
    *(_WORD *)(v20 + 12) = 2080;
    uint64_t v23 = sub_24925E5A0();
    *(void *)(v20 + 14) = sub_248C1DFA8(v23, v24, &v35);
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2048;
    *(void *)(v20 + 24) = v33;
    _os_log_impl(&dword_248B72000, v17, v18, "Finished P->A conversion: %ld:%s:%lu", (uint8_t *)v20, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v22;
    uint64_t v12 = v29;
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v20, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v35 = (uint64_t)a1;
  if (v34)
  {
    id v27 = a1;
    __swift_instantiateConcreteTypeFromMangledName(v12);
    return sub_24925DDC0();
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(v12);
    return sub_24925DDD0();
  }
}

uint64_t sub_2492412B4(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2491B2D94);
}

uint64_t sub_2492412CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  return sub_24924105C(*(void **)a1, *(unsigned __int8 *)(a1 + 8), *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(unsigned __int8 *)(v2 + 40), *(void *)(v2 + 48), v2 + ((*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)), a2);
}

uint64_t sub_24924135C(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_249240920);
}

uint64_t sub_249241374()
{
  return objectdestroy_151Tm(&qword_269683C30);
}

uint64_t sub_249241380(uint64_t a1)
{
  return sub_2492418B0(a1, &qword_269683C30, MEMORY[0x263F6A3C8], &qword_269683C38);
}

uint64_t sub_2492413AC(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923C278);
}

uint64_t sub_2492413C4()
{
  return objectdestroy_151Tm(&qword_26B152240);
}

uint64_t sub_2492413D0(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_26B152240);
}

uint64_t sub_2492413E0(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2491B314C);
}

uint64_t sub_2492413F8(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_249240568);
}

uint64_t sub_249241410()
{
  return objectdestroy_151Tm(&qword_26B152288);
}

uint64_t sub_24924141C(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_26B152288);
}

uint64_t sub_24924142C(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2492401B0);
}

uint64_t sub_249241444()
{
  return objectdestroy_151Tm(&qword_26B152268);
}

uint64_t sub_249241450(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_26B152268);
}

uint64_t sub_249241460(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923FDF8);
}

uint64_t sub_249241478()
{
  return objectdestroy_151Tm(&qword_26B152260);
}

uint64_t sub_249241484(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_26B152260);
}

uint64_t sub_249241494(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923FA40);
}

uint64_t sub_2492414AC()
{
  return objectdestroy_151Tm(&qword_269683C50);
}

uint64_t sub_2492414B8(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_269683C50);
}

uint64_t sub_2492414C8(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923F688);
}

uint64_t sub_2492414E0()
{
  return objectdestroy_151Tm(&qword_26B152278);
}

uint64_t sub_2492414EC(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_26B152278);
}

uint64_t sub_2492414FC(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923F2D0);
}

uint64_t sub_249241514()
{
  return objectdestroy_151Tm(&qword_269683C68);
}

uint64_t sub_249241520(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_269683C68);
}

uint64_t sub_249241530(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923EF18);
}

uint64_t sub_249241548()
{
  return objectdestroy_151Tm(&qword_26B152290);
}

uint64_t sub_249241554(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_26B152290);
}

uint64_t sub_249241564(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923EB60);
}

uint64_t sub_24924157C()
{
  return objectdestroy_151Tm(&qword_26B152298);
}

uint64_t sub_249241588(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_26B152298);
}

uint64_t sub_249241598(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923E7A8);
}

uint64_t sub_2492415B0()
{
  return objectdestroy_151Tm(&qword_269683C78);
}

uint64_t sub_2492415BC(uint64_t a1)
{
  return sub_2492418B0(a1, &qword_269683C78, MEMORY[0x263F6A0E0], &qword_269683C80);
}

uint64_t sub_2492415E8(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923E3F0);
}

uint64_t sub_249241600()
{
  return objectdestroy_151Tm(&qword_269683C90);
}

uint64_t sub_24924160C(uint64_t a1)
{
  return sub_2492418B0(a1, &qword_269683C90, MEMORY[0x263F6A910], &qword_269683C98);
}

uint64_t sub_249241638(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923E038);
}

uint64_t sub_249241650()
{
  return objectdestroy_151Tm(&qword_269683CA8);
}

uint64_t sub_24924165C(uint64_t a1)
{
  return sub_2492418B0(a1, &qword_269683CA8, MEMORY[0x263F69550], &qword_269683CB0);
}

uint64_t sub_249241688(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923DC80);
}

uint64_t sub_2492416A0()
{
  return objectdestroy_151Tm(&qword_269683CC0);
}

uint64_t sub_2492416AC(uint64_t a1)
{
  return sub_2492418B0(a1, &qword_269683CC0, MEMORY[0x263F6A5A0], &qword_269683CC8);
}

uint64_t sub_2492416D8(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923D510);
}

uint64_t sub_2492416F0()
{
  return objectdestroy_151Tm(&qword_269683CD8);
}

uint64_t sub_2492416FC(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_269683CD8);
}

uint64_t sub_24924170C(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923D8C8);
}

uint64_t sub_249241724()
{
  return objectdestroy_151Tm(&qword_269683CF0);
}

uint64_t sub_249241730(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_269683CF0);
}

uint64_t sub_249241740(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923D158);
}

uint64_t sub_249241758()
{
  return objectdestroy_151Tm(&qword_269683D00);
}

uint64_t sub_249241764(uint64_t a1)
{
  return sub_2492418B0(a1, &qword_269683D00, MEMORY[0x263F6AD30], &qword_269683D08);
}

uint64_t sub_249241790(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923CDA0);
}

uint64_t sub_2492417A8()
{
  return objectdestroy_151Tm(&qword_269683D20);
}

uint64_t sub_2492417B4(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_269683D20);
}

uint64_t sub_2492417C4(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923C9E8);
}

uint64_t sub_2492417DC()
{
  return objectdestroy_151Tm(&qword_269683D30);
}

uint64_t sub_2492417E8(uint64_t a1)
{
  return sub_2492418B0(a1, &qword_269683D30, MEMORY[0x263F6A3D8], &qword_269683D38);
}

uint64_t sub_249241814(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923C630);
}

uint64_t sub_24924182C()
{
  return objectdestroy_151Tm(&qword_269683D48);
}

uint64_t sub_249241838(uint64_t a1)
{
  return sub_2492418B0(a1, &qword_269683D48, MEMORY[0x263F6A4D0], &qword_269683D50);
}

uint64_t sub_249241864(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923BEC0);
}

uint64_t sub_24924187C()
{
  return objectdestroy_151Tm(&qword_269683D60);
}

uint64_t sub_249241888(uint64_t a1)
{
  return sub_2492418B0(a1, &qword_269683D60, MEMORY[0x263F6AFA8], &qword_269683D68);
}

uint64_t sub_2492418B0(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t *a4)
{
  uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  return sub_249240CF0(a1, *(void *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(unsigned __int8 *)(v4 + 40), *(void *)(v4 + 48), v4 + ((*(unsigned __int8 *)(v9 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a3, a4, a2);
}

uint64_t sub_249241954(uint64_t a1)
{
  return sub_24924196C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923BB08);
}

uint64_t sub_24924196C(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_249241984()
{
  return objectdestroy_151Tm(&qword_269683D80);
}

uint64_t sub_249241990(uint64_t a1)
{
  return sub_2492412CC(a1, &qword_269683D80);
}

uint64_t sub_2492419A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v70 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150D40);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  v69 = &v52[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v2);
  v68 = &v52[-v4];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150C40);
  MEMORY[0x270FA5388](v5 - 8);
  v67 = &v52[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696799C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = &v52[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26967BC80);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = &v52[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26967B5B0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = &v52[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v61 = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150C50);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = &v52[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v60 = v19;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = &v52[-v20];
  v62 = &v52[-v20];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269684008);
  MEMORY[0x270FA5388](v22 - 8);
  unint64_t v24 = &v52[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v63 = v24;
  uint64_t v25 = sub_249252360();
  uint64_t v65 = *(void *)(v25 - 8);
  uint64_t v66 = v25;
  MEMORY[0x270FA5388](v25);
  v64 = &v52[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_249252330();
  uint64_t v27 = sub_249252CE0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v24, 1, 1, v27);
  uint64_t v28 = sub_249251850();
  uint64_t v29 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56);
  v29(v21, 1, 1, v28);
  uint64_t v30 = sub_2492530B0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v15, 1, 1, v30);
  v29(v19, 1, 1, v28);
  uint64_t v31 = sub_249253B10();
  uint64_t v58 = v32;
  uint64_t v59 = v31;
  uint64_t v33 = sub_249251D90();
  int v34 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56);
  uint64_t v54 = v12;
  v34(v12, 1, 1, v33);
  uint64_t v35 = sub_249253B20();
  uint64_t v56 = v36;
  uint64_t v57 = v35;
  int v53 = v37 & 1;
  uint64_t v38 = sub_249254770();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v9, 1, 1, v38);
  uint64_t v39 = sub_2492516A0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v67, 1, 1, v39);
  uint64_t v40 = sub_2492524D0();
  uint64_t v41 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56);
  v41(v68, 1, 1, v40);
  v41(v69, 1, 1, v40);
  char v55 = v9;
  uint64_t v42 = v56;
  uint64_t v43 = v57;
  uint64_t v44 = (uint64_t)v60;
  uint64_t v45 = (uint64_t)v62;
  uint64_t v46 = (uint64_t)v63;
  uint64_t v47 = (uint64_t)v61;
  uint64_t v48 = v64;
  sub_249252320();
  sub_248BC9154(v43, v42, v53);
  swift_bridgeObjectRelease();
  sub_248B94494((uint64_t)v69, &qword_26B150D40);
  sub_248B94494((uint64_t)v68, &qword_26B150D40);
  sub_248B94494((uint64_t)v67, &qword_26B150C40);
  sub_248B94494((uint64_t)v55, &qword_2696799C0);
  sub_248B94494((uint64_t)v54, &qword_26967BC80);
  sub_248B94494(v44, &qword_26B150C50);
  sub_248B94494(v47, &qword_26967B5B0);
  sub_248B94494(v45, &qword_26B150C50);
  sub_248B94494(v46, &qword_269684008);
  uint64_t v50 = v65;
  uint64_t v49 = v66;
  (*(void (**)(unsigned char *, uint64_t))(v65 + 8))(v48, v66);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v70, 0, 1, v49);
}

uint64_t sub_2492420BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[3] = a2;
  v4[4] = a3;
  v4[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150C40);
  v4[5] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683FF8);
  v4[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683FD0);
  v4[7] = swift_task_alloc();
  uint64_t v5 = sub_249252610();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269684000);
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269684008);
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_2492534B0();
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2492422CC, v3, 0);
}

uint64_t sub_2492422CC()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[12];
  uint64_t v16 = v0[14];
  uint64_t v17 = v0[13];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[11];
  uint64_t v5 = v0[9];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[5];
  uint64_t v15 = v0[8];
  sub_249253490();
  uint64_t v9 = sub_249252CE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 1, 1, v9);
  sub_249252600();
  uint64_t v10 = sub_2492512D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26967B5A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  uint64_t v12 = sub_2492516A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  sub_2492525E0();
  sub_248B94494(v8, &qword_26B150C40);
  sub_248B94494(v6, &qword_269683FF8);
  sub_248B94494(v7, &qword_269683FD0);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v15);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v4, 0, 1, v15);
  sub_249253480();
  sub_248B94494(v4, &qword_269684000);
  sub_248B94494(v2, &qword_269684008);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v1, v17);
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

uint64_t sub_2492425E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[3] = a2;
  v4[4] = a3;
  v4[2] = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150C40);
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  v4[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26967B5A8);
  v4[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683FC0);
  v4[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683FC8);
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683FD0);
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_249252740();
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26967C018);
  v4[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696799C0);
  v4[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26967B5B0);
  v4[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150C50);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  uint64_t v7 = sub_249253600();
  v4[21] = v7;
  v4[22] = *(void *)(v7 - 8);
  v4[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249242900, v3, 0);
}

uint64_t sub_249242900()
{
  uint64_t v23 = v0[23];
  uint64_t v24 = v0[22];
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v21 = v2;
  uint64_t v4 = v0[17];
  uint64_t v19 = v0[16];
  uint64_t v20 = v0[14];
  uint64_t v22 = v0[13];
  uint64_t v25 = v0[21];
  uint64_t v26 = v0[11];
  uint64_t v27 = v0[10];
  uint64_t v28 = v0[9];
  uint64_t v29 = v0[8];
  uint64_t v5 = v0[6];
  uint64_t v30 = v0[7];
  uint64_t v31 = v0[12];
  uint64_t v17 = v0[5];
  uint64_t v18 = v0[15];
  sub_2492535E0();
  uint64_t v6 = sub_249251850();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  v7(v1, 1, 1, v6);
  uint64_t v8 = sub_2492530B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
  v7(v3, 1, 1, v6);
  uint64_t v9 = sub_249254770();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  sub_249252720();
  uint64_t v10 = sub_2492512D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v31, 1, 1, v10);
  uint64_t v11 = sub_249252900();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v26, 1, 1, v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v27, 1, 1, v17);
  uint64_t v12 = sub_249252570();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v28, 1, 1, v12);
  uint64_t v13 = sub_2492516A0();
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v29, 1, 1, v13);
  v14(v30, 1, 1, v13);
  sub_2492526E0();
  sub_248B94494(v30, &qword_26B150C40);
  sub_248B94494(v29, &qword_26B150C40);
  sub_248B94494(v28, &qword_26967B5A8);
  sub_248B94494(v27, &qword_269683FC0);
  sub_248B94494(v26, &qword_269683FC8);
  sub_248B94494(v31, &qword_269683FD0);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v22);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v20 + 56))(v19, 0, 1, v22);
  sub_2492535D0();
  sub_248B94494(v19, &qword_26967C018);
  sub_248B94494(v4, &qword_2696799C0);
  sub_248B94494(v3, &qword_26B150C50);
  sub_248B94494(v21, &qword_26967B5B0);
  sub_248B94494(v1, &qword_26B150C50);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
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
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_249242EB0(uint64_t a1)
{
  v2[2] = a1;
  uint64_t v3 = sub_249252740();
  v2[3] = v3;
  v2[4] = *(void *)(v3 - 8);
  v2[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249242F70, v1, 0);
}

uint64_t sub_249242F70()
{
  uint64_t v28 = v0;
  uint64_t v1 = v0[2];
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v4 = v0[4];
    uint64_t v26 = MEMORY[0x263F8EE78];
    sub_249246668(0, v2, 0);
    uint64_t v3 = v26;
    uint64_t result = sub_248C6D300(v1);
    uint64_t v6 = result;
    uint64_t v8 = v7;
    char v10 = v9 & 1;
    uint64_t v24 = v1;
    uint64_t v25 = v1 + 56;
    while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(v1 + 32))
    {
      if (((*(void *)(v25 + (((unint64_t)v6 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_15;
      }
      if (*(_DWORD *)(v1 + 36) != v8) {
        goto LABEL_16;
      }
      uint64_t v11 = v0[5];
      uint64_t v12 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
      uint64_t v14 = *v12;
      uint64_t v13 = v12[1];
      v27[0] = v14;
      v27[1] = v13;
      sub_249243180(v27, v11);
      unint64_t v16 = *(void *)(v26 + 16);
      unint64_t v15 = *(void *)(v26 + 24);
      if (v16 >= v15 >> 1) {
        sub_249246668(v15 > 1, v16 + 1, 1);
      }
      uint64_t v17 = v0[5];
      uint64_t v19 = v0[2];
      uint64_t v18 = v0[3];
      *(void *)(v26 + 16) = v16 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v26+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v16, v17, v18);
      uint64_t result = sub_248C8CC28(v6, v8, v10 & 1, v19);
      uint64_t v6 = result;
      uint64_t v8 = v20;
      char v10 = v21 & 1;
      --v2;
      uint64_t v1 = v24;
      if (!v2)
      {
        sub_248B83698(result, v20, v21 & 1);
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
  }
  else
  {
LABEL_11:
    uint64_t v22 = sub_249247894(v3);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(uint64_t))v0[1];
    return v23(v22);
  }
  return result;
}

uint64_t sub_249243180@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150C40);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v41 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v35 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26967B5A8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683FC0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683FC8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683FD0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_249252740();
  uint64_t v39 = *(void *)(v21 - 8);
  uint64_t v40 = v21;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v35 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *a1;
  uint64_t v37 = a1[1];
  uint64_t v38 = v24;
  sub_249252720();
  uint64_t v25 = sub_2492512D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v20, 1, 1, v25);
  uint64_t v26 = sub_249252900();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v17, 1, 1, v26);
  uint64_t v27 = v14;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v14, 1, 1, v3);
  uint64_t v28 = sub_249252570();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v11, 1, 1, v28);
  uint64_t v29 = sub_2492516A0();
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
  v30(v8, 1, 1, v29);
  uint64_t v31 = (uint64_t)v41;
  v30(v41, 1, 1, v29);
  uint64_t v32 = (uint64_t)v27;
  uint64_t v33 = (uint64_t)v36;
  sub_2492526E0();
  sub_248B94494(v31, &qword_26B150C40);
  sub_248B94494((uint64_t)v8, &qword_26B150C40);
  sub_248B94494((uint64_t)v11, &qword_26967B5A8);
  sub_248B94494(v32, &qword_269683FC0);
  sub_248B94494(v33, &qword_269683FC8);
  sub_248B94494((uint64_t)v20, &qword_269683FD0);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v23, v40);
}

uint64_t sub_249243690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[3] = a2;
  v4[4] = a3;
  v4[2] = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150C40);
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  v4[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26967B5A8);
  v4[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683FC0);
  v4[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683FC8);
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683FD0);
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_249252740();
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26967C018);
  v4[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696799C0);
  v4[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26967B5B0);
  v4[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150C50);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  uint64_t v7 = sub_249253600();
  v4[21] = v7;
  v4[22] = *(void *)(v7 - 8);
  v4[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249247DEC, v3, 0);
}

uint64_t sub_2492439B0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2492439D0, 0, 0);
}

uint64_t sub_2492439D0()
{
  **(void **)(v0 + 16) = MEMORY[0x263F8EE88];
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static CatalogService.simulator()@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for SimulatorCatalogService();
  unint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  swift_retain_n();
  v30.n128_u64[0] = (unint64_t)&unk_269683F88;
  v30.n128_u64[1] = v2;
  *(void *)&long long v29 = &unk_269683F78;
  *((void *)&v29 + 1) = v2;
  *(void *)&long long v28 = &unk_269683F68;
  *((void *)&v28 + 1) = v2;
  *(void *)&long long v27 = &unk_269683F58;
  *((void *)&v27 + 1) = v2;
  *(void *)&long long v26 = &unk_269683F48;
  *((void *)&v26 + 1) = v2;
  *(void *)&long long v25 = &unk_269683F38;
  *((void *)&v25 + 1) = v2;
  *(void *)&long long v24 = &unk_269683F28;
  *((void *)&v24 + 1) = v2;
  *(void *)&long long v23 = &unk_269683F18;
  *((void *)&v23 + 1) = v2;
  *(void *)&long long v22 = &unk_269683F08;
  *((void *)&v22 + 1) = v2;
  *(void *)&long long v21 = &unk_269683EF8;
  *((void *)&v21 + 1) = v2;
  *(void *)&long long v20 = &unk_269683EE8;
  *((void *)&v20 + 1) = v2;
  *(void *)&long long v19 = &unk_269683ED8;
  *((void *)&v19 + 1) = v2;
  *(void *)&long long v18 = &unk_269683EC8;
  *((void *)&v18 + 1) = v2;
  *(void *)&long long v17 = &unk_269683EB8;
  *((void *)&v17 + 1) = v2;
  *(void *)&long long v16 = &unk_269683EA8;
  *((void *)&v16 + 1) = v2;
  *(void *)&long long v15 = &unk_269683E98;
  *((void *)&v15 + 1) = v2;
  *(void *)&long long v14 = &unk_269683E88;
  *((void *)&v14 + 1) = v2;
  *(void *)&long long v13 = &unk_269683E78;
  *((void *)&v13 + 1) = v2;
  *(void *)&long long v12 = &unk_269683E68;
  *((void *)&v12 + 1) = v2;
  *(void *)&long long v11 = &unk_269683E58;
  *((void *)&v11 + 1) = v2;
  *(void *)&long long v10 = &unk_269683E48;
  *((void *)&v10 + 1) = v2;
  *(void *)&long long v9 = &unk_269683E38;
  *((void *)&v9 + 1) = v2;
  *(void *)&long long v8 = &unk_269683E28;
  *((void *)&v8 + 1) = v2;
  *(void *)&long long v7 = &unk_269683E18;
  *((void *)&v7 + 1) = v2;
  *(void *)&long long v6 = &unk_269683E08;
  *((void *)&v6 + 1) = v2;
  *(void *)&long long v5 = &unk_269683DF8;
  *((void *)&v5 + 1) = v2;
  *(void *)&long long v4 = &unk_269683DE8;
  *((void *)&v4 + 1) = v2;
  sub_2492334C4((uint64_t)&unk_269683DA8, v2, (uint64_t)&unk_269683DB8, v2, (uint64_t)&unk_269683DC8, v2, (uint64_t)&unk_269683DD8, v2, a1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    (uint64_t)&unk_269683F98,
    v2);
  return swift_retain_n();
}

uint64_t type metadata accessor for SimulatorCatalogService()
{
  return self;
}

uint64_t sub_249243D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_249243D30, a4, 0);
}

uint64_t sub_249243D30()
{
  sub_249254500();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249243D94(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_249243D30, v1, 0);
}

uint64_t sub_249243E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248CD0BFC;
  return sub_249247A78(a2);
}

uint64_t sub_249243ED4(uint64_t a1, uint64_t a2)
{
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *long long v5 = v2;
  v5[1] = sub_248C03C54;
  return sub_249243E3C(a1, a2);
}

uint64_t sub_249243F7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_249243F9C, a4, 0);
}

uint64_t sub_249243F9C()
{
  sub_2492536F0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249244000(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_249243F9C, v1, 0);
}

uint64_t sub_2492440A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B941DC;
  return sub_2492420BC(a1, a2, a3);
}

uint64_t sub_24924415C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_2492440A8(a1, a2, a3);
}

uint64_t sub_249244210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_2492425E0(a1, a2, a3);
}

uint64_t sub_2492442C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_249244210(a1, a2, a3);
}

uint64_t sub_249244378(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248CEE04C;
  return sub_249242EB0(a1);
}

uint64_t sub_249244410(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248C03C54;
  return sub_249244378(a1);
}

uint64_t sub_2492444A8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2492444C4, a2, 0);
}

uint64_t sub_2492444C4()
{
  sub_249253FF0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249244528(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_2492444C4, v1, 0);
}

uint64_t sub_2492445D0(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_2492445EC, a1, 0);
}

uint64_t sub_2492445EC()
{
  sub_2492537F0();
  uint64_t v1 = sub_24925DD10();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249244664()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_2492445EC, v0, 0);
}

uint64_t sub_249244708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA2498](sub_249244724, a4, 0);
}

uint64_t sub_249244724()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269684068);
  sub_249252A10();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_249261060;
  sub_249252330();
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249244834()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_249244724, v0, 0);
}

uint64_t sub_2492448D8(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_249247DF0, a1, 0);
}

uint64_t sub_2492448F4()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_249247DF0, v0, 0);
}

uint64_t sub_249244998(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2492449B4, a2, 0);
}

uint64_t sub_2492449B4()
{
  sub_2492537D0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249244A18(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_2492449B4, v1, 0);
}

uint64_t sub_249244AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_249244AE0, a4, 0);
}

uint64_t sub_249244AE0()
{
  sub_249252500();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249244B44(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_249244AE0, v1, 0);
}

uint64_t sub_249244BEC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_249244C08, a2, 0);
}

uint64_t sub_249244C08()
{
  sub_249253AD0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249244C6C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_249244C08, v1, 0);
}

uint64_t sub_249244D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  return MEMORY[0x270FA2498](sub_249244D34, a3, 0);
}

uint64_t sub_249244D34()
{
  sub_249253160();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249244D98(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B941DC;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_249244D34, v1, 0);
}

uint64_t sub_249244E40(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_249244E5C, a1, 0);
}

uint64_t sub_249244E5C()
{
  sub_2492549C0();
  sub_249247A30(&qword_269684060, MEMORY[0x263F6B2F0]);
  uint64_t v1 = sub_24925DFD0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249244F10()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_249244E5C, v0, 0);
}

uint64_t sub_249244FB4(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_249244FD0, a1, 0);
}

uint64_t sub_249244FD0()
{
  sub_249253B90();
  sub_249247A30(&qword_26967A3D8, MEMORY[0x263F6AA18]);
  uint64_t v1 = sub_24925DFD0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249245084()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_249244FD0, v0, 0);
}

uint64_t sub_249245128(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_249245144, a1, 0);
}

uint64_t sub_249245144()
{
  sub_249253510();
  sub_249247A30(&qword_269684058, MEMORY[0x263F6A438]);
  uint64_t v1 = sub_24925DFD0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2492451F8()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_249245144, v0, 0);
}

uint64_t sub_24924529C(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_2492452B8, a1, 0);
}

uint64_t sub_2492452B8()
{
  sub_249252060();
  sub_249247A30(&qword_269684050, MEMORY[0x263F69250]);
  uint64_t v1 = sub_24925DFD0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24924536C()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_2492452B8, v0, 0);
}

uint64_t sub_249245410(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_24924542C, a1, 0);
}

uint64_t sub_24924542C()
{
  sub_2492549F0();
  sub_249247A30(&qword_269684048, MEMORY[0x263F6B338]);
  uint64_t v1 = sub_24925DFD0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2492454E0()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_24924542C, v0, 0);
}

uint64_t sub_249245584(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_2492455A0, a1, 0);
}

uint64_t sub_2492455A0()
{
  sub_249251C50();
  sub_249247A30(&qword_269684040, MEMORY[0x263F68FD8]);
  uint64_t v1 = sub_24925DFD0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249245654()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_2492455A0, v0, 0);
}

uint64_t sub_2492456F8(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_249245714, a1, 0);
}

uint64_t sub_249245714()
{
  sub_249251D00();
  sub_249247A30(&qword_269684038, MEMORY[0x263F69060]);
  uint64_t v1 = sub_24925DFD0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2492457C8()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_249245714, v0, 0);
}

uint64_t sub_24924586C(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_249245888, a1, 0);
}

uint64_t sub_249245888()
{
  sub_249252CB0();
  sub_249247A30(&qword_269684030, MEMORY[0x263F69A68]);
  uint64_t v1 = sub_24925DFD0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24924593C()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_249245888, v0, 0);
}

uint64_t sub_2492459E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_249243690(a1, a2, a3);
}

uint64_t sub_249245A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_248B97464;
  return sub_2492459E0(a1, a2, a3);
}

uint64_t sub_249245B48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA2498](sub_249245B64, a4, 0);
}

uint64_t sub_249245B64()
{
  sub_249252360();
  uint64_t v1 = sub_24925DD10();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249245BDC()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_249245B64, v0, 0);
}

uint64_t sub_249245C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  return MEMORY[0x270FA2498](sub_249245CA0, a3, 0);
}

uint64_t sub_249245CA0()
{
  sub_249253400();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249245D04(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_249245CA0, v1, 0);
}

uint64_t sub_249245DAC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_249245DC8, a2, 0);
}

uint64_t sub_249245DC8()
{
  sub_2492539F0();
  sub_249247A30(&qword_26967A328, MEMORY[0x263F6A868]);
  uint64_t v1 = sub_24925DFD0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249245E84(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248C03C54;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_249245DC8, v1, 0);
}

uint64_t sub_249245F2C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_249245F48, a2, 0);
}

uint64_t sub_249245F48()
{
  sub_24925DEF0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249245FD8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_249245F48, v1, 0);
}

uint64_t sub_249246080(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24924609C, a2, 0);
}

uint64_t sub_24924609C()
{
  sub_24925DEF0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24924612C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_24924609C, v1, 0);
}

uint64_t sub_2492461D4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2492461F0, a2, 0);
}

uint64_t sub_2492461F0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269681818);
  sub_24925DEF0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249246288(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_2492461F0, v1, 0);
}

uint64_t sub_249246330()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248B97464;
  return sub_248B941DC();
}

uint64_t sub_2492463C0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA2498](sub_2492463D8, a2, 0);
}

uint64_t sub_2492463D8()
{
  sub_249253B40();
  uint64_t v1 = sub_24925DD10();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249246450()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_2492463D8, v0, 0);
}

uint64_t sub_2492464F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA2498](sub_249246510, a3, 0);
}

uint64_t sub_249246510()
{
  sub_2492539F0();
  uint64_t v1 = sub_24925DD10();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249246588()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248BF9EC4;
  return MEMORY[0x270FA2498](sub_249246510, v0, 0);
}

size_t sub_24924662C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_2492466A4(a1, a2, a3, (void *)*v3, &qword_269684010, MEMORY[0x263F6A868]);
  *uint64_t v3 = result;
  return result;
}

size_t sub_249246668(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_2492466A4(a1, a2, a3, (void *)*v3, &qword_269683FF0, MEMORY[0x263F695E0]);
  *uint64_t v3 = result;
  return result;
}

size_t sub_2492466A4(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
    long long v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  long long v16 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(a6(0) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v16;
}

uint64_t sub_249246880(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_249252740();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_249247A30(&qword_269683FD8, MEMORY[0x263F695E0]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_24925D920();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    long long v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    long long v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    long long v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      long long v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_249247A30(&qword_269683FE0, MEMORY[0x263F695E0]);
      char v21 = sub_24925D990();
      long long v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    long long v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_249246FA0((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_249246BA4()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_249252740();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683FE8);
  uint64_t v5 = sub_24925E560();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      long long v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_249247A30(&qword_269683FD8, MEMORY[0x263F695E0]);
      uint64_t result = sub_24925D920();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_249246FA0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_249252740();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_249246BA4();
  }
  else
  {
    if (v11 > v10)
    {
      sub_249247240();
      goto LABEL_12;
    }
    sub_2492474E4();
  }
  uint64_t v12 = *v3;
  sub_249247A30(&qword_269683FD8, MEMORY[0x263F695E0]);
  uint64_t v13 = sub_24925D920();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_249247A30(&qword_269683FE0, MEMORY[0x263F695E0]);
      char v21 = sub_24925D990();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_24925E970();
  __break(1u);
  return result;
}

void *sub_249247240()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_249252740();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683FE8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24925E550();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_2492474E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_249252740();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269683FE8);
  uint64_t v7 = sub_24925E560();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
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
    sub_249247A30(&qword_269683FD8, MEMORY[0x263F695E0]);
    uint64_t result = sub_24925D920();
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

uint64_t sub_249247894(uint64_t a1)
{
  uint64_t v2 = sub_249252740();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_249247A30(&qword_269683FD8, MEMORY[0x263F695E0]);
  uint64_t result = sub_24925E000();
  uint64_t v17 = result;
  if (v9)
  {
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    unint64_t v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v14, v2);
      sub_249246880((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

uint64_t sub_249247A30(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_249247A78(uint64_t a1)
{
  v2[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150D38);
  v2[3] = swift_task_alloc();
  uint64_t v3 = sub_249252360();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249247B78, v1, 0);
}

uint64_t sub_249247B78()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = v0[5];
    uint64_t v4 = *(void *)(sub_249253B40() - 8);
    uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
    uint64_t v24 = v3;
    uint64_t v26 = (void (**)(unint64_t, unint64_t, uint64_t))(v3 + 32);
    uint64_t v7 = *(void *)(v4 + 72);
    swift_bridgeObjectRetain();
    uint64_t v8 = 0;
    unint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t v23 = v6;
    do
    {
      uint64_t v11 = v0[3];
      uint64_t v10 = v0[4];
      sub_2492419A4(v11);
      if ((*v6)(v11, 1, v10) == 1)
      {
        sub_248B94494(v0[3], &qword_26B150D38);
      }
      else
      {
        uint64_t v25 = v8;
        uint64_t v12 = v7;
        unint64_t v14 = v0[6];
        unint64_t v13 = v0[7];
        uint64_t v15 = v0[4];
        uint64_t v16 = *v26;
        (*v26)(v13, v0[3], v15);
        v16(v14, v13, v15);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v9 = sub_248D33738(0, *(void *)(v9 + 16) + 1, 1, v9);
        }
        unint64_t v18 = *(void *)(v9 + 16);
        unint64_t v17 = *(void *)(v9 + 24);
        uint64_t v7 = v12;
        if (v18 >= v17 >> 1) {
          unint64_t v9 = sub_248D33738(v17 > 1, v18 + 1, 1, v9);
        }
        uint64_t v8 = v25;
        unint64_t v19 = v0[6];
        uint64_t v20 = v0[4];
        *(void *)(v9 + 16) = v18 + 1;
        v16(v9+ ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))+ *(void *)(v24 + 72) * v18, v19, v20);
        uint64_t v6 = v23;
      }
      v5 += v7;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v9 = MEMORY[0x263F8EE78];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v21 = (uint64_t (*)(unint64_t))v0[1];
  return v21(v9);
}

uint64_t sub_249247DF8()
{
  v1[4] = v0;
  uint64_t v2 = sub_249253020();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150E80);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_249253DC0();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249247F44, 0, 0);
}

uint64_t sub_249247F44()
{
  uint64_t v1 = v0[4];
  if (*(unsigned __int8 *)(v1 + 144) <= 2u)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v1 + 48), *(void *)(v1 + 72));
    uint64_t v2 = sub_2492575B0();
    if (!v3)
    {
LABEL_5:
      uint64_t v6 = (void *)v0[4];
      uint64_t v7 = v6[3];
      uint64_t v8 = v6[4];
      __swift_project_boxed_opaque_existential_1(v6, v7);
      unint64_t v9 = (void *)swift_task_alloc();
      v0[12] = v9;
      *unint64_t v9 = v0;
      uint64_t v10 = sub_24924830C;
LABEL_8:
      v9[1] = v10;
      return MEMORY[0x270F5EB08](v7, v8);
    }
    uint64_t v4 = v2;
    uint64_t v5 = v3;
    v0[2] = v2;
    v0[3] = v3;
    sub_248C170A0();
    if (sub_24925E420())
    {
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  uint64_t v11 = v0[9];
  uint64_t v12 = v0[10];
  uint64_t v13 = v0[8];
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 104), *(void *)(v1 + 128));
  sub_2492576F0();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v13, 1, v11) == 1)
  {
    unint64_t v14 = (void *)v0[4];
    sub_249249D14(v0[8]);
    uint64_t v7 = v14[3];
    uint64_t v8 = v14[4];
    __swift_project_boxed_opaque_existential_1(v14, v7);
    unint64_t v9 = (void *)swift_task_alloc();
    v0[13] = v9;
    *unint64_t v9 = v0;
    uint64_t v10 = sub_249248480;
    goto LABEL_8;
  }
  uint64_t v16 = v0[6];
  uint64_t v15 = v0[7];
  uint64_t v17 = v0[5];
  (*(void (**)(void, void, void))(v0[10] + 32))(v0[11], v0[8], v0[9]);
  sub_249253DA0();
  uint64_t v4 = sub_249253010();
  uint64_t v5 = v18;
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  uint64_t v20 = v0[10];
  uint64_t v19 = v0[11];
  uint64_t v21 = v0[9];
  if (v5)
  {
    (*(void (**)(void, void))(v20 + 8))(v0[11], v0[9]);
LABEL_13:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int64_t v22 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v22(v4, v5);
  }
  uint64_t v23 = sub_24925BAB0();
  sub_249249CCC(&qword_2696840F0, MEMORY[0x263F68E50]);
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v24, *MEMORY[0x263F68E40], v23);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void))v0[1];
  return v25();
}

uint64_t sub_24924830C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = swift_task_dealloc();
  unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v2)
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2;
  }
  return v9(v7, v8);
}

uint64_t sub_249248480(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = swift_task_dealloc();
  unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v2)
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2;
  }
  return v9(v7, v8);
}

uint64_t sub_2492485F4()
{
  v1[2] = v0;
  uint64_t v2 = sub_24925BAA0();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2492486B4, 0, 0);
}

uint64_t sub_2492486B4()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = (void *)v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v3[3];
  uint64_t v6 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v5);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F68E10], v4);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[6] = v7;
  void *v7 = v0;
  v7[1] = sub_2492487A4;
  uint64_t v8 = v0[5];
  return MEMORY[0x270F5EB00](v8, v5, v6);
}

uint64_t sub_2492487A4(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 40);
  uint64_t v5 = *(void *)(*v2 + 32);
  uint64_t v6 = *(void *)(*v2 + 24);
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v1) {
    uint64_t v7 = sub_2491C0F04;
  }
  else {
    uint64_t v7 = sub_249248918;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_249248918()
{
  id v1 = objc_msgSend(*(id *)(v0 + 56), sel_identifier);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_24925DA60();
  }
  uint64_t v3 = *(void **)(v0 + 56);
  uint64_t v4 = sub_24925BAB0();
  sub_249249CCC(&qword_2696840F0, MEMORY[0x263F68E50]);
  swift_allocError();
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v4 - 8) + 104))(v5, *MEMORY[0x263F68E28], v4);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_249248AFC()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = (void *)v0[7];
  swift_release();
  v0[11] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F28028]), sel_initWithAccount_bag_, v2, v1);
  swift_unknownObjectRelease();

  return MEMORY[0x270FA2498](sub_249248B98, 0, 0);
}

uint64_t sub_249248B98()
{
  uint64_t v1 = (void *)v0[11];
  uint64_t v2 = (void *)v0[7];
  sub_24925D350();
  uint64_t v3 = (void *)sub_24925DA40();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setSubscriptionType_, v3);

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v5 = v0[11];
  return v4(v5);
}

uint64_t static AccountService.live(with:)@<X0>(void *a1@<X8>)
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151840);
  sub_249252070();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B152520);
  sub_249252070();
  uint64_t v44 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B14A8B0);
  sub_249252070();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151290);
  sub_249252070();
  long long v45 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1512A0);
  sub_249252070();
  sub_249252070();
  swift_release();
  char v46 = v33;
  sub_2492490CC((uint64_t)v43, (uint64_t)&v33);
  uint64_t v2 = swift_allocObject();
  long long v3 = v40;
  *(_OWORD *)(v2 + 112) = v39;
  *(_OWORD *)(v2 + 128) = v3;
  *(_OWORD *)(v2 + 144) = v41;
  *(unsigned char *)(v2 + 160) = v42;
  long long v4 = v36;
  *(_OWORD *)(v2 + 48) = v35;
  *(_OWORD *)(v2 + 64) = v4;
  long long v5 = v38;
  *(_OWORD *)(v2 + 80) = v37;
  *(_OWORD *)(v2 + 96) = v5;
  long long v6 = v34;
  *(_OWORD *)(v2 + 16) = v33;
  *(_OWORD *)(v2 + 32) = v6;
  sub_2492490CC((uint64_t)v43, (uint64_t)&v33);
  uint64_t v7 = swift_allocObject();
  long long v8 = v40;
  *(_OWORD *)(v7 + 112) = v39;
  *(_OWORD *)(v7 + 128) = v8;
  *(_OWORD *)(v7 + 144) = v41;
  *(unsigned char *)(v7 + 160) = v42;
  long long v9 = v36;
  *(_OWORD *)(v7 + 48) = v35;
  *(_OWORD *)(v7 + 64) = v9;
  long long v10 = v38;
  *(_OWORD *)(v7 + 80) = v37;
  *(_OWORD *)(v7 + 96) = v10;
  long long v11 = v34;
  *(_OWORD *)(v7 + 16) = v33;
  *(_OWORD *)(v7 + 32) = v11;
  sub_2492490CC((uint64_t)v43, (uint64_t)&v33);
  uint64_t v12 = swift_allocObject();
  long long v13 = v40;
  *(_OWORD *)(v12 + 112) = v39;
  *(_OWORD *)(v12 + 128) = v13;
  *(_OWORD *)(v12 + 144) = v41;
  *(unsigned char *)(v12 + 160) = v42;
  long long v14 = v36;
  *(_OWORD *)(v12 + 48) = v35;
  *(_OWORD *)(v12 + 64) = v14;
  long long v15 = v38;
  *(_OWORD *)(v12 + 80) = v37;
  *(_OWORD *)(v12 + 96) = v15;
  long long v16 = v34;
  *(_OWORD *)(v12 + 16) = v33;
  *(_OWORD *)(v12 + 32) = v16;
  sub_2492490CC((uint64_t)v43, (uint64_t)&v33);
  uint64_t v17 = swift_allocObject();
  long long v18 = v40;
  *(_OWORD *)(v17 + 112) = v39;
  *(_OWORD *)(v17 + 128) = v18;
  *(_OWORD *)(v17 + 144) = v41;
  *(unsigned char *)(v17 + 160) = v42;
  long long v19 = v36;
  *(_OWORD *)(v17 + 48) = v35;
  *(_OWORD *)(v17 + 64) = v19;
  long long v20 = v38;
  *(_OWORD *)(v17 + 80) = v37;
  *(_OWORD *)(v17 + 96) = v20;
  long long v21 = v34;
  *(_OWORD *)(v17 + 16) = v33;
  *(_OWORD *)(v17 + 32) = v21;
  sub_2492490CC((uint64_t)v43, (uint64_t)&v33);
  uint64_t v22 = swift_allocObject();
  long long v23 = v40;
  *(_OWORD *)(v22 + 112) = v39;
  *(_OWORD *)(v22 + 128) = v23;
  *(_OWORD *)(v22 + 144) = v41;
  *(unsigned char *)(v22 + 160) = v42;
  long long v24 = v36;
  *(_OWORD *)(v22 + 48) = v35;
  *(_OWORD *)(v22 + 64) = v24;
  long long v25 = v38;
  *(_OWORD *)(v22 + 80) = v37;
  *(_OWORD *)(v22 + 96) = v25;
  long long v26 = v34;
  *(_OWORD *)(v22 + 16) = v33;
  *(_OWORD *)(v22 + 32) = v26;
  sub_2492490CC((uint64_t)v43, (uint64_t)&v33);
  uint64_t v27 = swift_allocObject();
  long long v28 = v40;
  *(_OWORD *)(v27 + 112) = v39;
  *(_OWORD *)(v27 + 128) = v28;
  *(_OWORD *)(v27 + 144) = v41;
  *(unsigned char *)(v27 + 160) = v42;
  long long v29 = v36;
  *(_OWORD *)(v27 + 48) = v35;
  *(_OWORD *)(v27 + 64) = v29;
  long long v30 = v38;
  *(_OWORD *)(v27 + 80) = v37;
  *(_OWORD *)(v27 + 96) = v30;
  long long v31 = v34;
  *(_OWORD *)(v27 + 16) = v33;
  *(_OWORD *)(v27 + 32) = v31;
  uint64_t result = sub_2492498E4((uint64_t)v43);
  *a1 = &unk_269684080;
  a1[1] = v2;
  a1[2] = &unk_269684090;
  a1[3] = v7;
  a1[4] = &unk_2696840A0;
  a1[5] = v12;
  a1[6] = &unk_2696840B0;
  a1[7] = v17;
  a1[8] = &unk_2696840C0;
  a1[9] = v22;
  a1[10] = &unk_2696840D0;
  a1[11] = v27;
  return result;
}

uint64_t sub_249248FF4(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_249249014, 0, 0);
}

uint64_t sub_249249014()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v3 = v1[3];
  uint64_t v2 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v3);
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v4;
  *long long v4 = v0;
  v4[1] = sub_2491B5820;
  return MEMORY[0x270F5EB40](v3, v2);
}

uint64_t sub_2492490CC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_249249108()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  v2[2] = v0 + 16;
  return MEMORY[0x270FA2498](sub_249249014, 0, 0);
}

uint64_t sub_2492491B0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2492491D0, 0, 0);
}

uint64_t sub_2492491D0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2491A5ED8;
  return MEMORY[0x270F5EB18](v2, v3);
}

uint64_t sub_249249288()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  v2[2] = v0 + 16;
  return MEMORY[0x270FA2498](sub_2492491D0, 0, 0);
}

uint64_t sub_249249330(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_249249350, 0, 0);
}

uint64_t sub_249249350()
{
  uint64_t v1 = (void *)v0[3];
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[4] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_248DEC530;
  uint64_t v5 = v0[2];
  return MEMORY[0x270F5EB28](v5, v2, v3);
}

uint64_t sub_249249410(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1 + 16;
  v4[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_249249350, 0, 0);
}

uint64_t sub_2492494C0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2491C5EE4;
  return sub_249247DF8();
}

uint64_t sub_249249554()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248DD0484;
  return sub_2492494C0();
}

uint64_t sub_2492495E8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CD0BFC;
  return sub_2492485F4();
}

uint64_t sub_24924967C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248BF9EC4;
  return sub_2492495E8();
}

uint64_t sub_249249710(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_249249730, 0, 0);
}

uint64_t sub_249249730()
{
  swift_getObjectType();
  sub_24925BAC0();
  sub_249249CCC((unint64_t *)&unk_26B151830, MEMORY[0x263F68E68]);
  sub_249257480();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249249834(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1 + 16;
  v4[1] = sub_248B941DC;
  return MEMORY[0x270FA2498](sub_249249730, 0, 0);
}

uint64_t sub_2492498E4(uint64_t a1)
{
  return a1;
}

uint64_t destroy for LiveAccountService(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1(a1 + 104);
}

uint64_t initializeWithCopy for LiveAccountService(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_unknownObjectRetain();
  v7(a1 + 48, a2 + 48, v6);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 128) = v8;
  uint64_t v9 = v8;
  long long v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_unknownObjectRetain();
  v10(a1 + 104, a2 + 104, v9);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  return a1;
}

uint64_t assignWithCopy for LiveAccountService(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 48), (uint64_t *)(a2 + 48));
  uint64_t v4 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 96) = v4;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 104), (uint64_t *)(a2 + 104));
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  return a1;
}

__n128 __swift_memcpy145_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for LiveAccountService(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  long long v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  swift_unknownObjectRelease();
  *(void *)(a1 + 96) = v8;
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveAccountService(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 145)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveAccountService(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 144) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 145) = 1;
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
    *(unsigned char *)(result + 145) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveAccountService()
{
  return &type metadata for LiveAccountService;
}

uint64_t sub_249249CCC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_249249D14(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150E80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

__n128 AccountService.init(fetchCurrentAccount:fetchPrimaryAccount:fetchMatchingAccount:fetchUserFirstName:makeSubscriptionManagementViewController:makeAccountChangedStream:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>, __n128 a10, unint64_t a11, unint64_t a12)
{
  __n128 result = a10;
  a9->n128_u64[0] = a1;
  a9->n128_u64[1] = a2;
  a9[1].n128_u64[0] = a3;
  a9[1].n128_u64[1] = a4;
  a9[2].n128_u64[0] = a5;
  a9[2].n128_u64[1] = a6;
  a9[3].n128_u64[0] = a7;
  a9[3].n128_u64[1] = a8;
  a9[4] = a10;
  a9[5].n128_u64[0] = a11;
  a9[5].n128_u64[1] = a12;
  return result;
}

uint64_t AccountService.fetchCurrentAccount.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t AccountService.fetchPrimaryAccount.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t AccountService.fetchMatchingAccount.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t AccountService.fetchUserFirstName.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t AccountService.makeSubscriptionManagementViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_retain();
  return v1;
}

uint64_t AccountService.makeAccountChangedStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_retain();
  return v1;
}

ValueMetadata *type metadata accessor for AccountService()
{
  return &type metadata for AccountService;
}

void static AccountService.simulator()(void *a1@<X8>)
{
  *a1 = &unk_269684100;
  a1[1] = 0;
  a1[2] = &unk_269684108;
  a1[3] = 0;
  a1[4] = &unk_269684110;
  a1[5] = 0;
  a1[6] = &unk_269684118;
  a1[7] = 0;
  a1[8] = &unk_269684120;
  a1[9] = 0;
  a1[10] = &unk_269684128;
  a1[11] = 0;
}

uint64_t sub_249249F44()
{
  return MEMORY[0x270FA2498](sub_24924A16C, 0, 0);
}

uint64_t sub_249249F60()
{
  return MEMORY[0x270FA2498](sub_249249F7C, 0, 0);
}

uint64_t sub_249249F7C()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFB1F8]), sel_init);
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v1);
}

uint64_t sub_249249FF0()
{
  return sub_2491CBCE8(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8), v0, 0x6165626B63616C42, 0xEA00000000006472);
}

uint64_t sub_24924A040()
{
  return MEMORY[0x270FA2498](sub_24924A05C, 0, 0);
}

uint64_t sub_24924A05C()
{
  sub_24925DE30();
  *(void *)(v0 + 16) = sub_24925DE20();
  uint64_t v2 = sub_24925DDB0();
  return MEMORY[0x270FA2498](sub_24924A0F0, v2, v1);
}

uint64_t sub_24924A0F0()
{
  swift_release();
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v1);
}

uint64_t RecommendationService.fetchOnboardingDetail.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t RecommendationService.makeOnboardingSurveyResultsUpdatedStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t RecommendationService.queryRelatedCatalogWorkoutPlaceholders.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t RecommendationService.queryRecommendations.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t RecommendationService.queryAllRecommendations.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_retain();
  return v1;
}

uint64_t RecommendationService.queryOnboardingSurveyResult.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_retain();
  return v1;
}

uint64_t RecommendationService.updateOnboardingSurveyResult.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_retain();
  return v1;
}

ValueMetadata *type metadata accessor for RecommendationService()
{
  return &type metadata for RecommendationService;
}

uint64_t static RecommendationService.simulator()@<X0>(void *a1@<X8>)
{
  type metadata accessor for SimulatorRecommendationService();
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *a1 = &unk_269684138;
  a1[1] = v2;
  a1[2] = &unk_269684148;
  a1[3] = v2;
  a1[4] = &unk_269684158;
  a1[5] = v2;
  a1[6] = &unk_269684168;
  a1[7] = v2;
  a1[8] = &unk_269684178;
  a1[9] = v2;
  a1[10] = &unk_269684188;
  a1[11] = v2;
  a1[12] = &unk_269684198;
  a1[13] = v2;
  return swift_retain_n();
}

uint64_t type metadata accessor for SimulatorRecommendationService()
{
  return self;
}

uint64_t sub_24924A3C4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24924A3E0, a2, 0);
}

uint64_t sub_24924A3E0()
{
  sub_249252BB0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24924A444(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B941DC;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_24924A3E0, v1, 0);
}

uint64_t sub_24924A4EC(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696841A0);
  v2[3] = v4;
  v2[4] = *(void *)(v4 - 8);
  v2[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24924A5B4, a2, 0);
}

uint64_t sub_24924A5B4()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  sub_2492577B0();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F8F580], v3);
  sub_24925DF00();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24924A688(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B941DC;
  return sub_24924A4EC(a1, v1);
}

uint64_t sub_24924A724(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA2498](sub_24924A740, a3, 0);
}

uint64_t sub_24924A740()
{
  sub_249253B40();
  uint64_t v1 = sub_24925DD10();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24924A7B8()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248BF9EC4;
  return MEMORY[0x270FA2498](sub_24924A740, v0, 0);
}

uint64_t sub_24924A85C(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA2498](sub_24924A874, a2, 0);
}

uint64_t sub_24924A874()
{
  sub_2492527B0();
  sub_249227FFC();
  uint64_t v1 = sub_24925DFD0();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24924A8F8()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_24924A874, v0, 0);
}

uint64_t sub_24924A99C(uint64_t a1)
{
  return MEMORY[0x270FA2498](sub_24924AC14, a1, 0);
}

uint64_t sub_24924A9B8()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_248C03C54;
  return MEMORY[0x270FA2498](sub_24924AC14, v0, 0);
}

uint64_t sub_24924AA5C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24924AA78, a2, 0);
}

uint64_t sub_24924AA78()
{
  sub_249253880();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24924AADC(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B97464;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_24924AA78, v1, 0);
}

uint64_t sub_24924AB84()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248B97464;
  return sub_248B941DC();
}

uint64_t sub_24924AC18(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269684248);
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24924ACDC, v1, 0);
}

uint64_t sub_24924ACDC()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 128), *(void *)(*(void *)(v0 + 24) + 152));
  sub_249256C60();
  return MEMORY[0x270FA2498](sub_24924AD70, 0, 0);
}

uint64_t sub_24924AD70()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/RecommendationService/LiveRec"
                         "ommendationService.swift";
  *(void *)(v2 + 24) = 119;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 26;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = sub_249252BC0();
  *uint64_t v3 = v0;
  v3[1] = sub_2491CE6D4;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_24924D058, v2, v4);
}

uint64_t sub_24924AE80(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D70);
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24924AF48, v2, 0);
}

uint64_t sub_24924AF48()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 40) + 128), *(void *)(*(void *)(v0 + 40) + 152));
  sub_249256C50();
  return MEMORY[0x270FA2498](sub_24924AFF4, 0, 0);
}

uint64_t sub_24924AFF4()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = swift_task_alloc();
  v0[9] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/RecommendationService/LiveRec"
                         "ommendationService.swift";
  *(void *)(v2 + 24) = 119;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 34;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[10] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683D78);
  *uint64_t v3 = v0;
  v3[1] = sub_249235E58;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_24924D040, v2, v4);
}

uint64_t sub_24924B114(char a1)
{
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 80) = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683650);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = *(void *)(v3 - 8);
  *(void *)(v2 + 48) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24924B1DC, v1, 0);
}

uint64_t sub_24924B1DC()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 128), *(void *)(*(void *)(v0 + 24) + 152));
  sub_249256C40();
  return MEMORY[0x270FA2498](sub_24924B27C, 0, 0);
}

uint64_t sub_24924B27C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/RecommendationService/LiveRec"
                         "ommendationService.swift";
  *(void *)(v2 + 24) = 119;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 38;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683658);
  *uint64_t v3 = v0;
  v3[1] = sub_2491A9DE4;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_24924D028, v2, v4);
}

uint64_t sub_24924B39C()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683650);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24924B460, v0, 0);
}

uint64_t sub_24924B460()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 128), *(void *)(*(void *)(v0 + 24) + 152));
  sub_249256C70();
  return MEMORY[0x270FA2498](sub_24924B4F4, 0, 0);
}

uint64_t sub_24924B4F4()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/RecommendationService/LiveRec"
                         "ommendationService.swift";
  *(void *)(v2 + 24) = 119;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 42;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269683658);
  *uint64_t v3 = v0;
  v3[1] = sub_2491A9DE4;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_24924D028, v2, v4);
}

uint64_t sub_24924B614(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150ED0);
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24924B6D8, v1, 0);
}

uint64_t sub_24924B6D8()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 128), *(void *)(*(void *)(v0 + 24) + 152));
  sub_249256C80();
  return MEMORY[0x270FA2498](sub_24924B76C, 0, 0);
}

uint64_t sub_24924B76C()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/RecommendationService/LiveRec"
                         "ommendationService.swift";
  *(void *)(v2 + 24) = 119;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 46;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = sub_249253890();
  *uint64_t v3 = v0;
  v3[1] = sub_2491EE880;
  uint64_t v5 = v0[2];
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_24924CFD8, v2, v4);
}

uint64_t sub_24924B87C(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F60);
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24924B940, v1, 0);
}

uint64_t sub_24924B940()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 128), *(void *)(*(void *)(v0 + 24) + 152));
  sub_249256C90();
  return MEMORY[0x270FA2498](sub_24924B9DC, 0, 0);
}

uint64_t sub_24924B9DC()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/RecommendationService/LiveRec"
                         "ommendationService.swift";
  *(void *)(v2 + 24) = 119;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 50;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  *uint64_t v3 = v0;
  uint64_t v4 = MEMORY[0x263F8EE60];
  v3[1] = sub_2491C40B4;
  return MEMORY[0x270FA2360](v3, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_24924CC54, v2, v4 + 8);
}

uint64_t static RecommendationService.live(with:)@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151290);
  sub_249252070();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151200);
  sub_249252070();
  type metadata accessor for LiveRecommendationService();
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_OWORD *)(v2 + 112) = *(_OWORD *)&v4[5];
  sub_248B9CDEC((long long *)v4, v2 + 128);
  *a1 = &unk_2696841B0;
  a1[1] = v2;
  a1[2] = &unk_2696841C0;
  a1[3] = v2;
  a1[4] = &unk_2696841D0;
  a1[5] = v2;
  a1[6] = &unk_2696841E0;
  a1[7] = v2;
  a1[8] = &unk_2696841F0;
  a1[9] = v2;
  a1[10] = &unk_269684200;
  a1[11] = v2;
  a1[12] = &unk_269684210;
  a1[13] = v2;
  return swift_retain_n();
}

uint64_t type metadata accessor for LiveRecommendationService()
{
  return self;
}

uint64_t sub_24924BC40(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B941DC;
  return sub_24924AC18(a1);
}

uint64_t sub_24924BCDC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B941DC;
  return sub_24924BC40(a1);
}

uint64_t sub_24924BD78(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24924BD94, a2, 0);
}

uint64_t sub_24924BD94()
{
  swift_getObjectType();
  sub_2492577B0();
  sub_249257490();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24924BE30(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_248B941DC;
  return MEMORY[0x270FA2498](sub_24924BD94, v1, 0);
}

uint64_t sub_24924BEDC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_248CD0BFC;
  return sub_24924AE80(a1, a2);
}

uint64_t sub_24924BF84(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_248BF9EC4;
  return sub_24924BEDC(a1, a2);
}

uint64_t sub_24924C02C(char a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248CEE04C;
  return sub_24924B114(a1);
}

uint64_t sub_24924C0C4(char a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248C03C54;
  return sub_24924C02C(a1);
}

uint64_t sub_24924C15C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CEE04C;
  return sub_24924B39C();
}

uint64_t sub_24924C1EC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248C03C54;
  return sub_24924C15C();
}

uint64_t sub_24924C27C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_24924B614(a1);
}

uint64_t sub_24924C318(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_24924C27C(a1);
}

uint64_t sub_24924C3B4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_24924B87C(a1);
}

uint64_t sub_24924C44C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_24924C3B4(a1);
}

uint64_t sub_24924C4E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269684250);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  long long v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269684248);
  long long v30 = (void (*)(uint64_t (*)(), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_24924D094;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_2491D8B08, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24924C89C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v36 = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B152208);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  long long v37 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_24925BCA0();
  uint64_t v12 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  long long v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v38 = sub_248BC68AC(0x65uLL);
  sub_2492578E0();
  long long v15 = sub_24925BC80();
  os_log_type_t v16 = sub_24925E0D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    v33[1] = a6;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc();
    v33[0] = v9;
    uint64_t v34 = a5;
    uint64_t v20 = v19;
    uint64_t v41 = v19;
    *(_DWORD *)uint64_t v18 = 134218498;
    *(void *)(v18 + 4) = v38;
    *(_WORD *)(v18 + 12) = 2080;
    uint64_t v21 = sub_24925E5A0();
    *(void *)(v18 + 14) = sub_248C1DFA8(v21, v22, &v41);
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    *(void *)(v18 + 24) = v34;
    os_log_type_t v23 = v16;
    char v24 = a4;
    _os_log_impl(&dword_248B72000, v15, v23, "Converting from Promise to Async-Await. Created at: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    uint64_t v25 = v20;
    a5 = v34;
    uint64_t v9 = v33[0];
    MEMORY[0x24C59A8D0](v25, -1, -1);
    MEMORY[0x24C59A8D0](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v35);
    char v24 = a4;
  }
  long long v26 = v37;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v37, v36, v9);
  unint64_t v27 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v39;
  *(void *)(v28 + 16) = v38;
  *(void *)(v28 + 24) = v29;
  *(void *)(v28 + 32) = v40;
  *(unsigned char *)(v28 + 40) = v24;
  *(void *)(v28 + 48) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v28 + v27, v26, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B150ED0);
  long long v30 = (void (*)(uint64_t (*)(), uint64_t))sub_2492547A0();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_24924CFFC;
  *(void *)(v31 + 24) = v28;
  swift_retain();
  v30(sub_2491D8B08, v31);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24924CC54(uint64_t a1)
{
  return sub_24924D070(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2491AC0F4);
}

uint64_t sub_24924CC6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(void), uint64_t *a9, uint64_t *a10)
{
  uint64_t v39 = a6;
  int v38 = a5;
  uint64_t v36 = a3;
  uint64_t v37 = a4;
  uint64_t v35 = a2;
  uint64_t v12 = a8(0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  long long v15 = (char *)&v31 - v14;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(a9);
  MEMORY[0x270FA5388](v42);
  uint64_t v43 = (uint64_t *)((char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = sub_24925BCA0();
  uint64_t v40 = *(void *)(v17 - 8);
  uint64_t v41 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2492578E0();
  uint64_t v20 = sub_24925BC80();
  os_log_type_t v21 = sub_24925E0D0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v33 = v12;
    uint64_t v23 = v22;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v34 = a7;
    uint64_t v32 = v24;
    uint64_t v44 = v24;
    *(_DWORD *)uint64_t v23 = 134218498;
    *(void *)(v23 + 4) = v35;
    *(_WORD *)(v23 + 12) = 2080;
    uint64_t v25 = sub_24925E5A0();
    *(void *)(v23 + 14) = sub_248C1DFA8(v25, v26, &v44);
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 22) = 2048;
    *(void *)(v23 + 24) = v39;
    _os_log_impl(&dword_248B72000, v20, v21, "Finished P->A conversion: %ld:%s:%lu", (uint8_t *)v23, 0x20u);
    uint64_t v27 = v32;
    swift_arrayDestroy();
    MEMORY[0x24C59A8D0](v27, -1, -1);
    uint64_t v28 = v23;
    uint64_t v12 = v33;
    MEMORY[0x24C59A8D0](v28, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v40 + 8))(v19, v41);
  uint64_t v29 = v43;
  sub_248BB35D4(a1, (uint64_t)v43, a9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v44 = *v29;
    __swift_instantiateConcreteTypeFromMangledName(a10);
    return sub_24925DDC0();
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v13 + 32))(v15, v29, v12);
    __swift_instantiateConcreteTypeFromMangledName(a10);
    return sub_24925DDD0();
  }
}

uint64_t sub_24924CFD8(uint64_t a1)
{
  return sub_24924D070(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24924C89C);
}

uint64_t sub_24924CFF0()
{
  return objectdestroy_151Tm(&qword_26B152208);
}

uint64_t sub_24924CFFC(uint64_t a1)
{
  return sub_24924D0BC(a1, &qword_26B152208, MEMORY[0x263F6A710], &qword_26B152BD8);
}

uint64_t sub_24924D028(uint64_t a1)
{
  return sub_24924D070(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_249227070);
}

uint64_t sub_24924D040(uint64_t a1)
{
  return sub_24924D070(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24923BB08);
}

uint64_t sub_24924D058(uint64_t a1)
{
  return sub_24924D070(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_24924C4E4);
}

uint64_t sub_24924D070(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t sub_24924D088()
{
  return objectdestroy_151Tm(&qword_269684250);
}

uint64_t sub_24924D094(uint64_t a1)
{
  return sub_24924D0BC(a1, &qword_269684250, MEMORY[0x263F699A0], &qword_269684258);
}

uint64_t sub_24924D0BC(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t *a4)
{
  uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8);
  return sub_24924CC6C(a1, *(void *)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(unsigned __int8 *)(v4 + 40), *(void *)(v4 + 48), v4 + ((*(unsigned __int8 *)(v9 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), a3, a4, a2);
}

uint64_t sub_24924D160(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_24924D180, 0, 0);
}

uint64_t sub_24924D180()
{
  sub_24925D150();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24924D1E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26967DB20);
  MEMORY[0x270FA5388](v9 - 8);
  unsigned int v10 = *(unsigned __int8 *)(v5 + 40);
  if (v10 >= 2)
  {
    if (v10 == 3)
    {
      sub_24925D8D0();
      sub_248BAFFD8(a3, (uint64_t)v13);
      swift_retain();
      swift_bridgeObjectRetain();
      sub_248BB003C(a4, a5);
      return sub_24925D8C0();
    }
    else
    {
      uint64_t result = sub_24925E6D0();
      __break(1u);
    }
  }
  else
  {
    sub_24925BFD0();
    sub_24925C1D0();
    id v11 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269684260));
    return sub_24925C070();
  }
  return result;
}

uint64_t sub_24924D3B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(void), uint64_t (*a7)(uint64_t, unsigned char *, uint64_t, uint64_t, char *, char *, char *, char *, uint64_t, unint64_t), uint64_t a8)
{
  uint64_t v46 = a8;
  uint64_t v47 = a6;
  uint64_t v48 = a7;
  unint64_t v45 = a5;
  uint64_t v13 = sub_249253430();
  MEMORY[0x270FA5388](v13 - 8);
  long long v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_249253170();
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  os_log_type_t v21 = (char *)&v40 - v20;
  uint64_t v22 = sub_249252180();
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26967DB20);
  MEMORY[0x270FA5388](v25 - 8);
  unsigned int v26 = *(unsigned __int8 *)(v8 + 40);
  if (v26 >= 2)
  {
    uint64_t v29 = a3;
    unint64_t v30 = v45;
    uint64_t v41 = v21;
    uint64_t v42 = v19;
    uint64_t v43 = v15;
    uint64_t v44 = a1;
    if (v26 == 3)
    {
      uint64_t v31 = *(void *)(v8 + 16);
      sub_248BAFFD8(v29, (uint64_t)v49);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696796A8);
      uint64_t v32 = *(void *)(sub_2492536C0() - 8);
      unint64_t v33 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
      uint64_t v34 = swift_allocObject();
      *(_OWORD *)(v34 + 16) = xmmword_249261060;
      unint64_t v35 = v34 + v33;
      *(_OWORD *)unint64_t v35 = xmmword_2492646B0;
      *(unsigned char *)(v35 + 16) = 1;
      swift_storeEnumTagMultiPayload();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_248BB003C(a4, v30);
      sub_24924F4F0(v34);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_249252170();
      uint64_t v36 = v41;
      sub_249253110();
      uint64_t v37 = v42;
      sub_249253110();
      int v38 = v43;
      sub_2492533A0();
      id v39 = objc_allocWithZone((Class)v47(0));
      return v48(v31, v49, v44, a2, v24, v36, v37, v38, a4, v30);
    }
    else
    {
      uint64_t result = sub_24925E6D0();
      __break(1u);
    }
  }
  else
  {
    sub_24925BFD0();
    sub_24925C1D0();
    id v27 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269684260));
    return sub_24925C070();
  }
  return result;
}

uint64_t sub_24924D860(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  unsigned int v11 = *(unsigned __int8 *)(v5 + 40);
  if (v11 >= 2)
  {
    if (v11 == 3)
    {
      sub_248BAFFD8(a5, (uint64_t)v14);
      objc_allocWithZone((Class)sub_24925D3E0());
      sub_248BB003C(a3, a4);
      swift_bridgeObjectRetain();
      swift_retain();
      return sub_24925D3D0();
    }
    else
    {
      uint64_t result = sub_24925E6D0();
      __break(1u);
    }
  }
  else
  {
    sub_24925D5E0();
    uint64_t v12 = *(void *)(v5 + 16);
    sub_248BAFFD8(a5, (uint64_t)v14);
    swift_retain();
    sub_248BB003C(a3, a4);
    swift_bridgeObjectRetain();
    return MEMORY[0x24C598A40](v12, a3, a4, v14, a1, a2);
  }
  return result;
}

uint64_t sub_24924D9C4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unsigned int v6 = *(unsigned __int8 *)(v3 + 40);
  if (v6 >= 2)
  {
    if (v6 == 3)
    {
      sub_248BAFFD8(a1, (uint64_t)v8);
      objc_allocWithZone((Class)sub_24925D550());
      sub_248BB003C(a2, a3);
      swift_retain();
      return sub_24925D540();
    }
    else
    {
      uint64_t result = sub_24925E6D0();
      __break(1u);
    }
  }
  else
  {
    sub_248BAFFD8(a1, (uint64_t)v8);
    objc_allocWithZone((Class)sub_24925D4B0());
    swift_retain();
    sub_248BB003C(a2, a3);
    return sub_24925D4A0();
  }
  return result;
}

uint64_t sub_24924DAEC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26967DB20);
  MEMORY[0x270FA5388](v7 - 8);
  unsigned int v8 = *(unsigned __int8 *)(v3 + 40);
  if (v8 >= 2)
  {
    if (v8 == 3)
    {
      sub_24925BFD0();
      sub_24925C1D0();
      id v10 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269684260));
      return sub_24925C070();
    }
    else
    {
      uint64_t result = sub_24925E6D0();
      __break(1u);
    }
  }
  else
  {
    sub_248BAFFD8(a3, (uint64_t)v11);
    objc_allocWithZone((Class)sub_24925D700());
    swift_retain();
    sub_248BB003C(a1, a2);
    return sub_24925D6F0();
  }
  return result;
}

uint64_t sub_24924DCA0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unsigned int v7 = *(unsigned __int8 *)(v3 + 40);
  if (v7 >= 2)
  {
    if (v7 == 3)
    {
      sub_24925D770();
      sub_248BAFFD8(a3, (uint64_t)v9);
      sub_248BB003C(a1, a2);
      swift_retain();
      return sub_24925D760();
    }
    else
    {
      uint64_t result = sub_24925E6D0();
      __break(1u);
    }
  }
  else
  {
    sub_248BAFFD8(a3, (uint64_t)v9);
    objc_allocWithZone((Class)sub_24925D7A0());
    swift_retain();
    sub_248BB003C(a1, a2);
    return sub_24925D790();
  }
  return result;
}

uint64_t sub_24924DDD4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v22 = a2;
  unint64_t v23 = a4;
  uint64_t v9 = sub_249252010();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24925D410();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v17 = *(unsigned __int8 *)(v5 + 40);
  if (v17 >= 2)
  {
    uint64_t v21 = a1;
    uint64_t v19 = v22;
    if (v17 == 3)
    {
      v20[1] = sub_24925D8A0();
      sub_248BAFFD8(a5, (uint64_t)v24);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v19, v9);
      (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v21, v13);
      sub_248BB003C(a3, v23);
      swift_retain();
      return sub_24925D890();
    }
    else
    {
      uint64_t result = sub_24925E6D0();
      __break(1u);
    }
  }
  else
  {
    sub_248BAFFD8(a5, (uint64_t)v24);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v22, v9);
    objc_allocWithZone((Class)sub_24925D860());
    swift_retain();
    sub_248BB003C(a3, v23);
    return sub_24925D850();
  }
  return result;
}

uint64_t sub_24924E0A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void), void (*a6)(void), uint64_t (*a7)(uint64_t, uint64_t, unint64_t, unsigned char *, char *), uint64_t a8)
{
  v24[1] = a8;
  uint64_t v25 = a7;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26967DB20);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v16 = a5(0);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v24 - v18;
  unsigned int v20 = *(unsigned __int8 *)(v8 + 40);
  if (v20 >= 2)
  {
    if (v20 == 3)
    {
      sub_24925BFD0();
      sub_24925C1D0();
      id v23 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269684260));
      return sub_24925C070();
    }
    else
    {
      uint64_t result = sub_24925E6D0();
      __break(1u);
    }
  }
  else
  {
    a6(0);
    uint64_t v21 = *(void *)(v8 + 16);
    sub_248BAFFD8(a4, (uint64_t)v26);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a1, v16);
    swift_retain();
    sub_248BB003C(a2, a3);
    return v25(v21, a2, a3, v26, v19);
  }
  return result;
}

uint64_t sub_24924E318(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v19 = a4;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26967DB20);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v12 = sub_24925D4E0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = &v20[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  unsigned int v16 = *(unsigned __int8 *)(v6 + 40);
  if (v16 >= 2)
  {
    if (v16 == 3)
    {
      sub_24925BFD0();
      sub_24925C1D0();
      id v18 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269684260));
      return sub_24925C070();
    }
    else
    {
      uint64_t result = sub_24925E6D0();
      __break(1u);
    }
  }
  else
  {
    sub_248BAFFD8(a6, (uint64_t)v20);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a3, v12);
    objc_allocWithZone((Class)sub_24925D840());
    swift_retain();
    sub_248BB003C(a1, a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return sub_24925D830();
  }
  return result;
}

uint64_t sub_24924E59C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26967DB20);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_2492540B0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  unsigned int v15 = *(unsigned __int8 *)(v5 + 40);
  if (v15 >= 2)
  {
    if (v15 == 3)
    {
      sub_24925BFD0();
      sub_24925C1D0();
      id v17 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269684260));
      return sub_24925C070();
    }
    else
    {
      uint64_t result = sub_24925E6D0();
      __break(1u);
    }
  }
  else
  {
    sub_248BAFFD8(a5, (uint64_t)v19);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
    objc_allocWithZone((Class)sub_24925D6B0());
    swift_retain();
    sub_248BB003C(a3, a4);
    swift_bridgeObjectRetain();
    return sub_24925D6A0();
  }
  return result;
}

uint64_t sub_24924E80C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v18 = a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26967DB20);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_24925D6E0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = &v19[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  unsigned int v15 = *(unsigned __int8 *)(v6 + 40);
  if (v15 >= 2)
  {
    if (v15 == 3)
    {
      sub_24925BFD0();
      sub_24925C1D0();
      id v17 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269684260));
      return sub_24925C070();
    }
    else
    {
      uint64_t result = sub_24925E6D0();
      __break(1u);
    }
  }
  else
  {
    sub_248BAFFD8(a6, (uint64_t)v19);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
    objc_allocWithZone((Class)sub_24925D880());
    swift_retain();
    sub_248BB003C(a4, v18);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return sub_24925D870();
  }
  return result;
}

uint64_t sub_24924EA90()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t static InteropService.default(with:)@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  type metadata accessor for InteropBridgeService();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151290);
  sub_249252070();
  *(_OWORD *)(v4 + 24) = v6;
  sub_249252070();
  *(unsigned char *)(v4 + 40) = v6;
  *a2 = sub_24924EDC0;
  a2[1] = (uint64_t (*)())v4;
  a2[2] = (uint64_t (*)())sub_24924EE78;
  a2[3] = (uint64_t (*)())v4;
  a2[4] = (uint64_t (*)())sub_24924EFC0;
  a2[5] = (uint64_t (*)())v4;
  a2[6] = sub_24924F004;
  a2[7] = (uint64_t (*)())v4;
  a2[8] = sub_24924F0C8;
  a2[9] = (uint64_t (*)())v4;
  a2[10] = sub_24924F1FC;
  a2[11] = (uint64_t (*)())v4;
  a2[12] = sub_24924F204;
  a2[13] = (uint64_t (*)())v4;
  a2[14] = (uint64_t (*)())sub_24924F208;
  a2[15] = (uint64_t (*)())v4;
  a2[16] = (uint64_t (*)())sub_24924F24C;
  a2[17] = (uint64_t (*)())v4;
  a2[18] = sub_24924F290;
  a2[19] = (uint64_t (*)())v4;
  a2[20] = (uint64_t (*)())sub_24924F294;
  a2[21] = (uint64_t (*)())v4;
  a2[22] = sub_24924F2EC;
  a2[23] = (uint64_t (*)())v4;
  a2[24] = sub_24924F2F0;
  a2[25] = (uint64_t (*)())v4;
  a2[26] = sub_24924F2F4;
  a2[27] = (uint64_t (*)())v4;
  a2[28] = sub_24924F2F8;
  a2[29] = (uint64_t (*)())v4;
  a2[30] = (uint64_t (*)())sub_24924F2FC;
  a2[31] = (uint64_t (*)())v4;
  a2[32] = sub_24924F354;
  a2[33] = (uint64_t (*)())v4;
  a2[34] = sub_24924F358;
  a2[35] = (uint64_t (*)())v4;
  a2[36] = sub_24924F35C;
  a2[37] = (uint64_t (*)())v4;
  a2[38] = (uint64_t (*)())sub_24924F4E8;
  a2[39] = (uint64_t (*)())v4;
  return swift_retain_n();
}

uint64_t type metadata accessor for InteropBridgeService()
{
  return self;
}

uint64_t sub_24924ED2C()
{
  return sub_249257480();
}

uint64_t sub_24924EDC0()
{
  return sub_24924ED2C();
}

uint64_t sub_24924EDC8(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 40) > 1u)
  {
    uint64_t result = sub_24925E6D0();
    __break(1u);
  }
  else
  {
    sub_248BAFFD8(a1, (uint64_t)v4);
    id v2 = objc_allocWithZone((Class)sub_24925D200());
    swift_retain();
    return sub_24925D1F0();
  }
  return result;
}

uint64_t sub_24924EE78(uint64_t a1)
{
  return sub_24924EDC8(a1, v1);
}

id sub_24924EE80(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150C40);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248C144A0(a1, (uint64_t)v4);
  uint64_t v5 = sub_2492516A0();
  uint64_t v6 = *(void *)(v5 - 8);
  unsigned int v7 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    unsigned int v7 = (void *)sub_2492515F0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F17F90]), sel_initWithAccountURL_, v7);

  objc_msgSend(v8, sel_prepareWithCompletionBlock_, 0);
  return v8;
}

id sub_24924EFC0(uint64_t a1)
{
  return sub_24924EE80(a1);
}

uint64_t sub_24924EFC8()
{
  id v0 = objc_allocWithZone((Class)sub_24925D7E0());
  swift_retain();
  return sub_24925D7D0();
}

uint64_t sub_24924F004()
{
  return sub_24924EFC8();
}

uint64_t sub_24924F00C()
{
  uint64_t v0 = sub_24925D180();
  MEMORY[0x270FA5388](v0 - 8);
  swift_retain();
  swift_retain();
  sub_24925D170();
  id v1 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_269684268));
  return sub_24925C070();
}

uint64_t sub_24924F0C8()
{
  return sub_24924F00C();
}

uint64_t sub_24924F0D0()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_24925DA40();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(self, sel_presenterForPrivacySplashWithIdentifier_, v0);

  if (v1 && (id v2 = objc_msgSend(v1, sel_splashController)) != 0)
  {
    id v3 = v2;

    return (uint64_t)v3;
  }
  else
  {
    sub_24925E580();
    swift_bridgeObjectRelease();
    sub_24925DBB0();
    uint64_t result = sub_24925E6D0();
    __break(1u);
  }
  return result;
}

uint64_t sub_24924F1FC()
{
  return sub_24924F0D0();
}

uint64_t sub_24924F208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_24924D3B4(a1, a2, a3, a4, a5, MEMORY[0x263F6BC20], MEMORY[0x263F6BC18], 114);
}

uint64_t sub_24924F24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return sub_24924D3B4(a1, a2, a3, a4, a5, MEMORY[0x263F6BBE8], MEMORY[0x263F6BBE0], 135);
}

uint64_t sub_24924F294(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  return sub_24924E0A4(a1, a2, a3, a4, MEMORY[0x263F6B278], MEMORY[0x263F6BB78], MEMORY[0x263F6BB70], 182);
}

uint64_t sub_24924F2FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  return sub_24924E0A4(a1, a2, a3, a4, MEMORY[0x263F07508], MEMORY[0x263F6BC30], MEMORY[0x263F6BC28], 299);
}

uint64_t sub_24924F360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  uint64_t v11 = sub_249253060();
  MEMORY[0x270FA5388](v11);
  if (*(unsigned char *)(a7 + 40) == 2)
  {
    uint64_t result = sub_24925E6D0();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 16))((char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
    objc_allocWithZone((Class)sub_24925D820());
    swift_retain();
    sub_248BB003C(a5, a6);
    return sub_24925D810();
  }
  return result;
}

uint64_t sub_24924F4E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_24924F360(a1, a2, a3, a4, a5, a6, v6);
}

uint64_t sub_24924F4F0(uint64_t a1)
{
  uint64_t v2 = sub_2492536C0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v28 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26967B760);
    uint64_t v10 = sub_24925E570();
    uint64_t v11 = 0;
    uint64_t v12 = v10 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v29 = v9;
    uint64_t v30 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v3 + 72);
    uint64_t v15 = v9;
    while (1)
    {
      sub_24924F710(v30 + v14 * v11, (uint64_t)v8);
      sub_24925EA40();
      sub_2492536B0();
      uint64_t v16 = sub_24925EA90();
      uint64_t v17 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v18 = v16 & ~v17;
      unint64_t v19 = v18 >> 6;
      uint64_t v20 = *(void *)(v12 + 8 * (v18 >> 6));
      uint64_t v21 = 1 << v18;
      if (((1 << v18) & v20) != 0)
      {
        uint64_t v22 = ~v17;
        do
        {
          sub_24924F710(*(void *)(v10 + 48) + v18 * v14, (uint64_t)v6);
          char v23 = MEMORY[0x24C58EB10](v6, v8);
          sub_24924F774((uint64_t)v6);
          if (v23)
          {
            sub_24924F774((uint64_t)v8);
            uint64_t v15 = v29;
            goto LABEL_4;
          }
          unint64_t v18 = (v18 + 1) & v22;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v12 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
        }
        while ((v20 & (1 << v18)) != 0);
        uint64_t v15 = v29;
      }
      *(void *)(v12 + 8 * v19) = v21 | v20;
      uint64_t result = sub_24924F7D0((uint64_t)v8, *(void *)(v10 + 48) + v18 * v14);
      uint64_t v25 = *(void *)(v10 + 16);
      BOOL v26 = __OFADD__(v25, 1);
      uint64_t v27 = v25 + 1;
      if (v26) {
        break;
      }
      *(void *)(v10 + 16) = v27;
LABEL_4:
      if (++v11 == v15) {
        return v10;
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE88];
  }
  return result;
}

uint64_t sub_24924F710(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2492536C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24924F774(uint64_t a1)
{
  uint64_t v2 = sub_2492536C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24924F7D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2492536C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24924F834()
{
  unint64_t result = qword_26B151FE8;
  if (!qword_26B151FE8)
  {
    sub_24925D160();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B151FE8);
  }
  return result;
}

uint64_t InteropService.makeNavigationRequestStream.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t InteropService.makeAccountSettingsViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeAccountPageViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeNotificationViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t InteropService.makePrivacyLinkListViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_retain();
  return v1;
}

uint64_t InteropService.makePrivacySplashViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeEditorialCollectionViewControllerWithIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeModalityDetailViewControllerWithIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeTrainerDetailViewControllerWithIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_retain();
  return v1;
}

uint64_t InteropService.makePlaylistViewControllerWithIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 144);
  swift_retain();
  return v1;
}

uint64_t InteropService.makePlaylistViewControllerWithPlaylist.getter()
{
  uint64_t v1 = *(void *)(v0 + 160);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeUpNextQueueViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeWorkoutPlanSurveyViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 192);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeActiveWorkoutPlanViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 208);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeWorkoutPlanAlternativeViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 224);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeWorkoutPlanDetailViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 240);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeWorkoutPlanPreferenceViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 256);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeWorkoutPlanReviewViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 272);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeEditWorkoutPlanScheduleViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 288);
  swift_retain();
  return v1;
}

uint64_t InteropService.makeWorkoutPlanSummaryViewController.getter()
{
  uint64_t v1 = *(void *)(v0 + 304);
  swift_retain();
  return v1;
}

uint64_t destroy for InteropService()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for InteropService(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  uint64_t v3 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = v3;
  uint64_t v4 = *(void *)(a2 + 288);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = v4;
  uint64_t v5 = *(void *)(a2 + 304);
  uint64_t v6 = *(void *)(a2 + 312);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(void *)(a1 + 304) = v5;
  *(void *)(a1 + 312) = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for InteropService(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_retain();
  swift_release();
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_retain();
  swift_release();
  uint64_t v12 = a2[17];
  a1[16] = a2[16];
  a1[17] = v12;
  swift_retain();
  swift_release();
  uint64_t v13 = a2[19];
  a1[18] = a2[18];
  a1[19] = v13;
  swift_retain();
  swift_release();
  uint64_t v14 = a2[21];
  a1[20] = a2[20];
  a1[21] = v14;
  swift_retain();
  swift_release();
  uint64_t v15 = a2[23];
  a1[22] = a2[22];
  a1[23] = v15;
  swift_retain();
  swift_release();
  uint64_t v16 = a2[25];
  a1[24] = a2[24];
  a1[25] = v16;
  swift_retain();
  swift_release();
  uint64_t v17 = a2[27];
  a1[26] = a2[26];
  a1[27] = v17;
  swift_retain();
  swift_release();
  uint64_t v18 = a2[29];
  a1[28] = a2[28];
  a1[29] = v18;
  swift_retain();
  swift_release();
  uint64_t v19 = a2[31];
  a1[30] = a2[30];
  a1[31] = v19;
  swift_retain();
  swift_release();
  uint64_t v20 = a2[33];
  a1[32] = a2[32];
  a1[33] = v20;
  swift_retain();
  swift_release();
  uint64_t v21 = a2[35];
  a1[34] = a2[34];
  a1[35] = v21;
  swift_retain();
  swift_release();
  uint64_t v22 = a2[37];
  a1[36] = a2[36];
  a1[37] = v22;
  swift_retain();
  swift_release();
  uint64_t v23 = a2[39];
  a1[38] = a2[38];
  a1[39] = v23;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for InteropService(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  a1[5] = a2[5];
  swift_release();
  a1[6] = a2[6];
  swift_release();
  a1[7] = a2[7];
  swift_release();
  a1[8] = a2[8];
  swift_release();
  a1[9] = a2[9];
  swift_release();
  a1[10] = a2[10];
  swift_release();
  a1[11] = a2[11];
  swift_release();
  a1[12] = a2[12];
  swift_release();
  a1[13] = a2[13];
  swift_release();
  a1[14] = a2[14];
  swift_release();
  a1[15] = a2[15];
  swift_release();
  a1[16] = a2[16];
  swift_release();
  a1[17] = a2[17];
  swift_release();
  a1[18] = a2[18];
  swift_release();
  a1[19] = a2[19];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for InteropService(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 320)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InteropService(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 312) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 320) = 1;
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
    *(unsigned char *)(result + 320) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InteropService()
{
  return &type metadata for InteropService;
}

uint64_t static UpNextQueueService.simulator()@<X0>(void *a1@<X8>)
{
  type metadata accessor for SimulatorUpNextQueueService();
  uint64_t v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *a1 = &unk_269684280;
  a1[1] = v2;
  a1[2] = &unk_269684290;
  a1[3] = v2;
  a1[4] = &unk_2696842A0;
  a1[5] = v2;
  return swift_retain_n();
}

uint64_t type metadata accessor for SimulatorUpNextQueueService()
{
  return self;
}

uint64_t sub_24925041C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248BF9EC4;
  uint64_t v2 = MEMORY[0x263F8EE78];
  return sub_248BF9EC4(v2);
}

uint64_t sub_2492504B8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248B97464;
  return sub_248B941DC();
}

uint64_t sub_249250548(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_249250564, a2, 0);
}

uint64_t sub_249250564()
{
  sub_24925DEF0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2492505F4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_248B941DC;
  v4[2] = a1;
  return MEMORY[0x270FA2498](sub_249250564, v1, 0);
}

uint64_t sub_24925069C()
{
  v1[3] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F08);
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_249250760, v0, 0);
}

uint64_t sub_249250760()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 128), *(void *)(*(void *)(v0 + 24) + 152));
  sub_249256B40();
  return MEMORY[0x270FA2498](sub_2492507F4, 0, 0);
}

uint64_t sub_2492507F4()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/UpNextService/LiveUpNextQueue"
                         "ClientService.swift";
  *(void *)(v2 + 24) = 114;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 22;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B152138);
  *uint64_t v3 = v0;
  v3[1] = sub_2491A9DE4;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249251090, v2, v4);
}

uint64_t sub_249250914(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B150F60);
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2492509D8, v1, 0);
}

uint64_t sub_2492509D8()
{
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)(v0 + 24) + 128), *(void *)(*(void *)(v0 + 24) + 152));
  sub_249256B50();
  return MEMORY[0x270FA2498](sub_249250A74, 0, 0);
}

uint64_t sub_249250A74()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = swift_task_alloc();
  v0[7] = v2;
  *(void *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/Blackbeard/Services/UpNextService/LiveUpNextQueue"
                         "ClientService.swift";
  *(void *)(v2 + 24) = 114;
  *(unsigned char *)(v2 + 32) = 2;
  *(void *)(v2 + 40) = 26;
  *(void *)(v2 + 48) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  *uint64_t v3 = v0;
  uint64_t v4 = MEMORY[0x263F8EE60];
  v3[1] = sub_2491C40B4;
  return MEMORY[0x270FA2360](v3, 0, 0, 0xD000000000000013, 0x80000002492790B0, sub_249251078, v2, v4 + 8);
}

uint64_t static UpNextQueueService.live(with:)@<X0>(void *a1@<X8>)
{
  type metadata accessor for LiveUpNextQueueClientService();
  uint64_t v2 = swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B151290);
  sub_249252070();
  *(_OWORD *)(v2 + 112) = v4[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1511E8);
  sub_249252070();
  swift_release();
  sub_248B9CDEC(v4, v2 + 128);
  *a1 = &unk_2696842B8;
  a1[1] = v2;
  a1[2] = &unk_2696842C8;
  a1[3] = v2;
  a1[4] = &unk_2696842D8;
  a1[5] = v2;
  return swift_retain_n();
}

uint64_t type metadata accessor for LiveUpNextQueueClientService()
{
  return self;
}

uint64_t sub_249250C9C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248CD0BFC;
  return sub_24925069C();
}

uint64_t sub_249250D2C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_248BF9EC4;
  return sub_249250C9C();
}

uint64_t sub_249250DBC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B941DC;
  return sub_249250914(a1);
}

uint64_t sub_249250E54(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_248B97464;
  return sub_249250DBC(a1);
}

uint64_t sub_249250EEC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_249250F08, a2, 0);
}

uint64_t sub_249250F08()
{
  swift_getObjectType();
  sub_249257600();
  sub_249257480();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249250FCC(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  long long v4[3] = v1;
  v4[1] = sub_248B941DC;
  return MEMORY[0x270FA2498](sub_249250F08, v1, 0);
}

uint64_t sub_249251078(uint64_t a1)
{
  return sub_2492510A8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2491AC0F4);
}

uint64_t sub_249251090(uint64_t a1)
{
  return sub_2492510A8(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2491D4F64);
}

uint64_t sub_2492510A8(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

uint64_t UpNextQueueService.queryUpNextQueue.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t UpNextQueueService.processUpNextQueueUpdates.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_retain();
  return v1;
}

uint64_t UpNextQueueService.makeUpNextQueueUpdatedStream.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

ValueMetadata *type metadata accessor for UpNextQueueService()
{
  return &type metadata for UpNextQueueService;
}

uint64_t sub_249251160()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_249251170()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_249251180()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_249251190()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_2492511A0()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_2492511B0()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_2492511C0()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_2492511D0()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_2492511E0()
{
  return MEMORY[0x270EEE4A0]();
}

uint64_t sub_2492511F0()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_249251200()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_249251210()
{
  return MEMORY[0x270EEE518]();
}

uint64_t sub_249251220()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_249251230()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_249251240()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_249251250()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_249251260()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_249251270()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_249251280()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_249251290()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_2492512A0()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_2492512B0()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_2492512C0()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_2492512D0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2492512E0()
{
  return MEMORY[0x270F2AD40]();
}

uint64_t sub_2492512F0()
{
  return MEMORY[0x270F2AD48]();
}

uint64_t sub_249251300()
{
  return MEMORY[0x270F2AD50]();
}

uint64_t sub_249251310()
{
  return MEMORY[0x270F2AD58]();
}

uint64_t sub_249251320()
{
  return MEMORY[0x270F816B0]();
}

uint64_t sub_249251330()
{
  return MEMORY[0x270EFEAC8]();
}

uint64_t sub_249251340()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t sub_249251350()
{
  return MEMORY[0x270EFEB00]();
}

uint64_t sub_249251360()
{
  return MEMORY[0x270EFEB10]();
}

uint64_t sub_249251370()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_249251380()
{
  return MEMORY[0x270EEEAA8]();
}

uint64_t sub_249251390()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_2492513A0()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_2492513B0()
{
  return MEMORY[0x270EEEB40]();
}

uint64_t sub_2492513C0()
{
  return MEMORY[0x270F2AD60]();
}

uint64_t sub_2492513D0()
{
  return MEMORY[0x270F2CCC0]();
}

uint64_t sub_2492513E0()
{
  return MEMORY[0x270EEEBE0]();
}

uint64_t sub_2492513F0()
{
  return MEMORY[0x270EEEBF8]();
}

uint64_t sub_249251400()
{
  return MEMORY[0x270F2C198]();
}

uint64_t sub_249251410()
{
  return MEMORY[0x270EEEC38]();
}

uint64_t sub_249251420()
{
  return MEMORY[0x270EEED18]();
}

uint64_t sub_249251430()
{
  return MEMORY[0x270EEED60]();
}

uint64_t sub_249251440()
{
  return MEMORY[0x270EEEDD0]();
}

uint64_t sub_249251450()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_249251460()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_249251470()
{
  return MEMORY[0x270EEEE08]();
}

uint64_t sub_249251480()
{
  return MEMORY[0x270EEEE18]();
}

uint64_t sub_249251490()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t sub_2492514A0()
{
  return MEMORY[0x270EEF020]();
}

uint64_t sub_2492514B0()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_2492514C0()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_2492514D0()
{
  return MEMORY[0x270EEF190]();
}

uint64_t sub_2492514E0()
{
  return MEMORY[0x270EEF318]();
}

uint64_t sub_2492514F0()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_249251500()
{
  return MEMORY[0x270EEF470]();
}

uint64_t sub_249251510()
{
  return MEMORY[0x270F816D8]();
}

uint64_t sub_249251520()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_249251530()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_249251540()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_249251550()
{
  return MEMORY[0x270EEF908]();
}

uint64_t sub_249251560()
{
  return MEMORY[0x270EEF9F8]();
}

uint64_t sub_249251570()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_249251580()
{
  return MEMORY[0x270F5D238]();
}

uint64_t sub_249251590()
{
  return MEMORY[0x270F5D240]();
}

uint64_t sub_2492515A0()
{
  return MEMORY[0x270F5D250]();
}

uint64_t sub_2492515B0()
{
  return MEMORY[0x270F5D258]();
}

uint64_t sub_2492515C0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2492515D0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2492515E0()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_2492515F0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_249251600()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_249251610()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_249251620()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_249251630()
{
  return MEMORY[0x270EEFE50]();
}

uint64_t sub_249251640()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_249251650()
{
  return MEMORY[0x270EEFEA8]();
}

uint64_t sub_249251660()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_249251670()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_249251680()
{
  return MEMORY[0x270F62CA8]();
}

uint64_t sub_249251690()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_2492516A0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2492516B0()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_2492516C0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2492516D0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2492516E0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_2492516F0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_249251700()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_249251710()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_249251720()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_249251730()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_249251740()
{
  return MEMORY[0x270EF0570]();
}

uint64_t sub_249251750()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_249251760()
{
  return MEMORY[0x270EF05F0]();
}

uint64_t sub_249251770()
{
  return MEMORY[0x270EF0628]();
}

uint64_t sub_249251780()
{
  return MEMORY[0x270EF06A8]();
}

uint64_t sub_249251790()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_2492517A0()
{
  return MEMORY[0x270F5EC30]();
}

uint64_t sub_2492517B0()
{
  return MEMORY[0x270F5EC38]();
}

uint64_t sub_2492517C0()
{
  return MEMORY[0x270F5EC40]();
}

uint64_t sub_2492517D0()
{
  return MEMORY[0x270F5EC50]();
}

uint64_t sub_2492517E0()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_2492517F0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_249251800()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_249251810()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_249251820()
{
  return MEMORY[0x270EF09C8]();
}

uint64_t sub_249251830()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_249251840()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_249251850()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_249251860()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_249251870()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_249251880()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_249251890()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2492518A0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2492518B0()
{
  return MEMORY[0x270EF0D30]();
}

uint64_t sub_2492518C0()
{
  return MEMORY[0x270EF0D50]();
}

uint64_t sub_2492518D0()
{
  return MEMORY[0x270EF0D58]();
}

uint64_t sub_2492518E0()
{
  return MEMORY[0x270EF0D60]();
}

uint64_t sub_2492518F0()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_249251900()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_249251910()
{
  return MEMORY[0x270EF0DE0]();
}

uint64_t sub_249251920()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_249251930()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_249251940()
{
  return MEMORY[0x270EF0F30]();
}

uint64_t sub_249251950()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_249251960()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_249251970()
{
  return MEMORY[0x270EF0FD8]();
}

uint64_t sub_249251980()
{
  return MEMORY[0x270EF0FF0]();
}

uint64_t sub_249251990()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_2492519A0()
{
  return MEMORY[0x270EF1020]();
}

uint64_t sub_2492519B0()
{
  return MEMORY[0x270EF1058]();
}

uint64_t sub_2492519C0()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_2492519D0()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_2492519E0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2492519F0()
{
  return MEMORY[0x270F5EC60]();
}

uint64_t sub_249251A00()
{
  return MEMORY[0x270F5EC70]();
}

uint64_t sub_249251A10()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_249251A20()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_249251A30()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_249251A40()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_249251A50()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_249251A60()
{
  return MEMORY[0x270EF13C8]();
}

uint64_t sub_249251A70()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_249251A80()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_249251A90()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_249251AA0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_249251AB0()
{
  return MEMORY[0x270F816E8]();
}

uint64_t sub_249251AC0()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_249251AD0()
{
  return MEMORY[0x270F81718]();
}

uint64_t sub_249251AE0()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_249251AF0()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_249251B00()
{
  return MEMORY[0x270F2CB48]();
}

uint64_t sub_249251B10()
{
  return MEMORY[0x270F2CB50]();
}

uint64_t sub_249251B20()
{
  return MEMORY[0x270F2CB58]();
}

uint64_t sub_249251B30()
{
  return MEMORY[0x270F2CB60]();
}

uint64_t sub_249251B40()
{
  return MEMORY[0x270F2CB68]();
}

uint64_t sub_249251B50()
{
  return MEMORY[0x270F2CB70]();
}

uint64_t sub_249251B60()
{
  return MEMORY[0x270F2CB78]();
}

uint64_t sub_249251B70()
{
  return MEMORY[0x270F2CB80]();
}

uint64_t sub_249251B80()
{
  return MEMORY[0x270F2CB88]();
}

uint64_t sub_249251B90()
{
  return MEMORY[0x270F2CB90]();
}

uint64_t sub_249251BA0()
{
  return MEMORY[0x270F5EC88]();
}

uint64_t sub_249251BB0()
{
  return MEMORY[0x270F5EC90]();
}

uint64_t sub_249251BC0()
{
  return MEMORY[0x270F5EC98]();
}

uint64_t sub_249251BD0()
{
  return MEMORY[0x270F5ECA0]();
}

uint64_t sub_249251BE0()
{
  return MEMORY[0x270F5ECA8]();
}

uint64_t sub_249251BF0()
{
  return MEMORY[0x270F5ED08]();
}

uint64_t sub_249251C00()
{
  return MEMORY[0x270F5ED10]();
}

uint64_t sub_249251C10()
{
  return MEMORY[0x270F5ED48]();
}

uint64_t sub_249251C20()
{
  return MEMORY[0x270F5ED70]();
}

uint64_t sub_249251C30()
{
  return MEMORY[0x270F5ED78]();
}

uint64_t sub_249251C40()
{
  return MEMORY[0x270F5ED88]();
}

uint64_t sub_249251C50()
{
  return MEMORY[0x270F5ED90]();
}

uint64_t sub_249251C60()
{
  return MEMORY[0x270F5ED98]();
}

uint64_t sub_249251C70()
{
  return MEMORY[0x270F5EDA0]();
}

uint64_t sub_249251C80()
{
  return MEMORY[0x270F5EDB0]();
}

uint64_t sub_249251C90()
{
  return MEMORY[0x270F5EDB8]();
}

uint64_t sub_249251CA0()
{
  return MEMORY[0x270F5EDC0]();
}

uint64_t sub_249251CB0()
{
  return MEMORY[0x270F5EDD0]();
}

uint64_t sub_249251CC0()
{
  return MEMORY[0x270F5EDD8]();
}

uint64_t sub_249251CD0()
{
  return MEMORY[0x270F5EDF0]();
}

uint64_t sub_249251CE0()
{
  return MEMORY[0x270F5EDF8]();
}

uint64_t sub_249251CF0()
{
  return MEMORY[0x270F5EE00]();
}

uint64_t sub_249251D00()
{
  return MEMORY[0x270F5EE08]();
}

uint64_t sub_249251D10()
{
  return MEMORY[0x270F5EE18]();
}

uint64_t sub_249251D20()
{
  return MEMORY[0x270F5EE28]();
}

uint64_t sub_249251D30()
{
  return MEMORY[0x270F5EE30]();
}

uint64_t sub_249251D40()
{
  return MEMORY[0x270F5EE38]();
}

uint64_t sub_249251D50()
{
  return MEMORY[0x270F5EE50]();
}

uint64_t sub_249251D60()
{
  return MEMORY[0x270F5EE68]();
}

uint64_t sub_249251D70()
{
  return MEMORY[0x270F5EE70]();
}

uint64_t sub_249251D80()
{
  return MEMORY[0x270F5EE88]();
}

uint64_t sub_249251D90()
{
  return MEMORY[0x270F5EE90]();
}

uint64_t sub_249251DA0()
{
  return MEMORY[0x270F5EE98]();
}

uint64_t sub_249251DB0()
{
  return MEMORY[0x270F5EEA0]();
}

uint64_t sub_249251DC0()
{
  return MEMORY[0x270F5EEA8]();
}

uint64_t sub_249251DD0()
{
  return MEMORY[0x270F5EEB0]();
}

uint64_t sub_249251DE0()
{
  return MEMORY[0x270F5EEB8]();
}

uint64_t sub_249251DF0()
{
  return MEMORY[0x270F5EEC0]();
}

uint64_t sub_249251E00()
{
  return MEMORY[0x270F5EEC8]();
}

uint64_t sub_249251E10()
{
  return MEMORY[0x270F5EED0]();
}

uint64_t sub_249251E20()
{
  return MEMORY[0x270F5EED8]();
}

uint64_t sub_249251E30()
{
  return MEMORY[0x270F5EEE0]();
}

uint64_t sub_249251E40()
{
  return MEMORY[0x270F5EEE8]();
}

uint64_t sub_249251E50()
{
  return MEMORY[0x270F5EEF0]();
}

uint64_t sub_249251E60()
{
  return MEMORY[0x270F5EEF8]();
}

uint64_t sub_249251E70()
{
  return MEMORY[0x270F5EF00]();
}

uint64_t sub_249251E80()
{
  return MEMORY[0x270F5EF08]();
}

uint64_t sub_249251E90()
{
  return MEMORY[0x270F5EF10]();
}

uint64_t sub_249251EA0()
{
  return MEMORY[0x270F5EF18]();
}

uint64_t sub_249251EB0()
{
  return MEMORY[0x270F5EF20]();
}

uint64_t sub_249251EC0()
{
  return MEMORY[0x270F5EF28]();
}

uint64_t sub_249251ED0()
{
  return MEMORY[0x270F5EF30]();
}

uint64_t sub_249251EE0()
{
  return MEMORY[0x270F5EF40]();
}

uint64_t sub_249251EF0()
{
  return MEMORY[0x270F5EF48]();
}

uint64_t sub_249251F00()
{
  return MEMORY[0x270F5EF58]();
}

uint64_t sub_249251F10()
{
  return MEMORY[0x270F5EF80]();
}

uint64_t sub_249251F20()
{
  return MEMORY[0x270F5EF88]();
}

uint64_t sub_249251F30()
{
  return MEMORY[0x270F5EFB8]();
}

uint64_t sub_249251F40()
{
  return MEMORY[0x270F5EFD8]();
}

uint64_t sub_249251F50()
{
  return MEMORY[0x270F5F060]();
}

uint64_t sub_249251F60()
{
  return MEMORY[0x270F5F068]();
}

uint64_t sub_249251F70()
{
  return MEMORY[0x270F5F080]();
}

uint64_t sub_249251F80()
{
  return MEMORY[0x270F5F090]();
}

uint64_t sub_249251F90()
{
  return MEMORY[0x270F5F0A8]();
}

uint64_t sub_249251FA0()
{
  return MEMORY[0x270F5F0B0]();
}

uint64_t sub_249251FB0()
{
  return MEMORY[0x270F5F0B8]();
}

uint64_t sub_249251FC0()
{
  return MEMORY[0x270F5F0D8]();
}

uint64_t sub_249251FD0()
{
  return MEMORY[0x270F5F0E0]();
}

uint64_t sub_249251FE0()
{
  return MEMORY[0x270F5F0E8]();
}

uint64_t sub_249251FF0()
{
  return MEMORY[0x270F5F0F8]();
}

uint64_t sub_249252000()
{
  return MEMORY[0x270F5F110]();
}

uint64_t sub_249252010()
{
  return MEMORY[0x270F5F118]();
}

uint64_t sub_249252020()
{
  return MEMORY[0x270F5F180]();
}

uint64_t sub_249252030()
{
  return MEMORY[0x270F5F188]();
}

uint64_t sub_249252040()
{
  return MEMORY[0x270F5F198]();
}

uint64_t sub_249252050()
{
  return MEMORY[0x270F5F1A0]();
}

uint64_t sub_249252060()
{
  return MEMORY[0x270F5F1A8]();
}

uint64_t sub_249252070()
{
  return MEMORY[0x270F5F1B8]();
}

uint64_t sub_249252080()
{
  return MEMORY[0x270F5F1F8]();
}

uint64_t sub_249252090()
{
  return MEMORY[0x270F5F208]();
}

uint64_t sub_2492520A0()
{
  return MEMORY[0x270F5F210]();
}

uint64_t sub_2492520B0()
{
  return MEMORY[0x270F5F218]();
}

uint64_t sub_2492520C0()
{
  return MEMORY[0x270F5F220]();
}

uint64_t sub_2492520D0()
{
  return MEMORY[0x270F5F228]();
}

uint64_t sub_2492520E0()
{
  return MEMORY[0x270F5F230]();
}

uint64_t sub_2492520F0()
{
  return MEMORY[0x270F5F240]();
}

uint64_t sub_249252100()
{
  return MEMORY[0x270F5F248]();
}

uint64_t sub_249252110()
{
  return MEMORY[0x270F5F250]();
}

uint64_t sub_249252120()
{
  return MEMORY[0x270F5F258]();
}

uint64_t sub_249252130()
{
  return MEMORY[0x270F5F260]();
}

uint64_t sub_249252140()
{
  return MEMORY[0x270F5F268]();
}

uint64_t sub_249252150()
{
  return MEMORY[0x270F5F270]();
}

uint64_t sub_249252160()
{
  return MEMORY[0x270F5F2D0]();
}

uint64_t sub_249252170()
{
  return MEMORY[0x270F5F360]();
}

uint64_t sub_249252180()
{
  return MEMORY[0x270F5F380]();
}

uint64_t sub_249252190()
{
  return MEMORY[0x270F5F388]();
}

uint64_t sub_2492521A0()
{
  return MEMORY[0x270F5F390]();
}

uint64_t sub_2492521B0()
{
  return MEMORY[0x270F5F398]();
}

uint64_t sub_2492521C0()
{
  return MEMORY[0x270F5F3A0]();
}

uint64_t sub_2492521D0()
{
  return MEMORY[0x270F5F3B0]();
}

uint64_t sub_2492521E0()
{
  return MEMORY[0x270F5F3B8]();
}

uint64_t sub_2492521F0()
{
  return MEMORY[0x270F5F3C8]();
}

uint64_t sub_249252200()
{
  return MEMORY[0x270F5F3D8]();
}

uint64_t sub_249252210()
{
  return MEMORY[0x270F5F3E0]();
}

uint64_t sub_249252220()
{
  return MEMORY[0x270F5F3E8]();
}

uint64_t sub_249252230()
{
  return MEMORY[0x270F5F3F0]();
}

uint64_t sub_249252240()
{
  return MEMORY[0x270F5F3F8]();
}

uint64_t sub_249252250()
{
  return MEMORY[0x270F5F400]();
}

uint64_t sub_249252260()
{
  return MEMORY[0x270F5F408]();
}

uint64_t sub_249252270()
{
  return MEMORY[0x270F5F410]();
}

uint64_t sub_249252280()
{
  return MEMORY[0x270F5F420]();
}

uint64_t sub_249252290()
{
  return MEMORY[0x270F5F428]();
}

uint64_t sub_2492522A0()
{
  return MEMORY[0x270F5F430]();
}

uint64_t sub_2492522B0()
{
  return MEMORY[0x270F5F438]();
}

uint64_t sub_2492522C0()
{
  return MEMORY[0x270F5F440]();
}

uint64_t sub_2492522D0()
{
  return MEMORY[0x270F5F448]();
}

uint64_t sub_2492522E0()
{
  return MEMORY[0x270F5F450]();
}

uint64_t sub_2492522F0()
{
  return MEMORY[0x270F5F458]();
}

uint64_t sub_249252300()
{
  return MEMORY[0x270F5F460]();
}

uint64_t sub_249252310()
{
  return MEMORY[0x270F5F470]();
}

uint64_t sub_249252320()
{
  return MEMORY[0x270F5F478]();
}

uint64_t sub_249252330()
{
  return MEMORY[0x270F5F488]();
}

uint64_t sub_249252340()
{
  return MEMORY[0x270F5F490]();
}

uint64_t sub_249252350()
{
  return MEMORY[0x270F5F498]();
}

uint64_t sub_249252360()
{
  return MEMORY[0x270F5F4A0]();
}

uint64_t sub_249252370()
{
  return MEMORY[0x270F5F4C8]();
}

uint64_t sub_249252380()
{
  return MEMORY[0x270F5F4D8]();
}

uint64_t sub_249252390()
{
  return MEMORY[0x270F5F4E0]();
}

uint64_t sub_2492523A0()
{
  return MEMORY[0x270F5F4E8]();
}

uint64_t sub_2492523B0()
{
  return MEMORY[0x270F5F4F0]();
}

uint64_t sub_2492523C0()
{
  return MEMORY[0x270F5F500]();
}

uint64_t sub_2492523D0()
{
  return MEMORY[0x270F5F508]();
}

uint64_t sub_2492523E0()
{
  return MEMORY[0x270F5F530]();
}

uint64_t sub_2492523F0()
{
  return MEMORY[0x270F5F538]();
}

uint64_t sub_249252400()
{
  return MEMORY[0x270F5F548]();
}

uint64_t sub_249252410()
{
  return MEMORY[0x270F5F560]();
}

uint64_t sub_249252420()
{
  return MEMORY[0x270F5F568]();
}

uint64_t sub_249252430()
{
  return MEMORY[0x270F5F570]();
}

uint64_t sub_249252440()
{
  return MEMORY[0x270F5F578]();
}

uint64_t sub_249252450()
{
  return MEMORY[0x270F5F588]();
}

uint64_t sub_249252460()
{
  return MEMORY[0x270F5F590]();
}

uint64_t sub_249252470()
{
  return MEMORY[0x270F5F5A0]();
}

uint64_t sub_249252480()
{
  return MEMORY[0x270F5F5A8]();
}

uint64_t sub_249252490()
{
  return MEMORY[0x270F5F688]();
}

uint64_t sub_2492524A0()
{
  return MEMORY[0x270F5F690]();
}

uint64_t sub_2492524B0()
{
  return MEMORY[0x270F5F698]();
}

uint64_t sub_2492524C0()
{
  return MEMORY[0x270F5F6A0]();
}

uint64_t sub_2492524D0()
{
  return MEMORY[0x270F5F6A8]();
}

uint64_t sub_2492524E0()
{
  return MEMORY[0x270F5F6B0]();
}

uint64_t sub_2492524F0()
{
  return MEMORY[0x270F5F6B8]();
}

uint64_t sub_249252500()
{
  return MEMORY[0x270F5F6C0]();
}

uint64_t sub_249252510()
{
  return MEMORY[0x270F5F6C8]();
}

uint64_t sub_249252520()
{
  return MEMORY[0x270F5F6D8]();
}

uint64_t sub_249252530()
{
  return MEMORY[0x270F5F6F0]();
}

uint64_t sub_249252540()
{
  return MEMORY[0x270F5F6F8]();
}

uint64_t sub_249252550()
{
  return MEMORY[0x270F5F700]();
}

uint64_t sub_249252560()
{
  return MEMORY[0x270F5F708]();
}

uint64_t sub_249252570()
{
  return MEMORY[0x270F5F718]();
}

uint64_t sub_249252580()
{
  return MEMORY[0x270F5F720]();
}

uint64_t sub_249252590()
{
  return MEMORY[0x270F5F728]();
}

uint64_t sub_2492525A0()
{
  return MEMORY[0x270F5F730]();
}

uint64_t sub_2492525B0()
{
  return MEMORY[0x270F5F738]();
}

uint64_t sub_2492525C0()
{
  return MEMORY[0x270F5F750]();
}

uint64_t sub_2492525D0()
{
  return MEMORY[0x270F5F758]();
}

uint64_t sub_2492525E0()
{
  return MEMORY[0x270F5F760]();
}

uint64_t sub_2492525F0()
{
  return MEMORY[0x270F5F768]();
}

uint64_t sub_249252600()
{
  return MEMORY[0x270F5F770]();
}

uint64_t sub_249252610()
{
  return MEMORY[0x270F5F778]();
}

uint64_t sub_249252620()
{
  return MEMORY[0x270F5F780]();
}

uint64_t sub_249252630()
{
  return MEMORY[0x270F5F788]();
}

uint64_t sub_249252640()
{
  return MEMORY[0x270F5F798]();
}

uint64_t sub_249252650()
{
  return MEMORY[0x270F5F7A0]();
}

uint64_t sub_249252660()
{
  return MEMORY[0x270F5F7A8]();
}

uint64_t sub_249252670()
{
  return MEMORY[0x270F5F7C0]();
}

uint64_t sub_249252680()
{
  return MEMORY[0x270F5F7E0]();
}

uint64_t sub_249252690()
{
  return MEMORY[0x270F5F7E8]();
}

uint64_t sub_2492526A0()
{
  return MEMORY[0x270F5F7F0]();
}

uint64_t sub_2492526B0()
{
  return MEMORY[0x270F5F808]();
}

uint64_t sub_2492526C0()
{
  return MEMORY[0x270F5F810]();
}

uint64_t sub_2492526D0()
{
  return MEMORY[0x270F5F818]();
}

uint64_t sub_2492526E0()
{
  return MEMORY[0x270F5F828]();
}

uint64_t sub_2492526F0()
{
  return MEMORY[0x270F5F830]();
}

uint64_t sub_249252700()
{
  return MEMORY[0x270F5F840]();
}

uint64_t sub_249252710()
{
  return MEMORY[0x270F5F848]();
}

uint64_t sub_249252720()
{
  return MEMORY[0x270F5F850]();
}

uint64_t sub_249252730()
{
  return MEMORY[0x270F5F860]();
}

uint64_t sub_249252740()
{
  return MEMORY[0x270F5F868]();
}

uint64_t sub_249252750()
{
  return MEMORY[0x270F5F888]();
}

uint64_t sub_249252760()
{
  return MEMORY[0x270F5F890]();
}

uint64_t sub_249252770()
{
  return MEMORY[0x270F5F898]();
}

uint64_t sub_249252780()
{
  return MEMORY[0x270F5F8A0]();
}

uint64_t sub_249252790()
{
  return MEMORY[0x270F5F8F8]();
}

uint64_t sub_2492527A0()
{
  return MEMORY[0x270F5F910]();
}

uint64_t sub_2492527B0()
{
  return MEMORY[0x270F5F940]();
}

uint64_t sub_2492527C0()
{
  return MEMORY[0x270F5F948]();
}

uint64_t sub_2492527D0()
{
  return MEMORY[0x270F5F950]();
}

uint64_t sub_2492527E0()
{
  return MEMORY[0x270F5F958]();
}

uint64_t sub_2492527F0()
{
  return MEMORY[0x270F5F960]();
}

uint64_t sub_249252800()
{
  return MEMORY[0x270F5F978]();
}

uint64_t sub_249252810()
{
  return MEMORY[0x270F5F980]();
}

uint64_t sub_249252820()
{
  return MEMORY[0x270F5F988]();
}

uint64_t sub_249252830()
{
  return MEMORY[0x270F5F9A8]();
}

uint64_t sub_249252840()
{
  return MEMORY[0x270F5F9C0]();
}

uint64_t sub_249252850()
{
  return MEMORY[0x270F5F9C8]();
}

uint64_t sub_249252860()
{
  return MEMORY[0x270F5F9D0]();
}

uint64_t sub_249252870()
{
  return MEMORY[0x270F5F9E0]();
}

uint64_t sub_249252880()
{
  return MEMORY[0x270F5F9E8]();
}

uint64_t sub_249252890()
{
  return MEMORY[0x270F5F9F0]();
}

uint64_t sub_2492528A0()
{
  return MEMORY[0x270F5F9F8]();
}

uint64_t sub_2492528B0()
{
  return MEMORY[0x270F5FA00]();
}

uint64_t sub_2492528C0()
{
  return MEMORY[0x270F5FA08]();
}

uint64_t sub_2492528D0()
{
  return MEMORY[0x270F5FA10]();
}

uint64_t sub_2492528E0()
{
  return MEMORY[0x270F5FA20]();
}

uint64_t sub_2492528F0()
{
  return MEMORY[0x270F5FA28]();
}

uint64_t sub_249252900()
{
  return MEMORY[0x270F5FA30]();
}

uint64_t sub_249252910()
{
  return MEMORY[0x270F5FAD8]();
}

uint64_t sub_249252920()
{
  return MEMORY[0x270F5FAE0]();
}

uint64_t sub_249252930()
{
  return MEMORY[0x270F5FAE8]();
}

uint64_t sub_249252940()
{
  return MEMORY[0x270F5FB48]();
}

uint64_t sub_249252950()
{
  return MEMORY[0x270F5FB58]();
}

uint64_t sub_249252960()
{
  return MEMORY[0x270F5FB60]();
}

uint64_t sub_249252970()
{
  return MEMORY[0x270F5FB80]();
}

uint64_t _s10Blackbeard20MetricIdentifierTypeO8rawValueSSvg_0()
{
  return MEMORY[0x270F5FBB8]();
}

uint64_t sub_249252990()
{
  return MEMORY[0x270F5FC10]();
}

uint64_t sub_2492529A0()
{
  return MEMORY[0x270F5FC18]();
}

uint64_t sub_2492529B0()
{
  return MEMORY[0x270F5FC20]();
}

uint64_t sub_2492529C0()
{
  return MEMORY[0x270F5FC28]();
}

uint64_t sub_2492529D0()
{
  return MEMORY[0x270F5FC30]();
}

uint64_t sub_2492529E0()
{
  return MEMORY[0x270F5FC38]();
}

uint64_t sub_2492529F0()
{
  return MEMORY[0x270F5FC40]();
}

uint64_t sub_249252A00()
{
  return MEMORY[0x270F5FC58]();
}

uint64_t sub_249252A10()
{
  return MEMORY[0x270F5FC70]();
}

uint64_t sub_249252A20()
{
  return MEMORY[0x270F5FC88]();
}

uint64_t sub_249252A30()
{
  return MEMORY[0x270F5FC90]();
}

uint64_t sub_249252A40()
{
  return MEMORY[0x270F5FC98]();
}

uint64_t sub_249252A50()
{
  return MEMORY[0x270F5FCA0]();
}

uint64_t sub_249252A60()
{
  return MEMORY[0x270F5FCB0]();
}

uint64_t sub_249252A70()
{
  return MEMORY[0x270F5FCB8]();
}

uint64_t sub_249252A80()
{
  return MEMORY[0x270F5FCC0]();
}

uint64_t sub_249252A90()
{
  return MEMORY[0x270F5FCC8]();
}

uint64_t sub_249252AA0()
{
  return MEMORY[0x270F5FCF0]();
}

uint64_t sub_249252AB0()
{
  return MEMORY[0x270F5FCF8]();
}

uint64_t sub_249252AC0()
{
  return MEMORY[0x270F5FD00]();
}

uint64_t sub_249252AD0()
{
  return MEMORY[0x270F5FD08]();
}

uint64_t sub_249252AE0()
{
  return MEMORY[0x270F5FD20]();
}

uint64_t sub_249252AF0()
{
  return MEMORY[0x270F5FD30]();
}

uint64_t sub_249252B00()
{
  return MEMORY[0x270F5FD38]();
}

uint64_t sub_249252B10()
{
  return MEMORY[0x270F5FD40]();
}

uint64_t sub_249252B20()
{
  return MEMORY[0x270F5FD48]();
}

uint64_t sub_249252B30()
{
  return MEMORY[0x270F5FD80]();
}

uint64_t sub_249252B40()
{
  return MEMORY[0x270F5FD88]();
}

uint64_t sub_249252B50()
{
  return MEMORY[0x270F5FD90]();
}

uint64_t sub_249252B60()
{
  return MEMORY[0x270F5FD98]();
}

uint64_t sub_249252B70()
{
  return MEMORY[0x270F5FE00]();
}

uint64_t sub_249252B80()
{
  return MEMORY[0x270F5FE08]();
}

uint64_t sub_249252B90()
{
  return MEMORY[0x270F5FE10]();
}

uint64_t sub_249252BA0()
{
  return MEMORY[0x270F5FE18]();
}

uint64_t sub_249252BB0()
{
  return MEMORY[0x270F5FE20]();
}

uint64_t sub_249252BC0()
{
  return MEMORY[0x270F5FE28]();
}

uint64_t sub_249252BD0()
{
  return MEMORY[0x270F5FE38]();
}

uint64_t sub_249252BE0()
{
  return MEMORY[0x270F5FE40]();
}

uint64_t sub_249252BF0()
{
  return MEMORY[0x270F5FE48]();
}

uint64_t sub_249252C00()
{
  return MEMORY[0x270F5FE58]();
}

uint64_t sub_249252C10()
{
  return MEMORY[0x270F5FE78]();
}

uint64_t sub_249252C20()
{
  return MEMORY[0x270F5FE80]();
}

uint64_t sub_249252C30()
{
  return MEMORY[0x270F5FE88]();
}

uint64_t sub_249252C40()
{
  return MEMORY[0x270F5FE90]();
}

uint64_t sub_249252C50()
{
  return MEMORY[0x270F5FEC0]();
}

uint64_t sub_249252C60()
{
  return MEMORY[0x270F5FEC8]();
}

uint64_t sub_249252C70()
{
  return MEMORY[0x270F5FED0]();
}

uint64_t sub_249252C80()
{
  return MEMORY[0x270F5FED8]();
}

uint64_t sub_249252C90()
{
  return MEMORY[0x270F5FEE8]();
}

uint64_t sub_249252CA0()
{
  return MEMORY[0x270F5FEF0]();
}

uint64_t sub_249252CB0()
{
  return MEMORY[0x270F5FEF8]();
}

uint64_t sub_249252CC0()
{
  return MEMORY[0x270F5FF08]();
}

uint64_t sub_249252CD0()
{
  return MEMORY[0x270F5FF10]();
}

uint64_t sub_249252CE0()
{
  return MEMORY[0x270F5FF18]();
}

uint64_t sub_249252CF0()
{
  return MEMORY[0x270F5FF20]();
}

uint64_t sub_249252D00()
{
  return MEMORY[0x270F5FF28]();
}

uint64_t sub_249252D10()
{
  return MEMORY[0x270F5FF30]();
}

uint64_t sub_249252D20()
{
  return MEMORY[0x270F5FF38]();
}

uint64_t sub_249252D30()
{
  return MEMORY[0x270F5FF40]();
}

uint64_t sub_249252D40()
{
  return MEMORY[0x270F5FF50]();
}

uint64_t sub_249252D50()
{
  return MEMORY[0x270F5FF68]();
}

uint64_t sub_249252D60()
{
  return MEMORY[0x270F621D0]();
}

uint64_t sub_249252D70()
{
  return MEMORY[0x270F5FFB0]();
}

uint64_t sub_249252D80()
{
  return MEMORY[0x270F5FFB8]();
}

uint64_t sub_249252D90()
{
  return MEMORY[0x270F5FFD0]();
}

uint64_t sub_249252DA0()
{
  return MEMORY[0x270F5FFE8]();
}

uint64_t sub_249252DB0()
{
  return MEMORY[0x270F5FFF0]();
}

uint64_t sub_249252DC0()
{
  return MEMORY[0x270F621D8]();
}

uint64_t sub_249252DD0()
{
  return MEMORY[0x270F60018]();
}

uint64_t sub_249252DE0()
{
  return MEMORY[0x270F60020]();
}

uint64_t sub_249252DF0()
{
  return MEMORY[0x270F60028]();
}

uint64_t sub_249252E00()
{
  return MEMORY[0x270F60030]();
}

uint64_t sub_249252E10()
{
  return MEMORY[0x270F60038]();
}

uint64_t sub_249252E20()
{
  return MEMORY[0x270F60040]();
}

uint64_t sub_249252E30()
{
  return MEMORY[0x270F60048]();
}

uint64_t sub_249252E40()
{
  return MEMORY[0x270F60050]();
}

uint64_t sub_249252E50()
{
  return MEMORY[0x270F60060]();
}

uint64_t sub_249252E60()
{
  return MEMORY[0x270F60068]();
}

uint64_t sub_249252E70()
{
  return MEMORY[0x270F600B0]();
}

uint64_t sub_249252E80()
{
  return MEMORY[0x270F600B8]();
}

uint64_t sub_249252E90()
{
  return MEMORY[0x270F600D0]();
}

uint64_t sub_249252EA0()
{
  return MEMORY[0x270F600D8]();
}

uint64_t sub_249252EB0()
{
  return MEMORY[0x270F600E0]();
}

uint64_t sub_249252EC0()
{
  return MEMORY[0x270F600F8]();
}

uint64_t sub_249252ED0()
{
  return MEMORY[0x270F60100]();
}

uint64_t sub_249252EE0()
{
  return MEMORY[0x270F60110]();
}

uint64_t sub_249252EF0()
{
  return MEMORY[0x270F60118]();
}

uint64_t sub_249252F00()
{
  return MEMORY[0x270F60120]();
}

uint64_t sub_249252F10()
{
  return MEMORY[0x270F60128]();
}

uint64_t sub_249252F20()
{
  return MEMORY[0x270F60130]();
}

uint64_t sub_249252F30()
{
  return MEMORY[0x270F60138]();
}

uint64_t sub_249252F40()
{
  return MEMORY[0x270F60140]();
}

uint64_t sub_249252F50()
{
  return MEMORY[0x270F60148]();
}

uint64_t sub_249252F60()
{
  return MEMORY[0x270F60150]();
}

uint64_t sub_249252F70()
{
  return MEMORY[0x270F60158]();
}

uint64_t sub_249252F80()
{
  return MEMORY[0x270F60160]();
}

uint64_t sub_249252F90()
{
  return MEMORY[0x270F60168]();
}

uint64_t sub_249252FA0()
{
  return MEMORY[0x270F60170]();
}

uint64_t sub_249252FB0()
{
  return MEMORY[0x270F60188]();
}

uint64_t sub_249252FC0()
{
  return MEMORY[0x270F60190]();
}

uint64_t sub_249252FD0()
{
  return MEMORY[0x270F601E8]();
}

uint64_t sub_249252FE0()
{
  return MEMORY[0x270F601F0]();
}

uint64_t sub_249252FF0()
{
  return MEMORY[0x270F60200]();
}

uint64_t sub_249253000()
{
  return MEMORY[0x270F60210]();
}

uint64_t sub_249253010()
{
  return MEMORY[0x270F60218]();
}

uint64_t sub_249253020()
{
  return MEMORY[0x270F60220]();
}

uint64_t sub_249253030()
{
  return MEMORY[0x270F60228]();
}

uint64_t sub_249253040()
{
  return MEMORY[0x270F60270]();
}

uint64_t sub_249253050()
{
  return MEMORY[0x270F60280]();
}

uint64_t sub_249253060()
{
  return MEMORY[0x270F60290]();
}

uint64_t sub_249253070()
{
  return MEMORY[0x270F602A8]();
}

uint64_t sub_249253080()
{
  return MEMORY[0x270F602B0]();
}

uint64_t sub_249253090()
{
  return MEMORY[0x270F602B8]();
}

uint64_t sub_2492530A0()
{
  return MEMORY[0x270F602C0]();
}

uint64_t sub_2492530B0()
{
  return MEMORY[0x270F602C8]();
}

uint64_t sub_2492530C0()
{
  return MEMORY[0x270F602E8]();
}

uint64_t sub_2492530D0()
{
  return MEMORY[0x270F602F0]();
}

uint64_t sub_2492530E0()
{
  return MEMORY[0x270F602F8]();
}

uint64_t sub_2492530F0()
{
  return MEMORY[0x270F60300]();
}

uint64_t sub_249253100()
{
  return MEMORY[0x270F60308]();
}

uint64_t sub_249253110()
{
  return MEMORY[0x270F60310]();
}

uint64_t sub_249253120()
{
  return MEMORY[0x270F60318]();
}

uint64_t sub_249253130()
{
  return MEMORY[0x270F60320]();
}

uint64_t sub_249253140()
{
  return MEMORY[0x270F60328]();
}

uint64_t sub_249253150()
{
  return MEMORY[0x270F60330]();
}

uint64_t sub_249253160()
{
  return MEMORY[0x270F60340]();
}

uint64_t sub_249253170()
{
  return MEMORY[0x270F60348]();
}

uint64_t sub_249253180()
{
  return MEMORY[0x270F60358]();
}

uint64_t sub_249253190()
{
  return MEMORY[0x270F60360]();
}

uint64_t sub_2492531A0()
{
  return MEMORY[0x270F60370]();
}

uint64_t sub_2492531B0()
{
  return MEMORY[0x270F603A0]();
}

uint64_t sub_2492531C0()
{
  return MEMORY[0x270F603B8]();
}

uint64_t sub_2492531D0()
{
  return MEMORY[0x270F603C0]();
}

uint64_t sub_2492531E0()
{
  return MEMORY[0x270F603C8]();
}

uint64_t sub_2492531F0()
{
  return MEMORY[0x270F603D0]();
}

uint64_t sub_249253200()
{
  return MEMORY[0x270F603D8]();
}

uint64_t sub_249253210()
{
  return MEMORY[0x270F603E0]();
}

uint64_t sub_249253220()
{
  return MEMORY[0x270F603F8]();
}

uint64_t sub_249253230()
{
  return MEMORY[0x270F60408]();
}

uint64_t sub_249253240()
{
  return MEMORY[0x270F60410]();
}

uint64_t sub_249253250()
{
  return MEMORY[0x270F60448]();
}

uint64_t sub_249253260()
{
  return MEMORY[0x270F60450]();
}

uint64_t sub_249253270()
{
  return MEMORY[0x270F60458]();
}

uint64_t sub_249253280()
{
  return MEMORY[0x270F60460]();
}

uint64_t sub_249253290()
{
  return MEMORY[0x270F60468]();
}

uint64_t sub_2492532A0()
{
  return MEMORY[0x270F60470]();
}

uint64_t sub_2492532B0()
{
  return MEMORY[0x270F60480]();
}

uint64_t sub_2492532C0()
{
  return MEMORY[0x270F5D2A0]();
}

uint64_t sub_2492532D0()
{
  return MEMORY[0x270F60490]();
}

uint64_t sub_2492532E0()
{
  return MEMORY[0x270F604A0]();
}

uint64_t sub_2492532F0()
{
  return MEMORY[0x270F604A8]();
}

uint64_t sub_249253300()
{
  return MEMORY[0x270F604B0]();
}

uint64_t sub_249253310()
{
  return MEMORY[0x270F604B8]();
}

uint64_t sub_249253320()
{
  return MEMORY[0x270F604C0]();
}

uint64_t sub_249253330()
{
  return MEMORY[0x270F604C8]();
}

uint64_t sub_249253340()
{
  return MEMORY[0x270F604D0]();
}

uint64_t sub_249253350()
{
  return MEMORY[0x270F604E8]();
}

uint64_t sub_249253360()
{
  return MEMORY[0x270F60510]();
}

uint64_t sub_249253370()
{
  return MEMORY[0x270F60548]();
}

uint64_t sub_249253380()
{
  return MEMORY[0x270F60568]();
}

uint64_t sub_249253390()
{
  return MEMORY[0x270F60570]();
}

uint64_t sub_2492533A0()
{
  return MEMORY[0x270F60578]();
}

uint64_t sub_2492533B0()
{
  return MEMORY[0x270F60580]();
}

uint64_t sub_2492533C0()
{
  return MEMORY[0x270F60588]();
}

uint64_t sub_2492533D0()
{
  return MEMORY[0x270F60590]();
}

uint64_t sub_2492533E0()
{
  return MEMORY[0x270F605A0]();
}

uint64_t sub_2492533F0()
{
  return MEMORY[0x270F605A8]();
}

uint64_t sub_249253400()
{
  return MEMORY[0x270F605B0]();
}

uint64_t sub_249253410()
{
  return MEMORY[0x270F605B8]();
}

uint64_t sub_249253420()
{
  return MEMORY[0x270F605C0]();
}

uint64_t sub_249253430()
{
  return MEMORY[0x270F605C8]();
}

uint64_t sub_249253440()
{
  return MEMORY[0x270F605D0]();
}

uint64_t sub_249253450()
{
  return MEMORY[0x270F605D8]();
}

uint64_t sub_249253460()
{
  return MEMORY[0x270F605E0]();
}

uint64_t sub_249253470()
{
  return MEMORY[0x270F605E8]();
}

uint64_t sub_249253480()
{
  return MEMORY[0x270F605F0]();
}

uint64_t sub_249253490()
{
  return MEMORY[0x270F605F8]();
}

uint64_t sub_2492534A0()
{
  return MEMORY[0x270F60600]();
}

uint64_t sub_2492534B0()
{
  return MEMORY[0x270F60608]();
}

uint64_t sub_2492534C0()
{
  return MEMORY[0x270F60610]();
}

uint64_t sub_2492534D0()
{
  return MEMORY[0x270F60620]();
}

uint64_t sub_2492534E0()
{
  return MEMORY[0x270F60628]();
}

uint64_t sub_2492534F0()
{
  return MEMORY[0x270F60630]();
}

uint64_t sub_249253500()
{
  return MEMORY[0x270F60638]();
}

uint64_t sub_249253510()
{
  return MEMORY[0x270F60640]();
}

uint64_t sub_249253520()
{
  return MEMORY[0x270F60648]();
}

uint64_t sub_249253530()
{
  return MEMORY[0x270F60658]();
}

uint64_t sub_249253540()
{
  return MEMORY[0x270F60668]();
}

uint64_t sub_249253550()
{
  return MEMORY[0x270F60670]();
}

uint64_t sub_249253560()
{
  return MEMORY[0x270F60680]();
}

uint64_t sub_249253570()
{
  return MEMORY[0x270F60688]();
}

uint64_t sub_249253580()
{
  return MEMORY[0x270F60690]();
}

uint64_t sub_249253590()
{
  return MEMORY[0x270F60698]();
}

uint64_t sub_2492535A0()
{
  return MEMORY[0x270F606A0]();
}

uint64_t sub_2492535B0()
{
  return MEMORY[0x270F606A8]();
}

uint64_t sub_2492535C0()
{
  return MEMORY[0x270F606B0]();
}

uint64_t sub_2492535D0()
{
  return MEMORY[0x270F606B8]();
}

uint64_t sub_2492535E0()
{
  return MEMORY[0x270F606C8]();
}

uint64_t sub_2492535F0()
{
  return MEMORY[0x270F606D0]();
}

uint64_t sub_249253600()
{
  return MEMORY[0x270F606D8]();
}

uint64_t sub_249253610()
{
  return MEMORY[0x270F60738]();
}

uint64_t sub_249253620()
{
  return MEMORY[0x270F60740]();
}

uint64_t sub_249253630()
{
  return MEMORY[0x270F60748]();
}

uint64_t sub_249253640()
{
  return MEMORY[0x270F60770]();
}

uint64_t sub_249253650()
{
  return MEMORY[0x270F60780]();
}

uint64_t sub_249253660()
{
  return MEMORY[0x270F60788]();
}

uint64_t sub_249253670()
{
  return MEMORY[0x270F60790]();
}

uint64_t sub_249253680()
{
  return MEMORY[0x270F607A0]();
}

uint64_t sub_249253690()
{
  return MEMORY[0x270F607A8]();
}

uint64_t sub_2492536A0()
{
  return MEMORY[0x270F607B0]();
}

uint64_t sub_2492536B0()
{
  return MEMORY[0x270F607B8]();
}

uint64_t sub_2492536C0()
{
  return MEMORY[0x270F607C0]();
}

uint64_t sub_2492536D0()
{
  return MEMORY[0x270F607D8]();
}

uint64_t sub_2492536E0()
{
  return MEMORY[0x270F607E0]();
}

uint64_t sub_2492536F0()
{
  return MEMORY[0x270F607E8]();
}

uint64_t sub_249253700()
{
  return MEMORY[0x270F607F0]();
}

uint64_t sub_249253710()
{
  return MEMORY[0x270F60800]();
}

uint64_t sub_249253720()
{
  return MEMORY[0x270F60808]();
}

uint64_t sub_249253730()
{
  return MEMORY[0x270F60818]();
}

uint64_t sub_249253740()
{
  return MEMORY[0x270F60868]();
}

uint64_t sub_249253750()
{
  return MEMORY[0x270F608F8]();
}

uint64_t sub_249253760()
{
  return MEMORY[0x270F60918]();
}

uint64_t sub_249253770()
{
  return MEMORY[0x270F60920]();
}

uint64_t sub_249253780()
{
  return MEMORY[0x270F60928]();
}

uint64_t sub_249253790()
{
  return MEMORY[0x270F60938]();
}

uint64_t sub_2492537A0()
{
  return MEMORY[0x270F60940]();
}

uint64_t sub_2492537B0()
{
  return MEMORY[0x270F60948]();
}

uint64_t sub_2492537C0()
{
  return MEMORY[0x270F60958]();
}

uint64_t sub_2492537D0()
{
  return MEMORY[0x270F60968]();
}

uint64_t sub_2492537E0()
{
  return MEMORY[0x270F60970]();
}

uint64_t sub_2492537F0()
{
  return MEMORY[0x270F60978]();
}

uint64_t sub_249253800()
{
  return MEMORY[0x270F60988]();
}

uint64_t sub_249253810()
{
  return MEMORY[0x270F60990]();
}

uint64_t sub_249253820()
{
  return MEMORY[0x270F60998]();
}

uint64_t sub_249253830()
{
  return MEMORY[0x270F609E0]();
}

uint64_t sub_249253840()
{
  return MEMORY[0x270F609F0]();
}

uint64_t sub_249253850()
{
  return MEMORY[0x270F609F8]();
}

uint64_t sub_249253860()
{
  return MEMORY[0x270F60A08]();
}

uint64_t sub_249253870()
{
  return MEMORY[0x270F60A58]();
}

uint64_t sub_249253880()
{
  return MEMORY[0x270F60A60]();
}

uint64_t sub_249253890()
{
  return MEMORY[0x270F60A68]();
}

uint64_t sub_2492538A0()
{
  return MEMORY[0x270F60A78]();
}

uint64_t sub_2492538B0()
{
  return MEMORY[0x270F60A80]();
}

uint64_t sub_2492538C0()
{
  return MEMORY[0x270F5D2A8]();
}

uint64_t sub_2492538D0()
{
  return MEMORY[0x270F60A90]();
}

uint64_t sub_2492538E0()
{
  return MEMORY[0x270F60A98]();
}

uint64_t sub_2492538F0()
{
  return MEMORY[0x270F60AA0]();
}

uint64_t sub_249253900()
{
  return MEMORY[0x270F60AA8]();
}

uint64_t sub_249253910()
{
  return MEMORY[0x270F60AB0]();
}

uint64_t sub_249253920()
{
  return MEMORY[0x270F60AE0]();
}

uint64_t sub_249253930()
{
  return MEMORY[0x270F60AE8]();
}

uint64_t sub_249253940()
{
  return MEMORY[0x270F60B08]();
}

uint64_t sub_249253950()
{
  return MEMORY[0x270F60B18]();
}

uint64_t sub_249253960()
{
  return MEMORY[0x270F60B20]();
}

uint64_t sub_249253970()
{
  return MEMORY[0x270F60B48]();
}

uint64_t sub_249253980()
{
  return MEMORY[0x270F60B50]();
}

uint64_t sub_249253990()
{
  return MEMORY[0x270F60B58]();
}

uint64_t sub_2492539A0()
{
  return MEMORY[0x270F60B60]();
}

uint64_t sub_2492539B0()
{
  return MEMORY[0x270F60B68]();
}

uint64_t sub_2492539C0()
{
  return MEMORY[0x270F60BD0]();
}

uint64_t sub_2492539D0()
{
  return MEMORY[0x270F60BF0]();
}

uint64_t sub_2492539E0()
{
  return MEMORY[0x270F60C48]();
}

uint64_t sub_2492539F0()
{
  return MEMORY[0x270F60C50]();
}

uint64_t sub_249253A00()
{
  return MEMORY[0x270F60C80]();
}

uint64_t sub_249253A10()
{
  return MEMORY[0x270F60C88]();
}

uint64_t sub_249253A20()
{
  return MEMORY[0x270F60CE0]();
}

uint64_t sub_249253A30()
{
  return MEMORY[0x270F60CF8]();
}

uint64_t sub_249253A40()
{
  return MEMORY[0x270F60D08]();
}

uint64_t sub_249253A50()
{
  return MEMORY[0x270F60D10]();
}

uint64_t sub_249253A60()
{
  return MEMORY[0x270F5D2B0]();
}

uint64_t sub_249253A70()
{
  return MEMORY[0x270F60D18]();
}

uint64_t sub_249253A80()
{
  return MEMORY[0x270F60D20]();
}

uint64_t sub_249253A90()
{
  return MEMORY[0x270F60D28]();
}

uint64_t sub_249253AA0()
{
  return MEMORY[0x270F60D30]();
}

uint64_t sub_249253AB0()
{
  return MEMORY[0x270F60D78]();
}

uint64_t sub_249253AC0()
{
  return MEMORY[0x270F60D80]();
}

uint64_t sub_249253AD0()
{
  return MEMORY[0x270F60D88]();
}

uint64_t sub_249253AE0()
{
  return MEMORY[0x270F60D90]();
}

uint64_t sub_249253AF0()
{
  return MEMORY[0x270F60E00]();
}

uint64_t sub_249253B00()
{
  return MEMORY[0x270F60E28]();
}

uint64_t sub_249253B10()
{
  return MEMORY[0x270F60E30]();
}

uint64_t sub_249253B20()
{
  return MEMORY[0x270F60E38]();
}

uint64_t sub_249253B30()
{
  return MEMORY[0x270F60E40]();
}

uint64_t sub_249253B40()
{
  return MEMORY[0x270F60E50]();
}

uint64_t sub_249253B50()
{
  return MEMORY[0x270F60E58]();
}

uint64_t sub_249253B60()
{
  return MEMORY[0x270F60E60]();
}

uint64_t sub_249253B70()
{
  return MEMORY[0x270F60E68]();
}

uint64_t sub_249253B80()
{
  return MEMORY[0x270F60E78]();
}

uint64_t sub_249253B90()
{
  return MEMORY[0x270F60E80]();
}

uint64_t sub_249253BA0()
{
  return MEMORY[0x270F60E88]();
}

uint64_t sub_249253BB0()
{
  return MEMORY[0x270F60E90]();
}

uint64_t sub_249253BC0()
{
  return MEMORY[0x270F60E98]();
}

uint64_t sub_249253BD0()
{
  return MEMORY[0x270F60EB8]();
}

uint64_t sub_249253BE0()
{
  return MEMORY[0x270F60EC0]();
}

uint64_t sub_249253BF0()
{
  return MEMORY[0x270F60F18]();
}

uint64_t sub_249253C00()
{
  return MEMORY[0x270F60F20]();
}

uint64_t sub_249253C10()
{
  return MEMORY[0x270F60F28]();
}

uint64_t sub_249253C20()
{
  return MEMORY[0x270F60F30]();
}

uint64_t sub_249253C30()
{
  return MEMORY[0x270F60F38]();
}

uint64_t sub_249253C40()
{
  return MEMORY[0x270F60F40]();
}

uint64_t sub_249253C50()
{
  return MEMORY[0x270F60F48]();
}

uint64_t sub_249253C60()
{
  return MEMORY[0x270F60F50]();
}

uint64_t sub_249253C70()
{
  return MEMORY[0x270F60F58]();
}

uint64_t sub_249253C80()
{
  return MEMORY[0x270F60F60]();
}

uint64_t sub_249253C90()
{
  return MEMORY[0x270F60F68]();
}

uint64_t sub_249253CA0()
{
  return MEMORY[0x270F60F80]();
}

uint64_t sub_249253CB0()
{
  return MEMORY[0x270F60F88]();
}

uint64_t sub_249253CC0()
{
  return MEMORY[0x270F60F90]();
}

uint64_t sub_249253CD0()
{
  return MEMORY[0x270F60F98]();
}

uint64_t sub_249253CE0()
{
  return MEMORY[0x270F60FE0]();
}

uint64_t sub_249253CF0()
{
  return MEMORY[0x270F60FE8]();
}

uint64_t sub_249253D00()
{
  return MEMORY[0x270F61000]();
}

uint64_t sub_249253D10()
{
  return MEMORY[0x270F61010]();
}

uint64_t sub_249253D20()
{
  return MEMORY[0x270F61018]();
}

uint64_t sub_249253D30()
{
  return MEMORY[0x270F61038]();
}

uint64_t sub_249253D40()
{
  return MEMORY[0x270F61040]();
}

uint64_t sub_249253D50()
{
  return MEMORY[0x270F61058]();
}

uint64_t sub_249253D60()
{
  return MEMORY[0x270F610C0]();
}

uint64_t sub_249253D70()
{
  return MEMORY[0x270F610D8]();
}

uint64_t sub_249253D80()
{
  return MEMORY[0x270F61168]();
}

uint64_t sub_249253D90()
{
  return MEMORY[0x270F61180]();
}

uint64_t sub_249253DA0()
{
  return MEMORY[0x270F611D0]();
}

uint64_t sub_249253DB0()
{
  return MEMORY[0x270F611E8]();
}

uint64_t sub_249253DC0()
{
  return MEMORY[0x270F611F8]();
}

uint64_t sub_249253DD0()
{
  return MEMORY[0x270F61218]();
}

uint64_t sub_249253DE0()
{
  return MEMORY[0x270F61220]();
}

uint64_t sub_249253DF0()
{
  return MEMORY[0x270F61228]();
}

uint64_t sub_249253E00()
{
  return MEMORY[0x270F61230]();
}

uint64_t sub_249253E10()
{
  return MEMORY[0x270F61248]();
}

uint64_t sub_249253E20()
{
  return MEMORY[0x270F61250]();
}

uint64_t sub_249253E30()
{
  return MEMORY[0x270F61258]();
}

uint64_t sub_249253E40()
{
  return MEMORY[0x270F61260]();
}

uint64_t sub_249253E50()
{
  return MEMORY[0x270F61268]();
}

uint64_t sub_249253E60()
{
  return MEMORY[0x270F61270]();
}

uint64_t sub_249253E70()
{
  return MEMORY[0x270F61278]();
}

uint64_t sub_249253E80()
{
  return MEMORY[0x270F61280]();
}

uint64_t sub_249253E90()
{
  return MEMORY[0x270F61298]();
}

uint64_t sub_249253EA0()
{
  return MEMORY[0x270F612A0]();
}

uint64_t sub_249253EB0()
{
  return MEMORY[0x270F612A8]();
}

uint64_t sub_249253EC0()
{
  return MEMORY[0x270F612B0]();
}

uint64_t sub_249253ED0()
{
  return MEMORY[0x270F612B8]();
}

uint64_t sub_249253EE0()
{
  return MEMORY[0x270F612C0]();
}

uint64_t sub_249253EF0()
{
  return MEMORY[0x270F612C8]();
}

uint64_t sub_249253F00()
{
  return MEMORY[0x270F612D0]();
}

uint64_t sub_249253F10()
{
  return MEMORY[0x270F612D8]();
}

uint64_t sub_249253F20()
{
  return MEMORY[0x270F612E0]();
}

uint64_t sub_249253F30()
{
  return MEMORY[0x270F612E8]();
}

uint64_t sub_249253F40()
{
  return MEMORY[0x270F612F0]();
}

uint64_t sub_249253F50()
{
  return MEMORY[0x270F612F8]();
}

uint64_t sub_249253F60()
{
  return MEMORY[0x270F61300]();
}

uint64_t sub_249253F70()
{
  return MEMORY[0x270F61328]();
}

uint64_t sub_249253F80()
{
  return MEMORY[0x270F62CB0]();
}

uint64_t sub_249253F90()
{
  return MEMORY[0x270F621E0]();
}

uint64_t sub_249253FA0()
{
  return MEMORY[0x270F61330]();
}

uint64_t sub_249253FB0()
{
  return MEMORY[0x270F61338]();
}

uint64_t sub_249253FC0()
{
  return MEMORY[0x270F61380]();
}

uint64_t sub_249253FD0()
{
  return MEMORY[0x270F61388]();
}

uint64_t sub_249253FE0()
{
  return MEMORY[0x270F613A8]();
}

uint64_t sub_249253FF0()
{
  return MEMORY[0x270F613B0]();
}

uint64_t sub_249254000()
{
  return MEMORY[0x270F613B8]();
}

uint64_t sub_249254010()
{
  return MEMORY[0x270F61498]();
}

uint64_t sub_249254020()
{
  return MEMORY[0x270F614A0]();
}

uint64_t sub_249254030()
{
  return MEMORY[0x270F614A8]();
}

uint64_t sub_249254040()
{
  return MEMORY[0x270F614B0]();
}

uint64_t sub_249254050()
{
  return MEMORY[0x270F614B8]();
}

uint64_t sub_249254060()
{
  return MEMORY[0x270F614C8]();
}

uint64_t sub_249254070()
{
  return MEMORY[0x270F614F0]();
}

uint64_t sub_249254080()
{
  return MEMORY[0x270F614F8]();
}

uint64_t sub_249254090()
{
  return MEMORY[0x270F61500]();
}

uint64_t sub_2492540A0()
{
  return MEMORY[0x270F61520]();
}

uint64_t sub_2492540B0()
{
  return MEMORY[0x270F61538]();
}

uint64_t sub_2492540C0()
{
  return MEMORY[0x270F615D8]();
}

uint64_t sub_2492540D0()
{
  return MEMORY[0x270F615E0]();
}

uint64_t sub_2492540E0()
{
  return MEMORY[0x270F61628]();
}

uint64_t sub_2492540F0()
{
  return MEMORY[0x270F61630]();
}

uint64_t sub_249254100()
{
  return MEMORY[0x270F61638]();
}

uint64_t sub_249254110()
{
  return MEMORY[0x270F62CB8]();
}

uint64_t sub_249254120()
{
  return MEMORY[0x270F61640]();
}

uint64_t sub_249254130()
{
  return MEMORY[0x270F61658]();
}

uint64_t sub_249254140()
{
  return MEMORY[0x270F616A0]();
}

uint64_t sub_249254150()
{
  return MEMORY[0x270F616A8]();
}

uint64_t sub_249254160()
{
  return MEMORY[0x270F616B0]();
}

uint64_t sub_249254170()
{
  return MEMORY[0x270F616C8]();
}

uint64_t sub_249254180()
{
  return MEMORY[0x270F616D0]();
}

uint64_t sub_249254190()
{
  return MEMORY[0x270F616D8]();
}

uint64_t sub_2492541A0()
{
  return MEMORY[0x270F616E0]();
}

uint64_t sub_2492541B0()
{
  return MEMORY[0x270F616F0]();
}

uint64_t sub_2492541C0()
{
  return MEMORY[0x270F616F8]();
}

uint64_t sub_2492541D0()
{
  return MEMORY[0x270F61700]();
}

uint64_t sub_2492541E0()
{
  return MEMORY[0x270F61708]();
}

uint64_t sub_2492541F0()
{
  return MEMORY[0x270F61718]();
}

uint64_t sub_249254200()
{
  return MEMORY[0x270F61730]();
}

uint64_t sub_249254210()
{
  return MEMORY[0x270F61738]();
}

uint64_t sub_249254220()
{
  return MEMORY[0x270F61740]();
}

uint64_t sub_249254230()
{
  return MEMORY[0x270F61748]();
}

uint64_t sub_249254240()
{
  return MEMORY[0x270F61750]();
}

uint64_t sub_249254250()
{
  return MEMORY[0x270F61758]();
}

uint64_t sub_249254260()
{
  return MEMORY[0x270F61768]();
}

uint64_t sub_249254270()
{
  return MEMORY[0x270F61778]();
}

uint64_t sub_249254280()
{
  return MEMORY[0x270F61790]();
}

uint64_t sub_249254290()
{
  return MEMORY[0x270F61798]();
}

uint64_t sub_2492542A0()
{
  return MEMORY[0x270F617A8]();
}

uint64_t sub_2492542B0()
{
  return MEMORY[0x270F617B0]();
}

uint64_t sub_2492542C0()
{
  return MEMORY[0x270F617B8]();
}

uint64_t sub_2492542D0()
{
  return MEMORY[0x270F617C0]();
}

uint64_t sub_2492542E0()
{
  return MEMORY[0x270F617D0]();
}

uint64_t sub_2492542F0()
{
  return MEMORY[0x270F617E0]();
}

uint64_t sub_249254300()
{
  return MEMORY[0x270F617E8]();
}

uint64_t sub_249254310()
{
  return MEMORY[0x270F617F0]();
}

uint64_t sub_249254320()
{
  return MEMORY[0x270F617F8]();
}

uint64_t sub_249254330()
{
  return MEMORY[0x270F61800]();
}

uint64_t sub_249254340()
{
  return MEMORY[0x270F61808]();
}

uint64_t sub_249254350()
{
  return MEMORY[0x270F61810]();
}

uint64_t sub_249254360()
{
  return MEMORY[0x270F61818]();
}

uint64_t sub_249254370()
{
  return MEMORY[0x270F61820]();
}

uint64_t sub_249254380()
{
  return MEMORY[0x270F61828]();
}

uint64_t sub_249254390()
{
  return MEMORY[0x270F61830]();
}

uint64_t sub_2492543A0()
{
  return MEMORY[0x270F61848]();
}

uint64_t sub_2492543B0()
{
  return MEMORY[0x270F618A8]();
}

uint64_t sub_2492543C0()
{
  return MEMORY[0x270F61910]();
}

uint64_t sub_2492543D0()
{
  return MEMORY[0x270F61918]();
}

uint64_t sub_2492543E0()
{
  return MEMORY[0x270F61920]();
}

uint64_t sub_2492543F0()
{
  return MEMORY[0x270F61928]();
}

uint64_t sub_249254400()
{
  return MEMORY[0x270F61930]();
}

uint64_t sub_249254410()
{
  return MEMORY[0x270F61938]();
}

uint64_t sub_249254420()
{
  return MEMORY[0x270F61940]();
}

uint64_t sub_249254430()
{
  return MEMORY[0x270F61948]();
}

uint64_t sub_249254440()
{
  return MEMORY[0x270F61950]();
}

uint64_t sub_249254450()
{
  return MEMORY[0x270F61958]();
}

uint64_t sub_249254460()
{
  return MEMORY[0x270F61998]();
}

uint64_t sub_249254470()
{
  return MEMORY[0x270F619A0]();
}

uint64_t sub_249254480()
{
  return MEMORY[0x270F619C0]();
}

uint64_t sub_249254490()
{
  return MEMORY[0x270F619D8]();
}

uint64_t sub_2492544A0()
{
  return MEMORY[0x270F619E0]();
}

uint64_t sub_2492544B0()
{
  return MEMORY[0x270F619E8]();
}

uint64_t sub_2492544C0()
{
  return MEMORY[0x270F619F0]();
}

uint64_t sub_2492544D0()
{
  return MEMORY[0x270F619F8]();
}

uint64_t sub_2492544E0()
{
  return MEMORY[0x270F61A00]();
}

uint64_t sub_2492544F0()
{
  return MEMORY[0x270F61A08]();
}

uint64_t sub_249254500()
{
  return MEMORY[0x270F61A10]();
}

uint64_t sub_249254510()
{
  return MEMORY[0x270F61A18]();
}

uint64_t sub_249254520()
{
  return MEMORY[0x270F61A28]();
}

uint64_t sub_249254530()
{
  return MEMORY[0x270F61A30]();
}

uint64_t sub_249254540()
{
  return MEMORY[0x270F61A38]();
}

uint64_t sub_249254550()
{
  return MEMORY[0x270F61A40]();
}

uint64_t sub_249254560()
{
  return MEMORY[0x270F61A48]();
}

uint64_t sub_249254570()
{
  return MEMORY[0x270F61A58]();
}

uint64_t sub_249254580()
{
  return MEMORY[0x270F61A60]();
}

uint64_t sub_249254590()
{
  return MEMORY[0x270F61A68]();
}

uint64_t sub_2492545A0()
{
  return MEMORY[0x270F61A70]();
}

uint64_t sub_2492545B0()
{
  return MEMORY[0x270F61A78]();
}

uint64_t sub_2492545C0()
{
  return MEMORY[0x270F5D2F0]();
}

uint64_t sub_2492545D0()
{
  return MEMORY[0x270F61A80]();
}

uint64_t sub_2492545E0()
{
  return MEMORY[0x270F61A98]();
}

uint64_t sub_2492545F0()
{
  return MEMORY[0x270F61AA0]();
}

uint64_t sub_249254600()
{
  return MEMORY[0x270F61AA8]();
}

uint64_t sub_249254610()
{
  return MEMORY[0x270F61AC0]();
}

uint64_t sub_249254620()
{
  return MEMORY[0x270F61AC8]();
}

uint64_t sub_249254630()
{
  return MEMORY[0x270F61AD0]();
}

uint64_t sub_249254640()
{
  return MEMORY[0x270F61AF8]();
}

uint64_t sub_249254650()
{
  return MEMORY[0x270F61B00]();
}

uint64_t sub_249254660()
{
  return MEMORY[0x270F61B20]();
}

uint64_t sub_249254670()
{
  return MEMORY[0x270F61B28]();
}

uint64_t sub_249254680()
{
  return MEMORY[0x270F61B30]();
}

uint64_t sub_249254690()
{
  return MEMORY[0x270F61B38]();
}

uint64_t sub_2492546A0()
{
  return MEMORY[0x270F61B70]();
}

uint64_t sub_2492546B0()
{
  return MEMORY[0x270F61B78]();
}

uint64_t sub_2492546C0()
{
  return MEMORY[0x270F61B80]();
}

uint64_t sub_2492546D0()
{
  return MEMORY[0x270F61BC0]();
}

uint64_t sub_2492546E0()
{
  return MEMORY[0x270F61BE8]();
}

uint64_t sub_2492546F0()
{
  return MEMORY[0x270F61CE0]();
}

uint64_t sub_249254700()
{
  return MEMORY[0x270F61D08]();
}

uint64_t sub_249254710()
{
  return MEMORY[0x270F61D10]();
}

uint64_t sub_249254720()
{
  return MEMORY[0x270F61D18]();
}

uint64_t sub_249254730()
{
  return MEMORY[0x270F61D28]();
}

uint64_t sub_249254740()
{
  return MEMORY[0x270F61D30]();
}

uint64_t sub_249254750()
{
  return MEMORY[0x270F61D38]();
}

uint64_t sub_249254760()
{
  return MEMORY[0x270F61D48]();
}

uint64_t sub_249254770()
{
  return MEMORY[0x270F61D50]();
}

uint64_t sub_249254780()
{
  return MEMORY[0x270F61D58]();
}

uint64_t sub_249254790()
{
  return MEMORY[0x270F61D60]();
}

uint64_t sub_2492547A0()
{
  return MEMORY[0x270F61D68]();
}

uint64_t sub_2492547B0()
{
  return MEMORY[0x270F61E48]();
}

uint64_t sub_2492547C0()
{
  return MEMORY[0x270F61E50]();
}

uint64_t sub_2492547D0()
{
  return MEMORY[0x270F61E58]();
}

uint64_t sub_2492547E0()
{
  return MEMORY[0x270F61E68]();
}

uint64_t sub_2492547F0()
{
  return MEMORY[0x270F61E70]();
}

uint64_t sub_249254800()
{
  return MEMORY[0x270F61E78]();
}

uint64_t sub_249254810()
{
  return MEMORY[0x270F61E80]();
}

uint64_t sub_249254820()
{
  return MEMORY[0x270F61E90]();
}

uint64_t sub_249254830()
{
  return MEMORY[0x270F61EC8]();
}

uint64_t sub_249254840()
{
  return MEMORY[0x270F61EF0]();
}

uint64_t sub_249254850()
{
  return MEMORY[0x270F61EF8]();
}

uint64_t sub_249254860()
{
  return MEMORY[0x270F61F00]();
}

uint64_t sub_249254870()
{
  return MEMORY[0x270F61F08]();
}

uint64_t sub_249254880()
{
  return MEMORY[0x270F61F10]();
}

uint64_t sub_249254890()
{
  return MEMORY[0x270F61F18]();
}

uint64_t sub_2492548A0()
{
  return MEMORY[0x270F61F20]();
}

uint64_t sub_2492548B0()
{
  return MEMORY[0x270F61F28]();
}

uint64_t sub_2492548C0()
{
  return MEMORY[0x270F61F50]();
}

uint64_t sub_2492548D0()
{
  return MEMORY[0x270F5D370]();
}

uint64_t sub_2492548E0()
{
  return MEMORY[0x270F5D378]();
}

uint64_t sub_2492548F0()
{
  return MEMORY[0x270F5D390]();
}

uint64_t sub_249254900()
{
  return MEMORY[0x270F61F58]();
}

uint64_t sub_249254910()
{
  return MEMORY[0x270F61FC0]();
}

uint64_t sub_249254920()
{
  return MEMORY[0x270F61FC8]();
}

uint64_t sub_249254930()
{
  return MEMORY[0x270F61FD0]();
}

uint64_t sub_249254940()
{
  return MEMORY[0x270F61FD8]();
}

uint64_t sub_249254950()
{
  return MEMORY[0x270F61FE0]();
}

uint64_t sub_249254960()
{
  return MEMORY[0x270F61FE8]();
}

uint64_t sub_249254970()
{
  return MEMORY[0x270F61FF0]();
}

uint64_t sub_249254980()
{
  return MEMORY[0x270F61FF8]();
}

uint64_t sub_249254990()
{
  return MEMORY[0x270F62010]();
}

uint64_t sub_2492549A0()
{
  return MEMORY[0x270F62018]();
}

uint64_t sub_2492549B0()
{
  return MEMORY[0x270F62020]();
}

uint64_t sub_2492549C0()
{
  return MEMORY[0x270F62028]();
}

uint64_t sub_2492549D0()
{
  return MEMORY[0x270F62050]();
}

uint64_t sub_2492549E0()
{
  return MEMORY[0x270F62058]();
}

uint64_t sub_2492549F0()
{
  return MEMORY[0x270F62060]();
}

uint64_t sub_249254A00()
{
  return MEMORY[0x270F62078]();
}

uint64_t sub_249254A10()
{
  return MEMORY[0x270F62080]();
}

uint64_t sub_249254A20()
{
  return MEMORY[0x270F2A250]();
}

uint64_t sub_249254A30()
{
  return MEMORY[0x270F2A258]();
}

uint64_t sub_249254A40()
{
  return MEMORY[0x270F2A260]();
}

uint64_t sub_249254A50()
{
  return MEMORY[0x270F2A268]();
}

uint64_t sub_249254A60()
{
  return MEMORY[0x270F2A270]();
}

uint64_t sub_249254A70()
{
  return MEMORY[0x270F2A278]();
}

uint64_t sub_249254A80()
{
  return MEMORY[0x270F2A280]();
}

uint64_t sub_249254A90()
{
  return MEMORY[0x270F2A288]();
}

uint64_t sub_249254AA0()
{
  return MEMORY[0x270F2A290]();
}

uint64_t sub_249254AB0()
{
  return MEMORY[0x270F2A298]();
}

uint64_t sub_249254AC0()
{
  return MEMORY[0x270F2A2A0]();
}

uint64_t sub_249254AD0()
{
  return MEMORY[0x270F2A2A8]();
}

uint64_t sub_249254AE0()
{
  return MEMORY[0x270F2A2B0]();
}

uint64_t sub_249254AF0()
{
  return MEMORY[0x270F2A2B8]();
}

uint64_t sub_249254B00()
{
  return MEMORY[0x270F2A2C0]();
}

uint64_t sub_249254B10()
{
  return MEMORY[0x270F2A2C8]();
}

uint64_t sub_249254B20()
{
  return MEMORY[0x270F2A2D0]();
}

uint64_t sub_249254B30()
{
  return MEMORY[0x270F2A2D8]();
}

uint64_t sub_249254B40()
{
  return MEMORY[0x270F2A2E0]();
}

uint64_t sub_249254B50()
{
  return MEMORY[0x270F2A2E8]();
}

uint64_t sub_249254B60()
{
  return MEMORY[0x270F2A2F0]();
}

uint64_t sub_249254B70()
{
  return MEMORY[0x270F2A2F8]();
}

uint64_t sub_249254B80()
{
  return MEMORY[0x270F2A300]();
}

uint64_t sub_249254B90()
{
  return MEMORY[0x270F2A308]();
}

uint64_t sub_249254BA0()
{
  return MEMORY[0x270F2A310]();
}

uint64_t sub_249254BB0()
{
  return MEMORY[0x270F2A318]();
}

uint64_t sub_249254BC0()
{
  return MEMORY[0x270F2A320]();
}

uint64_t sub_249254BD0()
{
  return MEMORY[0x270F2A328]();
}

uint64_t sub_249254BE0()
{
  return MEMORY[0x270F2A330]();
}

uint64_t sub_249254BF0()
{
  return MEMORY[0x270F2A338]();
}

uint64_t sub_249254C00()
{
  return MEMORY[0x270F2A340]();
}

uint64_t sub_249254C10()
{
  return MEMORY[0x270F2A348]();
}

uint64_t sub_249254C20()
{
  return MEMORY[0x270F2A350]();
}

uint64_t sub_249254C30()
{
  return MEMORY[0x270F2A358]();
}

uint64_t sub_249254C40()
{
  return MEMORY[0x270F2A360]();
}

uint64_t sub_249254C50()
{
  return MEMORY[0x270F2A368]();
}

uint64_t sub_249254C60()
{
  return MEMORY[0x270F2A370]();
}

uint64_t sub_249254C70()
{
  return MEMORY[0x270F2A378]();
}

uint64_t sub_249254C80()
{
  return MEMORY[0x270F2A380]();
}

uint64_t sub_249254C90()
{
  return MEMORY[0x270F2A388]();
}

uint64_t sub_249254CA0()
{
  return MEMORY[0x270F2A390]();
}

uint64_t sub_249254CB0()
{
  return MEMORY[0x270FA1298]();
}

uint64_t sub_249254CC0()
{
  return MEMORY[0x270FA12A0]();
}

uint64_t sub_249254CD0()
{
  return MEMORY[0x270FA12A8]();
}

uint64_t sub_249254CE0()
{
  return MEMORY[0x270FA12B0]();
}

uint64_t sub_249254CF0()
{
  return MEMORY[0x270FA12B8]();
}

uint64_t sub_249254D00()
{
  return MEMORY[0x270FA12D0]();
}

uint64_t sub_249254D10()
{
  return MEMORY[0x270FA12D8]();
}

uint64_t sub_249254D20()
{
  return MEMORY[0x270FA12E0]();
}

uint64_t sub_249254D30()
{
  return MEMORY[0x270FA1310]();
}

uint64_t sub_249254D40()
{
  return MEMORY[0x270FA1318]();
}

uint64_t sub_249254D50()
{
  return MEMORY[0x270FA1320]();
}

uint64_t sub_249254D60()
{
  return MEMORY[0x270FA1328]();
}

uint64_t sub_249254D70()
{
  return MEMORY[0x270FA1330]();
}

uint64_t sub_249254D80()
{
  return MEMORY[0x270FA1340]();
}

uint64_t sub_249254D90()
{
  return MEMORY[0x270F62448]();
}

uint64_t sub_249254DA0()
{
  return MEMORY[0x270F62450]();
}

uint64_t sub_249254DB0()
{
  return MEMORY[0x270F62458]();
}

uint64_t sub_249254DC0()
{
  return MEMORY[0x270F62478]();
}

uint64_t sub_249254DD0()
{
  return MEMORY[0x270F62490]();
}

uint64_t sub_249254DE0()
{
  return MEMORY[0x270F624B0]();
}

uint64_t sub_249254DF0()
{
  return MEMORY[0x270F624B8]();
}

uint64_t sub_249254E00()
{
  return MEMORY[0x270F624C8]();
}

uint64_t sub_249254E10()
{
  return MEMORY[0x270F624D0]();
}

uint64_t sub_249254E20()
{
  return MEMORY[0x270F624D8]();
}

uint64_t sub_249254E30()
{
  return MEMORY[0x270F624E8]();
}

uint64_t sub_249254E40()
{
  return MEMORY[0x270F624F0]();
}

uint64_t sub_249254E50()
{
  return MEMORY[0x270F62528]();
}

uint64_t sub_249254E60()
{
  return MEMORY[0x270F625B8]();
}

uint64_t sub_249254E70()
{
  return MEMORY[0x270F625F0]();
}

uint64_t sub_249254E80()
{
  return MEMORY[0x270F62618]();
}

uint64_t sub_249254E90()
{
  return MEMORY[0x270F62628]();
}

uint64_t sub_249254EA0()
{
  return MEMORY[0x270F626C8]();
}

uint64_t sub_249254EB0()
{
  return MEMORY[0x270F62758]();
}

uint64_t sub_249254EC0()
{
  return MEMORY[0x270F62768]();
}

uint64_t sub_249254ED0()
{
  return MEMORY[0x270F62770]();
}

uint64_t sub_249254EE0()
{
  return MEMORY[0x270F62778]();
}

uint64_t sub_249254EF0()
{
  return MEMORY[0x270F62780]();
}

uint64_t sub_249254F00()
{
  return MEMORY[0x270F62798]();
}

uint64_t sub_249254F10()
{
  return MEMORY[0x270F627B0]();
}

uint64_t sub_249254F20()
{
  return MEMORY[0x270F627D0]();
}

uint64_t sub_249254F30()
{
  return MEMORY[0x270F627D8]();
}

uint64_t sub_249254F40()
{
  return MEMORY[0x270F627F0]();
}

uint64_t sub_249254F50()
{
  return MEMORY[0x270F62818]();
}

uint64_t sub_249254F60()
{
  return MEMORY[0x270F62820]();
}

uint64_t sub_249254F70()
{
  return MEMORY[0x270F62828]();
}

uint64_t sub_249254F80()
{
  return MEMORY[0x270F62830]();
}

uint64_t sub_249254F90()
{
  return MEMORY[0x270F62860]();
}

uint64_t sub_249254FA0()
{
  return MEMORY[0x270F62880]();
}

uint64_t sub_249254FB0()
{
  return MEMORY[0x270F62888]();
}

uint64_t sub_249254FE0()
{
  return MEMORY[0x270F628A0]();
}

uint64_t sub_249254FF0()
{
  return MEMORY[0x270F628B8]();
}

uint64_t sub_249255000()
{
  return MEMORY[0x270F628F8]();
}

uint64_t sub_249255010()
{
  return MEMORY[0x270F62900]();
}

uint64_t sub_249255020()
{
  return MEMORY[0x270F62908]();
}

uint64_t sub_249255030()
{
  return MEMORY[0x270F62910]();
}

uint64_t sub_249255040()
{
  return MEMORY[0x270F62918]();
}

uint64_t sub_249255050()
{
  return MEMORY[0x270F62920]();
}

uint64_t sub_249255060()
{
  return MEMORY[0x270F62928]();
}

uint64_t sub_249255070()
{
  return MEMORY[0x270F62930]();
}

uint64_t sub_249255080()
{
  return MEMORY[0x270F62968]();
}

uint64_t sub_249255090()
{
  return MEMORY[0x270F62970]();
}

uint64_t sub_2492550A0()
{
  return MEMORY[0x270F62998]();
}

uint64_t sub_2492550B0()
{
  return MEMORY[0x270F629A0]();
}

uint64_t sub_2492550E0()
{
  return MEMORY[0x270F62A18]();
}

uint64_t sub_2492550F0()
{
  return MEMORY[0x270F62A28]();
}

uint64_t sub_249255100()
{
  return MEMORY[0x270F62A70]();
}

uint64_t sub_249255110()
{
  return MEMORY[0x270F62A78]();
}

uint64_t sub_249255120()
{
  return MEMORY[0x270F62A80]();
}

uint64_t sub_249255130()
{
  return MEMORY[0x270F62A88]();
}

uint64_t sub_249255140()
{
  return MEMORY[0x270F62A90]();
}

uint64_t sub_249255150()
{
  return MEMORY[0x270F62A98]();
}

uint64_t sub_249255160()
{
  return MEMORY[0x270F62AA0]();
}

uint64_t sub_249255170()
{
  return MEMORY[0x270F62AE0]();
}

uint64_t sub_249255180()
{
  return MEMORY[0x270F62AF0]();
}

uint64_t sub_249255190()
{
  return MEMORY[0x270F62B18]();
}

uint64_t sub_2492551A0()
{
  return MEMORY[0x270F62B30]();
}

uint64_t sub_2492551B0()
{
  return MEMORY[0x270F62B50]();
}

uint64_t sub_2492551C0()
{
  return MEMORY[0x270F62B58]();
}

uint64_t sub_2492551D0()
{
  return MEMORY[0x270F62B60]();
}

uint64_t sub_2492551E0()
{
  return MEMORY[0x270F62B98]();
}

uint64_t sub_2492551F0()
{
  return MEMORY[0x270F62BA0]();
}

uint64_t sub_249255200()
{
  return MEMORY[0x270F62BA8]();
}

uint64_t sub_249255210()
{
  return MEMORY[0x270F62BB0]();
}

uint64_t sub_249255220()
{
  return MEMORY[0x270F62BB8]();
}

uint64_t sub_249255230()
{
  return MEMORY[0x270F2A398]();
}

uint64_t sub_249255240()
{
  return MEMORY[0x270F2A3A0]();
}

uint64_t sub_249255250()
{
  return MEMORY[0x270F2A3A8]();
}

uint64_t sub_249255260()
{
  return MEMORY[0x270F2A3B0]();
}

uint64_t sub_249255270()
{
  return MEMORY[0x270F2A3B8]();
}

uint64_t sub_249255280()
{
  return MEMORY[0x270F2A3C0]();
}

uint64_t sub_249255290()
{
  return MEMORY[0x270F2A3C8]();
}

uint64_t sub_2492552A0()
{
  return MEMORY[0x270F2A3D0]();
}

uint64_t sub_2492552B0()
{
  return MEMORY[0x270F2A3D8]();
}

uint64_t sub_2492552C0()
{
  return MEMORY[0x270F2A3E0]();
}

uint64_t sub_2492552D0()
{
  return MEMORY[0x270F2A3E8]();
}

uint64_t sub_2492552E0()
{
  return MEMORY[0x270F2A3F0]();
}

uint64_t sub_2492552F0()
{
  return MEMORY[0x270F2A3F8]();
}

uint64_t sub_249255300()
{
  return MEMORY[0x270F2A400]();
}

uint64_t sub_249255310()
{
  return MEMORY[0x270F2A408]();
}

uint64_t sub_249255320()
{
  return MEMORY[0x270F2A410]();
}

uint64_t sub_249255330()
{
  return MEMORY[0x270F2A418]();
}

uint64_t sub_249255340()
{
  return MEMORY[0x270F2A420]();
}

uint64_t sub_249255350()
{
  return MEMORY[0x270F2A428]();
}

uint64_t sub_249255360()
{
  return MEMORY[0x270F2A430]();
}

uint64_t sub_249255370()
{
  return MEMORY[0x270F2A438]();
}

uint64_t sub_249255380()
{
  return MEMORY[0x270F2A440]();
}

uint64_t sub_249255390()
{
  return MEMORY[0x270F2A448]();
}

uint64_t sub_2492553A0()
{
  return MEMORY[0x270F2A450]();
}

uint64_t sub_2492553B0()
{
  return MEMORY[0x270F2A458]();
}

uint64_t sub_2492553C0()
{
  return MEMORY[0x270F2A460]();
}

uint64_t sub_2492553D0()
{
  return MEMORY[0x270F2A468]();
}

uint64_t sub_2492553E0()
{
  return MEMORY[0x270F2A470]();
}

uint64_t sub_2492553F0()
{
  return MEMORY[0x270F2A478]();
}

uint64_t sub_249255400()
{
  return MEMORY[0x270F2A480]();
}

uint64_t sub_249255410()
{
  return MEMORY[0x270F2A488]();
}

uint64_t sub_249255420()
{
  return MEMORY[0x270F2A490]();
}

uint64_t sub_249255430()
{
  return MEMORY[0x270F2A498]();
}

uint64_t sub_249255440()
{
  return MEMORY[0x270F2A4A0]();
}

uint64_t sub_249255450()
{
  return MEMORY[0x270F2A4A8]();
}

uint64_t sub_249255460()
{
  return MEMORY[0x270F2A4B0]();
}

uint64_t sub_249255470()
{
  return MEMORY[0x270F2A4B8]();
}

uint64_t sub_249255480()
{
  return MEMORY[0x270F2A4C0]();
}

uint64_t sub_249255490()
{
  return MEMORY[0x270F2A4C8]();
}

uint64_t sub_2492554A0()
{
  return MEMORY[0x270F2A4D0]();
}

uint64_t sub_2492554B0()
{
  return MEMORY[0x270F2A4D8]();
}

uint64_t sub_2492554C0()
{
  return MEMORY[0x270F2A4E0]();
}

uint64_t sub_2492554D0()
{
  return MEMORY[0x270F2A4E8]();
}

uint64_t sub_2492554E0()
{
  return MEMORY[0x270F2A4F0]();
}

uint64_t sub_2492554F0()
{
  return MEMORY[0x270F2A4F8]();
}

uint64_t sub_249255500()
{
  return MEMORY[0x270F2A500]();
}

uint64_t sub_249255510()
{
  return MEMORY[0x270F2A508]();
}

uint64_t sub_249255520()
{
  return MEMORY[0x270F2A510]();
}

uint64_t sub_249255530()
{
  return MEMORY[0x270F2A518]();
}

uint64_t sub_249255540()
{
  return MEMORY[0x270F2A520]();
}

uint64_t sub_249255550()
{
  return MEMORY[0x270F2A528]();
}

uint64_t sub_249255560()
{
  return MEMORY[0x270F2A530]();
}

uint64_t sub_249255570()
{
  return MEMORY[0x270F2A538]();
}

uint64_t sub_249255580()
{
  return MEMORY[0x270F2A540]();
}

uint64_t sub_249255590()
{
  return MEMORY[0x270F2A548]();
}

uint64_t sub_2492555A0()
{
  return MEMORY[0x270F2A550]();
}

uint64_t sub_2492555B0()
{
  return MEMORY[0x270F2A558]();
}

uint64_t sub_2492555C0()
{
  return MEMORY[0x270F2A560]();
}

uint64_t sub_2492555D0()
{
  return MEMORY[0x270F2A568]();
}

uint64_t sub_2492555E0()
{
  return MEMORY[0x270F2A570]();
}

uint64_t sub_2492555F0()
{
  return MEMORY[0x270F2A578]();
}

uint64_t sub_249255600()
{
  return MEMORY[0x270F2A580]();
}

uint64_t sub_249255610()
{
  return MEMORY[0x270F2A588]();
}

uint64_t sub_249255620()
{
  return MEMORY[0x270F2A590]();
}

uint64_t sub_249255630()
{
  return MEMORY[0x270F2A598]();
}

uint64_t sub_249255650()
{
  return MEMORY[0x270F2A5A8]();
}

uint64_t sub_249255660()
{
  return MEMORY[0x270F2A5B0]();
}

uint64_t sub_249255670()
{
  return MEMORY[0x270F2A5B8]();
}

uint64_t sub_249255680()
{
  return MEMORY[0x270F2A5C0]();
}

uint64_t sub_249255690()
{
  return MEMORY[0x270F2A5C8]();
}

uint64_t sub_2492556A0()
{
  return MEMORY[0x270F2A5D0]();
}

uint64_t sub_2492556B0()
{
  return MEMORY[0x270F2A5D8]();
}

uint64_t sub_2492556C0()
{
  return MEMORY[0x270F2A5E0]();
}

uint64_t sub_2492556D0()
{
  return MEMORY[0x270F2A5E8]();
}

uint64_t sub_2492556E0()
{
  return MEMORY[0x270F2A5F0]();
}

uint64_t sub_2492556F0()
{
  return MEMORY[0x270F2A5F8]();
}

uint64_t sub_249255700()
{
  return MEMORY[0x270F2A600]();
}

uint64_t sub_249255710()
{
  return MEMORY[0x270F2A608]();
}

uint64_t sub_249255720()
{
  return MEMORY[0x270F2A610]();
}

uint64_t sub_249255730()
{
  return MEMORY[0x270F2A618]();
}

uint64_t sub_249255740()
{
  return MEMORY[0x270F2A620]();
}

uint64_t sub_249255750()
{
  return MEMORY[0x270F2A628]();
}

uint64_t sub_249255760()
{
  return MEMORY[0x270F2A630]();
}

uint64_t sub_249255770()
{
  return MEMORY[0x270F2A638]();
}

uint64_t sub_249255780()
{
  return MEMORY[0x270F2A640]();
}

uint64_t sub_249255790()
{
  return MEMORY[0x270F2A648]();
}

uint64_t sub_2492557A0()
{
  return MEMORY[0x270F2A650]();
}

uint64_t sub_2492557B0()
{
  return MEMORY[0x270F2A658]();
}

uint64_t sub_2492557C0()
{
  return MEMORY[0x270F2A660]();
}

uint64_t sub_2492557D0()
{
  return MEMORY[0x270F2A668]();
}

uint64_t sub_2492557E0()
{
  return MEMORY[0x270F2A670]();
}

uint64_t sub_2492557F0()
{
  return MEMORY[0x270F2A678]();
}

uint64_t sub_249255800()
{
  return MEMORY[0x270F2A680]();
}

uint64_t sub_249255810()
{
  return MEMORY[0x270F2A688]();
}

uint64_t sub_249255820()
{
  return MEMORY[0x270F2A690]();
}

uint64_t sub_249255830()
{
  return MEMORY[0x270F2A698]();
}

uint64_t sub_249255840()
{
  return MEMORY[0x270F2A6A0]();
}

uint64_t sub_249255850()
{
  return MEMORY[0x270F2A6A8]();
}

uint64_t sub_249255860()
{
  return MEMORY[0x270F2A6B0]();
}

uint64_t sub_249255870()
{
  return MEMORY[0x270F2A6B8]();
}

uint64_t sub_249255880()
{
  return MEMORY[0x270F2A6C0]();
}

uint64_t sub_249255890()
{
  return MEMORY[0x270F2A6C8]();
}

uint64_t sub_2492558A0()
{
  return MEMORY[0x270F2A6D0]();
}

uint64_t sub_2492558B0()
{
  return MEMORY[0x270F2A6D8]();
}

uint64_t sub_2492558C0()
{
  return MEMORY[0x270F2A6E0]();
}

uint64_t sub_2492558D0()
{
  return MEMORY[0x270F2A6E8]();
}

uint64_t sub_2492558E0()
{
  return MEMORY[0x270F2A6F0]();
}

uint64_t sub_2492558F0()
{
  return MEMORY[0x270F2A6F8]();
}

uint64_t sub_249255900()
{
  return MEMORY[0x270F2A700]();
}

uint64_t sub_249255910()
{
  return MEMORY[0x270F2A708]();
}

uint64_t sub_249255920()
{
  return MEMORY[0x270F2A710]();
}

uint64_t sub_249255930()
{
  return MEMORY[0x270F2A718]();
}

uint64_t sub_249255940()
{
  return MEMORY[0x270F2A720]();
}

uint64_t sub_249255950()
{
  return MEMORY[0x270F2A728]();
}

uint64_t sub_249255960()
{
  return MEMORY[0x270F2A730]();
}

uint64_t sub_249255970()
{
  return MEMORY[0x270F2A738]();
}

uint64_t sub_249255980()
{
  return MEMORY[0x270F2A740]();
}

uint64_t sub_249255990()
{
  return MEMORY[0x270F2A748]();
}

uint64_t sub_2492559A0()
{
  return MEMORY[0x270F2A750]();
}

uint64_t sub_2492559B0()
{
  return MEMORY[0x270F2A758]();
}

uint64_t sub_2492559C0()
{
  return MEMORY[0x270F2A760]();
}

uint64_t sub_2492559D0()
{
  return MEMORY[0x270F2A768]();
}

uint64_t sub_2492559E0()
{
  return MEMORY[0x270F2A770]();
}

uint64_t sub_2492559F0()
{
  return MEMORY[0x270F2A778]();
}

uint64_t sub_249255A00()
{
  return MEMORY[0x270F2A780]();
}

uint64_t sub_249255A10()
{
  return MEMORY[0x270F2A788]();
}

uint64_t sub_249255A20()
{
  return MEMORY[0x270F2A790]();
}

uint64_t sub_249255A30()
{
  return MEMORY[0x270F2A798]();
}

uint64_t sub_249255A40()
{
  return MEMORY[0x270F2A7A0]();
}

uint64_t sub_249255A50()
{
  return MEMORY[0x270F2A7A8]();
}

uint64_t sub_249255A60()
{
  return MEMORY[0x270F2A7B0]();
}

uint64_t sub_249255A70()
{
  return MEMORY[0x270F2A7B8]();
}

uint64_t sub_249255A80()
{
  return MEMORY[0x270F2ACC8]();
}

uint64_t sub_249255A90()
{
  return MEMORY[0x270F2ACD0]();
}

uint64_t sub_249255AA0()
{
  return MEMORY[0x270F2ACD8]();
}

uint64_t sub_249255AB0()
{
  return MEMORY[0x270F2ACE0]();
}

uint64_t sub_249255AC0()
{
  return MEMORY[0x270F2ACE8]();
}

uint64_t sub_249255AD0()
{
  return MEMORY[0x270F2ACF0]();
}

uint64_t sub_249255AE0()
{
  return MEMORY[0x270F2ACF8]();
}

uint64_t sub_249255AF0()
{
  return MEMORY[0x270F2AD00]();
}

uint64_t sub_249255B00()
{
  return MEMORY[0x270F2AD08]();
}

uint64_t sub_249255B10()
{
  return MEMORY[0x270F2AD10]();
}

uint64_t sub_249255B20()
{
  return MEMORY[0x270F2AD18]();
}

uint64_t sub_249255B30()
{
  return MEMORY[0x270F2AD20]();
}

uint64_t sub_249255B40()
{
  return MEMORY[0x270F2AD28]();
}

uint64_t sub_249255B50()
{
  return MEMORY[0x270F2AD30]();
}

uint64_t sub_249255B60()
{
  return MEMORY[0x270F2AD38]();
}

uint64_t sub_249255B70()
{
  return MEMORY[0x270F2B270]();
}

uint64_t sub_249255B80()
{
  return MEMORY[0x270F2B280]();
}

uint64_t sub_249255B90()
{
  return MEMORY[0x270F2B2C8]();
}

uint64_t sub_249255BA0()
{
  return MEMORY[0x270F2B2D0]();
}

uint64_t sub_249255BB0()
{
  return MEMORY[0x270F2B2E0]();
}

uint64_t sub_249255BC0()
{
  return MEMORY[0x270F2B2E8]();
}

uint64_t sub_249255BD0()
{
  return MEMORY[0x270F2B2F8]();
}

uint64_t sub_249255BE0()
{
  return MEMORY[0x270F2B318]();
}

uint64_t sub_249255BF0()
{
  return MEMORY[0x270F2B320]();
}

uint64_t sub_249255C00()
{
  return MEMORY[0x270F2B328]();
}

uint64_t sub_249255C10()
{
  return MEMORY[0x270F2B330]();
}

uint64_t sub_249255C20()
{
  return MEMORY[0x270F2B338]();
}

uint64_t sub_249255C30()
{
  return MEMORY[0x270F2B390]();
}

uint64_t sub_249255C40()
{
  return MEMORY[0x270F2B3A8]();
}

uint64_t sub_249255C50()
{
  return MEMORY[0x270F2B3B0]();
}

uint64_t sub_249255C60()
{
  return MEMORY[0x270F2B3B8]();
}

uint64_t sub_249255C70()
{
  return MEMORY[0x270F2B3C0]();
}

uint64_t sub_249255C80()
{
  return MEMORY[0x270F2B3C8]();
}

uint64_t sub_249255C90()
{
  return MEMORY[0x270F2B3D0]();
}

uint64_t sub_249255CA0()
{
  return MEMORY[0x270F2B3D8]();
}

uint64_t sub_249255CB0()
{
  return MEMORY[0x270F2B3E0]();
}

uint64_t sub_249255CC0()
{
  return MEMORY[0x270F2B3E8]();
}

uint64_t sub_249255CD0()
{
  return MEMORY[0x270F2B3F0]();
}

uint64_t sub_249255CE0()
{
  return MEMORY[0x270F2B3F8]();
}

uint64_t sub_249255CF0()
{
  return MEMORY[0x270F2B400]();
}

uint64_t sub_249255D00()
{
  return MEMORY[0x270F2B408]();
}

uint64_t sub_249255D10()
{
  return MEMORY[0x270F2B410]();
}

uint64_t sub_249255D20()
{
  return MEMORY[0x270F2B418]();
}

uint64_t sub_249255D30()
{
  return MEMORY[0x270F2B780]();
}

uint64_t sub_249255D40()
{
  return MEMORY[0x270F2B788]();
}

uint64_t sub_249255D50()
{
  return MEMORY[0x270F2B790]();
}

uint64_t sub_249255D60()
{
  return MEMORY[0x270F2B798]();
}

uint64_t sub_249255D70()
{
  return MEMORY[0x270F2B7A0]();
}

uint64_t sub_249255D80()
{
  return MEMORY[0x270F2B7A8]();
}

uint64_t sub_249255D90()
{
  return MEMORY[0x270F2B7B0]();
}

uint64_t sub_249255DA0()
{
  return MEMORY[0x270F2B7B8]();
}

uint64_t sub_249255DB0()
{
  return MEMORY[0x270F2B7C0]();
}

uint64_t sub_249255DC0()
{
  return MEMORY[0x270F2B7C8]();
}

uint64_t sub_249255DD0()
{
  return MEMORY[0x270F2B7D0]();
}

uint64_t sub_249255DE0()
{
  return MEMORY[0x270F2B7D8]();
}

uint64_t sub_249255DF0()
{
  return MEMORY[0x270F2B7E0]();
}

uint64_t sub_249255E00()
{
  return MEMORY[0x270F2B7E8]();
}

uint64_t sub_249255E10()
{
  return MEMORY[0x270F2B7F0]();
}

uint64_t sub_249255E20()
{
  return MEMORY[0x270F2B7F8]();
}

uint64_t sub_249255E30()
{
  return MEMORY[0x270F2B800]();
}

uint64_t sub_249255E40()
{
  return MEMORY[0x270F2B808]();
}

uint64_t sub_249255E50()
{
  return MEMORY[0x270F2B810]();
}

uint64_t sub_249255E60()
{
  return MEMORY[0x270F2B818]();
}

uint64_t sub_249255E70()
{
  return MEMORY[0x270F2B820]();
}

uint64_t sub_249255E80()
{
  return MEMORY[0x270F2B828]();
}

uint64_t sub_249255E90()
{
  return MEMORY[0x270F2B830]();
}

uint64_t sub_249255EA0()
{
  return MEMORY[0x270F2B838]();
}

uint64_t sub_249255EB0()
{
  return MEMORY[0x270F2B840]();
}

uint64_t sub_249255EC0()
{
  return MEMORY[0x270F2B848]();
}

uint64_t sub_249255ED0()
{
  return MEMORY[0x270F2B850]();
}

uint64_t sub_249255EE0()
{
  return MEMORY[0x270F2B858]();
}

uint64_t sub_249255EF0()
{
  return MEMORY[0x270F2B860]();
}

uint64_t sub_249255F00()
{
  return MEMORY[0x270F2B868]();
}

uint64_t sub_249255F10()
{
  return MEMORY[0x270F2B870]();
}

uint64_t sub_249255F20()
{
  return MEMORY[0x270F2B878]();
}

uint64_t sub_249255F30()
{
  return MEMORY[0x270F2B880]();
}

uint64_t sub_249255F40()
{
  return MEMORY[0x270F2B888]();
}

uint64_t sub_249255F50()
{
  return MEMORY[0x270F2B890]();
}

uint64_t sub_249255F60()
{
  return MEMORY[0x270F2B898]();
}

uint64_t sub_249255F70()
{
  return MEMORY[0x270F2B8A0]();
}

uint64_t sub_249255F80()
{
  return MEMORY[0x270F2B8A8]();
}

uint64_t sub_249255F90()
{
  return MEMORY[0x270F2B8B0]();
}

uint64_t sub_249255FA0()
{
  return MEMORY[0x270F2B8B8]();
}

uint64_t sub_249255FB0()
{
  return MEMORY[0x270F2B8C0]();
}

uint64_t sub_249255FC0()
{
  return MEMORY[0x270F2B8C8]();
}

uint64_t sub_249255FD0()
{
  return MEMORY[0x270F2B8D0]();
}

uint64_t sub_249255FE0()
{
  return MEMORY[0x270F2B8D8]();
}

uint64_t sub_249255FF0()
{
  return MEMORY[0x270F2B8E0]();
}

uint64_t sub_249256000()
{
  return MEMORY[0x270F2B8E8]();
}

uint64_t sub_249256010()
{
  return MEMORY[0x270F2B8F0]();
}

uint64_t sub_249256020()
{
  return MEMORY[0x270F2B8F8]();
}

uint64_t sub_249256030()
{
  return MEMORY[0x270F2B900]();
}

uint64_t sub_249256040()
{
  return MEMORY[0x270F2B908]();
}

uint64_t sub_249256050()
{
  return MEMORY[0x270F2B910]();
}

uint64_t sub_249256060()
{
  return MEMORY[0x270F2B918]();
}

uint64_t sub_249256070()
{
  return MEMORY[0x270F2B920]();
}

uint64_t sub_249256080()
{
  return MEMORY[0x270F2B928]();
}

uint64_t sub_249256090()
{
  return MEMORY[0x270F2B930]();
}

uint64_t sub_2492560A0()
{
  return MEMORY[0x270F2B938]();
}

uint64_t sub_2492560B0()
{
  return MEMORY[0x270F2B940]();
}

uint64_t sub_2492560C0()
{
  return MEMORY[0x270F2B948]();
}

uint64_t sub_2492560D0()
{
  return MEMORY[0x270F2B950]();
}

uint64_t sub_2492560E0()
{
  return MEMORY[0x270F2B958]();
}

uint64_t sub_2492560F0()
{
  return MEMORY[0x270F2B960]();
}

uint64_t sub_249256100()
{
  return MEMORY[0x270F2B968]();
}

uint64_t sub_249256110()
{
  return MEMORY[0x270F2B970]();
}

uint64_t sub_249256120()
{
  return MEMORY[0x270F2B978]();
}

uint64_t sub_249256130()
{
  return MEMORY[0x270F2B980]();
}

uint64_t sub_249256140()
{
  return MEMORY[0x270F2B988]();
}

uint64_t sub_249256150()
{
  return MEMORY[0x270F2B990]();
}

uint64_t sub_249256160()
{
  return MEMORY[0x270F2B998]();
}

uint64_t sub_249256170()
{
  return MEMORY[0x270F2B9A0]();
}

uint64_t sub_249256180()
{
  return MEMORY[0x270F2B9A8]();
}

uint64_t sub_249256190()
{
  return MEMORY[0x270F2B9B0]();
}

uint64_t sub_2492561A0()
{
  return MEMORY[0x270F2B9B8]();
}

uint64_t sub_2492561B0()
{
  return MEMORY[0x270F2B9C0]();
}

uint64_t sub_2492561C0()
{
  return MEMORY[0x270F2B9C8]();
}

uint64_t sub_2492561D0()
{
  return MEMORY[0x270F2B9D0]();
}

uint64_t sub_2492561E0()
{
  return MEMORY[0x270F2B9D8]();
}

uint64_t sub_2492561F0()
{
  return MEMORY[0x270F2C5E0]();
}

uint64_t sub_249256200()
{
  return MEMORY[0x270F2C5E8]();
}

uint64_t sub_249256210()
{
  return MEMORY[0x270F2C5F0]();
}

uint64_t sub_249256220()
{
  return MEMORY[0x270F2C5F8]();
}

uint64_t sub_249256230()
{
  return MEMORY[0x270F2C600]();
}

uint64_t sub_249256240()
{
  return MEMORY[0x270F2C608]();
}

uint64_t sub_249256250()
{
  return MEMORY[0x270F2C610]();
}

uint64_t sub_249256260()
{
  return MEMORY[0x270F2C618]();
}

uint64_t sub_249256270()
{
  return MEMORY[0x270F2C620]();
}

uint64_t sub_249256280()
{
  return MEMORY[0x270F2C628]();
}

uint64_t sub_249256290()
{
  return MEMORY[0x270F2C630]();
}

uint64_t sub_2492562A0()
{
  return MEMORY[0x270F2C638]();
}

uint64_t sub_2492562B0()
{
  return MEMORY[0x270F2C640]();
}

uint64_t sub_2492562C0()
{
  return MEMORY[0x270F2C648]();
}

uint64_t sub_2492562D0()
{
  return MEMORY[0x270F2C650]();
}

uint64_t sub_2492562E0()
{
  return MEMORY[0x270F2C658]();
}

uint64_t sub_2492562F0()
{
  return MEMORY[0x270F2C660]();
}

uint64_t sub_249256300()
{
  return MEMORY[0x270F2C668]();
}

uint64_t sub_249256310()
{
  return MEMORY[0x270F2C670]();
}

uint64_t sub_249256320()
{
  return MEMORY[0x270F2C678]();
}

uint64_t sub_249256330()
{
  return MEMORY[0x270F2C680]();
}

uint64_t sub_249256340()
{
  return MEMORY[0x270F2C688]();
}

uint64_t sub_249256350()
{
  return MEMORY[0x270F2C690]();
}

uint64_t sub_249256360()
{
  return MEMORY[0x270F2C698]();
}

uint64_t sub_249256370()
{
  return MEMORY[0x270F2C6A0]();
}

uint64_t sub_249256380()
{
  return MEMORY[0x270F2C6A8]();
}

uint64_t sub_249256390()
{
  return MEMORY[0x270F2C6B0]();
}

uint64_t sub_2492563A0()
{
  return MEMORY[0x270F2C6B8]();
}

uint64_t sub_2492563B0()
{
  return MEMORY[0x270F2C6C0]();
}

uint64_t sub_2492563C0()
{
  return MEMORY[0x270F2C6C8]();
}

uint64_t sub_2492563D0()
{
  return MEMORY[0x270F2C6D0]();
}

uint64_t sub_2492563E0()
{
  return MEMORY[0x270F2C6D8]();
}

uint64_t sub_2492563F0()
{
  return MEMORY[0x270F2C6E0]();
}

uint64_t sub_249256400()
{
  return MEMORY[0x270F2C6E8]();
}

uint64_t sub_249256410()
{
  return MEMORY[0x270F2C6F0]();
}

uint64_t sub_249256420()
{
  return MEMORY[0x270F2C6F8]();
}

uint64_t sub_249256430()
{
  return MEMORY[0x270F2C700]();
}

uint64_t sub_249256440()
{
  return MEMORY[0x270F2C708]();
}

uint64_t sub_249256450()
{
  return MEMORY[0x270F2C710]();
}

uint64_t sub_249256460()
{
  return MEMORY[0x270F2C718]();
}

uint64_t sub_249256470()
{
  return MEMORY[0x270F2C720]();
}

uint64_t sub_249256480()
{
  return MEMORY[0x270F2C728]();
}

uint64_t sub_249256490()
{
  return MEMORY[0x270F2C730]();
}

uint64_t sub_2492564A0()
{
  return MEMORY[0x270F2C738]();
}

uint64_t sub_2492564B0()
{
  return MEMORY[0x270F2C740]();
}

uint64_t sub_2492564C0()
{
  return MEMORY[0x270F2C748]();
}

uint64_t sub_2492564D0()
{
  return MEMORY[0x270F2C750]();
}

uint64_t sub_2492564E0()
{
  return MEMORY[0x270F2C758]();
}

uint64_t sub_2492564F0()
{
  return MEMORY[0x270F2C760]();
}

uint64_t sub_249256500()
{
  return MEMORY[0x270F2C768]();
}

uint64_t sub_249256510()
{
  return MEMORY[0x270F2C770]();
}

uint64_t sub_249256520()
{
  return MEMORY[0x270F2C778]();
}

uint64_t sub_249256530()
{
  return MEMORY[0x270F2C780]();
}

uint64_t sub_249256540()
{
  return MEMORY[0x270F2C788]();
}

uint64_t sub_249256550()
{
  return MEMORY[0x270F2C790]();
}

uint64_t sub_249256560()
{
  return MEMORY[0x270F2C798]();
}

uint64_t sub_249256570()
{
  return MEMORY[0x270F2C7A0]();
}

uint64_t sub_249256580()
{
  return MEMORY[0x270F2C7A8]();
}

uint64_t sub_249256590()
{
  return MEMORY[0x270F2C7B0]();
}

uint64_t sub_2492565A0()
{
  return MEMORY[0x270F2C7B8]();
}

uint64_t sub_2492565B0()
{
  return MEMORY[0x270F2C7C0]();
}

uint64_t sub_2492565C0()
{
  return MEMORY[0x270F2C7C8]();
}

uint64_t sub_2492565D0()
{
  return MEMORY[0x270F2C7D0]();
}

uint64_t sub_2492565E0()
{
  return MEMORY[0x270F2C7D8]();
}

uint64_t sub_2492565F0()
{
  return MEMORY[0x270F2C7E0]();
}

uint64_t sub_249256600()
{
  return MEMORY[0x270F2C7E8]();
}

uint64_t sub_249256610()
{
  return MEMORY[0x270F2C7F0]();
}

uint64_t sub_249256620()
{
  return MEMORY[0x270F2C7F8]();
}

uint64_t sub_249256630()
{
  return MEMORY[0x270F2C800]();
}

uint64_t sub_249256640()
{
  return MEMORY[0x270F2C808]();
}

uint64_t sub_249256650()
{
  return MEMORY[0x270F2C810]();
}

uint64_t sub_249256660()
{
  return MEMORY[0x270F2C818]();
}

uint64_t sub_249256670()
{
  return MEMORY[0x270F2C820]();
}

uint64_t sub_249256680()
{
  return MEMORY[0x270F2C828]();
}

uint64_t sub_249256690()
{
  return MEMORY[0x270F2C830]();
}

uint64_t sub_2492566A0()
{
  return MEMORY[0x270F2C838]();
}

uint64_t sub_2492566B0()
{
  return MEMORY[0x270F2C840]();
}

uint64_t sub_2492566C0()
{
  return MEMORY[0x270F2C848]();
}

uint64_t sub_2492566D0()
{
  return MEMORY[0x270F2C850]();
}

uint64_t sub_2492566E0()
{
  return MEMORY[0x270F2C858]();
}

uint64_t sub_2492566F0()
{
  return MEMORY[0x270F2C860]();
}

uint64_t sub_249256700()
{
  return MEMORY[0x270F2C868]();
}

uint64_t sub_249256710()
{
  return MEMORY[0x270F2C870]();
}

uint64_t sub_249256720()
{
  return MEMORY[0x270F2C878]();
}

uint64_t sub_249256730()
{
  return MEMORY[0x270F2C880]();
}

uint64_t sub_249256740()
{
  return MEMORY[0x270F2C888]();
}

uint64_t sub_249256750()
{
  return MEMORY[0x270F2C890]();
}

uint64_t sub_249256760()
{
  return MEMORY[0x270F2C898]();
}

uint64_t sub_249256770()
{
  return MEMORY[0x270F2C8A0]();
}

uint64_t sub_249256780()
{
  return MEMORY[0x270F2C8A8]();
}

uint64_t sub_249256790()
{
  return MEMORY[0x270F2C8B0]();
}

uint64_t sub_2492567A0()
{
  return MEMORY[0x270F2C8B8]();
}

uint64_t sub_2492567B0()
{
  return MEMORY[0x270F2C8C0]();
}

uint64_t sub_2492567C0()
{
  return MEMORY[0x270F2C8C8]();
}

uint64_t sub_2492567D0()
{
  return MEMORY[0x270F2C8D0]();
}

uint64_t sub_2492567E0()
{
  return MEMORY[0x270F2C8D8]();
}

uint64_t sub_2492567F0()
{
  return MEMORY[0x270F2C8E0]();
}

uint64_t sub_249256800()
{
  return MEMORY[0x270F2C8E8]();
}

uint64_t sub_249256810()
{
  return MEMORY[0x270F2C8F0]();
}

uint64_t sub_249256820()
{
  return MEMORY[0x270F2C8F8]();
}

uint64_t sub_249256830()
{
  return MEMORY[0x270F2C900]();
}

uint64_t sub_249256840()
{
  return MEMORY[0x270F2C908]();
}

uint64_t sub_249256850()
{
  return MEMORY[0x270F2C910]();
}

uint64_t sub_249256860()
{
  return MEMORY[0x270F2C918]();
}

uint64_t sub_249256870()
{
  return MEMORY[0x270F2C920]();
}

uint64_t sub_249256880()
{
  return MEMORY[0x270F2C928]();
}

uint64_t sub_249256890()
{
  return MEMORY[0x270F2C930]();
}

uint64_t sub_2492568A0()
{
  return MEMORY[0x270F2C938]();
}

uint64_t sub_2492568B0()
{
  return MEMORY[0x270F2C940]();
}

uint64_t sub_2492568C0()
{
  return MEMORY[0x270F2C948]();
}

uint64_t sub_2492568D0()
{
  return MEMORY[0x270F2C950]();
}

uint64_t sub_2492568E0()
{
  return MEMORY[0x270F2C958]();
}

uint64_t sub_2492568F0()
{
  return MEMORY[0x270F2C960]();
}

uint64_t sub_249256900()
{
  return MEMORY[0x270F2C968]();
}

uint64_t sub_249256910()
{
  return MEMORY[0x270F2C970]();
}

uint64_t sub_249256920()
{
  return MEMORY[0x270F2C978]();
}

uint64_t sub_249256930()
{
  return MEMORY[0x270F2C980]();
}

uint64_t sub_249256940()
{
  return MEMORY[0x270F2C988]();
}

uint64_t sub_249256950()
{
  return MEMORY[0x270F2C990]();
}

uint64_t sub_249256960()
{
  return MEMORY[0x270F2C998]();
}

uint64_t sub_249256970()
{
  return MEMORY[0x270F2C9A0]();
}

uint64_t sub_249256980()
{
  return MEMORY[0x270F2C9A8]();
}

uint64_t sub_249256990()
{
  return MEMORY[0x270F2C9B0]();
}

uint64_t sub_2492569A0()
{
  return MEMORY[0x270F2C9B8]();
}

uint64_t sub_2492569B0()
{
  return MEMORY[0x270F2C9C0]();
}

uint64_t sub_2492569C0()
{
  return MEMORY[0x270F2C9C8]();
}

uint64_t sub_2492569D0()
{
  return MEMORY[0x270F2C9D0]();
}

uint64_t sub_2492569E0()
{
  return MEMORY[0x270F2C9D8]();
}

uint64_t sub_2492569F0()
{
  return MEMORY[0x270F2C9E0]();
}

uint64_t sub_249256A00()
{
  return MEMORY[0x270F2C9E8]();
}

uint64_t sub_249256A10()
{
  return MEMORY[0x270F2C9F0]();
}

uint64_t sub_249256A20()
{
  return MEMORY[0x270F2C9F8]();
}

uint64_t sub_249256A30()
{
  return MEMORY[0x270F2CA00]();
}

uint64_t sub_249256A40()
{
  return MEMORY[0x270F2CA08]();
}

uint64_t sub_249256A50()
{
  return MEMORY[0x270F2CA10]();
}

uint64_t sub_249256A60()
{
  return MEMORY[0x270F2CA18]();
}

uint64_t sub_249256A70()
{
  return MEMORY[0x270F2CA20]();
}

uint64_t sub_249256A80()
{
  return MEMORY[0x270F2CA28]();
}

uint64_t sub_249256A90()
{
  return MEMORY[0x270F2CA30]();
}

uint64_t sub_249256AA0()
{
  return MEMORY[0x270F2CA38]();
}

uint64_t sub_249256AB0()
{
  return MEMORY[0x270F2CA40]();
}

uint64_t sub_249256AC0()
{
  return MEMORY[0x270F5D3A8]();
}

uint64_t sub_249256AD0()
{
  return MEMORY[0x270F5D3B8]();
}

uint64_t sub_249256AE0()
{
  return MEMORY[0x270F5D3C8]();
}

uint64_t sub_249256AF0()
{
  return MEMORY[0x270F5D420]();
}

uint64_t sub_249256B00()
{
  return MEMORY[0x270F5D428]();
}

uint64_t sub_249256B10()
{
  return MEMORY[0x270F5D430]();
}

uint64_t sub_249256B20()
{
  return MEMORY[0x270F5D440]();
}

uint64_t sub_249256B30()
{
  return MEMORY[0x270F5D448]();
}

uint64_t sub_249256B40()
{
  return MEMORY[0x270F5D470]();
}

uint64_t sub_249256B50()
{
  return MEMORY[0x270F5D478]();
}

uint64_t sub_249256C20()
{
  return MEMORY[0x270F5D580]();
}

uint64_t sub_249256C30()
{
  return MEMORY[0x270F5D588]();
}

uint64_t sub_249256C40()
{
  return MEMORY[0x270F5D5A0]();
}

uint64_t sub_249256C50()
{
  return MEMORY[0x270F5D5A8]();
}

uint64_t sub_249256C60()
{
  return MEMORY[0x270F5D5B0]();
}

uint64_t sub_249256C70()
{
  return MEMORY[0x270F5D5C0]();
}

uint64_t sub_249256C80()
{
  return MEMORY[0x270F5D5C8]();
}

uint64_t sub_249256C90()
{
  return MEMORY[0x270F5D5D0]();
}

uint64_t sub_249256CA0()
{
  return MEMORY[0x270F5D5D8]();
}

uint64_t sub_249256CB0()
{
  return MEMORY[0x270F5D618]();
}

uint64_t sub_249256CC0()
{
  return MEMORY[0x270F5D658]();
}

uint64_t sub_249256CD0()
{
  return MEMORY[0x270F5D670]();
}

uint64_t sub_249256CE0()
{
  return MEMORY[0x270F5D698]();
}

uint64_t sub_249256CF0()
{
  return MEMORY[0x270F5D6E8]();
}

uint64_t sub_249256D00()
{
  return MEMORY[0x270F5D720]();
}

uint64_t sub_249256D10()
{
  return MEMORY[0x270F5D728]();
}

uint64_t sub_249256D20()
{
  return MEMORY[0x270F5D730]();
}

uint64_t sub_249256D30()
{
  return MEMORY[0x270F5D740]();
}

uint64_t sub_249256D40()
{
  return MEMORY[0x270F5D778]();
}

uint64_t sub_249256D50()
{
  return MEMORY[0x270F5D780]();
}

uint64_t sub_249256D60()
{
  return MEMORY[0x270F5D788]();
}

uint64_t sub_249256D70()
{
  return MEMORY[0x270F5D790]();
}

uint64_t sub_249256D80()
{
  return MEMORY[0x270F5D798]();
}

uint64_t sub_249256D90()
{
  return MEMORY[0x270F5D7A0]();
}

uint64_t sub_249256DA0()
{
  return MEMORY[0x270F5D7A8]();
}

uint64_t sub_249256DB0()
{
  return MEMORY[0x270F5D7E0]();
}

uint64_t sub_249256DC0()
{
  return MEMORY[0x270F5D7E8]();
}

uint64_t sub_249256DD0()
{
  return MEMORY[0x270F5D7F8]();
}

uint64_t sub_249256DE0()
{
  return MEMORY[0x270F5D800]();
}

uint64_t sub_249256DF0()
{
  return MEMORY[0x270F5D868]();
}

uint64_t sub_249256E00()
{
  return MEMORY[0x270F5D878]();
}

uint64_t sub_249256E10()
{
  return MEMORY[0x270F5D880]();
}

uint64_t sub_249256E20()
{
  return MEMORY[0x270F5D888]();
}

uint64_t sub_249256E30()
{
  return MEMORY[0x270F5D8B8]();
}

uint64_t sub_249256E40()
{
  return MEMORY[0x270F5D8E0]();
}

uint64_t sub_249256E50()
{
  return MEMORY[0x270F5D8F8]();
}

uint64_t sub_249256E60()
{
  return MEMORY[0x270F5D900]();
}

uint64_t sub_249256E70()
{
  return MEMORY[0x270F5D908]();
}

uint64_t sub_249256E80()
{
  return MEMORY[0x270F5D910]();
}

uint64_t sub_249256E90()
{
  return MEMORY[0x270F5D938]();
}

uint64_t sub_249256EA0()
{
  return MEMORY[0x270F5D940]();
}

uint64_t sub_249256EB0()
{
  return MEMORY[0x270F5D948]();
}

uint64_t sub_249256EC0()
{
  return MEMORY[0x270F5D950]();
}

uint64_t sub_249256ED0()
{
  return MEMORY[0x270F5D958]();
}

uint64_t sub_249256EE0()
{
  return MEMORY[0x270F5D960]();
}

uint64_t sub_249256EF0()
{
  return MEMORY[0x270F5D968]();
}

uint64_t sub_249256F00()
{
  return MEMORY[0x270F5D970]();
}

uint64_t sub_249256F10()
{
  return MEMORY[0x270F5D980]();
}

uint64_t sub_249256F20()
{
  return MEMORY[0x270F62C10]();
}

uint64_t sub_249256F30()
{
  return MEMORY[0x270F5D998]();
}

uint64_t sub_249256F40()
{
  return MEMORY[0x270F5D9A8]();
}

uint64_t sub_249256FB0()
{
  return MEMORY[0x270F5DA60]();
}

uint64_t sub_249256FC0()
{
  return MEMORY[0x270F5DA98]();
}

uint64_t sub_249256FD0()
{
  return MEMORY[0x270F5DAA0]();
}

uint64_t sub_249256FE0()
{
  return MEMORY[0x270F5DAA8]();
}

uint64_t sub_249256FF0()
{
  return MEMORY[0x270F5DAB0]();
}

uint64_t sub_249257000()
{
  return MEMORY[0x270F5DAB8]();
}

uint64_t sub_249257010()
{
  return MEMORY[0x270F5DAC0]();
}

uint64_t sub_249257020()
{
  return MEMORY[0x270F5DAC8]();
}

uint64_t sub_249257030()
{
  return MEMORY[0x270F5DAE8]();
}

uint64_t sub_249257040()
{
  return MEMORY[0x270F5DAF8]();
}

uint64_t sub_249257050()
{
  return MEMORY[0x270F5DB10]();
}

uint64_t sub_249257060()
{
  return MEMORY[0x270F5DB18]();
}

uint64_t sub_249257070()
{
  return MEMORY[0x270F5DB20]();
}

uint64_t sub_249257080()
{
  return MEMORY[0x270F5DB28]();
}

uint64_t sub_249257090()
{
  return MEMORY[0x270F5DB30]();
}

uint64_t sub_2492570A0()
{
  return MEMORY[0x270F5DB40]();
}

uint64_t sub_2492570B0()
{
  return MEMORY[0x270F5DB48]();
}

uint64_t sub_2492570C0()
{
  return MEMORY[0x270F5DB50]();
}

uint64_t sub_2492570D0()
{
  return MEMORY[0x270F5DB58]();
}

uint64_t sub_2492570E0()
{
  return MEMORY[0x270F5DB60]();
}

uint64_t sub_2492570F0()
{
  return MEMORY[0x270F5DB68]();
}

uint64_t sub_249257100()
{
  return MEMORY[0x270F5DB70]();
}

uint64_t sub_249257110()
{
  return MEMORY[0x270F5DB78]();
}

uint64_t sub_249257120()
{
  return MEMORY[0x270F5DB88]();
}

uint64_t sub_249257130()
{
  return MEMORY[0x270F5DB90]();
}

uint64_t sub_249257140()
{
  return MEMORY[0x270F5DBA0]();
}

uint64_t sub_249257150()
{
  return MEMORY[0x270F5DBA8]();
}

uint64_t sub_249257160()
{
  return MEMORY[0x270F5DBB0]();
}

uint64_t sub_249257170()
{
  return MEMORY[0x270F5DBB8]();
}

uint64_t sub_249257180()
{
  return MEMORY[0x270F5DBC0]();
}

uint64_t sub_249257190()
{
  return MEMORY[0x270F5DBC8]();
}

uint64_t sub_2492571A0()
{
  return MEMORY[0x270F5DBE0]();
}

uint64_t sub_2492571B0()
{
  return MEMORY[0x270F5DC40]();
}

uint64_t sub_2492571C0()
{
  return MEMORY[0x270F5DC48]();
}

uint64_t sub_2492571D0()
{
  return MEMORY[0x270F5DC50]();
}

uint64_t sub_2492571E0()
{
  return MEMORY[0x270F5DC58]();
}

uint64_t sub_2492571F0()
{
  return MEMORY[0x270F5DC60]();
}

uint64_t sub_249257200()
{
  return MEMORY[0x270F5DC68]();
}

uint64_t sub_249257210()
{
  return MEMORY[0x270F5DC70]();
}

uint64_t sub_249257220()
{
  return MEMORY[0x270F5DC78]();
}

uint64_t sub_249257230()
{
  return MEMORY[0x270F5DC80]();
}

uint64_t sub_249257240()
{
  return MEMORY[0x270F5DC88]();
}

uint64_t sub_249257250()
{
  return MEMORY[0x270F5DC90]();
}

uint64_t sub_249257260()
{
  return MEMORY[0x270F5DC98]();
}

uint64_t sub_249257270()
{
  return MEMORY[0x270F5DCA0]();
}

uint64_t sub_249257280()
{
  return MEMORY[0x270F5DCA8]();
}

uint64_t sub_249257290()
{
  return MEMORY[0x270F5DCB8]();
}

uint64_t sub_2492572A0()
{
  return MEMORY[0x270F5DCC0]();
}

uint64_t sub_2492572B0()
{
  return MEMORY[0x270F5DCC8]();
}

uint64_t sub_2492572C0()
{
  return MEMORY[0x270F5DCE0]();
}

uint64_t sub_2492572D0()
{
  return MEMORY[0x270F5DCF0]();
}

uint64_t sub_2492572E0()
{
  return MEMORY[0x270F5DD00]();
}

uint64_t sub_249257300()
{
  return MEMORY[0x270F5DD78]();
}

uint64_t sub_249257310()
{
  return MEMORY[0x270F5DD80]();
}

uint64_t sub_249257320()
{
  return MEMORY[0x270F5DD90]();
}

uint64_t sub_249257330()
{
  return MEMORY[0x270F5DD98]();
}

uint64_t sub_249257340()
{
  return MEMORY[0x270F5DDA8]();
}

uint64_t sub_249257350()
{
  return MEMORY[0x270F5DDB0]();
}

uint64_t sub_249257360()
{
  return MEMORY[0x270F5DDB8]();
}

uint64_t sub_249257370()
{
  return MEMORY[0x270F5DDC0]();
}

uint64_t sub_249257380()
{
  return MEMORY[0x270F5DDC8]();
}

uint64_t sub_249257390()
{
  return MEMORY[0x270F5DE08]();
}

uint64_t sub_2492573A0()
{
  return MEMORY[0x270F5DE30]();
}

uint64_t sub_2492573C0()
{
  return MEMORY[0x270F5DE48]();
}

uint64_t sub_2492573D0()
{
  return MEMORY[0x270F5DE50]();
}

uint64_t sub_2492573E0()
{
  return MEMORY[0x270F5DE58]();
}

uint64_t sub_2492573F0()
{
  return MEMORY[0x270F5DE70]();
}

uint64_t sub_249257400()
{
  return MEMORY[0x270F5DE78]();
}

uint64_t sub_249257410()
{
  return MEMORY[0x270F5DF18]();
}

uint64_t sub_249257420()
{
  return MEMORY[0x270F5DF78]();
}

uint64_t sub_249257430()
{
  return MEMORY[0x270F5DF80]();
}

uint64_t sub_249257440()
{
  return MEMORY[0x270F5DFB0]();
}

uint64_t sub_249257450()
{
  return MEMORY[0x270F5DFB8]();
}

uint64_t sub_249257460()
{
  return MEMORY[0x270F5DFC0]();
}

uint64_t sub_249257470()
{
  return MEMORY[0x270F5DFD0]();
}

uint64_t sub_249257480()
{
  return MEMORY[0x270F5DFD8]();
}

uint64_t sub_249257490()
{
  return MEMORY[0x270F5DFE0]();
}

uint64_t sub_2492574A0()
{
  return MEMORY[0x270F5E000]();
}

uint64_t sub_2492574B0()
{
  return MEMORY[0x270F5E008]();
}

uint64_t sub_2492574C0()
{
  return MEMORY[0x270F5E038]();
}

uint64_t sub_2492574E0()
{
  return MEMORY[0x270F5E078]();
}

uint64_t sub_2492574F0()
{
  return MEMORY[0x270F5E0C8]();
}

uint64_t sub_249257500()
{
  return MEMORY[0x270F5E0E0]();
}

uint64_t sub_249257510()
{
  return MEMORY[0x270F5E0E8]();
}

uint64_t sub_249257520()
{
  return MEMORY[0x270F5E110]();
}

uint64_t sub_249257530()
{
  return MEMORY[0x270F5E118]();
}

uint64_t sub_249257540()
{
  return MEMORY[0x270F5E188]();
}

uint64_t sub_249257550()
{
  return MEMORY[0x270F5E230]();
}

uint64_t sub_249257560()
{
  return MEMORY[0x270F5E3A0]();
}

uint64_t sub_249257570()
{
  return MEMORY[0x270F5E3A8]();
}

uint64_t sub_249257580()
{
  return MEMORY[0x270F5E3D0]();
}

uint64_t sub_249257590()
{
  return MEMORY[0x270F5E400]();
}

uint64_t sub_2492575A0()
{
  return MEMORY[0x270F5E408]();
}

uint64_t sub_2492575B0()
{
  return MEMORY[0x270F5E428]();
}

uint64_t sub_2492575C0()
{
  return MEMORY[0x270F5E4A0]();
}

uint64_t sub_2492575D0()
{
  return MEMORY[0x270F5E4C0]();
}

uint64_t sub_2492575E0()
{
  return MEMORY[0x270F5E4C8]();
}

uint64_t sub_2492575F0()
{
  return MEMORY[0x270F5E508]();
}

uint64_t sub_249257600()
{
  return MEMORY[0x270F5E518]();
}

uint64_t sub_249257610()
{
  return MEMORY[0x270F5E528]();
}

uint64_t sub_249257620()
{
  return MEMORY[0x270F5E530]();
}

uint64_t sub_249257630()
{
  return MEMORY[0x270F5E548]();
}

uint64_t sub_249257640()
{
  return MEMORY[0x270F5E550]();
}

uint64_t sub_249257650()
{
  return MEMORY[0x270F5E558]();
}

uint64_t sub_249257660()
{
  return MEMORY[0x270F5E560]();
}

uint64_t sub_249257670()
{
  return MEMORY[0x270F5E590]();
}

uint64_t sub_249257680()
{
  return MEMORY[0x270F5E598]();
}

uint64_t sub_249257690()
{
  return MEMORY[0x270F5E5B8]();
}

uint64_t sub_2492576A0()
{
  return MEMORY[0x270F5E5C0]();
}

uint64_t sub_2492576B0()
{
  return MEMORY[0x270F5E5E8]();
}

uint64_t sub_2492576C0()
{
  return MEMORY[0x270F5E660]();
}

uint64_t sub_2492576D0()
{
  return MEMORY[0x270F5E6B8]();
}

uint64_t sub_2492576E0()
{
  return MEMORY[0x270F5E6C0]();
}

uint64_t sub_2492576F0()
{
  return MEMORY[0x270F5E708]();
}

uint64_t sub_249257700()
{
  return MEMORY[0x270F5E710]();
}

uint64_t sub_249257710()
{
  return MEMORY[0x270F5E720]();
}

uint64_t sub_249257720()
{
  return MEMORY[0x270F5E728]();
}

uint64_t sub_249257730()
{
  return MEMORY[0x270F5E758]();
}

uint64_t sub_249257740()
{
  return MEMORY[0x270F5E760]();
}

uint64_t sub_249257750()
{
  return MEMORY[0x270F5E768]();
}

uint64_t sub_249257760()
{
  return MEMORY[0x270F5E770]();
}

uint64_t sub_249257770()
{
  return MEMORY[0x270F5E778]();
}

uint64_t sub_249257780()
{
  return MEMORY[0x270F5E780]();
}

uint64_t sub_249257790()
{
  return MEMORY[0x270F5E798]();
}

uint64_t sub_2492577A0()
{
  return MEMORY[0x270F5E7A0]();
}

uint64_t sub_2492577B0()
{
  return MEMORY[0x270F5E7A8]();
}

uint64_t sub_2492577C0()
{
  return MEMORY[0x270F5E7B0]();
}

uint64_t sub_2492577D0()
{
  return MEMORY[0x270F5E808]();
}

uint64_t sub_2492577E0()
{
  return MEMORY[0x270F5E810]();
}

uint64_t sub_2492577F0()
{
  return MEMORY[0x270F5E818]();
}

uint64_t sub_249257800()
{
  return MEMORY[0x270F5E828]();
}

uint64_t sub_249257810()
{
  return MEMORY[0x270F5E860]();
}

uint64_t sub_249257820()
{
  return MEMORY[0x270F5E870]();
}

uint64_t sub_249257830()
{
  return MEMORY[0x270F5E878]();
}

uint64_t sub_249257840()
{
  return MEMORY[0x270F5E880]();
}

uint64_t sub_249257850()
{
  return MEMORY[0x270F5E8A0]();
}

uint64_t sub_249257860()
{
  return MEMORY[0x270F5E8A8]();
}

uint64_t sub_249257870()
{
  return MEMORY[0x270F5E8B0]();
}

uint64_t sub_249257880()
{
  return MEMORY[0x270F5E8B8]();
}

uint64_t sub_249257890()
{
  return MEMORY[0x270F5E8C0]();
}

uint64_t sub_2492578A0()
{
  return MEMORY[0x270F5E8C8]();
}

uint64_t sub_2492578B0()
{
  return MEMORY[0x270F5E8D0]();
}

uint64_t sub_2492578C0()
{
  return MEMORY[0x270F5E900]();
}

uint64_t sub_2492578D0()
{
  return MEMORY[0x270F5E918]();
}

uint64_t sub_2492578E0()
{
  return MEMORY[0x270F5E948]();
}

uint64_t sub_2492578F0()
{
  return MEMORY[0x270F5E950]();
}

uint64_t sub_249257900()
{
  return MEMORY[0x270F5E958]();
}

uint64_t sub_249257910()
{
  return MEMORY[0x270F5E988]();
}

uint64_t sub_249257920()
{
  return MEMORY[0x270F5E990]();
}

uint64_t sub_249257930()
{
  return MEMORY[0x270F5E998]();
}

uint64_t sub_249257940()
{
  return MEMORY[0x270F5E9B0]();
}

uint64_t sub_249257950()
{
  return MEMORY[0x270F5E9C8]();
}

uint64_t sub_249257960()
{
  return MEMORY[0x270F5E9D0]();
}

uint64_t sub_249257970()
{
  return MEMORY[0x270F5E9D8]();
}

uint64_t sub_249257980()
{
  return MEMORY[0x270F5E9E0]();
}

uint64_t sub_249257990()
{
  return MEMORY[0x270F29BD0]();
}

uint64_t sub_2492579A0()
{
  return MEMORY[0x270F29BD8]();
}

uint64_t sub_2492579B0()
{
  return MEMORY[0x270F29BE0]();
}

uint64_t sub_2492579C0()
{
  return MEMORY[0x270F29BE8]();
}

uint64_t sub_2492579D0()
{
  return MEMORY[0x270F29BF0]();
}

uint64_t sub_2492579E0()
{
  return MEMORY[0x270F29BF8]();
}

uint64_t sub_2492579F0()
{
  return MEMORY[0x270F29C00]();
}

uint64_t sub_249257A00()
{
  return MEMORY[0x270F29C08]();
}

uint64_t sub_249257A10()
{
  return MEMORY[0x270F29C10]();
}

uint64_t sub_249257A20()
{
  return MEMORY[0x270F29C18]();
}

uint64_t sub_249257A30()
{
  return MEMORY[0x270F29C20]();
}

uint64_t sub_249257A40()
{
  return MEMORY[0x270F29C28]();
}

uint64_t sub_249257A50()
{
  return MEMORY[0x270F29C30]();
}

uint64_t sub_249257A60()
{
  return MEMORY[0x270F29C38]();
}

uint64_t sub_249257A70()
{
  return MEMORY[0x270F29C40]();
}

uint64_t sub_249257A80()
{
  return MEMORY[0x270F29C48]();
}

uint64_t sub_249257A90()
{
  return MEMORY[0x270F29C50]();
}

uint64_t sub_249257AA0()
{
  return MEMORY[0x270F29C58]();
}

uint64_t sub_249257AB0()
{
  return MEMORY[0x270F29C60]();
}

uint64_t sub_249257AC0()
{
  return MEMORY[0x270F29C68]();
}

uint64_t sub_249257AD0()
{
  return MEMORY[0x270F29C70]();
}

uint64_t sub_249257AE0()
{
  return MEMORY[0x270F29C78]();
}

uint64_t sub_249257AF0()
{
  return MEMORY[0x270F29C80]();
}

uint64_t sub_249257B00()
{
  return MEMORY[0x270F29C88]();
}

uint64_t sub_249257B10()
{
  return MEMORY[0x270F29C90]();
}

uint64_t sub_249257B20()
{
  return MEMORY[0x270F29C98]();
}

uint64_t sub_249257B30()
{
  return MEMORY[0x270F29CA0]();
}

uint64_t sub_249257B40()
{
  return MEMORY[0x270F29CA8]();
}

uint64_t sub_249257B50()
{
  return MEMORY[0x270F29CB0]();
}

uint64_t sub_249257B60()
{
  return MEMORY[0x270F29CB8]();
}

uint64_t sub_249257B70()
{
  return MEMORY[0x270F29CC0]();
}

uint64_t sub_249257B80()
{
  return MEMORY[0x270F29CC8]();
}

uint64_t sub_249257B90()
{
  return MEMORY[0x270F29CD0]();
}

uint64_t sub_249257BA0()
{
  return MEMORY[0x270F29CD8]();
}

uint64_t sub_249257BB0()
{
  return MEMORY[0x270F29CE0]();
}

uint64_t sub_249257BC0()
{
  return MEMORY[0x270F29CE8]();
}

uint64_t sub_249257BD0()
{
  return MEMORY[0x270F29CF0]();
}

uint64_t sub_249257BE0()
{
  return MEMORY[0x270F29CF8]();
}

uint64_t sub_249257BF0()
{
  return MEMORY[0x270F29D00]();
}

uint64_t sub_249257C00()
{
  return MEMORY[0x270F29D08]();
}

uint64_t sub_249257C10()
{
  return MEMORY[0x270F29D10]();
}

uint64_t sub_249257C20()
{
  return MEMORY[0x270F29D18]();
}

uint64_t sub_249257C30()
{
  return MEMORY[0x270F29D20]();
}

uint64_t sub_249257C40()
{
  return MEMORY[0x270F29D28]();
}

uint64_t sub_249257C50()
{
  return MEMORY[0x270F29D30]();
}

uint64_t sub_249257C60()
{
  return MEMORY[0x270F29D38]();
}

uint64_t sub_249257C70()
{
  return MEMORY[0x270F29D40]();
}

uint64_t sub_249257C80()
{
  return MEMORY[0x270F29D48]();
}

uint64_t sub_249257C90()
{
  return MEMORY[0x270F29D50]();
}

uint64_t sub_249257CA0()
{
  return MEMORY[0x270F29D58]();
}

uint64_t sub_249257CB0()
{
  return MEMORY[0x270F29D60]();
}

uint64_t sub_249257CC0()
{
  return MEMORY[0x270F29D68]();
}

uint64_t sub_249257CD0()
{
  return MEMORY[0x270F29D70]();
}

uint64_t sub_249257CE0()
{
  return MEMORY[0x270F29D78]();
}

uint64_t sub_249257CF0()
{
  return MEMORY[0x270F29D80]();
}

uint64_t sub_249257D00()
{
  return MEMORY[0x270F29D88]();
}

uint64_t sub_249257D10()
{
  return MEMORY[0x270F29D90]();
}

uint64_t sub_249257D20()
{
  return MEMORY[0x270F29D98]();
}

uint64_t sub_249257D30()
{
  return MEMORY[0x270F29DA0]();
}

uint64_t sub_249257D40()
{
  return MEMORY[0x270F29DA8]();
}

uint64_t sub_249257D50()
{
  return MEMORY[0x270F29DB0]();
}

uint64_t sub_249257D60()
{
  return MEMORY[0x270F29DB8]();
}

uint64_t sub_249257D70()
{
  return MEMORY[0x270F29DC0]();
}

uint64_t sub_249257D80()
{
  return MEMORY[0x270F29DC8]();
}

uint64_t sub_249257D90()
{
  return MEMORY[0x270F29DD0]();
}

uint64_t sub_249257DA0()
{
  return MEMORY[0x270F29DD8]();
}

uint64_t sub_249257DB0()
{
  return MEMORY[0x270F29DE0]();
}

uint64_t sub_249257DC0()
{
  return MEMORY[0x270F29DE8]();
}

uint64_t sub_249257DD0()
{
  return MEMORY[0x270F29DF0]();
}

uint64_t sub_249257DE0()
{
  return MEMORY[0x270F29DF8]();
}

uint64_t sub_249257DF0()
{
  return MEMORY[0x270F29E00]();
}

uint64_t sub_249257E00()
{
  return MEMORY[0x270F29E08]();
}

uint64_t sub_249257E10()
{
  return MEMORY[0x270F29E10]();
}

uint64_t sub_249257E20()
{
  return MEMORY[0x270F29E18]();
}

uint64_t sub_249257E30()
{
  return MEMORY[0x270F29E20]();
}

uint64_t sub_249257E40()
{
  return MEMORY[0x270F29E28]();
}

uint64_t sub_249257E50()
{
  return MEMORY[0x270F29E30]();
}

uint64_t sub_249257E60()
{
  return MEMORY[0x270F29E38]();
}

uint64_t sub_249257E70()
{
  return MEMORY[0x270F29E40]();
}

uint64_t sub_249257E80()
{
  return MEMORY[0x270F29E48]();
}

uint64_t sub_249257E90()
{
  return MEMORY[0x270F29E50]();
}

uint64_t sub_249257EA0()
{
  return MEMORY[0x270F29E58]();
}

uint64_t sub_249257EB0()
{
  return MEMORY[0x270F29E60]();
}

uint64_t sub_249257EC0()
{
  return MEMORY[0x270F29E68]();
}

uint64_t sub_249257ED0()
{
  return MEMORY[0x270F29E70]();
}

uint64_t sub_249257EE0()
{
  return MEMORY[0x270F29E78]();
}

uint64_t sub_249257EF0()
{
  return MEMORY[0x270F29E80]();
}

uint64_t sub_249257F00()
{
  return MEMORY[0x270F29E88]();
}

uint64_t sub_249257F10()
{
  return MEMORY[0x270F29E90]();
}

uint64_t sub_249257F20()
{
  return MEMORY[0x270F29E98]();
}

uint64_t sub_249257F30()
{
  return MEMORY[0x270F29EA0]();
}

uint64_t sub_249257F50()
{
  return MEMORY[0x270F29EB0]();
}

uint64_t sub_249257F60()
{
  return MEMORY[0x270F29EB8]();
}

uint64_t sub_249257F70()
{
  return MEMORY[0x270F29EC0]();
}

uint64_t sub_249257F80()
{
  return MEMORY[0x270F29EC8]();
}

uint64_t sub_249257F90()
{
  return MEMORY[0x270F29ED0]();
}

uint64_t sub_249257FA0()
{
  return MEMORY[0x270F29ED8]();
}

uint64_t sub_249257FB0()
{
  return MEMORY[0x270F29EE0]();
}

uint64_t sub_249257FC0()
{
  return MEMORY[0x270F29EE8]();
}

uint64_t sub_249257FD0()
{
  return MEMORY[0x270F29EF0]();
}

uint64_t sub_249257FE0()
{
  return MEMORY[0x270F29EF8]();
}

uint64_t sub_249257FF0()
{
  return MEMORY[0x270F29F00]();
}

uint64_t sub_249258000()
{
  return MEMORY[0x270F29F08]();
}

uint64_t sub_249258010()
{
  return MEMORY[0x270F29F10]();
}

uint64_t sub_249258020()
{
  return MEMORY[0x270F29F18]();
}

uint64_t sub_249258030()
{
  return MEMORY[0x270F29F20]();
}

uint64_t sub_249258040()
{
  return MEMORY[0x270F29F28]();
}

uint64_t sub_249258050()
{
  return MEMORY[0x270F29F30]();
}

uint64_t sub_249258060()
{
  return MEMORY[0x270F29F38]();
}

uint64_t sub_249258070()
{
  return MEMORY[0x270F29F40]();
}

uint64_t sub_249258080()
{
  return MEMORY[0x270F29F48]();
}

uint64_t sub_249258090()
{
  return MEMORY[0x270F29F50]();
}

uint64_t sub_2492580B0()
{
  return MEMORY[0x270F29F60]();
}

uint64_t sub_2492580C0()
{
  return MEMORY[0x270F29F68]();
}

uint64_t sub_2492580D0()
{
  return MEMORY[0x270F29F70]();
}

uint64_t sub_2492580E0()
{
  return MEMORY[0x270F29F78]();
}

uint64_t sub_2492580F0()
{
  return MEMORY[0x270F29F80]();
}

uint64_t sub_249258100()
{
  return MEMORY[0x270F29F88]();
}

uint64_t sub_249258110()
{
  return MEMORY[0x270F29F90]();
}

uint64_t sub_249258120()
{
  return MEMORY[0x270F29F98]();
}

uint64_t sub_249258130()
{
  return MEMORY[0x270F29FA0]();
}

uint64_t sub_249258140()
{
  return MEMORY[0x270F29FA8]();
}

uint64_t sub_249258150()
{
  return MEMORY[0x270F29FB0]();
}

uint64_t sub_249258160()
{
  return MEMORY[0x270F29FB8]();
}

uint64_t sub_249258170()
{
  return MEMORY[0x270F29FC0]();
}

uint64_t sub_249258180()
{
  return MEMORY[0x270F29FC8]();
}

uint64_t sub_249258190()
{
  return MEMORY[0x270F29FD0]();
}

uint64_t sub_2492581A0()
{
  return MEMORY[0x270F29FD8]();
}

uint64_t sub_2492581B0()
{
  return MEMORY[0x270F29FE0]();
}

uint64_t sub_2492581C0()
{
  return MEMORY[0x270F29FE8]();
}

uint64_t sub_2492581D0()
{
  return MEMORY[0x270F29FF0]();
}

uint64_t sub_2492581E0()
{
  return MEMORY[0x270F29FF8]();
}

uint64_t sub_2492581F0()
{
  return MEMORY[0x270F2A000]();
}

uint64_t sub_249258200()
{
  return MEMORY[0x270F2A008]();
}

uint64_t sub_249258210()
{
  return MEMORY[0x270F2A010]();
}

uint64_t sub_249258220()
{
  return MEMORY[0x270F2A018]();
}

uint64_t sub_249258230()
{
  return MEMORY[0x270F2A020]();
}

uint64_t sub_249258240()
{
  return MEMORY[0x270F2A028]();
}

uint64_t sub_249258250()
{
  return MEMORY[0x270F2A030]();
}

uint64_t sub_249258260()
{
  return MEMORY[0x270F2A058]();
}

uint64_t sub_249258270()
{
  return MEMORY[0x270F2A060]();
}

uint64_t sub_249258280()
{
  return MEMORY[0x270F2A068]();
}

uint64_t sub_249258290()
{
  return MEMORY[0x270F2A070]();
}

uint64_t sub_2492582A0()
{
  return MEMORY[0x270F2A078]();
}

uint64_t sub_2492582B0()
{
  return MEMORY[0x270F2A080]();
}

uint64_t sub_2492582C0()
{
  return MEMORY[0x270F2A088]();
}

uint64_t sub_2492582D0()
{
  return MEMORY[0x270F2A090]();
}

uint64_t sub_2492582E0()
{
  return MEMORY[0x270F2A098]();
}

uint64_t sub_2492582F0()
{
  return MEMORY[0x270F2A0A0]();
}

uint64_t sub_249258300()
{
  return MEMORY[0x270F2A0A8]();
}

uint64_t sub_249258310()
{
  return MEMORY[0x270F2A0B0]();
}

uint64_t sub_249258320()
{
  return MEMORY[0x270F2A0B8]();
}

uint64_t sub_249258330()
{
  return MEMORY[0x270F2A0C0]();
}

uint64_t sub_249258340()
{
  return MEMORY[0x270F2A0C8]();
}

uint64_t sub_249258350()
{
  return MEMORY[0x270F2A0D0]();
}

uint64_t sub_249258360()
{
  return MEMORY[0x270F2A0D8]();
}

uint64_t sub_249258370()
{
  return MEMORY[0x270F2A0E0]();
}

uint64_t sub_249258380()
{
  return MEMORY[0x270F2A0E8]();
}

uint64_t sub_249258390()
{
  return MEMORY[0x270F2A0F0]();
}

uint64_t sub_2492583A0()
{
  return MEMORY[0x270F2A0F8]();
}

uint64_t sub_2492583B0()
{
  return MEMORY[0x270F2A100]();
}

uint64_t sub_2492583C0()
{
  return MEMORY[0x270F2A108]();
}

uint64_t sub_2492583D0()
{
  return MEMORY[0x270F2A110]();
}

uint64_t sub_2492583E0()
{
  return MEMORY[0x270F2A118]();
}

uint64_t sub_2492583F0()
{
  return MEMORY[0x270F2A120]();
}

uint64_t sub_249258400()
{
  return MEMORY[0x270F2A128]();
}

uint64_t sub_249258410()
{
  return MEMORY[0x270F2A130]();
}

uint64_t sub_249258420()
{
  return MEMORY[0x270F2A138]();
}

uint64_t sub_249258430()
{
  return MEMORY[0x270F2A140]();
}

uint64_t sub_249258440()
{
  return MEMORY[0x270F2A148]();
}

uint64_t sub_249258450()
{
  return MEMORY[0x270F2A150]();
}

uint64_t sub_249258460()
{
  return MEMORY[0x270F2A158]();
}

uint64_t sub_249258470()
{
  return MEMORY[0x270F2A160]();
}

uint64_t sub_249258480()
{
  return MEMORY[0x270F2A168]();
}

uint64_t sub_249258490()
{
  return MEMORY[0x270F2A170]();
}

uint64_t sub_2492584A0()
{
  return MEMORY[0x270F2A178]();
}

uint64_t sub_2492584B0()
{
  return MEMORY[0x270F2A180]();
}

uint64_t sub_2492584C0()
{
  return MEMORY[0x270F2A188]();
}

uint64_t sub_2492584D0()
{
  return MEMORY[0x270F2A190]();
}

uint64_t sub_2492584E0()
{
  return MEMORY[0x270F2A198]();
}

uint64_t sub_2492584F0()
{
  return MEMORY[0x270F2A1A0]();
}

uint64_t sub_249258500()
{
  return MEMORY[0x270F2A1A8]();
}

uint64_t sub_249258510()
{
  return MEMORY[0x270F2A1B0]();
}

uint64_t sub_249258520()
{
  return MEMORY[0x270F2A1B8]();
}

uint64_t sub_249258530()
{
  return MEMORY[0x270F2A1C0]();
}

uint64_t sub_249258540()
{
  return MEMORY[0x270F2A1C8]();
}

uint64_t sub_249258550()
{
  return MEMORY[0x270F2A1D0]();
}

uint64_t sub_249258560()
{
  return MEMORY[0x270F2A1D8]();
}

uint64_t sub_249258570()
{
  return MEMORY[0x270F2A1E0]();
}

uint64_t sub_249258580()
{
  return MEMORY[0x270F2A1E8]();
}

uint64_t sub_249258590()
{
  return MEMORY[0x270F2A1F0]();
}

uint64_t sub_2492585A0()
{
  return MEMORY[0x270F2A1F8]();
}

uint64_t sub_2492585B0()
{
  return MEMORY[0x270F2A200]();
}

uint64_t sub_2492585C0()
{
  return MEMORY[0x270F2A208]();
}

uint64_t sub_2492585E0()
{
  return MEMORY[0x270F2A218]();
}

uint64_t sub_2492585F0()
{
  return MEMORY[0x270F2A220]();
}

uint64_t sub_249258600()
{
  return MEMORY[0x270F2A228]();
}

uint64_t sub_249258610()
{
  return MEMORY[0x270F2A230]();
}

uint64_t sub_249258620()
{
  return MEMORY[0x270F2A238]();
}

uint64_t sub_249258630()
{
  return MEMORY[0x270F2B9E0]();
}

uint64_t sub_249258640()
{
  return MEMORY[0x270F2B9E8]();
}

uint64_t sub_249258660()
{
  return MEMORY[0x270F2B9F8]();
}

uint64_t sub_249258670()
{
  return MEMORY[0x270F2BA00]();
}

uint64_t sub_249258680()
{
  return MEMORY[0x270F2BA08]();
}

uint64_t sub_249258690()
{
  return MEMORY[0x270F2BA10]();
}

uint64_t sub_2492586A0()
{
  return MEMORY[0x270F2BA18]();
}

uint64_t sub_2492586B0()
{
  return MEMORY[0x270F2BA20]();
}

uint64_t sub_2492586C0()
{
  return MEMORY[0x270F2BA28]();
}

uint64_t sub_2492586D0()
{
  return MEMORY[0x270F2BA30]();
}

uint64_t sub_2492586E0()
{
  return MEMORY[0x270F2BA38]();
}

uint64_t sub_2492586F0()
{
  return MEMORY[0x270F2BA40]();
}

uint64_t sub_249258700()
{
  return MEMORY[0x270F2BA48]();
}

uint64_t sub_249258710()
{
  return MEMORY[0x270F2BA50]();
}

uint64_t sub_249258720()
{
  return MEMORY[0x270F2BA58]();
}

uint64_t sub_249258730()
{
  return MEMORY[0x270F2BA60]();
}

uint64_t sub_249258740()
{
  return MEMORY[0x270F2BA68]();
}

uint64_t sub_249258750()
{
  return MEMORY[0x270F2BA70]();
}

uint64_t sub_249258760()
{
  return MEMORY[0x270F2BA78]();
}

uint64_t sub_249258770()
{
  return MEMORY[0x270F2BA80]();
}

uint64_t sub_249258780()
{
  return MEMORY[0x270F2BA88]();
}

uint64_t sub_249258790()
{
  return MEMORY[0x270F2BA90]();
}

uint64_t sub_2492587A0()
{
  return MEMORY[0x270F2BA98]();
}

uint64_t sub_2492587B0()
{
  return MEMORY[0x270F2BAA0]();
}

uint64_t sub_2492587C0()
{
  return MEMORY[0x270F2BAA8]();
}

uint64_t sub_2492587D0()
{
  return MEMORY[0x270F2BAB0]();
}

uint64_t sub_2492587E0()
{
  return MEMORY[0x270F2BAB8]();
}

uint64_t sub_2492587F0()
{
  return MEMORY[0x270F2BAC0]();
}

uint64_t sub_249258800()
{
  return MEMORY[0x270F2BAC8]();
}

uint64_t sub_249258810()
{
  return MEMORY[0x270F2BAD0]();
}

uint64_t sub_249258820()
{
  return MEMORY[0x270F2BAD8]();
}

uint64_t sub_249258830()
{
  return MEMORY[0x270F2BAE0]();
}

uint64_t sub_249258840()
{
  return MEMORY[0x270F2BAE8]();
}

uint64_t sub_249258850()
{
  return MEMORY[0x270F2BAF0]();
}

uint64_t sub_249258860()
{
  return MEMORY[0x270F2BAF8]();
}

uint64_t sub_249258870()
{
  return MEMORY[0x270F2BB00]();
}

uint64_t sub_249258880()
{
  return MEMORY[0x270F2BB08]();
}

uint64_t sub_249258890()
{
  return MEMORY[0x270F2BB10]();
}

uint64_t sub_2492588A0()
{
  return MEMORY[0x270F2BB18]();
}

uint64_t sub_2492588B0()
{
  return MEMORY[0x270F2BB20]();
}

uint64_t sub_2492588C0()
{
  return MEMORY[0x270F2BB28]();
}

uint64_t sub_2492588D0()
{
  return MEMORY[0x270F2BB30]();
}

uint64_t sub_2492588E0()
{
  return MEMORY[0x270F2BB38]();
}

uint64_t sub_2492588F0()
{
  return MEMORY[0x270F2BB40]();
}

uint64_t sub_249258900()
{
  return MEMORY[0x270F2BB48]();
}

uint64_t sub_249258910()
{
  return MEMORY[0x270F2BB50]();
}

uint64_t sub_249258920()
{
  return MEMORY[0x270F2BB58]();
}

uint64_t sub_249258930()
{
  return MEMORY[0x270F2BB60]();
}

uint64_t sub_249258940()
{
  return MEMORY[0x270F2BB68]();
}

uint64_t sub_249258950()
{
  return MEMORY[0x270F2BB70]();
}

uint64_t sub_249258960()
{
  return MEMORY[0x270F2BB78]();
}

uint64_t sub_249258970()
{
  return MEMORY[0x270F2BB80]();
}

uint64_t sub_249258980()
{
  return MEMORY[0x270F2BB88]();
}

uint64_t sub_249258990()
{
  return MEMORY[0x270F2BB90]();
}

uint64_t sub_2492589A0()
{
  return MEMORY[0x270F2BB98]();
}

uint64_t sub_2492589B0()
{
  return MEMORY[0x270F2BBA0]();
}

uint64_t sub_2492589C0()
{
  return MEMORY[0x270F2BBA8]();
}

uint64_t sub_2492589D0()
{
  return MEMORY[0x270F2BBB0]();
}

uint64_t sub_2492589E0()
{
  return MEMORY[0x270F2BBB8]();
}

uint64_t sub_2492589F0()
{
  return MEMORY[0x270F2BBC0]();
}

uint64_t sub_249258A00()
{
  return MEMORY[0x270F2BBC8]();
}

uint64_t sub_249258A10()
{
  return MEMORY[0x270F2BBD0]();
}

uint64_t sub_249258A20()
{
  return MEMORY[0x270F2BBD8]();
}

uint64_t sub_249258A30()
{
  return MEMORY[0x270F2BBE0]();
}

uint64_t sub_249258A40()
{
  return MEMORY[0x270F2BBE8]();
}

uint64_t sub_249258A50()
{
  return MEMORY[0x270F2BBF0]();
}

uint64_t sub_249258A60()
{
  return MEMORY[0x270F2BBF8]();
}

uint64_t sub_249258A70()
{
  return MEMORY[0x270F2BC00]();
}

uint64_t sub_249258A80()
{
  return MEMORY[0x270F2BC08]();
}

uint64_t sub_249258A90()
{
  return MEMORY[0x270F2BC10]();
}

uint64_t sub_249258AA0()
{
  return MEMORY[0x270F2BC18]();
}

uint64_t sub_249258AB0()
{
  return MEMORY[0x270F2BC20]();
}

uint64_t sub_249258AC0()
{
  return MEMORY[0x270F2BC28]();
}

uint64_t sub_249258AD0()
{
  return MEMORY[0x270F2BC30]();
}

uint64_t sub_249258AE0()
{
  return MEMORY[0x270F2BC38]();
}

uint64_t sub_249258AF0()
{
  return MEMORY[0x270F2BC40]();
}

uint64_t sub_249258B00()
{
  return MEMORY[0x270F2BC48]();
}

uint64_t sub_249258B10()
{
  return MEMORY[0x270F2BC50]();
}

uint64_t sub_249258B20()
{
  return MEMORY[0x270F2BC58]();
}

uint64_t sub_249258B30()
{
  return MEMORY[0x270F2BC60]();
}

uint64_t sub_249258B40()
{
  return MEMORY[0x270F2BC68]();
}

uint64_t sub_249258B50()
{
  return MEMORY[0x270F2BC70]();
}

uint64_t sub_249258B60()
{
  return MEMORY[0x270F2BC78]();
}

uint64_t sub_249258B70()
{
  return MEMORY[0x270F2BC80]();
}

uint64_t sub_249258B80()
{
  return MEMORY[0x270F2BC88]();
}

uint64_t sub_249258B90()
{
  return MEMORY[0x270F2BC90]();
}

uint64_t sub_249258BA0()
{
  return MEMORY[0x270F2BC98]();
}

uint64_t sub_249258BB0()
{
  return MEMORY[0x270F2BCA0]();
}

uint64_t sub_249258BC0()
{
  return MEMORY[0x270F2BCA8]();
}

uint64_t sub_249258BD0()
{
  return MEMORY[0x270F2BCB0]();
}

uint64_t sub_249258BE0()
{
  return MEMORY[0x270F2BCB8]();
}

uint64_t sub_249258BF0()
{
  return MEMORY[0x270F2BCC0]();
}

uint64_t sub_249258C00()
{
  return MEMORY[0x270F2BCC8]();
}

uint64_t sub_249258C10()
{
  return MEMORY[0x270F2BCD0]();
}

uint64_t sub_249258C20()
{
  return MEMORY[0x270F2BCD8]();
}

uint64_t sub_249258C30()
{
  return MEMORY[0x270F2BCE0]();
}

uint64_t sub_249258C40()
{
  return MEMORY[0x270F2BCE8]();
}

uint64_t sub_249258C50()
{
  return MEMORY[0x270F2BCF0]();
}

uint64_t sub_249258C60()
{
  return MEMORY[0x270F2BCF8]();
}

uint64_t sub_249258C70()
{
  return MEMORY[0x270F2BD00]();
}

uint64_t sub_249258C80()
{
  return MEMORY[0x270F2BD08]();
}

uint64_t sub_249258C90()
{
  return MEMORY[0x270F2BD10]();
}

uint64_t sub_249258CA0()
{
  return MEMORY[0x270F2BD18]();
}

uint64_t sub_249258CB0()
{
  return MEMORY[0x270F2BD20]();
}

uint64_t sub_249258CC0()
{
  return MEMORY[0x270F2A7C8]();
}

uint64_t sub_249258CD0()
{
  return MEMORY[0x270F2A7D0]();
}

uint64_t sub_249258CE0()
{
  return MEMORY[0x270F2A7D8]();
}

uint64_t sub_249258CF0()
{
  return MEMORY[0x270F2A7E0]();
}

uint64_t sub_249258D00()
{
  return MEMORY[0x270F2A7E8]();
}

uint64_t sub_249258D10()
{
  return MEMORY[0x270F2A7F0]();
}

uint64_t sub_249258D20()
{
  return MEMORY[0x270F2A7F8]();
}

uint64_t sub_249258D30()
{
  return MEMORY[0x270F2A800]();
}

uint64_t sub_249258D40()
{
  return MEMORY[0x270F2A808]();
}

uint64_t sub_249258D50()
{
  return MEMORY[0x270F2A810]();
}

uint64_t sub_249258D60()
{
  return MEMORY[0x270F2A818]();
}

uint64_t sub_249258D70()
{
  return MEMORY[0x270F2A820]();
}

uint64_t sub_249258D80()
{
  return MEMORY[0x270F2A828]();
}

uint64_t sub_249258D90()
{
  return MEMORY[0x270F2A830]();
}

uint64_t sub_249258DA0()
{
  return MEMORY[0x270F2A838]();
}

uint64_t sub_249258DB0()
{
  return MEMORY[0x270F2A840]();
}

uint64_t sub_249258DC0()
{
  return MEMORY[0x270F2A848]();
}

uint64_t sub_249258DD0()
{
  return MEMORY[0x270F2A850]();
}

uint64_t sub_249258DE0()
{
  return MEMORY[0x270F2A858]();
}

uint64_t sub_249258DF0()
{
  return MEMORY[0x270F2A860]();
}

uint64_t sub_249258E00()
{
  return MEMORY[0x270F2A868]();
}

uint64_t sub_249258E10()
{
  return MEMORY[0x270F2A870]();
}

uint64_t sub_249258E20()
{
  return MEMORY[0x270F2A878]();
}

uint64_t sub_249258E30()
{
  return MEMORY[0x270F2A880]();
}

uint64_t sub_249258E40()
{
  return MEMORY[0x270F2A888]();
}

uint64_t sub_249258E50()
{
  return MEMORY[0x270F2A890]();
}

uint64_t sub_249258E60()
{
  return MEMORY[0x270F2A898]();
}

uint64_t sub_249258E70()
{
  return MEMORY[0x270F2A8A0]();
}

uint64_t sub_249258E80()
{
  return MEMORY[0x270F2A8A8]();
}

uint64_t sub_249258E90()
{
  return MEMORY[0x270F2A8B0]();
}

uint64_t sub_249258EA0()
{
  return MEMORY[0x270F2A8B8]();
}

uint64_t sub_249258EB0()
{
  return MEMORY[0x270F2A8C0]();
}

uint64_t sub_249258EC0()
{
  return MEMORY[0x270F2A8C8]();
}

uint64_t sub_249258ED0()
{
  return MEMORY[0x270F2A8D0]();
}

uint64_t sub_249258EE0()
{
  return MEMORY[0x270F2A8D8]();
}

uint64_t sub_249258EF0()
{
  return MEMORY[0x270F2A8E0]();
}

uint64_t sub_249258F00()
{
  return MEMORY[0x270F2A8E8]();
}

uint64_t sub_249258F10()
{
  return MEMORY[0x270F2A8F0]();
}

uint64_t sub_249258F20()
{
  return MEMORY[0x270F2A8F8]();
}

uint64_t sub_249258F30()
{
  return MEMORY[0x270F2A900]();
}

uint64_t sub_249258F40()
{
  return MEMORY[0x270F2A908]();
}

uint64_t sub_249258F50()
{
  return MEMORY[0x270F2A910]();
}

uint64_t sub_249258F60()
{
  return MEMORY[0x270F2A918]();
}

uint64_t sub_249258F70()
{
  return MEMORY[0x270F2A920]();
}

uint64_t sub_249258F80()
{
  return MEMORY[0x270F2A928]();
}

uint64_t sub_249258F90()
{
  return MEMORY[0x270F2A930]();
}

uint64_t sub_249258FA0()
{
  return MEMORY[0x270F2A938]();
}

uint64_t sub_249258FB0()
{
  return MEMORY[0x270F2A940]();
}

uint64_t sub_249258FC0()
{
  return MEMORY[0x270F2A948]();
}

uint64_t sub_249258FD0()
{
  return MEMORY[0x270F2A950]();
}

uint64_t sub_249258FE0()
{
  return MEMORY[0x270F2A958]();
}

uint64_t sub_249258FF0()
{
  return MEMORY[0x270F2A960]();
}

uint64_t sub_249259000()
{
  return MEMORY[0x270F2A968]();
}

uint64_t sub_249259010()
{
  return MEMORY[0x270F2A970]();
}

uint64_t sub_249259020()
{
  return MEMORY[0x270F2A978]();
}

uint64_t sub_249259030()
{
  return MEMORY[0x270F2A980]();
}

uint64_t sub_249259040()
{
  return MEMORY[0x270F2A988]();
}

uint64_t sub_249259050()
{
  return MEMORY[0x270F2A990]();
}

uint64_t sub_249259060()
{
  return MEMORY[0x270F2A998]();
}

uint64_t sub_249259070()
{
  return MEMORY[0x270F2A9A0]();
}

uint64_t sub_249259080()
{
  return MEMORY[0x270F2A9A8]();
}

uint64_t sub_249259090()
{
  return MEMORY[0x270F2A9B0]();
}

uint64_t sub_2492590A0()
{
  return MEMORY[0x270F2A9B8]();
}

uint64_t sub_2492590B0()
{
  return MEMORY[0x270F2A9C0]();
}

uint64_t sub_2492590C0()
{
  return MEMORY[0x270F2A9C8]();
}

uint64_t sub_2492590D0()
{
  return MEMORY[0x270F2A9D0]();
}

uint64_t sub_2492590E0()
{
  return MEMORY[0x270F2A9D8]();
}

uint64_t sub_2492590F0()
{
  return MEMORY[0x270F2A9E0]();
}

uint64_t sub_249259100()
{
  return MEMORY[0x270F2A9E8]();
}

uint64_t sub_249259110()
{
  return MEMORY[0x270F2A9F0]();
}

uint64_t sub_249259120()
{
  return MEMORY[0x270F2A9F8]();
}

uint64_t sub_249259130()
{
  return MEMORY[0x270F2AA00]();
}

uint64_t sub_249259140()
{
  return MEMORY[0x270F2AA08]();
}

uint64_t sub_249259150()
{
  return MEMORY[0x270F2AA10]();
}

uint64_t sub_249259160()
{
  return MEMORY[0x270F2AA18]();
}

uint64_t sub_249259170()
{
  return MEMORY[0x270F2AA20]();
}

uint64_t sub_249259180()
{
  return MEMORY[0x270F2AA28]();
}

uint64_t sub_249259190()
{
  return MEMORY[0x270F2AA30]();
}

uint64_t sub_2492591A0()
{
  return MEMORY[0x270F2AA38]();
}

uint64_t sub_2492591B0()
{
  return MEMORY[0x270F2AA40]();
}

uint64_t sub_2492591C0()
{
  return MEMORY[0x270F2AA48]();
}

uint64_t sub_2492591D0()
{
  return MEMORY[0x270F2AA50]();
}

uint64_t sub_2492591E0()
{
  return MEMORY[0x270F2AA58]();
}

uint64_t sub_2492591F0()
{
  return MEMORY[0x270F2AA60]();
}

uint64_t sub_249259200()
{
  return MEMORY[0x270F2AA68]();
}

uint64_t sub_249259210()
{
  return MEMORY[0x270F2AA70]();
}

uint64_t sub_249259220()
{
  return MEMORY[0x270F2AA78]();
}

uint64_t sub_249259230()
{
  return MEMORY[0x270F2AA80]();
}

uint64_t sub_249259240()
{
  return MEMORY[0x270F2AA88]();
}

uint64_t sub_249259250()
{
  return MEMORY[0x270F2AA90]();
}

uint64_t sub_249259260()
{
  return MEMORY[0x270F2AA98]();
}

uint64_t sub_249259270()
{
  return MEMORY[0x270F2AAA0]();
}

uint64_t sub_249259280()
{
  return MEMORY[0x270F2AAA8]();
}

uint64_t sub_249259290()
{
  return MEMORY[0x270F2AAB0]();
}

uint64_t sub_2492592A0()
{
  return MEMORY[0x270F2AAB8]();
}

uint64_t sub_2492592B0()
{
  return MEMORY[0x270F2AAC0]();
}

uint64_t sub_2492592C0()
{
  return MEMORY[0x270F2AAC8]();
}

uint64_t sub_2492592D0()
{
  return MEMORY[0x270F2AAD0]();
}

uint64_t sub_2492592E0()
{
  return MEMORY[0x270F2AAD8]();
}

uint64_t sub_2492592F0()
{
  return MEMORY[0x270F2AAE0]();
}

uint64_t sub_249259300()
{
  return MEMORY[0x270F2AAE8]();
}

uint64_t sub_249259310()
{
  return MEMORY[0x270F2AAF0]();
}

uint64_t sub_249259320()
{
  return MEMORY[0x270F2AAF8]();
}

uint64_t sub_249259330()
{
  return MEMORY[0x270F2AB00]();
}

uint64_t sub_249259340()
{
  return MEMORY[0x270F2AB08]();
}

uint64_t sub_249259350()
{
  return MEMORY[0x270F2AB10]();
}

uint64_t sub_249259360()
{
  return MEMORY[0x270F2AB18]();
}

uint64_t sub_249259370()
{
  return MEMORY[0x270F2AB20]();
}

uint64_t sub_249259380()
{
  return MEMORY[0x270F2AB28]();
}

uint64_t sub_249259390()
{
  return MEMORY[0x270F2AB30]();
}

uint64_t sub_2492593A0()
{
  return MEMORY[0x270F2AB38]();
}

uint64_t sub_2492593B0()
{
  return MEMORY[0x270F2AB40]();
}

uint64_t sub_2492593C0()
{
  return MEMORY[0x270F2AB48]();
}

uint64_t sub_2492593D0()
{
  return MEMORY[0x270F2AB50]();
}

uint64_t sub_2492593E0()
{
  return MEMORY[0x270F2AB58]();
}

uint64_t sub_2492593F0()
{
  return MEMORY[0x270F2AB60]();
}

uint64_t sub_249259400()
{
  return MEMORY[0x270F2AB68]();
}

uint64_t sub_249259410()
{
  return MEMORY[0x270F2AB70]();
}

uint64_t sub_249259420()
{
  return MEMORY[0x270F2AB78]();
}

uint64_t sub_249259430()
{
  return MEMORY[0x270F2AB80]();
}

uint64_t sub_249259440()
{
  return MEMORY[0x270F2AB88]();
}

uint64_t sub_249259450()
{
  return MEMORY[0x270F2AB90]();
}

uint64_t sub_249259460()
{
  return MEMORY[0x270F2AB98]();
}

uint64_t sub_249259470()
{
  return MEMORY[0x270F2ABA0]();
}

uint64_t sub_249259480()
{
  return MEMORY[0x270F2ABA8]();
}

uint64_t sub_249259490()
{
  return MEMORY[0x270F2ABB0]();
}

uint64_t sub_2492594A0()
{
  return MEMORY[0x270F2ABB8]();
}

uint64_t sub_2492594B0()
{
  return MEMORY[0x270F2ABC0]();
}

uint64_t sub_2492594C0()
{
  return MEMORY[0x270F2ABC8]();
}

uint64_t sub_2492594D0()
{
  return MEMORY[0x270F2ABD0]();
}

uint64_t sub_2492594E0()
{
  return MEMORY[0x270F2ABD8]();
}

uint64_t sub_2492594F0()
{
  return MEMORY[0x270F2ABE0]();
}

uint64_t sub_249259500()
{
  return MEMORY[0x270F2ABE8]();
}

uint64_t sub_249259510()
{
  return MEMORY[0x270F2ABF0]();
}

uint64_t sub_249259520()
{
  return MEMORY[0x270F2ABF8]();
}

uint64_t sub_249259530()
{
  return MEMORY[0x270F2AC00]();
}

uint64_t sub_249259540()
{
  return MEMORY[0x270F2AC08]();
}

uint64_t sub_249259550()
{
  return MEMORY[0x270F2AC10]();
}

uint64_t sub_249259560()
{
  return MEMORY[0x270F2AC18]();
}

uint64_t sub_249259570()
{
  return MEMORY[0x270F2AC20]();
}

uint64_t sub_249259580()
{
  return MEMORY[0x270F2AC28]();
}

uint64_t sub_249259590()
{
  return MEMORY[0x270F2AC30]();
}

uint64_t sub_2492595A0()
{
  return MEMORY[0x270F2AC38]();
}

uint64_t sub_2492595B0()
{
  return MEMORY[0x270F2AC40]();
}

uint64_t sub_2492595C0()
{
  return MEMORY[0x270F2AC48]();
}

uint64_t sub_2492595D0()
{
  return MEMORY[0x270F2AC50]();
}

uint64_t sub_2492595E0()
{
  return MEMORY[0x270F2AC58]();
}

uint64_t sub_2492595F0()
{
  return MEMORY[0x270F2AC60]();
}

uint64_t sub_249259600()
{
  return MEMORY[0x270F2AC68]();
}

uint64_t sub_249259610()
{
  return MEMORY[0x270F2AC70]();
}

uint64_t sub_249259620()
{
  return MEMORY[0x270F2AC78]();
}

uint64_t sub_249259630()
{
  return MEMORY[0x270F2AC80]();
}

uint64_t sub_249259640()
{
  return MEMORY[0x270F2AC88]();
}

uint64_t sub_249259650()
{
  return MEMORY[0x270F2AC90]();
}

uint64_t sub_249259660()
{
  return MEMORY[0x270F2AC98]();
}

uint64_t sub_249259670()
{
  return MEMORY[0x270F2ACA0]();
}

uint64_t sub_249259680()
{
  return MEMORY[0x270F2ACA8]();
}

uint64_t sub_249259690()
{
  return MEMORY[0x270F2ACB0]();
}

uint64_t sub_2492596A0()
{
  return MEMORY[0x270F2ACB8]();
}

uint64_t sub_2492596B0()
{
  return MEMORY[0x270F2ACC0]();
}

uint64_t sub_2492596C0()
{
  return MEMORY[0x270F2AD78]();
}

uint64_t sub_2492596D0()
{
  return MEMORY[0x270F2AD88]();
}

uint64_t sub_2492596E0()
{
  return MEMORY[0x270F2AD90]();
}

uint64_t sub_2492596F0()
{
  return MEMORY[0x270F2AE08]();
}

uint64_t sub_249259700()
{
  return MEMORY[0x270F2AE30]();
}

uint64_t sub_249259710()
{
  return MEMORY[0x270F2AE38]();
}

uint64_t sub_249259720()
{
  return MEMORY[0x270F2AE40]();
}

uint64_t sub_249259730()
{
  return MEMORY[0x270F2AE48]();
}

uint64_t sub_249259740()
{
  return MEMORY[0x270F2AE58]();
}

uint64_t sub_249259750()
{
  return MEMORY[0x270F2AE60]();
}

uint64_t sub_249259760()
{
  return MEMORY[0x270F2AE68]();
}

uint64_t sub_249259770()
{
  return MEMORY[0x270F2AE78]();
}

uint64_t sub_249259780()
{
  return MEMORY[0x270F2AE80]();
}

uint64_t sub_249259790()
{
  return MEMORY[0x270F2AE88]();
}

uint64_t sub_2492597A0()
{
  return MEMORY[0x270F2AE90]();
}

uint64_t sub_2492597B0()
{
  return MEMORY[0x270F2AE98]();
}

uint64_t sub_2492597C0()
{
  return MEMORY[0x270F2AEA0]();
}

uint64_t sub_2492597D0()
{
  return MEMORY[0x270F2AEB0]();
}

uint64_t sub_2492597E0()
{
  return MEMORY[0x270F2AEB8]();
}

uint64_t sub_2492597F0()
{
  return MEMORY[0x270F2AEC0]();
}

uint64_t sub_249259800()
{
  return MEMORY[0x270F2AEC8]();
}

uint64_t sub_249259810()
{
  return MEMORY[0x270F2AED0]();
}

uint64_t sub_249259820()
{
  return MEMORY[0x270F2AEE0]();
}

uint64_t sub_249259830()
{
  return MEMORY[0x270F2AF08]();
}

uint64_t sub_249259840()
{
  return MEMORY[0x270F2AF10]();
}

uint64_t sub_249259850()
{
  return MEMORY[0x270F2AF18]();
}

uint64_t sub_249259860()
{
  return MEMORY[0x270F2AF20]();
}

uint64_t sub_249259870()
{
  return MEMORY[0x270F2AF28]();
}

uint64_t sub_249259890()
{
  return MEMORY[0x270F2AF70]();
}

uint64_t sub_2492598A0()
{
  return MEMORY[0x270F2AF78]();
}

uint64_t sub_2492598B0()
{
  return MEMORY[0x270F2AF80]();
}

uint64_t sub_2492598C0()
{
  return MEMORY[0x270F2AF88]();
}

uint64_t sub_2492598D0()
{
  return MEMORY[0x270F2AF90]();
}

uint64_t sub_2492598E0()
{
  return MEMORY[0x270F2AF98]();
}

uint64_t sub_2492598F0()
{
  return MEMORY[0x270F2AFA0]();
}

uint64_t sub_249259900()
{
  return MEMORY[0x270F2AFA8]();
}

uint64_t sub_249259910()
{
  return MEMORY[0x270F2AFB0]();
}

uint64_t sub_249259920()
{
  return MEMORY[0x270F2AFB8]();
}

uint64_t sub_249259930()
{
  return MEMORY[0x270F2AFC0]();
}

uint64_t sub_249259940()
{
  return MEMORY[0x270F2AFC8]();
}

uint64_t sub_249259950()
{
  return MEMORY[0x270F2AFD0]();
}

uint64_t sub_249259960()
{
  return MEMORY[0x270F2AFD8]();
}

uint64_t sub_249259970()
{
  return MEMORY[0x270F2AFE0]();
}

uint64_t sub_249259980()
{
  return MEMORY[0x270F2AFE8]();
}

uint64_t sub_249259990()
{
  return MEMORY[0x270F2AFF0]();
}

uint64_t sub_2492599A0()
{
  return MEMORY[0x270F2AFF8]();
}

uint64_t sub_2492599B0()
{
  return MEMORY[0x270F2B020]();
}

uint64_t sub_2492599C0()
{
  return MEMORY[0x270F2B028]();
}

uint64_t sub_2492599D0()
{
  return MEMORY[0x270F2B030]();
}

uint64_t sub_2492599E0()
{
  return MEMORY[0x270F2B038]();
}

uint64_t sub_2492599F0()
{
  return MEMORY[0x270F2B040]();
}

uint64_t sub_249259A00()
{
  return MEMORY[0x270F2B048]();
}

uint64_t sub_249259A10()
{
  return MEMORY[0x270F2B050]();
}

uint64_t sub_249259A20()
{
  return MEMORY[0x270F2B070]();
}

uint64_t sub_249259A30()
{
  return MEMORY[0x270F2B078]();
}

uint64_t sub_249259A40()
{
  return MEMORY[0x270F2B080]();
}

uint64_t sub_249259A50()
{
  return MEMORY[0x270F2B0A8]();
}

uint64_t sub_249259A60()
{
  return MEMORY[0x270F2B0B0]();
}

uint64_t sub_249259A70()
{
  return MEMORY[0x270F2B0B8]();
}

uint64_t sub_249259A80()
{
  return MEMORY[0x270F2B0C0]();
}

uint64_t sub_249259A90()
{
  return MEMORY[0x270F2B0C8]();
}

uint64_t sub_249259AA0()
{
  return MEMORY[0x270F2B0D0]();
}

uint64_t sub_249259AB0()
{
  return MEMORY[0x270F2B0D8]();
}

uint64_t sub_249259AC0()
{
  return MEMORY[0x270F2B0E0]();
}

uint64_t sub_249259AD0()
{
  return MEMORY[0x270F2B0E8]();
}

uint64_t sub_249259AE0()
{
  return MEMORY[0x270F2B0F0]();
}

uint64_t sub_249259AF0()
{
  return MEMORY[0x270F2B0F8]();
}

uint64_t sub_249259B00()
{
  return MEMORY[0x270F2B100]();
}

uint64_t sub_249259B10()
{
  return MEMORY[0x270F2B108]();
}

uint64_t sub_249259B20()
{
  return MEMORY[0x270F2B110]();
}

uint64_t sub_249259B30()
{
  return MEMORY[0x270F2B118]();
}

uint64_t sub_249259B40()
{
  return MEMORY[0x270F2B120]();
}

uint64_t sub_249259B50()
{
  return MEMORY[0x270F2B128]();
}

uint64_t sub_249259B60()
{
  return MEMORY[0x270F2B130]();
}

uint64_t sub_249259B70()
{
  return MEMORY[0x270F2B138]();
}

uint64_t sub_249259B80()
{
  return MEMORY[0x270F2B140]();
}

uint64_t sub_249259B90()
{
  return MEMORY[0x270F2B148]();
}

uint64_t sub_249259BA0()
{
  return MEMORY[0x270F2B150]();
}

uint64_t sub_249259BB0()
{
  return MEMORY[0x270F2B158]();
}

uint64_t sub_249259BC0()
{
  return MEMORY[0x270F2B160]();
}

uint64_t sub_249259BD0()
{
  return MEMORY[0x270F2B168]();
}

uint64_t sub_249259BE0()
{
  return MEMORY[0x270F2B170]();
}

uint64_t sub_249259BF0()
{
  return MEMORY[0x270F2B178]();
}

uint64_t sub_249259C00()
{
  return MEMORY[0x270F2B180]();
}

uint64_t sub_249259C10()
{
  return MEMORY[0x270F2B188]();
}

uint64_t sub_249259C20()
{
  return MEMORY[0x270F2B1A0]();
}

uint64_t sub_249259C30()
{
  return MEMORY[0x270F2B1A8]();
}

uint64_t sub_249259C40()
{
  return MEMORY[0x270F2B1B0]();
}

uint64_t sub_249259C50()
{
  return MEMORY[0x270F2B1B8]();
}

uint64_t sub_249259C60()
{
  return MEMORY[0x270F2B1C0]();
}

uint64_t sub_249259C70()
{
  return MEMORY[0x270F2B1C8]();
}

uint64_t sub_249259C80()
{
  return MEMORY[0x270F2B1D0]();
}

uint64_t sub_249259C90()
{
  return MEMORY[0x270F2B1D8]();
}

uint64_t sub_249259CA0()
{
  return MEMORY[0x270F2B1E0]();
}

uint64_t sub_249259CB0()
{
  return MEMORY[0x270F2B1E8]();
}

uint64_t sub_249259CC0()
{
  return MEMORY[0x270F2B200]();
}

uint64_t sub_249259CD0()
{
  return MEMORY[0x270F2B208]();
}

uint64_t sub_249259CE0()
{
  return MEMORY[0x270F2B210]();
}

uint64_t sub_249259CF0()
{
  return MEMORY[0x270F2B490]();
}

uint64_t sub_249259D00()
{
  return MEMORY[0x270F2B498]();
}

uint64_t sub_249259D10()
{
  return MEMORY[0x270F2B4A0]();
}

uint64_t sub_249259D20()
{
  return MEMORY[0x270F2B4A8]();
}

uint64_t sub_249259D30()
{
  return MEMORY[0x270F2B4B0]();
}

uint64_t sub_249259D40()
{
  return MEMORY[0x270F2B4B8]();
}

uint64_t sub_249259D50()
{
  return MEMORY[0x270F2B4C0]();
}

uint64_t sub_249259D60()
{
  return MEMORY[0x270F2B4C8]();
}

uint64_t sub_249259D70()
{
  return MEMORY[0x270F2B4D0]();
}

uint64_t sub_249259D80()
{
  return MEMORY[0x270F2B4D8]();
}

uint64_t sub_249259D90()
{
  return MEMORY[0x270F2B4E0]();
}

uint64_t sub_249259DA0()
{
  return MEMORY[0x270F2B4E8]();
}

uint64_t sub_249259DB0()
{
  return MEMORY[0x270F2B4F0]();
}

uint64_t sub_249259DC0()
{
  return MEMORY[0x270F2B4F8]();
}

uint64_t sub_249259DD0()
{
  return MEMORY[0x270F2B500]();
}

uint64_t sub_249259DE0()
{
  return MEMORY[0x270F2B508]();
}

uint64_t sub_249259DF0()
{
  return MEMORY[0x270F2B510]();
}

uint64_t sub_249259E00()
{
  return MEMORY[0x270F2B518]();
}

uint64_t sub_249259E10()
{
  return MEMORY[0x270F2B520]();
}

uint64_t sub_249259E20()
{
  return MEMORY[0x270F2B528]();
}

uint64_t sub_249259E30()
{
  return MEMORY[0x270F2B530]();
}

uint64_t sub_249259E40()
{
  return MEMORY[0x270F2B538]();
}

uint64_t sub_249259E50()
{
  return MEMORY[0x270F2B540]();
}

uint64_t sub_249259E60()
{
  return MEMORY[0x270F2B548]();
}

uint64_t sub_249259E70()
{
  return MEMORY[0x270F2B550]();
}

uint64_t sub_249259E80()
{
  return MEMORY[0x270F2B558]();
}

uint64_t sub_249259E90()
{
  return MEMORY[0x270F2B560]();
}

uint64_t sub_249259EA0()
{
  return MEMORY[0x270F2B568]();
}

uint64_t sub_249259EB0()
{
  return MEMORY[0x270F2B570]();
}

uint64_t sub_249259EC0()
{
  return MEMORY[0x270F2B578]();
}

uint64_t sub_249259ED0()
{
  return MEMORY[0x270F2B580]();
}

uint64_t sub_249259EE0()
{
  return MEMORY[0x270F2B588]();
}

uint64_t sub_249259EF0()
{
  return MEMORY[0x270F2B590]();
}

uint64_t sub_249259F00()
{
  return MEMORY[0x270F2B598]();
}

uint64_t sub_249259F10()
{
  return MEMORY[0x270F2B5A0]();
}

uint64_t sub_249259F20()
{
  return MEMORY[0x270F2B5A8]();
}

uint64_t sub_249259F30()
{
  return MEMORY[0x270F2B5B0]();
}

uint64_t sub_249259F40()
{
  return MEMORY[0x270F2B5B8]();
}

uint64_t sub_249259F50()
{
  return MEMORY[0x270F2B5C0]();
}

uint64_t sub_249259F60()
{
  return MEMORY[0x270F2B5C8]();
}

uint64_t sub_249259F70()
{
  return MEMORY[0x270F2B5D0]();
}

uint64_t sub_249259F80()
{
  return MEMORY[0x270F2B5D8]();
}

uint64_t sub_249259F90()
{
  return MEMORY[0x270F2B5E0]();
}

uint64_t sub_249259FA0()
{
  return MEMORY[0x270F2B5E8]();
}

uint64_t sub_249259FB0()
{
  return MEMORY[0x270F2B5F0]();
}

uint64_t sub_249259FC0()
{
  return MEMORY[0x270F2B5F8]();
}

uint64_t sub_249259FD0()
{
  return MEMORY[0x270F2B600]();
}

uint64_t sub_249259FE0()
{
  return MEMORY[0x270F2B608]();
}

uint64_t sub_249259FF0()
{
  return MEMORY[0x270F2B610]();
}

uint64_t sub_24925A000()
{
  return MEMORY[0x270F2B618]();
}

uint64_t sub_24925A010()
{
  return MEMORY[0x270F2B620]();
}

uint64_t sub_24925A020()
{
  return MEMORY[0x270F2B628]();
}

uint64_t sub_24925A030()
{
  return MEMORY[0x270F2B630]();
}

uint64_t sub_24925A040()
{
  return MEMORY[0x270F2B638]();
}

uint64_t sub_24925A050()
{
  return MEMORY[0x270F2B640]();
}

uint64_t sub_24925A060()
{
  return MEMORY[0x270F2B648]();
}

uint64_t sub_24925A070()
{
  return MEMORY[0x270F2B650]();
}

uint64_t sub_24925A080()
{
  return MEMORY[0x270F2B658]();
}

uint64_t sub_24925A090()
{
  return MEMORY[0x270F2B660]();
}

uint64_t sub_24925A0A0()
{
  return MEMORY[0x270F2B668]();
}

uint64_t sub_24925A0B0()
{
  return MEMORY[0x270F2B670]();
}

uint64_t sub_24925A0C0()
{
  return MEMORY[0x270F2B678]();
}

uint64_t sub_24925A0D0()
{
  return MEMORY[0x270F2B680]();
}

uint64_t sub_24925A0E0()
{
  return MEMORY[0x270F2B688]();
}

uint64_t sub_24925A0F0()
{
  return MEMORY[0x270F2B690]();
}

uint64_t sub_24925A100()
{
  return MEMORY[0x270F2B698]();
}

uint64_t sub_24925A110()
{
  return MEMORY[0x270F2B6A0]();
}

uint64_t sub_24925A120()
{
  return MEMORY[0x270F2B6A8]();
}

uint64_t sub_24925A130()
{
  return MEMORY[0x270F2B6B0]();
}

uint64_t sub_24925A140()
{
  return MEMORY[0x270F2B6B8]();
}

uint64_t sub_24925A150()
{
  return MEMORY[0x270F2B6C0]();
}

uint64_t sub_24925A160()
{
  return MEMORY[0x270F2B6C8]();
}

uint64_t sub_24925A170()
{
  return MEMORY[0x270F2B6D0]();
}

uint64_t sub_24925A180()
{
  return MEMORY[0x270F2B6D8]();
}

uint64_t sub_24925A190()
{
  return MEMORY[0x270F2B6E0]();
}

uint64_t sub_24925A1A0()
{
  return MEMORY[0x270F2B6E8]();
}

uint64_t sub_24925A1B0()
{
  return MEMORY[0x270F2B6F0]();
}

uint64_t sub_24925A1C0()
{
  return MEMORY[0x270F2B6F8]();
}

uint64_t sub_24925A1D0()
{
  return MEMORY[0x270F2B700]();
}

uint64_t sub_24925A1E0()
{
  return MEMORY[0x270F2B708]();
}

uint64_t sub_24925A1F0()
{
  return MEMORY[0x270F2B710]();
}

uint64_t sub_24925A200()
{
  return MEMORY[0x270F2B718]();
}

uint64_t sub_24925A210()
{
  return MEMORY[0x270F2B720]();
}

uint64_t sub_24925A220()
{
  return MEMORY[0x270F2B728]();
}

uint64_t sub_24925A230()
{
  return MEMORY[0x270F2B730]();
}

uint64_t sub_24925A240()
{
  return MEMORY[0x270F2B738]();
}

uint64_t sub_24925A250()
{
  return MEMORY[0x270F2B740]();
}

uint64_t sub_24925A260()
{
  return MEMORY[0x270F2B748]();
}

uint64_t sub_24925A270()
{
  return MEMORY[0x270F2B750]();
}

uint64_t sub_24925A280()
{
  return MEMORY[0x270F2B758]();
}

uint64_t sub_24925A290()
{
  return MEMORY[0x270F2B760]();
}

uint64_t sub_24925A2A0()
{
  return MEMORY[0x270F2B768]();
}

uint64_t sub_24925A2B0()
{
  return MEMORY[0x270F2B770]();
}

uint64_t sub_24925A2C0()
{
  return MEMORY[0x270F2BD28]();
}

uint64_t sub_24925A2D0()
{
  return MEMORY[0x270F2BD30]();
}

uint64_t sub_24925A2E0()
{
  return MEMORY[0x270F2BD38]();
}

uint64_t sub_24925A2F0()
{
  return MEMORY[0x270F2BD40]();
}

uint64_t sub_24925A300()
{
  return MEMORY[0x270F2BD48]();
}

uint64_t sub_24925A310()
{
  return MEMORY[0x270F2BD50]();
}

uint64_t sub_24925A320()
{
  return MEMORY[0x270F2BD58]();
}

uint64_t sub_24925A330()
{
  return MEMORY[0x270F2BD60]();
}

uint64_t sub_24925A340()
{
  return MEMORY[0x270F2BD68]();
}

uint64_t sub_24925A350()
{
  return MEMORY[0x270F2BD70]();
}

uint64_t sub_24925A360()
{
  return MEMORY[0x270F2BD78]();
}

uint64_t sub_24925A370()
{
  return MEMORY[0x270F2BD80]();
}

uint64_t sub_24925A380()
{
  return MEMORY[0x270F2BD88]();
}

uint64_t sub_24925A390()
{
  return MEMORY[0x270F2BD90]();
}

uint64_t sub_24925A3A0()
{
  return MEMORY[0x270F2BD98]();
}

uint64_t sub_24925A3B0()
{
  return MEMORY[0x270F2BDA0]();
}

uint64_t sub_24925A3C0()
{
  return MEMORY[0x270F2BDA8]();
}

uint64_t sub_24925A3D0()
{
  return MEMORY[0x270F2BDB0]();
}

uint64_t sub_24925A3E0()
{
  return MEMORY[0x270F2BDB8]();
}

uint64_t sub_24925A3F0()
{
  return MEMORY[0x270F2BDC0]();
}

uint64_t sub_24925A400()
{
  return MEMORY[0x270F2BDC8]();
}

uint64_t sub_24925A410()
{
  return MEMORY[0x270F2BDD0]();
}

uint64_t sub_24925A420()
{
  return MEMORY[0x270F2BDD8]();
}

uint64_t sub_24925A430()
{
  return MEMORY[0x270F2BDE0]();
}

uint64_t sub_24925A440()
{
  return MEMORY[0x270F2BDE8]();
}

uint64_t sub_24925A450()
{
  return MEMORY[0x270F2BDF0]();
}

uint64_t sub_24925A460()
{
  return MEMORY[0x270F2BDF8]();
}

uint64_t sub_24925A470()
{
  return MEMORY[0x270F2BE00]();
}

uint64_t sub_24925A480()
{
  return MEMORY[0x270F2BE08]();
}

uint64_t sub_24925A490()
{
  return MEMORY[0x270F2BE10]();
}

uint64_t sub_24925A4A0()
{
  return MEMORY[0x270F2BE18]();
}

uint64_t sub_24925A4B0()
{
  return MEMORY[0x270F2BE20]();
}

uint64_t sub_24925A4C0()
{
  return MEMORY[0x270F2BE28]();
}

uint64_t sub_24925A4D0()
{
  return MEMORY[0x270F2BE30]();
}

uint64_t sub_24925A4E0()
{
  return MEMORY[0x270F2BE38]();
}

uint64_t sub_24925A4F0()
{
  return MEMORY[0x270F2BE40]();
}

uint64_t sub_24925A500()
{
  return MEMORY[0x270F2BE48]();
}

uint64_t sub_24925A510()
{
  return MEMORY[0x270F2BE50]();
}

uint64_t sub_24925A520()
{
  return MEMORY[0x270F2BE58]();
}

uint64_t sub_24925A530()
{
  return MEMORY[0x270F2BE60]();
}

uint64_t sub_24925A540()
{
  return MEMORY[0x270F2BE68]();
}

uint64_t sub_24925A550()
{
  return MEMORY[0x270F2BE70]();
}

uint64_t sub_24925A560()
{
  return MEMORY[0x270F2BE78]();
}

uint64_t sub_24925A570()
{
  return MEMORY[0x270F2BE80]();
}

uint64_t sub_24925A580()
{
  return MEMORY[0x270F2BE88]();
}

uint64_t sub_24925A590()
{
  return MEMORY[0x270F2BE90]();
}

uint64_t sub_24925A5A0()
{
  return MEMORY[0x270F2BE98]();
}

uint64_t sub_24925A5B0()
{
  return MEMORY[0x270F2BEA0]();
}

uint64_t sub_24925A5C0()
{
  return MEMORY[0x270F2BEA8]();
}

uint64_t sub_24925A5D0()
{
  return MEMORY[0x270F2BEB0]();
}

uint64_t sub_24925A5E0()
{
  return MEMORY[0x270F2BEB8]();
}

uint64_t sub_24925A5F0()
{
  return MEMORY[0x270F2BEC0]();
}

uint64_t sub_24925A600()
{
  return MEMORY[0x270F2BEC8]();
}

uint64_t sub_24925A610()
{
  return MEMORY[0x270F2BED0]();
}

uint64_t sub_24925A620()
{
  return MEMORY[0x270F2BED8]();
}

uint64_t sub_24925A630()
{
  return MEMORY[0x270F2BEE0]();
}

uint64_t sub_24925A640()
{
  return MEMORY[0x270F2BEE8]();
}

uint64_t sub_24925A650()
{
  return MEMORY[0x270F2BEF0]();
}

uint64_t sub_24925A660()
{
  return MEMORY[0x270F2BEF8]();
}

uint64_t sub_24925A670()
{
  return MEMORY[0x270F2BF00]();
}

uint64_t sub_24925A680()
{
  return MEMORY[0x270F2BF08]();
}

uint64_t sub_24925A690()
{
  return MEMORY[0x270F2BF10]();
}

uint64_t sub_24925A6A0()
{
  return MEMORY[0x270F2BF18]();
}

uint64_t sub_24925A6B0()
{
  return MEMORY[0x270F2BF20]();
}

uint64_t sub_24925A6C0()
{
  return MEMORY[0x270F2BF28]();
}

uint64_t sub_24925A6D0()
{
  return MEMORY[0x270F2BF30]();
}

uint64_t sub_24925A6E0()
{
  return MEMORY[0x270F2BF38]();
}

uint64_t sub_24925A6F0()
{
  return MEMORY[0x270F2BF40]();
}

uint64_t sub_24925A700()
{
  return MEMORY[0x270F2BF48]();
}

uint64_t sub_24925A710()
{
  return MEMORY[0x270F2BF50]();
}

uint64_t sub_24925A720()
{
  return MEMORY[0x270F2BF58]();
}

uint64_t sub_24925A730()
{
  return MEMORY[0x270F2BF60]();
}

uint64_t sub_24925A740()
{
  return MEMORY[0x270F2BF68]();
}

uint64_t sub_24925A750()
{
  return MEMORY[0x270F2BF70]();
}

uint64_t sub_24925A760()
{
  return MEMORY[0x270F2BF78]();
}

uint64_t sub_24925A770()
{
  return MEMORY[0x270F2BF80]();
}

uint64_t sub_24925A780()
{
  return MEMORY[0x270F2BF88]();
}

uint64_t sub_24925A790()
{
  return MEMORY[0x270F2BF90]();
}

uint64_t sub_24925A7A0()
{
  return MEMORY[0x270F2BF98]();
}

uint64_t sub_24925A7B0()
{
  return MEMORY[0x270F2BFA0]();
}

uint64_t sub_24925A7C0()
{
  return MEMORY[0x270F2BFA8]();
}

uint64_t sub_24925A7D0()
{
  return MEMORY[0x270F2BFB0]();
}

uint64_t sub_24925A7E0()
{
  return MEMORY[0x270F2CD08]();
}

uint64_t sub_24925A7F0()
{
  return MEMORY[0x270F2CD10]();
}

uint64_t sub_24925A800()
{
  return MEMORY[0x270F2CD18]();
}

uint64_t sub_24925A810()
{
  return MEMORY[0x270F2CD20]();
}

uint64_t sub_24925A820()
{
  return MEMORY[0x270F2CD58]();
}

uint64_t sub_24925A830()
{
  return MEMORY[0x270F2CD70]();
}

uint64_t sub_24925A840()
{
  return MEMORY[0x270F2CD78]();
}

uint64_t sub_24925A850()
{
  return MEMORY[0x270F2CD80]();
}

uint64_t sub_24925A860()
{
  return MEMORY[0x270F2CDA8]();
}

uint64_t sub_24925A870()
{
  return MEMORY[0x270F2CDB0]();
}

uint64_t sub_24925A880()
{
  return MEMORY[0x270F2CDD0]();
}

uint64_t sub_24925A890()
{
  return MEMORY[0x270F2CDF0]();
}

uint64_t sub_24925A8A0()
{
  return MEMORY[0x270F2CDF8]();
}

uint64_t sub_24925A8B0()
{
  return MEMORY[0x270F2CE00]();
}

uint64_t sub_24925A8C0()
{
  return MEMORY[0x270F2CE08]();
}

uint64_t sub_24925A8D0()
{
  return MEMORY[0x270F2CE10]();
}

uint64_t sub_24925A8E0()
{
  return MEMORY[0x270F2CE18]();
}

uint64_t sub_24925A8F0()
{
  return MEMORY[0x270F2CE28]();
}

uint64_t sub_24925A900()
{
  return MEMORY[0x270F2CE40]();
}

uint64_t sub_24925A910()
{
  return MEMORY[0x270F2CE48]();
}

uint64_t sub_24925A920()
{
  return MEMORY[0x270F2CE60]();
}

uint64_t sub_24925A930()
{
  return MEMORY[0x270F2CE68]();
}

uint64_t sub_24925A940()
{
  return MEMORY[0x270F2CE88]();
}

uint64_t sub_24925A950()
{
  return MEMORY[0x270F2BFB8]();
}

uint64_t sub_24925A960()
{
  return MEMORY[0x270F2BFC0]();
}

uint64_t sub_24925A970()
{
  return MEMORY[0x270F2BFC8]();
}

uint64_t sub_24925A980()
{
  return MEMORY[0x270F2BFD0]();
}

uint64_t sub_24925A990()
{
  return MEMORY[0x270F2BFD8]();
}

uint64_t sub_24925A9A0()
{
  return MEMORY[0x270F2BFE0]();
}

uint64_t sub_24925A9B0()
{
  return MEMORY[0x270F2BFE8]();
}

uint64_t sub_24925A9C0()
{
  return MEMORY[0x270F2BFF0]();
}

uint64_t sub_24925A9D0()
{
  return MEMORY[0x270F2BFF8]();
}

uint64_t sub_24925A9E0()
{
  return MEMORY[0x270F2C000]();
}

uint64_t sub_24925A9F0()
{
  return MEMORY[0x270F2C008]();
}

uint64_t sub_24925AA00()
{
  return MEMORY[0x270F2C010]();
}

uint64_t sub_24925AA10()
{
  return MEMORY[0x270F2C018]();
}

uint64_t sub_24925AA20()
{
  return MEMORY[0x270F2C020]();
}

uint64_t sub_24925AA30()
{
  return MEMORY[0x270F2C028]();
}

uint64_t sub_24925AA40()
{
  return MEMORY[0x270F2C030]();
}

uint64_t sub_24925AA50()
{
  return MEMORY[0x270F2C038]();
}

uint64_t sub_24925AA60()
{
  return MEMORY[0x270F2C040]();
}

uint64_t sub_24925AA70()
{
  return MEMORY[0x270F2C048]();
}

uint64_t sub_24925AA80()
{
  return MEMORY[0x270F2C050]();
}

uint64_t sub_24925AA90()
{
  return MEMORY[0x270F2C058]();
}

uint64_t sub_24925AAA0()
{
  return MEMORY[0x270F2C060]();
}

uint64_t sub_24925AAB0()
{
  return MEMORY[0x270F2C068]();
}

uint64_t sub_24925AAC0()
{
  return MEMORY[0x270F2C070]();
}

uint64_t sub_24925AAD0()
{
  return MEMORY[0x270F2C078]();
}

uint64_t sub_24925AAE0()
{
  return MEMORY[0x270F2C080]();
}

uint64_t sub_24925AAF0()
{
  return MEMORY[0x270F2C088]();
}

uint64_t sub_24925AB00()
{
  return MEMORY[0x270F2C090]();
}

uint64_t sub_24925AB10()
{
  return MEMORY[0x270F2C098]();
}

uint64_t sub_24925AB20()
{
  return MEMORY[0x270F2C0A0]();
}

uint64_t sub_24925AB30()
{
  return MEMORY[0x270F2C0A8]();
}

uint64_t sub_24925AB40()
{
  return MEMORY[0x270F2C0B0]();
}

uint64_t sub_24925AB50()
{
  return MEMORY[0x270F2C0B8]();
}

uint64_t sub_24925AB60()
{
  return MEMORY[0x270F2C0C0]();
}

uint64_t sub_24925AB70()
{
  return MEMORY[0x270F2C0C8]();
}

uint64_t sub_24925AB80()
{
  return MEMORY[0x270F2C0D0]();
}

uint64_t sub_24925AB90()
{
  return MEMORY[0x270F2C0D8]();
}

uint64_t sub_24925ABA0()
{
  return MEMORY[0x270F2C0E0]();
}

uint64_t sub_24925ABB0()
{
  return MEMORY[0x270F2C0E8]();
}

uint64_t sub_24925ABC0()
{
  return MEMORY[0x270F2C0F0]();
}

uint64_t sub_24925ABD0()
{
  return MEMORY[0x270F2C0F8]();
}

uint64_t sub_24925ABE0()
{
  return MEMORY[0x270F2C100]();
}

uint64_t sub_24925ABF0()
{
  return MEMORY[0x270F2C108]();
}

uint64_t sub_24925AC00()
{
  return MEMORY[0x270F2C110]();
}

uint64_t sub_24925AC10()
{
  return MEMORY[0x270F2C118]();
}

uint64_t sub_24925AC20()
{
  return MEMORY[0x270F2C120]();
}

uint64_t sub_24925AC30()
{
  return MEMORY[0x270F2C128]();
}

uint64_t sub_24925AC40()
{
  return MEMORY[0x270F2C130]();
}

uint64_t sub_24925AC50()
{
  return MEMORY[0x270F2C138]();
}

uint64_t sub_24925AC60()
{
  return MEMORY[0x270F2C140]();
}

uint64_t sub_24925AC70()
{
  return MEMORY[0x270F2C148]();
}

uint64_t sub_24925AC80()
{
  return MEMORY[0x270F2C150]();
}

uint64_t sub_24925AC90()
{
  return MEMORY[0x270F2C158]();
}

uint64_t sub_24925ACA0()
{
  return MEMORY[0x270F2C160]();
}

uint64_t sub_24925ACB0()
{
  return MEMORY[0x270F2C168]();
}

uint64_t sub_24925ACC0()
{
  return MEMORY[0x270F2C170]();
}

uint64_t sub_24925ACD0()
{
  return MEMORY[0x270F2C178]();
}

uint64_t sub_24925ACE0()
{
  return MEMORY[0x270F2C180]();
}

uint64_t sub_24925ACF0()
{
  return MEMORY[0x270F2C188]();
}

uint64_t sub_24925AD00()
{
  return MEMORY[0x270F2C190]();
}

uint64_t sub_24925AD10()
{
  return MEMORY[0x270FA2990]();
}

uint64_t sub_24925AD20()
{
  return MEMORY[0x270FA29C8]();
}

uint64_t sub_24925AD30()
{
  return MEMORY[0x270FA29D0]();
}

uint64_t sub_24925AD40()
{
  return MEMORY[0x270FA29F0]();
}

uint64_t sub_24925AD50()
{
  return MEMORY[0x270FA2A00]();
}

uint64_t sub_24925AD60()
{
  return MEMORY[0x270FA2A10]();
}

uint64_t sub_24925AD70()
{
  return MEMORY[0x270FA2A18]();
}

uint64_t sub_24925AD80()
{
  return MEMORY[0x270FA2A28]();
}

uint64_t sub_24925AD90()
{
  return MEMORY[0x270FA1368]();
}

uint64_t sub_24925ADA0()
{
  return MEMORY[0x270FA2A60]();
}

uint64_t sub_24925ADB0()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_24925ADC0()
{
  return MEMORY[0x270FA1390]();
}

uint64_t sub_24925ADD0()
{
  return MEMORY[0x270FA1398]();
}

uint64_t sub_24925ADE0()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_24925ADF0()
{
  return MEMORY[0x270F2CAC0]();
}

uint64_t sub_24925AE00()
{
  return MEMORY[0x270F2CAC8]();
}

uint64_t sub_24925AE10()
{
  return MEMORY[0x270F2CAD0]();
}

uint64_t sub_24925AE20()
{
  return MEMORY[0x270F2CAD8]();
}

uint64_t sub_24925AE30()
{
  return MEMORY[0x270F2CAE0]();
}

uint64_t sub_24925AE40()
{
  return MEMORY[0x270F2CAE8]();
}

uint64_t sub_24925AE50()
{
  return MEMORY[0x270F2CAF0]();
}

uint64_t sub_24925AE60()
{
  return MEMORY[0x270F2CAF8]();
}

uint64_t sub_24925AE70()
{
  return MEMORY[0x270F2CB00]();
}

uint64_t sub_24925AE80()
{
  return MEMORY[0x270F2CB08]();
}

uint64_t sub_24925AE90()
{
  return MEMORY[0x270F2CB10]();
}

uint64_t sub_24925AEA0()
{
  return MEMORY[0x270F2CB18]();
}

uint64_t sub_24925AEB0()
{
  return MEMORY[0x270F2CB20]();
}

uint64_t sub_24925AEC0()
{
  return MEMORY[0x270F2CB28]();
}

uint64_t sub_24925AED0()
{
  return MEMORY[0x270F2CB30]();
}

uint64_t sub_24925AEE0()
{
  return MEMORY[0x270F2CB38]();
}

uint64_t sub_24925AEF0()
{
  return MEMORY[0x270F2CB40]();
}

uint64_t sub_24925AF00()
{
  return MEMORY[0x270F2CB98]();
}

uint64_t sub_24925AF10()
{
  return MEMORY[0x270F2CBA0]();
}

uint64_t sub_24925AF20()
{
  return MEMORY[0x270F2CBA8]();
}

uint64_t sub_24925AF30()
{
  return MEMORY[0x270F2CBB0]();
}

uint64_t sub_24925AF40()
{
  return MEMORY[0x270F2CBB8]();
}

uint64_t sub_24925AF50()
{
  return MEMORY[0x270F2CBC0]();
}

uint64_t sub_24925AF60()
{
  return MEMORY[0x270F2CBC8]();
}

uint64_t sub_24925AF70()
{
  return MEMORY[0x270F2CBD0]();
}

uint64_t sub_24925AF80()
{
  return MEMORY[0x270F2CBD8]();
}

uint64_t sub_24925AF90()
{
  return MEMORY[0x270F2CBE0]();
}

uint64_t sub_24925AFA0()
{
  return MEMORY[0x270F2CEC0]();
}

uint64_t sub_24925AFB0()
{
  return MEMORY[0x270F2CEC8]();
}

uint64_t sub_24925AFC0()
{
  return MEMORY[0x270F2CED0]();
}

uint64_t sub_24925AFD0()
{
  return MEMORY[0x270F2CED8]();
}

uint64_t sub_24925AFE0()
{
  return MEMORY[0x270F2CEE0]();
}

uint64_t sub_24925AFF0()
{
  return MEMORY[0x270F2CEE8]();
}

uint64_t sub_24925B000()
{
  return MEMORY[0x270F2CEF0]();
}

uint64_t sub_24925B010()
{
  return MEMORY[0x270F2CEF8]();
}

uint64_t sub_24925B020()
{
  return MEMORY[0x270F2CF00]();
}

uint64_t sub_24925B030()
{
  return MEMORY[0x270F2CF08]();
}

uint64_t sub_24925B040()
{
  return MEMORY[0x270F2CF10]();
}

uint64_t sub_24925B050()
{
  return MEMORY[0x270F2CF18]();
}

uint64_t sub_24925B060()
{
  return MEMORY[0x270F2CF20]();
}

uint64_t sub_24925B070()
{
  return MEMORY[0x270F2CF28]();
}

uint64_t sub_24925B080()
{
  return MEMORY[0x270F2CF30]();
}

uint64_t sub_24925B090()
{
  return MEMORY[0x270F2CF38]();
}

uint64_t sub_24925B0A0()
{
  return MEMORY[0x270F2CF40]();
}

uint64_t sub_24925B0B0()
{
  return MEMORY[0x270F2CF48]();
}

uint64_t sub_24925B0C0()
{
  return MEMORY[0x270F2CF50]();
}

uint64_t sub_24925B0D0()
{
  return MEMORY[0x270F2CF58]();
}

uint64_t sub_24925B0E0()
{
  return MEMORY[0x270F2CF60]();
}

uint64_t sub_24925B0F0()
{
  return MEMORY[0x270F2CF68]();
}

uint64_t sub_24925B100()
{
  return MEMORY[0x270F2CF70]();
}

uint64_t sub_24925B110()
{
  return MEMORY[0x270F2CF78]();
}

uint64_t sub_24925B120()
{
  return MEMORY[0x270F2CF80]();
}

uint64_t sub_24925B130()
{
  return MEMORY[0x270F2CF88]();
}

uint64_t sub_24925B140()
{
  return MEMORY[0x270F2CF90]();
}

uint64_t sub_24925B150()
{
  return MEMORY[0x270F2CF98]();
}

uint64_t sub_24925B160()
{
  return MEMORY[0x270F2CFA0]();
}

uint64_t sub_24925B170()
{
  return MEMORY[0x270F2CFA8]();
}

uint64_t sub_24925B180()
{
  return MEMORY[0x270F2CFB0]();
}

uint64_t sub_24925B190()
{
  return MEMORY[0x270F2CFB8]();
}

uint64_t sub_24925B1A0()
{
  return MEMORY[0x270F2CFC0]();
}

uint64_t sub_24925B1B0()
{
  return MEMORY[0x270F2CFC8]();
}

uint64_t sub_24925B1C0()
{
  return MEMORY[0x270F2CFD0]();
}

uint64_t sub_24925B1D0()
{
  return MEMORY[0x270F2CFD8]();
}

uint64_t sub_24925B1E0()
{
  return MEMORY[0x270F2CFE0]();
}

uint64_t sub_24925B1F0()
{
  return MEMORY[0x270F2CFE8]();
}

uint64_t sub_24925B200()
{
  return MEMORY[0x270F2CFF0]();
}

uint64_t sub_24925B210()
{
  return MEMORY[0x270F87660]();
}

uint64_t sub_24925B220()
{
  return MEMORY[0x270F2C1A0]();
}

uint64_t sub_24925B230()
{
  return MEMORY[0x270F2C1A8]();
}

uint64_t sub_24925B240()
{
  return MEMORY[0x270F2C1B0]();
}

uint64_t sub_24925B250()
{
  return MEMORY[0x270F2C1B8]();
}

uint64_t sub_24925B260()
{
  return MEMORY[0x270F2C1C0]();
}

uint64_t sub_24925B270()
{
  return MEMORY[0x270F2C1C8]();
}

uint64_t sub_24925B280()
{
  return MEMORY[0x270F2C1D0]();
}

uint64_t sub_24925B290()
{
  return MEMORY[0x270F2C1D8]();
}

uint64_t sub_24925B2A0()
{
  return MEMORY[0x270F2C1E0]();
}

uint64_t sub_24925B2B0()
{
  return MEMORY[0x270F2C1E8]();
}

uint64_t sub_24925B2C0()
{
  return MEMORY[0x270F2C1F0]();
}

uint64_t sub_24925B2D0()
{
  return MEMORY[0x270F2C1F8]();
}

uint64_t sub_24925B2E0()
{
  return MEMORY[0x270F2C200]();
}

uint64_t sub_24925B2F0()
{
  return MEMORY[0x270F2C208]();
}

uint64_t sub_24925B300()
{
  return MEMORY[0x270F2C210]();
}

uint64_t sub_24925B310()
{
  return MEMORY[0x270F2C218]();
}

uint64_t sub_24925B320()
{
  return MEMORY[0x270F2C220]();
}

uint64_t sub_24925B330()
{
  return MEMORY[0x270F2C228]();
}

uint64_t sub_24925B340()
{
  return MEMORY[0x270F2C230]();
}

uint64_t sub_24925B350()
{
  return MEMORY[0x270F2C238]();
}

uint64_t sub_24925B360()
{
  return MEMORY[0x270F2C240]();
}

uint64_t sub_24925B370()
{
  return MEMORY[0x270F2C248]();
}

uint64_t sub_24925B380()
{
  return MEMORY[0x270F2C250]();
}

uint64_t sub_24925B390()
{
  return MEMORY[0x270F2C258]();
}

uint64_t sub_24925B3A0()
{
  return MEMORY[0x270F2C260]();
}

uint64_t sub_24925B3B0()
{
  return MEMORY[0x270F2C268]();
}

uint64_t sub_24925B3C0()
{
  return MEMORY[0x270F2C270]();
}

uint64_t sub_24925B3D0()
{
  return MEMORY[0x270F2C278]();
}

uint64_t sub_24925B3E0()
{
  return MEMORY[0x270F2C280]();
}

uint64_t sub_24925B3F0()
{
  return MEMORY[0x270F2C288]();
}

uint64_t sub_24925B400()
{
  return MEMORY[0x270F2C290]();
}

uint64_t sub_24925B410()
{
  return MEMORY[0x270F2C298]();
}

uint64_t sub_24925B420()
{
  return MEMORY[0x270F2C2A0]();
}

uint64_t sub_24925B430()
{
  return MEMORY[0x270F2C2A8]();
}

uint64_t sub_24925B440()
{
  return MEMORY[0x270F2C2B0]();
}

uint64_t sub_24925B450()
{
  return MEMORY[0x270F2C2B8]();
}

uint64_t sub_24925B460()
{
  return MEMORY[0x270F2C2C0]();
}

uint64_t sub_24925B470()
{
  return MEMORY[0x270F2C2C8]();
}

uint64_t sub_24925B480()
{
  return MEMORY[0x270F2C2D0]();
}

uint64_t sub_24925B490()
{
  return MEMORY[0x270F2C2D8]();
}

uint64_t sub_24925B4A0()
{
  return MEMORY[0x270F2C2E0]();
}

uint64_t sub_24925B4B0()
{
  return MEMORY[0x270F2C2E8]();
}

uint64_t sub_24925B4C0()
{
  return MEMORY[0x270F2C2F0]();
}

uint64_t sub_24925B4D0()
{
  return MEMORY[0x270F2C2F8]();
}

uint64_t sub_24925B4E0()
{
  return MEMORY[0x270F2C300]();
}

uint64_t sub_24925B4F0()
{
  return MEMORY[0x270F2C308]();
}

uint64_t sub_24925B500()
{
  return MEMORY[0x270F2C310]();
}

uint64_t sub_24925B510()
{
  return MEMORY[0x270F2C318]();
}

uint64_t sub_24925B520()
{
  return MEMORY[0x270F2C320]();
}

uint64_t sub_24925B530()
{
  return MEMORY[0x270F2C328]();
}

uint64_t sub_24925B540()
{
  return MEMORY[0x270F2C330]();
}

uint64_t sub_24925B550()
{
  return MEMORY[0x270F2C338]();
}

uint64_t sub_24925B560()
{
  return MEMORY[0x270F2C340]();
}

uint64_t sub_24925B570()
{
  return MEMORY[0x270F2C348]();
}

uint64_t sub_24925B580()
{
  return MEMORY[0x270F2C350]();
}

uint64_t sub_24925B590()
{
  return MEMORY[0x270F2C358]();
}

uint64_t sub_24925B5A0()
{
  return MEMORY[0x270F2C360]();
}

uint64_t sub_24925B5B0()
{
  return MEMORY[0x270F2C368]();
}

uint64_t sub_24925B5C0()
{
  return MEMORY[0x270F2C370]();
}

uint64_t sub_24925B5D0()
{
  return MEMORY[0x270F2C378]();
}

uint64_t sub_24925B5E0()
{
  return MEMORY[0x270F2C380]();
}

uint64_t sub_24925B5F0()
{
  return MEMORY[0x270F2C388]();
}

uint64_t sub_24925B600()
{
  return MEMORY[0x270F2C390]();
}

uint64_t sub_24925B610()
{
  return MEMORY[0x270F2C398]();
}

uint64_t sub_24925B620()
{
  return MEMORY[0x270F2C3A0]();
}

uint64_t sub_24925B630()
{
  return MEMORY[0x270F2C3A8]();
}

uint64_t sub_24925B640()
{
  return MEMORY[0x270F2C3B0]();
}

uint64_t sub_24925B650()
{
  return MEMORY[0x270F2C3B8]();
}

uint64_t sub_24925B660()
{
  return MEMORY[0x270F2C3C0]();
}

uint64_t sub_24925B670()
{
  return MEMORY[0x270F2C3C8]();
}

uint64_t sub_24925B680()
{
  return MEMORY[0x270F2C3D0]();
}

uint64_t sub_24925B690()
{
  return MEMORY[0x270F2C3D8]();
}

uint64_t sub_24925B6A0()
{
  return MEMORY[0x270F2C3E0]();
}

uint64_t sub_24925B6B0()
{
  return MEMORY[0x270F2C3E8]();
}

uint64_t sub_24925B6C0()
{
  return MEMORY[0x270F2C3F0]();
}

uint64_t sub_24925B6D0()
{
  return MEMORY[0x270F2C3F8]();
}

uint64_t sub_24925B6E0()
{
  return MEMORY[0x270F2C400]();
}

uint64_t sub_24925B6F0()
{
  return MEMORY[0x270F2C408]();
}

uint64_t sub_24925B700()
{
  return MEMORY[0x270F2C410]();
}

uint64_t sub_24925B710()
{
  return MEMORY[0x270F2C418]();
}

uint64_t sub_24925B720()
{
  return MEMORY[0x270F2C420]();
}

uint64_t sub_24925B730()
{
  return MEMORY[0x270F2C428]();
}

uint64_t sub_24925B740()
{
  return MEMORY[0x270F2C430]();
}

uint64_t sub_24925B750()
{
  return MEMORY[0x270F2C438]();
}

uint64_t sub_24925B760()
{
  return MEMORY[0x270F2C440]();
}

uint64_t sub_24925B770()
{
  return MEMORY[0x270F2C448]();
}

uint64_t sub_24925B780()
{
  return MEMORY[0x270F2C450]();
}

uint64_t sub_24925B790()
{
  return MEMORY[0x270F2C458]();
}

uint64_t sub_24925B7A0()
{
  return MEMORY[0x270F2C460]();
}

uint64_t sub_24925B7B0()
{
  return MEMORY[0x270F2C468]();
}

uint64_t sub_24925B7C0()
{
  return MEMORY[0x270F2C470]();
}

uint64_t sub_24925B7D0()
{
  return MEMORY[0x270F2C478]();
}

uint64_t sub_24925B7E0()
{
  return MEMORY[0x270F2C480]();
}

uint64_t sub_24925B7F0()
{
  return MEMORY[0x270F2C488]();
}

uint64_t sub_24925B800()
{
  return MEMORY[0x270F2C490]();
}

uint64_t sub_24925B810()
{
  return MEMORY[0x270F2C498]();
}

uint64_t sub_24925B820()
{
  return MEMORY[0x270F2C4A0]();
}

uint64_t sub_24925B830()
{
  return MEMORY[0x270F2C4A8]();
}

uint64_t sub_24925B840()
{
  return MEMORY[0x270F2C4B0]();
}

uint64_t sub_24925B850()
{
  return MEMORY[0x270F2C4B8]();
}

uint64_t sub_24925B860()
{
  return MEMORY[0x270F2C4C0]();
}

uint64_t sub_24925B870()
{
  return MEMORY[0x270F2C4C8]();
}

uint64_t sub_24925B880()
{
  return MEMORY[0x270F2C4D0]();
}

uint64_t sub_24925B890()
{
  return MEMORY[0x270F2C4D8]();
}

uint64_t sub_24925B8A0()
{
  return MEMORY[0x270F2C4E0]();
}

uint64_t sub_24925B8B0()
{
  return MEMORY[0x270F2C4E8]();
}

uint64_t sub_24925B8C0()
{
  return MEMORY[0x270F2C4F0]();
}

uint64_t sub_24925B8D0()
{
  return MEMORY[0x270F2C4F8]();
}

uint64_t sub_24925B8E0()
{
  return MEMORY[0x270F2C500]();
}

uint64_t sub_24925B8F0()
{
  return MEMORY[0x270F2C508]();
}

uint64_t sub_24925B900()
{
  return MEMORY[0x270F2C510]();
}

uint64_t sub_24925B910()
{
  return MEMORY[0x270F2C518]();
}

uint64_t sub_24925B920()
{
  return MEMORY[0x270F2C520]();
}

uint64_t sub_24925B930()
{
  return MEMORY[0x270F2C528]();
}

uint64_t sub_24925B940()
{
  return MEMORY[0x270F2C530]();
}

uint64_t sub_24925B950()
{
  return MEMORY[0x270F2C538]();
}

uint64_t sub_24925B960()
{
  return MEMORY[0x270F2C540]();
}

uint64_t sub_24925B970()
{
  return MEMORY[0x270F2C548]();
}

uint64_t sub_24925B980()
{
  return MEMORY[0x270F2C550]();
}

uint64_t sub_24925B990()
{
  return MEMORY[0x270F2C558]();
}

uint64_t sub_24925B9A0()
{
  return MEMORY[0x270F2C560]();
}

uint64_t sub_24925B9B0()
{
  return MEMORY[0x270F2C568]();
}

uint64_t sub_24925B9C0()
{
  return MEMORY[0x270F2C570]();
}

uint64_t sub_24925B9D0()
{
  return MEMORY[0x270F2C578]();
}

uint64_t sub_24925B9E0()
{
  return MEMORY[0x270F2C580]();
}

uint64_t sub_24925B9F0()
{
  return MEMORY[0x270F2C588]();
}

uint64_t sub_24925BA00()
{
  return MEMORY[0x270F2C590]();
}

uint64_t sub_24925BA10()
{
  return MEMORY[0x270F2C598]();
}

uint64_t sub_24925BA20()
{
  return MEMORY[0x270F2C5A0]();
}

uint64_t sub_24925BA30()
{
  return MEMORY[0x270F2C5A8]();
}

uint64_t sub_24925BA40()
{
  return MEMORY[0x270F2C5B0]();
}

uint64_t sub_24925BA50()
{
  return MEMORY[0x270F2C5B8]();
}

uint64_t sub_24925BA60()
{
  return MEMORY[0x270F2C5C0]();
}

uint64_t sub_24925BA70()
{
  return MEMORY[0x270F2C5C8]();
}

uint64_t sub_24925BA80()
{
  return MEMORY[0x270F2C5D0]();
}

uint64_t sub_24925BA90()
{
  return MEMORY[0x270F2C5D8]();
}

uint64_t sub_24925BAA0()
{
  return MEMORY[0x270F5EAC8]();
}

uint64_t sub_24925BAB0()
{
  return MEMORY[0x270F5EAD0]();
}

uint64_t sub_24925BAC0()
{
  return MEMORY[0x270F5EAD8]();
}

uint64_t sub_24925BB10()
{
  return MEMORY[0x270F5EB30]();
}

uint64_t sub_24925BB30()
{
  return MEMORY[0x270F62CC0]();
}

uint64_t sub_24925BB40()
{
  return MEMORY[0x270F5EB98]();
}

uint64_t sub_24925BB50()
{
  return MEMORY[0x270F2CA48]();
}

uint64_t sub_24925BB60()
{
  return MEMORY[0x270F2CA50]();
}

uint64_t sub_24925BB70()
{
  return MEMORY[0x270F2CA58]();
}

uint64_t sub_24925BB80()
{
  return MEMORY[0x270F2CA60]();
}

uint64_t sub_24925BB90()
{
  return MEMORY[0x270F2CA68]();
}

uint64_t sub_24925BBA0()
{
  return MEMORY[0x270F2CA70]();
}

uint64_t sub_24925BBB0()
{
  return MEMORY[0x270F2CA78]();
}

uint64_t sub_24925BBC0()
{
  return MEMORY[0x270F2CA80]();
}

uint64_t sub_24925BBD0()
{
  return MEMORY[0x270F2CA88]();
}

uint64_t sub_24925BBE0()
{
  return MEMORY[0x270F2CA90]();
}

uint64_t sub_24925BBF0()
{
  return MEMORY[0x270F2CA98]();
}

uint64_t sub_24925BC00()
{
  return MEMORY[0x270F2CAA0]();
}

uint64_t sub_24925BC10()
{
  return MEMORY[0x270F2CAA8]();
}

uint64_t sub_24925BC20()
{
  return MEMORY[0x270F2CAB0]();
}

uint64_t sub_24925BC30()
{
  return MEMORY[0x270F2CAB8]();
}

uint64_t sub_24925BC40()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24925BC50()
{
  return MEMORY[0x270F5EA30]();
}

uint64_t sub_24925BC60()
{
  return MEMORY[0x270F2CE90]();
}

uint64_t sub_24925BC70()
{
  return MEMORY[0x270F0ABA0]();
}

uint64_t sub_24925BC80()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24925BC90()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24925BCA0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24925BCB0()
{
  return MEMORY[0x270F81A20]();
}

uint64_t sub_24925BCC0()
{
  return MEMORY[0x270F81B08]();
}

uint64_t sub_24925BCD0()
{
  return MEMORY[0x270F823A0]();
}

uint64_t sub_24925BCE0()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_24925BCF0()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_24925BD00()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_24925BD10()
{
  return MEMORY[0x270EE3F18]();
}

uint64_t sub_24925BD20()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24925BD30()
{
  return MEMORY[0x270F2A038]();
}

uint64_t sub_24925BD40()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_24925BD50()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_24925BD60()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_24925BD70()
{
  return MEMORY[0x270EFF4A8]();
}

uint64_t sub_24925BD80()
{
  return MEMORY[0x270EFF4B8]();
}

uint64_t sub_24925BD90()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_24925BDA0()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_24925BDB0()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_24925BDC0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24925BDD0()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_24925BDE0()
{
  return MEMORY[0x270EFF6C0]();
}

uint64_t sub_24925BDF0()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_24925BE00()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_24925BE10()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_24925BE20()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_24925BE30()
{
  return MEMORY[0x270EFFD78]();
}

uint64_t sub_24925BE40()
{
  return MEMORY[0x270EFFD88]();
}

uint64_t sub_24925BE50()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_24925BE60()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24925BE70()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_24925BE80()
{
  return MEMORY[0x270F00270]();
}

uint64_t sub_24925BE90()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24925BEA0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24925BEB0()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_24925BEC0()
{
  return MEMORY[0x270F008B8]();
}

uint64_t sub_24925BED0()
{
  return MEMORY[0x270F008C0]();
}

uint64_t sub_24925BEE0()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_24925BEF0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_24925BF00()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_24925BF10()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24925BF20()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24925BF30()
{
  return MEMORY[0x270F00DA8]();
}

uint64_t sub_24925BF40()
{
  return MEMORY[0x270F00DB8]();
}

uint64_t sub_24925BF50()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_24925BF60()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_24925BF70()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_24925BF80()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_24925BF90()
{
  return MEMORY[0x270F01060]();
}

uint64_t sub_24925BFA0()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24925BFB0()
{
  return MEMORY[0x270F01198]();
}

uint64_t sub_24925BFC0()
{
  return MEMORY[0x270F011A0]();
}

uint64_t sub_24925BFD0()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_24925BFE0()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24925BFF0()
{
  return MEMORY[0x270F01468]();
}

uint64_t sub_24925C000()
{
  return MEMORY[0x270F01470]();
}

uint64_t sub_24925C010()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24925C020()
{
  return MEMORY[0x270F01618]();
}

uint64_t sub_24925C030()
{
  return MEMORY[0x270F01630]();
}

uint64_t sub_24925C040()
{
  return MEMORY[0x270F01660]();
}

uint64_t sub_24925C050()
{
  return MEMORY[0x270F01678]();
}

uint64_t sub_24925C060()
{
  return MEMORY[0x270F01690]();
}

uint64_t sub_24925C070()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_24925C080()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_24925C090()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_24925C0A0()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_24925C0C0()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_24925C0D0()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_24925C0E0()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_24925C0F0()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_24925C100()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_24925C110()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_24925C130()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_24925C140()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24925C150()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24925C160()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24925C170()
{
  return MEMORY[0x270F01940]();
}

uint64_t sub_24925C180()
{
  return MEMORY[0x270F01948]();
}

uint64_t sub_24925C190()
{
  return MEMORY[0x270F01950]();
}

uint64_t sub_24925C1A0()
{
  return MEMORY[0x270F2B230]();
}

uint64_t sub_24925C1B0()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_24925C1C0()
{
  return MEMORY[0x270F01CB0]();
}

uint64_t sub_24925C1D0()
{
  return MEMORY[0x270F01CC8]();
}

uint64_t sub_24925C1E0()
{
  return MEMORY[0x270F01CD0]();
}

uint64_t sub_24925C1F0()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_24925C200()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_24925C210()
{
  return MEMORY[0x270F01D58]();
}

uint64_t sub_24925C220()
{
  return MEMORY[0x270F01D60]();
}

uint64_t sub_24925C230()
{
  return MEMORY[0x270F01D68]();
}

uint64_t sub_24925C240()
{
  return MEMORY[0x270F01D70]();
}

uint64_t sub_24925C250()
{
  return MEMORY[0x270F01DF0]();
}

uint64_t sub_24925C260()
{
  return MEMORY[0x270F01DF8]();
}

uint64_t sub_24925C270()
{
  return MEMORY[0x270F02080]();
}

uint64_t sub_24925C280()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_24925C290()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_24925C2A0()
{
  return MEMORY[0x270F02180]();
}

uint64_t sub_24925C2B0()
{
  return MEMORY[0x270F02188]();
}

uint64_t sub_24925C2C0()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_24925C2D0()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_24925C2E0()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_24925C2F0()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_24925C300()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_24925C320()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_24925C330()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_24925C340()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_24925C360()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_24925C370()
{
  return MEMORY[0x270F02758]();
}

uint64_t sub_24925C380()
{
  return MEMORY[0x270F02888]();
}

uint64_t sub_24925C390()
{
  return MEMORY[0x270F02890]();
}

uint64_t sub_24925C3A0()
{
  return MEMORY[0x270F02898]();
}

uint64_t sub_24925C3B0()
{
  return MEMORY[0x270F02908]();
}

uint64_t sub_24925C3C0()
{
  return MEMORY[0x270F02910]();
}

uint64_t sub_24925C3D0()
{
  return MEMORY[0x270F02918]();
}

uint64_t sub_24925C3E0()
{
  return MEMORY[0x270F02920]();
}

uint64_t sub_24925C3F0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24925C400()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_24925C410()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_24925C420()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_24925C430()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_24925C440()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24925C450()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_24925C460()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_24925C470()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_24925C480()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_24925C490()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_24925C4A0()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_24925C4B0()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_24925C4C0()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_24925C4D0()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_24925C4E0()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_24925C4F0()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_24925C500()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_24925C510()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_24925C520()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_24925C530()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_24925C540()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_24925C550()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_24925C560()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_24925C570()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_24925C580()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_24925C590()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_24925C5A0()
{
  return MEMORY[0x270F02DF0]();
}

uint64_t sub_24925C5B0()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_24925C5C0()
{
  return MEMORY[0x270F02F80]();
}

uint64_t sub_24925C5D0()
{
  return MEMORY[0x270F02F98]();
}

uint64_t sub_24925C5E0()
{
  return MEMORY[0x270F02FA8]();
}

uint64_t sub_24925C5F0()
{
  return MEMORY[0x270F02FB0]();
}

uint64_t sub_24925C600()
{
  return MEMORY[0x270F02FC0]();
}

uint64_t sub_24925C610()
{
  return MEMORY[0x270F02FC8]();
}

uint64_t sub_24925C620()
{
  return MEMORY[0x270F02FD0]();
}

uint64_t sub_24925C630()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24925C640()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_24925C650()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24925C660()
{
  return MEMORY[0x270F03188]();
}

uint64_t sub_24925C670()
{
  return MEMORY[0x270F031A0]();
}

uint64_t sub_24925C680()
{
  return MEMORY[0x270F03218]();
}

uint64_t sub_24925C690()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_24925C6A0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24925C6B0()
{
  return MEMORY[0x270F03260]();
}

uint64_t sub_24925C6C0()
{
  return MEMORY[0x270F2B440]();
}

uint64_t sub_24925C6D0()
{
  return MEMORY[0x270F2B450]();
}

uint64_t sub_24925C6E0()
{
  return MEMORY[0x270F2B458]();
}

uint64_t sub_24925C6F0()
{
  return MEMORY[0x270F2B460]();
}

uint64_t sub_24925C700()
{
  return MEMORY[0x270F87728]();
}

uint64_t sub_24925C710()
{
  return MEMORY[0x270F87730]();
}

uint64_t sub_24925C720()
{
  return MEMORY[0x270F87758]();
}

uint64_t sub_24925C730()
{
  return MEMORY[0x270F2A040]();
}

uint64_t sub_24925C740()
{
  return MEMORY[0x270F2A048]();
}

uint64_t sub_24925C750()
{
  return MEMORY[0x270F2A050]();
}

uint64_t sub_24925C760()
{
  return MEMORY[0x270F2A240]();
}

uint64_t sub_24925C770()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24925C780()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24925C790()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_24925C7A0()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_24925C7B0()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_24925C7C0()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_24925C7D0()
{
  return MEMORY[0x270F03478]();
}

uint64_t sub_24925C7E0()
{
  return MEMORY[0x270F03480]();
}

uint64_t sub_24925C7F0()
{
  return MEMORY[0x270F034E8]();
}

uint64_t sub_24925C800()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24925C810()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_24925C820()
{
  return MEMORY[0x270F03998]();
}

uint64_t sub_24925C830()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_24925C840()
{
  return MEMORY[0x270F03AB0]();
}

uint64_t sub_24925C850()
{
  return MEMORY[0x270F03AC0]();
}

uint64_t sub_24925C860()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_24925C870()
{
  return MEMORY[0x270F03C30]();
}

uint64_t sub_24925C880()
{
  return MEMORY[0x270F03C40]();
}

uint64_t sub_24925C890()
{
  return MEMORY[0x270F03E80]();
}

uint64_t sub_24925C8A0()
{
  return MEMORY[0x270F04100]();
}

uint64_t sub_24925C8B0()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_24925C8C0()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_24925C8D0()
{
  return MEMORY[0x270F04290]();
}

uint64_t sub_24925C8E0()
{
  return MEMORY[0x270F042A8]();
}

uint64_t sub_24925C8F0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_24925C900()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_24925C910()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_24925C920()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_24925C930()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24925C940()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_24925C950()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_24925C960()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_24925C970()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_24925C980()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24925C990()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_24925C9A0()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_24925C9B0()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_24925C9C0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24925C9D0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24925C9E0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24925C9F0()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_24925CA00()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24925CA10()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_24925CA20()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_24925CA30()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_24925CA40()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_24925CA50()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_24925CA60()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_24925CA70()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_24925CA80()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_24925CA90()
{
  return MEMORY[0x270F04F78]();
}

uint64_t sub_24925CAA0()
{
  return MEMORY[0x270F04F90]();
}

uint64_t sub_24925CAB0()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_24925CAC0()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_24925CAD0()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_24925CAE0()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_24925CAF0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24925CB00()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_24925CB10()
{
  return MEMORY[0x270F050C0]();
}

uint64_t sub_24925CB20()
{
  return MEMORY[0x270F050F0]();
}

uint64_t sub_24925CB30()
{
  return MEMORY[0x270F05118]();
}

uint64_t sub_24925CB40()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_24925CB50()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_24925CB60()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_24925CB70()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_24925CB80()
{
  return MEMORY[0x270F053D8]();
}

uint64_t sub_24925CB90()
{
  return MEMORY[0x270F25288]();
}

uint64_t sub_24925CBA0()
{
  return MEMORY[0x270F25290]();
}

uint64_t sub_24925CBB0()
{
  return MEMORY[0x270F25298]();
}

uint64_t sub_24925CBC0()
{
  return MEMORY[0x270F252A0]();
}

uint64_t sub_24925CBD0()
{
  return MEMORY[0x270F252A8]();
}

uint64_t sub_24925CBE0()
{
  return MEMORY[0x270F252B0]();
}

uint64_t sub_24925CBF0()
{
  return MEMORY[0x270F252B8]();
}

uint64_t sub_24925CC10()
{
  return MEMORY[0x270F252D8]();
}

uint64_t sub_24925CC20()
{
  return MEMORY[0x270F252E0]();
}

uint64_t sub_24925CC30()
{
  return MEMORY[0x270F252E8]();
}

uint64_t sub_24925CC40()
{
  return MEMORY[0x270F25300]();
}

uint64_t sub_24925CC50()
{
  return MEMORY[0x270F25310]();
}

uint64_t sub_24925CC60()
{
  return MEMORY[0x270F25318]();
}

uint64_t sub_24925CC70()
{
  return MEMORY[0x270F25320]();
}

uint64_t sub_24925CC80()
{
  return MEMORY[0x270F25328]();
}

uint64_t sub_24925CC90()
{
  return MEMORY[0x270F25330]();
}

uint64_t sub_24925CCA0()
{
  return MEMORY[0x270F25338]();
}

uint64_t sub_24925CCB0()
{
  return MEMORY[0x270F25348]();
}

uint64_t sub_24925CCC0()
{
  return MEMORY[0x270F25350]();
}

uint64_t sub_24925CCD0()
{
  return MEMORY[0x270F25358]();
}

uint64_t sub_24925CCE0()
{
  return MEMORY[0x270F25360]();
}

uint64_t sub_24925CCF0()
{
  return MEMORY[0x270F25368]();
}

uint64_t sub_24925CD00()
{
  return MEMORY[0x270F25370]();
}

uint64_t sub_24925CD10()
{
  return MEMORY[0x270F25378]();
}

uint64_t sub_24925CD20()
{
  return MEMORY[0x270F25380]();
}

uint64_t sub_24925CD30()
{
  return MEMORY[0x270F25388]();
}

uint64_t sub_24925CD40()
{
  return MEMORY[0x270F25390]();
}

uint64_t sub_24925CD50()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24925CD60()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24925CD70()
{
  return MEMORY[0x270F253B0]();
}

uint64_t sub_24925CD80()
{
  return MEMORY[0x270F253B8]();
}

uint64_t sub_24925CD90()
{
  return MEMORY[0x270F253C0]();
}

uint64_t sub_24925CDA0()
{
  return MEMORY[0x270F253D8]();
}

uint64_t sub_24925CDB0()
{
  return MEMORY[0x270F253E0]();
}

uint64_t sub_24925CDC0()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_24925CDD0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24925CDE0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24925CDF0()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_24925CE00()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24925CE10()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_24925CE20()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_24925CE30()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_24925CE40()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_24925CE50()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_24925CE60()
{
  return MEMORY[0x270F45408]();
}

uint64_t sub_24925CE70()
{
  return MEMORY[0x270F45800]();
}

uint64_t sub_24925CE80()
{
  return MEMORY[0x270F45808]();
}

uint64_t sub_24925CE90()
{
  return MEMORY[0x270F45810]();
}

uint64_t sub_24925CEA0()
{
  return MEMORY[0x270F45820]();
}

uint64_t sub_24925CEB0()
{
  return MEMORY[0x270F45990]();
}

uint64_t sub_24925CEC0()
{
  return MEMORY[0x270F45998]();
}

uint64_t sub_24925CED0()
{
  return MEMORY[0x270F45A10]();
}

uint64_t sub_24925CEE0()
{
  return MEMORY[0x270F45A30]();
}

uint64_t sub_24925CEF0()
{
  return MEMORY[0x270F45A40]();
}

uint64_t sub_24925CF00()
{
  return MEMORY[0x270F45A60]();
}

uint64_t sub_24925CF10()
{
  return MEMORY[0x270F45AC8]();
}

uint64_t sub_24925CF20()
{
  return MEMORY[0x270F45AD0]();
}

uint64_t sub_24925CF30()
{
  return MEMORY[0x270F45AD8]();
}

uint64_t sub_24925CF40()
{
  return MEMORY[0x270F45AE0]();
}

uint64_t sub_24925CF50()
{
  return MEMORY[0x270F45AF0]();
}

uint64_t sub_24925CF60()
{
  return MEMORY[0x270F45B00]();
}

uint64_t sub_24925CF70()
{
  return MEMORY[0x270F45D88]();
}

uint64_t sub_24925CF80()
{
  return MEMORY[0x270F45DA8]();
}

uint64_t sub_24925CF90()
{
  return MEMORY[0x270F45F40]();
}

uint64_t sub_24925CFA0()
{
  return MEMORY[0x270F45F48]();
}

uint64_t sub_24925CFB0()
{
  return MEMORY[0x270F46028]();
}

uint64_t sub_24925CFC0()
{
  return MEMORY[0x270F46248]();
}

uint64_t sub_24925CFD0()
{
  return MEMORY[0x270F46298]();
}

uint64_t sub_24925CFE0()
{
  return MEMORY[0x270F46558]();
}

uint64_t sub_24925CFF0()
{
  return MEMORY[0x270F62CC8]();
}

uint64_t sub_24925D000()
{
  return MEMORY[0x270F62CD0]();
}

uint64_t sub_24925D020()
{
  return MEMORY[0x270F62CE0]();
}

uint64_t sub_24925D030()
{
  return MEMORY[0x270F62CE8]();
}

uint64_t sub_24925D040()
{
  return MEMORY[0x270F62CF0]();
}

uint64_t sub_24925D050()
{
  return MEMORY[0x270F62CF8]();
}

uint64_t sub_24925D060()
{
  return MEMORY[0x270F62D08]();
}

uint64_t sub_24925D070()
{
  return MEMORY[0x270F62D10]();
}

uint64_t sub_24925D080()
{
  return MEMORY[0x270F62D18]();
}

uint64_t sub_24925D090()
{
  return MEMORY[0x270F62D20]();
}

uint64_t sub_24925D0A0()
{
  return MEMORY[0x270F62D28]();
}

uint64_t sub_24925D0B0()
{
  return MEMORY[0x270F62D30]();
}

uint64_t sub_24925D0C0()
{
  return MEMORY[0x270F62D38]();
}

uint64_t sub_24925D0D0()
{
  return MEMORY[0x270F62D40]();
}

uint64_t sub_24925D0E0()
{
  return MEMORY[0x270F62D48]();
}

uint64_t sub_24925D0F0()
{
  return MEMORY[0x270F62D50]();
}

uint64_t sub_24925D100()
{
  return MEMORY[0x270F62D58]();
}

uint64_t sub_24925D110()
{
  return MEMORY[0x270F62D60]();
}

uint64_t sub_24925D120()
{
  return MEMORY[0x270F62D68]();
}

uint64_t sub_24925D130()
{
  return MEMORY[0x270F62D70]();
}

uint64_t sub_24925D140()
{
  return MEMORY[0x270F62D78]();
}

uint64_t sub_24925D150()
{
  return MEMORY[0x270F62D80]();
}

uint64_t sub_24925D160()
{
  return MEMORY[0x270F62D88]();
}

uint64_t sub_24925D170()
{
  return MEMORY[0x270F62D90]();
}

uint64_t sub_24925D180()
{
  return MEMORY[0x270F62D98]();
}

uint64_t sub_24925D190()
{
  return MEMORY[0x270F62DA0]();
}

uint64_t sub_24925D1A0()
{
  return MEMORY[0x270F62DA8]();
}

uint64_t sub_24925D1B0()
{
  return MEMORY[0x270F62DB0]();
}

uint64_t sub_24925D1C0()
{
  return MEMORY[0x270F62DB8]();
}

uint64_t sub_24925D1D0()
{
  return MEMORY[0x270F62DC0]();
}

uint64_t sub_24925D1E0()
{
  return MEMORY[0x270F62DC8]();
}

uint64_t sub_24925D1F0()
{
  return MEMORY[0x270F62DD0]();
}

uint64_t sub_24925D200()
{
  return MEMORY[0x270F62DD8]();
}

uint64_t sub_24925D210()
{
  return MEMORY[0x270F62DE0]();
}

uint64_t sub_24925D220()
{
  return MEMORY[0x270F62DE8]();
}

uint64_t sub_24925D230()
{
  return MEMORY[0x270F62DF0]();
}

uint64_t sub_24925D240()
{
  return MEMORY[0x270F62DF8]();
}

uint64_t sub_24925D250()
{
  return MEMORY[0x270F62E00]();
}

uint64_t sub_24925D260()
{
  return MEMORY[0x270F62E08]();
}

uint64_t sub_24925D270()
{
  return MEMORY[0x270F62E10]();
}

uint64_t sub_24925D280()
{
  return MEMORY[0x270F62E18]();
}

uint64_t sub_24925D290()
{
  return MEMORY[0x270F62E20]();
}

uint64_t sub_24925D2A0()
{
  return MEMORY[0x270F62E28]();
}

uint64_t sub_24925D2B0()
{
  return MEMORY[0x270F62E30]();
}

uint64_t sub_24925D2C0()
{
  return MEMORY[0x270F62E38]();
}

uint64_t sub_24925D2D0()
{
  return MEMORY[0x270F62E40]();
}

uint64_t sub_24925D2E0()
{
  return MEMORY[0x270F62E48]();
}

uint64_t sub_24925D2F0()
{
  return MEMORY[0x270F62E50]();
}

uint64_t sub_24925D300()
{
  return MEMORY[0x270F62E58]();
}

uint64_t sub_24925D310()
{
  return MEMORY[0x270F62E60]();
}

uint64_t sub_24925D320()
{
  return MEMORY[0x270F62E68]();
}

uint64_t sub_24925D330()
{
  return MEMORY[0x270F62E70]();
}

uint64_t sub_24925D340()
{
  return MEMORY[0x270F62E78]();
}

uint64_t sub_24925D350()
{
  return MEMORY[0x270F62E80]();
}

uint64_t sub_24925D360()
{
  return MEMORY[0x270F62E88]();
}

uint64_t sub_24925D370()
{
  return MEMORY[0x270F62E90]();
}

uint64_t sub_24925D380()
{
  return MEMORY[0x270F62E98]();
}

uint64_t sub_24925D390()
{
  return MEMORY[0x270F62EA0]();
}

uint64_t sub_24925D3A0()
{
  return MEMORY[0x270F62EA8]();
}

uint64_t sub_24925D3B0()
{
  return MEMORY[0x270F62EB0]();
}

uint64_t sub_24925D3C0()
{
  return MEMORY[0x270F62EB8]();
}

uint64_t sub_24925D3D0()
{
  return MEMORY[0x270F62EC0]();
}

uint64_t sub_24925D3E0()
{
  return MEMORY[0x270F62EC8]();
}

uint64_t sub_24925D3F0()
{
  return MEMORY[0x270F62ED0]();
}

uint64_t sub_24925D400()
{
  return MEMORY[0x270F62ED8]();
}

uint64_t sub_24925D410()
{
  return MEMORY[0x270F62EE0]();
}

uint64_t sub_24925D420()
{
  return MEMORY[0x270F62EE8]();
}

uint64_t sub_24925D430()
{
  return MEMORY[0x270F62EF0]();
}

uint64_t sub_24925D440()
{
  return MEMORY[0x270F62EF8]();
}

uint64_t sub_24925D450()
{
  return MEMORY[0x270F62F00]();
}

uint64_t sub_24925D460()
{
  return MEMORY[0x270F62F08]();
}

uint64_t sub_24925D470()
{
  return MEMORY[0x270F62F10]();
}

uint64_t sub_24925D480()
{
  return MEMORY[0x270F62F18]();
}

uint64_t sub_24925D490()
{
  return MEMORY[0x270F62F20]();
}

uint64_t sub_24925D4A0()
{
  return MEMORY[0x270F62F28]();
}

uint64_t sub_24925D4B0()
{
  return MEMORY[0x270F62F30]();
}

uint64_t sub_24925D4C0()
{
  return MEMORY[0x270F62F38]();
}

uint64_t sub_24925D4D0()
{
  return MEMORY[0x270F62F40]();
}

uint64_t sub_24925D4E0()
{
  return MEMORY[0x270F62F48]();
}

uint64_t sub_24925D4F0()
{
  return MEMORY[0x270F62F50]();
}

uint64_t sub_24925D500()
{
  return MEMORY[0x270F62F58]();
}

uint64_t sub_24925D510()
{
  return MEMORY[0x270F62F60]();
}

uint64_t sub_24925D520()
{
  return MEMORY[0x270F62F68]();
}

uint64_t sub_24925D530()
{
  return MEMORY[0x270F62F70]();
}

uint64_t sub_24925D540()
{
  return MEMORY[0x270F62F78]();
}

uint64_t sub_24925D550()
{
  return MEMORY[0x270F62F80]();
}

uint64_t sub_24925D560()
{
  return MEMORY[0x270F62F88]();
}

uint64_t sub_24925D570()
{
  return MEMORY[0x270F62F90]();
}

uint64_t sub_24925D580()
{
  return MEMORY[0x270F62F98]();
}

uint64_t sub_24925D590()
{
  return MEMORY[0x270F62FA0]();
}

uint64_t sub_24925D5A0()
{
  return MEMORY[0x270F62FA8]();
}

uint64_t sub_24925D5B0()
{
  return MEMORY[0x270F62FB0]();
}

uint64_t sub_24925D5C0()
{
  return MEMORY[0x270F62FB8]();
}

uint64_t sub_24925D5D0()
{
  return MEMORY[0x270F62FC0]();
}

uint64_t sub_24925D5E0()
{
  return MEMORY[0x270F62FC8]();
}

uint64_t sub_24925D5F0()
{
  return MEMORY[0x270F62FD0]();
}

uint64_t sub_24925D600()
{
  return MEMORY[0x270F62FD8]();
}

uint64_t sub_24925D610()
{
  return MEMORY[0x270F62FE0]();
}

uint64_t sub_24925D620()
{
  return MEMORY[0x270F62FE8]();
}

uint64_t sub_24925D630()
{
  return MEMORY[0x270F62FF0]();
}

uint64_t sub_24925D640()
{
  return MEMORY[0x270F62FF8]();
}

uint64_t sub_24925D650()
{
  return MEMORY[0x270F63000]();
}

uint64_t sub_24925D660()
{
  return MEMORY[0x270F63008]();
}

uint64_t sub_24925D670()
{
  return MEMORY[0x270F63010]();
}

uint64_t sub_24925D680()
{
  return MEMORY[0x270F63018]();
}

uint64_t sub_24925D690()
{
  return MEMORY[0x270F63020]();
}

uint64_t sub_24925D6A0()
{
  return MEMORY[0x270F63028]();
}

uint64_t sub_24925D6B0()
{
  return MEMORY[0x270F63030]();
}

uint64_t sub_24925D6C0()
{
  return MEMORY[0x270F63038]();
}

uint64_t sub_24925D6D0()
{
  return MEMORY[0x270F63040]();
}

uint64_t sub_24925D6E0()
{
  return MEMORY[0x270F63048]();
}

uint64_t sub_24925D6F0()
{
  return MEMORY[0x270F63050]();
}

uint64_t sub_24925D700()
{
  return MEMORY[0x270F63058]();
}

uint64_t sub_24925D710()
{
  return MEMORY[0x270F63060]();
}

uint64_t sub_24925D720()
{
  return MEMORY[0x270F63068]();
}

uint64_t sub_24925D730()
{
  return MEMORY[0x270F63070]();
}

uint64_t sub_24925D740()
{
  return MEMORY[0x270F63078]();
}

uint64_t sub_24925D750()
{
  return MEMORY[0x270F63080]();
}

uint64_t sub_24925D760()
{
  return MEMORY[0x270F63088]();
}

uint64_t sub_24925D770()
{
  return MEMORY[0x270F63090]();
}

uint64_t sub_24925D780()
{
  return MEMORY[0x270F63098]();
}

uint64_t sub_24925D790()
{
  return MEMORY[0x270F630A0]();
}

uint64_t sub_24925D7A0()
{
  return MEMORY[0x270F630A8]();
}

uint64_t sub_24925D7B0()
{
  return MEMORY[0x270F630B0]();
}

uint64_t sub_24925D7C0()
{
  return MEMORY[0x270F630B8]();
}

uint64_t sub_24925D7D0()
{
  return MEMORY[0x270F630C0]();
}

uint64_t sub_24925D7E0()
{
  return MEMORY[0x270F630C8]();
}

uint64_t sub_24925D7F0()
{
  return MEMORY[0x270F630D0]();
}

uint64_t sub_24925D800()
{
  return MEMORY[0x270F630D8]();
}

uint64_t sub_24925D810()
{
  return MEMORY[0x270F630E0]();
}

uint64_t sub_24925D820()
{
  return MEMORY[0x270F630E8]();
}

uint64_t sub_24925D830()
{
  return MEMORY[0x270F630F0]();
}

uint64_t sub_24925D840()
{
  return MEMORY[0x270F630F8]();
}

uint64_t sub_24925D850()
{
  return MEMORY[0x270F63100]();
}

uint64_t sub_24925D860()
{
  return MEMORY[0x270F63108]();
}

uint64_t sub_24925D870()
{
  return MEMORY[0x270F63110]();
}

uint64_t sub_24925D880()
{
  return MEMORY[0x270F63118]();
}

uint64_t sub_24925D890()
{
  return MEMORY[0x270F63120]();
}

uint64_t sub_24925D8A0()
{
  return MEMORY[0x270F63128]();
}

uint64_t sub_24925D8B0()
{
  return MEMORY[0x270F63130]();
}

uint64_t sub_24925D8C0()
{
  return MEMORY[0x270F63138]();
}

uint64_t sub_24925D8D0()
{
  return MEMORY[0x270F63140]();
}

uint64_t sub_24925D8E0()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_24925D8F0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24925D900()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24925D910()
{
  return MEMORY[0x270F28530]();
}

uint64_t sub_24925D920()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24925D930()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24925D940()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_24925D950()
{
  return MEMORY[0x270FA2B38]();
}

uint64_t sub_24925D960()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_24925D970()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_24925D980()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_24925D990()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24925D9A0()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24925D9B0()
{
  return MEMORY[0x270EF18E0]();
}

uint64_t sub_24925D9C0()
{
  return MEMORY[0x270EF18F0]();
}

uint64_t sub_24925D9D0()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_24925D9E0()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_24925D9F0()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_24925DA00()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_24925DA10()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_24925DA20()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24925DA30()
{
  return MEMORY[0x270EF1968]();
}

uint64_t sub_24925DA40()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24925DA50()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24925DA60()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24925DA70()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24925DA80()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_24925DA90()
{
  return MEMORY[0x270EF1A28]();
}

uint64_t sub_24925DAA0()
{
  return MEMORY[0x270EF1A38]();
}

uint64_t sub_24925DAB0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_24925DAC0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_24925DAD0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_24925DAE0()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_24925DAF0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24925DB00()
{
  return MEMORY[0x270F620B0]();
}

uint64_t sub_24925DB10()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24925DB20()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24925DB30()
{
  return MEMORY[0x270F2B250]();
}

uint64_t sub_24925DB40()
{
  return MEMORY[0x270F2CE98]();
}

uint64_t sub_24925DB50()
{
  return MEMORY[0x270F2CEA0]();
}

uint64_t sub_24925DB60()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_24925DB70()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24925DB80()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_24925DB90()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_24925DBA0()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_24925DBB0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24925DBC0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24925DBD0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_24925DBE0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_24925DBF0()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_24925DC00()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_24925DC10()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_24925DC20()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_24925DC30()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_24925DC40()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_24925DC50()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24925DC60()
{
  return MEMORY[0x270F620D8]();
}

uint64_t sub_24925DC70()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_24925DC80()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_24925DC90()
{
  return MEMORY[0x270F9D9C0]();
}

uint64_t sub_24925DCA0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_24925DCB0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24925DCC0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24925DCD0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24925DCE0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24925DCF0()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_24925DD00()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24925DD10()
{
  return MEMORY[0x270F620E8]();
}

uint64_t sub_24925DD20()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24925DD30()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24925DD40()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_24925DD50()
{
  return MEMORY[0x270F2A248]();
}

uint64_t sub_24925DD60()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24925DD70()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24925DD80()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24925DD90()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24925DDA0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24925DDB0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24925DDC0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24925DDD0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24925DDE0()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_24925DDF0()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_24925DE20()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24925DE30()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24925DE40()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24925DE50()
{
  return MEMORY[0x270FA1EF0]();
}

uint64_t sub_24925DE60()
{
  return MEMORY[0x270FA1F00]();
}

uint64_t sub_24925DE70()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24925DE80()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24925DE90()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_24925DEA0()
{
  return MEMORY[0x270FA1F40]();
}

uint64_t sub_24925DEB0()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_24925DEC0()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_24925DED0()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24925DEF0()
{
  return MEMORY[0x270FA1F80]();
}

uint64_t sub_24925DF00()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_24925DF20()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24925DF30()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_24925DF40()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_24925DF60()
{
  return MEMORY[0x270F2CEA8]();
}

uint64_t sub_24925DF70()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24925DF80()
{
  return MEMORY[0x270F62118]();
}

uint64_t sub_24925DF90()
{
  return MEMORY[0x270F62120]();
}

uint64_t sub_24925DFA0()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_24925DFB0()
{
  return MEMORY[0x270F2CEB0]();
}

uint64_t sub_24925DFC0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24925DFD0()
{
  return MEMORY[0x270F62130]();
}

uint64_t sub_24925DFE0()
{
  return MEMORY[0x270F62140]();
}

uint64_t sub_24925DFF0()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_24925E000()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24925E010()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24925E020()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_24925E030()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24925E040()
{
  return MEMORY[0x270F5EA68]();
}

uint64_t sub_24925E050()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24925E060()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24925E070()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24925E080()
{
  return MEMORY[0x270EE5820]();
}

uint64_t sub_24925E090()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24925E0A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24925E0B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24925E0C0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24925E0D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24925E0E0()
{
  return MEMORY[0x270F62C58]();
}

uint64_t sub_24925E0F0()
{
  return MEMORY[0x270F62C60]();
}

uint64_t sub_24925E100()
{
  return MEMORY[0x270F82548]();
}

uint64_t sub_24925E110()
{
  return MEMORY[0x270F82558]();
}

uint64_t sub_24925E120()
{
  return MEMORY[0x270F82578]();
}

uint64_t sub_24925E130()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24925E140()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_24925E150()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24925E160()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24925E170()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24925E180()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24925E190()
{
  return MEMORY[0x270EF1FD0]();
}

uint64_t sub_24925E1A0()
{
  return MEMORY[0x270F2B468]();
}

uint64_t sub_24925E1B0()
{
  return MEMORY[0x270EF1FD8]();
}

uint64_t sub_24925E1C0()
{
  return MEMORY[0x270EF1FE8]();
}

uint64_t sub_24925E1D0()
{
  return MEMORY[0x270EF1FF8]();
}

uint64_t sub_24925E1E0()
{
  return MEMORY[0x270F2B778]();
}

uint64_t sub_24925E1F0()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_24925E200()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_24925E210()
{
  return MEMORY[0x270F63148]();
}

uint64_t sub_24925E220()
{
  return MEMORY[0x270F62C88]();
}

uint64_t sub_24925E230()
{
  return MEMORY[0x270F2B480]();
}

uint64_t sub_24925E240()
{
  return MEMORY[0x270F2B488]();
}

uint64_t sub_24925E250()
{
  return MEMORY[0x270F63150]();
}

uint64_t sub_24925E260()
{
  return MEMORY[0x270F63158]();
}

uint64_t sub_24925E270()
{
  return MEMORY[0x270F63160]();
}

uint64_t sub_24925E280()
{
  return MEMORY[0x270F63168]();
}

uint64_t sub_24925E290()
{
  return MEMORY[0x270F63170]();
}

uint64_t sub_24925E2A0()
{
  return MEMORY[0x270F63178]();
}

uint64_t sub_24925E2B0()
{
  return MEMORY[0x270F63180]();
}

uint64_t sub_24925E2C0()
{
  return MEMORY[0x270F63188]();
}

uint64_t sub_24925E2D0()
{
  return MEMORY[0x270F63190]();
}

uint64_t sub_24925E2E0()
{
  return MEMORY[0x270F63198]();
}

uint64_t sub_24925E2F0()
{
  return MEMORY[0x270F2A7C0]();
}

uint64_t sub_24925E300()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24925E310()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24925E320()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_24925E330()
{
  return MEMORY[0x270F82A78]();
}

uint64_t sub_24925E340()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_24925E350()
{
  return MEMORY[0x270F82B78]();
}

uint64_t sub_24925E360()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_24925E370()
{
  return MEMORY[0x270F62148]();
}

uint64_t sub_24925E380()
{
  return MEMORY[0x270F5EA80]();
}

uint64_t sub_24925E390()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24925E3A0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_24925E3B0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24925E3C0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24925E3D0()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_24925E3E0()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_24925E3F0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_24925E400()
{
  return MEMORY[0x270EF24E0]();
}

uint64_t sub_24925E410()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_24925E420()
{
  return MEMORY[0x270F5EA88]();
}

uint64_t sub_24925E430()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24925E440()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_24925E460()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24925E470()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24925E480()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24925E490()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_24925E4A0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24925E4B0()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_24925E4C0()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_24925E4D0()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_24925E4E0()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_24925E4F0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24925E500()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_24925E510()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_24925E520()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_24925E530()
{
  return MEMORY[0x270F9E8D8]();
}

uint64_t sub_24925E540()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24925E550()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24925E560()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24925E570()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24925E580()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24925E590()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24925E5A0()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_24925E5B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24925E5C0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24925E5D0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24925E5E0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24925E5F0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24925E610()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24925E620()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24925E630()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_24925E640()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24925E650()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24925E660()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24925E670()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_24925E680()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_24925E690()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_24925E6A0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24925E6B0()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_24925E6C0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24925E6D0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24925E6E0()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_24925E6F0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24925E700()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24925E710()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24925E720()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24925E730()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24925E750()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24925E770()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24925E780()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24925E790()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24925E7A0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24925E7B0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24925E7C0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24925E7D0()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24925E7E0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24925E7F0()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_24925E800()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24925E810()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24925E820()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24925E830()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24925E840()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24925E850()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24925E860()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24925E870()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24925E880()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24925E890()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_24925E8A0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24925E8B0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24925E8C0()
{
  return MEMORY[0x270FA2310]();
}

uint64_t sub_24925E8D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24925E8E0()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_24925E900()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24925E910()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_24925E920()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24925E940()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_24925E950()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_24925E970()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24925E980()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24925E990()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24925E9A0()
{
  return MEMORY[0x270F62160]();
}

uint64_t sub_24925E9B0()
{
  return MEMORY[0x270F62168]();
}

uint64_t sub_24925E9C0()
{
  return MEMORY[0x270F62170]();
}

uint64_t sub_24925E9D0()
{
  return MEMORY[0x270F62180]();
}

uint64_t sub_24925E9E0()
{
  return MEMORY[0x270F0ABA8]();
}

uint64_t sub_24925E9F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24925EA00()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24925EA10()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24925EA20()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24925EA30()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_24925EA40()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24925EA50()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24925EA60()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24925EA70()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24925EA80()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24925EA90()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24925EAA0()
{
  return MEMORY[0x270F62198]();
}

uint64_t sub_24925EAB0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24925EAC0()
{
  return MEMORY[0x270F9FD98]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x270F961A0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x270FA0408]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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