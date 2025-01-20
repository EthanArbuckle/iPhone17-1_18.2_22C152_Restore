uint64_t sub_22A5B4B80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  char v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  char v9;
  uint64_t result;
  __int16 v11;
  _OWORD v12[2];
  _OWORD v13[2];

  v4 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  if (v4 && (v5 = sub_22A5B6AA4(0xD00000000000001ALL, 0x800000022A5DD530), (v6 & 1) != 0))
  {
    sub_22A5B5624(*(void *)(a2 + 56) + 32 * v5, (uint64_t)v12);
    sub_22A5B5AEC(v12, v13);
    sub_22A5B5624((uint64_t)v13, (uint64_t)v12);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_22A5B4E54(v12, 0xD000000000000018, 0x800000022A5DD020, isUniquelyReferenced_nonNull_native);
    v8 = a2;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  else
  {
    v8 = a2;
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v9 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&v12[0] = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = 0x8000000000000000;
  sub_22A5B4FA8(v8, (uint64_t)sub_22A5B55D0, 0, v9, (uint64_t)v12);
  *(void *)(a1 + 32) = *(void *)&v12[0];
  swift_bridgeObjectRelease();
  swift_endAccess();
  result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    v11 = *(_WORD *)(a1 + 24);
    swift_retain();
    sub_22A5B4D0C(a2, v11);
    return swift_release();
  }
  return result;
}

