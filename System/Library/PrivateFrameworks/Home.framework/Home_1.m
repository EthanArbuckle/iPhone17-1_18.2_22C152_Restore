void sub_20BA9EF98(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  unint64_t i;
  unint64_t v23;
  id v24;
  char v25;
  int64_t v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int64_t v31;
  int64_t v32;
  uint64_t v34;
  uint64_t v36;
  void *v38;

  v6 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v7 = v6 - 1;
  v36 = a3 + 56;
  while (2)
  {
    v34 = v7;
    do
    {
      while (1)
      {
        if ((*a5 & 0x8000000000000000) == 0)
        {
          v9 = a5[3];
          v8 = a5[4];
          if (v8)
          {
            v10 = (v8 - 1) & v8;
            v11 = __clz(__rbit64(v8)) | (v9 << 6);
LABEL_7:
            v12 = *(void **)(*(void *)(*a5 + 48) + 8 * v11);
            v13 = v12;
            goto LABEL_8;
          }
          v26 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_49;
          }
          v27 = (unint64_t)(a5[2] + 64) >> 6;
          if (v26 >= v27)
          {
            v12 = 0;
            v10 = 0;
            goto LABEL_8;
          }
          v28 = a5[1];
          v29 = *(void *)(v28 + 8 * v26);
          if (v29)
          {
LABEL_22:
            v10 = (v29 - 1) & v29;
            v11 = __clz(__rbit64(v29)) + (v26 << 6);
            v9 = v26;
            goto LABEL_7;
          }
          v31 = v9 + 2;
          if (v9 + 2 >= v27) {
            goto LABEL_41;
          }
          v29 = *(void *)(v28 + 8 * v31);
          if (v29)
          {
LABEL_29:
            v26 = v31;
            goto LABEL_22;
          }
          if (v9 + 3 < v27)
          {
            v29 = *(void *)(v28 + 8 * (v9 + 3));
            if (v29)
            {
              v26 = v9 + 3;
              goto LABEL_22;
            }
            v31 = v9 + 4;
            if (v9 + 4 >= v27)
            {
              v12 = 0;
              v10 = 0;
              v9 += 3;
LABEL_8:
              a5[3] = v9;
              a5[4] = v10;
              if (!v12) {
                goto LABEL_47;
              }
              goto LABEL_12;
            }
            v29 = *(void *)(v28 + 8 * v31);
            if (v29) {
              goto LABEL_29;
            }
            v26 = v9 + 5;
            if (v9 + 5 < v27)
            {
              v29 = *(void *)(v28 + 8 * v26);
              if (v29) {
                goto LABEL_22;
              }
              v26 = v27 - 1;
              v32 = v9 + 6;
              while (v27 != v32)
              {
                v29 = *(void *)(v28 + 8 * v32++);
                if (v29)
                {
                  v26 = v32 - 1;
                  goto LABEL_22;
                }
              }
LABEL_41:
              v12 = 0;
              v10 = 0;
              v9 = v26;
              goto LABEL_8;
            }
          }
          v12 = 0;
          v10 = 0;
          v9 = v31;
          goto LABEL_8;
        }
        if (!sub_20BCE7CE0()
          || (sub_20BA208F4(0, (unint64_t *)&qword_26AB2E410),
              swift_unknownObjectRetain(),
              swift_dynamicCast(),
              v12 = v38,
              swift_unknownObjectRelease(),
              !v38))
        {
LABEL_47:
          swift_retain();
          sub_20BA90554(a1, a2, v34, a3);
          return;
        }
LABEL_12:
        v14 = sub_20BCE7B40();
        v15 = -1 << *(unsigned char *)(a3 + 32);
        v16 = v14 & ~v15;
        v17 = v16 >> 6;
        v18 = 1 << v16;
        if (((1 << v16) & *(void *)(v36 + 8 * (v16 >> 6))) == 0) {
          goto LABEL_3;
        }
        sub_20BA208F4(0, (unint64_t *)&qword_26AB2E410);
        v19 = *(id *)(*(void *)(a3 + 48) + 8 * v16);
        v20 = sub_20BCE7B50();

        if (v20) {
          break;
        }
        v21 = ~v15;
        for (i = v16 + 1; ; i = v23 + 1)
        {
          v23 = i & v21;
          if (((*(void *)(v36 + (((i & v21) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v21)) & 1) == 0) {
            break;
          }
          v24 = *(id *)(*(void *)(a3 + 48) + 8 * v23);
          v25 = sub_20BCE7B50();

          if (v25)
          {

            v17 = v23 >> 6;
            v18 = 1 << v23;
            goto LABEL_25;
          }
        }
LABEL_3:
      }
LABEL_25:
      v30 = a1[v17];
      a1[v17] = v30 & ~v18;
    }
    while ((v18 & v30) == 0);
    v7 = v34 - 1;
    if (__OFSUB__(v34, 1))
    {
LABEL_49:
      __break(1u);
      return;
    }
    if (v34 != 1) {
      continue;
    }
    break;
  }
}

void sub_20BA9F328(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  v5 = a5;
  uint64_t v7 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v37 = a3 + 56;
  while (2)
  {
    uint64_t v34 = v8;
    do
    {
      while (1)
      {
        if ((*v5 & 0x8000000000000000) == 0)
        {
          int64_t v10 = v5[3];
          unint64_t v9 = v5[4];
          if (v9)
          {
            uint64_t v11 = (v9 - 1) & v9;
            unint64_t v12 = __clz(__rbit64(v9)) | (v10 << 6);
LABEL_7:
            v13 = *(void **)(*(void *)(*v5 + 48) + 8 * v12);
            id v14 = v13;
            goto LABEL_8;
          }
          int64_t v27 = v10 + 1;
          if (__OFADD__(v10, 1))
          {
            __break(1u);
            goto LABEL_47;
          }
          int64_t v28 = (unint64_t)(v5[2] + 64) >> 6;
          if (v27 >= v28)
          {
            v13 = 0;
            uint64_t v11 = 0;
            goto LABEL_8;
          }
          uint64_t v29 = v5[1];
          unint64_t v30 = *(void *)(v29 + 8 * v27);
          if (v30)
          {
LABEL_22:
            uint64_t v11 = (v30 - 1) & v30;
            unint64_t v12 = __clz(__rbit64(v30)) + (v27 << 6);
            int64_t v10 = v27;
            goto LABEL_7;
          }
          if (v10 + 2 < v28)
          {
            unint64_t v30 = *(void *)(v29 + 8 * (v10 + 2));
            if (v30)
            {
              int64_t v27 = v10 + 2;
              goto LABEL_22;
            }
            if (v10 + 3 >= v28)
            {
              v13 = 0;
              uint64_t v11 = 0;
              v10 += 2;
              goto LABEL_8;
            }
            unint64_t v30 = *(void *)(v29 + 8 * (v10 + 3));
            if (v30)
            {
              int64_t v27 = v10 + 3;
              goto LABEL_22;
            }
            int64_t v27 = v10 + 4;
            if (v10 + 4 >= v28)
            {
              v13 = 0;
              uint64_t v11 = 0;
              v10 += 3;
LABEL_8:
              v5[3] = v10;
              v5[4] = v11;
              if (!v13) {
                goto LABEL_45;
              }
              goto LABEL_12;
            }
            unint64_t v30 = *(void *)(v29 + 8 * v27);
            if (v30) {
              goto LABEL_22;
            }
            int64_t v27 = v28 - 1;
            int64_t v32 = v10 + 5;
            while (v28 != v32)
            {
              unint64_t v30 = *(void *)(v29 + 8 * v32++);
              if (v30)
              {
                int64_t v27 = v32 - 1;
                goto LABEL_22;
              }
            }
          }
          v13 = 0;
          uint64_t v11 = 0;
          int64_t v10 = v27;
          goto LABEL_8;
        }
        if (!sub_20BCE7CE0()
          || (sub_20BA208F4(0, (unint64_t *)&qword_2676AE1B0),
              swift_unknownObjectRetain(),
              swift_dynamicCast(),
              v13 = v38,
              swift_unknownObjectRelease(),
              !v38))
        {
LABEL_45:
          swift_retain();
          sub_20BA90560(a1, a2, v34, a3);
          return;
        }
LABEL_12:
        uint64_t v15 = sub_20BCE7B40();
        uint64_t v16 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v17 = v15 & ~v16;
        unint64_t v18 = v17 >> 6;
        uint64_t v19 = 1 << v17;
        if (((1 << v17) & *(void *)(v37 + 8 * (v17 >> 6))) == 0) {
          goto LABEL_3;
        }
        sub_20BA208F4(0, (unint64_t *)&qword_2676AE1B0);
        id v20 = *(id *)(*(void *)(a3 + 48) + 8 * v17);
        char v21 = sub_20BCE7B50();

        if (v21) {
          break;
        }
        uint64_t v22 = ~v16;
        for (unint64_t i = v17 + 1; ; unint64_t i = v24 + 1)
        {
          unint64_t v24 = i & v22;
          if (((*(void *)(v37 + (((i & v22) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v22)) & 1) == 0) {
            break;
          }
          id v25 = *(id *)(*(void *)(a3 + 48) + 8 * v24);
          char v26 = sub_20BCE7B50();

          if (v26)
          {

            unint64_t v18 = v24 >> 6;
            uint64_t v19 = 1 << v24;
            goto LABEL_25;
          }
        }
LABEL_3:

        v5 = a5;
      }

LABEL_25:
      v5 = a5;
      unint64_t v31 = a1[v18];
      a1[v18] = v31 & ~v19;
    }
    while ((v19 & v31) == 0);
    uint64_t v8 = v34 - 1;
    if (__OFSUB__(v34, 1))
    {
LABEL_47:
      __break(1u);
      return;
    }
    if (v34 != 1) {
      continue;
    }
    break;
  }
}

uint64_t sub_20BA9F6A0(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v52 = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676AE688);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_20BCE69E0();
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v13);
  v65 = (char *)&v52 - v17;
  uint64_t v18 = *(void *)(a3 + 16);
  uint64_t v19 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  uint64_t v20 = *(unint64_t *)((char *)a1 + v19);
  v54 = a1;
  v55 = v11;
  *(unint64_t *)((char *)a1 + v19) = v20 & ((-1 << a4) - 1);
  uint64_t v22 = v21;
  uint64_t v23 = v18 - 1;
  uint64_t v63 = v21 + 16;
  uint64_t v64 = a3;
  v58 = (unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  v59 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  v56 = a5;
  v57 = (void (**)(char *, char *, uint64_t))(v21 + 32);
  uint64_t v62 = a3 + 56;
  unint64_t v24 = (void (**)(char *, uint64_t))(v21 + 8);
  uint64_t v60 = v21;
  while (2)
  {
    uint64_t v53 = v23;
    do
    {
      while (1)
      {
        uint64_t v26 = *a5;
        uint64_t v27 = a5[1];
        uint64_t v29 = a5[2];
        int64_t v28 = a5[3];
        unint64_t v30 = a5[4];
        if (v30)
        {
          uint64_t v61 = (v30 - 1) & v30;
          unint64_t v31 = __clz(__rbit64(v30)) | (v28 << 6);
LABEL_7:
          unint64_t v32 = *(void *)(v26 + 48) + *(void *)(v22 + 72) * v31;
          v33 = *(void (**)(char *, unint64_t, uint64_t))(v22 + 16);
          uint64_t v34 = v26;
          v33(v11, v32, v12);
          uint64_t v35 = 0;
          goto LABEL_8;
        }
        int64_t v44 = v28 + 1;
        if (__OFADD__(v28, 1))
        {
          __break(1u);
          goto LABEL_44;
        }
        int64_t v45 = (unint64_t)(v29 + 64) >> 6;
        if (v44 >= v45)
        {
          uint64_t v61 = 0;
          uint64_t v35 = 1;
          uint64_t v34 = v26;
          goto LABEL_8;
        }
        unint64_t v46 = *(void *)(v27 + 8 * v44);
        if (v46) {
          goto LABEL_17;
        }
        int64_t v49 = v28 + 2;
        if (v28 + 2 >= v45) {
          goto LABEL_35;
        }
        unint64_t v46 = *(void *)(v27 + 8 * v49);
        if (v46) {
          goto LABEL_23;
        }
        if (v28 + 3 >= v45) {
          goto LABEL_36;
        }
        unint64_t v46 = *(void *)(v27 + 8 * (v28 + 3));
        if (v46)
        {
          int64_t v44 = v28 + 3;
          goto LABEL_17;
        }
        int64_t v49 = v28 + 4;
        if (v28 + 4 < v45)
        {
          unint64_t v46 = *(void *)(v27 + 8 * v49);
          if (v46)
          {
LABEL_23:
            int64_t v44 = v49;
LABEL_17:
            uint64_t v61 = (v46 - 1) & v46;
            unint64_t v31 = __clz(__rbit64(v46)) + (v44 << 6);
            int64_t v28 = v44;
            goto LABEL_7;
          }
          int64_t v44 = v28 + 5;
          if (v28 + 5 < v45)
          {
            unint64_t v46 = *(void *)(v27 + 8 * v44);
            if (v46) {
              goto LABEL_17;
            }
            int64_t v44 = v45 - 1;
            int64_t v50 = v28 + 6;
            while (v45 != v50)
            {
              unint64_t v46 = *(void *)(v27 + 8 * v50++);
              if (v46)
              {
                int64_t v44 = v50 - 1;
                goto LABEL_17;
              }
            }
LABEL_35:
            uint64_t v61 = 0;
            uint64_t v35 = 1;
            int64_t v28 = v44;
            uint64_t v34 = v26;
            goto LABEL_8;
          }
LABEL_36:
          uint64_t v61 = 0;
          uint64_t v35 = 1;
          int64_t v28 = v49;
          uint64_t v34 = v26;
          goto LABEL_8;
        }
        uint64_t v61 = 0;
        uint64_t v35 = 1;
        v28 += 3;
        uint64_t v34 = v26;
LABEL_8:
        (*v59)(v11, v35, 1, v12);
        *a5 = v34;
        a5[1] = v27;
        a5[2] = v29;
        a5[3] = v28;
        a5[4] = v61;
        if ((*v58)(v11, 1, v12) == 1)
        {
          sub_20BA1FD90((uint64_t)v11, (uint64_t *)&unk_2676AE688);
          uint64_t v51 = v64;
          swift_retain();
          return sub_20BA90578(v54, v52, v53, v51);
        }
        (*v57)(v65, v11, v12);
        uint64_t v36 = v64;
        sub_20BAA0688((unint64_t *)&unk_2676ADD70, MEMORY[0x263F48460]);
        uint64_t v37 = sub_20BCE7590();
        uint64_t v38 = -1 << *(unsigned char *)(v36 + 32);
        unint64_t v39 = v37 & ~v38;
        if ((*(void *)(v62 + ((v39 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v39)) {
          break;
        }
        id v25 = *v24;
        uint64_t v22 = v60;
LABEL_4:
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v25)(v65, v12);
      }
      uint64_t v61 = (unint64_t)v24 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      uint64_t v40 = ~v38;
      uint64_t v41 = *(void *)(v60 + 72);
      v42 = *(void (**)(char *, unint64_t, uint64_t))(v60 + 16);
      while (1)
      {
        v42(v15, *(void *)(v64 + 48) + v41 * v39, v12);
        sub_20BAA0688(&qword_2676AE130, MEMORY[0x263F48460]);
        char v43 = sub_20BCE75D0();
        id v25 = *v24;
        (*v24)(v15, v12);
        if (v43) {
          break;
        }
        unint64_t v39 = (v39 + 1) & v40;
        if (((*(void *)(v62 + ((v39 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v39) & 1) == 0)
        {
          uint64_t v11 = v55;
          a5 = v56;
          uint64_t v22 = v60;
          goto LABEL_4;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v25)(v65, v12);
      uint64_t v47 = (v39 >> 3) & 0x1FFFFFFFFFFFFFF8;
      uint64_t v11 = v55;
      uint64_t v48 = *(unint64_t *)((char *)v54 + v47);
      *(unint64_t *)((char *)v54 + v47) = v48 & ~(1 << v39);
      a5 = v56;
      uint64_t v22 = v60;
    }
    while ((v48 & (1 << v39)) == 0);
    uint64_t v23 = v53 - 1;
    if (__OFSUB__(v53, 1))
    {
LABEL_44:
      __break(1u);
      return result;
    }
    if (v53 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_20BA9FC24(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_20BA9FDAC((void *)((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3, a2);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_20BA9FDAC((unint64_t *)v8, v5, v3, a2);
    swift_release();
    MEMORY[0x21053F820](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_20BA9FDAC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v39 = a2;
  uint64_t v41 = a1;
  uint64_t v6 = sub_20BCE69E0();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  v54 = (char *)&v39 - v11;
  MEMORY[0x270FA5388](v10);
  unint64_t v46 = (char *)&v39 - v13;
  uint64_t v14 = *(void *)(a3 + 64);
  uint64_t v42 = a3 + 64;
  uint64_t v15 = 1 << *(unsigned char *)(a3 + 32);
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v14;
  int64_t v43 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v52 = v12 + 16;
  uint64_t v53 = a4;
  uint64_t v45 = v12 + 32;
  uint64_t v51 = a4 + 56;
  uint64_t v47 = v12;
  uint64_t v48 = a3;
  uint64_t v18 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v40 = 0;
  int64_t v20 = 0;
  while (v17)
  {
    uint64_t v50 = (v17 - 1) & v17;
    unint64_t v22 = __clz(__rbit64(v17)) | (v20 << 6);
LABEL_22:
    uint64_t v26 = v47;
    uint64_t v27 = *(void *)(v47 + 72);
    int64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v47 + 16);
    uint64_t v29 = v46;
    v28(v46, *(void *)(v48 + 48) + v27 * v22, v6);
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v54, v29, v6);
    uint64_t v30 = v53;
    sub_20BAA0688((unint64_t *)&unk_2676ADD70, MEMORY[0x263F48460]);
    uint64_t v31 = sub_20BCE7590();
    uint64_t v32 = -1 << *(unsigned char *)(v30 + 32);
    unint64_t v33 = v31 & ~v32;
    if ((*(void *)(v51 + ((v33 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v33))
    {
      uint64_t v44 = (unint64_t)v18 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      int64_t v49 = v20;
      uint64_t v34 = ~v32;
      while (1)
      {
        v28(v9, *(void *)(v53 + 48) + v33 * v27, v6);
        sub_20BAA0688(&qword_2676AE130, MEMORY[0x263F48460]);
        char v35 = sub_20BCE75D0();
        uint64_t v21 = *v18;
        (*v18)(v9, v6);
        if (v35) {
          break;
        }
        unint64_t v33 = (v33 + 1) & v34;
        if (((*(void *)(v51 + ((v33 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v33) & 1) == 0)
        {
          int64_t v20 = v49;
          goto LABEL_6;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v21)(v54, v6);
      uint64_t v36 = (v33 >> 3) & 0x1FFFFFFFFFFFFFF8;
      uint64_t v37 = *(unint64_t *)((char *)v41 + v36);
      *(unint64_t *)((char *)v41 + v36) = v37 | (1 << v33);
      int64_t v20 = v49;
      unint64_t v17 = v50;
      if ((v37 & (1 << v33)) == 0)
      {
        BOOL v23 = __OFADD__(v40++, 1);
        if (v23) {
          goto LABEL_38;
        }
      }
    }
    else
    {
      uint64_t v21 = *v18;
LABEL_6:
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v21)(v54, v6);
      unint64_t v17 = v50;
    }
  }
  BOOL v23 = __OFADD__(v20++, 1);
  if (v23)
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v20 >= v43) {
    goto LABEL_35;
  }
  unint64_t v24 = *(void *)(v42 + 8 * v20);
  if (v24)
  {
LABEL_21:
    uint64_t v50 = (v24 - 1) & v24;
    unint64_t v22 = __clz(__rbit64(v24)) + (v20 << 6);
    goto LABEL_22;
  }
  int64_t v25 = v20 + 1;
  if (v20 + 1 >= v43) {
    goto LABEL_35;
  }
  unint64_t v24 = *(void *)(v42 + 8 * v25);
  if (v24) {
    goto LABEL_20;
  }
  int64_t v25 = v20 + 2;
  if (v20 + 2 >= v43) {
    goto LABEL_35;
  }
  unint64_t v24 = *(void *)(v42 + 8 * v25);
  if (v24) {
    goto LABEL_20;
  }
  int64_t v25 = v20 + 3;
  if (v20 + 3 >= v43) {
    goto LABEL_35;
  }
  unint64_t v24 = *(void *)(v42 + 8 * v25);
  if (v24) {
    goto LABEL_20;
  }
  int64_t v25 = v20 + 4;
  if (v20 + 4 >= v43)
  {
LABEL_35:
    swift_release();
    uint64_t v38 = v53;
    swift_retain();
    return sub_20BA90578(v41, v39, v40, v38);
  }
  unint64_t v24 = *(void *)(v42 + 8 * v25);
  if (v24)
  {
LABEL_20:
    int64_t v20 = v25;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v20 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v20 >= v43) {
      goto LABEL_35;
    }
    unint64_t v24 = *(void *)(v42 + 8 * v20);
    ++v25;
    if (v24) {
      goto LABEL_21;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_20BAA0258(uint64_t a1)
{
  uint64_t v2 = sub_20BCE6B40();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v25 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v25 - v10;
  sub_20BAA0688(&qword_2676AF4B8, MEMORY[0x263F48588]);
  uint64_t result = sub_20BCE7990();
  int64_t v13 = 0;
  uint64_t v29 = a1;
  uint64_t v30 = result;
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v15 = a1 + 64;
  uint64_t v14 = v16;
  uint64_t v17 = 1 << *(unsigned char *)(v15 - 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & v14;
  uint64_t v26 = v15;
  int64_t v27 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v28 = v3 + 16;
  while (1)
  {
    if (v19)
    {
      unint64_t v20 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_5;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v22 >= v27) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v27) {
        goto LABEL_24;
      }
      unint64_t v23 = *(void *)(v26 + 8 * v13);
      if (!v23)
      {
        int64_t v13 = v22 + 2;
        if (v22 + 2 >= v27) {
          goto LABEL_24;
        }
        unint64_t v23 = *(void *)(v26 + 8 * v13);
        if (!v23)
        {
          int64_t v13 = v22 + 3;
          if (v22 + 3 >= v27) {
            goto LABEL_24;
          }
          unint64_t v23 = *(void *)(v26 + 8 * v13);
          if (!v23)
          {
            int64_t v13 = v22 + 4;
            if (v22 + 4 >= v27) {
              goto LABEL_24;
            }
            unint64_t v23 = *(void *)(v26 + 8 * v13);
            if (!v23)
            {
              int64_t v13 = v22 + 5;
              if (v22 + 5 >= v27)
              {
LABEL_24:
                swift_release();
                return v30;
              }
              unint64_t v23 = *(void *)(v26 + 8 * v13);
              int64_t v24 = v22 + 5;
              if (!v23) {
                break;
              }
            }
          }
        }
      }
    }
LABEL_23:
    unint64_t v19 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v11, *(void *)(v29 + 56) + *(void *)(v3 + 72) * v21, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v11, v2);
    sub_20BAA07AC((uint64_t)v9, v6);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v26 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

BOOL sub_20BAA0578()
{
  uint64_t v0 = sub_20BCE6B20();
  char v2 = v1;
  uint64_t v3 = sub_20BCE69D0();
  return (v2 & 1) == 0 && v0 == v3;
}

uint64_t sub_20BAA05D4(unint64_t *a1, uint64_t *a2)
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

id sub_20BAA0624(uint64_t a1)
{
  return sub_20BA9D23C(a1, *(char **)(v1 + 16));
}

uint64_t sub_20BAA0640()
{
  return sub_20BAA0688((unint64_t *)&unk_2676ADD70, MEMORY[0x263F48460]);
}

uint64_t sub_20BAA0688(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_20BAA06D0()
{
  sub_20BA67C5C();
  if (v0 <= 0x3F) {
    swift_initClassMetadata2();
  }
}

uint64_t method lookup function for MatterAccessoryLikeItemProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MatterAccessoryLikeItemProvider);
}

uint64_t dispatch thunk of MatterAccessoryLikeItemProvider.__allocating_init(in:in:filter:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_20BAA07A4()
{
  return type metadata accessor for MatterAccessoryLikeItemProvider();
}

uint64_t sub_20BAA07AC(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_20BCE6B40();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_20BAA0688(&qword_2676AF4B8, MEMORY[0x263F48588]);
  swift_bridgeObjectRetain();
  unint64_t v33 = a2;
  uint64_t v11 = sub_20BCE7590();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      unint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_20BAA0688(&qword_2676AF4C0, MEMORY[0x263F48588]);
      char v21 = sub_20BCE75D0();
      int64_t v22 = *v17;
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
    int64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_20BAA0AD0((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_20BAA0AD0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_20BCE6B40();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 <= v10)
  {
    if (a3) {
      sub_20BAA13E4();
    }
    else {
      sub_20BAA101C();
    }
    uint64_t v12 = *v3;
    sub_20BAA0688(&qword_2676AF4B8, MEMORY[0x263F48588]);
    uint64_t v13 = sub_20BCE7590();
    uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
    a2 = v13 & ~v14;
    uint64_t v30 = v12;
    uint64_t v15 = v12 + 56;
    if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v16 = ~v14;
      unint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
      uint64_t v18 = v7 + 16;
      uint64_t v17 = v19;
      uint64_t v20 = *(void *)(v18 + 56);
      do
      {
        v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
        sub_20BAA0688(&qword_2676AF4C0, MEMORY[0x263F48588]);
        char v21 = sub_20BCE75D0();
        (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
        if (v21) {
          goto LABEL_14;
        }
        a2 = (a2 + 1) & v16;
      }
      while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
  else if ((a3 & 1) == 0)
  {
    sub_20BAA0D68();
  }
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
LABEL_14:
  uint64_t result = sub_20BCE8050();
  __break(1u);
  return result;
}

void *sub_20BAA0D68()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_20BCE6B40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF4C8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_20BCE7D70();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  uint64_t v23 = v6 + 56;
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
      goto LABEL_30;
    }
    if (v18 >= v24) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_26;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19)
        {
          int64_t v11 = v18 + 3;
          if (v18 + 3 >= v24) {
            goto LABEL_26;
          }
          unint64_t v19 = *(void *)(v23 + 8 * v11);
          if (!v19)
          {
            int64_t v11 = v18 + 4;
            if (v18 + 4 >= v24)
            {
LABEL_26:
              uint64_t result = (void *)swift_release();
              uint64_t v1 = v22;
              goto LABEL_28;
            }
            unint64_t v19 = *(void *)(v23 + 8 * v11);
            int64_t v20 = v18 + 4;
            if (!v19) {
              break;
            }
          }
        }
      }
    }
LABEL_25:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_20BAA101C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_20BCE6B40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF4C8);
  uint64_t v7 = sub_20BCE7D80();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_36:
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
      goto LABEL_25;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    if (v20 >= v36) {
      goto LABEL_34;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_34;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_34;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21)
        {
          int64_t v16 = v20 + 3;
          if (v20 + 3 >= v36) {
            goto LABEL_34;
          }
          unint64_t v21 = *(void *)(v35 + 8 * v16);
          if (!v21)
          {
            int64_t v16 = v20 + 4;
            if (v20 + 4 >= v36)
            {
LABEL_34:
              uint64_t result = swift_release_n();
              uint64_t v1 = v34;
              goto LABEL_36;
            }
            unint64_t v21 = *(void *)(v35 + 8 * v16);
            int64_t v22 = v20 + 4;
            if (!v21) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_25:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_20BAA0688(&qword_2676AF4B8, MEMORY[0x263F48588]);
    uint64_t result = sub_20BCE7590();
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
          goto LABEL_37;
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
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_34;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_24;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_20BAA13E4()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_20BCE6B40();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF4C8);
  uint64_t v5 = sub_20BCE7D80();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v38 = (void *)(v4 + 56);
    uint64_t v39 = v2;
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    int64_t v36 = v0;
    int64_t v37 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    unint64_t v14 = v41;
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
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v37) {
          goto LABEL_34;
        }
        unint64_t v20 = v38[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v37) {
            goto LABEL_34;
          }
          unint64_t v20 = v38[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v37) {
              goto LABEL_34;
            }
            unint64_t v20 = v38[v21];
            if (!v20)
            {
              int64_t v21 = v13 + 4;
              if (v13 + 4 >= v37) {
                goto LABEL_34;
              }
              unint64_t v20 = v38[v21];
              if (!v20)
              {
                int64_t v21 = v13 + 5;
                if (v13 + 5 >= v37)
                {
LABEL_34:
                  swift_release();
                  uint64_t v1 = v36;
                  uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                  if (v34 >= 64) {
                    bzero(v38, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                  }
                  else {
                    void *v38 = -1 << v34;
                  }
                  *(void *)(v4 + 16) = 0;
                  break;
                }
                unint64_t v20 = v38[v21];
                for (uint64_t i = v13 + 5; !v20; ++i)
                {
                  int64_t v21 = i + 1;
                  if (__OFADD__(i, 1)) {
                    goto LABEL_40;
                  }
                  if (v21 >= v37) {
                    goto LABEL_34;
                  }
                  unint64_t v20 = v38[v21];
                }
              }
            }
          }
        }
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      sub_20BAA0688(&qword_2676AF4B8, MEMORY[0x263F48588]);
      uint64_t result = sub_20BCE7590();
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
            goto LABEL_39;
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

uint64_t sub_20BAA17EC(uint64_t *a1, void **a2)
{
  return sub_20BA9B97C(a1, *a2, *(void (**)(void *))(v2 + 16), *(void *)(v2 + 24), *(NSObject **)(v2 + 32));
}

uint64_t sub_20BAA1810(uint64_t a1, char *a2)
{
  return sub_20BA9BDF4(a1, a2, *(void (**)(char *))(v2 + 16));
}

void sub_20BAA182C(uint64_t a1, id *a2)
{
  sub_20BA2D688(&v2, *a2);
}

uint64_t sub_20BAA1878(uint64_t a1, uint64_t (*a2)(char *), uint64_t a3, uint64_t a4)
{
  uint64_t v44 = a4;
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v5 = sub_20BCE69E0();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v36 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v42 = (char *)&v36 - v13;
  uint64_t v48 = MEMORY[0x263F8EE78];
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v36 = a1 + 56;
  uint64_t v15 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & v14;
  uint64_t v47 = v12 + 16;
  uint64_t v41 = v12 + 32;
  uint64_t v43 = v12;
  int64_t v37 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v38 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v45 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v19 = 0;
  while (1)
  {
    if (v17)
    {
      unint64_t v20 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v21 = v20 | (v19 << 6);
    }
    else
    {
      if (__OFADD__(v19++, 1)) {
        goto LABEL_34;
      }
      if (v19 >= v37)
      {
LABEL_31:
        swift_release();
        return v48;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v19);
      if (!v23)
      {
        int64_t v24 = v19 + 1;
        if (v19 + 1 >= v37) {
          goto LABEL_31;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          int64_t v24 = v19 + 2;
          if (v19 + 2 >= v37) {
            goto LABEL_31;
          }
          unint64_t v23 = *(void *)(v36 + 8 * v24);
          if (!v23)
          {
            int64_t v24 = v19 + 3;
            if (v19 + 3 >= v37) {
              goto LABEL_31;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v24);
            if (!v23)
            {
              int64_t v24 = v19 + 4;
              if (v19 + 4 >= v37) {
                goto LABEL_31;
              }
              unint64_t v23 = *(void *)(v36 + 8 * v24);
              if (!v23)
              {
                while (1)
                {
                  int64_t v19 = v24 + 1;
                  if (__OFADD__(v24, 1)) {
                    goto LABEL_35;
                  }
                  if (v19 >= v37) {
                    goto LABEL_31;
                  }
                  unint64_t v23 = *(void *)(v36 + 8 * v19);
                  ++v24;
                  if (v23) {
                    goto LABEL_18;
                  }
                }
              }
            }
          }
        }
        int64_t v19 = v24;
      }
LABEL_18:
      unint64_t v17 = (v23 - 1) & v23;
      unint64_t v21 = __clz(__rbit64(v23)) + (v19 << 6);
    }
    uint64_t v25 = v42;
    uint64_t v26 = v43;
    uint64_t v27 = *(void *)(v43 + 72);
    unint64_t v28 = *(void (**)(char *, unint64_t, uint64_t))(v43 + 16);
    v28(v42, *(void *)(v45 + 48) + v27 * v21, v5);
    uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v26 + 32))(v11, v25, v5);
    uint64_t v29 = v44;
    if (!*(void *)(v44 + 16)) {
      break;
    }
    uint64_t result = sub_20BA1742C((uint64_t)v11);
    if ((v30 & 1) == 0) {
      goto LABEL_33;
    }
    v28(v8, *(void *)(v29 + 56) + result * v27, v5);
    uint64_t v31 = v46;
    uint64_t v32 = v39(v8);
    if (v31)
    {
      uint64_t v35 = *v38;
      (*v38)(v8, v5);
      v35(v11, v5);
      swift_release();
      return swift_bridgeObjectRelease();
    }
    uint64_t v33 = v32;
    uint64_t v46 = 0;
    uint64_t v34 = *v38;
    (*v38)(v8, v5);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v34)(v11, v5);
    if (v33)
    {
      MEMORY[0x21053DB50](result);
      if (*(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_20BCE7760();
      }
      sub_20BCE77A0();
      uint64_t result = sub_20BCE7730();
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_20BAA1C80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20BCE69E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v32 = (char *)&v26 - v9;
  uint64_t v34 = MEMORY[0x263F8EE78];
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v27 = a1 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  uint64_t v30 = v5 + 32;
  uint64_t v31 = v5 + 16;
  int64_t v28 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v29 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
  uint64_t v33 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v15 = 0;
  if (!v13) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v16 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v16 | (v15 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    unint64_t v21 = v32;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v32, *(void *)(v33 + 48) + *(void *)(v5 + 72) * i, v4);
    uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 32))(v8, v21, v4);
    if (!*(void *)(a2 + 16))
    {
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    uint64_t result = sub_20BA1742C((uint64_t)v8);
    if ((v22 & 1) == 0) {
      goto LABEL_29;
    }
    unint64_t v23 = *v29;
    id v24 = *(id *)(*(void *)(a2 + 56) + 8 * result);
    uint64_t v25 = v23(v8, v4);
    MEMORY[0x21053DB50](v25);
    if (*(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_20BCE7760();
    }
    sub_20BCE77A0();
    uint64_t result = sub_20BCE7730();
    if (v13) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v18 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      goto LABEL_30;
    }
    if (v18 >= v28) {
      goto LABEL_27;
    }
    unint64_t v19 = *(void *)(v27 + 8 * v18);
    ++v15;
    if (!v19)
    {
      int64_t v15 = v18 + 1;
      if (v18 + 1 >= v28) {
        goto LABEL_27;
      }
      unint64_t v19 = *(void *)(v27 + 8 * v15);
      if (!v19)
      {
        int64_t v15 = v18 + 2;
        if (v18 + 2 >= v28) {
          goto LABEL_27;
        }
        unint64_t v19 = *(void *)(v27 + 8 * v15);
        if (!v19)
        {
          int64_t v15 = v18 + 3;
          if (v18 + 3 >= v28) {
            goto LABEL_27;
          }
          unint64_t v19 = *(void *)(v27 + 8 * v15);
          if (!v19) {
            break;
          }
        }
      }
    }
LABEL_20:
    unint64_t v13 = (v19 - 1) & v19;
  }
  int64_t v20 = v18 + 4;
  if (v20 >= v28)
  {
LABEL_27:
    swift_release();
    return v34;
  }
  unint64_t v19 = *(void *)(v27 + 8 * v20);
  if (v19)
  {
    int64_t v15 = v20;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v15 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v15 >= v28) {
      goto LABEL_27;
    }
    unint64_t v19 = *(void *)(v27 + 8 * v15);
    ++v20;
    if (v19) {
      goto LABEL_20;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

void sub_20BAA1FBC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v43 = 0;
  int64_t v5 = 0;
  uint64_t v8 = *(void *)(a3 + 56);
  uint64_t v6 = a3 + 56;
  uint64_t v7 = v8;
  uint64_t v9 = 1 << *(unsigned char *)(v6 - 24);
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v7;
  uint64_t v45 = v6;
  int64_t v46 = (unint64_t)(v9 + 63) >> 6;
  unint64_t v47 = a4 & 0xC000000000000001;
  uint64_t v49 = a4 + 56;
  unint64_t v44 = a5 & 0xC000000000000001;
  uint64_t v52 = a5 + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v12 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v13 = v12 | (v5 << 6);
      goto LABEL_22;
    }
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_49;
    }
    if (v14 >= v46) {
      goto LABEL_47;
    }
    unint64_t v15 = *(void *)(v45 + 8 * v14);
    ++v5;
    if (!v15)
    {
      int64_t v5 = v14 + 1;
      if (v14 + 1 >= v46) {
        goto LABEL_47;
      }
      unint64_t v15 = *(void *)(v45 + 8 * v5);
      if (!v15)
      {
        int64_t v5 = v14 + 2;
        if (v14 + 2 >= v46) {
          goto LABEL_47;
        }
        unint64_t v15 = *(void *)(v45 + 8 * v5);
        if (!v15) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v11 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v5 << 6);
LABEL_22:
    unint64_t v17 = *(void **)(*(void *)(a3 + 48) + 8 * v13);
    type metadata accessor for MatterAccessoryLikeItem();
    unint64_t v50 = v13;
    if (v47)
    {
      id v18 = v17;
      char v19 = sub_20BCE7CF0();

      if (v19) {
        goto LABEL_5;
      }
    }
    else if (*(void *)(a4 + 16))
    {
      id v20 = v17;
      uint64_t v21 = sub_20BCE7B40();
      uint64_t v22 = -1 << *(unsigned char *)(a4 + 32);
      unint64_t v23 = v21 & ~v22;
      if ((*(void *)(v49 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23))
      {
        id v24 = *(id *)(*(void *)(a4 + 48) + 8 * v23);
        char v25 = sub_20BCE7B50();

        if (v25) {
          goto LABEL_5;
        }
        uint64_t v26 = ~v22;
        while (1)
        {
          unint64_t v23 = (v23 + 1) & v26;
          if (((*(void *)(v49 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
            break;
          }
          id v27 = *(id *)(*(void *)(a4 + 48) + 8 * v23);
          char v28 = sub_20BCE7B50();

          if (v28) {
            goto LABEL_5;
          }
        }
      }
    }
    else
    {
      id v29 = v17;
    }
    if (v44)
    {
      id v30 = v17;
      char v31 = sub_20BCE7CF0();

      if ((v31 & 1) == 0) {
        goto LABEL_44;
      }
    }
    else if (*(void *)(a5 + 16) {
           && (uint64_t v32 = sub_20BCE7B40(),
    }
               uint64_t v33 = -1 << *(unsigned char *)(a5 + 32),
               unint64_t v34 = v32 & ~v33,
               ((*(void *)(v52 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) != 0))
    {
      id v35 = *(id *)(*(void *)(a5 + 48) + 8 * v34);
      char v36 = sub_20BCE7B50();

      if ((v36 & 1) == 0)
      {
        uint64_t v37 = ~v33;
        do
        {
          unint64_t v34 = (v34 + 1) & v37;
          if (((*(void *)(v52 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0) {
            goto LABEL_43;
          }
          id v38 = *(id *)(*(void *)(a5 + 48) + 8 * v34);
          char v39 = sub_20BCE7B50();
        }
        while ((v39 & 1) == 0);
      }
LABEL_5:
    }
    else
    {
LABEL_43:

LABEL_44:
      *(unint64_t *)((char *)a1 + ((v50 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v50;
      if (__OFADD__(v43++, 1))
      {
        __break(1u);
LABEL_47:
        swift_retain();
        sub_20BA9056C(a1, a2, v43, a3);
        return;
      }
    }
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v46) {
    goto LABEL_47;
  }
  unint64_t v15 = *(void *)(v45 + 8 * v16);
  if (v15)
  {
    int64_t v5 = v16;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v46) {
      goto LABEL_47;
    }
    unint64_t v15 = *(void *)(v45 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_21;
    }
  }
LABEL_49:
  __break(1u);
}

uint64_t sub_20BAA23D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v17[1] = *MEMORY[0x263EF8340];
  char v7 = *(unsigned char *)(a1 + 32);
  unsigned int v8 = v7 & 0x3F;
  unint64_t v9 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v10 = 8 * v9;
  swift_bridgeObjectRetain_n();
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v17 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_20BAA1FBC((void *)((char *)v17 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0)), v9, a1, a2, a3);
    uint64_t v13 = v12;
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v3) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v14 = (void *)swift_slowAlloc();
    bzero(v14, v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_20BAA1FBC((unint64_t *)v14, v9, a1, a2, a3);
    uint64_t v13 = v15;
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    MEMORY[0x21053F820](v14, -1, -1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_20BAA2604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0xC000000000000001) == 0) {
    return sub_20BAA23D0(a1, a2, a3);
  }
  uint64_t v5 = MEMORY[0x263F8EE88];
  uint64_t v41 = MEMORY[0x263F8EE88];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_20BCE7C60();
  if (!sub_20BCE7CE0()) {
    goto LABEL_40;
  }
  type metadata accessor for MatterAccessoryLikeItem();
  uint64_t v39 = a2 + 56;
  uint64_t v38 = a3 + 56;
  do
  {
    swift_dynamicCast();
    if ((a2 & 0xC000000000000001) != 0)
    {
      id v6 = v40;
      char v7 = sub_20BCE7CF0();

      if (v7) {
        goto LABEL_4;
      }
    }
    else if (*(void *)(a2 + 16))
    {
      uint64_t v8 = sub_20BCE7B40();
      uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v10 = v8 & ~v9;
      if ((*(void *)(v39 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
      {
        id v11 = *(id *)(*(void *)(a2 + 48) + 8 * v10);
        char v12 = sub_20BCE7B50();

        if (v12) {
          goto LABEL_4;
        }
        uint64_t v13 = ~v9;
        while (1)
        {
          unint64_t v10 = (v10 + 1) & v13;
          if (((*(void *)(v39 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
            break;
          }
          id v14 = *(id *)(*(void *)(a2 + 48) + 8 * v10);
          char v15 = sub_20BCE7B50();

          if (v15) {
            goto LABEL_4;
          }
        }
      }
    }
    if ((a3 & 0xC000000000000001) != 0)
    {
      id v16 = v40;
      char v17 = sub_20BCE7CF0();

      if (v17) {
        goto LABEL_4;
      }
    }
    else if (*(void *)(a3 + 16))
    {
      uint64_t v18 = sub_20BCE7B40();
      uint64_t v19 = -1 << *(unsigned char *)(a3 + 32);
      unint64_t v20 = v18 & ~v19;
      if ((*(void *)(v38 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20))
      {
        id v21 = *(id *)(*(void *)(a3 + 48) + 8 * v20);
        char v22 = sub_20BCE7B50();

        if (v22)
        {
LABEL_4:

          continue;
        }
        uint64_t v23 = ~v19;
        while (1)
        {
          unint64_t v20 = (v20 + 1) & v23;
          if (((*(void *)(v38 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
            break;
          }
          id v24 = *(id *)(*(void *)(a3 + 48) + 8 * v20);
          char v25 = sub_20BCE7B50();

          if (v25) {
            goto LABEL_4;
          }
        }
      }
    }
    uint64_t v26 = v41;
    unint64_t v27 = *(void *)(v41 + 16);
    if (*(void *)(v41 + 24) <= v27)
    {
      sub_20BA3FC34(v27 + 1);
      uint64_t v26 = v41;
    }
    uint64_t result = sub_20BCE7B40();
    uint64_t v29 = v26 + 56;
    uint64_t v30 = -1 << *(unsigned char *)(v26 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v26 + 56 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v33 = __clz(__rbit64((-1 << v31) & ~*(void *)(v26 + 56 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        BOOL v36 = v32 == v35;
        if (v32 == v35) {
          unint64_t v32 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v29 + 8 * v32);
      }
      while (v37 == -1);
      unint64_t v33 = __clz(__rbit64(~v37)) + (v32 << 6);
    }
    *(void *)(v29 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    *(void *)(*(void *)(v26 + 48) + 8 * v33) = v40;
    ++*(void *)(v26 + 16);
  }
  while (sub_20BCE7CE0());
  uint64_t v5 = v41;
LABEL_40:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v5;
}

BOOL sub_20BAA2A1C()
{
  uint64_t v0 = sub_20BCE7A60();
  char v2 = v1;
  uint64_t v3 = sub_20BCE69D0();
  return (v2 & 1) == 0 && v0 == v3;
}

uint64_t sub_20BAA2A78()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_20BAA2AB0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_20BA1FC8C;
  return sub_20BA9D6B0(a1);
}

id HFEvent.iconDescriptor.getter()
{
  uint64_t v1 = sub_20BCE7040();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_20BCE7150();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v0, v5);
  if ((*(unsigned int (**)(char *, uint64_t))(v6 + 88))(v8, v5) == *MEMORY[0x263F49680])
  {
    (*(void (**)(char *, uint64_t))(v6 + 96))(v8, v5);
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v8, v1);
    id v9 = sub_20BAA2DA0((uint64_t)v4);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    sub_20BCE7620();
    id v10 = objc_allocWithZone((Class)HFImageIconDescriptor);
    id v11 = (void *)sub_20BCE75E0();
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(v10, sel_initWithImageIdentifier_, v11);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v9;
}

id sub_20BAA2DA0(uint64_t a1)
{
  uint64_t v173 = a1;
  uint64_t v136 = sub_20BCE7000();
  uint64_t v135 = *(void *)(v136 - 8);
  MEMORY[0x270FA5388](v136);
  v134 = (char *)&v128 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = sub_20BCE7020();
  uint64_t v139 = *(void *)(v138 - 8);
  MEMORY[0x270FA5388](v138);
  v137 = (char *)&v128 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = sub_20BCE7050();
  uint64_t v141 = *(void *)(v142 - 8);
  MEMORY[0x270FA5388](v142);
  v140 = (char *)&v128 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = sub_20BCE7070();
  uint64_t v144 = *(void *)(v145 - 8);
  MEMORY[0x270FA5388](v145);
  v143 = (char *)&v128 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_20BCE70C0();
  uint64_t v164 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v163 = (char *)&v128 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20BCE70E0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v165 = (char *)&v128 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = sub_20BCE6EF0();
  uint64_t v128 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131);
  v132 = (char *)&v128 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_20BCE6F10();
  uint64_t v129 = *(void *)(v130 - 8);
  MEMORY[0x270FA5388](v130);
  v133 = (char *)&v128 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = sub_20BCE6F60();
  uint64_t v152 = *(void *)(v155 - 8);
  MEMORY[0x270FA5388](v155);
  v156 = (char *)&v128 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = sub_20BCE6F80();
  uint64_t v153 = *(void *)(v154 - 8);
  MEMORY[0x270FA5388](v154);
  v157 = (char *)&v128 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v169 = sub_20BCE6FD0();
  uint64_t v166 = *(void *)(v169 - 8);
  MEMORY[0x270FA5388](v169);
  v170 = (char *)&v128 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = sub_20BCE6FF0();
  uint64_t v167 = *(void *)(v168 - 8);
  MEMORY[0x270FA5388](v168);
  v171 = (char *)&v128 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_20BCE70F0();
  uint64_t v146 = *(void *)(v149 - 8);
  MEMORY[0x270FA5388](v149);
  v150 = (char *)&v128 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = sub_20BCE7110();
  uint64_t v147 = *(void *)(v148 - 8);
  MEMORY[0x270FA5388](v148);
  v151 = (char *)&v128 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v175 = sub_20BCE7040();
  uint64_t v174 = *(void *)(v175 - 8);
  MEMORY[0x270FA5388](v175);
  v172 = (char *)&v128 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_20BCE6F30();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  id v24 = (char *)&v128 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v128 - v25;
  uint64_t v27 = sub_20BCE6F20();
  v192 = (void *)MEMORY[0x263F8EE78];
  uint64_t v28 = *(void *)(v27 + 16);
  if (v28)
  {
    uint64_t v159 = v9;
    uint64_t v160 = v8;
    uint64_t v161 = v6;
    uint64_t v162 = v1;
    unint64_t v31 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
    uint64_t v29 = v21 + 16;
    uint64_t v30 = v31;
    unint64_t v32 = (*(unsigned __int8 *)(v29 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 64);
    uint64_t v158 = v27;
    unint64_t v33 = v27 + v32;
    v190 = *(__CFString **)(v29 + 56);
    char v34 = (uint64_t (**)(char *, uint64_t))(v29 + 72);
    int v189 = *MEMORY[0x263F49448];
    int v188 = *MEMORY[0x263F49438];
    int v185 = *MEMORY[0x263F49450];
    int v179 = *MEMORY[0x263F49440];
    unint64_t v35 = (void (**)(char *, uint64_t))(v29 - 8);
    uint64_t v178 = *MEMORY[0x263F0D7D8];
    uint64_t v177 = *MEMORY[0x263F0D7F8];
    uint64_t v184 = *MEMORY[0x263F0D698];
    uint64_t v36 = *MEMORY[0x263F0D6A8];
    uint64_t v182 = *MEMORY[0x263F0D8A8];
    uint64_t v183 = v36;
    uint64_t v181 = *MEMORY[0x263F0D6F8];
    uint64_t v187 = *MEMORY[0x263F0D798];
    long long v186 = xmmword_20BD11940;
    long long v180 = xmmword_20BD130C0;
    long long v176 = xmmword_20BD12330;
    id v191 = (id)v29;
    v31(v26, (char *)(v27 + v32), v20);
    while (1)
    {
      v30(v24, v26, v20);
      int v39 = (*v34)(v24, v20);
      if (v39 == v189)
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB2E498);
        uint64_t v37 = swift_allocObject();
        *(_OWORD *)(v37 + 16) = v186;
        *(void *)(v37 + 32) = sub_20BCE7620();
        *(void *)(v37 + 40) = v38;
      }
      else if (v39 == v188)
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB2E498);
        uint64_t v37 = swift_allocObject();
        *(_OWORD *)(v37 + 16) = v180;
        *(void *)(v37 + 32) = sub_20BCE7620();
        *(void *)(v37 + 40) = v40;
        *(void *)(v37 + 48) = sub_20BCE7620();
        *(void *)(v37 + 56) = v41;
        *(void *)(v37 + 64) = sub_20BCE7620();
        *(void *)(v37 + 72) = v42;
        *(void *)(v37 + 80) = sub_20BCE7620();
        *(void *)(v37 + 88) = v43;
      }
      else if (v39 == v185)
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB2E498);
        uint64_t v37 = swift_allocObject();
        *(_OWORD *)(v37 + 16) = v176;
        *(void *)(v37 + 32) = sub_20BCE7620();
        *(void *)(v37 + 40) = v44;
        *(void *)(v37 + 48) = sub_20BCE7620();
        *(void *)(v37 + 56) = v45;
      }
      else
      {
        uint64_t v37 = MEMORY[0x263F8EE78];
        if (v39 != v179) {
          (*v35)(v24, v20);
        }
      }
      (*v35)(v26, v20);
      sub_20BA862F0(v37);
      v33 += (unint64_t)v190;
      if (!--v28) {
        break;
      }
      v30(v26, (char *)v33, v20);
    }
    swift_bridgeObjectRelease();
    int64_t v46 = v192;
    uint64_t v6 = v161;
    uint64_t v8 = v160;
    uint64_t v9 = v159;
  }
  else
  {
    swift_bridgeObjectRelease();
    int64_t v46 = (void *)MEMORY[0x263F8EE78];
  }
  id v47 = HFEvent.accessory.getter();
  uint64_t v48 = v172;
  if (!v47)
  {
    swift_bridgeObjectRelease();
    uint64_t v52 = 0;
    goto LABEL_23;
  }
  uint64_t v49 = v47;
  id v50 = objc_msgSend(v47, sel_hf_visibleServices);

  sub_20BAA486C();
  sub_20BA94238();
  uint64_t v51 = sub_20BCE7940();

  swift_bridgeObjectRetain();
  uint64_t v52 = (__CFString *)sub_20BAA48AC(v51, v46);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  if (!v52)
  {
LABEL_23:
    id v53 = 0;
    goto LABEL_25;
  }
  id v53 = [(__CFString *)v52 hf_iconDescriptor];

  if (v53 && (self, (uint64_t v54 = swift_dynamicCastObjCClass()) != 0))
  {
    v55 = (void *)v54;
    swift_unknownObjectRetain();
    uint64_t v52 = (__CFString *)objc_msgSend(v55, sel_packageIdentifier);
    if (!v52)
    {
      sub_20BCE7620();
      uint64_t v52 = (__CFString *)sub_20BCE75E0();
      swift_bridgeObjectRelease();
    }
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v52 = 0;
  }
LABEL_25:
  uint64_t v56 = v174;
  uint64_t v57 = v175;
  (*(void (**)(char *, uint64_t, uint64_t))(v174 + 16))(v48, v173, v175);
  int v58 = (*(uint64_t (**)(char *, uint64_t))(v56 + 88))(v48, v57);
  int v59 = *MEMORY[0x263F49520];
  id v191 = v53;
  if (v58 == v59)
  {
    v190 = v52;
    (*(void (**)(char *, uint64_t))(v56 + 96))(v48, v57);
    uint64_t v60 = v167;
    uint64_t v61 = v171;
    uint64_t v62 = v168;
    (*(void (**)(char *, char *, uint64_t))(v167 + 32))(v171, v48, v168);
    uint64_t v63 = @"HFCAPackageIconIdentifierContactSensor";
    uint64_t v64 = v170;
    sub_20BCE6FE0();
    uint64_t v65 = v166;
    uint64_t v66 = v169;
    int v67 = (*(uint64_t (**)(char *, uint64_t))(v166 + 88))(v64, v169);
    if (v67 != *MEMORY[0x263F494F8])
    {
      if (v67 == *MEMORY[0x263F494E8])
      {
        v68 = *(void (**)(char *, uint64_t))(v60 + 8);
        v69 = HFCAPackageStateOn;
        v68(v171, v62);
LABEL_39:
        v82 = v63;
        uint64_t v52 = v190;
LABEL_71:
        if (v52) {
          v103 = v52;
        }
        else {
          v103 = v82;
        }
        id v104 = objc_allocWithZone((Class)HFCAPackageIconDescriptor);
        v105 = v52;
        id v106 = objc_msgSend(v104, sel_initWithPackageIdentifier_state_, v103, v69);
        swift_unknownObjectRelease();

        return v106;
      }
      uint64_t v61 = v171;
      if (v67 != *MEMORY[0x263F494F0])
      {
        v92 = *(void (**)(char *, uint64_t))(v60 + 8);
        v69 = HFCAPackageStateOff;
        v92(v61, v62);
        (*(void (**)(char *, uint64_t))(v65 + 8))(v170, v66);
        goto LABEL_39;
      }
    }
    v81 = *(void (**)(char *, uint64_t))(v60 + 8);
    v69 = HFCAPackageStateOff;
    v81(v61, v62);
    goto LABEL_39;
  }
  if (v58 == *MEMORY[0x263F49538])
  {
    (*(void (**)(char *, uint64_t))(v56 + 96))(v48, v175);
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v165, v48, v8);
    v70 = @"HFCAPackageIconIdentifierDoor";
    v71 = v163;
    sub_20BCE70D0();
    int v72 = (*(uint64_t (**)(char *, uint64_t))(v164 + 88))(v71, v6);
    if (v72 != *MEMORY[0x263F495F8])
    {
      if (v72 == *MEMORY[0x263F495D8])
      {
        v73 = &HFCAPackageStateOn;
        goto LABEL_42;
      }
      if (v72 != *MEMORY[0x263F495E0] && v72 != *MEMORY[0x263F495F0] && v72 != *MEMORY[0x263F495E8])
      {
        v93 = *(void (**)(char *, uint64_t))(v9 + 8);
        v69 = HFCAPackageStateOff;
        v93(v165, v8);
        (*(void (**)(char *, uint64_t))(v164 + 8))(v163, v6);
        goto LABEL_43;
      }
    }
    v73 = &HFCAPackageStateOff;
LABEL_42:
    v83 = *(void (**)(char *, uint64_t))(v9 + 8);
    v69 = *v73;
    v83(v165, v8);
LABEL_43:
    v82 = v70;
    goto LABEL_71;
  }
  if (v58 == *MEMORY[0x263F49518])
  {
    (*(void (**)(char *, uint64_t))(v56 + 96))(v48, v175);
    uint64_t v74 = v153;
    uint64_t v75 = v154;
    (*(void (**)(char *, char *, uint64_t))(v153 + 32))(v157, v48, v154);
    v190 = @"HFCAPackageIconIdentifierGarageDoor";
    v76 = v156;
    sub_20BCE6F70();
    uint64_t v77 = v152;
    uint64_t v78 = v155;
    int v79 = (*(uint64_t (**)(char *, uint64_t))(v152 + 88))(v76, v155);
    if (v79 != *MEMORY[0x263F494B8])
    {
      if (v79 == *MEMORY[0x263F49490])
      {
LABEL_35:
        v80 = &HFCAPackageStateOn;
LABEL_60:
        v97 = *(void (**)(char *, uint64_t))(v74 + 8);
        v69 = *v80;
        v97(v157, v75);
LABEL_70:
        v82 = v190;
        goto LABEL_71;
      }
      if (v79 != *MEMORY[0x263F49498])
      {
        if (v79 != *MEMORY[0x263F494A8]
          && v79 != *MEMORY[0x263F494A0]
          && v79 != *MEMORY[0x263F494B0]
          && v79 != *MEMORY[0x263F49488])
        {
          v108 = *(void (**)(char *, uint64_t))(v74 + 8);
          v69 = HFCAPackageStateOff;
          v108(v157, v75);
          (*(void (**)(char *, uint64_t))(v77 + 8))(v156, v78);
          goto LABEL_70;
        }
        goto LABEL_35;
      }
    }
    v80 = &HFCAPackageStateOff;
    goto LABEL_60;
  }
  uint64_t v84 = v175;
  if (v58 == *MEMORY[0x263F49540])
  {
    (*(void (**)(char *, uint64_t))(v56 + 96))(v48, v175);
    uint64_t v85 = v147;
    uint64_t v86 = v148;
    (*(void (**)(char *, char *, uint64_t))(v147 + 32))(v151, v48, v148);
    v190 = @"HFCAPackageIconIdentifierDoorLock";
    v87 = v150;
    sub_20BCE7100();
    uint64_t v88 = v146;
    uint64_t v89 = v149;
    int v90 = (*(uint64_t (**)(char *, uint64_t))(v146 + 88))(v87, v149);
    if (v90 != *MEMORY[0x263F49640])
    {
      if (v90 == *MEMORY[0x263F49648])
      {
LABEL_47:
        v91 = &HFCAPackageStateOn;
        goto LABEL_68;
      }
      if (v90 != *MEMORY[0x263F49630])
      {
        if (v90 != *MEMORY[0x263F49650] && v90 != *MEMORY[0x263F49638] && v90 != *MEMORY[0x263F49628])
        {
          v118 = *(void (**)(char *, uint64_t))(v85 + 8);
          v69 = HFCAPackageStateOff;
          v118(v151, v86);
          (*(void (**)(char *, uint64_t))(v88 + 8))(v150, v89);
          goto LABEL_70;
        }
        goto LABEL_47;
      }
    }
    v91 = &HFCAPackageStateOff;
LABEL_68:
    v102 = *(void (**)(char *, uint64_t))(v85 + 8);
    v69 = *v91;
    v102(v151, v86);
    goto LABEL_70;
  }
  if (v58 == *MEMORY[0x263F49530])
  {
    (*(void (**)(char *, uint64_t))(v56 + 96))(v48, v175);
    (*(void (**)(char *, char *, uint64_t))(v144 + 32))(v143, v48, v145);
    v82 = @"HFCAPackageIconIdentifierSecuritySystem";
    v94 = v140;
    sub_20BCE7060();
    int v95 = (*(uint64_t (**)(char *, uint64_t))(v141 + 88))(v94, v142);
    if (v95 != *MEMORY[0x263F49570] && v95 != *MEMORY[0x263F49580])
    {
      if (v95 == *MEMORY[0x263F49568])
      {
LABEL_57:
        v96 = &HFCAPackageStateOn;
LABEL_95:
        v100 = *(void (**)(char *, uint64_t))(v144 + 8);
        v69 = *v96;
        v116 = v143;
        v117 = (char **)&v176 + 1;
LABEL_96:
        v100(v116, (uint64_t)*(v117 - 32));
        goto LABEL_71;
      }
      if (v95 != *MEMORY[0x263F49590])
      {
        if (v95 != *MEMORY[0x263F49578]
          && v95 != *MEMORY[0x263F49588]
          && v95 != *MEMORY[0x263F49560]
          && v95 != *MEMORY[0x263F49598])
        {
          v123 = *(void (**)(char *, uint64_t))(v144 + 8);
          v69 = HFCAPackageStateOff;
          v123(v143, v145);
          (*(void (**)(char *, uint64_t))(v141 + 8))(v140, v142);
          goto LABEL_71;
        }
        goto LABEL_57;
      }
    }
    v96 = &HFCAPackageStateOff;
    goto LABEL_95;
  }
  if (v58 == *MEMORY[0x263F49528])
  {
    (*(void (**)(char *, uint64_t))(v56 + 96))(v48, v175);
    (*(void (**)(char *, char *, uint64_t))(v139 + 32))(v137, v48, v138);
    v82 = @"HFCAPackageIconIdentifierSmokeSensor";
    v98 = v134;
    sub_20BCE7010();
    int v99 = (*(uint64_t (**)(char *, uint64_t))(v135 + 88))(v98, v136);
    if (v99 == *MEMORY[0x263F49508] || v99 == *MEMORY[0x263F49500])
    {
      v101 = HFCAPackageStateOff;
      v100 = *(void (**)(char *, uint64_t))(v139 + 8);
    }
    else
    {
      v100 = *(void (**)(char *, uint64_t))(v139 + 8);
      if (v99 != *MEMORY[0x263F49510])
      {
        v69 = HFCAPackageStateOff;
        v100(v137, v138);
        (*(void (**)(char *, uint64_t))(v135 + 8))(v134, v136);
        goto LABEL_71;
      }
      v101 = HFCAPackageStateOn;
    }
    v69 = v101;
    v116 = v137;
    v117 = &v170;
    goto LABEL_96;
  }
  if (v58 == *MEMORY[0x263F49548])
  {
    (*(void (**)(char *, uint64_t))(v56 + 96))(v48, v175);
    uint64_t v109 = v129;
    uint64_t v110 = v130;
    (*(void (**)(char *, char *, uint64_t))(v129 + 32))(v133, v48, v130);
    v190 = @"HFCAPackageIconIdentifierWindowVertical";
    v111 = v132;
    sub_20BCE6F00();
    uint64_t v112 = v128;
    uint64_t v113 = v131;
    int v114 = (*(uint64_t (**)(char *, uint64_t))(v128 + 88))(v111, v131);
    if (v114 != *MEMORY[0x263F49400])
    {
      if (v114 == *MEMORY[0x263F493E0])
      {
        v115 = &HFCAPackageStateOn;
        goto LABEL_99;
      }
      if (v114 != *MEMORY[0x263F493E8] && v114 != *MEMORY[0x263F493F8] && v114 != *MEMORY[0x263F493F0])
      {
        v127 = *(void (**)(char *, uint64_t))(v109 + 8);
        v69 = HFCAPackageStateOff;
        v127(v133, v110);
        (*(void (**)(char *, uint64_t))(v112 + 8))(v132, v113);
        goto LABEL_70;
      }
    }
    v115 = &HFCAPackageStateOff;
LABEL_99:
    v122 = *(void (**)(char *, uint64_t))(v109 + 8);
    v69 = *v115;
    v122(v133, v110);
    goto LABEL_70;
  }
  id v119 = HFEvent.accessory.getter();
  if (v119)
  {
    v120 = v119;
    id v121 = objc_msgSend(self, sel_iconDescriptorForAccessory_, v119);

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v174 + 8))(v48, v84);
    return v121;
  }
  sub_20BCE7620();
  id v124 = objc_allocWithZone((Class)HFImageIconDescriptor);
  v125 = v48;
  v126 = (void *)sub_20BCE75E0();
  swift_bridgeObjectRelease();
  id v106 = objc_msgSend(v124, sel_initWithImageIdentifier_, v126);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v174 + 8))(v125, v84);
  return v106;
}

unint64_t sub_20BAA486C()
{
  unint64_t result = qword_2676ADEB0;
  if (!qword_2676ADEB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2676ADEB0);
  }
  return result;
}

uint64_t sub_20BAA48AC(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_20BCE7C60();
    sub_20BAA486C();
    sub_20BA94238();
    uint64_t result = sub_20BCE79D0();
    uint64_t v2 = v32;
    uint64_t v29 = v33;
    uint64_t v4 = v34;
    uint64_t v5 = v35;
    unint64_t v6 = v36;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v29 = a1 + 56;
    uint64_t v8 = ~v7;
    uint64_t v9 = -v7;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v6 = v10 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = v8;
    uint64_t v5 = 0;
  }
  int64_t v28 = (unint64_t)(v4 + 64) >> 6;
  while (1)
  {
    if (v2 < 0)
    {
      if (!sub_20BCE7CE0()) {
        goto LABEL_49;
      }
      sub_20BAA486C();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v14 = v37;
      swift_unknownObjectRelease();
      uint64_t v13 = v5;
      uint64_t v11 = v6;
      if (!v37) {
        goto LABEL_47;
      }
    }
    else
    {
      if (v6)
      {
        uint64_t v11 = (v6 - 1) & v6;
        unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
        uint64_t v13 = v5;
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_51;
        }
        if (v15 >= v28) {
          goto LABEL_49;
        }
        unint64_t v16 = *(void *)(v29 + 8 * v15);
        uint64_t v13 = v5 + 1;
        if (!v16)
        {
          uint64_t v13 = v5 + 2;
          if (v5 + 2 >= v28) {
            goto LABEL_49;
          }
          unint64_t v16 = *(void *)(v29 + 8 * v13);
          if (!v16)
          {
            uint64_t v13 = v5 + 3;
            if (v5 + 3 >= v28) {
              goto LABEL_49;
            }
            unint64_t v16 = *(void *)(v29 + 8 * v13);
            if (!v16)
            {
              uint64_t v13 = v5 + 4;
              if (v5 + 4 >= v28) {
                goto LABEL_49;
              }
              unint64_t v16 = *(void *)(v29 + 8 * v13);
              if (!v16)
              {
                uint64_t v13 = v5 + 5;
                if (v5 + 5 >= v28) {
                  goto LABEL_49;
                }
                unint64_t v16 = *(void *)(v29 + 8 * v13);
                if (!v16)
                {
                  uint64_t v17 = v5 + 6;
                  while (v28 != v17)
                  {
                    unint64_t v16 = *(void *)(v29 + 8 * v17++);
                    if (v16)
                    {
                      uint64_t v13 = v17 - 1;
                      goto LABEL_30;
                    }
                  }
LABEL_49:
                  id v14 = 0;
LABEL_47:
                  sub_20BA20930();
                  return (uint64_t)v14;
                }
              }
            }
          }
        }
LABEL_30:
        uint64_t v11 = (v16 - 1) & v16;
        unint64_t v12 = __clz(__rbit64(v16)) + (v13 << 6);
      }
      id v14 = *(id *)(*(void *)(v2 + 48) + 8 * v12);
      if (!v14) {
        goto LABEL_47;
      }
    }
    uint64_t v30 = v13;
    uint64_t v18 = v2;
    id v19 = objc_msgSend(v14, sel_serviceType);
    uint64_t v20 = sub_20BCE7620();
    uint64_t v22 = v21;

    uint64_t v23 = a2[2];
    if (v23)
    {
      if (a2[4] == v20 && a2[5] == v22 || (uint64_t result = sub_20BCE8000(), (result & 1) != 0))
      {
LABEL_46:
        swift_bridgeObjectRelease();
        goto LABEL_47;
      }
      if (v23 != 1) {
        break;
      }
    }
LABEL_8:

    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v5 = v30;
    unint64_t v6 = v11;
    uint64_t v2 = v18;
  }
  id v24 = a2 + 7;
  uint64_t v25 = 1;
  while (1)
  {
    uint64_t v26 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (*(v24 - 1) == v20 && *v24 == v22) {
      goto LABEL_46;
    }
    uint64_t result = sub_20BCE8000();
    if (result) {
      goto LABEL_46;
    }
    v24 += 2;
    ++v25;
    if (v26 == v23) {
      goto LABEL_8;
    }
  }
  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

void __swiftcall HFStaticItem.init(results:)(HFStaticItem *__return_ptr retstr, Swift::OpaquePointer results)
{
  uint64_t v3 = 1 << *((unsigned char *)results._rawValue + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *((void *)results._rawValue + 8);
  int64_t v35 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  uint64_t v7 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v6 << 6);
    }
    else
    {
      int64_t v11 = v6 + 1;
      if (__OFADD__(v6, 1)) {
        goto LABEL_38;
      }
      if (v11 >= v35)
      {
LABEL_35:
        swift_release();
        swift_bridgeObjectRelease();
        id v32 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
        sub_20BA15458((uint64_t)v7);
        swift_bridgeObjectRelease();
        uint64_t v33 = (void *)sub_20BCE7510();
        swift_bridgeObjectRelease();
        objc_msgSend(v32, sel_initWithResults_, v33);

        return;
      }
      unint64_t v12 = *(void *)(v34 + 8 * v11);
      ++v6;
      if (!v12)
      {
        int64_t v6 = v11 + 1;
        if (v11 + 1 >= v35) {
          goto LABEL_35;
        }
        unint64_t v12 = *(void *)(v34 + 8 * v6);
        if (!v12)
        {
          int64_t v6 = v11 + 2;
          if (v11 + 2 >= v35) {
            goto LABEL_35;
          }
          unint64_t v12 = *(void *)(v34 + 8 * v6);
          if (!v12)
          {
            int64_t v6 = v11 + 3;
            if (v11 + 3 >= v35) {
              goto LABEL_35;
            }
            unint64_t v12 = *(void *)(v34 + 8 * v6);
            if (!v12)
            {
              int64_t v13 = v11 + 4;
              if (v13 >= v35) {
                goto LABEL_35;
              }
              unint64_t v12 = *(void *)(v34 + 8 * v13);
              if (!v12)
              {
                while (1)
                {
                  int64_t v6 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    goto LABEL_39;
                  }
                  if (v6 >= v35) {
                    goto LABEL_35;
                  }
                  unint64_t v12 = *(void *)(v34 + 8 * v6);
                  ++v13;
                  if (v12) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v6 = v13;
            }
          }
        }
      }
LABEL_23:
      unint64_t v5 = (v12 - 1) & v12;
      unint64_t v10 = __clz(__rbit64(v12)) + (v6 << 6);
    }
    id v14 = *(void **)(*((void *)results._rawValue + 6) + 8 * v10);
    sub_20BA200A0(*((void *)results._rawValue + 7) + 32 * v10, (uint64_t)v40 + 8);
    *(void *)&v40[0] = v14;
    v38[0] = v40[0];
    v38[1] = v40[1];
    uint64_t v39 = v41;
    sub_20BA200A0((uint64_t)v38 + 8, (uint64_t)v36 + 8);
    sub_20BA1FD80((_OWORD *)((char *)v36 + 8), v37);
    uint64_t v15 = sub_20BCE7620();
    uint64_t v17 = v16;
    sub_20BA200A0((uint64_t)v37, (uint64_t)v36);
    id v18 = v14;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v21 = sub_20BA16D9C(v15, v17);
    uint64_t v22 = v7[2];
    BOOL v23 = (v20 & 1) == 0;
    uint64_t v24 = v22 + v23;
    if (__OFADD__(v22, v23)) {
      break;
    }
    char v25 = v20;
    if (v7[3] >= v24)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v20) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_20BA1DD34();
        if (v25) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_20BA18200(v24, isUniquelyReferenced_nonNull_native);
      uint64_t v26 = sub_20BA16D9C(v15, v17);
      if ((v25 & 1) != (v27 & 1)) {
        goto LABEL_40;
      }
      unint64_t v21 = v26;
      if (v25)
      {
LABEL_4:
        uint64_t v8 = (_OWORD *)(v7[7] + 32 * v21);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
        sub_20BA1FD80(v36, v8);
        goto LABEL_5;
      }
    }
    v7[(v21 >> 6) + 8] |= 1 << v21;
    int64_t v28 = (uint64_t *)(v7[6] + 16 * v21);
    *int64_t v28 = v15;
    v28[1] = v17;
    sub_20BA1FD80(v36, (_OWORD *)(v7[7] + 32 * v21));
    uint64_t v29 = v7[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_37;
    }
    v7[2] = v31;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
    sub_20BAA5030((uint64_t)v38);
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  sub_20BCE8060();
  __break(1u);
}

uint64_t sub_20BAA5030(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF7B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t HFMatterSnapshotContainer.device(for:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_20BCE6CD0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  int64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF4D0);
  MEMORY[0x270FA5388](v7 - 8);
  unint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_20BCE7A60();
  if ((v11 & 1) != 0 || (uint64_t v12 = v10) == 0)
  {
    uint64_t v14 = sub_20BCE6C20();
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    return v15(a1, 1, 1, v14);
  }
  else
  {
    uint64_t v13 = *(void *)(v1 + OBJC_IVAR___HFMatterSnapshotContainer_internalContainer);
    if (v13)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v13+ OBJC_IVAR____TtCE4HomeCSo25HFMatterSnapshotContainerP33_B7E3F95BF7FF115BC363C826A52F413717InternalContainer_snapshot, v3);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, 1, 1, v3);
    }
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3))
    {
      sub_20BAA5484((uint64_t)v9);
      uint64_t v17 = sub_20BCE6C20();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(a1, 1, 1, v17);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
      sub_20BAA5484((uint64_t)v9);
      uint64_t v18 = sub_20BCE6C70();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      if (*(void *)(v18 + 16) && (unint64_t v19 = sub_20BA16ED4(v12), (v20 & 1) != 0))
      {
        unint64_t v21 = v19;
        uint64_t v22 = *(void *)(v18 + 56);
        uint64_t v23 = sub_20BCE6C20();
        uint64_t v24 = *(void *)(v23 - 8);
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v24 + 16))(a1, v22 + *(void *)(v24 + 72) * v21, v23);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v24 + 56))(a1, 0, 1, v23);
      }
      else
      {
        uint64_t v25 = sub_20BCE6C20();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(a1, 1, 1, v25);
      }
      return swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_20BAA5484(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF4D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static HFMatterSnapshotContainer.fetchCurrentAsync()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_20BAA5504, 0, 0);
}

uint64_t sub_20BAA5504()
{
  sub_20BCE7850();
  *(void *)(v0 + 24) = sub_20BCE7840();
  uint64_t v2 = sub_20BCE77E0();
  return MEMORY[0x270FA2498](sub_20BAA5598, v2, v1);
}

uint64_t sub_20BAA5598()
{
  swift_release();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fetchCurrent);
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v1);
}

uint64_t sub_20BAA5774(const void *a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  return MEMORY[0x270FA2498](sub_20BAA57E0, 0, 0);
}

uint64_t sub_20BAA57E0()
{
  sub_20BCE7850();
  *(void *)(v0 + 32) = sub_20BCE7840();
  uint64_t v2 = sub_20BCE77E0();
  return MEMORY[0x270FA2498](sub_20BAA5874, v2, v1);
}

uint64_t sub_20BAA5874()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  *(void *)(v0 + 40) = objc_msgSend(v1, sel_fetchCurrent);
  return MEMORY[0x270FA2498](sub_20BAA58FC, 0, 0);
}

uint64_t sub_20BAA58FC()
{
  uint64_t v1 = (void *)v0[5];
  uint64_t v2 = (void (**)(void, void))v0[3];
  ((void (**)(void, void *))v2)[2](v2, v1);
  _Block_release(v2);

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_20BAA59A8()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtCE4HomeCSo25HFMatterSnapshotContainerP33_B7E3F95BF7FF115BC363C826A52F413717InternalContainer_snapshot;
  uint64_t v2 = sub_20BCE6CD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

char *_sSo25HFMatterSnapshotContainerC4HomeE12fetchCurrentAByFZ_0()
{
  uint64_t v0 = sub_20BCE6CD0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF4D0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v15 - v8;
  uint64_t v10 = (char *)objc_msgSend(objc_allocWithZone((Class)HFMatterSnapshotContainer), sel_init);
  sub_20BCE6790();
  char v11 = (void *)sub_20BCE6770();
  sub_20BCE6730();

  (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v9, 0, 1, v0);
  sub_20BAA5E98((uint64_t)v9, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v7, 1, v0) == 1)
  {
    sub_20BAA5484((uint64_t)v7);
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v1 + 32);
    v13(v3, v7, v0);
    _s17InternalContainerCMa();
    uint64_t v12 = swift_allocObject();
    v13((char *)(v12+ OBJC_IVAR____TtCE4HomeCSo25HFMatterSnapshotContainerP33_B7E3F95BF7FF115BC363C826A52F413717InternalContainer_snapshot), v3, v0);
  }
  sub_20BAA5484((uint64_t)v9);
  *(void *)&v10[OBJC_IVAR___HFMatterSnapshotContainer_internalContainer] = v12;
  swift_release();
  return v10;
}

uint64_t sub_20BAA5C88()
{
  return _s17InternalContainerCMa();
}

uint64_t _s17InternalContainerCMa()
{
  uint64_t result = qword_2676AF4F0;
  if (!qword_2676AF4F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20BAA5CDC()
{
  uint64_t result = sub_20BCE6CD0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t type metadata accessor for HFMatterSnapshotContainer()
{
  unint64_t result = qword_2676AF500;
  if (!qword_2676AF500)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2676AF500);
  }
  return result;
}

uint64_t sub_20BAA5DAC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20BAA5DE4()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_20BA20C04;
  uint64_t v5 = (uint64_t (*)(const void *, uint64_t))((char *)&dword_2676AF508 + dword_2676AF508);
  return v5(v2, v3);
}

uint64_t sub_20BAA5E98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF4D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_20BAA5F00(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_20BCE7C60();
    sub_20BA208F4(0, (unint64_t *)&qword_26AB2E460);
    sub_20BA378FC((unint64_t *)&qword_2676AE460, (unint64_t *)&qword_26AB2E460);
    sub_20BCE79D0();
    uint64_t v2 = v27;
    uint64_t v24 = v28;
    uint64_t v3 = v29;
    int64_t v4 = v30;
    unint64_t v5 = v31;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v24 = a1 + 56;
    uint64_t v7 = ~v6;
    uint64_t v8 = -v6;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v5 = v9 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = v7;
    int64_t v4 = 0;
  }
  int64_t v23 = (unint64_t)(v3 + 64) >> 6;
  uint64_t v25 = v2;
  while (v2 < 0)
  {
    if (!sub_20BCE7CE0()) {
      goto LABEL_40;
    }
    sub_20BA208F4(0, (unint64_t *)&qword_26AB2E460);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v17 = v32;
    swift_unknownObjectRelease();
    int64_t v16 = v4;
    uint64_t v14 = v5;
    if (!v32) {
      goto LABEL_40;
    }
LABEL_29:
    self;
    uint64_t v20 = swift_dynamicCastObjCClass();
    if (v20)
    {
      unint64_t v21 = (void *)v20;
      id v13 = v17;
      if ((objc_msgSend(v21, sel_isHomePod) & 1) != 0
        || objc_msgSend(v21, sel_isAppleTV)
        || (objc_msgSend(v21, sel_isHomePodMediaSystem) & 1) != 0)
      {
        id v10 = v13;
        id v11 = objc_msgSend(v21, sel_accessories);
        sub_20BA208F4(0, (unint64_t *)&unk_2676AE3F0);
        sub_20BA378FC((unint64_t *)&unk_2676AEFF0, (unint64_t *)&unk_2676AE3F0);
        uint64_t v12 = sub_20BCE7940();

        id v13 = v10;
        uint64_t v2 = v25;
        sub_20BAA62F0(v12, a2);
        swift_bridgeObjectRelease();
      }
    }
    int64_t v4 = v16;
    unint64_t v5 = v14;
  }
  if (v5)
  {
    uint64_t v14 = (v5 - 1) & v5;
    unint64_t v15 = __clz(__rbit64(v5)) | (v4 << 6);
    int64_t v16 = v4;
LABEL_28:
    id v17 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    if (!v17) {
      goto LABEL_40;
    }
    goto LABEL_29;
  }
  int64_t v16 = v4 + 1;
  if (!__OFADD__(v4, 1))
  {
    if (v16 >= v23) {
      goto LABEL_40;
    }
    unint64_t v18 = *(void *)(v24 + 8 * v16);
    if (!v18)
    {
      int64_t v19 = v4 + 2;
      if (v4 + 2 >= v23) {
        goto LABEL_40;
      }
      unint64_t v18 = *(void *)(v24 + 8 * v19);
      if (v18) {
        goto LABEL_26;
      }
      int64_t v19 = v4 + 3;
      if (v4 + 3 >= v23) {
        goto LABEL_40;
      }
      unint64_t v18 = *(void *)(v24 + 8 * v19);
      if (v18) {
        goto LABEL_26;
      }
      int64_t v19 = v4 + 4;
      if (v4 + 4 >= v23) {
        goto LABEL_40;
      }
      unint64_t v18 = *(void *)(v24 + 8 * v19);
      if (v18)
      {
LABEL_26:
        int64_t v16 = v19;
      }
      else
      {
        int64_t v16 = v4 + 5;
        if (v4 + 5 >= v23) {
          goto LABEL_40;
        }
        unint64_t v18 = *(void *)(v24 + 8 * v16);
        if (!v18)
        {
          int64_t v22 = v4 + 6;
          while (v23 != v22)
          {
            unint64_t v18 = *(void *)(v24 + 8 * v22++);
            if (v18)
            {
              int64_t v16 = v22 - 1;
              goto LABEL_27;
            }
          }
LABEL_40:
          sub_20BA20930();
          return;
        }
      }
    }
LABEL_27:
    uint64_t v14 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v16 << 6);
    goto LABEL_28;
  }
  __break(1u);
}

void sub_20BAA62F0(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = a2;
  uint64_t v28 = sub_20BCE65C0();
  uint64_t v3 = *(void *)(v28 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v28);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v25 - v7;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_20BCE7C60();
    sub_20BA208F4(0, (unint64_t *)&unk_2676AE3F0);
    sub_20BA378FC((unint64_t *)&unk_2676AEFF0, (unint64_t *)&unk_2676AE3F0);
    sub_20BCE79D0();
    a1 = v32;
    uint64_t v27 = v33;
    uint64_t v10 = v34;
    uint64_t v9 = v35;
    unint64_t v11 = v36;
  }
  else
  {
    uint64_t v12 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v27 = a1 + 56;
    uint64_t v10 = ~v12;
    uint64_t v14 = -v12;
    if (v14 < 64) {
      uint64_t v15 = ~(-1 << v14);
    }
    else {
      uint64_t v15 = -1;
    }
    unint64_t v11 = v15 & v13;
    swift_bridgeObjectRetain();
    uint64_t v9 = 0;
  }
  v25[1] = v10;
  v25[4] = a1 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v26 = (unint64_t)(v10 + 64) >> 6;
  v25[3] = MEMORY[0x263F8EE50] + 8;
  uint64_t v30 = a1;
  if (a1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v11)
    {
      uint64_t v16 = (v11 - 1) & v11;
      unint64_t v17 = __clz(__rbit64(v11)) | (v9 << 6);
      uint64_t v18 = v9;
      goto LABEL_29;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      break;
    }
    if (v21 >= v26) {
      goto LABEL_32;
    }
    unint64_t v22 = *(void *)(v27 + 8 * v21);
    uint64_t v18 = v9 + 1;
    if (!v22)
    {
      uint64_t v18 = v9 + 2;
      if (v9 + 2 >= v26) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v27 + 8 * v18);
      if (!v22)
      {
        uint64_t v18 = v9 + 3;
        if (v9 + 3 >= v26) {
          goto LABEL_32;
        }
        unint64_t v22 = *(void *)(v27 + 8 * v18);
        if (!v22)
        {
          uint64_t v18 = v9 + 4;
          if (v9 + 4 >= v26) {
            goto LABEL_32;
          }
          unint64_t v22 = *(void *)(v27 + 8 * v18);
          if (!v22)
          {
            uint64_t v18 = v9 + 5;
            if (v9 + 5 >= v26) {
              goto LABEL_32;
            }
            unint64_t v22 = *(void *)(v27 + 8 * v18);
            if (!v22)
            {
              uint64_t v23 = v9 + 6;
              while (v26 != v23)
              {
                unint64_t v22 = *(void *)(v27 + 8 * v23++);
                if (v22)
                {
                  uint64_t v18 = v23 - 1;
                  a1 = v30;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_20BA20930();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v16 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v18 << 6);
LABEL_29:
    id v20 = *(id *)(*(void *)(a1 + 48) + 8 * v17);
    if (!v20) {
      goto LABEL_32;
    }
    while (1)
    {
      id v24 = objc_msgSend(v20, sel_uniqueIdentifier);
      sub_20BCE6590();

      sub_20BA2E0DC((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v28);

      uint64_t v9 = v18;
      unint64_t v11 = v16;
      a1 = v30;
      if ((v30 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      uint64_t v19 = sub_20BCE7CE0();
      if (v19)
      {
        uint64_t v31 = v19;
        sub_20BA208F4(0, (unint64_t *)&unk_2676AE3F0);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v20 = v37;
        swift_unknownObjectRelease();
        uint64_t v18 = v9;
        uint64_t v16 = v11;
        if (v20) {
          continue;
        }
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

uint64_t sub_20BAA66C8()
{
  type metadata accessor for MediaStateFetchManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE88];
  qword_2676AF518 = v0;
  return result;
}

uint64_t static MediaStateFetchManager.shared.getter()
{
  if (qword_2676AD560 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t sub_20BAA676C(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v3[8] = *v2;
  return MEMORY[0x270FA2498](sub_20BAA67B8, v2, 0);
}

uint64_t sub_20BAA67B8()
{
  v0[2] = MEMORY[0x263F8EE88];
  uint64_t v1 = v0[7];
  sub_20BAA5F00(v0[5], (uint64_t)(v0 + 2));
  v0[9] = v0[2];
  swift_retain();
  uint64_t v2 = swift_bridgeObjectRetain();
  unint64_t v3 = sub_20BAA6F08(v2, v1);
  v0[10] = v3;
  swift_release();
  swift_bridgeObjectRelease();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_20BCE7F20();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    v0[11] = sub_20BCE7B00();
    uint64_t v8 = (uint64_t (*)(unint64_t))((int)*MEMORY[0x263F0AE20] + MEMORY[0x263F0AE20]);
    uint64_t v4 = (void *)swift_task_alloc();
    v0[12] = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_20BAA6960;
    return v8(v3);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_20BAA6960()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  unint64_t v3 = *(void **)(v2 + 88);
  uint64_t v4 = *(void *)(v2 + 56);
  if (v0)
  {

    swift_bridgeObjectRelease();
    uint64_t v5 = sub_20BAA6B38;
  }
  else
  {
    swift_bridgeObjectRelease();

    uint64_t v5 = sub_20BAA6AD8;
  }
  return MEMORY[0x270FA2498](v5, v4, 0);
}

uint64_t sub_20BAA6AD8()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_20BAA6B38()
{
  uint64_t v19 = v0;
  if (qword_2676AD568 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = sub_20BCE7290();
  __swift_project_value_buffer(v2, (uint64_t)qword_2676B6C40);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_20BCE7270();
  os_log_type_t v6 = sub_20BCE7A90();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[13];
  if (v7)
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = v11;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v12 = sub_20BCE8150();
    v0[3] = sub_20BA297F4(v12, v13, &v18);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2112;
    id v14 = v8;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v15;
    sub_20BCE7BC0();
    *uint64_t v10 = v15;

    _os_log_impl(&dword_20B986000, v5, v6, "%s: Failed to fetch updates for media devices with error: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676AE2D0);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v10, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v11, -1, -1);
    MEMORY[0x21053F820](v9, -1, -1);
  }
  else
  {
  }
  swift_bridgeObjectRelease();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_20BAA6DD4()
{
  swift_beginAccess();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE88];
  return swift_bridgeObjectRelease();
}

uint64_t MediaStateFetchManager.deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t MediaStateFetchManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t MediaStateFetchManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_20BAA6E84()
{
  uint64_t v0 = sub_20BCE7290();
  __swift_allocate_value_buffer(v0, qword_2676B6C40);
  __swift_project_value_buffer(v0, (uint64_t)qword_2676B6C40);
  return sub_20BCE7280();
}

uint64_t sub_20BAA6F08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20BCE65C0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v49 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  int v59 = (char *)&v44 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v44 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AE0E0);
  MEMORY[0x270FA5388](v12 - 8);
  id v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = MEMORY[0x263F8EE78];
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v46 = a1 + 56;
  uint64_t v16 = 1 << *(unsigned char *)(a1 + 32);
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  uint64_t v19 = (uint64_t *)(a2 + 112);
  uint64_t v54 = a1;
  swift_bridgeObjectRetain();
  uint64_t result = swift_beginAccess();
  int64_t v21 = 0;
  int64_t v47 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v63 = v5 + 16;
  uint64_t v52 = v5;
  id v53 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  id v50 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  uint64_t v51 = v5 + 48;
  uint64_t v61 = (uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  long long v48 = xmmword_20BD13100;
  int v58 = v11;
  uint64_t v45 = v14;
  v55 = (uint64_t *)(a2 + 112);
  if (v18) {
    goto LABEL_33;
  }
LABEL_7:
  while (2)
  {
    int64_t v22 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
LABEL_37:
      __break(1u);
      return result;
    }
    if (v22 < v47)
    {
      unint64_t v23 = *(void *)(v46 + 8 * v22);
      ++v21;
      if (v23) {
        goto LABEL_22;
      }
      int64_t v21 = v22 + 1;
      if (v22 + 1 >= v47) {
        break;
      }
      unint64_t v23 = *(void *)(v46 + 8 * v21);
      if (v23) {
        goto LABEL_22;
      }
      int64_t v21 = v22 + 2;
      if (v22 + 2 >= v47) {
        break;
      }
      unint64_t v23 = *(void *)(v46 + 8 * v21);
      if (v23) {
        goto LABEL_22;
      }
      int64_t v21 = v22 + 3;
      if (v22 + 3 >= v47) {
        break;
      }
      unint64_t v23 = *(void *)(v46 + 8 * v21);
      if (v23)
      {
LABEL_22:
        uint64_t v25 = (v23 - 1) & v23;
        for (unint64_t i = __clz(__rbit64(v23)) + (v21 << 6); ; unint64_t i = v43 | (v21 << 6))
        {
          uint64_t v27 = *(void *)(v54 + 48);
          uint64_t v28 = v52;
          uint64_t v60 = *(uint64_t (**)(uint64_t, uint64_t))(v52 + 72);
          uint64_t v62 = *(void (**)(char *, unint64_t, uint64_t))(v52 + 16);
          v62(v14, v27 + (void)v60 * i, v4);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v14, 0, 1, v4);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v14, 1, v4) == 1) {
            goto LABEL_35;
          }
          unint64_t v56 = v25;
          int64_t v57 = v21;
          (*v50)(v11, v14, v4);
          uint64_t v29 = *v19;
          if (!*(void *)(*v19 + 16)) {
            goto LABEL_30;
          }
          sub_20BAA7800(&qword_2676AE4A0);
          swift_bridgeObjectRetain();
          uint64_t v30 = v4;
          uint64_t v31 = sub_20BCE7590();
          uint64_t v32 = -1 << *(unsigned char *)(v29 + 32);
          unint64_t v33 = v31 & ~v32;
          if (((*(void *)(v29 + 56 + ((v33 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v33) & 1) == 0) {
            break;
          }
          uint64_t v34 = ~v32;
          while (1)
          {
            uint64_t v35 = (uint64_t)v59;
            v62(v59, *(void *)(v29 + 48) + v33 * (void)v60, v30);
            sub_20BAA7800((unint64_t *)&qword_2676ADDC0);
            char v36 = sub_20BCE75D0();
            uint64_t v37 = *v61;
            (*v61)(v35, v30);
            if (v36) {
              break;
            }
            unint64_t v33 = (v33 + 1) & v34;
            if (((*(void *)(v29 + 56 + ((v33 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v33) & 1) == 0) {
              goto LABEL_29;
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v11 = v58;
          uint64_t v4 = v30;
          uint64_t result = v37((uint64_t)v58, v30);
          id v14 = v45;
          uint64_t v19 = v55;
          unint64_t v18 = v56;
          int64_t v21 = v57;
          if (!v56) {
            goto LABEL_7;
          }
LABEL_33:
          unint64_t v43 = __clz(__rbit64(v18));
          uint64_t v25 = (v18 - 1) & v18;
        }
LABEL_29:
        swift_bridgeObjectRelease();
        uint64_t v4 = v30;
        uint64_t v11 = v58;
        id v14 = v45;
LABEL_30:
        uint64_t v38 = v49;
        uint64_t v39 = (void (*)(uint64_t, char *, uint64_t))v62;
        v62(v49, (unint64_t)v11, v4);
        swift_beginAccess();
        uint64_t v40 = (uint64_t)v59;
        sub_20BA2E0DC((uint64_t)v59, v38);
        uint64_t v60 = *v61;
        v60(v40, v4);
        swift_endAccess();
        v39(v40, v11, v4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E4C0);
        uint64_t v41 = swift_allocObject();
        *(_OWORD *)(v41 + 16) = v48;
        sub_20BCE73B0();
        swift_allocObject();
        *(void *)(v41 + 32) = sub_20BCE73A0();
        sub_20BCE7620();
        sub_20BCE7370();
        swift_allocObject();
        *(void *)(v41 + 40) = sub_20BCE7360();
        sub_20BCE7620();
        swift_allocObject();
        *(void *)(v41 + 48) = sub_20BCE7360();
        uint64_t v64 = v41;
        sub_20BCE7730();
        sub_20BCE7390();
        swift_allocObject();
        sub_20BCE7380();
        uint64_t v42 = v60((uint64_t)v11, v4);
        MEMORY[0x21053DB50](v42);
        if (*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_20BCE7760();
        }
        sub_20BCE77A0();
        uint64_t result = sub_20BCE7730();
        unint64_t v18 = v56;
        int64_t v21 = v57;
        uint64_t v19 = v55;
        if (!v56) {
          continue;
        }
        goto LABEL_33;
      }
      int64_t v24 = v22 + 4;
      if (v24 < v47)
      {
        unint64_t v23 = *(void *)(v46 + 8 * v24);
        if (v23)
        {
          int64_t v21 = v24;
          goto LABEL_22;
        }
        while (1)
        {
          int64_t v21 = v24 + 1;
          if (__OFADD__(v24, 1)) {
            goto LABEL_37;
          }
          if (v21 >= v47) {
            goto LABEL_34;
          }
          unint64_t v23 = *(void *)(v46 + 8 * v21);
          ++v24;
          if (v23) {
            goto LABEL_22;
          }
        }
      }
    }
    break;
  }
LABEL_34:
  (*v53)(v14, 1, 1, v4);
LABEL_35:
  swift_release();
  return v65;
}

uint64_t type metadata accessor for MediaStateFetchManager()
{
  return self;
}

uint64_t method lookup function for MediaStateFetchManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MediaStateFetchManager);
}

uint64_t dispatch thunk of MediaStateFetchManager.fetchUpdates(items:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 120) + **(int **)(*(void *)v2 + 120));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_20BA1FC8C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of MediaStateFetchManager.resetFetchedItems()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_20BAA7800(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_20BCE65C0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id HFTileResizable.tileSize.getter()
{
  id v1 = objc_msgSend(v0, sel_hf_tileSize);
  return v1;
}

id HFTileResizable.set(tileSize:)(uint64_t a1)
{
  id v2 = objc_msgSend(v1, sel_hf_setTileSize_, a1);
  return v2;
}

Swift::Bool __swiftcall MatterAccessoryLikeItem.actionsMayRequireDeviceUnlock()()
{
  return 0;
}

uint64_t MatterAccessoryLikeItem.currentStateActionBuilders(for:)(void *a1)
{
  id v90 = a1;
  uint64_t v97 = sub_20BCE6950();
  uint64_t v88 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  v96 = (char *)&v84 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_20BCE6E20();
  uint64_t v95 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF530);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  v93 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v84 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AE340);
  MEMORY[0x270FA5388](v11 - 8);
  v92 = (char *)&v84 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_20BCE6A40();
  uint64_t v13 = *(void *)(v94 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v94);
  uint64_t v16 = (char *)&v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  v103 = (char *)&v84 - v18;
  MEMORY[0x270FA5388](v17);
  v91 = (char *)&v84 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AE320);
  MEMORY[0x270FA5388](v20 - 8);
  int64_t v22 = (char *)&v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_20BCE6C20();
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  int64_t v26 = (char *)&v84 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = *(void *)(v1 + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable);
  uint64_t v27 = v98 + OBJC_IVAR___HFMatterAccessoryRepresentable_staticMatterDevice;
  swift_beginAccess();
  sub_20BA41FD4(v27, (uint64_t)v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
  {
    uint64_t v28 = &qword_2676AE320;
    uint64_t v29 = (uint64_t)v22;
LABEL_34:
    sub_20BA1FD90(v29, v28);
    sub_20BA208F4(0, (unint64_t *)&qword_2676AE2E8);
    uint64_t v62 = (void *)MEMORY[0x21053DF60](MEMORY[0x263F8EE78]);
    id v63 = objc_msgSend(self, sel_futureWithResult_, v62);

    return (uint64_t)v63;
  }
  uint64_t v85 = v5;
  uint64_t v105 = v3;
  uint64_t v87 = v24;
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
  uint64_t v86 = v23;
  v30(v26, v22, v23);
  uint64_t v89 = v26;
  uint64_t v31 = sub_20BCE6C10();
  uint64_t v32 = *(void *)(v31 + 64);
  uint64_t v99 = v31 + 64;
  uint64_t v33 = 1 << *(unsigned char *)(v31 + 32);
  uint64_t v34 = -1;
  if (v33 < 64) {
    uint64_t v34 = ~(-1 << v33);
  }
  unint64_t v35 = v34 & v32;
  uint64_t v102 = v13 + 16;
  id v104 = (void (**)(char *, char *, uint64_t))(v13 + 32);
  char v36 = (uint64_t (**)(char *, uint64_t, uint64_t))(v95 + 48);
  v100 = (void (**)(char *, void, uint64_t))((unint64_t)(v33 + 63) >> 6);
  v101 = (uint64_t (**)(char *, uint64_t))(v13 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v38 = 0;
  uint64_t v39 = v94;
  if (!v35) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v40 = __clz(__rbit64(v35));
  v35 &= v35 - 1;
  for (unint64_t i = v40 | (v38 << 6); ; unint64_t i = __clz(__rbit64(v43)) + (v38 << 6))
  {
    uint64_t v45 = v31;
    unint64_t v46 = *(void *)(v31 + 56) + *(void *)(v13 + 72) * i;
    int64_t v47 = v103;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v103, v46, v39);
    long long v48 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v48(v16, v47, v39);
    uint64_t v49 = v39;
    sub_20BCE6A20();
    int v50 = (*v36)(v10, 1, v105);
    sub_20BA1FD90((uint64_t)v10, &qword_2676AF530);
    if (v50 != 1)
    {
      swift_release();
      uint64_t v51 = v92;
      v48(v92, v16, v49);
      uint64_t v52 = 0;
      uint64_t v39 = v49;
      goto LABEL_30;
    }
    uint64_t result = (*v101)(v16, v49);
    uint64_t v39 = v49;
    uint64_t v31 = v45;
    if (v35) {
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v42 = v38 + 1;
    if (__OFADD__(v38, 1))
    {
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }
    if (v42 >= (uint64_t)v100) {
      goto LABEL_29;
    }
    unint64_t v43 = *(void *)(v99 + 8 * v42);
    ++v38;
    if (!v43)
    {
      uint64_t v38 = v42 + 1;
      if (v42 + 1 >= (uint64_t)v100) {
        goto LABEL_29;
      }
      unint64_t v43 = *(void *)(v99 + 8 * v38);
      if (!v43)
      {
        uint64_t v38 = v42 + 2;
        if (v42 + 2 >= (uint64_t)v100) {
          goto LABEL_29;
        }
        unint64_t v43 = *(void *)(v99 + 8 * v38);
        if (!v43)
        {
          uint64_t v38 = v42 + 3;
          if (v42 + 3 >= (uint64_t)v100) {
            goto LABEL_29;
          }
          unint64_t v43 = *(void *)(v99 + 8 * v38);
          if (!v43)
          {
            uint64_t v38 = v42 + 4;
            if (v42 + 4 >= (uint64_t)v100) {
              goto LABEL_29;
            }
            unint64_t v43 = *(void *)(v99 + 8 * v38);
            if (!v43) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v35 = (v43 - 1) & v43;
  }
  uint64_t v44 = v42 + 5;
  if (v44 < (uint64_t)v100)
  {
    unint64_t v43 = *(void *)(v99 + 8 * v44);
    if (!v43)
    {
      while (1)
      {
        uint64_t v38 = v44 + 1;
        if (__OFADD__(v44, 1)) {
          goto LABEL_46;
        }
        if (v38 >= (uint64_t)v100) {
          goto LABEL_29;
        }
        unint64_t v43 = *(void *)(v99 + 8 * v38);
        ++v44;
        if (v43) {
          goto LABEL_24;
        }
      }
    }
    uint64_t v38 = v44;
    goto LABEL_24;
  }
LABEL_29:
  swift_release();
  uint64_t v52 = 1;
  uint64_t v51 = v92;
LABEL_30:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v51, v52, 1, v39);
  swift_bridgeObjectRelease();
  int v53 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v51, 1, v39);
  uint64_t v54 = v105;
  uint64_t v55 = v95;
  unint64_t v56 = v89;
  int64_t v57 = v93;
  if (v53 == 1)
  {
    (*(void (**)(char *, uint64_t))(v87 + 8))(v89, v86);
    uint64_t v28 = &qword_2676AE340;
    uint64_t v29 = (uint64_t)v51;
    goto LABEL_34;
  }
  int v58 = v51;
  int v59 = v91;
  (*v104)(v91, v58, v39);
  sub_20BCE6A20();
  int v60 = (*v36)(v57, 1, v54);
  uint64_t v61 = v87;
  if (v60 == 1)
  {
    (*v101)(v59, v39);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v56, v86);
    uint64_t v28 = &qword_2676AF530;
    uint64_t v29 = (uint64_t)v57;
    goto LABEL_34;
  }
  (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v85, v57, v54);
  sub_20BCE6DE0();
  uint64_t v64 = sub_20BCE7740();
  swift_bridgeObjectRelease();
  uint64_t v107 = MEMORY[0x263F8EE78];
  uint64_t v65 = *(void *)(v64 + 16);
  if (v65)
  {
    uint64_t v99 = v64;
    uint64_t v66 = v64 + 32;
    v103 = (char *)(v55 + 16);
    id v104 = (void (**)(char *, char *, uint64_t))OBJC_IVAR___HFMatterAccessoryRepresentable_accessory;
    LODWORD(v102) = *MEMORY[0x263F483C8];
    v100 = (void (**)(char *, void, uint64_t))(v88 + 104);
    int v67 = (void (**)(char *, uint64_t))(v88 + 8);
    v68 = v85;
    v69 = v96;
    do
    {
      sub_20BA45B64(v66, (uint64_t)v106);
      __swift_project_boxed_opaque_existential_1(v106, v106[3]);
      v70 = *(void (**)(char *, char *, uint64_t))((char *)v104 + v98);
      v71 = v68;
      (*(void (**)(char *, char *, uint64_t))v103)(v69, v68, v105);
      uint64_t v72 = v97;
      (*v100)(v69, v102, v97);
      id v73 = v70;
      uint64_t v74 = (void *)sub_20BCE68F0();

      (*v67)(v69, v72);
      if (v74)
      {
        id v75 = v74;
        MEMORY[0x21053DB50]();
        if (*(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_20BCE7760();
        }
        sub_20BCE77A0();
        sub_20BCE7730();
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
      v66 += 40;
      --v65;
      v68 = v71;
    }
    while (v65);
    swift_bridgeObjectRelease();
    int v59 = v91;
    uint64_t v61 = v87;
  }
  else
  {
    swift_bridgeObjectRelease();
    v68 = v85;
  }
  v76 = *(void **)(v98 + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory);
  id v77 = objc_allocWithZone((Class)HFMatterCommandActionBuilder);
  sub_20BA208F4(0, (unint64_t *)&qword_2676AE1B0);
  id v78 = v90;
  id v79 = v76;
  v80 = (void *)sub_20BCE76F0();
  swift_bridgeObjectRelease();
  id v81 = objc_msgSend(v77, sel_initWithHome_commands_accessory_enforceExecutionOrder_, v78, v80, v79, 1);

  id v82 = objc_msgSend(self, sel_setWithObject_, v81);
  id v83 = objc_msgSend(self, sel_futureWithResult_, v82);

  (*(void (**)(char *, uint64_t))(v95 + 8))(v68, v105);
  (*v101)(v59, v94);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v89, v86);
  return (uint64_t)v83;
}

unint64_t _s4Home23MatterAccessoryLikeItemC15containsActionsSbyF_0()
{
  uint64_t v0 = unk_26C073BF8;
  if ((unk_26C073BF8 & ~qword_26C073BF0) == 0) {
    uint64_t v0 = 0;
  }
  uint64_t v1 = v0 | qword_26C073BF0;
  uint64_t v3 = qword_26C073C00;
  int v2 = qword_26C073C08[0];
  if ((qword_26C073C00 & ~v1) == 0) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v3 | v1;
  if ((qword_26C073C08[0] & ~v4) == 0) {
    int v2 = 0;
  }
  return ((unint64_t)(v2 | v4) >> 5) & 1;
}

BOOL static DashboardStaticSectionListItemType.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

uint64_t DashboardStaticSectionListItemType.rawValue.getter()
{
  return *v0;
}

Home::DashboardStaticSectionListItemType_optional __swiftcall DashboardStaticSectionListItemType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (Home::DashboardStaticSectionListItemType_optional)rawValue;
}

BOOL sub_20BAA8574(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Home::DashboardStaticSectionListItemType_optional sub_20BAA8588(Swift::Int *a1)
{
  return DashboardStaticSectionListItemType.init(rawValue:)(*a1);
}

void sub_20BAA8590(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_20BAA859C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_20BAA85B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_20BAA85C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_20BAA85D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t sub_20BAA8668()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___HFDashboardStaticSectionListItem_uuidString);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_20BAA872C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR___HFDashboardStaticSectionListItem_uuidString);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_20BAA878C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR___HFDashboardStaticSectionListItem_uuidString);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_20BAA87F8())()
{
  return j__swift_endAccess;
}

void DashboardStaticSectionListItem.sectionType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + OBJC_IVAR___HFDashboardStaticSectionListItem_sectionType);
}

id DashboardStaticSectionListItem.__allocating_init(results:type:)(uint64_t a1, unsigned __int8 *a2)
{
  id v5 = objc_allocWithZone(v2);
  return DashboardStaticSectionListItem.init(results:type:)(a1, a2);
}

id DashboardStaticSectionListItem.init(results:type:)(uint64_t a1, unsigned __int8 *a2)
{
  int v3 = *a2;
  v2[OBJC_IVAR___HFDashboardStaticSectionListItem_sectionType] = v3;
  unint64_t v4 = 0xED00006E6F697463;
  unint64_t v5 = 0x655373656E656373;
  if (v3 != 1)
  {
    unint64_t v5 = 0xD000000000000010;
    unint64_t v4 = 0x800000020BD14C30;
  }
  BOOL v6 = v3 == 0;
  if (v3) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x53736172656D6163;
  }
  if (v6) {
    unint64_t v4 = 0xEE006E6F69746365;
  }
  uint64_t v8 = (uint64_t *)&v2[OBJC_IVAR___HFDashboardStaticSectionListItem_uuidString];
  *uint64_t v8 = v7;
  v8[1] = v4;
  uint64_t v9 = (void *)sub_20BCE7510();
  swift_bridgeObjectRelease();
  v12.receiver = v2;
  v12.super_class = (Class)type metadata accessor for DashboardStaticSectionListItem();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithResults_, v9);

  return v10;
}

uint64_t type metadata accessor for DashboardStaticSectionListItem()
{
  return self;
}

id DashboardStaticSectionListItem.__allocating_init(results:)()
{
  id v1 = objc_allocWithZone(v0);
  uint64_t v2 = (void *)sub_20BCE7510();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_initWithResults_, v2);

  return v3;
}

void DashboardStaticSectionListItem.init(results:)()
{
}

id DashboardStaticSectionListItem.__allocating_init(resultsBlock:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  v9[4] = a1;
  v9[5] = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_20BAA8B88;
  v9[3] = &block_descriptor_12;
  BOOL v6 = _Block_copy(v9);
  id v7 = objc_msgSend(v5, sel_initWithResultsBlock_, v6);
  _Block_release(v6);
  swift_release();
  return v7;
}

id sub_20BAA8B88(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  id v3 = (void *)v1(v2);
  swift_release();
  return v3;
}

void DashboardStaticSectionListItem.init(resultsBlock:)()
{
}

id DashboardStaticSectionListItem.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DashboardStaticSectionListItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_20BAA8C7C()
{
  unint64_t result = qword_2676AF5B0;
  if (!qword_2676AF5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676AF5B0);
  }
  return result;
}

uint64_t sub_20BAA8CD0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR___HFDashboardStaticSectionListItem_uuidString);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

unsigned char *storeEnumTagSinglePayload for DashboardStaticSectionListItemType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20BAA8DF8);
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

ValueMetadata *type metadata accessor for DashboardStaticSectionListItemType()
{
  return &type metadata for DashboardStaticSectionListItemType;
}

uint64_t method lookup function for DashboardStaticSectionListItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DashboardStaticSectionListItem);
}

uint64_t dispatch thunk of DashboardStaticSectionListItem.uuidString.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of DashboardStaticSectionListItem.uuidString.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of DashboardStaticSectionListItem.uuidString.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of DashboardStaticSectionListItem.__allocating_init(results:type:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

id static HFServiceItem.serviceItem(for:valueSource:)(uint64_t a1, uint64_t a2)
{
  id result = objc_msgSend(self, sel_serviceItemForService_valueSource_, a1, a2);
  if (result) {
    return (id)swift_dynamicCastUnknownClassUnconditional();
  }
  return result;
}

uint64_t sub_20BAA8F78(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v38 = MEMORY[0x263F8EE78];
  sub_20BA2AFF8(0, v1, 0);
  uint64_t result = sub_20BAAC438(a1);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  uint64_t v39 = &v35;
  int v26 = v5;
  int64_t v25 = v1;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_25;
    }
    if (*(_DWORD *)(a1 + 36) != v5) {
      goto LABEL_26;
    }
    uint64_t v12 = v8;
    sub_20BA204B4(*(void *)(a1 + 48) + 40 * v6, (uint64_t)v34);
    uint64_t v13 = (uint64_t)v39;
    sub_20BA200A0(*(void *)(a1 + 56) + 32 * v6, (uint64_t)v39);
    sub_20BA204B4((uint64_t)v34, (uint64_t)v31);
    sub_20BA200A0(v13, (uint64_t)v32 + 8);
    v29[0] = v32[0];
    v29[1] = v32[1];
    uint64_t v30 = v33;
    v28[0] = v31[0];
    v28[1] = v31[1];
    sub_20BA1FD90((uint64_t)v34, &qword_2676AF708);
    sub_20BA204B4((uint64_t)v28, (uint64_t)v27);
    swift_dynamicCast();
    uint64_t v14 = sub_20BCE75E0();
    swift_bridgeObjectRelease();
    sub_20BA200A0((uint64_t)v29 + 8, (uint64_t)v36 + 8);
    *(void *)&v36[0] = v14;
    sub_20BA1FD90((uint64_t)v28, &qword_2676AF708);
    uint64_t v2 = v38;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_20BA2AFF8(0, *(void *)(v2 + 16) + 1, 1);
      uint64_t v2 = v38;
    }
    unint64_t v16 = *(void *)(v2 + 16);
    unint64_t v15 = *(void *)(v2 + 24);
    uint64_t v8 = v12;
    if (v16 >= v15 >> 1)
    {
      uint64_t result = sub_20BA2AFF8(v15 > 1, v16 + 1, 1);
      uint64_t v8 = v12;
      uint64_t v2 = v38;
    }
    *(void *)(v2 + 16) = v16 + 1;
    uint64_t v17 = v2 + 40 * v16;
    long long v18 = v36[0];
    long long v19 = v36[1];
    *(void *)(v17 + 64) = v37;
    *(_OWORD *)(v17 + 32) = v18;
    *(_OWORD *)(v17 + 48) = v19;
    int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
    if (v6 >= v9) {
      goto LABEL_27;
    }
    uint64_t v20 = *(void *)(v8 + 8 * v11);
    if ((v20 & (1 << v6)) == 0) {
      goto LABEL_28;
    }
    int v5 = v26;
    if (*(_DWORD *)(a1 + 36) != v26) {
      goto LABEL_29;
    }
    unint64_t v21 = v20 & (-2 << (v6 & 0x3F));
    if (v21)
    {
      int64_t v9 = __clz(__rbit64(v21)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v25;
    }
    else
    {
      unint64_t v22 = v11 + 1;
      unint64_t v23 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v25;
      if (v11 + 1 < v23)
      {
        unint64_t v24 = *(void *)(v8 + 8 * v22);
        if (v24)
        {
LABEL_22:
          int64_t v9 = __clz(__rbit64(v24)) + (v22 << 6);
        }
        else
        {
          while (v23 - 2 != v11)
          {
            unint64_t v24 = *(void *)(a1 + 80 + 8 * v11++);
            if (v24)
            {
              unint64_t v22 = v11 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    ++v7;
    uint64_t v6 = v9;
    if (v7 == v10) {
      return v2;
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

uint64_t sub_20BAA929C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v38 = MEMORY[0x263F8EE78];
  sub_20BA2AFD8(0, v1, 0);
  uint64_t result = sub_20BAAC438(a1);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  uint64_t v39 = &v35;
  int v29 = v5;
  int64_t v28 = v1;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_25;
    }
    if (*(_DWORD *)(a1 + 36) != v5) {
      goto LABEL_26;
    }
    uint64_t v12 = *(void **)(*(void *)(a1 + 48) + 8 * v6);
    uint64_t v13 = (uint64_t)v39;
    sub_20BA200A0(*(void *)(a1 + 56) + 32 * v6, (uint64_t)v39);
    uint64_t v34 = v12;
    *(void *)&v32[0] = v12;
    sub_20BA200A0(v13, (uint64_t)v32 + 8);
    v30[0] = v32[0];
    v30[1] = v32[1];
    uint64_t v31 = v33;
    id v14 = v12;
    sub_20BA1FD90((uint64_t)&v34, &qword_2676AF7B0);
    uint64_t v15 = sub_20BCE7620();
    uint64_t v17 = v16;
    sub_20BA200A0((uint64_t)v30 + 8, (uint64_t)v37);
    *(void *)&long long v36 = v15;
    *((void *)&v36 + 1) = v17;
    sub_20BA1FD90((uint64_t)v30, &qword_2676AF7B0);
    uint64_t v2 = v38;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_20BA2AFD8(0, *(void *)(v2 + 16) + 1, 1);
      uint64_t v2 = v38;
    }
    unint64_t v19 = *(void *)(v2 + 16);
    unint64_t v18 = *(void *)(v2 + 24);
    if (v19 >= v18 >> 1)
    {
      uint64_t result = sub_20BA2AFD8(v18 > 1, v19 + 1, 1);
      uint64_t v2 = v38;
    }
    *(void *)(v2 + 16) = v19 + 1;
    uint64_t v20 = (_OWORD *)(v2 + 48 * v19);
    long long v21 = v36;
    long long v22 = v37[1];
    v20[3] = v37[0];
    v20[4] = v22;
    v20[2] = v21;
    int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
    if (v6 >= v9) {
      goto LABEL_27;
    }
    uint64_t v23 = *(void *)(v8 + 8 * v11);
    if ((v23 & (1 << v6)) == 0) {
      goto LABEL_28;
    }
    int v5 = v29;
    if (*(_DWORD *)(a1 + 36) != v29) {
      goto LABEL_29;
    }
    unint64_t v24 = v23 & (-2 << (v6 & 0x3F));
    if (v24)
    {
      int64_t v9 = __clz(__rbit64(v24)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v28;
    }
    else
    {
      unint64_t v25 = v11 + 1;
      unint64_t v26 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v28;
      if (v11 + 1 < v26)
      {
        unint64_t v27 = *(void *)(v8 + 8 * v25);
        if (v27)
        {
LABEL_22:
          int64_t v9 = __clz(__rbit64(v27)) + (v25 << 6);
        }
        else
        {
          while (v26 - 2 != v11)
          {
            unint64_t v27 = *(void *)(a1 + 80 + 8 * v11++);
            if (v27)
            {
              unint64_t v25 = v11 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    ++v7;
    uint64_t v6 = v9;
    if (v7 == v10) {
      return v2;
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

id HFTransformItem.transformedSourceItem.getter()
{
  sub_20BA208F4(0, (unint64_t *)&qword_26AB2E460);
  id v1 = objc_msgSend(v0, sel_sourceItem);
  return v1;
}

id sub_20BAA961C()
{
  sub_20BA208F4(0, (unint64_t *)&qword_26AB2E460);
  id v1 = objc_msgSend(*v0, sel_transformedSourceItem);
  return v1;
}

id ConfigurableTransformItem.sourceItem.getter()
{
  return *(id *)(v0 + qword_2676AF5B8);
}

uint64_t sub_20BAA967C()
{
  sub_20BAAC4D0();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20BAA96A4(uint64_t a1)
{
  int v3 = (void *)(v1 + qword_2676AF5C0);
  swift_beginAccess();
  *int v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_20BAA96F8())()
{
  return j__swift_endAccess;
}

id sub_20BAA9754()
{
  uint64_t v0 = (void *)sub_20BAAC4C0();
  return v0;
}

id ConfigurableTransformItem.__allocating_init(sourceItem:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return ConfigurableTransformItem.init(sourceItem:)(a1);
}

id ConfigurableTransformItem.init(sourceItem:)(uint64_t a1)
{
  *(void *)&v1[qword_2676AF5C0] = MEMORY[0x263F8EE78];
  *(void *)&v1[qword_2676AF5B8] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for ConfigurableTransformItem();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_20BAA9830(uint64_t a1)
{
  uint64_t v2 = *(void **)&v1[qword_2676AF5B8];
  sub_20BAA99B8(a1);
  type metadata accessor for HFItemUpdateOption(0);
  sub_20BAAD008((unint64_t *)&qword_2676AD810, type metadata accessor for HFItemUpdateOption);
  objc_super v3 = (void *)sub_20BCE7510();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_updateWithOptions_, v3);

  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v1;
  v10[4] = sub_20BAAC568;
  v10[5] = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  void v10[2] = sub_20BA80324;
  v10[3] = &block_descriptor_13;
  uint64_t v6 = _Block_copy(v10);
  uint64_t v7 = v1;
  swift_release();
  id v8 = objc_msgSend(v4, sel_flatMap_, v6);

  _Block_release(v6);
  return v8;
}

uint64_t sub_20BAA99B8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF720);
    uint64_t v2 = sub_20BCE7F60();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v25 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v24 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v26 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v26 << 6);
      goto LABEL_28;
    }
    int64_t v11 = v26 + 1;
    if (__OFADD__(v26, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v24) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v25 + 8 * v11);
    int64_t v13 = v26 + 1;
    if (!v12)
    {
      int64_t v13 = v26 + 2;
      if (v26 + 2 >= v24) {
        goto LABEL_37;
      }
      unint64_t v12 = *(void *)(v25 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v26 + 3;
        if (v26 + 3 >= v24) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v25 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v26 + 4;
          if (v26 + 4 >= v24) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v25 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v26 = v13;
LABEL_28:
    sub_20BA204B4(*(void *)(a1 + 48) + 40 * v10, (uint64_t)&v33);
    sub_20BA200A0(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v35 + 8);
    v31[0] = v35[0];
    v31[1] = v35[1];
    uint64_t v32 = v36;
    *(_OWORD *)&v30[5] = v33;
    *(_OWORD *)&v30[7] = v34;
    v28[0] = v33;
    v28[1] = v34;
    uint64_t v29 = *(void *)&v35[0];
    type metadata accessor for HFItemUpdateOption(0);
    swift_dynamicCast();
    sub_20BA1FD80((_OWORD *)((char *)v31 + 8), &v30[1]);
    uint64_t v15 = v30[0];
    sub_20BA1FD80(&v30[1], v27);
    sub_20BA1FD80(v27, v30);
    sub_20BA1FD80(v30, v28);
    sub_20BCE7620();
    sub_20BCE80E0();
    sub_20BCE7660();
    uint64_t v16 = sub_20BCE8120();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v17 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v18 = v16 & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v6 + 8 * (v18 >> 6))) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1 << v18) & ~*(void *)(v6 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v20 = 0;
      unint64_t v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v22 = v19 == v21;
        if (v19 == v21) {
          unint64_t v19 = 0;
        }
        v20 |= v22;
        uint64_t v23 = *(void *)(v6 + 8 * v19);
      }
      while (v23 == -1);
      unint64_t v8 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(void *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(void *)(*(void *)(v2 + 48) + 8 * v8) = v15;
    uint64_t result = (uint64_t)sub_20BA1FD80(v28, (_OWORD *)(*(void *)(v2 + 56) + 32 * v8));
    ++*(void *)(v2 + 16);
  }
  int64_t v14 = v26 + 5;
  if (v26 + 5 >= v24)
  {
LABEL_37:
    swift_release();
    sub_20BA20930();
    return v2;
  }
  unint64_t v12 = *(void *)(v25 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v26 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v24) {
      goto LABEL_37;
    }
    unint64_t v12 = *(void *)(v25 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_20BAA9DA0(void *a1, void *a2)
{
  objc_msgSend(a1, sel_mutableCopy);
  sub_20BCE7C00();
  swift_unknownObjectRelease();
  sub_20BA208F4(0, &qword_2676AF710);
  swift_dynamicCast();
  (*(void (**)())((*MEMORY[0x263F8EED0] & *a2) + 0x90))();
  objc_msgSend(v5, sel_copy);
  sub_20BCE7C00();
  swift_unknownObjectRelease();
  sub_20BA208F4(0, &qword_2676AF718);
  swift_dynamicCast();
  id v3 = objc_msgSend(self, sel_futureWithResult_, v5);

  return v3;
}

id sub_20BAA9EF4(void *a1)
{
  uint64_t v2 = sub_20BCE7520();
  id v3 = a1;
  id v4 = sub_20BAA9830(v2);

  swift_bridgeObjectRelease();
  return v4;
}

void sub_20BAA9F7C(void *a1)
{
  void (*v14)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21[3];

  uint64_t v2 = v1;
  uint64_t v4 = v1 + qword_2676AF5C0;
  swift_beginAccess();
  if (*(void *)(*(void *)v4 + 16))
  {
    id v5 = objc_msgSend(a1, sel_results);
    uint64_t v6 = sub_20BCE7520();

    uint64_t v7 = sub_20BAA8F78(v6);
    swift_bridgeObjectRelease();
    if (*(void *)(v7 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676AF5D0);
      uint64_t v8 = sub_20BCE7F60();
    }
    else
    {
      uint64_t v8 = MEMORY[0x263F8EE80];
    }
    v21[0] = v8;
    sub_20BAAC570(v7, 1, v21);
    swift_bridgeObjectRelease();
    uint64_t v9 = v21[0];
    unint64_t v10 = (uint64_t *)(v2 + qword_2676AF5C0);
    swift_beginAccess();
    uint64_t v11 = *v10;
    uint64_t v12 = *(void *)(*v10 + 16);
    if (v12)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = v11 + 40;
      do
      {
        int64_t v14 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v13 - 8);
        char v20 = v9;
        swift_retain();
        v14(&v19, &v20);
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v9 = v19;
        v13 += 16;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
    }
    uint64_t v15 = sub_20BAA929C(v9);
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_20BA850B0(v15);
    swift_bridgeObjectRelease();
    if (*(void *)(v16 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676ADD60);
      uint64_t v17 = sub_20BCE7F60();
    }
    else
    {
      uint64_t v17 = MEMORY[0x263F8EE80];
    }
    char v20 = v17;
    sub_20BAAC84C(v16, 1, &v20);
    swift_bridgeObjectRelease();
    unint64_t v18 = (void *)sub_20BCE7510();
    swift_release();
    objc_msgSend(a1, sel_setResults_, v18);
  }
}

id ConfigurableTransformItem.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ConfigurableTransformItem.init()()
{
}

void sub_20BAAA258()
{
}

id ConfigurableTransformItem.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConfigurableTransformItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20BAAA2DC(uint64_t a1)
{
  return swift_bridgeObjectRelease();
}

id sub_20BAAA328()
{
  uint64_t v0 = (void *)sub_20BAAC4C0();
  return v0;
}

uint64_t sub_20BAAA360()
{
  return MEMORY[0x21053F900](v0 + qword_2676AF5E0);
}

id SelectableTransformItem.__allocating_init(sourceItem:selectionControllerContainer:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_20BAACBA0(a1, a2, a3);
  swift_unknownObjectRelease();
  return v8;
}

id SelectableTransformItem.init(sourceItem:selectionControllerContainer:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = sub_20BAACBA0(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3;
}

void sub_20BAAA424(void *a1)
{
  sub_20BAA9F7C(a1);
  id v3 = &v1[qword_2676AF5E0];
  if (!MEMORY[0x21053F900](&v1[qword_2676AF5E0])) {
    return;
  }
  uint64_t v4 = *((void *)v3 + 1);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(ObjectType, v4);
  uint64_t v8 = v7;
  swift_unknownObjectRelease();
  if (!v6) {
    return;
  }
  uint64_t v9 = swift_getObjectType();
  char v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 32))(v1, v9, v8);
  id v11 = objc_msgSend(v1, sel_latestResults);
  if (!v11)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    goto LABEL_11;
  }
  uint64_t v12 = v11;
  uint64_t v13 = sub_20BCE7520();

  uint64_t v14 = sub_20BCE7620();
  if (!*(void *)(v13 + 16) || (uint64_t v16 = sub_20BA16D9C(v14, v15), (v17 & 1) == 0))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_20BA200A0(*(void *)(v13 + 56) + 32 * v16, (uint64_t)&v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v33 + 1))
  {
LABEL_11:
    sub_20BA1FD90((uint64_t)&v32, (uint64_t *)&unk_26AB2E690);
    goto LABEL_12;
  }
  sub_20BA208F4(0, (unint64_t *)&qword_2676AE6A0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    id v19 = 0;
    char v20 = 0;
    id v18 = 0;
    goto LABEL_13;
  }
  id v18 = v30[0];
  id v19 = objc_msgSend(v30[0], sel_integerValue);
  char v20 = 1;
LABEL_13:
  uint64_t v21 = HFPrimaryStateFromBOOL(v10 & 1);
  sub_20BCE7620();
  v30[1] = v22;
  sub_20BCE7D50();
  uint64_t v31 = sub_20BA208F4(0, (unint64_t *)&qword_2676AE6A0);
  v30[0] = (id)sub_20BCE7B30();
  id v23 = objc_msgSend(a1, sel_results);
  uint64_t v24 = sub_20BCE7520();

  uint64_t v29 = v24;
  if (v31)
  {
    sub_20BA1FD80(v30, v28);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_20BA1D1C0(v28, (uint64_t)&v32, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_20BA1FA04((uint64_t)&v32);
  }
  else
  {
    sub_20BA1FD90((uint64_t)v30, (uint64_t *)&unk_26AB2E690);
    sub_20BAAB0F4((uint64_t)&v32, v28);
    sub_20BA1FA04((uint64_t)&v32);
    sub_20BA1FD90((uint64_t)v28, (uint64_t *)&unk_26AB2E690);
  }
  int64_t v26 = (void *)sub_20BCE7510();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setResults_, v26);

  if (v19 == (id)v21) {
    char v27 = v20;
  }
  else {
    char v27 = 0;
  }
  if ((v27 & 1) == 0) {
    objc_msgSend(a1, sel_setOutcomeType_, 2);
  }
  swift_unknownObjectRelease();
}

void SelectableTransformItem.__allocating_init(sourceItem:)()
{
}

void SelectableTransformItem.init(sourceItem:)()
{
}

uint64_t sub_20BAAA81C()
{
  return sub_20BAACFE0(v0 + qword_2676AF5E0);
}

id SelectableTransformItem.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SelectableTransformItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20BAAA888(uint64_t a1)
{
  return sub_20BAACFE0(a1 + qword_2676AF5E0);
}

id sub_20BAAA898(uint64_t a1)
{
  id v1 = objc_msgSend(*(id *)(a1 + qword_2676AF5B8), sel_accessoryRepresentableObject);
  return v1;
}

id sub_20BAAA8DC()
{
  id v1 = objc_msgSend(*(id *)(v0 + qword_2676AF5B8), sel_accessoryRepresentableObject);
  return v1;
}

id sub_20BAAA91C(uint64_t a1)
{
  id v1 = objc_msgSend(*(id *)(a1 + qword_2676AF5B8), sel_homeKitObject);
  return v1;
}

id sub_20BAAA960()
{
  id v1 = objc_msgSend(*(id *)(v0 + qword_2676AF5B8), sel_homeKitObject);
  return v1;
}

uint64_t static AccessoryRepresentableSelectableTransformItem.withAccessoryRepresentableObject(_:valueSource:)()
{
  return 0;
}

id sub_20BAAA9A8()
{
  return 0;
}

id AccessoryRepresentableSelectableTransformItem.__allocating_init(sourceItem:selectionControllerContainer:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (char *)objc_allocWithZone(v3);
  *(void *)&v6[qword_2676AF5E0 + 8] = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a3;
  swift_unknownObjectWeakAssign();
  *(void *)&v6[qword_2676AF5C0] = MEMORY[0x263F8EE78];
  *(void *)&v6[qword_2676AF5B8] = a1;
  v9.receiver = v6;
  v9.super_class = (Class)__swift_instantiateConcreteTypeFromMangledName(qword_2676AF5E8);
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  swift_unknownObjectRelease();
  return v7;
}

id AccessoryRepresentableSelectableTransformItem.init(sourceItem:selectionControllerContainer:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[qword_2676AF5E0 + 8] = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a3;
  swift_unknownObjectWeakAssign();
  *(void *)&v3[qword_2676AF5C0] = MEMORY[0x263F8EE78];
  *(void *)&v3[qword_2676AF5B8] = a1;
  v7.receiver = v3;
  v7.super_class = (Class)__swift_instantiateConcreteTypeFromMangledName(qword_2676AF5E8);
  id v5 = objc_msgSendSuper2(&v7, sel_init);
  swift_unknownObjectRelease();
  return v5;
}

id AccessoryRepresentableSelectableTransformItem.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccessoryRepresentableSelectableTransformItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double sub_20BAAAB4C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  id v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_20BA16DFC(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    *id v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_20BA1DB6C();
      uint64_t v9 = v11;
    }

    sub_20BA1FD80((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_20BAAB1F0(v6, v9);
    *id v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

double sub_20BAAAC44@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_20BA16D9C(a1, a2);
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
      sub_20BA1DD34();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_20BA1FD80((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_20BAAB3E4(v8, v11);
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

uint64_t sub_20BAAAD48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_20BA16FB8(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *id v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_20BA1DD94();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_20BCE65C0();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = sub_20BCE6C20();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, v12 + *(void *)(v20 + 72) * v6, v13);
    sub_20BAAB5D4(v6, v9, MEMORY[0x263F48B40]);
    *id v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_20BCE6C20();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

uint64_t sub_20BAAAF2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_20BA1742C(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *id v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_20BA1F014();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_20BCE69E0();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v20 = v12;
    unint64_t v13 = *(void *)(v12 + 72) * v6;
    (*(void (**)(unint64_t, uint64_t))(v12 + 8))(v10 + v13, v11);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, *(void *)(v9 + 56) + v13, v11);
    sub_20BAABF68(v6, v9);
    *id v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v11;
  }
  else
  {
    uint64_t v18 = sub_20BCE69E0();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

double sub_20BAAB0F4@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  id v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_20BA16E90(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    *id v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_20BA1F5A8();
      uint64_t v9 = v11;
    }
    sub_20BA1FA04(*(void *)(v9 + 48) + 40 * v6);
    sub_20BA1FD80((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_20BAAC26C(v6, v9);
    *id v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_20BAAB1F0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_20BCE7C30();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v10 = *(void **)(*(void *)(a2 + 48) + 8 * v6);
        sub_20BCE7620();
        sub_20BCE80E0();
        id v11 = v10;
        sub_20BCE7660();
        uint64_t v12 = sub_20BCE8120();

        double result = swift_bridgeObjectRelease();
        unint64_t v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8) {
            goto LABEL_5;
          }
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          uint64_t v14 = *(void *)(a2 + 48);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || v15 >= v16 + 1) {
            *uint64_t v15 = *v16;
          }
          uint64_t v17 = *(void *)(a2 + 56);
          uint64_t v18 = (_OWORD *)(v17 + 32 * v3);
          id v19 = (_OWORD *)(v17 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v18 >= v19 + 2))
          {
            long long v9 = v19[1];
            *uint64_t v18 = *v19;
            v18[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_20BAAB3E4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_20BCE7C30();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_20BCE80E0();
        swift_bridgeObjectRetain();
        sub_20BCE7660();
        uint64_t v10 = sub_20BCE8120();
        double result = swift_bridgeObjectRelease();
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
          unint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            _OWORD *v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          uint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          uint64_t v17 = (_OWORD *)(v15 + 32 * v6);
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
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
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

unint64_t sub_20BAAB5BC(int64_t a1, uint64_t a2)
{
  return sub_20BAAB5D4(a1, a2, MEMORY[0x263F07490]);
}

unint64_t sub_20BAAB5D4(int64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v37 = a3;
  uint64_t v5 = sub_20BCE65C0();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t result = MEMORY[0x270FA5388](v5);
  long long v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a2 + 64;
  uint64_t v11 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v12 = (a1 + 1) & ~v11;
  if (((1 << v12) & *(void *)(a2 + 64 + 8 * (v12 >> 6))) != 0)
  {
    uint64_t v13 = ~v11;
    unint64_t result = sub_20BCE7C30();
    if ((*(void *)(v10 + 8 * (v12 >> 6)) & (1 << v12)) != 0)
    {
      unint64_t v40 = (result + 1) & v13;
      uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
      uint64_t v14 = v6 + 16;
      uint64_t v16 = *(void *)(v14 + 56);
      uint64_t v41 = v14;
      uint64_t v38 = (uint64_t (**)(char *, uint64_t))(v14 - 8);
      uint64_t v39 = v15;
      uint64_t v36 = v13;
      do
      {
        uint64_t v17 = v10;
        uint64_t v18 = v16;
        int64_t v19 = v16 * v12;
        v39(v9, *(void *)(a2 + 48) + v16 * v12, v5);
        sub_20BAAD008(&qword_2676AE4A0, MEMORY[0x263F07508]);
        uint64_t v20 = sub_20BCE7590();
        unint64_t result = (*v38)(v9, v5);
        unint64_t v21 = v20 & v13;
        if (a1 >= (uint64_t)v40)
        {
          if (v21 >= v40 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            if (v18 * a1 < v19
              || *(void *)(a2 + 48) + v18 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v19 + v18))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v18 * a1 != v19)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v24 = *(void *)(a2 + 56);
            uint64_t v25 = *(void *)(*(void *)(v37(0) - 8) + 72);
            int64_t v26 = v25 * a1;
            unint64_t result = v24 + v25 * a1;
            int64_t v27 = v25 * v12;
            unint64_t v28 = v24 + v25 * v12 + v25;
            BOOL v29 = v26 < v27 || result >= v28;
            uint64_t v10 = v17;
            if (v29)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v12;
              uint64_t v13 = v36;
            }
            else
            {
              a1 = v12;
              uint64_t v13 = v36;
              if (v26 != v27)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v12;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v40 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        uint64_t v10 = v17;
LABEL_5:
        unint64_t v12 = (v12 + 1) & v13;
        uint64_t v16 = v18;
      }
      while (((*(void *)(v10 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
    }
    uint64_t v30 = (uint64_t *)(v10 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v30;
    uint64_t v32 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v30 = (uint64_t *)(v10 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v32 = *v30;
    uint64_t v31 = (-1 << a1) - 1;
  }
  *uint64_t v30 = v32 & v31;
  uint64_t v33 = *(void *)(a2 + 16);
  BOOL v34 = __OFSUB__(v33, 1);
  uint64_t v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v35;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_20BAAB928(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20BCE6E40();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_20BCE7C30();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      uint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_20BAAD008(&qword_2676ADE40, MEMORY[0x263F48FD8]);
        uint64_t v19 = sub_20BCE7590();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(sub_20BCE66F0() - 8) + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    BOOL v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *BOOL v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_20BAABC70(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20BCE65C0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v34 = a2 + 64;
    unint64_t result = sub_20BCE7C30();
    uint64_t v12 = v34;
    if ((*(void *)(v34 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v33 = v5 + 16;
      uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v14 = *(void *)(v5 + 72);
      do
      {
        uint64_t v15 = v14;
        int64_t v16 = v14 * v10;
        v32(v8, *(void *)(a2 + 48) + v14 * v10, v4);
        sub_20BAAD008(&qword_2676AE4A0, MEMORY[0x263F07508]);
        uint64_t v17 = sub_20BCE7590();
        unint64_t result = (*v13)(v8, v4);
        unint64_t v18 = v17 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v18 >= v31 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            uint64_t v21 = *(void *)(a2 + 48);
            uint64_t v14 = v15;
            unint64_t result = v21 + v15 * a1;
            if (v15 * a1 < v16 || result >= v21 + v16 + v15)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v22 = *(void *)(a2 + 56);
            uint64_t v23 = (void *)(v22 + 8 * a1);
            uint64_t v24 = (void *)(v22 + 8 * v10);
            uint64_t v12 = v34;
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *uint64_t v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v31 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v34;
        uint64_t v14 = v15;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    int64_t v25 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v25;
    uint64_t v27 = (-1 << a1) - 1;
  }
  else
  {
    int64_t v25 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v27 = *v25;
    uint64_t v26 = (-1 << a1) - 1;
  }
  *int64_t v25 = v27 & v26;
  uint64_t v28 = *(void *)(a2 + 16);
  BOOL v29 = __OFSUB__(v28, 1);
  uint64_t v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_20BAABF68(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_20BCE69E0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v33 = a2 + 64;
    unint64_t result = sub_20BCE7C30();
    uint64_t v12 = v33;
    if ((*(void *)(v33 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v30 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v32 = v13;
      int64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      do
      {
        int64_t v17 = v15 * v10;
        v30(v8, *(void *)(a2 + 48) + v15 * v10, v4);
        sub_20BAAD008((unint64_t *)&unk_2676ADD70, MEMORY[0x263F48460]);
        uint64_t v18 = sub_20BCE7590();
        unint64_t result = (*v16)(v8, v4);
        unint64_t v19 = v18 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v19 < v31 || a1 < (uint64_t)v19) {
            goto LABEL_6;
          }
        }
        else if (v19 < v31 && a1 < (uint64_t)v19)
        {
          goto LABEL_6;
        }
        int64_t v22 = v15 * a1;
        if (v15 * a1 < v17 || *(void *)(a2 + 48) + v15 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v17 + v15))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v22 != v17)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        uint64_t v23 = *(void *)(a2 + 56);
        unint64_t result = v23 + v22;
        if (v22 < v17 || result >= v23 + v17 + v15)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v22 == v17) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
        uint64_t v12 = v33;
      }
      while (((*(void *)(v33 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v24 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v25 = *v24;
    uint64_t v26 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v24 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v24;
    uint64_t v25 = (-1 << a1) - 1;
  }
  *uint64_t v24 = v26 & v25;
  uint64_t v27 = *(void *)(a2 + 16);
  BOOL v28 = __OFSUB__(v27, 1);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_20BAAC26C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_20BCE7C30();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_20BA204B4(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        uint64_t v10 = sub_20BCE7D30();
        unint64_t result = sub_20BA1FA04((uint64_t)v28);
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            int64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            unint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            uint64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *unint64_t v20 = *v21;
              v20[1] = v9;
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
    int64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *int64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_20BAAC438(uint64_t a1)
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
  long long v9 = (unint64_t *)(a1 + 80);
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

uint64_t sub_20BAAC4C0()
{
  return *(void *)(v0 + qword_2676AF5B8);
}

uint64_t sub_20BAAC4D0()
{
  uint64_t v1 = v0 + qword_2676AF5C0;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t type metadata accessor for ConfigurableTransformItem()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_20BAAC530()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_20BAAC568(void *a1)
{
  return sub_20BAA9DA0(a1, *(void **)(v1 + 16));
}

uint64_t sub_20BAAC570(uint64_t result, char a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v6 = result + 32;
    uint64_t v44 = result;
    swift_bridgeObjectRetain();
    sub_20BA20938(v6, (uint64_t)&v42, (uint64_t *)&unk_2676AE100);
    unint64_t v7 = v42;
    sub_20BA1FD80(v43, v41);
    unint64_t v8 = (void *)*a3;
    unint64_t v10 = sub_20BA16DFC((uint64_t)v7);
    uint64_t v11 = v8[2];
    BOOL v12 = (v9 & 1) == 0;
    uint64_t v13 = v11 + v12;
    if (__OFADD__(v11, v12))
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    char v14 = v9;
    if (v8[3] < v13)
    {
      sub_20BA17EC4(v13, a2 & 1);
      unint64_t v15 = sub_20BA16DFC((uint64_t)v7);
      if ((v14 & 1) != (v16 & 1))
      {
LABEL_28:
        type metadata accessor for HFItemResultKey(0);
        unint64_t result = sub_20BCE8060();
        __break(1u);
        return result;
      }
      unint64_t v10 = v15;
      if ((v14 & 1) == 0) {
        goto LABEL_12;
      }
LABEL_9:
      long long v17 = (void *)*a3;
      sub_20BA1FD80(v41, v40);

      long long v18 = (_OWORD *)(v17[7] + 32 * v10);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      sub_20BA1FD80(v40, v18);
      uint64_t v19 = v3 - 1;
      if (!v19) {
        return swift_bridgeObjectRelease();
      }
LABEL_16:
      for (uint64_t i = v44 + 72; ; i += 40)
      {
        sub_20BA20938(i, (uint64_t)&v42, (uint64_t *)&unk_2676AE100);
        uint64_t v27 = v42;
        sub_20BA1FD80(v43, v41);
        BOOL v28 = (void *)*a3;
        unint64_t v30 = sub_20BA16DFC((uint64_t)v27);
        uint64_t v31 = v28[2];
        BOOL v32 = (v29 & 1) == 0;
        uint64_t v33 = v31 + v32;
        if (__OFADD__(v31, v32)) {
          break;
        }
        char v34 = v29;
        if (v28[3] < v33)
        {
          sub_20BA17EC4(v33, 1);
          unint64_t v35 = sub_20BA16DFC((uint64_t)v27);
          if ((v34 & 1) != (v36 & 1)) {
            goto LABEL_28;
          }
          unint64_t v30 = v35;
        }
        if (v34)
        {
          uint64_t v25 = (void *)*a3;
          sub_20BA1FD80(v41, v40);

          BOOL v26 = (_OWORD *)(v25[7] + 32 * v30);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
          sub_20BA1FD80(v40, v26);
        }
        else
        {
          uint64_t v37 = (void *)*a3;
          *(void *)(*a3 + 8 * (v30 >> 6) + 64) |= 1 << v30;
          *(void *)(v37[6] + 8 * v30) = v27;
          sub_20BA1FD80(v41, (_OWORD *)(v37[7] + 32 * v30));
          uint64_t v38 = v37[2];
          BOOL v22 = __OFADD__(v38, 1);
          uint64_t v39 = v38 + 1;
          if (v22) {
            goto LABEL_27;
          }
          _OWORD v37[2] = v39;
        }
        if (!--v19) {
          return swift_bridgeObjectRelease();
        }
      }
      goto LABEL_26;
    }
    if (a2)
    {
      if (v9) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_20BA1DB6C();
      if (v14) {
        goto LABEL_9;
      }
    }
LABEL_12:
    unint64_t v20 = (void *)*a3;
    *(void *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    *(void *)(v20[6] + 8 * v10) = v7;
    sub_20BA1FD80(v41, (_OWORD *)(v20[7] + 32 * v10));
    uint64_t v21 = v20[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v20[2] = v23;
    uint64_t v19 = v3 - 1;
    if (!v19) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_20BAAC84C(uint64_t result, char a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v6 = result + 32;
    uint64_t v51 = result;
    swift_bridgeObjectRetain();
    sub_20BA20938(v6, (uint64_t)&v47, (uint64_t *)&unk_2676AE0F0);
    long long v44 = v47;
    long long v45 = v48;
    uint64_t v46 = v49;
    sub_20BA1FD80(v50, v43);
    uint64_t v7 = *a3;
    unint64_t v9 = sub_20BA16E90((uint64_t)&v44);
    uint64_t v10 = *(void *)(v7 + 16);
    BOOL v11 = (v8 & 1) == 0;
    uint64_t v12 = v10 + v11;
    if (__OFADD__(v10, v11))
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    char v13 = v8;
    if (*(void *)(v7 + 24) < v12)
    {
      sub_20BA1B84C(v12, a2 & 1);
      unint64_t v14 = sub_20BA16E90((uint64_t)&v44);
      if ((v13 & 1) != (v15 & 1))
      {
LABEL_28:
        unint64_t result = sub_20BCE8060();
        __break(1u);
        return result;
      }
      unint64_t v9 = v14;
      if ((v13 & 1) == 0) {
        goto LABEL_12;
      }
LABEL_9:
      sub_20BA1FD80(v43, v42);
      sub_20BA1FA04((uint64_t)&v44);
      char v16 = (_OWORD *)(*(void *)(*a3 + 56) + 32 * v9);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
      sub_20BA1FD80(v42, v16);
      uint64_t v17 = v3 - 1;
      if (v3 == 1) {
        return swift_bridgeObjectRelease();
      }
LABEL_16:
      for (uint64_t i = v51 + 104; ; i += 72)
      {
        sub_20BA20938(i, (uint64_t)&v47, (uint64_t *)&unk_2676AE0F0);
        long long v44 = v47;
        long long v45 = v48;
        uint64_t v46 = v49;
        sub_20BA1FD80(v50, v43);
        uint64_t v27 = *a3;
        unint64_t v29 = sub_20BA16E90((uint64_t)&v44);
        uint64_t v30 = *(void *)(v27 + 16);
        BOOL v31 = (v28 & 1) == 0;
        uint64_t v32 = v30 + v31;
        if (__OFADD__(v30, v31)) {
          break;
        }
        char v33 = v28;
        if (*(void *)(v27 + 24) < v32)
        {
          sub_20BA1B84C(v32, 1);
          unint64_t v34 = sub_20BA16E90((uint64_t)&v44);
          if ((v33 & 1) != (v35 & 1)) {
            goto LABEL_28;
          }
          unint64_t v29 = v34;
        }
        if (v33)
        {
          sub_20BA1FD80(v43, v42);
          sub_20BA1FA04((uint64_t)&v44);
          BOOL v26 = (_OWORD *)(*(void *)(*a3 + 56) + 32 * v29);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
          sub_20BA1FD80(v42, v26);
        }
        else
        {
          char v36 = (void *)*a3;
          *(void *)(*a3 + 8 * (v29 >> 6) + 64) |= 1 << v29;
          uint64_t v37 = v36[6] + 40 * v29;
          long long v38 = v44;
          long long v39 = v45;
          *(void *)(v37 + 32) = v46;
          *(_OWORD *)uint64_t v37 = v38;
          *(_OWORD *)(v37 + 16) = v39;
          sub_20BA1FD80(v43, (_OWORD *)(v36[7] + 32 * v29));
          uint64_t v40 = v36[2];
          BOOL v23 = __OFADD__(v40, 1);
          uint64_t v41 = v40 + 1;
          if (v23) {
            goto LABEL_27;
          }
          _OWORD v36[2] = v41;
        }
        if (!--v17) {
          return swift_bridgeObjectRelease();
        }
      }
      goto LABEL_26;
    }
    if (a2)
    {
      if (v8) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_20BA1F5A8();
      if (v13) {
        goto LABEL_9;
      }
    }
LABEL_12:
    long long v18 = (void *)*a3;
    *(void *)(*a3 + 8 * (v9 >> 6) + 64) |= 1 << v9;
    uint64_t v19 = v18[6] + 40 * v9;
    long long v20 = v44;
    long long v21 = v45;
    *(void *)(v19 + 32) = v46;
    *(_OWORD *)uint64_t v19 = v20;
    *(_OWORD *)(v19 + 16) = v21;
    sub_20BA1FD80(v43, (_OWORD *)(v18[7] + 32 * v9));
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v18[2] = v24;
    uint64_t v17 = v3 - 1;
    if (v3 == 1) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_16;
  }
  return result;
}

void sub_20BAACB70()
{
}

id sub_20BAACBA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + qword_2676AF5E0 + 8) = 0;
  *(void *)(swift_unknownObjectWeakInit() + 8) = a3;
  swift_unknownObjectWeakAssign();
  return ConfigurableTransformItem.init(sourceItem:)(a1);
}

void sub_20BAACC08()
{
}

uint64_t type metadata accessor for SelectableTransformItem()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for AccessoryRepresentableSelectableTransformItem()
{
  uint64_t result = qword_2676AF6F8;
  if (!qword_2676AF6F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20BAACC9C@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_20BAAC4D0();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20BAACCD8()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_20BAA96A4(v0);
}

uint64_t sub_20BAACD04()
{
  return 8;
}

void *sub_20BAACD10(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t dispatch thunk of TransformItem.transformedSourceItem.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_20BAACD30()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ConfigurableTransformItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ConfigurableTransformItem);
}

uint64_t dispatch thunk of ConfigurableTransformItem.transforms.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ConfigurableTransformItem.transforms.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ConfigurableTransformItem.transforms.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ConfigurableTransformItem.transformedSourceItem.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ConfigurableTransformItem.__allocating_init(sourceItem:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of ConfigurableTransformItem.transform(outcome:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t sub_20BAACEB0()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for SelectableTransformItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SelectableTransformItem);
}

uint64_t dispatch thunk of SelectableTransformItem.__allocating_init(sourceItem:selectionControllerContainer:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t sub_20BAACF20()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for AccessoryRepresentableSelectableTransformItem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AccessoryRepresentableSelectableTransformItem);
}

uint64_t dispatch thunk of AccessoryRepresentableSelectableTransformItem.accessoryRepresentableObject.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AccessoryRepresentableSelectableTransformItem.homeKitObject.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t sub_20BAACFD8()
{
  return type metadata accessor for AccessoryRepresentableSelectableTransformItem();
}

uint64_t sub_20BAACFE0(uint64_t a1)
{
  return a1;
}

uint64_t sub_20BAAD008(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_20BAAD050(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v9 - 8);
  BOOL v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F58190]), sel_init);
  if (a3) {
    a3 = (void *)sub_20BCE75E0();
  }
  objc_msgSend(v12, sel_setDescriptor_, a3);

  sub_20BA8E848(a1, (uint64_t)v11);
  char v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a4;
  v13[5] = a5;
  v13[6] = v12;
  swift_retain();
  id v14 = v12;
  sub_20BA15820((uint64_t)v11, (uint64_t)&unk_2676AF760, (uint64_t)v13);
  swift_release();
  return v14;
}

id static NAFutureHelper.future<A>(priority:descriptor:with:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v11 - 8);
  char v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E600);
  id v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (a3) {
    a3 = (void *)sub_20BCE75E0();
  }
  objc_msgSend(v14, sel_setDescriptor_, a3);

  sub_20BA8E848(a1, (uint64_t)v13);
  char v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = a6;
  v15[5] = a4;
  v15[6] = a5;
  v15[7] = v14;
  swift_retain();
  id v16 = v14;
  sub_20BA15820((uint64_t)v13, (uint64_t)&unk_2676AF730, (uint64_t)v15);
  swift_release();
  return v16;
}

id NAFuture.asGeneric()()
{
  self;
  uint64_t v0 = (void *)swift_dynamicCastObjCClassUnconditional();
  return v0;
}

id sub_20BAAD330()
{
  id v0 = NAFuture.asGeneric()();
  return v0;
}

uint64_t static NAFutureHelper.continuation<A>(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_20BAAD384, 0, 0);
}

uint64_t sub_20BAAD384()
{
  uint64_t v1 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  v1[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_20BAAD478;
  uint64_t v3 = *(void *)(v0 + 32);
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0xD000000000000010, 0x800000020BD15C70, sub_20BAADCC8, v1, v3);
}

uint64_t sub_20BAAD478()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_20BAAD5B0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_20BAAD594;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_20BAAD594()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_20BAAD5B0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_20BAAD614(uint64_t a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26AB2E6A0);
  uint64_t v6 = sub_20BCE7810();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)aBlock - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - v8, a1, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, v9, v6);
  aBlock[4] = sub_20BAAF4CC;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20BAAD8C8;
  aBlock[3] = &block_descriptor_14;
  uint64_t v12 = _Block_copy(aBlock);
  swift_release();
  id v13 = objc_msgSend(a2, sel_addCompletionBlock_, v12);
  _Block_release(v12);
}

id sub_20BAAD7EC(uint64_t a1, id a2)
{
  if (a2)
  {
    id v2 = a2;
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26AB2E6A0);
    sub_20BCE7810();
    return (id)sub_20BCE77F0();
  }
  if (a1)
  {
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26AB2E6A0);
    sub_20BCE7810();
    return (id)sub_20BCE7800();
  }
  else
  {
    id result = objc_msgSend(self, sel_na_genericError);
    if (result) {
      goto LABEL_3;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_20BAAD8C8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_20BAAD948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return MEMORY[0x270FA2498](sub_20BAAD970, 0, 0);
}

uint64_t sub_20BAAD970()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  *(void *)(v3 + 40) = v2;
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  *(void *)(v5 + 16) = v1;
  *(void *)(v5 + 24) = v2;
  id v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v6;
  *id v6 = v0;
  v6[1] = sub_20BAADA8C;
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2338](v7, &unk_2676AF780, v3, sub_20BAAF418, v5, 0, 0, v8);
}

uint64_t sub_20BAADA8C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_20BAADBB8()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_20BAADC00(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v1 + 40);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_20BA20C04;
  *(void *)(v6 + 40) = v5;
  *(void *)(v6 + 48) = v4;
  *(_OWORD *)(v6 + 24) = v7;
  *(void *)(v6 + 16) = a1;
  return MEMORY[0x270FA2498](sub_20BAAD970, 0, 0);
}

void sub_20BAADCC8(uint64_t a1)
{
  sub_20BAAD614(a1, *(void **)(v1 + 24), *(void *)(v1 + 16));
}

uint64_t sub_20BAADCD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[3] = a2;
  uint64_t v5 = sub_20BCE7820();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20BAADD94, 0, 0);
}

uint64_t sub_20BAADD94()
{
  sub_20BCE7900();
  uint64_t v3 = (uint64_t (*)(void))(*(void *)(v0 + 24) + **(int **)(v0 + 24));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_20BAADFB4;
  return v3();
}

uint64_t sub_20BAADFB4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 80) = a1;
  *(void *)(v3 + 88) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_20BA1655C;
  }
  else {
    uint64_t v4 = sub_20BAAE0C8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_20BAAE0C8()
{
  unsigned __int8 v1 = objc_msgSend(*(id *)(v0 + 40), sel_isCancelled);
  uint64_t v2 = *(void *)(v0 + 80);
  if ((v1 & 1) == 0)
  {
    uint64_t v3 = (void (**)(id, uint64_t, void))objc_msgSend(*(id *)(v0 + 40), sel_completionHandlerAdapter);
    v3[2](v3, v2, 0);
    _Block_release(v3);
  }
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id static NAFutureHelper.futureOnMainActor<A>(priority:descriptor:with:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E600);
  id v10 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (a3) {
    a3 = (void *)sub_20BCE75E0();
  }
  objc_msgSend(v10, sel_setDescriptor_, a3);

  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a6;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  swift_retain();
  id v12 = v10;
  sub_20BCE78D0();
  swift_release();
  return v12;
}

uint64_t sub_20BAAE284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = sub_20BCE7850();
  v5[8] = sub_20BCE7840();
  uint64_t v7 = sub_20BCE77E0();
  v5[9] = v7;
  v5[10] = v6;
  return MEMORY[0x270FA2498](sub_20BAAE328, v7, v6);
}

uint64_t sub_20BAAE328()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 88) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  *(void *)(v3 + 40) = v2;
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 96) = v5;
  *(void *)(v5 + 16) = v1;
  *(void *)(v5 + 24) = v2;
  uint64_t v6 = sub_20BCE7840();
  *(void *)(v0 + 104) = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_20BAAE460;
  uint64_t v8 = *(void *)(v0 + 16);
  uint64_t v9 = MEMORY[0x263F8EE60] + 8;
  uint64_t v10 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA2338](v8, &unk_2676AF770, v3, sub_20BAAF418, v5, v6, v10, v9);
}

uint64_t sub_20BAAE460()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 72);
  return MEMORY[0x270FA2498](sub_20BAAE5E4, v3, v2);
}

uint64_t sub_20BAAE5E4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_20BAAE644()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_20BAAE684(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_20BA1FC8C;
  return sub_20BAAE284(a1, v5, v7, v6, v4);
}

uint64_t sub_20BAAE744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[3] = a2;
  uint64_t v5 = sub_20BCE7820();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  sub_20BCE7850();
  v4[9] = sub_20BCE7840();
  uint64_t v7 = sub_20BCE77E0();
  v4[10] = v7;
  v4[11] = v6;
  return MEMORY[0x270FA2498](sub_20BAAE83C, v7, v6);
}

uint64_t sub_20BAAE83C()
{
  sub_20BCE7900();
  uint64_t v3 = (uint64_t (*)(void))(*(void *)(v0 + 24) + **(int **)(v0 + 24));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_20BAAEA64;
  return v3();
}

uint64_t sub_20BAAEA64(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 104) = a1;
  *(void *)(v4 + 112) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 88);
  uint64_t v6 = *(void *)(v3 + 80);
  if (v1) {
    uint64_t v7 = sub_20BAAEC70;
  }
  else {
    uint64_t v7 = sub_20BAAEBA8;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_20BAAEBA8()
{
  uint64_t v1 = *(void **)(v0 + 40);
  swift_release();
  unsigned __int8 v2 = objc_msgSend(v1, sel_isCancelled);
  uint64_t v3 = *(void *)(v0 + 104);
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = (void (**)(id, uint64_t, void))objc_msgSend(*(id *)(v0 + 40), sel_completionHandlerAdapter);
    v4[2](v4, v3, 0);
    _Block_release(v4);
  }
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_20BAAEC70()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 112);
  *(void *)(v0 + 16) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB2E6A0);
  if (swift_dynamicCast())
  {
    uint64_t v4 = *(void *)(v0 + 56);
    uint64_t v3 = *(void *)(v0 + 64);
    uint64_t v5 = *(void *)(v0 + 48);

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = *(void **)(v0 + 16);
  }
  else
  {
    uint64_t v7 = *(void **)(v0 + 40);

    if ((objc_msgSend(v7, sel_isCancelled) & 1) == 0)
    {
      uint64_t v8 = (void (**)(id, void, void *))objc_msgSend(*(id *)(v0 + 40), sel_completionHandlerAdapter);
      id v9 = v1;
      uint64_t v10 = (void *)sub_20BCE6430();
      v8[2](v8, 0, v10);

      _Block_release(v8);
    }
    uint64_t v6 = v1;
  }

  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

id static NAFutureHelper.future(priority:descriptor:with:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = a5;
  swift_retain();
  id v11 = sub_20BAAD050(a1, a2, a3, (uint64_t)&unk_2676AF758, v10);
  swift_release();
  return v11;
}

uint64_t sub_20BAAEE78(int *a1)
{
  uint64_t v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *id v2 = v1;
  v2[1] = sub_20BAAEF44;
  return v4();
}

uint64_t sub_20BAAEF44()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_20BAAF074, 0, 0);
  }
}

uint64_t sub_20BAAF074()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
  uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
  return v2(v1);
}

uint64_t sub_20BAAF0E8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20BAAF120()
{
  uint64_t v2 = *(int **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_20BA1FF3C;
  uint64_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_20BAAEF44;
  return v6();
}

ValueMetadata *type metadata accessor for NAFutureHelper()
{
  return &type metadata for NAFutureHelper;
}

uint64_t sub_20BAAF248()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_20BAAF290(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  id v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *id v9 = v2;
  v9[1] = sub_20BA20C04;
  return sub_20BA15F70(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_20BAAF358(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_20BA1FC8C;
  return sub_20BAAE744(a1, v4, v6, v5);
}

uint64_t sub_20BAAF41C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26AB2E6A0);
  uint64_t v1 = sub_20BCE7810();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

id sub_20BAAF4CC(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_26AB2E6A0);
  sub_20BCE7810();
  return sub_20BAAD7EC(a1, a2);
}

uint64_t sub_20BAAF570(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_20BA20C04;
  return sub_20BAADCD0(a1, v4, v6, v5);
}

id sub_20BAAF630()
{
  uint64_t v1 = *(void **)(v0 + 24);
  id result = objc_msgSend(v1, sel_isCancelled);
  if ((result & 1) == 0)
  {
    return objc_msgSend(v1, sel_cancel);
  }
  return result;
}

uint64_t ActivityEventStatusItem.activityLogCoordinator.getter()
{
  return swift_retain();
}

id ActivityEventStatusItem.__allocating_init(home:room:valueSource:)(void *a1, void *a2, uint64_t a3)
{
  id v6 = objc_msgSend(objc_allocWithZone(v3), sel_initWithHome_room_valueSource_, a1, a2, a3);

  swift_unknownObjectRelease();
  return v6;
}

id ActivityEventStatusItem.init(home:room:valueSource:)(void *a1, void *a2, uint64_t a3)
{
  id v5 = sub_20BAB44C0(a1, (uint64_t)a2, a3);

  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_20BAAF800(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (uint64_t *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v95 - v8;
  uint64_t v10 = sub_20BCE7290();
  uint64_t v99 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v101 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
LABEL_63:
    uint64_t result = sub_20BCE8060();
    __break(1u);
    return result;
  }
  uint64_t v12 = HFItemUpdateOptionFastInitialUpdate;
  id v106 = HFItemUpdateOptionFastInitialUpdate;
  type metadata accessor for HFItemUpdateOption(0);
  sub_20BAB466C();
  uint64_t v13 = v12;
  sub_20BCE7D50();
  if (*(void *)(a1 + 16) && (unint64_t v14 = sub_20BA16E90((uint64_t)v111), (v15 & 1) != 0))
  {
    sub_20BA200A0(*(void *)(a1 + 56) + 32 * v14, (uint64_t)&v108);
  }
  else
  {
    long long v109 = 0u;
    long long v108 = 0u;
  }
  sub_20BA1FA04((uint64_t)v111);
  uint64_t v98 = (char *)v10;
  if (*((void *)&v109 + 1))
  {
    sub_20BA208F4(0, (unint64_t *)&qword_2676AE6A0);
    if (swift_dynamicCast())
    {
      id v16 = v106;
      unsigned __int8 v17 = [(__CFString *)v106 BOOLValue];

      goto LABEL_11;
    }
  }
  else
  {
    sub_20BA1FD90((uint64_t)&v108, (uint64_t *)&unk_26AB2E690);
  }
  unsigned __int8 v17 = 0;
LABEL_11:
  uint64_t v18 = (uint64_t)&selRef_hf_generatedByHomeAppForDebuggingPurposes;
  id v19 = objc_msgSend((id)v2, sel_home);
  id v20 = objc_msgSend((id)v2, sel_home);
  id v21 = objc_msgSend(v20, sel_currentUser);

  id v22 = objc_msgSend(v19, sel_homeAccessControlForUser_, v21);
  LODWORD(v100) = objc_msgSend(v22, sel_isRemoteAccessAllowed);

  id v23 = objc_msgSend((id)v2, sel_home);
  id v24 = objc_msgSend(v23, sel_homeLocationStatus);

  id v25 = objc_msgSend((id)v2, sel_home);
  unsigned int v26 = objc_msgSend(v25, sel_activityLogAvailable);

  if (v26)
  {
    id v27 = objc_msgSend((id)v2, sel_home);
    unsigned int v28 = objc_msgSend(v27, sel_isEventLogEnabled);

    char v29 = v100;
    if (v24 == (id)1) {
      char v29 = 1;
    }
    if (v28 && (v29 & 1) != 0)
    {
      uint64_t v30 = sub_20BCE7870();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v9, 1, 1, v30);
      uint64_t v31 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v32 = swift_allocObject();
      *(unsigned char *)(v32 + 16) = v17;
      uint64_t v33 = (uint64_t)ObjectType;
      *(void *)(v32 + 24) = v31;
      *(void *)(v32 + 32) = v33;
      id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F58190]), sel_init);
      objc_msgSend(v34, sel_setDescriptor_, 0);
      sub_20BA8E848((uint64_t)v9, (uint64_t)v7);
      char v35 = (void *)swift_allocObject();
      _OWORD v35[2] = 0;
      v35[3] = 0;
      v35[4] = &unk_2676AF7C0;
      v35[5] = v32;
      v35[6] = v34;
      swift_retain();
      id v36 = v34;
      sub_20BA15820((uint64_t)v7, (uint64_t)&unk_2676ADD00, (uint64_t)v35);
      swift_release();
      swift_release();
      sub_20BA1FD90((uint64_t)v9, &qword_26AB2E3E0);
      return (uint64_t)v36;
    }
  }
  if (qword_2676AD500 != -1) {
LABEL_61:
  }
    swift_once();
  id v37 = (id)qword_2676B6C00;
  long long v38 = v101;
  sub_20BCE72A0();
  id v39 = (id)v2;
  uint64_t v40 = sub_20BCE7270();
  os_log_type_t v41 = sub_20BCE7AA0();
  uint64_t v2 = v41;
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = swift_slowAlloc();
    uint64_t ObjectType = (uint64_t *)swift_slowAlloc();
    *(void *)&v111[0] = ObjectType;
    *(_DWORD *)uint64_t v42 = 67110146;
    id v43 = [v39 *(SEL *)(v18 + 3728)];
    unsigned int v44 = objc_msgSend(v43, sel_activityLogAvailable);

    LODWORD(v108) = v44;
    sub_20BCE7BC0();

    *(_WORD *)(v42 + 8) = 1024;
    id v45 = [v39 *(SEL *)(v18 + 3728)];
    unsigned int v46 = objc_msgSend(v45, sel_isEventLogEnabled);

    LODWORD(v108) = v46;
    sub_20BCE7BC0();

    *(_WORD *)(v42 + 14) = 1024;
    LODWORD(v108) = v100;
    sub_20BCE7BC0();
    *(_WORD *)(v42 + 20) = 1024;
    id v47 = [v39 *(SEL *)(v18 + 3728)];
    unsigned int v48 = objc_msgSend(v47, sel_userSupportsActivityLog);

    LODWORD(v108) = v48;
    sub_20BCE7BC0();

    *(_WORD *)(v42 + 26) = 2080;
    id v49 = [v39 *(SEL *)(v18 + 3728)];
    id v50 = objc_msgSend(v49, sel_homeLocationStatus);

    *(void *)&long long v108 = v50;
    type metadata accessor for HMHomeLocation(0);
    uint64_t v51 = sub_20BCE7640();
    *(void *)&long long v108 = sub_20BA297F4(v51, v52, (uint64_t *)v111);
    sub_20BCE7BC0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20B986000, v40, (os_log_type_t)v2, "Hiding activity status, available %{BOOL}d enabled %{BOOL}d remoteAccess %{BOOL}d. userSupportsActivityLog = %{BOOL}d. atHome %s", (uint8_t *)v42, 0x24u);
    uint64_t v53 = (uint64_t)ObjectType;
    swift_arrayDestroy();
    MEMORY[0x21053F820](v53, -1, -1);
    MEMORY[0x21053F820](v42, -1, -1);

    (*(void (**)(char *, char *))(v99 + 8))(v101, v98);
  }
  else
  {

    (*(void (**)(char *, char *))(v99 + 8))(v38, v98);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676AF7A0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20BD11940;
  *(void *)(inited + 32) = @"hidden";
  uint64_t v55 = sub_20BA208F4(0, (unint64_t *)&qword_2676AE6A0);
  unint64_t v56 = @"hidden";
  uint64_t v18 = 1;
  uint64_t v57 = sub_20BCE7B20();
  *(void *)(inited + 64) = v55;
  *(void *)(inited + 40) = v57;
  unint64_t v58 = sub_20BA11F90(inited);
  int v59 = (void *)sub_20BA120C0(MEMORY[0x263F8EE78]);
  uint64_t v60 = *(void *)(v58 + 64);
  unint64_t v95 = v58 + 64;
  uint64_t v61 = 1 << *(unsigned char *)(v58 + 32);
  uint64_t v62 = -1;
  if (v61 < 64) {
    uint64_t v62 = ~(-1 << v61);
  }
  unint64_t v63 = v62 & v60;
  uint64_t v64 = &v107;
  uint64_t v98 = (char *)&v108 + 8;
  uint64_t v99 = (uint64_t)v111 + 8;
  int64_t v96 = (unint64_t)(v61 + 63) >> 6;
  uint64_t ObjectType = &v105;
  unint64_t v100 = v58;
  swift_bridgeObjectRetain();
  uint64_t v65 = 0;
  uint64_t v66 = (uint64_t)v98;
  while (1)
  {
    if (v63)
    {
      unint64_t v68 = __clz(__rbit64(v63));
      v63 &= v63 - 1;
      v101 = v65;
      unint64_t v69 = v68 | ((void)v65 << 6);
      goto LABEL_44;
    }
    int64_t v70 = (int64_t)(v65 + 1);
    if (__OFADD__(v65, 1)) {
      goto LABEL_59;
    }
    if (v70 >= v96) {
      goto LABEL_55;
    }
    unint64_t v71 = *(void *)(v95 + 8 * v70);
    int64_t v72 = (int64_t)(v65 + 1);
    if (!v71)
    {
      int64_t v72 = (int64_t)(v65 + 2);
      if ((uint64_t)(v65 + 2) >= v96) {
        goto LABEL_55;
      }
      unint64_t v71 = *(void *)(v95 + 8 * v72);
      if (!v71)
      {
        int64_t v72 = (int64_t)(v65 + 3);
        if ((uint64_t)(v65 + 3) >= v96) {
          goto LABEL_55;
        }
        unint64_t v71 = *(void *)(v95 + 8 * v72);
        if (!v71)
        {
          int64_t v72 = (int64_t)(v65 + 4);
          if ((uint64_t)(v65 + 4) >= v96) {
            goto LABEL_55;
          }
          unint64_t v71 = *(void *)(v95 + 8 * v72);
          if (!v71) {
            break;
          }
        }
      }
    }
LABEL_43:
    unint64_t v63 = (v71 - 1) & v71;
    v101 = (char *)v72;
    unint64_t v69 = __clz(__rbit64(v71)) + (v72 << 6);
LABEL_44:
    uint64_t v18 = *(void *)(*(void *)(v100 + 48) + 8 * v69);
    sub_20BA200A0(*(void *)(v100 + 56) + 32 * v69, v99);
    *(void *)&v111[0] = v18;
    long long v108 = v111[0];
    long long v109 = v111[1];
    uint64_t v110 = v112;
    id v106 = (__CFString *)v18;
    uint64_t v2 = (uint64_t)v64;
    sub_20BA200A0(v66, (uint64_t)v64);
    uint64_t v74 = sub_20BCE7620();
    uint64_t v76 = v75;
    uint64_t v104 = v18;
    id v77 = ObjectType;
    sub_20BA200A0(v66, (uint64_t)ObjectType);
    sub_20BA1FD80(v77, v103);
    id v78 = (SEL *)(id)v18;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v102 = v59;
    unint64_t v81 = sub_20BA16D9C(v74, v76);
    uint64_t v82 = v59[2];
    BOOL v83 = (v80 & 1) == 0;
    uint64_t v84 = v82 + v83;
    if (__OFADD__(v82, v83))
    {
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    uint64_t v18 = (uint64_t)v80;
    if (v59[3] >= v84)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        int v59 = v102;
        if (v80) {
          goto LABEL_24;
        }
      }
      else
      {
        sub_20BA1DD34();
        int v59 = v102;
        if (v18) {
          goto LABEL_24;
        }
      }
    }
    else
    {
      sub_20BA18200(v84, isUniquelyReferenced_nonNull_native);
      uint64_t v85 = sub_20BA16D9C(v74, v76);
      if ((v18 & 1) != (v86 & 1)) {
        goto LABEL_63;
      }
      unint64_t v81 = v85;
      int v59 = v102;
      if (v18)
      {
LABEL_24:
        int v67 = (_OWORD *)(v59[7] + 32 * v81);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v67);
        sub_20BA1FD80(v103, v67);
        goto LABEL_25;
      }
    }
    v59[(v81 >> 6) + 8] |= 1 << v81;
    uint64_t v87 = (uint64_t *)(v59[6] + 16 * v81);
    uint64_t *v87 = v74;
    v87[1] = v76;
    sub_20BA1FD80(v103, (_OWORD *)(v59[7] + 32 * v81));
    uint64_t v88 = v59[2];
    BOOL v89 = __OFADD__(v88, 1);
    uint64_t v90 = v88 + 1;
    if (v89) {
      goto LABEL_58;
    }
    v59[2] = v90;
    swift_bridgeObjectRetain();
LABEL_25:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v64 = (uint64_t *)v2;
    __swift_destroy_boxed_opaque_existential_0(v2);
    sub_20BA1FD90((uint64_t)&v108, &qword_2676AF7B0);
    uint64_t v65 = v101;
  }
  id v73 = v65 + 5;
  if ((uint64_t)(v65 + 5) < v96)
  {
    unint64_t v71 = *(void *)(v95 + 8 * (void)v73);
    if (!v71)
    {
      while (1)
      {
        int64_t v72 = (int64_t)(v73 + 1);
        if (__OFADD__(v73, 1)) {
          goto LABEL_60;
        }
        if (v72 >= v96) {
          goto LABEL_55;
        }
        unint64_t v71 = *(void *)(v95 + 8 * v72);
        ++v73;
        if (v71) {
          goto LABEL_43;
        }
      }
    }
    int64_t v72 = (int64_t)(v65 + 5);
    goto LABEL_43;
  }
LABEL_55:
  swift_release();
  swift_bridgeObjectRelease();
  id v91 = objc_allocWithZone((Class)HFItemUpdateOutcome);
  sub_20BA15458((uint64_t)v59);
  swift_bridgeObjectRelease();
  v92 = (void *)sub_20BCE7510();
  swift_bridgeObjectRelease();
  id v93 = objc_msgSend(v91, sel_initWithResults_, v92);

  id v36 = objc_msgSend(self, sel_futureWithResult_, v93);
  return (uint64_t)v36;
}

uint64_t sub_20BAB044C(char a1, uint64_t a2)
{
  *(void *)(v2 + 1320) = a2;
  *(unsigned char *)(v2 + 1560) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  *(void *)(v2 + 1328) = swift_task_alloc();
  uint64_t v3 = sub_20BCE7290();
  *(void *)(v2 + 1336) = v3;
  *(void *)(v2 + 1344) = *(void *)(v3 - 8);
  *(void *)(v2 + 1352) = swift_task_alloc();
  *(void *)(v2 + 1360) = swift_task_alloc();
  *(void *)(v2 + 1368) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676AE0D8);
  *(void *)(v2 + 1376) = swift_task_alloc();
  *(void *)(v2 + 1384) = swift_task_alloc();
  *(void *)(v2 + 1392) = swift_task_alloc();
  *(void *)(v2 + 1400) = swift_task_alloc();
  uint64_t v4 = sub_20BCE6540();
  *(void *)(v2 + 1408) = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)(v2 + 1416) = v5;
  *(void *)(v2 + 1424) = *(void *)(v5 + 64);
  *(void *)(v2 + 1432) = swift_task_alloc();
  *(void *)(v2 + 1440) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20BAB0628, 0, 0);
}

uint64_t sub_20BAB0628()
{
  int v1 = *(unsigned __int8 *)(v0 + 1560);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676AF7A0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_20BD12530;
  *(void *)(v2 + 32) = @"title";
  uint64_t v3 = @"title";
  uint64_t v4 = (void *)sub_20BCE75E0();
  id v5 = HFLocalizedString(v4);

  uint64_t v6 = sub_20BCE7620();
  uint64_t v8 = v7;

  uint64_t v9 = MEMORY[0x263F8D310];
  *(void *)(v2 + 40) = v6;
  *(void *)(v2 + 48) = v8;
  *(void *)(v2 + 64) = v9;
  *(void *)(v2 + 72) = @"icon";
  id v10 = objc_allocWithZone((Class)HFImageIconDescriptor);
  uint64_t v11 = @"icon";
  uint64_t v12 = (void *)sub_20BCE75E0();
  id v13 = objc_msgSend(v10, sel_initWithSystemImageNamed_, v12);

  uint64_t v14 = sub_20BA208F4(0, (unint64_t *)&unk_2676AF840);
  *(void *)(v2 + 80) = v13;
  *(void *)(v2 + 104) = v14;
  *(void *)(v2 + 112) = @"statusItemCategory";
  id v15 = objc_allocWithZone(NSNumber);
  id v16 = @"statusItemCategory";
  id v17 = objc_msgSend(v15, sel_initWithUnsignedInteger_, 2);
  uint64_t v18 = sub_20BA208F4(0, (unint64_t *)&qword_2676AE6A0);
  *(void *)(v0 + 1448) = v18;
  *(void *)(v2 + 144) = v18;
  *(void *)(v2 + 120) = v17;
  unint64_t v19 = sub_20BA11F90(v2);
  *(void *)(v0 + 1456) = v19;
  if (v1 == 1)
  {
    uint64_t v82 = (void *)(v0 + 96);
    BOOL v83 = (void *)(v0 + 56);
    uint64_t v20 = v0 + 296;
    uint64_t v80 = v0 + 336;
    char v86 = (_OWORD *)(v0 + 816);
    id v21 = @"hidden";
    uint64_t v22 = sub_20BCE7B20();
    *(void *)(v0 + 1128) = v18;
    *(void *)(v0 + 1104) = v22;
    sub_20BA1FD80((_OWORD *)(v0 + 1104), (_OWORD *)(v0 + 1136));
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_20BA1BE94((_OWORD *)(v0 + 1136), v21, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();

    id v24 = (void *)sub_20BA120C0(MEMORY[0x263F8EE78]);
    uint64_t v76 = v0;
    unint64_t v77 = v19 + 64;
    uint64_t v25 = -1;
    uint64_t v26 = -1 << *(unsigned char *)(v19 + 32);
    if (-v26 < 64) {
      uint64_t v25 = ~(-1 << -(char)v26);
    }
    unint64_t v27 = v25 & *(void *)(v19 + 64);
    uint64_t v81 = v0 + 344;
    uint64_t v28 = v0 + 104;
    int64_t v78 = (unint64_t)(63 - v26) >> 6;
    id v79 = (_OWORD *)(v0 + 64);
    unint64_t v84 = v19;
    uint64_t result = swift_bridgeObjectRetain();
    int64_t v30 = 0;
    uint64_t v31 = v0 + 304;
    while (1)
    {
      if (v27)
      {
        unint64_t v33 = __clz(__rbit64(v27));
        v27 &= v27 - 1;
        int64_t v85 = v30;
        unint64_t v34 = v33 | (v30 << 6);
      }
      else
      {
        int64_t v35 = v30 + 1;
        if (__OFADD__(v30, 1)) {
          goto LABEL_51;
        }
        if (v35 >= v78)
        {
LABEL_40:
          swift_release();
          swift_bridgeObjectRelease();
          id v72 = objc_allocWithZone((Class)HFItemUpdateOutcome);
          sub_20BA15458((uint64_t)v24);
          swift_bridgeObjectRelease();
          id v73 = (void *)sub_20BCE7510();
          swift_bridgeObjectRelease();
          id v88 = objc_msgSend(v72, sel_initWithResults_, v73);

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
          uint64_t v74 = *(uint64_t (**)(id))(v76 + 8);
          return v74(v88);
        }
        unint64_t v36 = *(void *)(v77 + 8 * v35);
        int64_t v37 = v30 + 1;
        if (!v36)
        {
          int64_t v37 = v30 + 2;
          if (v30 + 2 >= v78) {
            goto LABEL_40;
          }
          unint64_t v36 = *(void *)(v77 + 8 * v37);
          if (!v36)
          {
            int64_t v37 = v30 + 3;
            if (v30 + 3 >= v78) {
              goto LABEL_40;
            }
            unint64_t v36 = *(void *)(v77 + 8 * v37);
            if (!v36)
            {
              int64_t v37 = v30 + 4;
              if (v30 + 4 >= v78) {
                goto LABEL_40;
              }
              unint64_t v36 = *(void *)(v77 + 8 * v37);
              if (!v36)
              {
                uint64_t v38 = v30 + 5;
                if (v30 + 5 >= v78) {
                  goto LABEL_40;
                }
                unint64_t v36 = *(void *)(v77 + 8 * v38);
                if (!v36)
                {
                  while (1)
                  {
                    int64_t v37 = v38 + 1;
                    if (__OFADD__(v38, 1)) {
                      goto LABEL_52;
                    }
                    if (v37 >= v78) {
                      goto LABEL_40;
                    }
                    unint64_t v36 = *(void *)(v77 + 8 * v37);
                    ++v38;
                    if (v36) {
                      goto LABEL_24;
                    }
                  }
                }
                int64_t v37 = v30 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v27 = (v36 - 1) & v36;
        int64_t v85 = v37;
        unint64_t v34 = __clz(__rbit64(v36)) + (v37 << 6);
      }
      id v39 = *(void **)(*(void *)(v84 + 48) + 8 * v34);
      sub_20BA200A0(*(void *)(v84 + 56) + 32 * v34, v81);
      *(void *)uint64_t v80 = v39;
      long long v40 = *(_OWORD *)(v80 + 16);
      *(_OWORD *)uint64_t v20 = *(_OWORD *)v80;
      *(_OWORD *)(v20 + 16) = v40;
      *(void *)(v20 + 32) = *(void *)(v80 + 32);
      uint64_t v41 = *(void *)v20;
      void *v82 = *(void *)v20;
      uint64_t v42 = v28;
      sub_20BA200A0(v31, v28);
      uint64_t v43 = sub_20BCE7620();
      uint64_t v45 = v44;
      *BOOL v83 = v41;
      sub_20BA200A0(v31, (uint64_t)v79);
      sub_20BA1FD80(v79, v86);
      id v46 = v39;
      char v47 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v49 = sub_20BA16D9C(v43, v45);
      uint64_t v50 = v24[2];
      BOOL v51 = (v48 & 1) == 0;
      uint64_t result = v50 + v51;
      if (__OFADD__(v50, v51))
      {
        __break(1u);
LABEL_50:
        __break(1u);
LABEL_51:
        __break(1u);
LABEL_52:
        __break(1u);
        return result;
      }
      char v52 = v48;
      if (v24[3] >= result)
      {
        if (v47)
        {
          if (v48) {
            goto LABEL_5;
          }
        }
        else
        {
          sub_20BA1DD34();
          if (v52) {
            goto LABEL_5;
          }
        }
      }
      else
      {
        sub_20BA18200(result, v47);
        uint64_t v53 = sub_20BA16D9C(v43, v45);
        if ((v52 & 1) != (v54 & 1))
        {
          return sub_20BCE8060();
        }
        unint64_t v49 = v53;
        if (v52)
        {
LABEL_5:
          uint64_t v32 = (_OWORD *)(v24[7] + 32 * v49);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
          sub_20BA1FD80(v86, v32);
          goto LABEL_6;
        }
      }
      v24[(v49 >> 6) + 8] |= 1 << v49;
      uint64_t v55 = (uint64_t *)(v24[6] + 16 * v49);
      uint64_t *v55 = v43;
      v55[1] = v45;
      uint64_t result = (uint64_t)sub_20BA1FD80(v86, (_OWORD *)(v24[7] + 32 * v49));
      uint64_t v56 = v24[2];
      BOOL v57 = __OFADD__(v56, 1);
      uint64_t v58 = v56 + 1;
      if (v57) {
        goto LABEL_50;
      }
      v24[2] = v58;
      swift_bridgeObjectRetain();
LABEL_6:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v28 = v42;
      __swift_destroy_boxed_opaque_existential_0(v42);
      uint64_t result = sub_20BA1FD90(v20, &qword_2676AF7B0);
      int64_t v30 = v85;
    }
  }
  uint64_t v59 = *(void *)(v0 + 1320) + 16;
  swift_beginAccess();
  uint64_t v60 = MEMORY[0x21053F900](v59);
  *(void *)(v0 + 1464) = v60;
  uint64_t v61 = *(void *)(v0 + 1440);
  if (v60)
  {
    uint64_t v62 = *(void *)(v0 + 1416);
    uint64_t v63 = *(void *)(v0 + 1408);
    uint64_t v64 = *(void *)(v0 + 1400);
    uint64_t v65 = *(void *)(v0 + 1392);
    uint64_t v66 = v60 + OBJC_IVAR___HFActivityEventStatusItem_midnightToday;
    int v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16);
    *(void *)(v0 + 1472) = v67;
    *(void *)(v0 + 1480) = (v62 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v67(v61, v66, v63);
    *(void *)(v0 + 1488) = OBJC_IVAR___HFActivityEventStatusItem_activityLogCoordinator;
    v67(v64, v61, v63);
    unint64_t v68 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v62 + 56);
    *(void *)(v0 + 1496) = v68;
    *(void *)(v0 + 1504) = (v62 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v68(v64, 0, 1, v63);
    v68(v65, 1, 1, v63);
    uint64_t v87 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2676AEDA8 + dword_2676AEDA8);
    unint64_t v69 = (void *)swift_task_alloc();
    *(void *)(v0 + 1512) = v69;
    void *v69 = v0;
    v69[1] = sub_20BAB0FA4;
    uint64_t v70 = *(void *)(v0 + 1400);
    uint64_t v71 = *(void *)(v0 + 1392);
    return v87(v70, v71);
  }
  else
  {
    swift_bridgeObjectRelease();
    objc_msgSend(self, sel_hf_errorWithCode_, 37);
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
    uint64_t v75 = *(uint64_t (**)(void))(v0 + 8);
    return v75();
  }
}

uint64_t sub_20BAB0FA4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(*v2 + 1520) = a1;
  swift_task_dealloc();
  uint64_t v4 = *(void *)(v3 + 1400);
  uint64_t v5 = *(void *)(v3 + 1392);
  if (v1)
  {

    sub_20BA1FD90(v5, &qword_2676AE0D8);
    sub_20BA1FD90(v4, &qword_2676AE0D8);
    uint64_t v6 = sub_20BAB1930;
  }
  else
  {
    sub_20BA1FD90(v5, &qword_2676AE0D8);
    sub_20BA1FD90(v4, &qword_2676AE0D8);
    uint64_t v6 = sub_20BAB1138;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_20BAB1138()
{
  uint64_t v1 = *(void *)(v0 + 1520);
  if (v1)
  {
    uint64_t v81 = (_OWORD *)(v0 + 1008);
    uint64_t v2 = *(void *)(v0 + 1456);
    uint64_t v3 = @"description";
    uint64_t v4 = (void *)sub_20BCE75E0();
    id v5 = HFLocalizedString(v4);

    sub_20BCE7620();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2676AEFB8);
    uint64_t v6 = swift_allocObject();
    uint64_t v7 = MEMORY[0x263F8D6C8];
    *(_OWORD *)(v6 + 16) = xmmword_20BD11940;
    uint64_t v8 = MEMORY[0x263F8D750];
    *(void *)(v6 + 56) = v7;
    *(void *)(v6 + 64) = v8;
    *(void *)(v6 + 32) = v1;
    uint64_t v9 = sub_20BCE75F0();
    uint64_t v71 = (void *)v0;
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1192) = MEMORY[0x263F8D310];
    *(void *)(v0 + 1168) = v9;
    *(void *)(v0 + 1176) = v11;
    uint64_t v12 = (void *)v0;
    sub_20BA1FD80((_OWORD *)(v0 + 1168), (_OWORD *)(v0 + 1040));
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_20BA1BE94((_OWORD *)(v0 + 1040), v3, isUniquelyReferenced_nonNull_native);
    uint64_t v79 = v2;
    swift_bridgeObjectRelease();

    if (v1 <= 40)
    {
      uint64_t v14 = *(void *)(v0 + 1488);
      id v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1472);
      uint64_t v16 = *(void *)(v0 + 1440);
      uint64_t v17 = v71[179];
      uint64_t v18 = v71[177];
      uint64_t v19 = v71[176];
      uint64_t v20 = v71[166];
      uint64_t v21 = *(void *)(v71[183] + v14);
      uint64_t v22 = sub_20BCE7870();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v20, 1, 1, v22);
      v15(v17, v16, v19);
      uint64_t v12 = v71;
      unint64_t v23 = (*(unsigned __int8 *)(v18 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
      id v24 = (char *)swift_allocObject();
      *((void *)v24 + 2) = 0;
      *((void *)v24 + 3) = 0;
      *((void *)v24 + 4) = v21;
      (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(&v24[v23], v17, v19);
      swift_retain();
      sub_20BA15A00(v20, (uint64_t)&unk_2676AF858, (uint64_t)v24);
      swift_release();
    }
    uint64_t v75 = v12 + 52;
    uint64_t v25 = (uint64_t)(v12 + 57);
    unint64_t v77 = v12 + 67;
    int64_t v78 = v12 + 62;
    uint64_t v26 = (void *)sub_20BA120C0(MEMORY[0x263F8EE78]);
    uint64_t v72 = v79 + 64;
    uint64_t v27 = -1;
    uint64_t v28 = -1 << *(unsigned char *)(v79 + 32);
    if (-v28 < 64) {
      uint64_t v27 = ~(-1 << -(char)v28);
    }
    unint64_t v29 = v27 & *(void *)(v79 + 64);
    uint64_t v30 = (uint64_t)(v12 + 63);
    uint64_t v76 = (uint64_t)(v12 + 53);
    int64_t v73 = (unint64_t)(63 - v28) >> 6;
    uint64_t v74 = v12 + 68;
    uint64_t v31 = swift_bridgeObjectRetain();
    int64_t v34 = 0;
    uint64_t v35 = (uint64_t)(v12 + 58);
    while (1)
    {
      if (v29)
      {
        unint64_t v37 = __clz(__rbit64(v29));
        v29 &= v29 - 1;
        int64_t v80 = v34;
        unint64_t v38 = v37 | (v34 << 6);
      }
      else
      {
        int64_t v39 = v34 + 1;
        if (__OFADD__(v34, 1)) {
          goto LABEL_49;
        }
        if (v39 >= v73)
        {
LABEL_41:
          uint64_t v63 = (void *)v71[183];
          uint64_t v64 = v71[180];
          uint64_t v65 = v71[177];
          uint64_t v66 = v71[176];
          swift_release();
          swift_bridgeObjectRelease();
          id v67 = objc_allocWithZone((Class)HFItemUpdateOutcome);
          sub_20BA15458((uint64_t)v26);
          swift_bridgeObjectRelease();
          unint64_t v68 = (void *)sub_20BCE7510();
          swift_bridgeObjectRelease();
          id v82 = objc_msgSend(v67, sel_initWithResults_, v68);

          (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
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
          unint64_t v69 = (uint64_t (*)(id))v71[1];
          return v69(v82);
        }
        unint64_t v40 = *(void *)(v72 + 8 * v39);
        int64_t v41 = v34 + 1;
        if (!v40)
        {
          int64_t v41 = v34 + 2;
          if (v34 + 2 >= v73) {
            goto LABEL_41;
          }
          unint64_t v40 = *(void *)(v72 + 8 * v41);
          if (!v40)
          {
            int64_t v41 = v34 + 3;
            if (v34 + 3 >= v73) {
              goto LABEL_41;
            }
            unint64_t v40 = *(void *)(v72 + 8 * v41);
            if (!v40)
            {
              int64_t v41 = v34 + 4;
              if (v34 + 4 >= v73) {
                goto LABEL_41;
              }
              unint64_t v40 = *(void *)(v72 + 8 * v41);
              if (!v40)
              {
                uint64_t v42 = v34 + 5;
                if (v34 + 5 >= v73) {
                  goto LABEL_41;
                }
                unint64_t v40 = *(void *)(v72 + 8 * v42);
                if (!v40)
                {
                  while (1)
                  {
                    int64_t v41 = v42 + 1;
                    if (__OFADD__(v42, 1)) {
                      goto LABEL_50;
                    }
                    if (v41 >= v73) {
                      goto LABEL_41;
                    }
                    unint64_t v40 = *(void *)(v72 + 8 * v41);
                    ++v42;
                    if (v40) {
                      goto LABEL_26;
                    }
                  }
                }
                int64_t v41 = v34 + 5;
              }
            }
          }
        }
LABEL_26:
        unint64_t v29 = (v40 - 1) & v40;
        int64_t v80 = v41;
        unint64_t v38 = __clz(__rbit64(v40)) + (v41 << 6);
      }
      uint64_t v43 = *(void **)(*(void *)(v79 + 48) + 8 * v38);
      sub_20BA200A0(*(void *)(v79 + 56) + 32 * v38, v76);
      *uint64_t v75 = v43;
      long long v44 = *((_OWORD *)v75 + 1);
      *(_OWORD *)uint64_t v25 = *(_OWORD *)v75;
      *(_OWORD *)(v25 + 16) = v44;
      *(void *)(v25 + 32) = v75[4];
      uint64_t v45 = *(void *)v25;
      *int64_t v78 = *(void *)v25;
      uint64_t v46 = v30;
      sub_20BA200A0(v35, v30);
      uint64_t v47 = sub_20BCE7620();
      uint64_t v49 = v48;
      *unint64_t v77 = v45;
      sub_20BA200A0(v35, (uint64_t)v74);
      sub_20BA1FD80(v74, v81);
      id v50 = v43;
      char v51 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v52 = sub_20BA16D9C(v47, v49);
      uint64_t v53 = v26[2];
      BOOL v54 = (v32 & 1) == 0;
      uint64_t v31 = v53 + v54;
      if (__OFADD__(v53, v54))
      {
        __break(1u);
LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
        return MEMORY[0x270FA2498](v31, v32, v33);
      }
      char v55 = v32;
      if (v26[3] >= v31)
      {
        if (v51)
        {
          if (v32) {
            goto LABEL_7;
          }
        }
        else
        {
          sub_20BA1DD34();
          if (v55) {
            goto LABEL_7;
          }
        }
      }
      else
      {
        sub_20BA18200(v31, v51);
        uint64_t v56 = sub_20BA16D9C(v47, v49);
        if ((v55 & 1) != (v57 & 1))
        {
          return sub_20BCE8060();
        }
        unint64_t v52 = v56;
        if (v55)
        {
LABEL_7:
          unint64_t v36 = (_OWORD *)(v26[7] + 32 * v52);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
          sub_20BA1FD80(v81, v36);
          goto LABEL_8;
        }
      }
      v26[(v52 >> 6) + 8] |= 1 << v52;
      uint64_t v58 = (uint64_t *)(v26[6] + 16 * v52);
      *uint64_t v58 = v47;
      v58[1] = v49;
      uint64_t v31 = (uint64_t)sub_20BA1FD80(v81, (_OWORD *)(v26[7] + 32 * v52));
      uint64_t v59 = v26[2];
      BOOL v60 = __OFADD__(v59, 1);
      uint64_t v61 = v59 + 1;
      if (v60) {
        goto LABEL_48;
      }
      void v26[2] = v61;
      swift_bridgeObjectRetain();
LABEL_8:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v30 = v46;
      __swift_destroy_boxed_opaque_existential_0(v46);
      uint64_t v31 = sub_20BA1FD90(v25, &qword_2676AF7B0);
      int64_t v34 = v80;
    }
  }
  uint64_t v62 = *(void *)(*(void *)(v0 + 1464) + *(void *)(v0 + 1488));
  *(void *)(v0 + 1528) = v62;
  swift_retain();
  uint64_t v31 = (uint64_t)sub_20BAB2000;
  uint64_t v32 = v62;
  uint64_t v33 = 0;
  return MEMORY[0x270FA2498](v31, v32, v33);
}

uint64_t sub_20BAB1930()
{
  uint64_t v1 = v0 + 1232;
  uint64_t v2 = (_OWORD *)(v0 + 1264);
  if (qword_2676AD500 != -1) {
LABEL_47:
  }
    swift_once();
  unint64_t v68 = (_OWORD *)(v0 + 1200);
  id v3 = (id)qword_2676B6C00;
  sub_20BCE72A0();
  uint64_t v4 = sub_20BCE7270();
  os_log_type_t v5 = sub_20BCE7A90();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_20B986000, v4, v5, "Failed to determine today event count", v6, 2u);
    MEMORY[0x21053F820](v6, -1, -1);
  }
  unint64_t v62 = v0 + 136;
  uint64_t v7 = v0 + 176;
  uint64_t v64 = (void *)(v0 + 256);
  uint64_t v65 = (void *)(v0 + 216);
  uint64_t v8 = *(void *)(v0 + 1456);
  uint64_t v9 = *(void *)(v0 + 1368);
  uint64_t v10 = *(void *)(v0 + 1344);
  uint64_t v11 = *(void *)(v0 + 1336);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  uint64_t v12 = @"description";
  id v13 = (void *)sub_20BCE75E0();
  id v14 = HFLocalizedString(v13);

  uint64_t v15 = sub_20BCE7620();
  uint64_t v17 = v16;

  *(void *)(v0 + 1288) = MEMORY[0x263F8D310];
  *(void *)(v0 + 1264) = v15;
  *(void *)(v0 + 1272) = v17;
  sub_20BA1FD80(v2, (_OWORD *)v1);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_20BA1BE94((_OWORD *)v1, v12, isUniquelyReferenced_nonNull_native);
  uint64_t v19 = v8;
  swift_bridgeObjectRelease();

  uint64_t v20 = (void *)sub_20BA120C0(MEMORY[0x263F8EE78]);
  uint64_t v58 = (void *)v0;
  uint64_t v59 = v19 + 64;
  uint64_t v21 = -1;
  uint64_t v22 = -1 << *(unsigned char *)(v19 + 32);
  if (-v22 < 64) {
    uint64_t v21 = ~(-1 << -(char)v22);
  }
  unint64_t v23 = v21 & *(void *)(v19 + 64);
  uint64_t v63 = v0 + 144;
  uint64_t v1 = v0 + 224;
  int64_t v60 = (unint64_t)(63 - v22) >> 6;
  uint64_t v61 = (_OWORD *)(v0 + 264);
  uint64_t v66 = v19;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v25 = 0;
  uint64_t v26 = v0 + 184;
  while (1)
  {
    if (v23)
    {
      unint64_t v27 = __clz(__rbit64(v23));
      v23 &= v23 - 1;
      int64_t v67 = v25;
      unint64_t v28 = v27 | (v25 << 6);
      goto LABEL_27;
    }
    int64_t v29 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      goto LABEL_46;
    }
    if (v29 >= v60)
    {
LABEL_38:
      char v51 = (void *)v58[183];
      uint64_t v52 = v58[180];
      uint64_t v53 = v58[177];
      uint64_t v54 = v58[176];
      swift_release();
      swift_bridgeObjectRelease();
      id v55 = objc_allocWithZone((Class)HFItemUpdateOutcome);
      sub_20BA15458((uint64_t)v20);
      swift_bridgeObjectRelease();
      uint64_t v56 = (void *)sub_20BCE7510();
      swift_bridgeObjectRelease();
      id v69 = objc_msgSend(v55, sel_initWithResults_, v56);

      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v54);
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
      char v57 = (uint64_t (*)(id))v58[1];
      return v57(v69);
    }
    unint64_t v30 = *(void *)(v59 + 8 * v29);
    int64_t v31 = v25 + 1;
    if (!v30)
    {
      int64_t v31 = v25 + 2;
      if (v25 + 2 >= v60) {
        goto LABEL_38;
      }
      unint64_t v30 = *(void *)(v59 + 8 * v31);
      if (!v30)
      {
        int64_t v31 = v25 + 3;
        if (v25 + 3 >= v60) {
          goto LABEL_38;
        }
        unint64_t v30 = *(void *)(v59 + 8 * v31);
        if (!v30)
        {
          int64_t v31 = v25 + 4;
          if (v25 + 4 >= v60) {
            goto LABEL_38;
          }
          unint64_t v30 = *(void *)(v59 + 8 * v31);
          if (!v30) {
            break;
          }
        }
      }
    }
LABEL_26:
    unint64_t v23 = (v30 - 1) & v30;
    int64_t v67 = v31;
    unint64_t v28 = __clz(__rbit64(v30)) + (v31 << 6);
LABEL_27:
    uint64_t v33 = *(void **)(*(void *)(v66 + 48) + 8 * v28);
    sub_20BA200A0(*(void *)(v66 + 56) + 32 * v28, v63);
    *(void *)unint64_t v62 = v33;
    long long v34 = *(_OWORD *)(v62 + 16);
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v62;
    *(_OWORD *)(v7 + 16) = v34;
    *(void *)(v7 + 32) = *(void *)(v62 + 32);
    uint64_t v35 = *(void *)v7;
    void *v65 = *(void *)v7;
    uint64_t v36 = v1;
    sub_20BA200A0(v26, v1);
    uint64_t v2 = (_OWORD *)sub_20BCE7620();
    uint64_t v38 = v37;
    *uint64_t v64 = v35;
    sub_20BA200A0(v26, (uint64_t)v61);
    sub_20BA1FD80(v61, v68);
    id v39 = v33;
    uint64_t v1 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v0 = sub_20BA16D9C((uint64_t)v2, v38);
    uint64_t v41 = v20[2];
    BOOL v42 = (v40 & 1) == 0;
    uint64_t v43 = v41 + v42;
    if (__OFADD__(v41, v42))
    {
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    char v44 = v40;
    if (v20[3] >= v43)
    {
      if (v1)
      {
        if (v40) {
          goto LABEL_7;
        }
      }
      else
      {
        sub_20BA1DD34();
        if (v44) {
          goto LABEL_7;
        }
      }
    }
    else
    {
      sub_20BA18200(v43, v1);
      uint64_t v45 = sub_20BA16D9C((uint64_t)v2, v38);
      if ((v44 & 1) != (v46 & 1))
      {
        return sub_20BCE8060();
      }
      unint64_t v0 = v45;
      if (v44)
      {
LABEL_7:
        unint64_t v0 = v20[7] + 32 * v0;
        __swift_destroy_boxed_opaque_existential_0(v0);
        sub_20BA1FD80(v68, (_OWORD *)v0);
        goto LABEL_8;
      }
    }
    v20[(v0 >> 6) + 8] |= 1 << v0;
    uint64_t v47 = (void *)(v20[6] + 16 * v0);
    *uint64_t v47 = v2;
    v47[1] = v38;
    sub_20BA1FD80(v68, (_OWORD *)(v20[7] + 32 * v0));
    uint64_t v48 = v20[2];
    BOOL v49 = __OFADD__(v48, 1);
    uint64_t v50 = v48 + 1;
    if (v49) {
      goto LABEL_45;
    }
    v20[2] = v50;
    swift_bridgeObjectRetain();
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v1 = v36;
    __swift_destroy_boxed_opaque_existential_0(v36);
    uint64_t result = sub_20BA1FD90(v7, &qword_2676AF7B0);
    int64_t v25 = v67;
  }
  uint64_t v32 = v25 + 5;
  if (v25 + 5 >= v60) {
    goto LABEL_38;
  }
  unint64_t v30 = *(void *)(v59 + 8 * v32);
  if (v30)
  {
    int64_t v31 = v25 + 5;
    goto LABEL_26;
  }
  while (1)
  {
    int64_t v31 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v31 >= v60) {
      goto LABEL_38;
    }
    unint64_t v30 = *(void *)(v59 + 8 * v31);
    ++v32;
    if (v30) {
      goto LABEL_26;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_20BAB2000()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[187];
  uint64_t v2 = v0[176];
  uint64_t v3 = v0[172];
  v1(v0[173], 1, 1, v2);
  v1(v3, 1, 1, v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[192] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_20BAB20E4;
  uint64_t v5 = v0[173];
  uint64_t v6 = v0[172];
  return sub_20BA705DC(v5, v6, 1, 0);
}

uint64_t sub_20BAB20E4(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[193] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[191];
  uint64_t v6 = v4[173];
  uint64_t v7 = v4[172];
  if (v1)
  {
    sub_20BA1FD90(v7, &qword_2676AE0D8);
    sub_20BA1FD90(v6, &qword_2676AE0D8);
    uint64_t v8 = sub_20BAB2EDC;
    uint64_t v9 = v5;
  }
  else
  {
    v4[194] = a1;
    sub_20BA1FD90(v7, &qword_2676AE0D8);
    sub_20BA1FD90(v6, &qword_2676AE0D8);
    swift_release();
    uint64_t v8 = sub_20BAB22A0;
    uint64_t v9 = 0;
  }
  return MEMORY[0x270FA2498](v8, v9, 0);
}

uint64_t sub_20BAB22A0()
{
  if (*(uint64_t *)(v0 + 1552) <= 0)
  {
    uint64_t v27 = v0 + 880;
    uint64_t v28 = v0 + 912;
    if (qword_2676AD500 != -1) {
      goto LABEL_88;
    }
    goto LABEL_39;
  }
  uint64_t v130 = (_OWORD *)(v0 + 1008);
  uint64_t v1 = MEMORY[0x263F8D310];
  uint64_t v2 = (_OWORD *)(v0 + 1168);
  uint64_t v3 = (_OWORD *)(v0 + 1040);
  uint64_t v4 = *(void *)(v0 + 1520);
  uint64_t v5 = *(void *)(v0 + 1456);
  uint64_t v6 = @"description";
  uint64_t v7 = (void *)sub_20BCE75E0();
  id v8 = HFLocalizedString(v7);

  sub_20BCE7620();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676AEFB8);
  uint64_t v9 = swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8D6C8];
  *(_OWORD *)(v9 + 16) = xmmword_20BD11940;
  uint64_t v11 = MEMORY[0x263F8D750];
  *(void *)(v9 + 56) = v10;
  *(void *)(v9 + 64) = v11;
  *(void *)(v9 + 32) = v4;
  uint64_t v12 = sub_20BCE75F0();
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v112[149] = v1;
  v112[146] = v12;
  v112[147] = v14;
  uint64_t v15 = v112;
  sub_20BA1FD80(v2, v3);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_20BA1BE94(v3, v6, isUniquelyReferenced_nonNull_native);
  uint64_t v126 = v5;
  swift_bridgeObjectRelease();

  if (v4 <= 40)
  {
    uint64_t v17 = (void (*)(uint64_t, uint64_t, uint64_t))v112[184];
    uint64_t v18 = v112[180];
    uint64_t v19 = v112[179];
    uint64_t v20 = v112[177];
    uint64_t v21 = v112[176];
    uint64_t v22 = v112[166];
    uint64_t v23 = *(void *)(v112[183] + v112[186]);
    uint64_t v24 = sub_20BCE7870();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v22, 1, 1, v24);
    v17(v19, v18, v21);
    uint64_t v15 = v112;
    unint64_t v25 = (*(unsigned __int8 *)(v20 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    uint64_t v26 = (char *)swift_allocObject();
    *((void *)v26 + 2) = 0;
    *((void *)v26 + 3) = 0;
    *((void *)v26 + 4) = v23;
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(&v26[v25], v19, v21);
    swift_retain();
    sub_20BA15A00(v22, (uint64_t)&unk_2676AF858, (uint64_t)v26);
    swift_release();
  }
  uint64_t v27 = (uint64_t)(v15 + 52);
  uint64_t v28 = (uint64_t)(v15 + 57);
  v122 = v15 + 67;
  id v124 = v15 + 62;
  int64_t v29 = (void *)sub_20BA120C0(MEMORY[0x263F8EE78]);
  uint64_t v113 = v126 + 64;
  uint64_t v30 = -1;
  uint64_t v31 = -1 << *(unsigned char *)(v126 + 32);
  if (-v31 < 64) {
    uint64_t v30 = ~(-1 << -(char)v31);
  }
  unint64_t v32 = v30 & *(void *)(v126 + 64);
  uint64_t v0 = (uint64_t)(v15 + 63);
  uint64_t v118 = (uint64_t)(v15 + 58);
  uint64_t v120 = (uint64_t)(v15 + 53);
  int64_t v115 = (unint64_t)(63 - v31) >> 6;
  v117 = v15 + 68;
  swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v128)
  {
    if (v32)
    {
      unint64_t v35 = __clz(__rbit64(v32));
      v32 &= v32 - 1;
      int64_t v128 = i;
      unint64_t v36 = v35 | (i << 6);
    }
    else
    {
      int64_t v37 = i + 1;
      if (__OFADD__(i, 1)) {
        goto LABEL_84;
      }
      if (v37 >= v115)
      {
LABEL_75:
        uint64_t v104 = (void *)v112[183];
        uint64_t v105 = v112[180];
        uint64_t v106 = v112[177];
        uint64_t v107 = v112[176];
        swift_release();
        swift_bridgeObjectRelease();
        id v108 = objc_allocWithZone((Class)HFItemUpdateOutcome);
        sub_20BA15458((uint64_t)v29);
        swift_bridgeObjectRelease();
        long long v109 = (void *)sub_20BCE7510();
        swift_bridgeObjectRelease();
        id v132 = objc_msgSend(v108, sel_initWithResults_, v109);

        (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v105, v107);
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
        uint64_t v110 = (uint64_t (*)(id))v112[1];
        return v110(v132);
      }
      unint64_t v38 = *(void *)(v113 + 8 * v37);
      int64_t v39 = i + 1;
      if (!v38)
      {
        int64_t v39 = i + 2;
        if (i + 2 >= v115) {
          goto LABEL_75;
        }
        unint64_t v38 = *(void *)(v113 + 8 * v39);
        if (!v38)
        {
          int64_t v39 = i + 3;
          if (i + 3 >= v115) {
            goto LABEL_75;
          }
          unint64_t v38 = *(void *)(v113 + 8 * v39);
          if (!v38)
          {
            int64_t v39 = i + 4;
            if (i + 4 >= v115) {
              goto LABEL_75;
            }
            unint64_t v38 = *(void *)(v113 + 8 * v39);
            if (!v38)
            {
              uint64_t v40 = i + 5;
              if (i + 5 >= v115) {
                goto LABEL_75;
              }
              unint64_t v38 = *(void *)(v113 + 8 * v40);
              if (!v38)
              {
                while (1)
                {
                  int64_t v39 = v40 + 1;
                  if (__OFADD__(v40, 1)) {
                    goto LABEL_87;
                  }
                  if (v39 >= v115) {
                    goto LABEL_75;
                  }
                  unint64_t v38 = *(void *)(v113 + 8 * v39);
                  ++v40;
                  if (v38) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v39 = i + 5;
            }
          }
        }
      }
LABEL_26:
      unint64_t v32 = (v38 - 1) & v38;
      int64_t v128 = v39;
      unint64_t v36 = __clz(__rbit64(v38)) + (v39 << 6);
    }
    uint64_t v41 = *(void **)(*(void *)(v126 + 48) + 8 * v36);
    sub_20BA200A0(*(void *)(v126 + 56) + 32 * v36, v120);
    *(void *)uint64_t v27 = v41;
    long long v42 = *(_OWORD *)(v27 + 16);
    *(_OWORD *)uint64_t v28 = *(_OWORD *)v27;
    *(_OWORD *)(v28 + 16) = v42;
    *(void *)(v28 + 32) = *(void *)(v27 + 32);
    uint64_t v43 = *(void *)v28;
    *id v124 = *(void *)v28;
    uint64_t v44 = v0;
    sub_20BA200A0(v118, v0);
    uint64_t v0 = sub_20BCE7620();
    uint64_t v46 = v45;
    void *v122 = v43;
    sub_20BA200A0(v118, (uint64_t)v117);
    sub_20BA1FD80(v117, v130);
    id v47 = v41;
    char v48 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v50 = sub_20BA16D9C(v0, v46);
    uint64_t v51 = v29[2];
    BOOL v52 = (v49 & 1) == 0;
    uint64_t v53 = v51 + v52;
    if (__OFADD__(v51, v52)) {
      break;
    }
    char v54 = v49;
    if (v29[3] >= v53)
    {
      if (v48)
      {
        if (v49) {
          goto LABEL_7;
        }
      }
      else
      {
        sub_20BA1DD34();
        if (v54) {
          goto LABEL_7;
        }
      }
    }
    else
    {
      sub_20BA18200(v53, v48);
      uint64_t v55 = sub_20BA16D9C(v0, v46);
      if ((v54 & 1) != (v56 & 1))
      {
LABEL_78:
        return sub_20BCE8060();
      }
      unint64_t v50 = v55;
      if (v54)
      {
LABEL_7:
        long long v34 = (_OWORD *)(v29[7] + 32 * v50);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
        sub_20BA1FD80(v130, v34);
        goto LABEL_8;
      }
    }
    v29[(v50 >> 6) + 8] |= 1 << v50;
    char v57 = (uint64_t *)(v29[6] + 16 * v50);
    *char v57 = v0;
    v57[1] = v46;
    sub_20BA1FD80(v130, (_OWORD *)(v29[7] + 32 * v50));
    uint64_t v58 = v29[2];
    BOOL v59 = __OFADD__(v58, 1);
    uint64_t v60 = v58 + 1;
    if (v59) {
      goto LABEL_83;
    }
    _OWORD v29[2] = v60;
    swift_bridgeObjectRetain();
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v0 = v44;
    __swift_destroy_boxed_opaque_existential_0(v44);
    sub_20BA1FD90(v28, &qword_2676AF7B0);
  }
  __break(1u);
  while (2)
  {
    __break(1u);
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
    while (2)
    {
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      swift_once();
LABEL_39:
      uint64_t v131 = (_OWORD *)(v0 + 1072);
      id v61 = (id)qword_2676B6C00;
      sub_20BCE72A0();
      unint64_t v62 = sub_20BCE7270();
      os_log_type_t v63 = sub_20BCE7AA0();
      if (os_log_type_enabled(v62, v63))
      {
        uint64_t v64 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v64 = 0;
        _os_log_impl(&dword_20B986000, v62, v63, "Hiding activity status, no events found", v64, 2u);
        MEMORY[0x21053F820](v64, -1, -1);
      }
      v123 = (void *)(v0 + 576);
      v125 = (void *)(v0 + 376);
      uint64_t v65 = v0 + 616;
      uint64_t v119 = v0 + 656;
      uint64_t v66 = *(void *)(v0 + 1456);
      uint64_t v67 = *(void *)(v0 + 1448);
      uint64_t v68 = *(void *)(v0 + 1352);
      uint64_t v69 = *(void *)(v0 + 1344);
      uint64_t v70 = *(void *)(v0 + 1336);

      (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
      uint64_t v71 = @"hidden";
      uint64_t v72 = sub_20BCE7B20();
      *(void *)(v0 + 904) = v67;
      *(void *)(v0 + 880) = v72;
      sub_20BA1FD80((_OWORD *)v27, (_OWORD *)v28);
      char v73 = swift_isUniquelyReferenced_nonNull_native();
      sub_20BA1BE94((_OWORD *)v28, v71, v73);
      swift_bridgeObjectRelease();

      int64_t v29 = (void *)sub_20BA120C0(MEMORY[0x263F8EE78]);
      uint64_t v111 = v66 + 64;
      uint64_t v74 = -1;
      uint64_t v75 = -1 << *(unsigned char *)(v66 + 32);
      if (-v75 < 64) {
        uint64_t v74 = ~(-1 << -(char)v75);
      }
      unint64_t v76 = v74 & *(void *)(v66 + 64);
      uint64_t v121 = v0 + 664;
      uint64_t v77 = v0 + 584;
      int64_t v114 = (unint64_t)(63 - v75) >> 6;
      v116 = (_OWORD *)(v0 + 384);
      uint64_t v127 = v66;
      uint64_t result = swift_bridgeObjectRetain();
      int64_t v79 = 0;
      uint64_t v80 = v0 + 624;
LABEL_46:
      if (v76)
      {
        unint64_t v81 = __clz(__rbit64(v76));
        v76 &= v76 - 1;
        int64_t v129 = v79;
        unint64_t v82 = v81 | (v79 << 6);
        goto LABEL_64;
      }
      int64_t v83 = v79 + 1;
      if (__OFADD__(v79, 1)) {
        continue;
      }
      break;
    }
    if (v83 >= v114) {
      goto LABEL_75;
    }
    unint64_t v84 = *(void *)(v111 + 8 * v83);
    int64_t v85 = v79 + 1;
    if (v84) {
      goto LABEL_63;
    }
    int64_t v85 = v79 + 2;
    if (v79 + 2 >= v114) {
      goto LABEL_75;
    }
    unint64_t v84 = *(void *)(v111 + 8 * v85);
    if (v84) {
      goto LABEL_63;
    }
    int64_t v85 = v79 + 3;
    if (v79 + 3 >= v114) {
      goto LABEL_75;
    }
    unint64_t v84 = *(void *)(v111 + 8 * v85);
    if (v84) {
      goto LABEL_63;
    }
    int64_t v85 = v79 + 4;
    if (v79 + 4 >= v114) {
      goto LABEL_75;
    }
    unint64_t v84 = *(void *)(v111 + 8 * v85);
    if (v84)
    {
LABEL_63:
      unint64_t v76 = (v84 - 1) & v84;
      int64_t v129 = v85;
      unint64_t v82 = __clz(__rbit64(v84)) + (v85 << 6);
LABEL_64:
      uint64_t v87 = *(void **)(*(void *)(v127 + 48) + 8 * v82);
      sub_20BA200A0(*(void *)(v127 + 56) + 32 * v82, v121);
      *(void *)uint64_t v119 = v87;
      long long v88 = *(_OWORD *)(v119 + 16);
      *(_OWORD *)uint64_t v65 = *(_OWORD *)v119;
      *(_OWORD *)(v65 + 16) = v88;
      *(void *)(v65 + 32) = *(void *)(v119 + 32);
      uint64_t v89 = *(void *)v65;
      void *v123 = *(void *)v65;
      uint64_t v27 = v77;
      sub_20BA200A0(v80, v77);
      uint64_t v0 = sub_20BCE7620();
      uint64_t v91 = v90;
      void *v125 = v89;
      sub_20BA200A0(v80, (uint64_t)v116);
      sub_20BA1FD80(v116, v131);
      id v92 = v87;
      uint64_t v28 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v94 = sub_20BA16D9C(v0, v91);
      uint64_t v95 = v29[2];
      BOOL v96 = (v93 & 1) == 0;
      uint64_t v97 = v95 + v96;
      if (__OFADD__(v95, v96)) {
        continue;
      }
      char v98 = v93;
      if (v29[3] < v97)
      {
        sub_20BA18200(v97, v28);
        uint64_t v99 = sub_20BA16D9C(v0, v91);
        if ((v98 & 1) != (v100 & 1)) {
          goto LABEL_78;
        }
        unint64_t v94 = v99;
        if ((v98 & 1) == 0) {
          goto LABEL_71;
        }
LABEL_44:
        uint64_t v0 = v29[7] + 32 * v94;
        __swift_destroy_boxed_opaque_existential_0(v0);
        sub_20BA1FD80(v131, (_OWORD *)v0);
LABEL_45:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v77 = v27;
        __swift_destroy_boxed_opaque_existential_0(v27);
        uint64_t result = sub_20BA1FD90(v65, &qword_2676AF7B0);
        int64_t v79 = v129;
        goto LABEL_46;
      }
      if (v28)
      {
        if (v93) {
          goto LABEL_44;
        }
      }
      else
      {
        sub_20BA1DD34();
        if (v98) {
          goto LABEL_44;
        }
      }
LABEL_71:
      v29[(v94 >> 6) + 8] |= 1 << v94;
      v101 = (uint64_t *)(v29[6] + 16 * v94);
      uint64_t *v101 = v0;
      v101[1] = v91;
      sub_20BA1FD80(v131, (_OWORD *)(v29[7] + 32 * v94));
      uint64_t v102 = v29[2];
      BOOL v59 = __OFADD__(v102, 1);
      uint64_t v103 = v102 + 1;
      if (v59) {
        goto LABEL_85;
      }
      _OWORD v29[2] = v103;
      swift_bridgeObjectRetain();
      goto LABEL_45;
    }
    break;
  }
  uint64_t v86 = v79 + 5;
  if (v79 + 5 >= v114) {
    goto LABEL_75;
  }
  unint64_t v84 = *(void *)(v111 + 8 * v86);
  if (v84)
  {
    int64_t v85 = v79 + 5;
    goto LABEL_63;
  }
  while (1)
  {
    int64_t v85 = v86 + 1;
    if (__OFADD__(v86, 1)) {
      break;
    }
    if (v85 >= v114) {
      goto LABEL_75;
    }
    unint64_t v84 = *(void *)(v111 + 8 * v85);
    ++v86;
    if (v84) {
      goto LABEL_63;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_20BAB2EDC()
{
  uint64_t v1 = *(void **)(v0 + 1544);
  swift_release();

  return MEMORY[0x270FA2498](sub_20BAB2F50, 0, 0);
}

uint64_t sub_20BAB2F50()
{
  uint64_t v1 = v0 + 944;
  uint64_t v2 = (_OWORD *)(v0 + 976);
  if (qword_2676AD500 != -1) {
LABEL_47:
  }
    swift_once();
  uint64_t v68 = (_OWORD *)(v0 + 848);
  id v3 = (id)qword_2676B6C00;
  sub_20BCE72A0();
  uint64_t v4 = sub_20BCE7270();
  os_log_type_t v5 = sub_20BCE7A90();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_20B986000, v4, v5, "Failed to determine if any events exist", v6, 2u);
    MEMORY[0x21053F820](v6, -1, -1);
  }
  uint64_t v7 = v0 + 16;
  unint64_t v62 = v0 + 696;
  uint64_t v64 = (void *)(v0 + 776);
  uint64_t v65 = (void *)(v0 + 736);
  uint64_t v8 = *(void *)(v0 + 1456);
  uint64_t v9 = *(void *)(v0 + 1360);
  uint64_t v10 = *(void *)(v0 + 1344);
  uint64_t v11 = *(void *)(v0 + 1336);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  uint64_t v12 = @"description";
  uint64_t v13 = (void *)sub_20BCE75E0();
  id v14 = HFLocalizedString(v13);

  uint64_t v15 = sub_20BCE7620();
  uint64_t v17 = v16;

  *(void *)(v0 + 1000) = MEMORY[0x263F8D310];
  *(void *)(v0 + 976) = v15;
  *(void *)(v0 + 984) = v17;
  sub_20BA1FD80(v2, (_OWORD *)v1);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_20BA1BE94((_OWORD *)v1, v12, isUniquelyReferenced_nonNull_native);
  uint64_t v19 = v8;
  swift_bridgeObjectRelease();

  uint64_t v20 = (void *)sub_20BA120C0(MEMORY[0x263F8EE78]);
  uint64_t v58 = (void *)v0;
  uint64_t v59 = v19 + 64;
  uint64_t v21 = -1;
  uint64_t v22 = -1 << *(unsigned char *)(v19 + 32);
  if (-v22 < 64) {
    uint64_t v21 = ~(-1 << -(char)v22);
  }
  unint64_t v23 = v21 & *(void *)(v19 + 64);
  uint64_t v63 = v0 + 704;
  uint64_t v1 = v0 + 784;
  int64_t v60 = (unint64_t)(63 - v22) >> 6;
  id v61 = (_OWORD *)(v0 + 744);
  uint64_t v66 = v19;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v25 = 0;
  uint64_t v26 = v0 + 24;
  while (1)
  {
    if (v23)
    {
      unint64_t v27 = __clz(__rbit64(v23));
      v23 &= v23 - 1;
      int64_t v67 = v25;
      unint64_t v28 = v27 | (v25 << 6);
      goto LABEL_27;
    }
    int64_t v29 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      goto LABEL_46;
    }
    if (v29 >= v60)
    {
LABEL_38:
      uint64_t v51 = (void *)v58[183];
      uint64_t v52 = v58[180];
      uint64_t v53 = v58[177];
      uint64_t v54 = v58[176];
      swift_release();
      swift_bridgeObjectRelease();
      id v55 = objc_allocWithZone((Class)HFItemUpdateOutcome);
      sub_20BA15458((uint64_t)v20);
      swift_bridgeObjectRelease();
      char v56 = (void *)sub_20BCE7510();
      swift_bridgeObjectRelease();
      id v69 = objc_msgSend(v55, sel_initWithResults_, v56);

      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v54);
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
      char v57 = (uint64_t (*)(id))v58[1];
      return v57(v69);
    }
    unint64_t v30 = *(void *)(v59 + 8 * v29);
    int64_t v31 = v25 + 1;
    if (!v30)
    {
      int64_t v31 = v25 + 2;
      if (v25 + 2 >= v60) {
        goto LABEL_38;
      }
      unint64_t v30 = *(void *)(v59 + 8 * v31);
      if (!v30)
      {
        int64_t v31 = v25 + 3;
        if (v25 + 3 >= v60) {
          goto LABEL_38;
        }
        unint64_t v30 = *(void *)(v59 + 8 * v31);
        if (!v30)
        {
          int64_t v31 = v25 + 4;
          if (v25 + 4 >= v60) {
            goto LABEL_38;
          }
          unint64_t v30 = *(void *)(v59 + 8 * v31);
          if (!v30) {
            break;
          }
        }
      }
    }
LABEL_26:
    unint64_t v23 = (v30 - 1) & v30;
    int64_t v67 = v31;
    unint64_t v28 = __clz(__rbit64(v30)) + (v31 << 6);
LABEL_27:
    uint64_t v33 = *(void **)(*(void *)(v66 + 48) + 8 * v28);
    sub_20BA200A0(*(void *)(v66 + 56) + 32 * v28, v63);
    *(void *)unint64_t v62 = v33;
    long long v34 = *(_OWORD *)(v62 + 16);
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v62;
    *(_OWORD *)(v7 + 16) = v34;
    *(void *)(v7 + 32) = *(void *)(v62 + 32);
    uint64_t v35 = *(void *)v7;
    *uint64_t v64 = *(void *)v7;
    uint64_t v36 = v1;
    sub_20BA200A0(v26, v1);
    uint64_t v2 = (_OWORD *)sub_20BCE7620();
    uint64_t v38 = v37;
    void *v65 = v35;
    sub_20BA200A0(v26, (uint64_t)v61);
    sub_20BA1FD80(v61, v68);
    id v39 = v33;
    uint64_t v1 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v0 = sub_20BA16D9C((uint64_t)v2, v38);
    uint64_t v41 = v20[2];
    BOOL v42 = (v40 & 1) == 0;
    uint64_t v43 = v41 + v42;
    if (__OFADD__(v41, v42))
    {
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
    char v44 = v40;
    if (v20[3] >= v43)
    {
      if (v1)
      {
        if (v40) {
          goto LABEL_7;
        }
      }
      else
      {
        sub_20BA1DD34();
        if (v44) {
          goto LABEL_7;
        }
      }
    }
    else
    {
      sub_20BA18200(v43, v1);
      uint64_t v45 = sub_20BA16D9C((uint64_t)v2, v38);
      if ((v44 & 1) != (v46 & 1))
      {
        return sub_20BCE8060();
      }
      unint64_t v0 = v45;
      if (v44)
      {
LABEL_7:
        unint64_t v0 = v20[7] + 32 * v0;
        __swift_destroy_boxed_opaque_existential_0(v0);
        sub_20BA1FD80(v68, (_OWORD *)v0);
        goto LABEL_8;
      }
    }
    v20[(v0 >> 6) + 8] |= 1 << v0;
    id v47 = (void *)(v20[6] + 16 * v0);
    *id v47 = v2;
    v47[1] = v38;
    sub_20BA1FD80(v68, (_OWORD *)(v20[7] + 32 * v0));
    uint64_t v48 = v20[2];
    BOOL v49 = __OFADD__(v48, 1);
    uint64_t v50 = v48 + 1;
    if (v49) {
      goto LABEL_45;
    }
    v20[2] = v50;
    swift_bridgeObjectRetain();
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v1 = v36;
    __swift_destroy_boxed_opaque_existential_0(v36);
    uint64_t result = sub_20BA1FD90(v7, &qword_2676AF7B0);
    int64_t v25 = v67;
  }
  uint64_t v32 = v25 + 5;
  if (v25 + 5 >= v60) {
    goto LABEL_38;
  }
  unint64_t v30 = *(void *)(v59 + 8 * v32);
  if (v30)
  {
    int64_t v31 = v25 + 5;
    goto LABEL_26;
  }
  while (1)
  {
    int64_t v31 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v31 >= v60) {
      goto LABEL_38;
    }
    unint64_t v30 = *(void *)(v59 + 8 * v31);
    ++v32;
    if (v30) {
      goto LABEL_26;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_20BAB3620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_20BAB36C0;
  return sub_20BA726F8(a5);
}

uint64_t sub_20BAB36C0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 32) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BAB37C0, 0, 0);
}

uint64_t sub_20BAB37C0()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id ActivityEventStatusItem.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityEventStatusItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Bool __swiftcall HMHome.hasCompatibleActivityLogAccessories()()
{
  uint64_t v0 = sub_20BCE6F30();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = v1;
  uint64_t v3 = MEMORY[0x270FA5388](v0);
  uint64_t v50 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v34 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF7D0);
  uint64_t v7 = *(void *)(v1 + 72);
  unint64_t v8 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_20BD12530;
  v34[2] = v9;
  unint64_t v10 = v9 + v8;
  uint64_t v11 = *(void (**)(unint64_t))(v2 + 104);
  int v48 = *MEMORY[0x263F49448];
  v11(v9 + v8);
  uint64_t v49 = v7;
  int v47 = *MEMORY[0x263F49438];
  v11(v10 + v7);
  int v44 = *MEMORY[0x263F49450];
  v11(v10 + 2 * v7);
  uint64_t v51 = (void *)MEMORY[0x263F8EE78];
  id v14 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v13 = v2 + 16;
  uint64_t v12 = v14;
  int v38 = *MEMORY[0x263F49440];
  uint64_t v15 = (void (**)(char *, uint64_t))(v13 - 8);
  uint64_t v37 = *MEMORY[0x263F0D7D8];
  uint64_t v36 = *MEMORY[0x263F0D7F8];
  uint64_t v43 = *MEMORY[0x263F0D698];
  uint64_t v16 = *MEMORY[0x263F0D6A8];
  uint64_t v41 = *MEMORY[0x263F0D8A8];
  uint64_t v42 = v16;
  uint64_t v40 = *MEMORY[0x263F0D6F8];
  uint64_t v17 = 3;
  long long v46 = xmmword_20BD11940;
  long long v39 = xmmword_20BD130C0;
  long long v35 = xmmword_20BD12330;
  v34[1] = v10;
  unint64_t v18 = v10;
  uint64_t v45 = *MEMORY[0x263F0D798];
  v14(v6, (char *)v10, v0);
  while (1)
  {
    uint64_t v21 = v50;
    v12(v50, v6, v0);
    int v22 = (*(uint64_t (**)(char *, uint64_t))(v13 + 72))(v21, v0);
    if (v22 == v48)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB2E498);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = v46;
      *(void *)(v19 + 32) = sub_20BCE7620();
      *(void *)(v19 + 40) = v20;
    }
    else if (v22 == v47)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB2E498);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = v39;
      *(void *)(v19 + 32) = sub_20BCE7620();
      *(void *)(v19 + 40) = v23;
      *(void *)(v19 + 48) = sub_20BCE7620();
      *(void *)(v19 + 56) = v24;
      *(void *)(v19 + 64) = sub_20BCE7620();
      *(void *)(v19 + 72) = v25;
      *(void *)(v19 + 80) = sub_20BCE7620();
      *(void *)(v19 + 88) = v26;
    }
    else if (v22 == v44)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB2E498);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = v35;
      *(void *)(v19 + 32) = sub_20BCE7620();
      *(void *)(v19 + 40) = v27;
      *(void *)(v19 + 48) = sub_20BCE7620();
      *(void *)(v19 + 56) = v28;
    }
    else
    {
      uint64_t v19 = MEMORY[0x263F8EE78];
      if (v22 != v38) {
        (*v15)(v50, v0);
      }
    }
    (*v15)(v6, v0);
    sub_20BA862F0(v19);
    v18 += v49;
    if (!--v17) {
      break;
    }
    v12(v6, (char *)v18, v0);
  }
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  int64_t v29 = v51;
  id v30 = objc_msgSend((id)v34[3], sel_hf_allVisibleServices);
  sub_20BA208F4(0, (unint64_t *)&qword_2676ADEB0);
  sub_20BA94238();
  uint64_t v31 = sub_20BCE7940();

  swift_bridgeObjectRetain();
  uint64_t v32 = (void *)sub_20BAB40F4(v31, v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  if (v32) {

  }
  return v32 != 0;
}

BOOL sub_20BAB3E1C(void *a1)
{
  id v1 = a1;
  Swift::Bool v2 = HMHome.hasCompatibleActivityLogAccessories()();

  return v2;
}

Swift::Bool __swiftcall HMHome.hasActivityLogPrerequisites()()
{
  id v0 = objc_msgSend(self, sel_sharedDispatcher);
  id v1 = objc_msgSend(v0, sel_homeManager);

  if (!v1) {
    return 0;
  }
  unsigned __int8 v2 = objc_msgSend(v1, sel_hasOptedToHH2);

  return v2;
}

id sub_20BAB3ED4(void *a1)
{
  unsigned __int8 v2 = self;
  id v3 = a1;
  id v4 = objc_msgSend(v2, sel_sharedDispatcher);
  id v5 = objc_msgSend(v4, sel_homeManager);

  if (v5)
  {
    id v6 = objc_msgSend(v5, sel_hasOptedToHH2);

    id v3 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

Swift::Bool __swiftcall HMHome.userSupportsActivityLog()()
{
  id v1 = objc_msgSend(v0, sel_currentUser);
  unsigned __int8 v2 = objc_msgSend(v0, sel_hf_userIsRestrictedGuest_, v1);

  return v2 ^ 1;
}

uint64_t sub_20BAB3FD4(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_currentUser);
  unsigned int v3 = objc_msgSend(v1, sel_hf_userIsRestrictedGuest_, v2);

  return v3 ^ 1;
}

Swift::Bool __swiftcall HMHome.activityLogAvailable()()
{
  unsigned int v1 = objc_msgSend(v0, sel_hasCompatibleActivityLogAccessories);
  if (v1)
  {
    unsigned int v1 = objc_msgSend(v0, sel_hasActivityLogPrerequisites);
    if (v1) {
      LOBYTE(v1) = objc_msgSend(v0, sel_userSupportsActivityLog);
    }
  }
  return v1;
}

id sub_20BAB4088(void *a1)
{
  id v1 = a1;
  if (objc_msgSend(v1, sel_hasCompatibleActivityLogAccessories)
    && objc_msgSend(v1, sel_hasActivityLogPrerequisites))
  {
    id v2 = objc_msgSend(v1, sel_userSupportsActivityLog);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

uint64_t sub_20BAB40F4(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_20BCE7C60();
    sub_20BA208F4(0, (unint64_t *)&qword_2676ADEB0);
    sub_20BA94238();
    uint64_t result = sub_20BCE79D0();
    uint64_t v2 = v32;
    uint64_t v29 = v33;
    uint64_t v4 = v34;
    uint64_t v5 = v35;
    unint64_t v6 = v36;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v29 = a1 + 56;
    uint64_t v8 = ~v7;
    uint64_t v9 = -v7;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v6 = v10 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = v8;
    uint64_t v5 = 0;
  }
  int64_t v28 = (unint64_t)(v4 + 64) >> 6;
  while (1)
  {
    if (v2 < 0)
    {
      if (!sub_20BCE7CE0()) {
        goto LABEL_49;
      }
      sub_20BA208F4(0, (unint64_t *)&qword_2676ADEB0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v14 = v37;
      swift_unknownObjectRelease();
      uint64_t v13 = v5;
      uint64_t v11 = v6;
      if (!v37) {
        goto LABEL_47;
      }
    }
    else
    {
      if (v6)
      {
        uint64_t v11 = (v6 - 1) & v6;
        unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
        uint64_t v13 = v5;
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1)) {
          goto LABEL_51;
        }
        if (v15 >= v28) {
          goto LABEL_49;
        }
        unint64_t v16 = *(void *)(v29 + 8 * v15);
        uint64_t v13 = v5 + 1;
        if (!v16)
        {
          uint64_t v13 = v5 + 2;
          if (v5 + 2 >= v28) {
            goto LABEL_49;
          }
          unint64_t v16 = *(void *)(v29 + 8 * v13);
          if (!v16)
          {
            uint64_t v13 = v5 + 3;
            if (v5 + 3 >= v28) {
              goto LABEL_49;
            }
            unint64_t v16 = *(void *)(v29 + 8 * v13);
            if (!v16)
            {
              uint64_t v13 = v5 + 4;
              if (v5 + 4 >= v28) {
                goto LABEL_49;
              }
              unint64_t v16 = *(void *)(v29 + 8 * v13);
              if (!v16)
              {
                uint64_t v13 = v5 + 5;
                if (v5 + 5 >= v28) {
                  goto LABEL_49;
                }
                unint64_t v16 = *(void *)(v29 + 8 * v13);
                if (!v16)
                {
                  uint64_t v17 = v5 + 6;
                  while (v28 != v17)
                  {
                    unint64_t v16 = *(void *)(v29 + 8 * v17++);
                    if (v16)
                    {
                      uint64_t v13 = v17 - 1;
                      goto LABEL_30;
                    }
                  }
LABEL_49:
                  id v14 = 0;
LABEL_47:
                  sub_20BA20930();
                  return (uint64_t)v14;
                }
              }
            }
          }
        }
LABEL_30:
        uint64_t v11 = (v16 - 1) & v16;
        unint64_t v12 = __clz(__rbit64(v16)) + (v13 << 6);
      }
      id v14 = *(id *)(*(void *)(v2 + 48) + 8 * v12);
      if (!v14) {
        goto LABEL_47;
      }
    }
    uint64_t v30 = v13;
    uint64_t v18 = v2;
    id v19 = objc_msgSend(v14, sel_serviceType);
    uint64_t v20 = sub_20BCE7620();
    uint64_t v22 = v21;

    uint64_t v23 = a2[2];
    if (v23)
    {
      if (a2[4] == v20 && a2[5] == v22 || (uint64_t result = sub_20BCE8000(), (result & 1) != 0))
      {
LABEL_46:
        swift_bridgeObjectRelease();
        goto LABEL_47;
      }
      if (v23 != 1) {
        break;
      }
    }
LABEL_8:

    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v5 = v30;
    unint64_t v6 = v11;
    uint64_t v2 = v18;
  }
  uint64_t v24 = a2 + 7;
  uint64_t v25 = 1;
  while (1)
  {
    uint64_t v26 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (*(v24 - 1) == v20 && *v24 == v22) {
      goto LABEL_46;
    }
    uint64_t result = sub_20BCE8000();
    if (result) {
      goto LABEL_46;
    }
    v24 += 2;
    ++v25;
    if (v26 == v23) {
      goto LABEL_8;
    }
  }
  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

id sub_20BAB44C0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_20BCE6540();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = &v3[OBJC_IVAR___HFActivityEventStatusItem_midnightToday];
  id v12 = objc_allocWithZone(MEMORY[0x263EFF910]);
  uint64_t v13 = v3;
  id v14 = objc_msgSend(v12, sel_init);
  id v15 = objc_msgSend(v14, sel_hf_startOfDay);

  sub_20BCE6510();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v10, v7);
  type metadata accessor for ActivityLogCoordinator();
  swift_allocObject();
  id v16 = a1;
  id v17 = sub_20BA7B56C(v16);

  *(void *)&v13[OBJC_IVAR___HFActivityEventStatusItem_activityLogCoordinator] = v17;
  uint64_t v18 = (objc_class *)type metadata accessor for ActivityEventStatusItem();
  v20.receiver = v13;
  v20.super_class = v18;
  return objc_msgSendSuper2(&v20, sel_initWithHome_room_valueSource_, v16, a2, a3);
}

unint64_t sub_20BAB466C()
{
  unint64_t result = qword_2676AD810;
  if (!qword_2676AD810)
  {
    type metadata accessor for HFItemUpdateOption(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676AD810);
  }
  return result;
}

uint64_t sub_20BAB46C4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_20BAB46FC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_20BAB4734()
{
  char v2 = *(unsigned char *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_20BA1FF3C;
  return sub_20BAB044C(v2, v3);
}

uint64_t sub_20BAB47DC()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t type metadata accessor for ActivityEventStatusItem()
{
  uint64_t result = qword_26AB2E3A8;
  if (!qword_26AB2E3A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20BAB4870()
{
  return type metadata accessor for ActivityEventStatusItem();
}

uint64_t sub_20BAB4878()
{
  uint64_t result = sub_20BCE6540();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_20BAB4918()
{
  uint64_t v1 = sub_20BCE6540();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_20BAB49EC(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_20BCE6540() - 8);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_20BA20C04;
  v6[2] = a1;
  uint64_t v7 = (void *)swift_task_alloc();
  v6[3] = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_20BAB36C0;
  return sub_20BA726F8(v5);
}

uint64_t static HFVacuumStatusItem.serviceTypes.getter()
{
  return MEMORY[0x263F8EE88];
}

uint64_t sub_20BAB4B60(uint64_t a1)
{
  v1[77] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF878);
  v1[78] = swift_task_alloc();
  uint64_t v2 = sub_20BCE6CD0();
  v1[79] = v2;
  v1[80] = *(void *)(v2 - 8);
  v1[81] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20BAB4C50, 0, 0);
}

uint64_t sub_20BAB4C50()
{
  uint64_t v1 = v0[77] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x21053F900](v1);
  v0[82] = v2;
  if (v2)
  {
    v0[83] = @"title";
    v0[84] = sub_20BCE6790();
    v0[85] = sub_20BCE7850();
    uint64_t v3 = @"title";
    v0[86] = sub_20BCE7840();
    uint64_t v5 = sub_20BCE77E0();
    return MEMORY[0x270FA2498](sub_20BAB4DC8, v5, v4);
  }
  else
  {
    objc_msgSend(self, sel_hf_errorWithCode_, 37);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_20BAB4DC8()
{
  swift_release();
  *(void *)(v0 + 696) = sub_20BCE6770();
  return MEMORY[0x270FA2498](sub_20BAB4E3C, 0, 0);
}

uint64_t sub_20BAB4E3C()
{
  *(void *)(v0 + 704) = sub_20BCE7840();
  uint64_t v2 = sub_20BCE77E0();
  return MEMORY[0x270FA2498](sub_20BAB4EC8, v2, v1);
}

uint64_t sub_20BAB4EC8()
{
  uint64_t v1 = *(void **)(v0 + 696);
  swift_release();
  sub_20BCE6730();

  return MEMORY[0x270FA2498](sub_20BAB4F44, 0, 0);
}

uint64_t sub_20BAB4F44()
{
  uint64_t v1 = *(void **)(v0 + 664);
  uint64_t v2 = *(void *)(v0 + 648);
  uint64_t v3 = *(void *)(v0 + 640);
  uint64_t v4 = *(void *)(v0 + 632);
  uint64_t v5 = *(void *)(v0 + 624);
  uint64_t v6 = sub_20BCE67A0();
  *(void *)(v0 + 712) = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  *(void *)(v0 + 720) = v8;
  *(void *)(v0 + 728) = (v7 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v8(v5, 1, 1, v6);
  uint64_t v9 = sub_20BCE6C80();
  uint64_t v11 = v10;
  sub_20BA1FD90(v5, &qword_2676AF878);
  id v12 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v0 + 736) = v12;
  *(void *)(v0 + 744) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v12(v2, v4);
  *(void *)(v0 + 552) = MEMORY[0x263F8D310];
  *(void *)(v0 + 528) = v9;
  *(void *)(v0 + 536) = v11;
  sub_20BA1FD80((_OWORD *)(v0 + 528), (_OWORD *)(v0 + 496));
  uint64_t v13 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_20BA1BE94((_OWORD *)(v0 + 496), v1, isUniquelyReferenced_nonNull_native);
  *(void *)(v0 + 752) = v13;
  swift_bridgeObjectRelease();

  *(void *)(v0 + 760) = @"description";
  id v15 = @"description";
  *(void *)(v0 + 768) = sub_20BCE7840();
  uint64_t v17 = sub_20BCE77E0();
  return MEMORY[0x270FA2498](sub_20BAB5120, v17, v16);
}

uint64_t sub_20BAB5120()
{
  swift_release();
  *(void *)(v0 + 776) = sub_20BCE6770();
  return MEMORY[0x270FA2498](sub_20BAB5194, 0, 0);
}

uint64_t sub_20BAB5194()
{
  *(void *)(v0 + 784) = sub_20BCE7840();
  uint64_t v2 = sub_20BCE77E0();
  return MEMORY[0x270FA2498](sub_20BAB5220, v2, v1);
}

uint64_t sub_20BAB5220()
{
  uint64_t v1 = *(void **)(v0 + 776);
  swift_release();
  sub_20BCE6730();

  return MEMORY[0x270FA2498](sub_20BAB529C, 0, 0);
}

uint64_t sub_20BAB529C()
{
  id v14 = *(void **)(v0 + 760);
  uint64_t v1 = *(void *)(v0 + 752);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 736);
  uint64_t v3 = *(void *)(v0 + 648);
  uint64_t v4 = *(void *)(v0 + 632);
  uint64_t v5 = *(void *)(v0 + 624);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 720))(v5, 1, 1, *(void *)(v0 + 712));
  uint64_t v6 = sub_20BCE6CA0();
  uint64_t v8 = v7;
  sub_20BA1FD90(v5, &qword_2676AF878);
  v2(v3, v4);
  *(void *)(v0 + 488) = MEMORY[0x263F8D310];
  *(void *)(v0 + 464) = v6;
  *(void *)(v0 + 472) = v8;
  sub_20BA1FD80((_OWORD *)(v0 + 464), (_OWORD *)(v0 + 176));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_20BA1BE94((_OWORD *)(v0 + 176), v14, isUniquelyReferenced_nonNull_native);
  *(void *)(v0 + 792) = v1;
  swift_bridgeObjectRelease();

  *(void *)(v0 + 800) = @"hidden";
  uint64_t v10 = @"hidden";
  *(void *)(v0 + 808) = sub_20BCE7840();
  uint64_t v12 = sub_20BCE77E0();
  return MEMORY[0x270FA2498](sub_20BAB5428, v12, v11);
}

uint64_t sub_20BAB5428()
{
  swift_release();
  *(void *)(v0 + 816) = sub_20BCE6770();
  return MEMORY[0x270FA2498](sub_20BAB549C, 0, 0);
}

uint64_t sub_20BAB549C()
{
  *(void *)(v0 + 824) = sub_20BCE7840();
  uint64_t v2 = sub_20BCE77E0();
  return MEMORY[0x270FA2498](sub_20BAB5528, v2, v1);
}

uint64_t sub_20BAB5528()
{
  uint64_t v1 = *(void **)(v0 + 816);
  swift_release();
  sub_20BCE6730();

  return MEMORY[0x270FA2498](sub_20BAB55A4, 0, 0);
}

uint64_t sub_20BAB55A4()
{
  uint64_t v1 = *(void **)(v0 + 800);
  uint64_t v2 = *(void *)(v0 + 792);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0 + 736);
  uint64_t v4 = *(void *)(v0 + 648);
  uint64_t v5 = *(void *)(v0 + 632);
  uint64_t v6 = *(void *)(v0 + 624);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 720))(v6, 1, 1, *(void *)(v0 + 712));
  char v7 = sub_20BCE6C90();
  sub_20BA1FD90(v6, &qword_2676AF878);
  v3(v4, v5);
  uint64_t v67 = v0;
  *(unsigned char *)(v0 + 208) = v7 & 1;
  uint64_t v8 = v0 + 208;
  uint64_t v74 = (void *)(v0 + 56);
  uint64_t v75 = (void *)(v0 + 16);
  uint64_t v9 = v0 + 96;
  uint64_t v10 = (_OWORD *)(v0 + 240);
  uint64_t v72 = v0 + 136;
  char v73 = (_OWORD *)(v0 + 272);
  uint64_t v11 = (_OWORD *)(v0 + 304);
  uint64_t v12 = (_OWORD *)(v0 + 336);
  uint64_t v13 = (_OWORD *)(v0 + 368);
  int64_t v78 = v12;
  *(void *)(v8 + 24) = MEMORY[0x263F8D4F8];
  sub_20BA1FD80((_OWORD *)v8, v10);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_20BA1BE94(v10, v1, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();

  id v15 = objc_allocWithZone((Class)HFImageIconDescriptor);
  uint64_t v16 = @"icon";
  uint64_t v17 = (void *)sub_20BCE75E0();
  id v18 = objc_msgSend(v15, sel_initWithSystemImageNamed_, v17);

  *(void *)(v8 + 88) = sub_20BA208F4(0, (unint64_t *)&unk_2676AF840);
  *(void *)(v8 + 64) = v18;
  sub_20BA1FD80(v73, v11);
  char v19 = swift_isUniquelyReferenced_nonNull_native();
  sub_20BA1BE94(v11, v16, v19);
  swift_bridgeObjectRelease();

  *(void *)(v8 + 376) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v8 + 352) = 1;
  sub_20BA1FD80((_OWORD *)(v8 + 352), v13);
  objc_super v20 = @"dependentOnMatterSnapshot";
  char v21 = swift_isUniquelyReferenced_nonNull_native();
  sub_20BA1BE94(v13, v20, v21);
  uint64_t v22 = v2;
  swift_bridgeObjectRelease();

  id v23 = objc_allocWithZone(NSNumber);
  uint64_t v24 = @"state";
  id v25 = objc_msgSend(v23, sel_initWithInteger_, 1);
  *(void *)(v8 + 216) = sub_20BA208F4(0, (unint64_t *)&qword_2676AE6A0);
  *(void *)(v8 + 192) = v25;
  sub_20BA1FD80((_OWORD *)(v8 + 192), (_OWORD *)(v8 + 224));
  char v26 = swift_isUniquelyReferenced_nonNull_native();
  sub_20BA1BE94((_OWORD *)(v8 + 224), v24, v26);
  uint64_t v27 = v22;
  swift_bridgeObjectRelease();

  int64_t v28 = (void *)sub_20BA120C0(MEMORY[0x263F8EE78]);
  uint64_t v68 = v27 + 64;
  uint64_t v29 = -1;
  uint64_t v30 = -1 << *(unsigned char *)(v27 + 32);
  if (-v30 < 64) {
    uint64_t v29 = ~(-1 << -(char)v30);
  }
  unint64_t v31 = v29 & *(void *)(v27 + 64);
  uint64_t v32 = v8 - 144;
  uint64_t v71 = v8 - 104;
  int64_t v69 = (unint64_t)(63 - v30) >> 6;
  uint64_t v70 = (_OWORD *)(v8 - 184);
  uint64_t v76 = v27;
  uint64_t result = swift_bridgeObjectRetain();
  for (int64_t i = 0; ; int64_t i = v77)
  {
    if (v31)
    {
      unint64_t v36 = __clz(__rbit64(v31));
      v31 &= v31 - 1;
      int64_t v77 = i;
      unint64_t v37 = v36 | (i << 6);
      goto LABEL_24;
    }
    int64_t v38 = i + 1;
    if (__OFADD__(i, 1)) {
      goto LABEL_43;
    }
    if (v38 >= v69) {
      break;
    }
    unint64_t v39 = *(void *)(v68 + 8 * v38);
    int64_t v40 = i + 1;
    if (!v39)
    {
      int64_t v40 = i + 2;
      if (i + 2 >= v69) {
        break;
      }
      unint64_t v39 = *(void *)(v68 + 8 * v40);
      if (!v39)
      {
        int64_t v40 = i + 3;
        if (i + 3 >= v69) {
          break;
        }
        unint64_t v39 = *(void *)(v68 + 8 * v40);
        if (!v39)
        {
          int64_t v40 = i + 4;
          if (i + 4 >= v69) {
            break;
          }
          unint64_t v39 = *(void *)(v68 + 8 * v40);
          if (!v39)
          {
            uint64_t v41 = i + 5;
            if (i + 5 >= v69) {
              break;
            }
            unint64_t v39 = *(void *)(v68 + 8 * v41);
            if (!v39)
            {
              while (1)
              {
                int64_t v40 = v41 + 1;
                if (__OFADD__(v41, 1)) {
                  goto LABEL_44;
                }
                if (v40 >= v69) {
                  goto LABEL_35;
                }
                unint64_t v39 = *(void *)(v68 + 8 * v40);
                ++v41;
                if (v39) {
                  goto LABEL_23;
                }
              }
            }
            int64_t v40 = i + 5;
          }
        }
      }
    }
LABEL_23:
    unint64_t v31 = (v39 - 1) & v39;
    int64_t v77 = v40;
    unint64_t v37 = __clz(__rbit64(v39)) + (v40 << 6);
LABEL_24:
    uint64_t v42 = *(void **)(*(void *)(v76 + 48) + 8 * v37);
    sub_20BA200A0(*(void *)(v76 + 56) + 32 * v37, v8 - 64);
    *(void *)uint64_t v72 = v42;
    long long v43 = *(_OWORD *)(v72 + 16);
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v72;
    *(_OWORD *)(v9 + 16) = v43;
    *(void *)(v9 + 32) = *(void *)(v72 + 32);
    uint64_t v44 = *(void *)v9;
    *uint64_t v74 = *(void *)v9;
    uint64_t v45 = v32;
    sub_20BA200A0(v71, v32);
    uint64_t v46 = sub_20BCE7620();
    uint64_t v48 = v47;
    *uint64_t v75 = v44;
    sub_20BA200A0(v71, (uint64_t)v70);
    sub_20BA1FD80(v70, v78);
    id v49 = v42;
    char v50 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v52 = sub_20BA16D9C(v46, v48);
    uint64_t v53 = v28[2];
    BOOL v54 = (v51 & 1) == 0;
    uint64_t result = v53 + v54;
    if (__OFADD__(v53, v54))
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      return result;
    }
    char v55 = v51;
    if (v28[3] >= result)
    {
      if (v50)
      {
        if (v51) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_20BA1DD34();
        if (v55) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_20BA18200(result, v50);
      uint64_t v56 = sub_20BA16D9C(v46, v48);
      if ((v55 & 1) != (v57 & 1))
      {
        return sub_20BCE8060();
      }
      unint64_t v52 = v56;
      if (v55)
      {
LABEL_4:
        uint64_t v35 = (_OWORD *)(v28[7] + 32 * v52);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
        sub_20BA1FD80(v78, v35);
        goto LABEL_5;
      }
    }
    v28[(v52 >> 6) + 8] |= 1 << v52;
    uint64_t v58 = (uint64_t *)(v28[6] + 16 * v52);
    *uint64_t v58 = v46;
    v58[1] = v48;
    uint64_t result = (uint64_t)sub_20BA1FD80(v78, (_OWORD *)(v28[7] + 32 * v52));
    uint64_t v59 = v28[2];
    BOOL v60 = __OFADD__(v59, 1);
    uint64_t v61 = v59 + 1;
    if (v60) {
      goto LABEL_42;
    }
    _OWORD v28[2] = v61;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v32 = v45;
    __swift_destroy_boxed_opaque_existential_0(v45);
    uint64_t result = sub_20BA1FD90(v9, &qword_2676AF7B0);
  }
LABEL_35:
  unint64_t v62 = *(void **)(v67 + 656);
  swift_release();
  swift_bridgeObjectRelease();
  id v63 = objc_allocWithZone((Class)HFItemUpdateOutcome);
  sub_20BA15458((uint64_t)v28);
  swift_bridgeObjectRelease();
  uint64_t v64 = (void *)sub_20BCE7510();
  swift_bridgeObjectRelease();
  id v65 = objc_msgSend(v63, sel_initWithResults_, v64);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v66 = *(uint64_t (**)(id))(v67 + 8);
  return v66(v65);
}

id HFVacuumStatusItem.init(home:room:valueSource:)(void *a1, void *a2, uint64_t a3)
{
  id v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHome_room_valueSource_, a1, a2, a3);

  swift_unknownObjectRelease();
  return v5;
}

{
  id v5;
  objc_super v7;

  v7.super_class = (Class)HFVacuumStatusItem;
  id v5 = objc_msgSendSuper2(&v7, sel_initWithHome_room_valueSource_, a1, a2, a3);

  swift_unknownObjectRelease();
  return v5;
}

id _sSo18HFVacuumStatusItemC4HomeE16_subclass_update7optionsSo8NAFutureCySo19HFItemUpdateOutcomeCGSgSDys11AnyHashableVypGSg_tF_0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  id v5 = (char *)&v12 - v4;
  uint64_t v6 = sub_20BCE7870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F58190]), sel_init);
  objc_msgSend(v8, sel_setDescriptor_, 0);
  sub_20BA8E848((uint64_t)v5, (uint64_t)v3);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_2676AF870;
  v9[5] = v7;
  void v9[6] = v8;
  swift_retain();
  id v10 = v8;
  sub_20BA15820((uint64_t)v3, (uint64_t)&unk_2676ADD00, (uint64_t)v9);
  swift_release();
  swift_release();
  sub_20BA1FD90((uint64_t)v5, &qword_26AB2E3E0);
  return v10;
}

uint64_t type metadata accessor for HFVacuumStatusItem(uint64_t a1)
{
  return sub_20BA208F4(a1, &qword_2676AF860);
}

uint64_t sub_20BAB6088()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_20BAB60C0()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_20BA1FF3C;
  return sub_20BAB4B60(v0);
}

uint64_t sub_20BAB6150()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_20BAB6198(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id HFHomeEnergyManager.home.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home);
}

uint64_t HFHomeEnergyManager.geocoder.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20BA45B64(v1 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_geocoder, a1);
}

id HFHomeEnergyManager.__allocating_init(home:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A40]), sel_init);
  id v5 = objc_allocWithZone((Class)type metadata accessor for HFHomeEnergyManager());
  id v6 = sub_20BAC5C5C(a1, (uint64_t)v4, v5);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

id HFHomeEnergyManager.init(home:)(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A40]), sel_init);
  id v3 = objc_allocWithZone((Class)type metadata accessor for HFHomeEnergyManager());
  id v4 = sub_20BAC5C5C(a1, (uint64_t)v2, v3);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

id HFHomeEnergyManager.__allocating_init(home:geocoder:)(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1(a2, v5);
  id v8 = sub_20BAC6358(a1, v7, v2, v5, v6);

  __swift_destroy_boxed_opaque_existential_0(a2);
  return v8;
}

uint64_t type metadata accessor for HFHomeEnergyManager()
{
  return self;
}

id HFHomeEnergyManager.init(home:geocoder:)(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = __swift_mutable_project_boxed_opaque_existential_1(a2, v5);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  id v11 = sub_20BAC5FCC(a1, (uint64_t)v9, v2, v5, v6);

  __swift_destroy_boxed_opaque_existential_0(a2);
  return v11;
}

uint64_t sub_20BAB653C()
{
  uint64_t v1 = sub_20BCE7290();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20BAC3748();
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v5 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  uint64_t v6 = v0;
  uint64_t v7 = sub_20BCE7270();
  os_log_type_t v8 = sub_20BCE7AA0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v16 = v1;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v18 = v11;
    uint64_t v12 = &v6[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable];
    swift_beginAccess();
    LOBYTE(v17) = *v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E390);
    uint64_t v13 = sub_20BCE7640();
    uint64_t v17 = sub_20BA297F4(v13, v14, &v18);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_20B986000, v7, v8, "HFHomeEnergyManager-->didSet: isGridForecastAvailable: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v11, -1, -1);
    MEMORY[0x21053F820](v10, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v16);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_20BAB67BC()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_20BAB6804(char a1)
{
  return sub_20BAB7618(a1, &OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable, (uint64_t (*)(uint64_t))sub_20BAB653C);
}

uint64_t (*sub_20BAB6824(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_20BAB6884;
}

uint64_t sub_20BAB6884(uint64_t a1, char a2)
{
  return sub_20BAB76EC(a1, a2, (uint64_t (*)(uint64_t))sub_20BAB653C);
}

void *sub_20BAB68E8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_temporaryLocation);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_20BAB6998(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_temporaryLocation);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

void sub_20BAB69EC(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_temporaryLocation);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

uint64_t (*sub_20BAB6A50())()
{
  return j__swift_endAccess;
}

uint64_t sub_20BAB6AE0()
{
  if (objc_msgSend(self, sel_isInternalInstall)
    && (id v1 = objc_msgSend(self, sel_standardUserDefaults),
        unsigned __int8 v2 = objc_msgSend(v1, sel_BOOLForKey_, @"ForceShowHomeEnergyFeatures"),
        v1,
        (v2 & 1) != 0))
  {
    char v3 = 1;
  }
  else
  {
    id v4 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable);
    swift_beginAccess();
    int v5 = *v4;
    if (v5 == 2
      && (uint64_t v6 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable),
          swift_beginAccess(),
          int v5 = *v6,
          v5 == 2)
      || (v5 & 1) == 0)
    {
      char v3 = 0;
    }
    else
    {
      char v3 = sub_20BAB6C18();
    }
  }
  return v3 & 1;
}

uint64_t sub_20BAB6C18()
{
  uint64_t v1 = sub_20BCE65C0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v5 = objc_msgSend(self, sel_standardUserDefaults);
  id v6 = objc_msgSend(v5, sel_dictionaryForKey_, @"showHomeEnergy");

  if (v6)
  {
    uint64_t v7 = sub_20BCE7520();

    id v8 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home), sel_uniqueIdentifier);
    sub_20BCE6590();

    uint64_t v9 = sub_20BCE6560();
    uint64_t v11 = v10;
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
    if (*(void *)(v7 + 16) && (uint64_t v12 = sub_20BA16D9C(v9, v11), (v13 & 1) != 0))
    {
      sub_20BA200A0(*(void *)(v7 + 56) + 32 * v12, (uint64_t)&v16);
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v17 + 1))
    {
      if (swift_dynamicCast()) {
        return v15[15];
      }
    }
    else
    {
      sub_20BA1FD90((uint64_t)&v16, (uint64_t *)&unk_26AB2E690);
    }
  }
  return 1;
}

uint64_t sub_20BAB6E80(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_20BCE65C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = self;
  id v9 = objc_msgSend(v8, sel_standardUserDefaults);
  id v10 = objc_msgSend(v9, sel_dictionaryForKey_, @"showHomeEnergy");

  if (v10)
  {
    unint64_t v11 = sub_20BCE7520();
  }
  else
  {
    unint64_t v11 = sub_20BA120C0(MEMORY[0x263F8EE78]);
  }
  id v12 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home), sel_uniqueIdentifier);
  sub_20BCE6590();

  uint64_t v13 = sub_20BCE6560();
  v21[0] = v2;
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v24 = MEMORY[0x263F8D4F8];
  LOBYTE(v23) = a1 & 1;
  sub_20BA1FD80(&v23, v22);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21[1] = v11;
  sub_20BA1BFD8((uint64_t)v22, v13, v15, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v8, sel_standardUserDefaults);
  uint64_t v18 = (void *)sub_20BCE7510();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_setObject_forKey_, v18, @"showHomeEnergy");

  id v19 = objc_msgSend(self, sel_defaultCenter);
  if (qword_26AB2E5E0 != -1) {
    swift_once();
  }
  objc_msgSend(v19, sel_postNotificationName_object_, qword_26AB2E5D0, 0);

  return sub_20BAC3748();
}

uint64_t (*sub_20BAB716C(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = sub_20BAB6C18() & 1;
  return sub_20BAB71B8;
}

uint64_t sub_20BAB71B8(uint64_t a1)
{
  return sub_20BAB6E80(*(unsigned char *)(a1 + 8));
}

uint64_t sub_20BAB725C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable);
  swift_beginAccess();
  int v2 = *v1;
  if (v2 == 2)
  {
    uint64_t v3 = (unsigned char *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable);
    swift_beginAccess();
    LOBYTE(v2) = *v3;
  }
  return v2 & 1;
}

void sub_20BAB72D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_20BCE65C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  id v7 = objc_msgSend(v6, sel_standardUserDefaults);
  id v8 = objc_msgSend(v7, sel_dictionaryForKey_, @"homeEnergyAvailableCache");

  if (v8)
  {
    unint64_t v9 = sub_20BCE7520();
  }
  else
  {
    unint64_t v9 = sub_20BA120C0(MEMORY[0x263F8EE78]);
  }
  unint64_t v25 = v9;
  id v10 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home), sel_uniqueIdentifier);
  sub_20BCE6590();

  uint64_t v11 = sub_20BCE6560();
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v14 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable);
  swift_beginAccess();
  int v15 = *v14;
  if (v15 == 2)
  {
    sub_20BAAAC44(v11, v13, &v23);
    swift_bridgeObjectRelease();
    sub_20BA1FD90((uint64_t)&v23, (uint64_t *)&unk_26AB2E690);
  }
  else
  {
    uint64_t v24 = MEMORY[0x263F8D4F8];
    LOBYTE(v23) = v15 & 1;
    sub_20BA1FD80(&v23, v22);
    unint64_t v16 = v25;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v21 = v16;
    unint64_t v25 = 0x8000000000000000;
    sub_20BA1BFD8((uint64_t)v22, v11, v13, isUniquelyReferenced_nonNull_native);
    unint64_t v25 = v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  id v18 = objc_msgSend(v6, sel_standardUserDefaults);
  id v19 = (void *)sub_20BCE7510();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setObject_forKey_, v19, @"homeEnergyAvailableCache");
}

uint64_t sub_20BAB75B0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_20BAB75F8(char a1)
{
  return sub_20BAB7618(a1, &OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable, (uint64_t (*)(uint64_t))sub_20BAB72D4);
}

uint64_t sub_20BAB7618(char a1, void *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v6 = (unsigned char *)(v3 + *a2);
  uint64_t v7 = swift_beginAccess();
  *uint64_t v6 = a1;
  return a3(v7);
}

uint64_t (*sub_20BAB7674(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_20BAB76D4;
}

uint64_t sub_20BAB76D4(uint64_t a1, char a2)
{
  return sub_20BAB76EC(a1, a2, (uint64_t (*)(uint64_t))sub_20BAB72D4);
}

uint64_t sub_20BAB76EC(uint64_t a1, char a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return a3(result);
  }
  return result;
}

uint64_t sub_20BAB7730()
{
  v1[10] = v0;
  uint64_t v2 = sub_20BCE7290();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20BAB7800, 0, 0);
}

uint64_t sub_20BAB7800()
{
  int v15 = v0;
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  uint64_t v2 = sub_20BCE7270();
  os_log_type_t v3 = sub_20BCE7AA0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[14];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[12];
  if (v4)
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v14 = v9;
    *(_DWORD *)id v8 = 136315138;
    v0[9] = sub_20BA297F4(0xD000000000000023, 0x800000020BD15DF0, &v14);
    sub_20BCE7BC0();
    _os_log_impl(&dword_20B986000, v2, v3, "%s async call started", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v9, -1, -1);
    MEMORY[0x21053F820](v8, -1, -1);
  }

  id v10 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v10(v5, v6);
  v0[15] = v10;
  if (sub_20BAB8534())
  {
    uint64_t v11 = (void *)swift_task_alloc();
    v0[17] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_20BAB7CAC;
    return sub_20BAB9134();
  }
  else
  {
    uint64_t v13 = (void *)swift_task_alloc();
    v0[16] = v13;
    void *v13 = v0;
    v13[1] = sub_20BAB7A9C;
    return sub_20BABBF50();
  }
}

uint64_t sub_20BAB7A9C(char a1)
{
  *(unsigned char *)(*(void *)v1 + 156) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BAB7B9C, 0, 0);
}

uint64_t sub_20BAB7B9C()
{
  if (*(unsigned char *)(v0 + 156) == 1)
  {
    sub_20BAB8594(1);
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_20BAB7CAC;
    return sub_20BAB9134();
  }
  else
  {
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_20BAB7DEC;
    return sub_20BAC06E8();
  }
}

uint64_t sub_20BAB7CAC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 144) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_20BAB7DEC;
  return sub_20BAC06E8();
}

uint64_t sub_20BAB7DEC(char a1)
{
  *(unsigned char *)(*(void *)v1 + 157) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BAB7EEC, 0, 0);
}

uint64_t sub_20BAB7EEC()
{
  uint64_t v21 = v0;
  char v1 = *(unsigned char *)(v0 + 157);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = (unsigned char *)(v2 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable);
  swift_beginAccess();
  *uint64_t v3 = v1;
  sub_20BAB653C();
  uint64_t v4 = (unsigned char *)(v2 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable);
  swift_beginAccess();
  *uint64_t v4 = v1;
  sub_20BAB72D4();
  id v5 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  uint64_t v6 = sub_20BCE7270();
  os_log_type_t v7 = sub_20BCE7AA0();
  if (os_log_type_enabled(v6, v7))
  {
    int v8 = *(unsigned __int8 *)(v0 + 157);
    id v19 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
    uint64_t v9 = *(void *)(v0 + 104);
    uint64_t v10 = *(void *)(v0 + 88);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v12;
    *(_DWORD *)uint64_t v11 = 136315394;
    *(void *)(v0 + 64) = sub_20BA297F4(0xD000000000000023, 0x800000020BD15DF0, &v20);
    sub_20BCE7BC0();
    *(_WORD *)(v11 + 12) = 1024;
    *(_DWORD *)(v0 + 152) = v8;
    sub_20BCE7BC0();
    _os_log_impl(&dword_20B986000, v6, v7, "%s async call finished: %{BOOL}d", (uint8_t *)v11, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v12, -1, -1);
    MEMORY[0x21053F820](v11, -1, -1);

    v19(v9, v10);
  }
  else
  {
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
    uint64_t v14 = *(void *)(v0 + 104);
    uint64_t v15 = *(void *)(v0 + 88);

    v13(v14, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v17 = *(unsigned __int8 *)(v0 + 157);
  return v16(v17);
}

uint64_t sub_20BAB82C8(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_20BAB8370;
  return sub_20BAB7730();
}

uint64_t sub_20BAB8370(char a1)
{
  uint64_t v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  os_log_type_t v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  uint64_t v9 = *(void *)(v5 + 24);
  if (v3)
  {
    uint64_t v10 = (void *)sub_20BCE6430();

    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, a1 & 1, 0);
  }
  _Block_release(*(const void **)(v6 + 24));
  uint64_t v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

uint64_t sub_20BAB8534()
{
  return sub_20BAB89CC();
}

void sub_20BAB8594(char a1)
{
  uint64_t v3 = sub_20BCE65C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    os_log_type_t v7 = self;
    id v8 = objc_msgSend(v7, sel_standardUserDefaults);
    uint64_t v9 = (void *)sub_20BCE75E0();
    id v10 = objc_msgSend(v8, sel_dictionaryForKey_, v9);

    if (v10)
    {
      unint64_t v11 = sub_20BCE7520();
    }
    else
    {
      unint64_t v11 = sub_20BA120C0(MEMORY[0x263F8EE78]);
    }
    id v12 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home), sel_uniqueIdentifier);
    sub_20BCE6590();

    uint64_t v13 = sub_20BCE6560();
    uint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    uint64_t v23 = MEMORY[0x263F8D4F8];
    LOBYTE(v22) = 1;
    sub_20BA1FD80(&v22, v21);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20[1] = v11;
    sub_20BA1BFD8((uint64_t)v21, v13, v15, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v17 = objc_msgSend(v7, sel_standardUserDefaults);
    id v18 = (void *)sub_20BCE7510();
    swift_bridgeObjectRelease();
    id v19 = (void *)sub_20BCE75E0();
    objc_msgSend(v17, sel_setObject_forKey_, v18, v19);
  }
}

void (*sub_20BAB883C(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = sub_20BAB8534() & 1;
  return sub_20BAB8888;
}

void sub_20BAB8888(uint64_t a1)
{
}

uint64_t sub_20BAB88F8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_20BAB89C0()
{
  return sub_20BAB89CC();
}

uint64_t sub_20BAB89CC()
{
  uint64_t v1 = sub_20BCE65C0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v5 = objc_msgSend(self, sel_standardUserDefaults);
  uint64_t v6 = (void *)sub_20BCE75E0();
  id v7 = objc_msgSend(v5, sel_dictionaryForKey_, v6);

  if (v7)
  {
    uint64_t v8 = sub_20BCE7520();

    id v9 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home), sel_uniqueIdentifier);
    sub_20BCE6590();

    uint64_t v10 = sub_20BCE6560();
    uint64_t v12 = v11;
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
    if (*(void *)(v8 + 16) && (uint64_t v13 = sub_20BA16D9C(v10, v12), (v14 & 1) != 0))
    {
      sub_20BA200A0(*(void *)(v8 + 56) + 32 * v13, (uint64_t)&v17);
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((void *)&v18 + 1))
    {
      if (swift_dynamicCast()) {
        return v16[15];
      }
    }
    else
    {
      sub_20BA1FD90((uint64_t)&v17, (uint64_t *)&unk_26AB2E690);
    }
  }
  return 0;
}

uint64_t sub_20BAB8BF8(char a1)
{
  *(void *)(v2 + 80) = v1;
  *(unsigned char *)(v2 + 120) = a1;
  uint64_t v3 = sub_20BCE65C0();
  *(void *)(v2 + 88) = v3;
  *(void *)(v2 + 96) = *(void *)(v3 - 8);
  *(void *)(v2 + 104) = swift_task_alloc();
  sub_20BCE7850();
  *(void *)(v2 + 112) = sub_20BCE7840();
  uint64_t v5 = sub_20BCE77E0();
  return MEMORY[0x270FA2498](sub_20BAB8CF0, v5, v4);
}

uint64_t sub_20BAB8CF0()
{
  int v1 = *(unsigned __int8 *)(v0 + 120);
  swift_release();
  if (v1 != (sub_20BAB89C0() & 1))
  {
    uint64_t v2 = self;
    id v3 = objc_msgSend(v2, sel_standardUserDefaults);
    uint64_t v4 = (void *)sub_20BCE75E0();
    id v5 = objc_msgSend(v3, sel_dictionaryForKey_, v4);

    if (v5)
    {
      sub_20BCE7520();
    }
    else
    {
      sub_20BA120C0(MEMORY[0x263F8EE78]);
    }
    uint64_t v6 = *(void *)(v0 + 96);
    uint64_t v7 = *(void *)(v0 + 104);
    uint64_t v8 = *(void *)(v0 + 88);
    char v9 = *(unsigned char *)(v0 + 120);
    id v10 = objc_msgSend(*(id *)(*(void *)(v0 + 80) + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home), sel_uniqueIdentifier);
    sub_20BCE6590();

    uint64_t v11 = sub_20BCE6560();
    uint64_t v13 = v12;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
    *(void *)(v0 + 40) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(v0 + 16) = v9;
    sub_20BA1FD80((_OWORD *)(v0 + 16), (_OWORD *)(v0 + 48));
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_20BA1BFD8(v0 + 48, v11, v13, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v15 = objc_msgSend(v2, sel_standardUserDefaults);
    uint64_t v16 = (void *)sub_20BCE7510();
    swift_bridgeObjectRelease();
    long long v17 = (void *)sub_20BCE75E0();
    objc_msgSend(v15, sel_setObject_forKey_, v16, v17);

    id v18 = objc_msgSend(self, sel_defaultCenter);
    if (qword_26AB2E5F8 != -1) {
      swift_once();
    }
    objc_msgSend(v18, sel_postNotificationName_object_, qword_26AB2E5E8, 0);

    sub_20BAC3748();
  }
  swift_task_dealloc();
  id v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_20BAB9030()
{
  if (objc_msgSend(self, sel_isInternalInstall))
  {
    id v1 = objc_msgSend(self, sel_standardUserDefaults);
    unsigned __int8 v2 = objc_msgSend(v1, sel_BOOLForKey_, @"ForceShowHomeEnergyFeatures");

    if (v2) {
      goto LABEL_7;
    }
  }
  if (((id v3 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable),
         swift_beginAccess(),
         int v4 = *v3,
         v4 != 2)
     || (id v5 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable),
         swift_beginAccess(),
         int v4 = *v5,
         v4 != 2))
    && (v4 & 1) != 0
    && (sub_20BAB6C18() & 1) != 0)
  {
LABEL_7:
    char v6 = 1;
  }
  else
  {
    char v6 = sub_20BAB89C0();
  }
  return v6 & 1;
}

uint64_t sub_20BAB9134()
{
  v1[29] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E5C0);
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  uint64_t v2 = sub_20BCE7290();
  v1[32] = v2;
  v1[33] = *(void *)(v2 - 8);
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  uint64_t v3 = sub_20BCE65C0();
  v1[41] = v3;
  v1[42] = *(void *)(v3 - 8);
  v1[43] = swift_task_alloc();
  v1[44] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20BAB92EC, 0, 0);
}

uint64_t sub_20BAB92EC()
{
  uint64_t v1 = v0[44];
  uint64_t v2 = v0[41];
  uint64_t v3 = v0[42];
  int v4 = *(void **)(v0[29] + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home);
  v0[45] = v4;
  id v5 = objc_msgSend(v4, sel_name);
  uint64_t v6 = sub_20BCE7620();
  uint64_t v8 = v7;

  v0[46] = v6;
  v0[47] = v8;
  id v9 = objc_msgSend(v4, sel_uniqueIdentifier);
  sub_20BCE6590();

  uint64_t v10 = sub_20BCE6560();
  uint64_t v12 = v11;
  v0[48] = v10;
  v0[49] = v11;
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[50] = v13;
  v0[51] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v1, v2);
  v0[52] = sub_20BCE74F0();
  swift_bridgeObjectRetain();
  char v14 = (void *)swift_task_alloc();
  v0[53] = v14;
  *char v14 = v0;
  v14[1] = sub_20BAB9460;
  return MEMORY[0x270F27008](v10, v12);
}

uint64_t sub_20BAB9460(uint64_t a1)
{
  *(void *)(*(void *)v1 + 432) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BAB9560, 0, 0);
}

uint64_t sub_20BAB9560()
{
  uint64_t v32 = v0;
  if (*(void *)(v0 + 432))
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 480) = *(void *)(v0 + 432);
    uint64_t v1 = (unsigned char *)(*(void *)(v0 + 232) + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite);
    swift_beginAccess();
    *uint64_t v1 = 1;
    swift_retain();
    sub_20BCE74B0();
    uint64_t v3 = v2;
    if (v2) {
      swift_bridgeObjectRelease();
    }
    int v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 488) = v4;
    *int v4 = v0;
    v4[1] = sub_20BABA114;
    return sub_20BAB8BF8(v3 != 0);
  }
  else if (objc_msgSend(*(id *)(v0 + 360), sel_hf_currentUserIsOwner))
  {
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 440) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_20BAB99B4;
    uint64_t v7 = *(void *)(v0 + 384);
    uint64_t v8 = *(void *)(v0 + 392);
    uint64_t v10 = *(void *)(v0 + 368);
    uint64_t v9 = *(void *)(v0 + 376);
    return MEMORY[0x270F26F60](v10, v9, v7, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_20BCE7430();
    uint64_t v13 = v12;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 456) = v13;
    if (qword_26AB2E398 != -1) {
      swift_once();
    }
    id v14 = (id)qword_26AB2FF58;
    sub_20BCE72A0();
    id v15 = sub_20BCE7270();
    os_log_type_t v16 = sub_20BCE7A70();
    BOOL v17 = os_log_type_enabled(v15, v16);
    uint64_t v18 = *(void *)(v0 + 312);
    uint64_t v19 = *(void *)(v0 + 256);
    uint64_t v20 = *(void *)(v0 + 264);
    if (v17)
    {
      uint64_t v28 = *(void *)(v0 + 312);
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = v13;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v22 = v31;
      *(_DWORD *)uint64_t v21 = 136315138;
      *(void *)(v0 + 208) = sub_20BA297F4(0xD000000000000011, 0x800000020BD16480, &v31);
      sub_20BCE7BC0();
      _os_log_impl(&dword_20B986000, v15, v16, "%s Attempting to request to be added to EnergyKit share if needed", v21, 0xCu);
      swift_arrayDestroy();
      uint64_t v23 = v22;
      uint64_t v13 = v29;
      MEMORY[0x21053F820](v23, -1, -1);
      MEMORY[0x21053F820](v21, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v28, v19);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    }
    uint64_t v24 = *(void **)(v0 + 360);
    sub_20BCE7410();
    *(void *)(v0 + 464) = sub_20BCE7400();
    id v25 = objc_msgSend(v24, sel_uniqueIdentifier);
    sub_20BCE6590();

    uint64_t v30 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((int)*MEMORY[0x263F3B560] + MEMORY[0x263F3B560]);
    char v26 = (void *)swift_task_alloc();
    *(void *)(v0 + 472) = v26;
    *char v26 = v0;
    v26[1] = sub_20BAB9E88;
    uint64_t v27 = *(void *)(v0 + 344);
    return v30(v27, v11, v13);
  }
}

uint64_t sub_20BAB99B4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 448) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_20BAB9AD4, 0, 0);
}

uint64_t sub_20BAB9AD4()
{
  uint64_t v23 = v0;
  uint64_t v1 = v0[56];
  if (v1)
  {
    v0[60] = v1;
    uint64_t v2 = (unsigned char *)(v0[29] + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite);
    swift_beginAccess();
    *uint64_t v2 = 1;
    swift_retain();
    sub_20BCE74B0();
    uint64_t v4 = v3;
    if (v3) {
      swift_bridgeObjectRelease();
    }
    id v5 = (void *)swift_task_alloc();
    v0[61] = v5;
    void *v5 = v0;
    v5[1] = sub_20BABA114;
    return sub_20BAB8BF8(v4 != 0);
  }
  else
  {
    if (qword_26AB2E398 != -1) {
      swift_once();
    }
    id v7 = (id)qword_26AB2FF58;
    sub_20BCE72A0();
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_20BCE7270();
    os_log_type_t v9 = sub_20BCE7A90();
    BOOL v10 = os_log_type_enabled(v8, v9);
    unint64_t v11 = v0[47];
    if (v10)
    {
      uint64_t v21 = v0[40];
      uint64_t v12 = v0[33];
      uint64_t v19 = v0[46];
      uint64_t v20 = v0[32];
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v22 = v14;
      *(_DWORD *)uint64_t v13 = 136315394;
      v0[27] = sub_20BA297F4(0xD000000000000011, 0x800000020BD16480, &v22);
      sub_20BCE7BC0();
      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[28] = sub_20BA297F4(v19, v11, &v22);
      sub_20BCE7BC0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20B986000, v8, v9, "%s Failed to create site for home %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21053F820](v14, -1, -1);
      MEMORY[0x21053F820](v13, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v21, v20);
    }
    else
    {
      uint64_t v15 = v0[40];
      uint64_t v16 = v0[32];
      uint64_t v17 = v0[33];

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
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
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
}

uint64_t sub_20BAB9E88()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v3 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v4 = (void (*)(uint64_t, uint64_t))v2[50];
  uint64_t v5 = v2[43];
  uint64_t v6 = v2[41];
  if (v0)
  {
    swift_release();
    swift_bridgeObjectRelease();

    v4(v5, v6);
    return MEMORY[0x270FA2498](sub_20BABB378, 0, 0);
  }
  else
  {
    v4(v5, v6);
    swift_release();
    swift_bridgeObjectRelease();
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
    id v7 = (uint64_t (*)(void))v3[1];
    return v7();
  }
}

uint64_t sub_20BABA114()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BABA210, 0, 0);
}

uint64_t sub_20BABA210()
{
  uint64_t v35 = v0;
  if (!objc_msgSend(*(id *)(v0 + 360), sel_hf_currentUserIsOwner)) {
    goto LABEL_7;
  }
  uint64_t v1 = *(void **)(v0 + 360);
  swift_bridgeObjectRetain();
  sub_20BCE74C0();
  id v2 = objc_msgSend(v1, sel_location);
  *(void *)(v0 + 496) = v2;
  if (v2)
  {
    id v3 = v2;
    swift_bridgeObjectRelease();
    if (qword_26AB2E398 != -1) {
      swift_once();
    }
    id v4 = (id)qword_26AB2FF58;
    sub_20BCE72A0();
    uint64_t v5 = sub_20BCE7270();
    os_log_type_t v6 = sub_20BCE7A80();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = *(void *)(v0 + 304);
    uint64_t v10 = *(void *)(v0 + 256);
    uint64_t v9 = *(void *)(v0 + 264);
    if (v7)
    {
      uint64_t v31 = *(void *)(v0 + 304);
      unint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v34 = v12;
      *(_DWORD *)unint64_t v11 = 136315138;
      *(void *)(v0 + 200) = sub_20BA297F4(0xD000000000000011, 0x800000020BD16480, &v34);
      sub_20BCE7BC0();
      _os_log_impl(&dword_20B986000, v5, v6, "%s Updating site's location", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21053F820](v12, -1, -1);
      MEMORY[0x21053F820](v11, -1, -1);

      uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      v13(v31, v10);
    }
    else
    {

      uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      v13(v8, v10);
    }
    *(void *)(v0 + 504) = v13;
    uint64_t v33 = (uint64_t (*)(id))((int)*MEMORY[0x263F3B5E8] + MEMORY[0x263F3B5E8]);
    id v25 = (void *)swift_task_alloc();
    *(void *)(v0 + 512) = v25;
    *id v25 = v0;
    v25[1] = sub_20BABA7B0;
    return v33(v3);
  }
  uint64_t v16 = (void *)sub_20BCE74D0();

  if (v16)
  {
    if (qword_26AB2E398 != -1) {
      swift_once();
    }
    id v17 = (id)qword_26AB2FF58;
    sub_20BCE72A0();
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_20BCE7270();
    os_log_type_t v19 = sub_20BCE7A90();
    BOOL v20 = os_log_type_enabled(v18, v19);
    unint64_t v21 = *(void *)(v0 + 376);
    if (v20)
    {
      uint64_t v29 = *(void *)(v0 + 368);
      uint64_t v22 = *(void *)(v0 + 264);
      uint64_t v30 = *(void *)(v0 + 256);
      uint64_t v32 = *(void *)(v0 + 280);
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v34 = v24;
      *(_DWORD *)uint64_t v23 = 136315394;
      *(void *)(v0 + 168) = sub_20BA297F4(0xD000000000000011, 0x800000020BD16480, &v34);
      sub_20BCE7BC0();
      *(_WORD *)(v23 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 176) = sub_20BA297F4(v29, v21, &v34);
      sub_20BCE7BC0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20B986000, v18, v19, "%s have site.location BUT home.location is nil for home %s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21053F820](v24, -1, -1);
      MEMORY[0x21053F820](v23, -1, -1);
      swift_release_n();

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v32, v30);
    }
    else
    {
      uint64_t v26 = *(void *)(v0 + 280);
      uint64_t v28 = *(void *)(v0 + 256);
      uint64_t v27 = *(void *)(v0 + 264);
      swift_bridgeObjectRelease_n();

      swift_release_n();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    }
  }
  else
  {
LABEL_7:
    swift_bridgeObjectRelease();
    swift_release_n();
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
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_20BABA7B0()
{
  *(void *)(*(void *)v1 + 520) = v0;
  swift_task_dealloc();
  if (v0) {
    id v2 = sub_20BABB460;
  }
  else {
    id v2 = sub_20BABA8C4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_20BABA8C4()
{
  id v17 = v0;
  id v1 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  id v2 = sub_20BCE7270();
  os_log_type_t v3 = sub_20BCE7A80();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[63];
    uint64_t v4 = v0[37];
    uint64_t v5 = v0[32];
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v16 = v7;
    *(_DWORD *)os_log_type_t v6 = 136315138;
    v0[24] = sub_20BA297F4(0xD000000000000011, 0x800000020BD16480, &v16);
    sub_20BCE7BC0();
    _os_log_impl(&dword_20B986000, v2, v3, "%s Updating site's timezone", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v7, -1, -1);
    MEMORY[0x21053F820](v6, -1, -1);

    v15(v4, v5);
  }
  else
  {
    uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[63];
    uint64_t v9 = v0[37];
    uint64_t v10 = v0[32];

    v8(v9, v10);
  }
  uint64_t v11 = v0[62];
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A40]), sel_init);
  v0[66] = v12;
  v0[2] = v0;
  v0[7] = v0 + 20;
  v0[3] = sub_20BABAB64;
  uint64_t v13 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_20BABBE74;
  v0[13] = &block_descriptor_176;
  v0[14] = v13;
  objc_msgSend(v12, sel_reverseGeocodeLocation_completionHandler_, v11, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_20BABAB64()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 536) = v1;
  if (v1) {
    id v2 = sub_20BABB7B4;
  }
  else {
    id v2 = sub_20BABAC74;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_20BABAC74()
{
  uint64_t v30 = v0;
  unint64_t v1 = *(void *)(v0 + 160);

  if (!(v1 >> 62))
  {
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_20BCE7F20();
  swift_bridgeObjectRelease();
  if (!v14) {
    goto LABEL_15;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)MEMORY[0x21053E270](0, v1);
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v2 = *(id *)(v1 + 32);
  }
  os_log_type_t v3 = v2;
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v3, sel_timeZone);

  uint64_t v5 = *(void *)(v0 + 240);
  if (v4)
  {
    sub_20BCE66A0();

    uint64_t v6 = sub_20BCE66B0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  }
  else
  {
    uint64_t v6 = sub_20BCE66B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  }
  uint64_t v7 = *(void *)(v0 + 248);
  sub_20BAC82D0(*(void *)(v0 + 240), v7);
  sub_20BCE66B0();
  uint64_t v8 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v7, 1, v6) == 1)
  {
    sub_20BA1FD90(*(void *)(v0 + 248), &qword_26AB2E5C0);
LABEL_16:
    id v15 = (id)qword_26AB2FF58;
    sub_20BCE72A0();
    uint64_t v16 = sub_20BCE7270();
    os_log_type_t v17 = sub_20BCE7A90();
    BOOL v18 = os_log_type_enabled(v16, v17);
    BOOL v20 = *(void **)(v0 + 496);
    os_log_type_t v19 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
    uint64_t v21 = *(void *)(v0 + 288);
    uint64_t v22 = *(void *)(v0 + 256);
    if (v18)
    {
      uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
      uint64_t v26 = *(void *)(v0 + 288);
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v29 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      *(void *)(v0 + 184) = sub_20BA297F4(0xD000000000000011, 0x800000020BD16480, &v29);
      sub_20BCE7BC0();
      _os_log_impl(&dword_20B986000, v16, v17, "%s Unable to get timezone", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21053F820](v24, -1, -1);
      MEMORY[0x21053F820](v23, -1, -1);

      swift_release_n();
      v27(v26, v22);
    }
    else
    {

      swift_release_n();
      v19(v21, v22);
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
    id v25 = *(void (**)(void))(v0 + 8);
    v25();
    return;
  }
  uint64_t v9 = *(void *)(v0 + 248);
  uint64_t v10 = sub_20BCE6680();
  uint64_t v12 = v11;
  *(void *)(v0 + 544) = v11;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v6);
  uint64_t v28 = (void (*)(uint64_t, uint64_t))((int)*MEMORY[0x263F3B5F0] + MEMORY[0x263F3B5F0]);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 552) = v13;
  void *v13 = v0;
  v13[1] = sub_20BABB15C;
  v28(v10, v12);
}

uint64_t sub_20BABB15C()
{
  *(void *)(*(void *)v1 + 560) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_20BABBB18;
  }
  else
  {
    swift_bridgeObjectRelease();
    id v2 = sub_20BABB278;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_20BABB278()
{
  swift_release_n();
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_20BABB378()
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_20BABB460()
{
  uint64_t v24 = v0;
  uint64_t v1 = v0;
  id v2 = (void *)v0[65];
  id v3 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  id v4 = v2;
  id v5 = v2;
  uint64_t v6 = sub_20BCE7270();
  os_log_type_t v7 = sub_20BCE7A90();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v19 = (void *)v0[62];
    uint64_t v21 = v0[34];
    uint64_t v22 = (void (*)(uint64_t, uint64_t))v0[63];
    uint64_t v20 = v0[32];
    log = v6;
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v23 = v10;
    *(_DWORD *)uint64_t v8 = 136315394;
    v0[18] = sub_20BA297F4(0xD000000000000011, 0x800000020BD16480, &v23);
    sub_20BCE7BC0();
    *(_WORD *)(v8 + 12) = 2112;
    id v11 = v2;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[19] = v12;
    sub_20BCE7BC0();
    *uint64_t v9 = v12;

    _os_log_impl(&dword_20B986000, log, v7, "%s Unable to update location. Error: %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676AE2D0);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v10, -1, -1);
    MEMORY[0x21053F820](v8, -1, -1);

    swift_release();
    swift_release();
    v22(v21, v20);
  }
  else
  {
    uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[63];
    uint64_t v14 = v0[34];
    uint64_t v15 = v1[32];

    swift_release_n();
    v13(v14, v15);
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
  uint64_t v16 = (uint64_t (*)(void))v1[1];
  return v16();
}

uint64_t sub_20BABB7B4()
{
  uint64_t v24 = v0;
  uint64_t v1 = *(void **)(v0 + 528);
  swift_willThrow();

  id v2 = *(void **)(v0 + 536);
  id v3 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  id v4 = v2;
  id v5 = v2;
  uint64_t v6 = sub_20BCE7270();
  os_log_type_t v7 = sub_20BCE7A90();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v19 = *(void **)(v0 + 496);
    uint64_t v21 = *(void *)(v0 + 272);
    uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
    uint64_t v20 = *(void *)(v0 + 256);
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    log = v6;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v23 = v10;
    *(_DWORD *)uint64_t v8 = 136315394;
    *(void *)(v0 + 144) = sub_20BA297F4(0xD000000000000011, 0x800000020BD16480, &v23);
    sub_20BCE7BC0();
    *(_WORD *)(v8 + 12) = 2112;
    id v11 = v2;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 152) = v12;
    sub_20BCE7BC0();
    *uint64_t v9 = v12;

    _os_log_impl(&dword_20B986000, log, v7, "%s Unable to update location. Error: %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676AE2D0);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v10, -1, -1);
    MEMORY[0x21053F820](v8, -1, -1);

    swift_release();
    swift_release();
    v22(v21, v20);
  }
  else
  {
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
    uint64_t v14 = *(void *)(v0 + 272);
    uint64_t v15 = *(void *)(v0 + 256);

    swift_release_n();
    v13(v14, v15);
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
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_20BABBB18()
{
  uint64_t v24 = v0;
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  id v2 = (void *)v0[70];
  id v3 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  id v4 = v2;
  id v5 = v2;
  uint64_t v6 = sub_20BCE7270();
  os_log_type_t v7 = sub_20BCE7A90();
  if (os_log_type_enabled(v6, v7))
  {
    os_log_type_t v19 = (void *)v0[62];
    uint64_t v21 = v0[34];
    uint64_t v22 = (void (*)(uint64_t, uint64_t))v0[63];
    uint64_t v20 = v0[32];
    log = v6;
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v23 = v10;
    *(_DWORD *)uint64_t v8 = 136315394;
    v0[18] = sub_20BA297F4(0xD000000000000011, 0x800000020BD16480, &v23);
    sub_20BCE7BC0();
    *(_WORD *)(v8 + 12) = 2112;
    id v11 = v2;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    v0[19] = v12;
    sub_20BCE7BC0();
    *uint64_t v9 = v12;

    _os_log_impl(&dword_20B986000, log, v7, "%s Unable to update location. Error: %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676AE2D0);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v10, -1, -1);
    MEMORY[0x21053F820](v8, -1, -1);

    swift_release();
    swift_release();
    v22(v21, v20);
  }
  else
  {
    uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[63];
    uint64_t v14 = v0[34];
    uint64_t v15 = v1[32];

    swift_release_n();
    v13(v14, v15);
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
  uint64_t v16 = (uint64_t (*)(void))v1[1];
  return v16();
}

uint64_t sub_20BABBE74(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB2E6A0);
    swift_allocError();
    void *v5 = a3;
    id v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    sub_20BA208F4(0, &qword_2676AFA90);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_20BCE7710();
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_20BABBF50()
{
  uint64_t v1 = sub_20BCE7290();
  *(void *)(v0 + 80) = v1;
  *(void *)(v0 + 88) = *(void *)(v1 - 8);
  *(void *)(v0 + 96) = swift_task_alloc();
  *(void *)(v0 + 104) = swift_task_alloc();
  *(unsigned char *)(v0 + 172) = 0;
  id v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v2;
  *id v2 = v0;
  v2[1] = sub_20BABC04C;
  return sub_20BAC0EF4();
}

uint64_t sub_20BABC04C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 120) = a1;
  *(void *)(v3 + 128) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BABC14C, 0, 0);
}

uint64_t sub_20BABC14C()
{
  sub_20BCE7230();
  uint64_t v1 = sub_20BCE7200();
  v0[17] = v1;
  id v2 = (void *)swift_task_alloc();
  v0[18] = v2;
  *id v2 = v0;
  v2[1] = sub_20BABC200;
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  return MEMORY[0x270F3C700](v4, v3, v1);
}

uint64_t sub_20BABC200(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 152) = a1;
  *(void *)(v3 + 160) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_20BABC658;
  }
  else
  {

    uint64_t v4 = sub_20BABC31C;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_20BABC31C()
{
  uint64_t v22 = v0;
  unint64_t v1 = *(void *)(v0 + 152);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_20BCE7F20();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  *(unsigned char *)(v0 + 172) = v2 != 0;
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v3 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  int v4 = *(unsigned __int8 *)(v0 + 172);
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_20BCE7270();
  os_log_type_t v6 = sub_20BCE7AA0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = *(void *)(v0 + 128);
  if (v7)
  {
    uint64_t v17 = *(void *)(v0 + 120);
    uint64_t v18 = *(void *)(v0 + 88);
    uint64_t v19 = *(void *)(v0 + 80);
    uint64_t v20 = *(void *)(v0 + 104);
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v21 = v10;
    *(_DWORD *)uint64_t v9 = 136315650;
    *(void *)(v0 + 48) = sub_20BA297F4(0xD000000000000028, 0x800000020BD15E20, &v21);
    sub_20BCE7BC0();
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 56) = sub_20BA297F4(v17, v8, &v21);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 22) = 1024;
    *(_DWORD *)(v0 + 168) = v4;
    sub_20BCE7BC0();
    _os_log_impl(&dword_20B986000, v5, v6, "%s %s returning %{BOOL}d", (uint8_t *)v9, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v10, -1, -1);
    MEMORY[0x21053F820](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 104);
    uint64_t v12 = *(void *)(v0 + 80);
    uint64_t v13 = *(void *)(v0 + 88);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  swift_beginAccess();
  uint64_t v14 = *(unsigned __int8 *)(v0 + 172);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v15(v14);
}

uint64_t sub_20BABC658()
{
  uint64_t v42 = v0;

  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  unint64_t v1 = *(void **)(v0 + 160);
  id v2 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  swift_bridgeObjectRetain();
  id v3 = v1;
  swift_bridgeObjectRetain();
  id v4 = v1;
  uint64_t v5 = sub_20BCE7270();
  os_log_type_t v6 = sub_20BCE7A90();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = *(void **)(v0 + 160);
  unint64_t v9 = *(void *)(v0 + 128);
  if (v7)
  {
    uint64_t v32 = *(void *)(v0 + 120);
    uint64_t v38 = *(void *)(v0 + 96);
    uint64_t v40 = *(void *)(v0 + 80);
    uint64_t v36 = *(void *)(v0 + 88);
    uint64_t v10 = swift_slowAlloc();
    uint64_t v33 = (void *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v41 = v35;
    *(_DWORD *)uint64_t v10 = 136315650;
    *(void *)(v0 + 72) = sub_20BA297F4(0xD000000000000028, 0x800000020BD15E20, &v41);
    sub_20BCE7BC0();
    *(_WORD *)(v10 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 64) = sub_20BA297F4(v32, v9, &v41);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 22) = 2112;
    id v11 = v8;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v12;
    sub_20BCE7BC0();
    *uint64_t v33 = v12;

    _os_log_impl(&dword_20B986000, v5, v6, "%s %s error: %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676AE2D0);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v33, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v35, -1, -1);
    MEMORY[0x21053F820](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v38, v40);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 88);
    uint64_t v13 = *(void *)(v0 + 96);
    uint64_t v15 = *(void *)(v0 + 80);

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v16 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  int v17 = *(unsigned __int8 *)(v0 + 172);
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_20BCE7270();
  os_log_type_t v19 = sub_20BCE7AA0();
  BOOL v20 = os_log_type_enabled(v18, v19);
  unint64_t v21 = *(void *)(v0 + 128);
  if (v20)
  {
    uint64_t v22 = *(void *)(v0 + 120);
    uint64_t v39 = *(void *)(v0 + 104);
    uint64_t v23 = *(void *)(v0 + 88);
    uint64_t v37 = *(void *)(v0 + 80);
    int v34 = v17;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v41 = v25;
    *(_DWORD *)uint64_t v24 = 136315650;
    *(void *)(v0 + 48) = sub_20BA297F4(0xD000000000000028, 0x800000020BD15E20, &v41);
    sub_20BCE7BC0();
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 56) = sub_20BA297F4(v22, v21, &v41);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 22) = 1024;
    *(_DWORD *)(v0 + 168) = v34;
    sub_20BCE7BC0();
    _os_log_impl(&dword_20B986000, v18, v19, "%s %s returning %{BOOL}d", (uint8_t *)v24, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v25, -1, -1);
    MEMORY[0x21053F820](v24, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v39, v37);
  }
  else
  {
    uint64_t v26 = *(void *)(v0 + 104);
    uint64_t v27 = *(void *)(v0 + 80);
    uint64_t v28 = *(void *)(v0 + 88);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
  }
  swift_beginAccess();
  uint64_t v29 = *(unsigned __int8 *)(v0 + 172);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v30 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v30(v29);
}

uint64_t sub_20BABCD78(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  id v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *id v4 = v2;
  v4[1] = sub_20BAC8470;
  return sub_20BABBF50();
}

uint64_t sub_20BABCE20()
{
  v1[160] = v0;
  uint64_t v2 = sub_20BCE7290();
  v1[161] = v2;
  v1[162] = *(void *)(v2 - 8);
  v1[163] = swift_task_alloc();
  uint64_t v3 = sub_20BCE65C0();
  v1[164] = v3;
  v1[165] = *(void *)(v3 - 8);
  v1[166] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20BABCF3C, 0, 0);
}

uint64_t sub_20BABCF3C()
{
  uint64_t v1 = *(void *)(v0 + 1328);
  uint64_t v2 = *(void *)(v0 + 1320);
  uint64_t v3 = *(void *)(v0 + 1312);
  uint64_t v4 = *(void *)(v0 + 1280);
  unint64_t v5 = sub_20BA12F98(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 1336) = v5;
  *(void *)(v0 + 1272) = v5;
  *(unsigned char *)(v0 + 1424) = sub_20BAB8534() & 1;
  sub_20BCE74F0();
  id v6 = objc_msgSend(*(id *)(v4 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home), sel_uniqueIdentifier);
  sub_20BCE6590();

  uint64_t v7 = sub_20BCE6560();
  uint64_t v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 1344) = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_20BABD07C;
  return MEMORY[0x270F27008](v7, v9);
}

uint64_t sub_20BABD07C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 1352) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BABD17C, 0, 0);
}

uint64_t sub_20BABD17C()
{
  uint64_t v39 = v0;
  if (*(void *)(v0 + 1352))
  {
    uint64_t v1 = *(void *)(v0 + 1336);
    *(void *)(v0 + 240) = sub_20BCE7440();
    uint64_t v2 = MEMORY[0x263F8D310];
    *(void *)(v0 + 264) = MEMORY[0x263F8D310];
    *(void *)(v0 + 248) = v3;
    sub_20BA1FD80((_OWORD *)(v0 + 240), (_OWORD *)(v0 + 272));
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_20BA1D30C(v0 + 272, 0x444965746973, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    uint64_t v5 = v1;
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_20BCE7470();
    uint64_t v8 = v7;
    *(void *)(v0 + 328) = v2;
    *(void *)(v0 + 304) = v6;
    *(void *)(v0 + 312) = v7;
    sub_20BA1FD80((_OWORD *)(v0 + 304), (_OWORD *)(v0 + 336));
    swift_bridgeObjectRetain();
    char v9 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v38 = v5;
    sub_20BA1D30C(v0 + 336, 0xD000000000000011, 0x800000020BD15E70, v9);
    *(void *)(v0 + 1272) = v5;
    swift_bridgeObjectRelease();
    if (v6 == 0x64657269707865 && v8 == 0xE700000000000000
      || (sub_20BCE8000() & 1) != 0
      || v6 == 0x656E6E6F63736964 && v8 == 0xEC00000064657463)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v26 = sub_20BCE8000();
      swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
      {
LABEL_20:
        uint64_t v29 = *(void *)(v0 + 1280);
        uint64_t v30 = sub_20BCE74B0();
        uint64_t v32 = v31;
        *(void *)(v0 + 1240) = v30;
        *(void *)(v0 + 1248) = v31;
        *(void *)(v0 + 1360) = v31;
        uint64_t v33 = (unsigned char *)(v29 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite);
        swift_beginAccess();
        *uint64_t v33 = 1;
        int v34 = (void *)swift_task_alloc();
        *(void *)(v0 + 1368) = v34;
        *int v34 = v0;
        v34[1] = sub_20BABD7CC;
        return sub_20BAB8BF8(v32 != 0);
      }
    }
    *(void *)(v0 + 136) = MEMORY[0x263F8D4F8];
    *(unsigned char *)(v0 + 112) = 1;
    sub_20BA1FD80((_OWORD *)(v0 + 112), (_OWORD *)(v0 + 688));
    uint64_t v27 = *(void *)(v0 + 1272);
    char v28 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v38 = v27;
    sub_20BA1D30C(v0 + 688, 0x6E6F637369447369, 0xEE0064657463656ELL, v28);
    *(void *)(v0 + 1272) = v27;
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  *(unsigned char *)(v0 + 48) = *(unsigned char *)(v0 + 1424);
  *(void *)(v0 + 72) = MEMORY[0x263F8D4F8];
  sub_20BA1FD80((_OWORD *)(v0 + 48), (_OWORD *)(v0 + 80));
  uint64_t v10 = *(void *)(v0 + 1272);
  char v11 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v38 = v10;
  sub_20BA1D30C(v0 + 80, 0x726F707075537369, 0xEB00000000646574, v11);
  *(void *)(v0 + 1272) = v10;
  swift_bridgeObjectRelease();
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v12 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  uint64_t v13 = sub_20BCE7270();
  os_log_type_t v14 = sub_20BCE7AA0();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v16 = *(void *)(v0 + 1304);
  uint64_t v17 = *(void *)(v0 + 1296);
  uint64_t v18 = *(void *)(v0 + 1288);
  if (v15)
  {
    uint64_t v37 = *(void *)(v0 + 1304);
    uint64_t v19 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v38 = v35;
    *(_DWORD *)uint64_t v19 = 136315394;
    uint64_t v36 = v18;
    *(void *)(v0 + 1264) = sub_20BA297F4(0xD000000000000010, 0x800000020BD15E50, &v38);
    sub_20BCE7BC0();
    *(_WORD *)(v19 + 12) = 2080;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF8F0);
    uint64_t v20 = sub_20BCE7530();
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1256) = sub_20BA297F4(v20, v22, &v38);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20B986000, v13, v14, "%s returning: %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v35, -1, -1);
    MEMORY[0x21053F820](v19, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v37, v36);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  swift_beginAccess();
  uint64_t v23 = *(void *)(v0 + 1272);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v24(v23);
}

uint64_t sub_20BABD7CC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BABD8C8, 0, 0);
}

uint64_t sub_20BABD8C8()
{
  uint64_t v45 = v0;
  uint64_t v1 = *(void *)(v0 + 1360);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 1240);
    uint64_t v3 = MEMORY[0x263F8D310];
    *(void *)(v0 + 424) = MEMORY[0x263F8D310];
    *(void *)(v0 + 400) = v2;
    *(void *)(v0 + 408) = v1;
    sub_20BA1FD80((_OWORD *)(v0 + 400), (_OWORD *)(v0 + 432));
    uint64_t v4 = *(void *)(v0 + 1272);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v44 = v4;
    sub_20BA1D30C(v0 + 432, 0xD000000000000015, 0x800000020BD15E90, isUniquelyReferenced_nonNull_native);
    *(void *)(v0 + 1272) = v4;
    swift_bridgeObjectRelease();
    uint64_t v6 = sub_20BCE7490();
    if (v7)
    {
      *(void *)(v0 + 200) = v3;
      *(void *)(v0 + 176) = v6;
      *(void *)(v0 + 184) = v7;
      sub_20BA1FD80((_OWORD *)(v0 + 176), (_OWORD *)(v0 + 144));
      char v8 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v44 = v4;
      sub_20BA1D30C(v0 + 144, 0xD000000000000013, 0x800000020BD15F70, v8);
      *(void *)(v0 + 1272) = v4;
      swift_bridgeObjectRelease();
    }
    uint64_t v9 = sub_20BCE74A0();
    if (v10)
    {
      *(void *)(v0 + 392) = v3;
      *(void *)(v0 + 368) = v9;
      *(void *)(v0 + 376) = v10;
      sub_20BA1FD80((_OWORD *)(v0 + 368), (_OWORD *)(v0 + 208));
      char v11 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v44 = v4;
      sub_20BA1D30C(v0 + 208, 0xD000000000000014, 0x800000020BD15F50, v11);
      *(void *)(v0 + 1272) = v4;
      swift_bridgeObjectRelease();
    }
    uint64_t v12 = sub_20BCE7480();
    if (v13)
    {
      *(void *)(v0 + 1128) = v3;
      *(void *)(v0 + 1104) = v12;
      *(void *)(v0 + 1112) = v13;
      sub_20BA1FD80((_OWORD *)(v0 + 1104), (_OWORD *)(v0 + 1136));
      char v14 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v44 = *(void *)(v0 + 1272);
      sub_20BA1D30C(v0 + 1136, 0xD000000000000012, 0x800000020BD15F30, v14);
      *(void *)(v0 + 1272) = v44;
      swift_bridgeObjectRelease();
    }
    uint64_t v15 = sub_20BCE7450();
    if (v16)
    {
      *(void *)(v0 + 1064) = v3;
      *(void *)(v0 + 1040) = v15;
      *(void *)(v0 + 1048) = v16;
      sub_20BA1FD80((_OWORD *)(v0 + 1040), (_OWORD *)(v0 + 1072));
      char v17 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v44 = *(void *)(v0 + 1272);
      sub_20BA1D30C(v0 + 1072, 0x4165636976726573, 0xEE00737365726464, v17);
      *(void *)(v0 + 1272) = v44;
      swift_bridgeObjectRelease();
    }
    uint64_t v18 = sub_20BCE74E0();
    *(void *)(v0 + 1376) = v18;
    *(void *)(v0 + 1384) = v19;
    if (v19)
    {
      uint64_t v20 = v18;
      uint64_t v21 = v19;
      sub_20BCE7230();
      uint64_t v22 = sub_20BCE7200();
      *(void *)(v0 + 1392) = v22;
      uint64_t v23 = (void *)swift_task_alloc();
      *(void *)(v0 + 1400) = v23;
      *uint64_t v23 = v0;
      v23[1] = sub_20BABDF10;
      return MEMORY[0x270F3C708](v20, v21, v22);
    }
    swift_release();
    char v24 = 1;
  }
  else
  {
    swift_release();
    char v24 = *(unsigned char *)(v0 + 1424);
  }
  *(void *)(v0 + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v0 + 48) = v24;
  sub_20BA1FD80((_OWORD *)(v0 + 48), (_OWORD *)(v0 + 80));
  uint64_t v25 = *(void *)(v0 + 1272);
  char v26 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v44 = v25;
  sub_20BA1D30C(v0 + 80, 0x726F707075537369, 0xEB00000000646574, v26);
  *(void *)(v0 + 1272) = v25;
  swift_bridgeObjectRelease();
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v27 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  char v28 = sub_20BCE7270();
  os_log_type_t v29 = sub_20BCE7AA0();
  BOOL v30 = os_log_type_enabled(v28, v29);
  uint64_t v31 = *(void *)(v0 + 1304);
  uint64_t v32 = *(void *)(v0 + 1296);
  uint64_t v33 = *(void *)(v0 + 1288);
  if (v30)
  {
    uint64_t v43 = *(void *)(v0 + 1304);
    uint64_t v34 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    uint64_t v44 = v41;
    *(_DWORD *)uint64_t v34 = 136315394;
    uint64_t v42 = v33;
    *(void *)(v0 + 1264) = sub_20BA297F4(0xD000000000000010, 0x800000020BD15E50, &v44);
    sub_20BCE7BC0();
    *(_WORD *)(v34 + 12) = 2080;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF8F0);
    uint64_t v35 = sub_20BCE7530();
    unint64_t v37 = v36;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1256) = sub_20BA297F4(v35, v37, &v44);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20B986000, v28, v29, "%s returning: %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v41, -1, -1);
    MEMORY[0x21053F820](v34, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v43, v42);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
  }
  swift_beginAccess();
  uint64_t v38 = *(void *)(v0 + 1272);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v39 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v39(v38);
}

uint64_t sub_20BABDF10(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 1408) = a1;
  *(void *)(v3 + 1416) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_20BABE8BC;
  }
  else
  {

    uint64_t v4 = sub_20BABE030;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_20BABE030()
{
  uint64_t v76 = v0;
  uint64_t v1 = (_OWORD *)(v0 + 48);
  uint64_t v2 = (_OWORD *)(v0 + 80);
  uint64_t v3 = *(void **)(v0 + 1408);
  if (v3)
  {
    uint64_t v67 = (_OWORD *)(v0 + 624);
    uint64_t v68 = (_OWORD *)(v0 + 16);
    id v65 = (_OWORD *)(v0 + 752);
    uint64_t v66 = (_OWORD *)(v0 + 880);
    uint64_t v70 = (_OWORD *)(v0 + 944);
    uint64_t v4 = sub_20BCE71A0();
    uint64_t v6 = v5;
    uint64_t v72 = v3;
    uint64_t v7 = sub_20BCE71B0();
    int64_t v69 = (_OWORD *)(v0 + 816);
    if (!v8)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = v4;
      uint64_t v8 = v6;
    }
    uint64_t v9 = *(void *)(v0 + 1384);
    uint64_t v10 = *(void *)(v0 + 1376);
    uint64_t v11 = MEMORY[0x263F8D310];
    *(void *)(v0 + 488) = MEMORY[0x263F8D310];
    *(void *)(v0 + 464) = v7;
    *(void *)(v0 + 472) = v8;
    sub_20BA1FD80((_OWORD *)(v0 + 464), (_OWORD *)(v0 + 496));
    uint64_t v12 = *(void *)(v0 + 1272);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_20BA1D30C(v0 + 496, 0x4E7974696C697475, 0xEB00000000656D61, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 552) = v11;
    *(void *)(v0 + 528) = v10;
    *(void *)(v0 + 536) = v9;
    sub_20BA1FD80((_OWORD *)(v0 + 528), (_OWORD *)(v0 + 560));
    char v14 = swift_isUniquelyReferenced_nonNull_native();
    sub_20BA1D30C(v0 + 560, 0x497974696C697475, 0xE900000000000044, v14);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 616) = v11;
    *(void *)(v0 + 592) = v4;
    *(void *)(v0 + 600) = v6;
    sub_20BA1FD80((_OWORD *)(v0 + 592), v67);
    char v15 = swift_isUniquelyReferenced_nonNull_native();
    sub_20BA1D30C((uint64_t)v67, 0x4C7974696C697475, 0xEF656D614E676E6FLL, v15);
    uint64_t v16 = v12;
    *(void *)(v0 + 1272) = v12;
    swift_bridgeObjectRelease();
    char v17 = (void *)sub_20BCE7190();
    uint64_t v18 = (void *)sub_20BCE7160();

    uint64_t v19 = sub_20BCE71C0();
    uint64_t v21 = v20;

    *(void *)(v0 + 680) = v11;
    *(void *)(v0 + 656) = v19;
    *(void *)(v0 + 664) = v21;
    sub_20BA1FD80((_OWORD *)(v0 + 656), v68);
    char v22 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v75 = v16;
    sub_20BA1D30C((uint64_t)v68, 0xD000000000000011, 0x800000020BD15EB0, v22);
    uint64_t v23 = v16;
    swift_bridgeObjectRelease();
    if (objc_msgSend(self, sel_isInternalInstall))
    {
      id v24 = objc_msgSend(self, sel_standardUserDefaults);
      uint64_t v25 = (void *)sub_20BCE75E0();
      id v26 = objc_msgSend(v24, sel_stringForKey_, v25);

      uint64_t v2 = (_OWORD *)(v0 + 80);
      if (v26)
      {
        uint64_t v27 = sub_20BCE7620();
        uint64_t v29 = v28;

        *(void *)(v0 + 1000) = MEMORY[0x263F8D310];
        *(void *)(v0 + 976) = v27;
        *(void *)(v0 + 984) = v29;
        sub_20BA1FD80((_OWORD *)(v0 + 976), (_OWORD *)(v0 + 1008));
        char v30 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v75 = v23;
        sub_20BA1D30C(v0 + 1008, 0xD000000000000011, 0x800000020BD15EB0, v30);
        *(void *)(v0 + 1272) = v23;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      uint64_t v2 = (_OWORD *)(v0 + 80);
    }
    uint64_t v31 = (void *)sub_20BCE7190();
    uint64_t v32 = (void *)sub_20BCE7170();

    uint64_t v33 = sub_20BCE71E0();
    uint64_t v34 = MEMORY[0x263F8D310];
    *(void *)(v0 + 744) = MEMORY[0x263F8D310];
    *(void *)(v0 + 720) = v33;
    *(void *)(v0 + 728) = v35;
    sub_20BA1FD80((_OWORD *)(v0 + 720), v65);
    char v36 = swift_isUniquelyReferenced_nonNull_native();
    sub_20BA1D30C((uint64_t)v65, 0xD000000000000014, 0x800000020BD15ED0, v36);
    swift_bridgeObjectRelease();
    uint64_t v37 = sub_20BCE71D0();
    *(void *)(v0 + 808) = v34;
    *(void *)(v0 + 784) = v37;
    *(void *)(v0 + 792) = v38;
    sub_20BA1FD80((_OWORD *)(v0 + 784), v69);
    char v39 = swift_isUniquelyReferenced_nonNull_native();
    sub_20BA1D30C((uint64_t)v69, 0xD000000000000012, 0x800000020BD15EF0, v39);
    swift_bridgeObjectRelease();
    uint64_t v40 = sub_20BCE71F0();
    *(void *)(v0 + 872) = v34;
    *(void *)(v0 + 848) = v40;
    *(void *)(v0 + 856) = v41;
    sub_20BA1FD80((_OWORD *)(v0 + 848), v66);
    char v42 = swift_isUniquelyReferenced_nonNull_native();
    sub_20BA1D30C((uint64_t)v66, 0xD00000000000001BLL, 0x800000020BD15F10, v42);
    uint64_t v43 = v23;
    swift_bridgeObjectRelease();
    uint64_t v44 = (void *)sub_20BCE7190();
    uint64_t v45 = sub_20BCE7180();
    uint64_t v47 = v46;

    *(void *)(v0 + 936) = v34;
    *(void *)(v0 + 912) = v45;
    *(void *)(v0 + 920) = v47;
    sub_20BA1FD80((_OWORD *)(v0 + 912), v70);
    char v48 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v75 = v43;
    sub_20BA1D30C((uint64_t)v70, 0x577974696C697475, 0xEE00657469736265, v48);
    *(void *)(v0 + 1272) = v43;
    swift_bridgeObjectRelease();

    swift_release();
    uint64_t v1 = (_OWORD *)(v0 + 48);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  *(void *)(v0 + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v0 + 48) = 1;
  sub_20BA1FD80(v1, v2);
  uint64_t v49 = *(void *)(v0 + 1272);
  char v50 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v75 = v49;
  sub_20BA1D30C((uint64_t)v2, 0x726F707075537369, 0xEB00000000646574, v50);
  *(void *)(v0 + 1272) = v49;
  swift_bridgeObjectRelease();
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v51 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  unint64_t v52 = sub_20BCE7270();
  os_log_type_t v53 = sub_20BCE7AA0();
  BOOL v54 = os_log_type_enabled(v52, v53);
  uint64_t v55 = *(void *)(v0 + 1304);
  uint64_t v56 = *(void *)(v0 + 1296);
  uint64_t v57 = *(void *)(v0 + 1288);
  if (v54)
  {
    uint64_t v74 = *(void *)(v0 + 1304);
    uint64_t v73 = *(void *)(v0 + 1288);
    uint64_t v58 = swift_slowAlloc();
    uint64_t v71 = swift_slowAlloc();
    uint64_t v75 = v71;
    *(_DWORD *)uint64_t v58 = 136315394;
    *(void *)(v0 + 1264) = sub_20BA297F4(0xD000000000000010, 0x800000020BD15E50, &v75);
    sub_20BCE7BC0();
    *(_WORD *)(v58 + 12) = 2080;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF8F0);
    uint64_t v59 = sub_20BCE7530();
    unint64_t v61 = v60;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1256) = sub_20BA297F4(v59, v61, &v75);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20B986000, v52, v53, "%s returning: %s", (uint8_t *)v58, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v71, -1, -1);
    MEMORY[0x21053F820](v58, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v74, v73);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
  }
  swift_beginAccess();
  uint64_t v62 = *(void *)(v0 + 1272);
  swift_task_dealloc();
  swift_task_dealloc();
  id v63 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v63(v62);
}

uint64_t sub_20BABE8BC()
{
  uint64_t v22 = v0;
  uint64_t v1 = *(void **)(v0 + 1416);

  swift_bridgeObjectRelease();
  swift_release();
  *(unsigned char *)(v0 + 48) = 1;
  *(void *)(v0 + 72) = MEMORY[0x263F8D4F8];
  sub_20BA1FD80((_OWORD *)(v0 + 48), (_OWORD *)(v0 + 80));
  uint64_t v2 = *(void *)(v0 + 1272);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = v2;
  sub_20BA1D30C(v0 + 80, 0x726F707075537369, 0xEB00000000646574, isUniquelyReferenced_nonNull_native);
  *(void *)(v0 + 1272) = v2;
  swift_bridgeObjectRelease();
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v4 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  uint64_t v5 = sub_20BCE7270();
  os_log_type_t v6 = sub_20BCE7AA0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = *(void *)(v0 + 1304);
  uint64_t v9 = *(void *)(v0 + 1296);
  uint64_t v10 = *(void *)(v0 + 1288);
  if (v7)
  {
    uint64_t v20 = *(void *)(v0 + 1304);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v21 = v18;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v19 = v10;
    *(void *)(v0 + 1264) = sub_20BA297F4(0xD000000000000010, 0x800000020BD15E50, &v21);
    sub_20BCE7BC0();
    *(_WORD *)(v11 + 12) = 2080;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF8F0);
    uint64_t v12 = sub_20BCE7530();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 1256) = sub_20BA297F4(v12, v14, &v21);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20B986000, v5, v6, "%s returning: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v18, -1, -1);
    MEMORY[0x21053F820](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v20, v19);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  swift_beginAccess();
  uint64_t v15 = *(void *)(v0 + 1272);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v16(v15);
}

uint64_t sub_20BABED90(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  id v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *id v4 = v2;
  v4[1] = sub_20BABEE38;
  return sub_20BABCE20();
}

uint64_t sub_20BABEE38()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 24);
  uint64_t v2 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2676AF8F0);
  uint64_t v3 = (void *)sub_20BCE7510();
  swift_bridgeObjectRelease();
  ((void (**)(void, void *))v1)[2](v1, v3);

  _Block_release(v1);
  id v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_20BABEFB8()
{
  v1[11] = v0;
  uint64_t v2 = sub_20BCE7290();
  v1[12] = v2;
  v1[13] = *(void *)(v2 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  uint64_t v3 = sub_20BCE65C0();
  v1[18] = v3;
  v1[19] = *(void *)(v3 - 8);
  v1[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20BABF0FC, 0, 0);
}

uint64_t sub_20BABF0FC()
{
  uint64_t v27 = v0;
  uint64_t v1 = *(void **)(v0[11] + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home);
  id v2 = objc_msgSend(v1, sel_name);
  uint64_t v3 = sub_20BCE7620();
  unint64_t v5 = v4;

  v0[21] = v3;
  v0[22] = v5;
  if (objc_msgSend(v1, sel_hf_currentUserIsAdministrator))
  {
    uint64_t v7 = v0[19];
    uint64_t v6 = v0[20];
    uint64_t v8 = v0[18];
    sub_20BCE74F0();
    id v9 = objc_msgSend(v1, sel_uniqueIdentifier);
    sub_20BCE6590();

    uint64_t v10 = sub_20BCE6560();
    uint64_t v12 = v11;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    unint64_t v13 = (void *)swift_task_alloc();
    v0[23] = v13;
    void *v13 = v0;
    v13[1] = sub_20BABF4B8;
    return MEMORY[0x270F27008](v10, v12);
  }
  else
  {
    if (qword_26AB2E398 != -1) {
      swift_once();
    }
    id v14 = (id)qword_26AB2FF58;
    sub_20BCE72A0();
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_20BCE7270();
    os_log_type_t v16 = sub_20BCE7AA0();
    BOOL v17 = os_log_type_enabled(v15, v16);
    uint64_t v18 = v0[15];
    uint64_t v19 = v0[12];
    uint64_t v20 = v0[13];
    if (v17)
    {
      uint64_t v25 = v0[15];
      uint64_t v21 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v26 = v24;
      *(_DWORD *)uint64_t v21 = 136315394;
      v0[2] = sub_20BA297F4(0xD000000000000014, 0x800000020BD15F90, &v26);
      sub_20BCE7BC0();
      *(_WORD *)(v21 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[3] = sub_20BA297F4(v3, v5, &v26);
      sub_20BCE7BC0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20B986000, v15, v16, "%s not allowed for home %s because: not admin", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21053F820](v24, -1, -1);
      MEMORY[0x21053F820](v21, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v25, v19);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = (uint64_t (*)(void))v0[1];
    return v22(0);
  }
}

uint64_t sub_20BABF4B8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 192) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BABF5B8, 0, 0);
}

uint64_t sub_20BABF5B8()
{
  uint64_t v20 = v0;
  if (v0[24])
  {
    BOOL v17 = (uint64_t (*)(void))((int)*MEMORY[0x263F3B608] + MEMORY[0x263F3B608]);
    uint64_t v1 = (void *)swift_task_alloc();
    v0[25] = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_20BABF8E8;
    return v17();
  }
  else
  {
    if (qword_26AB2E398 != -1) {
      swift_once();
    }
    id v3 = (id)qword_26AB2FF58;
    sub_20BCE72A0();
    swift_bridgeObjectRetain();
    unint64_t v4 = sub_20BCE7270();
    os_log_type_t v5 = sub_20BCE7A90();
    BOOL v6 = os_log_type_enabled(v4, v5);
    unint64_t v7 = v0[22];
    if (v6)
    {
      uint64_t v18 = v0[16];
      uint64_t v8 = v0[13];
      uint64_t v15 = v0[21];
      uint64_t v16 = v0[12];
      uint64_t v9 = swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v19 = v10;
      *(_DWORD *)uint64_t v9 = 136315394;
      v0[4] = sub_20BA297F4(0xD000000000000014, 0x800000020BD15F90, &v19);
      sub_20BCE7BC0();
      *(_WORD *)(v9 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[5] = sub_20BA297F4(v15, v7, &v19);
      sub_20BCE7BC0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20B986000, v4, v5, "%s Error fetching Energy Site for %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x21053F820](v10, -1, -1);
      MEMORY[0x21053F820](v9, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v18, v16);
    }
    else
    {
      uint64_t v11 = v0[16];
      uint64_t v12 = v0[12];
      uint64_t v13 = v0[13];

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v14 = (uint64_t (*)(void))v0[1];
    return v14(0);
  }
}

uint64_t sub_20BABF8E8(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 208) = v1;
  swift_task_dealloc();
  if (v1)
  {
    os_log_type_t v5 = sub_20BABFF08;
  }
  else
  {
    *(unsigned char *)(v4 + 228) = a1 & 1;
    os_log_type_t v5 = sub_20BABFA14;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_20BABFA14()
{
  uint64_t v20 = v0;
  int v1 = *(unsigned __int8 *)(v0 + 228);
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v2 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  swift_bridgeObjectRetain();
  id v3 = sub_20BCE7270();
  os_log_type_t v4 = sub_20BCE7AA0();
  BOOL v5 = os_log_type_enabled(v3, v4);
  unint64_t v6 = *(void *)(v0 + 176);
  if (v5)
  {
    uint64_t v16 = *(void *)(v0 + 168);
    uint64_t v7 = *(void *)(v0 + 104);
    uint64_t v17 = *(void *)(v0 + 96);
    uint64_t v18 = *(void *)(v0 + 136);
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v19 = v9;
    *(_DWORD *)uint64_t v8 = 136315650;
    *(void *)(v0 + 48) = sub_20BA297F4(0xD000000000000014, 0x800000020BD15F90, &v19);
    sub_20BCE7BC0();
    *(_WORD *)(v8 + 12) = 1024;
    *(_DWORD *)(v0 + 224) = v1;
    sub_20BCE7BC0();
    *(_WORD *)(v8 + 18) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 64) = sub_20BA297F4(v16, v6, &v19);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20B986000, v3, v4, "%s success: %{BOOL}d for home %s", (uint8_t *)v8, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v9, -1, -1);
    MEMORY[0x21053F820](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v18, v17);
    if (!v1)
    {
LABEL_5:
      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
      return v10(0);
    }
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 136);
    uint64_t v13 = *(void *)(v0 + 96);
    uint64_t v14 = *(void *)(v0 + 104);

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    if (!v1) {
      goto LABEL_5;
    }
  }
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_20BABFD70;
  return sub_20BAB8BF8(0);
}

uint64_t sub_20BABFD70()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BABFE6C, 0, 0);
}

uint64_t sub_20BABFE6C()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(1);
}

uint64_t sub_20BABFF08()
{
  uint64_t v41 = v0;
  uint64_t v1 = HFUtilities;
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v2 = *(void **)(v0 + 208);
  id v3 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  swift_bridgeObjectRetain();
  id v4 = v2;
  swift_bridgeObjectRetain();
  id v5 = v2;
  unint64_t v6 = sub_20BCE7270();
  os_log_type_t v7 = sub_20BCE7A90();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void **)(v0 + 208);
  unint64_t v10 = *(void *)(v0 + 176);
  if (v8)
  {
    uint64_t v32 = *(void *)(v0 + 168);
    uint64_t v34 = *(void *)(v0 + 104);
    uint64_t v36 = *(void *)(v0 + 96);
    uint64_t v38 = *(void *)(v0 + 112);
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v40 = v33;
    *(_DWORD *)uint64_t v11 = 136315650;
    *(void *)(v0 + 72) = sub_20BA297F4(0xD000000000000014, 0x800000020BD15F90, &v40);
    sub_20BCE7BC0();
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 80) = sub_20BA297F4(v32, v10, &v40);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 22) = 2112;
    id v13 = v9;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 56) = v14;
    sub_20BCE7BC0();
    *uint64_t v12 = v14;

    _os_log_impl(&dword_20B986000, v6, v7, "%s revokeUtilitySubscription failed for %s error: %@", (uint8_t *)v11, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2676AE2D0);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v33, -1, -1);
    uint64_t v15 = v11;
    uint64_t v1 = HFUtilities;
    MEMORY[0x21053F820](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v38, v36);
  }
  else
  {
    uint64_t v17 = *(void *)(v0 + 104);
    uint64_t v16 = *(void *)(v0 + 112);
    uint64_t v18 = *(void *)(v0 + 96);

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  if (v1[23].isa != (__objc2_class *)-1) {
    swift_once();
  }
  id v19 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_20BCE7270();
  os_log_type_t v21 = sub_20BCE7AA0();
  BOOL v22 = os_log_type_enabled(v20, v21);
  unint64_t v23 = *(void *)(v0 + 176);
  if (v22)
  {
    uint64_t v39 = *(void *)(v0 + 136);
    uint64_t v24 = *(void *)(v0 + 104);
    uint64_t v35 = *(void *)(v0 + 168);
    uint64_t v37 = *(void *)(v0 + 96);
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v40 = v26;
    *(_DWORD *)uint64_t v25 = 136315650;
    *(void *)(v0 + 48) = sub_20BA297F4(0xD000000000000014, 0x800000020BD15F90, &v40);
    sub_20BCE7BC0();
    *(_WORD *)(v25 + 12) = 1024;
    *(_DWORD *)(v0 + 224) = 0;
    sub_20BCE7BC0();
    *(_WORD *)(v25 + 18) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 64) = sub_20BA297F4(v35, v23, &v40);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20B986000, v20, v21, "%s success: %{BOOL}d for home %s", (uint8_t *)v25, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v26, -1, -1);
    MEMORY[0x21053F820](v25, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v39, v37);
  }
  else
  {
    uint64_t v27 = *(void *)(v0 + 136);
    uint64_t v28 = *(void *)(v0 + 96);
    uint64_t v29 = *(void *)(v0 + 104);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30(0);
}

uint64_t sub_20BAC0614(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  id v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *id v4 = v2;
  v4[1] = sub_20BAC8470;
  return sub_20BABEFB8();
}

id sub_20BAC06BC()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home), sel_hf_currentUserIsAdministrator);
}

uint64_t sub_20BAC06E8()
{
  uint64_t v1 = sub_20BCE7290();
  v0[4] = v1;
  v0[5] = *(void *)(v1 - 8);
  v0[6] = swift_task_alloc();
  id v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *id v2 = v0;
  v2[1] = sub_20BAC07D0;
  return sub_20BAC0EF4();
}

uint64_t sub_20BAC07D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BAC08D0, 0, 0);
}

uint64_t sub_20BAC08D0()
{
  uint64_t v20 = v0;
  uint64_t v1 = v0;
  char v2 = sub_20BCE66E0();
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v3 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_20BCE7270();
  os_log_type_t v5 = sub_20BCE7AA0();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = *(void *)(v0 + 72);
  if (v6)
  {
    uint64_t v15 = *(void *)(v0 + 64);
    uint64_t v17 = *(void *)(v0 + 48);
    uint64_t v18 = *(void *)(v0 + 32);
    uint64_t v16 = *(void *)(v0 + 40);
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v19 = v9;
    *(_DWORD *)uint64_t v8 = 136315650;
    *(void *)(v0 + 16) = sub_20BA297F4(0xD000000000000025, 0x800000020BD15FB0, &v19);
    sub_20BCE7BC0();
    *(_WORD *)(v8 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 24) = sub_20BA297F4(v15, v7, &v19);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 22) = 1024;
    *(_DWORD *)(v0 + 80) = v2 & 1;
    sub_20BCE7BC0();
    _os_log_impl(&dword_20B986000, v4, v5, "%s %s returning %{BOOL}d", (uint8_t *)v8, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v9, -1, -1);
    MEMORY[0x21053F820](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 40);
    uint64_t v10 = *(void *)(v0 + 48);
    uint64_t v12 = *(void *)(v1 + 32);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  swift_task_dealloc();
  id v13 = *(uint64_t (**)(void))(v1 + 8);
  return v13(v2 & 1);
}

uint64_t sub_20BAC0D04(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_20BAC0DAC;
  return sub_20BAC06E8();
}

uint64_t sub_20BAC0DAC(char a1)
{
  id v3 = *(void (***)(void, void))(*v1 + 24);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();

  v3[2](v3, a1 & 1);
  _Block_release(v3);
  os_log_type_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_20BAC0EF4()
{
  v1[26] = v0;
  uint64_t v2 = sub_20BCE6610();
  v1[27] = v2;
  v1[28] = *(void *)(v2 - 8);
  v1[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E380);
  v1[30] = swift_task_alloc();
  uint64_t v3 = sub_20BCE7290();
  v1[31] = v3;
  v1[32] = *(void *)(v3 - 8);
  v1[33] = swift_task_alloc();
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  v1[38] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20BAC1080, 0, 0);
}

uint64_t sub_20BAC1080()
{
  int64_t v114 = v0;
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[26];
  id v2 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  id v3 = v1;
  uint64_t v4 = sub_20BCE7270();
  os_log_type_t type = sub_20BCE7AA0();
  BOOL v5 = os_log_type_enabled(v4, type);
  uint64_t v6 = v0[38];
  uint64_t v7 = v0[32];
  uint64_t v109 = v0[31];
  uint64_t v8 = (char *)v0[26];
  if (v5)
  {
    *(void *)char v98 = v0[38];
    uint64_t v9 = swift_slowAlloc();
    uint64_t v95 = swift_slowAlloc();
    uint64_t v113 = v95;
    *(_DWORD *)uint64_t v9 = 136315906;
    v0[21] = sub_20BA297F4(0x69676552656D6F68, 0xEC00000029286E6FLL, &v113);
    sub_20BCE7BC0();
    *(_WORD *)(v9 + 12) = 2080;
    id v91 = *(id *)&v8[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home];
    id v10 = objc_msgSend(v91, sel_name);
    uint64_t v92 = v7;
    uint64_t v11 = sub_20BCE7620();
    unint64_t v13 = v12;

    v0[22] = sub_20BA297F4(v11, v13, &v113);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 22) = 2080;
    uint64_t v14 = *(void *)&v8[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedRegionCode + 8];
    v0[5] = *(void *)&v8[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedRegionCode];
    v0[6] = v14;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E388);
    uint64_t v15 = sub_20BCE7640();
    v0[24] = sub_20BA297F4(v15, v16, &v113);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 32) = 2080;
    id v17 = objc_msgSend(v91, sel_location);

    if (v17) {
      uint64_t v18 = 0xD000000000000010;
    }
    else {
      uint64_t v18 = 0x20636F4C656D6F68;
    }
    if (v17) {
      unint64_t v19 = 0x800000020BD15FE0;
    }
    else {
      unint64_t v19 = 0xEE004C494E207369;
    }
    v0[25] = sub_20BA297F4(v18, v19, &v113);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_20B986000, v4, type, "%s called for %s: cached: %s, %s", (uint8_t *)v9, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v95, -1, -1);
    MEMORY[0x21053F820](v9, -1, -1);

    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
    v20(*(void *)v98, v109);
  }
  else
  {

    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v20(v6, v109);
  }
  uint64_t v21 = (char *)v0[26];
  uint64_t v22 = OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedRegionCode;
  v0[39] = v20;
  v0[40] = v22;
  unint64_t v23 = (uint64_t *)&v21[v22];
  unint64_t v24 = v23[1];
  if (v24)
  {
    uint64_t v25 = *v23;
    uint64_t v26 = (void *)qword_26AB2FF58;
    swift_bridgeObjectRetain();
    id v27 = v26;
    sub_20BCE72A0();
    uint64_t v28 = v21;
    swift_bridgeObjectRetain_n();
    uint64_t v29 = v28;
    char v30 = sub_20BCE7270();
    os_log_type_t typea = sub_20BCE7AA0();
    BOOL v31 = os_log_type_enabled(v30, typea);
    uint64_t v32 = v0[37];
    uint64_t v33 = v0[31];
    uint64_t v34 = (char *)v0[26];
    if (v31)
    {
      uint64_t v110 = v25;
      uint64_t v35 = swift_slowAlloc();
      uint64_t v93 = swift_slowAlloc();
      uint64_t v113 = v93;
      *(_DWORD *)uint64_t v35 = 136315650;
      uint64_t v96 = v33;
      v0[18] = sub_20BA297F4(0x69676552656D6F68, 0xEC00000029286E6FLL, &v113);
      sub_20BCE7BC0();
      uint64_t v106 = v20;
      *(_WORD *)(v35 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[19] = sub_20BA297F4(v110, v24, &v113);
      sub_20BCE7BC0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v35 + 22) = 2080;
      id v36 = objc_msgSend(*(id *)&v34[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home], sel_name);
      uint64_t v37 = sub_20BCE7620();
      unint64_t v39 = v38;

      v0[20] = sub_20BA297F4(v37, v39, &v113);
      sub_20BCE7BC0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_20B986000, v30, typea, "%s returning cached region code: %s for %s", (uint8_t *)v35, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x21053F820](v93, -1, -1);
      uint64_t v40 = v35;
      uint64_t v25 = v110;
      MEMORY[0x21053F820](v40, -1, -1);

      v106(v32, v96);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      v20(v32, v33);
    }
LABEL_19:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v60 = (uint64_t (*)(uint64_t, unint64_t))v0[1];
    return v60(v25, v24);
  }
  uint64_t v41 = *(void **)&v21[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home];
  v0[41] = v41;
  id v42 = objc_msgSend(v41, sel_location);
  v0[42] = v42;
  if (!v42)
  {
    uint64_t v62 = v0[29];
    uint64_t v63 = v0[30];
    uint64_t v64 = v0[27];
    uint64_t v65 = v0[28];
    sub_20BCE6600();
    sub_20BCE65F0();
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v62, v64);
    uint64_t v66 = sub_20BCE65E0();
    uint64_t v67 = *(void *)(v66 - 8);
    int v68 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v67 + 48))(v63, 1, v66);
    uint64_t v69 = v0[30];
    if (v68 == 1)
    {
      sub_20BA1FD90(v0[30], &qword_26AB2E380);
      uint64_t v112 = 0;
      unint64_t v24 = 0xE000000000000000;
    }
    else
    {
      uint64_t v112 = sub_20BCE65D0();
      unint64_t v24 = v74;
      (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v69, v66);
    }
    uint64_t v75 = (void *)v0[26];
    id v76 = (id)qword_26AB2FF58;
    sub_20BCE72A0();
    id v77 = v75;
    swift_bridgeObjectRetain_n();
    id v78 = v77;
    uint64_t v79 = sub_20BCE7270();
    os_log_type_t v80 = sub_20BCE7AA0();
    if (os_log_type_enabled(v79, v80))
    {
      unint64_t v81 = (void *)v0[41];
      uint64_t v102 = v0[34];
      typeb = (void (*)(uint64_t, uint64_t))v0[39];
      uint64_t v101 = v0[31];
      unint64_t v94 = (void *)v0[26];
      uint64_t v82 = swift_slowAlloc();
      uint64_t v97 = swift_slowAlloc();
      uint64_t v113 = v97;
      *(_DWORD *)uint64_t v82 = 136315650;
      v0[23] = sub_20BA297F4(0x69676552656D6F68, 0xEC00000029286E6FLL, &v113);
      sub_20BCE7BC0();
      *(_WORD *)(v82 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[10] = sub_20BA297F4(v112, v24, &v113);
      sub_20BCE7BC0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v82 + 22) = 2080;
      id v83 = objc_msgSend(v81, sel_name);
      uint64_t v84 = sub_20BCE7620();
      unint64_t v86 = v85;

      v0[7] = sub_20BA297F4(v84, v86, &v113);
      sub_20BCE7BC0();
      uint64_t v25 = v112;
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_20B986000, v79, v80, "%s falling back to device region code: %s for %s", (uint8_t *)v82, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x21053F820](v97, -1, -1);
      MEMORY[0x21053F820](v82, -1, -1);

      typeb(v102, v101);
    }
    else
    {
      uint64_t v87 = (void (*)(uint64_t, uint64_t))v0[39];
      uint64_t v88 = v0[34];
      uint64_t v89 = v0[31];
      uint64_t v90 = (void *)v0[26];
      swift_bridgeObjectRelease_n();

      v87(v88, v89);
      uint64_t v25 = v112;
    }
    goto LABEL_19;
  }
  id v43 = v42;
  uint64_t v107 = v20;
  uint64_t v44 = (void *)v0[26];
  id v45 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  id v46 = v44;
  uint64_t v47 = sub_20BCE7270();
  os_log_type_t v48 = sub_20BCE7AA0();
  BOOL v49 = os_log_type_enabled(v47, v48);
  uint64_t v50 = v0[36];
  uint64_t v51 = v0[31];
  unint64_t v52 = (void *)v0[26];
  if (v49)
  {
    uint64_t v111 = v0[31];
    uint64_t v53 = swift_slowAlloc();
    uint64_t v100 = swift_slowAlloc();
    uint64_t v113 = v100;
    *(_DWORD *)uint64_t v53 = 136315394;
    os_log_type_t v99 = v48;
    v0[16] = sub_20BA297F4(0x69676552656D6F68, 0xEC00000029286E6FLL, &v113);
    sub_20BCE7BC0();
    *(_WORD *)(v53 + 12) = 2080;
    id v54 = objc_msgSend(v41, sel_name);
    uint64_t v55 = sub_20BCE7620();
    unint64_t v57 = v56;

    v0[17] = sub_20BA297F4(v55, v57, &v113);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_20B986000, v47, v99, "%s %s has a location. Reverse geocode started...", (uint8_t *)v53, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v100, -1, -1);
    MEMORY[0x21053F820](v53, -1, -1);

    uint64_t v58 = v50;
    uint64_t v59 = v111;
  }
  else
  {

    uint64_t v58 = v50;
    uint64_t v59 = v51;
  }
  v107(v58, v59);
  uint64_t v70 = (void *)(v0[26] + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_geocoder);
  uint64_t v71 = v70[3];
  uint64_t v72 = v70[4];
  __swift_project_boxed_opaque_existential_1(v70, v71);
  id v108 = (uint64_t (*)(id, uint64_t, uint64_t))(*(void *)(v72 + 8) + **(int **)(v72 + 8));
  uint64_t v73 = (void *)swift_task_alloc();
  v0[43] = v73;
  *uint64_t v73 = v0;
  v73[1] = sub_20BAC1DC0;
  return v108(v43, v71, v72);
}

uint64_t sub_20BAC1DC0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 352) = a1;
  *(void *)(v3 + 360) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_20BAC2664;
  }
  else {
    uint64_t v4 = sub_20BAC1ED4;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

void sub_20BAC1ED4()
{
  uint64_t v67 = v0;
  unint64_t v1 = v0[44];
  if (!(v1 >> 62))
  {
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_13:
    uint64_t v20 = (void *)v0[42];
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_20BCE7F20();
  swift_bridgeObjectRelease();
  if (!v27) {
    goto LABEL_13;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)MEMORY[0x21053E270](0, v0[44]);
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v2 = *(id *)(v0[44] + 32);
  }
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v2, sel_ISOcountryCode);

  if (!v3)
  {
    uint64_t v20 = (void *)v0[42];
LABEL_14:

    uint64_t v29 = v0[29];
    uint64_t v28 = v0[30];
    uint64_t v30 = v0[27];
    uint64_t v31 = v0[28];
    sub_20BCE6600();
    sub_20BCE65F0();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
    uint64_t v32 = sub_20BCE65E0();
    uint64_t v33 = *(void *)(v32 - 8);
    int v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v28, 1, v32);
    uint64_t v35 = v0[30];
    if (v34 == 1)
    {
      sub_20BA1FD90(v0[30], &qword_26AB2E380);
      uint64_t v5 = 0;
      unint64_t v7 = 0xE000000000000000;
    }
    else
    {
      uint64_t v5 = sub_20BCE65D0();
      unint64_t v7 = v36;
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v35, v32);
    }
    uint64_t v37 = (void *)v0[26];
    id v38 = (id)qword_26AB2FF58;
    sub_20BCE72A0();
    id v39 = v37;
    swift_bridgeObjectRetain_n();
    id v40 = v39;
    uint64_t v41 = sub_20BCE7270();
    os_log_type_t v42 = sub_20BCE7AA0();
    if (os_log_type_enabled(v41, v42))
    {
      id v43 = (void *)v0[41];
      uint64_t v61 = v0[34];
      uint64_t v63 = (void (*)(uint64_t, uint64_t))v0[39];
      uint64_t v59 = v0[31];
      unint64_t v57 = (void *)v0[26];
      uint64_t v44 = swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315650;
      uint64_t v65 = v5;
      uint64_t v66 = v45;
      v0[23] = sub_20BA297F4(0x69676552656D6F68, 0xEC00000029286E6FLL, &v66);
      sub_20BCE7BC0();
      *(_WORD *)(v44 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[10] = sub_20BA297F4(v5, v7, &v66);
      sub_20BCE7BC0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v44 + 22) = 2080;
      id v46 = objc_msgSend(v43, sel_name);
      uint64_t v47 = sub_20BCE7620();
      unint64_t v49 = v48;

      v0[7] = sub_20BA297F4(v47, v49, &v66);
      sub_20BCE7BC0();
      uint64_t v5 = v65;
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_20B986000, v41, v42, "%s falling back to device region code: %s for %s", (uint8_t *)v44, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x21053F820](v45, -1, -1);
      MEMORY[0x21053F820](v44, -1, -1);

      v63(v61, v59);
    }
    else
    {
      uint64_t v50 = (void (*)(uint64_t, uint64_t))v0[39];
      uint64_t v51 = v0[34];
      uint64_t v52 = v0[31];
      uint64_t v53 = (void *)v0[26];
      swift_bridgeObjectRelease_n();

      v50(v51, v52);
    }
    goto LABEL_20;
  }
  uint64_t v4 = (void *)v0[26];
  uint64_t v5 = sub_20BCE7620();
  unint64_t v7 = v6;

  id v8 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  id v9 = v4;
  swift_bridgeObjectRetain_n();
  id v10 = v9;
  uint64_t v11 = sub_20BCE7270();
  os_log_type_t v12 = sub_20BCE7AA0();
  if (os_log_type_enabled(v11, v12))
  {
    id v55 = (id)v0[41];
    uint64_t v62 = v0[35];
    uint64_t v64 = (void (*)(uint64_t, uint64_t))v0[39];
    uint64_t v60 = v0[31];
    unint64_t v56 = (void *)v0[26];
    uint64_t v13 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    uint64_t v66 = v58;
    *(_DWORD *)uint64_t v13 = 136315650;
    uint64_t v14 = v5;
    v0[13] = sub_20BA297F4(0x69676552656D6F68, 0xEC00000029286E6FLL, &v66);
    sub_20BCE7BC0();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[14] = sub_20BA297F4(v5, v7, &v66);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 22) = 2080;
    id v15 = objc_msgSend(v55, sel_name);
    uint64_t v16 = sub_20BCE7620();
    unint64_t v18 = v17;

    uint64_t v19 = v16;
    uint64_t v5 = v14;
    v0[15] = sub_20BA297F4(v19, v18, &v66);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_20B986000, v11, v12, "%s Reverse geocode succeeded, region code: %s for %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v58, -1, -1);
    MEMORY[0x21053F820](v13, -1, -1);

    v64(v62, v60);
  }
  else
  {
    uint64_t v21 = (void (*)(uint64_t, uint64_t))v0[39];
    uint64_t v22 = v0[35];
    uint64_t v23 = v0[31];
    unint64_t v24 = (void *)v0[26];
    swift_bridgeObjectRelease_n();

    v21(v22, v23);
  }
  uint64_t v25 = (void *)v0[42];
  uint64_t v26 = (uint64_t *)(v0[26] + v0[40]);
  *uint64_t v26 = v5;
  v26[1] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();

LABEL_20:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v54 = (void (*)(uint64_t, unint64_t))v0[1];
  v54(v5, v7);
}

uint64_t sub_20BAC2664()
{
  uint64_t v69 = v0;
  unint64_t v1 = *(void **)(v0 + 360);
  id v2 = *(void **)(v0 + 208);
  id v3 = &_MergedGlobals_244;
  id v4 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  id v5 = v2;
  id v6 = v1;
  id v7 = v5;
  id v8 = v1;
  id v9 = sub_20BCE7270();
  os_log_type_t v10 = sub_20BCE7AA0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = *(void **)(v0 + 360);
    os_log_type_t v12 = *(void **)(v0 + 328);
    uint64_t v64 = *(void *)(v0 + 264);
    uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    uint64_t v60 = *(void **)(v0 + 336);
    uint64_t v62 = *(void *)(v0 + 248);
    unint64_t v56 = *(void **)(v0 + 208);
    uint64_t v13 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    uint64_t v68 = v58;
    *(_DWORD *)uint64_t v13 = 136315650;
    *(void *)(v0 + 64) = sub_20BA297F4(0x69676552656D6F68, 0xEC00000029286E6FLL, &v68);
    sub_20BCE7BC0();
    *(_WORD *)(v13 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v14 = sub_20BCE8070();
    *(void *)(v0 + 88) = sub_20BA297F4(v14, v15, &v68);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();
    id v55 = v11;

    *(_WORD *)(v13 + 22) = 2080;
    id v16 = objc_msgSend(v12, sel_name);
    uint64_t v17 = sub_20BCE7620();
    unint64_t v19 = v18;

    id v3 = &_MergedGlobals_244;
    *(void *)(v0 + 96) = sub_20BA297F4(v17, v19, &v68);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_20B986000, v9, v10, "%s Reverse geocode error: %s for %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v58, -1, -1);
    MEMORY[0x21053F820](v13, -1, -1);

    v66(v64, v62);
  }
  else
  {
    uint64_t v20 = *(void **)(v0 + 360);
    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    uint64_t v22 = *(void *)(v0 + 264);
    uint64_t v23 = *(void *)(v0 + 248);
    unint64_t v24 = *(void **)(v0 + 208);

    v21(v22, v23);
  }
  uint64_t v26 = *(void *)(v0 + 232);
  uint64_t v25 = *(void *)(v0 + 240);
  uint64_t v27 = *(void *)(v0 + 216);
  uint64_t v28 = *(void *)(v0 + 224);
  sub_20BCE6600();
  sub_20BCE65F0();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
  uint64_t v29 = sub_20BCE65E0();
  uint64_t v30 = *(void *)(v29 - 8);
  int v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v25, 1, v29);
  uint64_t v32 = *(void *)(v0 + 240);
  if (v31 == 1)
  {
    sub_20BA1FD90(*(void *)(v0 + 240), &qword_26AB2E380);
    uint64_t v33 = 0;
    unint64_t v34 = 0xE000000000000000;
  }
  else
  {
    uint64_t v33 = sub_20BCE65D0();
    unint64_t v34 = v35;
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v32, v29);
  }
  uint64_t v67 = v33;
  unint64_t v36 = *(void **)(v0 + 208);
  id v37 = (id)v3[491];
  sub_20BCE72A0();
  id v38 = v36;
  swift_bridgeObjectRetain_n();
  id v39 = v38;
  id v40 = sub_20BCE7270();
  os_log_type_t v41 = sub_20BCE7AA0();
  if (os_log_type_enabled(v40, v41))
  {
    os_log_type_t v42 = *(void **)(v0 + 328);
    uint64_t v63 = *(void *)(v0 + 272);
    uint64_t v65 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    uint64_t v61 = *(void *)(v0 + 248);
    unint64_t v57 = *(void **)(v0 + 208);
    uint64_t v43 = swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    uint64_t v68 = v59;
    *(_DWORD *)uint64_t v43 = 136315650;
    *(void *)(v0 + 184) = sub_20BA297F4(0x69676552656D6F68, 0xEC00000029286E6FLL, &v68);
    sub_20BCE7BC0();
    *(_WORD *)(v43 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 80) = sub_20BA297F4(v67, v34, &v68);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v43 + 22) = 2080;
    id v44 = objc_msgSend(v42, sel_name);
    uint64_t v45 = sub_20BCE7620();
    unint64_t v47 = v46;

    *(void *)(v0 + 56) = sub_20BA297F4(v45, v47, &v68);
    sub_20BCE7BC0();
    uint64_t v48 = v67;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_20B986000, v40, v41, "%s falling back to device region code: %s for %s", (uint8_t *)v43, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v59, -1, -1);
    MEMORY[0x21053F820](v43, -1, -1);

    v65(v63, v61);
  }
  else
  {
    unint64_t v49 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    uint64_t v50 = *(void *)(v0 + 272);
    uint64_t v51 = *(void *)(v0 + 248);
    uint64_t v52 = *(void **)(v0 + 208);
    swift_bridgeObjectRelease_n();

    v49(v50, v51);
    uint64_t v48 = v67;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v53 = *(uint64_t (**)(uint64_t, unint64_t))(v0 + 8);
  return v53(v48, v34);
}

uint64_t sub_20BAC2EB4(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  id v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *id v4 = v2;
  v4[1] = sub_20BAC2F5C;
  return sub_20BAC0EF4();
}

uint64_t sub_20BAC2F5C()
{
  unint64_t v1 = *(void (***)(void, void))(*v0 + 24);
  id v2 = *(void **)(*v0 + 16);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  id v3 = (void *)sub_20BCE75E0();
  swift_bridgeObjectRelease();
  ((void (**)(void, void *))v1)[2](v1, v3);

  _Block_release(v1);
  id v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_20BAC30E4(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_20BCE7290();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_20BAC31A4, 0, 0);
}

uint64_t sub_20BAC31A4()
{
  uint64_t v1 = (void *)(v0[5] + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_geocoder);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  id v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  *id v4 = v0;
  v4[1] = sub_20BAC32B8;
  uint64_t v5 = v0[4];
  return v7(v5, v2, v3);
}

uint64_t sub_20BAC32B8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(*v2 + 80) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    id v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_20BAC3408, 0, 0);
  }
}

uint64_t sub_20BAC3408()
{
  uint64_t v20 = v1;
  unint64_t v2 = v1[10];
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_20BCE7F20();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x21053E270](0, v1[10]);
    goto LABEL_6;
  }
  if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v4 = *(id *)(v1[10] + 32);
LABEL_6:
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v4, sel_ISOcountryCode);

    if (v5)
    {
      uint64_t v3 = sub_20BCE7620();
      unint64_t v0 = v6;

      if (qword_26AB2E398 == -1) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
    uint64_t v3 = 0;
LABEL_14:
    unint64_t v0 = 0xE000000000000000;
    goto LABEL_15;
  }
  __break(1u);
LABEL_20:
  swift_once();
LABEL_8:
  id v7 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_20BCE7270();
  os_log_type_t v9 = sub_20BCE7AA0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v12 = v1[7];
  uint64_t v11 = v1[8];
  uint64_t v13 = v1[6];
  if (v10)
  {
    uint64_t v18 = v1[8];
    uint64_t v14 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v19 = v17;
    *(_DWORD *)uint64_t v14 = 136315394;
    v1[2] = sub_20BA297F4(0xD000000000000015, 0x800000020BD16000, &v19);
    sub_20BCE7BC0();
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    v1[3] = sub_20BA297F4(v3, v0, &v19);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20B986000, v8, v9, "%s returning country code: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v17, -1, -1);
    MEMORY[0x21053F820](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v18, v13);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
LABEL_15:
  swift_task_dealloc();
  unint64_t v15 = (uint64_t (*)(uint64_t, unint64_t))v1[1];
  return v15(v3, v0);
}

uint64_t sub_20BAC3748()
{
  uint64_t v1 = sub_20BCE73D0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  id v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_20BCE73F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20BA208F4(0, &qword_26AB2E428);
  os_log_type_t v9 = (void *)sub_20BCE7AD0();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  aBlock[4] = sub_20BAC8370;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20BAB6198;
  aBlock[3] = &block_descriptor_183;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v0;
  swift_release();
  sub_20BCE73E0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_20BAC8378();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3C8);
  sub_20BAC83D0();
  sub_20BCE7C20();
  MEMORY[0x21053DF50](0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_20BAC39D4()
{
  id v0 = objc_msgSend(self, sel_sharedDispatcher);
  uint64_t v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3[4] = sub_20BAC8464;
  v3[5] = v1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 1107296256;
  v3[2] = sub_20BA61068;
  v3[3] = &block_descriptor_189;
  uint64_t v2 = _Block_copy(v3);
  swift_release();
  objc_msgSend(v0, sel_dispatchHomeObserverMessage_sender_, v2, 0);
  _Block_release(v2);
}

void sub_20BAC3ADC(void *a1, uint64_t a2)
{
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x21053F900](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = *(id *)(v4 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home);

    if (objc_msgSend(a1, sel_respondsToSelector_, sel_homeDidUpdateHomeEnergyManagerEnabled_)) {
      objc_msgSend(a1, sel_homeDidUpdateHomeEnergyManagerEnabled_, v6);
    }
  }
}

uint64_t sub_20BAC3B7C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_20BAC3B9C, 0, 0);
}

uint64_t sub_20BAC3B9C()
{
  sub_20BCE7230();
  uint64_t v1 = sub_20BCE7200();
  v0[4] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[5] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_20BAC3C50;
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  return MEMORY[0x270F3C708](v4, v3, v1);
}

uint64_t sub_20BAC3C50(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_20BAC3DA8, 0, 0);
  }
  else
  {

    uint64_t v6 = *(uint64_t (**)(uint64_t))(v5 + 8);
    return v6(a1);
  }
}

uint64_t sub_20BAC3DA8()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_20BAC3F84(int a1, void *aBlock)
{
  v2[2] = _Block_copy(aBlock);
  v2[3] = sub_20BCE7620();
  v2[4] = v3;
  return MEMORY[0x270FA2498](sub_20BAC4000, 0, 0);
}

uint64_t sub_20BAC4000()
{
  sub_20BCE7230();
  uint64_t v1 = sub_20BCE7200();
  v0[5] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[6] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_20BAC40B4;
  uint64_t v4 = v0[3];
  uint64_t v3 = v0[4];
  return MEMORY[0x270F3C708](v4, v3, v1);
}

uint64_t sub_20BAC40B4(void *a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_20BAC4230, 0, 0);
  }
  else
  {
    uint64_t v5 = *(void (***)(void, void, void))(v4 + 16);

    swift_bridgeObjectRelease();
    ((void (**)(void, void *, void))v5)[2](v5, a1, 0);
    _Block_release(v5);

    uint64_t v6 = *(uint64_t (**)(void))(v4 + 8);
    return v6();
  }
}

uint64_t sub_20BAC4230()
{
  uint64_t v1 = *(void **)(v0 + 56);
  uint64_t v2 = *(void (***)(void, void, void))(v0 + 16);

  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_20BCE6430();

  ((void (**)(void, void, void *))v2)[2](v2, 0, v3);
  _Block_release(v2);
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_20BAC42E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 144) = v19;
  *(void *)(v9 + 152) = v8;
  *(_OWORD *)(v9 + 112) = v17;
  *(_OWORD *)(v9 + 128) = v18;
  *(_OWORD *)(v9 + 96) = v16;
  *(void *)(v9 + 80) = a7;
  *(void *)(v9 + 88) = a8;
  *(void *)(v9 + 64) = a5;
  *(void *)(v9 + 72) = a6;
  *(void *)(v9 + 48) = a3;
  *(void *)(v9 + 56) = a4;
  *(void *)(v9 + 32) = a1;
  *(void *)(v9 + 40) = a2;
  uint64_t v12 = sub_20BCE7290();
  *(void *)(v9 + 160) = v12;
  *(void *)(v9 + 168) = *(void *)(v12 - 8);
  *(void *)(v9 + 176) = swift_task_alloc();
  *(void *)(v9 + 184) = swift_task_alloc();
  sub_20BCE74F0();
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v9 + 192) = v13;
  void *v13 = v9;
  v13[1] = sub_20BAC4438;
  return MEMORY[0x270F27008](a1, a2);
}

uint64_t sub_20BAC4438(uint64_t a1)
{
  *(void *)(*(void *)v1 + 200) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BAC4538, 0, 0);
}

uint64_t sub_20BAC4538()
{
  if (v0[25])
  {
    uint64_t v16 = (int)*MEMORY[0x263F3B600] + MEMORY[0x263F3B600];
    uint64_t v1 = (void *)swift_task_alloc();
    v0[26] = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_20BAC4824;
    __asm { BR              X8 }
  }
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v2 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_20BCE7270();
  os_log_type_t v4 = sub_20BCE7A90();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v7 = v0[21];
  uint64_t v6 = v0[22];
  uint64_t v8 = v0[20];
  unint64_t v9 = v0[5];
  if (v5)
  {
    uint64_t v10 = v0[4];
    uint64_t v15 = v0[22];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_20BA297F4(v10, v9, &v18);
    sub_20BCE7BC0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20B986000, v3, v4, "Error fetching Energy Site for %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v12, -1, -1);
    MEMORY[0x21053F820](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v15, v8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13(0);
}

uint64_t sub_20BAC4824(char a1)
{
  uint64_t v3 = *v2;
  *(unsigned char *)(v3 + 236) = a1;
  *(void *)(v3 + 216) = v1;
  swift_task_dealloc();
  if (v1) {
    os_log_type_t v4 = sub_20BAC4D80;
  }
  else {
    os_log_type_t v4 = sub_20BAC493C;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_20BAC493C()
{
  uint64_t v17 = v0;
  if (qword_26AB2E398 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26AB2FF58;
  sub_20BCE72A0();
  id v2 = sub_20BCE7270();
  os_log_type_t v3 = sub_20BCE7AA0();
  if (os_log_type_enabled(v2, v3))
  {
    int v4 = *(unsigned __int8 *)(v0 + 236);
    uint64_t v15 = *(void *)(v0 + 184);
    uint64_t v5 = *(void *)(v0 + 168);
    uint64_t v14 = *(void *)(v0 + 160);
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v16 = v7;
    *(_DWORD *)uint64_t v6 = 136315394;
    *(void *)(v0 + 24) = sub_20BA297F4(0xD00000000000008DLL, 0x800000020BD16020, &v16);
    sub_20BCE7BC0();
    *(_WORD *)(v6 + 12) = 1024;
    *(_DWORD *)(v0 + 232) = v4;
    sub_20BCE7BC0();
    _os_log_impl(&dword_20B986000, v2, v3, "%s Created utility subscription: %{BOOL}d", (uint8_t *)v6, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x21053F820](v7, -1, -1);
    MEMORY[0x21053F820](v6, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v15, v14);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 184);
    uint64_t v9 = *(void *)(v0 + 160);
    uint64_t v10 = *(void *)(v0 + 168);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  if (*(unsigned char *)(v0 + 236) == 1)
  {
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 224) = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_20BAC4C0C;
    return sub_20BAB8BF8(1);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13(0);
  }
}

uint64_t sub_20BAC4C0C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_20BAC4D08, 0, 0);
}

uint64_t sub_20BAC4D08()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v1(1);
}

uint64_t sub_20BAC4D80()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_20BAC4FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, void *a10)
{
  void v10[2] = a10;
  uint64_t v11 = sub_20BCE6540();
  v10[3] = v11;
  v10[4] = *(void *)(v11 - 8);
  v10[5] = swift_task_alloc();
  void v10[6] = _Block_copy(a9);
  uint64_t v12 = sub_20BCE7620();
  uint64_t v32 = v13;
  uint64_t v33 = v12;
  v10[7] = v13;
  uint64_t v14 = sub_20BCE7620();
  uint64_t v30 = v15;
  uint64_t v31 = v14;
  v10[8] = v15;
  uint64_t v16 = sub_20BCE7620();
  uint64_t v28 = v17;
  uint64_t v29 = v16;
  v10[9] = v17;
  uint64_t v26 = sub_20BCE7620();
  uint64_t v19 = v18;
  v10[10] = v18;
  sub_20BCE6510();
  sub_20BCE7620();
  v10[11] = v20;
  sub_20BCE7620();
  v10[12] = v21;
  if (a8)
  {
    sub_20BCE7620();
    uint64_t v23 = v22;
  }
  else
  {
    uint64_t v23 = 0;
  }
  v10[13] = v23;
  a10;
  unint64_t v24 = (void *)swift_task_alloc();
  v10[14] = v24;
  *unint64_t v24 = v10;
  v24[1] = sub_20BAC51F8;
  return sub_20BAC42E0(v33, v32, v31, v30, v29, v28, v26, v19);
}

uint64_t sub_20BAC51F8(char a1)
{
  uint64_t v12 = (void *)*v2;
  uint64_t v3 = (void *)*v2;
  int v4 = (void *)*v2;
  swift_task_dealloc();
  uint64_t v5 = v3[6];
  uint64_t v6 = (void *)v3[2];
  (*(void (**)(void, void))(v3[4] + 8))(v3[5], v3[3]);

  uint64_t v7 = v1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v8 = (void *)sub_20BCE6430();

    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, a1 & 1, 0);
  }
  _Block_release((const void *)v12[6]);
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v4[1];
  return v9();
}

id HFHomeEnergyManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void HFHomeEnergyManager.init()()
{
}

id HFHomeEnergyManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HFHomeEnergyManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20BAC561C()
{
  uint64_t result = sub_20BCE75E0();
  qword_26AB2E5D0 = result;
  return result;
}

id static NSNotificationName.gridForecastEnabledDidChange.getter()
{
  return sub_20BA97CF0(&qword_26AB2E5E0, (void **)&qword_26AB2E5D0);
}

uint64_t sub_20BAC5678()
{
  uint64_t result = sub_20BCE75E0();
  qword_26AB2E5E8 = result;
  return result;
}

id static NSNotificationName.hasUtilitySubscriptionDidChange.getter()
{
  return sub_20BA97CF0(&qword_26AB2E5F8, (void **)&qword_26AB2E5E8);
}

uint64_t sub_20BAC56D4(uint64_t a1)
{
  int v4 = *v1;
  v2[2] = v2;
  v2[7] = v2 + 15;
  v2[3] = sub_20BAC57D8;
  uint64_t v5 = swift_continuation_init();
  v2[10] = MEMORY[0x263EF8330];
  v2[11] = 0x40000000;
  v2[12] = sub_20BABBE74;
  v2[13] = &block_descriptor_0;
  v2[14] = v5;
  objc_msgSend(v4, sel_reverseGeocodeLocation_completionHandler_, a1, v2 + 10);
  return MEMORY[0x270FA23F0](v2 + 2);
}

uint64_t sub_20BAC57D8()
{
  uint64_t v1 = *v0;
  if (*(void *)(*v0 + 48))
  {
    swift_willThrow();
    objc_super v2 = *(uint64_t (**)(void))(v1 + 8);
    return v2();
  }
  else
  {
    uint64_t v4 = *(void *)(*v0 + 120);
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v1 + 8);
    return v5(v4);
  }
}

uint64_t sub_20BAC5918(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_20BA20C04;
  return v6();
}

uint64_t sub_20BAC59E4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_20BA20C04;
  return v7();
}

uint64_t sub_20BAC5AB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_20BCE7870();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_20BCE7860();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_20BA1FD90(a1, &qword_26AB2E3E0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20BCE77E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_20BAC5C5C(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = sub_20BCE65C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_20BA208F4(0, &qword_26AB2E3E8);
  uint64_t v11 = &a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedRegionCode];
  *uint64_t v11 = 0;
  v11[1] = 0;
  a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable] = 2;
  v35[3] = v10;
  v35[4] = &protocol witness table for CLGeocoder;
  *(void *)&a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_temporaryLocation] = 0;
  v35[0] = a2;
  uint64_t v12 = &a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable];
  a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable] = 2;
  uint64_t v13 = &a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_homeElectricitySupportedCache];
  void *v13 = 0xD00000000000001DLL;
  v13[1] = 0x800000020BD162F0;
  uint64_t v14 = &a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_hasUtilitySubscriptionCache];
  *uint64_t v14 = 0xD00000000000001ELL;
  v14[1] = 0x800000020BD164C0;
  a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite] = 0;
  *(void *)&a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home] = a1;
  sub_20BA45B64((uint64_t)v35, (uint64_t)&a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_geocoder]);
  uint64_t v15 = self;
  uint64_t v16 = a3;
  id v17 = a1;
  id v18 = objc_msgSend(v15, sel_standardUserDefaults);
  id v19 = objc_msgSend(v18, sel_dictionaryForKey_, @"homeEnergyAvailableCache");

  if (v19)
  {
    unint64_t v20 = sub_20BCE7520();
  }
  else
  {
    unint64_t v20 = sub_20BA120C0(MEMORY[0x263F8EE78]);
  }
  id v21 = objc_msgSend(v17, sel_uniqueIdentifier);
  sub_20BCE6590();

  uint64_t v22 = sub_20BCE6560();
  uint64_t v24 = v23;
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  if (*(void *)(v20 + 16) && (uint64_t v25 = sub_20BA16D9C(v22, v24), (v26 & 1) != 0))
  {
    sub_20BA200A0(*(void *)(v20 + 56) + 32 * v25, (uint64_t)&v33);
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v34 + 1))
  {
    if (swift_dynamicCast()) {
      char v27 = v31[15];
    }
    else {
      char v27 = 2;
    }
  }
  else
  {
    sub_20BA1FD90((uint64_t)&v33, (uint64_t *)&unk_26AB2E690);
    char v27 = 2;
  }
  swift_beginAccess();
  *uint64_t v12 = v27;

  uint64_t v28 = (objc_class *)type metadata accessor for HFHomeEnergyManager();
  v32.receiver = v16;
  v32.super_class = v28;
  id v29 = objc_msgSendSuper2(&v32, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v35);
  return v29;
}

id sub_20BAC5FCC(void *a1, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_20BCE65C0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = &v35[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v39[3] = a4;
  v39[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v39);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  uint64_t v15 = &a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedRegionCode];
  *uint64_t v15 = 0;
  v15[1] = 0;
  a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable] = 2;
  *(void *)&a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_temporaryLocation] = 0;
  uint64_t v16 = &a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable];
  a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable] = 2;
  id v17 = &a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_homeElectricitySupportedCache];
  *id v17 = 0xD00000000000001DLL;
  v17[1] = 0x800000020BD162F0;
  id v18 = &a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_hasUtilitySubscriptionCache];
  *id v18 = 0xD00000000000001ELL;
  v18[1] = 0x800000020BD164C0;
  a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite] = 0;
  *(void *)&a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_home] = a1;
  sub_20BA45B64((uint64_t)v39, (uint64_t)&a3[OBJC_IVAR____TtC4Home19HFHomeEnergyManager_geocoder]);
  id v19 = self;
  unint64_t v20 = a3;
  id v21 = a1;
  id v22 = objc_msgSend(v19, sel_standardUserDefaults);
  id v23 = objc_msgSend(v22, sel_dictionaryForKey_, @"homeEnergyAvailableCache");

  if (v23)
  {
    unint64_t v24 = sub_20BCE7520();
  }
  else
  {
    unint64_t v24 = sub_20BA120C0(MEMORY[0x263F8EE78]);
  }
  id v25 = objc_msgSend(v21, sel_uniqueIdentifier);
  sub_20BCE6590();

  uint64_t v26 = sub_20BCE6560();
  uint64_t v28 = v27;
  (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v13, v10);
  if (*(void *)(v24 + 16) && (uint64_t v29 = sub_20BA16D9C(v26, v28), (v30 & 1) != 0))
  {
    sub_20BA200A0(*(void *)(v24 + 56) + 32 * v29, (uint64_t)&v37);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v38 + 1))
  {
    if (swift_dynamicCast()) {
      char v31 = v35[15];
    }
    else {
      char v31 = 2;
    }
  }
  else
  {
    sub_20BA1FD90((uint64_t)&v37, (uint64_t *)&unk_26AB2E690);
    char v31 = 2;
  }
  swift_beginAccess();
  *uint64_t v16 = v31;

  objc_super v32 = (objc_class *)type metadata accessor for HFHomeEnergyManager();
  v36.receiver = v20;
  v36.super_class = v32;
  id v33 = objc_msgSendSuper2(&v36, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
  return v33;
}

id sub_20BAC6358(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = objc_allocWithZone((Class)type metadata accessor for HFHomeEnergyManager());
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, a4);
  return sub_20BAC5FCC(a1, (uint64_t)v11, v12, a4, a5);
}

uint64_t sub_20BAC644C()
{
  uint64_t v0 = sub_20BCE6610();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E380);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20BCE6600();
  sub_20BCE65F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v7 = sub_20BCE65E0();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_20BA1FD90((uint64_t)v6, &qword_26AB2E380);
  }
  else
  {
    sub_20BCE65D0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  char v9 = sub_20BCE66E0();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_20BAC6624@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable, a2);
}

uint64_t sub_20BAC6630(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable, (uint64_t (*)(uint64_t))sub_20BAB653C);
}

id sub_20BAC6650@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_temporaryLocation);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_20BAC66B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20BAB6C18();
  *a1 = result & 1;
  return result;
}

uint64_t sub_20BAC66E8(char *a1)
{
  return sub_20BAB6E80(*a1);
}

uint64_t sub_20BAC6710@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable, a2);
}

uint64_t keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, unsigned char *a3@<X8>)
{
  uint64_t v4 = (unsigned char *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_20BAC676C(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable, (uint64_t (*)(uint64_t))sub_20BAB72D4);
}

uint64_t keypath_setTm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(uint64_t))
{
  char v7 = *a1;
  uint64_t v8 = (unsigned char *)(*a2 + *a5);
  uint64_t v9 = swift_beginAccess();
  *uint64_t v8 = v7;
  return a6(v9);
}

uint64_t sub_20BAC67EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20BAB8534();
  *a1 = result & 1;
  return result;
}

void sub_20BAC681C(char *a1)
{
}

uint64_t sub_20BAC6844@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_20BAC6898(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t dispatch thunk of Geocoding.reverseGeocodeLocation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  char v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *char v7 = v3;
  v7[1] = sub_20BA20C14;
  return v9(a1, a2, a3);
}

uint64_t method lookup function for HFHomeEnergyManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HFHomeEnergyManager);
}

uint64_t dispatch thunk of HFHomeEnergyManager.__allocating_init(home:geocoder:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isGridForecastAvailable.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isGridForecastAvailable.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isGridForecastAvailable.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.temporaryLocation.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.temporaryLocation.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.temporaryLocation.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isGridForecastVisible.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isGridForecastEnabled.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isGridForecastEnabled.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isGridForecastEnabled.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.effectiveGridForecastAvailable.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.cachedGridForecastAvailable.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.cachedGridForecastAvailable.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.cachedGridForecastAvailable.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.updateHomeEnergyAvailableFeatures()()
{
  char v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x128);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_20BA1FF3C;
  return v5();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isHomeElectricitySupported.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isHomeElectricitySupported.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isHomeElectricitySupported.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.cachedHasEnergySite.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.cachedHasUtilitySubscription.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isHomeEnergyVisible.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isHomeElectricitySupportedInHomeRegion()()
{
  char v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x188);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_20BAC846C;
  return v5();
}

uint64_t dispatch thunk of HFHomeEnergyManager.utilityDetails()()
{
  char v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x190);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_20BA7CB38;
  return v5();
}

uint64_t dispatch thunk of HFHomeEnergyManager.revokeSubscription()()
{
  char v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x198);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_20BAC846C;
  return v5();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isRevokeDisconnectUtilityAllowed()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.isGridForecastAvailableInHomeRegion()()
{
  char v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x1A8);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_20BA7CB38;
  return v5();
}

uint64_t dispatch thunk of HFHomeEnergyManager.homeRegion()()
{
  char v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x1B0);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_20BAC7504;
  return v5();
}

uint64_t sub_20BAC7504(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t dispatch thunk of HFHomeEnergyManager.isGridForecastAvailableForNewFeaturesView()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of HFHomeEnergyManager.lookupCountryCode(_:)(uint64_t a1)
{
  uint64_t v4 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x1C0);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_20BAC7760;
  return v7(a1);
}

uint64_t sub_20BAC7760(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t dispatch thunk of static HFHomeEnergyManager.utilityConfiguration(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 464) + **(int **)(v2 + 464));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_20BA1FF3C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of HFHomeEnergyManager.createUtilitySubscription(homeID:utilityID:serviceLocationID:accessToken:accessTokenExpirationDate:refreshToken:address:utilityCustomerName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  id v18 = *(int **)((*MEMORY[0x263F8EED0] & *v15) + 0x1D8);
  id v21 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v18 + *v18);
  id v19 = (void *)swift_task_alloc();
  *(void *)(v16 + 16) = v19;
  *id v19 = v16;
  v19[1] = sub_20BA20C14;
  return v21(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_20BAC7AD4()
{
  _Block_release(*(const void **)(v0 + 80));
  return MEMORY[0x270FA0238](v0, 96, 7);
}

void sub_20BAC7B54()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_20BA20C04;
  uint64_t v2 = (char *)&dword_2676AF980 + dword_2676AF980;
  __asm { BR              X8; sub_20BAC4FE4 }
}

uint64_t sub_20BAC7C54()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20BAC7C8C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_20BA1FC8C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2676AF9A0 + dword_2676AF9A0);
  return v6(a1, v4);
}

uint64_t sub_20BAC7D48()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_20BA20C04;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2676AF9B0 + dword_2676AF9B0);
  return v5(v2, v3);
}

uint64_t sub_20BAC7E00()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_20BA1FC8C;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2676AF9D0 + dword_2676AF9D0);
  return v5(v2, v3);
}

uint64_t sub_20BAC7EB8()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_20BA20C04;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2676AF9F0 + dword_2676AF9F0);
  return v5(v2, v3);
}

uint64_t sub_20BAC7F70()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_20BA20C04;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2676AFA10 + dword_2676AFA10);
  return v5(v2, v3);
}

uint64_t sub_20BAC8028()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_20BA20C04;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2676AFA30 + dword_2676AFA30);
  return v5(v2, v3);
}

uint64_t objectdestroy_68Tm()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20BAC8120()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_20BA20C04;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_2676AFA50 + dword_2676AFA50);
  return v5(v2, v3);
}

uint64_t sub_20BAC81D4()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_20BAC8214()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_20BA20C04;
  uint64_t v5 = (uint64_t (*)(int, void *))((char *)&dword_2676AFA70 + dword_2676AFA70);
  return v5(v2, v3);
}

uint64_t sub_20BAC82D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E5C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20BAC8338()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_20BAC8370()
{
}

unint64_t sub_20BAC8378()
{
  unint64_t result = qword_26AB2E3B8;
  if (!qword_26AB2E3B8)
  {
    sub_20BCE73D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB2E3B8);
  }
  return result;
}

unint64_t sub_20BAC83D0()
{
  unint64_t result = qword_26AB2E3D0;
  if (!qword_26AB2E3D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AB2E3C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB2E3D0);
  }
  return result;
}

uint64_t sub_20BAC842C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_20BAC8464(void *a1)
{
  sub_20BAC3ADC(a1, v1);
}

void sub_20BACE354(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_20BACE66C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_20BACEA88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_20BACF168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BACFD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_20BAD0A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_20BAD1AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BAD3954(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20BAD4420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BAD5184(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_20BAD816C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BADA4F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_20BADBD6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v22 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_20BAE2AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HFToggledPrimaryState(uint64_t a1)
{
  if (a1 == 2) {
    return 1;
  }
  else {
    return 2 * (a1 == 1);
  }
}

BOOL HFIsValidPrimaryState(uint64_t a1)
{
  return a1 != 0;
}

__CFString *NSStringFromHFRemoteAccessState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"NotSet";
  }
  else {
    return off_26408DA08[a1 - 1];
  }
}

__CFString *HFLocalizedStringFromHMHomeInvitationState(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v2 = @"HMHomeInvitationStateCanceled";
      goto LABEL_10;
    case 2:
    case 5:
    case 7:
      uint64_t v2 = @"HMHomeInvitationStatePending";
      goto LABEL_10;
    case 3:
      uint64_t v2 = @"HMHomeInvitationStateAccepted";
      goto LABEL_10;
    case 4:
      uint64_t v2 = @"HMHomeInvitationStateDeclined";
      goto LABEL_10;
    case 6:
      uint64_t v2 = @"HMHomeInvitationStateExpired";
LABEL_10:
      _HFLocalizedStringWithDefaultValue(v2, v2, 1);
      uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      uint64_t v3 = &stru_26C081158;
      break;
  }
  return v3;
}

void sub_20BAE4B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HFCAPackageStateForHFPrimaryState(uint64_t a1)
{
  uint64_t v1 = &HFCAPackageStateOn;
  if (a1 != 2) {
    uint64_t v1 = &HFCAPackageStateOff;
  }
  return *v1;
}

__CFString *HFVibrantStateForHFCAPackageState(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = v1;
  if (HFCAPackageStateOn == v1)
  {
    uint64_t v1 = HFCAPackageStateOnVibrant;
  }
  else if (HFCAPackageStateActivated == v1)
  {
    uint64_t v1 = HFCAPackageStateActivatedVibrant;
  }
  uint64_t v3 = v1;

  return v3;
}

void sub_20BAE6034(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_20BAE6930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_20BAE6B38(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_20BAE6D28(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_20BAE70B0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_20BAE73EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_20BAE7760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_20BAE988C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20BAF36C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BAF5394(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_20BAF7A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BAF7BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BAFD4D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_20BAFD718(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BAFD898(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void FetchNaturalLightColorTemperatureForBrightness(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __FetchNaturalLightColorTemperatureForBrightness_block_invoke;
  v9[3] = &unk_26408EAB0;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  [v8 fetchNaturalLightColorTemperatureForBrightness:a1 completion:v9];
}

void __FetchNaturalLightColorTemperatureForBrightness_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138412802;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Fetch natural light color temp for profile: %@ %@ error: %@", (uint8_t *)&v11, 0x20u);
    }

    uint64_t v9 = 0;
  }
  else
  {
    [v5 floatValue];
    uint64_t v9 = HFGetUIColorFromMired(v10);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_20BB00304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB02B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20BB05AF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20BB09F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB0AE08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB0B2F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak(v3);
  _Unwind_Resume(a1);
}

void sub_20BB0BA70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BB0BD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB0CEC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BB0D318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_20BB0DA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMPresenceEventUserTypeFromSelectedUserCollectionType(unint64_t a1)
{
  if (a1 < 3) {
    return qword_20BD13620[a1];
  }
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:a1];
  NSLog(&cfstr_UnexpectedUser.isa, v2);

  return 2;
}

uint64_t HFSelectedUserCollectionTypeFromPresenceEventUserType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 3) {
    return qword_20BD13638[a1 - 1];
  }
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:a1];
  NSLog(&cfstr_UnknownPresenc.isa, v2);

  return 0;
}

void sub_20BB144FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

__CFString *HFStringFromHFLocationEventType(unint64_t a1)
{
  if (a1 < 3) {
    return off_26408F840[a1];
  }
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"NSString * _Nonnull HFStringFromHFLocationEventType(HFLocationEventType)"];
  [v2 handleFailureInFunction:v3 file:@"HFLocationEventAdditions.m" lineNumber:29 description:@"Unknown HFLocationEventType"];

  return &stru_26C081158;
}

__CFString *NSStringFromHFPresenceEventActivationGranularity(uint64_t a1)
{
  uint64_t v1 = @"(unknown)";
  if (!a1) {
    uint64_t v1 = @"ActivationGranularityUser";
  }
  if (a1 == 1) {
    return @"ActivationGranularityHome";
  }
  else {
    return v1;
  }
}

void sub_20BB1A608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB1ABDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB1BA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB1D21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_20BB1E9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB1F7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB1F9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB1FCA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB1FE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHMSoftwareUpdateState(unint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Yet to stringify HMSoftwareUpdateState: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v5 = v1;
      _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v1);
  }
  else
  {
    uint64_t v1 = off_264090080[a1];
  }
  return v1;
}

__CFString *NSStringFromHMSoftwareUpdateStatusV2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 - 1) >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"HMSoftwareUpdateStatusV2(%ld)", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v5 = v1;
      _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v1);
  }
  else
  {
    uint64_t v1 = off_2640900B0[a1 - 1];
  }
  return v1;
}

__CFString *NSStringFromHMHomeInvitationState(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 - 1) >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Yet to stringify HMHomeInvitationState: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v5 = v1;
      _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v1);
  }
  else
  {
    uint64_t v1 = off_264090140[a1 - 1];
  }
  return v1;
}

void sub_20BB26A24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    uint64_t v10 = HFLogForCategory(0x41uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v9;
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "Tried to decode something that didn't want to be decoded... : %@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x20BB269E0);
  }
  _Unwind_Resume(exception_object);
}

__CFString *NSStringFromNSPropertyListFormat(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  switch(a1)
  {
    case 1:
      uint64_t v1 = @"NSPropertyListOpenStepFormat";
      break;
    case 200:
      uint64_t v1 = @"NSPropertyListBinaryFormat_v1_0";
      break;
    case 100:
      uint64_t v1 = @"NSPropertyListXMLFormat_v1_0";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"Yet to stringify NSPropertyListFormat: %lu", a1);
      uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v2 = HFLogForCategory(0x25uLL);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v5 = v1;
        _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      NSLog(&stru_26C081038.isa, v1);
      break;
  }
  return v1;
}

void sub_20BB26D80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    uint64_t v10 = HFLogForCategory(0x41uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v9;
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "Tried to decode something that didn't want to be decoded... : %@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x20BB26D3CLL);
  }
  _Unwind_Resume(exception_object);
}

__CFString *NSStringFromHMUserActionPredictionType(unint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Yet to stringify HMUserActionPredictionType: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v5 = v1;
      _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v1);
  }
  else
  {
    uint64_t v1 = off_264090178[a1];
  }
  return v1;
}

__CFString *NSStringFromHMMediaPlaybackState(unint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Yet to stringify HMMediaPlaybackState: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v5 = v1;
      _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v1);
  }
  else
  {
    uint64_t v1 = off_2640901A0[a1];
  }
  return v1;
}

__CFString *NSStringFromHMCameraStreamState(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a1 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Yet to stringify HMCameraStreamState: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v5 = v1;
      _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v1);
  }
  else
  {
    uint64_t v1 = off_2640901D8[a1 - 1];
  }
  return v1;
}

__CFString *NSStringFromHMSymptomFixSessionState(unint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Yet to stringify HMSymptomFixSessionState: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v5 = v1;
      _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v1);
  }
  else
  {
    uint64_t v1 = off_2640901F8[a1];
  }
  return v1;
}

__CFString *NSStringFromConfigurationState(unint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Yet to stringify HMServiceConfigurationState: %lu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = HFLogForCategory(0x25uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v5 = v1;
      _os_log_error_impl(&dword_20B986000, v2, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    NSLog(&stru_26C081038.isa, v1);
  }
  else
  {
    uint64_t v1 = off_264090210[a1];
  }
  return v1;
}

__CFString *NSStringFromBooleanValue(int a1)
{
  if (a1) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

__CFString *NSStringFromNSOperationQueuePriority(uint64_t a1)
{
  *((void *)&v2 + 1) = a1;
  *(void *)&long long v2 = a1 + 8;
  unint64_t v1 = v2 >> 2;
  if (v1 > 4) {
    return @"Unknown";
  }
  else {
    return off_264090230[v1];
  }
}

id HFDescriptionForBitmask(unint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __HFDescriptionForBitmask_block_invoke;
  id v18 = &unk_264090028;
  id v5 = v3;
  id v20 = v5;
  id v6 = v4;
  id v19 = v6;
  id v7 = &v15;
  if (a1)
  {
    char v21 = 0;
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v8.i16[0] = vaddlv_u8(v8);
    int v9 = v8.i32[0];
    if (v8.i32[0])
    {
      unsigned int v10 = 0;
      do
      {
        if (((1 << v10) & a1) != 0)
        {
          ((void (*)(uint64_t *))v17)(v7);
          if (v21) {
            break;
          }
          --v9;
        }
        if (v10 > 0x3E) {
          break;
        }
        ++v10;
      }
      while (v9 > 0);
    }
  }

  int v11 = NSString;
  uint64_t v12 = [v6 componentsJoinedByString:@","];
  uint64_t v13 = [v11 stringWithFormat:@"{%@}", v12, v15, v16];

  return v13;
}

void __HFDescriptionForBitmask_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v5 = *(void **)(a1 + 32);
  id v7 = (id)v4;
  if (v4)
  {
    [v5 addObject:v4];
  }
  else
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%lu)", a2);
    [v5 addObject:v6];
  }
}

void sub_20BB29460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB29820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB31AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB35254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB390BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB3936C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB39554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB39728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB40B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB41254(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHMSymptomType(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1 - 1;
  unint64_t result = @"HMSymptomTypeNeediCloudCredential";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = @"HMSymptomTypeNeediTunesCredential";
      break;
    case 2:
      unint64_t result = @"HMSymptomTypeNeedHomeKitFix";
      break;
    case 3:
      unint64_t result = @"HMSymptomTypeNeedWiFiFix";
      break;
    case 4:
      unint64_t result = @"HMSymptomTypeNeedWiFiPerformanceFix";
      break;
    case 5:
      unint64_t result = @"HMSymptomTypeNeedInternetFix";
      break;
    case 6:
      unint64_t result = @"HMSymptomTypeNeedHardwareFix";
      break;
    case 7:
      unint64_t result = @"HMSymptomTypeStereoVersionMismatch";
      break;
    case 8:
      unint64_t result = @"HMSymptomTypeStereoNotFound";
      break;
    case 9:
      unint64_t result = @"HMSymptomTypeStereoError";
      break;
    case 10:
      unint64_t result = @"HMSymptomTypeWiFiNetworkMismatch";
      break;
    case 11:
      unint64_t result = @"HMSymptomTypeNoConfiguredTargets";
      break;
    case 12:
      unint64_t result = @"HMSymptomTypeVPNProfileExpired";
      break;
    case 13:
      unint64_t result = @"HMSymptomTypeNeed8021xNetworkFix";
      break;
    case 14:
      unint64_t result = @"HMSymptomTypeNeedWiFiSecurityFix";
      break;
    case 15:
      unint64_t result = @"HMSymptomTypeNeedNetworkProfileFix";
      break;
    case 16:
      unint64_t result = @"HMSymptomTypeNeedNetworkProfileInstall";
      break;
    case 17:
      unint64_t result = @"HMSymptomTypeNetworkNotShareable";
      break;
    case 18:
      unint64_t result = @"HMSymptomTypeNeedCaptiveLeaseRenewal";
      break;
    case 19:
      unint64_t result = @"HMSymptomTypeNeedCDPFix";
      break;
    case 20:
      unint64_t result = @"HMSymptomTypePrimaryResidentUnreachable";
      break;
    default:
      if (@"HMSymptomTypeNeediCloudCredential" == (__CFString *)999)
      {
        unint64_t result = @"HMSymptomTypeNeedGeneralFix";
      }
      else if (@"HMSymptomTypeNeediCloudCredential" == (__CFString *)1000)
      {
        unint64_t result = @"HMSymptomTypeFixInProgress";
      }
      else
      {
        id v3 = HFLogForCategory(0);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          int v4 = 136315394;
          id v5 = "NSString * _Nonnull NSStringFromHMSymptomType(HMSymptomType)";
          __int16 v6 = 2048;
          id v7 = @"HMSymptomTypeNeediCloudCredential";
          _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "%s: Unhandled symptom type: %ld", (uint8_t *)&v4, 0x16u);
        }

        unint64_t result = @"HMSymptomType??????";
      }
      break;
  }
  return result;
}

uint64_t NSStringToHMSymptomType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"HMSymptomTypeNeediCloudCredential"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"HMSymptomTypeNeediTunesCredential"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"HMSymptomTypeNeedHomeKitFix"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"HMSymptomTypeNeedWiFiFix"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"HMSymptomTypeNeedWiFiPerformanceFix"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"HMSymptomTypeNeedInternetFix"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"HMSymptomTypeNeedHardwareFix"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"HMSymptomTypeStereoVersionMismatch"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"HMSymptomTypeStereoNotFound"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"HMSymptomTypeStereoError"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"HMSymptomTypeWiFiNetworkMismatch"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"HMSymptomTypeFixInProgress"])
  {
    uint64_t v2 = 1000;
  }
  else
  {
    if (([v1 isEqualToString:@"HMSymptomTypeNeedGeneralFix"] & 1) == 0)
    {
      if ([v1 isEqualToString:@"HMSymptomTypeNoConfiguredTargets"])
      {
        uint64_t v2 = 12;
        goto LABEL_45;
      }
      if ([v1 isEqualToString:@"HMSymptomTypeVPNProfileExpired"])
      {
        uint64_t v2 = 13;
        goto LABEL_45;
      }
      if ([v1 isEqualToString:@"HMSymptomTypeNeed8021xNetworkFix"])
      {
        uint64_t v2 = 14;
        goto LABEL_45;
      }
      if ([v1 isEqualToString:@"HMSymptomTypeNeedWiFiSecurityFix"])
      {
        uint64_t v2 = 15;
        goto LABEL_45;
      }
      if ([v1 isEqualToString:@"HMSymptomTypeNeedNetworkProfileFix"])
      {
        uint64_t v2 = 16;
        goto LABEL_45;
      }
      if ([v1 isEqualToString:@"HMSymptomTypeNeedNetworkProfileInstall"])
      {
        uint64_t v2 = 17;
        goto LABEL_45;
      }
      if ([v1 isEqualToString:@"HMSymptomTypeNetworkNotShareable"])
      {
        uint64_t v2 = 18;
        goto LABEL_45;
      }
      if ([v1 isEqualToString:@"HMSymptomTypeNeedCaptiveLeaseRenewal"])
      {
        uint64_t v2 = 19;
        goto LABEL_45;
      }
      if ([v1 isEqualToString:@"HMSymptomTypeNeedCDPFix"])
      {
        uint64_t v2 = 20;
        goto LABEL_45;
      }
      int v4 = [MEMORY[0x263F08690] currentHandler];
      id v5 = [NSString stringWithUTF8String:"HMSymptomType NSStringToHMSymptomType(NSString *__strong _Nonnull)"];
      [v4 handleFailureInFunction:v5, @"HMSymptomsHandler+HFAdditions.m", 153, @"Unsupported Symptom: %@", v1 file lineNumber description];
    }
    uint64_t v2 = 999;
  }
LABEL_45:

  return v2;
}

void sub_20BB50130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB51460(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20BB55A6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20BB55D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB58254(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHFControlItemCharacteristicUsage(unint64_t a1)
{
  if (a1 > 2) {
    return @"(unknown)";
  }
  else {
    return off_264091BA8[a1];
  }
}

void sub_20BB59550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB5DA90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB5F530(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BB61970(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BB682C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB6A394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB6A78C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BB6A884(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB6AC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB6AD90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB6B1A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BB6B2A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB6B750(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BB6B850(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB6BDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB6BE9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB6C444(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20BB6C52C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB6C754(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20BB6CE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB6CF58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB6D1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB6D2E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB6D5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB6D8B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_20BB6DCE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20BB6DDCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB6E020(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20BB6E108(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB6F270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_20BB6F434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_20BB70CA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_20BB71BB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20BB76B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB76E58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB7B800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB8107C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB81FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_20BB86D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB88E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB89250(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id HFPrunePropertyList(void *a1)
{
  id v1 = a1;
  if (([v1 conformsToProtocol:&unk_26C1524E0] & 1) == 0)
  {
    NSLog(&cfstr_FoundObjectInP.isa, v1);
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    if ([v2 count])
    {
      uint64_t v3 = objc_msgSend(v2, "na_dictionaryByMappingValues:", &__block_literal_global_73);
LABEL_10:
      id v4 = (id)v3;
LABEL_12:

      goto LABEL_16;
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    if ([v2 count])
    {
      uint64_t v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_56_0);
      goto LABEL_10;
    }
LABEL_11:
    id v4 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v1 length])
  {
LABEL_6:
    id v4 = 0;
    goto LABEL_16;
  }
  id v4 = v1;
LABEL_16:

  return v4;
}

id __HFPrunePropertyList_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return HFPrunePropertyList(a3);
}

id __HFPrunePropertyList_block_invoke_2(uint64_t a1, void *a2)
{
  return HFPrunePropertyList(a2);
}

void sub_20BB89CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB8C604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB8CAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 216), 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_20BB8D528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BB8F0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_20BB926AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_20BB95270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 112));
  _Unwind_Resume(a1);
}

void sub_20BB96830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB96A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB96BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB96DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHMCameraStreamingOption(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_264093EB8[a1];
  }
}

uint64_t cameraStreamingOptionFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"HFCameraStreamingOptionOff"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"HFCameraStreamingOptionStreamAndRecord"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"HFCameraStreamingOptionDetectActivity"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"HFCameraStreamingOptionStream"];
  }

  return v2;
}

__CFString *NSStringFromHMCameraMotionDetectionType(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  unint64_t result = 0;
  switch(v1)
  {
    case 0:
      unint64_t result = @"HFCameraRecordingEventAnyMotion";
      break;
    case 1:
      unint64_t result = @"HFCameraRecordingEventPeople";
      break;
    case 2:
    case 4:
    case 5:
    case 6:
      return result;
    case 3:
      unint64_t result = @"HFCameraRecordingEventAnimals";
      break;
    case 7:
      unint64_t result = @"HFCameraRecordingEventVehicles";
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

__CFString *NSStringFromHMCameraSignificantEventPersonFamiliarityOptions(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return off_264093E98[a1 - 1];
  }
}

id HFLocalizedStringFromHMCameraAccessMode(unint64_t a1)
{
  if (a1 > 3) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = off_264093EB8[a1];
  }
  return _HFLocalizedStringWithDefaultValue(v1, v1, 1);
}

id HFLocalizedStringFromHMCameraMotionDetectionType(uint64_t a1)
{
  uint64_t v1 = HFLocalizationKeyFromHMCameraMotionDetectionType(a1);
  uint64_t v2 = _HFLocalizedStringWithDefaultValue(v1, v1, 1);

  return v2;
}

__CFString *HFLocalizationKeyFromHMCameraMotionDetectionType(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  unint64_t result = 0;
  switch(v1)
  {
    case 0:
      unint64_t result = @"HFCameraRecordingEventAnyMotion";
      break;
    case 1:
      unint64_t result = @"HFCameraRecordingEventPeople";
      break;
    case 2:
    case 4:
    case 5:
    case 6:
      return result;
    case 3:
      unint64_t result = @"HFCameraRecordingEventAnimals";
      break;
    case 7:
      unint64_t result = @"HFCameraRecordingEventVehicles";
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

id HFLocalizedStringFromHMCameraSignificantEventPersonFamiliarityOptions(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = off_264093E98[a1 - 1];
  }
  return _HFLocalizedStringWithDefaultValue(v1, v1, 1);
}

__CFString *HFLocalizationKeyFromHMCameraSignificantEventPersonFamiliarityOptions(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return off_264093E98[a1 - 1];
  }
}

void sub_20BB98828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BB98EE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BB99020(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BB9B7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSLocalizedStringFromHFMediaAccessControlClassification(uint64_t a1, int a2)
{
  switch(a1)
  {
    case 0:
      uint64_t v2 = @"HFMediaAccessControlClassificationEveryone";
      if (a2) {
        goto LABEL_9;
      }
      goto LABEL_10;
    case 1:
      uint64_t v2 = @"HFMediaAccessControlClassificationAnyoneOnTheSameNetwork";
      if (!a2) {
        goto LABEL_10;
      }
      goto LABEL_9;
    case 2:
      uint64_t v2 = @"HFMediaAccessControlClassificationOnlyPeopleSharingThisHome";
      if (a2) {
        goto LABEL_9;
      }
      goto LABEL_10;
    case 3:
      uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
      id v4 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString * _Nonnull NSLocalizedStringFromHFMediaAccessControlClassification(HFMediaAccessControlClassification, BOOL)");
      [(__CFString *)v2 handleFailureInFunction:v4 file:@"HFMediaAccessControlDescriptor.m" lineNumber:24 description:@"Well. This is unexpected.  How did you get here?"];

      uint64_t v3 = &stru_26C081158;
      goto LABEL_12;
    default:
      uint64_t v2 = 0;
      if (!a2) {
        goto LABEL_10;
      }
LABEL_9:
      uint64_t v2 = [(__CFString *)v2 stringByAppendingFormat:@"_Short"];
LABEL_10:
      _HFLocalizedStringWithDefaultValue(v2, v2, 1);
      uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      return v3;
  }
}

void sub_20BBA07D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBA37D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBA39FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HFPrimaryStateForDoorState(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return qword_20BD13728[a1];
  }
}

uint64_t HFPrimaryStateForLockMechanismState(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return qword_20BD13750[a1];
  }
}

uint64_t HFPrimaryStateForCurrentSecuritySystemState(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return qword_20BD13770[a1];
  }
}

uint64_t HFLockMechanismStateForPrimaryState(uint64_t a1)
{
  if (a1) {
    return a1 == 1;
  }
  else {
    return 3;
  }
}

BOOL HFDoorStateForPrimaryState(unint64_t a1)
{
  return a1 < 2;
}

uint64_t HFPrimaryStateForTargetSecuritySystemState(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return qword_20BD13798[a1];
  }
}

uint64_t HFTargetSecuritySystemStateForPrimaryState(unint64_t a1)
{
  if (a1 > 1) {
    return 1;
  }
  else {
    return 3;
  }
}

void sub_20BBA9700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBAC224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v15 - 112));
  _Unwind_Resume(a1);
}

void sub_20BBAC4FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BBADC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHFDiffOperationType(unint64_t a1)
{
  if (a1 > 3) {
    return @"(unknown operation type)";
  }
  else {
    return off_264094AB0[a1];
  }
}

void sub_20BBB6AE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBB765C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_20BBB88AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 88));
  _Unwind_Resume(a1);
}

void sub_20BBBF720(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_20BBC0654(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20BBC2BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id _HomeKitSettingToHFItem_CacheItemCacheKey(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    id v5 = NSString;
    id v6 = [v4 keyPath];
    id v7 = [v5 stringWithFormat:@"Group-%@", v6];
  }
  else
  {
    objc_opt_class();
    id v8 = v2;
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v6 = v9;

    if (v6)
    {
      unsigned int v10 = NSString;
      id v11 = [v6 keyPath];
      id v7 = [v10 stringWithFormat:@"Setting-%@", v11];
    }
    else
    {
      objc_opt_class();
      id v12 = v8;
      if (objc_opt_isKindOfClass()) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = 0;
      }
      id v11 = v13;

      if (v11)
      {
        uint64_t v14 = NSString;
        id v15 = [v11 keyPath];
        id v7 = [v14 stringWithFormat:@"SettingGroupEntity-%@", v15];
      }
      else
      {
        objc_opt_class();
        id v15 = v12;
        if (objc_opt_isKindOfClass()) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = 0;
        }
        id v7 = v16;

        if (v7)
        {
          uint64_t v17 = NSString;
          id v18 = [v7 title];
          id v19 = [v7 identifier];
          id v7 = [v17 stringWithFormat:@"SelectionItem-%@-%@", v18, v19];
        }
        else
        {
          id v15 = 0;
        }
      }
    }
  }

  return v7;
}

void sub_20BBC54D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  if (v1) {
    objc_destroyWeak(v2);
  }
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_20BBC950C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBCCDE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBCE1CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_20BBD4974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_20BBD5F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  if (a14) {
    (*(void (**)(void))(a14 + 16))();
  }
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Unwind_Resume(a1);
}

void sub_20BBD6648(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t HFAppProxiesContainsAppProxyWithIdentifier(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __HFAppProxiesContainsAppProxyWithIdentifier_block_invoke;
  v7[3] = &unk_264095E58;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = objc_msgSend(a1, "na_any:", v7);

  return v5;
}

void sub_20BBD6EB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t __HFAppProxiesContainsAppProxyWithIdentifier_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_20BBD8BCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_20BBDB658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BBDB7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BBDBA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BBDE02C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_20BBDEF5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
}

void sub_20BBE0230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_20BBE033C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BBE0A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBE0BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_20BBE157C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void HFAppDataSetValueIfChanged(void *a1, void *a2, void *a3)
{
  id v9 = a1;
  id v5 = a2;
  id v6 = a3;
  id v7 = [v9 objectForKeyedSubscript:v5];
  id v8 = v7;
  if (v7 != v6 && ([v7 isEqual:v6] & 1) == 0) {
    [v9 setObject:v6 forKeyedSubscript:v5];
  }
}

uint64_t _handleStateDumpRequest(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unsigned int v10 = HFLogForCategory(0x41uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138413314;
    uint64_t v13 = a1;
    __int16 v14 = 2112;
    id v15 = a2;
    __int16 v16 = 2112;
    uint64_t v17 = a3;
    __int16 v18 = 2112;
    uint64_t v19 = a4;
    __int16 v20 = 2112;
    uint64_t v21 = a5;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "_handleStateDumpRequest called with CFNotificationCenter: %@, observer: %@, name: %@, object: %@, userInfo: %@", (uint8_t *)&v12, 0x34u);
  }

  return [a2 _writeStateDump];
}

void _HFLogStateDumpNode(void *a1, void *a2, __CFString *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  if (a3) {
    id v8 = a3;
  }
  else {
    id v8 = &stru_26C081158;
  }
  id v9 = [v6 stringByAppendingString:v8];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = ___HFLogStateDumpNode_block_invoke;
  aBlock[3] = &unk_264096780;
  id v10 = v9;
  id v24 = v10;
  id v11 = v7;
  id v25 = v11;
  int v12 = (void (**)(void *, __CFString *, void *, __CFString *))_Block_copy(aBlock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    _OWORD v21[2] = ___HFLogStateDumpNode_block_invoke_87;
    v21[3] = &unk_264092CA0;
    uint64_t v13 = &v22;
    id v22 = v5;
    v12[2](v12, @"[", v21, @"]");
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = ___HFLogStateDumpNode_block_invoke_2;
      v19[3] = &unk_264092CA0;
      uint64_t v13 = &v20;
      id v20 = v5;
      v12[2](v12, @"{", v19, @"}");
    }
    else
    {
      __int16 v14 = [v5 description];
      id v15 = [v14 componentsSeparatedByString:@"\n"];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = ___HFLogStateDumpNode_block_invoke_4;
      v16[3] = &unk_26408D338;
      uint64_t v13 = &v17;
      id v17 = v10;
      id v18 = v11;
      [v15 enumerateObjectsUsingBlock:v16];
    }
  }
}

void sub_20BBEABCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  if (a16) {
    (*(void (**)(void))(a16 + 16))();
  }
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_20BBEC4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_20BBED7FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20BBEE874(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BBEF518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBEF648(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BBEFDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

void sub_20BBF7B6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_20BBF8558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBF8EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBF966C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBFAC7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBFAE1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BBFB608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBFB950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

void sub_20BBFBAAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BBFC6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBFD1C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBFD664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBFD9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BBFDEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20BBFE92C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_20BC01AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC01DC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC0218C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BC02290(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC02480(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC026F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC02A18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BC02BB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC02ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC04DEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20BC0AE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BC0B92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BC0C204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BC0C384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BC0CA20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BC0CBB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BC0CE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BC0D0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__48(uint64_t a1, uint64_t a2)
{
  unint64_t result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__49(uint64_t a1)
{
}

void sub_20BC0D744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC0F684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,id a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void __HFHomeKitSettingsValueManagerDispatchWillWriteValueForSettings_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 settings:*(void *)(a1 + 32) willWriteValueForSettings:*(void *)(a1 + 40)];
  }
}

void __HFHomeKitSettingsValueManagerDispatchDidWriteValueForSettings_block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 settings:a1[4] didWriteValueForSettings:a1[5] failedSettings:a1[6] homeKitObjectIdentifiers:a1[7]];
  }
}

void sub_20BC10E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HFHomeKitObjectUniqueIdentifiers(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263EFFA08];
  if (a1)
  {
    uint64_t v2 = objc_msgSend(a1, "na_map:", &__block_literal_global_138);
    id v3 = [v1 setWithArray:v2];
  }
  else
  {
    id v3 = [MEMORY[0x263EFFA08] set];
  }
  return v3;
}

uint64_t __HFHomeKitObjectUniqueIdentifiers_block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

void sub_20BC14FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC15A98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_20BC1D170(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BC1D2E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC1D544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC1D6D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC1ECE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20BC22AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HFOptionalLocalizedString(void *a1)
{
  return _HFLocalizedStringWithDefaultValue(a1, 0, 0);
}

id HFLocalizedStringWithDefaultValue(void *a1, void *a2)
{
  return _HFLocalizedStringWithDefaultValue(a1, a2, 0);
}

id HFLocalizedStringWithFormatterBlock(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _HFLocalizedStringWithDefaultValue(a1, v5, 0);
  id v8 = v7;
  if (v6 && ([v7 isEqualToString:v5] & 1) == 0)
  {
    uint64_t v9 = v6[2](v6, v8);

    id v8 = (void *)v9;
  }

  return v8;
}

id HFLocalizedWiFiString(void *a1)
{
  uint64_t v1 = HFLocalizedWiFiStringKeyForKey(a1);
  uint64_t v2 = _HFLocalizedStringWithDefaultValue(v1, v1, 1);

  return v2;
}

id HFLocalizedWiFiStringKeyForKey(void *a1)
{
  id v1 = a1;
  BOOL v2 = +[HFUtilities useWLANInsteadOfWiFi];
  uint64_t v3 = @"WIFI";
  if (v2) {
    uint64_t v3 = @"WLAN";
  }
  uint64_t v4 = [NSString stringWithFormat:@"%@_%@", v1, v3];

  return v4;
}

id HFLocalizedCategoryOrPrimaryServiceTypeString(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x263F0DF00];
  id v5 = a1;
  id v6 = objc_msgSend(v4, "hf_getUserFriendlyDescriptionKey:", v3);
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F0E708], "hf_getUserFriendlyDescriptionKey:", v3);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v8;

  id v10 = [NSString stringWithFormat:@"%@_%@", v5, v9];
  id v11 = NSString;
  int v12 = objc_msgSend(MEMORY[0x263F0DF00], "hf_getUserFriendlyDescriptionKey:", *MEMORY[0x263F0B0D0]);
  uint64_t v13 = [v11 stringWithFormat:@"%@_%@", v5, v12];

  uint64_t v14 = _HFLocalizedStringWithDefaultValue(v13, v13, 1);
  id v15 = _HFLocalizedStringWithDefaultValue(v10, v14, 0);

  return v15;
}

__CFString *HFNanoHomeAppBundleID()
{
  return @"com.apple.NanoHome";
}

__CFString *HFNanoHomeWidgetBundleID()
{
  return @"com.apple.NanoHome.NanoHomeWidgets";
}

__CFString *HFHomeUIServiceBundleID()
{
  return @"com.apple.Home.HomeUIService";
}

__CFString *HFHomeControlCenterModuleBundleID()
{
  return @"com.apple.Home.ControlCenter";
}

__CFString *HFHomeControlServiceBundleID()
{
  return @"com.apple.Home.HomeControlService";
}

__CFString *HFHomeKitDaemonFrameworkPath()
{
  return @"/System/Library/PrivateFrameworks/HomeKitDaemon.framework";
}

id __HFHomeApplicationBundleIdentifiers_block_invoke()
{
  if (qword_26AB2F5E0 != -1) {
    dispatch_once(&qword_26AB2F5E0, &__block_literal_global_43_1);
  }
  uint64_t v0 = (void *)qword_26AB2F5E8;
  return v0;
}

uint64_t __HFHomeApplicationBundleIdentifiers_block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.Home", @"com.apple.NanoHome", 0);
  uint64_t v1 = qword_26AB2F5E8;
  qword_26AB2F5E8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_20BC27B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BC27C74(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_20BC28E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20BC29594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BC2D6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20BC2F434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC3082C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

BOOL HFPreferencesBoolForKeyWithinDomain(void *a1, void *a2)
{
  return HFPreferencesBooleanValueForKeyWithinDomain(a1, a2) == 2;
}

uint64_t HomeKitPreferencesBooleanValueForKey(void *a1)
{
  uint64_t v1 = _InstallHomeKitPreferencesObserverIfNecessary_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_InstallHomeKitPreferencesObserverIfNecessary_onceToken, &__block_literal_global_344);
  }
  uint64_t v3 = HFPreferencesBooleanValueForKeyWithinDomain(v2, @"com.apple.homed");

  return v3;
}

id HFPreferencesNumberForKey(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    if (_InstallHomePreferencesObserverIfNecessary_onceToken != -1) {
      dispatch_once(&_InstallHomePreferencesObserverIfNecessary_onceToken, &__block_literal_global_341_0);
    }
    objc_opt_class();
    id v2 = (id)CFPreferencesCopyAppValue(v1, @"com.apple.Home");
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id HFPreferencesStringForKey(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    if (_InstallHomePreferencesObserverIfNecessary_onceToken != -1) {
      dispatch_once(&_InstallHomePreferencesObserverIfNecessary_onceToken, &__block_literal_global_341_0);
    }
    objc_opt_class();
    id v2 = (id)CFPreferencesCopyAppValue(v1, @"com.apple.Home");
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id HomeKitPreferencesStringForKey(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    if (_InstallHomeKitPreferencesObserverIfNecessary_onceToken != -1) {
      dispatch_once(&_InstallHomeKitPreferencesObserverIfNecessary_onceToken, &__block_literal_global_344);
    }
    objc_opt_class();
    id v2 = (id)CFPreferencesCopyAppValue(v1, @"com.apple.homed");
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void HFPreferencesRemoveValueForKey(void *a1)
{
  uint64_t v1 = a1;
  if (v1)
  {
    CFStringRef key = v1;
    if (_InstallHomePreferencesObserverIfNecessary_onceToken != -1) {
      dispatch_once(&_InstallHomePreferencesObserverIfNecessary_onceToken, &__block_literal_global_341_0);
    }
    CFPreferencesSetAppValue(key, 0, @"com.apple.Home");
    uint64_t v1 = (__CFString *)key;
  }
}

BOOL HomeKitPreferencesBoolForKey(void *a1)
{
  return HomeKitPreferencesBooleanValueForKey(a1) == 2;
}

BOOL HFPreferencesBoolForKey(void *a1)
{
  return HFPreferencesBooleanValueForKey(a1) == 2;
}

id HFForceCameraQRCodeURLString()
{
  return HFPreferencesStringForKey(@"HFForceCameraQRCodeURLString");
}

id HFForceCameraLegacyCodeURLString()
{
  return HFPreferencesStringForKey(@"HFForceCameraLegacyCodeURLString");
}

id HFForceNFCURLString()
{
  return HFPreferencesStringForKey(@"HFForceNFCURLString");
}

BOOL HFForceMigrationOnboarding()
{
  return HFPreferencesBooleanValueForKey(@"HFForceMigrationOnboardingKey") == 2;
}

BOOL HFForceSwitchHomeWelcomeOnboarding()
{
  return HFPreferencesBooleanValueForKey(@"HFForceSwitchHomeWelcomeOnboardingKey") == 2;
}

BOOL HFForceDoorbellRecognitionOnboarding()
{
  return HFPreferencesBooleanValueForKey(@"HFForceDoorbellRecognitionOnboardingKey") == 2;
}

BOOL HFForceOwnerMustUpgradeOnboarding()
{
  return HFPreferencesBooleanValueForKey(@"HFForceOwnerMustUpgradeOnboardingKey") == 2;
}

BOOL HFCheckAndClearResetRedesignMigrationPreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"resetRedesignMigrationKey");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"resetRedesignMigrationKey");
  }
  return v0 == 2;
}

BOOL HFCheckAndClearResetIdentifyVoicePreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"HFResetIdentifyVoiceOnboardingKey");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"HFResetIdentifyVoiceOnboardingKey");
  }
  return v0 == 2;
}

BOOL HFCheckAndClearResetAnnouncePreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"HFResetAnnounceOnboardingKey");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"HFResetAnnounceOnboardingKey");
  }
  return v0 == 2;
}

BOOL HFCheckAndClearResetAnnounceTextButtonViewCountPreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"HFResetAnounceTextButtonDisplayStatsKey");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"HFResetAnounceTextButtonDisplayStatsKey");
  }
  return v0 == 2;
}

BOOL HFCheckAndClearResetHomeTheaterPreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"HFResetHomeTheaterOnboardingKey");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"HFResetHomeTheaterOnboardingKey");
  }
  return v0 == 2;
}

BOOL HFCheckAndClearResetTVViewingProfilesPreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"HFResetTVViewingProfilesOnboardingKey");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"HFResetTVViewingProfilesOnboardingKey");
  }
  return v0 == 2;
}

BOOL HFCheckAndClearResetNaturalLightingPreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"HFResetNaturalLightingOnboardingKey");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"HFResetNaturalLightingOnboardingKey");
  }
  return v0 == 2;
}

BOOL HFCheckAndClearResetCameraRecordingPreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"HFResetCameraRecordingOnboardingKey");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"HFResetCameraRecordingOnboardingKey");
  }
  return v0 == 2;
}

BOOL HFCheckAndClearResetWalletKeyExpressModePreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"HFResetWalletKeyExpressModeOnboardingKey");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"HFResetWalletKeyExpressModeOnboardingKey");
  }
  return v0 == 2;
}

BOOL HFCheckAndClearResetAccessCodePreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"HFResetAccessCodeOnboardingKey");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"HFResetAccessCodeOnboardingKey");
  }
  return v0 == 2;
}

BOOL HFCheckAndClearResetAccessoryFirmwareUpdatePreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"HFResetAccessoryFirmwareUpdateOnboarding");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"HFResetAccessoryFirmwareUpdateOnboarding");
  }
  return v0 == 2;
}

BOOL HFCheckAndClearResetUtilityPreference()
{
  uint64_t v0 = HFPreferencesBooleanValueForKey(@"HFResetUtilityOnboarding");
  if (v0 == 2) {
    HFPreferencesRemoveValueForKey(@"HFResetUtilityOnboarding");
  }
  return v0 == 2;
}

BOOL HKForceDevicesNeedUpgrade()
{
  return HFPreferencesBooleanValueForKey(@"forceDevicesNeedUpgradeKey") == 2;
}

uint64_t HFHideQuickControls()
{
  if (qword_26AB2F910 != -1) {
    dispatch_once(&qword_26AB2F910, &__block_literal_global_317_0);
  }
  id v0 = (id)qword_26AB2F918;
  uint64_t v1 = [v0 BOOLValue];

  return v1;
}

uint64_t __HFHideQuickControls_block_invoke_2()
{
  uint64_t v0 = [NSNumber numberWithBool:HFPreferencesBooleanValueForKey(@"hideQuickControls") == 2];
  uint64_t v1 = qword_26AB2F918;
  qword_26AB2F918 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

BOOL HFForceAccessoryFirmwareUpdateOnboarding()
{
  return HFPreferencesBooleanValueForKey(@"forceAccessoryFirmwareUpdateOnboarding") == 2;
}

BOOL HFForceAccessoryAnalyticsOnboarding()
{
  return HFPreferencesBooleanValueForKey(@"forceAccessoryAnalyticsOnboarding") == 2;
}

id HFStoreStagingURLString()
{
  return HFPreferencesStringForKey(@"HFStoreStagingURLStringKey");
}

BOOL HFForceInstallationGuideUseStagingURL()
{
  return HFPreferencesBooleanValueForKey(@"HFForceInstallationGuideUseStagingURLKey") == 2;
}

id HFStoreInstallationGuideStagingURLString()
{
  return HFPreferencesStringForKey(@"HFStoreInstallationGuideStagingURLStringKey");
}

id _HFPreferencesGetAccessoryDictionary(void *a1)
{
  id v1 = a1;
  if (+[HFUtilities isInternalInstall])
  {
    uint64_t v2 = HFPreferencesBooleanValueForKey(@"InternalDebuggingEnabled");
    id v3 = (id)MEMORY[0x263EFFA78];
    if (v2 == 2)
    {
      if (!v1)
      {
        uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
        uint64_t v10 = [NSString stringWithUTF8String:"NSDictionary *_HFPreferencesGetAccessoryDictionary(NSString *__strong)"];
        [v9 handleFailureInFunction:v10, @"HFPreferences.m", 470, @"Invalid parameter not satisfying: %@", @"accessoryUUID" file lineNumber description];
      }
      if (_InstallHomePreferencesObserverIfNecessary_onceToken != -1) {
        dispatch_once(&_InstallHomePreferencesObserverIfNecessary_onceToken, &__block_literal_global_341_0);
      }
      id v4 = (void *)MEMORY[0x21053EE50]();
      CFPropertyListRef v5 = CFPreferencesCopyAppValue((CFStringRef)[v1 stringByAppendingString:@"-AccessoryDictionary"], @"com.apple.Home");
      id v6 = (void *)v5;
      if (v5) {
        id v7 = (void *)v5;
      }
      else {
        id v7 = v3;
      }
      id v3 = v7;
    }
  }
  else
  {
    id v3 = (id)MEMORY[0x263EFFA78];
  }

  return v3;
}

void _HFPreferencesSetAccessoryDictionary(void *a1, void *a2)
{
  id v6 = a1;
  id v3 = a2;
  if (+[HFUtilities isInternalInstall]
    && HFPreferencesBooleanValueForKey(@"InternalDebuggingEnabled") == 2)
  {
    if (!v6)
    {
      id v4 = [MEMORY[0x263F08690] currentHandler];
      CFPropertyListRef v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void _HFPreferencesSetAccessoryDictionary(NSString *__strong, NSDictionary *__strong)");
      [v4 handleFailureInFunction:v5, @"HFPreferences.m", 484, @"Invalid parameter not satisfying: %@", @"accessoryUUID" file lineNumber description];
    }
    if (![v3 count])
    {

      id v3 = 0;
    }
    CFPreferencesSetAppValue((CFStringRef)[v6 stringByAppendingString:@"-AccessoryDictionary"], v3, @"com.apple.Home");
  }
}

void HFPreferencesAccessorySetValueForKey(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = _HFPreferencesGetAccessoryDictionary(v7);
  id v9 = (id)[v8 mutableCopy];

  [v9 setObject:v5 forKeyedSubscript:v6];
  _HFPreferencesSetAccessoryDictionary(v7, v9);
}

id HFPreferencesAccessoryValueForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = _HFPreferencesGetAccessoryDictionary(a1);
  id v5 = [v4 objectForKey:v3];

  return v5;
}

void HFPreferencesSetInternalDebuggingEnabled(uint64_t a1)
{
  id v1 = [NSNumber numberWithBool:a1];
  uint64_t v2 = _InstallHomePreferencesObserverIfNecessary_onceToken;
  id v3 = @"InternalDebuggingEnabled";
  id v4 = v1;
  id v7 = v4;
  if (v2 == -1)
  {
    id v5 = v4;
  }
  else
  {
    dispatch_once(&_InstallHomePreferencesObserverIfNecessary_onceToken, &__block_literal_global_341_0);
    id v5 = v7;
  }
  CFPreferencesSetAppValue(@"InternalDebuggingEnabled", v5, @"com.apple.Home");

  CFPreferencesSynchronize(@"com.apple.Home", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.Home.preferenceschanged", 0, 0, 1u);
}

BOOL HFPreferencesShowDoublePaneEnergyForecast()
{
  BOOL result = +[HFUtilities isInternalInstall];
  if (result) {
    return HFPreferencesBooleanValueForKey(@"ShowDoublePaneEnergyForecast") == 2;
  }
  return result;
}

BOOL HFPreferenceIdentifyHomePodButtonEnabled()
{
  BOOL result = +[HFUtilities isInternalInstall];
  if (result) {
    return HFPreferencesBooleanValueForKey(@"HFPreferenceIdentifyHomePodButtonEnabledKey") == 2;
  }
  return result;
}

id HFPerformanceUpgradeTitles()
{
  if (qword_26AB2F930 != -1) {
    dispatch_once(&qword_26AB2F930, &__block_literal_global_339_0);
  }
  uint64_t v0 = (void *)qword_26AB2F938;
  return v0;
}

void __HFPerformanceUpgradeTitles_block_invoke_2()
{
  uint64_t v0 = (void *)qword_26AB2F938;
  qword_26AB2F938 = MEMORY[0x263EFFA78];
}

BOOL HFForceHideEmptyFavoriteScenes()
{
  BOOL result = +[HFUtilities isInternalInstall];
  if (result) {
    return HFPreferencesBooleanValueForKey(@"HFForceHideEmptyFavoriteScenes") == 2;
  }
  return result;
}

void _HomePrefsChangedHandler()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"com.apple.Home.preferenceschanged" object:0];
}

void _HomeDPrefsChangedHandler()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"com.apple.homed.preferenceschanged" object:0];
}

void sub_20BC341FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC38FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC3CF64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose((const void *)(v25 - 128), 8);
  _Block_object_dispose((const void *)(v25 - 96), 8);
  _Unwind_Resume(a1);
}

id _HFStateDumpBuilderForMediaProfileContainer(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = &unk_26C155B48;
  id v6 = v3;
  id v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  if ([v6 conformsToProtocol:v5]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v7;
  if (!v8)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    id v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    uint64_t v12 = NSStringFromProtocol((Protocol *)v5);
    [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v12 file lineNumber description];

LABEL_7:
    id v9 = 0;
  }

  uint64_t v13 = +[HFStateDumpBuilder builderWithObject:v7 context:v4];
  uint64_t v14 = [v7 uniqueIdentifier];
  [v13 appendObject:v14 withName:@"UUID" options:2];

  uint64_t v15 = objc_msgSend(v7, "hf_backingAccessory");
  uint64_t v16 = (void *)[v4 copyWithDetailLevel:0];
  [v13 appendObject:v15 withName:@"accessory" context:v16 options:1];

  uint64_t v17 = objc_msgSend(v7, "hf_backingAccessory");
  uint64_t v18 = [v17 firmwareVersion];
  [v13 appendObject:v18 withName:@"firmware version" options:1];

  uint64_t v19 = objc_msgSend(v7, "hf_parentRoom");
  [v13 appendObject:v19 withName:@"room"];

  objc_msgSend(v13, "appendBool:withName:ifEqualTo:", objc_msgSend(v7, "hf_isReachable"), @"reachable", 0);
  objc_msgSend(v13, "appendBool:withName:ifEqualTo:", objc_msgSend(v7, "hf_isCurrentAccessory"), @"currentAccessory", 1);
  objc_msgSend(v13, "appendBool:withName:ifEqualTo:", objc_msgSend(v7, "hf_homePodSupportsMultiUser"), @"supportsMultiUser", 1);
  if ([v4 detailLevel] == 2)
  {
    id v20 = [v7 mediaSession];
    [v13 appendObject:v20 withName:@"mediaSession"];

    uint64_t v21 = [v7 settings];
    [v13 appendObject:v21 withName:@"settings"];
  }
  return v13;
}

void sub_20BC43974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC44030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_20BC46274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_20BC46540(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_20BC46AD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC46BE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC49FD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BC4A160(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC4ADE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_20BC4B310(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_20BC4B974(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_20BC4C63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC4CD18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC4EE44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC4F64C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20BC4FA1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20BC4FDD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20BC502F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20BC506DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20BC50AC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20BC50EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC51F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC52738(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BC5281C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC53F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC5DCBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC65694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMSoftwareUpdateStateFromHMSoftwareUpdateStatusV2(unint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1 < 0x13) {
    return qword_20BD139B0[a1];
  }
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"Yet to handle HMSoftwareUpdateStatusV2: %lu", a1);
  uint64_t v3 = HFLogForCategory(0x40uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  NSLog(&stru_26C081038.isa, v2);
  return 4;
}

void sub_20BC6613C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC66A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC67D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC67FDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC68850(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_20BC68A34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC6A63C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_20BC6A84C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *HFStringForDeviceOrientationSimplified(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      BOOL result = @"Portrait";
      break;
    case 2:
      BOOL result = @"PortraitUpsideDown";
      break;
    case 3:
      BOOL result = @"LandscapeLeft";
      break;
    case 4:
      BOOL result = @"LandscapeRight";
      break;
    case 5:
      uint64_t v2 = [MEMORY[0x263F1C920] mainScreen];
      [v2 bounds];
      double v4 = v3;
      id v5 = [MEMORY[0x263F1C920] mainScreen];
      [v5 bounds];
      double v7 = v6;

      id v8 = @"FaceUp-Landscape";
      id v9 = @"FaceUp-Portrait";
      goto LABEL_9;
    case 6:
      uint64_t v10 = [MEMORY[0x263F1C920] mainScreen];
      [v10 bounds];
      double v4 = v11;
      uint64_t v12 = [MEMORY[0x263F1C920] mainScreen];
      [v12 bounds];
      double v7 = v13;

      id v8 = @"FaceDown-Landscape";
      id v9 = @"FaceDown-Portrait";
LABEL_9:
      if (v4 >= v7) {
        BOOL result = v8;
      }
      else {
        BOOL result = v9;
      }
      break;
    default:
      BOOL result = @"Unknown";
      break;
  }
  return result;
}

void sub_20BC6E708(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_20BC714A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BC729B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BC738E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC7463C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC74888(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC749E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC77FC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20BC7A530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC7A9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC7F44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BC80384(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_20BC852D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_20BC86624(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BC86878(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC86F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHMUserCameraAccessLevel(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_26409A4B8[a1];
  }
}

id HFLocalizedStringFromHMUserCameraAccessLevel(unint64_t a1)
{
  if (a1 > 2) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = off_26409A4B8[a1];
  }
  return _HFLocalizedStringWithDefaultValue(v1, 0, 0);
}

void sub_20BC88FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC8B6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_20BC8B7E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC8BEF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BC8C684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC8D5B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_20BC8FA14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_20BC90014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC90688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC90908(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC90C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC90F74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BC91984(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_20BC95368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BC956F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

HFCharacteristicGroup *HFNewTargetCurrentGroup(void *a1, void *a2, void *a3)
{
  v19[2] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = +[HFCharacteristicGroup _targetCurrentStateCharacteristicTypeMap];
  id v9 = [v8 objectForKeyedSubscript:v7];

  v19[0] = v7;
  v19[1] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  id v11 = v5;
  id v12 = v6;
  id v13 = v10;
  uint64_t v14 = [HFCharacteristicGroup alloc];
  uint64_t v15 = _HFLocalizedStringWithDefaultValue(v12, v12, 1);

  uint64_t v16 = [MEMORY[0x263EFFA08] setWithArray:v13];

  uint64_t v17 = [(HFCharacteristicGroup *)v14 initWithID:v11 title:v15 characteristicTypes:v16];
  return v17;
}

void sub_20BC9AB8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BC9E400(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20BC9E3CCLL);
  }
  _Unwind_Resume(a1);
}

void sub_20BCA3F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BCA4364(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BCA5C40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20BCA5E20(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BCA9CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BCAB1B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20BCAE3A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 136));
  _Unwind_Resume(a1);
}

void sub_20BCAF300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BCB094C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BCB0EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20BCB106C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void HFGetColorForLightTemperature(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v17 = 0;
  uint64_t v18 = (float64x2_t *)&v17;
  uint64_t v19 = 0x3810000000;
  id v20 = &unk_20BD7F5A6;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __HFGetColorForLightTemperature_block_invoke;
  aBlock[3] = &unk_26409B1C0;
  void aBlock[4] = &v17;
  aBlock[5] = a1;
  void aBlock[6] = a2;
  aBlock[7] = a3;
  double v4 = _Block_copy(aBlock);
  uint64_t v5 = v4;
  if (a4 >= 1000.0 && a4 <= 40000.0)
  {
    id v6 = v18;
    int32x2_t v7 = vdup_n_s32(a4 > 6500.0);
    v8.i64[0] = v7.u32[0];
    v8.i64[1] = v7.u32[1];
    int8x16_t v9 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v8, 0x3FuLL));
    __asm { FMOV            V1.2D, #1.0 }
    v18[2] = vmaxnmq_f64(vminnmq_f64(vaddq_f64((float64x2_t)vbslq_s8(v9, (int8x16_t)xmmword_20BD13BC0, (int8x16_t)xmmword_20BD13BB0), vdivq_f64((float64x2_t)vbslq_s8(v9, (int8x16_t)xmmword_20BD13C00, (int8x16_t)xmmword_20BD13BF0), vaddq_f64((float64x2_t)vbslq_s8(v9, (int8x16_t)xmmword_20BD13BE0, (int8x16_t)xmmword_20BD13BD0), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0)))), _Q1), (float64x2_t)0);
    v6[3].f64[0] = fmax(fmin(-8257.79973 / (a4 + 2575.28275) + 1.89937539, 1.0), 0.0);
  }
  if (v4) {
    (*((void (**)(void *))v4 + 2))(v4);
  }

  _Block_object_dispose(&v17, 8);
}

void sub_20BCB5624(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 72), 8);
  _Unwind_Resume(a1);
}

double __HFGetColorForLightTemperature_block_invoke(void *a1)
{
  uint64_t v1 = (double *)a1[5];
  if (v1)
  {
    double result = *(double *)(*(void *)(a1[4] + 8) + 32);
    *uint64_t v1 = result;
  }
  uint64_t v3 = (double *)a1[6];
  if (v3)
  {
    double result = *(double *)(*(void *)(a1[4] + 8) + 40);
    *uint64_t v3 = result;
  }
  double v4 = (double *)a1[7];
  if (v4)
  {
    double result = *(double *)(*(void *)(a1[4] + 8) + 48);
    *double v4 = result;
  }
  return result;
}

void HFConvertRGBToHSB(long double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 < a5 || a4 < a6)
  {
    if (a5 < a4 || a5 < a6)
    {
      if (a5 >= a4) {
        double v9 = a4;
      }
      else {
        double v9 = a5;
      }
      double v10 = a6;
    }
    else
    {
      if (a4 >= a6) {
        double v9 = a6;
      }
      else {
        double v9 = a4;
      }
      double v10 = a5;
    }
  }
  else
  {
    if (a5 >= a6) {
      double v9 = a6;
    }
    else {
      double v9 = a5;
    }
    double v10 = a4;
  }
  double v11 = 0.0;
  if (v10 <= 0.0)
  {
    double v13 = 0.0;
  }
  else
  {
    double v12 = v10 - v9;
    double v13 = (v10 - v9) / v10;
    if (v13 != 0.0)
    {
      double v14 = (v10 - a5) / v12;
      double v15 = (v10 - a6) / v12;
      if (v10 == a4)
      {
        if (v9 == a5) {
          double v11 = v15 + 5.0;
        }
        else {
          double v11 = 1.0 - v14;
        }
      }
      else
      {
        BOOL v16 = v10 == a5;
        double v17 = (v10 - a4) / v12;
        if (v16)
        {
          if (v9 == a6) {
            double v11 = v17 + 1.0;
          }
          else {
            double v11 = 3.0 - v15;
          }
        }
        else if (v9 == a4)
        {
          double v11 = v14 + 3.0;
        }
        else
        {
          double v11 = 5.0 - v17;
        }
      }
    }
  }
  if (a3) {
    *a3 = v10;
  }
  if (a1) {
    *a1 = fmod(v11 / 6.0, 1.0);
  }
  if (a2) {
    *a2 = v13;
  }
}

BOOL HFIsColorLighter(void *a1, double a2, double a3)
{
  double v9 = 0.0;
  double v10 = 0.0;
  uint64_t v7 = 0;
  double v8 = 0.0;
  [a1 getRed:&v10 green:&v9 blue:&v8 alpha:&v7];
  double v5 = (v10 * 255.0 + v9 * 255.0 + v8 * 255.0) / 3.0;
  if (v5 >= a2 * 255.0) {
    return v5 > 242.25
  }
        || sqrt(((v8 * 255.0 - v5) * (v8 * 255.0 - v5)+ (v10 * 255.0 - v5) * (v10 * 255.0 - v5)+ (v9 * 255.0 - v5) * (v9 * 255.0 - v5))/ 3.0) <= a3;
  return v5 > 242.25;
}

BOOL HFIsNearYellow(void *a1)
{
  double v5 = 0.0;
  uint64_t v3 = 0;
  double v4 = 0.0;
  uint64_t v2 = 0;
  [a1 getRed:&v5 green:&v4 blue:&v3 alpha:&v2];
  return v4 * 255.0 >= 237.150009 && v5 * 255.0 >= 237.150009;
}

id HFGetUIColorFromMired(double a1)
{
  float v1 = 1000000.0 / a1;
  double v6 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  HFGetColorForLightTemperature((uint64_t)&v6, (uint64_t)&v5, (uint64_t)&v4, v1);
  uint64_t v2 = [MEMORY[0x263F1C550] colorWithRed:v6 green:v5 blue:v4 alpha:1.0];
  return v2;
}

void sub_20BCB5E04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_20BCB83AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20BCBE91C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_20BCBF1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __HFComparatorForNullableObjects_block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_20BCC055C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BCC1CD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20BCC229C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _HFCharacteristicMetadataTypeIsReallyBinary(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 minimumValue];
  if ([v2 isEqualToNumber:&unk_26C0F7C98])
  {
    uint64_t v3 = [v1 maximumValue];
    if ([v3 isEqualToNumber:&unk_26C0F7CB0])
    {
      double v4 = [v1 stepValue];
      uint64_t v5 = [v4 isEqualToNumber:&unk_26C0F7CB0];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t HFAccessorySettingsDefaultInterfaceModalityForHMAccessorySetting(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = 0;
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v2 = -1;
      goto LABEL_21;
    }
    id v3 = v1;
    double v4 = [v3 minimumValue];
    if ([v4 isEqual:&unk_26C0F7CC8])
    {
      uint64_t v5 = [v3 maximumValue];
      if ([v5 isEqual:&unk_26C0F7CE0])
      {
        double v6 = [v3 stepValue];
        char v7 = [v6 isEqual:&unk_26C0F7CE0];

        if (v7)
        {
          uint64_t v2 = 5;
LABEL_20:

          goto LABEL_21;
        }
LABEL_13:
        uint64_t v8 = [v3 maximumValue];
        if (v8
          && (uint64_t v9 = (void *)v8,
              [v3 minimumValue],
              double v10 = objc_claimAutoreleasedReturnValue(),
              v10,
              v9,
              v10))
        {
          uint64_t v11 = [v3 stepValue];
          if (v11) {
            uint64_t v2 = 3;
          }
          else {
            uint64_t v2 = 2;
          }
        }
        else
        {
          uint64_t v2 = 1;
        }
        goto LABEL_20;
      }
    }
    goto LABEL_13;
  }
  uint64_t v2 = 6;
LABEL_21:

  return v2;
}

void sub_20BCC6674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromAFVoiceGender(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Any";
  }
  else {
    return off_26409C208[a1 - 1];
  }
}

void sub_20BCD3928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

__CFString *HFMediaAccessoryItemTypeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"Unknown";
  }
  else {
    return off_26409C528[a1 - 1];
  }
}

void sub_20BCD9304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BCDA654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BCDA78C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20BCDBDB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BCDBEE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

Class __getMediaServiceConfigurationClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!qword_26AB2FEB8)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __MediaSetupLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_26409C6C0;
    uint64_t v8 = 0;
    qword_26AB2FEB8 = _sl_dlopen();
  }
  if (!qword_26AB2FEB8)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    double v4 = [NSString stringWithUTF8String:"void *MediaSetupLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"HFMediaServiceManager.m", 21, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("MediaServiceConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getMediaServiceConfigurationClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"HFMediaServiceManager.m", 23, @"Unable to find class %s", "MediaServiceConfiguration");

LABEL_10:
    __break(1u);
  }
  qword_26AB2FEB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaSetupLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_26AB2FEB8 = result;
  return result;
}

BOOL HMCharacteristicValueLabelNamespaceValidate(unint64_t a1)
{
  return a1 < 2;
}

id HFProgrammableSwitchLocalizableStringForAccessoryNamingSystemAndIndex(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 > 1)
  {
    uint64_t v8 = 0;
  }
  else if (a1 == 1)
  {
    uint64_t v8 = HFLocalizedStringWithFormat(@"HFProgrammableSwitch_Numeral_FormatString", @"%1lu", a3, a4, a5, a6, a7, a8, a2);
  }
  else
  {
    uint64_t v9 = [NSString stringWithFormat:@"%@_%@_%lu", @"HFProgrammableSwitch", @"DOTS", a2];
    uint64_t v10 = _HFLocalizedStringWithDefaultValue(v9, 0, 0);
    uint64_t v8 = (void *)v10;
    if (!v10)
    {
      uint64_t v11 = [NSString stringWithFormat:@"%@_%@_UndefinedIdx", @"HFProgrammableSwitch", @"DOTS"];
      uint64_t v8 = _HFLocalizedStringWithDefaultValue(v11, 0, 0);
    }
  }
  return v8;
}

__CFString *HFLocalizedStringKeyFromHMCharacteristicValueInputEvent(unint64_t a1)
{
  if (a1 > 2) {
    return @"HFProgrammableSwitchUndefinedValue";
  }
  else {
    return off_26409CB58[a1];
  }
}

id HFProgrammableSwitchInputEventOptionDisplayPriorityMap()
{
  if (qword_26AB2FEE8 != -1) {
    dispatch_once(&qword_26AB2FEE8, &__block_literal_global_232);
  }
  id v0 = (void *)_MergedGlobals_329;
  return v0;
}

void __HFProgrammableSwitchInputEventOptionDisplayPriorityMap_block_invoke()
{
  id v0 = objc_opt_new();
  id v1 = objc_opt_new();
  [v1 addIndex:0];
  [v1 addIndex:1];
  [v1 addIndex:2];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __HFProgrammableSwitchInputEventOptionDisplayPriorityMap_block_invoke_2;
  v5[3] = &unk_26409CB38;
  id v6 = v0;
  id v2 = v0;
  [v1 enumerateIndexesUsingBlock:v5];
  uint64_t v3 = [v2 copy];
  double v4 = (void *)_MergedGlobals_329;
  _MergedGlobals_329 = v3;
}

void __HFProgrammableSwitchInputEventOptionDisplayPriorityMap_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v7 = [NSNumber numberWithUnsignedInteger:a2];
  double v4 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v5 = HFProgrammableSwitchLocalizedStringKeyForValue(v4);
  id v6 = _HFLocalizedStringWithDefaultValue(v5, v5, 1);

  objc_msgSend(*(id *)(a1 + 32), "na_safeSetObject:forKey:", v7, v6);
}

__CFString *HFProgrammableSwitchLocalizedStringKeyForValue(void *a1)
{
  if (!a1) {
    return @"HFProgrammableSwitchUndefinedValue";
  }
  unint64_t v1 = [a1 integerValue];
  if (v1 > 2) {
    return @"HFProgrammableSwitchUndefinedValue";
  }
  else {
    return off_26409CB58[v1];
  }
}

id HFUpdateDateAddedForApplicationDataContainer(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (!v4)
  {
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  id v15 = 0;
  uint64_t v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v15];
  id v6 = v15;
  if (!v6)
  {
LABEL_7:
    uint64_t v10 = [v3 applicationData];
    [v10 setObject:v5 forKeyedSubscript:@"HFApplicationDataDateAddedData"];

    uint64_t v11 = (void *)MEMORY[0x263F58190];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __HFUpdateDateAddedForApplicationDataContainer_block_invoke;
    v13[3] = &unk_26408CD50;
    id v14 = v3;
    uint64_t v9 = [v11 futureWithErrorOnlyHandlerAdapterBlock:v13];
    id v7 = v14;
    goto LABEL_8;
  }
  id v7 = v6;
  uint64_t v8 = HFLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Error encoding date added for container %@; error: %@",
      buf,
      0x16u);
  }

  uint64_t v9 = [MEMORY[0x263F58190] futureWithError:v7];
LABEL_8:

  return v9;
}

void __HFUpdateDateAddedForApplicationDataContainer_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationData];
  [v2 updateApplicationData:v4 completionHandler:v3];
}

void sub_20BCE50AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20BCE5908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20BCE5B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HFSymbolIconAccessoryTypeForSymbol(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 rangeOfString:@"."];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    [NSString string];
  }
  else {
  id v3 = [v1 substringToIndex:v2];
  }

  return v3;
}

uint64_t sub_20BCE6430()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_20BCE6440()
{
  return MEMORY[0x270EF0780]();
}

uint64_t sub_20BCE6450()
{
  return MEMORY[0x270EF0790]();
}

uint64_t sub_20BCE6460()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_20BCE6470()
{
  return MEMORY[0x270EF07E8]();
}

uint64_t sub_20BCE6480()
{
  return MEMORY[0x270EF07F8]();
}

uint64_t sub_20BCE6490()
{
  return MEMORY[0x270EF0808]();
}

uint64_t sub_20BCE64A0()
{
  return MEMORY[0x270EF0820]();
}

uint64_t sub_20BCE64B0()
{
  return MEMORY[0x270EF0840]();
}

uint64_t sub_20BCE64C0()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_20BCE64D0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_20BCE64E0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_20BCE64F0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_20BCE6500()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_20BCE6510()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_20BCE6520()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_20BCE6530()
{
  return MEMORY[0x270EF0BD0]();
}

uint64_t sub_20BCE6540()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_20BCE6550()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_20BCE6560()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_20BCE6570()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_20BCE6580()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_20BCE6590()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_20BCE65A0()
{
  return MEMORY[0x270EF0CC8]();
}

uint64_t sub_20BCE65B0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_20BCE65C0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_20BCE65D0()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_20BCE65E0()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_20BCE65F0()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_20BCE6600()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_20BCE6610()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_20BCE6620()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_20BCE6630()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_20BCE6640()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_20BCE6650()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_20BCE6660()
{
  return MEMORY[0x270EF1358]();
}

uint64_t sub_20BCE6670()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_20BCE6680()
{
  return MEMORY[0x270EF1580]();
}

uint64_t sub_20BCE6690()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_20BCE66A0()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_20BCE66B0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_20BCE66C0()
{
  return MEMORY[0x270FA1150]();
}

uint64_t sub_20BCE66D0()
{
  return MEMORY[0x270F3A198]();
}

uint64_t sub_20BCE66E0()
{
  return MEMORY[0x270F3C3B0]();
}

uint64_t sub_20BCE66F0()
{
  return MEMORY[0x270F3A1E8]();
}

uint64_t sub_20BCE6700()
{
  return MEMORY[0x270F3A2C0]();
}

uint64_t sub_20BCE6710()
{
  return MEMORY[0x270F3A2C8]();
}

uint64_t sub_20BCE6720()
{
  return MEMORY[0x270F3A300]();
}

uint64_t sub_20BCE6730()
{
  return MEMORY[0x270F3A310]();
}

uint64_t sub_20BCE6740()
{
  return MEMORY[0x270F3A320]();
}

uint64_t sub_20BCE6750()
{
  return MEMORY[0x270F3A330]();
}

uint64_t sub_20BCE6760()
{
  return MEMORY[0x270F3A340]();
}

uint64_t sub_20BCE6770()
{
  return MEMORY[0x270F3A360]();
}

uint64_t sub_20BCE6780()
{
  return MEMORY[0x270F3A378]();
}

uint64_t sub_20BCE6790()
{
  return MEMORY[0x270F3A388]();
}

uint64_t sub_20BCE67A0()
{
  return MEMORY[0x270F3A400]();
}

uint64_t sub_20BCE67B0()
{
  return MEMORY[0x270F3A4C0]();
}

uint64_t sub_20BCE67C0()
{
  return MEMORY[0x270F3A4C8]();
}

uint64_t sub_20BCE67D0()
{
  return MEMORY[0x270F3A4D8]();
}

uint64_t sub_20BCE67E0()
{
  return MEMORY[0x270F3A4F0]();
}

uint64_t sub_20BCE67F0()
{
  return MEMORY[0x270F3A508]();
}

uint64_t sub_20BCE6800()
{
  return MEMORY[0x270F3A730]();
}

uint64_t sub_20BCE6810()
{
  return MEMORY[0x270F3A738]();
}

uint64_t sub_20BCE6820()
{
  return MEMORY[0x270F3A740]();
}

uint64_t sub_20BCE6830()
{
  return MEMORY[0x270F3A748]();
}

uint64_t sub_20BCE6840()
{
  return MEMORY[0x270F3A750]();
}

uint64_t sub_20BCE6850()
{
  return MEMORY[0x270F3A778]();
}

uint64_t sub_20BCE6860()
{
  return MEMORY[0x270F3A780]();
}

uint64_t sub_20BCE6870()
{
  return MEMORY[0x270F3A788]();
}

uint64_t sub_20BCE6880()
{
  return MEMORY[0x270F3A790]();
}

uint64_t sub_20BCE6890()
{
  return MEMORY[0x270F3A850]();
}

uint64_t sub_20BCE68A0()
{
  return MEMORY[0x270F3A858]();
}

uint64_t sub_20BCE68B0()
{
  return MEMORY[0x270F3A860]();
}

uint64_t sub_20BCE68C0()
{
  return MEMORY[0x270F3A868]();
}

uint64_t sub_20BCE68D0()
{
  return MEMORY[0x270F3A870]();
}

uint64_t sub_20BCE68E0()
{
  return MEMORY[0x270F3A878]();
}

uint64_t sub_20BCE68F0()
{
  return MEMORY[0x270F3A880]();
}

uint64_t sub_20BCE6900()
{
  return MEMORY[0x270F3A888]();
}

uint64_t sub_20BCE6910()
{
  return MEMORY[0x270F3A890]();
}

uint64_t sub_20BCE6920()
{
  return MEMORY[0x270F3A8C0]();
}

uint64_t sub_20BCE6930()
{
  return MEMORY[0x270F3A8D8]();
}

uint64_t sub_20BCE6940()
{
  return MEMORY[0x270F3A910]();
}

uint64_t sub_20BCE6950()
{
  return MEMORY[0x270F3A918]();
}

uint64_t sub_20BCE6960()
{
  return MEMORY[0x270F3AB48]();
}

uint64_t sub_20BCE6970()
{
  return MEMORY[0x270F3ACE8]();
}

uint64_t sub_20BCE6980()
{
  return MEMORY[0x270F3AD78]();
}

uint64_t sub_20BCE6990()
{
  return MEMORY[0x270F3ADB0]();
}

uint64_t sub_20BCE69A0()
{
  return MEMORY[0x270F3ADB8]();
}

uint64_t sub_20BCE69B0()
{
  return MEMORY[0x270F3ADC0]();
}

uint64_t sub_20BCE69C0()
{
  return MEMORY[0x270F3ADD8]();
}

uint64_t sub_20BCE69D0()
{
  return MEMORY[0x270F3ADE0]();
}

uint64_t sub_20BCE69E0()
{
  return MEMORY[0x270F3ADF0]();
}

uint64_t sub_20BCE69F0()
{
  return MEMORY[0x270F3AE28]();
}

uint64_t sub_20BCE6A00()
{
  return MEMORY[0x270F3AE38]();
}

uint64_t sub_20BCE6A10()
{
  return MEMORY[0x270F3AE58]();
}

uint64_t sub_20BCE6A20()
{
  return MEMORY[0x270F3AE68]();
}

uint64_t sub_20BCE6A30()
{
  return MEMORY[0x270F3AE78]();
}

uint64_t sub_20BCE6A40()
{
  return MEMORY[0x270F3AEB0]();
}

uint64_t sub_20BCE6A50()
{
  return MEMORY[0x270F3AEC0]();
}

uint64_t sub_20BCE6A60()
{
  return MEMORY[0x270F3AEC8]();
}

uint64_t sub_20BCE6A70()
{
  return MEMORY[0x270F3AED0]();
}

uint64_t sub_20BCE6A80()
{
  return MEMORY[0x270F3AED8]();
}

uint64_t sub_20BCE6A90()
{
  return MEMORY[0x270F3AEE0]();
}

uint64_t sub_20BCE6AA0()
{
  return MEMORY[0x270F3AEE8]();
}

uint64_t sub_20BCE6AB0()
{
  return MEMORY[0x270F3AF10]();
}

uint64_t sub_20BCE6AC0()
{
  return MEMORY[0x270F3AF18]();
}

uint64_t sub_20BCE6AD0()
{
  return MEMORY[0x270F3AF20]();
}

uint64_t sub_20BCE6AE0()
{
  return MEMORY[0x270F3AF28]();
}

uint64_t sub_20BCE6AF0()
{
  return MEMORY[0x270F3AF30]();
}

uint64_t sub_20BCE6B00()
{
  return MEMORY[0x270F3AF38]();
}

uint64_t sub_20BCE6B10()
{
  return MEMORY[0x270F3AF40]();
}

uint64_t sub_20BCE6B20()
{
  return MEMORY[0x270F3AFF0]();
}

uint64_t sub_20BCE6B30()
{
  return MEMORY[0x270F3B028]();
}

uint64_t sub_20BCE6B40()
{
  return MEMORY[0x270F3B0C8]();
}

uint64_t sub_20BCE6B50()
{
  return MEMORY[0x270F3B288]();
}

uint64_t sub_20BCE6B60()
{
  return MEMORY[0x270F3B2B0]();
}

uint64_t sub_20BCE6B70()
{
  return MEMORY[0x270F3B2C0]();
}

uint64_t sub_20BCE6B80()
{
  return MEMORY[0x270F3B3D8]();
}

uint64_t sub_20BCE6B90()
{
  return MEMORY[0x270F3B420]();
}

uint64_t sub_20BCE6BA0()
{
  return MEMORY[0x270F3B488]();
}

uint64_t sub_20BCE6BB0()
{
  return MEMORY[0x270F3B4A0]();
}

uint64_t sub_20BCE6BC0()
{
  return MEMORY[0x270F3B4E8]();
}

uint64_t sub_20BCE6BD0()
{
  return MEMORY[0x270F3B500]();
}

uint64_t sub_20BCE6BE0()
{
  return MEMORY[0x270F3B520]();
}

uint64_t sub_20BCE6BF0()
{
  return MEMORY[0x270F3B540]();
}

uint64_t sub_20BCE6C00()
{
  return MEMORY[0x270F3B568]();
}

uint64_t sub_20BCE6C10()
{
  return MEMORY[0x270F3B590]();
}

uint64_t sub_20BCE6C20()
{
  return MEMORY[0x270F3B5A0]();
}

uint64_t sub_20BCE6C30()
{
  return MEMORY[0x270F3B718]();
}

uint64_t sub_20BCE6C40()
{
  return MEMORY[0x270F3B720]();
}

uint64_t sub_20BCE6C50()
{
  return MEMORY[0x270F3B728]();
}

uint64_t sub_20BCE6C60()
{
  return MEMORY[0x270F3B730]();
}

uint64_t sub_20BCE6C70()
{
  return MEMORY[0x270F3B748]();
}

uint64_t sub_20BCE6C80()
{
  return MEMORY[0x270F3B758]();
}

uint64_t sub_20BCE6C90()
{
  return MEMORY[0x270F3B760]();
}

uint64_t sub_20BCE6CA0()
{
  return MEMORY[0x270F3B768]();
}

uint64_t sub_20BCE6CB0()
{
  return MEMORY[0x270F3B780]();
}

uint64_t sub_20BCE6CC0()
{
  return MEMORY[0x270F3B788]();
}

uint64_t sub_20BCE6CD0()
{
  return MEMORY[0x270F3B790]();
}

uint64_t sub_20BCE6CE0()
{
  return MEMORY[0x270F3B830]();
}

uint64_t sub_20BCE6CF0()
{
  return MEMORY[0x270F3B838]();
}

uint64_t sub_20BCE6D00()
{
  return MEMORY[0x270F3B848]();
}

uint64_t sub_20BCE6D10()
{
  return MEMORY[0x270F3B858]();
}

uint64_t sub_20BCE6D20()
{
  return MEMORY[0x270F3B860]();
}

uint64_t sub_20BCE6D30()
{
  return MEMORY[0x270F3B868]();
}

uint64_t sub_20BCE6D40()
{
  return MEMORY[0x270F3B870]();
}

uint64_t sub_20BCE6D50()
{
  return MEMORY[0x270F3B880]();
}

uint64_t sub_20BCE6D60()
{
  return MEMORY[0x270F3B898]();
}

uint64_t sub_20BCE6D70()
{
  return MEMORY[0x270F3B8B0]();
}

uint64_t sub_20BCE6D80()
{
  return MEMORY[0x270F3B8D0]();
}

uint64_t sub_20BCE6D90()
{
  return MEMORY[0x270F3B8E8]();
}

uint64_t sub_20BCE6DA0()
{
  return MEMORY[0x270F3B8F0]();
}

uint64_t sub_20BCE6DB0()
{
  return MEMORY[0x270F3B8F8]();
}

uint64_t sub_20BCE6DC0()
{
  return MEMORY[0x270F3B940]();
}

uint64_t sub_20BCE6DD0()
{
  return MEMORY[0x270F3B960]();
}

uint64_t sub_20BCE6DE0()
{
  return MEMORY[0x270F3BA28]();
}

uint64_t sub_20BCE6DF0()
{
  return MEMORY[0x270F3BAC0]();
}

uint64_t sub_20BCE6E00()
{
  return MEMORY[0x270F3BAD0]();
}

uint64_t sub_20BCE6E10()
{
  return MEMORY[0x270F3BAE0]();
}

uint64_t sub_20BCE6E20()
{
  return MEMORY[0x270F3BB58]();
}

uint64_t sub_20BCE6E30()
{
  return MEMORY[0x270F3BBD0]();
}

uint64_t sub_20BCE6E40()
{
  return MEMORY[0x270F3BBD8]();
}

uint64_t sub_20BCE6E50()
{
  return MEMORY[0x270F3BF58]();
}

uint64_t sub_20BCE6E60()
{
  return MEMORY[0x270F3BF60]();
}

uint64_t sub_20BCE6E70()
{
  return MEMORY[0x270F3BF70]();
}

uint64_t sub_20BCE6E80()
{
  return MEMORY[0x270F3BF80]();
}

uint64_t sub_20BCE6E90()
{
  return MEMORY[0x270F3BF88]();
}

uint64_t sub_20BCE6EA0()
{
  return MEMORY[0x270F3BFA0]();
}

uint64_t sub_20BCE6EB0()
{
  return MEMORY[0x270F3BFB0]();
}

uint64_t sub_20BCE6EC0()
{
  return MEMORY[0x270F3BFC0]();
}

uint64_t sub_20BCE6ED0()
{
  return MEMORY[0x270F3C198]();
}

uint64_t sub_20BCE6EE0()
{
  return MEMORY[0x270F3C1A0]();
}

uint64_t sub_20BCE6EF0()
{
  return MEMORY[0x270F3C1A8]();
}

uint64_t sub_20BCE6F00()
{
  return MEMORY[0x270F3C1B0]();
}

uint64_t sub_20BCE6F10()
{
  return MEMORY[0x270F3C1B8]();
}

uint64_t sub_20BCE6F20()
{
  return MEMORY[0x270F3C1C8]();
}

uint64_t sub_20BCE6F30()
{
  return MEMORY[0x270F3C1D0]();
}

uint64_t sub_20BCE6F40()
{
  return MEMORY[0x270F3C1D8]();
}

uint64_t sub_20BCE6F50()
{
  return MEMORY[0x270F3C1E0]();
}

uint64_t sub_20BCE6F60()
{
  return MEMORY[0x270F3C1E8]();
}

uint64_t sub_20BCE6F70()
{
  return MEMORY[0x270F3C1F0]();
}

uint64_t sub_20BCE6F80()
{
  return MEMORY[0x270F3C1F8]();
}

uint64_t sub_20BCE6F90()
{
  return MEMORY[0x270F3C200]();
}

uint64_t sub_20BCE6FA0()
{
  return MEMORY[0x270F3C208]();
}

uint64_t sub_20BCE6FB0()
{
  return MEMORY[0x270F3C210]();
}

uint64_t sub_20BCE6FC0()
{
  return MEMORY[0x270F3C218]();
}

uint64_t sub_20BCE6FD0()
{
  return MEMORY[0x270F3C220]();
}

uint64_t sub_20BCE6FE0()
{
  return MEMORY[0x270F3C228]();
}

uint64_t sub_20BCE6FF0()
{
  return MEMORY[0x270F3C230]();
}

uint64_t sub_20BCE7000()
{
  return MEMORY[0x270F3C238]();
}

uint64_t sub_20BCE7010()
{
  return MEMORY[0x270F3C240]();
}

uint64_t sub_20BCE7020()
{
  return MEMORY[0x270F3C248]();
}

uint64_t sub_20BCE7030()
{
  return MEMORY[0x270F3C250]();
}

uint64_t sub_20BCE7040()
{
  return MEMORY[0x270F3C258]();
}

uint64_t sub_20BCE7050()
{
  return MEMORY[0x270F3C260]();
}

uint64_t sub_20BCE7060()
{
  return MEMORY[0x270F3C268]();
}

uint64_t sub_20BCE7070()
{
  return MEMORY[0x270F3C270]();
}

uint64_t sub_20BCE7080()
{
  return MEMORY[0x270F3C278]();
}

uint64_t sub_20BCE7090()
{
  return MEMORY[0x270F3C280]();
}

uint64_t sub_20BCE70A0()
{
  return MEMORY[0x270F3C288]();
}

uint64_t sub_20BCE70B0()
{
  return MEMORY[0x270F3C290]();
}

uint64_t sub_20BCE70C0()
{
  return MEMORY[0x270F3C298]();
}

uint64_t sub_20BCE70D0()
{
  return MEMORY[0x270F3C2A0]();
}

uint64_t sub_20BCE70E0()
{
  return MEMORY[0x270F3C2A8]();
}

uint64_t sub_20BCE70F0()
{
  return MEMORY[0x270F3C2B0]();
}

uint64_t sub_20BCE7100()
{
  return MEMORY[0x270F3C2B8]();
}

uint64_t sub_20BCE7110()
{
  return MEMORY[0x270F3C2C0]();
}

uint64_t sub_20BCE7120()
{
  return MEMORY[0x270F3C2C8]();
}

uint64_t _s4Home7HFEventV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x270F3C2D0]();
}

uint64_t _s4Home7HFEventV4hash4intoys6HasherVz_tF_0()
{
  return MEMORY[0x270F3C2D8]();
}

uint64_t sub_20BCE7150()
{
  return MEMORY[0x270F3C2E0]();
}

uint64_t sub_20BCE7160()
{
  return MEMORY[0x270F3C520]();
}

uint64_t sub_20BCE7170()
{
  return MEMORY[0x270F3C528]();
}

uint64_t sub_20BCE7180()
{
  return MEMORY[0x270F3C530]();
}

uint64_t sub_20BCE7190()
{
  return MEMORY[0x270F3C538]();
}

uint64_t sub_20BCE71A0()
{
  return MEMORY[0x270F3C548]();
}

uint64_t sub_20BCE71B0()
{
  return MEMORY[0x270F3C550]();
}

uint64_t sub_20BCE71C0()
{
  return MEMORY[0x270F3C6B0]();
}

uint64_t sub_20BCE71D0()
{
  return MEMORY[0x270F3C6B8]();
}

uint64_t sub_20BCE71E0()
{
  return MEMORY[0x270F3C6C0]();
}

uint64_t sub_20BCE71F0()
{
  return MEMORY[0x270F3C6C8]();
}

uint64_t sub_20BCE7200()
{
  return MEMORY[0x270F3C6E8]();
}

uint64_t sub_20BCE7230()
{
  return MEMORY[0x270F3C710]();
}

uint64_t sub_20BCE7240()
{
  return MEMORY[0x270F3C050]();
}

uint64_t sub_20BCE7250()
{
  return MEMORY[0x270F3C058]();
}

uint64_t sub_20BCE7260()
{
  return MEMORY[0x270F3C060]();
}

uint64_t sub_20BCE7270()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_20BCE7280()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_20BCE7290()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_20BCE72A0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_20BCE72B0()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_20BCE72C0()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_20BCE72D0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_20BCE72E0()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_20BCE72F0()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_20BCE7300()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_20BCE7310()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_20BCE7320()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_20BCE7330()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_20BCE7340()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_20BCE7350()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_20BCE7360()
{
  return MEMORY[0x270EF3A38]();
}

uint64_t sub_20BCE7370()
{
  return MEMORY[0x270EF3A40]();
}

uint64_t sub_20BCE7380()
{
  return MEMORY[0x270EF3A88]();
}

uint64_t sub_20BCE7390()
{
  return MEMORY[0x270EF3A90]();
}

uint64_t sub_20BCE73A0()
{
  return MEMORY[0x270EF3A98]();
}

uint64_t sub_20BCE73B0()
{
  return MEMORY[0x270EF3AA0]();
}

uint64_t sub_20BCE73C0()
{
  return MEMORY[0x270EF3AA8]();
}

uint64_t sub_20BCE73D0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_20BCE73E0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_20BCE73F0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_20BCE7400()
{
  return MEMORY[0x270F26F20]();
}

uint64_t sub_20BCE7410()
{
  return MEMORY[0x270F26F28]();
}

uint64_t sub_20BCE7430()
{
  return MEMORY[0x270F26F68]();
}

uint64_t sub_20BCE7440()
{
  return MEMORY[0x270F26FF8]();
}

uint64_t sub_20BCE7450()
{
  return MEMORY[0x270F27000]();
}

uint64_t sub_20BCE7470()
{
  return MEMORY[0x270F27018]();
}

uint64_t sub_20BCE7480()
{
  return MEMORY[0x270F27020]();
}

uint64_t sub_20BCE7490()
{
  return MEMORY[0x270F27028]();
}

uint64_t sub_20BCE74A0()
{
  return MEMORY[0x270F27030]();
}

uint64_t sub_20BCE74B0()
{
  return MEMORY[0x270F27038]();
}

uint64_t sub_20BCE74C0()
{
  return MEMORY[0x270F27040]();
}

uint64_t sub_20BCE74D0()
{
  return MEMORY[0x270F27050]();
}

uint64_t sub_20BCE74E0()
{
  return MEMORY[0x270F27060]();
}

uint64_t sub_20BCE74F0()
{
  return MEMORY[0x270F27068]();
}

uint64_t sub_20BCE7500()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_20BCE7510()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_20BCE7520()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_20BCE7530()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_20BCE7540()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_20BCE7550()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t sub_20BCE7560()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_20BCE7570()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_20BCE7580()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_20BCE7590()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_20BCE75A0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_20BCE75B0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_20BCE75C0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_20BCE75D0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_20BCE75E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_20BCE75F0()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_20BCE7600()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_20BCE7610()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_20BCE7620()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_20BCE7630()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_20BCE7640()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_20BCE7650()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_20BCE7660()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_20BCE7670()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_20BCE7680()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_20BCE7690()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_20BCE76A0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_20BCE76B0()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_20BCE76C0()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t sub_20BCE76D0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_20BCE76E0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_20BCE76F0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_20BCE7700()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_20BCE7710()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_20BCE7720()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_20BCE7730()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_20BCE7740()
{
  return MEMORY[0x270F3C0A8]();
}

uint64_t sub_20BCE7750()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_20BCE7760()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_20BCE7770()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_20BCE7780()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_20BCE7790()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_20BCE77A0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_20BCE77B0()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_20BCE77C0()
{
  return MEMORY[0x270F9DCB0]();
}

uint64_t sub_20BCE77D0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_20BCE77E0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_20BCE77F0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_20BCE7800()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_20BCE7810()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_20BCE7820()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_20BCE7840()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_20BCE7850()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_20BCE7860()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_20BCE7870()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_20BCE7880()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_20BCE7890()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_20BCE78A0()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_20BCE78D0()
{
  return MEMORY[0x270FA1FC8]();
}

uint64_t sub_20BCE78F0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_20BCE7900()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_20BCE7910()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_20BCE7920()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_20BCE7930()
{
  return MEMORY[0x270EF1CA8]();
}

uint64_t sub_20BCE7940()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_20BCE7950()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_20BCE7960()
{
  return MEMORY[0x270F9DEC8]();
}

uint64_t sub_20BCE7970()
{
  return MEMORY[0x270F9DEE0]();
}

uint64_t sub_20BCE7980()
{
  return MEMORY[0x270F3C0B8]();
}

uint64_t sub_20BCE7990()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_20BCE79A0()
{
  return MEMORY[0x270F9DF10]();
}

uint64_t sub_20BCE79B0()
{
  return MEMORY[0x270F9DF50]();
}

uint64_t sub_20BCE79C0()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_20BCE79D0()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_20BCE79E0()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_20BCE79F0()
{
  return MEMORY[0x270F9DFA8]();
}

uint64_t sub_20BCE7A00()
{
  return MEMORY[0x270F9DFB8]();
}

uint64_t sub_20BCE7A10()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_20BCE7A20()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_20BCE7A30()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_20BCE7A40()
{
  return MEMORY[0x270F3C0C8]();
}

uint64_t sub_20BCE7A50()
{
  return MEMORY[0x270F3C0D8]();
}

uint64_t sub_20BCE7A60()
{
  return MEMORY[0x270EF3AB0]();
}

uint64_t sub_20BCE7A70()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_20BCE7A80()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_20BCE7A90()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_20BCE7AA0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_20BCE7AB0()
{
  return MEMORY[0x270F3C130]();
}

uint64_t sub_20BCE7AC0()
{
  return MEMORY[0x270F3C138]();
}

uint64_t sub_20BCE7AD0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_20BCE7AE0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_20BCE7AF0()
{
  return MEMORY[0x270EF2050]();
}

uint64_t sub_20BCE7B00()
{
  return MEMORY[0x270EF3AB8]();
}

uint64_t sub_20BCE7B10()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_20BCE7B20()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_20BCE7B30()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_20BCE7B40()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_20BCE7B50()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_20BCE7B60()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_20BCE7B70()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_20BCE7B80()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_20BCE7B90()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t sub_20BCE7BA0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_20BCE7BB0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_20BCE7BC0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_20BCE7BD0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_20BCE7BE0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_20BCE7BF0()
{
  return MEMORY[0x270EF2508]();
}

uint64_t sub_20BCE7C00()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_20BCE7C20()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_20BCE7C30()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_20BCE7C40()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_20BCE7C50()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_20BCE7C60()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_20BCE7C70()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_20BCE7C80()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_20BCE7C90()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_20BCE7CA0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_20BCE7CB0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_20BCE7CC0()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_20BCE7CE0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_20BCE7CF0()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_20BCE7D00()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_20BCE7D10()
{
  return MEMORY[0x270F9E8A0]();
}

uint64_t sub_20BCE7D20()
{
  return MEMORY[0x270EF2608]();
}

uint64_t sub_20BCE7D30()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_20BCE7D40()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_20BCE7D50()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_20BCE7D70()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_20BCE7D80()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_20BCE7D90()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_20BCE7DA0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_20BCE7DB0()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_20BCE7DC0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_20BCE7DD0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_20BCE7DE0()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_20BCE7DF0()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_20BCE7E00()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_20BCE7E10()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_20BCE7E20()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_20BCE7E30()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_20BCE7E40()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_20BCE7E50()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_20BCE7E60()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_20BCE7E70()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_20BCE7E80()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_20BCE7E90()
{
  return MEMORY[0x270FA2210]();
}

uint64_t sub_20BCE7EA0()
{
  return MEMORY[0x270FA2218]();
}

uint64_t sub_20BCE7EB0()
{
  return MEMORY[0x270FA2220]();
}

uint64_t sub_20BCE7EC0()
{
  return MEMORY[0x270FA2228]();
}

uint64_t sub_20BCE7ED0()
{
  return MEMORY[0x270FA2230]();
}

uint64_t sub_20BCE7EE0()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_20BCE7EF0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_20BCE7F00()
{
  return MEMORY[0x270F9EFF8]();
}

uint64_t sub_20BCE7F10()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_20BCE7F20()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_20BCE7F30()
{
  return MEMORY[0x270F9F090]();
}

uint64_t sub_20BCE7F40()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_20BCE7F50()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_20BCE7F60()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_20BCE7F70()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_20BCE7F90()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_20BCE7FA0()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_20BCE7FB0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_20BCE7FC0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_20BCE7FE0()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_20BCE7FF0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_20BCE8000()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_20BCE8020()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_20BCE8040()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_20BCE8050()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_20BCE8060()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_20BCE8070()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_20BCE8080()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_20BCE8090()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_20BCE80A0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_20BCE80B0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_20BCE80C0()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_20BCE80D0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_20BCE80E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_20BCE80F0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_20BCE8100()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_20BCE8110()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_20BCE8120()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_20BCE8130()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_20BCE8140()
{
  return MEMORY[0x270EF2760]();
}

uint64_t sub_20BCE8150()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AXFormatNumberWithOptions()
{
  return MEMORY[0x270F09260]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x270EE20D8](inAudioFile);
}

OSStatus AudioFileCreateWithURL(CFURLRef inFileRef, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inFormat, AudioFileFlags inFlags, AudioFileID *outAudioFile)
{
  return MEMORY[0x270EE20E8](inFileRef, *(void *)&inFileType, inFormat, *(void *)&inFlags, outAudioFile);
}

OSStatus AudioFormatGetProperty(AudioFormatPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x270EE2148](*(void *)&inPropertyID, *(void *)&inSpecifierSize, inSpecifier, ioPropertyDataSize, outPropertyData);
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x270EE2200](inFileURL, outSystemSoundID);
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
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

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

CGPoint CGPointFromString(NSString *string)
{
  MEMORY[0x270F05E70](string);
  result.y = v2;
  result.x = v1;
  return result;
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

uint64_t COAlarmSiriContextTargetReferenceForAccessory()
{
  return MEMORY[0x270F188E0]();
}

uint64_t COTimerSiriContextTargetReferenceForAccessory()
{
  return MEMORY[0x270F188F8]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

uint64_t HMDaysOfTheWeekToDateComponents()
{
  return MEMORY[0x270EF3BC0]();
}

uint64_t HMHomeManagerOptionsToString()
{
  return MEMORY[0x270EF3C38]();
}

uint64_t HMHomeWalletKeyColorAsString()
{
  return MEMORY[0x270EF3C48]();
}

uint64_t HMNetworkStatusAsString()
{
  return MEMORY[0x270EF3CF0]();
}

uint64_t HMResidentDeviceCapabilitiesDescription()
{
  return MEMORY[0x270EF3D08]();
}

uint64_t HMResidentDeviceStatusDescription()
{
  return MEMORY[0x270EF3D10]();
}

uint64_t HMSetupAccessoryProgressAsString()
{
  return MEMORY[0x270EF3D30]();
}

uint64_t HMSiriEndpointOnboardingResultAsString()
{
  return MEMORY[0x270EF3D38]();
}

uint64_t HMSoftwareUpdateUpdateTypeToString()
{
  return MEMORY[0x270EF3D60]();
}

uint64_t HMStringFromCameraClipQuality()
{
  return MEMORY[0x270EF3D68]();
}

uint64_t HMStringFromHomeLocation()
{
  return MEMORY[0x270EF3D80]();
}

uint64_t HMUserPrivilegeToString()
{
  return MEMORY[0x270EF3DB8]();
}

uint64_t HM_FEATURE_RVC_DEFAULTS_ENABLED()
{
  return MEMORY[0x270F3C300]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x270F3C978]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE48]();
}

uint64_t NAEmptyResult()
{
  return MEMORY[0x270F4DC60]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSZone *NSDefaultMallocZone(void)
{
  return (NSZone *)MEMORY[0x270EF2A70]();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F06070](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void bzero(void *a1, size_t a2)
{
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

uint64_t createDescriptionForMetriclogFile()
{
  return MEMORY[0x270F904E0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

void free(void *a1)
{
}

uint64_t localizationKeyForAccessoryCategoryType()
{
  return MEMORY[0x270EF3E80]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x270EF87D8]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x270EF8810]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x270EF89B8](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x270EF8A08]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x270EF8A58](path, *(void *)&interface_type);
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

void objc_moveWeak(id *to, id *from)
{
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFE0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

uint64_t setupAWDConnection()
{
  return MEMORY[0x270F904E8]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x270FA02A0]();
}

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x270FA02A8]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x270FA02B8]();
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

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x270FA03D8]();
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

uint64_t teardownAWDConnection()
{
  return MEMORY[0x270F904F0]();
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x270F994D0](*(void *)&c);
}

uint64_t ulistfmt_close()
{
  return MEMORY[0x270F99728]();
}

uint64_t ulistfmt_format()
{
  return MEMORY[0x270F99730]();
}

uint64_t ulistfmt_open()
{
  return MEMORY[0x270F99738]();
}