uint64_t sub_22A5B4D0C(uint64_t result, __int16 a2)
{
  uint64_t v3 = result;
  *(_WORD *)(v2 + 50) = a2;
  if (*(void *)(result + 16))
  {
    result = sub_22A5B6AA4(0xD000000000000018, 0x800000022A5DD000);
    if (v4)
    {
      sub_22A5B5624(*(void *)(v3 + 56) + 32 * result, (uint64_t)v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF88);
      result = swift_dynamicCast();
      if (result)
      {
        swift_beginAccess();
        sub_22A5C40C0(v6);
        result = swift_endAccess();
      }
    }
  }
  if (*(void *)(v3 + 16))
  {
    result = sub_22A5B6AA4(0xD000000000000018, 0x800000022A5DD020);
    if (v5)
    {
      sub_22A5B5624(*(void *)(v3 + 56) + 32 * result, (uint64_t)v8);
      result = swift_dynamicCast();
      if (result)
      {
        *(void *)(v2 + 32) = v6;
        *(void *)(v2 + 40) = v7;
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

_OWORD *sub_22A5B4E54(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = (void **)v4;
  v10 = (void *)*v4;
  unint64_t v12 = sub_22A5B6AA4(a2, a3);
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
      sub_22A5D92E4();
      goto LABEL_7;
    }
    sub_22A5B67A4(v15, a4 & 1);
    unint64_t v21 = sub_22A5B6AA4(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    result = (_OWORD *)sub_22A5DA520();
    __break(1u);
    return result;
  }
LABEL_7:
  v18 = *v5;
  if (v16)
  {
LABEL_8:
    v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_22A5B5AEC(a1, v19);
  }
LABEL_13:
  sub_22A5B724C(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_22A5B4FA8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = -v7;
  uint64_t v50 = a1;
  uint64_t v51 = a1 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v52 = v8;
  uint64_t v53 = 0;
  uint64_t v54 = v11 & v9;
  uint64_t v55 = a2;
  uint64_t v56 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22A5B53E4(&v48);
  uint64_t v12 = *((void *)&v48 + 1);
  if (!*((void *)&v48 + 1)) {
    goto LABEL_27;
  }
  uint64_t v13 = v48;
  sub_22A5B5AEC(v49, v47);
  BOOL v14 = *(void **)a5;
  unint64_t v16 = sub_22A5B6AA4(v13, v12);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  char v20 = v15;
  if (v14[3] >= v19)
  {
    if (a4)
    {
      if (v15) {
        goto LABEL_12;
      }
    }
    else
    {
      sub_22A5D92E4();
      if (v20) {
        goto LABEL_12;
      }
    }
LABEL_14:
    v24 = *(void **)a5;
    *(void *)(*(void *)a5 + 8 * (v16 >> 6) + 64) |= 1 << v16;
    v25 = (uint64_t *)(v24[6] + 16 * v16);
    uint64_t *v25 = v13;
    v25[1] = v12;
    sub_22A5B5AEC(v47, (_OWORD *)(v24[7] + 32 * v16));
    uint64_t v26 = v24[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v24[2] = v28;
LABEL_16:
    sub_22A5B53E4(&v48);
    for (uint64_t i = *((void *)&v48 + 1); *((void *)&v48 + 1); uint64_t i = *((void *)&v48 + 1))
    {
      uint64_t v31 = v48;
      sub_22A5B5AEC(v49, v47);
      v32 = *(void **)a5;
      unint64_t v34 = sub_22A5B6AA4(v31, i);
      uint64_t v35 = v32[2];
      BOOL v36 = (v33 & 1) == 0;
      uint64_t v37 = v35 + v36;
      if (__OFADD__(v35, v36)) {
        goto LABEL_28;
      }
      char v38 = v33;
      if (v32[3] < v37)
      {
        sub_22A5B67A4(v37, 1);
        unint64_t v39 = sub_22A5B6AA4(v31, i);
        if ((v38 & 1) != (v40 & 1)) {
          goto LABEL_30;
        }
        unint64_t v34 = v39;
      }
      if (v38)
      {
        sub_22A5B5624((uint64_t)v47, (uint64_t)v46);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
        swift_bridgeObjectRelease();
        v30 = (_OWORD *)(*(void *)(*(void *)a5 + 56) + 32 * v34);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
        sub_22A5B5AEC(v46, v30);
      }
      else
      {
        v41 = *(void **)a5;
        *(void *)(*(void *)a5 + 8 * (v34 >> 6) + 64) |= 1 << v34;
        v42 = (uint64_t *)(v41[6] + 16 * v34);
        uint64_t *v42 = v31;
        v42[1] = i;
        sub_22A5B5AEC(v47, (_OWORD *)(v41[7] + 32 * v34));
        uint64_t v43 = v41[2];
        BOOL v27 = __OFADD__(v43, 1);
        uint64_t v44 = v43 + 1;
        if (v27) {
          goto LABEL_29;
        }
        v41[2] = v44;
      }
      sub_22A5B53E4(&v48);
    }
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
    sub_22A5B7518();
    return swift_release();
  }
  sub_22A5B67A4(v19, a4 & 1);
  unint64_t v21 = sub_22A5B6AA4(v13, v12);
  if ((v20 & 1) == (v22 & 1))
  {
    unint64_t v16 = v21;
    if ((v20 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_12:
    sub_22A5B5624((uint64_t)v47, (uint64_t)v46);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
    swift_bridgeObjectRelease();
    v23 = (_OWORD *)(*(void *)(*(void *)a5 + 56) + 32 * v16);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
    sub_22A5B5AEC(v46, v23);
    goto LABEL_16;
  }
LABEL_30:
  uint64_t result = sub_22A5DA520();
  __break(1u);
  return result;
}

unint64_t sub_22A5B5300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22A5DA510() & 1) == 0)
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
      while (!v14 && (sub_22A5DA510() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22A5B53E4@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    BOOL v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_22A5B5624(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }
    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v15 != v18)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
LABEL_23:
  uint64_t *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_22A5B56DC((uint64_t)&v23, (uint64_t)v22, &qword_26AD78968);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_22A5B5680((uint64_t)v21, &qword_26AD78960);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_22A5B55D0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  sub_22A5B5624((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22A5B5624(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22A5B5680(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22A5B56DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_22A5B5740(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78958);
    uint64_t v2 = (void *)sub_22A5DA4F0();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v35 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v34 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v47;
  int64_t v7 = v45;
  unint64_t v8 = &v41;
  uint64_t v9 = &v43;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v36 = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v19 = v36 + 1;
  if (__OFADD__(v36, 1)) {
    goto LABEL_35;
  }
  if (v19 >= v34) {
    goto LABEL_32;
  }
  unint64_t v20 = *(void *)(v35 + 8 * v19);
  int64_t v21 = v36 + 1;
  if (!v20)
  {
    int64_t v21 = v36 + 2;
    if (v36 + 2 >= v34) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v21);
    if (!v20)
    {
      int64_t v21 = v36 + 3;
      if (v36 + 3 >= v34) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = v36 + 4;
        if (v36 + 4 >= v34) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v35 + 8 * v21);
        if (!v20)
        {
          int64_t v22 = v36 + 5;
          if (v36 + 5 < v34)
          {
            unint64_t v20 = *(void *)(v35 + 8 * v22);
            if (v20)
            {
              int64_t v21 = v36 + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v21 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                goto LABEL_36;
              }
              if (v21 >= v34) {
                break;
              }
              unint64_t v20 = *(void *)(v35 + 8 * v21);
              ++v22;
              if (v20) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_22A5B7518();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  int64_t v36 = v21;
  uint64_t v37 = (v20 - 1) & v20;
  for (unint64_t i = __clz(__rbit64(v20)) + (v21 << 6); ; unint64_t i = __clz(__rbit64(v5)) | (v36 << 6))
  {
    long long v23 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    uint64_t v25 = *v23;
    uint64_t v24 = v23[1];
    sub_22A5B6EBC(*(void *)(v1 + 56) + 32 * i, (uint64_t)v6);
    *(void *)&long long v46 = v25;
    *((void *)&v46 + 1) = v24;
    v44[2] = v46;
    v45[0] = v47[0];
    v45[1] = v47[1];
    uint64_t v39 = v25;
    uint64_t v40 = v24;
    sub_22A5B6F24((uint64_t)v7, (uint64_t)v38);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78978);
    swift_dynamicCast();
    uint64_t v27 = v39;
    uint64_t v26 = v40;
    sub_22A5B5AEC(v8, v9);
    sub_22A5B5AEC(v9, v44);
    sub_22A5B5AEC(v44, &v42);
    unint64_t result = sub_22A5B6AA4(v27, v26);
    unint64_t v28 = result;
    if (v29)
    {
      BOOL v11 = v9;
      uint64_t v12 = v8;
      uint64_t v13 = v1;
      int64_t v14 = v7;
      int64_t v15 = v6;
      unint64_t v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *unint64_t v16 = v27;
      v16[1] = v26;
      uint64_t v6 = v15;
      int64_t v7 = v14;
      uint64_t v1 = v13;
      unint64_t v8 = v12;
      uint64_t v9 = v11;
      int64_t v17 = (_OWORD *)(v2[7] + 32 * v28);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
      unint64_t result = (unint64_t)sub_22A5B5AEC(&v42, v17);
      unint64_t v5 = v37;
      if (!v37) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v30 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v30 = v27;
    v30[1] = v26;
    unint64_t result = (unint64_t)sub_22A5B5AEC(&v42, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v31 = v2[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_34;
    }
    v2[2] = v33;
    unint64_t v5 = v37;
    if (!v37) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v37 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

_OWORD *sub_22A5B5AEC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22A5B5AFC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t active = type metadata accessor for ActiveReporterState(0);
  uint64_t v7 = MEMORY[0x270FA5388](active);
  uint64_t v9 = (uint64_t *)((char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  BOOL v11 = (uint64_t *)((char *)&v18 - v10);
  type metadata accessor for ReporterData();
  uint64_t v12 = swift_allocObject();
  *(_WORD *)(v12 + 24) = -1;
  *(void *)(v12 + 32) = sub_22A5B7520(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A30);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_22A5DB310;
  *(_DWORD *)(v13 + 32) = getpid();
  type metadata accessor for PerfCheck();
  swift_allocObject();
  *(void *)(v12 + 40) = sub_22A5B7700(v13);
  *(void *)(v12 + 16) = a1;
  *BOOL v11 = v12;
  swift_storeEnumTagMultiPayload();
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient__isCachingEnabled) == 1)
  {
    sub_22A5C9434((uint64_t)v11, (uint64_t)a2, type metadata accessor for ActiveReporterState);
    type metadata accessor for ReporterState(0);
  }
  else
  {
    sub_22A5B6208((uint64_t)v11, (uint64_t)v9, type metadata accessor for ActiveReporterState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v15 = *v9;
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
      sub_22A5B7AE0((uint64_t)v9 + *(int *)(v16 + 48), type metadata accessor for StartedReporterData);
    }
    sub_22A5B7AE0((uint64_t)v11, type metadata accessor for ActiveReporterState);
    *a2 = v15;
    type metadata accessor for ReporterState(0);
  }
  return swift_storeEnumTagMultiPayload();
}

void sub_22A5B5D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for ReporterState(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t active = type metadata accessor for ActiveReporterState(0);
  uint64_t v9 = MEMORY[0x270FA5388](active);
  BOOL v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  int64_t v14 = (uint64_t *)((char *)&v24 - v13);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v24 - v15;
  sub_22A5B6208(a1, (uint64_t)v7, type metadata accessor for ReporterState);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_22A5C9434((uint64_t)v7, (uint64_t)v16, type metadata accessor for ActiveReporterState);
    sub_22A5B6208((uint64_t)v16, (uint64_t)v14, type metadata accessor for ActiveReporterState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v18 = *v14;
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
      sub_22A5B7AE0((uint64_t)v14 + *(int *)(v19 + 48), type metadata accessor for StartedReporterData);
    }
    sub_22A5B4B80(v18, a3);
    swift_release();
    unint64_t v20 = (void *)sub_22A5CDC58(a1, 3);
    sub_22A5B6208((uint64_t)v16, (uint64_t)v11, type metadata accessor for ActiveReporterState);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
      sub_22A5B7AE0((uint64_t)&v11[*(int *)(v21 + 48)], type metadata accessor for StartedReporterData);
    }
    sub_22A5B7AE0((uint64_t)v16, type metadata accessor for ActiveReporterState);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_release();
    int64_t v22 = (void *)sub_22A5DA280();
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void *)(sub_22A5CFAE0() + 16);
    swift_release();
    objc_msgSend(v20, sel_setWithConfiguration_for_, v22, v23);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_22A5B4B80(*v7, a3);
    swift_release();
  }
}

uint64_t sub_22A5B605C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22A5B60C4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22A5B6124(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2 || result == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t result = swift_release();
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v4 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
      uint64_t v5 = sub_22A5DA1B0();
      uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
      return v6(v4, v5);
    }
  }
  else if (!result)
  {
    return swift_release();
  }
  return result;
}

uint64_t sub_22A5B6208(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22A5B6270(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22A5B62D8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for ReporterState(uint64_t a1)
{
  return sub_22A5B62D8(a1, (uint64_t *)&unk_26AD78A48);
}

void *sub_22A5B6330(void *a1, void *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    int v5 = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    swift_retain();
    if (v5 != 1)
    {
      uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_22A5DA1B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      uint64_t v10 = type metadata accessor for StartedReporterData(0);
      *(_DWORD *)&v7[*(int *)(v10 + 20)] = *(_DWORD *)&v8[*(int *)(v10 + 20)];
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t objectdestroy_27Tm(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

Swift::Void __swiftcall AudioAnalyticsSetConfiguration(_:_:)(Swift::Int64 a1, CFDictionaryRef a2)
{
  if (qword_26AD78A38 != -1) {
    swift_once();
  }
  if (qword_26AD78CB0 != a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78978);
    sub_22A5DA290();
  }
}

uint64_t sub_22A5B67A4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78958);
  uint64_t v6 = sub_22A5DA4E0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v34 = (void *)(v5 + 64);
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
                  *int64_t v34 = -1 << v32;
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
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_22A5B5AEC(v24, v35);
      }
      else
      {
        sub_22A5B5624((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_22A5DA550();
      sub_22A5DA2D0();
      uint64_t result = sub_22A5DA580();
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
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_22A5B5AEC(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_22A5B6AA4(uint64_t a1, uint64_t a2)
{
  sub_22A5DA550();
  sub_22A5DA2D0();
  uint64_t v4 = sub_22A5DA580();
  return sub_22A5B5300(a1, a2, v4);
}

uint64_t AudioAnalyticsGetAudioServiceType(uint64_t a1)
{
  return (unsigned __int16)AudioAnalyticsGetAudioServiceType(_:)(a1);
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

uint64_t AudioAnalyticsTraceWrapperPost(__int16 a1)
{
  return MEMORY[0x270ED9F50]((4 * (a1 & 0x3FFF)) | 0x21040000u);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

uint64_t AudioAnalyticsCreateReporter(uint64_t a1)
{
  if (qword_26AD78A08 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x270FA5388](a1);
  id v2 = v1;
  sub_22A5DA3C0();

  return v4;
}

void AudioAnalyticsSendMessage(uint64_t a1, void *a2)
{
  id v3 = a2;
  AudioAnalyticsSendMessage(_:_:_:_:)(a1);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

void AudioAnalyticsSetConfiguration(Swift::Int64 a1, void *a2)
{
  CFDictionaryRef v3 = a2;
  AudioAnalyticsSetConfiguration(_:_:)(a1, v3);
}

uint64_t sub_22A5B6EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78978);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A5B6F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78978);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_22A5B6F8C(uint64_t a1)
{
  uint64_t v2 = sub_22A5DA540();
  return sub_22A5B6FD0(a1, v2);
}

unint64_t sub_22A5B6FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_22A5B706C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_22A5B6F8C(a2);
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
      sub_22A5D967C();
      goto LABEL_7;
    }
    sub_22A5D8938(v13, a3 & 1);
    unint64_t v20 = sub_22A5B6F8C(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      unint64_t v10 = v20;
      unint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_22A5DA520();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = v17 + *(void *)(*(void *)(type metadata accessor for ReporterState(0) - 8) + 72) * v10;
    return sub_22A5D9FE8(a1, v18);
  }
LABEL_13:
  return sub_22A5B71B8(v10, a2, a1, v16);
}

uint64_t sub_22A5B71B8(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for ReporterState(0);
  uint64_t result = sub_22A5B7B60(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1);
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

_OWORD *sub_22A5B724C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_22A5B5AEC(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_22A5B72B8(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ReporterState(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_22A5B5680(a1, &qword_26AD78A18);
    unint64_t v13 = sub_22A5B6F8C(a2);
    if (v14)
    {
      unint64_t v15 = v13;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v17 = *v3;
      uint64_t v21 = *v3;
      *CFDictionaryRef v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_22A5D967C();
        uint64_t v17 = v21;
      }
      sub_22A5B605C(*(void *)(v17 + 56) + *(void *)(v10 + 72) * v15, (uint64_t)v8, type metadata accessor for ReporterState);
      sub_22A5C185C(v15, v17);
      *CFDictionaryRef v3 = v17;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    }
    return sub_22A5B5680((uint64_t)v8, &qword_26AD78A18);
  }
  else
  {
    sub_22A5B605C(a1, (uint64_t)v12, type metadata accessor for ReporterState);
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v3;
    *CFDictionaryRef v3 = 0x8000000000000000;
    sub_22A5B706C((uint64_t)v12, a2, v18);
    *CFDictionaryRef v3 = v21;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_22A5B7518()
{
  return swift_release();
}

unint64_t sub_22A5B7520(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    CFDictionaryRef v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78958);
  uint64_t v2 = sub_22A5DA4F0();
  CFDictionaryRef v3 = (void *)v2;
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
    sub_22A5DA104(v6, (uint64_t)&v15, &qword_26AD78948);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_22A5B6AA4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_22A5B5AEC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_22A5B765C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_22A5B7684()
{
  return sub_22A5BA8AC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_22A5B768C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t type metadata accessor for PerfCheck()
{
  uint64_t result = qword_26AD78B20;
  if (!qword_26AD78B20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22A5B7700(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 24) = MEMORY[0x263F8EE78];
  *(void *)(v1 + 16) = v3;
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = 0;
  *(_WORD *)(v1 + 50) = -1;
  uint64_t v4 = v1 + OBJC_IVAR____TtC14AudioAnalytics9PerfCheck_logger;
  if (qword_26AD78A10 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_22A5DA1F0();
  uint64_t v6 = __swift_project_value_buffer(v5, (uint64_t)qword_26AD78CE0);
  uint64_t v7 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v4, v6, v5);
  if (qword_26AD78A58 != -1) {
    swift_once();
  }
  if (byte_26AD78CD8 == 1)
  {
    swift_beginAccess();
    *(void *)(v1 + 24) = a1;
    swift_bridgeObjectRelease();
    *(unsigned char *)(v1 + 48) = 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v5);
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v1;
}

uint64_t sub_22A5B790C(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = swift_release();
  if (EnumCaseMultiPayload != 1)
  {
    uint64_t v4 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
    uint64_t v5 = sub_22A5DA1B0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  return result;
}

void *sub_22A5B79A8(void *a1, void *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *a1 = *a2;
  swift_retain();
  if (EnumCaseMultiPayload != 1)
  {
    uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_22A5DA1B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    uint64_t v9 = type metadata accessor for StartedReporterData(0);
    *(_DWORD *)&v6[*(int *)(v9 + 20)] = *(_DWORD *)&v7[*(int *)(v9 + 20)];
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_22A5B7A80(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22A5B7AE0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for ActiveReporterState(uint64_t a1)
{
  return sub_22A5B62D8(a1, (uint64_t *)&unk_26AD78A60);
}

uint64_t sub_22A5B7B60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReporterState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A5B7BC4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ReporterState(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (void *)((char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_22A5DA260();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (void *)((char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = *(void **)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *uint64_t v14 = v15;
  (*(void (**)(void *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F8F0E0], v11);
  id v16 = v15;
  LOBYTE(v15) = sub_22A5DA270();
  (*(void (**)(void *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if ((a1 & 0x100000000) != 0)
  {
    uint64_t v18 = *(void *)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_idGenerator);
    int v19 = *(_DWORD *)(v18 + 16);
    BOOL v20 = __CFADD__(v19, 1);
    int v21 = v19 + 1;
    if (!v20)
    {
      *(_DWORD *)(v18 + 16) = v21;
      uint64_t v22 = getpid();
      if ((v22 & 0x80000000) == 0)
      {
        uint64_t v17 = *(unsigned int *)(v18 + 16) | (unint64_t)(v22 << 32);
        goto LABEL_7;
      }
LABEL_12:
      uint64_t result = sub_22A5DA4B0();
      __break(1u);
      return result;
    }
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v17 = a1;
LABEL_7:
  sub_22A5B5AFC(v17, v10);
  sub_22A5B6270((uint64_t)v10, (uint64_t)v6, type metadata accessor for ReporterState);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  swift_beginAccess();
  sub_22A5B72B8((uint64_t)v6, v17);
  swift_endAccess();
  uint64_t v23 = sub_22A5DA1D0();
  os_log_type_t v24 = sub_22A5DA360();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 134217984;
    v27[1] = v17;
    sub_22A5DA400();
    _os_log_impl(&dword_22A5B3000, v23, v24, "Created new reporting session. { reporterID=%lld }", v25, 0xCu);
    MEMORY[0x22A6CDBE0](v25, -1, -1);
  }

  sub_22A5B60C4((uint64_t)v10, type metadata accessor for ReporterState);
  return v17;
}

uint64_t sub_22A5B7F80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ReporterState(0);
  uint64_t v33 = *(void *)(v9 - 8);
  uint64_t v34 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22A5DA260();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char **)((char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v16 = *(void **)(v3 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *uint64_t v15 = v16;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F8F0E0], v12);
  id v17 = v16;
  char v18 = sub_22A5DA270();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v15, v12);
  if (v18)
  {
    swift_bridgeObjectRetain_n();
    BOOL v20 = sub_22A5DA1D0();
    os_log_type_t v21 = sub_22A5DA360();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v32 = a2;
      uint64_t v24 = v23;
      *(_DWORD *)uint64_t v22 = 134218243;
      uint64_t v35 = v32;
      uint64_t v36 = v23;
      BOOL v30 = v8;
      sub_22A5DA400();
      *(_WORD *)(v22 + 12) = 2081;
      unint64_t v29 = v11;
      swift_bridgeObjectRetain();
      uint64_t v31 = v3;
      uint64_t v25 = sub_22A5DA2B0();
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      uint64_t v35 = sub_22A5D72AC(v25, v27, &v36);
      uint64_t v11 = v29;
      uint64_t v8 = v30;
      sub_22A5DA400();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, v20, v21, "Set configuration. { reporterID=%lld, configuration=%{private}s }", (uint8_t *)v22, 0x16u);
      uint64_t v3 = v31;
      swift_arrayDestroy();
      uint64_t v28 = v24;
      a2 = v32;
      MEMORY[0x22A6CDBE0](v28, -1, -1);
      MEMORY[0x22A6CDBE0](v22, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_22A5B83B8(a2, 0xD000000000000026, 0x800000022A5DD590, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v8, 1, v34) == 1)
    {
      return sub_22A5B5680((uint64_t)v8, &qword_26AD78A18);
    }
    else
    {
      sub_22A5B605C((uint64_t)v8, (uint64_t)v11, type metadata accessor for ReporterState);
      swift_bridgeObjectRetain();
      sub_22A5B5D34((uint64_t)v11, v3, a1);
      swift_bridgeObjectRelease();
      return sub_22A5B60C4((uint64_t)v11, type metadata accessor for ReporterState);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5B83B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v24 = a2;
  unint64_t v25 = a3;
  uint64_t v8 = type metadata accessor for ReporterState(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22A5DA260();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (uint64_t *)((char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v16 = *(void **)(v5 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *uint64_t v15 = v16;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F8F0E0], v12);
  id v17 = v16;
  LOBYTE(v16) = sub_22A5DA270();
  (*(void (**)(void *, uint64_t))(v13 + 8))(v15, v12);
  if (v16)
  {
    if (qword_26AD78A38 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  if (qword_26AD78CB0 == a1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a4, 1, 1, v8);
  }
  int v19 = (uint64_t *)(v5 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_clientReporterStates);
  swift_beginAccess();
  uint64_t v20 = *v19;
  if (!*(void *)(v20 + 16)) {
    return sub_22A5D0C98(v24, v25, a4);
  }
  unint64_t v21 = sub_22A5B6F8C(a1);
  if ((v22 & 1) == 0) {
    return sub_22A5D0C98(v24, v25, a4);
  }
  sub_22A5B6270(*(void *)(v20 + 56) + *(void *)(v9 + 72) * v21, (uint64_t)v11, type metadata accessor for ReporterState);
  sub_22A5B605C((uint64_t)v11, a4, type metadata accessor for ReporterState);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(a4, 0, 1, v8);
}

uint64_t sub_22A5B8660@<X0>(uint64_t *a1@<X8>)
{
  return sub_22A5B86C8(a1);
}

uint64_t sub_22A5B867C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22A5B7BC4(0x100000000);
  *a1 = result;
  return result;
}

uint64_t sub_22A5B86C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22A5B7BC4(0x100000000);
  *a1 = result;
  return result;
}

uint64_t sub_22A5B8714()
{
  return sub_22A5B874C(v0[2], v0[3], v0[4]);
}

uint64_t sub_22A5B8720()
{
  return sub_22A5B7F80(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_22A5B874C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22A5B7F80(a2, a3);
}

uint64_t type metadata accessor for ReporterData()
{
  return self;
}

uint64_t AudioAnalyticsTraceWrapperPostStart(__int16 a1)
{
  return MEMORY[0x270ED9F50]((4 * (a1 & 0x3FFF)) | 0x21040001u);
}

uint64_t AudioAnalyticsTraceWrapperPostEnd(__int16 a1)
{
  return MEMORY[0x270ED9F50]((4 * (a1 & 0x3FFF)) | 0x21040002u);
}

void AudioAnalyticsCreateSharedClientWithEndpoint(void *a1)
{
  uint64_t v1 = qword_26AD78A08;
  id v2 = a1;
  if (v1 != -1) {
    swift_once();
  }
  id v3 = objc_allocWithZone((Class)type metadata accessor for ServerClient(0));
  id v4 = v2;
  uint64_t v5 = sub_22A5C9890(v2, 0);
  id v6 = (id)qword_26AD78CD0;
  qword_26AD78CD0 = (uint64_t)v5;
}

Swift::Void __swiftcall AudioAnalyticsCreateSharedClient(endpoint:)(NSXPCListenerEndpoint endpoint)
{
  if (qword_26AD78A08 != -1) {
    swift_once();
  }
  id v2 = objc_allocWithZone((Class)type metadata accessor for ServerClient(0));
  id v3 = endpoint.super.isa;
  qword_26AD78CD0 = (uint64_t)sub_22A5C9890(endpoint.super.isa, 0);
  MEMORY[0x270F9A758]();
}

void type metadata accessor for CFDictionary(uint64_t a1)
{
}

void type metadata accessor for AudioEventType(uint64_t a1)
{
}

void type metadata accessor for AudioEventCategory(uint64_t a1)
{
}

void type metadata accessor for AudioServiceType(uint64_t a1)
{
}

void sub_22A5B8950(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_22A5B899C()
{
  unint64_t result = qword_26837CEC8;
  if (!qword_26837CEC8)
  {
    type metadata accessor for AudioServiceType(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837CEC8);
  }
  return result;
}

_DWORD *sub_22A5B89F4@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_22A5B8A04(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

_WORD *sub_22A5B8A10@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)a2 = *result;
  *(unsigned char *)(a2 + 2) = 0;
  return result;
}

void sub_22A5B8A20(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_22A5B8A2C(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22A5B8A40()
{
  return sub_22A5DA580();
}

uint64_t sub_22A5B8A88()
{
  return sub_22A5DA570();
}

uint64_t sub_22A5B8AB4()
{
  return sub_22A5DA580();
}

uint64_t AudioAnalyticsCreateSharedClient()
{
  if (qword_26AD78A08 != -1) {
    return swift_once();
  }
  return result;
}

Swift::Void __swiftcall AudioAnalyticsCreateSharedClient()()
{
  if (qword_26AD78A08 != -1) {
    swift_once();
  }
}

Swift::Int64 __swiftcall AudioAnalyticsCreateReporter()()
{
  if (qword_26AD78A08 != -1) {
    uint64_t v0 = swift_once();
  }
  MEMORY[0x270FA5388](v0);
  id v2 = v1;
  sub_22A5DA3C0();

  return v4;
}

uint64_t AudioAnalyticsCreateReporterFromSessionID(uint64_t a1)
{
  if (qword_26AD78A08 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x270FA5388](a1);
  id v2 = v1;
  sub_22A5DA3C0();

  return v4;
}

Swift::Int64 __swiftcall AudioAnalyticsCreateReporterFromSessionID(_:)(Swift::UInt32 a1)
{
  if (qword_26AD78A08 != -1) {
    *(void *)&a1 = swift_once();
  }
  MEMORY[0x270FA5388](*(void *)&a1);
  id v2 = v1;
  sub_22A5DA3C0();

  return v4;
}

Swift::Void __swiftcall AudioAnalyticsStartReporter(_:)(Swift::Int64 a1)
{
  if (qword_26AD78A38 != -1) {
    swift_once();
  }
  if (qword_26AD78CB0 != a1)
  {
    if (qword_26AD78A08 != -1) {
      swift_once();
    }
    id v2 = (void *)qword_26AD78CD0;
    id v3 = *(NSObject **)(qword_26AD78CD0 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = a1;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_22A5BA92C;
    *(void *)(v5 + 24) = v4;
    v8[4] = sub_22A5B765C;
    v8[5] = v5;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_22A5B768C;
    v8[3] = &block_descriptor;
    id v6 = _Block_copy(v8);
    id v7 = v2;
    swift_retain();
    swift_release();
    dispatch_sync(v3, v6);
    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if (v3) {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall AudioAnalyticsStopReporter(_:)(Swift::Int64 a1)
{
  if (qword_26AD78A38 != -1) {
    swift_once();
  }
  if (qword_26AD78CB0 != a1)
  {
    if (qword_26AD78A08 != -1) {
      swift_once();
    }
    id v2 = (void *)qword_26AD78CD0;
    id v3 = *(NSObject **)(qword_26AD78CD0 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = a1;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_22A5BA944;
    *(void *)(v5 + 24) = v4;
    v8[4] = sub_22A5B7658;
    v8[5] = v5;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_22A5B768C;
    v8[3] = &block_descriptor_15;
    id v6 = _Block_copy(v8);
    id v7 = v2;
    swift_retain();
    swift_release();
    dispatch_sync(v3, v6);
    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if (v3) {
      __break(1u);
    }
  }
}

uint64_t AudioAnalyticsGetAudioServiceType(_:)(uint64_t a1)
{
  uint64_t v1 = a1;
  if (qword_26AD78A38 != -1) {
    a1 = swift_once();
  }
  if (qword_26AD78CB0 == v1) {
    return 0xFFFFLL;
  }
  if (qword_26AD78A08 != -1) {
    a1 = swift_once();
  }
  id v3 = (void *)qword_26AD78CD0;
  MEMORY[0x270FA5388](a1);
  type metadata accessor for AudioServiceType(0);
  id v4 = v3;
  sub_22A5DA3C0();

  return v5;
}

uint64_t AudioAnalyticsSetAudioServiceType(_:_:)(uint64_t result, __int16 a2)
{
  uint64_t v3 = result;
  if (qword_26AD78A38 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_26AD78CB0 != v3)
  {
    if (qword_26AD78A08 != -1) {
      swift_once();
    }
    id v4 = (void *)qword_26AD78CD0;
    unsigned __int16 v5 = *(NSObject **)(qword_26AD78CD0 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(_WORD *)(v6 + 24) = a2;
    *(void *)(v6 + 32) = v3;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = sub_22A5BA9B0;
    *(void *)(v7 + 24) = v6;
    v10[4] = sub_22A5B7658;
    v10[5] = v7;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1107296256;
    v10[2] = sub_22A5B768C;
    v10[3] = &block_descriptor_25;
    uint64_t v8 = _Block_copy(v10);
    id v9 = v4;
    swift_retain();
    swift_release();
    dispatch_sync(v5, v8);
    _Block_release(v8);
    LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    uint64_t result = swift_release();
    if (v5) {
      __break(1u);
    }
  }
  return result;
}

uint64_t AudioAnalyticsCopyConfiguration(_:)(uint64_t a1)
{
  uint64_t v1 = a1;
  if (qword_26AD78A38 != -1) {
    a1 = swift_once();
  }
  if (qword_26AD78CB0 == v1) {
    return 0;
  }
  if (qword_26AD78A08 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x270FA5388](a1);
  id v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF00);
  sub_22A5DA3C0();

  uint64_t v2 = sub_22A5DA280();
  swift_bridgeObjectRelease();
  return v2;
}

unint64_t sub_22A5B9638(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78958);
    uint64_t v2 = (void *)sub_22A5DA4F0();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v37;
  uint64_t v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = MEMORY[0x263F8EE58] + 8;
  uint64_t v11 = MEMORY[0x263F8D538];
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_22A5B7518();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    uint64_t v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_22A5B5AEC(v6, v7);
    sub_22A5B5AEC(v7, v40);
    sub_22A5B5AEC(v40, &v38);
    unint64_t result = sub_22A5B6AA4(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v1;
      uint64_t v15 = v11;
      uint64_t v16 = v10;
      id v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      uint64_t v11 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v7 = v12;
      int64_t i = v33;
      char v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      unint64_t result = (unint64_t)sub_22A5B5AEC(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v27 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_22A5B5AEC(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_22A5B9994(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF28);
    uint64_t v2 = sub_22A5DA4F0();
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
    id v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_22A5B5624(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_22A5B5AEC(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_22A5B5AEC(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_22A5B5AEC(v36, v37);
    sub_22A5B5AEC(v37, &v33);
    uint64_t result = sub_22A5DA460();
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
    uint64_t result = (uint64_t)sub_22A5B5AEC(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_22A5B7518();
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

void AudioAnalyticsSendMessage(_:_:_:_:)(uint64_t a1)
{
  if (qword_26AD78A38 != -1) {
    swift_once();
  }
  if (qword_26AD78CB0 != a1)
  {
    uint64_t aBlock = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78978);
    sub_22A5DA290();
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_22A5DA1F0();
    __swift_project_value_buffer(v2, (uint64_t)qword_26AD78CF8);
    oslog = sub_22A5DA1D0();
    os_log_type_t v3 = sub_22A5DA370();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 134217984;
      uint64_t aBlock = a1;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, oslog, v3, "Discarding message with at least one nil entry. { reporterID=%lld }", v4, 0xCu);
      MEMORY[0x22A6CDBE0](v4, -1, -1);
    }
    else
    {
    }
  }
}

void AudioAnalyticsSendSessionlessMessage(void *a1)
{
  id v1 = a1;
  AudioAnalyticsSendSessionlessMessage(_:_:_:)();
}

void AudioAnalyticsSendSessionlessMessage(_:_:_:)()
{
  uint64_t aBlock = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78978);
  sub_22A5DA290();
  if (qword_26AD78A40 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22A5DA1F0();
  __swift_project_value_buffer(v0, (uint64_t)qword_26AD78CF8);
  oslog = sub_22A5DA1D0();
  os_log_type_t v1 = sub_22A5DA370();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_22A5B3000, oslog, v1, "Discarding message with at least one nil entry.", v2, 2u);
    MEMORY[0x22A6CDBE0](v2, -1, -1);
  }
}

Swift::Void __swiftcall AudioAnalyticsDestroyReporter(_:)(Swift::Int64 a1)
{
  if (qword_26AD78A38 != -1) {
    swift_once();
  }
  if (qword_26AD78CB0 != a1)
  {
    if (qword_26AD78A08 != -1) {
      swift_once();
    }
    uint64_t v2 = (void *)qword_26AD78CD0;
    os_log_type_t v3 = *(NSObject **)(qword_26AD78CD0 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v2;
    *(void *)(v4 + 24) = a1;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_22A5BAADC;
    *(void *)(v5 + 24) = v4;
    v8[4] = sub_22A5B7658;
    v8[5] = v5;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_22A5B768C;
    v8[3] = &block_descriptor_65;
    uint64_t v6 = _Block_copy(v8);
    id v7 = v2;
    swift_retain();
    swift_release();
    dispatch_sync(v3, v6);
    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if (v3) {
      __break(1u);
    }
  }
}

uint64_t AudioAnalyticsRequestMessage(uint64_t a1, int a2, __int16 a3, void *aBlock)
{
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  AudioAnalyticsRequestMessage(_:_:_:_:)(a1, a2, a3, (uint64_t)sub_22A5BAB2C, v8);
  return swift_release();
}

uint64_t sub_22A5BA68C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t AudioAnalyticsRequestMessage(_:_:_:_:)(uint64_t result, int a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = result;
  if (qword_26AD78A38 != -1) {
    uint64_t result = swift_once();
  }
  if (qword_26AD78CB0 != v9)
  {
    if (qword_26AD78A08 != -1) {
      swift_once();
    }
    uint64_t v10 = (void *)qword_26AD78CD0;
    unint64_t v11 = *(NSObject **)(qword_26AD78CD0 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v10;
    *(void *)(v12 + 24) = v9;
    *(void *)(v12 + 32) = a4;
    *(void *)(v12 + 40) = a5;
    *(_DWORD *)(v12 + 48) = a2;
    *(_WORD *)(v12 + 52) = a3;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_22A5BAB80;
    *(void *)(v13 + 24) = v12;
    v17[4] = sub_22A5B7658;
    v17[5] = v13;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 1107296256;
    v17[2] = sub_22A5B768C;
    v17[3] = &block_descriptor_78;
    unint64_t v14 = _Block_copy(v17);
    id v15 = v10;
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v11, v14);
    _Block_release(v14);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

    swift_release();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22A5BA8AC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_22A5BA8D4@<X0>(uint64_t *a1@<X8>)
{
  return sub_22A5CB5D0(*(_DWORD *)(v1 + 24), a1);
}

uint64_t sub_22A5BA8F4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BA92C()
{
  return sub_22A5CB7F0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_22A5BA934()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BA944()
{
  return sub_22A5CB9C4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_22A5BA94C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BA95C@<X0>(__int16 *a1@<X8>)
{
  return sub_22A5CBA40(*(void *)(v1 + 24), a1);
}

uint64_t sub_22A5BA978()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22A5BA9B0()
{
  return sub_22A5CBF34(*(void *)(v0 + 16), *(unsigned __int16 *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_22A5BA9C0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_22A5BA9D0@<X0>(uint64_t *a1@<X8>)
{
  return sub_22A5CBFBC(*(void *)(v1 + 24), a1);
}

uint64_t sub_22A5BA9EC()
{
  return objectdestroy_27Tm(40);
}

uint64_t sub_22A5BA9F4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BAA04(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_22A5BAA40(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  _OWORD *result = v4 + 1;
  return result;
}

uint64_t sub_22A5BAA50()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 46, 7);
}

void sub_22A5BAA90()
{
  sub_22A5CC7E8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(_DWORD *)(v0 + 40), *(unsigned __int16 *)(v0 + 44));
}

uint64_t sub_22A5BAAA4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BAAB4()
{
  return objectdestroy_27Tm(38);
}

void sub_22A5BAABC()
{
  sub_22A5CCA30(*(void *)(v0 + 16), *(void *)(v0 + 24), *(_DWORD *)(v0 + 32), *(unsigned __int16 *)(v0 + 36));
}

uint64_t sub_22A5BAACC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BAADC()
{
  return sub_22A5CCC54(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_22A5BAAE4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BAAF4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5BAB2C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_22A5BAB40()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 54, 7);
}

uint64_t sub_22A5BAB80()
{
  return sub_22A5CCE54(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32), *(void *)(v0 + 40), *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
}

uint64_t sub_22A5BAB94()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BABA4@<X0>(uint64_t *a1@<X8>)
{
  return sub_22A5B8660(a1);
}

uint64_t sub_22A5BABDC@<X0>(uint64_t *a1@<X8>)
{
  return sub_22A5BA8D4(a1);
}

id AudioAnalyticsReporter.init(newReporterID:)()
{
  return sub_22A5BBF8C((const char **)&selRef_initWithNewReporterID);
}

{
  void *v0;
  uint64_t v1;
  char *v2;
  char *v3;
  id v4;
  id v5;
  objc_super v7;
  uint64_t v8;

  uint64_t v1 = qword_26AD78A08;
  uint64_t v2 = v0;
  os_log_type_t v3 = v2;
  if (v1 != -1) {
    uint64_t v2 = (char *)swift_once();
  }
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = v4;
  sub_22A5DA3C0();

  *(void *)&v3[OBJC_IVAR___AudioAnalyticsReporter_reporterID] = v8;
  v7.receiver = v3;
  v7.super_class = (Class)AudioAnalyticsReporter;
  return objc_msgSendSuper2(&v7, sel_init);
}

void __swiftcall AudioAnalyticsReporter.init(reporterID:)(AudioAnalyticsReporter *__return_ptr retstr, Swift::Int64 reporterID)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v3, sel_initWithReporterID_, reporterID);
}

id AudioAnalyticsReporter.init(reporterID:)(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___AudioAnalyticsReporter_reporterID) = a1;
  v3.super_class = (Class)AudioAnalyticsReporter;
  return objc_msgSendSuper2(&v3, sel_init);
}

id AudioAnalyticsReporter.init(sessionID:serviceType:)(uint64_t a1, unsigned __int16 a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v4, sel_initWithSessionID_serviceType_, a1, a2);
}

id AudioAnalyticsReporter.init(sessionID:serviceType:)(uint64_t a1, __int16 a2)
{
  uint64_t v4 = qword_26AD78A08;
  uint64_t v5 = v2;
  uint64_t v6 = v5;
  if (v4 != -1) {
    uint64_t v5 = (char *)swift_once();
  }
  MEMORY[0x270FA5388](v5);
  id v8 = v7;
  sub_22A5DA3C0();

  uint64_t v9 = aBlock[0];
  *(void *)&v6[OBJC_IVAR___AudioAnalyticsReporter_reporterID] = aBlock[0];
  uint64_t v10 = (void *)qword_26AD78CD0;
  unint64_t v11 = *(NSObject **)(qword_26AD78CD0 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  *(_WORD *)(v12 + 24) = a2;
  *(void *)(v12 + 32) = v9;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_22A5BA9B0;
  *(void *)(v13 + 24) = v12;
  aBlock[4] = sub_22A5B7684;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22A5B768C;
  aBlock[3] = &block_descriptor_0;
  unint64_t v14 = _Block_copy(aBlock);
  id v15 = v10;
  swift_retain();
  swift_release();
  dispatch_sync(v11, v14);
  _Block_release(v14);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();

  swift_release();
  id result = (id)swift_release();
  if (v14)
  {
    __break(1u);
  }
  else
  {
    v17.receiver = v6;
    v17.super_class = (Class)AudioAnalyticsReporter;
    return objc_msgSendSuper2(&v17, sel_init);
  }
  return result;
}

id sub_22A5BB0F0()
{
  if (!sub_22A5BB2E8(0x74696E696564, 0xE600000000000000)) {
    goto LABEL_5;
  }
  if (qword_26AD78A08 != -1) {
    swift_once();
  }
  uint64_t v1 = (char *)qword_26AD78CD0;
  uint64_t v2 = &v0[OBJC_IVAR___AudioAnalyticsReporter_reporterID];
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v1;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_22A5BAADC;
  *(void *)(v6 + 24) = v5;
  aBlock[4] = sub_22A5BDB2C;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22A5B768C;
  aBlock[3] = &block_descriptor_82;
  id v7 = _Block_copy(aBlock);
  id v8 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();

  swift_release();
  id result = (id)swift_release();
  if (v4)
  {
    __break(1u);
  }
  else
  {
LABEL_5:
    v11.receiver = v0;
    v11.super_class = (Class)AudioAnalyticsReporter;
    return objc_msgSendSuper2(&v11, sel_dealloc);
  }
  return result;
}

BOOL sub_22A5BB2E8(uint64_t a1, unint64_t a2)
{
  id v5 = objc_msgSend(v2, sel_reporterID);
  if (qword_26AD78A38 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_26AD78CB0;
  if (v5 == (id)qword_26AD78CB0)
  {
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_22A5DA1F0();
    __swift_project_value_buffer(v7, (uint64_t)qword_26AD78CF8);
    swift_bridgeObjectRetain_n();
    id v8 = v2;
    uint64_t v9 = sub_22A5DA1D0();
    os_log_type_t v10 = sub_22A5DA370();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v15 = v12;
      *(_DWORD *)uint64_t v11 = 136380931;
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_22A5D72AC(a1, a2, &v15);
      sub_22A5DA400();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 12) = 2048;
      objc_msgSend(v8, sel_reporterID, v14, v15);

      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v9, v10, "CAReporterID is invalid. Returning early. { function=%{private}s, reporterID=%lld }", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v12, -1, -1);
      MEMORY[0x22A6CDBE0](v11, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return v5 != (id)v6;
}

uint64_t AudioAnalyticsReporter.reporterID.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___AudioAnalyticsReporter_reporterID;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t AudioAnalyticsReporter.reporterID.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___AudioAnalyticsReporter_reporterID);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t AudioAnalyticsReporter.serviceType.getter()
{
  if (qword_26AD78A08 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26AD78CD0;
  id v2 = objc_msgSend(v0, sel_reporterID);
  MEMORY[0x270FA5388](v2);
  type metadata accessor for AudioServiceType(0);
  sub_22A5DA3C0();

  return v4;
}

uint64_t AudioAnalyticsReporter.configuration.getter()
{
  if (qword_26AD78A08 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26AD78CD0;
  id v2 = objc_msgSend(v0, sel_reporterID);
  MEMORY[0x270FA5388](v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF00);
  sub_22A5DA3C0();

  return v4;
}

void AudioAnalyticsReporter.configuration.setter(uint64_t a1)
{
  if (sub_22A5BB2E8(0x72756769666E6F63, 0xED00006E6F697461))
  {
    uint64_t v3 = (SEL *)0x264880000;
    objc_msgSend(v1, sel_reporterID);
    unint64_t v4 = sub_22A5BCC68(a1);
    if (v4)
    {
      uint64_t v5 = v4;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = sub_22A5BD3D4(0x72756769666E6F63, 0xED00006E6F697461);
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
    }
    if (!*(void *)(v5 + 16)) {
      goto LABEL_13;
    }
    if (qword_26AD78A08 != -1) {
      swift_once();
    }
    uint64_t v6 = (char *)(id)qword_26AD78CD0;
    id v7 = objc_msgSend(v1, sel_reporterID);
    id v8 = *(NSObject **)&v6[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
    id v1 = (void *)swift_allocObject();
    v1[2] = v6;
    v1[3] = v5;
    v1[4] = v7;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_22A5B8714;
    *(void *)(v9 + 24) = v1;
    aBlock[4] = sub_22A5BDB2C;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22A5B768C;
    aBlock[3] = &block_descriptor_13;
    uint64_t v3 = (SEL *)_Block_copy(aBlock);
    os_log_type_t v10 = v6;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    dispatch_sync(v8, v3);
    _Block_release(v3);
    LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
    swift_bridgeObjectRelease();

    swift_release();
    swift_release();
    if (v8)
    {
      __break(1u);
LABEL_13:
      swift_bridgeObjectRelease();
      if (qword_26AD78A40 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_22A5DA1F0();
      __swift_project_value_buffer(v11, (uint64_t)qword_26AD78CF8);
      uint64_t v15 = v1;
      uint64_t v12 = sub_22A5DA1D0();
      os_log_type_t v13 = sub_22A5DA370();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 134217984;
        aBlock[0] = [v15 v3[468]];
        sub_22A5DA400();

        _os_log_impl(&dword_22A5B3000, v12, v13, "Configuration empty. Returning early. { reporterID=%lld }", v14, 0xCu);
        MEMORY[0x22A6CDBE0](v14, -1, -1);
      }
      else
      {
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_22A5BBF10(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_configuration);
  uint64_t v4 = sub_22A5DA2A0();

  *a2 = v4;
}

void __swiftcall AudioAnalyticsReporter.init()(AudioAnalyticsReporter *__return_ptr retstr)
{
}

id sub_22A5BBF8C(const char **a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v3 = *a1;
  return [v2 v3];
}

void AudioAnalyticsReporter.init()()
{
}

uint64_t AudioAnalyticsReporter.set(serviceType:)(__int16 a1)
{
  uint64_t result = sub_22A5BB2E8(0xD000000000000011, 0x800000022A5DCB10);
  if (result)
  {
    if (qword_26AD78A08 != -1) {
      swift_once();
    }
    uint64_t v4 = (char *)(id)qword_26AD78CD0;
    id v5 = objc_msgSend(v1, sel_reporterID);
    uint64_t v6 = *(NSObject **)&v4[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v4;
    *(_WORD *)(v7 + 24) = a1;
    *(void *)(v7 + 32) = v5;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = sub_22A5BDB94;
    *(void *)(v8 + 24) = v7;
    v11[4] = sub_22A5BDB2C;
    v11[5] = v8;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_22A5B768C;
    v11[3] = &block_descriptor_24;
    uint64_t v9 = _Block_copy(v11);
    os_log_type_t v10 = v4;
    swift_retain();
    swift_release();
    dispatch_sync(v6, v9);
    _Block_release(v9);
    LOBYTE(v6) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    uint64_t result = swift_release();
    if (v6) {
      __break(1u);
    }
  }
  return result;
}

Swift::Void __swiftcall AudioAnalyticsReporter.start()()
{
  if (sub_22A5BB2E8(0x29287472617473, 0xE700000000000000))
  {
    if (qword_26AD78A08 != -1) {
      swift_once();
    }
    id v1 = (char *)(id)qword_26AD78CD0;
    id v2 = objc_msgSend(v0, sel_reporterID);
    id v3 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v1;
    *(void *)(v4 + 24) = v2;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_22A5BA92C;
    *(void *)(v5 + 24) = v4;
    v8[4] = sub_22A5BDB2C;
    v8[5] = v5;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_22A5B768C;
    v8[3] = &block_descriptor_34;
    uint64_t v6 = _Block_copy(v8);
    uint64_t v7 = v1;
    swift_retain();
    swift_release();
    dispatch_sync(v3, v6);
    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if (v3) {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall AudioAnalyticsReporter.stop()()
{
  if (sub_22A5BB2E8(0x2928706F7473, 0xE600000000000000))
  {
    if (qword_26AD78A08 != -1) {
      swift_once();
    }
    id v1 = (char *)(id)qword_26AD78CD0;
    id v2 = objc_msgSend(v0, sel_reporterID);
    id v3 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v1;
    *(void *)(v4 + 24) = v2;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_22A5BA944;
    *(void *)(v5 + 24) = v4;
    v8[4] = sub_22A5BDB2C;
    v8[5] = v5;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_22A5B768C;
    v8[3] = &block_descriptor_44;
    uint64_t v6 = _Block_copy(v8);
    uint64_t v7 = v1;
    swift_retain();
    swift_release();
    dispatch_sync(v3, v6);
    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if (v3) {
      __break(1u);
    }
  }
}

uint64_t AudioAnalyticsReporter.sendMessage(_:category:type:)(uint64_t a1, int a2, __int16 a3)
{
  uint64_t result = sub_22A5BB2E8(0xD00000000000001DLL, 0x800000022A5DCB30);
  if (result)
  {
    objc_msgSend(v3, sel_reporterID);
    unint64_t v8 = sub_22A5BCC68(a1);
    if (v8 || (result = sub_22A5BD3D4(0xD00000000000001DLL, 0x800000022A5DCB30), (unint64_t v8 = result) != 0))
    {
      if (qword_26AD78A08 != -1) {
        swift_once();
      }
      uint64_t v9 = (char *)(id)qword_26AD78CD0;
      id v10 = objc_msgSend(v3, sel_reporterID);
      uint64_t v11 = *(NSObject **)&v9[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v9;
      *(void *)(v12 + 24) = v10;
      *(void *)(v12 + 32) = v8;
      *(_DWORD *)(v12 + 40) = a2;
      *(_WORD *)(v12 + 44) = a3;
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + 16) = sub_22A5BAA90;
      *(void *)(v13 + 24) = v12;
      v16[4] = sub_22A5BDB2C;
      v16[5] = v13;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 1107296256;
      v16[2] = sub_22A5B768C;
      v16[3] = &block_descriptor_54;
      uint64_t v14 = _Block_copy(v16);
      uint64_t v15 = v9;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      dispatch_sync(v11, v14);
      _Block_release(v14);
      LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
      swift_bridgeObjectRelease();

      swift_release();
      uint64_t result = swift_release();
      if (v14) {
        __break(1u);
      }
    }
  }
  return result;
}

uint64_t AudioAnalyticsReporter.requestMessage(for:type:callback:)(int a1, __int16 a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_22A5BB2E8(0xD000000000000022, 0x800000022A5DCB50);
  if (result)
  {
    if (qword_26AD78A08 != -1) {
      swift_once();
    }
    id v10 = (char *)(id)qword_26AD78CD0;
    id v11 = objc_msgSend(v4, sel_reporterID);
    uint64_t v12 = *(NSObject **)&v10[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v10;
    *(void *)(v13 + 24) = v11;
    *(void *)(v13 + 32) = a3;
    *(void *)(v13 + 40) = a4;
    *(_DWORD *)(v13 + 48) = a1;
    *(_WORD *)(v13 + 52) = a2;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_22A5BAB80;
    *(void *)(v14 + 24) = v13;
    v18[4] = sub_22A5BDB2C;
    v18[5] = v14;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 1107296256;
    v18[2] = sub_22A5B768C;
    v18[3] = &block_descriptor_64;
    uint64_t v15 = _Block_copy(v18);
    int64_t v16 = v10;
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v12, v15);
    _Block_release(v15);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

    swift_release();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
  return result;
}

unint64_t sub_22A5BCC68(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78958);
    id v2 = (void *)sub_22A5DA4F0();
  }
  else
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v23 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_37;
      }
      if (v13 >= v22)
      {
LABEL_33:
        sub_22A5B7518();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v23 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v22) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v23 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v22) {
            goto LABEL_33;
          }
          unint64_t v14 = *(void *)(v23 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v22) {
              goto LABEL_33;
            }
            unint64_t v14 = *(void *)(v23 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v22) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_38;
                  }
                  if (v12 >= v22) {
                    goto LABEL_33;
                  }
                  unint64_t v14 = *(void *)(v23 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_22A5BDAD0(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_22A5B5624(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    uint64_t v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_22A5BDAD0((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_22A5B5680((uint64_t)v30, &qword_26AD787A8);
      swift_bridgeObjectRelease();
      sub_22A5B7518();
      swift_release();
      return 0;
    }
    sub_22A5B5624((uint64_t)v31 + 8, (uint64_t)v25);
    sub_22A5B5680((uint64_t)v30, &qword_26AD787A8);
    sub_22A5B5AEC(v25, v26);
    long long v27 = v24;
    sub_22A5B5AEC(v26, v28);
    long long v16 = v27;
    sub_22A5B5AEC(v28, v29);
    sub_22A5B5AEC(v29, &v27);
    unint64_t result = sub_22A5B6AA4(v16, *((uint64_t *)&v16 + 1));
    unint64_t v17 = result;
    if (v18)
    {
      unint64_t v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *unint64_t v8 = v16;
      uint64_t v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      unint64_t result = (unint64_t)sub_22A5B5AEC(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    unint64_t result = (unint64_t)sub_22A5B5AEC(&v27, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v19 = v2[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_36;
    }
    v2[2] = v21;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

void sub_22A5BD03C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF40);
    id v2 = (void *)sub_22A5DA4F0();
  }
  else
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v35 = v1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 64);
  uint64_t v6 = &v41;
  int64_t v34 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  unint64_t v8 = &qword_26AD78960;
  uint64_t v9 = &qword_26837CF48;
  unint64_t v10 = 0x263F8C6D0uLL;
  while (1)
  {
    if (v5)
    {
      uint64_t v36 = (v5 - 1) & v5;
      int64_t v37 = v7;
      unint64_t v19 = __clz(__rbit64(v5)) | (v7 << 6);
    }
    else
    {
      int64_t v20 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_36;
      }
      if (v20 >= v34)
      {
LABEL_33:
        sub_22A5B7518();
        return;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v20);
      int64_t v22 = v7 + 1;
      if (!v21)
      {
        int64_t v22 = v7 + 2;
        if (v7 + 2 >= v34) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v22);
        if (!v21)
        {
          int64_t v22 = v7 + 3;
          if (v7 + 3 >= v34) {
            goto LABEL_33;
          }
          unint64_t v21 = *(void *)(v35 + 8 * v22);
          if (!v21)
          {
            int64_t v22 = v7 + 4;
            if (v7 + 4 >= v34) {
              goto LABEL_33;
            }
            unint64_t v21 = *(void *)(v35 + 8 * v22);
            if (!v21)
            {
              uint64_t v23 = v7 + 5;
              if (v7 + 5 >= v34) {
                goto LABEL_33;
              }
              unint64_t v21 = *(void *)(v35 + 8 * v23);
              if (!v21)
              {
                while (1)
                {
                  int64_t v22 = v23 + 1;
                  if (__OFADD__(v23, 1)) {
                    goto LABEL_37;
                  }
                  if (v22 >= v34) {
                    goto LABEL_33;
                  }
                  unint64_t v21 = *(void *)(v35 + 8 * v22);
                  ++v23;
                  if (v21) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v22 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v36 = (v21 - 1) & v21;
      int64_t v37 = v22;
      unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
    }
    long long v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v26 = *v24;
    uint64_t v25 = v24[1];
    sub_22A5B5624(*(void *)(v1 + 56) + 32 * v19, (uint64_t)v6);
    v40[0] = v26;
    v40[1] = v25;
    sub_22A5B5624((uint64_t)v6, (uint64_t)v39);
    swift_bridgeObjectRetain_n();
    sub_22A5B5680((uint64_t)v40, v8);
    sub_22A5BDA2C(0, v9);
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();

      sub_22A5B7518();
      swift_release();
      return;
    }
    unint64_t v27 = sub_22A5B6AA4(v26, v25);
    unint64_t v28 = v27;
    if (v29)
    {
      unint64_t v11 = v10;
      int64_t v12 = v9;
      int64_t v13 = v6;
      uint64_t v14 = v1;
      int64_t v15 = v8;
      long long v16 = (uint64_t *)(v2[6] + 16 * v27);
      swift_bridgeObjectRelease();
      *long long v16 = v26;
      v16[1] = v25;
      unint64_t v8 = v15;
      uint64_t v1 = v14;
      uint64_t v6 = v13;
      uint64_t v9 = v12;
      unint64_t v10 = v11;
      uint64_t v17 = v2[7];
      uint64_t v18 = 8 * v28;

      *(void *)(v17 + v18) = v38;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v27;
    long long v30 = (uint64_t *)(v2[6] + 16 * v27);
    uint64_t *v30 = v26;
    v30[1] = v25;
    *(void *)(v2[7] + 8 * v27) = v38;
    uint64_t v31 = v2[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_35;
    }
    v2[2] = v33;
LABEL_8:
    unint64_t v5 = v36;
    int64_t v7 = v37;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
}

uint64_t sub_22A5BD3D4(uint64_t a1, unint64_t a2)
{
  if (qword_26AD78A40 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_22A5DA1F0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26AD78CF8);
  swift_bridgeObjectRetain_n();
  unint64_t v5 = sub_22A5DA1D0();
  os_log_type_t v6 = sub_22A5DA370();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)uint64_t v7 = 136380931;
    swift_bridgeObjectRetain();
    sub_22A5D72AC(a1, a2, &v10);
    sub_22A5DA400();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2048;
    sub_22A5DA400();
    _os_log_impl(&dword_22A5B3000, v5, v6, "Dictionary is not a string-keyed dictionary. Returning early. { function=%{private}s, reporterID=%lld }", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A6CDBE0](v8, -1, -1);
    MEMORY[0x22A6CDBE0](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_22A5BD5A0()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22A5BD5D8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BD5E8()
{
  return objectdestroy_27Tm(40);
}

uint64_t sub_22A5BD5F0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BD600()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BD610()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BD648()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BD658()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BD668()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 46, 7);
}

uint64_t sub_22A5BD6A8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t _sSo22AudioAnalyticsReporterC0aB0E22sendSessionlessMessage_8category4typeySDys11AnyHashableVypG_So0A13EventCategoryVSo0aK4TypeVtFZ_0(uint64_t a1, int a2, __int16 a3)
{
  if (qword_26AD78A38 != -1) {
    swift_once();
  }
  unint64_t v6 = sub_22A5BCC68(a1);
  if (v6 || (result = sub_22A5BD3D4(0xD000000000000028, 0x800000022A5DCCB0), (unint64_t v6 = result) != 0))
  {
    if (qword_26AD78A08 != -1) {
      swift_once();
    }
    uint64_t v8 = (void *)qword_26AD78CD0;
    uint64_t v9 = *(NSObject **)(qword_26AD78CD0 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v8;
    *(void *)(v10 + 24) = v6;
    *(_DWORD *)(v10 + 32) = a2;
    *(_WORD *)(v10 + 36) = a3;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_22A5BAABC;
    *(void *)(v11 + 24) = v10;
    v14[4] = sub_22A5BDB2C;
    v14[5] = v11;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 1107296256;
    v14[2] = sub_22A5B768C;
    v14[3] = &block_descriptor_92;
    int64_t v12 = _Block_copy(v14);
    id v13 = v8;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    dispatch_sync(v9, v12);
    _Block_release(v12);
    LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
    swift_bridgeObjectRelease();

    swift_release();
    uint64_t result = swift_release();
    if (v12) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22A5BD8EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 54, 7);
}

uint64_t sub_22A5BD92C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

char *keypath_get_selector_reporterID()
{
  return sel_reporterID;
}

id sub_22A5BD948@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_reporterID);
  *a2 = result;
  return result;
}

id sub_22A5BD97C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setReporterID_, *a1);
}

char *keypath_get_selector_configuration()
{
  return sel_configuration;
}

void sub_22A5BD9A0(uint64_t a1, void **a2)
{
  id v2 = *a2;
  id v3 = (id)sub_22A5DA280();
  objc_msgSend(v2, sel_setConfiguration_, v3);
}

uint64_t type metadata accessor for AudioAnalyticsReporter(uint64_t a1)
{
  return sub_22A5BDA2C(a1, &qword_26837CF38);
}

uint64_t sub_22A5BDA2C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22A5BDA68()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5BDAA0(uint64_t a1)
{
  return sub_22A5BA68C(a1, *(void *)(v1 + 16));
}

uint64_t sub_22A5BDAA8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BDAB8()
{
  return objectdestroy_27Tm(38);
}

uint64_t sub_22A5BDAC0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5BDAD0(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_22A5BDB64@<X0>(uint64_t *a1@<X8>)
{
  return sub_22A5BA9D0(a1);
}

uint64_t sub_22A5BDB7C@<X0>(__int16 *a1@<X8>)
{
  return sub_22A5BA95C(a1);
}

id AudioAnalyticsTestReporter.__allocating_init(newReporterID:)()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_initWithNewReporterID);
}

id AudioAnalyticsTestReporter.init(newReporterID:)()
{
  id v1 = objc_msgSend(v0, sel_initWithNewReporterID);
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  objc_msgSendSuper2(&v3, sel_setServiceType_, 11);
  return v1;
}

uint64_t type metadata accessor for AudioAnalyticsTestReporter()
{
  return self;
}

id AudioAnalyticsTestReporter.__allocating_init(reporterID:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return objc_msgSend(v3, sel_initWithReporterID_, a1);
}

id AudioAnalyticsTestReporter.init(reporterID:)(uint64_t a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  return objc_msgSendSuper2(&v4, sel_initWithReporterID_, a1);
}

id AudioAnalyticsTestReporter.__allocating_init(sessionID:serviceType:)(uint64_t a1, unsigned __int16 a2)
{
  id v5 = objc_allocWithZone(v2);
  return objc_msgSend(v5, sel_initWithSessionID_serviceType_, a1, a2);
}

id AudioAnalyticsTestReporter.init(sessionID:serviceType:)(uint64_t a1, unsigned __int16 a2)
{
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  return objc_msgSendSuper2(&v6, sel_initWithSessionID_serviceType_, a1, a2);
}

id AudioAnalyticsTestReporter.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22A5BDEAC(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_22A5D2C78(0, v2, 0);
    uint64_t result = v9;
    objc_super v4 = (int *)(a1 + 32);
    do
    {
      int v6 = *v4++;
      int v5 = v6;
      uint64_t v10 = result;
      unint64_t v8 = *(void *)(result + 16);
      unint64_t v7 = *(void *)(result + 24);
      if (v8 >= v7 >> 1)
      {
        sub_22A5D2C78(v7 > 1, v8 + 1, 1);
        uint64_t result = v10;
      }
      *(void *)(result + 16) = v8 + 1;
      *(_DWORD *)(result + 4 * v8 + 32) = v5;
      --v2;
    }
    while (v2);
  }
  return result;
}

void sub_22A5BDF6C()
{
  qword_26AD78CB0 = 0;
}

void sub_22A5BDF78()
{
  id v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    id v1 = v0;
    int internalBuild = MobileGestalt_get_internalBuild();

    if (internalBuild)
    {
      int v6 = &type metadata for AudioAnalytics;
      unint64_t v7 = sub_22A5BED48();
      char v3 = sub_22A5DA1C0();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
      char v4 = v3 ^ 1;
    }
    else
    {
      char v4 = 0;
    }
    byte_26AD78CD8 = v4 & 1;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22A5BE004()
{
  uint64_t result = os_variant_is_darwinos();
  byte_26837D7D1 = result;
  return result;
}

uint64_t sub_22A5BE028()
{
  return 1;
}

uint64_t sub_22A5BE030()
{
  return sub_22A5DA580();
}

uint64_t sub_22A5BE074()
{
  return sub_22A5DA560();
}

uint64_t sub_22A5BE09C()
{
  return sub_22A5DA580();
}

const char *sub_22A5BE0DC()
{
  return "AudioAnalytics";
}

const char *sub_22A5BE0F0()
{
  return "SimulateCustomer";
}

unint64_t AudioEventType.description.getter(unsigned __int16 a1)
{
  int v1 = a1;
  unint64_t result = 0x636972656E6567;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x7472617473;
      break;
    case 2:
      unint64_t result = 1886352499;
      break;
    case 3:
      unint64_t result = 0x6574617669746361;
      break;
    case 4:
      unint64_t result = 0x6176697463616564;
      break;
    case 5:
      unint64_t result = 0x7075746573;
      break;
    case 6:
      unint64_t result = 0x726F727265;
      break;
    case 7:
      unint64_t result = 0x7465446575737369;
      break;
    case 8:
      unint64_t result = 0x676F4C7265776F70;
      break;
    case 9:
      unint64_t result = 0x696E556F69647561;
      break;
    case 10:
      unint64_t result = 0x766972446964696DLL;
      break;
    case 11:
      unint64_t result = 0x7972616D6D7573;
      break;
    case 12:
      unint64_t result = 0xD000000000000016;
      break;
    case 13:
      unint64_t result = 0x7078456F69647561;
      break;
    case 14:
      unint64_t result = 0xD000000000000014;
      break;
    case 15:
      unint64_t result = 0x694B726F736E6573;
      break;
    case 16:
      unint64_t result = 0x656C706D6973;
      break;
    case 17:
      unint64_t result = 0x6172676F74736968;
      break;
    case 18:
      unint64_t result = 0x6574617473;
      break;
    case 19:
      unint64_t result = 0x6F4C79726F6D656DLL;
      break;
    case 20:
      unint64_t result = 0x6E49646F50726961;
      break;
    case 21:
      unint64_t result = 0x4955726F66;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t sub_22A5BE40C()
{
  return AudioEventType.description.getter(*v0);
}

unint64_t AudioServiceType.description.getter(unsigned __int16 a1)
{
  int v1 = a1;
  unint64_t result = 0x6E6F6870656C6574;
  switch(v1)
  {
    case 0:
      unint64_t result = 0x636972656E6567;
      break;
    case 1:
      unint64_t result = 1769105779;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x73636974706168;
      break;
    case 4:
      unint64_t result = 0x736D72616C61;
      break;
    case 5:
      unint64_t result = 0x6F6C41646E617473;
      break;
    case 6:
      unint64_t result = 0x747541646E756F73;
      break;
    case 7:
      unint64_t result = 0x6D726F46676E6F6CLL;
      break;
    case 8:
    case 9:
      unint64_t result = 0xD000000000000010;
      break;
    case 10:
      unint64_t result = 0x737472656C61;
      break;
    case 11:
      unint64_t result = 1953719668;
      break;
    case 12:
      unint64_t result = 0x6567617355697061;
      break;
    case 13:
      unint64_t result = 0x6F536D6574737973;
      break;
    case 14:
      unint64_t result = 0x616E41646E756F73;
      break;
    case 15:
      unint64_t result = 0x657275636573;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t sub_22A5BE650()
{
  return AudioServiceType.description.getter(*v0);
}

uint64_t AudioEventCategory.description.getter(int a1)
{
  int v1 = (unsigned __int16)a1;
  if ((a1 & 0xFFFF0000) == 0)
  {
    if (!(_WORD)a1) {
      return 0;
    }
    goto LABEL_4;
  }
  sub_22A5DA2E0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_22A5DA2E0();
LABEL_4:
    sub_22A5BE7D8(v1);
    sub_22A5DA2E0();
    swift_bridgeObjectRelease();
  }
  return 0;
}

unint64_t sub_22A5BE7D8(int a1)
{
  int v1 = a1 + 1;
  unint64_t result = 0x636972656E6547;
  switch(v1)
  {
    case 0:
      unint64_t result = 0x6E776F6E6B6E55;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x64726F636552;
      break;
    case 4:
      unint64_t result = 0x7475706E49;
      break;
    case 5:
      unint64_t result = 0x6B63616279616C50;
      break;
    case 6:
      unint64_t result = 0x74757074754FLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 20297;
      break;
    case 9:
      unint64_t result = 0x7075746553;
      break;
    case 10:
      unint64_t result = 0x6552746E65696C43;
      break;
    case 11:
      unint64_t result = 0x6168436574756F52;
      break;
    case 12:
      unint64_t result = 0x726F727245;
      break;
    case 13:
      unint64_t result = 0x74726F7065524F49;
      break;
    case 14:
      unint64_t result = 0x616D726F66726550;
      break;
    case 15:
      unint64_t result = 0x656D756C6F56;
      break;
    case 16:
      unint64_t result = 0x65736E61707845;
      break;
    case 17:
      unint64_t result = 0x48676E6972616548;
      break;
    case 18:
      unint64_t result = 0x73646F50726941;
      break;
    case 19:
      unint64_t result = 0x6F72506563696F56;
      break;
    case 21:
      unint64_t result = 0x6C616974617053;
      break;
    case 22:
      unint64_t result = 0x556F5478694D5056;
      break;
    default:
      unint64_t result = 0x656E696665646E55;
      break;
  }
  return result;
}

uint64_t sub_22A5BEA8C()
{
  return AudioEventCategory.description.getter(*v0);
}

uint64_t sub_22A5BEA94(uint64_t a1)
{
  uint64_t v1 = sub_22A5BDEAC(a1);
  unint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    uint64_t v4 = 0;
    goto LABEL_10;
  }
  if (v2 < 8)
  {
    uint64_t v3 = 0;
    LODWORD(v4) = 0;
LABEL_8:
    unint64_t v11 = v2 - v3;
    int64_t v12 = (int *)(v1 + 4 * v3 + 32);
    do
    {
      int v13 = *v12++;
      uint64_t v4 = v13 | v4;
      --v11;
    }
    while (v11);
    goto LABEL_10;
  }
  uint64_t v3 = v2 & 0x7FFFFFFFFFFFFFF8;
  int v5 = (int8x16_t *)(v1 + 48);
  int8x16_t v6 = 0uLL;
  uint64_t v7 = v2 & 0x7FFFFFFFFFFFFFF8;
  int8x16_t v8 = 0uLL;
  do
  {
    int8x16_t v6 = vorrq_s8(v5[-1], v6);
    int8x16_t v8 = vorrq_s8(*v5, v8);
    v5 += 2;
    v7 -= 8;
  }
  while (v7);
  int8x16_t v9 = vorrq_s8(v8, v6);
  int8x8_t v10 = vorr_s8(*(int8x8_t *)v9.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
  uint64_t v4 = (v10.i32[0] | v10.i32[1]);
  if (v2 != v3) {
    goto LABEL_8;
  }
LABEL_10:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22A5BEB60()
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  pid_t v0 = getpid();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A30);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_22A5DB1C0;
  *(void *)(v1 + 32) = 0xE00000001;
  *(_DWORD *)(v1 + 40) = 1;
  *(_DWORD *)(v1 + 44) = v0;
  memset(v6, 0, sizeof(v6));
  uint64_t v7 = 0;
  int v8 = 0;
  uint64_t v15 = 0;
  int v16 = 0;
  uint64_t v17 = 0;
  int v18 = 0;
  uint64_t v22 = 0;
  uint64_t v35 = 0;
  __int16 v36 = 0;
  int v41 = 0;
  uint64_t v48 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  int v11 = 0;
  int v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v20 = 0;
  int v21 = 0;
  long long v19 = 0u;
  long long v24 = 0u;
  memset(v25, 0, sizeof(v25));
  long long v26 = 0u;
  int v23 = 0;
  int v27 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  memset(v34, 0, sizeof(v34));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v42 = 0u;
  int v44 = 0;
  uint64_t v43 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  __int16 v47 = 0;
  long long v49 = 0u;
  __int16 v51 = 0;
  uint64_t v50 = 0;
  long long v52 = 0u;
  long long v53 = 0u;
  size_t v5 = 648;
  int v2 = sysctl((int *)(v1 + 32), 4u, v6, &v5, 0, 0);
  if (v2 == sub_22A5DA200())
  {
    uint64_t v3 = sub_22A5DA2F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

unint64_t sub_22A5BED48()
{
  unint64_t result = qword_26AD78A70;
  if (!qword_26AD78A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD78A70);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AudioAnalytics(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AudioAnalytics(unsigned char *result, int a2, int a3)
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
        _OWORD *result = a2;
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
      _OWORD *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x22A5BEE8CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22A5BEEB4()
{
  return 0;
}

ValueMetadata *type metadata accessor for AudioAnalytics()
{
  return &type metadata for AudioAnalytics;
}

unint64_t sub_22A5BEED4()
{
  unint64_t result = qword_26837CF50;
  if (!qword_26837CF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837CF50);
  }
  return result;
}

uint64_t sub_22A5BEF28(uint64_t a1)
{
  return sub_22A5BEF50(a1, qword_26AD78CF8);
}

uint64_t sub_22A5BEF3C(uint64_t a1)
{
  return sub_22A5BEF50(a1, qword_26AD78CE0);
}

uint64_t sub_22A5BEF50(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_22A5DA1F0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_22A5DA1E0();
}

uint64_t sub_22A5BEFC4(uint64_t a1)
{
  uint64_t active = type metadata accessor for ActiveReporterState(0);
  uint64_t v3 = MEMORY[0x270FA5388](active);
  uint64_t v80 = (uint64_t)v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  int8x16_t v6 = (void *)((char *)v78 - v5);
  uint64_t v79 = a1;
  sub_22A5C0F3C(a1, (uint64_t)v78 - v5);
  v78[2] = active;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v8 = *v6;
  if (EnumCaseMultiPayload != 1)
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
    sub_22A5B7A80((uint64_t)v6 + *(int *)(v9 + 48), type metadata accessor for StartedReporterData);
  }
  uint64_t v10 = *(void *)(v83 + 16);
  uint64_t v11 = *(void *)(v10 + 16);
  uint64_t v81 = v8;
  if (v11)
  {
    uint64_t v12 = *(void *)(v8 + 16);
    uint64_t v13 = v10 + 32;
    v78[1] = v10;
    swift_bridgeObjectRetain();
    *((void *)&v14 + 1) = 2;
    long long v84 = xmmword_22A5DB310;
    *(void *)&long long v14 = 134283521;
    long long v82 = v14;
    uint64_t v85 = v12;
    do
    {
      sub_22A5C0FA0(v13, (uint64_t)v89);
      uint64_t v16 = *__swift_project_boxed_opaque_existential_1(v89, v90)
          + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters;
      swift_beginAccess();
      if (*(void *)(*(void *)v16 + 16) && (sub_22A5B6F8C(v12), (v17 & 1) != 0))
      {
        int v18 = sub_22A5DA1D0();
        os_log_type_t v19 = sub_22A5DA380();
        if (os_log_type_enabled(v18, v19))
        {
          uint64_t v20 = swift_slowAlloc();
          *(_DWORD *)uint64_t v20 = v82;
          *(void *)(v20 + 4) = v12;
          _os_log_impl(&dword_22A5B3000, v18, v19, "create called for existing reporterID. { reporterID=%{private}lld }", (uint8_t *)v20, 0xCu);
          MEMORY[0x22A6CDBE0](v20, -1, -1);
        }
      }
      else
      {
        uint64_t v86 = v11;
        type metadata accessor for ReporterInfo(0);
        uint64_t v21 = swift_allocObject();
        uint64_t v22 = v21 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
        uint64_t v23 = sub_22A5DA1B0();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
        uint64_t v24 = OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts;
        type metadata accessor for MessageCounts();
        uint64_t v25 = swift_allocObject();
        *(void *)(v25 + 16) = 0;
        *(void *)(v25 + 24) = 0;
        uint64_t v87 = v21;
        *(void *)(v21 + v24) = v25;
        type metadata accessor for ReporterData();
        uint64_t v26 = swift_allocObject();
        *(_WORD *)(v26 + 24) = -1;
        uint64_t v27 = MEMORY[0x263F8EE78];
        *(void *)(v26 + 32) = sub_22A5B7520(MEMORY[0x263F8EE78]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A30);
        uint64_t v28 = swift_allocObject();
        *(_OWORD *)(v28 + 16) = v84;
        *(_DWORD *)(v28 + 32) = getpid();
        type metadata accessor for PerfCheck();
        uint64_t v29 = swift_allocObject();
        *(void *)(v29 + 16) = v27;
        *(void *)(v29 + 24) = v27;
        *(void *)(v29 + 32) = 0;
        *(void *)(v29 + 40) = 0;
        *(_WORD *)(v29 + 50) = -1;
        uint64_t v30 = OBJC_IVAR____TtC14AudioAnalytics9PerfCheck_logger;
        if (qword_26AD78A10 != -1) {
          swift_once();
        }
        uint64_t v31 = v29 + v30;
        uint64_t v32 = sub_22A5DA1F0();
        uint64_t v33 = __swift_project_value_buffer(v32, (uint64_t)qword_26AD78CE0);
        uint64_t v34 = *(void *)(v32 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v31, v33, v32);
        if (qword_26AD78A58 != -1) {
          swift_once();
        }
        if (byte_26AD78CD8 == 1)
        {
          swift_beginAccess();
          *(void *)(v29 + 24) = v28;
          swift_bridgeObjectRelease();
          *(unsigned char *)(v29 + 48) = 1;
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v31, v32);
          swift_deallocPartialClassInstance();
          uint64_t v29 = 0;
        }
        *(void *)(v26 + 40) = v29;
        uint64_t v12 = v85;
        *(void *)(v26 + 16) = v85;
        uint64_t v35 = v87;
        *(void *)(v87 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data) = v26;
        *(_WORD *)(v26 + 24) = -1;
        swift_beginAccess();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v88 = *(void **)v16;
        long long v37 = v88;
        *(void *)uint64_t v16 = 0x8000000000000000;
        unint64_t v39 = sub_22A5B6F8C(v12);
        uint64_t v40 = v37[2];
        BOOL v41 = (v38 & 1) == 0;
        uint64_t v42 = v40 + v41;
        if (__OFADD__(v40, v41))
        {
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          uint64_t result = sub_22A5DA520();
          __break(1u);
          return result;
        }
        char v43 = v38;
        if (v37[3] >= v42)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_22A5D8F7C();
          }
        }
        else
        {
          sub_22A5D7D1C(v42, isUniquelyReferenced_nonNull_native);
          unint64_t v44 = sub_22A5B6F8C(v12);
          if ((v43 & 1) != (v45 & 1)) {
            goto LABEL_55;
          }
          unint64_t v39 = v44;
        }
        uint64_t v11 = v86;
        long long v46 = v88;
        if (v43)
        {
          uint64_t v15 = v88[7];
          swift_release();
          *(void *)(v15 + 8 * v39) = v35;
        }
        else
        {
          v88[(v39 >> 6) + 8] |= 1 << v39;
          uint64_t v47 = 8 * v39;
          *(void *)(v46[6] + v47) = v12;
          *(void *)(v46[7] + v47) = v35;
          uint64_t v48 = v46[2];
          BOOL v49 = __OFADD__(v48, 1);
          uint64_t v50 = v48 + 1;
          if (v49) {
            goto LABEL_54;
          }
          _OWORD v46[2] = v50;
        }
        *(void *)uint64_t v16 = v46;
        swift_bridgeObjectRelease();
        swift_endAccess();
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v89);
      v13 += 40;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    uint64_t v51 = *(void *)(v83 + 16);
    uint64_t v52 = *(void *)(v51 + 16);
    uint64_t v8 = v81;
    if (v52)
    {
      uint64_t v53 = *(void *)(v81 + 16);
      int v54 = *(unsigned __int16 *)(v81 + 24);
      uint64_t v55 = v51 + 32;
      uint64_t v87 = *(void *)(v83 + 16);
      swift_bridgeObjectRetain();
      do
      {
        sub_22A5C0FA0(v55, (uint64_t)v89);
        uint64_t v56 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1(v89, v90)
                        + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
        swift_beginAccess();
        uint64_t v57 = *v56;
        if (*(void *)(v57 + 16) && (unint64_t v58 = sub_22A5B6F8C(v53), (v59 & 1) != 0))
        {
          uint64_t v60 = *(void *)(*(void *)(*(void *)(v57 + 56) + 8 * v58)
                          + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data);
          if (*(unsigned __int16 *)(v60 + 24) != v54)
          {
            sub_22A5B6F8C(v53);
            char v62 = v61;
            swift_retain();
            if (v62) {
              sub_22A5D4F18(v53);
            }
            swift_retain();
            swift_release();
            *(_WORD *)(v60 + 24) = v54;
            swift_release();
          }
        }
        else
        {
          v63 = sub_22A5DA1D0();
          os_log_type_t v64 = sub_22A5DA380();
          if (os_log_type_enabled(v63, v64))
          {
            v65 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v65 = 0;
            _os_log_impl(&dword_22A5B3000, v63, v64, "activeReporters should contain reporter already. { function=setServiceType }", v65, 2u);
            MEMORY[0x22A6CDBE0](v65, -1, -1);
          }
        }
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v89);
        v55 += 40;
        --v52;
      }
      while (v52);
      swift_bridgeObjectRelease();
      uint64_t v8 = v81;
    }
  }
  swift_beginAccess();
  uint64_t v66 = *(void *)(v83 + 16);
  uint64_t v67 = *(void *)(v66 + 16);
  if (v67)
  {
    uint64_t v68 = *(void *)(v8 + 32);
    uint64_t v69 = *(void *)(v8 + 16);
    v70 = (void *)(v66 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    do
    {
      __swift_project_boxed_opaque_existential_1(v70, v70[3]);
      sub_22A5D54D8(v68, v69);
      v70 += 5;
      --v67;
    }
    while (v67);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = v81;
  }
  uint64_t v71 = v80;
  sub_22A5C0F3C(v79, v80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22A5B7A80(v71, type metadata accessor for ActiveReporterState);
    return swift_release();
  }
  swift_release();
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
  sub_22A5B7A80(v71 + *(int *)(v72 + 48), type metadata accessor for StartedReporterData);
  uint64_t v73 = *(void *)(v83 + 16);
  uint64_t v74 = *(void *)(v73 + 16);
  if (!v74) {
    return swift_release();
  }
  uint64_t v75 = *(void *)(v8 + 16);
  uint64_t v76 = v73 + 32;
  swift_bridgeObjectRetain();
  do
  {
    sub_22A5C0FA0(v76, (uint64_t)v89);
    __swift_project_boxed_opaque_existential_1(v89, v90);
    sub_22A5D4B2C(v75);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v89);
    v76 += 40;
    --v74;
  }
  while (v74);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22A5BF964(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(result + 16);
  if (!v4) {
    return result;
  }
  uint64_t v5 = result + 32;
  swift_bridgeObjectRetain();
  uint64_t v40 = a1;
  while (1)
  {
    sub_22A5C0FA0(v5, (uint64_t)v44);
    uint64_t v7 = *__swift_project_boxed_opaque_existential_1(v44, v44[3])
       + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters;
    swift_beginAccess();
    if (*(void *)(*(void *)v7 + 16))
    {
      sub_22A5B6F8C(a1);
      if (v8)
      {
        uint64_t v9 = sub_22A5DA1D0();
        os_log_type_t v10 = sub_22A5DA380();
        if (os_log_type_enabled(v9, v10))
        {
          uint64_t v11 = swift_slowAlloc();
          *(_DWORD *)uint64_t v11 = 134283521;
          *(void *)(v11 + 4) = a1;
          _os_log_impl(&dword_22A5B3000, v9, v10, "create called for existing reporterID. { reporterID=%{private}lld }", (uint8_t *)v11, 0xCu);
          MEMORY[0x22A6CDBE0](v11, -1, -1);
        }

        goto LABEL_5;
      }
    }
    uint64_t v41 = v4;
    type metadata accessor for ReporterInfo(0);
    uint64_t v12 = swift_allocObject();
    uint64_t v13 = v12 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
    uint64_t v14 = sub_22A5DA1B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
    uint64_t v15 = OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts;
    type metadata accessor for MessageCounts();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = 0;
    *(void *)(v16 + 24) = 0;
    uint64_t v42 = v12;
    *(void *)(v12 + v15) = v16;
    type metadata accessor for ReporterData();
    uint64_t v17 = swift_allocObject();
    *(_WORD *)(v17 + 24) = -1;
    uint64_t v18 = MEMORY[0x263F8EE78];
    *(void *)(v17 + 32) = sub_22A5B7520(MEMORY[0x263F8EE78]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A30);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_22A5DB310;
    *(_DWORD *)(v19 + 32) = getpid();
    type metadata accessor for PerfCheck();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v18;
    *(void *)(v20 + 24) = v18;
    *(void *)(v20 + 32) = 0;
    *(void *)(v20 + 40) = 0;
    *(_WORD *)(v20 + 50) = -1;
    uint64_t v21 = OBJC_IVAR____TtC14AudioAnalytics9PerfCheck_logger;
    if (qword_26AD78A10 != -1) {
      swift_once();
    }
    uint64_t v22 = v20 + v21;
    uint64_t v23 = sub_22A5DA1F0();
    uint64_t v24 = __swift_project_value_buffer(v23, (uint64_t)qword_26AD78CE0);
    uint64_t v25 = *(void *)(v23 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v22, v24, v23);
    if (qword_26AD78A58 != -1) {
      swift_once();
    }
    if (byte_26AD78CD8 == 1)
    {
      swift_beginAccess();
      *(void *)(v20 + 24) = v19;
      swift_bridgeObjectRelease();
      *(unsigned char *)(v20 + 48) = 1;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v22, v23);
      swift_deallocPartialClassInstance();
      uint64_t v20 = 0;
    }
    *(void *)(v17 + 40) = v20;
    a1 = v40;
    *(void *)(v17 + 16) = v40;
    *(void *)(v42 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data) = v17;
    *(_WORD *)(v17 + 24) = -1;
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = *(void *)v7;
    char v43 = *(void **)v7;
    *(void *)uint64_t v7 = 0x8000000000000000;
    unint64_t v29 = sub_22A5B6F8C(v40);
    uint64_t v30 = *(void *)(v27 + 16);
    BOOL v31 = (v28 & 1) == 0;
    uint64_t v32 = v30 + v31;
    if (__OFADD__(v30, v31)) {
      break;
    }
    char v33 = v28;
    if (*(void *)(v27 + 24) >= v32)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_22A5D8F7C();
      }
    }
    else
    {
      sub_22A5D7D1C(v32, isUniquelyReferenced_nonNull_native);
      unint64_t v34 = sub_22A5B6F8C(v40);
      if ((v33 & 1) != (v35 & 1)) {
        goto LABEL_31;
      }
      unint64_t v29 = v34;
    }
    uint64_t v4 = v41;
    if (v33)
    {
      uint64_t v6 = v43[7];
      swift_release();
      *(void *)(v6 + 8 * v29) = v42;
    }
    else
    {
      v43[(v29 >> 6) + 8] |= 1 << v29;
      uint64_t v36 = 8 * v29;
      *(void *)(v43[6] + v36) = v40;
      *(void *)(v43[7] + v36) = v42;
      uint64_t v37 = v43[2];
      BOOL v38 = __OFADD__(v37, 1);
      uint64_t v39 = v37 + 1;
      if (v38) {
        goto LABEL_30;
      }
      v43[2] = v39;
    }
    *(void *)uint64_t v7 = v43;
    swift_bridgeObjectRelease();
    swift_endAccess();
LABEL_5:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
    v5 += 40;
    if (!--v4) {
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  uint64_t result = sub_22A5DA520();
  __break(1u);
  return result;
}

uint64_t sub_22A5BFEDC(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    int v6 = (unsigned __int16)result;
    uint64_t v7 = v3 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_22A5C0FA0(v7, (uint64_t)v18);
      char v8 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1(v18, v18[3])
                     + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
      swift_beginAccess();
      uint64_t v9 = *v8;
      if (*(void *)(v9 + 16) && (unint64_t v10 = sub_22A5B6F8C(a2), (v11 & 1) != 0))
      {
        uint64_t v12 = *(void *)(*(void *)(*(void *)(v9 + 56) + 8 * v10)
                        + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data);
        if (*(unsigned __int16 *)(v12 + 24) != v6)
        {
          sub_22A5B6F8C(a2);
          char v14 = v13;
          swift_retain();
          if (v14) {
            sub_22A5D4F18(a2);
          }
          swift_retain();
          swift_release();
          *(_WORD *)(v12 + 24) = v6;
          swift_release();
        }
      }
      else
      {
        uint64_t v15 = sub_22A5DA1D0();
        os_log_type_t v16 = sub_22A5DA380();
        if (os_log_type_enabled(v15, v16))
        {
          uint64_t v17 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v17 = 0;
          _os_log_impl(&dword_22A5B3000, v15, v16, "activeReporters should contain reporter already. { function=setServiceType }", v17, 2u);
          MEMORY[0x22A6CDBE0](v17, -1, -1);
        }
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      v7 += 40;
      --v4;
    }
    while (v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_22A5C00A0()
{
  uint64_t v1 = sub_22A5BEB60();
  uint64_t v2 = v0;
  if (!*(void *)&aAudiomxd[8])
  {
    if (!v0) {
      goto LABEL_33;
    }
    goto LABEL_10;
  }
  if (v0)
  {
    BOOL v3 = *(void *)aAudiomxd == v1 && *(void *)&aAudiomxd[8] == v0;
    if (v3 || (sub_22A5DA510() & 1) != 0) {
      goto LABEL_29;
    }
LABEL_10:
    if (*(void *)&aCoreaudiod[8])
    {
      BOOL v4 = *(void *)aCoreaudiod == v1 && *(void *)&aCoreaudiod[8] == v2;
      if (v4 || (sub_22A5DA510() & 1) != 0) {
        goto LABEL_29;
      }
    }
    goto LABEL_18;
  }
  if (!*(void *)&aCoreaudiod[8]) {
    goto LABEL_33;
  }
LABEL_18:
  if (!*(void *)&aMediaserverd[8])
  {
    if (v2) {
      goto LABEL_25;
    }
LABEL_33:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF58);
    swift_arrayDestroy();
    goto LABEL_34;
  }
  if (!v2)
  {
    if (qword_26DE29E10)
    {
LABEL_31:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF58);
      swift_arrayDestroy();
      swift_bridgeObjectRelease();
      return (void *)MEMORY[0x263F8EE78];
    }
    goto LABEL_33;
  }
  if (*(void *)aMediaserverd == v1 && *(void *)&aMediaserverd[8] == v2 || (sub_22A5DA510() & 1) != 0) {
    goto LABEL_29;
  }
LABEL_25:
  if (!qword_26DE29E10 || (*(void *)aXctest != v1 || qword_26DE29E10 != v2) && (sub_22A5DA510() & 1) == 0) {
    goto LABEL_31;
  }
LABEL_29:
  swift_bridgeObjectRelease();
LABEL_34:
  uint64_t v6 = type metadata accessor for SessionGenericSummaryCache(0);
  swift_allocObject();
  v18[3] = v6;
  v18[4] = &off_26DE29E98;
  v18[0] = sub_22A5D6340();
  uint64_t v5 = sub_22A5C1158(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v8 = v5[2];
  unint64_t v7 = v5[3];
  if (v8 >= v7 >> 1) {
    uint64_t v5 = sub_22A5C1158((void *)(v7 > 1), v8 + 1, 1, v5);
  }
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v6);
  MEMORY[0x270FA5388](v9);
  char v11 = (uint64_t *)((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  uint64_t v13 = *v11;
  uint64_t v16 = v6;
  uint64_t v17 = &off_26DE29E98;
  *(void *)&long long v15 = v13;
  v5[2] = v8 + 1;
  sub_22A5C1A7C(&v15, (uint64_t)&v5[5 * v8 + 4]);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  return v5;
}

uint64_t sub_22A5C03B0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for MessageCache()
{
  return self;
}

uint64_t sub_22A5C0690(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_retain();
  sub_22A5C0BBC(a3, a4);
  return swift_release();
}

uint64_t *sub_22A5C06E8(uint64_t a1, int a2, __int16 a3, uint64_t a4)
{
  uint64_t v39 = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF70);
  uint64_t result = (uint64_t *)MEMORY[0x270FA5388](v8 - 8);
  uint64_t v38 = (uint64_t)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v4 + 16);
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    uint64_t v13 = (void *)(v11 + 32);
    BOOL v15 = a2 == 7 && a3 == 6;
    swift_bridgeObjectRetain();
    *(void *)&long long v16 = 134217984;
    long long v37 = v16;
    while (1)
    {
      uint64_t result = __swift_project_boxed_opaque_existential_1(v13, v13[3]);
      uint64_t v17 = *result;
      int v18 = *(_DWORD *)(*result + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesReceived);
      BOOL v19 = __CFADD__(v18, 1);
      int v20 = v18 + 1;
      if (v19)
      {
        __break(1u);
        return result;
      }
      *(_DWORD *)(v17 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesReceived) = v20;
      if (v15)
      {
        if (*(void *)(a1 + 16))
        {
          unint64_t v21 = sub_22A5B6AA4(0x79745F6575737369, 0xEA00000000006570);
          if (v22)
          {
            sub_22A5B5624(*(void *)(a1 + 56) + 32 * v21, (uint64_t)v42);
            if (swift_dynamicCast())
            {
              if (v40 == 0x64616F6C7265766FLL && v41 == 0xE800000000000000)
              {
                swift_bridgeObjectRelease();
              }
              else
              {
                char v23 = sub_22A5DA510();
                swift_bridgeObjectRelease();
                if ((v23 & 1) == 0) {
                  goto LABEL_10;
                }
              }
              if (qword_26AD78A38 != -1) {
                swift_once();
              }
              if (qword_26AD78CB0 == v39)
              {
                swift_retain();
              }
              else
              {
                uint64_t v24 = (uint64_t *)(v17 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
                swift_beginAccess();
                uint64_t v25 = *v24;
                if (!*(void *)(v25 + 16)
                  || (unint64_t v26 = sub_22A5B6F8C(v39), (v27 & 1) == 0)
                  || (uint64_t v28 = *(void *)(*(void *)(v25 + 56) + 8 * v26), swift_retain(), !v28))
                {
                  uint64_t v33 = sub_22A5DA1B0();
                  uint64_t v31 = v38;
                  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v38, 1, 1, v33);
                  goto LABEL_31;
                }
                uint64_t v29 = v28 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
                swift_beginAccess();
                uint64_t v30 = v29;
                uint64_t v31 = v38;
                sub_22A5C1CF0(v30, v38);
                uint64_t v32 = sub_22A5DA1B0();
                if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 48))(v31, 1, v32) == 1)
                {
                  swift_release();
LABEL_31:
                  sub_22A5C1C90(v31);
                  unint64_t v34 = sub_22A5DA1D0();
                  os_log_type_t v35 = sub_22A5DA360();
                  if (os_log_type_enabled(v34, v35))
                  {
                    uint64_t v36 = swift_slowAlloc();
                    *(_DWORD *)uint64_t v36 = v37;
                    *(void *)(v36 + 4) = v39;
                    _os_log_impl(&dword_22A5B3000, v34, v35, "Received message on non-active session. { function=send, reporterID=%lld }", (uint8_t *)v36, 0xCu);
                    MEMORY[0x22A6CDBE0](v36, -1, -1);
                  }

                  goto LABEL_10;
                }
                sub_22A5C1C90(v31);
              }
              swift_retain();
              sub_22A5D6BF4(a1);
              swift_release();
              swift_release();
            }
          }
        }
      }
LABEL_10:
      v13 += 5;
      if (!--v12) {
        return (uint64_t *)swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_22A5C0BBC(uint64_t result, void (*a2)(uint64_t))
{
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v6 = result;
    uint64_t v7 = v3 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_22A5C0FA0(v7, (uint64_t)v8);
      __swift_project_boxed_opaque_existential_1(v8, v8[3]);
      a2(v6);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
      v7 += 40;
      --v4;
    }
    while (v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22A5C0C6C(uint64_t result)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = result;
    uint64_t v5 = v2 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_22A5C0FA0(v5, (uint64_t)v14);
      uint64_t v6 = *__swift_project_boxed_opaque_existential_1(v14, v14[3]);
      sub_22A5D4F18(v4);
      uint64_t v7 = (uint64_t *)(v6 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
      swift_beginAccess();
      unint64_t v8 = sub_22A5B6F8C(v4);
      if (v9)
      {
        unint64_t v10 = v8;
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v12 = *v7;
        uint64_t v13 = *v7;
        *uint64_t v7 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_22A5D8F7C();
          uint64_t v12 = v13;
        }
        sub_22A5C14EC(v10, v12);
        *uint64_t v7 = v12;
        swift_release();
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
      v5 += 40;
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22A5C0DC0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_retain();
  a4(a3);
  return swift_release();
}

uint64_t sub_22A5C0F3C(uint64_t a1, uint64_t a2)
{
  uint64_t active = type metadata accessor for ActiveReporterState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(active - 8) + 16))(a2, a1, active);
  return a2;
}

uint64_t sub_22A5C0FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

char *sub_22A5C1048(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A30);
      unint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_22A5C1BA4(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_22A5C1158(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF60);
      unint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
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
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_22A5C1A94(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_22A5C127C(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD787E0);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26AD78840) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_22A5DA4B0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26AD78840) - 8);
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
    sub_22A5C1D58(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_22A5C14EC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_22A5DA450();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_22A5DA540();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            size_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *size_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            uint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *uint64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  uint64_t *v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_22A5C1684(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_22A5DA450();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_22A5DA550();
        swift_bridgeObjectRetain();
        sub_22A5DA2D0();
        uint64_t v10 = sub_22A5DA580();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          size_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          uint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *uint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  uint64_t *v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_22A5C185C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_22A5DA450();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_22A5DA540();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11) {
            goto LABEL_6;
          }
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        size_t v14 = (void *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1) {
          *size_t v14 = *v10;
        }
        uint64_t v15 = *(void *)(a2 + 56);
        uint64_t v16 = *(void *)(*(void *)(type metadata accessor for ReporterState(0) - 8) + 72);
        int64_t v17 = v16 * v3;
        uint64_t result = v15 + v16 * v3;
        int64_t v18 = v16 * v6;
        unint64_t v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v17 == v18) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << result) - 1;
  }
  *uint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_22A5C1A7C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_22A5C1A94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF68);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_22A5DA500();
  __break(1u);
  return result;
}

char *sub_22A5C1BA4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_22A5DA500();
  __break(1u);
  return result;
}

uint64_t sub_22A5C1C90(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22A5C1CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A5C1D58(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(qword_26AD78840) - 8);
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
  uint64_t result = sub_22A5DA500();
  __break(1u);
  return result;
}

void sub_22A5C1EB4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22A5DA1F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  size_t v6 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v69 - v7;
  if (*(unsigned __int8 *)(v1 + 48) - 1 >= 2)
  {
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v23 = __swift_project_value_buffer(v2, (uint64_t)qword_26AD78CF8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v23, v2);
    uint64_t v76 = v3;
    uint64_t v77 = v2;
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = 0xD00000000000005ALL;
    *(void *)(v24 + 24) = 0x800000022A5DD070;
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = 0x29287472617473;
    *(void *)(v25 + 24) = 0xE700000000000000;
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = 31;
    char v27 = sub_22A5DA1D0();
    LODWORD(v78) = sub_22A5DA380();
    uint64_t v74 = swift_allocObject();
    *(unsigned char *)(v74 + 16) = 32;
    uint64_t v28 = swift_allocObject();
    uint64_t v75 = v8;
    uint64_t v73 = v28;
    *(unsigned char *)(v28 + 16) = 8;
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = sub_22A5C7268;
    *(void *)(v29 + 24) = v24;
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = sub_22A5C7264;
    *(void *)(v30 + 24) = v29;
    uint64_t v31 = swift_allocObject();
    *(unsigned char *)(v31 + 16) = 32;
    uint64_t v32 = swift_allocObject();
    *(unsigned char *)(v32 + 16) = 8;
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = sub_22A5C726C;
    *(void *)(v33 + 24) = v25;
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = sub_22A5C7264;
    *(void *)(v34 + 24) = v33;
    uint64_t v35 = swift_allocObject();
    *(unsigned char *)(v35 + 16) = 0;
    uint64_t v36 = swift_allocObject();
    *(unsigned char *)(v36 + 16) = 8;
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = sub_22A5C7358;
    *(void *)(v37 + 24) = v26;
    uint64_t v38 = swift_allocObject();
    *(void *)(v38 + 16) = sub_22A5C7360;
    *(void *)(v38 + 24) = v37;
    if (os_log_type_enabled(v27, (os_log_type_t)v78))
    {
      uint64_t v39 = v30;
      uint64_t v40 = v73;
      os_log_t v72 = v27;
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      uint64_t v81 = v42;
      uint64_t v82 = 0;
      v70 = v41;
      *(_WORD *)uint64_t v41 = 770;
      uint64_t v71 = v42;
      v83[0] = (uint64_t)(v41 + 2);
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v74;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v40;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7270;
      uint64_t v80 = v39;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v31;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v32;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7270;
      uint64_t v80 = v34;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v35;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v36;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7274;
      uint64_t v80 = v38;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      os_log_t v43 = v72;
      unint64_t v44 = v70;
      _os_log_impl(&dword_22A5B3000, v72, (os_log_type_t)v78, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v70, 0x20u);
      char v45 = v71;
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v45, -1, -1);
      MEMORY[0x22A6CDBE0](v44, -1, -1);
    }
    else
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
    }
    (*(void (**)(char *, uint64_t))(v76 + 8))(v75, v77);
  }
  else
  {
    unint64_t v9 = *(void *)(v1 + 16);
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_22A5DA4C0();
      swift_bridgeObjectRelease();
      if (!v46) {
        goto LABEL_4;
      }
    }
    else if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD787E8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_22A5DB370;
      *(void *)(inited + 32) = 0x705F746E65636572;
      *(void *)(inited + 40) = 0xEB000000006B6165;
      strcpy((char *)(inited + 48), "kaeptncrpeak_delta");
      *(unsigned char *)(inited + 67) = 0;
      *(_DWORD *)(inited + 68) = -369098752;
      *(void *)(inited + 72) = *(void *)"atldkaep__C";
      swift_beginAccess();
      uint64_t v11 = swift_bridgeObjectRetain();
      uint64_t v12 = sub_22A5C6CD0(v11, inited);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD787F8);
      swift_arrayDestroy();
      *(void *)(v1 + 16) = v12;
      swift_bridgeObjectRelease();
      swift_retain_n();
      uint64_t v13 = sub_22A5DA1D0();
      os_log_type_t v14 = sub_22A5DA360();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = swift_slowAlloc();
        uint64_t v16 = swift_slowAlloc();
        v83[0] = v16;
        *(_DWORD *)uint64_t v15 = 136315394;
        uint64_t v17 = swift_bridgeObjectRetain();
        uint64_t v18 = MEMORY[0x22A6CD2F0](v17, MEMORY[0x263F8E548]);
        unint64_t v20 = v19;
        swift_bridgeObjectRelease();
        uint64_t v82 = sub_22A5D72AC(v18, v20, v83);
        sub_22A5DA400();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v15 + 12) = 2048;
        unint64_t v21 = *(void *)(v1 + 16);
        if (v21 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v22 = sub_22A5DA4C0();
          swift_release();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_release();
        }
        uint64_t v82 = v22;
        sub_22A5DA400();
        swift_release();
        _os_log_impl(&dword_22A5B3000, v13, v14, "Begin measuring performance metrics. { pids=%s, pcSessions=%ld }", (uint8_t *)v15, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22A6CDBE0](v16, -1, -1);
        MEMORY[0x22A6CDBE0](v15, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      *(unsigned char *)(v1 + 48) = 0;
      return;
    }
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v47 = __swift_project_value_buffer(v2, (uint64_t)qword_26AD78CF8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v47, v2);
    uint64_t v76 = v3;
    uint64_t v77 = v2;
    uint64_t v48 = swift_allocObject();
    *(void *)(v48 + 16) = 0xD00000000000005ALL;
    *(void *)(v48 + 24) = 0x800000022A5DD070;
    uint64_t v49 = swift_allocObject();
    *(void *)(v49 + 16) = 0x29287472617473;
    *(void *)(v49 + 24) = 0xE700000000000000;
    uint64_t v50 = swift_allocObject();
    *(void *)(v50 + 16) = 32;
    os_log_t v78 = (os_log_t)sub_22A5DA1D0();
    LODWORD(v75) = sub_22A5DA380();
    uint64_t v74 = swift_allocObject();
    *(unsigned char *)(v74 + 16) = 32;
    uint64_t v73 = swift_allocObject();
    *(unsigned char *)(v73 + 16) = 8;
    uint64_t v51 = swift_allocObject();
    *(void *)(v51 + 16) = sub_22A5C7268;
    *(void *)(v51 + 24) = v48;
    uint64_t v52 = swift_allocObject();
    *(void *)(v52 + 16) = sub_22A5C7264;
    *(void *)(v52 + 24) = v51;
    uint64_t v53 = swift_allocObject();
    *(unsigned char *)(v53 + 16) = 32;
    uint64_t v54 = swift_allocObject();
    *(unsigned char *)(v54 + 16) = 8;
    uint64_t v55 = swift_allocObject();
    *(void *)(v55 + 16) = sub_22A5C726C;
    *(void *)(v55 + 24) = v49;
    uint64_t v56 = swift_allocObject();
    *(void *)(v56 + 16) = sub_22A5C7264;
    *(void *)(v56 + 24) = v55;
    uint64_t v57 = swift_allocObject();
    *(unsigned char *)(v57 + 16) = 0;
    uint64_t v58 = swift_allocObject();
    *(unsigned char *)(v58 + 16) = 8;
    uint64_t v59 = swift_allocObject();
    *(void *)(v59 + 16) = sub_22A5C7358;
    *(void *)(v59 + 24) = v50;
    os_log_t v60 = v78;
    uint64_t v61 = swift_allocObject();
    *(void *)(v61 + 16) = sub_22A5C7360;
    *(void *)(v61 + 24) = v59;
    if (os_log_type_enabled(v60, (os_log_type_t)v75))
    {
      uint64_t v62 = v52;
      uint64_t v63 = v73;
      os_log_type_t v64 = (uint8_t *)swift_slowAlloc();
      v65 = swift_slowAlloc();
      uint64_t v81 = v65;
      uint64_t v82 = 0;
      uint64_t v71 = v64;
      *(_WORD *)os_log_type_t v64 = 770;
      os_log_t v72 = v65;
      v83[0] = (uint64_t)(v64 + 2);
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v74;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v63;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7270;
      uint64_t v80 = v62;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v53;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v54;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7270;
      uint64_t v80 = v56;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v57;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7278;
      uint64_t v80 = v58;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      uint64_t v79 = sub_22A5C7274;
      uint64_t v80 = v61;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v79, (uint64_t)v83, (uint64_t)&v82, (uint64_t)&v81);
      swift_release();
      os_log_t v66 = v78;
      uint64_t v67 = v71;
      _os_log_impl(&dword_22A5B3000, v78, (os_log_type_t)v75, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v71, 0x20u);
      os_log_t v68 = v72;
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v68, -1, -1);
      MEMORY[0x22A6CDBE0](v67, -1, -1);
    }
    else
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
    }
    (*(void (**)(char *, uint64_t))(v76 + 8))(v6, v77);
  }
}

unint64_t sub_22A5C2EA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22A5DA1F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1 + 48))
  {
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v2, (uint64_t)qword_26AD78CF8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v17, v2);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = 0xD00000000000005ALL;
    *(void *)(v18 + 24) = 0x800000022A5DD070;
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = 0xD000000000000022;
    *(void *)(v19 + 24) = 0x800000022A5DD040;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = 52;
    os_log_t v48 = (os_log_t)sub_22A5DA1D0();
    int v43 = sub_22A5DA380();
    uint64_t v45 = swift_allocObject();
    *(unsigned char *)(v45 + 16) = 32;
    uint64_t v44 = swift_allocObject();
    *(unsigned char *)(v44 + 16) = 8;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = sub_22A5C6C20;
    *(void *)(v21 + 24) = v18;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_22A5C6C70;
    *(void *)(v22 + 24) = v21;
    uint64_t v47 = swift_allocObject();
    *(unsigned char *)(v47 + 16) = 32;
    uint64_t v46 = swift_allocObject();
    *(unsigned char *)(v46 + 16) = 8;
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = sub_22A5C6C28;
    *(void *)(v23 + 24) = v19;
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = sub_22A5C7264;
    *(void *)(v24 + 24) = v23;
    uint64_t v25 = swift_allocObject();
    *(unsigned char *)(v25 + 16) = 0;
    uint64_t v26 = swift_allocObject();
    *(unsigned char *)(v26 + 16) = 8;
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = sub_22A5C6C40;
    *(void *)(v27 + 24) = v20;
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_22A5C6CC0;
    *(void *)(v28 + 24) = v27;
    os_log_type_t v29 = v43;
    if (os_log_type_enabled(v48, (os_log_type_t)v43))
    {
      uint64_t v30 = v44;
      uint64_t v39 = v26;
      uint64_t v40 = v28;
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v52 = 0;
      uint64_t v41 = v51;
      uint64_t v42 = v31;
      *(_WORD *)uint64_t v31 = 770;
      uint64_t v53 = v31 + 2;
      uint64_t v49 = (uint64_t (*)())sub_22A5C6C58;
      uint64_t v50 = v45;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v49, (uint64_t)&v53, (uint64_t)&v52, (uint64_t)&v51);
      swift_release();
      uint64_t v49 = sub_22A5C7278;
      uint64_t v50 = v30;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v49, (uint64_t)&v53, (uint64_t)&v52, (uint64_t)&v51);
      swift_release();
      uint64_t v49 = (uint64_t (*)())sub_22A5C6C78;
      uint64_t v50 = v22;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v49, (uint64_t)&v53, (uint64_t)&v52, (uint64_t)&v51);
      swift_release();
      uint64_t v49 = sub_22A5C7278;
      uint64_t v50 = v47;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v49, (uint64_t)&v53, (uint64_t)&v52, (uint64_t)&v51);
      swift_release();
      uint64_t v49 = sub_22A5C7278;
      uint64_t v50 = v46;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v49, (uint64_t)&v53, (uint64_t)&v52, (uint64_t)&v51);
      swift_release();
      uint64_t v49 = sub_22A5C7270;
      uint64_t v50 = v24;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v49, (uint64_t)&v53, (uint64_t)&v52, (uint64_t)&v51);
      swift_release();
      uint64_t v49 = sub_22A5C7278;
      uint64_t v50 = v25;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v49, (uint64_t)&v53, (uint64_t)&v52, (uint64_t)&v51);
      swift_release();
      uint64_t v49 = sub_22A5C7278;
      uint64_t v50 = v39;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v49, (uint64_t)&v53, (uint64_t)&v52, (uint64_t)&v51);
      swift_release();
      uint64_t v49 = (uint64_t (*)())sub_22A5C6CC8;
      uint64_t v50 = v40;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v49, (uint64_t)&v53, (uint64_t)&v52, (uint64_t)&v51);
      swift_release();
      os_log_t v32 = v48;
      uint64_t v33 = v42;
      _os_log_impl(&dword_22A5B3000, v48, v29, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v42, 0x20u);
      uint64_t v34 = v41;
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v34, -1, -1);
      MEMORY[0x22A6CDBE0](v33, -1, -1);

LABEL_27:
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return sub_22A5B7520(MEMORY[0x263F8EE78]);
    }
LABEL_26:

    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    goto LABEL_27;
  }
  uint64_t v5 = (char *)(v1 + OBJC_IVAR____TtC14AudioAnalytics9PerfCheck_logger);
  swift_retain_n();
  size_t v6 = sub_22A5DA1D0();
  os_log_type_t v7 = sub_22A5DA360();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v5 = (char *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v53 = (uint8_t *)v8;
    *(_DWORD *)uint64_t v5 = 136315394;
    swift_beginAccess();
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = MEMORY[0x22A6CD2F0](v9, MEMORY[0x263F8E548]);
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    uint64_t v52 = sub_22A5D72AC(v10, v12, (uint64_t *)&v53);
    sub_22A5DA400();
    swift_release_n();
    swift_bridgeObjectRelease();
    *((_WORD *)v5 + 6) = 2048;
    unint64_t v13 = *(void *)(v1 + 16);
    if (v13 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_22A5DA4C0();
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_release();
    }
    uint64_t v52 = v14;
    sub_22A5DA400();
    swift_release();
    _os_log_impl(&dword_22A5B3000, v6, v7, "Collecting performance metrics. { pids=%s, pcSessions=%ld }", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A6CDBE0](v8, -1, -1);
    MEMORY[0x22A6CDBE0](v5, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v2 = *(void *)(v1 + 16);
  if ((unint64_t)v2 >> 62)
  {
    if (v2 < 0) {
      uint64_t v5 = *(char **)(v1 + 16);
    }
    else {
      uint64_t v5 = (char *)(v2 & 0xFFFFFFFFFFFFFF8);
    }
    swift_bridgeObjectRetain_n();
    uint64_t v15 = sub_22A5DA4C0();
    if (v15) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v15)
    {
LABEL_9:
      if (v15 >= 1)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if ((v2 & 0xC000000000000001) != 0) {
            MEMORY[0x22A6CD460](i, v2);
          }
          else {
            swift_retain();
          }
          sub_22A5C5544();
          swift_release();
        }
        goto LABEL_23;
      }
      __break(1u);
      goto LABEL_26;
    }
  }
LABEL_23:
  swift_bridgeObjectRelease_n();
  unint64_t v35 = *(void *)(v1 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_22A5C6E00(MEMORY[0x263F8EE80], v35, v1);
  swift_bridgeObjectRelease();
  swift_release();
  *(void *)(v1 + 16) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  *(unsigned char *)(v1 + 48) = 1;
  return v36;
}

uint64_t sub_22A5C3830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0x6E776F6E6B6E75;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78950);
  uint64_t inited = swift_initStackObject();
  os_log_type_t v7 = (void *)inited;
  *(_OWORD *)(inited + 16) = xmmword_22A5DB370;
  *(void *)(inited + 32) = 0xD000000000000018;
  *(void *)(inited + 40) = 0x800000022A5DD020;
  uint64_t v8 = *(void *)(a3 + 32);
  uint64_t v9 = *(void *)(a3 + 40);
  uint64_t v10 = MEMORY[0x263F8D310];
  if (!v9) {
    uint64_t v8 = 0x6E776F6E6B6E75;
  }
  unint64_t v11 = 0xE700000000000000;
  if (v9) {
    unint64_t v11 = *(void *)(a3 + 40);
  }
  *(void *)(inited + 48) = v8;
  *(void *)(inited + 56) = v11;
  *(void *)(inited + 72) = v10;
  *(void *)(inited + 80) = 0x5465636976726573;
  *(void *)(inited + 88) = 0xEB00000000657079;
  unint64_t v12 = AudioServiceType.description.getter(*(_WORD *)(a3 + 50));
  v7[15] = v10;
  v7[12] = v12;
  v7[13] = v13;
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_22A5B7520((uint64_t)v7);
  sub_22A5C5D8C();
  unint64_t v16 = sub_22A5B9638(v15);
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v22[0] = v14;
  sub_22A5B4FA8(v16, (uint64_t)sub_22A5B55D0, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v22);
  if (v3)
  {
    uint64_t result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    uint64_t v18 = v22[0];
    swift_bridgeObjectRelease();
    if (pc_session_get_procname())
    {
      uint64_t v5 = sub_22A5DA2F0();
      uint64_t v20 = v19;
    }
    else
    {
      uint64_t v20 = 0xE700000000000000;
    }
    _OWORD v22[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD787F0);
    v22[0] = v18;
    return sub_22A5C96AC((uint64_t)v22, v5, v20);
  }
  return result;
}

uint64_t sub_22A5C39F0()
{
  uint64_t v1 = sub_22A5DA1F0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned __int8 *)(v0 + 48) >= 2u)
  {
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v6 = __swift_project_value_buffer(v1, (uint64_t)qword_26AD78CF8);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v6, v1);
    uint64_t v35 = v2;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = 0xD00000000000005ALL;
    *(void *)(v7 + 24) = 0x800000022A5DD070;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = 0x286E6F646E616261;
    *(void *)(v8 + 24) = 0xE900000000000029;
    uint64_t v9 = swift_allocObject();
    uint64_t v37 = v1;
    uint64_t v10 = v9;
    *(void *)(v9 + 16) = 75;
    unint64_t v11 = sub_22A5DA1D0();
    int v38 = sub_22A5DA380();
    uint64_t v34 = swift_allocObject();
    *(unsigned char *)(v34 + 16) = 32;
    uint64_t v12 = swift_allocObject();
    uint64_t v36 = v4;
    uint64_t v33 = v12;
    *(unsigned char *)(v12 + 16) = 8;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_22A5C7268;
    *(void *)(v13 + 24) = v7;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_22A5C7264;
    *(void *)(v14 + 24) = v13;
    uint64_t v15 = swift_allocObject();
    *(unsigned char *)(v15 + 16) = 32;
    uint64_t v16 = swift_allocObject();
    *(unsigned char *)(v16 + 16) = 8;
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = sub_22A5C726C;
    *(void *)(v17 + 24) = v8;
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = sub_22A5C7264;
    *(void *)(v18 + 24) = v17;
    uint64_t v19 = swift_allocObject();
    *(unsigned char *)(v19 + 16) = 0;
    uint64_t v20 = swift_allocObject();
    *(unsigned char *)(v20 + 16) = 8;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = sub_22A5C7358;
    *(void *)(v21 + 24) = v10;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_22A5C7360;
    *(void *)(v22 + 24) = v21;
    if (os_log_type_enabled(v11, (os_log_type_t)v38))
    {
      uint64_t v23 = v14;
      uint64_t v24 = v33;
      os_log_t v32 = v11;
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v42 = 0;
      uint64_t v30 = v25;
      uint64_t v31 = v41;
      *(_WORD *)uint64_t v25 = 770;
      int v43 = v25 + 2;
      uint64_t v39 = sub_22A5C7278;
      uint64_t v40 = v34;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v39, (uint64_t)&v43, (uint64_t)&v42, (uint64_t)&v41);
      swift_release();
      uint64_t v39 = sub_22A5C7278;
      uint64_t v40 = v24;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v39, (uint64_t)&v43, (uint64_t)&v42, (uint64_t)&v41);
      swift_release();
      uint64_t v39 = sub_22A5C7270;
      uint64_t v40 = v23;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v39, (uint64_t)&v43, (uint64_t)&v42, (uint64_t)&v41);
      swift_release();
      uint64_t v39 = sub_22A5C7278;
      uint64_t v40 = v15;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v39, (uint64_t)&v43, (uint64_t)&v42, (uint64_t)&v41);
      swift_release();
      uint64_t v39 = sub_22A5C7278;
      uint64_t v40 = v16;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v39, (uint64_t)&v43, (uint64_t)&v42, (uint64_t)&v41);
      swift_release();
      uint64_t v39 = sub_22A5C7270;
      uint64_t v40 = v18;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v39, (uint64_t)&v43, (uint64_t)&v42, (uint64_t)&v41);
      swift_release();
      uint64_t v39 = sub_22A5C7278;
      uint64_t v40 = v19;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v39, (uint64_t)&v43, (uint64_t)&v42, (uint64_t)&v41);
      swift_release();
      uint64_t v39 = sub_22A5C7278;
      uint64_t v40 = v20;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v39, (uint64_t)&v43, (uint64_t)&v42, (uint64_t)&v41);
      swift_release();
      uint64_t v39 = sub_22A5C7274;
      uint64_t v40 = v22;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v39, (uint64_t)&v43, (uint64_t)&v42, (uint64_t)&v41);
      swift_release();
      os_log_t v26 = v32;
      uint64_t v27 = v30;
      _os_log_impl(&dword_22A5B3000, v32, (os_log_type_t)v38, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v30, 0x20u);
      uint64_t v28 = v31;
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v28, -1, -1);
      MEMORY[0x22A6CDBE0](v27, -1, -1);
    }
    else
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
    }
    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v36, v37);
  }
  else
  {
    *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
    uint64_t result = swift_bridgeObjectRelease();
    *(unsigned char *)(v0 + 48) = 2;
  }
  return result;
}

uint64_t sub_22A5C40C0(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
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
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_22A5C1048(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v10 = &v3[4 * v9 + 32];
  if (a1 + 32 < (unint64_t)&v10[4 * v8] && (unint64_t)v10 < a1 + 32 + 4 * v8) {
    goto LABEL_24;
  }
  memcpy(v10, (const void *)(a1 + 32), 4 * v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    void *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_22A5DA500();
  __break(1u);
  return result;
}

uint64_t sub_22A5C4214()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC14AudioAnalytics9PerfCheck_logger;
  uint64_t v2 = sub_22A5DA1F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_22A5C42CC()
{
  return type metadata accessor for PerfCheck();
}

uint64_t sub_22A5C42D4()
{
  uint64_t result = sub_22A5DA1F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

char *sub_22A5C4398()
{
  uint64_t v1 = v0;
  v30[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_22A5DA1F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v27 - v7;
  int v29 = sub_22A5DA200();
  sub_22A5DA210();
  sub_22A5DA210();
  uint64_t v9 = pc_session_create();
  if (!v9 || (v10 = v9, int v11 = v29, v11 != sub_22A5DA200()))
  {
    if (qword_26AD78A10 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v2, (uint64_t)qword_26AD78CE0);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v12, v2);
    BOOL v13 = sub_22A5DA1D0();
    os_log_type_t v14 = sub_22A5DA360();
    if (os_log_type_enabled(v13, v14))
    {
      int64_t v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      v30[0] = v16;
      *(_DWORD *)int64_t v15 = 136380675;
      swift_beginAccess();
      uint64_t result = strerror(v29);
      if (!result)
      {
        __break(1u);
        goto LABEL_20;
      }
      uint64_t v18 = sub_22A5DA2F0();
      uint64_t v28 = sub_22A5D72AC(v18, v19, v30);
      sub_22A5DA400();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, v13, v14, "pc_session_create failed. { ret=%{private}s }.", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v16, -1, -1);
      MEMORY[0x22A6CDBE0](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
LABEL_11:
    type metadata accessor for PCSession();
    swift_deallocPartialClassInstance();
    return 0;
  }
  int v29 = pc_session_set_procpid();
  if (v29 == sub_22A5DA200())
  {
    *(void *)(v1 + 16) = v10;
    *(unsigned char *)(v1 + 24) = 0;
    return (char *)v1;
  }
  if (qword_26AD78A10 != -1) {
    swift_once();
  }
  uint64_t v20 = __swift_project_value_buffer(v2, (uint64_t)qword_26AD78CE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v20, v2);
  uint64_t v21 = sub_22A5DA1D0();
  os_log_type_t v22 = sub_22A5DA360();
  if (!os_log_type_enabled(v21, v22)) {
    goto LABEL_18;
  }
  uint64_t v23 = (uint8_t *)swift_slowAlloc();
  uint64_t v24 = swift_slowAlloc();
  v30[0] = v24;
  *(_DWORD *)uint64_t v23 = 136380675;
  swift_beginAccess();
  uint64_t result = strerror(v29);
  if (result)
  {
    uint64_t v25 = sub_22A5DA2F0();
    uint64_t v28 = sub_22A5D72AC(v25, v26, v30);
    sub_22A5DA400();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22A5B3000, v21, v22, "pc_session_set_procpid failed. { ret=%{private}s }.", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6CDBE0](v24, -1, -1);
    MEMORY[0x22A6CDBE0](v23, -1, -1);
LABEL_18:

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    goto LABEL_11;
  }
LABEL_20:
  __break(1u);
  return result;
}

char *sub_22A5C4834()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22A5DA1F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = pc_session_destroy();
  if (v6 == sub_22A5DA200()) {
    return (char *)v1;
  }
  if (qword_26AD78A10 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v2, (uint64_t)qword_26AD78CE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  unint64_t v8 = sub_22A5DA1D0();
  os_log_type_t v9 = sub_22A5DA360();
  if (!os_log_type_enabled(v8, v9))
  {
LABEL_7:

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (char *)v1;
  }
  uint64_t v10 = (uint8_t *)swift_slowAlloc();
  uint64_t v11 = swift_slowAlloc();
  uint64_t v16 = v11;
  *(_DWORD *)uint64_t v10 = 136380675;
  uint64_t result = strerror(v6);
  if (result)
  {
    uint64_t v13 = sub_22A5DA2F0();
    uint64_t v15 = sub_22A5D72AC(v13, v14, &v16);
    sub_22A5DA400();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22A5B3000, v8, v9, "pc_session_destroy failed, { ret=%{private}s }", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6CDBE0](v11, -1, -1);
    MEMORY[0x22A6CDBE0](v10, -1, -1);
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_22A5C4A80()
{
  uint64_t v0 = sub_22A5C4834();
  return MEMORY[0x270FA0228](v0, 25, 7);
}

uint64_t type metadata accessor for PCSession()
{
  return self;
}

void sub_22A5C4AD4(uint64_t a1)
{
  uint64_t v3 = sub_22A5DA1F0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v63 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v57 - v7;
  if (*(unsigned char *)(v1 + 24))
  {
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v33 = __swift_project_value_buffer(v3, (uint64_t)qword_26AD78CF8);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v8, v33, v3);
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = 0xD00000000000005ALL;
    *(void *)(v34 + 24) = 0x800000022A5DD070;
    uint64_t v35 = swift_allocObject();
    strcpy((char *)(v35 + 16), "begin(with:)");
    *(unsigned char *)(v35 + 29) = 0;
    *(_WORD *)(v35 + 30) = -5120;
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = 161;
    *(void *)&long long v65 = sub_22A5DA1D0();
    int v37 = sub_22A5DA380();
    uint64_t v38 = swift_allocObject();
    uint64_t v66 = v3;
    uint64_t v64 = v38;
    *(unsigned char *)(v38 + 16) = 32;
    uint64_t v39 = swift_allocObject();
    uint64_t v62 = v4;
    uint64_t v63 = (char *)v39;
    *(unsigned char *)(v39 + 16) = 8;
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = sub_22A5C7268;
    *(void *)(v40 + 24) = v34;
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = sub_22A5C7264;
    *(void *)(v41 + 24) = v40;
    uint64_t v42 = swift_allocObject();
    *(unsigned char *)(v42 + 16) = 32;
    uint64_t v43 = swift_allocObject();
    *(unsigned char *)(v43 + 16) = 8;
    uint64_t v44 = swift_allocObject();
    *(void *)(v44 + 16) = sub_22A5C726C;
    *(void *)(v44 + 24) = v35;
    uint64_t v45 = swift_allocObject();
    *(void *)(v45 + 16) = sub_22A5C7264;
    *(void *)(v45 + 24) = v44;
    uint64_t v46 = swift_allocObject();
    *(unsigned char *)(v46 + 16) = 0;
    uint64_t v47 = swift_allocObject();
    *(unsigned char *)(v47 + 16) = 8;
    uint64_t v48 = swift_allocObject();
    *(void *)(v48 + 16) = sub_22A5C7358;
    *(void *)(v48 + 24) = v36;
    uint64_t v49 = swift_allocObject();
    *(void *)(v49 + 16) = sub_22A5C7360;
    *(void *)(v49 + 24) = v48;
    uint64_t v50 = (void *)v65;
    LODWORD(v61) = v37;
    if (os_log_type_enabled((os_log_t)v65, (os_log_type_t)v37))
    {
      uint64_t v51 = v63;
      uint64_t v59 = v49;
      uint64_t v60 = v43;
      uint64_t v58 = v46;
      uint64_t v52 = v66;
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v69 = v54;
      uint64_t v70 = 0;
      uint64_t v57 = v53;
      *(_WORD *)uint64_t v53 = 770;
      uint64_t v71 = (uint64_t)(v53 + 2);
      uint64_t v67 = sub_22A5C7278;
      uint64_t v68 = v64;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v67, (uint64_t)&v71, (uint64_t)&v70, (uint64_t)&v69);
      swift_release();
      uint64_t v67 = sub_22A5C7278;
      uint64_t v68 = (uint64_t)v51;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v67, (uint64_t)&v71, (uint64_t)&v70, (uint64_t)&v69);
      swift_release();
      uint64_t v67 = sub_22A5C7270;
      uint64_t v68 = v41;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v67, (uint64_t)&v71, (uint64_t)&v70, (uint64_t)&v69);
      swift_release();
      uint64_t v67 = sub_22A5C7278;
      uint64_t v68 = v42;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v67, (uint64_t)&v71, (uint64_t)&v70, (uint64_t)&v69);
      swift_release();
      uint64_t v67 = sub_22A5C7278;
      uint64_t v68 = v60;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v67, (uint64_t)&v71, (uint64_t)&v70, (uint64_t)&v69);
      swift_release();
      uint64_t v67 = sub_22A5C7270;
      uint64_t v68 = v45;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v67, (uint64_t)&v71, (uint64_t)&v70, (uint64_t)&v69);
      swift_release();
      uint64_t v67 = sub_22A5C7278;
      uint64_t v68 = v58;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v67, (uint64_t)&v71, (uint64_t)&v70, (uint64_t)&v69);
      swift_release();
      uint64_t v67 = sub_22A5C7278;
      uint64_t v68 = v47;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v67, (uint64_t)&v71, (uint64_t)&v70, (uint64_t)&v69);
      swift_release();
      uint64_t v67 = sub_22A5C7274;
      uint64_t v68 = v59;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v67, (uint64_t)&v71, (uint64_t)&v70, (uint64_t)&v69);
      swift_release();
      uint64_t v55 = (void *)v65;
      uint64_t v56 = v57;
      _os_log_impl(&dword_22A5B3000, (os_log_t)v65, (os_log_type_t)v61, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v57, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v54, -1, -1);
      MEMORY[0x22A6CDBE0](v56, -1, -1);

      (*(void (**)(char *, uint64_t))(v62 + 8))(v8, v52);
    }
    else
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
      (*(void (**)(char *, uint64_t))(v62 + 8))(v8, v66);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 16);
    unint64_t v10 = 0x26AD78000uLL;
    if (v9)
    {
      uint64_t v61 = v1;
      uint64_t v62 = v4;
      uint64_t v11 = *(void *)(v1 + 16);
      swift_bridgeObjectRetain();
      uint64_t v60 = a1;
      uint64_t v12 = a1 + 48;
      *(void *)&long long v13 = 136380675;
      long long v65 = v13;
      uint64_t v64 = MEMORY[0x263F8EE58] + 8;
      uint64_t v66 = v3;
      do
      {
        uint64_t v14 = *(void *)(v12 - 16);
        unint64_t v15 = *(void *)(v12 - 8);
        swift_bridgeObjectRetain();
        int v16 = pc_session_add_metric();
        if (v16 == sub_22A5DA200())
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          if (*(void *)(v10 + 2576) != -1) {
            swift_once();
          }
          __swift_project_value_buffer(v3, (uint64_t)qword_26AD78CE0);
          swift_bridgeObjectRetain();
          uint64_t v17 = sub_22A5DA1D0();
          os_log_type_t v18 = sub_22A5DA360();
          if (os_log_type_enabled(v17, v18))
          {
            uint64_t v19 = swift_slowAlloc();
            uint64_t v20 = v11;
            unint64_t v21 = v10;
            os_log_type_t v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
            uint64_t v67 = (uint64_t (*)())v22;
            *(_DWORD *)uint64_t v19 = v65;
            swift_bridgeObjectRetain();
            *(void *)(v19 + 4) = sub_22A5D72AC(v14, v15, (uint64_t *)&v67);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_22A5B3000, v17, v18, "pc_session_add_metric failed. { metric=%{private}s }", (uint8_t *)v19, 0xCu);
            swift_arrayDestroy();
            uint64_t v23 = v22;
            unint64_t v10 = v21;
            uint64_t v11 = v20;
            MEMORY[0x22A6CDBE0](v23, -1, -1);
            uint64_t v24 = v19;
            uint64_t v3 = v66;
            MEMORY[0x22A6CDBE0](v24, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
        }
        v12 += 24;
        --v9;
      }
      while (v9);
      swift_bridgeObjectRelease();
      uint64_t v1 = v61;
      uint64_t v4 = v62;
    }
    uint64_t v25 = (void *)pc_session_begin();
    if (v25 == sub_22A5DA200())
    {
      *(unsigned char *)(v1 + 24) = 1;
      return;
    }
    if (*(void *)(v10 + 2576) != -1) {
      swift_once();
    }
    uint64_t v26 = __swift_project_value_buffer(v3, (uint64_t)qword_26AD78CE0);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v63, v26, v3);
    uint64_t v27 = sub_22A5DA1D0();
    os_log_type_t v28 = sub_22A5DA360();
    if (!os_log_type_enabled(v27, v28)) {
      goto LABEL_20;
    }
    int v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
    uint64_t v67 = (uint64_t (*)())v30;
    *(_DWORD *)int v29 = 136380675;
    if (strerror((int)v25))
    {
      uint64_t v31 = sub_22A5DA2F0();
      uint64_t v71 = sub_22A5D72AC(v31, v32, (uint64_t *)&v67);
      sub_22A5DA400();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, v27, v28, "pc_session_begin failed. { ret=%{private}s }", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v30, -1, -1);
      MEMORY[0x22A6CDBE0](v29, -1, -1);
LABEL_20:

      (*(void (**)(char *, uint64_t))(v4 + 8))(v63, v3);
      return;
    }
    __break(1u);

    __break(1u);
  }
}

void sub_22A5C5544()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22A5DA1F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v35 - v7;
  if (v1[24] == 1)
  {
    int v9 = pc_session_end();
    if (v9 == sub_22A5DA200())
    {
LABEL_9:
      v1[24] = 2;
      return;
    }
    if (qword_26AD78A10 != -1) {
      swift_once();
    }
    uint64_t v10 = __swift_project_value_buffer(v2, (uint64_t)qword_26AD78CE0);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v10, v2);
    uint64_t v11 = sub_22A5DA1D0();
    os_log_type_t v12 = sub_22A5DA360();
    if (!os_log_type_enabled(v11, v12))
    {
LABEL_8:

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      goto LABEL_9;
    }
    long long v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
    uint64_t v45 = (uint64_t (*)())v14;
    *(_DWORD *)long long v13 = 136380675;
    if (strerror(v9))
    {
      uint64_t v15 = sub_22A5DA2F0();
      uint64_t v49 = sub_22A5D72AC(v15, v16, (uint64_t *)&v45);
      sub_22A5DA400();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, v11, v12, "pc_session_end failed. { ret=%{private}s }", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v14, -1, -1);
      MEMORY[0x22A6CDBE0](v13, -1, -1);
      goto LABEL_8;
    }
    __break(1u);

    __break(1u);
  }
  else
  {
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v2, (uint64_t)qword_26AD78CF8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v17, v2);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = 0xD00000000000005ALL;
    *(void *)(v18 + 24) = 0x800000022A5DD070;
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = 0x2928646E65;
    *(void *)(v19 + 24) = 0xE500000000000000;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = 181;
    os_log_t v44 = (os_log_t)sub_22A5DA1D0();
    int v39 = sub_22A5DA380();
    uint64_t v41 = swift_allocObject();
    *(unsigned char *)(v41 + 16) = 32;
    uint64_t v40 = swift_allocObject();
    *(unsigned char *)(v40 + 16) = 8;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = sub_22A5C7268;
    *(void *)(v21 + 24) = v18;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_22A5C7264;
    *(void *)(v22 + 24) = v21;
    uint64_t v43 = swift_allocObject();
    *(unsigned char *)(v43 + 16) = 32;
    uint64_t v42 = swift_allocObject();
    *(unsigned char *)(v42 + 16) = 8;
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = sub_22A5C726C;
    *(void *)(v23 + 24) = v19;
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = sub_22A5C7264;
    *(void *)(v24 + 24) = v23;
    uint64_t v25 = swift_allocObject();
    *(unsigned char *)(v25 + 16) = 0;
    uint64_t v26 = swift_allocObject();
    *(unsigned char *)(v26 + 16) = 8;
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = sub_22A5C7358;
    *(void *)(v27 + 24) = v20;
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_22A5C7360;
    *(void *)(v28 + 24) = v27;
    os_log_type_t v29 = v39;
    if (os_log_type_enabled(v44, (os_log_type_t)v39))
    {
      uint64_t v30 = v40;
      uint64_t v35 = v26;
      uint64_t v36 = v28;
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      uint64_t v48 = 0;
      uint64_t v37 = v47;
      uint64_t v38 = v31;
      *(_WORD *)uint64_t v31 = 770;
      uint64_t v49 = (uint64_t)(v31 + 2);
      uint64_t v45 = sub_22A5C7278;
      uint64_t v46 = v41;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v45, (uint64_t)&v49, (uint64_t)&v48, (uint64_t)&v47);
      swift_release();
      uint64_t v45 = sub_22A5C7278;
      uint64_t v46 = v30;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v45, (uint64_t)&v49, (uint64_t)&v48, (uint64_t)&v47);
      swift_release();
      uint64_t v45 = sub_22A5C7270;
      uint64_t v46 = v22;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v45, (uint64_t)&v49, (uint64_t)&v48, (uint64_t)&v47);
      swift_release();
      uint64_t v45 = sub_22A5C7278;
      uint64_t v46 = v43;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v45, (uint64_t)&v49, (uint64_t)&v48, (uint64_t)&v47);
      swift_release();
      uint64_t v45 = sub_22A5C7278;
      uint64_t v46 = v42;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v45, (uint64_t)&v49, (uint64_t)&v48, (uint64_t)&v47);
      swift_release();
      uint64_t v45 = sub_22A5C7270;
      uint64_t v46 = v24;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v45, (uint64_t)&v49, (uint64_t)&v48, (uint64_t)&v47);
      swift_release();
      uint64_t v45 = sub_22A5C7278;
      uint64_t v46 = v25;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v45, (uint64_t)&v49, (uint64_t)&v48, (uint64_t)&v47);
      swift_release();
      uint64_t v45 = sub_22A5C7278;
      uint64_t v46 = v35;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v45, (uint64_t)&v49, (uint64_t)&v48, (uint64_t)&v47);
      swift_release();
      uint64_t v45 = sub_22A5C7274;
      uint64_t v46 = v36;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v45, (uint64_t)&v49, (uint64_t)&v48, (uint64_t)&v47);
      swift_release();
      os_log_t v32 = v44;
      uint64_t v33 = v38;
      _os_log_impl(&dword_22A5B3000, v44, v29, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v38, 0x20u);
      uint64_t v34 = v37;
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v34, -1, -1);
      MEMORY[0x22A6CDBE0](v33, -1, -1);
    }
    else
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
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

void sub_22A5C5D8C()
{
  uint64_t v1 = sub_22A5DA1F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v40 - v6;
  if (*(unsigned char *)(v0 + 24) == 2)
  {
    unint64_t v8 = (void *)swift_allocObject();
    v8[2] = sub_22A5D48D4(MEMORY[0x263F8EE78]);
    uint64_t v55 = sub_22A5C7108;
    uint64_t v56 = v8;
    uint64_t aBlock = (uint64_t (*)())MEMORY[0x263EF8330];
    uint64_t v52 = 1107296256;
    uint64_t v53 = sub_22A5C6A6C;
    uint64_t v54 = &block_descriptor_1;
    int v9 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    int values = pc_session_get_values();
    _Block_release(v9);
    if (values == sub_22A5DA200())
    {
LABEL_9:
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_release();
      return;
    }
    if (qword_26AD78A10 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v1, (uint64_t)qword_26AD78CE0);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v11, v1);
    os_log_type_t v12 = sub_22A5DA1D0();
    os_log_type_t v13 = sub_22A5DA360();
    if (!os_log_type_enabled(v12, v13))
    {

      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
      goto LABEL_9;
    }
    uint64_t v50 = v2;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
    uint64_t aBlock = (uint64_t (*)())v15;
    *(_DWORD *)uint64_t v14 = 136380675;
    if (strerror(values))
    {
      uint64_t v16 = sub_22A5DA2F0();
      v59[0] = sub_22A5D72AC(v16, v17, (uint64_t *)&aBlock);
      sub_22A5DA400();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, v12, v13, "pc_session_destroy failed, { ret=%{private}s }", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v15, -1, -1);
      MEMORY[0x22A6CDBE0](v14, -1, -1);

      (*(void (**)(char *, uint64_t))(v50 + 8))(v5, v1);
      goto LABEL_9;
    }
    __break(1u);

    __break(1u);
  }
  else
  {
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v1, (uint64_t)qword_26AD78CF8);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v18, v1);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = 0xD00000000000005ALL;
    *(void *)(v19 + 24) = 0x800000022A5DD070;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = 0xD000000000000011;
    *(void *)(v20 + 24) = 0x800000022A5DD0D0;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = 195;
    os_log_t v49 = (os_log_t)sub_22A5DA1D0();
    int v48 = sub_22A5DA380();
    uint64_t v22 = swift_allocObject();
    uint64_t v50 = v2;
    uint64_t v47 = v22;
    *(unsigned char *)(v22 + 16) = 32;
    uint64_t v46 = swift_allocObject();
    *(unsigned char *)(v46 + 16) = 8;
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = sub_22A5C7268;
    *(void *)(v23 + 24) = v19;
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = sub_22A5C7264;
    *(void *)(v24 + 24) = v23;
    uint64_t v25 = swift_allocObject();
    *(unsigned char *)(v25 + 16) = 32;
    uint64_t v26 = swift_allocObject();
    *(unsigned char *)(v26 + 16) = 8;
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = sub_22A5C726C;
    *(void *)(v27 + 24) = v20;
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_22A5C7264;
    *(void *)(v28 + 24) = v27;
    uint64_t v29 = swift_allocObject();
    *(unsigned char *)(v29 + 16) = 0;
    uint64_t v30 = swift_allocObject();
    *(unsigned char *)(v30 + 16) = 8;
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = sub_22A5C7358;
    *(void *)(v31 + 24) = v21;
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = sub_22A5C7360;
    *(void *)(v32 + 24) = v31;
    if (os_log_type_enabled(v49, (os_log_type_t)v48))
    {
      uint64_t v41 = v24;
      uint64_t v42 = v32;
      uint64_t v33 = v46;
      uint64_t v44 = v29;
      uint64_t v34 = v50;
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v57 = v36;
      uint64_t v58 = 0;
      *(_WORD *)uint64_t v35 = 770;
      uint64_t v43 = v36;
      v59[0] = v35 + 2;
      uint64_t aBlock = sub_22A5C7278;
      uint64_t v52 = v47;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v59, (uint64_t)&v58, (uint64_t)&v57);
      uint64_t v45 = v35;
      swift_release();
      uint64_t aBlock = sub_22A5C7278;
      uint64_t v52 = v33;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v59, (uint64_t)&v58, (uint64_t)&v57);
      swift_release();
      uint64_t aBlock = sub_22A5C7270;
      uint64_t v52 = v41;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v59, (uint64_t)&v58, (uint64_t)&v57);
      swift_release();
      uint64_t aBlock = sub_22A5C7278;
      uint64_t v52 = v25;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v59, (uint64_t)&v58, (uint64_t)&v57);
      swift_release();
      uint64_t aBlock = sub_22A5C7278;
      uint64_t v52 = v26;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v59, (uint64_t)&v58, (uint64_t)&v57);
      swift_release();
      uint64_t aBlock = sub_22A5C7270;
      uint64_t v52 = v28;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v59, (uint64_t)&v58, (uint64_t)&v57);
      swift_release();
      uint64_t aBlock = sub_22A5C7278;
      uint64_t v52 = v44;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v59, (uint64_t)&v58, (uint64_t)&v57);
      swift_release();
      uint64_t aBlock = sub_22A5C7278;
      uint64_t v52 = v30;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v59, (uint64_t)&v58, (uint64_t)&v57);
      swift_release();
      uint64_t aBlock = sub_22A5C7274;
      uint64_t v52 = v42;
      sub_22A5BAA04((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v59, (uint64_t)&v58, (uint64_t)&v57);
      swift_release();
      os_log_t v37 = v49;
      uint64_t v38 = v45;
      _os_log_impl(&dword_22A5B3000, v49, (os_log_type_t)v48, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v45, 0x20u);
      uint64_t v39 = v43;
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v39, -1, -1);
      MEMORY[0x22A6CDBE0](v38, -1, -1);

      (*(void (**)(char *, uint64_t))(v34 + 8))(v7, v1);
    }
    else
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
      (*(void (**)(char *, uint64_t))(v50 + 8))(v7, v1);
    }
    sub_22A5D48D4(MEMORY[0x263F8EE78]);
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  char *result = *a2;
  return result;
}

uint64_t sub_22A5C6738(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22A5C6740(unsigned char *result, char a2)
{
  char *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PCSession.State()
{
  return &type metadata for PCSession.State;
}

uint64_t _s14AudioAnalytics9PCSessionC5StateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s14AudioAnalytics9PCSessionC5StateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    char *result = a2 + 2;
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
        JUMPOUT(0x22A5C68B4);
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
          char *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PerfCheck.State()
{
  return &type metadata for PerfCheck.State;
}

unint64_t sub_22A5C68F0()
{
  unint64_t result = qword_26837CF78;
  if (!qword_26837CF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837CF78);
  }
  return result;
}

unint64_t sub_22A5C6948()
{
  unint64_t result = qword_26837CF80;
  if (!qword_26837CF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837CF80);
  }
  return result;
}

uint64_t sub_22A5C699C(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a6)
  {
    uint64_t v11 = sub_22A5DA2F0();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0xE700000000000000;
    uint64_t v11 = 0x6E776F6E6B6E75;
  }
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *(void *)(a9 + 16);
  *(void *)(a9 + 16) = 0x8000000000000000;
  sub_22A5D8E14(v11, v13, isUniquelyReferenced_nonNull_native, a1);
  *(void *)(a9 + 16) = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_22A5C6A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9)
{
  unint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))(a1 + 32);
  swift_retain();
  v17(a2, a3, a4, a5, a6, a7, a8, a9);
  return swift_release();
}

BOOL sub_22A5C6B1C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22A5C6B30()
{
  return sub_22A5DA580();
}

uint64_t sub_22A5C6B78()
{
  return sub_22A5DA560();
}

uint64_t sub_22A5C6BA4()
{
  return sub_22A5DA580();
}

uint64_t sub_22A5C6BE8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5C6C20()
{
  return sub_22A5C7598(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_22A5C6C28()
{
  return sub_22A5C7564(*(void *)(v0 + 16));
}

uint64_t sub_22A5C6C30()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5C6C40()
{
  return nullsub_1(*(void *)(v0 + 16));
}

uint64_t sub_22A5C6C48()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char **sub_22A5C6C58(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_22A5BAA40(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_22A5C6C60()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C6C70()
{
  return sub_22A5D720C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_22A5C6C78(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_22A5D7234(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_22A5C6C80()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C6C90()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C6CA0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C6CB0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C6CC0@<X0>(uint64_t *a1@<X8>)
{
  return sub_22A5D7904(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_22A5C6CC8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_22A5D71AC(a1, a2, a3, *(void (**)(uint64_t *__return_ptr))(v3 + 16));
}

uint64_t sub_22A5C6CD0(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    type metadata accessor for PCSession();
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v4; ++i)
    {
      swift_allocObject();
      if (sub_22A5C4398())
      {
        sub_22A5C4AD4(a2);
        if (v7)
        {
          MEMORY[0x22A6CD2E0]();
          if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_22A5DA340();
          }
          sub_22A5DA350();
          sub_22A5DA330();
        }
        else
        {
          swift_release();
        }
      }
    }
    swift_bridgeObjectRelease();
    return v8;
  }
  return result;
}

uint64_t sub_22A5C6E00(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1;
  uint64_t v14 = a1;
  if (a2 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_22A5DA4C0();
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
    {
LABEL_3:
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v9 = i - 4;
        if ((a2 & 0xC000000000000001) != 0)
        {
          uint64_t v6 = MEMORY[0x22A6CD460](i - 4, a2);
          BOOL v10 = __OFADD__(v9, 1);
          uint64_t v11 = i - 3;
          if (v10) {
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v6 = *(void *)(a2 + 8 * i);
          swift_retain();
          BOOL v10 = __OFADD__(v9, 1);
          uint64_t v11 = i - 3;
          if (v10)
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        uint64_t v13 = v6;
        sub_22A5C3830((uint64_t)&v14, (uint64_t)&v13, a3);
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          return v6;
        }
        swift_release();
        if (v11 == v7)
        {
          swift_bridgeObjectRelease();
          return v14;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_22A5C6F48()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5C6F58()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C6F68()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C6F78()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C6F88()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C6F98()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5C6FD0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C6FE0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C6FF0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5C7000()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7010()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7020()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7030()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7040()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7050()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7060()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5C7070()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7080()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7090()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C70A0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C70B0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C70C0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C70D0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5C7108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8)
{
  return sub_22A5C699C(a8, a1, a2, a3, a4, a5, a6, a7, v8);
}

uint64_t sub_22A5C7110()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5C7120()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7130()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7140()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7150()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7160()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7170()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7180()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5C7190()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C71A0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C71B0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C71C0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C71D0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C71E0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C71F0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5C7200()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7210()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7220()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7230()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7240()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7250()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_22A5C7368(unsigned int a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_22A5DA1B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v9 = *(_DWORD *)(v2 + 24);
  if (v9 < a1)
  {
    sub_22A5DA1A0();
    sub_22A5DA180();
    double v11 = v10;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    double v12 = (v11 - *(double *)(v2 + 32)) * 32.0;
    double v13 = round(v12);
    BOOL v14 = v13 >= 4294967300.0 || v13 <= -1.0;
    unsigned int v15 = vcvtad_u64_f64(v12);
    if (v14) {
      unsigned int v15 = -1;
    }
    int v17 = *(_DWORD *)(v2 + 24);
    int v18 = v17 + v15;
    if (v17 + v15 >= 0x20) {
      int v18 = 32;
    }
    unsigned int v9 = __CFADD__(v17, v15) ? 32 : v18;
    *(_DWORD *)(v2 + 24) = v9;
    *(double *)(v2 + 32) = v11;
    if (v9 < a1) {
      return 0;
    }
  }
  BOOL v19 = v9 >= a1;
  unsigned int v20 = v9 - a1;
  if (v19)
  {
    *(_DWORD *)(v2 + 24) = v20;
    return 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5C74D4()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for RateLimiter()
{
  return self;
}

uint64_t sub_22A5C7530()
{
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for TokenBucket()
{
  return self;
}

uint64_t sub_22A5C7564(uint64_t a1)
{
  return a1;
}

uint64_t sub_22A5C759C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ReporterState(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unsigned int v9 = (void *)((char *)v28 - v8);
  sub_22A5B6208(a1, (uint64_t)v28 - v8, type metadata accessor for ReporterState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    uint64_t v14 = *v9;
    unsigned int v15 = (void *)sub_22A5CDC58(a1, 3);
    objc_msgSend(v15, sel_createSessionWith_, *(void *)(v14 + 16));
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v16 = (void *)sub_22A5DA280();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_setWithConfiguration_for_, v16, *(void *)(v14 + 16));

    uint64_t v17 = *(void *)(v14 + 16);
    objc_msgSend(v15, sel_setWithServiceType_for_, *(unsigned __int16 *)(v14 + 24), v17);
    sub_22A5CE250(v14);
    objc_msgSend(v15, sel_startSessionFor_, v17);
    int v18 = (char *)a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
    *a2 = v14;
    sub_22A5DA190();
    swift_unknownObjectRelease();
    *(_DWORD *)&v18[*(int *)(type metadata accessor for StartedReporterData(0) + 20)] = 0;
    type metadata accessor for ActiveReporterState(0);
    goto LABEL_6;
  }
  if (EnumCaseMultiPayload == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    int v11 = swift_getEnumCaseMultiPayload();
    uint64_t v12 = *v9;
    if (v11 == 1)
    {
      sub_22A5CE250(*v9);
      objc_msgSend((id)sub_22A5CDC58(a1, 3), sel_startSessionFor_, *(void *)(v12 + 16));
      swift_unknownObjectRelease();
      double v13 = (char *)a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
      *a2 = v12;
      sub_22A5DA190();
      *(_DWORD *)&v13[*(int *)(type metadata accessor for StartedReporterData(0) + 20)] = 0;
LABEL_6:
      swift_storeEnumTagMultiPayload();
      return swift_storeEnumTagMultiPayload();
    }
  }
  else
  {
    type metadata accessor for ActiveReporterState(0);
    int v20 = swift_getEnumCaseMultiPayload();
    uint64_t v21 = *v9;
    if (v20 == 1)
    {
      sub_22A5CE250(*v9);
      objc_msgSend((id)sub_22A5CDC58(a1, 3), sel_startSessionFor_, *(void *)(v21 + 16));
      swift_unknownObjectRelease();
      uint64_t v22 = (char *)a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
      *a2 = v21;
      sub_22A5DA190();
      *(_DWORD *)&v22[*(int *)(type metadata accessor for StartedReporterData(0) + 20)] = 0;
      swift_storeEnumTagMultiPayload();
      return swift_storeEnumTagMultiPayload();
    }
  }
  swift_release();
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
  sub_22A5B7AE0((uint64_t)v9 + *(int *)(v23 + 48), type metadata accessor for StartedReporterData);
  sub_22A5B6208(a1, (uint64_t)v7, type metadata accessor for ReporterState);
  uint64_t v24 = sub_22A5DA1D0();
  os_log_type_t v25 = sub_22A5DA360();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 134217984;
    uint64_t v27 = *(void *)(sub_22A5CFAE0() + 16);
    swift_release();
    sub_22A5B7AE0((uint64_t)v7, type metadata accessor for ReporterState);
    v28[1] = v27;
    sub_22A5DA400();
    _os_log_impl(&dword_22A5B3000, v24, v25, "Reporter already started. Returning early. { reporterID=%lld }", v26, 0xCu);
    MEMORY[0x22A6CDBE0](v26, -1, -1);
  }
  else
  {
    sub_22A5B7AE0((uint64_t)v7, type metadata accessor for ReporterState);
  }

  return sub_22A5B6208(a1, (uint64_t)a2, type metadata accessor for ReporterState);
}

void sub_22A5C7A5C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v39 = a5;
  uint64_t v40 = (void *)a3;
  uint64_t v8 = type metadata accessor for StartedReporterData(0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  int v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  double v13 = (char *)&v38 - v12;
  uint64_t v14 = type metadata accessor for ReporterState(0);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (uint64_t *)((char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  int v20 = (uint64_t *)((char *)&v38 - v19);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v38 - v22;
  MEMORY[0x270FA5388](v21);
  os_log_type_t v25 = (uint64_t *)((char *)&v38 - v24);
  sub_22A5B6208(a1, (uint64_t)&v38 - v24, type metadata accessor for ReporterState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    uint64_t v38 = a4;
    if (EnumCaseMultiPayload == 1)
    {
      type metadata accessor for ActiveReporterState(0);
      int v27 = swift_getEnumCaseMultiPayload();
      uint64_t v28 = *v25;
      if (v27 != 1)
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
        sub_22A5C9434((uint64_t)v25 + *(int *)(v29 + 48), (uint64_t)v13, type metadata accessor for StartedReporterData);
        uint64_t v30 = v40;
        sub_22A5CE6C8(v28, (uint64_t)v13, (uint64_t)v40, v38);
        objc_msgSend((id)sub_22A5CDC58(a1, 3), sel_stopSessionFor_, *(void *)(v28 + 16));
        swift_unknownObjectRelease();
        sub_22A5B7AE0((uint64_t)v13, type metadata accessor for StartedReporterData);
        *uint64_t v39 = v28;
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
        goto LABEL_11;
      }
    }
    else
    {
      type metadata accessor for ActiveReporterState(0);
      int v31 = swift_getEnumCaseMultiPayload();
      uint64_t v32 = *v25;
      if (v31 != 1)
      {
        uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
        sub_22A5C9434((uint64_t)v25 + *(int *)(v37 + 48), (uint64_t)v11, type metadata accessor for StartedReporterData);
        uint64_t v30 = v40;
        sub_22A5CE6C8(v32, (uint64_t)v11, (uint64_t)v40, v38);
        objc_msgSend((id)sub_22A5CDC58(a1, 3), sel_stopSessionFor_, *(void *)(v32 + 16));
        swift_unknownObjectRelease();
        if (*(unsigned char *)(a2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient__isCachingEnabled) == 1)
        {
          sub_22A5B7AE0((uint64_t)v11, type metadata accessor for StartedReporterData);
          *uint64_t v39 = v32;
          swift_storeEnumTagMultiPayload();
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          *uint64_t v17 = v32;
          swift_storeEnumTagMultiPayload();
          swift_storeEnumTagMultiPayload();
          swift_retain();
          sub_22A5C7FA0((uint64_t)v17, v20);
          sub_22A5B7AE0((uint64_t)v17, type metadata accessor for ReporterState);
          sub_22A5CDAB4();
          swift_release();
          sub_22A5B7AE0((uint64_t)v11, type metadata accessor for StartedReporterData);
          sub_22A5C9434((uint64_t)v20, (uint64_t)v39, type metadata accessor for ReporterState);
        }
        goto LABEL_11;
      }
    }
  }
  swift_release();
  sub_22A5B6208(a1, (uint64_t)v23, type metadata accessor for ReporterState);
  uint64_t v33 = sub_22A5DA1D0();
  os_log_type_t v34 = sub_22A5DA360();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 134217984;
    uint64_t v36 = *(void *)(sub_22A5CFAE0() + 16);
    swift_release();
    sub_22A5B7AE0((uint64_t)v23, type metadata accessor for ReporterState);
    uint64_t v41 = v36;
    sub_22A5DA400();
    _os_log_impl(&dword_22A5B3000, v33, v34, "Reporter disconnected or already stopped. { func=stop, reporterID=%lld }", v35, 0xCu);
    MEMORY[0x22A6CDBE0](v35, -1, -1);
  }
  else
  {
    sub_22A5B7AE0((uint64_t)v23, type metadata accessor for ReporterState);
  }
  uint64_t v30 = v40;

  sub_22A5B6208(a1, (uint64_t)v39, type metadata accessor for ReporterState);
LABEL_11:
}

uint64_t sub_22A5C7FA0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for ReporterState(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t *)((char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  int v11 = (uint64_t *)((char *)v28 - v10);
  sub_22A5B6208(a1, (uint64_t)v28 - v10, type metadata accessor for ReporterState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    swift_release();
LABEL_10:
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_22A5DA1F0();
    __swift_project_value_buffer(v19, (uint64_t)qword_26AD78CF8);
    int v20 = sub_22A5DA1D0();
    os_log_type_t v21 = sub_22A5DA380();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      v28[0] = v23;
      *(_DWORD *)uint64_t v22 = 136315650;
      uint64_t v29 = sub_22A5D72AC(0xD00000000000006BLL, 0x800000022A5DD200, v28);
      sub_22A5DA400();
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v29 = sub_22A5D72AC(0xD00000000000003ELL, 0x800000022A5DD270, v28);
      sub_22A5DA400();
      *(_WORD *)(v22 + 22) = 2048;
      uint64_t v29 = 197;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v20, v21, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", (uint8_t *)v22, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v23, -1, -1);
      MEMORY[0x22A6CDBE0](v22, -1, -1);
    }

    return sub_22A5B6208(a1, (uint64_t)a2, type metadata accessor for ReporterState);
  }
  if (EnumCaseMultiPayload == 1)
  {
    double v13 = type metadata accessor for ReporterState;
    uint64_t v14 = (uint64_t)v11;
LABEL_9:
    sub_22A5B7AE0(v14, v13);
    goto LABEL_10;
  }
  type metadata accessor for ActiveReporterState(0);
  int v15 = swift_getEnumCaseMultiPayload();
  uint64_t v16 = *v11;
  if (v15 != 1)
  {
    swift_release();
    uint64_t v14 = (uint64_t)v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
    double v13 = type metadata accessor for StartedReporterData;
    goto LABEL_9;
  }
  uint64_t v17 = *(void *)(v16 + 16);
  uint64_t v18 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache;
  if (!*(void *)(v3 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache))
  {
    type metadata accessor for MessageCache();
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = sub_22A5C00A0();
    *(void *)(v3 + v18) = v25;
    swift_retain();
    swift_release();
  }
  swift_retain();
  sub_22A5C0C6C(v17);
  swift_release();
  *uint64_t v9 = v16;
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  swift_retain();
  uint64_t v26 = (void *)sub_22A5CDC58((uint64_t)v9, 3);
  sub_22A5B7AE0((uint64_t)v9, type metadata accessor for ReporterState);
  objc_msgSend(v26, sel_createSessionWith_, v17);
  objc_msgSend(v26, sel_setWithServiceType_for_, *(unsigned __int16 *)(v16 + 24), v17);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  int v27 = (void *)sub_22A5DA280();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_setWithConfiguration_for_, v27, v17);
  swift_unknownObjectRelease();

  *a2 = v16;
  swift_storeEnumTagMultiPayload();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22A5C8468(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ReporterState(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A5B6208(a1, (uint64_t)v4, type metadata accessor for ReporterState);
  if (!swift_getEnumCaseMultiPayload()) {
    return swift_release();
  }
  sub_22A5B7AE0((uint64_t)v4, type metadata accessor for ReporterState);
  uint64_t v5 = (void *)sub_22A5CDC58(a1, 3);
  uint64_t v6 = *(void *)(sub_22A5CFAE0() + 16);
  swift_release();
  objc_msgSend(v5, sel_destroySessionFor_, v6);
  return swift_unknownObjectRelease();
}

void sub_22A5C8574(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, void (*a4)(void))
{
  v25[1] = a3;
  uint64_t v26 = a2;
  uint64_t v6 = type metadata accessor for ReporterState(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  int v11 = (char *)v25 - v10;
  uint64_t active = type metadata accessor for ActiveReporterState(0);
  uint64_t v13 = MEMORY[0x270FA5388](active);
  int v15 = (void *)((char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v25 - v16;
  sub_22A5B6208(a1, (uint64_t)v11, type metadata accessor for ReporterState);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_22A5C9434((uint64_t)v11, (uint64_t)v17, type metadata accessor for ActiveReporterState);
    sub_22A5C9434((uint64_t)v17, (uint64_t)v15, type metadata accessor for ActiveReporterState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v19 = *v15;
    if (EnumCaseMultiPayload == 1)
    {
      a4(*v15);
      swift_release();
    }
    else
    {
      uint64_t v24 = (uint64_t)v15 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
      v26(v19);
      swift_release();
      sub_22A5B7AE0(v24, type metadata accessor for StartedReporterData);
    }
  }
  else
  {
    swift_release();
    sub_22A5B6208(a1, (uint64_t)v9, type metadata accessor for ReporterState);
    int v20 = sub_22A5DA1D0();
    os_log_type_t v21 = sub_22A5DA360();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 134217984;
      uint64_t v23 = *(void *)(sub_22A5CFAE0() + 16);
      swift_release();
      sub_22A5B7AE0((uint64_t)v9, type metadata accessor for ReporterState);
      uint64_t v27 = v23;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v20, v21, "Reporter disconnected. { func=setServiceType, reporterID=%lld }", v22, 0xCu);
      MEMORY[0x22A6CDBE0](v22, -1, -1);
    }
    else
    {
      sub_22A5B7AE0((uint64_t)v9, type metadata accessor for ReporterState);
    }
  }
}

uint64_t sub_22A5C88A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = (void *)a2;
  uint64_t v3 = type metadata accessor for StartedReporterData(0);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v37 = (uint64_t)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v38 = (uint64_t)v36 - v6;
  uint64_t v7 = type metadata accessor for ReporterState(0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t active = type metadata accessor for ActiveReporterState(0);
  uint64_t v11 = MEMORY[0x270FA5388](active);
  uint64_t v13 = (void *)((char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  int v15 = (char *)v36 - v14;
  if (qword_26AD78A40 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_22A5DA1F0();
  __swift_project_value_buffer(v16, (uint64_t)qword_26AD78CF8);
  uint64_t v17 = sub_22A5DA1D0();
  os_log_type_t v18 = sub_22A5DA390();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_22A5B3000, v17, v18, "handleXPCInterruption called.", v19, 2u);
    MEMORY[0x22A6CDBE0](v19, -1, -1);
  }

  sub_22A5B6208(a1, (uint64_t)v9, type metadata accessor for ReporterState);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22A5C9434((uint64_t)v9, (uint64_t)v15, type metadata accessor for ActiveReporterState);
    sub_22A5B6208((uint64_t)v15, (uint64_t)v13, type metadata accessor for ActiveReporterState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v21 = *v13;
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v22 = v39;
      if (*(void *)(v21 + 40))
      {
        swift_retain();
        sub_22A5C39F0();
        swift_release();
      }
      sub_22A5B7AE0((uint64_t)v15, type metadata accessor for ActiveReporterState);
      *uint64_t v22 = v21;
    }
    else
    {
      v36[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
      sub_22A5C9434((uint64_t)v13 + *(int *)(v36[0] + 48), v38, type metadata accessor for StartedReporterData);
      uint64_t v24 = *(void *)(v21 + 16);
      uint64_t v25 = (void *)sub_22A5CDC58(a1, 3);
      objc_msgSend(v25, sel_createSessionWith_, v24);
      objc_msgSend(v25, sel_setWithServiceType_for_, *(unsigned __int16 *)(v21 + 24), v24);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v26 = (void *)sub_22A5DA280();
      swift_bridgeObjectRelease();
      objc_msgSend(v25, sel_setWithConfiguration_for_, v26, v24);

      uint64_t v27 = v37;
      sub_22A5DA190();
      *(_DWORD *)(v27 + *(int *)(v3 + 20)) = 0;
      objc_msgSend(v25, sel_startSessionFor_, v24);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78950);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_22A5DB310;
      *(void *)(inited + 32) = 0xD000000000000011;
      *(void *)(inited + 40) = 0x800000022A5DD2B0;
      *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
      *(unsigned char *)(inited + 48) = 1;
      unint64_t v29 = sub_22A5B7520(inited);
      int v30 = *(_DWORD *)(v38 + *(int *)(v3 + 20));
      if (v30)
      {
        uint64_t v43 = MEMORY[0x263F8E8F8];
        LODWORD(v42) = v30;
        sub_22A5B5AEC(&v42, v41);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v40 = v29;
        sub_22A5B4E54(v41, 0xD000000000000014, 0x800000022A5DD2D0, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease();
      }
      uint64_t v32 = (void *)sub_22A5DA280();
      swift_bridgeObjectRelease();
      objc_msgSend(v25, sel_sendWithMessage_with_and_for_, v32, 1, 0, v24);

      if (*(void *)(v21 + 40) && (swift_retain(), sub_22A5C39F0(), swift_release(), *(void *)(v21 + 40)))
      {
        swift_retain();
        sub_22A5C1EB4();
        swift_unknownObjectRelease();
        swift_release();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      uint64_t v33 = v39;
      uint64_t v34 = v36[0];
      sub_22A5B7AE0(v38, type metadata accessor for StartedReporterData);
      sub_22A5B7AE0((uint64_t)v15, type metadata accessor for ActiveReporterState);
      uint64_t v35 = (uint64_t)v33 + *(int *)(v34 + 48);
      *uint64_t v33 = v21;
      sub_22A5C9434(v37, v35, type metadata accessor for StartedReporterData);
      swift_storeEnumTagMultiPayload();
    }
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    sub_22A5B7AE0((uint64_t)v9, type metadata accessor for ReporterState);
    return sub_22A5B6208(a1, (uint64_t)v39, type metadata accessor for ReporterState);
  }
}

uint64_t sub_22A5C8F14@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t active = type metadata accessor for ActiveReporterState(0);
  uint64_t v6 = MEMORY[0x270FA5388](active);
  uint64_t v8 = (uint64_t *)((char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t *)((char *)&v30 - v9);
  uint64_t v11 = type metadata accessor for ReporterState(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t *)((char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22A5B6208(a1, (uint64_t)v13, type metadata accessor for ReporterState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    uint64_t v20 = *v13;
    uint64_t v21 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache;
    if (!*(void *)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache))
    {
      type metadata accessor for MessageCache();
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = sub_22A5C00A0();
      *(void *)(v2 + v21) = v29;
      swift_retain();
      swift_release();
    }
    *uint64_t v8 = v20;
    swift_storeEnumTagMultiPayload();
    swift_retain();
    swift_retain();
    sub_22A5BEFC4((uint64_t)v8);
    swift_release();
    sub_22A5B7AE0((uint64_t)v8, type metadata accessor for ActiveReporterState);
    *a2 = v20;
    swift_storeEnumTagMultiPayload();
    return swift_storeEnumTagMultiPayload();
  }
  if (EnumCaseMultiPayload == 1)
  {
    sub_22A5C9434((uint64_t)v13, (uint64_t)a2, type metadata accessor for ActiveReporterState);
    sub_22A5B6208((uint64_t)a2, (uint64_t)v10, type metadata accessor for ActiveReporterState);
    int v15 = swift_getEnumCaseMultiPayload();
    uint64_t v16 = *v10;
    if (v15 != 1)
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
      sub_22A5B7AE0((uint64_t)v10 + *(int *)(v17 + 48), type metadata accessor for StartedReporterData);
    }
    uint64_t v18 = *(void *)(v16 + 16);
    swift_release();
    objc_msgSend((id)sub_22A5CDC58(a1, 3), sel_destroySessionFor_, v18);
    swift_unknownObjectRelease();
    uint64_t v19 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache;
    if (!*(void *)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache))
    {
      type metadata accessor for MessageCache();
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = sub_22A5C00A0();
      *(void *)(v2 + v19) = v28;
      swift_retain();
      swift_release();
    }
    swift_retain();
    sub_22A5BEFC4((uint64_t)a2);
    swift_release();
    return swift_storeEnumTagMultiPayload();
  }
  if (qword_26AD78A40 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_22A5DA1F0();
  __swift_project_value_buffer(v22, (uint64_t)qword_26AD78CF8);
  uint64_t v23 = sub_22A5DA1D0();
  os_log_type_t v24 = sub_22A5DA380();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v31 = v26;
    *(_DWORD *)uint64_t v25 = 136315650;
    uint64_t v30 = sub_22A5D72AC(0xD00000000000006BLL, 0x800000022A5DD200, &v31);
    sub_22A5DA400();
    *(_WORD *)(v25 + 12) = 2080;
    uint64_t v30 = sub_22A5D72AC(0xD00000000000003ELL, 0x800000022A5DD1C0, &v31);
    sub_22A5DA400();
    *(_WORD *)(v25 + 22) = 2048;
    uint64_t v30 = 175;
    sub_22A5DA400();
    _os_log_impl(&dword_22A5B3000, v23, v24, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", (uint8_t *)v25, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x22A6CDBE0](v26, -1, -1);
    MEMORY[0x22A6CDBE0](v25, -1, -1);
  }

  sub_22A5B6208(a1, (uint64_t)a2, type metadata accessor for ReporterState);
  return sub_22A5B7AE0((uint64_t)v13, type metadata accessor for ReporterState);
}

uint64_t sub_22A5C9434(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22A5C949C(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_26AD78840);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (uint64_t *)((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (uint64_t *)((char *)&v20 - v8);
  int64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (v10)
  {
    uint64_t v20 = v1;
    uint64_t v22 = MEMORY[0x263F8EE78];
    sub_22A5D2C98(0, v10, 0);
    uint64_t v12 = (uint64_t *)(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));
    uint64_t v21 = *(void *)(v4 + 72);
    do
    {
      uint64_t v13 = *(int *)(v3 + 48);
      uint64_t v14 = (uint64_t)v9 + v13;
      uint64_t v15 = *v12;
      *uint64_t v9 = *v12;
      sub_22A5B6270((uint64_t)v12 + v13, (uint64_t)v9 + v13, type metadata accessor for ReporterState);
      uint64_t v16 = (uint64_t)v7 + *(int *)(v3 + 48);
      *uint64_t v7 = v15;
      sub_22A5B605C(v14, v16, type metadata accessor for ReporterState);
      sub_22A5B5680((uint64_t)v7, qword_26AD78840);
      uint64_t v11 = v22;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22A5D2C98(0, *(void *)(v11 + 16) + 1, 1);
        uint64_t v11 = v22;
      }
      unint64_t v18 = *(void *)(v11 + 16);
      unint64_t v17 = *(void *)(v11 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_22A5D2C98(v17 > 1, v18 + 1, 1);
        uint64_t v11 = v22;
      }
      uint64_t v12 = (uint64_t *)((char *)v12 + v21);
      *(void *)(v11 + 16) = v18 + 1;
      *(void *)(v11 + 8 * v18 + 32) = v15;
      --v10;
    }
    while (v10);
  }
  return v11;
}

uint64_t sub_22A5C96AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_22A5B5AEC((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_22A5B4E54(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_22A5B5680(a1, &qword_26AD78978);
    sub_22A5D2F78(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_22A5B5680((uint64_t)v9, &qword_26AD78978);
  }
}

char *sub_22A5C9784()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for ServerClient(0));
  uint64_t result = sub_22A5C9890(0, 0);
  qword_26AD78CD0 = (uint64_t)result;
  return result;
}

char *sub_22A5C9890(void *a1, uint64_t a2)
{
  uint64_t v63 = a1;
  uint64_t v64 = a2;
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_22A5DA3A0();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = sub_22A5DA3B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22A5DA250();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = &v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_logger];
  uint64_t v10 = qword_26AD78A40;
  uint64_t v11 = v2;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_22A5DA1F0();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_26AD78CF8);
  uint64_t v14 = *(void *)(v12 - 8);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  uint64_t v61 = v13;
  uint64_t v62 = v12;
  uint64_t v59 = v14 + 16;
  uint64_t v60 = v15;
  ((void (*)(char *))v15)(v9);
  uint64_t v16 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_halIOCategory;
  *(_DWORD *)&v11[v16] = sub_22A5BEA94((uint64_t)&unk_26DE29D68);
  uint64_t v17 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue;
  sub_22A5BDA2C(0, (unint64_t *)&qword_26AD78A88);
  sub_22A5DA240();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F138], v4);
  uint64_t v18 = MEMORY[0x263F8EE78];
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_22A5D3DA8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A28);
  sub_22A5D3E00();
  sub_22A5DA440();
  *(void *)&v11[v17] = sub_22A5DA3E0();
  uint64_t v19 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_idGenerator;
  type metadata accessor for ReporterIDGenerator();
  uint64_t v20 = swift_allocObject();
  *(_DWORD *)(v20 + 16) = 0;
  *(void *)&v11[v19] = v20;
  uint64_t v21 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageRateLimiter;
  type metadata accessor for RateLimiter();
  uint64_t v22 = swift_allocObject();
  type metadata accessor for TokenBucket();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = 0x2000000020;
  *(_DWORD *)(v23 + 24) = 0;
  *(void *)(v23 + 32) = 0;
  *(void *)(v22 + 16) = v23;
  *(void *)&v11[v21] = v22;
  uint64_t v24 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_clientReporterStates;
  *(void *)&v11[v24] = sub_22A5D98D0(v18);
  *(void *)&v11[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache] = 0;
  v11[OBJC_IVAR____TtC14AudioAnalytics12ServerClient__isCachingEnabled] = 0;
  uint64_t v25 = v63;
  if (v63)
  {
    id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08D68]), sel_initWithListenerEndpoint_, v63);
  }
  else
  {
    id v27 = objc_allocWithZone(MEMORY[0x263F08D68]);
    uint64_t v28 = (void *)sub_22A5DA2C0();
    id v26 = objc_msgSend(v27, sel_initWithMachServiceName_options_, v28, 4096);
  }
  *(void *)&v11[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_xpcConnection] = v26;
  *(void *)&v11[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_injectedServerProtocol] = v64;
  type metadata accessor for ServerProxy();
  uint64_t v29 = swift_allocObject();
  v60(v29 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy_logger, v61, v62);
  *(void *)(v29 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy____lazy_storage___unboostedProxy) = 0;
  *(void *)(v29 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy____lazy_storage___boostedProxy) = 0;
  *(void *)(v29 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy____lazy_storage___syncProxy) = 0;
  *(void *)(v29 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy_xpcConnection) = v26;
  *(void *)&v11[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serverProxy] = v29;
  swift_unknownObjectRetain();
  id v30 = v26;

  uint64_t v31 = (objc_class *)type metadata accessor for ServerClient(0);
  v67.receiver = v11;
  v67.super_class = v31;
  uint64_t v32 = (char *)objc_msgSendSuper2(&v67, sel_init);
  uint64_t v33 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_xpcConnection;
  uint64_t v34 = *(void **)&v32[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_xpcConnection];
  uint64_t v35 = self;
  uint64_t v36 = v32;
  id v37 = v34;
  id v38 = objc_msgSend(v35, sel_interfaceWithProtocol_, &unk_26DE2E4B8);
  objc_msgSend(v37, sel_setRemoteObjectInterface_, v38);

  uint64_t v39 = *(void **)&v32[v33];
  uint64_t v40 = swift_allocObject();
  swift_unknownObjectWeakInit();
  os_log_t v72 = sub_22A5D3E94;
  uint64_t v73 = v40;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v69 = 1107296256;
  uint64_t v70 = sub_22A5CADEC;
  uint64_t v71 = &block_descriptor_144;
  uint64_t v41 = _Block_copy(&aBlock);
  id v42 = v39;
  swift_release();
  objc_msgSend(v42, sel_setInterruptionHandler_, v41);
  _Block_release(v41);

  uint64_t v43 = *(void **)&v32[v33];
  uint64_t v44 = swift_allocObject();
  swift_unknownObjectWeakInit();
  os_log_t v72 = sub_22A5D3E9C;
  uint64_t v73 = v44;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v69 = 1107296256;
  uint64_t v70 = sub_22A5CADEC;
  uint64_t v71 = &block_descriptor_148;
  uint64_t v45 = _Block_copy(&aBlock);
  id v46 = v43;
  swift_release();
  objc_msgSend(v46, sel_setInvalidationHandler_, v45);
  _Block_release(v45);

  int out_token = -1;
  uint64_t v47 = *(void **)&v36[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  uint64_t v48 = swift_allocObject();
  swift_unknownObjectWeakInit();
  os_log_t v72 = sub_22A5D3EA4;
  uint64_t v73 = v48;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v69 = 1107296256;
  uint64_t v70 = sub_22A5CB408;
  uint64_t v71 = &block_descriptor_152;
  os_log_t v49 = _Block_copy(&aBlock);
  uint64_t v50 = v47;
  swift_release();
  uint32_t v51 = notify_register_dispatch("com.apple.system.console_mode_changed", &out_token, v50, v49);
  _Block_release(v49);

  if (v51)
  {
    uint64_t v52 = sub_22A5DA1D0();
    os_log_type_t v53 = sub_22A5DA370();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)uint64_t v54 = 67174913;
      LODWORD(aBlock) = v51;
      sub_22A5DA400();
      *(_WORD *)(v54 + 8) = 1024;
      swift_beginAccess();
      int v65 = out_token;
      sub_22A5DA400();
      uint64_t v55 = "GameMode notifications failed to initialize! Defaulting to off. { result=%{private}u, token=%d }";
LABEL_11:
      _os_log_impl(&dword_22A5B3000, v52, v53, v55, (uint8_t *)v54, 0xEu);
      MEMORY[0x22A6CDBE0](v54, -1, -1);
    }
  }
  else
  {
    BOOL v56 = sub_22A5D0E6C(out_token);
    sub_22A5D1374(v56);
    uint64_t v52 = sub_22A5DA1D0();
    os_log_type_t v53 = sub_22A5DA360();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = swift_slowAlloc();
      *(_DWORD *)uint64_t v54 = 67174913;
      LODWORD(aBlock) = 0;
      sub_22A5DA400();
      *(_WORD *)(v54 + 8) = 1024;
      swift_beginAccess();
      int v65 = out_token;
      sub_22A5DA400();
      uint64_t v55 = "Listening for GameMode notifications. { result=%{private}u, token=%d }";
      goto LABEL_11;
    }
  }

  id v57 = *(id *)&v32[v33];
  objc_msgSend(v57, sel_resume);

  swift_unknownObjectRelease();
  return v36;
}

uint64_t sub_22A5CA1E8(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x22A6CDC50](v1);
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = *(NSObject **)(result + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = sub_22A5D3EFC;
    *(void *)(v6 + 24) = v5;
    aBlock[4] = sub_22A5BDB2C;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22A5B768C;
    aBlock[3] = &block_descriptor_172;
    uint64_t v7 = _Block_copy(aBlock);
    id v8 = v3;
    swift_retain();
    swift_release();
    dispatch_sync(v4, v7);

    _Block_release(v7);
    LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (v4) {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22A5CA36C(char *a1)
{
  uint64_t v1 = sub_22A5DA1D0();
  os_log_type_t v2 = sub_22A5DA390();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_22A5B3000, v1, v2, "Interruption handler: Server exited or crashed.", v3, 2u);
    MEMORY[0x22A6CDBE0](v3, -1, -1);
  }

  uint64_t v4 = (uint64_t *)&a1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_clientReporterStates];
  swift_beginAccess();
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_22A5CA814(v5);
  uint64_t v32 = v4;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_11;
  }
  sub_22A5B6AA4(0x657463656E6E6F63, 0xE900000000000064);
  if (v7)
  {
    uint64_t v8 = swift_bridgeObjectRetain();
    sub_22A5C949C(v8);
    swift_bridgeObjectRelease();
    if (!*(void *)(v6 + 16)) {
      goto LABEL_11;
    }
  }
  else if (!*(void *)(v6 + 16))
  {
    goto LABEL_11;
  }
  unint64_t v9 = sub_22A5B6AA4(0x656E6E6F63736964, 0xEC00000064657463);
  if (v10)
  {
    uint64_t v11 = *(void *)(*(void *)(v6 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_22A5C949C(v11);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
LABEL_11:
  swift_bridgeObjectRelease();
LABEL_12:
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_22A5DA1D0();
  os_log_type_t v13 = sub_22A5DA390();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v34[0] = v15;
    *(_DWORD *)uint64_t v14 = 136446210;
    uint64_t v16 = swift_bridgeObjectRetain();
    uint64_t v17 = MEMORY[0x22A6CD2F0](v16, MEMORY[0x263F8E5C0]);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    sub_22A5D72AC(v17, v19, v34);
    sub_22A5DA400();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22A5B3000, v12, v13, "Reconnecting started reporters. { reporterIDs=%{public}s }", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6CDBE0](v15, -1, -1);
    MEMORY[0x22A6CDBE0](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_bridgeObjectRetain();
  uint64_t v20 = sub_22A5DA1D0();
  os_log_type_t v21 = sub_22A5DA390();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v34[0] = v23;
    *(_DWORD *)uint64_t v22 = 136446210;
    uint64_t v24 = swift_bridgeObjectRetain();
    uint64_t v25 = MEMORY[0x22A6CD2F0](v24, MEMORY[0x263F8E5C0]);
    unint64_t v27 = v26;
    swift_bridgeObjectRelease();
    sub_22A5D72AC(v25, v27, v34);
    sub_22A5DA400();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22A5B3000, v20, v21, "Disconnecting all other reporters. { reporterIDs=%{public}s }", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6CDBE0](v23, -1, -1);
    MEMORY[0x22A6CDBE0](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v28 = a1;
  uint64_t v29 = swift_bridgeObjectRetain();
  uint64_t v30 = sub_22A5D3F14(v29, (uint64_t)v28);
  swift_bridgeObjectRelease();

  uint64_t *v32 = v30;
  return swift_bridgeObjectRelease();
}

uint64_t sub_22A5CA814(uint64_t a1)
{
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(qword_26AD78840);
  uint64_t v60 = *(void *)(v63 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v63);
  uint64_t v59 = (uint64_t)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v62 = (uint64_t *)((char *)&v55 - v5);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (uint64_t *)((char *)&v55 - v7);
  MEMORY[0x270FA5388](v6);
  uint64_t v61 = (char *)&v55 - v9;
  int64_t v10 = 0;
  uint64_t v11 = (void *)MEMORY[0x263F8EE80];
  uint64_t v66 = (void *)MEMORY[0x263F8EE80];
  uint64_t v64 = a1;
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v13 = a1 + 64;
  uint64_t v12 = v14;
  uint64_t v15 = 1 << *(unsigned char *)(v13 - 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & v12;
  uint64_t v57 = v13;
  int64_t v58 = (unint64_t)(v15 + 63) >> 6;
  long long v56 = xmmword_22A5DB310;
  while (1)
  {
    if (v17)
    {
      unint64_t v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      int64_t v65 = v10;
      unint64_t v19 = v18 | (v10 << 6);
    }
    else
    {
      int64_t v20 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_43;
      }
      if (v20 >= v58)
      {
LABEL_40:
        swift_release();
        return (uint64_t)v11;
      }
      unint64_t v21 = *(void *)(v57 + 8 * v20);
      int64_t v22 = v10 + 1;
      if (!v21)
      {
        int64_t v22 = v10 + 2;
        if (v10 + 2 >= v58) {
          goto LABEL_40;
        }
        unint64_t v21 = *(void *)(v57 + 8 * v22);
        if (!v21)
        {
          int64_t v22 = v10 + 3;
          if (v10 + 3 >= v58) {
            goto LABEL_40;
          }
          unint64_t v21 = *(void *)(v57 + 8 * v22);
          if (!v21)
          {
            int64_t v22 = v10 + 4;
            if (v10 + 4 >= v58) {
              goto LABEL_40;
            }
            unint64_t v21 = *(void *)(v57 + 8 * v22);
            if (!v21)
            {
              uint64_t v23 = v10 + 5;
              if (v10 + 5 >= v58) {
                goto LABEL_40;
              }
              unint64_t v21 = *(void *)(v57 + 8 * v23);
              if (!v21)
              {
                while (1)
                {
                  int64_t v22 = v23 + 1;
                  if (__OFADD__(v23, 1)) {
                    goto LABEL_44;
                  }
                  if (v22 >= v58) {
                    goto LABEL_40;
                  }
                  unint64_t v21 = *(void *)(v57 + 8 * v22);
                  ++v23;
                  if (v21) {
                    goto LABEL_21;
                  }
                }
              }
              int64_t v22 = v10 + 5;
            }
          }
        }
      }
LABEL_21:
      unint64_t v17 = (v21 - 1) & v21;
      int64_t v65 = v22;
      unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
    }
    uint64_t v24 = *(void *)(v64 + 56);
    uint64_t v25 = *(void *)(*(void *)(v64 + 48) + 8 * v19);
    uint64_t v26 = v24 + *(void *)(*(void *)(type metadata accessor for ReporterState(0) - 8) + 72) * v19;
    uint64_t v27 = v63;
    uint64_t v28 = v61;
    sub_22A5B6270(v26, (uint64_t)&v61[*(int *)(v63 + 48)], type metadata accessor for ReporterState);
    *uint64_t v28 = v25;
    sub_22A5B56DC((uint64_t)v28, (uint64_t)v8, qword_26AD78840);
    uint64_t v29 = *(int *)(v27 + 48);
    uint64_t v30 = (uint64_t)v62 + v29;
    *uint64_t v62 = *v8;
    sub_22A5B6270((uint64_t)v8 + v29, v30, type metadata accessor for ReporterState);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v31 = type metadata accessor for ReporterState;
      goto LABEL_26;
    }
    type metadata accessor for ActiveReporterState(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v31 = type metadata accessor for ActiveReporterState;
LABEL_26:
      sub_22A5B60C4(v30, v31);
      uint64_t v32 = 0x656E6E6F63736964;
      uint64_t v33 = 0xEC00000064657463;
      goto LABEL_28;
    }
    swift_release();
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
    sub_22A5B60C4(v30 + *(int *)(v34 + 48), type metadata accessor for StartedReporterData);
    uint64_t v33 = 0xE900000000000064;
    uint64_t v32 = 0x657463656E6E6F63;
LABEL_28:
    unint64_t v36 = sub_22A5B6AA4(v32, v33);
    uint64_t v37 = v11[2];
    BOOL v38 = (v35 & 1) == 0;
    uint64_t v39 = v37 + v38;
    if (__OFADD__(v37, v38)) {
      break;
    }
    char v40 = v35;
    if (v11[3] < v39)
    {
      sub_22A5D8620(v39, 1);
      uint64_t v11 = v66;
      unint64_t v41 = sub_22A5B6AA4(v32, v33);
      if ((v40 & 1) != (v42 & 1)) {
        goto LABEL_45;
      }
      unint64_t v36 = v41;
    }
    if (v40)
    {
      swift_bridgeObjectRelease();
      uint64_t v43 = v11[7];
      sub_22A5B56DC((uint64_t)v8, v59, qword_26AD78840);
      unint64_t v44 = *(void *)(v43 + 8 * v36);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v43 + 8 * v36) = v44;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v44 = sub_22A5C127C(0, *(void *)(v44 + 16) + 1, 1, v44);
        *(void *)(v43 + 8 * v36) = v44;
      }
      unint64_t v47 = *(void *)(v44 + 16);
      unint64_t v46 = *(void *)(v44 + 24);
      if (v47 >= v46 >> 1)
      {
        unint64_t v44 = sub_22A5C127C(v46 > 1, v47 + 1, 1, v44);
        *(void *)(v43 + 8 * v36) = v44;
      }
      int64_t v10 = v65;
      *(void *)(v44 + 16) = v47 + 1;
      sub_22A5B56DC(v59, v44+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(void *)(v60 + 72) * v47, qword_26AD78840);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AD787E0);
      unint64_t v48 = (*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
      uint64_t v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = v56;
      sub_22A5B56DC((uint64_t)v8, v49 + v48, qword_26AD78840);
      v11[(v36 >> 6) + 8] |= 1 << v36;
      uint64_t v50 = (uint64_t *)(v11[6] + 16 * v36);
      *uint64_t v50 = v32;
      v50[1] = v33;
      *(void *)(v11[7] + 8 * v36) = v49;
      uint64_t v51 = v11[2];
      BOOL v52 = __OFADD__(v51, 1);
      uint64_t v53 = v51 + 1;
      if (v52) {
        goto LABEL_42;
      }
      v11[2] = v53;
      int64_t v10 = v65;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  uint64_t result = sub_22A5DA520();
  __break(1u);
  return result;
}

uint64_t sub_22A5CADEC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_22A5CAE30(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x22A6CDC50](v1);
  if (!v2) {
    goto LABEL_6;
  }
  uint64_t v3 = (char *)v2;
  uint64_t v4 = sub_22A5DA1D0();
  os_log_type_t v5 = sub_22A5DA360();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_22A5B3000, v4, v5, "Invalidation handler: Connection cannot be formed.", v6, 2u);
    MEMORY[0x22A6CDBE0](v6, -1, -1);
  }

  uint64_t v7 = *(NSObject **)&v3[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v3;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_22A5D3EE4;
  *(void *)(v9 + 24) = v8;
  aBlock[4] = sub_22A5BDB2C;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22A5B768C;
  aBlock[3] = &block_descriptor_162;
  int64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = v3;
  swift_retain();
  swift_release();
  dispatch_sync(v7, v10);

  _Block_release(v10);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v11)
  {
    __break(1u);
LABEL_6:
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_22A5DA1F0();
    __swift_project_value_buffer(v12, (uint64_t)qword_26AD78CF8);
    uint64_t v13 = sub_22A5DA1D0();
    os_log_type_t v14 = sub_22A5DA360();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_22A5B3000, v13, v14, "self nil in invalidationHandler.", v15, 2u);
      MEMORY[0x22A6CDBE0](v15, -1, -1);
    }
  }
}

uint64_t sub_22A5CB0E0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_xpcConnection);
  type metadata accessor for ServerProxy();
  uint64_t v3 = swift_allocObject();
  uint64_t v4 = OBJC_IVAR____TtC14AudioAnalytics11ServerProxy_logger;
  uint64_t v5 = qword_26AD78A40;
  id v6 = v2;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_22A5DA1F0();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_26AD78CF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(v3 + v4, v8, v7);
  *(void *)(v3 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy____lazy_storage___unboostedProxy) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy____lazy_storage___boostedProxy) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy____lazy_storage___syncProxy) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy_xpcConnection) = v6;
  *(void *)(a1 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serverProxy) = v3;
  return swift_release();
}

void sub_22A5CB214(int a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x22A6CDC50](v3);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = sub_22A5DA1D0();
    os_log_type_t v7 = sub_22A5DA360();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 67109120;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v6, v7, "Game mode notification received. { token=%d }", v8, 8u);
      MEMORY[0x22A6CDBE0](v8, -1, -1);
    }

    BOOL v9 = sub_22A5D0E6C(a1);
    sub_22A5D1374(v9);
  }
  else
  {
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_22A5DA1F0();
    __swift_project_value_buffer(v10, (uint64_t)qword_26AD78CF8);
    uint64_t v5 = sub_22A5DA1D0();
    os_log_type_t v11 = sub_22A5DA370();
    if (os_log_type_enabled(v5, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 67109120;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v5, v11, "Game mode notification received, but self is nil. { token=%d }", v12, 8u);
      MEMORY[0x22A6CDBE0](v12, -1, -1);
    }
  }
}

uint64_t sub_22A5CB408(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_22A5CB5D0@<X0>(unsigned int a1@<W1>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_22A5B7BC4(a1);
  *a2 = result;
  return result;
}

uint64_t sub_22A5CB698(uint64_t a1)
{
  uint64_t v3 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_22A5D3D70;
  *(void *)(v5 + 24) = v4;
  v10[4] = sub_22A5BDB2C;
  v10[5] = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_22A5B768C;
  v10[3] = &block_descriptor_138;
  id v6 = _Block_copy(v10);
  os_log_type_t v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5CB7F0(uint64_t a1, uint64_t a2)
{
  return sub_22A5CDE98(a2);
}

uint64_t sub_22A5CB86C(uint64_t a1)
{
  uint64_t v3 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_22A5D3D38;
  *(void *)(v5 + 24) = v4;
  v10[4] = sub_22A5BDB2C;
  v10[5] = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_22A5B768C;
  v10[3] = &block_descriptor_128;
  id v6 = _Block_copy(v10);
  os_log_type_t v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5CB9C4(uint64_t a1, uint64_t a2)
{
  return sub_22A5CE300(a2);
}

uint64_t sub_22A5CBA40@<X0>(uint64_t a1@<X1>, __int16 *a2@<X8>)
{
  uint64_t v25 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ReporterState(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  BOOL v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  os_log_type_t v11 = (char *)&v23 - v10;
  uint64_t v12 = sub_22A5DA1D0();
  os_log_type_t v13 = sub_22A5DA360();
  if (os_log_type_enabled(v12, v13))
  {
    os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = v9;
    uint64_t v15 = a1;
    uint64_t v16 = v14;
    *(_DWORD *)os_log_type_t v14 = 134217984;
    uint64_t v26 = v15;
    sub_22A5DA400();
    _os_log_impl(&dword_22A5B3000, v12, v13, "Get serviceType. { reporterID=%lld }", v16, 0xCu);
    unint64_t v17 = v16;
    a1 = v15;
    BOOL v9 = v24;
    MEMORY[0x22A6CDBE0](v17, -1, -1);
  }

  sub_22A5B83B8(a1, 0xD00000000000001BLL, 0x800000022A5DD800, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    uint64_t result = sub_22A5B5680((uint64_t)v4, &qword_26AD78A18);
    __int16 v19 = -1;
  }
  else
  {
    sub_22A5B605C((uint64_t)v4, (uint64_t)v11, type metadata accessor for ReporterState);
    sub_22A5B605C((uint64_t)v11, (uint64_t)v9, type metadata accessor for ReporterState);
    if (swift_getEnumCaseMultiPayload())
    {
      type metadata accessor for ActiveReporterState(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v21 = *(void *)v9;
      if (EnumCaseMultiPayload != 1)
      {
        uint64_t v22 = (uint64_t)&v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48)];
        __int16 v19 = *(_WORD *)(v21 + 24);
        swift_release();
        uint64_t result = sub_22A5B60C4(v22, type metadata accessor for StartedReporterData);
        goto LABEL_11;
      }
      __int16 v19 = *(_WORD *)(v21 + 24);
    }
    else
    {
      __int16 v19 = *(_WORD *)(*(void *)v9 + 24);
    }
    uint64_t result = swift_release();
  }
LABEL_11:
  __int16 *v25 = v19;
  return result;
}

uint64_t sub_22A5CBDD0(__int16 a1, uint64_t a2)
{
  uint64_t v5 = *(NSObject **)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  *(_WORD *)(v6 + 24) = a1;
  *(void *)(v6 + 32) = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_22A5D3CC0;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_22A5BDB2C;
  v12[5] = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_22A5B768C;
  v12[3] = &block_descriptor_118;
  uint64_t v8 = _Block_copy(v12);
  BOOL v9 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5CBF34(uint64_t a1, int a2, uint64_t a3)
{
  return sub_22A5CF558(a2, a3);
}

unint64_t sub_22A5CBFBC@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ReporterState(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v27 = (uint64_t)&v25 - v11;
  uint64_t v12 = sub_22A5DA1D0();
  os_log_type_t v13 = sub_22A5DA360();
  if (os_log_type_enabled(v12, v13))
  {
    os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = a2;
    uint64_t v15 = v14;
    *(_DWORD *)os_log_type_t v14 = 134217984;
    uint64_t v28 = v29;
    sub_22A5DA400();
    _os_log_impl(&dword_22A5B3000, v12, v13, "Get configuration. { reporterID=%lld }", v15, 0xCu);
    a2 = v26;
    MEMORY[0x22A6CDBE0](v15, -1, -1);
  }

  sub_22A5B83B8(v29, 0xD00000000000001DLL, 0x800000022A5DD7E0, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_22A5B5680((uint64_t)v5, &qword_26AD78A18);
    unint64_t result = sub_22A5D49E8(MEMORY[0x263F8EE78]);
    uint64_t v17 = result;
  }
  else
  {
    uint64_t v18 = (uint64_t)v5;
    uint64_t v19 = v27;
    sub_22A5B605C(v18, v27, type metadata accessor for ReporterState);
    sub_22A5B6270(v19, (uint64_t)v10, type metadata accessor for ReporterState);
    if (swift_getEnumCaseMultiPayload()
      && (type metadata accessor for ActiveReporterState(0), swift_getEnumCaseMultiPayload() != 1))
    {
      uint64_t v23 = &v10[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48)];
      swift_beginAccess();
      uint64_t v24 = swift_bridgeObjectRetain();
      uint64_t v17 = sub_22A5B9994(v24);
      swift_release();
      swift_bridgeObjectRelease();
      sub_22A5B60C4(v19, type metadata accessor for ReporterState);
      uint64_t v21 = type metadata accessor for StartedReporterData;
      uint64_t v22 = (uint64_t)v23;
    }
    else
    {
      swift_beginAccess();
      uint64_t v20 = swift_bridgeObjectRetain();
      uint64_t v17 = sub_22A5B9994(v20);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v21 = type metadata accessor for ReporterState;
      uint64_t v22 = v19;
    }
    unint64_t result = sub_22A5B60C4(v22, v21);
  }
  *a2 = v17;
  return result;
}

uint64_t sub_22A5CC474(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(NSObject **)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_22A5B8720;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_22A5BDB2C;
  v12[5] = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_22A5B768C;
  v12[3] = &block_descriptor_108;
  uint64_t v8 = _Block_copy(v12);
  uint64_t v9 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5CC668(uint64_t a1, uint64_t a2, int a3, __int16 a4)
{
  uint64_t v9 = *(NSObject **)&v4[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v4;
  *(void *)(v10 + 24) = a1;
  *(void *)(v10 + 32) = a2;
  *(_DWORD *)(v10 + 40) = a3;
  *(_WORD *)(v10 + 44) = a4;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_22A5D3C24;
  *(void *)(v11 + 24) = v10;
  v16[4] = sub_22A5BDB2C;
  v16[5] = v11;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = sub_22A5B768C;
  v16[3] = &block_descriptor_98;
  uint64_t v12 = _Block_copy(v16);
  os_log_type_t v13 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v9, v12);
  _Block_release(v12);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

void sub_22A5CC7E8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
}

uint64_t sub_22A5CC8B8(uint64_t a1, int a2, __int16 a3)
{
  uint64_t v7 = *(NSObject **)&v3[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v3;
  *(void *)(v8 + 24) = a1;
  *(_DWORD *)(v8 + 32) = a2;
  *(_WORD *)(v8 + 36) = a3;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_22A5D3B98;
  *(void *)(v9 + 24) = v8;
  v14[4] = sub_22A5BDB2C;
  void v14[5] = v9;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_22A5B768C;
  v14[3] = &block_descriptor_88;
  uint64_t v10 = _Block_copy(v14);
  uint64_t v11 = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v7, v10);
  _Block_release(v10);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

void sub_22A5CCA30(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
}

uint64_t sub_22A5CCAFC(uint64_t a1)
{
  uint64_t v3 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = a1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_22A5D3B58;
  *(void *)(v5 + 24) = v4;
  v10[4] = sub_22A5BDB2C;
  v10[5] = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_22A5B768C;
  v10[3] = &block_descriptor_78_0;
  uint64_t v6 = _Block_copy(v10);
  uint64_t v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5CCC54(uint64_t a1, uint64_t a2)
{
  return sub_22A5D0230(a2);
}

uint64_t sub_22A5CCCD0(uint64_t a1, int a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *(NSObject **)&v5[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v5;
  *(void *)(v12 + 24) = a1;
  *(void *)(v12 + 32) = a4;
  *(void *)(v12 + 40) = a5;
  *(_DWORD *)(v12 + 48) = a2;
  *(_WORD *)(v12 + 52) = a3;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_22A5BAB80;
  *(void *)(v13 + 24) = v12;
  v18[4] = sub_22A5B7684;
  void v18[5] = v13;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 1107296256;
  v18[2] = sub_22A5B768C;
  v18[3] = &block_descriptor_68;
  os_log_type_t v14 = _Block_copy(v18);
  uint64_t v15 = v5;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v11, v14);
  _Block_release(v14);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5CCE54(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5, int a6)
{
  int v33 = a6;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ReporterState(0);
  uint64_t v32 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_22A5DA1D0();
  os_log_type_t v17 = sub_22A5DA360();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = v12;
    uint64_t v19 = v15;
    uint64_t v20 = v18;
    *(_DWORD *)uint64_t v18 = 134217984;
    aBlock[0] = a2;
    sub_22A5DA400();
    _os_log_impl(&dword_22A5B3000, v16, v17, "Requesting message. { reporterID=%lld }", v20, 0xCu);
    uint64_t v21 = v20;
    uint64_t v15 = v19;
    uint64_t v12 = v31;
    MEMORY[0x22A6CDBE0](v21, -1, -1);
  }

  if (qword_26AD78A38 != -1) {
    swift_once();
  }
  if (qword_26AD78CB0 == a2)
  {
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_22A5DA1F0();
    __swift_project_value_buffer(v22, (uint64_t)qword_26AD78CF8);
    uint64_t v23 = sub_22A5DA1D0();
    os_log_type_t v24 = sub_22A5DA360();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 134217984;
      aBlock[0] = a2;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v23, v24, "requestMessage called with invalidID. { reporterID=%lld }", v25, 0xCu);
      MEMORY[0x22A6CDBE0](v25, -1, -1);
    }

    return a3(0);
  }
  else
  {
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = a2;
    *(_DWORD *)(v27 + 24) = a5;
    *(_WORD *)(v27 + 28) = v33;
    *(void *)(v27 + 32) = a3;
    *(void *)(v27 + 40) = a4;
    swift_retain();
    sub_22A5B83B8(a2, 0xD000000000000032, 0x800000022A5DD770, (uint64_t)v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v12, 1, v13) == 1)
    {
      sub_22A5CD74C(a2, (uint64_t)v15);
      sub_22A5B5680((uint64_t)v12, &qword_26AD78A18);
    }
    else
    {
      sub_22A5B605C((uint64_t)v12, (uint64_t)v15, type metadata accessor for ReporterState);
    }
    uint64_t v28 = (void *)sub_22A5CDC58((uint64_t)v15, 1);
    aBlock[4] = sub_22A5D3AF4;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22A5CD958;
    aBlock[3] = &block_descriptor_59;
    uint64_t v29 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v28, sel_requestMessageFor_category_type_reply_, a2, a5, (unsigned __int16)v33, v29);
    _Block_release(v29);
    swift_release();
    swift_unknownObjectRelease();
    return sub_22A5B60C4((uint64_t)v15, type metadata accessor for ReporterState);
  }
}

void sub_22A5CD318(void *a1, uint64_t a2, uint64_t a3, int a4, unsigned __int16 a5, void (*a6)(void *))
{
  if (a1)
  {
    id v7 = a1;
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_22A5DA1F0();
    __swift_project_value_buffer(v8, (uint64_t)qword_26AD78CF8);
    id v9 = a1;
    id v10 = a1;
    oslog = sub_22A5DA1D0();
    os_log_type_t v11 = sub_22A5DA360();
    if (os_log_type_enabled(oslog, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v31 = v13;
      *(_DWORD *)uint64_t v12 = 136380931;
      swift_getErrorValue();
      uint64_t v14 = sub_22A5DA530();
      sub_22A5D72AC(v14, v15, &v31);
      sub_22A5DA400();
      swift_bridgeObjectRelease();

      *(_WORD *)(v12 + 12) = 2048;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, oslog, v11, "Error in requestMessage. { error=%{private}s, reporterID=%lld }", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v13, -1, -1);
      MEMORY[0x22A6CDBE0](v12, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_22A5DA1F0();
    __swift_project_value_buffer(v20, (uint64_t)qword_26AD78CF8);
    uint64_t v21 = sub_22A5DA1D0();
    os_log_type_t v22 = sub_22A5DA370();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v31 = v24;
      *(_DWORD *)uint64_t v23 = 134218498;
      sub_22A5DA400();
      *(_WORD *)(v23 + 12) = 2080;
      uint64_t v25 = AudioEventCategory.description.getter(a4);
      sub_22A5D72AC(v25, v26, &v31);
      sub_22A5DA400();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 22) = 2082;
      unint64_t v27 = AudioEventType.description.getter(a5);
      sub_22A5D72AC(v27, v28, &v31);
      sub_22A5DA400();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, v21, v22, "requestMessage received message. Invoking callback. { reporterID=%lld, category=%s, type=%{public}s }", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v24, -1, -1);
      MEMORY[0x22A6CDBE0](v23, -1, -1);
    }

    if (a2) {
      uint64_t v29 = (void *)sub_22A5DA280();
    }
    else {
      uint64_t v29 = 0;
    }
    a6(v29);
  }
}

uint64_t sub_22A5CD74C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t active = type metadata accessor for ActiveReporterState(0);
  MEMORY[0x270FA5388](active);
  uint64_t v6 = (uint64_t *)((char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = type metadata accessor for StartedReporterData(0);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A5DA190();
  *(_DWORD *)&v10[*(int *)(v8 + 28)] = 0;
  uint64_t v11 = (uint64_t)v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
  type metadata accessor for ReporterData();
  uint64_t v12 = swift_allocObject();
  *(_WORD *)(v12 + 24) = -1;
  *(void *)(v12 + 32) = sub_22A5B7520(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A30);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_22A5DB310;
  *(_DWORD *)(v13 + 32) = getpid();
  type metadata accessor for PerfCheck();
  swift_allocObject();
  *(void *)(v12 + 40) = sub_22A5B7700(v13);
  *(void *)(v12 + 16) = a1;
  *uint64_t v6 = v12;
  sub_22A5B605C((uint64_t)v10, v11, type metadata accessor for StartedReporterData);
  swift_storeEnumTagMultiPayload();
  sub_22A5B605C((uint64_t)v6, a2, type metadata accessor for ActiveReporterState);
  type metadata accessor for ReporterState(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22A5CD958(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3) {
    uint64_t v5 = sub_22A5DA2A0();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a2;
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_22A5CDAB4()
{
  uint64_t v1 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache);
  if (!v2) {
    return;
  }
  uint64_t v3 = v0;
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
    swift_retain();
LABEL_12:
    *(void *)(v3 + v1) = 0;
    swift_release();
    swift_release();
    return;
  }
  uint64_t v6 = v4 + 32;
  swift_retain();
  swift_bridgeObjectRetain();
  do
  {
    sub_22A5C0FA0(v6, (uint64_t)v15);
    __swift_project_boxed_opaque_existential_1(v15, v16);
    sub_22A5D5798();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    v6 += 40;
    --v5;
  }
  while (v5);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = v7 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_22A5C0FA0(v9, (uint64_t)v15);
    id v10 = __swift_project_boxed_opaque_existential_1(v15, v16);
    uint64_t v11 = *v10;
    uint64_t v12 = *v10 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters;
    swift_beginAccess();
    if (*(void *)(*(void *)v12 + 16)) {
      break;
    }
    uint64_t v13 = v11 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messageCache;
    swift_beginAccess();
    uint64_t v14 = *(void *)(*(void *)v13 + 16);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    if (v14) {
      goto LABEL_14;
    }
    v9 += 40;
    if (!--v8)
    {
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
LABEL_14:
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_22A5CDC58(uint64_t a1, char a2)
{
  uint64_t v5 = type metadata accessor for ReporterState(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22A5B6270(a1, (uint64_t)v7, type metadata accessor for ReporterState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    uint64_t v10 = *v7;
    goto LABEL_6;
  }
  if (EnumCaseMultiPayload == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    int v9 = swift_getEnumCaseMultiPayload();
    uint64_t v10 = *v7;
    if (v9 != 1)
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
      sub_22A5B60C4((uint64_t)v7 + *(int *)(v11 + 48), type metadata accessor for StartedReporterData);
    }
LABEL_6:
    uint64_t v12 = *(void *)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_injectedServerProtocol);
    if (v12)
    {
      swift_unknownObjectRetain();
LABEL_21:
      swift_release();
      return v12;
    }
    if (a2 == 3)
    {
      int v14 = *(unsigned __int16 *)(v10 + 24);
      swift_release();
      if (v14 == 11) {
        goto LABEL_19;
      }
    }
    else
    {
      swift_release();
      if (a2)
      {
        if (a2 != 1)
        {
LABEL_19:
          swift_retain();
          uint64_t v15 = sub_22A5D4378();
          goto LABEL_20;
        }
        swift_retain();
        uint64_t v15 = sub_22A5D42A0();
LABEL_20:
        uint64_t v12 = v15;
        goto LABEL_21;
      }
    }
    swift_retain();
    uint64_t v15 = sub_22A5D428C();
    goto LABEL_20;
  }
  uint64_t v13 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache;
  if (*(void *)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache))
  {
    uint64_t v12 = *(void *)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache);
  }
  else
  {
    type metadata accessor for MessageCache();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_22A5C00A0();
    *(void *)(v2 + v13) = v12;
    swift_retain();
    swift_release();
  }
  swift_retain();
  sub_22A5B60C4((uint64_t)v7, type metadata accessor for ReporterState);
  return v12;
}

uint64_t sub_22A5CDE98(uint64_t a1)
{
  uint64_t v2 = v1;
  v24[0] = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (uint64_t *)((char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v24 - v7;
  uint64_t v9 = type metadata accessor for ReporterState(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22A5DA260();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (uint64_t *)((char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = *(void **)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *uint64_t v16 = v17;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F8F0E0], v13);
  id v18 = v17;
  LOBYTE(v17) = sub_22A5DA270();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v14 + 8))(v16, v13);
  if (v17)
  {
    uint64_t v20 = sub_22A5DA1D0();
    os_log_type_t v21 = sub_22A5DA360();
    if (os_log_type_enabled(v20, v21))
    {
      os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v22 = 134217984;
      v24[1] = v24[0];
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v20, v21, "Starting reporter. { reporterID=%lld }", v22, 0xCu);
      MEMORY[0x22A6CDBE0](v22, -1, -1);
    }

    uint64_t v23 = v24[0];
    sub_22A5B83B8(v24[0], 0xD000000000000019, 0x800000022A5DD720, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      return sub_22A5B5680((uint64_t)v8, &qword_26AD78A18);
    }
    else
    {
      sub_22A5B605C((uint64_t)v8, (uint64_t)v12, type metadata accessor for ReporterState);
      sub_22A5C759C((uint64_t)v12, v6);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
      swift_beginAccess();
      sub_22A5B72B8((uint64_t)v6, v23);
      swift_endAccess();
      return sub_22A5B60C4((uint64_t)v12, type metadata accessor for ReporterState);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5CE250(uint64_t a1)
{
  uint64_t result = AudioAnalyticsTraceWrapperPost(4612);
  if (*(void *)(a1 + 40))
  {
    swift_retain();
    unint64_t v3 = sub_22A5B7520(MEMORY[0x263F8EE78]);
    sub_22A5B4D0C(v3, *(_WORD *)(a1 + 24));
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
    if (*(void *)(a1 + 40))
    {
      swift_retain();
      sub_22A5C1EB4();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_22A5CE300(uint64_t a1)
{
  uint64_t v2 = v1;
  v25[0] = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (uint64_t *)((char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v25 - v7;
  uint64_t v9 = type metadata accessor for ReporterState(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22A5DA260();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (uint64_t *)((char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = *(void **)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  *uint64_t v16 = v17;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F8F0E0], v13);
  id v18 = v17;
  LOBYTE(v17) = sub_22A5DA270();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v14 + 8))(v16, v13);
  if (v17)
  {
    uint64_t v20 = sub_22A5DA1D0();
    os_log_type_t v21 = sub_22A5DA360();
    if (os_log_type_enabled(v20, v21))
    {
      os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v22 = 134217984;
      v25[1] = v25[0];
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v20, v21, "Stopping reporter. { reporterID=%lld }", v22, 0xCu);
      MEMORY[0x22A6CDBE0](v22, -1, -1);
    }

    uint64_t v23 = v25[0];
    sub_22A5B83B8(v25[0], 0xD000000000000018, 0x800000022A5DD6E0, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      return sub_22A5B5680((uint64_t)v8, &qword_26AD78A18);
    }
    else
    {
      sub_22A5B605C((uint64_t)v8, (uint64_t)v12, type metadata accessor for ReporterState);
      uint64_t v24 = v2;
      sub_22A5C7A5C((uint64_t)v12, (uint64_t)v24, (uint64_t)v24, v23, v6);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
      swift_beginAccess();
      sub_22A5B72B8((uint64_t)v6, v23);
      swift_endAccess();
      return sub_22A5B60C4((uint64_t)v12, type metadata accessor for ReporterState);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5CE6C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  AudioAnalyticsTraceWrapperPost(4616);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78950);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22A5DB310;
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x800000022A5DD700;
  sub_22A5DA170();
  *(void *)(inited + 72) = MEMORY[0x263F8D538];
  *(double *)(inited + 48) = -v8;
  unint64_t v9 = sub_22A5B7520(inited);
  int v10 = *(_DWORD *)(a2 + *(int *)(type metadata accessor for StartedReporterData(0) + 20));
  if (v10)
  {
    uint64_t v23 = MEMORY[0x263F8E8F8];
    LODWORD(v22[0]) = v10;
    sub_22A5B5AEC(v22, v21);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_22A5B4E54(v21, 0xD000000000000014, 0x800000022A5DD2D0, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  sub_22A5CE9F0(a4, 0, v9, 1u, 0, 0);
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40))
  {
    swift_retain();
    unint64_t v13 = sub_22A5C2EA4();
    swift_release();
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_22A5DA1D0();
    os_log_type_t v15 = sub_22A5DA360();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)uint64_t v16 = 134218243;
      *(void *)&v21[0] = a4;
      sub_22A5DA400();
      *(_WORD *)(v16 + 12) = 2081;
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_22A5DA2B0();
      unint64_t v20 = v19;
      swift_bridgeObjectRelease();
      *(void *)&v21[0] = sub_22A5D72AC(v18, v20, v22);
      sub_22A5DA400();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, v14, v15, "Gathered performance metrics. { reporterID=%lld, perfMetrics=%{private}s }", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v17, -1, -1);
      MEMORY[0x22A6CDBE0](v16, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_22A5CE9F0(a4, 0, v13, 0xDu, 0, 0);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_22A5CE9F0(uint64_t a1, int a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  int v54 = a6;
  int v55 = a5;
  unsigned int v56 = a4;
  uint64_t v53 = a3;
  int v52 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v48 = (uint64_t)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = type metadata accessor for ReporterState(0);
  uint64_t v47 = *(void *)(v49 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v49);
  uint64_t v50 = (uint64_t)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v51 = (char *)&v46 - v12;
  uint64_t v13 = sub_22A5DA1B0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_22A5DA260();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  unint64_t v20 = (uint64_t *)((char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  os_log_type_t v21 = *(void **)(v6 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *unint64_t v20 = v21;
  (*(void (**)(void *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x263F8F0E0], v17);
  id v22 = v21;
  unsigned __int16 v23 = sub_22A5DA270();
  (*(void (**)(void *, uint64_t))(v18 + 8))(v20, v17);
  if ((v23 & 1) == 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  unsigned __int16 v23 = v55;
  if (v52)
  {
    if (qword_26AD78A38 == -1)
    {
LABEL_4:
      a1 = qword_26AD78CB0;
      goto LABEL_5;
    }
LABEL_29:
    swift_once();
    goto LABEL_4;
  }
LABEL_5:
  sub_22A5DA1A0();
  sub_22A5DA180();
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78950);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22A5DB310;
  *(void *)(inited + 32) = 0xD000000000000015;
  *(void *)(inited + 40) = 0x800000022A5DD640;
  *(void *)(inited + 72) = MEMORY[0x263F8D538];
  *(void *)(inited + 48) = v25;
  uint64_t v27 = v53;
  swift_bridgeObjectRetain();
  unint64_t v28 = sub_22A5B7520(inited);
  uint64_t v29 = sub_22A5CF2B8(v28, v27);
  uint64_t v30 = v56;
  sub_22A5D0FB8(a1, v29, v56, v23);
  AudioAnalyticsTraceWrapperPost(4624);
  if (v54 & 1) == 0 || (sub_22A5C7368(1u))
  {
    uint64_t v31 = (uint64_t)v51;
    if (v30 == 7 && v23 == 6)
    {
      if (qword_26837CEC0 != -1) {
        swift_once();
      }
      if (byte_26837D7D1 == 1)
      {
        uint64_t v32 = (void *)sub_22A5DA2C0();
        uint64_t v33 = swift_allocObject();
        *(void *)(v33 + 16) = v29;
        aBlock[4] = sub_22A5D3A2C;
        aBlock[5] = v33;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_22A5CF344;
        aBlock[3] = &block_descriptor_2;
        uint64_t v34 = _Block_copy(aBlock);
        swift_release();
        AnalyticsSendEventLazy();
        _Block_release(v34);

        return;
      }
    }
    uint64_t v35 = v48;
    sub_22A5B83B8(a1, 0xD00000000000003FLL, 0x800000022A5DD660, v48);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v35, 1, v49) == 1)
    {
      sub_22A5CF3E0(a1, v31);
      sub_22A5B5680(v35, &qword_26AD78A18);
    }
    else
    {
      sub_22A5B605C(v35, v31, type metadata accessor for ReporterState);
    }
    uint64_t v36 = v50;
    sub_22A5B6270(v31, v50, type metadata accessor for ReporterState);
    if (!swift_getEnumCaseMultiPayload())
    {
      swift_bridgeObjectRelease();
      swift_release();
      char v42 = sub_22A5DA1D0();
      os_log_type_t v43 = sub_22A5DA360();
      if (os_log_type_enabled(v42, v43))
      {
        unint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v44 = 134217984;
        aBlock[0] = a1;
        sub_22A5DA400();
        _os_log_impl(&dword_22A5B3000, v42, v43, "Reporter disconnected. { function=sendMessage, reporterID=%lld }", v44, 0xCu);
        MEMORY[0x22A6CDBE0](v44, -1, -1);
      }

      goto LABEL_33;
    }
    sub_22A5B60C4(v36, type metadata accessor for ReporterState);
    if (qword_26AD78A58 == -1)
    {
      if (v30 != 7) {
        goto LABEL_31;
      }
    }
    else
    {
      swift_once();
      if (v30 != 7) {
        goto LABEL_31;
      }
    }
    if (byte_26AD78CD8 && v23 == 6)
    {
      uint64_t v37 = (void *)sub_22A5CDC58(v31, 1);
      BOOL v38 = (void *)sub_22A5DA280();
      swift_bridgeObjectRelease();
      objc_msgSend(v37, sel_sendWithMessage_with_and_for_, v38, 7, 6, a1);
LABEL_32:
      swift_unknownObjectRelease();

LABEL_33:
      sub_22A5B60C4(v31, type metadata accessor for ReporterState);
      return;
    }
LABEL_31:
    uint64_t v45 = (void *)sub_22A5CDC58(v31, 3);
    BOOL v38 = (void *)sub_22A5DA280();
    swift_bridgeObjectRelease();
    objc_msgSend(v45, sel_sendWithMessage_with_and_for_, v38, v30, v23, a1);
    goto LABEL_32;
  }
  swift_bridgeObjectRelease();
  uint64_t v39 = sub_22A5DA1D0();
  os_log_type_t v40 = sub_22A5DA370();
  if (os_log_type_enabled(v39, v40))
  {
    unint64_t v41 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v41 = 134217984;
    aBlock[0] = a1;
    sub_22A5DA400();
    _os_log_impl(&dword_22A5B3000, v39, v40, "Message send exceeds rate-limit threshold and will be dropped. { reporterID=%lld, rateLimit=32hz }", v41, 0xCu);
    MEMORY[0x22A6CDBE0](v41, -1, -1);
  }

  sub_22A5D0748(a1);
}

uint64_t sub_22A5CF2B8(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_22A5B4FA8(a1, (uint64_t)sub_22A5B55D0, 0, isUniquelyReferenced_nonNull_native, (uint64_t)&v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

id sub_22A5CF344(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_22A5BDA2C(0, &qword_26837CF48);
    uint64_t v4 = (void *)sub_22A5DA280();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_22A5CF3E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t active = type metadata accessor for ActiveReporterState(0);
  MEMORY[0x270FA5388](active);
  uint64_t v6 = (uint64_t *)((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ReporterData();
  uint64_t v7 = swift_allocObject();
  *(_WORD *)(v7 + 24) = -1;
  *(void *)(v7 + 32) = sub_22A5B7520(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A30);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_22A5DB310;
  *(_DWORD *)(v8 + 32) = getpid();
  type metadata accessor for PerfCheck();
  swift_allocObject();
  *(void *)(v7 + 40) = sub_22A5B7700(v8);
  *(void *)(v7 + 16) = a1;
  *uint64_t v6 = v7;
  swift_storeEnumTagMultiPayload();
  sub_22A5B605C((uint64_t)v6, a2, type metadata accessor for ActiveReporterState);
  type metadata accessor for ReporterState(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22A5CF558(int a1, uint64_t a2)
{
  uint64_t v3 = v2;
  int v51 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (uint64_t (*)(void))type metadata accessor for ReporterState(0);
  uint64_t v9 = *((void *)v8 - 1);
  uint64_t v49 = v8;
  uint64_t v50 = v9;
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v47 = (uint64_t)&v44 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v48 = (uint64_t)&v44 - v14;
  uint64_t v15 = sub_22A5DA260();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (uint64_t *)((char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = *(void **)&v3[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  void *v18 = v19;
  (*(void (**)(void *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x263F8F0E0], v15);
  id v20 = v19;
  char v21 = sub_22A5DA270();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v16 + 8))(v18, v15);
  if (v21)
  {
    unsigned __int16 v23 = sub_22A5DA1D0();
    os_log_type_t v24 = sub_22A5DA360();
    BOOL v25 = os_log_type_enabled(v23, v24);
    uint64_t v46 = (uint64_t)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v25)
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v45 = v3;
      uint64_t v27 = v26;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v52 = a2;
      uint64_t v53 = v28;
      *(_DWORD *)uint64_t v27 = 134218242;
      sub_22A5DA400();
      *(_WORD *)(v27 + 12) = 2082;
      unint64_t v29 = AudioServiceType.description.getter(v51);
      uint64_t v52 = sub_22A5D72AC(v29, v30, &v53);
      sub_22A5DA400();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, v23, v24, "Set serviceType. { reporterID=%lld, serviceType=%{public}s }", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v28, -1, -1);
      uint64_t v31 = v27;
      uint64_t v3 = v45;
      MEMORY[0x22A6CDBE0](v31, -1, -1);
    }

    sub_22A5B83B8(a2, 0xD000000000000024, 0x800000022A5DD5C0, (uint64_t)v7);
    uint64_t v32 = v50;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t (*)(uint64_t)))(v50 + 48))(v7, 1, v49) == 1)
    {
      return sub_22A5B5680((uint64_t)v7, &qword_26AD78A18);
    }
    else
    {
      uint64_t v33 = (uint64_t)v7;
      uint64_t v34 = v48;
      sub_22A5B605C(v33, v48, type metadata accessor for ReporterState);
      uint64_t v35 = v47;
      sub_22A5B6270(v34, v47, type metadata accessor for ReporterState);
      if (swift_getEnumCaseMultiPayload())
      {
        uint64_t v36 = a2;
        uint64_t v49 = type metadata accessor for ReporterState;
        sub_22A5B60C4(v35, type metadata accessor for ReporterState);
        uint64_t v37 = v46;
        sub_22A5B6270(v34, v46, type metadata accessor for ReporterState);
        unint64_t v38 = (*(unsigned __int8 *)(v32 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
        uint64_t v39 = swift_allocObject();
        __int16 v40 = v51;
        *(_WORD *)(v39 + 16) = v51;
        *(void *)(v39 + 24) = v3;
        *(void *)(v39 + 32) = v36;
        sub_22A5B605C(v37, v39 + v38, type metadata accessor for ReporterState);
        sub_22A5B6270(v34, v37, type metadata accessor for ReporterState);
        uint64_t v41 = swift_allocObject();
        *(_WORD *)(v41 + 16) = v40;
        *(void *)(v41 + 24) = v3;
        *(void *)(v41 + 32) = v36;
        sub_22A5B605C(v37, v41 + v38, type metadata accessor for ReporterState);
        char v42 = v3;
        sub_22A5C8574(v34, (void (*)(uint64_t))sub_22A5D37E4, v39, (void (*)(void))sub_22A5D3950);
        sub_22A5B60C4(v34, v49);
        swift_release();
      }
      else
      {
        swift_release();
        uint64_t v43 = sub_22A5CFAE0();
        sub_22A5B60C4(v34, type metadata accessor for ReporterState);
        *(_WORD *)(v43 + 24) = v51;
      }
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5CFAE0()
{
  uint64_t v1 = v0;
  uint64_t active = type metadata accessor for ActiveReporterState(0);
  uint64_t v3 = MEMORY[0x270FA5388](active);
  uint64_t v5 = (uint64_t *)((char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (uint64_t *)((char *)&v25 - v10);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v25 - v12;
  uint64_t v14 = type metadata accessor for ReporterState(0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A5B6270(v1, (uint64_t)v16, type metadata accessor for ReporterState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload) {
    return *(void *)v16;
  }
  if (EnumCaseMultiPayload == 1)
  {
    sub_22A5B605C((uint64_t)v16, (uint64_t)v13, type metadata accessor for ActiveReporterState);
    sub_22A5B6270((uint64_t)v13, (uint64_t)v11, type metadata accessor for ActiveReporterState);
    int v18 = swift_getEnumCaseMultiPayload();
    uint64_t v19 = *v11;
    if (v18 != 1)
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
      sub_22A5B60C4((uint64_t)v11 + *(int *)(v20 + 48), type metadata accessor for StartedReporterData);
    }
    uint64_t v21 = (uint64_t)v13;
  }
  else
  {
    sub_22A5B605C((uint64_t)v16, (uint64_t)v8, type metadata accessor for ActiveReporterState);
    sub_22A5B6270((uint64_t)v8, (uint64_t)v5, type metadata accessor for ActiveReporterState);
    int v22 = swift_getEnumCaseMultiPayload();
    uint64_t v19 = *v5;
    if (v22 != 1)
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
      sub_22A5B60C4((uint64_t)v5 + *(int *)(v23 + 48), type metadata accessor for StartedReporterData);
    }
    uint64_t v21 = (uint64_t)v8;
  }
  sub_22A5B60C4(v21, type metadata accessor for ActiveReporterState);
  return v19;
}

uint64_t sub_22A5CFD80(uint64_t result, unsigned __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned __int16 *)(result + 24) != a2)
  {
    uint64_t v7 = result;
    uint64_t v8 = sub_22A5DA1D0();
    os_log_type_t v9 = sub_22A5DA360();
    uint64_t v10 = "ry";
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 134217984;
      uint64_t v24 = a4;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v8, v9, "Stopping session while reconfiguring serviceType. { reporterID=%lld }", v11, 0xCu);
      MEMORY[0x22A6CDBE0](v11, -1, -1);
    }

    sub_22A5CE300(a4);
    swift_retain_n();
    uint64_t v12 = sub_22A5DA1D0();
    os_log_type_t v13 = sub_22A5DA360();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v24 = v22;
      *(_DWORD *)uint64_t v14 = 134218498;
      sub_22A5DA400();
      *(_WORD *)(v14 + 12) = 2080;
      unint64_t v15 = AudioServiceType.description.getter(*(_WORD *)(v7 + 24));
      sub_22A5D72AC(v15, v16, &v24);
      sub_22A5DA400();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 22) = 2080;
      unint64_t v17 = AudioServiceType.description.getter(a2);
      sub_22A5D72AC(v17, v18, &v24);
      sub_22A5DA400();
      uint64_t v10 = "AudioEventCategory" + 16;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, v12, v13, "Setting new serviceType. { reporterID=%lld, oldServiceType=%s, newServiceType=%s) }", (uint8_t *)v14, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v22, -1, -1);
      MEMORY[0x22A6CDBE0](v14, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    objc_msgSend((id)sub_22A5CDC58(a5, 3), sel_setWithServiceType_for_, a2, a4);
    swift_unknownObjectRelease();
    *(_WORD *)(v7 + 24) = a2;
    uint64_t v19 = sub_22A5DA1D0();
    os_log_type_t v20 = sub_22A5DA360();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = *((void *)v10 + 44);
      uint64_t v24 = a4;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v19, v20, "Restarting session after reconfiguring serviceType. { reporterID=%lld }", v21, 0xCu);
      MEMORY[0x22A6CDBE0](v21, -1, -1);
    }

    return sub_22A5CDE98(a4);
  }
  return result;
}

uint64_t sub_22A5D00F8(uint64_t result, unsigned __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned __int16 *)(result + 24) != a2)
  {
    uint64_t v8 = result;
    os_log_type_t v9 = sub_22A5DA1D0();
    os_log_type_t v10 = sub_22A5DA360();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 134217984;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v9, v10, "Setting new serviceType. { reporterID=%lld }", v11, 0xCu);
      MEMORY[0x22A6CDBE0](v11, -1, -1);
    }

    objc_msgSend((id)sub_22A5CDC58(a5, 3), sel_setWithServiceType_for_, a2, a4);
    uint64_t result = swift_unknownObjectRelease();
    *(_WORD *)(v8 + 24) = a2;
  }
  return result;
}

uint64_t sub_22A5D0230(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  v24[0] = (uint64_t)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v24 - v7;
  uint64_t v9 = type metadata accessor for ReporterState(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22A5DA260();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (uint64_t *)((char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v17 = *(void **)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *unint64_t v16 = v17;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F8F0E0], v13);
  id v18 = v17;
  LOBYTE(v17) = sub_22A5DA270();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v14 + 8))(v16, v13);
  if (v17)
  {
    os_log_type_t v20 = sub_22A5DA1D0();
    os_log_type_t v21 = sub_22A5DA360();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 134217984;
      v24[1] = a1;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v20, v21, "Destroying reporter. { reporterID=%lld }", v22, 0xCu);
      MEMORY[0x22A6CDBE0](v22, -1, -1);
    }

    sub_22A5B83B8(a1, 0xD00000000000001BLL, 0x800000022A5DD570, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      return sub_22A5B5680((uint64_t)v8, &qword_26AD78A18);
    }
    else
    {
      sub_22A5B605C((uint64_t)v8, (uint64_t)v12, type metadata accessor for ReporterState);
      sub_22A5CE300(a1);
      swift_beginAccess();
      uint64_t v23 = v24[0];
      sub_22A5D05DC(a1, v24[0]);
      sub_22A5B5680(v23, &qword_26AD78A18);
      swift_endAccess();
      sub_22A5C8468((uint64_t)v12);
      return sub_22A5B60C4((uint64_t)v12, type metadata accessor for ReporterState);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5D05DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  unint64_t v5 = sub_22A5B6F8C(a1);
  if (v6)
  {
    unint64_t v7 = v5;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v2;
    uint64_t v19 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_22A5D967C();
      uint64_t v9 = v19;
    }
    uint64_t v10 = *(void *)(v9 + 56);
    uint64_t v11 = type metadata accessor for ReporterState(0);
    uint64_t v18 = *(void *)(v11 - 8);
    sub_22A5B605C(v10 + *(void *)(v18 + 72) * v7, a2, type metadata accessor for ReporterState);
    sub_22A5C185C(v7, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56);
    uint64_t v13 = a2;
    uint64_t v14 = 0;
    uint64_t v15 = v11;
  }
  else
  {
    uint64_t v16 = type metadata accessor for ReporterState(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
    uint64_t v15 = v16;
    uint64_t v13 = a2;
    uint64_t v14 = 1;
  }
  return v12(v13, v14, 1, v15);
}

uint64_t sub_22A5D0748(uint64_t a1)
{
  uint64_t v36 = type metadata accessor for StartedReporterData(0);
  uint64_t v2 = MEMORY[0x270FA5388](v36);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  char v6 = (char *)&v32 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A18);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (uint64_t *)((char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = type metadata accessor for ReporterState(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v17 = (uint64_t *)((char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v32 - v18;
  uint64_t v35 = a1;
  sub_22A5B83B8(a1, 0xD00000000000001DLL, 0x800000022A5DD550, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    return sub_22A5B5680((uint64_t)v12, &qword_26AD78A18);
  }
  uint64_t v34 = v4;
  sub_22A5B605C((uint64_t)v12, (uint64_t)v19, type metadata accessor for ReporterState);
  sub_22A5B6270((uint64_t)v19, (uint64_t)v17, type metadata accessor for ReporterState);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload) {
    goto LABEL_9;
  }
  if (EnumCaseMultiPayload == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v33 = *v17;
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
      sub_22A5B605C((uint64_t)v17 + *(int *)(v22 + 48), (uint64_t)v6, type metadata accessor for StartedReporterData);
      uint64_t v23 = sub_22A5DA1B0();
      uint64_t v24 = (uint64_t)v34;
      uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v34, v6, v23);
      uint64_t v25 = *(int *)(v36 + 20);
      int v26 = *(_DWORD *)&v6[v25];
      BOOL v27 = __CFADD__(v26, 1);
      int v28 = v26 + 1;
      if (!v27) {
        goto LABEL_11;
      }
      __break(1u);
      goto LABEL_13;
    }
LABEL_9:
    sub_22A5B60C4((uint64_t)v19, type metadata accessor for ReporterState);
    return swift_release();
  }
  type metadata accessor for ActiveReporterState(0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    goto LABEL_9;
  }
  uint64_t v33 = *v17;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808);
  sub_22A5B605C((uint64_t)v17 + *(int *)(v22 + 48), (uint64_t)v6, type metadata accessor for StartedReporterData);
  uint64_t v29 = sub_22A5DA1B0();
  uint64_t v24 = (uint64_t)v34;
  uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v34, v6, v29);
  uint64_t v25 = *(int *)(v36 + 20);
  int v30 = *(_DWORD *)&v6[v25];
  BOOL v27 = __CFADD__(v30, 1);
  int v28 = v30 + 1;
  if (!v27)
  {
LABEL_11:
    *(_DWORD *)(v24 + v25) = v28;
    uint64_t v31 = (uint64_t)v10 + *(int *)(v22 + 48);
    void *v10 = v33;
    sub_22A5B6270(v24, v31, type metadata accessor for StartedReporterData);
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
    (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v10, 0, 1, v13);
    swift_beginAccess();
    swift_retain();
    sub_22A5B72B8((uint64_t)v10, v35);
    swift_endAccess();
    swift_release();
    sub_22A5B60C4(v24, type metadata accessor for StartedReporterData);
    sub_22A5B60C4((uint64_t)v6, type metadata accessor for StartedReporterData);
    return sub_22A5B60C4((uint64_t)v19, type metadata accessor for ReporterState);
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_22A5D0C98@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t a3@<X8>)
{
  swift_bridgeObjectRetain_n();
  char v6 = sub_22A5DA1D0();
  os_log_type_t v7 = sub_22A5DA360();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v12 = v9;
    *(_DWORD *)uint64_t v8 = 136380931;
    swift_bridgeObjectRetain();
    sub_22A5D72AC(a1, a2, &v12);
    sub_22A5DA400();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2048;
    sub_22A5DA400();
    _os_log_impl(&dword_22A5B3000, v6, v7, "ReporterID not created by client. Returning early. { function=%{private}s, reporterID=%lld }", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A6CDBE0](v9, -1, -1);
    MEMORY[0x22A6CDBE0](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = type metadata accessor for ReporterState(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a3, 1, 1, v10);
}

BOOL sub_22A5D0E6C(int a1)
{
  v5[7] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  notify_get_state(a1, v5);
  uint64_t v1 = sub_22A5DA1D0();
  os_log_type_t v2 = sub_22A5DA360();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 134217984;
    swift_beginAccess();
    v5[4] = v5[0];
    sub_22A5DA400();
    _os_log_impl(&dword_22A5B3000, v1, v2, "Game mode state retrieved. { value=%llu }", v3, 0xCu);
    MEMORY[0x22A6CDBE0](v3, -1, -1);
  }

  swift_beginAccess();
  return v5[0] != 0;
}

void sub_22A5D0FB8(uint64_t a1, uint64_t a2, int a3, unsigned __int16 a4)
{
  if (a4 == 6)
  {
    swift_bridgeObjectRetain_n();
    oslog = sub_22A5DA1D0();
    os_log_type_t v5 = sub_22A5DA390();
    if (os_log_type_enabled(oslog, v5))
    {
      uint64_t v6 = swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v25 = v7;
      *(_DWORD *)uint64_t v6 = 134218754;
      sub_22A5DA400();
      *(_WORD *)(v6 + 12) = 2082;
      uint64_t v8 = AudioEventCategory.description.getter(a3);
      sub_22A5D72AC(v8, v9, &v25);
      sub_22A5DA400();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 22) = 2082;
      unint64_t v10 = AudioEventType.description.getter(6u);
      sub_22A5D72AC(v10, v11, &v25);
      sub_22A5DA400();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 32) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_22A5DA2B0();
      unint64_t v14 = v13;
      swift_bridgeObjectRelease();
      sub_22A5D72AC(v12, v14, &v25);
      sub_22A5DA400();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, oslog, v5, "Sending message. { reporterID=%lld, category=%{public}s, type=%{public}s, message=%{public}s }", (uint8_t *)v6, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v7, -1, -1);
      uint64_t v15 = v6;
LABEL_6:
      MEMORY[0x22A6CDBE0](v15, -1, -1);

      return;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    oslog = sub_22A5DA1D0();
    os_log_type_t v17 = sub_22A5DA360();
    if (os_log_type_enabled(oslog, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v25 = v19;
      *(_DWORD *)uint64_t v18 = 134218498;
      sub_22A5DA400();
      *(_WORD *)(v18 + 12) = 2082;
      uint64_t v20 = AudioEventCategory.description.getter(a3);
      sub_22A5D72AC(v20, v21, &v25);
      sub_22A5DA400();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 22) = 2082;
      unint64_t v22 = AudioEventType.description.getter(a4);
      sub_22A5D72AC(v22, v23, &v25);
      sub_22A5DA400();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, oslog, v17, "Sending message. { reporterID=%lld, category=%{public}s, type=%{public}s }", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v19, -1, -1);
      uint64_t v15 = v18;
      goto LABEL_6;
    }
  }
}

void sub_22A5D1374(char a1)
{
  if (v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient__isCachingEnabled] != (a1 & 1))
  {
    os_log_type_t v2 = v1;
    v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient__isCachingEnabled] = a1 & 1;
    uint64_t v4 = sub_22A5DA1D0();
    os_log_type_t v5 = sub_22A5DA360();
    BOOL v6 = os_log_type_enabled(v4, v5);
    if (a1)
    {
      if (v6)
      {
        uint64_t v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_22A5B3000, v4, v5, "Entering caching mode.", v7, 2u);
        MEMORY[0x22A6CDBE0](v7, -1, -1);
      }

      uint64_t v8 = (uint64_t *)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_clientReporterStates];
      swift_beginAccess();
      unint64_t v9 = v2;
      uint64_t v10 = swift_bridgeObjectRetain();
      uint64_t v11 = sub_22A5D307C(v10, (uint64_t)v9);
      swift_bridgeObjectRelease();

      *uint64_t v8 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v6)
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_22A5B3000, v4, v5, "Leaving caching mode.", v12, 2u);
        MEMORY[0x22A6CDBE0](v12, -1, -1);
      }

      unint64_t v13 = (uint64_t *)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_clientReporterStates];
      swift_beginAccess();
      unint64_t v14 = v2;
      uint64_t v15 = swift_bridgeObjectRetain();
      uint64_t v16 = sub_22A5D3420(v15, (uint64_t)v14);
      swift_bridgeObjectRelease();

      *unint64_t v13 = v16;
      swift_bridgeObjectRelease();
      sub_22A5CDAB4();
    }
  }
}

id sub_22A5D1584()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServerClient(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22A5D16AC()
{
  return type metadata accessor for ServerClient(0);
}

uint64_t type metadata accessor for ServerClient(uint64_t a1)
{
  return sub_22A5B62D8(a1, (uint64_t *)&unk_26AD78AE8);
}

uint64_t sub_22A5D16D4()
{
  uint64_t result = sub_22A5DA1F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_22A5D17B8()
{
  return MEMORY[0x270FA0228](v0, 20, 7);
}

uint64_t type metadata accessor for ReporterIDGenerator()
{
  return self;
}

uint64_t sub_22A5D17EC()
{
  unint64_t v1 = (uint64_t *)(v0 + 32);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 32);
  if (!*(void *)(v2 + 16))
  {
    long long v9 = 0u;
    long long v10 = 0u;
LABEL_9:
    sub_22A5B5680((uint64_t)&v9, &qword_26AD78978);
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  unint64_t v3 = sub_22A5B6AA4(0xD000000000000018, 0x800000022A5DD020);
  if (v4)
  {
    sub_22A5B5624(*(void *)(v2 + 56) + 32 * v3, (uint64_t)&v9);
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v10 + 1)) {
    goto LABEL_9;
  }
  if (swift_dynamicCast()) {
    return v11;
  }
LABEL_10:
  uint64_t v6 = *v1;
  if (!*(void *)(*v1 + 16))
  {
    long long v9 = 0u;
    long long v10 = 0u;
LABEL_19:
    sub_22A5B5680((uint64_t)&v9, &qword_26AD78978);
    return 0;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_22A5B6AA4(0xD00000000000001ALL, 0x800000022A5DD530);
  if (v8)
  {
    sub_22A5B5624(*(void *)(v6 + 56) + 32 * v7, (uint64_t)&v9);
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v10 + 1)) {
    goto LABEL_19;
  }
  if (swift_dynamicCast()) {
    return v11;
  }
  else {
    return 0;
  }
}

uint64_t sub_22A5D199C()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

void *sub_22A5D19DC(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      type metadata accessor for ActiveReporterState(0);
      int v9 = swift_getEnumCaseMultiPayload();
      *a1 = *a2;
      swift_retain();
      if (v9 == 1) {
        goto LABEL_11;
      }
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        *a1 = *a2;
        swift_retain();
LABEL_12:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      type metadata accessor for ActiveReporterState(0);
      int v7 = swift_getEnumCaseMultiPayload();
      *a1 = *a2;
      swift_retain();
      if (v7 == 1)
      {
LABEL_11:
        swift_storeEnumTagMultiPayload();
        goto LABEL_12;
      }
    }
    uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_22A5DA1B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    uint64_t v14 = type metadata accessor for StartedReporterData(0);
    *(_DWORD *)&v11[*(int *)(v14 + 20)] = *(_DWORD *)&v12[*(int *)(v14 + 20)];
    goto LABEL_11;
  }
  uint64_t v8 = *a2;
  *a1 = *a2;
  a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t type metadata accessor for StartedReporterData(uint64_t a1)
{
  return sub_22A5B62D8(a1, (uint64_t *)&unk_26AD78980);
}

void *sub_22A5D1C40(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_22A5B60C4((uint64_t)a1, type metadata accessor for ReporterState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      type metadata accessor for ActiveReporterState(0);
      int v5 = swift_getEnumCaseMultiPayload();
      *a1 = *a2;
      swift_retain();
      if (v5 != 1)
      {
        uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
        int v7 = (char *)a1 + v6;
        uint64_t v8 = (char *)a2 + v6;
        uint64_t v9 = sub_22A5DA1B0();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
        uint64_t v10 = type metadata accessor for StartedReporterData(0);
        *(_DWORD *)&v7[*(int *)(v10 + 20)] = *(_DWORD *)&v8[*(int *)(v10 + 20)];
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_22A5D1D90(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t active = type metadata accessor for ActiveReporterState(0);
    if (swift_getEnumCaseMultiPayload())
    {
LABEL_6:
      memcpy(a1, a2, *(void *)(*(void *)(active - 8) + 64));
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
LABEL_8:
    *a1 = *a2;
    uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_22A5DA1B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    uint64_t v12 = type metadata accessor for StartedReporterData(0);
    *(_DWORD *)&v9[*(int *)(v12 + 20)] = *(_DWORD *)&v10[*(int *)(v12 + 20)];
    swift_storeEnumTagMultiPayload();
    goto LABEL_9;
  }
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t active = type metadata accessor for ActiveReporterState(0);
    if (swift_getEnumCaseMultiPayload()) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *sub_22A5D1FAC(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22A5B60C4((uint64_t)a1, type metadata accessor for ReporterState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t active = type metadata accessor for ActiveReporterState(0);
      if (swift_getEnumCaseMultiPayload())
      {
LABEL_7:
        memcpy(a1, a2, *(void *)(*(void *)(active - 8) + 64));
LABEL_10:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
LABEL_9:
      *a1 = *a2;
      uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_22A5DA1B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      uint64_t v12 = type metadata accessor for StartedReporterData(0);
      *(_DWORD *)&v9[*(int *)(v12 + 20)] = *(_DWORD *)&v10[*(int *)(v12 + 20)];
      swift_storeEnumTagMultiPayload();
      goto LABEL_10;
    }
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t active = type metadata accessor for ActiveReporterState(0);
      if (swift_getEnumCaseMultiPayload()) {
        goto LABEL_7;
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_22A5D21F8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22A5D2208()
{
  uint64_t result = type metadata accessor for ActiveReporterState(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_22A5D22A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_22A5DA1B0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(_DWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_22A5D236C(uint64_t a1)
{
  uint64_t v2 = sub_22A5DA1B0();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_22A5D23D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22A5DA1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_22A5D244C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22A5DA1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_22A5D24C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22A5DA1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_22A5D2544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22A5DA1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_22A5D25C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22A5D25D4);
}

uint64_t sub_22A5D25D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22A5DA1B0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_22A5D2640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22A5D2654);
}

uint64_t sub_22A5D2654(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22A5DA1B0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_22A5D26C4()
{
  uint64_t result = sub_22A5DA1B0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22A5D275C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    swift_retain();
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_22A5DA1B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      uint64_t v12 = type metadata accessor for StartedReporterData(0);
      *(_DWORD *)&v9[*(int *)(v12 + 20)] = *(_DWORD *)&v10[*(int *)(v12 + 20)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_22A5D288C(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_22A5B60C4((uint64_t)a1, type metadata accessor for ActiveReporterState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    swift_retain();
    if (EnumCaseMultiPayload != 1)
    {
      uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
      uint64_t v6 = (char *)a1 + v5;
      uint64_t v7 = (char *)a2 + v5;
      uint64_t v8 = sub_22A5DA1B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
      uint64_t v9 = type metadata accessor for StartedReporterData(0);
      *(_DWORD *)&v6[*(int *)(v9 + 20)] = *(_DWORD *)&v7[*(int *)(v9 + 20)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_22A5D2988(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_22A5DA1B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    uint64_t v10 = type metadata accessor for StartedReporterData(0);
    *(_DWORD *)&v7[*(int *)(v10 + 20)] = *(_DWORD *)&v8[*(int *)(v10 + 20)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_22A5D2A70(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_22A5B60C4((uint64_t)a1, type metadata accessor for ActiveReporterState);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_22A5DA1B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
      uint64_t v10 = type metadata accessor for StartedReporterData(0);
      *(_DWORD *)&v7[*(int *)(v10 + 20)] = *(_DWORD *)&v8[*(int *)(v10 + 20)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_22A5D2B7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_22A5D2BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_22A5D2BCC()
{
  uint64_t result = type metadata accessor for StartedReporterData(319);
  if (v1 <= 0x3F)
  {
    uint64_t v2 = MEMORY[0x263F8CF88] + 64;
    swift_getTupleTypeLayout2();
    v3[4] = v3;
    v3[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_22A5D2C78(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22A5D2CB8(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_22A5D2C98(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_22A5D2E18(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_22A5D2CB8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78990);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_22A5DA500();
  __break(1u);
  return result;
}

uint64_t sub_22A5D2E18(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78810);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_22A5DA500();
  __break(1u);
  return result;
}

double sub_22A5D2F78@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_22A5B6AA4(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_22A5D92E4();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_22A5B5AEC((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_22A5C1684(v8, v11);
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

uint64_t sub_22A5D307C(uint64_t a1, uint64_t a2)
{
  v35[1] = a2;
  uint64_t v3 = type metadata accessor for ReporterState(0);
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  unint64_t v38 = (void *)((char *)v35 - v8);
  MEMORY[0x270FA5388](v7);
  uint64_t v39 = (char *)v35 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD788E0);
  uint64_t result = sub_22A5DA4D0();
  uint64_t v11 = (void *)result;
  int64_t v12 = 0;
  uint64_t v43 = a1;
  uint64_t v15 = *(void *)(a1 + 64);
  uint64_t v14 = a1 + 64;
  uint64_t v13 = v15;
  uint64_t v16 = 1 << *(unsigned char *)(v14 - 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & v13;
  uint64_t v36 = v14;
  int64_t v37 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v40 = result + 64;
  uint64_t v19 = (uint64_t)v39;
  if ((v17 & v13) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v20 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  int64_t v44 = v12;
  for (unint64_t i = v20 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v23)) + (v24 << 6))
  {
    uint64_t v26 = *(void *)(*(void *)(v43 + 48) + 8 * i);
    unint64_t v27 = *(void *)(v41 + 72) * i;
    sub_22A5B6270(*(void *)(v43 + 56) + v27, v19, type metadata accessor for ReporterState);
    sub_22A5B6270(v19, (uint64_t)v6, type metadata accessor for ReporterState);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    sub_22A5B60C4((uint64_t)v6, type metadata accessor for ReporterState);
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v29 = v38;
      sub_22A5B6270(v19, (uint64_t)v38, type metadata accessor for ReporterState);
    }
    else
    {
      int v30 = v6;
      uint64_t v31 = v38;
      sub_22A5C8F14(v19, v38);
      uint64_t v29 = v31;
      unint64_t v6 = v30;
    }
    sub_22A5B60C4(v19, type metadata accessor for ReporterState);
    *(void *)(v40 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(void *)(v11[6] + 8 * i) = v26;
    uint64_t result = sub_22A5B605C((uint64_t)v29, v11[7] + v27, type metadata accessor for ReporterState);
    uint64_t v32 = v11[2];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (v33)
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v11[2] = v34;
    int64_t v12 = v44;
    if (v18) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v22 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_27;
    }
    if (v22 >= v37) {
      return (uint64_t)v11;
    }
    unint64_t v23 = *(void *)(v36 + 8 * v22);
    int64_t v24 = v12 + 1;
    if (!v23)
    {
      int64_t v24 = v12 + 2;
      if (v12 + 2 >= v37) {
        return (uint64_t)v11;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v24);
      if (!v23)
      {
        int64_t v24 = v12 + 3;
        if (v12 + 3 >= v37) {
          return (uint64_t)v11;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v18 = (v23 - 1) & v23;
    int64_t v44 = v24;
  }
  uint64_t v25 = v12 + 4;
  if (v12 + 4 >= v37) {
    return (uint64_t)v11;
  }
  unint64_t v23 = *(void *)(v36 + 8 * v25);
  if (v23)
  {
    int64_t v24 = v12 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v24 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v24 >= v37) {
      return (uint64_t)v11;
    }
    unint64_t v23 = *(void *)(v36 + 8 * v24);
    ++v25;
    if (v23) {
      goto LABEL_18;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_22A5D3420(uint64_t a1, uint64_t a2)
{
  v33[1] = a2;
  uint64_t v3 = type metadata accessor for ReporterState(0);
  uint64_t v37 = *(void *)(v3 - 8);
  uint64_t v38 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v40 = (void *)((char *)v33 - v8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v33 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD788E0);
  uint64_t result = sub_22A5DA4D0();
  int64_t v12 = (void *)result;
  int64_t v13 = 0;
  uint64_t v39 = a1;
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v15 = a1 + 64;
  uint64_t v14 = v16;
  uint64_t v17 = 1 << *(unsigned char *)(v15 - 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & v14;
  uint64_t v34 = v15;
  int64_t v35 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v36 = result + 64;
  if ((v18 & v14) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v20 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  for (unint64_t i = v20 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v23)) + (v13 << 6))
  {
    uint64_t v25 = *(void *)(*(void *)(v39 + 48) + 8 * i);
    unint64_t v26 = *(void *)(v37 + 72) * i;
    sub_22A5B6270(*(void *)(v39 + 56) + v26, (uint64_t)v10, type metadata accessor for ReporterState);
    sub_22A5B6270((uint64_t)v10, (uint64_t)v6, type metadata accessor for ReporterState);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      type metadata accessor for ActiveReporterState(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      sub_22A5B60C4((uint64_t)v6, type metadata accessor for ActiveReporterState);
      BOOL v28 = EnumCaseMultiPayload == 1;
      uint64_t v29 = v40;
      if (v28)
      {
        sub_22A5C7FA0((uint64_t)v10, v40);
        uint64_t v29 = v40;
        goto LABEL_25;
      }
    }
    else
    {
      sub_22A5B60C4((uint64_t)v6, type metadata accessor for ReporterState);
      uint64_t v29 = v40;
    }
    sub_22A5B6270((uint64_t)v10, (uint64_t)v29, type metadata accessor for ReporterState);
LABEL_25:
    sub_22A5B60C4((uint64_t)v10, type metadata accessor for ReporterState);
    *(void *)(v36 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(void *)(v12[6] + 8 * i) = v25;
    uint64_t result = sub_22A5B605C((uint64_t)v29, v12[7] + v26, type metadata accessor for ReporterState);
    uint64_t v30 = v12[2];
    BOOL v31 = __OFADD__(v30, 1);
    uint64_t v32 = v30 + 1;
    if (v31)
    {
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    v12[2] = v32;
    if (v19) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_30;
    }
    if (v22 >= v35) {
      return (uint64_t)v12;
    }
    unint64_t v23 = *(void *)(v34 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v35) {
        return (uint64_t)v12;
      }
      unint64_t v23 = *(void *)(v34 + 8 * v13);
      if (!v23)
      {
        int64_t v13 = v22 + 2;
        if (v22 + 2 >= v35) {
          return (uint64_t)v12;
        }
        unint64_t v23 = *(void *)(v34 + 8 * v13);
        if (!v23) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v19 = (v23 - 1) & v23;
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v35) {
    return (uint64_t)v12;
  }
  unint64_t v23 = *(void *)(v34 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v35) {
      return (uint64_t)v12;
    }
    unint64_t v23 = *(void *)(v34 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_18;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_22A5D37E4(uint64_t a1)
{
  return sub_22A5D3968(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22A5CFD80);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(type metadata accessor for ReporterState(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);

  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    int v6 = swift_getEnumCaseMultiPayload();
    swift_release();
    if (v6 != 1)
    {
      uint64_t v7 = v0 + v3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD78808) + 48);
      uint64_t v8 = sub_22A5DA1B0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    }
  }
  else if (!EnumCaseMultiPayload)
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_22A5D3950(uint64_t a1)
{
  return sub_22A5D3968(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_22A5D00F8);
}

uint64_t sub_22A5D3968(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for ReporterState(0) - 8);
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v6 = *(void *)(v2 + 32);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = *(unsigned __int16 *)(v2 + 16);
  return a2(a1, v8, v5, v6, v7);
}

uint64_t sub_22A5D39F4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22A5D3A2C()
{
  sub_22A5BD03C(*(void *)(v0 + 16));
}

uint64_t sub_22A5D3A34()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5D3A6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22A5B7BC4(*(unsigned int *)(v1 + 24));
  *a1 = result;
  return result;
}

uint64_t sub_22A5D3ABC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_22A5D3AF4(void *a1, uint64_t a2)
{
  sub_22A5CD318(a1, a2, *(void *)(v2 + 16), *(_DWORD *)(v2 + 24), *(_WORD *)(v2 + 28), *(void (**)(void *))(v2 + 32));
}

uint64_t sub_22A5D3B08()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 54, 7);
}

uint64_t sub_22A5D3B48()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5D3B58()
{
  return sub_22A5D0230(*(void *)(v0 + 24));
}

uint64_t sub_22A5D3B80()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5D3B90()
{
  return objectdestroy_27Tm(38);
}

void sub_22A5D3B98()
{
  sub_22A5CE9F0(0, 1, *(void *)(v0 + 24), *(_DWORD *)(v0 + 32), *(unsigned __int16 *)(v0 + 36), 1);
}

uint64_t sub_22A5D3BD4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5D3BE4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 46, 7);
}

void sub_22A5D3C24()
{
  sub_22A5CE9F0(*(void *)(v0 + 24), 0, *(void *)(v0 + 32), *(_DWORD *)(v0 + 40), *(unsigned __int16 *)(v0 + 44), 1);
}

uint64_t sub_22A5D3C60()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5D3C70()
{
  return objectdestroy_27Tm(40);
}

uint64_t sub_22A5D3C78()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5D3C88()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22A5D3CC0()
{
  return sub_22A5CF558(*(unsigned __int16 *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_22A5D3CF0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5D3D00()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5D3D38()
{
  return sub_22A5CE300(*(void *)(v0 + 24));
}

uint64_t sub_22A5D3D60()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5D3D70()
{
  return sub_22A5CDE98(*(void *)(v0 + 24));
}

uint64_t sub_22A5D3D98()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_22A5D3DA8()
{
  unint64_t result = qword_26AD78A80;
  if (!qword_26AD78A80)
  {
    sub_22A5DA3A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD78A80);
  }
  return result;
}

unint64_t sub_22A5D3E00()
{
  unint64_t result = qword_26AD78A78;
  if (!qword_26AD78A78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD78A28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD78A78);
  }
  return result;
}

uint64_t sub_22A5D3E5C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5D3E94()
{
  return sub_22A5CA1E8(v0);
}

void sub_22A5D3E9C()
{
  sub_22A5CAE30(v0);
}

void sub_22A5D3EA4(int a1)
{
  sub_22A5CB214(a1, v1);
}

uint64_t sub_22A5D3EAC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22A5D3EE4()
{
  return sub_22A5CB0E0(*(void *)(v0 + 16));
}

uint64_t sub_22A5D3EEC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5D3EFC()
{
  return sub_22A5CA36C(*(char **)(v0 + 16));
}

uint64_t sub_22A5D3F04()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22A5D3F14(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = a2;
  uint64_t v3 = type metadata accessor for ReporterState(0);
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  int64_t v35 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v34 = (char *)&v29 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD788E0);
  uint64_t result = sub_22A5DA4D0();
  uint64_t v8 = (void *)result;
  int64_t v9 = 0;
  uint64_t v37 = a1;
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v11 = a1 + 64;
  uint64_t v10 = v12;
  uint64_t v13 = 1 << *(unsigned char *)(v11 - 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & v10;
  uint64_t v30 = v11;
  int64_t v31 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v32 = result + 64;
  BOOL v33 = (void *)result;
  uint64_t v17 = (uint64_t)v34;
  uint64_t v16 = (uint64_t)v35;
  if ((v14 & v10) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v18 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  int64_t v39 = v9;
  for (unint64_t i = v18 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v21)) + (v22 << 6))
  {
    uint64_t v24 = *(void *)(*(void *)(v37 + 48) + 8 * i);
    unint64_t v25 = *(void *)(v36 + 72) * i;
    sub_22A5B6270(*(void *)(v37 + 56) + v25, v17, type metadata accessor for ReporterState);
    sub_22A5C88A4(v17, v16);
    sub_22A5B60C4(v17, type metadata accessor for ReporterState);
    uint64_t v8 = v33;
    *(void *)(v32 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(void *)(v8[6] + 8 * i) = v24;
    uint64_t result = sub_22A5B605C(v16, v8[7] + v25, type metadata accessor for ReporterState);
    uint64_t v26 = v8[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v8[2] = v28;
    int64_t v9 = v39;
    if (v15) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      goto LABEL_24;
    }
    if (v20 >= v31) {
      return (uint64_t)v8;
    }
    unint64_t v21 = *(void *)(v30 + 8 * v20);
    int64_t v22 = v9 + 1;
    if (!v21)
    {
      int64_t v22 = v9 + 2;
      if (v9 + 2 >= v31) {
        return (uint64_t)v8;
      }
      unint64_t v21 = *(void *)(v30 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = v9 + 3;
        if (v9 + 3 >= v31) {
          return (uint64_t)v8;
        }
        unint64_t v21 = *(void *)(v30 + 8 * v22);
        if (!v21) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v15 = (v21 - 1) & v21;
    int64_t v39 = v22;
  }
  uint64_t v23 = v9 + 4;
  if (v9 + 4 >= v31) {
    return (uint64_t)v8;
  }
  unint64_t v21 = *(void *)(v30 + 8 * v23);
  if (v21)
  {
    int64_t v22 = v9 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v22 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v22 >= v31) {
      return (uint64_t)v8;
    }
    unint64_t v21 = *(void *)(v30 + 8 * v22);
    ++v23;
    if (v21) {
      goto LABEL_18;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_22A5D428C()
{
  return sub_22A5D42B4(&OBJC_IVAR____TtC14AudioAnalytics11ServerProxy____lazy_storage___unboostedProxy, (SEL *)&selRef__unboostingRemoteObjectProxy);
}

uint64_t sub_22A5D42A0()
{
  return sub_22A5D42B4(&OBJC_IVAR____TtC14AudioAnalytics11ServerProxy____lazy_storage___boostedProxy, (SEL *)&selRef_remoteObjectProxy);
}

uint64_t sub_22A5D42B4(uint64_t *a1, SEL *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(v2 + *a1);
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    id v6 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                               + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy_xpcConnection), *a2));
    sub_22A5DA430();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A20);
    swift_dynamicCast();
    uint64_t v5 = v8;
    *(void *)(v2 + v3) = v8;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v5;
}

uint64_t sub_22A5D4378()
{
  uint64_t v1 = OBJC_IVAR____TtC14AudioAnalytics11ServerProxy____lazy_storage___syncProxy;
  if (*(void *)(v0 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy____lazy_storage___syncProxy))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy____lazy_storage___syncProxy);
  }
  else
  {
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy_xpcConnection);
    aBlock[4] = sub_22A5D48CC;
    aBlock[5] = v0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22A5D4684;
    aBlock[3] = &block_descriptor_3;
    uint64_t v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    id v5 = objc_msgSend(v3, sel_synchronousRemoteObjectProxyWithErrorHandler_, v4);
    _Block_release(v4);
    sub_22A5DA430();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A20);
    swift_dynamicCast();
    uint64_t v2 = v7;
    *(void *)(v0 + v1) = v7;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

void sub_22A5D44D8(void *a1)
{
  id v2 = a1;
  id v3 = a1;
  uint64_t v4 = sub_22A5DA1D0();
  os_log_type_t v5 = sub_22A5DA370();
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v10 = v7;
    *(_DWORD *)id v6 = 136380675;
    swift_getErrorValue();
    uint64_t v8 = sub_22A5DA530();
    sub_22A5D72AC(v8, v9, &v10);
    sub_22A5DA400();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22A5B3000, v4, v5, "Synchronous remote object proxy encountered error. { error=%{private}s }", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6CDBE0](v7, -1, -1);
    MEMORY[0x22A6CDBE0](v6, -1, -1);
  }
  else
  {
  }
}

void sub_22A5D4684(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_22A5D46EC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14AudioAnalytics11ServerProxy_logger;
  uint64_t v2 = sub_22A5DA1F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_22A5D47CC()
{
  return type metadata accessor for ServerProxy();
}

uint64_t type metadata accessor for ServerProxy()
{
  uint64_t result = qword_26AD788E8;
  if (!qword_26AD788E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22A5D4820()
{
  uint64_t result = sub_22A5DA1F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_22A5D48CC(void *a1)
{
}

unint64_t sub_22A5D48D4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78800);
  uint64_t v2 = (void *)sub_22A5DA4F0();
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
    unint64_t result = sub_22A5B6AA4(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_22A5D49E8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF28);
  uint64_t v2 = sub_22A5DA4F0();
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
    sub_22A5DA104(v6, (uint64_t)v15, &qword_26837CFC8);
    unint64_t result = sub_22A5D7A2C((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_22A5B5AEC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

void sub_22A5D4B2C(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF70);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v29 - v8;
  MEMORY[0x270FA5388](v7);
  long long v11 = (char *)&v29 - v10;
  uint64_t v12 = (uint64_t *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
  swift_beginAccess();
  uint64_t v13 = *v12;
  if (*(void *)(*v12 + 16) && (unint64_t v14 = sub_22A5B6F8C(a1), (v15 & 1) != 0))
  {
    uint64_t v16 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
    uint64_t v17 = v16 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
    swift_beginAccess();
    sub_22A5DA104(v17, (uint64_t)v11, &qword_26837CF70);
    uint64_t v18 = sub_22A5DA1B0();
    uint64_t v19 = *(void *)(v18 - 8);
    int v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v11, 1, v18);
    uint64_t v29 = v16;
    swift_retain();
    sub_22A5C1C90((uint64_t)v11);
    unint64_t v21 = sub_22A5DA1D0();
    os_log_type_t v22 = sub_22A5DA360();
    BOOL v23 = os_log_type_enabled(v21, v22);
    if (v20 == 1)
    {
      if (v23)
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v24 = 134283521;
        uint64_t v30 = a1;
        sub_22A5DA400();
        _os_log_impl(&dword_22A5B3000, v21, v22, "Setting startTime. { function=start, reporterID=%{private}lld }", v24, 0xCu);
        MEMORY[0x22A6CDBE0](v24, -1, -1);
      }

      sub_22A5DA1A0();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v9, 0, 1, v18);
      sub_22A5D9EA8((uint64_t)v9, (uint64_t)v6);
      swift_beginAccess();
      sub_22A5D7A70((uint64_t)v6, v17);
      swift_endAccess();
      swift_release();
    }
    else
    {
      if (v23)
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = 134283521;
        uint64_t v30 = a1;
        sub_22A5DA400();
        _os_log_impl(&dword_22A5B3000, v21, v22, "start called without a stop. Ignoring. { function=start, reporterID=%{private}lld }", v28, 0xCu);
        MEMORY[0x22A6CDBE0](v28, -1, -1);
      }
      swift_release();
    }
  }
  else
  {
    unint64_t v25 = sub_22A5DA1D0();
    os_log_type_t v26 = sub_22A5DA380();
    if (os_log_type_enabled(v25, v26))
    {
      BOOL v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)BOOL v27 = 134283521;
      uint64_t v31 = a1;
      sub_22A5DA400();
      _os_log_impl(&dword_22A5B3000, v25, v26, "start called for unknown reporterID. { function=start, reporterID=%{private}lld }", v27, 0xCu);
      MEMORY[0x22A6CDBE0](v27, -1, -1);
    }
  }
}

void sub_22A5D4F18(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF70);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v51 - v8;
  uint64_t v10 = sub_22A5DA1B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  unint64_t v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v51 - v15;
  uint64_t v17 = (uint64_t *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
  swift_beginAccess();
  uint64_t v18 = *v17;
  if (!*(void *)(v18 + 16) || (unint64_t v19 = sub_22A5B6F8C(a1), (v20 & 1) == 0))
  {
    BOOL v23 = sub_22A5DA1D0();
    os_log_type_t v24 = sub_22A5DA380();
    if (os_log_type_enabled(v23, v24))
    {
      unint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v25 = 0;
      _os_log_impl(&dword_22A5B3000, v23, v24, "activeReporters should contain reporter already. { function=stop }", v25, 2u);
      MEMORY[0x22A6CDBE0](v25, -1, -1);
    }

    return;
  }
  uint64_t v21 = *(void *)(*(void *)(v18 + 56) + 8 * v19);
  uint64_t v22 = v21 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
  swift_beginAccess();
  sub_22A5DA104(v22, (uint64_t)v9, &qword_26837CF70);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    swift_retain();
    sub_22A5C1C90((uint64_t)v9);
LABEL_20:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v7, 1, 1, v10);
    swift_beginAccess();
    sub_22A5D7A70((uint64_t)v7, v22);
    swift_endAccess();
    swift_release();
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
  uint64_t v26 = swift_retain();
  unsigned int v56 = (void (*)(char *, uint64_t))sub_22A5D9A80(v26);
  int v55 = v28;
  if (!v27)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    goto LABEL_20;
  }
  uint64_t v29 = v27;
  uint64_t v53 = v22;
  uint64_t v54 = v21;
  uint64_t v30 = (uint64_t *)(v2 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messageCache);
  swift_beginAccess();
  uint64_t v31 = *v30;
  uint64_t v32 = *(void *)(*v30 + 16);
  uint64_t v52 = a1;
  if (!v32) {
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v33 = sub_22A5D7988((uint64_t)v56, v29, v55);
  if ((v34 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_14:
    type metadata accessor for MessageCounts();
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = 0;
    *(void *)(v35 + 24) = 0;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v57 = *v30;
    uint64_t *v30 = 0x8000000000000000;
    sub_22A5D8C84(v35, (uint64_t)v56, v29, v55, isUniquelyReferenced_nonNull_native);
    uint64_t *v30 = v57;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    goto LABEL_15;
  }
  uint64_t v35 = *(void *)(*(void *)(v31 + 56) + 8 * v33);
  swift_retain();
  swift_bridgeObjectRelease_n();
LABEL_15:
  swift_bridgeObjectRelease();
  uint64_t v37 = *(void *)(v54 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts);
  swift_retain();
  sub_22A5DA1A0();
  sub_22A5DA180();
  double v39 = v38;
  unsigned int v56 = *(void (**)(char *, uint64_t))(v11 + 8);
  v56(v14, v10);
  sub_22A5DA180();
  int v41 = *(_DWORD *)(v37 + 16);
  int v42 = *(_DWORD *)(v35 + 16);
  BOOL v43 = __CFADD__(v42, v41);
  int v44 = v42 + v41;
  if (v43)
  {
    __break(1u);
  }
  else
  {
    *(_DWORD *)(v35 + 16) = v44;
    int v45 = *(_DWORD *)(v37 + 20);
    int v46 = *(_DWORD *)(v35 + 20);
    BOOL v43 = __CFADD__(v46, v45);
    int v47 = v46 + v45;
    if (!v43)
    {
      *(_DWORD *)(v35 + 20) = v47;
      *(double *)(v35 + 24) = v39 - v40 + *(double *)(v35 + 24);
      swift_release();
      uint64_t v48 = sub_22A5DA1D0();
      os_log_type_t v49 = sub_22A5DA360();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v50 = 134217984;
        uint64_t v58 = v52;
        sub_22A5DA400();
        _os_log_impl(&dword_22A5B3000, v48, v49, "Incremented times. { function=stop, reporterID=%lld }", v50, 0xCu);
        MEMORY[0x22A6CDBE0](v50, -1, -1);
      }

      swift_release();
      v56(v16, v10);
      uint64_t v22 = v53;
      goto LABEL_20;
    }
  }
  __break(1u);
}

void sub_22A5D54D8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_22A5B6F8C(a2), (v8 & 1) != 0))
  {
    uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRetain_n();
    swift_retain();
    uint64_t v10 = sub_22A5DA1D0();
    os_log_type_t v11 = sub_22A5DA360();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      v21[0] = v13;
      *(_DWORD *)uint64_t v12 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_22A5DA2B0();
      unint64_t v16 = v15;
      swift_bridgeObjectRelease();
      sub_22A5D72AC(v14, v16, v21);
      sub_22A5DA400();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, v10, v11, "Setting configuration. { config=%s }", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v13, -1, -1);
      MEMORY[0x22A6CDBE0](v12, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v20 = *(void *)(v9 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data);
    swift_retain();
    swift_release();
    swift_beginAccess();
    *(void *)(v20 + 32) = a1;
    swift_bridgeObjectRetain();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = sub_22A5DA1D0();
    os_log_type_t v18 = sub_22A5DA380();
    if (os_log_type_enabled(v17, v18))
    {
      unint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v19 = 0;
      _os_log_impl(&dword_22A5B3000, v17, v18, "activeReporters should contain reporter already. { function=setConfiguration }", v19, 2u);
      MEMORY[0x22A6CDBE0](v19, -1, -1);
    }
  }
}

uint64_t sub_22A5D5798()
{
  uint64_t v1 = v0;
  swift_retain_n();
  uint64_t v2 = sub_22A5DA1D0();
  os_log_type_t v3 = sub_22A5DA360();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134218240;
    swift_beginAccess();
    sub_22A5DA400();
    *(_WORD *)(v4 + 12) = 2048;
    swift_beginAccess();
    swift_release();
    sub_22A5DA400();
    swift_release();
    _os_log_impl(&dword_22A5B3000, v2, v3, "SessionGenericSummaryCache.process called. { messageCache=%ld, active=%ld }", (uint8_t *)v4, 0x16u);
    MEMORY[0x22A6CDBE0](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_singleMessageSessionReportInfo);
  uint64_t v6 = *(void *)(v5 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts);
  if (*(_DWORD *)(v6 + 16))
  {
    unsigned __int16 v7 = *(_WORD *)(*(void *)(v5 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data) + 24);
    swift_retain();
    sub_22A5D59F8(0x654D656C676E6973, 0xED00006567617373, v7, v6);
    swift_release();
  }
  sub_22A5D6958();
  char v8 = (void *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messageCache);
  swift_beginAccess();
  uint64_t v9 = swift_bridgeObjectRetain();
  sub_22A5D9CE0(v9, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22A5D7B6C);
  swift_bridgeObjectRelease();
  *char v8 = MEMORY[0x263F8EE80];
  return swift_bridgeObjectRelease();
}

uint64_t sub_22A5D59F8(uint64_t a1, unint64_t a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_22A5DA220();
  uint64_t v48 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  int v47 = &v39[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_22A5DA250();
  uint64_t v45 = *(void *)(v12 - 8);
  uint64_t v46 = v12;
  MEMORY[0x270FA5388](v12);
  int v44 = &v39[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_22A5DA1D0();
  os_log_type_t v15 = sub_22A5DA360();
  int v16 = v15;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v43 = v10;
    uint64_t v18 = v17;
    uint64_t v41 = swift_slowAlloc();
    v50[0] = v41;
    *(_DWORD *)uint64_t v18 = 136380931;
    int v40 = v16;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_22A5D72AC(a1, a2, v50);
    uint64_t v42 = a1;
    sub_22A5DA400();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2081;
    unint64_t v19 = AudioServiceType.description.getter(a3);
    uint64_t v49 = sub_22A5D72AC(v19, v20, v50);
    a1 = v42;
    sub_22A5DA400();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22A5B3000, v14, (os_log_type_t)v40, "Sending cached message. { appName=%{private}s, serviceType=%{private}s }", (uint8_t *)v18, 0x16u);
    uint64_t v21 = v41;
    swift_arrayDestroy();
    MEMORY[0x22A6CDBE0](v21, -1, -1);
    uint64_t v22 = v18;
    uint64_t v10 = v43;
    MEMORY[0x22A6CDBE0](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78950);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22A5DB6B0;
  uint64_t v24 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 32) = 0x65646F4D656D6167;
  *(void *)(inited + 40) = 0xE800000000000000;
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 72) = v24;
  *(void *)(inited + 80) = 0xD000000000000011;
  *(void *)(inited + 88) = 0x800000022A5DDB00;
  uint64_t v25 = MEMORY[0x263F8D538];
  *(void *)(inited + 96) = *(void *)(a4 + 24);
  *(void *)(inited + 120) = v25;
  strcpy((char *)(inited + 128), "overload_count");
  *(unsigned char *)(inited + 143) = -18;
  uint64_t v26 = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 144) = *(_DWORD *)(a4 + 16);
  *(void *)(inited + 168) = v26;
  *(void *)(inited + 176) = 0xD000000000000016;
  *(void *)(inited + 184) = 0x800000022A5DDB20;
  *(_DWORD *)(inited + 192) = *(_DWORD *)(a4 + 20);
  *(void *)(inited + 216) = v26;
  *(void *)(inited + 224) = 0xD000000000000018;
  uint64_t v27 = MEMORY[0x263F8D310];
  *(void *)(inited + 232) = 0x800000022A5DD020;
  *(void *)(inited + 240) = a1;
  *(void *)(inited + 248) = a2;
  *(void *)(inited + 264) = v27;
  *(void *)(inited + 272) = 0xD000000000000012;
  *(void *)(inited + 280) = 0x800000022A5DDB40;
  unint64_t v28 = AudioServiceType.description.getter(a3);
  *(void *)(inited + 312) = v27;
  *(void *)(inited + 288) = v28;
  *(void *)(inited + 296) = v29;
  swift_bridgeObjectRetain();
  unint64_t v30 = sub_22A5B7520(inited);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v30;
  *(_DWORD *)(v31 + 24) = 134217729;
  v50[4] = (uint64_t)sub_22A5D7B10;
  v50[5] = v31;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 1107296256;
  v50[2] = (uint64_t)sub_22A5CADEC;
  v50[3] = (uint64_t)&block_descriptor_4;
  uint64_t v32 = _Block_copy(v50);
  unint64_t v33 = v44;
  sub_22A5DA230();
  uint64_t v49 = MEMORY[0x263F8EE78];
  sub_22A5D9F50(&qword_26837CFA0, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837CFA8);
  sub_22A5D9F98(&qword_26837CFB0, &qword_26837CFA8);
  char v34 = v47;
  sub_22A5DA440();
  MEMORY[0x22A6CD3A0](0, v33, v34, v32);
  _Block_release(v32);
  (*(void (**)(unsigned char *, uint64_t))(v48 + 8))(v34, v10);
  (*(void (**)(unsigned char *, uint64_t))(v45 + 8))(v33, v46);
  uint64_t result = swift_release();
  int v36 = *(_DWORD *)(v5 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesSent);
  BOOL v37 = __CFADD__(v36, 1);
  int v38 = v36 + 1;
  if (v37) {
    __break(1u);
  }
  else {
    *(_DWORD *)(v5 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesSent) = v38;
  }
  return result;
}

uint64_t sub_22A5D5FB8(uint64_t a1, int a2)
{
  if (qword_26AD78A08 != -1) {
    swift_once();
  }
  uint64_t v4 = (void *)qword_26AD78CD0;
  uint64_t v5 = *(NSObject **)(qword_26AD78CD0 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = a1;
  *(_DWORD *)(v6 + 32) = a2;
  *(_WORD *)(v6 + 36) = 11;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_22A5BAABC;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_22A5B7684;
  v12[5] = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_22A5B768C;
  v12[3] = &block_descriptor_62;
  char v8 = _Block_copy(v12);
  id v9 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_22A5D6174()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_logger;
  uint64_t v2 = sub_22A5DA1F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_22A5D624C()
{
  return type metadata accessor for SessionGenericSummaryCache(0);
}

uint64_t type metadata accessor for SessionGenericSummaryCache(uint64_t a1)
{
  return sub_22A5B62D8(a1, (uint64_t *)&unk_26837CEF0);
}

uint64_t sub_22A5D6274()
{
  uint64_t result = sub_22A5DA1F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_22A5D6340()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22A5DA3A0();
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = sub_22A5DA3B0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22A5DA250();
  MEMORY[0x270FA5388](v7 - 8);
  sub_22A5D9F10();
  sub_22A5DA240();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F138], v3);
  v15[1] = MEMORY[0x263F8EE78];
  sub_22A5D9F50((unint64_t *)&qword_26AD78A80, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A28);
  sub_22A5D9F98((unint64_t *)&qword_26AD78A78, &qword_26AD78A28);
  sub_22A5DA440();
  *(void *)(v0 + 16) = sub_22A5DA3E0();
  uint64_t v8 = OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_logger;
  if (qword_26AD78A40 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_22A5DA1F0();
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_26AD78CF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v1 + v8, v10, v9);
  uint64_t v11 = MEMORY[0x263F8EE80];
  *(void *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters) = MEMORY[0x263F8EE80];
  *(void *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messageCache) = v11;
  *(_DWORD *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesReceived) = 0;
  *(_DWORD *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesSent) = 0;
  uint64_t v12 = OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_singleMessageSessionReportInfo;
  type metadata accessor for ReporterInfo(0);
  uint64_t v13 = swift_allocObject();
  sub_22A5D6814(0, 5);
  *(void *)(v1 + v12) = v13;
  return v1;
}

uint64_t sub_22A5D6674()
{
  return sub_22A5DA580();
}

uint64_t sub_22A5D66E8()
{
  return sub_22A5DA570();
}

uint64_t sub_22A5D6744()
{
  return sub_22A5DA580();
}

BOOL sub_22A5D67B4(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a1 + 16);
  int v3 = *(unsigned __int16 *)(a2 + 16);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 == v3;
  }
  char v5 = sub_22A5DA510();
  BOOL result = 0;
  if (v5) {
    return v2 == v3;
  }
  return result;
}

uint64_t sub_22A5D6814(uint64_t a1, __int16 a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = v2 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
  uint64_t v7 = sub_22A5DA1B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts;
  type metadata accessor for MessageCounts();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  *(void *)(v9 + 24) = 0;
  *(void *)(v3 + v8) = v9;
  type metadata accessor for ReporterData();
  uint64_t v10 = swift_allocObject();
  *(_WORD *)(v10 + 24) = -1;
  *(void *)(v10 + 32) = sub_22A5B7520(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A30);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_22A5DB310;
  *(_DWORD *)(v11 + 32) = getpid();
  type metadata accessor for PerfCheck();
  swift_allocObject();
  *(void *)(v10 + 40) = sub_22A5B7700(v11);
  *(void *)(v10 + 16) = a1;
  *(void *)(v3 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data) = v10;
  *(_WORD *)(v10 + 24) = a2;
  return v3;
}

uint64_t sub_22A5D6958()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF70);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22A5DA1B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
  swift_beginAccess();
  sub_22A5D7A70((uint64_t)v3, v5);
  uint64_t result = swift_endAccess();
  uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts);
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  return result;
}

uint64_t sub_22A5D6A50()
{
  sub_22A5C1C90(v0 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime);
  swift_release();
  swift_release();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_22A5D6AD4()
{
  return type metadata accessor for ReporterInfo(0);
}

uint64_t type metadata accessor for ReporterInfo(uint64_t a1)
{
  return sub_22A5B62D8(a1, (uint64_t *)&unk_26837CED8);
}

void sub_22A5D6AFC()
{
  sub_22A5D6B9C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_22A5D6B9C()
{
  if (!qword_26837CED0)
  {
    sub_22A5DA1B0();
    unint64_t v0 = sub_22A5DA3F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26837CED0);
    }
  }
}

uint64_t sub_22A5D6BF4(uint64_t result)
{
  int v2 = *(_DWORD *)(v1 + 16);
  BOOL v3 = __CFADD__(v2, 1);
  int v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v5 = v1;
  uint64_t v6 = result;
  *(_DWORD *)(v1 + 16) = v4;
  if (*(void *)(result + 16))
  {
    uint64_t result = sub_22A5B6AA4(0x656C6379635F6F69, 0xE800000000000000);
    if (v7)
    {
      sub_22A5B5624(*(void *)(v6 + 56) + 32 * result, (uint64_t)&v18);
      uint64_t result = swift_dynamicCast();
      if ((result & 1) != 0 && v16 >= 3)
      {
        if (!*(void *)(v6 + 16)) {
          goto LABEL_32;
        }
        uint64_t result = sub_22A5B6AA4(0xD000000000000015, 0x800000022A5DDAC0);
        if ((v8 & 1) == 0) {
          goto LABEL_32;
        }
        sub_22A5B5624(*(void *)(v6 + 56) + 32 * result, (uint64_t)&v18);
        uint64_t result = swift_dynamicCast();
        if ((result & 1) == 0) {
          goto LABEL_32;
        }
        uint64_t v18 = v16;
        unint64_t v19 = v17;
        sub_22A5D7934();
        if (sub_22A5DA420()) {
          return swift_bridgeObjectRelease();
        }
        uint64_t v18 = v16;
        unint64_t v19 = v17;
        uint64_t v16 = 5263169;
        unint64_t v17 = 0xE300000000000000;
        char v9 = sub_22A5DA420();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v9 & 1) == 0)
        {
LABEL_32:
          if (!*(void *)(v6 + 16)) {
            goto LABEL_24;
          }
          uint64_t result = sub_22A5B6AA4(0xD000000000000016, 0x800000022A5DDAE0);
          if ((v10 & 1) == 0) {
            goto LABEL_24;
          }
          sub_22A5B5624(*(void *)(v6 + 56) + 32 * result, (uint64_t)&v18);
          uint64_t result = swift_dynamicCast();
          if ((result & 1) == 0) {
            goto LABEL_24;
          }
          uint64_t v18 = v16;
          unint64_t v19 = v17;
          sub_22A5D7934();
          if (sub_22A5DA420()) {
            return swift_bridgeObjectRelease();
          }
          uint64_t v18 = v16;
          unint64_t v19 = v17;
          LOBYTE(v16) = 72;
          char v11 = sub_22A5DA420();
          uint64_t result = swift_bridgeObjectRelease();
          if ((v11 & 1) == 0)
          {
LABEL_24:
            if (!*(void *)(v6 + 16)
              || (uint64_t result = sub_22A5B6AA4(0x61776572705F7369, 0xED0000676E696D72), (v12 & 1) == 0)
              || (sub_22A5B5624(*(void *)(v6 + 56) + 32 * result, (uint64_t)&v18),
                  uint64_t result = swift_dynamicCast(),
                  (result & 1) == 0)
              || (v16 & 1) == 0)
            {
              if (!*(void *)(v6 + 16)
                || (uint64_t result = sub_22A5B6AA4(0x766F6365725F7369, 0xED0000676E697265), (v13 & 1) == 0)
                || (sub_22A5B5624(*(void *)(v6 + 56) + 32 * result, (uint64_t)&v18),
                    uint64_t result = swift_dynamicCast(),
                    (result & 1) == 0)
                || (v16 & 1) == 0)
              {
                int v14 = *(_DWORD *)(v5 + 20);
                BOOL v3 = __CFADD__(v14, 1);
                int v15 = v14 + 1;
                if (!v3)
                {
                  *(_DWORD *)(v5 + 20) = v15;
                  return result;
                }
LABEL_29:
                __break(1u);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_22A5D6F98()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for MessageCounts()
{
  return self;
}

uint64_t destroy for MessageDimensions()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s14AudioAnalytics17MessageDimensionsVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MessageDimensions(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MessageDimensions(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageDimensions(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 18)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageDimensions(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageDimensions()
{
  return &type metadata for MessageDimensions;
}

unint64_t sub_22A5D7158()
{
  unint64_t result = qword_26837CF90;
  if (!qword_26837CF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837CF90);
  }
  return result;
}

uint64_t sub_22A5D71AC(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  a4(&v7);
  uint64_t v5 = *a1 + 8;
  uint64_t result = sub_22A5DA400();
  *a1 = v5;
  return result;
}

uint64_t sub_22A5D720C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_22A5D7234(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_22A5D72AC(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_22A5DA400();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_22A5D72AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22A5D7380(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22A5B5624((uint64_t)v12, *a3);
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
      sub_22A5B5624((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22A5D7380(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22A5DA410();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22A5D753C(a5, a6);
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
  uint64_t v8 = sub_22A5DA4A0();
  if (!v8)
  {
    sub_22A5DA4B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22A5DA500();
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

uint64_t sub_22A5D753C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22A5D75D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22A5D77B4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22A5D77B4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22A5D75D4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_22A5D774C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22A5DA480();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22A5DA4B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22A5DA300();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22A5DA500();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22A5DA4B0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22A5D774C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78970);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22A5D77B4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78970);
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
  char v13 = a4 + 32;
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
  uint64_t result = sub_22A5DA500();
  __break(1u);
  return result;
}

uint64_t sub_22A5D7904@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_22A5D7934()
{
  unint64_t result = qword_26837CF98;
  if (!qword_26837CF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26837CF98);
  }
  return result;
}

unint64_t sub_22A5D7988(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  sub_22A5DA550();
  swift_bridgeObjectRetain();
  sub_22A5DA2D0();
  swift_bridgeObjectRelease();
  sub_22A5DA570();
  uint64_t v6 = sub_22A5DA580();
  return sub_22A5D7B70(a1, a2, a3, v6);
}

unint64_t sub_22A5D7A2C(uint64_t a1)
{
  uint64_t v2 = sub_22A5DA460();
  return sub_22A5D7C54(a1, v2);
}

uint64_t sub_22A5D7A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A5D7AD8()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 28, 7);
}

uint64_t sub_22A5D7B10()
{
  return sub_22A5D5FB8(*(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

uint64_t sub_22A5D7B1C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 38, 7);
}

uint64_t sub_22A5D7B5C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_22A5D7B70(uint64_t a1, uint64_t a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    int v10 = a3;
    uint64_t v11 = ~v6;
    uint64_t v12 = *(void *)(v4 + 48);
    do
    {
      uint64_t v13 = v12 + 24 * v7;
      int v14 = *(unsigned __int16 *)(v13 + 16);
      BOOL v15 = *(void *)v13 == a1 && *(void *)(v13 + 8) == a2;
      if (v15 || (sub_22A5DA510()) && v14 == v10) {
        break;
      }
      unint64_t v7 = (v7 + 1) & v11;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_22A5D7C54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_22A5BDAD0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x22A6CD440](v9, a1);
      sub_22A5DA0B0((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_22A5D7D1C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837CFC0);
  uint64_t result = sub_22A5DA4E0();
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
        swift_retain();
      }
      uint64_t result = sub_22A5DA540();
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
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22A5D7FD4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837CFB8);
  char v38 = a2;
  uint64_t v6 = sub_22A5DA4E0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    uint64_t v29 = *(void *)(v5 + 48) + 24 * v20;
    uint64_t v31 = *(void *)v29;
    uint64_t v30 = *(void *)(v29 + 8);
    __int16 v32 = *(_WORD *)(v29 + 16);
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_22A5DA550();
    swift_bridgeObjectRetain();
    sub_22A5DA2D0();
    swift_bridgeObjectRelease();
    sub_22A5DA570();
    uint64_t result = sub_22A5DA580();
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
    uint64_t v18 = *(void *)(v7 + 48) + 24 * v17;
    *(void *)uint64_t v18 = v31;
    *(void *)(v18 + 8) = v30;
    *(_WORD *)(v18 + 16) = v32;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22A5D8318(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78800);
  char v37 = a2;
  uint64_t v6 = sub_22A5DA4E0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_22A5DA550();
    sub_22A5DA2D0();
    uint64_t result = sub_22A5DA580();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22A5D8620(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD787D8);
  char v36 = a2;
  uint64_t v6 = sub_22A5DA4E0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_22A5DA550();
    sub_22A5DA2D0();
    uint64_t result = sub_22A5DA580();
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
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_22A5D8938(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for ReporterState(0);
  uint64_t v38 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD788E0);
  char v9 = a2;
  uint64_t result = sub_22A5DA4E0();
  uint64_t v11 = result;
  if (*(void *)(v8 + 16))
  {
    uint64_t v35 = v3;
    int64_t v12 = 0;
    uint64_t v13 = *(void *)(v8 + 64);
    char v37 = (void *)(v8 + 64);
    uint64_t v14 = 1 << *(unsigned char *)(v8 + 32);
    if (v14 < 64) {
      uint64_t v15 = ~(-1 << v14);
    }
    else {
      uint64_t v15 = -1;
    }
    unint64_t v16 = v15 & v13;
    int64_t v36 = (unint64_t)(v14 + 63) >> 6;
    uint64_t v17 = result + 64;
    while (1)
    {
      if (v16)
      {
        unint64_t v19 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        unint64_t v20 = v19 | (v12 << 6);
      }
      else
      {
        int64_t v21 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v37;
        if (v21 >= v36) {
          goto LABEL_34;
        }
        unint64_t v22 = v37[v21];
        ++v12;
        if (!v22)
        {
          int64_t v12 = v21 + 1;
          if (v21 + 1 >= v36) {
            goto LABEL_34;
          }
          unint64_t v22 = v37[v12];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_34:
              if ((v9 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v35;
                goto LABEL_41;
              }
              uint64_t v34 = 1 << *(unsigned char *)(v8 + 32);
              if (v34 >= 64) {
                bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *char v37 = -1 << v34;
              }
              uint64_t v3 = v35;
              *(void *)(v8 + 16) = 0;
              break;
            }
            unint64_t v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v12 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_43;
                }
                if (v12 >= v36) {
                  goto LABEL_34;
                }
                unint64_t v22 = v37[v12];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v12 = v23;
          }
        }
LABEL_21:
        unint64_t v16 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v12 << 6);
      }
      uint64_t v24 = *(void *)(*(void *)(v8 + 48) + 8 * v20);
      uint64_t v25 = *(void *)(v38 + 72);
      uint64_t v26 = *(void *)(v8 + 56) + v25 * v20;
      if (v9) {
        sub_22A5B7B60(v26, (uint64_t)v7);
      }
      else {
        sub_22A5DA04C(v26, (uint64_t)v7);
      }
      uint64_t result = sub_22A5DA540();
      uint64_t v27 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v17 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v28) & ~*(void *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v33 = *(void *)(v17 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v18 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v17 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(void *)(*(void *)(v11 + 48) + 8 * v18) = v24;
      uint64_t result = sub_22A5B7B60((uint64_t)v7, *(void *)(v11 + 56) + v25 * v18);
      ++*(void *)(v11 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_22A5D8C84(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_22A5D7988(a2, a3, a4);
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
    sub_22A5D9120();
LABEL_7:
    unint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_22A5D7FD4(v17, a5 & 1);
  unint64_t v23 = sub_22A5D7988(a2, a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_22A5DA520();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  unint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = v20[6] + 24 * v14;
  *(void *)uint64_t v25 = a2;
  *(void *)(v25 + 8) = a3;
  *(_WORD *)(v25 + 16) = a4;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v26 = v20[2];
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (v27)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v28;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22A5D8E14(uint64_t a1, uint64_t a2, char a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_22A5B6AA4(a1, a2);
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
    uint64_t result = (uint64_t)sub_22A5D94CC();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(double *)(v18[7] + 8 * v12) = a4;
      return result;
    }
    goto LABEL_11;
  }
  sub_22A5D8318(result, a3 & 1);
  uint64_t result = sub_22A5B6AA4(a1, a2);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_22A5DA520();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v20 = a1;
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

void *sub_22A5D8F7C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837CFC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22A5DA4D0();
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
    uint64_t result = (void *)swift_retain();
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

void *sub_22A5D9120()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837CFB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22A5DA4D0();
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 24 * v15;
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *(void *)(v17 + 8);
    LOWORD(v17) = *(_WORD *)(v17 + 16);
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v22 = v19;
    *(void *)(v22 + 8) = v18;
    *(_WORD *)(v22 + 16) = v17;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22A5D92E4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78958);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22A5DA4D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v25 = v1;
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
    sub_22A5B5624(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    sub_22A5B5AEC(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
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

void *sub_22A5D94CC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78800);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22A5DA4D0();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22A5D967C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ReporterState(0);
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD788E0);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_22A5DA4D0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v7;
    return result;
  }
  int64_t v24 = v1;
  uint64_t result = (void *)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v9 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v9 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    uint64_t v18 = 8 * v17;
    uint64_t v19 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
    unint64_t v20 = *(void *)(v25 + 72) * v17;
    sub_22A5DA04C(*(void *)(v5 + 56) + v20, (uint64_t)v4);
    *(void *)(*(void *)(v7 + 48) + v18) = v19;
    uint64_t result = (void *)sub_22A5B7B60((uint64_t)v4, *(void *)(v7 + 56) + v20);
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v9 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_22A5D98D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD78A90);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD788E0);
    uint64_t v7 = (void *)sub_22A5DA4F0();
    uint64_t v8 = (uint64_t)v5 + *(int *)(v2 + 48);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_22A5DA104(v9, (uint64_t)v5, &qword_26AD78A90);
      uint64_t v11 = *v5;
      unint64_t result = sub_22A5B6F8C(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v7[6] + 8 * result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = type metadata accessor for ReporterState(0);
      unint64_t result = sub_22A5B7B60(v8, v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_22A5D9A80(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data);
  uint64_t result = sub_22A5D17EC();
  if (!v3)
  {
    uint64_t result = sub_22A5BEB60();
    if (!v3) {
      goto LABEL_8;
    }
  }
  uint64_t v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v4 || *(unsigned __int16 *)(v1 + 24) == 0xFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    if (qword_26AD78A40 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_22A5DA1F0();
    __swift_project_value_buffer(v5, (uint64_t)qword_26AD78CF8);
    swift_retain_n();
    uint64_t v6 = sub_22A5DA1D0();
    os_log_type_t v7 = sub_22A5DA370();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v15 = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      uint64_t v10 = sub_22A5D17EC();
      if (v11)
      {
        unint64_t v12 = v11;
      }
      else
      {
        uint64_t v10 = 0;
        unint64_t v12 = 0xE000000000000000;
      }
      sub_22A5D72AC(v10, v12, &v15);
      sub_22A5DA400();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 12) = 2080;
      unint64_t v13 = AudioServiceType.description.getter(*(_WORD *)(v1 + 24));
      sub_22A5D72AC(v13, v14, &v15);
      sub_22A5DA400();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22A5B3000, v6, v7, "Unable to build MessageDimensions. { appName=%s, serviceType=%s }", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22A6CDBE0](v9, -1, -1);
      MEMORY[0x22A6CDBE0](v8, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    return 0;
  }
  return result;
}

uint64_t sub_22A5D9CE0(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v20 = a1 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v7) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v20 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v20 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v18 = *(void *)(v20 + 8 * v9);
        if (!v18)
        {
          int64_t v9 = v17 + 3;
          if (v17 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v18 = *(void *)(v20 + 8 * v9);
          if (!v18) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v18 - 1) & v18;
    unint64_t v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    uint64_t v12 = *(void *)(a1 + 48) + 24 * v11;
    uint64_t v13 = *(void *)v12;
    uint64_t v14 = *(void *)(v12 + 8);
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8 * v11);
    uint64_t v16 = *(unsigned __int16 *)(v12 + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    a2(v13, v14, v16, v15);
    swift_release();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v19 = v17 + 4;
  if (v19 >= v7) {
    return swift_release();
  }
  unint64_t v18 = *(void *)(v20 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v20 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_22A5D9EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26837CF70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_22A5D9F10()
{
  unint64_t result = qword_26AD78A88;
  if (!qword_26AD78A88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD78A88);
  }
  return result;
}

uint64_t sub_22A5D9F50(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22A5D9F98(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_22A5D9FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReporterState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A5DA04C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ReporterState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22A5DA0B0(uint64_t a1)
{
  return a1;
}

uint64_t sub_22A5DA104(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22A5DA170()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_22A5DA180()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_22A5DA190()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_22A5DA1A0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22A5DA1B0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22A5DA1C0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_22A5DA1D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22A5DA1E0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22A5DA1F0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22A5DA200()
{
  return MEMORY[0x270FA08E0]();
}

uint64_t sub_22A5DA210()
{
  return MEMORY[0x270FA2C58]();
}

uint64_t sub_22A5DA220()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22A5DA230()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22A5DA240()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t sub_22A5DA250()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22A5DA260()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_22A5DA270()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_22A5DA280()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22A5DA290()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_22A5DA2A0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22A5DA2B0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_22A5DA2C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22A5DA2D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22A5DA2E0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22A5DA2F0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_22A5DA300()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22A5DA310()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22A5DA320()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22A5DA330()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22A5DA340()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22A5DA350()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22A5DA360()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22A5DA370()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22A5DA380()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_22A5DA390()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22A5DA3A0()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_22A5DA3B0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_22A5DA3C0()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_22A5DA3D0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22A5DA3E0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_22A5DA3F0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22A5DA400()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22A5DA410()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22A5DA420()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_22A5DA430()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22A5DA440()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22A5DA450()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_22A5DA460()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_22A5DA470()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_22A5DA480()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22A5DA490()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22A5DA4A0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22A5DA4B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22A5DA4C0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22A5DA4D0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22A5DA4E0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22A5DA4F0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22A5DA500()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22A5DA510()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22A5DA520()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22A5DA530()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22A5DA540()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_22A5DA550()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22A5DA560()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22A5DA570()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_22A5DA580()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_internalBuild()
{
  return MEMORY[0x270F96148]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
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

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
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

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x270EDAB50]();
}

uint64_t pc_session_add_metric()
{
  return MEMORY[0x270F9ABA0]();
}

uint64_t pc_session_begin()
{
  return MEMORY[0x270F9ABA8]();
}

uint64_t pc_session_create()
{
  return MEMORY[0x270F9ABB0]();
}

uint64_t pc_session_destroy()
{
  return MEMORY[0x270F9ABC0]();
}

uint64_t pc_session_end()
{
  return MEMORY[0x270F9ABC8]();
}

uint64_t pc_session_get_procname()
{
  return MEMORY[0x270F9ABD0]();
}

uint64_t pc_session_get_values()
{
  return MEMORY[0x270F9ABE0]();
}

uint64_t pc_session_set_procpid()
{
  return MEMORY[0x270F9ABE8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
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