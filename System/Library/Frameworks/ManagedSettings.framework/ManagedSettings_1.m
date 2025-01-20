uint64_t sub_1BCA20C7C(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  int64_t v39;
  uint64_t result;
  unint64_t v41;
  unint64_t v42;
  int64_t v43;
  unint64_t v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  id v53;
  uint64_t v54;
  uint64_t v55[2];
  uint64_t v56;

  v54 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v9 - 8, v10);
  v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9FABA80 != -1) {
LABEL_45:
  }
    swift_once();
  swift_beginAccess();
  v13 = off_1E9FABF10;
  if (off_1E9FABF10)
  {
    v15 = *(void *)(a1 + 8);
    v14 = *(void *)(a1 + 16);
    v16 = *(unsigned __int8 *)(a1 + 66);
    if (a5)
    {
      v17 = (uint64_t)a5;
    }
    else
    {
      a4 = *((void *)off_1E9FABF10 + 2);
      v17 = *((void *)off_1E9FABF10 + 3);
      swift_bridgeObjectRetain();
    }
    a1 = v13[5];
    swift_retain();
    swift_bridgeObjectRetain();
    objc_msgSend((id)a1, sel_lock);
    swift_beginAccess();
    v19 = v13[4];
    if (*(void *)(v19 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v20 = sub_1BC9A69D0(a4, v17);
      if (v21)
      {
        a1 = v20;
        v51 = v14;
        v22 = v15;
        v23 = *(void *)(v19 + 56);
        v24 = sub_1BCA484B8();
        v52 = v16;
        v25 = v24;
        v26 = *(void *)(v24 - 8);
        v53 = (id)a4;
        v27 = a2;
        v28 = v26;
        v29 = v23 + *(void *)(v26 + 72) * a1;
        v15 = v22;
        v14 = v51;
        (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v12, v29, v24);
        v30 = v25;
        v16 = v52;
        (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v12, 0, 1, v30);
        a2 = v27;
        a4 = (unint64_t)v53;
      }
      else
      {
        v32 = sub_1BCA484B8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v12, 1, 1, v32);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v31 = sub_1BCA484B8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v12, 1, 1, v31);
    }
    objc_msgSend((id)v13[5], sel_unlock);
    if (qword_1EBA01E50 != -1) {
      swift_once();
    }
    a5 = (uint64_t *)qword_1EBA01E48;
    v18 = sub_1BC9E757C(v15, v14, (uint64_t)v12, a4, v17, a2, v54, v16);
    swift_bridgeObjectRelease();
    sub_1BC9A3A70((uint64_t)v12, &qword_1E9FABE30);
    swift_release();
  }
  else
  {
    v18 = 0;
  }
  v33 = sub_1BC9C0EFC(v18);
  if (!v33)
  {

    return 0;
  }
  v34 = v33;
  v53 = v18;
  v56 = MEMORY[0x1E4FBC870];
  v35 = *(void *)(v33 + 56);
  v54 = v33 + 56;
  v36 = 1 << *(unsigned char *)(v33 + 32);
  v37 = -1;
  if (v36 < 64) {
    v37 = ~(-1 << v36);
  }
  v38 = v37 & v35;
  v39 = (unint64_t)(v36 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  a2 = 0;
  while (v38)
  {
    v41 = __clz(__rbit64(v38));
    v38 &= v38 - 1;
    v42 = v41 | (a2 << 6);
LABEL_40:
    v46 = *(void *)(v34 + 48);
    v47 = v46 + 48 * v42;
    a4 = *(void *)(v47 + 24);
    if (a4 >> 60 != 15)
    {
      v48 = v46 + 48 * v42;
      v12 = *(char **)(v48 + 40);
      v49 = *(void *)(v47 + 16);
      a1 = *(void *)(v48 + 8);
      swift_bridgeObjectRetain();
      sub_1BC9A3B24(v49, a4);
      swift_bridgeObjectRetain();
      sub_1BC9A3B24(v49, a4);
      a5 = &v56;
      sub_1BC9CE4DC(v55, v49, a4);
      sub_1BC9A3ACC(v55[0], v55[1]);
      swift_bridgeObjectRelease();
      sub_1BC9A3B38(v49, a4);
      result = swift_bridgeObjectRelease();
    }
  }
  v43 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
    __break(1u);
    goto LABEL_45;
  }
  if (v43 >= v39) {
    goto LABEL_42;
  }
  v44 = *(void *)(v54 + 8 * v43);
  ++a2;
  if (v44) {
    goto LABEL_39;
  }
  a2 = v43 + 1;
  if (v43 + 1 >= v39) {
    goto LABEL_42;
  }
  v44 = *(void *)(v54 + 8 * a2);
  if (v44) {
    goto LABEL_39;
  }
  a2 = v43 + 2;
  if (v43 + 2 >= v39) {
    goto LABEL_42;
  }
  v44 = *(void *)(v54 + 8 * a2);
  if (v44) {
    goto LABEL_39;
  }
  a2 = v43 + 3;
  if (v43 + 3 >= v39) {
    goto LABEL_42;
  }
  v44 = *(void *)(v54 + 8 * a2);
  if (v44) {
    goto LABEL_39;
  }
  a2 = v43 + 4;
  if (v43 + 4 >= v39) {
    goto LABEL_42;
  }
  v44 = *(void *)(v54 + 8 * a2);
  if (v44)
  {
LABEL_39:
    v38 = (v44 - 1) & v44;
    v42 = __clz(__rbit64(v44)) + (a2 << 6);
    goto LABEL_40;
  }
  v45 = v43 + 5;
  if (v45 >= v39)
  {
LABEL_42:
    swift_release();

    swift_bridgeObjectRelease();
    return v56;
  }
  v44 = *(void *)(v54 + 8 * v45);
  if (v44)
  {
    a2 = v45;
    goto LABEL_39;
  }
  while (1)
  {
    a2 = v45 + 1;
    if (__OFADD__(v45, 1)) {
      break;
    }
    if (a2 >= v39) {
      goto LABEL_42;
    }
    v44 = *(void *)(v54 + 8 * a2);
    ++v45;
    if (v44) {
      goto LABEL_39;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1BCA21200(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  uint64_t v52 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v9 - 8, v10);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9FABA80 != -1) {
LABEL_45:
  }
    swift_once();
  swift_beginAccess();
  v13 = off_1E9FABF10;
  if (off_1E9FABF10)
  {
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v14 = *(void *)(a1 + 16);
    int v16 = *(unsigned __int8 *)(a1 + 66);
    if (a5)
    {
      uint64_t v17 = (uint64_t)a5;
    }
    else
    {
      a4 = *((void *)off_1E9FABF10 + 2);
      uint64_t v17 = *((void *)off_1E9FABF10 + 3);
      swift_bridgeObjectRetain();
    }
    v18 = (void *)*((void *)v13 + 5);
    swift_retain();
    swift_bridgeObjectRetain();
    objc_msgSend(v18, sel_lock);
    swift_beginAccess();
    uint64_t v19 = *((void *)v13 + 4);
    if (*(void *)(v19 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_1BC9A69D0(a4, v17);
      if (v21)
      {
        unint64_t v22 = v20;
        uint64_t v49 = v14;
        uint64_t v23 = v15;
        uint64_t v24 = *(void *)(v19 + 56);
        uint64_t v25 = sub_1BCA484B8();
        int v50 = v16;
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)(v25 - 8);
        unint64_t v51 = a4;
        v28 = a2;
        uint64_t v29 = v27;
        uint64_t v30 = v24 + *(void *)(v27 + 72) * v22;
        uint64_t v15 = v23;
        uint64_t v14 = v49;
        (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v12, v30, v25);
        uint64_t v31 = v26;
        int v16 = v50;
        (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v12, 0, 1, v31);
        a2 = v28;
        a4 = v51;
      }
      else
      {
        uint64_t v33 = sub_1BCA484B8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v12, 1, 1, v33);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v32 = sub_1BCA484B8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v12, 1, 1, v32);
    }
    objc_msgSend(*((id *)v13 + 5), sel_unlock);
    if (qword_1EBA01E50 != -1) {
      swift_once();
    }
    a5 = (uint64_t *)qword_1EBA01E48;
    a2 = sub_1BC9E757C(v15, v14, (uint64_t)v12, a4, v17, (uint64_t)a2, v52, v16);
    swift_bridgeObjectRelease();
    sub_1BC9A3A70((uint64_t)v12, &qword_1E9FABE30);
    swift_release();
  }
  else
  {
    a2 = 0;
  }
  uint64_t v34 = sub_1BC9C145C(a2);
  if (!v34)
  {

    return 0;
  }
  uint64_t v35 = v34;
  uint64_t v54 = MEMORY[0x1E4FBC870];
  a1 = v34 + 56;
  uint64_t v36 = 1 << *(unsigned char *)(v34 + 32);
  uint64_t v37 = -1;
  if (v36 < 64) {
    uint64_t v37 = ~(-1 << v36);
  }
  unint64_t v38 = v37 & *(void *)(v34 + 56);
  int64_t v39 = (unint64_t)(v36 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v41 = 0;
  while (v38)
  {
    unint64_t v42 = __clz(__rbit64(v38));
    v38 &= v38 - 1;
    unint64_t v43 = v42 | (v41 << 6);
LABEL_40:
    uint64_t v47 = *(void *)(v35 + 48) + 32 * v43;
    a4 = *(void *)(v47 + 24);
    if (a4 >> 60 != 15)
    {
      v12 = *(char **)(v47 + 16);
      swift_bridgeObjectRetain();
      sub_1BC9A3B24((uint64_t)v12, a4);
      sub_1BC9A3B24((uint64_t)v12, a4);
      a5 = &v54;
      sub_1BC9CE5AC(v53, (uint64_t)v12, a4);
      sub_1BC9A3ACC(v53[0], v53[1]);
      swift_bridgeObjectRelease();
      uint64_t result = sub_1BC9A3B38((uint64_t)v12, a4);
    }
  }
  int64_t v44 = v41 + 1;
  if (__OFADD__(v41, 1))
  {
    __break(1u);
    goto LABEL_45;
  }
  if (v44 >= v39) {
    goto LABEL_42;
  }
  unint64_t v45 = *(void *)(a1 + 8 * v44);
  ++v41;
  if (v45) {
    goto LABEL_39;
  }
  int64_t v41 = v44 + 1;
  if (v44 + 1 >= v39) {
    goto LABEL_42;
  }
  unint64_t v45 = *(void *)(a1 + 8 * v41);
  if (v45) {
    goto LABEL_39;
  }
  int64_t v41 = v44 + 2;
  if (v44 + 2 >= v39) {
    goto LABEL_42;
  }
  unint64_t v45 = *(void *)(a1 + 8 * v41);
  if (v45) {
    goto LABEL_39;
  }
  int64_t v41 = v44 + 3;
  if (v44 + 3 >= v39) {
    goto LABEL_42;
  }
  unint64_t v45 = *(void *)(a1 + 8 * v41);
  if (v45) {
    goto LABEL_39;
  }
  int64_t v41 = v44 + 4;
  if (v44 + 4 >= v39) {
    goto LABEL_42;
  }
  unint64_t v45 = *(void *)(a1 + 8 * v41);
  if (v45)
  {
LABEL_39:
    unint64_t v38 = (v45 - 1) & v45;
    unint64_t v43 = __clz(__rbit64(v45)) + (v41 << 6);
    goto LABEL_40;
  }
  int64_t v46 = v44 + 5;
  if (v46 >= v39)
  {
LABEL_42:
    swift_release();

    swift_bridgeObjectRelease();
    return v54;
  }
  unint64_t v45 = *(void *)(a1 + 8 * v46);
  if (v45)
  {
    int64_t v41 = v46;
    goto LABEL_39;
  }
  while (1)
  {
    int64_t v41 = v46 + 1;
    if (__OFADD__(v46, 1)) {
      break;
    }
    if (v41 >= v39) {
      goto LABEL_42;
    }
    unint64_t v45 = *(void *)(a1 + 8 * v41);
    ++v46;
    if (v45) {
      goto LABEL_39;
    }
  }
  __break(1u);
  return result;
}

void sub_1BCA21744(uint64_t a1, int64_t a2, uint64_t a3, void *a4, int64_t a5, unint64_t a6)
{
  unint64_t v6 = a6;
  int64_t v7 = a5;
  v8 = a4;
  int64_t v9 = a2;
  uint64_t v10 = (void *)a1;
  if (a1)
  {
    uint64_t v35 = MEMORY[0x1E4FBC870];
    uint64_t v31 = a1 + 56;
    uint64_t v11 = 1 << *(unsigned char *)(a1 + 32);
    uint64_t v12 = -1;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    unint64_t v6 = v12 & *(void *)(a1 + 56);
    int64_t v9 = (unint64_t)(v11 + 63) >> 6;
    v8 = v37;
    swift_bridgeObjectRetain_n();
    int64_t v7 = 0;
    while (1)
    {
      if (v6)
      {
        unint64_t v13 = __clz(__rbit64(v6));
        v6 &= v6 - 1;
        unint64_t v14 = v13 | (v7 << 6);
      }
      else
      {
        int64_t v20 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
          __break(1u);
          goto LABEL_32;
        }
        if (v20 >= v9) {
          goto LABEL_26;
        }
        unint64_t v21 = *(void *)(v31 + 8 * v20);
        ++v7;
        if (!v21)
        {
          int64_t v7 = v20 + 1;
          if (v20 + 1 >= v9) {
            goto LABEL_26;
          }
          unint64_t v21 = *(void *)(v31 + 8 * v7);
          if (!v21)
          {
            int64_t v7 = v20 + 2;
            if (v20 + 2 >= v9) {
              goto LABEL_26;
            }
            unint64_t v21 = *(void *)(v31 + 8 * v7);
            if (!v21)
            {
              int64_t v7 = v20 + 3;
              if (v20 + 3 >= v9) {
                goto LABEL_26;
              }
              unint64_t v21 = *(void *)(v31 + 8 * v7);
              if (!v21)
              {
                int64_t v7 = v20 + 4;
                if (v20 + 4 >= v9) {
                  goto LABEL_26;
                }
                unint64_t v21 = *(void *)(v31 + 8 * v7);
                if (!v21)
                {
                  int64_t v22 = v20 + 5;
                  if (v22 >= v9)
                  {
LABEL_26:
                    swift_release();
                    swift_bridgeObjectRelease();
                    uint64_t v10 = (void *)sub_1BC9AC368(v35);
                    swift_bridgeObjectRelease();
                    int64_t v7 = a5;
                    unint64_t v6 = a6;
                    v8 = a4;
                    int64_t v9 = a2;
                    break;
                  }
                  unint64_t v21 = *(void *)(v31 + 8 * v22);
                  if (!v21)
                  {
                    while (1)
                    {
                      int64_t v7 = v22 + 1;
                      if (__OFADD__(v22, 1)) {
                        break;
                      }
                      if (v7 >= v9) {
                        goto LABEL_26;
                      }
                      unint64_t v21 = *(void *)(v31 + 8 * v7);
                      ++v22;
                      if (v21) {
                        goto LABEL_25;
                      }
                    }
                    __break(1u);
                    return;
                  }
                  int64_t v7 = v22;
                }
              }
            }
          }
        }
LABEL_25:
        unint64_t v6 = (v21 - 1) & v21;
        unint64_t v14 = __clz(__rbit64(v21)) + (v7 << 6);
      }
      uint64_t v15 = (uint64_t *)(v10[6] + 16 * v14);
      uint64_t v16 = *v15;
      unint64_t v17 = v15[1];
      v36[0] = 0;
      v36[1] = 0;
      v36[2] = v16;
      v36[3] = v17;
      v37[0] = 0;
      v37[1] = 0;
      sub_1BC9A396C(v16, v17);
      sub_1BC9A396C(v16, v17);
      sub_1BC9CAA10((uint64_t)v32, v36);
      uint64_t v18 = v33;
      unint64_t v19 = v34;
      swift_bridgeObjectRelease();
      sub_1BC9A3B38(v18, v19);
      swift_bridgeObjectRelease();
      sub_1BC9A3ACC(v16, v17);
    }
  }
  if (qword_1E9FABA80 != -1) {
LABEL_32:
  }
    swift_once();
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v23 = *(void *)(v9 + 8);
    uint64_t v24 = *(void *)(v9 + 16);
    v32[0] = a3;
    v32[1] = (uint64_t)v8;
    uint64_t v33 = v7;
    unint64_t v34 = v6;
    int v25 = *(unsigned __int8 *)(v9 + 66);
    swift_retain();
    sub_1BC9A4CA8(v10, v23, v24, v32, v25);
    swift_release();
  }
}

void sub_1BCA21A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int64_t a5, unint64_t a6)
{
  unint64_t v6 = a6;
  int64_t v7 = a5;
  uint64_t v8 = a4;
  uint64_t v10 = (void *)a1;
  if (a1)
  {
    uint64_t v34 = MEMORY[0x1E4FBC870];
    unint64_t v6 = a1 + 56;
    uint64_t v11 = 1 << *(unsigned char *)(a1 + 32);
    uint64_t v12 = -1;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    unint64_t v13 = v12 & *(void *)(a1 + 56);
    int64_t v7 = (unint64_t)(v11 + 63) >> 6;
    swift_bridgeObjectRetain_n();
    uint64_t v8 = 0;
    while (1)
    {
      if (v13)
      {
        unint64_t v14 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v15 = v14 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
          goto LABEL_32;
        }
        if (v21 >= v7) {
          goto LABEL_26;
        }
        unint64_t v22 = *(void *)(v6 + 8 * v21);
        ++v8;
        if (!v22)
        {
          uint64_t v8 = v21 + 1;
          if (v21 + 1 >= v7) {
            goto LABEL_26;
          }
          unint64_t v22 = *(void *)(v6 + 8 * v8);
          if (!v22)
          {
            uint64_t v8 = v21 + 2;
            if (v21 + 2 >= v7) {
              goto LABEL_26;
            }
            unint64_t v22 = *(void *)(v6 + 8 * v8);
            if (!v22)
            {
              uint64_t v8 = v21 + 3;
              if (v21 + 3 >= v7) {
                goto LABEL_26;
              }
              unint64_t v22 = *(void *)(v6 + 8 * v8);
              if (!v22)
              {
                uint64_t v8 = v21 + 4;
                if (v21 + 4 >= v7) {
                  goto LABEL_26;
                }
                unint64_t v22 = *(void *)(v6 + 8 * v8);
                if (!v22)
                {
                  int64_t v23 = v21 + 5;
                  if (v23 >= v7)
                  {
LABEL_26:
                    swift_release();
                    swift_bridgeObjectRelease();
                    uint64_t v10 = (void *)sub_1BC9AC3AC(v34);
                    swift_bridgeObjectRelease();
                    int64_t v7 = a5;
                    unint64_t v6 = a6;
                    uint64_t v8 = a4;
                    break;
                  }
                  unint64_t v22 = *(void *)(v6 + 8 * v23);
                  if (!v22)
                  {
                    while (1)
                    {
                      uint64_t v8 = v23 + 1;
                      if (__OFADD__(v23, 1)) {
                        break;
                      }
                      if (v8 >= v7) {
                        goto LABEL_26;
                      }
                      unint64_t v22 = *(void *)(v6 + 8 * v8);
                      ++v23;
                      if (v22) {
                        goto LABEL_25;
                      }
                    }
                    __break(1u);
                    return;
                  }
                  uint64_t v8 = v23;
                }
              }
            }
          }
        }
LABEL_25:
        unint64_t v13 = (v22 - 1) & v22;
        unint64_t v15 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v16 = (uint64_t *)(v10[6] + 16 * v15);
      uint64_t v17 = *v16;
      unint64_t v18 = v16[1];
      sub_1BC9A396C(*v16, v18);
      sub_1BC9A396C(v17, v18);
      sub_1BC9CAE7C(v31, 0, 0, v17, v18);
      uint64_t v19 = v32;
      unint64_t v20 = v33;
      swift_bridgeObjectRelease();
      sub_1BC9A3B38(v19, v20);
      sub_1BC9A3ACC(v17, v18);
    }
  }
  if (qword_1E9FABA80 != -1) {
LABEL_32:
  }
    swift_once();
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v24 = *(void *)(a2 + 8);
    uint64_t v25 = *(void *)(a2 + 16);
    v31[0] = a3;
    v31[1] = v8;
    int64_t v32 = v7;
    unint64_t v33 = v6;
    int v26 = *(unsigned __int8 *)(a2 + 66);
    swift_retain();
    sub_1BC9A4CA8(v10, v24, v25, v31, v26);
    swift_release();
  }
}

uint64_t sub_1BCA21CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v12 - 8, v13);
  unint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v16 = off_1E9FABF10;
  if (off_1E9FABF10)
  {
    uint64_t v17 = *(void *)(a1 + 16);
    uint64_t v44 = *(void *)(a1 + 8);
    uint64_t v45 = v17;
    int v18 = *(unsigned __int8 *)(a1 + 66);
    if (a5)
    {
      uint64_t v19 = a5;
    }
    else
    {
      a4 = *((void *)off_1E9FABF10 + 2);
      uint64_t v19 = *((void *)off_1E9FABF10 + 3);
      swift_bridgeObjectRetain();
    }
    int64_t v21 = (void *)*((void *)v16 + 5);
    swift_retain();
    swift_bridgeObjectRetain();
    objc_msgSend(v21, sel_lock);
    swift_beginAccess();
    uint64_t v22 = *((void *)v16 + 4);
    if (*(void *)(v22 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v23 = sub_1BC9A69D0(a4, v19);
      if (v24)
      {
        unint64_t v25 = v23;
        uint64_t v42 = a4;
        int v26 = a6;
        uint64_t v27 = a3;
        uint64_t v28 = *(void *)(v22 + 56);
        uint64_t v29 = sub_1BCA484B8();
        int v41 = v18;
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)(v29 - 8);
        uint64_t v43 = a2;
        uint64_t v32 = v31;
        uint64_t v33 = v28 + *(void *)(v31 + 72) * v25;
        a3 = v27;
        a6 = v26;
        a4 = v42;
        (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v15, v33, v29);
        uint64_t v34 = v30;
        int v18 = v41;
        (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v15, 0, 1, v34);
        a2 = v43;
      }
      else
      {
        uint64_t v36 = sub_1BCA484B8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v15, 1, 1, v36);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v35 = sub_1BCA484B8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v15, 1, 1, v35);
    }
    uint64_t v37 = v44;
    objc_msgSend(*((id *)v16 + 5), sel_unlock);
    if (qword_1EBA01E50 != -1) {
      swift_once();
    }
    unint64_t v20 = sub_1BC9E757C(v37, v45, (uint64_t)v15, a4, v19, a2, a3, v18);
    swift_bridgeObjectRelease();
    sub_1BC9A3A70((uint64_t)v15, &qword_1E9FABE30);
    swift_release();
  }
  else
  {
    unint64_t v20 = 0;
  }
  uint64_t v38 = a6(v20);

  return v38;
}

uint64_t sub_1BCA2208C(uint64_t *a1)
{
  if (qword_1E9FABAC8 != -1) {
LABEL_32:
  }
    swift_once();
  swift_beginAccess();
  if (qword_1E9FAC238)
  {
    uint64_t v2 = a1[1];
    uint64_t v3 = a1[2];
    swift_retain();
    v4 = sub_1BC9AEFD0(v2, v3);
    swift_release();
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = sub_1BC9C0EFC(v4);

      if (v6) {
        return v6;
      }
    }
  }
  a1 = (uint64_t *)*a1;
  uint64_t v27 = MEMORY[0x1E4FBC870];
  unint64_t v23 = a1 + 7;
  uint64_t v7 = 1 << *((unsigned char *)a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & a1[7];
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain_n();
  int64_t v12 = 0;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v20 >= v10) {
      goto LABEL_29;
    }
    unint64_t v21 = v23[v20];
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v10) {
        goto LABEL_29;
      }
      unint64_t v21 = v23[v12];
      if (!v21)
      {
        int64_t v12 = v20 + 2;
        if (v20 + 2 >= v10) {
          goto LABEL_29;
        }
        unint64_t v21 = v23[v12];
        if (!v21)
        {
          int64_t v12 = v20 + 3;
          if (v20 + 3 >= v10) {
            goto LABEL_29;
          }
          unint64_t v21 = v23[v12];
          if (!v21)
          {
            int64_t v12 = v20 + 4;
            if (v20 + 4 >= v10) {
              goto LABEL_29;
            }
            unint64_t v21 = v23[v12];
            if (!v21) {
              break;
            }
          }
        }
      }
    }
LABEL_28:
    unint64_t v9 = (v21 - 1) & v21;
    unint64_t v14 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v15 = (uint64_t *)(a1[6] + 16 * v14);
    uint64_t v16 = *v15;
    unint64_t v17 = v15[1];
    v28[0] = 0;
    v28[1] = 0;
    v28[2] = v16;
    v28[3] = v17;
    v28[4] = 0;
    v28[5] = 0;
    sub_1BC9A396C(v16, v17);
    sub_1BC9A396C(v16, v17);
    sub_1BC9CAA10((uint64_t)v24, v28);
    uint64_t v18 = v25;
    unint64_t v19 = v26;
    swift_bridgeObjectRelease();
    sub_1BC9A3B38(v18, v19);
    swift_bridgeObjectRelease();
    uint64_t result = sub_1BC9A3ACC(v16, v17);
  }
  int64_t v22 = v20 + 5;
  if (v22 >= v10)
  {
LABEL_29:
    swift_release();
    swift_bridgeObjectRelease();
    return v27;
  }
  unint64_t v21 = v23[v22];
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v10) {
      goto LABEL_29;
    }
    unint64_t v21 = v23[v12];
    ++v22;
    if (v21) {
      goto LABEL_28;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1BCA22350(uint64_t *a1)
{
  if (qword_1E9FABAC8 != -1) {
LABEL_32:
  }
    swift_once();
  swift_beginAccess();
  if (qword_1E9FAC238)
  {
    uint64_t v2 = a1[1];
    uint64_t v3 = a1[2];
    swift_retain();
    v4 = sub_1BC9AEFD0(v2, v3);
    swift_release();
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = sub_1BC9C145C(v4);

      if (v6) {
        return v6;
      }
    }
  }
  a1 = (uint64_t *)*a1;
  uint64_t v25 = MEMORY[0x1E4FBC870];
  uint64_t v7 = a1 + 7;
  uint64_t v8 = 1 << *((unsigned char *)a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & a1[7];
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain_n();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v14 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v15 = v14 | (v13 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v11) {
      goto LABEL_29;
    }
    unint64_t v22 = v7[v21];
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_29;
      }
      unint64_t v22 = v7[v13];
      if (!v22)
      {
        int64_t v13 = v21 + 2;
        if (v21 + 2 >= v11) {
          goto LABEL_29;
        }
        unint64_t v22 = v7[v13];
        if (!v22)
        {
          int64_t v13 = v21 + 3;
          if (v21 + 3 >= v11) {
            goto LABEL_29;
          }
          unint64_t v22 = v7[v13];
          if (!v22)
          {
            int64_t v13 = v21 + 4;
            if (v21 + 4 >= v11) {
              goto LABEL_29;
            }
            unint64_t v22 = v7[v13];
            if (!v22) {
              break;
            }
          }
        }
      }
    }
LABEL_28:
    unint64_t v10 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_9:
    uint64_t v16 = (uint64_t *)(a1[6] + 16 * v15);
    uint64_t v17 = *v16;
    unint64_t v18 = v16[1];
    sub_1BC9A396C(*v16, v18);
    sub_1BC9A396C(v17, v18);
    sub_1BC9CAE7C(v24, 0, 0, v17, v18);
    uint64_t v19 = v24[2];
    unint64_t v20 = v24[3];
    swift_bridgeObjectRelease();
    sub_1BC9A3B38(v19, v20);
    uint64_t result = sub_1BC9A3ACC(v17, v18);
  }
  int64_t v23 = v21 + 5;
  if (v23 >= v11)
  {
LABEL_29:
    swift_release();
    swift_bridgeObjectRelease();
    return v25;
  }
  unint64_t v22 = v7[v23];
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v11) {
      goto LABEL_29;
    }
    unint64_t v22 = v7[v13];
    ++v23;
    if (v22) {
      goto LABEL_28;
    }
  }
  __break(1u);
  return result;
}

ManagedSettings::ShieldSettings::Name_optional __swiftcall ShieldSettings.Name.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BCA48C38();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static ShieldSettings.Name.allCases.getter()
{
  return &unk_1F16ED758;
}

unint64_t ShieldSettings.Name.rawValue.getter()
{
  unint64_t result = 0xD000000000000013;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 2:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BCA22704(char *a1, char *a2)
{
  return sub_1BC9F3E74(*a1, *a2);
}

uint64_t sub_1BCA22710()
{
  return sub_1BCA44F94();
}

uint64_t sub_1BCA22718()
{
  return sub_1BCA45668();
}

uint64_t sub_1BCA22720()
{
  return sub_1BCA463F8();
}

ManagedSettings::ShieldSettings::Name_optional sub_1BCA22728(Swift::String *a1)
{
  return ShieldSettings.Name.init(rawValue:)(*a1);
}

unint64_t sub_1BCA22734@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ShieldSettings.Name.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1BCA2275C(void *a1@<X8>)
{
  *a1 = &unk_1F16ED758;
}

uint64_t ShieldSettings.applications.getter()
{
  return sub_1BCA242F8(&qword_1E9FABCD8, (uint64_t)&qword_1E9FAE008, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BCA20C7C);
}

uint64_t ShieldSettings.applications.setter(uint64_t a1)
{
  return sub_1BCA24564(a1, &qword_1E9FABCD8, (uint64_t)&qword_1E9FAE008, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BCA21744);
}

uint64_t (*ShieldSettings.applications.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = (uint64_t)v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  unint64_t v6 = v1[2];
  char v5 = (uint64_t *)v1[3];
  if (qword_1E9FABCD8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1BCA20C7C((unint64_t)&qword_1E9FAE008, v3, v4, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a1 = v7;
  return sub_1BCA228A8;
}

uint64_t sub_1BCA228A8(uint64_t *a1, char a2)
{
  return sub_1BCA24708(a1, a2, (uint64_t)&qword_1E9FAE008, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BCA21744);
}

uint64_t ShieldSettings.untokenizedApplications.getter()
{
  return sub_1BCA24830(&qword_1E9FABCD8, (uint64_t)&qword_1E9FAE008, (uint64_t (*)(void))sub_1BC9C0EFC);
}

uint64_t ShieldSettings.untokenizedApplications.setter(uint64_t a1)
{
  if (qword_1E9FABCD8 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAE008, (uint64_t)v11, &qword_1E9FAE238);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = qword_1E9FABA80;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    swift_retain();
    if (a1) {
      uint64_t v8 = (void *)sub_1BC9AC368(a1);
    }
    else {
      uint64_t v8 = 0;
    }
    v10[0] = v4;
    v10[1] = v3;
    v10[2] = v6;
    v10[3] = v5;
    sub_1BC9A4CA8(v8, v12, v13, v10, v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return sub_1BC9A3A70((uint64_t)v11, &qword_1E9FAE238);
}

uint64_t (*ShieldSettings.untokenizedApplications.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = (uint64_t)v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABCD8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1BCA21CF0((uint64_t)&qword_1E9FAE008, v3, v4, v6, v5, (uint64_t (*)(void))sub_1BC9C0EFC);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a1 = v7;
  return sub_1BCA22B60;
}

uint64_t sub_1BCA22B60(uint64_t *a1, char a2)
{
  return sub_1BCA24C10(a1, a2, ShieldSettings.untokenizedApplications.setter);
}

uint64_t ShieldSettings.effectiveApplications.getter()
{
  return sub_1BCA24CB8(&qword_1E9FABCD8, (uint64_t)&qword_1E9FAE008, (uint64_t (*)(void))sub_1BCA2208C);
}

uint64_t sub_1BCA22BB0()
{
  qword_1E9FAE008 = MEMORY[0x1E4FBC870];
  qword_1E9FAE010 = 0xD000000000000013;
  qword_1E9FAE018 = 0x80000001BCA4F5F0;
  qword_1E9FAE038 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAC1B8);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAC1C0, &qword_1E9FAC1B8);
  qword_1E9FAE040 = result;
  byte_1E9FAE020 = 1;
  word_1E9FAE048 = 257;
  byte_1E9FAE04A = 0;
  qword_1E9FAE050 = 50;
  byte_1E9FAE058 = 0;
  return result;
}

uint64_t static ShieldSettings.applications.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA129AC(&qword_1E9FABCD8, (uint64_t)&qword_1E9FAE008, &qword_1E9FAE238, a1);
}

uint64_t ShieldSettings.applicationCategories.getter()
{
  return sub_1BCA24E24(&qword_1E9FABCE0, (uint64_t)&qword_1E9FAE060, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BC99DA28);
}

uint64_t ShieldSettings.applicationCategories.setter(uint64_t a1)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  if (*(unsigned __int8 *)(a1 + 16) > 1u)
  {
    if (*(unsigned char *)(a1 + 16) == 2)
    {
      if (qword_1E9FABCE0 != -1) {
        swift_once();
      }
      sub_1BC9AA050((uint64_t)&qword_1E9FAE060, (uint64_t)v42, &qword_1E9FAE240);
      uint64_t v14 = *v1;
      uint64_t v13 = v1[1];
      uint64_t v16 = v1[2];
      uint64_t v15 = v1[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v17 = (void *)sub_1BCA20028(v3, v2, 2);
      if (qword_1E9FABA80 != -1) {
        swift_once();
      }
      swift_beginAccess();
      if (!off_1E9FABF10)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return sub_1BC9A3A70((uint64_t)v42, &qword_1E9FAE240);
      }
      uint64_t v18 = v43;
      uint64_t v19 = v44;
      uint64_t v38 = v14;
      uint64_t v39 = v13;
      uint64_t v40 = v16;
      uint64_t v41 = v15;
      int v20 = v45;
      swift_retain();
      sub_1BC9A4CA8(v17, v18, v19, &v38, v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_1E9FABCE0 != -1) {
        swift_once();
      }
      sub_1BC9AA050((uint64_t)&qword_1E9FAE060, (uint64_t)v42, &qword_1E9FAE240);
      uint64_t v30 = *v1;
      uint64_t v29 = v1[1];
      uint64_t v32 = v1[2];
      uint64_t v31 = v1[3];
      uint64_t v33 = qword_1E9FABA80;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v33 != -1) {
        swift_once();
      }
      swift_beginAccess();
      if (!off_1E9FABF10)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return sub_1BC9A3A70((uint64_t)v42, &qword_1E9FAE240);
      }
      uint64_t v34 = v43;
      uint64_t v35 = v44;
      uint64_t v38 = v30;
      uint64_t v39 = v29;
      uint64_t v40 = v32;
      uint64_t v41 = v31;
      int v36 = v45;
      swift_retain();
      sub_1BC9A4CA8(0, v34, v35, &v38, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_release();
    return sub_1BC9A3A70((uint64_t)v42, &qword_1E9FAE240);
  }
  if (*(unsigned char *)(a1 + 16))
  {
    sub_1BC9E1560(*(void *)a1, v2, 1);
    if (qword_1E9FABCE0 != -1) {
      swift_once();
    }
    sub_1BC9AA050((uint64_t)&qword_1E9FAE060, (uint64_t)v42, &qword_1E9FAE240);
    uint64_t v22 = *v1;
    uint64_t v21 = v1[1];
    uint64_t v24 = v1[2];
    uint64_t v23 = v1[3];
    sub_1BCA23AA4(v3, v2, 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v25 = (void *)sub_1BCA20028(v3, v2, 1);
    sub_1BCA23ACC(v3, v2, 1);
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v26 = v43;
      uint64_t v27 = v44;
      uint64_t v38 = v22;
      uint64_t v39 = v21;
      uint64_t v40 = v24;
      uint64_t v41 = v23;
      int v28 = v45;
      swift_retain();
      sub_1BC9A4CA8(v25, v26, v27, &v38, v28);

      swift_release();
    }
    else
    {
    }
    sub_1BCA23ACC(v3, v2, 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BC9A3A70((uint64_t)v42, &qword_1E9FAE240);
    return sub_1BCA23ACC(v3, v2, 1);
  }
  else
  {
    uint64_t v4 = qword_1E9FABCE0;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v4 != -1) {
      swift_once();
    }
    sub_1BC9AA050((uint64_t)&qword_1E9FAE060, (uint64_t)v42, &qword_1E9FAE240);
    uint64_t v6 = *v1;
    uint64_t v5 = v1[1];
    uint64_t v8 = v1[2];
    uint64_t v7 = v1[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BCA23AA4(v3, v2, 0);
    uint64_t v9 = (void *)sub_1BCA20028(v3, v2, 0);
    sub_1BCA23ACC(v3, v2, 0);
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v10 = v43;
      uint64_t v11 = v44;
      uint64_t v38 = v6;
      uint64_t v39 = v5;
      uint64_t v40 = v8;
      uint64_t v41 = v7;
      int v12 = v45;
      swift_retain();
      sub_1BC9A4CA8(v9, v10, v11, &v38, v12);

      swift_release();
    }
    else
    {
    }
    sub_1BCA23ACC(v3, v2, 0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BC9A3A70((uint64_t)v42, &qword_1E9FAE240);
    return sub_1BCA23ACC(v3, v2, 0);
  }
}

uint64_t (*ShieldSettings.applicationCategories.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABCE0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DA28((uint64_t)&qword_1E9FAE060, v3, v4, v6, v5, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1BCA2332C;
}

uint64_t sub_1BCA2332C(uint64_t *a1, char a2)
{
  return sub_1BCA237E8(a1, a2, (void (*)(uint64_t *))ShieldSettings.applicationCategories.setter, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BCA23AA4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1BCA23ACC);
}

uint64_t ShieldSettings.untokenizedApplicationCategories.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA233A4(&qword_1E9FABCE0, (uint64_t)&qword_1E9FAE060, sub_1BC9C0EFC, a1);
}

uint64_t sub_1BCA233A4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void *)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = *v4;
  uint64_t v8 = v4[1];
  uint64_t v11 = v4[2];
  uint64_t v10 = v4[3];
  if (*a1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BCA208E4(a2, v9, v8, v11, v10, a3, a4);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

double sub_1BCA23450@<D0>(uint64_t *a1@<X0>, uint64_t *a2@<X3>, uint64_t a3@<X4>, uint64_t (*a4)(void *)@<X5>, uint64_t a5@<X8>)
{
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v10 = a1[3];
  uint64_t v12 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BCA208E4(a3, v9, v8, v11, v10, a4, (uint64_t)&v15);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  char v13 = v16;
  double result = *(double *)&v15;
  *(_OWORD *)a5 = v15;
  *(unsigned char *)(a5 + 16) = v13;
  return result;
}

uint64_t ShieldSettings.untokenizedApplicationCategories.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  if (qword_1E9FABCE0 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAE060, (uint64_t)v13, &qword_1E9FAE240);
  uint64_t v6 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v9 = qword_1E9FABA80;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    swift_retain();
    if (v4 == 255) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = (void *)sub_1BC9F61FC(v2, v3, v4);
    }
    v12[0] = v6;
    v12[1] = v5;
    v12[2] = v8;
    v12[3] = v7;
    sub_1BC9A4CA8(v10, v14, v15, v12, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1BC9A3A70((uint64_t)v13, &qword_1E9FAE240);
  return sub_1BCA23ACC(v2, v3, v4);
}

uint64_t (*ShieldSettings.untokenizedApplicationCategories.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABCE0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BCA208E4((uint64_t)&qword_1E9FAE060, v3, v4, v6, v5, sub_1BC9C0EFC, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1BCA237A8;
}

uint64_t sub_1BCA237A8(uint64_t *a1, char a2)
{
  return sub_1BCA237E8(a1, a2, (void (*)(uint64_t *))ShieldSettings.untokenizedApplicationCategories.setter, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BCA270D4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1BCA270D0);
}

uint64_t sub_1BCA237E8(uint64_t *a1, char a2, void (*a3)(uint64_t *), void (*a4)(uint64_t, uint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  if (a2)
  {
    uint64_t v11 = *a1;
    uint64_t v12 = v6;
    char v13 = v8;
    a4(v7, v6, v8);
    a3(&v11);
    return a5(v7, v6, v8);
  }
  else
  {
    uint64_t v11 = *a1;
    uint64_t v12 = v6;
    char v13 = v8;
    return ((uint64_t (*)(uint64_t *))a3)(&v11);
  }
}

uint64_t ShieldSettings.effectiveApplicationCategories.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9FABCE0 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAE060, (uint64_t)v10, &qword_1E9FAE240);
  if (qword_1E9FABAC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (!qword_1E9FAC238) {
    goto LABEL_9;
  }
  uint64_t v2 = v11;
  uint64_t v3 = v12;
  swift_retain();
  uint64_t v4 = sub_1BC9AEFD0(v2, v3);
  swift_release();
  if (!v4) {
    goto LABEL_9;
  }
  id v5 = v4;
  sub_1BCA204D0(v4, sub_1BC9C0EFC, (uint64_t)&v8);

  char v6 = v9;
  if (v9 != 255)
  {
    *(_OWORD *)a1 = v8;
  }
  else
  {
LABEL_9:
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    char v6 = 2;
  }
  *(unsigned char *)(a1 + 16) = v6;
  return sub_1BC9A3A70((uint64_t)v10, &qword_1E9FAE240);
}

uint64_t sub_1BCA23A04()
{
  qword_1E9FAE060 = 0;
  *(void *)algn_1E9FAE068 = 0;
  byte_1E9FAE070 = 2;
  qword_1E9FAE078 = 0xD00000000000001CLL;
  unk_1E9FAE080 = 0x80000001BCA4F610;
  qword_1E9FAE0A0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FACDD0);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAE2A0, &qword_1E9FACDD0);
  qword_1E9FAE0A8 = result;
  word_1E9FAE0B0 = 257;
  byte_1E9FAE0B2 = 0;
  qword_1E9FAE0B8 = 0;
  byte_1E9FAE0C0 = 1;
  return result;
}

uint64_t sub_1BCA23AA4(uint64_t result, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_1BC9E1560(result, a2, a3);
  }
  return result;
}

uint64_t sub_1BCA23ACC(uint64_t result, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_1BC9E15BC(result, a2, a3);
  }
  return result;
}

uint64_t static ShieldSettings.applicationCategories.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA129AC(&qword_1E9FABCE0, (uint64_t)&qword_1E9FAE060, &qword_1E9FAE240, a1);
}

uint64_t ShieldSettings.unshieldableApplications.getter()
{
  return sub_1BCA242F8(&qword_1E9FABCE8, (uint64_t)&qword_1E9FAE0C8, sub_1BC99D12C);
}

uint64_t ShieldSettings.unshieldableApplications.setter(uint64_t a1)
{
  sub_1BCA26638(a1);

  return swift_bridgeObjectRelease();
}

void (*ShieldSettings.unshieldableApplications.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x98uLL);
  *a1 = v3;
  uint64_t v4 = v3 + 17;
  v3[18] = v1;
  uint64_t v6 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v7 = v1[3];
  if (qword_1E9FABCE8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1BC99D12C((uint64_t)&qword_1E9FAE0C8, v6, v5, v8, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t *v4 = v9;
  return sub_1BCA23C74;
}

void sub_1BCA23C74(uint64_t *a1, char a2)
{
}

uint64_t ShieldSettings.effectiveUnshieldableApplications.getter()
{
  return sub_1BCA24CB8(&qword_1E9FABCE8, (uint64_t)&qword_1E9FAE0C8, sub_1BC99ECD0);
}

uint64_t sub_1BCA23CD4()
{
  qword_1E9FAE0C8 = MEMORY[0x1E4FBC870];
  qword_1E9FAE0D0 = 0xD00000000000001FLL;
  qword_1E9FAE0D8 = 0x80000001BCA4F630;
  qword_1E9FAE0F8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAC1B8);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAC1C0, &qword_1E9FAC1B8);
  qword_1E9FAE100 = result;
  byte_1E9FAE0E0 = 1;
  word_1E9FAE108 = 0;
  byte_1E9FAE10A = 0;
  qword_1E9FAE110 = 0x7FFFFFFFFFFFFFFFLL;
  byte_1E9FAE118 = 0;
  return result;
}

uint64_t static ShieldSettings.unshieldableApplications.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA129AC(&qword_1E9FABCE8, (uint64_t)&qword_1E9FAE0C8, &qword_1EBA01C48, a1);
}

uint64_t ShieldSettings.unshieldableWebDomains.getter()
{
  return sub_1BCA242F8(&qword_1E9FABCF0, (uint64_t)&qword_1E9FAE120, sub_1BC99DA50);
}

uint64_t ShieldSettings.unshieldableWebDomains.setter(uint64_t a1)
{
  sub_1BCA267C8(a1);

  return swift_bridgeObjectRelease();
}

void (*ShieldSettings.unshieldableWebDomains.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x98uLL);
  *a1 = v3;
  uint64_t v4 = v3 + 17;
  v3[18] = v1;
  uint64_t v6 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v7 = v1[3];
  if (qword_1E9FABCF0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1BC99DA50((uint64_t)&qword_1E9FAE120, v6, v5, v8, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t *v4 = v9;
  return sub_1BCA23EF8;
}

void sub_1BCA23EF8(uint64_t *a1, char a2)
{
}

void sub_1BCA23F20(uint64_t *a1, char a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v8 = *a1;
  uint64_t v9 = *(void *)(*a1 + 136);
  uint64_t v10 = *(uint64_t **)(*a1 + 144);
  sub_1BC9AA050(a3, *a1, a4);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  uint64_t v14 = v10[2];
  uint64_t v13 = v10[3];
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = (void *)a5(v9);
    }
    else
    {
      uint64_t v15 = 0;
    }
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v17 = v14;
      uint64_t v18 = *(void *)(v8 + 8);
      uint64_t v19 = *(void *)(v8 + 16);
      uint64_t v25 = v12;
      uint64_t v26 = v11;
      uint64_t v27 = v17;
      uint64_t v28 = v13;
      int v20 = *(unsigned __int8 *)(v8 + 66);
      swift_retain();
      sub_1BC9A4CA8(v15, v18, v19, &v25, v20);
      swift_release();
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_1BC9A3A70(v8, a4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9)
    {
      swift_bridgeObjectRetain();
      unsigned __int8 v16 = (void *)a5(v9);
      swift_bridgeObjectRelease();
    }
    else
    {
      unsigned __int8 v16 = 0;
    }
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v21 = v14;
      uint64_t v22 = *(void *)(v8 + 8);
      uint64_t v23 = *(void *)(v8 + 16);
      uint64_t v25 = v12;
      uint64_t v26 = v11;
      uint64_t v27 = v21;
      uint64_t v28 = v13;
      int v24 = *(unsigned __int8 *)(v8 + 66);
      swift_retain();
      sub_1BC9A4CA8(v16, v22, v23, &v25, v24);
      swift_release();
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_1BC9A3A70(v8, a4);
  }
  swift_bridgeObjectRelease();

  free((void *)v8);
}

uint64_t ShieldSettings.effectiveUnshieldableWebDomains.getter()
{
  return sub_1BCA24CB8(&qword_1E9FABCF0, (uint64_t)&qword_1E9FAE120, sub_1BC99F014);
}

uint64_t sub_1BCA241F0()
{
  qword_1E9FAE120 = MEMORY[0x1E4FBC870];
  qword_1E9FAE128 = 0xD00000000000001DLL;
  qword_1E9FAE130 = 0x80000001BCA4F650;
  qword_1E9FAE150 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FACDD8);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAE298, &qword_1E9FACDD8);
  qword_1E9FAE158 = result;
  byte_1E9FAE138 = 1;
  word_1E9FAE160 = 0;
  byte_1E9FAE162 = 0;
  qword_1E9FAE168 = 0x7FFFFFFFFFFFFFFFLL;
  byte_1E9FAE170 = 0;
  return result;
}

uint64_t static ShieldSettings.unshieldableWebDomains.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA129AC(&qword_1E9FABCF0, (uint64_t)&qword_1E9FAE120, &qword_1E9FAE248, a1);
}

uint64_t ShieldSettings.webDomains.getter()
{
  return sub_1BCA242F8(&qword_1E9FABCF8, (uint64_t)&qword_1E9FAE178, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BCA21200);
}

uint64_t sub_1BCA242F8(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *v3;
  uint64_t v6 = v3[1];
  uint64_t v9 = v3[2];
  uint64_t v8 = v3[3];
  if (*a1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = a3(a2, v7, v6, v9, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1BCA24390@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X3>, uint64_t a3@<X4>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v10 = a1[3];
  uint64_t v12 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = a4(a3, v9, v8, v11, v10);
  swift_bridgeObjectRelease_n();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a5 = v13;
  return result;
}

uint64_t sub_1BCA24460(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = *a1;
  uint64_t v11 = *a5;
  swift_bridgeObjectRetain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v12 = *a2;
  uint64_t v13 = a2[1];
  uint64_t v15 = a2[2];
  uint64_t v14 = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  a7(v10, a6, v12, v13, v15, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t ShieldSettings.webDomains.setter(uint64_t a1)
{
  return sub_1BCA24564(a1, &qword_1E9FABCF8, (uint64_t)&qword_1E9FAE178, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BCA21A34);
}

uint64_t sub_1BCA24564(uint64_t a1, void *a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v8 = *v4;
  uint64_t v9 = v4[1];
  uint64_t v11 = v4[2];
  uint64_t v10 = v4[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  a4(a1, a3, v8, v9, v11, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t (*ShieldSettings.webDomains.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  unint64_t v6 = *(void *)(v1 + 16);
  uint64_t v5 = *(uint64_t **)(v1 + 24);
  if (qword_1E9FABCF8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1BCA21200((uint64_t)&qword_1E9FAE178, v3, v4, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a1 = v7;
  return sub_1BCA246E8;
}

uint64_t sub_1BCA246E8(uint64_t *a1, char a2)
{
  return sub_1BCA24708(a1, a2, (uint64_t)&qword_1E9FAE178, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BCA21A34);
}

uint64_t sub_1BCA24708(uint64_t *a1, char a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  unint64_t v6 = (uint64_t *)a1[1];
  uint64_t v9 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v11 = v6[2];
  uint64_t v10 = v6[3];
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a4(v7, a3, v9, v8, v11, v10);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a4(v7, a3, v9, v8, v11, v10);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t ShieldSettings.untokenizedWebDomains.getter()
{
  return sub_1BCA24830(&qword_1E9FABCF8, (uint64_t)&qword_1E9FAE178, (uint64_t (*)(void))sub_1BC9C145C);
}

uint64_t sub_1BCA24830(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v7 = *v3;
  uint64_t v6 = v3[1];
  uint64_t v9 = v3[2];
  uint64_t v8 = v3[3];
  if (*a1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_1BCA21CF0(a2, v7, v6, v9, v8, a3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1BCA248C8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X3>, uint64_t a3@<X4>, uint64_t (*a4)(void)@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v10 = a1[3];
  uint64_t v12 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_1BCA21CF0(a3, v9, v8, v11, v10, a4);
  swift_bridgeObjectRelease_n();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a5 = v13;
  return result;
}

uint64_t ShieldSettings.untokenizedWebDomains.setter(uint64_t a1)
{
  if (qword_1E9FABCF8 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAE178, (uint64_t)v11, &qword_1E9FAE250);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = qword_1E9FABA80;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    swift_retain();
    if (a1) {
      uint64_t v8 = (void *)sub_1BC9AC3AC(a1);
    }
    else {
      uint64_t v8 = 0;
    }
    v10[0] = v4;
    v10[1] = v3;
    v10[2] = v6;
    v10[3] = v5;
    sub_1BC9A4CA8(v8, v12, v13, v10, v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return sub_1BC9A3A70((uint64_t)v11, &qword_1E9FAE250);
}

uint64_t (*ShieldSettings.untokenizedWebDomains.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = (uint64_t)v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABCF8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_1BCA21CF0((uint64_t)&qword_1E9FAE178, v3, v4, v6, v5, (uint64_t (*)(void))sub_1BC9C145C);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a1 = v7;
  return sub_1BCA24BF8;
}

uint64_t sub_1BCA24BF8(uint64_t *a1, char a2)
{
  return sub_1BCA24C10(a1, a2, ShieldSettings.untokenizedWebDomains.setter);
}

uint64_t sub_1BCA24C10(uint64_t *a1, char a2, uint64_t (*a3)(uint64_t))
{
  if ((a2 & 1) == 0) {
    return a3(*a1);
  }
  uint64_t v4 = swift_bridgeObjectRetain();
  a3(v4);

  return swift_bridgeObjectRelease();
}

uint64_t ShieldSettings.effectiveWebDomains.getter()
{
  return sub_1BCA24CB8(&qword_1E9FABCF8, (uint64_t)&qword_1E9FAE178, (uint64_t (*)(void))sub_1BCA22350);
}

uint64_t sub_1BCA24CB8(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (*a1 != -1)
  {
    uint64_t v5 = a3;
    swift_once();
    a3 = v5;
  }

  return a3(a2);
}

uint64_t sub_1BCA24D18()
{
  qword_1E9FAE178 = MEMORY[0x1E4FBC870];
  qword_1E9FAE180 = 0xD000000000000011;
  qword_1E9FAE188 = 0x80000001BCA4F670;
  qword_1E9FAE1A8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FACDD8);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAE298, &qword_1E9FACDD8);
  qword_1E9FAE1B0 = result;
  byte_1E9FAE190 = 1;
  word_1E9FAE1B8 = 257;
  byte_1E9FAE1BA = 0;
  qword_1E9FAE1C0 = 50;
  byte_1E9FAE1C8 = 0;
  return result;
}

uint64_t static ShieldSettings.webDomains.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA129AC(&qword_1E9FABCF8, (uint64_t)&qword_1E9FAE178, &qword_1E9FAE250, a1);
}

uint64_t ShieldSettings.webDomainCategories.getter()
{
  return sub_1BCA24E24(&qword_1E9FABD00, (uint64_t)&qword_1E9FAE1D0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BC99DA78);
}

uint64_t sub_1BCA24E24(void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *v3;
  uint64_t v7 = v3[1];
  uint64_t v9 = v3[2];
  uint64_t v8 = v3[3];
  if (*a1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  a3(a2, v6, v7, v9, v8);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

double sub_1BCA24ED0@<D0>(uint64_t *a1@<X0>, uint64_t *a2@<X3>, uint64_t a3@<X4>, void (*a4)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X5>, uint64_t a5@<X8>)
{
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v10 = a1[3];
  uint64_t v12 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  a4(&v15, a3, v9, v8, v11, v10);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  char v13 = v16;
  double result = *(double *)&v15;
  *(_OWORD *)a5 = v15;
  *(unsigned char *)(a5 + 16) = v13;
  return result;
}

uint64_t ShieldSettings.webDomainCategories.setter(uint64_t a1)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  if (*(unsigned __int8 *)(a1 + 16) > 1u)
  {
    if (*(unsigned char *)(a1 + 16) == 2)
    {
      if (qword_1E9FABD00 != -1) {
        swift_once();
      }
      sub_1BC9AA050((uint64_t)&qword_1E9FAE1D0, (uint64_t)v42, &qword_1E9FAE258);
      uint64_t v14 = *v1;
      uint64_t v13 = v1[1];
      uint64_t v16 = v1[2];
      uint64_t v15 = v1[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v17 = (void *)sub_1BCA202B8(v3, v2, 2);
      if (qword_1E9FABA80 != -1) {
        swift_once();
      }
      swift_beginAccess();
      if (!off_1E9FABF10)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return sub_1BC9A3A70((uint64_t)v42, &qword_1E9FAE258);
      }
      uint64_t v18 = v43;
      uint64_t v19 = v44;
      uint64_t v38 = v14;
      uint64_t v39 = v13;
      uint64_t v40 = v16;
      uint64_t v41 = v15;
      int v20 = v45;
      swift_retain();
      sub_1BC9A4CA8(v17, v18, v19, &v38, v20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_1E9FABD00 != -1) {
        swift_once();
      }
      sub_1BC9AA050((uint64_t)&qword_1E9FAE1D0, (uint64_t)v42, &qword_1E9FAE258);
      uint64_t v30 = *v1;
      uint64_t v29 = v1[1];
      uint64_t v32 = v1[2];
      uint64_t v31 = v1[3];
      uint64_t v33 = qword_1E9FABA80;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v33 != -1) {
        swift_once();
      }
      swift_beginAccess();
      if (!off_1E9FABF10)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return sub_1BC9A3A70((uint64_t)v42, &qword_1E9FAE258);
      }
      uint64_t v34 = v43;
      uint64_t v35 = v44;
      uint64_t v38 = v30;
      uint64_t v39 = v29;
      uint64_t v40 = v32;
      uint64_t v41 = v31;
      int v36 = v45;
      swift_retain();
      sub_1BC9A4CA8(0, v34, v35, &v38, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_release();
    return sub_1BC9A3A70((uint64_t)v42, &qword_1E9FAE258);
  }
  if (*(unsigned char *)(a1 + 16))
  {
    sub_1BC9E1560(*(void *)a1, v2, 1);
    if (qword_1E9FABD00 != -1) {
      swift_once();
    }
    sub_1BC9AA050((uint64_t)&qword_1E9FAE1D0, (uint64_t)v42, &qword_1E9FAE258);
    uint64_t v22 = *v1;
    uint64_t v21 = v1[1];
    uint64_t v24 = v1[2];
    uint64_t v23 = v1[3];
    sub_1BCA23AA4(v3, v2, 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v25 = (void *)sub_1BCA202B8(v3, v2, 1);
    sub_1BCA23ACC(v3, v2, 1);
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v26 = v43;
      uint64_t v27 = v44;
      uint64_t v38 = v22;
      uint64_t v39 = v21;
      uint64_t v40 = v24;
      uint64_t v41 = v23;
      int v28 = v45;
      swift_retain();
      sub_1BC9A4CA8(v25, v26, v27, &v38, v28);

      swift_release();
    }
    else
    {
    }
    sub_1BCA23ACC(v3, v2, 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BC9A3A70((uint64_t)v42, &qword_1E9FAE258);
    return sub_1BCA23ACC(v3, v2, 1);
  }
  else
  {
    uint64_t v4 = qword_1E9FABD00;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v4 != -1) {
      swift_once();
    }
    sub_1BC9AA050((uint64_t)&qword_1E9FAE1D0, (uint64_t)v42, &qword_1E9FAE258);
    uint64_t v6 = *v1;
    uint64_t v5 = v1[1];
    uint64_t v8 = v1[2];
    uint64_t v7 = v1[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BCA23AA4(v3, v2, 0);
    uint64_t v9 = (void *)sub_1BCA202B8(v3, v2, 0);
    sub_1BCA23ACC(v3, v2, 0);
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v10 = v43;
      uint64_t v11 = v44;
      uint64_t v38 = v6;
      uint64_t v39 = v5;
      uint64_t v40 = v8;
      uint64_t v41 = v7;
      int v12 = v45;
      swift_retain();
      sub_1BC9A4CA8(v9, v10, v11, &v38, v12);

      swift_release();
    }
    else
    {
    }
    sub_1BCA23ACC(v3, v2, 0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BC9A3A70((uint64_t)v42, &qword_1E9FAE258);
    return sub_1BCA23ACC(v3, v2, 0);
  }
}

uint64_t (*ShieldSettings.webDomainCategories.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD00 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DA78((uint64_t)&qword_1E9FAE1D0, v3, v4, v6, v5, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1BCA25624;
}

uint64_t sub_1BCA25624(uint64_t *a1, char a2)
{
  return sub_1BCA237E8(a1, a2, (void (*)(uint64_t *))ShieldSettings.webDomainCategories.setter, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BCA270D4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1BCA270D0);
}

uint64_t ShieldSettings.untokenizedWebDomainCategories.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA233A4(&qword_1E9FABD00, (uint64_t)&qword_1E9FAE1D0, sub_1BC9C145C, a1);
}

uint64_t ShieldSettings.untokenizedWebDomainCategories.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  if (qword_1E9FABD00 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAE1D0, (uint64_t)v13, &qword_1E9FAE258);
  uint64_t v6 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v9 = qword_1E9FABA80;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    swift_retain();
    if (v4 == 255) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = (void *)sub_1BC9F6214(v2, v3, v4);
    }
    v12[0] = v6;
    v12[1] = v5;
    v12[2] = v8;
    v12[3] = v7;
    sub_1BC9A4CA8(v10, v14, v15, v12, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1BC9A3A70((uint64_t)v13, &qword_1E9FAE258);
  return sub_1BCA23ACC(v2, v3, v4);
}

uint64_t (*ShieldSettings.untokenizedWebDomainCategories.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD00 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BCA208E4((uint64_t)&qword_1E9FAE1D0, v3, v4, v6, v5, sub_1BC9C145C, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1BCA25910;
}

uint64_t sub_1BCA25910(uint64_t *a1, char a2)
{
  return sub_1BCA237E8(a1, a2, (void (*)(uint64_t *))ShieldSettings.untokenizedWebDomainCategories.setter, (void (*)(uint64_t, uint64_t, uint64_t))sub_1BCA270D4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1BCA270D0);
}

uint64_t ShieldSettings.effectiveWebDomainCategories.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9FABD00 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAE1D0, (uint64_t)v10, &qword_1E9FAE258);
  if (qword_1E9FABAC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (!qword_1E9FAC238) {
    goto LABEL_9;
  }
  uint64_t v2 = v11;
  uint64_t v3 = v12;
  swift_retain();
  uint64_t v4 = sub_1BC9AEFD0(v2, v3);
  swift_release();
  if (!v4) {
    goto LABEL_9;
  }
  id v5 = v4;
  sub_1BCA204D0(v4, sub_1BC9C145C, (uint64_t)&v8);

  char v6 = v9;
  if (v9 != 255)
  {
    *(_OWORD *)a1 = v8;
  }
  else
  {
LABEL_9:
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    char v6 = 2;
  }
  *(unsigned char *)(a1 + 16) = v6;
  return sub_1BC9A3A70((uint64_t)v10, &qword_1E9FAE258);
}

uint64_t sub_1BCA25AA8()
{
  qword_1E9FAE1D0 = 0;
  *(void *)algn_1E9FAE1D8 = 0;
  byte_1E9FAE1E0 = 2;
  qword_1E9FAE1E8 = 0xD00000000000001ALL;
  unk_1E9FAE1F0 = 0x80000001BCA4F690;
  qword_1E9FAE210 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FACDC8);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAE290, &qword_1E9FACDC8);
  qword_1E9FAE218 = result;
  word_1E9FAE220 = 257;
  byte_1E9FAE222 = 0;
  qword_1E9FAE228 = 0;
  byte_1E9FAE230 = 1;
  return result;
}

uint64_t static ShieldSettings.webDomainCategories.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA129AC(&qword_1E9FABD00, (uint64_t)&qword_1E9FAE1D0, &qword_1E9FAE258, a1);
}

uint64_t ShieldSettings.customMirror.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v53 = a1;
  uint64_t v2 = sub_1BCA48DA8();
  uint64_t v51 = *(void *)(v2 - 8);
  uint64_t v52 = v2;
  MEMORY[0x1F4188790](v2, v3);
  int v50 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA8);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v49 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v9 = v1[1];
  uint64_t v11 = v1[2];
  uint64_t v10 = v1[3];
  uint64_t v60 = *v1;
  uint64_t v61 = v9;
  uint64_t v62 = v11;
  uint64_t v63 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BCA49C30;
  uint64_t v13 = qword_1E9FABCD8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_1E9FAE018;
  *(void *)(v12 + 32) = qword_1E9FAE010;
  *(void *)(v12 + 40) = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1BCA21CF0((uint64_t)&qword_1E9FAE008, v8, v9, v11, v10, (uint64_t (*)(void))sub_1BC9C0EFC);
  uint64_t v16 = sub_1BCA2208C(&qword_1E9FAE008);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAC188);
  *(void *)(v12 + 72) = v48;
  *(void *)(v12 + 48) = v15;
  *(void *)(v12 + 56) = v16;
  if (qword_1E9FABCE0 != -1) {
    swift_once();
  }
  uint64_t v17 = unk_1E9FAE080;
  *(void *)(v12 + 80) = qword_1E9FAE078;
  *(void *)(v12 + 88) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BCA208E4((uint64_t)&qword_1E9FAE060, v8, v9, v11, v10, sub_1BC9C0EFC, (uint64_t)&v57);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = v57;
  uint64_t v19 = v58;
  uint64_t v47 = v8;
  char v20 = v59;
  ShieldSettings.effectiveApplicationCategories.getter((uint64_t)&v54);
  uint64_t v21 = v54;
  uint64_t v22 = v55;
  char v23 = v56;
  *(void *)(v12 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE260);
  uint64_t v24 = swift_allocObject();
  *(void *)(v12 + 96) = v24;
  *(void *)(v24 + 16) = v18;
  *(void *)(v24 + 24) = v19;
  *(unsigned char *)(v24 + 32) = v20;
  *(void *)(v24 + 40) = v21;
  *(void *)(v24 + 48) = v22;
  *(unsigned char *)(v24 + 56) = v23;
  if (qword_1E9FABCE8 != -1) {
    swift_once();
  }
  uint64_t v25 = qword_1E9FAE0D8;
  *(void *)(v12 + 128) = qword_1E9FAE0D0;
  *(void *)(v12 + 136) = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v26 = v47;
  uint64_t v27 = sub_1BC99D12C((uint64_t)&qword_1E9FAE0C8, v47, v9, v11, v10);
  uint64_t v28 = sub_1BC99ECD0((uint64_t)&qword_1E9FAE0C8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v12 + 168) = v48;
  *(void *)(v12 + 144) = v27;
  *(void *)(v12 + 152) = v28;
  if (qword_1E9FABCF0 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_1E9FAE130;
  *(void *)(v12 + 176) = qword_1E9FAE128;
  *(void *)(v12 + 184) = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_1BC99DA50((uint64_t)&qword_1E9FAE120, v26, v9, v11, v10);
  uint64_t v31 = sub_1BC99F014((uint64_t)&qword_1E9FAE120);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE268);
  *(void *)(v12 + 216) = v32;
  *(void *)(v12 + 192) = v30;
  *(void *)(v12 + 200) = v31;
  if (qword_1E9FABCF8 != -1) {
    swift_once();
  }
  uint64_t v33 = qword_1E9FAE188;
  *(void *)(v12 + 224) = qword_1E9FAE180;
  *(void *)(v12 + 232) = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v34 = sub_1BCA21CF0((uint64_t)&qword_1E9FAE178, v26, v9, v11, v10, (uint64_t (*)(void))sub_1BC9C145C);
  uint64_t v35 = sub_1BCA22350(&qword_1E9FAE178);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v12 + 264) = v32;
  *(void *)(v12 + 240) = v34;
  *(void *)(v12 + 248) = v35;
  if (qword_1E9FABD00 != -1) {
    swift_once();
  }
  uint64_t v36 = unk_1E9FAE1F0;
  *(void *)(v12 + 272) = qword_1E9FAE1E8;
  *(void *)(v12 + 280) = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BCA208E4((uint64_t)&qword_1E9FAE1D0, v26, v9, v11, v10, sub_1BC9C145C, (uint64_t)&v57);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v37 = v57;
  uint64_t v38 = v58;
  char v39 = v59;
  ShieldSettings.effectiveWebDomainCategories.getter((uint64_t)&v54);
  uint64_t v40 = v54;
  uint64_t v41 = v55;
  char v42 = v56;
  *(void *)(v12 + 312) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE270);
  uint64_t v43 = swift_allocObject();
  *(void *)(v12 + 288) = v43;
  *(void *)(v43 + 16) = v37;
  *(void *)(v43 + 24) = v38;
  *(unsigned char *)(v43 + 32) = v39;
  *(void *)(v43 + 40) = v40;
  *(void *)(v43 + 48) = v41;
  *(unsigned char *)(v43 + 56) = v42;
  uint64_t v44 = sub_1BCA48D98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v49, 1, 1, v44);
  (*(void (**)(char *, void, uint64_t))(v51 + 104))(v50, *MEMORY[0x1E4FBC430], v52);
  return sub_1BCA48DB8();
}

uint64_t sub_1BCA261DC(uint64_t a1, void (*a2)(unsigned char *, void *), void (*a3)(uint64_t, uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v29 = MEMORY[0x1E4FBC870];
  uint64_t v23 = a1 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 56);
  int64_t v24 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v10);
      if (!v19)
      {
        int64_t v10 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v10);
        if (!v19)
        {
          int64_t v10 = v18 + 3;
          if (v18 + 3 >= v24) {
            goto LABEL_25;
          }
          unint64_t v19 = *(void *)(v23 + 8 * v10);
          if (!v19)
          {
            int64_t v10 = v18 + 4;
            if (v18 + 4 >= v24) {
              goto LABEL_25;
            }
            unint64_t v19 = *(void *)(v23 + 8 * v10);
            if (!v19) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v8 = (v19 - 1) & v19;
    unint64_t v12 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_5:
    uint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v14 = *v13;
    unint64_t v15 = v13[1];
    v30[0] = 0;
    v30[1] = 0;
    v30[2] = v14;
    v30[3] = v15;
    v30[4] = 0;
    v30[5] = 0;
    sub_1BC9A396C(v14, v15);
    sub_1BC9A396C(v14, v15);
    a2(v26, v30);
    uint64_t v16 = v27;
    uint64_t v17 = v28;
    swift_bridgeObjectRelease();
    a3(v16, v17);
    swift_bridgeObjectRelease();
    uint64_t result = sub_1BC9A3ACC(v14, v15);
  }
  int64_t v20 = v18 + 5;
  if (v20 >= v24)
  {
LABEL_25:
    swift_release();
    uint64_t v21 = a4(v29);
    swift_bridgeObjectRelease();
    return v21;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1BCA26444(uint64_t a1)
{
  uint64_t v21 = MEMORY[0x1E4FBC870];
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
    int64_t v16 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v16 >= v6) {
      goto LABEL_25;
    }
    unint64_t v17 = *(void *)(v2 + 8 * v16);
    ++v8;
    if (!v17)
    {
      int64_t v8 = v16 + 1;
      if (v16 + 1 >= v6) {
        goto LABEL_25;
      }
      unint64_t v17 = *(void *)(v2 + 8 * v8);
      if (!v17)
      {
        int64_t v8 = v16 + 2;
        if (v16 + 2 >= v6) {
          goto LABEL_25;
        }
        unint64_t v17 = *(void *)(v2 + 8 * v8);
        if (!v17)
        {
          int64_t v8 = v16 + 3;
          if (v16 + 3 >= v6) {
            goto LABEL_25;
          }
          unint64_t v17 = *(void *)(v2 + 8 * v8);
          if (!v17)
          {
            int64_t v8 = v16 + 4;
            if (v16 + 4 >= v6) {
              goto LABEL_25;
            }
            unint64_t v17 = *(void *)(v2 + 8 * v8);
            if (!v17) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v17 - 1) & v17;
    unint64_t v10 = __clz(__rbit64(v17)) + (v8 << 6);
LABEL_5:
    unint64_t v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    unint64_t v13 = v11[1];
    sub_1BC9A396C(*v11, v13);
    sub_1BC9A396C(v12, v13);
    sub_1BC9CAE7C(v20, 0, 0, v12, v13);
    uint64_t v14 = v20[2];
    unint64_t v15 = v20[3];
    swift_bridgeObjectRelease();
    sub_1BC9A3B38(v14, v15);
    uint64_t result = sub_1BC9A3ACC(v12, v13);
  }
  int64_t v18 = v16 + 5;
  if (v18 >= v6)
  {
LABEL_25:
    swift_release();
    uint64_t v19 = sub_1BC9AC3AC(v21);
    swift_bridgeObjectRelease();
    return v19;
  }
  unint64_t v17 = *(void *)(v2 + 8 * v18);
  if (v17)
  {
    int64_t v8 = v18;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v8 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_25;
    }
    unint64_t v17 = *(void *)(v2 + 8 * v8);
    ++v18;
    if (v17) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1BCA26638(uint64_t a1)
{
  if (qword_1E9FABCE8 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAE0C8, (uint64_t)v13, &qword_1EBA01C48);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (a1)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_1BC9AC368(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v8 = v14;
    uint64_t v9 = v15;
    v12[0] = v4;
    v12[1] = v3;
    v12[2] = v6;
    v12[3] = v5;
    int v10 = v16;
    swift_retain();
    sub_1BC9A4CA8(v7, v8, v9, v12, v10);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BC9A3A70((uint64_t)v13, &qword_1EBA01C48);
}

uint64_t sub_1BCA267C8(uint64_t a1)
{
  if (qword_1E9FABCF0 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAE120, (uint64_t)v13, &qword_1E9FAE248);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (a1)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_1BC9AC3AC(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v8 = v14;
    uint64_t v9 = v15;
    v12[0] = v4;
    v12[1] = v3;
    v12[2] = v6;
    v12[3] = v5;
    int v10 = v16;
    swift_retain();
    sub_1BC9A4CA8(v7, v8, v9, v12, v10);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BC9A3A70((uint64_t)v13, &qword_1E9FAE248);
}

uint64_t objectdestroyTm_1()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  if (v1 != 255) {
    sub_1BC9E15BC(*(void *)(v0 + 16), *(void *)(v0 + 24), v1);
  }
  int v2 = *(unsigned __int8 *)(v0 + 56);
  if (v2 != 255) {
    sub_1BC9E15BC(*(void *)(v0 + 40), *(void *)(v0 + 48), v2);
  }

  return MEMORY[0x1F4186498](v0, 57, 7);
}

unint64_t sub_1BCA269BC()
{
  unint64_t result = qword_1E9FAE278;
  if (!qword_1E9FAE278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE278);
  }
  return result;
}

uint64_t sub_1BCA26A10()
{
  return sub_1BC9ADEBC(&qword_1E9FAE280, &qword_1E9FAE288);
}

uint64_t sub_1BCA26A4C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BCA24390(a1, &qword_1E9FABCD8, (uint64_t)&qword_1E9FAE008, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BCA20C7C, a2);
}

uint64_t sub_1BCA26A98(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1BCA24460(a1, a2, a3, a4, &qword_1E9FABCD8, (uint64_t)&qword_1E9FAE008, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BCA21744);
}

uint64_t sub_1BCA26AE4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BCA248C8(a1, &qword_1E9FABCD8, (uint64_t)&qword_1E9FAE008, (uint64_t (*)(void))sub_1BC9C0EFC, a2);
}

uint64_t sub_1BCA26B30()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return ShieldSettings.untokenizedApplications.setter(v0);
}

double sub_1BCA26B5C@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BCA24ED0(a1, &qword_1E9FABCE0, (uint64_t)&qword_1E9FAE060, (void (*)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BC99DA28, a2);
}

uint64_t sub_1BCA26BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, (void (*)(void))sub_1BCA23AA4, (uint64_t (*)(void *))ShieldSettings.applicationCategories.setter);
}

double sub_1BCA26BD4@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BCA23450(a1, &qword_1E9FABCE0, (uint64_t)&qword_1E9FAE060, sub_1BC9C0EFC, a2);
}

uint64_t sub_1BCA26C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, (void (*)(void))sub_1BCA270D4, (uint64_t (*)(void *))ShieldSettings.untokenizedApplicationCategories.setter);
}

uint64_t sub_1BCA26C4C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BCA24390(a1, &qword_1E9FABCE8, (uint64_t)&qword_1E9FAE0C8, sub_1BC99D12C, a2);
}

uint64_t sub_1BCA26C98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, (void (*)(uint64_t))sub_1BCA26638);
}

uint64_t sub_1BCA26CB0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BCA24390(a1, &qword_1E9FABCF0, (uint64_t)&qword_1E9FAE120, sub_1BC99DA50, a2);
}

uint64_t sub_1BCA26CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_14Tm(a1, a2, a3, a4, (void (*)(uint64_t))sub_1BCA267C8);
}

uint64_t keypath_set_14Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v6 = swift_bridgeObjectRetain();
  a5(v6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA26D68@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BCA24390(a1, &qword_1E9FABCF8, (uint64_t)&qword_1E9FAE178, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BCA21200, a2);
}

uint64_t sub_1BCA26DB4(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1BCA24460(a1, a2, a3, a4, &qword_1E9FABCF8, (uint64_t)&qword_1E9FAE178, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BCA21A34);
}

uint64_t sub_1BCA26E00@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BCA248C8(a1, &qword_1E9FABCF8, (uint64_t)&qword_1E9FAE178, (uint64_t (*)(void))sub_1BC9C145C, a2);
}

uint64_t sub_1BCA26E4C()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return ShieldSettings.untokenizedWebDomains.setter(v0);
}

double sub_1BCA26E78@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BCA24ED0(a1, &qword_1E9FABD00, (uint64_t)&qword_1E9FAE1D0, (void (*)(long long *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1BC99DA78, a2);
}

uint64_t sub_1BCA26EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, (void (*)(void))sub_1BCA270D4, (uint64_t (*)(void *))ShieldSettings.webDomainCategories.setter);
}

double sub_1BCA26EF0@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BCA23450(a1, &qword_1E9FABD00, (uint64_t)&qword_1E9FAE1D0, sub_1BC9C145C, a2);
}

uint64_t sub_1BCA26F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, (void (*)(void))sub_1BCA270D4, (uint64_t (*)(void *))ShieldSettings.untokenizedWebDomainCategories.setter);
}

uint64_t keypath_set_10Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(void *))
{
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  v10[0] = *(void *)a1;
  v10[1] = v7;
  char v11 = v8;
  a5(v10[0]);
  return a6(v10);
}

ValueMetadata *type metadata accessor for ShieldSettings()
{
  return &type metadata for ShieldSettings;
}

unsigned char *storeEnumTagSinglePayload for ShieldSettings.Name(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x1BCA27098);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShieldSettings.Name()
{
  return &type metadata for ShieldSettings.Name;
}

uint64_t UserSafetySettings.ScannableService.rawValue.getter()
{
  uint64_t result = 0x706F7244726961;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x73746361746E6F63;
      break;
    case 2:
      uint64_t result = 0x736567617373656DLL;
      break;
    case 3:
      uint64_t result = 0x736F746F6870;
      break;
    case 4:
      uint64_t result = 0x696F566F65646976;
      break;
    default:
      return result;
  }
  return result;
}

ManagedSettings::UserSafetySettings::ScannableService_optional __swiftcall UserSafetySettings.ScannableService.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_1BCA48C38();
  result.value = swift_bridgeObjectRelease();
  char v5 = 5;
  if (v3 < 5) {
    char v5 = v3;
  }
  *int v2 = v5;
  return result;
}

uint64_t UserSafetySettings.InterventionType.rawValue.getter()
{
  if (*v0) {
    return 1852138868;
  }
  else {
    return 0x646C696863;
  }
}

ManagedSettings::UserSafetySettings::InterventionType_optional __swiftcall UserSafetySettings.InterventionType.init(rawValue:)(Swift::String rawValue)
{
  return (ManagedSettings::UserSafetySettings::InterventionType_optional)sub_1BCA27248(v1);
}

uint64_t static UserSafetySettings.InterventionType.< infix(_:_:)(unsigned char *a1, unsigned char *a2)
{
  return *a2 & ~*a1 & 1;
}

ManagedSettings::UserSafetySettings::Name_optional __swiftcall UserSafetySettings.Name.init(rawValue:)(Swift::String rawValue)
{
  return (ManagedSettings::UserSafetySettings::Name_optional)sub_1BCA27248(v1);
}

uint64_t sub_1BCA27248@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_1BCA48C38();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void *static UserSafetySettings.Name.allCases.getter()
{
  return &unk_1F16EC6E0;
}

unint64_t UserSafetySettings.Name.rawValue.getter()
{
  return 0xD000000000000019;
}

uint64_t sub_1BCA272E4(char *a1, char *a2)
{
  return sub_1BC9F4CC0(*a1, *a2);
}

uint64_t sub_1BCA272F0()
{
  return sub_1BCA450A4();
}

uint64_t sub_1BCA272F8()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA27364()
{
  return sub_1BCA45DB8();
}

ManagedSettings::UserSafetySettings::Name_optional sub_1BCA2736C(Swift::String *a1)
{
  return UserSafetySettings.Name.init(rawValue:)(*a1);
}

void sub_1BCA27378(void *a1@<X8>)
{
  unint64_t v2 = 0x80000001BCA4F6B0;
  if (*v1) {
    unint64_t v2 = 0x80000001BCA4F6D0;
  }
  *a1 = 0xD000000000000019;
  a1[1] = v2;
}

void sub_1BCA273B4(void *a1@<X8>)
{
  *a1 = &unk_1F16EC758;
}

uint64_t UserSafetySettings.ScannableService.description.getter()
{
  uint64_t result = 0x706F7244726941;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x73746361746E6F43;
      break;
    case 2:
      uint64_t result = 0x736567617373654DLL;
      break;
    case 3:
      uint64_t result = 0x736F746F6850;
      break;
    case 4:
      uint64_t result = 0x696F566F65646956;
      break;
    default:
      return result;
  }
  return result;
}

void *static UserSafetySettings.ScannableService.allCases.getter()
{
  return &unk_1F16EC5F8;
}

uint64_t sub_1BCA27484(unsigned __int8 *a1, char *a2)
{
  return sub_1BC9F4D60(*a1, *a2);
}

uint64_t sub_1BCA27490()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA27590()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA27678()
{
  return sub_1BCA48D88();
}

ManagedSettings::UserSafetySettings::ScannableService_optional sub_1BCA27774(Swift::String *a1)
{
  return UserSafetySettings.ScannableService.init(rawValue:)(*a1);
}

void sub_1BCA27780(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x706F7244726961;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x73746361746E6F63;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x736567617373656DLL;
      *(void *)(a1 + 8) = 0xE800000000000000;
      break;
    case 3:
      *(void *)a1 = 0x736F746F6870;
      *(void *)(a1 + 8) = 0xE600000000000000;
      break;
    case 4:
      strcpy((char *)a1, "videoVoiceMail");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

void sub_1BCA27844(void *a1@<X8>)
{
  *a1 = &unk_1F16EC6B8;
}

uint64_t sub_1BCA27854()
{
  uint64_t result = 0x706F7244726941;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x73746361746E6F43;
      break;
    case 2:
      uint64_t result = 0x736567617373654DLL;
      break;
    case 3:
      uint64_t result = 0x736F746F6850;
      break;
    case 4:
      uint64_t result = 0x696F566F65646956;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t UserSafetySettings.InterventionType.description.getter()
{
  if (*v0) {
    return 1852138836;
  }
  else {
    return 0x646C696843;
  }
}

void *static UserSafetySettings.InterventionType.allCases.getter()
{
  return &unk_1F16EC558;
}

uint64_t sub_1BCA27944(char *a1, char *a2)
{
  return sub_1BC9F4F3C(*a1, *a2);
}

uint64_t sub_1BCA27950()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA279C8()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA27A2C()
{
  return sub_1BCA48D88();
}

ManagedSettings::UserSafetySettings::InterventionType_optional sub_1BCA27AA0(Swift::String *a1)
{
  return UserSafetySettings.InterventionType.init(rawValue:)(*a1);
}

void sub_1BCA27AAC(uint64_t *a1@<X8>)
{
  uint64_t v2 = 1852138868;
  if (!*v1) {
    uint64_t v2 = 0x646C696863;
  }
  unint64_t v3 = 0xE500000000000000;
  if (*v1) {
    unint64_t v3 = 0xE400000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

void sub_1BCA27AE0(void *a1@<X8>)
{
  *a1 = &unk_1F16EC5D0;
}

uint64_t sub_1BCA27AF0(unsigned char *a1, unsigned char *a2)
{
  return *a2 & ~*a1 & 1;
}

uint64_t sub_1BCA27B04(unsigned char *a1, unsigned char *a2)
{
  return *a2 & 1 | ((*a1 & 1) == 0);
}

uint64_t sub_1BCA27B18(unsigned char *a1, unsigned char *a2)
{
  return *a1 & 1 | ((*a2 & 1) == 0);
}

uint64_t sub_1BCA27B2C(unsigned char *a1, unsigned char *a2)
{
  return *a1 & ~*a2 & 1;
}

uint64_t sub_1BCA27B40()
{
  if (*v0) {
    return 1852138836;
  }
  else {
    return 0x646C696843;
  }
}

uint64_t static UserSafetySettings.ScanningPolicy.maximumNudityDetectionApplicationsCount.getter()
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

unint64_t UserSafetySettings.ScanningPolicy.description.getter()
{
  if (!*(unsigned char *)(v0 + 16))
  {
    sub_1BCA48B58();
    sub_1BCA48858();
    sub_1BCA29040();
    sub_1BCA486F8();
    sub_1BCA48858();
    swift_bridgeObjectRelease();
    sub_1BCA48858();
    sub_1BCA29094();
    sub_1BCA486F8();
    goto LABEL_5;
  }
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    sub_1BCA48B58();
    sub_1BCA48858();
LABEL_5:
    sub_1BCA48858();
    swift_bridgeObjectRelease();
    sub_1BCA48858();
    return 0;
  }
  return 0xD000000000000013;
}

uint64_t UserSafetySettings.allowedClients.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  if (qword_1E9FABD08 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1BC99D12C((uint64_t)&qword_1E9FAE2A8, v2, v1, v4, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BCA27DC4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v7 = qword_1E9FABD08;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_1BC99D12C((uint64_t)&qword_1E9FAE2A8, v4, v3, v6, v5);
  swift_bridgeObjectRelease_n();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a2 = v8;
  return result;
}

uint64_t UserSafetySettings.allowedClients.setter(uint64_t a1)
{
  sub_1BCA290E8(a1);

  return swift_bridgeObjectRelease();
}

void (*UserSafetySettings.allowedClients.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x98uLL);
  *a1 = v3;
  uint64_t v4 = v3 + 17;
  v3[18] = v1;
  uint64_t v6 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v7 = v1[3];
  if (qword_1E9FABD08 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1BC99D12C((uint64_t)&qword_1E9FAE2A8, v6, v5, v8, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t *v4 = v9;
  return sub_1BCA27FA4;
}

void sub_1BCA27FA4(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*a1 + 136);
  uint64_t v5 = *(uint64_t **)(*a1 + 144);
  sub_1BC9AA050((uint64_t)&qword_1E9FAE2A8, *a1, &qword_1EBA01C48);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v5[2];
  uint64_t v8 = v5[3];
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v4)
    {
      swift_bridgeObjectRetain();
      int v10 = (void *)sub_1BC9AC368(v4);
    }
    else
    {
      int v10 = 0;
    }
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v12 = *(void *)(v3 + 8);
      uint64_t v13 = *(void *)(v3 + 16);
      uint64_t v18 = v7;
      uint64_t v19 = v6;
      uint64_t v20 = v9;
      uint64_t v21 = v8;
      int v14 = *(unsigned __int8 *)(v3 + 66);
      swift_retain();
      sub_1BC9A4CA8(v10, v12, v13, &v18, v14);
      swift_release();
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_1BCA29270(v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v4)
    {
      swift_bridgeObjectRetain();
      char v11 = (void *)sub_1BC9AC368(v4);
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = 0;
    }
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v15 = *(void *)(v3 + 8);
      uint64_t v16 = *(void *)(v3 + 16);
      uint64_t v18 = v7;
      uint64_t v19 = v6;
      uint64_t v20 = v9;
      uint64_t v21 = v8;
      int v17 = *(unsigned __int8 *)(v3 + 66);
      swift_retain();
      sub_1BC9A4CA8(v11, v15, v16, &v18, v17);
      swift_release();
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_1BCA29270(v3);
  }
  swift_bridgeObjectRelease();

  free((void *)v3);
}

uint64_t UserSafetySettings.effectiveAllowedClients.getter()
{
  if (qword_1E9FABD08 != -1) {
    swift_once();
  }

  return sub_1BC99ECD0((uint64_t)&qword_1E9FAE2A8);
}

uint64_t sub_1BCA28280()
{
  qword_1E9FAE2A8 = MEMORY[0x1E4FBC870];
  qword_1E9FAE2B0 = 0xD000000000000019;
  qword_1E9FAE2B8 = 0x80000001BCA4F6B0;
  qword_1E9FAE2D8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAC1B8);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAC1C0, &qword_1E9FAC1B8);
  qword_1E9FAE2E0 = result;
  byte_1E9FAE2C0 = 1;
  word_1E9FAE2E8 = 256;
  byte_1E9FAE2EA = 0;
  qword_1E9FAE2F0 = 0x7FFFFFFFFFFFFFFFLL;
  byte_1E9FAE2F8 = 0;
  return result;
}

uint64_t static UserSafetySettings.allowedClients.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9FABD08 != -1) {
    swift_once();
  }
  return sub_1BC9AA050((uint64_t)&qword_1E9FAE2A8, a1, &qword_1EBA01C48);
}

uint64_t UserSafetySettings.scanningPolicy.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1EBA01D70 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DE74((uint64_t)&qword_1EBA01D08, v4, v3, v6, v5, a1);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

double sub_1BCA28444@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v7 = qword_1EBA01D70;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DE74((uint64_t)&qword_1EBA01D08, v4, v3, v6, v5, (uint64_t)&v10);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  char v8 = v11;
  double result = *(double *)&v10;
  *(_OWORD *)a2 = v10;
  *(unsigned char *)(a2 + 16) = v8;
  return result;
}

uint64_t sub_1BCA2851C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  char v5 = *(unsigned char *)(a1 + 16);
  sub_1BCA292E4(*(void *)a1, v4, v5);
  if (qword_1EBA01D70 != -1) {
    swift_once();
  }
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v8 = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BCA0CDB4(v3, v4, v5, (uint64_t)&qword_1EBA01D08, v6, v7, v9, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return sub_1BCA292D0(v3, v4, v5);
}

uint64_t UserSafetySettings.scanningPolicy.setter(uint64_t a1)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  if (qword_1EBA01D70 != -1) {
    swift_once();
  }
  uint64_t v6 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v15 = v3;
  uint64_t v16 = v2;
  LOBYTE(v17) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v4 == 255)
  {
    v9.isa = 0;
  }
  else
  {
    sub_1BCA292E4(v3, v2, v4);
    v9.isa = UserSafetySettings.ScanningPolicy.persistableValue()().isa;
    sub_1BC9FFAEC(v15, v16, v17);
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v10 = v8;
    uint64_t v11 = qword_1EBA01D20;
    uint64_t v12 = unk_1EBA01D28;
    uint64_t v15 = v6;
    uint64_t v16 = v5;
    uint64_t v17 = v10;
    uint64_t v18 = v7;
    int v13 = byte_1EBA01D5A;
    swift_retain();
    sub_1BC9A4CA8(v9.isa, v11, v12, &v15, v13);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BCA292D0(v3, v2, v4);
}

uint64_t (*UserSafetySettings.scanningPolicy.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1EBA01D70 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DE74((uint64_t)&qword_1EBA01D08, v3, v4, v6, v5, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1BCA2886C;
}

uint64_t sub_1BCA2886C(uint64_t a1, char a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 24);
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  char v5 = *(unsigned char *)(a1 + 16);
  uint64_t v7 = *v2;
  uint64_t v6 = v2[1];
  uint64_t v9 = v2[2];
  uint64_t v8 = v2[3];
  if (a2)
  {
    sub_1BCA292E4(*(void *)a1, v4, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BCA0CDB4(v3, v4, v5, (uint64_t)&qword_1EBA01D08, v7, v6, v9, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BCA292D0(v3, v4, v5);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BCA0CDB4(v3, v4, v5, (uint64_t)&qword_1EBA01D08, v7, v6, v9, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return sub_1BCA292D0(v3, v4, v5);
}

uint64_t UserSafetySettings.effectiveScanningPolicy.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EBA01D70 != -1) {
    swift_once();
  }
  if (qword_1E9FABAC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (!qword_1E9FAC238) {
    goto LABEL_9;
  }
  uint64_t v2 = qword_1EBA01D20;
  uint64_t v3 = unk_1EBA01D28;
  swift_retain();
  uint64_t v4 = sub_1BC9AEFD0(v2, v3);
  swift_release();
  if (!v4) {
    goto LABEL_9;
  }
  id v5 = v4;
  static UserSafetySettings.ScanningPolicy.value(from:)((uint64_t)v4, (uint64_t)v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE50);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    *(_OWORD *)a1 = v10;
    *(unsigned char *)(a1 + 16) = v11;
  }
  else
  {
LABEL_9:
    uint64_t v7 = qword_1EBA01D08;
    uint64_t v8 = unk_1EBA01D10;
    *(void *)a1 = qword_1EBA01D08;
    *(void *)(a1 + 8) = v8;
    char v9 = byte_1EBA01D18;
    *(unsigned char *)(a1 + 16) = byte_1EBA01D18;
    return sub_1BC9A39C4(v7, v8, v9);
  }
  return result;
}

void sub_1BCA28AE4()
{
  qword_1EBA01D08 = 0;
  unk_1EBA01D10 = 0;
  byte_1EBA01D18 = 2;
  qword_1EBA01D20 = 0xD000000000000019;
  unk_1EBA01D28 = 0x80000001BCA4F6D0;
  qword_1EBA01D48 = (uint64_t)&type metadata for UserSafetyScanningPolicyCombineOperator;
  unk_1EBA01D50 = &protocol witness table for UserSafetyScanningPolicyCombineOperator;
  word_1EBA01D58 = 256;
  byte_1EBA01D5A = 0;
  qword_1EBA01D60 = 0;
  byte_1EBA01D68 = 1;
}

uint64_t static UserSafetySettings.scanningPolicy.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EBA01D70 != -1) {
    swift_once();
  }
  return sub_1BC9AA050((uint64_t)&qword_1EBA01D08, a1, &qword_1EBA01D78);
}

uint64_t UserSafetySettings.customMirror.getter@<X0>(uint64_t a1@<X8>)
{
  v29[1] = a1;
  v29[0] = sub_1BCA48DA8();
  uint64_t v2 = *(void *)(v29[0] - 8);
  MEMORY[0x1F4188790](v29[0], v3);
  id v5 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA8);
  MEMORY[0x1F4188790](v6 - 8, v7);
  char v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v10 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v12 = v1[3];
  uint64_t v34 = *v1;
  uint64_t v35 = v10;
  uint64_t v36 = v13;
  uint64_t v37 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BCA49730;
  uint64_t v15 = qword_1E9FABD08;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_1E9FAE2B8;
  *(void *)(v14 + 32) = qword_1E9FAE2B0;
  *(void *)(v14 + 40) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_1BC99D12C((uint64_t)&qword_1E9FAE2A8, v11, v10, v13, v12);
  uint64_t v18 = sub_1BC99ECD0((uint64_t)&qword_1E9FAE2A8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v14 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAC188);
  *(void *)(v14 + 48) = v17;
  *(void *)(v14 + 56) = v18;
  if (qword_1EBA01D70 != -1) {
    swift_once();
  }
  uint64_t v19 = unk_1EBA01D28;
  *(void *)(v14 + 80) = qword_1EBA01D20;
  *(void *)(v14 + 88) = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DE74((uint64_t)&qword_1EBA01D08, v11, v10, v13, v12, (uint64_t)v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v20 = v32[0];
  uint64_t v21 = v32[1];
  char v22 = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99F03C((uint64_t)&qword_1EBA01D08, (uint64_t)v30);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v23 = v30[0];
  uint64_t v24 = v30[1];
  char v25 = v31;
  *(void *)(v14 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE308);
  uint64_t v26 = swift_allocObject();
  *(void *)(v14 + 96) = v26;
  *(void *)(v26 + 16) = v20;
  *(void *)(v26 + 24) = v21;
  *(unsigned char *)(v26 + 32) = v22;
  *(void *)(v26 + 40) = v23;
  *(void *)(v26 + 48) = v24;
  *(unsigned char *)(v26 + 56) = v25;
  uint64_t v27 = sub_1BCA48D98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v9, 1, 1, v27);
  (*(void (**)(char *, void, void))(v2 + 104))(v5, *MEMORY[0x1E4FBC430], v29[0]);
  return sub_1BCA48DB8();
}

uint64_t _s15ManagedSettings010UserSafetyB0V14ScanningPolicyO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)a2;
  int v6 = *(unsigned __int8 *)(a2 + 16);
  if (*(unsigned char *)(a1 + 16))
  {
    if (*(unsigned char *)(a1 + 16) != 1) {
      return (v6 & 7) == 2;
    }
    if (v6 == 1)
    {
      BOOL v7 = (v4 & 1) == 0;
      if (v4) {
        uint64_t v8 = 1852138868;
      }
      else {
        uint64_t v8 = 0x646C696863;
      }
      if (v7) {
        unint64_t v9 = 0xE500000000000000;
      }
      else {
        unint64_t v9 = 0xE400000000000000;
      }
      if (v5) {
        uint64_t v10 = 1852138868;
      }
      else {
        uint64_t v10 = 0x646C696863;
      }
      if (v5) {
        unint64_t v11 = 0xE400000000000000;
      }
      else {
        unint64_t v11 = 0xE500000000000000;
      }
      if (v8 == v10 && v9 == v11)
      {
        swift_bridgeObjectRelease_n();
        return 1;
      }
      else
      {
        char v13 = sub_1BCA48CA8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v13 & 1;
      }
    }
    return 0;
  }
  if (*(unsigned char *)(a2 + 16)) {
    return 0;
  }
  uint64_t v15 = *(void *)(a2 + 8);
  uint64_t v16 = *(void *)(a1 + 8);
  if ((sub_1BC9FC64C(v4, v5) & 1) == 0) {
    return 0;
  }

  return sub_1BC9FC7CC(v16, v15);
}

unint64_t sub_1BCA29040()
{
  unint64_t result = qword_1E9FAE300;
  if (!qword_1E9FAE300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE300);
  }
  return result;
}

unint64_t sub_1BCA29094()
{
  unint64_t result = qword_1EBA01C30;
  if (!qword_1EBA01C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBA01C30);
  }
  return result;
}

uint64_t sub_1BCA290E8(uint64_t a1)
{
  if (qword_1E9FABD08 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAE2A8, (uint64_t)v13, &qword_1EBA01C48);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (a1)
  {
    swift_bridgeObjectRetain();
    BOOL v7 = (void *)sub_1BC9AC368(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    BOOL v7 = 0;
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v8 = v14;
    uint64_t v9 = v15;
    v12[0] = v4;
    v12[1] = v3;
    v12[2] = v6;
    v12[3] = v5;
    int v10 = v16;
    swift_retain();
    sub_1BC9A4CA8(v7, v8, v9, v12, v10);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BCA29270((uint64_t)v13);
}

uint64_t sub_1BCA29270(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01C48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BCA292D0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_1BC9FFAEC(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_1BCA292E4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_1BC9A39C4(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_1BCA292F8()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  if (v1 != 255) {
    sub_1BC9FFAEC(*(void *)(v0 + 16), *(void *)(v0 + 24), v1);
  }
  int v2 = *(unsigned __int8 *)(v0 + 56);
  if (v2 != 255) {
    sub_1BC9FFAEC(*(void *)(v0 + 40), *(void *)(v0 + 48), v2);
  }

  return MEMORY[0x1F4186498](v0, 57, 7);
}

unint64_t sub_1BCA29354()
{
  unint64_t result = qword_1E9FAE310;
  if (!qword_1E9FAE310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE310);
  }
  return result;
}

uint64_t sub_1BCA293A8()
{
  return sub_1BC9ADEBC(&qword_1E9FAE318, &qword_1E9FAE320);
}

unint64_t sub_1BCA293E8()
{
  unint64_t result = qword_1E9FAE328;
  if (!qword_1E9FAE328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE328);
  }
  return result;
}

uint64_t sub_1BCA2943C()
{
  return sub_1BC9ADEBC(&qword_1E9FAE330, &qword_1E9FAE338);
}

unint64_t sub_1BCA2947C()
{
  unint64_t result = qword_1E9FAE340;
  if (!qword_1E9FAE340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE340);
  }
  return result;
}

uint64_t sub_1BCA294D0()
{
  return sub_1BC9ADEBC(&qword_1E9FAE348, &qword_1E9FAE350);
}

uint64_t sub_1BCA29510()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_1BCA290E8(v0);

  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for UserSafetySettings()
{
  return &type metadata for UserSafetySettings;
}

ValueMetadata *type metadata accessor for UserSafetySettings.Name()
{
  return &type metadata for UserSafetySettings.Name;
}

unsigned char *storeEnumTagSinglePayload for UserSafetySettings.ScannableService(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BCA2964CLL);
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

ValueMetadata *type metadata accessor for UserSafetySettings.ScannableService()
{
  return &type metadata for UserSafetySettings.ScannableService;
}

unsigned char *_s15ManagedSettings18UserSafetySettingsV4NameOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BCA29750);
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

ValueMetadata *type metadata accessor for UserSafetySettings.InterventionType()
{
  return &type metadata for UserSafetySettings.InterventionType;
}

uint64_t destroy for UserSafetySettings.ScanningPolicy(uint64_t a1)
{
  return sub_1BC9FFAEC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s15ManagedSettings18UserSafetySettingsV14ScanningPolicyOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1BC9A39C4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for UserSafetySettings.ScanningPolicy(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1BC9A39C4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1BC9FFAEC(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for UserSafetySettings.ScanningPolicy(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1BC9FFAEC(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for UserSafetySettings.ScanningPolicy()
{
  return &type metadata for UserSafetySettings.ScanningPolicy;
}

uint64_t BoundedSettingMetadata.bound(value:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCA48CD8();
  sub_1BCA48798();
  sub_1BCA48CE8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL static SettingScope.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

ManagedSettings::SettingScope_optional __swiftcall SettingScope.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BCA48C38();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t SettingScope.rawValue.getter()
{
  uint64_t v1 = 1919251317;
  if (*v0 != 1) {
    uint64_t v1 = 0x6D6574737973;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E6F436C61636F6CLL;
  }
}

uint64_t sub_1BCA29A74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BC9F3858(*a1, *a2);
}

uint64_t sub_1BCA29A80()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA29B24()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA29BB4()
{
  return sub_1BCA48D88();
}

ManagedSettings::SettingScope_optional sub_1BCA29C54(Swift::String *a1)
{
  return SettingScope.init(rawValue:)(*a1);
}

void sub_1BCA29C60(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEE0072656E696174;
  unint64_t v4 = 0xE400000000000000;
  uint64_t v5 = 1919251317;
  if (v2 != 1)
  {
    uint64_t v5 = 0x6D6574737973;
    unint64_t v4 = 0xE600000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6E6F436C61636F6CLL;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t SettingMetadata.name.getter(uint64_t a1)
{
  uint64_t v1 = sub_1BCA2B2D4(a1);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SettingMetadata.combineOperator.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BC9BE1A8(v2 + *(int *)(a1 + 32), a2);
}

uint64_t SettingMetadata.isPublic.getter(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 36));
}

uint64_t SettingMetadata.scope.getter@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(v2 + *(int *)(result + 40));
  return result;
}

uint64_t SettingMetadata.isPrivacySensitive.getter(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 44));
}

uint64_t SettingMetadata.maximumCount.getter(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 48));
}

uint64_t SettingMetadata.responsibleClients.getter(uint64_t a1)
{
  if (qword_1EBA01E50 != -1) {
    swift_once();
  }
  unint64_t v3 = (uint64_t *)(v1 + *(int *)(a1 + 28));
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  swift_beginAccess();
  if (byte_1EBA01ED8 != 2)
  {
    if ((byte_1EBA01ED8 & 1) == 0) {
      return MEMORY[0x1E4FBC870];
    }
LABEL_7:
    uint64_t v8 = MEMORY[0x1E4FBC870];
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    sub_1BC9E5B3C();
    uint64_t v11 = v10;
    uint64_t ObjectType = swift_getObjectType();
    char v13 = (void *)swift_allocObject();
    v13[2] = v5;
    v13[3] = v4;
    v13[4] = v9;
    swift_bridgeObjectRetain();
    swift_retain();
    XPCConnectable.synchronousRemoteObjectProxy(retryCount:proxyHandler:)(1, (void (*)(void *))sub_1BC9F2DFC, (uint64_t)v13, ObjectType, v11);
    swift_unknownObjectRelease();
    swift_release();
    swift_beginAccess();
    uint64_t v7 = *(void *)(v9 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    return v7;
  }
  v15[3] = &type metadata for Feature.FeatureFlags;
  v15[4] = sub_1BC99CA28();
  char v6 = sub_1BCA484C8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  if (v6) {
    goto LABEL_7;
  }
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_1BCA29F1C(uint64_t a1)
{
  uint64_t v1 = sub_1BCA2B2D4(a1);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _s15ManagedSettings15SettingMetadataV12defaultValuexvg_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t BoundedSettingMetadata.bounds.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 36);
  uint64_t v5 = sub_1BCA48798();
  char v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t BoundedSettingMetadata.name.getter(uint64_t a1)
{
  uint64_t v1 = sub_1BCA2B320(a1);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BoundedSettingMetadata.combineOperator.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1BC9BE1A8(v2 + *(int *)(a1 + 44), a2);
}

uint64_t BoundedSettingMetadata.isPublic.getter(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 48));
}

uint64_t BoundedSettingMetadata.scope.getter@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(v2 + *(int *)(result + 52));
  return result;
}

uint64_t BoundedSettingMetadata.isPrivacySensitive.getter(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 56));
}

uint64_t BoundedSettingMetadata.responsibleClients.getter(uint64_t a1)
{
  if (qword_1EBA01E50 != -1) {
    swift_once();
  }
  unint64_t v3 = (uint64_t *)(v1 + *(int *)(a1 + 40));
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  swift_beginAccess();
  if (byte_1EBA01ED8 != 2)
  {
    if ((byte_1EBA01ED8 & 1) == 0) {
      return MEMORY[0x1E4FBC870];
    }
LABEL_7:
    uint64_t v8 = MEMORY[0x1E4FBC870];
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    sub_1BC9E5B3C();
    uint64_t v11 = v10;
    uint64_t ObjectType = swift_getObjectType();
    char v13 = (void *)swift_allocObject();
    v13[2] = v5;
    v13[3] = v4;
    v13[4] = v9;
    swift_bridgeObjectRetain();
    swift_retain();
    XPCConnectable.synchronousRemoteObjectProxy(retryCount:proxyHandler:)(1, (void (*)(void *))sub_1BCA2D1F8, (uint64_t)v13, ObjectType, v11);
    swift_unknownObjectRelease();
    swift_release();
    swift_beginAccess();
    uint64_t v7 = *(void *)(v9 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    return v7;
  }
  v15[3] = &type metadata for Feature.FeatureFlags;
  v15[4] = sub_1BC99CA28();
  char v6 = sub_1BCA484C8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  if (v6) {
    goto LABEL_7;
  }
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_1BCA2A254(uint64_t a1)
{
  uint64_t v1 = sub_1BCA2B320(a1);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SettingMetadataProtocol<>.defaultEffectiveValue.getter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t *__return_ptr))(a2 + 24))(&v24);
  uint64_t v2 = v24;
  uint64_t v23 = MEMORY[0x1E4FBC870];
  uint64_t v19 = v24 + 56;
  uint64_t v3 = 1 << *(unsigned char *)(v24 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(v24 + 56);
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
    int64_t v16 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v16 >= v6) {
      goto LABEL_25;
    }
    unint64_t v17 = *(void *)(v19 + 8 * v16);
    ++v8;
    if (!v17)
    {
      int64_t v8 = v16 + 1;
      if (v16 + 1 >= v6) {
        goto LABEL_25;
      }
      unint64_t v17 = *(void *)(v19 + 8 * v8);
      if (!v17)
      {
        int64_t v8 = v16 + 2;
        if (v16 + 2 >= v6) {
          goto LABEL_25;
        }
        unint64_t v17 = *(void *)(v19 + 8 * v8);
        if (!v17)
        {
          int64_t v8 = v16 + 3;
          if (v16 + 3 >= v6) {
            goto LABEL_25;
          }
          unint64_t v17 = *(void *)(v19 + 8 * v8);
          if (!v17)
          {
            int64_t v8 = v16 + 4;
            if (v16 + 4 >= v6) {
              goto LABEL_25;
            }
            unint64_t v17 = *(void *)(v19 + 8 * v8);
            if (!v17) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v17 - 1) & v17;
    unint64_t v10 = __clz(__rbit64(v17)) + (v8 << 6);
LABEL_5:
    uint64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    unint64_t v13 = v11[1];
    v25[0] = 0;
    v25[1] = 0;
    v25[2] = v12;
    v25[3] = v13;
    v25[4] = 0;
    v25[5] = 0;
    sub_1BC9A396C(v12, v13);
    sub_1BC9A396C(v12, v13);
    sub_1BC9CAA10((uint64_t)v20, v25);
    uint64_t v14 = v21;
    unint64_t v15 = v22;
    swift_bridgeObjectRelease();
    sub_1BC9A3B38(v14, v15);
    swift_bridgeObjectRelease();
    uint64_t result = sub_1BC9A3ACC(v12, v13);
  }
  int64_t v18 = v16 + 5;
  if (v18 >= v6)
  {
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    return v23;
  }
  unint64_t v17 = *(void *)(v19 + 8 * v18);
  if (v17)
  {
    int64_t v8 = v18;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v8 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_25;
    }
    unint64_t v17 = *(void *)(v19 + 8 * v8);
    ++v18;
    if (v17) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20[4];
  uint64_t v21;
  uint64_t v22;

  (*(void (**)(uint64_t *__return_ptr))(a2 + 24))(&v22);
  uint64_t v2 = v22;
  uint64_t v21 = MEMORY[0x1E4FBC870];
  uint64_t v3 = v22 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(v22 + 32);
  unint64_t v5 = -1;
  if (v4 < 64) {
    unint64_t v5 = ~(-1 << v4);
  }
  int64_t v6 = v5 & *(void *)(v22 + 56);
  uint64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      uint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    unint64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v17 >= v7) {
      goto LABEL_25;
    }
    int64_t v18 = *(void *)(v3 + 8 * v17);
    ++v9;
    if (!v18)
    {
      unint64_t v9 = v17 + 1;
      if (v17 + 1 >= v7) {
        goto LABEL_25;
      }
      int64_t v18 = *(void *)(v3 + 8 * v9);
      if (!v18)
      {
        unint64_t v9 = v17 + 2;
        if (v17 + 2 >= v7) {
          goto LABEL_25;
        }
        int64_t v18 = *(void *)(v3 + 8 * v9);
        if (!v18)
        {
          unint64_t v9 = v17 + 3;
          if (v17 + 3 >= v7) {
            goto LABEL_25;
          }
          int64_t v18 = *(void *)(v3 + 8 * v9);
          if (!v18)
          {
            unint64_t v9 = v17 + 4;
            if (v17 + 4 >= v7) {
              goto LABEL_25;
            }
            int64_t v18 = *(void *)(v3 + 8 * v9);
            if (!v18) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    int64_t v6 = (v18 - 1) & v18;
    uint64_t v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    uint64_t v12 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v11);
    unint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    sub_1BC9A396C(*v12, v14);
    sub_1BC9A396C(v13, v14);
    sub_1BC9CAE7C(v20, 0, 0, v13, v14);
    unint64_t v15 = v20[2];
    int64_t v16 = v20[3];
    swift_bridgeObjectRelease();
    sub_1BC9A3B38(v15, v16);
    uint64_t result = sub_1BC9A3ACC(v13, v14);
  }
  uint64_t v19 = v17 + 5;
  if (v19 >= v7)
  {
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    return v21;
  }
  int64_t v18 = *(void *)(v3 + 8 * v19);
  if (v18)
  {
    unint64_t v9 = v19;
    goto LABEL_24;
  }
  while (1)
  {
    unint64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v7) {
      goto LABEL_25;
    }
    int64_t v18 = *(void *)(v3 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *SettingMetadataProtocol<>.defaultEffectiveValue.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t result = (*(void *(**)(void *__return_ptr))(a1 + 24))(v58);
  uint64_t v4 = v58[0];
  uint64_t v55 = v58[1];
  if (!v59)
  {
    v56[0] = MEMORY[0x1E4FBC870];
    uint64_t v53 = v58[0] + 56;
    uint64_t v20 = 1 << *(unsigned char *)(v58[0] + 32);
    uint64_t v21 = -1;
    if (v20 < 64) {
      uint64_t v21 = ~(-1 << v20);
    }
    unint64_t v22 = v21 & *(void *)(v58[0] + 56);
    int64_t v23 = (unint64_t)(v20 + 63) >> 6;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    int64_t v24 = 0;
    while (1)
    {
      if (v22)
      {
        unint64_t v25 = __clz(__rbit64(v22));
        v22 &= v22 - 1;
        unint64_t v26 = v25 | (v24 << 6);
      }
      else
      {
        int64_t v32 = v24 + 1;
        if (__OFADD__(v24, 1))
        {
LABEL_80:
          __break(1u);
LABEL_81:
          __break(1u);
          goto LABEL_82;
        }
        if (v32 >= v23) {
          goto LABEL_53;
        }
        unint64_t v33 = *(void *)(v53 + 8 * v32);
        ++v24;
        if (!v33)
        {
          int64_t v24 = v32 + 1;
          if (v32 + 1 >= v23) {
            goto LABEL_53;
          }
          unint64_t v33 = *(void *)(v53 + 8 * v24);
          if (!v33)
          {
            int64_t v24 = v32 + 2;
            if (v32 + 2 >= v23) {
              goto LABEL_53;
            }
            unint64_t v33 = *(void *)(v53 + 8 * v24);
            if (!v33)
            {
              int64_t v24 = v32 + 3;
              if (v32 + 3 >= v23) {
                goto LABEL_53;
              }
              unint64_t v33 = *(void *)(v53 + 8 * v24);
              if (!v33)
              {
                int64_t v24 = v32 + 4;
                if (v32 + 4 >= v23) {
                  goto LABEL_53;
                }
                unint64_t v33 = *(void *)(v53 + 8 * v24);
                if (!v33)
                {
                  int64_t v34 = v32 + 5;
                  if (v34 >= v23) {
                    goto LABEL_53;
                  }
                  unint64_t v33 = *(void *)(v53 + 8 * v34);
                  if (!v33)
                  {
                    while (1)
                    {
                      int64_t v24 = v34 + 1;
                      if (__OFADD__(v34, 1)) {
                        goto LABEL_83;
                      }
                      if (v24 >= v23) {
                        break;
                      }
                      unint64_t v33 = *(void *)(v53 + 8 * v24);
                      ++v34;
                      if (v33) {
                        goto LABEL_50;
                      }
                    }
LABEL_53:
                    swift_release();
                    swift_bridgeObjectRelease();
                    uint64_t v54 = v56[0];
                    uint64_t v57 = MEMORY[0x1E4FBC870];
                    uint64_t v35 = v55 + 56;
                    uint64_t v36 = 1 << *(unsigned char *)(v55 + 32);
                    uint64_t v37 = -1;
                    if (v36 < 64) {
                      uint64_t v37 = ~(-1 << v36);
                    }
                    unint64_t v38 = v37 & *(void *)(v55 + 56);
                    int64_t v39 = (unint64_t)(v36 + 63) >> 6;
                    uint64_t result = (void *)swift_bridgeObjectRetain();
                    int64_t v40 = 0;
                    while (1)
                    {
                      if (v38)
                      {
                        unint64_t v41 = __clz(__rbit64(v38));
                        v38 &= v38 - 1;
                        unint64_t v42 = v41 | (v40 << 6);
                      }
                      else
                      {
                        int64_t v48 = v40 + 1;
                        if (__OFADD__(v40, 1)) {
                          goto LABEL_81;
                        }
                        if (v48 >= v39) {
                          goto LABEL_77;
                        }
                        unint64_t v49 = *(void *)(v35 + 8 * v48);
                        ++v40;
                        if (!v49)
                        {
                          int64_t v40 = v48 + 1;
                          if (v48 + 1 >= v39) {
                            goto LABEL_77;
                          }
                          unint64_t v49 = *(void *)(v35 + 8 * v40);
                          if (!v49)
                          {
                            int64_t v40 = v48 + 2;
                            if (v48 + 2 >= v39) {
                              goto LABEL_77;
                            }
                            unint64_t v49 = *(void *)(v35 + 8 * v40);
                            if (!v49)
                            {
                              int64_t v40 = v48 + 3;
                              if (v48 + 3 >= v39) {
                                goto LABEL_77;
                              }
                              unint64_t v49 = *(void *)(v35 + 8 * v40);
                              if (!v49)
                              {
                                int64_t v40 = v48 + 4;
                                if (v48 + 4 >= v39) {
                                  goto LABEL_77;
                                }
                                unint64_t v49 = *(void *)(v35 + 8 * v40);
                                if (!v49)
                                {
                                  int64_t v50 = v48 + 5;
                                  if (v50 >= v39) {
                                    goto LABEL_77;
                                  }
                                  unint64_t v49 = *(void *)(v35 + 8 * v50);
                                  if (!v49)
                                  {
                                    while (1)
                                    {
                                      int64_t v40 = v50 + 1;
                                      if (__OFADD__(v50, 1)) {
                                        goto LABEL_84;
                                      }
                                      if (v40 >= v39) {
                                        break;
                                      }
                                      unint64_t v49 = *(void *)(v35 + 8 * v40);
                                      ++v50;
                                      if (v49) {
                                        goto LABEL_76;
                                      }
                                    }
LABEL_77:
                                    swift_release();
                                    uint64_t result = (void *)swift_bridgeObjectRelease();
                                    uint64_t v51 = v57;
                                    *(void *)a2 = v54;
                                    *(void *)(a2 + 8) = v51;
                                    *(unsigned char *)(a2 + 16) = 0;
                                    return result;
                                  }
                                  int64_t v40 = v50;
                                }
                              }
                            }
                          }
                        }
LABEL_76:
                        unint64_t v38 = (v49 - 1) & v49;
                        unint64_t v42 = __clz(__rbit64(v49)) + (v40 << 6);
                      }
                      uint64_t v43 = (uint64_t *)(*(void *)(v55 + 48) + 16 * v42);
                      uint64_t v44 = *v43;
                      unint64_t v45 = v43[1];
                      uint64_t v65 = 0;
                      uint64_t v66 = 0;
                      uint64_t v67 = v44;
                      unint64_t v68 = v45;
                      uint64_t v69 = 0;
                      uint64_t v70 = 0;
                      sub_1BC9A396C(v44, v45);
                      sub_1BC9A396C(v44, v45);
                      sub_1BC9CAA10((uint64_t)v56, &v65);
                      uint64_t v46 = v56[2];
                      unint64_t v47 = v56[3];
                      swift_bridgeObjectRelease();
                      sub_1BC9A3B38(v46, v47);
                      swift_bridgeObjectRelease();
                      uint64_t result = (void *)sub_1BC9A3ACC(v44, v45);
                    }
                  }
                  int64_t v24 = v34;
                }
              }
            }
          }
        }
LABEL_50:
        unint64_t v22 = (v33 - 1) & v33;
        unint64_t v26 = __clz(__rbit64(v33)) + (v24 << 6);
      }
      uint64_t v27 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v26);
      uint64_t v28 = *v27;
      unint64_t v29 = v27[1];
      v60[0] = 0;
      v60[1] = 0;
      uint64_t v61 = v28;
      unint64_t v62 = v29;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      sub_1BC9A396C(v28, v29);
      sub_1BC9A396C(v28, v29);
      sub_1BC9CBC7C((uint64_t)&v65, v60);
      uint64_t v30 = v67;
      unint64_t v31 = v68;
      swift_bridgeObjectRelease();
      sub_1BC9A3B38(v30, v31);
      swift_bridgeObjectRelease();
      uint64_t result = (void *)sub_1BC9A3ACC(v28, v29);
    }
  }
  if (v59 != 1)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 16) = 2;
    return result;
  }
  v56[0] = MEMORY[0x1E4FBC870];
  uint64_t v52 = v58[0] + 56;
  uint64_t v5 = 1 << *(unsigned char *)(v58[0] + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v58[0] + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = (void *)swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_7;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_80;
    }
    if (v17 >= v8) {
      goto LABEL_52;
    }
    unint64_t v18 = *(void *)(v52 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v8) {
        goto LABEL_52;
      }
      unint64_t v18 = *(void *)(v52 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v8) {
          goto LABEL_52;
        }
        unint64_t v18 = *(void *)(v52 + 8 * v9);
        if (!v18)
        {
          int64_t v9 = v17 + 3;
          if (v17 + 3 >= v8) {
            goto LABEL_52;
          }
          unint64_t v18 = *(void *)(v52 + 8 * v9);
          if (!v18)
          {
            int64_t v9 = v17 + 4;
            if (v17 + 4 >= v8) {
              goto LABEL_52;
            }
            unint64_t v18 = *(void *)(v52 + 8 * v9);
            if (!v18) {
              break;
            }
          }
        }
      }
    }
LABEL_26:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_7:
    uint64_t v12 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    unint64_t v14 = v12[1];
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    uint64_t v67 = v13;
    unint64_t v68 = v14;
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    sub_1BC9A396C(v13, v14);
    sub_1BC9A396C(v13, v14);
    sub_1BC9CAA10((uint64_t)v60, &v65);
    uint64_t v15 = v61;
    unint64_t v16 = v62;
    swift_bridgeObjectRelease();
    sub_1BC9A3B38(v15, v16);
    swift_bridgeObjectRelease();
    uint64_t result = (void *)sub_1BC9A3ACC(v13, v14);
  }
  int64_t v19 = v17 + 5;
  if (v19 >= v8)
  {
LABEL_52:
    swift_release();
    uint64_t result = (void *)sub_1BC9E15BC(v4, v55, 1);
    *(void *)a2 = v56[0];
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 16) = 1;
    return result;
  }
  unint64_t v18 = *(void *)(v52 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_26;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v8) {
      goto LABEL_52;
    }
    unint64_t v18 = *(void *)(v52 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_26;
    }
  }
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
  return result;
}

{
  void *result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  int64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  int64_t v42;
  int64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  int64_t v51;
  unint64_t v52;
  int64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  void v62[2];
  char v63;
  uint64_t v64[2];
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;

  uint64_t result = (*(void *(**)(void *__return_ptr))(a1 + 24))(v62);
  uint64_t v4 = v62[0];
  char v56 = v62[1];
  if (!v63)
  {
    uint64_t v55 = a2;
    uint64_t v61 = MEMORY[0x1E4FBC870];
    uint64_t v57 = v62[0] + 56;
    unint64_t v22 = 1 << *(unsigned char *)(v62[0] + 32);
    int64_t v23 = -1;
    if (v22 < 64) {
      int64_t v23 = ~(-1 << v22);
    }
    int64_t v24 = v23 & *(void *)(v62[0] + 56);
    unint64_t v25 = (unint64_t)(v22 + 63) >> 6;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    unint64_t v26 = 0;
    while (1)
    {
      if (v24)
      {
        uint64_t v27 = __clz(__rbit64(v24));
        v24 &= v24 - 1;
        uint64_t v28 = v27 | (v26 << 6);
      }
      else
      {
        int64_t v34 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
LABEL_80:
          __break(1u);
LABEL_81:
          __break(1u);
          goto LABEL_82;
        }
        if (v34 >= v25) {
          goto LABEL_53;
        }
        uint64_t v35 = *(void *)(v57 + 8 * v34);
        ++v26;
        if (!v35)
        {
          unint64_t v26 = v34 + 1;
          if (v34 + 1 >= v25) {
            goto LABEL_53;
          }
          uint64_t v35 = *(void *)(v57 + 8 * v26);
          if (!v35)
          {
            unint64_t v26 = v34 + 2;
            if (v34 + 2 >= v25) {
              goto LABEL_53;
            }
            uint64_t v35 = *(void *)(v57 + 8 * v26);
            if (!v35)
            {
              unint64_t v26 = v34 + 3;
              if (v34 + 3 >= v25) {
                goto LABEL_53;
              }
              uint64_t v35 = *(void *)(v57 + 8 * v26);
              if (!v35)
              {
                unint64_t v26 = v34 + 4;
                if (v34 + 4 >= v25) {
                  goto LABEL_53;
                }
                uint64_t v35 = *(void *)(v57 + 8 * v26);
                if (!v35)
                {
                  uint64_t v36 = v34 + 5;
                  if (v36 >= v25) {
                    goto LABEL_53;
                  }
                  uint64_t v35 = *(void *)(v57 + 8 * v36);
                  if (!v35)
                  {
                    while (1)
                    {
                      unint64_t v26 = v36 + 1;
                      if (__OFADD__(v36, 1)) {
                        goto LABEL_83;
                      }
                      if (v26 >= v25) {
                        break;
                      }
                      uint64_t v35 = *(void *)(v57 + 8 * v26);
                      ++v36;
                      if (v35) {
                        goto LABEL_50;
                      }
                    }
LABEL_53:
                    swift_release();
                    swift_bridgeObjectRelease();
                    uint64_t v37 = v61;
                    uint64_t v61 = MEMORY[0x1E4FBC870];
                    unint64_t v38 = v56 + 56;
                    int64_t v39 = 1 << *(unsigned char *)(v56 + 32);
                    int64_t v40 = -1;
                    if (v39 < 64) {
                      int64_t v40 = ~(-1 << v39);
                    }
                    unint64_t v41 = v40 & *(void *)(v56 + 56);
                    unint64_t v42 = (unint64_t)(v39 + 63) >> 6;
                    uint64_t result = (void *)swift_bridgeObjectRetain();
                    uint64_t v43 = 0;
                    while (1)
                    {
                      if (v41)
                      {
                        uint64_t v44 = __clz(__rbit64(v41));
                        v41 &= v41 - 1;
                        unint64_t v45 = v44 | (v43 << 6);
                      }
                      else
                      {
                        uint64_t v51 = v43 + 1;
                        if (__OFADD__(v43, 1)) {
                          goto LABEL_81;
                        }
                        if (v51 >= v42) {
                          goto LABEL_77;
                        }
                        uint64_t v52 = *(void *)(v38 + 8 * v51);
                        ++v43;
                        if (!v52)
                        {
                          uint64_t v43 = v51 + 1;
                          if (v51 + 1 >= v42) {
                            goto LABEL_77;
                          }
                          uint64_t v52 = *(void *)(v38 + 8 * v43);
                          if (!v52)
                          {
                            uint64_t v43 = v51 + 2;
                            if (v51 + 2 >= v42) {
                              goto LABEL_77;
                            }
                            uint64_t v52 = *(void *)(v38 + 8 * v43);
                            if (!v52)
                            {
                              uint64_t v43 = v51 + 3;
                              if (v51 + 3 >= v42) {
                                goto LABEL_77;
                              }
                              uint64_t v52 = *(void *)(v38 + 8 * v43);
                              if (!v52)
                              {
                                uint64_t v43 = v51 + 4;
                                if (v51 + 4 >= v42) {
                                  goto LABEL_77;
                                }
                                uint64_t v52 = *(void *)(v38 + 8 * v43);
                                if (!v52)
                                {
                                  uint64_t v53 = v51 + 5;
                                  if (v53 >= v42) {
                                    goto LABEL_77;
                                  }
                                  uint64_t v52 = *(void *)(v38 + 8 * v53);
                                  if (!v52)
                                  {
                                    while (1)
                                    {
                                      uint64_t v43 = v53 + 1;
                                      if (__OFADD__(v53, 1)) {
                                        goto LABEL_84;
                                      }
                                      if (v43 >= v42) {
                                        break;
                                      }
                                      uint64_t v52 = *(void *)(v38 + 8 * v43);
                                      ++v53;
                                      if (v52) {
                                        goto LABEL_76;
                                      }
                                    }
LABEL_77:
                                    swift_release();
                                    uint64_t result = (void *)swift_bridgeObjectRelease();
                                    uint64_t v54 = v61;
                                    *(void *)uint64_t v55 = v37;
                                    *(void *)(v55 + 8) = v54;
                                    *(unsigned char *)(v55 + 16) = 0;
                                    return result;
                                  }
                                  uint64_t v43 = v53;
                                }
                              }
                            }
                          }
                        }
LABEL_76:
                        unint64_t v41 = (v52 - 1) & v52;
                        unint64_t v45 = __clz(__rbit64(v52)) + (v43 << 6);
                      }
                      uint64_t v46 = (uint64_t *)(*(void *)(v56 + 48) + 16 * v45);
                      unint64_t v47 = *v46;
                      int64_t v48 = v46[1];
                      sub_1BC9A396C(*v46, v48);
                      sub_1BC9A396C(v47, v48);
                      sub_1BC9CAE7C(&v58, 0, 0, v47, v48);
                      unint64_t v49 = v59;
                      int64_t v50 = v60;
                      swift_bridgeObjectRelease();
                      sub_1BC9A3B38(v49, v50);
                      uint64_t result = (void *)sub_1BC9A3ACC(v47, v48);
                    }
                  }
                  unint64_t v26 = v36;
                }
              }
            }
          }
        }
LABEL_50:
        int64_t v24 = (v35 - 1) & v35;
        uint64_t v28 = __clz(__rbit64(v35)) + (v26 << 6);
      }
      unint64_t v29 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v28);
      uint64_t v30 = *v29;
      unint64_t v31 = v29[1];
      v64[0] = 0;
      v64[1] = 0;
      uint64_t v65 = v30;
      uint64_t v66 = v31;
      uint64_t v67 = 0;
      unint64_t v68 = 0;
      sub_1BC9A396C(v30, v31);
      sub_1BC9A396C(v30, v31);
      sub_1BC9CBC7C((uint64_t)&v58, v64);
      int64_t v32 = v59;
      unint64_t v33 = v60;
      swift_bridgeObjectRelease();
      sub_1BC9A3B38(v32, v33);
      swift_bridgeObjectRelease();
      uint64_t result = (void *)sub_1BC9A3ACC(v30, v31);
    }
  }
  if (v63 != 1)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(unsigned char *)(a2 + 16) = 2;
    return result;
  }
  uint64_t v5 = a2;
  uint64_t v58 = MEMORY[0x1E4FBC870];
  uint64_t v6 = v62[0] + 56;
  unint64_t v7 = 1 << *(unsigned char *)(v62[0] + 32);
  int64_t v8 = -1;
  if (v7 < 64) {
    int64_t v8 = ~(-1 << v7);
  }
  int64_t v9 = v8 & *(void *)(v62[0] + 56);
  unint64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = (void *)swift_bridgeObjectRetain();
  unint64_t v11 = 0;
  while (1)
  {
    if (v9)
    {
      uint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      uint64_t v13 = v12 | (v11 << 6);
      goto LABEL_7;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_80;
    }
    if (v19 >= v10) {
      goto LABEL_52;
    }
    uint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v11;
    if (!v20)
    {
      unint64_t v11 = v19 + 1;
      if (v19 + 1 >= v10) {
        goto LABEL_52;
      }
      uint64_t v20 = *(void *)(v6 + 8 * v11);
      if (!v20)
      {
        unint64_t v11 = v19 + 2;
        if (v19 + 2 >= v10) {
          goto LABEL_52;
        }
        uint64_t v20 = *(void *)(v6 + 8 * v11);
        if (!v20)
        {
          unint64_t v11 = v19 + 3;
          if (v19 + 3 >= v10) {
            goto LABEL_52;
          }
          uint64_t v20 = *(void *)(v6 + 8 * v11);
          if (!v20)
          {
            unint64_t v11 = v19 + 4;
            if (v19 + 4 >= v10) {
              goto LABEL_52;
            }
            uint64_t v20 = *(void *)(v6 + 8 * v11);
            if (!v20) {
              break;
            }
          }
        }
      }
    }
LABEL_26:
    int64_t v9 = (v20 - 1) & v20;
    uint64_t v13 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_7:
    unint64_t v14 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v15 = *v14;
    unint64_t v16 = v14[1];
    sub_1BC9A396C(*v14, v16);
    sub_1BC9A396C(v15, v16);
    sub_1BC9CAE7C(v64, 0, 0, v15, v16);
    int64_t v17 = v65;
    unint64_t v18 = v66;
    swift_bridgeObjectRelease();
    sub_1BC9A3B38(v17, v18);
    uint64_t result = (void *)sub_1BC9A3ACC(v15, v16);
  }
  uint64_t v21 = v19 + 5;
  if (v21 >= v10)
  {
LABEL_52:
    swift_release();
    uint64_t result = (void *)sub_1BC9E15BC(v4, v56, 1);
    *(void *)uint64_t v5 = v58;
    *(void *)(v5 + 8) = 0;
    *(unsigned char *)(v5 + 16) = 1;
    return result;
  }
  uint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    unint64_t v11 = v21;
    goto LABEL_26;
  }
  while (1)
  {
    unint64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v10) {
      goto LABEL_52;
    }
    uint64_t v20 = *(void *)(v6 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_26;
    }
  }
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
  return result;
}

uint64_t SettingMetadataProtocol.validateSettingType(for:)(uint64_t a1)
{
  return sub_1BCA2B334(a1);
}

uint64_t sub_1BCA2B2D4(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 28));
}

uint64_t sub_1BCA2B2E4()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BCA2B320(uint64_t a1)
{
  return *(void *)(v1 + *(int *)(a1 + 40));
}

uint64_t sub_1BCA2B334(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness, v4);
  uint64_t v6 = (char *)v11 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE88);
  if (swift_dynamicCastMetatype())
  {
    sub_1BC9BE1A8(a1, (uint64_t)v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE370);
    unint64_t v7 = &qword_1E9FACDB8;
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE60);
  if (swift_dynamicCastMetatype())
  {
    sub_1BC9BE1A8(a1, (uint64_t)v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE370);
    unint64_t v7 = &qword_1E9FACDC0;
LABEL_5:
    __swift_instantiateConcreteTypeFromMangledName(v7);
    if (swift_dynamicCast()) {
      return sub_1BC9E15BC(v11[0], v11[1], v12);
    }
    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE360);
  if (swift_dynamicCastMetatype())
  {
    sub_1BC9BE1A8(a1, (uint64_t)v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE370);
    int64_t v9 = &qword_1EBA01C58;
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE368);
  if (swift_dynamicCastMetatype())
  {
    sub_1BC9BE1A8(a1, (uint64_t)v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE370);
    int64_t v9 = &qword_1E9FABE78;
LABEL_11:
    __swift_instantiateConcreteTypeFromMangledName(v9);
    if (swift_dynamicCast()) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_15;
  }
  sub_1BC9BE1A8(a1, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE370);
  if (swift_dynamicCast()) {
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, AssociatedTypeWitness);
  }
LABEL_15:
  sub_1BC9F2D60();
  swift_allocError();
  *unint64_t v10 = 2;
  return swift_willThrow();
}

unint64_t sub_1BCA2B5E8()
{
  unint64_t result = qword_1E9FAE358;
  if (!qword_1E9FAE358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE358);
  }
  return result;
}

uint64_t sub_1BCA2B63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)(a3 - 8);
}

unsigned char *storeEnumTagSinglePayload for SettingScope(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BCA2B710);
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

ValueMetadata *type metadata accessor for SettingScope()
{
  return &type metadata for SettingScope;
}

uint64_t dispatch thunk of SettingMetadataProtocol.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SettingMetadataProtocol.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SettingMetadataProtocol.combineOperator.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SettingMetadataProtocol.isPublic.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of SettingMetadataProtocol.scope.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of SettingMetadataProtocol.isPrivacySensitive.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of SettingMetadataProtocol.responsibleClients.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_1BCA2B7D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 40);
}

uint64_t sub_1BCA2B7DC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1BCA2B8A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 50) & 0xFFFFFFFFFFFFFFF8) + 9 > 0x18)
  {
    uint64_t v9 = *a2;
    uint64_t *v4 = *a2;
    unsigned int v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *unint64_t v10 = *v11;
    v10[1] = v11[1];
    unint64_t v12 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v13 = ((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v14 = *(void *)(v13 + 24);
    *(void *)(v12 + 24) = v14;
    *(void *)(v12 + 32) = *(void *)(v13 + 32);
    uint64_t v15 = **(void (***)(unint64_t, unint64_t, uint64_t))(v14 - 8);
    swift_bridgeObjectRetain();
    v15(v12, v13, v14);
    *(unsigned char *)(v12 + 40) = *(unsigned char *)(v13 + 40);
    *(unsigned char *)(v12 + 41) = *(unsigned char *)(v13 + 41);
    *(unsigned char *)(v12 + 42) = *(unsigned char *)(v13 + 42);
    unint64_t v16 = (v12 + 50) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v17 = (v13 + 50) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v18 = *(void *)v17;
    *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
    *(void *)unint64_t v16 = v18;
  }
  return v4;
}

uint64_t sub_1BCA2BA5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();

  return __swift_destroy_boxed_opaque_existential_0((v4 + 23) & 0xFFFFFFFFFFFFFFF8);
}

uint64_t sub_1BCA2BAD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  int64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void *)(v10 + 24);
  *(void *)(v9 + 24) = v11;
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  unint64_t v12 = **(void (***)(unint64_t, unint64_t, uint64_t))(v11 - 8);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  *(unsigned char *)(v9 + 40) = *(unsigned char *)(v10 + 40);
  *(unsigned char *)(v9 + 41) = *(unsigned char *)(v10 + 41);
  *(unsigned char *)(v9 + 42) = *(unsigned char *)(v10 + 42);
  unint64_t v13 = (v9 + 50) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v10 + 50) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  *(void *)unint64_t v13 = v15;
  return a1;
}

uint64_t sub_1BCA2BC08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  int64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *int v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v9, (uint64_t *)v10);
  *(unsigned char *)(v9 + 40) = *(unsigned char *)(v10 + 40);
  *(unsigned char *)(v9 + 41) = *(unsigned char *)(v10 + 41);
  *(unsigned char *)(v9 + 42) = *(unsigned char *)(v10 + 42);
  unint64_t v11 = (v9 + 50) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v12 = (v10 + 50) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v13 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = *(unsigned char *)(v12 + 8);
  *(void *)unint64_t v11 = v13;
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        unint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t sub_1BCA2BF20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  uint64_t v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  long long v11 = *(_OWORD *)v10;
  long long v12 = *(_OWORD *)(v10 + 16);
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  *(_OWORD *)unint64_t v9 = v11;
  *(_OWORD *)(v9 + 16) = v12;
  *(unsigned char *)(v9 + 40) = *(unsigned char *)(v10 + 40);
  *(unsigned char *)(v9 + 41) = *(unsigned char *)(v10 + 41);
  *(unsigned char *)(v9 + 42) = *(unsigned char *)(v10 + 42);
  unint64_t v13 = (v9 + 50) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v10 + 50) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  *(void *)unint64_t v13 = v15;
  return a1;
}

uint64_t sub_1BCA2BFEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  unint64_t v9 = ((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = ((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8;
  __swift_destroy_boxed_opaque_existential_0(v9);
  long long v11 = *(_OWORD *)v10;
  long long v12 = *(_OWORD *)(v10 + 16);
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  *(_OWORD *)unint64_t v9 = v11;
  *(_OWORD *)(v9 + 16) = v12;
  *(unsigned char *)(v9 + 40) = *(unsigned char *)(v10 + 40);
  *(unsigned char *)(v9 + 41) = *(unsigned char *)(v10 + 41);
  *(unsigned char *)(v9 + 42) = *(unsigned char *)(v10 + 42);
  unint64_t v13 = (v9 + 50) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (v10 + 50) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  *(void *)unint64_t v13 = v15;
  return a1;
}

uint64_t sub_1BCA2C0D8(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 50) & 0xFFFFFFFFFFFFFFF8) + 9;
    unsigned int v9 = (a2 - v7 + 255) >> (8 * v8);
    if (v8 < 4) {
      unsigned int v10 = v9 + 1;
    }
    else {
      unsigned int v10 = 2;
    }
    if (v10 >= 0x10000) {
      unsigned int v11 = 4;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v10 < 0x100) {
      unsigned int v11 = 1;
    }
    if (v10 >= 2) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    switch(v12)
    {
      case 1:
        int v13 = a1[v8];
        if (!a1[v8]) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v13 = *(unsigned __int16 *)&a1[v8];
        if (*(_WORD *)&a1[v8]) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1BCA2C250);
      case 4:
        int v13 = *(_DWORD *)&a1[v8];
        if (!v13) {
          break;
        }
LABEL_22:
        int v15 = (v13 - 1) << (8 * v8);
        if (v8 >= 4) {
          int v15 = 0;
        }
        if (((((((v6 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 50) & 0xFFFFFFF8) == 0xFFFFFFF8) {
          int v16 = *a1;
        }
        else {
          int v16 = *(_DWORD *)a1;
        }
        return v7 + (v16 | v15) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)&a1[v6 + 7] & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_1BCA2C264(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  size_t v10 = ((((((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 50) & 0xFFFFFFFFFFFFFFF8) + 9;
  char v11 = 8 * v10;
  if (v8 >= a3)
  {
    int v15 = 0;
    if (v8 >= a2)
    {
LABEL_17:
      switch(v15)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_34;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_34;
        case 3:
          goto LABEL_46;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_33;
        default:
LABEL_33:
          if (a2)
          {
LABEL_34:
            if (v7 < 0x7FFFFFFF)
            {
              uint64_t v21 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                *uint64_t v21 = a2 ^ 0x80000000;
                v21[1] = 0;
              }
              else
              {
                v21[1] = a2 - 1;
              }
            }
            else
            {
              uint64_t v20 = *(void (**)(void))(v6 + 56);
              v20();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v12 = (a3 - v8 + 255) >> v11;
    if (v10 <= 3) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v13 >= 0x10000) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (v13 < 0x100) {
      int v14 = 1;
    }
    if (v13 >= 2) {
      int v15 = v14;
    }
    else {
      int v15 = 0;
    }
    if (v8 >= a2) {
      goto LABEL_17;
    }
  }
  unsigned int v16 = ~v8 + a2;
  unsigned int v17 = (~(_BYTE)v8 + a2);
  if (v10 < 4) {
    int v18 = (v16 >> v11) + 1;
  }
  else {
    int v18 = 1;
  }
  if (v10 >= 4) {
    unsigned int v19 = v16;
  }
  else {
    unsigned int v19 = v17;
  }
  bzero(a1, v10);
  if (v10 == 1) {
    *a1 = v19;
  }
  else {
    *(_DWORD *)a1 = v19;
  }
  switch(v15)
  {
    case 1:
      a1[v10] = v18;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v18;
      break;
    case 3:
LABEL_46:
      __break(1u);
      JUMPOUT(0x1BCA2C488);
    case 4:
      *(_DWORD *)&a1[v10] = v18;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for SettingMetadata()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BCA2C4C8()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t v0 = sub_1BCA48798();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return v0;
}

uint64_t *sub_1BCA2C5D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  uint64_t v10 = (v7 + v8) & ~v8;
  uint64_t v11 = v10 + v7;
  unint64_t v12 = ((((v10 + v7 + v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 43;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v12 > 0x18)
  {
    uint64_t v15 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v16 = ~v8;
    unsigned int v17 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v17(a1, a2, v5);
    unint64_t v18 = ((unint64_t)v4 + v9) & v16;
    unint64_t v19 = ((unint64_t)a2 + v9) & v16;
    v17((uint64_t *)v18, (uint64_t *)v19, v5);
    v17((uint64_t *)((v9 + v18) & v16), (uint64_t *)((v9 + v19) & v16), v5);
    uint64_t v20 = (void *)((v18 + v11 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v21 = (void *)((v19 + v11 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v20 = *v21;
    v20[1] = v21[1];
    unint64_t v22 = ((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v23 = ((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v24 = *(void *)(v23 + 24);
    *(void *)(v22 + 24) = v24;
    *(void *)(v22 + 32) = *(void *)(v23 + 32);
    unint64_t v25 = **(void (***)(unint64_t, unint64_t, uint64_t))(v24 - 8);
    swift_bridgeObjectRetain();
    v25(v22, v23, v24);
    *(unsigned char *)(v22 + 40) = *(unsigned char *)(v23 + 40);
    *(unsigned char *)(v22 + 41) = *(unsigned char *)(v23 + 41);
    *(unsigned char *)(v22 + 42) = *(unsigned char *)(v23 + 42);
  }
  return v4;
}

uint64_t sub_1BCA2C7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(a1, v3);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = (v6 + v7 + a1) & ~v7;
  v5(v8, v3);
  v5((v6 + v7 + v8) & ~v7, v3);
  swift_bridgeObjectRelease();

  return __swift_destroy_boxed_opaque_existential_0((((v8 + v6 + ((v6 + v7) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);
}

uint64_t sub_1BCA2C8B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  v7((v8 + v9 + v10) & ~v9, (v8 + v9 + v11) & ~v9, v5);
  uint64_t v12 = ((v8 + v9) & ~v9) + v8 + 7;
  unsigned int v13 = (void *)((v12 + v10) & 0xFFFFFFFFFFFFFFF8);
  int v14 = (void *)((v12 + v11) & 0xFFFFFFFFFFFFFFF8);
  void *v13 = *v14;
  v13[1] = v14[1];
  unint64_t v15 = ((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = ((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = *(void *)(v16 + 24);
  *(void *)(v15 + 24) = v17;
  *(void *)(v15 + 32) = *(void *)(v16 + 32);
  unint64_t v18 = **(void (***)(unint64_t, unint64_t, uint64_t))(v17 - 8);
  swift_bridgeObjectRetain();
  v18(v15, v16, v17);
  *(unsigned char *)(v15 + 40) = *(unsigned char *)(v16 + 40);
  *(unsigned char *)(v15 + 41) = *(unsigned char *)(v16 + 41);
  *(unsigned char *)(v15 + 42) = *(unsigned char *)(v16 + 42);
  return a1;
}

uint64_t sub_1BCA2CA34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  v7((v8 + v9 + v10) & ~v9, (v8 + v9 + v11) & ~v9, v5);
  uint64_t v12 = ((v8 + v9) & ~v9) + v8 + 7;
  unsigned int v13 = (void *)((v12 + v10) & 0xFFFFFFFFFFFFFFF8);
  int v14 = (void *)((v12 + v11) & 0xFFFFFFFFFFFFFFF8);
  void *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v15 = ((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = ((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v15, (uint64_t *)v16);
  *(unsigned char *)(v15 + 40) = *(unsigned char *)(v16 + 40);
  *(unsigned char *)(v15 + 41) = *(unsigned char *)(v16 + 41);
  *(unsigned char *)(v15 + 42) = *(unsigned char *)(v16 + 42);
  return a1;
}

uint64_t sub_1BCA2CB70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  v7((v8 + v9 + v10) & ~v9, (v8 + v9 + v11) & ~v9, v5);
  uint64_t v12 = ((v8 + v9) & ~v9) + v8 + 7;
  unsigned int v13 = (_OWORD *)((v12 + v10) & 0xFFFFFFFFFFFFFFF8);
  int v14 = (_OWORD *)((v12 + v11) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v13 = *v14;
  unint64_t v15 = ((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = ((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = *(void *)(v16 + 32);
  long long v18 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v18;
  *(void *)(v15 + 32) = v17;
  *(unsigned char *)(v15 + 40) = *(unsigned char *)(v16 + 40);
  *(unsigned char *)(v15 + 41) = *(unsigned char *)(v16 + 41);
  *(unsigned char *)(v15 + 42) = *(unsigned char *)(v16 + 42);
  return a1;
}

uint64_t sub_1BCA2CC90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  v7((v8 + v9 + v10) & ~v9, (v8 + v9 + v11) & ~v9, v5);
  uint64_t v12 = ((v8 + v9) & ~v9) + v8 + 7;
  unsigned int v13 = (void *)((v12 + v10) & 0xFFFFFFFFFFFFFFF8);
  int v14 = (void *)((v12 + v11) & 0xFFFFFFFFFFFFFFF8);
  void *v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRelease();
  unint64_t v15 = ((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = ((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8;
  __swift_destroy_boxed_opaque_existential_0(v15);
  long long v17 = *(_OWORD *)v16;
  long long v18 = *(_OWORD *)(v16 + 16);
  *(void *)(v15 + 32) = *(void *)(v16 + 32);
  *(_OWORD *)unint64_t v15 = v17;
  *(_OWORD *)(v15 + 16) = v18;
  *(unsigned char *)(v15 + 40) = *(unsigned char *)(v16 + 40);
  *(unsigned char *)(v15 + 41) = *(unsigned char *)(v16 + 41);
  *(unsigned char *)(v15 + 42) = *(unsigned char *)(v16 + 42);
  return a1;
}

uint64_t sub_1BCA2CDD0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v8 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v9 = v6 + v8;
  uint64_t v10 = (v6 + v8) & ~v8;
  uint64_t v11 = v10 + v6;
  if (v7 < a2)
  {
    unint64_t v12 = ((((v11 + v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 43;
    unsigned int v13 = (a2 - v7 + 0xFFFFFF) >> (8 * v12);
    if (v12 == 3) {
      unsigned int v14 = v13 + 1;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v14 >= 0x10000) {
      unsigned int v15 = 4;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v14 < 0x100) {
      unsigned int v15 = 1;
    }
    if (v14 >= 2) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = *((unsigned __int8 *)a1 + v12);
        if (!*((unsigned char *)a1 + v12)) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v17 = *(unsigned __int16 *)((char *)a1 + v12);
        if (*(unsigned __int16 *)((char *)a1 + v12)) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1BCA2CF68);
      case 4:
        int v17 = *(_DWORD *)((char *)a1 + v12);
        if (!v17) {
          break;
        }
LABEL_22:
        int v19 = (v17 << 24) - 0x1000000;
        if (v12 == 3)
        {
          int v21 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        }
        else
        {
          int v19 = 0;
          int v21 = *(_DWORD *)a1;
        }
        return v7 + (v21 | v19) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v20 = *(void *)((((((unint64_t)a1 + v9) & ~v8) + v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
  if (v20 >= 0xFFFFFFFF) {
    LODWORD(v20) = -1;
  }
  return (v20 + 1);
}

void sub_1BCA2CF7C(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  uint64_t v10 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = v9 + v10;
  uint64_t v12 = (v9 + v10) & ~v10;
  uint64_t v13 = v12 + v9;
  size_t v14 = ((((v13 + v12 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 43;
  char v15 = 8 * v14;
  if (v8 >= a3)
  {
    int v19 = 0;
    if (v8 >= a2)
    {
LABEL_17:
      switch(v19)
      {
        case 1:
          a1[v14] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_31;
        case 2:
          *(_WORD *)&a1[v14] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_31;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v14] = 0;
          goto LABEL_30;
        default:
LABEL_30:
          if (a2)
          {
LABEL_31:
            if (v7 < 0x7FFFFFFF)
            {
              uint64_t v24 = (void *)((((unint64_t)&a1[v11] & ~v10) + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                *uint64_t v24 = a2 ^ 0x80000000;
                v24[1] = 0;
              }
              else
              {
                v24[1] = a2 - 1;
              }
            }
            else
            {
              unint64_t v23 = *(void (**)(void))(v6 + 56);
              v23();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v16 = (a3 - v8 + 0xFFFFFF) >> v15;
    if (v14 == 3) {
      unsigned int v17 = v16 + 1;
    }
    else {
      unsigned int v17 = 2;
    }
    if (v17 >= 0x10000) {
      int v18 = 4;
    }
    else {
      int v18 = 2;
    }
    if (v17 < 0x100) {
      int v18 = 1;
    }
    if (v17 >= 2) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    if (v8 >= a2) {
      goto LABEL_17;
    }
  }
  unsigned int v20 = ~v8 + a2;
  unsigned int v21 = v20 >> v15;
  bzero(a1, v14);
  if (v14 == 3) {
    int v22 = v21 + 1;
  }
  else {
    int v22 = 1;
  }
  if (v14 == 3)
  {
    *(_WORD *)a1 = v20;
    a1[2] = BYTE2(v20);
  }
  else
  {
    *(_DWORD *)a1 = v20;
  }
  switch(v19)
  {
    case 1:
      a1[v14] = v22;
      break;
    case 2:
      *(_WORD *)&a1[v14] = v22;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x1BCA2D1B8);
    case 4:
      *(_DWORD *)&a1[v14] = v22;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for BoundedSettingMetadata()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1BCA2D200(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_1EBA02860 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1BCA484F8();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EBA01EE8);
  swift_bridgeObjectRetain_n();
  unsigned int v7 = sub_1BCA484D8();
  os_log_type_t v8 = sub_1BCA489B8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v14 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    swift_bridgeObjectRetain();
    sub_1BC9B1A74(a1, a2, &v14);
    sub_1BCA48AA8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BC99B000, v7, v8, "Fetching effective value for %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C18779C0](v10, -1, -1);
    MEMORY[0x1C18779C0](v9, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v11 = *(void (**)(void (*)(uint64_t), void *))(v3 + 32);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a1;
  v12[3] = a2;
  uint64_t v12[4] = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  v11(sub_1BCA3697C, v12);
  return swift_release();
}

void sub_1BCA2D410(void *a1, uint64_t a2, char a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v48 = a4;
  uint64_t v11 = sub_1BCA48678();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v13);
  char v15 = (char *)v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1BCA48698();
  MEMORY[0x1F4188790](v16, v17);
  unsigned int v20 = (char *)v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v30 = a1;
    if (qword_1EBA02860 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_1BCA484F8();
    __swift_project_value_buffer(v31, (uint64_t)qword_1EBA01EE8);
    swift_bridgeObjectRetain();
    sub_1BCA36994(a1, a2, 1);
    swift_bridgeObjectRetain();
    sub_1BCA36994(a1, a2, 1);
    unint64_t v49 = sub_1BCA484D8();
    os_log_type_t v32 = sub_1BCA489C8();
    if (os_log_type_enabled(v49, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t aBlock = v34;
      *(_DWORD *)uint64_t v33 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v56 = sub_1BC9B1A74(v48, a5, &aBlock);
      sub_1BCA48AA8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 12) = 2082;
      uint64_t v56 = (uint64_t)a1;
      id v35 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01E10);
      uint64_t v36 = sub_1BCA48838();
      uint64_t v56 = sub_1BC9B1A74(v36, v37, &aBlock);
      sub_1BCA48AA8();
      swift_bridgeObjectRelease();
      sub_1BCA369A0(a1, a2, 1);
      sub_1BCA369A0(a1, a2, 1);
      _os_log_impl(&dword_1BC99B000, v49, v32, "Failed to fetch effective value for %{public}s: %{public}s", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C18779C0](v34, -1, -1);
      MEMORY[0x1C18779C0](v33, -1, -1);

      sub_1BCA369A0(a1, a2, 1);
    }
    else
    {
      sub_1BCA369A0(a1, a2, 1);
      swift_bridgeObjectRelease_n();
      sub_1BCA369A0(a1, a2, 1);
      sub_1BCA369A0(a1, a2, 1);
      unint64_t v41 = v49;
    }
  }
  else
  {
    uint64_t v47 = a6;
    unint64_t v49 = v18;
    if (qword_1EBA02860 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1BCA484F8();
    __swift_project_value_buffer(v21, (uint64_t)qword_1EBA01EE8);
    swift_bridgeObjectRetain_n();
    int v22 = sub_1BCA484D8();
    os_log_type_t v23 = sub_1BCA489B8();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v44 = v16;
      uint64_t v25 = v24;
      uint64_t v43 = swift_slowAlloc();
      uint64_t v56 = v43;
      *(_DWORD *)uint64_t v25 = 136446466;
      v42[1] = v25 + 4;
      uint64_t aBlock = (uint64_t)a1;
      uint64_t v51 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE3B0);
      uint64_t v46 = a2;
      uint64_t v26 = sub_1BCA48838();
      uint64_t v45 = v12;
      uint64_t aBlock = sub_1BC9B1A74(v26, v27, &v56);
      sub_1BCA48AA8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t aBlock = sub_1BC9B1A74(v48, a5, &v56);
      uint64_t v12 = v45;
      a2 = v46;
      sub_1BCA48AA8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1BC99B000, v22, v23, "Setting effective value %{public}s for %{public}s", (uint8_t *)v25, 0x16u);
      uint64_t v28 = v43;
      swift_arrayDestroy();
      MEMORY[0x1C18779C0](v28, -1, -1);
      uint64_t v29 = v25;
      uint64_t v16 = v44;
      MEMORY[0x1C18779C0](v29, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_1BC9BE398();
    unint64_t v38 = (void *)sub_1BCA489F8();
    int64_t v39 = (void *)swift_allocObject();
    v39[2] = v47;
    v39[3] = a1;
    v39[4] = a2;
    uint64_t v54 = sub_1BCA369E4;
    uint64_t v55 = v39;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v51 = 1107296256;
    uint64_t v52 = sub_1BC9DAA34;
    uint64_t v53 = &block_descriptor_5;
    int64_t v40 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    sub_1BCA48688();
    uint64_t aBlock = MEMORY[0x1E4FBC860];
    sub_1BC9BE4EC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01A50);
    sub_1BC9BE544();
    sub_1BCA48AD8();
    MEMORY[0x1C1876F40](0, v20, v15, v40);
    _Block_release(v40);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    ((void (*)(char *, uint64_t))v49[1].isa)(v20, v16);
  }
}

uint64_t sub_1BCA2DB0C(uint64_t result, uint64_t a2)
{
  if ((*(unsigned char *)(v2 + 24) & 1) == 0)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)(v2 + 48);
    *(void *)(v3 + 48) = result;
    *(void *)(v3 + 56) = a2;
    swift_retain();
    sub_1BC9BD110(v4);
    sub_1BCA2D200(0x6C616974696E49, 0xE700000000000000);
    uint64_t result = *(void *)(v3 + 16);
    uint64_t v5 = *(void *)(result + 16);
    if (v5)
    {
      uint64_t v6 = result + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_1BC9BE1A8(v6, (uint64_t)v13);
        uint64_t v8 = v14;
        uint64_t v7 = v15;
        __swift_project_boxed_opaque_existential_1(v13, v14);
        uint64_t v9 = swift_allocObject();
        swift_weakInit();
        sub_1BC9BE1A8((uint64_t)v13, (uint64_t)v12);
        uint64_t v10 = swift_allocObject();
        *(void *)(v10 + 16) = v9;
        sub_1BC9A9FF0(v12, v10 + 24);
        uint64_t v11 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v7 + 16);
        swift_retain();
        v11(sub_1BCA36930, v10, v8, v7);
        swift_release();
        swift_release();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
        v6 += 40;
        --v5;
      }
      while (v5);
      uint64_t result = swift_bridgeObjectRelease();
    }
    *(unsigned char *)(v3 + 24) = 1;
  }
  return result;
}

uint64_t sub_1BCA2DC98(uint64_t a1, void *a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = a2[3];
    uint64_t v5 = a2[4];
    __swift_project_boxed_opaque_existential_1(a2, v4);
    uint64_t v6 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
    uint64_t v7 = sub_1BCA487E8();
    unint64_t v9 = v8;

    sub_1BCA2D200(v7, v9);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

BOOL static ManagedSettingsStoreError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ManagedSettingsStoreError.hash(into:)()
{
  return sub_1BCA48D68();
}

uint64_t ManagedSettingsStoreError.hashValue.getter()
{
  return sub_1BCA48D88();
}

void static ManagedSettingsStore.Name.default.getter(void *a1@<X8>)
{
  *a1 = 0x746C7561666544;
  a1[1] = 0xE700000000000000;
}

uint64_t ManagedSettingsStore.Name.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

ManagedSettings::ManagedSettingsStore::Name __swiftcall ManagedSettingsStore.Name.init(rawValue:)(ManagedSettings::ManagedSettingsStore::Name rawValue)
{
  ManagedSettings::ManagedSettingsStore::Name *v1 = rawValue;
  return rawValue;
}

void *sub_1BCA2DE30@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_1BCA2DE3C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA2DE48(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_1BCA48CA8();
  }
}

uint64_t sub_1BCA2DE78()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA2DED4()
{
  swift_bridgeObjectRetain();
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA2DF2C()
{
  return sub_1BCA48D88();
}

uint64_t static ManagedSettingsStore.PropertyKeys.active.getter()
{
  return 0x657669746361;
}

uint64_t static ManagedSettingsStore.PropertyKeys.syncToWatch.getter()
{
  return 0x61576F54636E7973;
}

uint64_t ManagedSettingsStore.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  ManagedSettingsStore.init()();
  return v0;
}

void *ManagedSettingsStore.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01F18);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)v1 + OBJC_IVAR____TtC15ManagedSettings20ManagedSettingsStore__effectiveMaximumMovieRating;
  uint64_t v25 = 1000;
  sub_1BCA485E8();
  unint64_t v8 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
  v8(v7, v6, v2);
  unint64_t v9 = (char *)v1 + OBJC_IVAR____TtC15ManagedSettings20ManagedSettingsStore__effectiveMaximumTVShowRating;
  uint64_t v25 = 1000;
  sub_1BCA485E8();
  v8(v9, v6, v2);
  v1[3] = 0x746C7561666544;
  v1[4] = 0xE700000000000000;
  v1[5] = 0;
  v1[6] = 0;
  v1[7] = 0x746C7561666544;
  v1[8] = 0xE700000000000000;
  v1[9] = 0;
  v1[10] = 0;
  v1[11] = 0x746C7561666544;
  v1[12] = 0xE700000000000000;
  v1[13] = 0;
  v1[14] = 0;
  v1[15] = 0x746C7561666544;
  v1[16] = 0xE700000000000000;
  v1[17] = 0;
  v1[18] = 0;
  v1[19] = 0x746C7561666544;
  v1[20] = 0xE700000000000000;
  v1[21] = 0;
  v1[22] = 0;
  v1[23] = 0x746C7561666544;
  v1[24] = 0xE700000000000000;
  v1[25] = 0;
  v1[26] = 0;
  v1[27] = 0x746C7561666544;
  v1[28] = 0xE700000000000000;
  v1[29] = 0;
  v1[30] = 0;
  v1[31] = 0x746C7561666544;
  v1[32] = 0xE700000000000000;
  v1[33] = 0;
  v1[34] = 0;
  v1[35] = 0x746C7561666544;
  v1[36] = 0xE700000000000000;
  v1[37] = 0;
  v1[38] = 0;
  v1[39] = 0x746C7561666544;
  v1[40] = 0xE700000000000000;
  v1[41] = 0;
  v1[42] = 0;
  v1[43] = 0x746C7561666544;
  v1[44] = 0xE700000000000000;
  v1[45] = 0;
  v1[46] = 0;
  v1[47] = 0x746C7561666544;
  v1[48] = 0xE700000000000000;
  v1[49] = 0;
  v1[50] = 0;
  v1[51] = 0x746C7561666544;
  v1[52] = 0xE700000000000000;
  v1[53] = 0;
  v1[54] = 0;
  v1[55] = 0x746C7561666544;
  v1[56] = 0xE700000000000000;
  v1[57] = 0;
  v1[58] = 0;
  v1[59] = 0x746C7561666544;
  v1[60] = 0xE700000000000000;
  v1[61] = 0;
  v1[62] = 0;
  v1[63] = 0x746C7561666544;
  v1[64] = 0xE700000000000000;
  v1[66] = 0;
  v1[65] = 0;
  v1[67] = 0x746C7561666544;
  v1[68] = 0xE700000000000000;
  v1[70] = 0;
  v1[69] = 0;
  v1[71] = 0x746C7561666544;
  v1[72] = 0xE700000000000000;
  v1[74] = 0;
  v1[73] = 0;
  v1[75] = 0x746C7561666544;
  v1[76] = 0xE700000000000000;
  v1[78] = 0;
  v1[77] = 0;
  v1[79] = 0x746C7561666544;
  v1[80] = 0xE700000000000000;
  v1[82] = 0;
  v1[81] = 0;
  v1[83] = 0x746C7561666544;
  v1[84] = 0xE700000000000000;
  v1[86] = 0;
  v1[85] = 0;
  v1[87] = 0x746C7561666544;
  v1[88] = 0xE700000000000000;
  v1[90] = 0;
  v1[89] = 0;
  v1[91] = 0x746C7561666544;
  v1[92] = 0xE700000000000000;
  v1[94] = 0;
  v1[93] = 0;
  v1[95] = 0x746C7561666544;
  v1[96] = 0xE700000000000000;
  v1[98] = 0;
  v1[97] = 0;
  v1[99] = 0x746C7561666544;
  v1[100] = 0xE700000000000000;
  v1[102] = 0;
  v1[101] = 0;
  v1[103] = 0x746C7561666544;
  v1[104] = 0xE700000000000000;
  v1[106] = 0;
  v1[105] = 0;
  v1[107] = 0x746C7561666544;
  v1[108] = 0xE700000000000000;
  v1[110] = 0;
  v1[109] = 0;
  v1[111] = 0x746C7561666544;
  v1[112] = 0xE700000000000000;
  v1[114] = 0;
  v1[113] = 0;
  v1[115] = 0x746C7561666544;
  v1[116] = 0xE700000000000000;
  v1[118] = 0;
  v1[117] = 0;
  v1[119] = 0x746C7561666544;
  v1[120] = 0xE700000000000000;
  v1[122] = 0;
  v1[121] = 0;
  v1[123] = 0x746C7561666544;
  v1[124] = 0xE700000000000000;
  v1[126] = 0;
  v1[125] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA019C8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1BCA49730;
  if (qword_1EBA01A68 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)qword_1EBA01A60;
  uint64_t v12 = type metadata accessor for DarwinNotificationReceiver();
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 24) = -1;
  *(void *)(v13 + 16) = v11;
  *(void *)(v10 + 56) = v12;
  *(void *)(v10 + 64) = &off_1F16F0B70;
  *(void *)(v10 + 32) = v13;
  uint64_t v14 = type metadata accessor for NotificationCenterReceiver();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v11;
  *(void *)(v15 + 24) = 0;
  *(void *)(v10 + 96) = v14;
  *(void *)(v10 + 104) = &off_1F16F0B90;
  *(void *)(v10 + 72) = v15;
  uint64_t v16 = qword_1EBA01E50;
  id v17 = v11;
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_1EBA01E48;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_1BCA36A4C;
  *(void *)(v19 + 24) = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01F10);
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 24) = 0;
  *(void *)(v20 + 48) = 0;
  *(void *)(v20 + 56) = 0;
  *(void *)(v20 + 16) = v10;
  *(void *)(v20 + 32) = sub_1BCA2E570;
  *(void *)(v20 + 40) = v19;
  v1[2] = v20;
  uint64_t v21 = swift_allocObject();
  swift_weakInit();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_1BCA2ECE4;
  *(void *)(v22 + 24) = v21;
  swift_retain();
  sub_1BCA2DB0C((uint64_t)sub_1BCA2ECEC, v22);
  swift_release();
  return v1;
}

uint64_t sub_1BCA2E4A4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t (*)(uint64_t a1, uint64_t a2, char a3), uint64_t))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  swift_retain();
  a3(sub_1BCA36A08, v6);

  return swift_release();
}

uint64_t sub_1BCA2E538()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1BCA2E570(uint64_t a1, uint64_t a2)
{
  return sub_1BCA2E4A4(a1, a2, *(void (**)(uint64_t (*)(uint64_t, uint64_t, char), uint64_t))(v2 + 16));
}

void *ManagedSettingsStore.__allocating_init(named:)(uint64_t *a1)
{
  uint64_t v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  type metadata accessor for ManagedSettingsStore();
  v3[2] = 0;
  v3[3] = 0;
  swift_allocObject();
  return sub_1BCA2E678(v3);
}

void *ManagedSettingsStore.__allocating_init(sharedContainer:)(uint64_t a1, uint64_t a2)
{
  v3[0] = 0x746C7561666544;
  v3[1] = 0xE700000000000000;
  v3[2] = a1;
  v3[3] = a2;
  type metadata accessor for ManagedSettingsStore();
  swift_allocObject();
  return sub_1BCA2E678(v3);
}

void *ManagedSettingsStore.__allocating_init(named:sharedContainer:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1[1];
  v5[0] = *a1;
  v5[1] = v3;
  v5[2] = a2;
  v5[3] = a3;
  type metadata accessor for ManagedSettingsStore();
  swift_allocObject();
  return sub_1BCA2E678(v5);
}

void *sub_1BCA2E678(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01F18);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  unint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  uint64_t v9 = a1[1];
  uint64_t v12 = a1[2];
  uint64_t v11 = a1[3];
  uint64_t v13 = (char *)v2 + OBJC_IVAR____TtC15ManagedSettings20ManagedSettingsStore__effectiveMaximumMovieRating;
  uint64_t v32 = 1000;
  sub_1BCA485E8();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v14(v13, v8, v4);
  uint64_t v15 = (char *)v2 + OBJC_IVAR____TtC15ManagedSettings20ManagedSettingsStore__effectiveMaximumTVShowRating;
  uint64_t v32 = 1000;
  sub_1BCA485E8();
  v14(v15, v8, v4);
  v2[3] = v10;
  v2[4] = v9;
  v2[5] = v12;
  v2[6] = v11;
  v2[7] = v10;
  v2[8] = v9;
  v2[9] = v12;
  v2[10] = v11;
  v2[11] = v10;
  v2[12] = v9;
  v2[13] = v12;
  v2[14] = v11;
  v2[15] = v10;
  v2[16] = v9;
  v2[17] = v12;
  v2[18] = v11;
  v2[19] = v10;
  v2[20] = v9;
  v2[21] = v12;
  v2[22] = v11;
  v2[23] = v10;
  v2[24] = v9;
  v2[25] = v12;
  v2[26] = v11;
  v2[27] = v10;
  v2[28] = v9;
  v2[29] = v12;
  v2[30] = v11;
  v2[31] = v10;
  v2[32] = v9;
  v2[33] = v12;
  v2[34] = v11;
  v2[35] = v10;
  v2[36] = v9;
  v2[37] = v12;
  v2[38] = v11;
  v2[39] = v10;
  v2[40] = v9;
  v2[41] = v12;
  v2[42] = v11;
  v2[43] = v10;
  v2[44] = v9;
  v2[45] = v12;
  v2[46] = v11;
  v2[47] = v10;
  v2[48] = v9;
  v2[49] = v12;
  v2[50] = v11;
  v2[51] = v10;
  v2[52] = v9;
  v2[53] = v12;
  v2[54] = v11;
  v2[55] = v10;
  v2[56] = v9;
  v2[57] = v12;
  v2[58] = v11;
  v2[59] = v10;
  v2[60] = v9;
  v2[61] = v12;
  v2[62] = v11;
  v2[63] = v10;
  v2[64] = v9;
  v2[65] = v12;
  v2[66] = v11;
  v2[67] = v10;
  v2[68] = v9;
  v2[69] = v12;
  v2[70] = v11;
  v2[71] = v10;
  v2[72] = v9;
  v2[73] = v12;
  v2[74] = v11;
  v2[75] = v10;
  v2[76] = v9;
  v2[77] = v12;
  v2[78] = v11;
  v2[79] = v10;
  v2[80] = v9;
  v2[81] = v12;
  v2[82] = v11;
  v2[83] = v10;
  v2[84] = v9;
  v2[85] = v12;
  v2[86] = v11;
  v2[87] = v10;
  v2[88] = v9;
  v2[89] = v12;
  v2[90] = v11;
  v2[91] = v10;
  v2[92] = v9;
  v2[93] = v12;
  v2[94] = v11;
  v2[95] = v10;
  v2[96] = v9;
  v2[97] = v12;
  v2[98] = v11;
  v2[99] = v10;
  v2[100] = v9;
  v2[101] = v12;
  v2[102] = v11;
  v2[103] = v10;
  v2[104] = v9;
  v2[105] = v12;
  v2[106] = v11;
  v2[107] = v10;
  v2[108] = v9;
  v2[109] = v12;
  v2[110] = v11;
  v2[111] = v10;
  v2[112] = v9;
  v2[113] = v12;
  v2[114] = v11;
  v2[115] = v10;
  v2[116] = v9;
  v2[117] = v12;
  v2[118] = v11;
  v2[119] = v10;
  v2[120] = v9;
  v2[121] = v12;
  v2[122] = v11;
  v2[123] = v10;
  v2[124] = v9;
  v2[125] = v12;
  v2[126] = v11;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA019C8);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1BCA49730;
  uint64_t v17 = qword_1EBA01A68;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  if (v17 != -1) {
    swift_once();
  }
  uint64_t v18 = (void *)qword_1EBA01A60;
  uint64_t v19 = type metadata accessor for DarwinNotificationReceiver();
  uint64_t v20 = swift_allocObject();
  *(_DWORD *)(v20 + 24) = -1;
  *(void *)(v20 + 16) = v18;
  *(void *)(v16 + 56) = v19;
  *(void *)(v16 + 64) = &off_1F16F0B70;
  *(void *)(v16 + 32) = v20;
  uint64_t v21 = type metadata accessor for NotificationCenterReceiver();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v18;
  *(void *)(v22 + 24) = 0;
  *(void *)(v16 + 96) = v21;
  *(void *)(v16 + 104) = &off_1F16F0B90;
  *(void *)(v16 + 72) = v22;
  uint64_t v23 = qword_1EBA01E50;
  id v24 = v18;
  if (v23 != -1) {
    swift_once();
  }
  uint64_t v25 = qword_1EBA01E48;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_1BCA368B4;
  *(void *)(v26 + 24) = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01F10);
  uint64_t v27 = swift_allocObject();
  *(unsigned char *)(v27 + 24) = 0;
  *(void *)(v27 + 48) = 0;
  *(void *)(v27 + 56) = 0;
  *(void *)(v27 + 16) = v16;
  *(void *)(v27 + 32) = sub_1BCA36A64;
  *(void *)(v27 + 40) = v26;
  v2[2] = v27;
  uint64_t v28 = swift_allocObject();
  swift_weakInit();
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = sub_1BCA2ECE4;
  *(void *)(v29 + 24) = v28;
  swift_retain();
  sub_1BCA2DB0C((uint64_t)sub_1BCA36A68, v29);
  swift_release();
  return v2;
}

uint64_t sub_1BCA2EB60(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1BCA48618();
    swift_release();
    swift_release();
    if (v5 != a1)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v5 = a1;
      swift_retain();
      sub_1BCA48628();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1BCA48618();
    swift_release();
    swift_release();
    if (v5 == a2)
    {
      return swift_release();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      return sub_1BCA48628();
    }
  }
  return result;
}

uint64_t sub_1BCA2ECE4(uint64_t a1, uint64_t a2)
{
  return sub_1BCA2EB60(a1, a2);
}

uint64_t sub_1BCA2ECEC(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t type metadata accessor for ManagedSettingsStore()
{
  uint64_t result = qword_1EBA02850;
  if (!qword_1EBA02850) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ManagedSettingsStore.deinit()
{
  uint64_t v1 = v0;
  sub_1BC9BE078();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = v0 + OBJC_IVAR____TtC15ManagedSettings20ManagedSettingsStore__effectiveMaximumMovieRating;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01F18);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
  v4(v1 + OBJC_IVAR____TtC15ManagedSettings20ManagedSettingsStore__effectiveMaximumTVShowRating, v3);
  return v1;
}

uint64_t ManagedSettingsStore.__deallocating_deinit()
{
  ManagedSettingsStore.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t sub_1BCA2F0D8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v1 - 8, v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = off_1E9FABF10;
  if (off_1E9FABF10)
  {
    uint64_t v7 = v0[3];
    uint64_t v6 = v0[4];
    if (v0[6])
    {
      uint64_t v8 = v0[5];
      uint64_t v9 = v0[6];
    }
    else
    {
      uint64_t v8 = *((void *)off_1E9FABF10 + 2);
      uint64_t v9 = *((void *)off_1E9FABF10 + 3);
      swift_bridgeObjectRetain();
    }
    uint64_t v11 = (void *)*((void *)v5 + 5);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    objc_msgSend(v11, sel_lock);
    swift_beginAccess();
    uint64_t v12 = *((void *)v5 + 4);
    if (*(void *)(v12 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v13 = sub_1BC9A69D0(v8, v9);
      if (v14)
      {
        unint64_t v15 = v13;
        uint64_t v31 = v6;
        uint64_t v16 = v7;
        uint64_t v17 = *(void *)(v12 + 56);
        uint64_t v18 = sub_1BCA484B8();
        uint64_t v19 = *(void *)(v18 - 8);
        uint64_t v30 = v8;
        uint64_t v20 = v19;
        uint64_t v21 = v17 + *(void *)(v19 + 72) * v15;
        uint64_t v7 = v16;
        uint64_t v6 = v31;
        (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v4, v21, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v4, 0, 1, v18);
        uint64_t v8 = v30;
      }
      else
      {
        uint64_t v23 = sub_1BCA484B8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v4, 1, 1, v23);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v22 = sub_1BCA484B8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v4, 1, 1, v22);
    }
    objc_msgSend(*((id *)v5 + 5), sel_unlock);
    if (qword_1EBA01E50 != -1) {
      swift_once();
    }
    unint64_t v24 = sub_1BC9ECEC4((uint64_t)v4, v8, v9, v7, v6);
    swift_bridgeObjectRelease();
    sub_1BC9A3A70((uint64_t)v4, &qword_1E9FABE30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    if (*(void *)(v24 + 16) && (unint64_t v25 = sub_1BC9A69D0(0x657669746361, 0xE600000000000000), (v26 & 1) != 0))
    {
      uint64_t v10 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
      id v27 = v10;
    }
    else
    {
      uint64_t v10 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  char v28 = _sSb15ManagedSettingsE5value4fromSbSgSo8NSObjectCSg_tFZ_0(v10);

  return (v28 == 2) | v28 & 1u;
}

uint64_t sub_1BCA2F4A0(char a1)
{
  return sub_1BCA2F90C(a1, 0x657669746361, 0xE600000000000000);
}

uint64_t (*sub_1BCA2F4B4(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = sub_1BCA2F0D8() & 1;
  return sub_1BCA2F500;
}

uint64_t sub_1BCA2F500(uint64_t a1)
{
  return sub_1BCA2F4A0(*(unsigned char *)(a1 + 8));
}

uint64_t sub_1BCA2F528()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v1 - 8, v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = off_1E9FABF10;
  if (off_1E9FABF10)
  {
    uint64_t v7 = v0[3];
    uint64_t v6 = v0[4];
    if (v0[6])
    {
      uint64_t v8 = v0[5];
      uint64_t v9 = v0[6];
    }
    else
    {
      uint64_t v8 = *((void *)off_1E9FABF10 + 2);
      uint64_t v9 = *((void *)off_1E9FABF10 + 3);
      swift_bridgeObjectRetain();
    }
    uint64_t v11 = (void *)*((void *)v5 + 5);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    objc_msgSend(v11, sel_lock);
    swift_beginAccess();
    uint64_t v12 = *((void *)v5 + 4);
    if (*(void *)(v12 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v13 = sub_1BC9A69D0(v8, v9);
      if (v14)
      {
        unint64_t v15 = v13;
        uint64_t v31 = v6;
        uint64_t v16 = v7;
        uint64_t v17 = *(void *)(v12 + 56);
        uint64_t v18 = sub_1BCA484B8();
        uint64_t v19 = *(void *)(v18 - 8);
        uint64_t v30 = v8;
        uint64_t v20 = v19;
        uint64_t v21 = v17 + *(void *)(v19 + 72) * v15;
        uint64_t v7 = v16;
        uint64_t v6 = v31;
        (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v4, v21, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v4, 0, 1, v18);
        uint64_t v8 = v30;
      }
      else
      {
        uint64_t v23 = sub_1BCA484B8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v4, 1, 1, v23);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v22 = sub_1BCA484B8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v4, 1, 1, v22);
    }
    objc_msgSend(*((id *)v5 + 5), sel_unlock);
    if (qword_1EBA01E50 != -1) {
      swift_once();
    }
    unint64_t v24 = sub_1BC9ECEC4((uint64_t)v4, v8, v9, v7, v6);
    swift_bridgeObjectRelease();
    sub_1BC9A3A70((uint64_t)v4, &qword_1E9FABE30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    if (*(void *)(v24 + 16) && (unint64_t v25 = sub_1BC9A69D0(0x61576F54636E7973, 0xEB00000000686374), (v26 & 1) != 0))
    {
      uint64_t v10 = *(void **)(*(void *)(v24 + 56) + 8 * v25);
      id v27 = v10;
    }
    else
    {
      uint64_t v10 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  char v28 = _sSb15ManagedSettingsE5value4fromSbSgSo8NSObjectCSg_tFZ_0(v10);

  return v28 & 1;
}

uint64_t sub_1BCA2F8EC(char a1)
{
  return sub_1BCA2F90C(a1, 0x61576F54636E7973, 0xEB00000000686374);
}

uint64_t sub_1BCA2F90C(char a1, uint64_t a2, uint64_t a3)
{
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  if (off_1E9FABF10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE378);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1BCA49BE0;
    *(void *)(inited + 32) = a2;
    *(void *)(inited + 40) = a3;
    id v9 = objc_allocWithZone(NSNumber);
    swift_retain();
    *(void *)(inited + 48) = objc_msgSend(v9, sel_initWithBool_, a1 & 1);
    unint64_t v10 = sub_1BC9A414C(inited);
    uint64_t v11 = v3[4];
    uint64_t v12 = v3[5];
    uint64_t v13 = v3[6];
    v14[0] = v3[3];
    v14[1] = v11;
    v14[2] = v12;
    v14[3] = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BC9A5944(v10, v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*sub_1BCA2FA54(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  *(unsigned char *)(a1 + 8) = sub_1BCA2F528() & 1;
  return sub_1BCA2FAA0;
}

uint64_t sub_1BCA2FAA0(uint64_t a1)
{
  return sub_1BCA2F8EC(*(unsigned char *)(a1 + 8));
}

uint64_t sub_1BCA2FAC8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[8];
  uint64_t v6 = v3[9];
  uint64_t v5 = v3[10];
  *a2 = v3[7];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA2FB2C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[7] = v3;
  v6[8] = v2;
  v6[9] = v5;
  v6[10] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA2FBB8@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[8];
  uint64_t v5 = v1[9];
  uint64_t v4 = v1[10];
  *a1 = v1[7];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA2FC18(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 56) = v5;
  *(void *)(v1 + 72) = v2;
  *(void *)(v1 + 80) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA2FC84())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA2FCD8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[12];
  uint64_t v6 = v3[13];
  uint64_t v5 = v3[14];
  *a2 = v3[11];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA2FD3C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[11] = v3;
  v6[12] = v2;
  v6[13] = v5;
  v6[14] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA2FDC8@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[12];
  uint64_t v5 = v1[13];
  uint64_t v4 = v1[14];
  *a1 = v1[11];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA2FE28(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 88) = v5;
  *(void *)(v1 + 104) = v2;
  *(void *)(v1 + 112) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA2FE94())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA2FEE8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[16];
  uint64_t v6 = v3[17];
  uint64_t v5 = v3[18];
  *a2 = v3[15];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA2FF4C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[15] = v3;
  v6[16] = v2;
  v6[17] = v5;
  v6[18] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA2FFD8@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[16];
  uint64_t v5 = v1[17];
  uint64_t v4 = v1[18];
  *a1 = v1[15];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA30038(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 120) = v5;
  *(void *)(v1 + 136) = v2;
  *(void *)(v1 + 144) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA300A4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA300F8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[20];
  uint64_t v6 = v3[21];
  uint64_t v5 = v3[22];
  *a2 = v3[19];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA3015C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[19] = v3;
  v6[20] = v2;
  v6[21] = v5;
  v6[22] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA301E8@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[20];
  uint64_t v5 = v1[21];
  uint64_t v4 = v1[22];
  *a1 = v1[19];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA30248(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 152) = v5;
  *(void *)(v1 + 168) = v2;
  *(void *)(v1 + 176) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA302B4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA30308@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[24];
  uint64_t v6 = v3[25];
  uint64_t v5 = v3[26];
  *a2 = v3[23];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA3036C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[23] = v3;
  v6[24] = v2;
  v6[25] = v5;
  v6[26] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA303F8@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[24];
  uint64_t v5 = v1[25];
  uint64_t v4 = v1[26];
  *a1 = v1[23];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA30458(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 184) = v5;
  *(void *)(v1 + 200) = v2;
  *(void *)(v1 + 208) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA304C4())()
{
  return j__swift_endAccess;
}

uint64_t sub_1BCA30518@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[28];
  uint64_t v6 = v3[29];
  uint64_t v5 = v3[30];
  *a2 = v3[27];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA3057C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[27] = v3;
  v6[28] = v2;
  v6[29] = v5;
  v6[30] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA30608@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[28];
  uint64_t v5 = v1[29];
  uint64_t v4 = v1[30];
  *a1 = v1[27];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA30668(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 216) = v5;
  *(void *)(v1 + 232) = v2;
  *(void *)(v1 + 240) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA306D4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA30728@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[32];
  uint64_t v6 = v3[33];
  uint64_t v5 = v3[34];
  *a2 = v3[31];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA3078C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[31] = v3;
  v6[32] = v2;
  v6[33] = v5;
  v6[34] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA30818@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[32];
  uint64_t v5 = v1[33];
  uint64_t v4 = v1[34];
  *a1 = v1[31];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA30878(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 248) = v5;
  *(void *)(v1 + 264) = v2;
  *(void *)(v1 + 272) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA308E4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA30938@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[36];
  uint64_t v6 = v3[37];
  uint64_t v5 = v3[38];
  *a2 = v3[35];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA3099C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[35] = v3;
  v6[36] = v2;
  v6[37] = v5;
  v6[38] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA30A28@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[36];
  uint64_t v5 = v1[37];
  uint64_t v4 = v1[38];
  *a1 = v1[35];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA30A88(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 280) = v5;
  *(void *)(v1 + 296) = v2;
  *(void *)(v1 + 304) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA30B00())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA30B54@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[40];
  uint64_t v6 = v3[41];
  uint64_t v5 = v3[42];
  *a2 = v3[39];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA30BB8(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[39] = v3;
  v6[40] = v2;
  v6[41] = v5;
  v6[42] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA30C44@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[40];
  uint64_t v5 = v1[41];
  uint64_t v4 = v1[42];
  *a1 = v1[39];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA30CA4(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 312) = v5;
  *(void *)(v1 + 328) = v2;
  *(void *)(v1 + 336) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA30D1C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA30D70@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[44];
  uint64_t v6 = v3[45];
  uint64_t v5 = v3[46];
  *a2 = v3[43];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA30DD4(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[43] = v3;
  v6[44] = v2;
  v6[45] = v5;
  v6[46] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA30E60@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[44];
  uint64_t v5 = v1[45];
  uint64_t v4 = v1[46];
  *a1 = v1[43];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA30EC0(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 344) = v5;
  *(void *)(v1 + 360) = v2;
  *(void *)(v1 + 368) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA30F38())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA30F8C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[48];
  uint64_t v6 = v3[49];
  uint64_t v5 = v3[50];
  *a2 = v3[47];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA30FF0(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[47] = v3;
  v6[48] = v2;
  v6[49] = v5;
  v6[50] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA3107C@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[48];
  uint64_t v5 = v1[49];
  uint64_t v4 = v1[50];
  *a1 = v1[47];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA310DC(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 376) = v5;
  *(void *)(v1 + 392) = v2;
  *(void *)(v1 + 400) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA31154())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA311A8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[52];
  uint64_t v6 = v3[53];
  uint64_t v5 = v3[54];
  *a2 = v3[51];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA3120C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[51] = v3;
  v6[52] = v2;
  v6[53] = v5;
  v6[54] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA31298@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[52];
  uint64_t v5 = v1[53];
  uint64_t v4 = v1[54];
  *a1 = v1[51];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA312F8(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 408) = v5;
  *(void *)(v1 + 424) = v2;
  *(void *)(v1 + 432) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA31370())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA313C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[56];
  uint64_t v6 = v3[57];
  uint64_t v5 = v3[58];
  *a2 = v3[55];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA31428(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[55] = v3;
  v6[56] = v2;
  v6[57] = v5;
  v6[58] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA314B4@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[56];
  uint64_t v5 = v1[57];
  uint64_t v4 = v1[58];
  *a1 = v1[55];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA31514(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 440) = v5;
  *(void *)(v1 + 456) = v2;
  *(void *)(v1 + 464) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA3158C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA315E0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[60];
  uint64_t v6 = v3[61];
  uint64_t v5 = v3[62];
  *a2 = v3[59];
  a2[1] = v4;
  a2[2] = v6;
  a2[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA31644(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[59] = v3;
  v6[60] = v2;
  v6[61] = v5;
  v6[62] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA316D0@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[60];
  uint64_t v5 = v1[61];
  uint64_t v4 = v1[62];
  *a1 = v1[59];
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA31730(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 472) = v5;
  *(void *)(v1 + 488) = v2;
  *(void *)(v1 + 496) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA317A8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA317FC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[64];
  uint64_t v5 = v3[65];
  uint64_t v6 = v3[66];
  *a2 = v3[63];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA31864(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[63] = v3;
  v6[64] = v2;
  v6[65] = v5;
  v6[66] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA318F4@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[64];
  uint64_t v4 = v1[65];
  uint64_t v5 = v1[66];
  *a1 = v1[63];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA31958(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 504) = v5;
  *(void *)(v1 + 520) = v2;
  *(void *)(v1 + 528) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA319D4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA31A28@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[68];
  uint64_t v5 = v3[69];
  uint64_t v6 = v3[70];
  *a2 = v3[67];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA31A94(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[67] = v3;
  v6[68] = v2;
  v6[69] = v5;
  v6[70] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA31B28@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[68];
  uint64_t v4 = v1[69];
  uint64_t v5 = v1[70];
  *a1 = v1[67];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA31B90(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 536) = v5;
  *(void *)(v1 + 552) = v2;
  *(void *)(v1 + 560) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA31C0C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA31C60@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[72];
  uint64_t v5 = v3[73];
  uint64_t v6 = v3[74];
  *a2 = v3[71];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA31CCC(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[71] = v3;
  v6[72] = v2;
  v6[73] = v5;
  v6[74] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA31D60@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[72];
  uint64_t v4 = v1[73];
  uint64_t v5 = v1[74];
  *a1 = v1[71];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA31DC8(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 568) = v5;
  *(void *)(v1 + 584) = v2;
  *(void *)(v1 + 592) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA31E44())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA31E98@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[76];
  uint64_t v5 = v3[77];
  uint64_t v6 = v3[78];
  *a2 = v3[75];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA31F04(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[75] = v3;
  v6[76] = v2;
  v6[77] = v5;
  v6[78] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA31F98@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[76];
  uint64_t v4 = v1[77];
  uint64_t v5 = v1[78];
  *a1 = v1[75];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA32000(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 600) = v5;
  *(void *)(v1 + 616) = v2;
  *(void *)(v1 + 624) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA3207C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA320D0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[80];
  uint64_t v5 = v3[81];
  uint64_t v6 = v3[82];
  *a2 = v3[79];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA3213C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[79] = v3;
  v6[80] = v2;
  v6[81] = v5;
  v6[82] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA321D0@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[80];
  uint64_t v4 = v1[81];
  uint64_t v5 = v1[82];
  *a1 = v1[79];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA32238(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 632) = v5;
  *(void *)(v1 + 648) = v2;
  *(void *)(v1 + 656) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA322B4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA32308@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[84];
  uint64_t v5 = v3[85];
  uint64_t v6 = v3[86];
  *a2 = v3[83];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA32374(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[83] = v3;
  v6[84] = v2;
  v6[85] = v5;
  v6[86] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA32408@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[84];
  uint64_t v4 = v1[85];
  uint64_t v5 = v1[86];
  *a1 = v1[83];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA32470(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 664) = v5;
  *(void *)(v1 + 680) = v2;
  *(void *)(v1 + 688) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA324EC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA32540@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[88];
  uint64_t v5 = v3[89];
  uint64_t v6 = v3[90];
  *a2 = v3[87];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA325AC(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[87] = v3;
  v6[88] = v2;
  v6[89] = v5;
  v6[90] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA32640@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[88];
  uint64_t v4 = v1[89];
  uint64_t v5 = v1[90];
  *a1 = v1[87];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA326A8(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 696) = v5;
  *(void *)(v1 + 712) = v2;
  *(void *)(v1 + 720) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA32724())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA32778@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[92];
  uint64_t v5 = v3[93];
  uint64_t v6 = v3[94];
  *a2 = v3[91];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA327E4(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[91] = v3;
  v6[92] = v2;
  v6[93] = v5;
  v6[94] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA32878@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[92];
  uint64_t v4 = v1[93];
  uint64_t v5 = v1[94];
  *a1 = v1[91];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA328E0(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 728) = v5;
  *(void *)(v1 + 744) = v2;
  *(void *)(v1 + 752) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA3295C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA329B0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[96];
  uint64_t v5 = v3[97];
  uint64_t v6 = v3[98];
  *a2 = v3[95];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA32A1C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[95] = v3;
  v6[96] = v2;
  v6[97] = v5;
  v6[98] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA32AB0@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[96];
  uint64_t v4 = v1[97];
  uint64_t v5 = v1[98];
  *a1 = v1[95];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA32B18(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 760) = v5;
  *(void *)(v1 + 776) = v2;
  *(void *)(v1 + 784) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA32B94())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA32BE8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[100];
  uint64_t v5 = v3[101];
  uint64_t v6 = v3[102];
  *a2 = v3[99];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA32C54(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[99] = v3;
  v6[100] = v2;
  v6[101] = v5;
  v6[102] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA32CE8@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[100];
  uint64_t v4 = v1[101];
  uint64_t v5 = v1[102];
  *a1 = v1[99];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA32D50(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 792) = v5;
  *(void *)(v1 + 808) = v2;
  *(void *)(v1 + 816) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA32DCC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA32E20@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[104];
  uint64_t v5 = v3[105];
  uint64_t v6 = v3[106];
  *a2 = v3[103];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA32E8C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[103] = v3;
  v6[104] = v2;
  v6[105] = v5;
  v6[106] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA32F20@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[104];
  uint64_t v4 = v1[105];
  uint64_t v5 = v1[106];
  *a1 = v1[103];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA32F88(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 824) = v5;
  *(void *)(v1 + 840) = v2;
  *(void *)(v1 + 848) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA33004())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA33058@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[108];
  uint64_t v5 = v3[109];
  uint64_t v6 = v3[110];
  *a2 = v3[107];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA330C4(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[107] = v3;
  v6[108] = v2;
  v6[109] = v5;
  v6[110] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA33158@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[108];
  uint64_t v4 = v1[109];
  uint64_t v5 = v1[110];
  *a1 = v1[107];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA331C0(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 856) = v5;
  *(void *)(v1 + 872) = v2;
  *(void *)(v1 + 880) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA3323C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA33290@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[112];
  uint64_t v5 = v3[113];
  uint64_t v6 = v3[114];
  *a2 = v3[111];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA332FC(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[111] = v3;
  v6[112] = v2;
  v6[113] = v5;
  v6[114] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA33390@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[112];
  uint64_t v4 = v1[113];
  uint64_t v5 = v1[114];
  *a1 = v1[111];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA333F8(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 888) = v5;
  *(void *)(v1 + 904) = v2;
  *(void *)(v1 + 912) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA33474())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA334C8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[116];
  uint64_t v5 = v3[117];
  uint64_t v6 = v3[118];
  *a2 = v3[115];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA33534(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[115] = v3;
  v6[116] = v2;
  v6[117] = v5;
  v6[118] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA335C8@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[116];
  uint64_t v4 = v1[117];
  uint64_t v5 = v1[118];
  *a1 = v1[115];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA33630(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 920) = v5;
  *(void *)(v1 + 936) = v2;
  *(void *)(v1 + 944) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA336AC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA33700@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[120];
  uint64_t v5 = v3[121];
  uint64_t v6 = v3[122];
  *a2 = v3[119];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA3376C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[119] = v3;
  v6[120] = v2;
  v6[121] = v5;
  v6[122] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA33800@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[120];
  uint64_t v4 = v1[121];
  uint64_t v5 = v1[122];
  *a1 = v1[119];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA33868(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 952) = v5;
  *(void *)(v1 + 968) = v2;
  *(void *)(v1 + 976) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA338E4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA33938@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)*a1;
  swift_beginAccess();
  uint64_t v4 = v3[124];
  uint64_t v5 = v3[125];
  uint64_t v6 = v3[126];
  *a2 = v3[123];
  a2[1] = v4;
  a2[2] = v5;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA339A4(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = (void *)*a2;
  swift_beginAccess();
  v6[123] = v3;
  v6[124] = v2;
  v6[125] = v5;
  v6[126] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA33A38@<X0>(void *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = v1[124];
  uint64_t v4 = v1[125];
  uint64_t v5 = v1[126];
  *a1 = v1[123];
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA33AA0(long long *a1)
{
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  swift_beginAccess();
  *(_OWORD *)(v1 + 984) = v5;
  *(void *)(v1 + 1000) = v2;
  *(void *)(v1 + 1008) = v3;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1BCA33B1C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1BCA33B70()
{
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v2 = v0[4];
    uint64_t v3 = v0[5];
    uint64_t v4 = v0[6];
    v5[0] = v0[3];
    v5[1] = v2;
    v5[2] = v3;
    v5[3] = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_1BC9A5080(v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_1BCA33C3C()
{
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  if (off_1E9FABF10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE380);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1BCA49BE0;
    uint64_t v3 = v0[4];
    *(void *)(inited + 32) = v0[3];
    *(void *)(inited + 40) = v3;
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1BCA34D84(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    sub_1BC9A5424(v4, v0[5], v0[6]);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t static ManagedSettingsStore.delete(stores:)(uint64_t a1)
{
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  uint64_t result = swift_beginAccess();
  if (off_1E9FABF10)
  {
    swift_retain();
    sub_1BC9A5424(a1, 0, 0);
    return swift_release();
  }
  return result;
}

uint64_t static ManagedSettingsStore.delete(stores:for:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(result + 16))
  {
    uint64_t v5 = result;
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    uint64_t result = swift_beginAccess();
    if (off_1E9FABF10)
    {
      swift_retain();
      sub_1BC9A5424(v5, a2, a3);
      return swift_release();
    }
  }
  return result;
}

uint64_t static ManagedSettingsStore.stores.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v0 - 8, v1);
  uint64_t v3 = &v19[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v4 = off_1E9FABF10;
  if (!off_1E9FABF10) {
    return MEMORY[0x1E4FBC870];
  }
  uint64_t v6 = *((void *)off_1E9FABF10 + 2);
  uint64_t v5 = *((void *)off_1E9FABF10 + 3);
  uint64_t v7 = (void *)*((void *)off_1E9FABF10 + 5);
  swift_retain();
  swift_bridgeObjectRetain();
  objc_msgSend(v7, sel_lock);
  swift_beginAccess();
  uint64_t v8 = *((void *)v4 + 4);
  if (*(void *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_1BC9A69D0(v6, v5);
    if (v10)
    {
      unint64_t v11 = v9;
      uint64_t v12 = *(void *)(v8 + 56);
      uint64_t v13 = sub_1BCA484B8();
      uint64_t v14 = *(void *)(v13 - 8);
      (*(void (**)(unsigned char *, unint64_t, uint64_t))(v14 + 16))(v3, v12 + *(void *)(v14 + 72) * v11, v13);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v3, 0, 1, v13);
    }
    else
    {
      uint64_t v17 = sub_1BCA484B8();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v3, 1, 1, v17);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = sub_1BCA484B8();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v3, 1, 1, v16);
  }
  objc_msgSend(*((id *)v4 + 5), sel_unlock);
  if (qword_1EBA01E50 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1BC9EF1F4((uint64_t)v3, v6, v5);
  swift_bridgeObjectRelease();
  sub_1BC9A3A70((uint64_t)v3, &qword_1E9FABE30);
  swift_release();
  return v15;
}

uint64_t static ManagedSettingsStore.stores(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v8 = off_1E9FABF10;
  if (!off_1E9FABF10) {
    return MEMORY[0x1E4FBC870];
  }
  if (a2)
  {
    uint64_t v9 = a2;
  }
  else
  {
    a1 = *((void *)off_1E9FABF10 + 2);
    uint64_t v9 = *((void *)off_1E9FABF10 + 3);
    swift_bridgeObjectRetain();
  }
  unint64_t v11 = (void *)*((void *)v8 + 5);
  swift_retain();
  swift_bridgeObjectRetain();
  objc_msgSend(v11, sel_lock);
  swift_beginAccess();
  uint64_t v12 = *((void *)v8 + 4);
  if (*(void *)(v12 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_1BC9A69D0(a1, v9);
    if (v14)
    {
      unint64_t v15 = v13;
      uint64_t v16 = *(void *)(v12 + 56);
      uint64_t v17 = sub_1BCA484B8();
      uint64_t v18 = *(void *)(v17 - 8);
      (*(void (**)(unsigned char *, unint64_t, uint64_t))(v18 + 16))(v7, v16 + *(void *)(v18 + 72) * v15, v17);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v18 + 56))(v7, 0, 1, v17);
    }
    else
    {
      uint64_t v20 = sub_1BCA484B8();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v7, 1, 1, v20);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = sub_1BCA484B8();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v7, 1, 1, v19);
  }
  objc_msgSend(*((id *)v8 + 5), sel_unlock);
  if (qword_1EBA01E50 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1BC9EF1F4((uint64_t)v7, a1, v9);
  swift_bridgeObjectRelease();
  sub_1BC9A3A70((uint64_t)v7, &qword_1E9FABE30);
  swift_release();
  return v10;
}

uint64_t sub_1BCA344E8@<X0>(void *a1@<X8>)
{
  return sub_1BCA34544(a1);
}

uint64_t sub_1BCA344FC()
{
  return sub_1BCA345D4();
}

uint64_t sub_1BCA34510()
{
  return sub_1BCA34658();
}

uint64_t sub_1BCA34524()
{
  return sub_1BCA348B0();
}

uint64_t sub_1BCA34530@<X0>(void *a1@<X8>)
{
  return sub_1BCA34544(a1);
}

uint64_t sub_1BCA34544@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1BCA48618();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1BCA345C0()
{
  return sub_1BCA345D4();
}

uint64_t sub_1BCA345D4()
{
  return sub_1BCA48628();
}

uint64_t sub_1BCA34644()
{
  return sub_1BCA34658();
}

uint64_t sub_1BCA34658()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1BCA48618();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1BCA346C4()
{
  return swift_endAccess();
}

uint64_t sub_1BCA34728(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE3A8);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v2, v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5, v8);
  uint64_t v10 = (char *)&v13 - v9;
  unint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v11((char *)&v13 - v9, a1, v2);
  v11(v7, (uint64_t)v10, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01F18);
  sub_1BCA48608();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v10, v2);
}

uint64_t sub_1BCA348A4()
{
  return sub_1BCA348B0();
}

uint64_t sub_1BCA348B0()
{
  return swift_endAccess();
}

uint64_t static ManagedSettingsStore.effectivePublisher(for:)@<X0>(void *a1@<X8>)
{
  uint64_t v2 = swift_bridgeObjectRetain();

  return sub_1BCA17B08(v2, a1);
}

uint64_t sub_1BCA34948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  if (qword_1E9FABD78 != -1) {
    swift_once();
  }
  uint64_t v9 = off_1E9FAE888;
  if (!*((void *)off_1E9FAE888 + 2))
  {
    uint64_t v31 = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_1BC9A69D0(a2, a3);
  if ((v11 & 1) == 0)
  {
    uint64_t v31 = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_1BC9BE1A8(v9[7] + 40 * v10, (uint64_t)&v29);
  swift_bridgeObjectRelease();
  if (!*((void *)&v30 + 1))
  {
LABEL_11:
    sub_1BC9A3A70((uint64_t)&v29, &qword_1E9FAE388);
    sub_1BC9F2D60();
    swift_allocError();
    unsigned char *v12 = 1;
    return swift_willThrow();
  }
  sub_1BC9A9FF0(&v29, (uint64_t)v32);
  sub_1BCA34F44(a1, (uint64_t)&v27);
  if (!v28)
  {
    sub_1BC9A3A70((uint64_t)&v27, &qword_1E9FAE390);
LABEL_13:
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    char v14 = off_1E9FABF10;
    if (off_1E9FABF10)
    {
      sub_1BCA34F44(a1, (uint64_t)&v29);
      uint64_t v15 = *((void *)&v30 + 1);
      id v35 = v14;
      if (*((void *)&v30 + 1))
      {
        uint64_t v16 = v31;
        __swift_project_boxed_opaque_existential_1(&v29, *((uint64_t *)&v30 + 1));
        uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 16);
        swift_retain();
        char v26 = (void *)v17(v15, v16);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v29);
      }
      else
      {
        swift_retain();
        sub_1BC9A3A70((uint64_t)&v29, &qword_1E9FAE390);
        char v26 = 0;
      }
      uint64_t v18 = v5[3];
      uint64_t v19 = v5[4];
      uint64_t v20 = v5[5];
      uint64_t v21 = v5[6];
      *(void *)&long long v29 = v18;
      *((void *)&v29 + 1) = v19;
      *(void *)&long long v30 = v20;
      *((void *)&v30 + 1) = v21;
      uint64_t v23 = v33;
      uint64_t v22 = v34;
      __swift_project_boxed_opaque_existential_1(v32, v33);
      unint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t))(v22 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v25 = v24(v23, v22);
      sub_1BC9A4CA8(v26, a2, a3, (uint64_t *)&v29, v25 & 1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
    }
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
  }
  sub_1BC9A9FF0(&v27, (uint64_t)&v29);
  __swift_project_boxed_opaque_existential_1(v32, v33);
  sub_1BCA2B334((uint64_t)&v29);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v29);
  if (!v4) {
    goto LABEL_13;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
}

uint64_t static ManagedSettingsStore.collectDiagnostics()@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EBA01E50 != -1) {
    swift_once();
  }
  return sub_1BC9F0394(a1);
}

uint64_t sub_1BCA34CD0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ManagedSettingsStore();
  uint64_t result = sub_1BCA485B8();
  *a1 = result;
  return result;
}

uint64_t sub_1BCA34D10(uint64_t result, long long *a2)
{
  long long v3 = *a2;
  uint64_t v2 = *(void (**)(long long *))(result + 48);
  if (v2)
  {
    swift_retain();
    v2(&v3);
    return sub_1BC9BD110((uint64_t)v2);
  }
  return result;
}

uint64_t sub_1BCA34D84(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FACA48);
    uint64_t v3 = sub_1BCA48B38();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_1BCA48D58();
      swift_bridgeObjectRetain_n();
      sub_1BCA48848();
      swift_bridgeObjectRelease();
      uint64_t result = sub_1BCA48D88();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_1BCA48CA8(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_1BCA48CA8();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_1BCA34F44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE390);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BCA34FB0()
{
  unint64_t result = qword_1E9FAE398;
  if (!qword_1E9FAE398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE398);
  }
  return result;
}

unint64_t sub_1BCA35008()
{
  unint64_t result = qword_1E9FAE3A0;
  if (!qword_1E9FAE3A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE3A0);
  }
  return result;
}

uint64_t sub_1BCA3505C()
{
  return MEMORY[0x1E4F1ABE8];
}

uint64_t sub_1BCA35068@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BCA2F0D8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1BCA35098(char *a1)
{
  return sub_1BCA2F4A0(*a1);
}

uint64_t sub_1BCA350C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1BCA2F528();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1BCA350F0(char *a1)
{
  return sub_1BCA2F8EC(*a1);
}

uint64_t sub_1BCA35208()
{
  return sub_1BCA346C4();
}

uint64_t sub_1BCA35228(uint64_t a1)
{
  return sub_1BCA34728(a1);
}

uint64_t sub_1BCA35248()
{
  return sub_1BCA346C4();
}

uint64_t sub_1BCA35268(uint64_t a1)
{
  return sub_1BCA34728(a1);
}

uint64_t getEnumTagSinglePayload for ManagedSettingsStoreError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ManagedSettingsStoreError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x1BCA353E4);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ManagedSettingsStoreError()
{
  return &type metadata for ManagedSettingsStoreError;
}

uint64_t sub_1BCA3541C()
{
  return type metadata accessor for ManagedSettingsStore();
}

void sub_1BCA35424()
{
  sub_1BCA366F8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ManagedSettingsStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ManagedSettingsStore);
}

uint64_t dispatch thunk of ManagedSettingsStore.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 352))();
}

uint64_t dispatch thunk of ManagedSettingsStore.active.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of ManagedSettingsStore.active.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of ManagedSettingsStore.active.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of ManagedSettingsStore.syncToWatch.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of ManagedSettingsStore.syncToWatch.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of ManagedSettingsStore.syncToWatch.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of ManagedSettingsStore.account.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of ManagedSettingsStore.account.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of ManagedSettingsStore.account.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of ManagedSettingsStore.airDrop.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of ManagedSettingsStore.airDrop.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of ManagedSettingsStore.airDrop.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of ManagedSettingsStore.allowedClient.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of ManagedSettingsStore.allowedClient.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of ManagedSettingsStore.allowedClient.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of ManagedSettingsStore.application.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of ManagedSettingsStore.application.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of ManagedSettingsStore.application.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of ManagedSettingsStore.appStore.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of ManagedSettingsStore.appStore.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536))();
}

uint64_t dispatch thunk of ManagedSettingsStore.appStore.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t dispatch thunk of ManagedSettingsStore.calculator.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 552))();
}

uint64_t dispatch thunk of ManagedSettingsStore.calculator.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 560))();
}

uint64_t dispatch thunk of ManagedSettingsStore.calculator.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 568))();
}

uint64_t dispatch thunk of ManagedSettingsStore.camera.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 576))();
}

uint64_t dispatch thunk of ManagedSettingsStore.camera.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 584))();
}

uint64_t dispatch thunk of ManagedSettingsStore.camera.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

uint64_t dispatch thunk of ManagedSettingsStore.carPlay.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of ManagedSettingsStore.carPlay.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 608))();
}

uint64_t dispatch thunk of ManagedSettingsStore.carPlay.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 616))();
}

uint64_t dispatch thunk of ManagedSettingsStore.cellular.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 624))();
}

uint64_t dispatch thunk of ManagedSettingsStore.cellular.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 632))();
}

uint64_t dispatch thunk of ManagedSettingsStore.cellular.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 640))();
}

uint64_t dispatch thunk of ManagedSettingsStore.dateAndTime.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 648))();
}

uint64_t dispatch thunk of ManagedSettingsStore.dateAndTime.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 656))();
}

uint64_t dispatch thunk of ManagedSettingsStore.dateAndTime.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 664))();
}

uint64_t dispatch thunk of ManagedSettingsStore.deviceActivity.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 672))();
}

uint64_t dispatch thunk of ManagedSettingsStore.deviceActivity.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 680))();
}

uint64_t dispatch thunk of ManagedSettingsStore.deviceActivity.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 688))();
}

uint64_t dispatch thunk of ManagedSettingsStore.faceTime.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 696))();
}

uint64_t dispatch thunk of ManagedSettingsStore.faceTime.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 704))();
}

uint64_t dispatch thunk of ManagedSettingsStore.faceTime.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 712))();
}

uint64_t dispatch thunk of ManagedSettingsStore.findMy.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 720))();
}

uint64_t dispatch thunk of ManagedSettingsStore.findMy.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 728))();
}

uint64_t dispatch thunk of ManagedSettingsStore.findMy.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 736))();
}

uint64_t dispatch thunk of ManagedSettingsStore.gameCenter.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 744))();
}

uint64_t dispatch thunk of ManagedSettingsStore.gameCenter.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 752))();
}

uint64_t dispatch thunk of ManagedSettingsStore.gameCenter.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 760))();
}

uint64_t dispatch thunk of ManagedSettingsStore.intelligence.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 768))();
}

uint64_t dispatch thunk of ManagedSettingsStore.intelligence.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 776))();
}

uint64_t dispatch thunk of ManagedSettingsStore.intelligence.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 784))();
}

uint64_t dispatch thunk of ManagedSettingsStore.keyboard.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 792))();
}

uint64_t dispatch thunk of ManagedSettingsStore.keyboard.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 800))();
}

uint64_t dispatch thunk of ManagedSettingsStore.keyboard.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 808))();
}

uint64_t dispatch thunk of ManagedSettingsStore.managedSettings.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 816))();
}

uint64_t dispatch thunk of ManagedSettingsStore.managedSettings.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 824))();
}

uint64_t dispatch thunk of ManagedSettingsStore.managedSettings.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 832))();
}

uint64_t dispatch thunk of ManagedSettingsStore.media.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 840))();
}

uint64_t dispatch thunk of ManagedSettingsStore.media.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 848))();
}

uint64_t dispatch thunk of ManagedSettingsStore.media.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 856))();
}

uint64_t dispatch thunk of ManagedSettingsStore.messages.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 864))();
}

uint64_t dispatch thunk of ManagedSettingsStore.messages.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 872))();
}

uint64_t dispatch thunk of ManagedSettingsStore.messages.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 880))();
}

uint64_t dispatch thunk of ManagedSettingsStore.news.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 888))();
}

uint64_t dispatch thunk of ManagedSettingsStore.news.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 896))();
}

uint64_t dispatch thunk of ManagedSettingsStore.news.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 904))();
}

uint64_t dispatch thunk of ManagedSettingsStore.notification.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 912))();
}

uint64_t dispatch thunk of ManagedSettingsStore.notification.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 920))();
}

uint64_t dispatch thunk of ManagedSettingsStore.notification.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 928))();
}

uint64_t dispatch thunk of ManagedSettingsStore.passcode.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 936))();
}

uint64_t dispatch thunk of ManagedSettingsStore.passcode.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 944))();
}

uint64_t dispatch thunk of ManagedSettingsStore.passcode.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 952))();
}

uint64_t dispatch thunk of ManagedSettingsStore.privacy.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 960))();
}

uint64_t dispatch thunk of ManagedSettingsStore.privacy.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 968))();
}

uint64_t dispatch thunk of ManagedSettingsStore.privacy.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 976))();
}

uint64_t dispatch thunk of ManagedSettingsStore.safari.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 984))();
}

uint64_t dispatch thunk of ManagedSettingsStore.safari.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 992))();
}

uint64_t dispatch thunk of ManagedSettingsStore.safari.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1000))();
}

uint64_t dispatch thunk of ManagedSettingsStore.screenTime.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1008))();
}

uint64_t dispatch thunk of ManagedSettingsStore.screenTime.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1016))();
}

uint64_t dispatch thunk of ManagedSettingsStore.screenTime.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1024))();
}

uint64_t dispatch thunk of ManagedSettingsStore.shield.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1032))();
}

uint64_t dispatch thunk of ManagedSettingsStore.shield.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1040))();
}

uint64_t dispatch thunk of ManagedSettingsStore.shield.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1048))();
}

uint64_t dispatch thunk of ManagedSettingsStore.siri.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1056))();
}

uint64_t dispatch thunk of ManagedSettingsStore.siri.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1064))();
}

uint64_t dispatch thunk of ManagedSettingsStore.siri.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1072))();
}

uint64_t dispatch thunk of ManagedSettingsStore.user.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1080))();
}

uint64_t dispatch thunk of ManagedSettingsStore.user.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1088))();
}

uint64_t dispatch thunk of ManagedSettingsStore.user.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1096))();
}

uint64_t dispatch thunk of ManagedSettingsStore.userSafety.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1104))();
}

uint64_t dispatch thunk of ManagedSettingsStore.userSafety.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1112))();
}

uint64_t dispatch thunk of ManagedSettingsStore.userSafety.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1120))();
}

uint64_t dispatch thunk of ManagedSettingsStore.webContent.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1128))();
}

uint64_t dispatch thunk of ManagedSettingsStore.webContent.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1136))();
}

uint64_t dispatch thunk of ManagedSettingsStore.webContent.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1144))();
}

uint64_t dispatch thunk of ManagedSettingsStore.clearAllSettings()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1152))();
}

uint64_t dispatch thunk of ManagedSettingsStore.deleteStore()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1160))();
}

uint64_t dispatch thunk of ManagedSettingsStore.effectiveMaximumMovieRating.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1168))();
}

uint64_t dispatch thunk of ManagedSettingsStore.$effectiveMaximumMovieRating.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1192))();
}

uint64_t dispatch thunk of ManagedSettingsStore.effectiveMaximumTVShowRating.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1216))();
}

uint64_t dispatch thunk of ManagedSettingsStore.$effectiveMaximumTVShowRating.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1240))();
}

uint64_t dispatch thunk of ManagedSettingsStore.set(value:for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1264))();
}

void sub_1BCA366F8()
{
  if (!qword_1EBA01F20)
  {
    unint64_t v0 = sub_1BCA48638();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EBA01F20);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for ManagedSettingsStore.Name(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ManagedSettingsStore.Name()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ManagedSettingsStore.Name(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ManagedSettingsStore.Name(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ManagedSettingsStore.Name(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ManagedSettingsStore.Name(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ManagedSettingsStore.Name()
{
  return &type metadata for ManagedSettingsStore.Name;
}

ValueMetadata *type metadata accessor for ManagedSettingsStore.PropertyKeys()
{
  return &type metadata for ManagedSettingsStore.PropertyKeys;
}

ValueMetadata *type metadata accessor for ManagedSettingsStore.Identity()
{
  return &type metadata for ManagedSettingsStore.Identity;
}

uint64_t sub_1BCA368B8()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BCA368F0()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);

  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_1BCA36930()
{
  return sub_1BCA2DC98(*(void *)(v0 + 16), (void *)(v0 + 24));
}

uint64_t sub_1BCA3693C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1BCA3697C(uint64_t a1)
{
  sub_1BCA2D410(*(void **)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

id sub_1BCA36994(id result, uint64_t a2, char a3)
{
  if (a3) {
    return result;
  }
  return result;
}

void sub_1BCA369A0(id a1, uint64_t a2, char a3)
{
  if (a3) {
}
  }

uint64_t sub_1BCA369AC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1BCA369E4()
{
  return sub_1BCA34D10(*(void *)(v0 + 16), (long long *)(v0 + 24));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_1BCA36A08(uint64_t a1, uint64_t a2, char a3)
{
  unsigned int v4 = *(uint64_t (**)(void *))(v3 + 16);
  v6[0] = a1;
  v6[1] = a2;
  char v7 = a3 & 1;
  return v4(v6);
}

uint64_t SafariSettings.CookiePolicy.rawValue.getter()
{
  uint64_t result = 0x726576656ELL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x57746E6572727563;
      break;
    case 2:
      uint64_t result = 0x5764657469736976;
      break;
    case 3:
      uint64_t result = 0x737961776C61;
      break;
    default:
      return result;
  }
  return result;
}

ManagedSettings::SafariSettings::CookiePolicy_optional __swiftcall SafariSettings.CookiePolicy.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BCA48C38();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

ManagedSettings::SafariSettings::Name_optional __swiftcall SafariSettings.Name.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BCA48C38();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static SafariSettings.Name.allCases.getter()
{
  return &unk_1F16ED708;
}

unint64_t SafariSettings.Name.rawValue.getter()
{
  unint64_t v1 = 0xD000000000000011;
  if (*v0 == 1) {
    unint64_t v1 = 0xD000000000000013;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t sub_1BCA36C34(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BC9F403C(*a1, *a2);
}

uint64_t sub_1BCA36C40()
{
  return sub_1BCA45124();
}

uint64_t sub_1BCA36C48()
{
  return sub_1BCA4575C();
}

uint64_t sub_1BCA36C50()
{
  return sub_1BCA46354();
}

ManagedSettings::SafariSettings::Name_optional sub_1BCA36C58(Swift::String *a1)
{
  return SafariSettings.Name.init(rawValue:)(*a1);
}

unint64_t sub_1BCA36C64@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SafariSettings.Name.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1BCA36C8C(void *a1@<X8>)
{
  *a1 = &unk_1F16ED730;
}

BOOL static SafariSettings.CookiePolicy.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

unint64_t SafariSettings.CookiePolicy.description.getter()
{
  unint64_t result = 0x726576654ELL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x20746E6572727543;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x737961776C41;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1BCA36D48(unsigned __int8 *a1, char *a2)
{
  return sub_1BC9F4134(*a1, *a2);
}

uint64_t sub_1BCA36D54()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA36E40()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA36F14()
{
  return sub_1BCA48D88();
}

ManagedSettings::SafariSettings::CookiePolicy_optional sub_1BCA36FFC(Swift::String *a1)
{
  return SafariSettings.CookiePolicy.init(rawValue:)(*a1);
}

void sub_1BCA37008(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE500000000000000;
  uint64_t v3 = 0x726576656ELL;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEE00657469736265;
      uint64_t v3 = 0x57746E6572727563;
      goto LABEL_3;
    case 2:
      *a1 = 0x5764657469736976;
      a1[1] = 0xEF73657469736265;
      break;
    case 3:
      *a1 = 0x737961776C61;
      a1[1] = 0xE600000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

unint64_t sub_1BCA370B4()
{
  unint64_t result = 0x726576654ELL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x20746E6572727543;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x737961776C41;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SafariSettings.cookiePolicy.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD10 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DE9C((uint64_t)&byte_1E9FAE3B8, v4, v3, v6, v5, a1);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA37200@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v7 = qword_1E9FABD10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DE9C((uint64_t)&byte_1E9FAE3B8, v4, v3, v6, v5, &v9);
  swift_bridgeObjectRelease_n();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a2 = v9;
  return result;
}

uint64_t SafariSettings.cookiePolicy.setter(unsigned __int8 *a1)
{
  uint64_t v2 = *a1;
  if (qword_1E9FABD10 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&byte_1E9FAE3B8, (uint64_t)v15, &qword_1E9FAE4C0);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  switch(v2)
  {
    case 4:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v9 = 0;
      break;
    default:
      id v7 = objc_allocWithZone(NSString);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      int v8 = (void *)sub_1BCA487B8();
      swift_bridgeObjectRelease();
      id v9 = objc_msgSend(v7, sel_initWithString_, v8);

      break;
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v10 = v16;
    uint64_t v11 = v17;
    v14[0] = v4;
    v14[1] = v3;
    v14[2] = v6;
    v14[3] = v5;
    int v12 = v18;
    swift_retain();
    sub_1BC9A4CA8(v9, v10, v11, v14, v12);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BC9A3A70((uint64_t)v15, &qword_1E9FAE4C0);
}

uint64_t (*SafariSettings.cookiePolicy.modify(uint64_t **a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  uint64_t v2 = a1 + 1;
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD10 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DE9C((uint64_t)&byte_1E9FAE3B8, v4, v3, v6, v5, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1BCA375FC;
}

uint64_t sub_1BCA375FC(uint64_t a1, char a2)
{
  if (a2)
  {
    char v4 = *(unsigned char *)(a1 + 8);
    uint64_t v2 = (unsigned __int8 *)&v4;
  }
  else
  {
    char v5 = *(unsigned char *)(a1 + 8);
    uint64_t v2 = (unsigned __int8 *)&v5;
  }
  return SafariSettings.cookiePolicy.setter(v2);
}

uint64_t SafariSettings.effectiveCookiePolicy.getter@<X0>(unsigned char *a1@<X8>)
{
  if (qword_1E9FABD10 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&byte_1E9FAE3B8, (uint64_t)v10, &qword_1E9FAE4C0);
  if (qword_1E9FABAC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (!qword_1E9FAC238) {
    goto LABEL_9;
  }
  uint64_t v2 = v11;
  uint64_t v3 = v12;
  swift_retain();
  char v4 = sub_1BC9AEFD0(v2, v3);
  swift_release();
  if (!v4) {
    goto LABEL_9;
  }
  id v5 = v4;
  static SafariSettings.CookiePolicy.value(from:)(v4, &v9);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE48);
  if (swift_dynamicCast()) {
    char v6 = v8;
  }
  else {
LABEL_9:
  }
    char v6 = v10[0];
  *a1 = v6;
  return sub_1BC9A3A70((uint64_t)v10, &qword_1E9FAE4C0);
}

uint64_t sub_1BCA377A0()
{
  byte_1E9FAE3B8 = 3;
  qword_1E9FAE3C0 = 0xD000000000000013;
  unk_1E9FAE3C8 = 0x80000001BCA4F700;
  qword_1E9FAE3E8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FACE10);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAE500, &qword_1E9FACE10);
  qword_1E9FAE3F0 = result;
  byte_1E9FAE3D0 = 0;
  word_1E9FAE3F8 = 257;
  byte_1E9FAE3FA = 0;
  qword_1E9FAE400 = 0;
  byte_1E9FAE408 = 1;
  return result;
}

uint64_t static SafariSettings.cookiePolicy.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9FABD10 != -1) {
    swift_once();
  }
  return sub_1BC9AA050((uint64_t)&byte_1E9FAE3B8, a1, &qword_1E9FAE4C0);
}

uint64_t SafariSettings.denyAutoFill.getter()
{
  return sub_1BC99F3E0(&qword_1E9FABD18, (uint64_t)&byte_1E9FAE410);
}

uint64_t SafariSettings.denyAutoFill.setter(unsigned __int8 a1)
{
  return sub_1BC9AAC30(a1, &qword_1E9FABD18, (uint64_t)&byte_1E9FAE410);
}

uint64_t (*SafariSettings.denyAutoFill.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD18 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v7 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE410, v4, v3, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v7;
  return sub_1BCA379C8;
}

uint64_t sub_1BCA379C8(uint64_t a1)
{
  return SafariSettings.denyAutoFill.setter(*(unsigned char *)(a1 + 8));
}

uint64_t SafariSettings.effectiveDenyAutoFill.getter()
{
  return sub_1BC99F85C(&qword_1E9FABD18, &byte_1E9FAE410);
}

void sub_1BCA37A14()
{
  byte_1E9FAE410 = 0;
  qword_1E9FAE418 = 0xD000000000000013;
  unk_1E9FAE420 = 0x80000001BCA4F720;
  qword_1E9FAE440 = (uint64_t)&type metadata for BoolCombineOperator;
  unk_1E9FAE448 = &protocol witness table for BoolCombineOperator;
  byte_1E9FAE428 = 0;
  word_1E9FAE450 = 257;
  byte_1E9FAE452 = 0;
  qword_1E9FAE458 = 0;
  byte_1E9FAE460 = 1;
}

uint64_t static SafariSettings.denyAutoFill.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BC9AAF6C(&qword_1E9FABD18, (uint64_t)&byte_1E9FAE410, a1);
}

uint64_t SafariSettings.denySafari.getter()
{
  return sub_1BC99F3E0(&qword_1E9FABD20, (uint64_t)&byte_1E9FAE468);
}

uint64_t SafariSettings.denySafari.setter(unsigned __int8 a1)
{
  return sub_1BC9AAC30(a1, &qword_1E9FABD20, (uint64_t)&byte_1E9FAE468);
}

uint64_t (*SafariSettings.denySafari.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD20 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v7 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE468, v4, v3, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v7;
  return sub_1BCA37BB4;
}

uint64_t sub_1BCA37BB4(uint64_t a1)
{
  return SafariSettings.denySafari.setter(*(unsigned char *)(a1 + 8));
}

uint64_t SafariSettings.effectiveDenySafari.getter()
{
  return sub_1BC99F85C(&qword_1E9FABD20, &byte_1E9FAE468);
}

void sub_1BCA37C00()
{
  byte_1E9FAE468 = 0;
  qword_1E9FAE470 = 0xD000000000000011;
  unk_1E9FAE478 = 0x80000001BCA4F740;
  qword_1E9FAE498 = (uint64_t)&type metadata for BoolCombineOperator;
  unk_1E9FAE4A0 = &protocol witness table for BoolCombineOperator;
  byte_1E9FAE480 = 0;
  word_1E9FAE4A8 = 256;
  byte_1E9FAE4AA = 0;
  qword_1E9FAE4B0 = 0;
  byte_1E9FAE4B8 = 1;
}

uint64_t static SafariSettings.denySafari.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BC9AAF6C(&qword_1E9FABD20, (uint64_t)&byte_1E9FAE468, a1);
}

void *static SafariSettings.CookiePolicy.allCases.getter()
{
  return &unk_1F16ED638;
}

void sub_1BCA37C8C(void *a1@<X8>)
{
  *a1 = &unk_1F16ED6E0;
}

uint64_t SafariSettings.customMirror.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v2 = sub_1BCA48DA8();
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA8);
  MEMORY[0x1F4188790](v6 - 8, v7);
  char v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v10 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v12 = v1[3];
  uint64_t v32 = *v1;
  uint64_t v33 = v10;
  uint64_t v34 = v13;
  uint64_t v35 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BCA49BD0;
  uint64_t v15 = qword_1E9FABD10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = unk_1E9FAE3C8;
  *(void *)(v14 + 32) = qword_1E9FAE3C0;
  *(void *)(v14 + 40) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DE9C((uint64_t)&byte_1E9FAE3B8, v11, v10, v13, v12, &v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v17 = v31;
  SafariSettings.effectiveCookiePolicy.getter(&v30);
  char v18 = v30;
  *(void *)(v14 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE4C8);
  *(unsigned char *)(v14 + 48) = v17;
  *(unsigned char *)(v14 + 49) = v18;
  if (qword_1E9FABD18 != -1) {
    swift_once();
  }
  uint64_t v19 = unk_1E9FAE420;
  *(void *)(v14 + 80) = qword_1E9FAE418;
  *(void *)(v14 + 88) = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v20 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE410, v11, v10, v13, v12);
  char v21 = sub_1BC99EBCC(&byte_1E9FAE410);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB8);
  *(void *)(v14 + 120) = v22;
  *(unsigned char *)(v14 + 96) = v20;
  *(unsigned char *)(v14 + 97) = v21;
  if (qword_1E9FABD20 != -1) {
    swift_once();
  }
  uint64_t v23 = unk_1E9FAE478;
  *(void *)(v14 + 128) = qword_1E9FAE470;
  *(void *)(v14 + 136) = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(v23) = sub_1BC99CD6C((uint64_t)&byte_1E9FAE468, v11, v10, v13, v12);
  char v24 = sub_1BC99EBCC(&byte_1E9FAE468);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v14 + 168) = v22;
  *(unsigned char *)(v14 + 144) = v23;
  *(unsigned char *)(v14 + 145) = v24;
  uint64_t v25 = sub_1BCA48D98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v9, 1, 1, v25);
  (*(void (**)(char *, void, uint64_t))(v27 + 104))(v5, *MEMORY[0x1E4FBC430], v28);
  return sub_1BCA48DB8();
}

unint64_t sub_1BCA38064()
{
  unint64_t result = qword_1E9FAE4D0;
  if (!qword_1E9FAE4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE4D0);
  }
  return result;
}

uint64_t sub_1BCA380B8()
{
  return sub_1BC9ADEBC(&qword_1E9FAE4D8, &qword_1E9FAE4E0);
}

unint64_t sub_1BCA380F8()
{
  unint64_t result = qword_1E9FAE4E8;
  if (!qword_1E9FAE4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE4E8);
  }
  return result;
}

uint64_t sub_1BCA3814C()
{
  return sub_1BC9ADEBC(&qword_1E9FAE4F0, &qword_1E9FAE4F8);
}

uint64_t sub_1BCA38190(unsigned __int8 *a1)
{
  unsigned __int8 v2 = *a1;
  return SafariSettings.cookiePolicy.setter(&v2);
}

uint64_t sub_1BCA381C8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1BC99F494(a1, &qword_1E9FABD18, (uint64_t)&byte_1E9FAE410, a2);
}

uint64_t sub_1BCA38200(unsigned __int8 *a1)
{
  return SafariSettings.denyAutoFill.setter(*a1);
}

uint64_t sub_1BCA38228@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1BC99F494(a1, &qword_1E9FABD20, (uint64_t)&byte_1E9FAE468, a2);
}

uint64_t sub_1BCA38260(unsigned __int8 *a1)
{
  return SafariSettings.denySafari.setter(*a1);
}

ValueMetadata *type metadata accessor for SafariSettings()
{
  return &type metadata for SafariSettings;
}

unsigned char *storeEnumTagSinglePayload for SafariSettings.Name(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BCA38364);
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

ValueMetadata *type metadata accessor for SafariSettings.Name()
{
  return &type metadata for SafariSettings.Name;
}

unsigned char *storeEnumTagSinglePayload for SafariSettings.CookiePolicy(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BCA38468);
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

ValueMetadata *type metadata accessor for SafariSettings.CookiePolicy()
{
  return &type metadata for SafariSettings.CookiePolicy;
}

ManagedSettings::CameraSettings::Name_optional __swiftcall CameraSettings.Name.init(rawValue:)(Swift::String rawValue)
{
  unsigned __int8 v2 = v1;
  uint64_t v3 = sub_1BCA48C38();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *unsigned __int8 v2 = v5;
  return result;
}

void *static CameraSettings.Name.allCases.getter()
{
  return &unk_1F16ED2A8;
}

unint64_t CameraSettings.Name.rawValue.getter()
{
  if (*v0) {
    return 0xD00000000000001ALL;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t sub_1BCA38550(char *a1, char *a2)
{
  return sub_1BC9F42E4(*a1, *a2);
}

uint64_t sub_1BCA3855C()
{
  return sub_1BCA451CC();
}

uint64_t sub_1BCA38564()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA385D8()
{
  return sub_1BCA462D0();
}

ManagedSettings::CameraSettings::Name_optional sub_1BCA385E0(Swift::String *a1)
{
  return CameraSettings.Name.init(rawValue:)(*a1);
}

void sub_1BCA385EC(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD00000000000001ALL;
  }
  else {
    unint64_t v2 = 0xD000000000000011;
  }
  unint64_t v3 = 0x80000001BCA4F760;
  if (*v1) {
    unint64_t v3 = 0x80000001BCA4F780;
  }
  *a1 = v2;
  a1[1] = v3;
}

void sub_1BCA38630(void *a1@<X8>)
{
  *a1 = &unk_1F16ED3B0;
}

uint64_t CameraSettings.denyCamera.getter()
{
  return sub_1BC99F3E0(&qword_1E9FABD28, (uint64_t)&byte_1E9FAE508);
}

uint64_t CameraSettings.denyCamera.setter(unsigned __int8 a1)
{
  return sub_1BC9B4A68(a1, &qword_1E9FABD28, (uint64_t)&byte_1E9FAE508);
}

uint64_t (*CameraSettings.denyCamera.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD28 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v7 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE508, v4, v3, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v7;
  return sub_1BCA38760;
}

uint64_t sub_1BCA38760(uint64_t a1)
{
  return CameraSettings.denyCamera.setter(*(unsigned char *)(a1 + 8));
}

uint64_t CameraSettings.effectiveDenyCamera.getter()
{
  return sub_1BC99F85C(&qword_1E9FABD28, &byte_1E9FAE508);
}

void sub_1BCA387AC()
{
  byte_1E9FAE508 = 0;
  qword_1E9FAE510 = 0xD000000000000011;
  unk_1E9FAE518 = 0x80000001BCA4F760;
  qword_1E9FAE538 = (uint64_t)&type metadata for BoolCombineOperator;
  unk_1E9FAE540 = &protocol witness table for BoolCombineOperator;
  byte_1E9FAE520 = 0;
  word_1E9FAE548 = 256;
  byte_1E9FAE54A = 0;
  qword_1E9FAE550 = 0;
  byte_1E9FAE558 = 1;
}

uint64_t static CameraSettings.denyCamera.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BC99F928(&qword_1E9FABD28, (uint64_t)&byte_1E9FAE508, a1);
}

uint64_t CameraSettings.denyScreenRecording.getter()
{
  return sub_1BC99F3E0(&qword_1E9FABD30, (uint64_t)&byte_1E9FAE560);
}

uint64_t CameraSettings.denyScreenRecording.setter(unsigned __int8 a1)
{
  return sub_1BC9B4A68(a1, &qword_1E9FABD30, (uint64_t)&byte_1E9FAE560);
}

uint64_t (*CameraSettings.denyScreenRecording.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD30 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v7 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE560, v4, v3, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v7;
  return sub_1BCA3894C;
}

uint64_t sub_1BCA3894C(uint64_t a1)
{
  return CameraSettings.denyScreenRecording.setter(*(unsigned char *)(a1 + 8));
}

uint64_t CameraSettings.effectiveDenyScreenRecording.getter()
{
  return sub_1BC99F85C(&qword_1E9FABD30, &byte_1E9FAE560);
}

void sub_1BCA38998()
{
  byte_1E9FAE560 = 0;
  qword_1E9FAE568 = 0xD00000000000001ALL;
  unk_1E9FAE570 = 0x80000001BCA4F780;
  qword_1E9FAE590 = (uint64_t)&type metadata for BoolCombineOperator;
  unk_1E9FAE598 = &protocol witness table for BoolCombineOperator;
  byte_1E9FAE578 = 0;
  word_1E9FAE5A0 = 256;
  byte_1E9FAE5A2 = 0;
  qword_1E9FAE5A8 = 0;
  byte_1E9FAE5B0 = 1;
}

uint64_t static CameraSettings.denyScreenRecording.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BC99F928(&qword_1E9FABD30, (uint64_t)&byte_1E9FAE560, a1);
}

uint64_t CameraSettings.customMirror.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v27 = a1;
  uint64_t v2 = sub_1BCA48DA8();
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA8);
  MEMORY[0x1F4188790](v6 - 8, v7);
  char v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v10 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v12 = v1[3];
  uint64_t v28 = *v1;
  uint64_t v29 = v10;
  uint64_t v30 = v13;
  uint64_t v31 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BCA49730;
  uint64_t v15 = qword_1E9FABD28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = unk_1E9FAE518;
  *(void *)(v14 + 32) = qword_1E9FAE510;
  *(void *)(v14 + 40) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v17 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE508, v11, v10, v13, v12);
  char v18 = sub_1BC99EBCC(&byte_1E9FAE508);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB8);
  *(void *)(v14 + 72) = v19;
  *(unsigned char *)(v14 + 48) = v17;
  *(unsigned char *)(v14 + 49) = v18;
  if (qword_1E9FABD30 != -1) {
    swift_once();
  }
  uint64_t v20 = unk_1E9FAE570;
  *(void *)(v14 + 80) = qword_1E9FAE568;
  *(void *)(v14 + 88) = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(v20) = sub_1BC99CD6C((uint64_t)&byte_1E9FAE560, v11, v10, v13, v12);
  char v21 = sub_1BC99EBCC(&byte_1E9FAE560);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v14 + 120) = v19;
  *(unsigned char *)(v14 + 96) = v20;
  *(unsigned char *)(v14 + 97) = v21;
  uint64_t v22 = sub_1BCA48D98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v9, 1, 1, v22);
  (*(void (**)(char *, void, uint64_t))(v25 + 104))(v5, *MEMORY[0x1E4FBC430], v26);
  return sub_1BCA48DB8();
}

unint64_t sub_1BCA38D34()
{
  unint64_t result = qword_1E9FAE5B8;
  if (!qword_1E9FAE5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE5B8);
  }
  return result;
}

unint64_t sub_1BCA38D8C()
{
  unint64_t result = qword_1E9FAE5C0;
  if (!qword_1E9FAE5C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAE5C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE5C0);
  }
  return result;
}

uint64_t sub_1BCA38DEC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1BC99F494(a1, &qword_1E9FABD28, (uint64_t)&byte_1E9FAE508, a2);
}

uint64_t sub_1BCA38E24(unsigned __int8 *a1)
{
  return CameraSettings.denyCamera.setter(*a1);
}

uint64_t sub_1BCA38E4C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1BC99F494(a1, &qword_1E9FABD30, (uint64_t)&byte_1E9FAE560, a2);
}

uint64_t sub_1BCA38E84(unsigned __int8 *a1)
{
  return CameraSettings.denyScreenRecording.setter(*a1);
}

ValueMetadata *type metadata accessor for CameraSettings()
{
  return &type metadata for CameraSettings;
}

unsigned char *storeEnumTagSinglePayload for CameraSettings.Name(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BCA38F88);
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

ValueMetadata *type metadata accessor for CameraSettings.Name()
{
  return &type metadata for CameraSettings.Name;
}

ManagedSettings::SiriSettings::Name_optional __swiftcall SiriSettings.Name.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BCA48C38();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static SiriSettings.Name.allCases.getter()
{
  return &unk_1F16ECEF8;
}

uint64_t SiriSettings.Name.rawValue.getter()
{
  unint64_t v1 = 0xD000000000000021;
  if (*v0 != 1) {
    unint64_t v1 = 0xD00000000000001DLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E65642E69726973;
  }
}

uint64_t sub_1BCA3909C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BC9F4670(*a1, *a2);
}

uint64_t sub_1BCA390A8()
{
  return sub_1BCA45254();
}

uint64_t sub_1BCA390B0()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA39158()
{
  return sub_1BCA46170();
}

ManagedSettings::SiriSettings::Name_optional sub_1BCA39160(Swift::String *a1)
{
  return SiriSettings.Name.init(rawValue:)(*a1);
}

void sub_1BCA3916C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xED00006972695379;
  unint64_t v4 = 0xD000000000000021;
  unint64_t v5 = 0x80000001BCA4F7B0;
  if (v2 != 1)
  {
    unint64_t v4 = 0xD00000000000001DLL;
    unint64_t v5 = 0x80000001BCA4F7E0;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0x6E65642E69726973;
  }
  if (!v6) {
    unint64_t v3 = v5;
  }
  *a1 = v7;
  a1[1] = v3;
}

void sub_1BCA391E4(void *a1@<X8>)
{
  *a1 = &unk_1F16ECF88;
}

uint64_t SiriSettings.denySiri.getter()
{
  return sub_1BC99F3E0(&qword_1E9FABD38, (uint64_t)&byte_1E9FAE5D0);
}

uint64_t SiriSettings.denySiri.setter(unsigned __int8 a1)
{
  return sub_1BC9B4A68(a1, &qword_1E9FABD38, (uint64_t)&byte_1E9FAE5D0);
}

uint64_t (*SiriSettings.denySiri.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD38 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v7 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE5D0, v4, v3, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v7;
  return sub_1BCA39314;
}

uint64_t sub_1BCA39314(uint64_t a1)
{
  return SiriSettings.denySiri.setter(*(unsigned char *)(a1 + 8));
}

uint64_t SiriSettings.effectiveDenySiri.getter()
{
  return sub_1BC99F85C(&qword_1E9FABD38, &byte_1E9FAE5D0);
}

void sub_1BCA39360()
{
  byte_1E9FAE5D0 = 0;
  strcpy((char *)&qword_1E9FAE5D8, "siri.denySiri");
  unk_1E9FAE5E6 = -4864;
  qword_1E9FAE600 = (uint64_t)&type metadata for BoolCombineOperator;
  unk_1E9FAE608 = &protocol witness table for BoolCombineOperator;
  byte_1E9FAE5E8 = 0;
  word_1E9FAE610 = 257;
  byte_1E9FAE612 = 0;
  qword_1E9FAE618 = 0;
  byte_1E9FAE620 = 1;
}

uint64_t static SiriSettings.denySiri.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BC99F928(&qword_1E9FABD38, (uint64_t)&byte_1E9FAE5D0, a1);
}

uint64_t SiriSettings.denySiriUserGeneratedContent.getter()
{
  return sub_1BC99F3E0(&qword_1E9FABD40, (uint64_t)&byte_1E9FAE628);
}

uint64_t SiriSettings.denySiriUserGeneratedContent.setter(unsigned __int8 a1)
{
  return sub_1BC9B4A68(a1, &qword_1E9FABD40, (uint64_t)&byte_1E9FAE628);
}

uint64_t (*SiriSettings.denySiriUserGeneratedContent.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD40 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v7 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE628, v4, v3, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v7;
  return sub_1BCA39508;
}

uint64_t sub_1BCA39508(uint64_t a1)
{
  return SiriSettings.denySiriUserGeneratedContent.setter(*(unsigned char *)(a1 + 8));
}

uint64_t SiriSettings.effectiveDenySiriUserGeneratedContent.getter()
{
  return sub_1BC99F85C(&qword_1E9FABD40, &byte_1E9FAE628);
}

void sub_1BCA39554()
{
  byte_1E9FAE628 = 0;
  qword_1E9FAE630 = 0xD000000000000021;
  unk_1E9FAE638 = 0x80000001BCA4F7B0;
  qword_1E9FAE658 = (uint64_t)&type metadata for BoolCombineOperator;
  unk_1E9FAE660 = &protocol witness table for BoolCombineOperator;
  byte_1E9FAE640 = 0;
  word_1E9FAE668 = 256;
  byte_1E9FAE66A = 0;
  qword_1E9FAE670 = 0;
  byte_1E9FAE678 = 1;
}

uint64_t static SiriSettings.denySiriUserGeneratedContent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BC99F928(&qword_1E9FABD40, (uint64_t)&byte_1E9FAE628, a1);
}

uint64_t SiriSettings.forceSiriProfanityFilter.getter()
{
  return sub_1BC99F3E0(&qword_1E9FABD48, (uint64_t)&byte_1E9FAE680);
}

uint64_t SiriSettings.forceSiriProfanityFilter.setter(unsigned __int8 a1)
{
  return sub_1BC9B4A68(a1, &qword_1E9FABD48, (uint64_t)&byte_1E9FAE680);
}

uint64_t (*SiriSettings.forceSiriProfanityFilter.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD48 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v7 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE680, v4, v3, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v7;
  return sub_1BCA396F4;
}

uint64_t sub_1BCA396F4(uint64_t a1)
{
  return SiriSettings.forceSiriProfanityFilter.setter(*(unsigned char *)(a1 + 8));
}

uint64_t SiriSettings.effectiveForceSiriProfanityFilter.getter()
{
  return sub_1BC99F85C(&qword_1E9FABD48, &byte_1E9FAE680);
}

void sub_1BCA39740()
{
  byte_1E9FAE680 = 0;
  qword_1E9FAE688 = 0xD00000000000001DLL;
  unk_1E9FAE690 = 0x80000001BCA4F7E0;
  qword_1E9FAE6B0 = (uint64_t)&type metadata for BoolCombineOperator;
  unk_1E9FAE6B8 = &protocol witness table for BoolCombineOperator;
  byte_1E9FAE698 = 0;
  word_1E9FAE6C0 = 256;
  byte_1E9FAE6C2 = 0;
  qword_1E9FAE6C8 = 0;
  byte_1E9FAE6D0 = 1;
}

uint64_t static SiriSettings.forceSiriProfanityFilter.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BC99F928(&qword_1E9FABD48, (uint64_t)&byte_1E9FAE680, a1);
}

uint64_t SiriSettings.customMirror.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v2 = sub_1BCA48DA8();
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA8);
  MEMORY[0x1F4188790](v6 - 8, v7);
  char v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v10 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v12 = v1[3];
  uint64_t v30 = *v1;
  uint64_t v31 = v10;
  uint64_t v32 = v13;
  uint64_t v33 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BCA49BD0;
  uint64_t v15 = qword_1E9FABD38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = unk_1E9FAE5E0;
  *(void *)(v14 + 32) = qword_1E9FAE5D8;
  *(void *)(v14 + 40) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v17 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE5D0, v11, v10, v13, v12);
  char v18 = sub_1BC99EBCC(&byte_1E9FAE5D0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB8);
  *(void *)(v14 + 72) = v19;
  *(unsigned char *)(v14 + 48) = v17;
  *(unsigned char *)(v14 + 49) = v18;
  if (qword_1E9FABD40 != -1) {
    swift_once();
  }
  uint64_t v20 = unk_1E9FAE638;
  *(void *)(v14 + 80) = qword_1E9FAE630;
  *(void *)(v14 + 88) = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(v20) = sub_1BC99CD6C((uint64_t)&byte_1E9FAE628, v11, v10, v13, v12);
  char v21 = sub_1BC99EBCC(&byte_1E9FAE628);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v14 + 120) = v19;
  *(unsigned char *)(v14 + 96) = v20;
  *(unsigned char *)(v14 + 97) = v21;
  if (qword_1E9FABD48 != -1) {
    swift_once();
  }
  uint64_t v22 = unk_1E9FAE690;
  *(void *)(v14 + 128) = qword_1E9FAE688;
  *(void *)(v14 + 136) = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(v22) = sub_1BC99CD6C((uint64_t)&byte_1E9FAE680, v11, v10, v13, v12);
  char v23 = sub_1BC99EBCC(&byte_1E9FAE680);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v14 + 168) = v19;
  *(unsigned char *)(v14 + 144) = v22;
  *(unsigned char *)(v14 + 145) = v23;
  uint64_t v24 = sub_1BCA48D98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 1, 1, v24);
  (*(void (**)(char *, void, uint64_t))(v27 + 104))(v5, *MEMORY[0x1E4FBC430], v28);
  return sub_1BCA48DB8();
}

unint64_t sub_1BCA39B78()
{
  unint64_t result = qword_1E9FAE6D8;
  if (!qword_1E9FAE6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE6D8);
  }
  return result;
}

unint64_t sub_1BCA39BD0()
{
  unint64_t result = qword_1E9FAE6E0;
  if (!qword_1E9FAE6E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAE6E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE6E0);
  }
  return result;
}

uint64_t sub_1BCA39C30@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1BC99F494(a1, &qword_1E9FABD38, (uint64_t)&byte_1E9FAE5D0, a2);
}

uint64_t sub_1BCA39C68(unsigned __int8 *a1)
{
  return SiriSettings.denySiri.setter(*a1);
}

uint64_t sub_1BCA39C90@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1BC99F494(a1, &qword_1E9FABD40, (uint64_t)&byte_1E9FAE628, a2);
}

uint64_t sub_1BCA39CC8(unsigned __int8 *a1)
{
  return SiriSettings.denySiriUserGeneratedContent.setter(*a1);
}

uint64_t sub_1BCA39CF0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_1BC99F494(a1, &qword_1E9FABD48, (uint64_t)&byte_1E9FAE680, a2);
}

uint64_t sub_1BCA39D28(unsigned __int8 *a1)
{
  return SiriSettings.forceSiriProfanityFilter.setter(*a1);
}

ValueMetadata *type metadata accessor for SiriSettings()
{
  return &type metadata for SiriSettings;
}

unsigned char *storeEnumTagSinglePayload for SiriSettings.Name(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BCA39E2CLL);
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

ValueMetadata *type metadata accessor for SiriSettings.Name()
{
  return &type metadata for SiriSettings.Name;
}

uint64_t AirDropSettings.Name.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1BCA48C38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void *static AirDropSettings.Name.allCases.getter()
{
  return &unk_1F16ED8D0;
}

unint64_t AirDropSettings.Name.rawValue.getter()
{
  return 0xD000000000000013;
}

uint64_t sub_1BCA39EE4()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA39F3C()
{
  return sub_1BCA48848();
}

uint64_t sub_1BCA39F58()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA39FAC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1BCA48C38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1BCA3A000(void *a1@<X8>)
{
  *a1 = 0xD000000000000013;
  a1[1] = 0x80000001BCA4F800;
}

void sub_1BCA3A020(void *a1@<X8>)
{
  *a1 = &unk_1F16ED9F8;
}

uint64_t AirDropSettings.denyAirDrop.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  if (qword_1E9FABD50 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE6F0, v2, v1, v4, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BCA3A0D0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v7 = qword_1E9FABD50;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v8 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE6F0, v4, v3, v6, v5);
  swift_bridgeObjectRelease_n();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a2 = v8;
  return result;
}

uint64_t AirDropSettings.denyAirDrop.setter(unsigned __int8 a1)
{
  int v2 = a1;
  if (qword_1E9FABD50 != -1) {
    swift_once();
  }
  sub_1BC99FC98((uint64_t)&byte_1E9FAE6F0, (uint64_t)v15);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (v2 == 2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = v2 & 1;
    id v9 = objc_allocWithZone(NSNumber);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v7 = objc_msgSend(v9, sel_initWithBool_, v8);
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v10 = v16;
    uint64_t v11 = v17;
    v14[0] = v4;
    v14[1] = v3;
    v14[2] = v6;
    v14[3] = v5;
    int v12 = v18;
    swift_retain();
    sub_1BC9A4CA8(v7, v10, v11, v14, v12);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BC9AE87C((uint64_t)v15);
}

uint64_t (*AirDropSettings.denyAirDrop.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD50 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v7 = sub_1BC99CD6C((uint64_t)&byte_1E9FAE6F0, v4, v3, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v7;
  return sub_1BCA3A408;
}

uint64_t sub_1BCA3A408(uint64_t a1)
{
  return AirDropSettings.denyAirDrop.setter(*(unsigned char *)(a1 + 8));
}

uint64_t AirDropSettings.effectiveDenyAirDrop.getter()
{
  if (qword_1E9FABD50 != -1) {
    swift_once();
  }

  return sub_1BC99EBCC(&byte_1E9FAE6F0);
}

void sub_1BCA3A48C()
{
  byte_1E9FAE6F0 = 0;
  qword_1E9FAE6F8 = 0xD000000000000013;
  unk_1E9FAE700 = 0x80000001BCA4F800;
  qword_1E9FAE720 = (uint64_t)&type metadata for BoolCombineOperator;
  unk_1E9FAE728 = &protocol witness table for BoolCombineOperator;
  byte_1E9FAE708 = 0;
  word_1E9FAE730 = 256;
  byte_1E9FAE732 = 0;
  qword_1E9FAE738 = 0;
  byte_1E9FAE740 = 1;
}

uint64_t static AirDropSettings.denyAirDrop.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9FABD50 != -1) {
    swift_once();
  }

  return sub_1BC99FC98((uint64_t)&byte_1E9FAE6F0, a1);
}

uint64_t AirDropSettings.customMirror.getter@<X0>(uint64_t a1@<X8>)
{
  v20[1] = a1;
  v20[0] = sub_1BCA48DA8();
  uint64_t v2 = *(void *)(v20[0] - 8);
  MEMORY[0x1F4188790](v20[0], v3);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA8);
  MEMORY[0x1F4188790](v6 - 8, v7);
  id v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v10 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v12 = v1[3];
  v20[2] = *v1;
  v20[3] = v10;
  uint64_t v20[4] = v13;
  v20[5] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BCA49BE0;
  uint64_t v15 = qword_1E9FABD50;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = unk_1E9FAE700;
  *(void *)(v14 + 32) = qword_1E9FAE6F8;
  *(void *)(v14 + 40) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(v16) = sub_1BC99CD6C((uint64_t)&byte_1E9FAE6F0, v11, v10, v13, v12);
  char v17 = sub_1BC99EBCC(&byte_1E9FAE6F0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v14 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB8);
  *(unsigned char *)(v14 + 48) = v16;
  *(unsigned char *)(v14 + 49) = v17;
  uint64_t v18 = sub_1BCA48D98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  (*(void (**)(char *, void, void))(v2 + 104))(v5, *MEMORY[0x1E4FBC430], v20[0]);
  return sub_1BCA48DB8();
}

unint64_t sub_1BCA3A7D4()
{
  unint64_t result = qword_1E9FAE748;
  if (!qword_1E9FAE748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE748);
  }
  return result;
}

unint64_t sub_1BCA3A82C()
{
  unint64_t result = qword_1E9FAE750;
  if (!qword_1E9FAE750)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAE758);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE750);
  }
  return result;
}

uint64_t sub_1BCA3A890(unsigned __int8 *a1)
{
  return AirDropSettings.denyAirDrop.setter(*a1);
}

ValueMetadata *type metadata accessor for AirDropSettings()
{
  return &type metadata for AirDropSettings;
}

unsigned char *storeEnumTagSinglePayload for AirDropSettings.Name(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BCA3A964);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AirDropSettings.Name()
{
  return &type metadata for AirDropSettings.Name;
}

uint64_t static Data.none.getter()
{
  return 0;
}

ManagedSettings::ManagedSettingsSettings::Name_optional __swiftcall ManagedSettingsSettings.Name.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BCA48C38();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static ManagedSettingsSettings.Name.allCases.getter()
{
  return &unk_1F16EE920;
}

unint64_t ManagedSettingsSettings.Name.rawValue.getter()
{
  unint64_t v1 = 0xD000000000000020;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000021;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD00000000000001ELL;
  }
}

uint64_t sub_1BCA3AA70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BC9F396C(*a1, *a2);
}

uint64_t sub_1BCA3AA7C()
{
  return sub_1BCA45310();
}

uint64_t sub_1BCA3AA84()
{
  return sub_1BCA45464();
}

uint64_t sub_1BCA3AA8C()
{
  return sub_1BCA4682C();
}

ManagedSettings::ManagedSettingsSettings::Name_optional sub_1BCA3AA94(Swift::String *a1)
{
  return ManagedSettingsSettings.Name.init(rawValue:)(*a1);
}

unint64_t sub_1BCA3AAA0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ManagedSettingsSettings.Name.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1BCA3AAC8(void *a1@<X8>)
{
  *a1 = &unk_1F16EE9B0;
}

uint64_t ManagedSettingsSettings.allowedClients.getter()
{
  return sub_1BCA3B270(&qword_1EBA01C00, (uint64_t)&qword_1EBA019D8, sub_1BC99D12C);
}

uint64_t ManagedSettingsSettings.allowedClients.setter(uint64_t a1)
{
  sub_1BCA3BD0C(a1);

  return swift_bridgeObjectRelease();
}

void (*ManagedSettingsSettings.allowedClients.modify(void *a1))(uint64_t *a1, char a2)
{
  unint64_t v3 = malloc(0x98uLL);
  *a1 = v3;
  unsigned int v4 = v3 + 17;
  v3[18] = v1;
  uint64_t v6 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v7 = v1[3];
  if (qword_1EBA01C00 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1BC99D12C((uint64_t)&qword_1EBA019D8, v6, v5, v8, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t *v4 = v9;
  return sub_1BCA3AC2C;
}

void sub_1BCA3AC2C(uint64_t *a1, char a2)
{
}

uint64_t ManagedSettingsSettings.effectiveAllowedClients.getter()
{
  return sub_1BCA3B7EC(&qword_1EBA01C00, (uint64_t)&qword_1EBA019D8, sub_1BC99ECD0);
}

uint64_t sub_1BCA3AC8C()
{
  qword_1EBA019D8 = MEMORY[0x1E4FBC870];
  qword_1EBA019E0 = 0xD00000000000001ELL;
  qword_1EBA019E8 = 0x80000001BCA4F820;
  qword_1EBA01A08 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAC1B8);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAC1C0, &qword_1E9FAC1B8);
  qword_1EBA01A10 = result;
  byte_1EBA019F0 = 1;
  word_1EBA01A18 = 256;
  byte_1EBA01A1A = 0;
  qword_1EBA01A20 = 0x7FFFFFFFFFFFFFFFLL;
  byte_1EBA01A28 = 0;
  return result;
}

uint64_t static ManagedSettingsSettings.allowedClients.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA129AC(&qword_1EBA01C00, (uint64_t)&qword_1EBA019D8, &qword_1EBA01C48, a1);
}

uint64_t ManagedSettingsSettings.tokenEncodingKey.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  if (qword_1E9FABD58 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DEE8((uint64_t)&xmmword_1E9FAE760, v2, v1, v4, v3, &v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

double sub_1BCA3AE08@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v7 = qword_1E9FABD58;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DEE8((uint64_t)&xmmword_1E9FAE760, v4, v3, v6, v5, &v9);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  double result = *(double *)&v9;
  *a2 = v9;
  return result;
}

uint64_t sub_1BCA3AED8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = a1[1];
  sub_1BC9A3B24(*a1, v2);
  sub_1BCA3BE9C(v1, v2);

  return sub_1BC9A3B38(v1, v2);
}

uint64_t ManagedSettingsSettings.tokenEncodingKey.setter(uint64_t a1, unint64_t a2)
{
  sub_1BCA3BE9C(a1, a2);

  return sub_1BC9A3B38(a1, a2);
}

uint64_t (*ManagedSettingsSettings.tokenEncodingKey.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD58 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DEE8((uint64_t)&xmmword_1E9FAE760, v3, v4, v6, v5, &v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = v8;
  return sub_1BCA3B054;
}

uint64_t sub_1BCA3B054(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a1;
  if (a2)
  {
    sub_1BC9A3B24(v4, v3);
    sub_1BCA3BE9C(v2, v3);
    sub_1BC9A3B38(v2, v3);
  }
  else
  {
    sub_1BCA3BE9C(v4, v3);
  }

  return sub_1BC9A3B38(v2, v3);
}

uint64_t ManagedSettingsSettings.effectiveTokenEncodingKey.getter()
{
  if (qword_1E9FABD58 != -1) {
    swift_once();
  }
  sub_1BC99F078((uint64_t *)&xmmword_1E9FAE760, (uint64_t)&v1);
  return v1;
}

uint64_t sub_1BCA3B12C()
{
  xmmword_1E9FAE760 = xmmword_1BCA4E480;
  qword_1E9FAE770 = 0xD000000000000020;
  unk_1E9FAE778 = 0x80000001BCA4F840;
  qword_1E9FAE798 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FACE28);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAE840, &qword_1E9FACE28);
  qword_1E9FAE7A0 = result;
  byte_1E9FAE780 = 0;
  word_1E9FAE7A8 = 256;
  byte_1E9FAE7AA = 0;
  qword_1E9FAE7B0 = 0;
  byte_1E9FAE7B8 = 1;
  return result;
}

uint64_t static ManagedSettingsSettings.tokenEncodingKey.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9FABD58 != -1) {
    swift_once();
  }
  return sub_1BC9AA050((uint64_t)&xmmword_1E9FAE760, a1, &qword_1E9FAE818);
}

uint64_t ManagedSettingsSettings.tokenDecodingKeys.getter()
{
  return sub_1BCA3B270(&qword_1E9FABD60, (uint64_t)&qword_1E9FAE7C0, sub_1BC99D520);
}

uint64_t sub_1BCA3B270(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *v3;
  uint64_t v6 = v3[1];
  uint64_t v9 = v3[2];
  uint64_t v8 = v3[3];
  if (*a1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = a3(a2, v7, v6, v9, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1BCA3B308@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X3>, uint64_t a3@<X4>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v10 = a1[3];
  uint64_t v12 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = a4(a3, v9, v8, v11, v10);
  swift_bridgeObjectRelease_n();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a5 = v13;
  return result;
}

uint64_t ManagedSettingsSettings.tokenDecodingKeys.setter(uint64_t a1)
{
  sub_1BCA3C07C(a1);

  return swift_bridgeObjectRelease();
}

void (*ManagedSettingsSettings.tokenDecodingKeys.modify(void *a1))(uint64_t *a1, char a2)
{
  unint64_t v3 = malloc(0x98uLL);
  *a1 = v3;
  uint64_t v4 = v3 + 17;
  v3[18] = v1;
  uint64_t v6 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v7 = v1[3];
  if (qword_1E9FABD60 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1BC99D520((uint64_t)&qword_1E9FAE7C0, v6, v5, v8, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t *v4 = v9;
  return sub_1BCA3B4F4;
}

void sub_1BCA3B4F4(uint64_t *a1, char a2)
{
}

void sub_1BCA3B51C(uint64_t *a1, char a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v8 = *a1;
  uint64_t v9 = *(void *)(*a1 + 136);
  uint64_t v10 = *(uint64_t **)(*a1 + 144);
  sub_1BC9AA050(a3, *a1, a4);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  uint64_t v14 = v10[2];
  uint64_t v13 = v10[3];
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = (void *)a5(v9);
    }
    else
    {
      uint64_t v15 = 0;
    }
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v17 = v14;
      uint64_t v18 = *(void *)(v8 + 8);
      uint64_t v19 = *(void *)(v8 + 16);
      uint64_t v25 = v12;
      uint64_t v26 = v11;
      uint64_t v27 = v17;
      uint64_t v28 = v13;
      int v20 = *(unsigned __int8 *)(v8 + 66);
      swift_retain();
      sub_1BC9A4CA8(v15, v18, v19, &v25, v20);
      swift_release();
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_1BC9A3A70(v8, a4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = (void *)a5(v9);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = 0;
    }
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v21 = v14;
      uint64_t v22 = *(void *)(v8 + 8);
      uint64_t v23 = *(void *)(v8 + 16);
      uint64_t v25 = v12;
      uint64_t v26 = v11;
      uint64_t v27 = v21;
      uint64_t v28 = v13;
      int v24 = *(unsigned __int8 *)(v8 + 66);
      swift_retain();
      sub_1BC9A4CA8(v16, v22, v23, &v25, v24);
      swift_release();
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_1BC9A3A70(v8, a4);
  }
  swift_bridgeObjectRelease();

  free((void *)v8);
}

uint64_t ManagedSettingsSettings.effectiveTokenDecodingKeys.getter()
{
  return sub_1BCA3B7EC(&qword_1E9FABD60, (uint64_t)&qword_1E9FAE7C0, sub_1BC99EE4C);
}

uint64_t sub_1BCA3B7EC(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (*a1 != -1)
  {
    uint64_t v5 = a3;
    swift_once();
    a3 = v5;
  }

  return a3(a2);
}

uint64_t sub_1BCA3B84C()
{
  qword_1E9FAE7C0 = MEMORY[0x1E4FBC870];
  qword_1E9FAE7C8 = 0xD000000000000021;
  qword_1E9FAE7D0 = 0x80000001BCA4F870;
  qword_1E9FAE7F0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FACDE0);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAD218, &qword_1E9FACDE0);
  qword_1E9FAE7F8 = result;
  byte_1E9FAE7D8 = 1;
  word_1E9FAE800 = 256;
  byte_1E9FAE802 = 0;
  qword_1E9FAE808 = 0x7FFFFFFFFFFFFFFFLL;
  byte_1E9FAE810 = 0;
  return result;
}

uint64_t static ManagedSettingsSettings.tokenDecodingKeys.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA129AC(&qword_1E9FABD60, (uint64_t)&qword_1E9FAE7C0, &qword_1E9FAD1E8, a1);
}

uint64_t ManagedSettingsSettings.customMirror.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v2 = sub_1BCA48DA8();
  uint64_t v28 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  MEMORY[0x1F4188790](v2, v3);
  uint64_t v27 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA8);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v1;
  uint64_t v9 = v1[1];
  uint64_t v12 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v32 = *v1;
  uint64_t v33 = v9;
  uint64_t v34 = v12;
  uint64_t v35 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB0);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1BCA49BD0;
  uint64_t v14 = qword_1EBA01C00;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_1EBA019E8;
  *(void *)(v13 + 32) = qword_1EBA019E0;
  *(void *)(v13 + 40) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_1BC99D12C((uint64_t)&qword_1EBA019D8, v10, v9, v12, v11);
  uint64_t v17 = sub_1BC99ECD0((uint64_t)&qword_1EBA019D8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v13 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAC188);
  *(void *)(v13 + 48) = v16;
  *(void *)(v13 + 56) = v17;
  if (qword_1E9FABD58 != -1) {
    swift_once();
  }
  uint64_t v18 = unk_1E9FAE778;
  *(void *)(v13 + 80) = qword_1E9FAE770;
  *(void *)(v13 + 88) = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99DEE8((uint64_t)&xmmword_1E9FAE760, v10, v9, v12, v11, &v31);
  long long v19 = v31;
  sub_1BC99F078((uint64_t *)&xmmword_1E9FAE760, (uint64_t)&v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v20 = v31;
  *(void *)(v13 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE820);
  uint64_t v21 = swift_allocObject();
  *(void *)(v13 + 96) = v21;
  *(_OWORD *)(v21 + 16) = v19;
  *(_OWORD *)(v21 + 32) = v20;
  if (qword_1E9FABD60 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_1E9FAE7D0;
  *(void *)(v13 + 128) = qword_1E9FAE7C8;
  *(void *)(v13 + 136) = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_1BC99D520((uint64_t)&qword_1E9FAE7C0, v10, v9, v12, v11);
  uint64_t v24 = sub_1BC99EE4C((uint64_t)&qword_1E9FAE7C0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v13 + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAD1F8);
  *(void *)(v13 + 144) = v23;
  *(void *)(v13 + 152) = v24;
  uint64_t v25 = sub_1BCA48D98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v8, 1, 1, v25);
  (*(void (**)(char *, void, uint64_t))(v28 + 104))(v27, *MEMORY[0x1E4FBC430], v29);
  return sub_1BCA48DB8();
}

uint64_t sub_1BCA3BD0C(uint64_t a1)
{
  if (qword_1EBA01C00 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1EBA019D8, (uint64_t)v13, &qword_1EBA01C48);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (a1)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_1BC9AC368(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v8 = v14;
    uint64_t v9 = v15;
    v12[0] = v4;
    v12[1] = v3;
    long long v12[2] = v6;
    v12[3] = v5;
    int v10 = v16;
    swift_retain();
    sub_1BC9A4CA8(v7, v8, v9, v12, v10);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BC9A3A70((uint64_t)v13, &qword_1EBA01C48);
}

uint64_t sub_1BCA3BE9C(uint64_t a1, unint64_t a2)
{
  if (qword_1E9FABD58 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&xmmword_1E9FAE760, (uint64_t)v17, &qword_1E9FAE818);
  uint64_t v6 = *v2;
  uint64_t v5 = v2[1];
  uint64_t v8 = v2[2];
  uint64_t v7 = v2[3];
  if (a2 >> 60 == 15)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v9 = 0;
  }
  else
  {
    id v10 = objc_allocWithZone(MEMORY[0x1E4F1C9B8]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BC9A3B24(a1, a2);
    uint64_t v11 = (void *)sub_1BCA48428();
    id v9 = objc_msgSend(v10, sel_initWithData_, v11);

    sub_1BC9A3B38(a1, a2);
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v12 = v18;
    uint64_t v13 = v19;
    v16[0] = v6;
    v16[1] = v5;
    v16[2] = v8;
    v16[3] = v7;
    int v14 = v20;
    swift_retain();
    sub_1BC9A4CA8(v9, v12, v13, v16, v14);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BC9A3A70((uint64_t)v17, &qword_1E9FAE818);
}

uint64_t sub_1BCA3C07C(uint64_t a1)
{
  if (qword_1E9FABD60 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAE7C0, (uint64_t)v13, &qword_1E9FAD1E8);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (a1)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_1BC9ACDA0(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v8 = v14;
    uint64_t v9 = v15;
    v12[0] = v4;
    v12[1] = v3;
    long long v12[2] = v6;
    v12[3] = v5;
    int v10 = v16;
    swift_retain();
    sub_1BC9A4CA8(v7, v8, v9, v12, v10);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BC9A3A70((uint64_t)v13, &qword_1E9FAD1E8);
}

uint64_t sub_1BCA3C20C()
{
  unint64_t v1 = v0[3];
  if (v1 >> 60 != 15) {
    sub_1BC9A3ACC(v0[2], v1);
  }
  unint64_t v2 = v0[5];
  if (v2 >> 60 != 15) {
    sub_1BC9A3ACC(v0[4], v2);
  }

  return MEMORY[0x1F4186498](v0, 48, 7);
}

unint64_t sub_1BCA3C270()
{
  unint64_t result = qword_1E9FAE828;
  if (!qword_1E9FAE828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE828);
  }
  return result;
}

uint64_t sub_1BCA3C2C4()
{
  return sub_1BC9ADEBC(&qword_1E9FAE830, &qword_1E9FAE838);
}

uint64_t sub_1BCA3C300@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BCA3B308(a1, &qword_1EBA01C00, (uint64_t)&qword_1EBA019D8, sub_1BC99D12C, a2);
}

uint64_t sub_1BCA3C34C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_1(a1, a2, a3, a4, (void (*)(uint64_t))sub_1BCA3BD0C);
}

uint64_t sub_1BCA3C36C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BCA3B308(a1, &qword_1E9FABD60, (uint64_t)&qword_1E9FAE7C0, sub_1BC99D520, a2);
}

uint64_t sub_1BCA3C3B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_1(a1, a2, a3, a4, (void (*)(uint64_t))sub_1BCA3C07C);
}

uint64_t keypath_setTm_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v6 = swift_bridgeObjectRetain();
  a5(v6);

  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for ManagedSettingsSettings()
{
  return &type metadata for ManagedSettingsSettings;
}

unsigned char *storeEnumTagSinglePayload for ManagedSettingsSettings.Name(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BCA3C500);
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

ValueMetadata *type metadata accessor for ManagedSettingsSettings.Name()
{
  return &type metadata for ManagedSettingsSettings.Name;
}

void sub_1BCA3C538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1BCA48368();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_1BCA3C5A8(uint64_t a1)
{
}

void sub_1BCA3C5BC(uint64_t a1)
{
}

void *sub_1BCA3C6F8()
{
  uint64_t v1 = OBJC_IVAR____TtC15ManagedSettings32OverrideSettingsExtensionContext____lazy_storage___overrideSettingsHandler;
  unint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC15ManagedSettings32OverrideSettingsExtensionContext____lazy_storage___overrideSettingsHandler];
  int v3 = v2;
  if (v2 == (void *)1)
  {
    if (objc_msgSend(v0, sel__principalObject))
    {
      type metadata accessor for OverrideSettingsHandler();
      int v3 = (void *)swift_dynamicCastClass();
      if (!v3) {
        swift_unknownObjectRelease();
      }
    }
    else
    {
      int v3 = 0;
    }
    unsigned int v4 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v3;
    id v5 = v3;
    sub_1BC9B0C24(v4);
  }
  sub_1BC9B0C34(v2);
  return v3;
}

id sub_1BCA3C9D8(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC15ManagedSettings32OverrideSettingsExtensionContext____lazy_storage___overrideSettingsHandler] = 1;
  if (a1)
  {
    unint64_t v2 = (void *)sub_1BCA48888();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v2 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for OverrideSettingsExtensionContext();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithInputItems_, v2);

  if (v3) {
  return v3;
  }
}

id sub_1BCA3CABC(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v6 - 8, v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v3[OBJC_IVAR____TtC15ManagedSettings32OverrideSettingsExtensionContext____lazy_storage___overrideSettingsHandler] = 1;
  if (a1)
  {
    int v10 = (void *)sub_1BCA48888();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v10 = 0;
  }
  sub_1BC9B0C44(a2, (uint64_t)v9);
  uint64_t v11 = sub_1BCA484B8();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1)
  {
    uint64_t v13 = (void *)sub_1BCA48498();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
  }
  uint64_t v14 = (objc_class *)type metadata accessor for OverrideSettingsExtensionContext();
  v18.receiver = v3;
  v18.super_class = v14;
  id v15 = objc_msgSendSuper2(&v18, sel_initWithInputItems_contextUUID_, v10, v13);

  id v16 = v15;
  sub_1BC9B0CAC(a2);
  if (v16) {

  }
  return v16;
}

id sub_1BCA3CD88(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE30);
  MEMORY[0x1F4188790](v8 - 8, v9);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v4[OBJC_IVAR____TtC15ManagedSettings32OverrideSettingsExtensionContext____lazy_storage___overrideSettingsHandler] = 1;
  if (a1)
  {
    uint64_t v12 = (void *)sub_1BCA48888();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  sub_1BC9B0C44(a3, (uint64_t)v11);
  uint64_t v13 = sub_1BCA484B8();
  uint64_t v14 = *(void *)(v13 - 8);
  id v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13) != 1)
  {
    id v15 = (void *)sub_1BCA48498();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
  }
  id v16 = (objc_class *)type metadata accessor for OverrideSettingsExtensionContext();
  v20.receiver = v4;
  v20.super_class = v16;
  id v17 = objc_msgSendSuper2(&v20, sel_initWithInputItems_listenerEndpoint_contextUUID_, v12, a2, v15);

  id v18 = v17;
  sub_1BC9B0CAC(a3);
  if (v18) {

  }
  return v18;
}

id sub_1BCA3D074()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OverrideSettingsExtensionContext();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for OverrideSettingsExtensionContext()
{
  return self;
}

uint64_t sub_1BCA3D0DC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

unint64_t sub_1BCA3D114()
{
  unint64_t result = qword_1E9FAE860;
  if (!qword_1E9FAE860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE860);
  }
  return result;
}

uint64_t sub_1BCA3D168()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1BCA3D1A0(unsigned __int8 *a1)
{
  sub_1BC9B0378(a1, *(void (**)(id, void))(v1 + 16));
}

unsigned char *storeEnumTagSinglePayload for OverrideSettingsExtensionContext.ExtensionError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1BCA3D244);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for OverrideSettingsExtensionContext.ExtensionError()
{
  return &type metadata for OverrideSettingsExtensionContext.ExtensionError;
}

unint64_t sub_1BCA3D280()
{
  unint64_t result = qword_1E9FAE880;
  if (!qword_1E9FAE880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE880);
  }
  return result;
}

uint64_t static SettingMetadataDirectory.metadata(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (qword_1E9FABD78 != -1) {
    swift_once();
  }
  uint64_t v6 = off_1E9FAE888;
  if (*((void *)off_1E9FAE888 + 2))
  {
    swift_bridgeObjectRetain();
    unint64_t v7 = sub_1BC9A69D0(a1, a2);
    if (v8)
    {
      sub_1BC9BE1A8(v6[7] + 40 * v7, (uint64_t)&v11);
      swift_bridgeObjectRelease();
      if (*((void *)&v12 + 1)) {
        return sub_1BC9A9FF0(&v11, a3);
      }
    }
    else
    {
      uint64_t v13 = 0;
      long long v11 = 0u;
      long long v12 = 0u;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
  }
  sub_1BCA405D0((uint64_t)&v11);
  sub_1BC9F2D60();
  swift_allocError();
  *uint64_t v10 = 1;
  return swift_willThrow();
}

void *sub_1BCA3D404()
{
  unint64_t result = (void *)sub_1BCA3D424();
  off_1E9FAE888 = result;
  return result;
}

unint64_t sub_1BCA3D424()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE898);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1BCA4E6C0;
  if (qword_1E9FAB9C0 != -1) {
    swift_once();
  }
  uint64_t v1 = unk_1E9FAB9D8;
  *(void *)(v0 + 32) = qword_1E9FAB9D0;
  *(void *)(v0 + 40) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA0);
  *(void *)(v0 + 72) = v2;
  uint64_t v3 = sub_1BCA41414(&qword_1E9FAE8A0, &qword_1E9FABDA0);
  *(void *)(v0 + 80) = v3;
  uint64_t v4 = swift_allocObject();
  *(void *)(v0 + 48) = v4;
  sub_1BC9AA050((uint64_t)&byte_1E9FAB9C8, v4 + 16, &qword_1E9FABDA0);
  uint64_t v5 = qword_1E9FABA20;
  swift_bridgeObjectRetain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = unk_1E9FABA38;
  *(void *)(v0 + 88) = qword_1E9FABA30;
  *(void *)(v0 + 96) = v6;
  *(void *)(v0 + 128) = v2;
  *(void *)(v0 + 136) = v3;
  uint64_t v7 = swift_allocObject();
  *(void *)(v0 + 104) = v7;
  sub_1BC9AA050((uint64_t)&byte_1E9FABA28, v7 + 16, &qword_1E9FABDA0);
  uint64_t v8 = qword_1E9FABD50;
  swift_bridgeObjectRetain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = unk_1E9FAE700;
  *(void *)(v0 + 144) = qword_1E9FAE6F8;
  *(void *)(v0 + 152) = v9;
  *(void *)(v0 + 184) = v2;
  *(void *)(v0 + 192) = v3;
  uint64_t v10 = swift_allocObject();
  *(void *)(v0 + 160) = v10;
  sub_1BC9AA050((uint64_t)&byte_1E9FAE6F0, v10 + 16, &qword_1E9FABDA0);
  uint64_t v11 = qword_1EBA01AF8;
  swift_bridgeObjectRetain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_1EBA01AB0;
  *(void *)(v0 + 200) = qword_1EBA01AA8;
  *(void *)(v0 + 208) = v12;
  *(void *)(v0 + 240) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01C40);
  *(void *)(v0 + 248) = sub_1BCA41414(&qword_1E9FAE8A8, &qword_1EBA01C40);
  uint64_t v13 = swift_allocObject();
  *(void *)(v0 + 216) = v13;
  sub_1BC9AA050((uint64_t)&qword_1EBA01A78, v13 + 16, &qword_1EBA01C40);
  uint64_t v14 = qword_1E9FABBC8;
  swift_bridgeObjectRetain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = unk_1E9FAD148;
  *(void *)(v0 + 256) = qword_1E9FAD140;
  *(void *)(v0 + 264) = v15;
  *(void *)(v0 + 296) = v2;
  *(void *)(v0 + 304) = v3;
  uint64_t v16 = swift_allocObject();
  *(void *)(v0 + 272) = v16;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD138, v16 + 16, &qword_1E9FABDA0);
  uint64_t v17 = qword_1E9FABBD0;
  swift_bridgeObjectRetain();
  if (v17 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_1E9FAD1A0;
  *(void *)(v0 + 312) = qword_1E9FAD198;
  *(void *)(v0 + 320) = v18;
  uint64_t v285 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAD1E8);
  *(void *)(v0 + 352) = v285;
  unint64_t v284 = sub_1BCA409B0();
  *(void *)(v0 + 360) = v284;
  uint64_t v19 = swift_allocObject();
  *(void *)(v0 + 328) = v19;
  sub_1BC9AA050((uint64_t)&qword_1E9FAD190, v19 + 16, &qword_1E9FAD1E8);
  uint64_t v20 = qword_1E9FABA90;
  swift_bridgeObjectRetain();
  if (v20 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_1E9FABF88;
  *(void *)(v0 + 368) = qword_1E9FABF80;
  *(void *)(v0 + 376) = v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01C48);
  *(void *)(v0 + 408) = v22;
  unint64_t v23 = sub_1BCA40A54();
  *(void *)(v0 + 416) = v23;
  uint64_t v24 = swift_allocObject();
  *(void *)(v0 + 384) = v24;
  sub_1BC9AA050((uint64_t)&qword_1E9FABF78, v24 + 16, &qword_1EBA01C48);
  uint64_t v25 = qword_1E9FABA98;
  swift_bridgeObjectRetain();
  if (v25 != -1) {
    swift_once();
  }
  uint64_t v26 = unk_1E9FABFE0;
  *(void *)(v0 + 424) = qword_1E9FABFD8;
  *(void *)(v0 + 432) = v26;
  *(void *)(v0 + 464) = v2;
  *(void *)(v0 + 472) = v3;
  uint64_t v27 = swift_allocObject();
  *(void *)(v0 + 440) = v27;
  sub_1BC9AA050((uint64_t)&byte_1E9FABFD0, v27 + 16, &qword_1E9FABDA0);
  uint64_t v28 = qword_1E9FABAA0;
  swift_bridgeObjectRetain();
  if (v28 != -1) {
    swift_once();
  }
  uint64_t v29 = unk_1E9FAC038;
  *(void *)(v0 + 480) = qword_1E9FAC030;
  *(void *)(v0 + 488) = v29;
  *(void *)(v0 + 520) = v2;
  *(void *)(v0 + 528) = v3;
  uint64_t v30 = swift_allocObject();
  *(void *)(v0 + 496) = v30;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC028, v30 + 16, &qword_1E9FABDA0);
  uint64_t v31 = qword_1E9FABAA8;
  swift_bridgeObjectRetain();
  if (v31 != -1) {
    swift_once();
  }
  uint64_t v32 = unk_1E9FAC090;
  *(void *)(v0 + 536) = qword_1E9FAC088;
  *(void *)(v0 + 544) = v32;
  *(void *)(v0 + 576) = v2;
  *(void *)(v0 + 584) = v3;
  uint64_t v33 = swift_allocObject();
  *(void *)(v0 + 552) = v33;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC080, v33 + 16, &qword_1E9FABDA0);
  uint64_t v34 = qword_1E9FABAB0;
  swift_bridgeObjectRetain();
  if (v34 != -1) {
    swift_once();
  }
  uint64_t v35 = unk_1E9FAC0E8;
  *(void *)(v0 + 592) = qword_1E9FAC0E0;
  *(void *)(v0 + 600) = v35;
  *(void *)(v0 + 632) = v2;
  *(void *)(v0 + 640) = v3;
  uint64_t v36 = swift_allocObject();
  *(void *)(v0 + 608) = v36;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC0D8, v36 + 16, &qword_1E9FABDA0);
  uint64_t v37 = qword_1E9FABAB8;
  swift_bridgeObjectRetain();
  if (v37 != -1) {
    swift_once();
  }
  uint64_t v38 = qword_1E9FAC140;
  *(void *)(v0 + 648) = qword_1E9FAC138;
  *(void *)(v0 + 656) = v38;
  *(void *)(v0 + 688) = v22;
  *(void *)(v0 + 696) = v23;
  uint64_t v39 = swift_allocObject();
  *(void *)(v0 + 664) = v39;
  sub_1BC9AA050((uint64_t)&qword_1E9FAC130, v39 + 16, &qword_1EBA01C48);
  uint64_t v40 = qword_1E9FABB00;
  swift_bridgeObjectRetain();
  if (v40 != -1) {
    swift_once();
  }
  uint64_t v41 = unk_1E9FAC558;
  *(void *)(v0 + 704) = qword_1E9FAC550;
  *(void *)(v0 + 712) = v41;
  *(void *)(v0 + 744) = v2;
  *(void *)(v0 + 752) = v3;
  uint64_t v42 = swift_allocObject();
  *(void *)(v0 + 720) = v42;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC548, v42 + 16, &qword_1E9FABDA0);
  uint64_t v43 = qword_1E9FABB08;
  swift_bridgeObjectRetain();
  if (v43 != -1) {
    swift_once();
  }
  uint64_t v44 = unk_1E9FAC5B0;
  *(void *)(v0 + 760) = qword_1E9FAC5A8;
  *(void *)(v0 + 768) = v44;
  *(void *)(v0 + 800) = v2;
  *(void *)(v0 + 808) = v3;
  uint64_t v45 = swift_allocObject();
  *(void *)(v0 + 776) = v45;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC5A0, v45 + 16, &qword_1E9FABDA0);
  uint64_t v46 = qword_1E9FABB10;
  swift_bridgeObjectRetain();
  if (v46 != -1) {
    swift_once();
  }
  uint64_t v47 = unk_1E9FAC608;
  *(void *)(v0 + 816) = qword_1E9FAC600;
  *(void *)(v0 + 824) = v47;
  *(void *)(v0 + 856) = v2;
  *(void *)(v0 + 864) = v3;
  uint64_t v48 = swift_allocObject();
  *(void *)(v0 + 832) = v48;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC5F8, v48 + 16, &qword_1E9FABDA0);
  uint64_t v49 = qword_1E9FABB18;
  swift_bridgeObjectRetain();
  if (v49 != -1) {
    swift_once();
  }
  uint64_t v50 = unk_1E9FAC660;
  *(void *)(v0 + 872) = qword_1E9FAC658;
  *(void *)(v0 + 880) = v50;
  *(void *)(v0 + 912) = v2;
  *(void *)(v0 + 920) = v3;
  uint64_t v51 = swift_allocObject();
  *(void *)(v0 + 888) = v51;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC650, v51 + 16, &qword_1E9FABDA0);
  uint64_t v52 = qword_1E9FABB20;
  swift_bridgeObjectRetain();
  if (v52 != -1) {
    swift_once();
  }
  uint64_t v53 = qword_1E9FAC6C8;
  *(void *)(v0 + 928) = qword_1E9FAC6C0;
  *(void *)(v0 + 936) = v53;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01890);
  *(void *)(v0 + 968) = v54;
  uint64_t v55 = sub_1BCA41414(&qword_1E9FAE8D0, &qword_1EBA01890);
  *(void *)(v0 + 976) = v55;
  uint64_t v56 = swift_allocObject();
  *(void *)(v0 + 944) = v56;
  sub_1BC9AA050((uint64_t)&xmmword_1E9FAC6A8, v56 + 16, &qword_1EBA01890);
  uint64_t v57 = qword_1E9FABB28;
  swift_bridgeObjectRetain();
  if (v57 != -1) {
    swift_once();
  }
  uint64_t v58 = unk_1E9FAC710;
  *(void *)(v0 + 984) = qword_1E9FAC708;
  *(void *)(v0 + 992) = v58;
  *(void *)(v0 + 1024) = v2;
  *(void *)(v0 + 1032) = v3;
  uint64_t v59 = swift_allocObject();
  *(void *)(v0 + 1000) = v59;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC700, v59 + 16, &qword_1E9FABDA0);
  uint64_t v60 = qword_1E9FABCA8;
  swift_bridgeObjectRetain();
  if (v60 != -1) {
    swift_once();
  }
  uint64_t v61 = unk_1E9FADD70;
  *(void *)(v0 + 1040) = qword_1E9FADD68;
  *(void *)(v0 + 1048) = v61;
  *(void *)(v0 + 1080) = v2;
  *(void *)(v0 + 1088) = v3;
  uint64_t v62 = swift_allocObject();
  *(void *)(v0 + 1056) = v62;
  sub_1BC9AA050((uint64_t)&byte_1E9FADD60, v62 + 16, &qword_1E9FABDA0);
  uint64_t v63 = qword_1E9FABD28;
  swift_bridgeObjectRetain();
  if (v63 != -1) {
    swift_once();
  }
  uint64_t v64 = unk_1E9FAE518;
  *(void *)(v0 + 1096) = qword_1E9FAE510;
  *(void *)(v0 + 1104) = v64;
  *(void *)(v0 + 1136) = v2;
  *(void *)(v0 + 1144) = v3;
  uint64_t v65 = swift_allocObject();
  *(void *)(v0 + 1112) = v65;
  sub_1BC9AA050((uint64_t)&byte_1E9FAE508, v65 + 16, &qword_1E9FABDA0);
  uint64_t v66 = qword_1E9FABD30;
  swift_bridgeObjectRetain();
  if (v66 != -1) {
    swift_once();
  }
  uint64_t v67 = unk_1E9FAE570;
  *(void *)(v0 + 1152) = qword_1E9FAE568;
  *(void *)(v0 + 1160) = v67;
  *(void *)(v0 + 1192) = v2;
  *(void *)(v0 + 1200) = v3;
  uint64_t v68 = swift_allocObject();
  *(void *)(v0 + 1168) = v68;
  sub_1BC9AA050((uint64_t)&byte_1E9FAE560, v68 + 16, &qword_1E9FABDA0);
  uint64_t v69 = qword_1E9FABCA0;
  swift_bridgeObjectRetain();
  if (v69 != -1) {
    swift_once();
  }
  uint64_t v70 = unk_1E9FADD00;
  *(void *)(v0 + 1208) = qword_1E9FADCF8;
  *(void *)(v0 + 1216) = v70;
  *(void *)(v0 + 1248) = v2;
  *(void *)(v0 + 1256) = v3;
  uint64_t v71 = swift_allocObject();
  *(void *)(v0 + 1224) = v71;
  sub_1BC9AA050((uint64_t)&byte_1E9FADCF0, v71 + 16, &qword_1E9FABDA0);
  uint64_t v72 = qword_1E9FABB60;
  swift_bridgeObjectRetain();
  if (v72 != -1) {
    swift_once();
  }
  uint64_t v73 = unk_1E9FAC830;
  *(void *)(v0 + 1264) = qword_1E9FAC828;
  *(void *)(v0 + 1272) = v73;
  *(void *)(v0 + 1304) = v2;
  *(void *)(v0 + 1312) = v3;
  uint64_t v74 = swift_allocObject();
  *(void *)(v0 + 1280) = v74;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC820, v74 + 16, &qword_1E9FABDA0);
  uint64_t v75 = qword_1E9FABB68;
  swift_bridgeObjectRetain();
  if (v75 != -1) {
    swift_once();
  }
  uint64_t v76 = unk_1E9FAC888;
  *(void *)(v0 + 1320) = qword_1E9FAC880;
  *(void *)(v0 + 1328) = v76;
  *(void *)(v0 + 1360) = v2;
  *(void *)(v0 + 1368) = v3;
  uint64_t v77 = swift_allocObject();
  *(void *)(v0 + 1336) = v77;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC878, v77 + 16, &qword_1E9FABDA0);
  uint64_t v78 = qword_1E9FABB70;
  swift_bridgeObjectRetain();
  if (v78 != -1) {
    swift_once();
  }
  uint64_t v79 = unk_1E9FAC8E0;
  *(void *)(v0 + 1376) = qword_1E9FAC8D8;
  *(void *)(v0 + 1384) = v79;
  *(void *)(v0 + 1416) = v2;
  *(void *)(v0 + 1424) = v3;
  uint64_t v80 = swift_allocObject();
  *(void *)(v0 + 1392) = v80;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC8D0, v80 + 16, &qword_1E9FABDA0);
  uint64_t v81 = qword_1E9FABC98;
  swift_bridgeObjectRetain();
  if (v81 != -1) {
    swift_once();
  }
  uint64_t v82 = unk_1E9FADC88;
  *(void *)(v0 + 1432) = qword_1E9FADC80;
  *(void *)(v0 + 1440) = v82;
  *(void *)(v0 + 1472) = v2;
  *(void *)(v0 + 1480) = v3;
  uint64_t v83 = swift_allocObject();
  *(void *)(v0 + 1448) = v83;
  sub_1BC9AA050((uint64_t)&byte_1E9FADC78, v83 + 16, &qword_1E9FABDA0);
  uint64_t v84 = qword_1E9FABD88;
  swift_bridgeObjectRetain();
  if (v84 != -1) {
    swift_once();
  }
  uint64_t v85 = qword_1E9FAEAE0;
  *(void *)(v0 + 1488) = qword_1E9FAEAD8;
  *(void *)(v0 + 1496) = v85;
  *(void *)(v0 + 1528) = v22;
  *(void *)(v0 + 1536) = v23;
  uint64_t v86 = swift_allocObject();
  *(void *)(v0 + 1504) = v86;
  sub_1BC9AA050((uint64_t)&qword_1E9FAEAD0, v86 + 16, &qword_1EBA01C48);
  uint64_t v87 = qword_1E9FABD98;
  swift_bridgeObjectRetain();
  if (v87 != -1) {
    swift_once();
  }
  uint64_t v88 = unk_1E9FAEB90;
  *(void *)(v0 + 1544) = qword_1E9FAEB88;
  *(void *)(v0 + 1552) = v88;
  *(void *)(v0 + 1584) = v2;
  *(void *)(v0 + 1592) = v3;
  uint64_t v89 = swift_allocObject();
  *(void *)(v0 + 1560) = v89;
  sub_1BC9AA050((uint64_t)&byte_1E9FAEB80, v89 + 16, &qword_1E9FABDA0);
  uint64_t v90 = qword_1E9FABD90;
  swift_bridgeObjectRetain();
  if (v90 != -1) {
    swift_once();
  }
  uint64_t v91 = qword_1E9FAEB38;
  *(void *)(v0 + 1600) = qword_1E9FAEB30;
  *(void *)(v0 + 1608) = v91;
  *(void *)(v0 + 1640) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE8D8);
  *(void *)(v0 + 1648) = sub_1BCA40B38();
  uint64_t v92 = swift_allocObject();
  *(void *)(v0 + 1616) = v92;
  sub_1BC9AA050((uint64_t)&qword_1E9FAEB28, v92 + 16, &qword_1E9FAE8D8);
  uint64_t v93 = qword_1E9FABAE8;
  swift_bridgeObjectRetain();
  if (v93 != -1) {
    swift_once();
  }
  uint64_t v94 = unk_1E9FAC478;
  *(void *)(v0 + 1656) = qword_1E9FAC470;
  *(void *)(v0 + 1664) = v94;
  *(void *)(v0 + 1696) = v2;
  *(void *)(v0 + 1704) = v3;
  uint64_t v95 = swift_allocObject();
  *(void *)(v0 + 1672) = v95;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC468, v95 + 16, &qword_1E9FABDA0);
  uint64_t v96 = qword_1E9FABAF0;
  swift_bridgeObjectRetain();
  if (v96 != -1) {
    swift_once();
  }
  uint64_t v97 = unk_1E9FAC4D0;
  *(void *)(v0 + 1712) = qword_1E9FAC4C8;
  *(void *)(v0 + 1720) = v97;
  *(void *)(v0 + 1752) = v2;
  *(void *)(v0 + 1760) = v3;
  uint64_t v98 = swift_allocObject();
  *(void *)(v0 + 1728) = v98;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC4C0, v98 + 16, &qword_1E9FABDA0);
  uint64_t v99 = qword_1E9FABCB8;
  swift_bridgeObjectRetain();
  if (v99 != -1) {
    swift_once();
  }
  uint64_t v100 = unk_1E9FADE50;
  *(void *)(v0 + 1768) = qword_1E9FADE48;
  *(void *)(v0 + 1776) = v100;
  *(void *)(v0 + 1808) = v2;
  *(void *)(v0 + 1816) = v3;
  uint64_t v101 = swift_allocObject();
  *(void *)(v0 + 1784) = v101;
  sub_1BC9AA050((uint64_t)&byte_1E9FADE40, v101 + 16, &qword_1E9FABDA0);
  uint64_t v102 = qword_1E9FABBD8;
  swift_bridgeObjectRetain();
  if (v102 != -1) {
    swift_once();
  }
  uint64_t v103 = unk_1E9FAD238;
  *(void *)(v0 + 1824) = qword_1E9FAD230;
  *(void *)(v0 + 1832) = v103;
  *(void *)(v0 + 1864) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAD540);
  *(void *)(v0 + 1872) = sub_1BCA41414(&qword_1E9FAE8F0, &qword_1E9FAD540);
  uint64_t v104 = swift_allocObject();
  *(void *)(v0 + 1840) = v104;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD228, v104 + 16, &qword_1E9FAD540);
  uint64_t v105 = qword_1E9FABBE0;
  swift_bridgeObjectRetain();
  if (v105 != -1) {
    swift_once();
  }
  uint64_t v106 = unk_1E9FAD290;
  *(void *)(v0 + 1880) = qword_1E9FAD288;
  *(void *)(v0 + 1888) = v106;
  *(void *)(v0 + 1920) = v2;
  *(void *)(v0 + 1928) = v3;
  uint64_t v107 = swift_allocObject();
  *(void *)(v0 + 1896) = v107;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD280, v107 + 16, &qword_1E9FABDA0);
  uint64_t v108 = qword_1E9FABBE8;
  swift_bridgeObjectRetain();
  if (v108 != -1) {
    swift_once();
  }
  uint64_t v109 = unk_1E9FAD2E8;
  *(void *)(v0 + 1936) = qword_1E9FAD2E0;
  *(void *)(v0 + 1944) = v109;
  *(void *)(v0 + 1976) = v2;
  *(void *)(v0 + 1984) = v3;
  uint64_t v110 = swift_allocObject();
  *(void *)(v0 + 1952) = v110;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD2D8, v110 + 16, &qword_1E9FABDA0);
  uint64_t v111 = qword_1E9FABBF0;
  swift_bridgeObjectRetain();
  if (v111 != -1) {
    swift_once();
  }
  uint64_t v112 = unk_1E9FAD340;
  *(void *)(v0 + 1992) = qword_1E9FAD338;
  *(void *)(v0 + 2000) = v112;
  *(void *)(v0 + 2032) = v2;
  *(void *)(v0 + 2040) = v3;
  uint64_t v113 = swift_allocObject();
  *(void *)(v0 + 2008) = v113;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD330, v113 + 16, &qword_1E9FABDA0);
  uint64_t v114 = qword_1E9FABBF8;
  swift_bridgeObjectRetain();
  if (v114 != -1) {
    swift_once();
  }
  uint64_t v115 = unk_1E9FAD398;
  *(void *)(v0 + 2048) = qword_1E9FAD390;
  *(void *)(v0 + 2056) = v115;
  *(void *)(v0 + 2088) = v2;
  *(void *)(v0 + 2096) = v3;
  uint64_t v116 = swift_allocObject();
  *(void *)(v0 + 2064) = v116;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD388, v116 + 16, &qword_1E9FABDA0);
  uint64_t v117 = qword_1E9FABC00;
  swift_bridgeObjectRetain();
  if (v117 != -1) {
    swift_once();
  }
  uint64_t v118 = unk_1E9FAD3F0;
  *(void *)(v0 + 2104) = qword_1E9FAD3E8;
  *(void *)(v0 + 2112) = v118;
  *(void *)(v0 + 2144) = v2;
  *(void *)(v0 + 2152) = v3;
  uint64_t v119 = swift_allocObject();
  *(void *)(v0 + 2120) = v119;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD3E0, v119 + 16, &qword_1E9FABDA0);
  uint64_t v120 = qword_1E9FABC08;
  swift_bridgeObjectRetain();
  if (v120 != -1) {
    swift_once();
  }
  uint64_t v121 = unk_1E9FAD448;
  *(void *)(v0 + 2160) = qword_1E9FAD440;
  *(void *)(v0 + 2168) = v121;
  *(void *)(v0 + 2200) = v2;
  *(void *)(v0 + 2208) = v3;
  uint64_t v122 = swift_allocObject();
  *(void *)(v0 + 2176) = v122;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD438, v122 + 16, &qword_1E9FABDA0);
  uint64_t v123 = qword_1E9FABC10;
  swift_bridgeObjectRetain();
  if (v123 != -1) {
    swift_once();
  }
  uint64_t v124 = unk_1E9FAD4A0;
  *(void *)(v0 + 2216) = qword_1E9FAD498;
  *(void *)(v0 + 2224) = v124;
  *(void *)(v0 + 2256) = v2;
  *(void *)(v0 + 2264) = v3;
  uint64_t v125 = swift_allocObject();
  *(void *)(v0 + 2232) = v125;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD490, v125 + 16, &qword_1E9FABDA0);
  uint64_t v126 = qword_1E9FABC18;
  swift_bridgeObjectRetain();
  if (v126 != -1) {
    swift_once();
  }
  uint64_t v127 = unk_1E9FAD4F8;
  *(void *)(v0 + 2272) = qword_1E9FAD4F0;
  *(void *)(v0 + 2280) = v127;
  *(void *)(v0 + 2312) = v2;
  *(void *)(v0 + 2320) = v3;
  uint64_t v128 = swift_allocObject();
  *(void *)(v0 + 2288) = v128;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD4E8, v128 + 16, &qword_1E9FABDA0);
  uint64_t v129 = qword_1E9FABB80;
  swift_bridgeObjectRetain();
  if (v129 != -1) {
    swift_once();
  }
  uint64_t v130 = unk_1E9FACAE0;
  *(void *)(v0 + 2328) = qword_1E9FACAD8;
  *(void *)(v0 + 2336) = v130;
  *(void *)(v0 + 2368) = v2;
  *(void *)(v0 + 2376) = v3;
  uint64_t v131 = swift_allocObject();
  *(void *)(v0 + 2344) = v131;
  sub_1BC9AA050((uint64_t)&byte_1E9FACAD0, v131 + 16, &qword_1E9FABDA0);
  uint64_t v132 = qword_1E9FABB88;
  swift_bridgeObjectRetain();
  if (v132 != -1) {
    swift_once();
  }
  uint64_t v133 = unk_1E9FACB38;
  *(void *)(v0 + 2384) = qword_1E9FACB30;
  *(void *)(v0 + 2392) = v133;
  *(void *)(v0 + 2424) = v2;
  *(void *)(v0 + 2432) = v3;
  uint64_t v134 = swift_allocObject();
  *(void *)(v0 + 2400) = v134;
  sub_1BC9AA050((uint64_t)&byte_1E9FACB28, v134 + 16, &qword_1E9FABDA0);
  uint64_t v135 = qword_1E9FABB90;
  swift_bridgeObjectRetain();
  if (v135 != -1) {
    swift_once();
  }
  uint64_t v136 = unk_1E9FACB90;
  *(void *)(v0 + 2440) = qword_1E9FACB88;
  *(void *)(v0 + 2448) = v136;
  *(void *)(v0 + 2480) = v2;
  *(void *)(v0 + 2488) = v3;
  uint64_t v137 = swift_allocObject();
  *(void *)(v0 + 2456) = v137;
  sub_1BC9AA050((uint64_t)&byte_1E9FACB80, v137 + 16, &qword_1E9FABDA0);
  uint64_t v138 = qword_1E9FABB98;
  swift_bridgeObjectRetain();
  if (v138 != -1) {
    swift_once();
  }
  uint64_t v139 = unk_1E9FACBE8;
  *(void *)(v0 + 2496) = qword_1E9FACBE0;
  *(void *)(v0 + 2504) = v139;
  *(void *)(v0 + 2536) = v2;
  *(void *)(v0 + 2544) = v3;
  uint64_t v140 = swift_allocObject();
  *(void *)(v0 + 2512) = v140;
  sub_1BC9AA050((uint64_t)&byte_1E9FACBD8, v140 + 16, &qword_1E9FABDA0);
  uint64_t v141 = qword_1E9FABBB0;
  swift_bridgeObjectRetain();
  if (v141 != -1) {
    swift_once();
  }
  uint64_t v142 = unk_1E9FACCC8;
  *(void *)(v0 + 2552) = qword_1E9FACCC0;
  *(void *)(v0 + 2560) = v142;
  *(void *)(v0 + 2592) = v2;
  *(void *)(v0 + 2600) = v3;
  uint64_t v143 = swift_allocObject();
  *(void *)(v0 + 2568) = v143;
  sub_1BC9AA050((uint64_t)&byte_1E9FACCB8, v143 + 16, &qword_1E9FABDA0);
  uint64_t v144 = qword_1E9FABBB8;
  swift_bridgeObjectRetain();
  if (v144 != -1) {
    swift_once();
  }
  uint64_t v145 = unk_1E9FACD20;
  *(void *)(v0 + 2608) = qword_1E9FACD18;
  *(void *)(v0 + 2616) = v145;
  *(void *)(v0 + 2648) = v2;
  *(void *)(v0 + 2656) = v3;
  uint64_t v146 = swift_allocObject();
  *(void *)(v0 + 2624) = v146;
  sub_1BC9AA050((uint64_t)&byte_1E9FACD10, v146 + 16, &qword_1E9FABDA0);
  uint64_t v147 = qword_1EBA01C00;
  swift_bridgeObjectRetain();
  if (v147 != -1) {
    swift_once();
  }
  uint64_t v148 = qword_1EBA019E8;
  *(void *)(v0 + 2664) = qword_1EBA019E0;
  *(void *)(v0 + 2672) = v148;
  *(void *)(v0 + 2704) = v22;
  *(void *)(v0 + 2712) = v23;
  uint64_t v149 = swift_allocObject();
  *(void *)(v0 + 2680) = v149;
  sub_1BC9AA050((uint64_t)&qword_1EBA019D8, v149 + 16, &qword_1EBA01C48);
  uint64_t v150 = qword_1E9FABD60;
  swift_bridgeObjectRetain();
  if (v150 != -1) {
    swift_once();
  }
  uint64_t v151 = qword_1E9FAE7D0;
  *(void *)(v0 + 2720) = qword_1E9FAE7C8;
  *(void *)(v0 + 2728) = v151;
  *(void *)(v0 + 2760) = v285;
  *(void *)(v0 + 2768) = v284;
  uint64_t v152 = swift_allocObject();
  *(void *)(v0 + 2736) = v152;
  sub_1BC9AA050((uint64_t)&qword_1E9FAE7C0, v152 + 16, &qword_1E9FAD1E8);
  uint64_t v153 = qword_1E9FABD58;
  swift_bridgeObjectRetain();
  if (v153 != -1) {
    swift_once();
  }
  uint64_t v154 = unk_1E9FAE778;
  *(void *)(v0 + 2776) = qword_1E9FAE770;
  *(void *)(v0 + 2784) = v154;
  *(void *)(v0 + 2816) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE818);
  *(void *)(v0 + 2824) = sub_1BCA41414(&qword_1E9FAE8F8, &qword_1E9FAE818);
  uint64_t v155 = swift_allocObject();
  *(void *)(v0 + 2792) = v155;
  sub_1BC9AA050((uint64_t)&xmmword_1E9FAE760, v155 + 16, &qword_1E9FAE818);
  uint64_t v156 = qword_1E9FABC38;
  swift_bridgeObjectRetain();
  if (v156 != -1) {
    swift_once();
  }
  uint64_t v157 = unk_1E9FAD718;
  *(void *)(v0 + 2832) = qword_1E9FAD710;
  *(void *)(v0 + 2840) = v157;
  *(void *)(v0 + 2872) = v2;
  *(void *)(v0 + 2880) = v3;
  uint64_t v158 = swift_allocObject();
  *(void *)(v0 + 2848) = v158;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD708, v158 + 16, &qword_1E9FABDA0);
  uint64_t v159 = qword_1E9FABC40;
  swift_bridgeObjectRetain();
  if (v159 != -1) {
    swift_once();
  }
  uint64_t v160 = unk_1E9FAD770;
  *(void *)(v0 + 2888) = qword_1E9FAD768;
  *(void *)(v0 + 2896) = v160;
  *(void *)(v0 + 2928) = v2;
  *(void *)(v0 + 2936) = v3;
  uint64_t v161 = swift_allocObject();
  *(void *)(v0 + 2904) = v161;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD760, v161 + 16, &qword_1E9FABDA0);
  uint64_t v162 = qword_1E9FABC48;
  swift_bridgeObjectRetain();
  if (v162 != -1) {
    swift_once();
  }
  uint64_t v163 = unk_1E9FAD7C8;
  *(void *)(v0 + 2944) = qword_1E9FAD7C0;
  *(void *)(v0 + 2952) = v163;
  *(void *)(v0 + 2984) = v2;
  *(void *)(v0 + 2992) = v3;
  uint64_t v164 = swift_allocObject();
  *(void *)(v0 + 2960) = v164;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD7B8, v164 + 16, &qword_1E9FABDA0);
  uint64_t v165 = qword_1E9FABC50;
  swift_bridgeObjectRetain();
  if (v165 != -1) {
    swift_once();
  }
  uint64_t v166 = unk_1E9FAD820;
  *(void *)(v0 + 3000) = qword_1E9FAD818;
  *(void *)(v0 + 3008) = v166;
  *(void *)(v0 + 3040) = v2;
  *(void *)(v0 + 3048) = v3;
  uint64_t v167 = swift_allocObject();
  *(void *)(v0 + 3016) = v167;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD810, v167 + 16, &qword_1E9FABDA0);
  uint64_t v168 = qword_1E9FABC58;
  swift_bridgeObjectRetain();
  if (v168 != -1) {
    swift_once();
  }
  uint64_t v169 = unk_1E9FAD878;
  *(void *)(v0 + 3056) = qword_1E9FAD870;
  *(void *)(v0 + 3064) = v169;
  *(void *)(v0 + 3096) = v2;
  *(void *)(v0 + 3104) = v3;
  uint64_t v170 = swift_allocObject();
  *(void *)(v0 + 3072) = v170;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD868, v170 + 16, &qword_1E9FABDA0);
  uint64_t v171 = qword_1E9FABC60;
  swift_bridgeObjectRetain();
  if (v171 != -1) {
    swift_once();
  }
  uint64_t v172 = unk_1E9FAD8D0;
  *(void *)(v0 + 3112) = qword_1E9FAD8C8;
  *(void *)(v0 + 3120) = v172;
  *(void *)(v0 + 3152) = v2;
  *(void *)(v0 + 3160) = v3;
  uint64_t v173 = swift_allocObject();
  *(void *)(v0 + 3128) = v173;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD8C0, v173 + 16, &qword_1E9FABDA0);
  uint64_t v174 = qword_1E9FABC68;
  swift_bridgeObjectRetain();
  if (v174 != -1) {
    swift_once();
  }
  uint64_t v175 = unk_1E9FAD928;
  *(void *)(v0 + 3168) = qword_1E9FAD920;
  *(void *)(v0 + 3176) = v175;
  *(void *)(v0 + 3208) = v2;
  *(void *)(v0 + 3216) = v3;
  uint64_t v176 = swift_allocObject();
  *(void *)(v0 + 3184) = v176;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD918, v176 + 16, &qword_1E9FABDA0);
  uint64_t v177 = qword_1E9FABC70;
  swift_bridgeObjectRetain();
  if (v177 != -1) {
    swift_once();
  }
  uint64_t v178 = unk_1E9FAD980;
  *(void *)(v0 + 3224) = qword_1E9FAD978;
  *(void *)(v0 + 3232) = v178;
  *(void *)(v0 + 3264) = v2;
  *(void *)(v0 + 3272) = v3;
  uint64_t v179 = swift_allocObject();
  *(void *)(v0 + 3240) = v179;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD970, v179 + 16, &qword_1E9FABDA0);
  uint64_t v180 = qword_1E9FABC78;
  swift_bridgeObjectRetain();
  if (v180 != -1) {
    swift_once();
  }
  uint64_t v181 = unk_1E9FAD9D8;
  *(void *)(v0 + 3280) = qword_1E9FAD9D0;
  *(void *)(v0 + 3288) = v181;
  *(void *)(v0 + 3320) = v2;
  *(void *)(v0 + 3328) = v3;
  uint64_t v182 = swift_allocObject();
  *(void *)(v0 + 3296) = v182;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD9C8, v182 + 16, &qword_1E9FABDA0);
  uint64_t v183 = qword_1E9FABC80;
  swift_bridgeObjectRetain();
  if (v183 != -1) {
    swift_once();
  }
  uint64_t v184 = unk_1E9FADA30;
  *(void *)(v0 + 3336) = qword_1E9FADA28;
  *(void *)(v0 + 3344) = v184;
  *(void *)(v0 + 3376) = v2;
  *(void *)(v0 + 3384) = v3;
  uint64_t v185 = swift_allocObject();
  *(void *)(v0 + 3352) = v185;
  sub_1BC9AA050((uint64_t)&byte_1E9FADA20, v185 + 16, &qword_1E9FABDA0);
  uint64_t v186 = qword_1E9FABC88;
  swift_bridgeObjectRetain();
  if (v186 != -1) {
    swift_once();
  }
  uint64_t v187 = unk_1E9FADA88;
  *(void *)(v0 + 3392) = qword_1E9FADA80;
  *(void *)(v0 + 3400) = v187;
  *(void *)(v0 + 3432) = v2;
  *(void *)(v0 + 3440) = v3;
  uint64_t v188 = swift_allocObject();
  *(void *)(v0 + 3408) = v188;
  sub_1BC9AA050((uint64_t)&byte_1E9FADA78, v188 + 16, &qword_1E9FABDA0);
  uint64_t v189 = qword_1EBA018B8;
  swift_bridgeObjectRetain();
  if (v189 != -1) {
    swift_once();
  }
  uint64_t v190 = qword_1EBA017D0;
  *(void *)(v0 + 3448) = qword_1EBA017C8;
  *(void *)(v0 + 3456) = v190;
  *(void *)(v0 + 3488) = v54;
  *(void *)(v0 + 3496) = v55;
  uint64_t v191 = swift_allocObject();
  *(void *)(v0 + 3464) = v191;
  sub_1BC9AA050((uint64_t)&xmmword_1EBA017B0, v191 + 16, &qword_1EBA01890);
  uint64_t v192 = qword_1EBA01918;
  swift_bridgeObjectRetain();
  if (v192 != -1) {
    swift_once();
  }
  uint64_t v193 = qword_1EBA018E0;
  *(void *)(v0 + 3504) = qword_1EBA018D8;
  *(void *)(v0 + 3512) = v193;
  *(void *)(v0 + 3544) = v54;
  *(void *)(v0 + 3552) = v55;
  uint64_t v194 = swift_allocObject();
  *(void *)(v0 + 3520) = v194;
  sub_1BC9AA050((uint64_t)&xmmword_1EBA018C0, v194 + 16, &qword_1EBA01890);
  uint64_t v195 = qword_1E9FABAE0;
  swift_bridgeObjectRetain();
  if (v195 != -1) {
    swift_once();
  }
  uint64_t v196 = unk_1E9FAC370;
  *(void *)(v0 + 3560) = qword_1E9FAC368;
  *(void *)(v0 + 3568) = v196;
  *(void *)(v0 + 3600) = v2;
  *(void *)(v0 + 3608) = v3;
  uint64_t v197 = swift_allocObject();
  *(void *)(v0 + 3576) = v197;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC360, v197 + 16, &qword_1E9FABDA0);
  uint64_t v198 = qword_1E9FABBC0;
  swift_bridgeObjectRetain();
  if (v198 != -1) {
    swift_once();
  }
  uint64_t v199 = unk_1E9FAD0D8;
  *(void *)(v0 + 3616) = qword_1E9FAD0D0;
  *(void *)(v0 + 3624) = v199;
  *(void *)(v0 + 3656) = v2;
  *(void *)(v0 + 3664) = v3;
  uint64_t v200 = swift_allocObject();
  *(void *)(v0 + 3632) = v200;
  sub_1BC9AA050((uint64_t)&byte_1E9FAD0C8, v200 + 16, &qword_1E9FABDA0);
  uint64_t v201 = qword_1E9FABAC0;
  swift_bridgeObjectRetain();
  if (v201 != -1) {
    swift_once();
  }
  uint64_t v202 = unk_1E9FAC1D8;
  *(void *)(v0 + 3672) = qword_1E9FAC1D0;
  *(void *)(v0 + 3680) = v202;
  *(void *)(v0 + 3712) = v2;
  *(void *)(v0 + 3720) = v3;
  uint64_t v203 = swift_allocObject();
  *(void *)(v0 + 3688) = v203;
  sub_1BC9AA050((uint64_t)&byte_1E9FAC1C8, v203 + 16, &qword_1E9FABDA0);
  uint64_t v204 = qword_1E9FABC90;
  swift_bridgeObjectRetain();
  if (v204 != -1) {
    swift_once();
  }
  uint64_t v205 = unk_1E9FADAF8;
  *(void *)(v0 + 3728) = qword_1E9FADAF0;
  *(void *)(v0 + 3736) = v205;
  *(void *)(v0 + 3768) = v2;
  *(void *)(v0 + 3776) = v3;
  uint64_t v206 = swift_allocObject();
  *(void *)(v0 + 3744) = v206;
  sub_1BC9AA050((uint64_t)&byte_1E9FADAE8, v206 + 16, &qword_1E9FABDA0);
  uint64_t v207 = qword_1E9FABCB0;
  swift_bridgeObjectRetain();
  if (v207 != -1) {
    swift_once();
  }
  uint64_t v208 = unk_1E9FADDE0;
  *(void *)(v0 + 3784) = qword_1E9FADDD8;
  *(void *)(v0 + 3792) = v208;
  *(void *)(v0 + 3824) = v2;
  *(void *)(v0 + 3832) = v3;
  uint64_t v209 = swift_allocObject();
  *(void *)(v0 + 3800) = v209;
  sub_1BC9AA050((uint64_t)&byte_1E9FADDD0, v209 + 16, &qword_1E9FABDA0);
  uint64_t v210 = qword_1E9FABD10;
  swift_bridgeObjectRetain();
  if (v210 != -1) {
    swift_once();
  }
  uint64_t v211 = unk_1E9FAE3C8;
  *(void *)(v0 + 3840) = qword_1E9FAE3C0;
  *(void *)(v0 + 3848) = v211;
  *(void *)(v0 + 3880) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE4C0);
  *(void *)(v0 + 3888) = sub_1BCA41414(&qword_1E9FAE900, &qword_1E9FAE4C0);
  uint64_t v212 = swift_allocObject();
  *(void *)(v0 + 3856) = v212;
  sub_1BC9AA050((uint64_t)&byte_1E9FAE3B8, v212 + 16, &qword_1E9FAE4C0);
  uint64_t v213 = qword_1E9FABD18;
  swift_bridgeObjectRetain();
  if (v213 != -1) {
    swift_once();
  }
  uint64_t v214 = unk_1E9FAE420;
  *(void *)(v0 + 3896) = qword_1E9FAE418;
  *(void *)(v0 + 3904) = v214;
  *(void *)(v0 + 3936) = v2;
  *(void *)(v0 + 3944) = v3;
  uint64_t v215 = swift_allocObject();
  *(void *)(v0 + 3912) = v215;
  sub_1BC9AA050((uint64_t)&byte_1E9FAE410, v215 + 16, &qword_1E9FABDA0);
  uint64_t v216 = qword_1E9FABD20;
  swift_bridgeObjectRetain();
  if (v216 != -1) {
    swift_once();
  }
  uint64_t v217 = unk_1E9FAE478;
  *(void *)(v0 + 3952) = qword_1E9FAE470;
  *(void *)(v0 + 3960) = v217;
  *(void *)(v0 + 3992) = v2;
  *(void *)(v0 + 4000) = v3;
  uint64_t v218 = swift_allocObject();
  *(void *)(v0 + 3968) = v218;
  sub_1BC9AA050((uint64_t)&byte_1E9FAE468, v218 + 16, &qword_1E9FABDA0);
  uint64_t v219 = qword_1E9FABC20;
  swift_bridgeObjectRetain();
  if (v219 != -1) {
    swift_once();
  }
  uint64_t v220 = qword_1E9FAD598;
  *(void *)(v0 + 4008) = qword_1E9FAD590;
  *(void *)(v0 + 4016) = v220;
  *(void *)(v0 + 4048) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAD690);
  *(void *)(v0 + 4056) = sub_1BCA40C2C();
  uint64_t v221 = swift_allocObject();
  *(void *)(v0 + 4024) = v221;
  sub_1BC9AA050((uint64_t)&qword_1E9FAD588, v221 + 16, &qword_1E9FAD690);
  uint64_t v222 = qword_1E9FABC28;
  swift_bridgeObjectRetain();
  if (v222 != -1) {
    swift_once();
  }
  uint64_t v223 = qword_1E9FAD5F0;
  *(void *)(v0 + 4064) = qword_1E9FAD5E8;
  *(void *)(v0 + 4072) = v223;
  *(void *)(v0 + 4104) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAD698);
  *(void *)(v0 + 4112) = sub_1BCA40CBC();
  uint64_t v224 = swift_allocObject();
  *(void *)(v0 + 4080) = v224;
  sub_1BC9AA050((uint64_t)&qword_1E9FAD5E0, v224 + 16, &qword_1E9FAD698);
  uint64_t v225 = qword_1E9FABC30;
  swift_bridgeObjectRetain();
  if (v225 != -1) {
    swift_once();
  }
  uint64_t v226 = qword_1E9FAD648;
  *(void *)(v0 + 4120) = qword_1E9FAD640;
  *(void *)(v0 + 4128) = v226;
  *(void *)(v0 + 4160) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAD6A0);
  *(void *)(v0 + 4168) = sub_1BCA40D4C();
  uint64_t v227 = swift_allocObject();
  *(void *)(v0 + 4136) = v227;
  sub_1BC9AA050((uint64_t)&qword_1E9FAD638, v227 + 16, &qword_1E9FAD6A0);
  uint64_t v228 = qword_1E9FABCE0;
  swift_bridgeObjectRetain();
  if (v228 != -1) {
    swift_once();
  }
  uint64_t v229 = unk_1E9FAE080;
  *(void *)(v0 + 4176) = qword_1E9FAE078;
  *(void *)(v0 + 4184) = v229;
  *(void *)(v0 + 4216) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE240);
  *(void *)(v0 + 4224) = sub_1BCA41090(&qword_1E9FAE938, &qword_1E9FAE240, (void (*)(void))sub_1BCA40E48);
  uint64_t v230 = swift_allocObject();
  *(void *)(v0 + 4192) = v230;
  sub_1BC9AA050((uint64_t)&qword_1E9FAE060, v230 + 16, &qword_1E9FAE240);
  uint64_t v231 = qword_1E9FABCD8;
  swift_bridgeObjectRetain();
  if (v231 != -1) {
    swift_once();
  }
  uint64_t v232 = qword_1E9FAE018;
  *(void *)(v0 + 4232) = qword_1E9FAE010;
  *(void *)(v0 + 4240) = v232;
  *(void *)(v0 + 4272) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE238);
  *(void *)(v0 + 4280) = sub_1BCA40ED4();
  uint64_t v233 = swift_allocObject();
  *(void *)(v0 + 4248) = v233;
  sub_1BC9AA050((uint64_t)&qword_1E9FAE008, v233 + 16, &qword_1E9FAE238);
  uint64_t v234 = qword_1E9FABCE8;
  swift_bridgeObjectRetain();
  if (v234 != -1) {
    swift_once();
  }
  uint64_t v235 = qword_1E9FAE0D8;
  *(void *)(v0 + 4288) = qword_1E9FAE0D0;
  *(void *)(v0 + 4296) = v235;
  *(void *)(v0 + 4328) = v22;
  *(void *)(v0 + 4336) = v23;
  uint64_t v236 = swift_allocObject();
  *(void *)(v0 + 4304) = v236;
  sub_1BC9AA050((uint64_t)&qword_1E9FAE0C8, v236 + 16, &qword_1EBA01C48);
  uint64_t v237 = qword_1E9FABCF0;
  swift_bridgeObjectRetain();
  if (v237 != -1) {
    swift_once();
  }
  uint64_t v238 = qword_1E9FAE130;
  *(void *)(v0 + 4344) = qword_1E9FAE128;
  *(void *)(v0 + 4352) = v238;
  *(void *)(v0 + 4384) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE248);
  *(void *)(v0 + 4392) = sub_1BCA40FEC();
  uint64_t v239 = swift_allocObject();
  *(void *)(v0 + 4360) = v239;
  sub_1BC9AA050((uint64_t)&qword_1E9FAE120, v239 + 16, &qword_1E9FAE248);
  uint64_t v240 = qword_1E9FABD00;
  swift_bridgeObjectRetain();
  if (v240 != -1) {
    swift_once();
  }
  uint64_t v241 = unk_1E9FAE1F0;
  *(void *)(v0 + 4400) = qword_1E9FAE1E8;
  *(void *)(v0 + 4408) = v241;
  *(void *)(v0 + 4440) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE258);
  *(void *)(v0 + 4448) = sub_1BCA41090(&qword_1E9FAE970, &qword_1E9FAE258, (void (*)(void))sub_1BCA41108);
  uint64_t v242 = swift_allocObject();
  *(void *)(v0 + 4416) = v242;
  sub_1BC9AA050((uint64_t)&qword_1E9FAE1D0, v242 + 16, &qword_1E9FAE258);
  uint64_t v243 = qword_1E9FABCF8;
  swift_bridgeObjectRetain();
  if (v243 != -1) {
    swift_once();
  }
  uint64_t v244 = qword_1E9FAE188;
  *(void *)(v0 + 4456) = qword_1E9FAE180;
  *(void *)(v0 + 4464) = v244;
  *(void *)(v0 + 4496) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE250);
  *(void *)(v0 + 4504) = sub_1BCA41234();
  uint64_t v245 = swift_allocObject();
  *(void *)(v0 + 4472) = v245;
  sub_1BC9AA050((uint64_t)&qword_1E9FAE178, v245 + 16, &qword_1E9FAE250);
  uint64_t v246 = qword_1E9FABD38;
  swift_bridgeObjectRetain();
  if (v246 != -1) {
    swift_once();
  }
  uint64_t v247 = unk_1E9FAE5E0;
  *(void *)(v0 + 4512) = qword_1E9FAE5D8;
  *(void *)(v0 + 4520) = v247;
  *(void *)(v0 + 4552) = v2;
  *(void *)(v0 + 4560) = v3;
  uint64_t v248 = swift_allocObject();
  *(void *)(v0 + 4528) = v248;
  sub_1BC9AA050((uint64_t)&byte_1E9FAE5D0, v248 + 16, &qword_1E9FABDA0);
  uint64_t v249 = qword_1E9FABD40;
  swift_bridgeObjectRetain();
  if (v249 != -1) {
    swift_once();
  }
  uint64_t v250 = unk_1E9FAE638;
  *(void *)(v0 + 4568) = qword_1E9FAE630;
  *(void *)(v0 + 4576) = v250;
  *(void *)(v0 + 4608) = v2;
  *(void *)(v0 + 4616) = v3;
  uint64_t v251 = swift_allocObject();
  *(void *)(v0 + 4584) = v251;
  sub_1BC9AA050((uint64_t)&byte_1E9FAE628, v251 + 16, &qword_1E9FABDA0);
  uint64_t v252 = qword_1E9FABD48;
  swift_bridgeObjectRetain();
  if (v252 != -1) {
    swift_once();
  }
  uint64_t v253 = unk_1E9FAE690;
  *(void *)(v0 + 4624) = qword_1E9FAE688;
  *(void *)(v0 + 4632) = v253;
  *(void *)(v0 + 4664) = v2;
  *(void *)(v0 + 4672) = v3;
  uint64_t v254 = swift_allocObject();
  *(void *)(v0 + 4640) = v254;
  sub_1BC9AA050((uint64_t)&byte_1E9FAE680, v254 + 16, &qword_1E9FABDA0);
  uint64_t v255 = qword_1E9FABD08;
  swift_bridgeObjectRetain();
  if (v255 != -1) {
    swift_once();
  }
  uint64_t v256 = qword_1E9FAE2B8;
  *(void *)(v0 + 4680) = qword_1E9FAE2B0;
  *(void *)(v0 + 4688) = v256;
  *(void *)(v0 + 4720) = v22;
  *(void *)(v0 + 4728) = v23;
  uint64_t v257 = swift_allocObject();
  *(void *)(v0 + 4696) = v257;
  sub_1BC9AA050((uint64_t)&qword_1E9FAE2A8, v257 + 16, &qword_1EBA01C48);
  uint64_t v258 = qword_1EBA01D70;
  swift_bridgeObjectRetain();
  if (v258 != -1) {
    swift_once();
  }
  uint64_t v259 = unk_1EBA01D28;
  *(void *)(v0 + 4736) = qword_1EBA01D20;
  *(void *)(v0 + 4744) = v259;
  *(void *)(v0 + 4776) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA01D78);
  *(void *)(v0 + 4784) = sub_1BCA41414(&qword_1E9FAE9A0, &qword_1EBA01D78);
  uint64_t v260 = swift_allocObject();
  *(void *)(v0 + 4752) = v260;
  sub_1BC9AA050((uint64_t)&qword_1EBA01D08, v260 + 16, &qword_1EBA01D78);
  uint64_t v261 = qword_1E9FABCC0;
  swift_bridgeObjectRetain();
  if (v261 != -1) {
    swift_once();
  }
  uint64_t v262 = unk_1E9FADEC8;
  *(void *)(v0 + 4792) = qword_1E9FADEC0;
  *(void *)(v0 + 4800) = v262;
  *(void *)(v0 + 4832) = v2;
  *(void *)(v0 + 4840) = v3;
  uint64_t v263 = swift_allocObject();
  *(void *)(v0 + 4808) = v263;
  sub_1BC9AA050((uint64_t)&byte_1E9FADEB8, v263 + 16, &qword_1E9FABDA0);
  uint64_t v264 = qword_1E9FABCC8;
  swift_bridgeObjectRetain();
  if (v264 != -1) {
    swift_once();
  }
  uint64_t v265 = unk_1E9FADF20;
  *(void *)(v0 + 4848) = qword_1E9FADF18;
  *(void *)(v0 + 4856) = v265;
  *(void *)(v0 + 4888) = v2;
  *(void *)(v0 + 4896) = v3;
  uint64_t v266 = swift_allocObject();
  *(void *)(v0 + 4864) = v266;
  sub_1BC9AA050((uint64_t)&byte_1E9FADF10, v266 + 16, &qword_1E9FABDA0);
  uint64_t v267 = qword_1E9FABCD0;
  swift_bridgeObjectRetain();
  if (v267 != -1) {
    swift_once();
  }
  uint64_t v268 = unk_1E9FADF78;
  *(void *)(v0 + 4904) = qword_1E9FADF70;
  *(void *)(v0 + 4912) = v268;
  *(void *)(v0 + 4944) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FADFC0);
  *(void *)(v0 + 4952) = sub_1BCA41414(&qword_1E9FAE9A8, &qword_1E9FADFC0);
  uint64_t v269 = swift_allocObject();
  *(void *)(v0 + 4920) = v269;
  sub_1BC9AA050((uint64_t)&byte_1E9FADF68, v269 + 16, &qword_1E9FADFC0);
  uint64_t v270 = qword_1E9FABD80;
  swift_bridgeObjectRetain();
  if (v270 != -1) {
    swift_once();
  }
  uint64_t v271 = unk_1E9FAEA60;
  *(void *)(v0 + 4960) = qword_1E9FAEA58;
  *(void *)(v0 + 4968) = v271;
  *(void *)(v0 + 5000) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE9B0);
  *(void *)(v0 + 5008) = sub_1BCA41414(qword_1E9FAE9B8, &qword_1E9FAE9B0);
  uint64_t v272 = swift_allocObject();
  *(void *)(v0 + 4976) = v272;
  sub_1BC9AA050((uint64_t)&qword_1E9FAEA40, v272 + 16, &qword_1E9FAE9B0);
  swift_bridgeObjectRetain();
  unint64_t v273 = sub_1BC9A43A0(v0);
  if (qword_1E9FABB78 != -1) {
    swift_once();
  }
  uint64_t v275 = qword_1E9FACA80;
  uint64_t v274 = unk_1E9FACA88;
  uint64_t v290 = v2;
  uint64_t v291 = v3;
  *(void *)&long long v289 = swift_allocObject();
  sub_1BC9AA050((uint64_t)&byte_1E9FACA78, v289 + 16, &qword_1E9FABDA0);
  sub_1BC9A9FF0(&v289, (uint64_t)v287);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v286 = v273;
  uint64_t v277 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v287, v288);
  MEMORY[0x1F4188790](v277, v277);
  v279 = (char *)&v283 - ((v278 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v280 + 16))(v279);
  sub_1BCA414DC((uint64_t)v279, v275, v274, isUniquelyReferenced_nonNull_native, &v286);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v287);
  unint64_t v281 = v286;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v281;
}

void *static SettingMetadataDirectory.allMetadata.getter()
{
  if (qword_1E9FABD78 != -1) {
    swift_once();
  }
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_1BCA40630(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1BCA405D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE388);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1BCA40630(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE890);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 40);
  uint64_t v5 = sub_1BCA40734((uint64_t)&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_1BC9F34A0();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

ValueMetadata *type metadata accessor for SettingMetadataDirectory()
{
  return &type metadata for SettingMetadataDirectory;
}

uint64_t sub_1BCA40734(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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
    v5[2] = ~v7;
    v5[3] = v12;
    uint64_t v5[4] = v9;
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
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  while (v9)
  {
    unint64_t v15 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v16 = v15 | (v12 << 6);
LABEL_9:
    ++v13;
    sub_1BC9BE1A8(*(void *)(a4 + 56) + 40 * v16, (uint64_t)v21);
    sub_1BC9A9FF0(v21, (uint64_t)v22);
    unint64_t result = sub_1BC9A9FF0(v22, v11);
    v11 += 40;
    if (v13 == a3)
    {
      uint64_t v13 = a3;
LABEL_35:
      uint64_t v7 = v20;
      goto LABEL_36;
    }
  }
  int64_t v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v17 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v17);
  if (v18) {
    goto LABEL_23;
  }
  int64_t v19 = v12 + 2;
  ++v12;
  if (v17 + 1 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_16;
  }
  int64_t v12 = v17 + 1;
  if (v17 + 2 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 2));
  if (v18)
  {
    v17 += 2;
    goto LABEL_23;
  }
  int64_t v12 = v17 + 2;
  if (v17 + 3 >= v14) {
    goto LABEL_34;
  }
  unint64_t v18 = *(void *)(v6 + 8 * (v17 + 3));
  if (v18)
  {
    v17 += 3;
    goto LABEL_23;
  }
  int64_t v19 = v17 + 4;
  int64_t v12 = v17 + 3;
  if (v17 + 4 >= v14)
  {
LABEL_34:
    unint64_t v9 = 0;
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_16:
    int64_t v17 = v19;
LABEL_23:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
    goto LABEL_9;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      int64_t v12 = v14 - 1;
      goto LABEL_34;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1BCA40948()
{
  swift_bridgeObjectRelease();
  unint64_t v1 = *(void *)(v0 + 40);
  if (v1 >> 60 != 15) {
    sub_1BC9A3ACC(*(void *)(v0 + 32), v1);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 80);

  return MEMORY[0x1F4186498](v0, 137, 7);
}

unint64_t sub_1BCA409B0()
{
  unint64_t result = qword_1E9FAE8B0;
  if (!qword_1E9FAE8B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAD1E8);
    sub_1BCA41414(&qword_1E9FAE8B8, &qword_1E9FABEF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE8B0);
  }
  return result;
}

unint64_t sub_1BCA40A54()
{
  unint64_t result = qword_1E9FAE8C0;
  if (!qword_1E9FAE8C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBA01C48);
    sub_1BCA41414(&qword_1E9FAE8C8, &qword_1EBA01C58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE8C0);
  }
  return result;
}

uint64_t sub_1BCA40AF8()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);

  return MEMORY[0x1F4186498](v0, 99, 7);
}

unint64_t sub_1BCA40B38()
{
  unint64_t result = qword_1E9FAE8E0;
  if (!qword_1E9FAE8E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAE8D8);
    sub_1BCA41414(&qword_1E9FAE8E8, &qword_1E9FABE28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE8E0);
  }
  return result;
}

uint64_t sub_1BCA40BE0()
{
  sub_1BC9A3ACC(*(void *)(v0 + 16), *(void *)(v0 + 24));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 48);

  return MEMORY[0x1F4186498](v0, 105, 7);
}

unint64_t sub_1BCA40C2C()
{
  unint64_t result = qword_1E9FAE908;
  if (!qword_1E9FAE908)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAD690);
    sub_1BCA40DD8(&qword_1E9FAE910, &qword_1E9FABED8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE908);
  }
  return result;
}

unint64_t sub_1BCA40CBC()
{
  unint64_t result = qword_1E9FAE918;
  if (!qword_1E9FAE918)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAD698);
    sub_1BCA40DD8(&qword_1E9FAE920, &qword_1E9FABEC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE918);
  }
  return result;
}

unint64_t sub_1BCA40D4C()
{
  unint64_t result = qword_1E9FAE928;
  if (!qword_1E9FAE928)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAD6A0);
    sub_1BCA40DD8(&qword_1E9FAE930, &qword_1E9FABEA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE928);
  }
  return result;
}

uint64_t sub_1BCA40DD8(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_1BCA40E48()
{
  unint64_t result = qword_1E9FAE940;
  if (!qword_1E9FAE940)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FABE88);
    sub_1BCA29094();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE940);
  }
  return result;
}

unint64_t sub_1BCA40ED4()
{
  unint64_t result = qword_1E9FAE948;
  if (!qword_1E9FAE948)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAE238);
    sub_1BCA40F68(&qword_1E9FAE950, &qword_1E9FAE360, &qword_1E9FAE958, &qword_1E9FAC1A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE948);
  }
  return result;
}

uint64_t sub_1BCA40F68(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_1BCA412C8(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BCA40FEC()
{
  unint64_t result = qword_1E9FAE960;
  if (!qword_1E9FAE960)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAE248);
    sub_1BCA41414(&qword_1E9FAE968, &qword_1E9FABE78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE960);
  }
  return result;
}

uint64_t sub_1BCA41090(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BCA41108()
{
  unint64_t result = qword_1E9FAE978;
  if (!qword_1E9FAE978)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FABE60);
    sub_1BCA41190();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE978);
  }
  return result;
}

unint64_t sub_1BCA41190()
{
  unint64_t result = qword_1E9FAE980;
  if (!qword_1E9FAE980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE980);
  }
  return result;
}

uint64_t objectdestroy_97Tm()
{
  sub_1BC9E15BC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);

  return MEMORY[0x1F4186498](v0, 113, 7);
}

unint64_t sub_1BCA41234()
{
  unint64_t result = qword_1E9FAE988;
  if (!qword_1E9FAE988)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAE250);
    sub_1BCA40F68(&qword_1E9FAE990, &qword_1E9FAE368, &qword_1E9FAE998, &qword_1E9FACA10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAE988);
  }
  return result;
}

uint64_t sub_1BCA412C8(unint64_t *a1, uint64_t *a2)
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

uint64_t objectdestroy_8Tm()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 40);

  return MEMORY[0x1F4186498](v0, 97, 7);
}

uint64_t sub_1BCA41364()
{
  return objectdestroy_125Tm((void (*)(void, void, void))sub_1BC9FFAEC);
}

uint64_t objectdestroy_125Tm(void (*a1)(void, void, void))
{
  a1(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v1 + 56);

  return MEMORY[0x1F4186498](v1, 113, 7);
}

uint64_t objectdestroyTm_2()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 40);

  return MEMORY[0x1F4186498](v0, 97, 7);
}

uint64_t sub_1BCA41414(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_1BCA41474()
{
  return objectdestroy_125Tm((void (*)(void, void, void))sub_1BC9FFA88);
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

uint64_t sub_1BCA414DC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA0);
  uint64_t v33 = v10;
  uint64_t v34 = sub_1BCA41414(&qword_1E9FAE8A0, &qword_1E9FABDA0);
  uint64_t v11 = swift_allocObject();
  *(void *)&long long v32 = v11;
  long long v12 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v11 + 64) = v12;
  *(_OWORD *)(v11 + 80) = *(_OWORD *)(a1 + 64);
  *(unsigned char *)(v11 + 96) = *(unsigned char *)(a1 + 80);
  long long v13 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v11 + 32) = v13;
  int64_t v14 = (void *)*a5;
  unint64_t v16 = sub_1BC9A69D0(a2, a3);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v20 = v15;
  uint64_t v21 = v14[3];
  if (v21 >= v19 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v22 = (void *)*a5;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7] + 40 * v16;
      __swift_destroy_boxed_opaque_existential_0(v23);
      return sub_1BC9A9FF0(&v32, v23);
    }
    goto LABEL_11;
  }
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    sub_1BC9CA824();
    goto LABEL_7;
  }
  sub_1BC9C9520(v19, a4 & 1);
  unint64_t v25 = sub_1BC9A69D0(a2, a3);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_14:
    uint64_t result = sub_1BCA48D08();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  uint64_t v22 = (void *)*a5;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v32, v10);
  MEMORY[0x1F4188790](v27, v27);
  uint64_t v29 = (char *)&v31 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v30 + 16))(v29);
  sub_1BCA41738(v16, a2, a3, (uint64_t)v29, v22);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BCA41738(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA0);
  uint64_t v20 = sub_1BCA41414(&qword_1E9FAE8A0, &qword_1E9FABDA0);
  uint64_t v10 = swift_allocObject();
  *(void *)&long long v18 = v10;
  long long v11 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v10 + 64) = v11;
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(a4 + 64);
  *(unsigned char *)(v10 + 96) = *(unsigned char *)(a4 + 80);
  long long v12 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)a4;
  *(_OWORD *)(v10 + 32) = v12;
  a5[(a1 >> 6) + 8] |= 1 << a1;
  long long v13 = (void *)(a5[6] + 16 * a1);
  void *v13 = a2;
  v13[1] = a3;
  uint64_t result = sub_1BC9A9FF0(&v18, a5[7] + 40 * a1);
  uint64_t v15 = a5[2];
  BOOL v16 = __OFADD__(v15, 1);
  uint64_t v17 = v15 + 1;
  if (v16) {
    __break(1u);
  }
  else {
    a5[2] = v17;
  }
  return result;
}

uint64_t SettingReflection.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1BCA48A88();
  size_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t SettingReflection.effectiveValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = sub_1BCA48A88();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t dispatch thunk of SettingReflectable.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SettingReflectable.effectiveValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1BCA4195C()
{
  uint64_t result = sub_1BCA48A88();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1BCA419EC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = ~v8;
  size_t v10 = v7 + v8;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || ((v7 + v8) & ~v8) + v7 > 0x18)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    int64_t v14 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48);
    if (v14(a2, 1, v5))
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    uint64_t v15 = (void *)(((unint64_t)a2 + v10) & v9);
    if (v14(v15, 1, v5))
    {
      memcpy((void *)(((unint64_t)a1 + v10) & v9), v15, v7);
    }
    else
    {
      (*(void (**)(unint64_t, void *, uint64_t))(v6 + 16))(((unint64_t)a1 + v10) & v9, v15, v5);
      (*(void (**)(unint64_t, void, uint64_t, uint64_t))(v6 + 56))(((unint64_t)a1 + v10) & v9, 0, 1, v5);
    }
  }
  return a1;
}

uint64_t sub_1BCA41BCC(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(v3 - 8);
  uint64_t v4 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48);
  if (!v4(a1, 1, v3)) {
    (*(void (**)(unint64_t, uint64_t))(v9 + 8))(a1, v3);
  }
  unint64_t v5 = *(void *)(v9 + 64) + a1;
  if (!*(_DWORD *)(v9 + 84)) {
    ++v5;
  }
  unint64_t v6 = (v5 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t result = v4(v6, 1, v3);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(unint64_t, uint64_t))(v9 + 8);
    return v8(v6, v3);
  }
  return result;
}

void *sub_1BCA41CF8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  if (v7(a2, 1, v5))
  {
    int v8 = *(_DWORD *)(v6 + 84);
    size_t v9 = *(void *)(v6 + 64);
    if (v8) {
      size_t v10 = *(void *)(v6 + 64);
    }
    else {
      size_t v10 = v9 + 1;
    }
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    int v8 = *(_DWORD *)(v6 + 84);
    size_t v9 = *(void *)(v6 + 64);
  }
  if (!v8) {
    ++v9;
  }
  uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
  long long v12 = (void *)(((unint64_t)a1 + v9 + v11) & ~v11);
  uint64_t v13 = (const void *)(((unint64_t)a2 + v9 + v11) & ~v11);
  if (v7(v13, 1, v5))
  {
    memcpy(v12, v13, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v12, v13, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v12, 0, 1, v5);
  }
  return a1;
}

void *sub_1BCA41E9C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    size_t v13 = *(void *)(v6 + 64);
  }
  else {
    size_t v13 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v14 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v15 = (void *)(((unint64_t)a1 + v13 + v14) & ~v14);
  BOOL v16 = (void *)(((unint64_t)a2 + v13 + v14) & ~v14);
  int v17 = v7(v15, 1, v5);
  int v18 = v7(v16, 1, v5);
  if (!v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(v15, v16, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(v15, v5);
    goto LABEL_20;
  }
  if (v18)
  {
LABEL_20:
    memcpy(v15, v16, v13);
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 16))(v15, v16, v5);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v15, 0, 1, v5);
  return a1;
}

void *sub_1BCA42110(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  if (v7(a2, 1, v5))
  {
    int v8 = *(_DWORD *)(v6 + 84);
    size_t v9 = *(void *)(v6 + 64);
    if (v8) {
      size_t v10 = *(void *)(v6 + 64);
    }
    else {
      size_t v10 = v9 + 1;
    }
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    int v8 = *(_DWORD *)(v6 + 84);
    size_t v9 = *(void *)(v6 + 64);
  }
  if (!v8) {
    ++v9;
  }
  uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
  size_t v12 = (void *)(((unint64_t)a1 + v9 + v11) & ~v11);
  size_t v13 = (const void *)(((unint64_t)a2 + v9 + v11) & ~v11);
  if (v7(v13, 1, v5))
  {
    memcpy(v12, v13, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v12, v13, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v12, 0, 1, v5);
  }
  return a1;
}

void *sub_1BCA422B4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    size_t v13 = *(void *)(v6 + 64);
  }
  else {
    size_t v13 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v14 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v15 = (void *)(((unint64_t)a1 + v13 + v14) & ~v14);
  BOOL v16 = (void *)(((unint64_t)a2 + v13 + v14) & ~v14);
  int v17 = v7(v15, 1, v5);
  int v18 = v7(v16, 1, v5);
  if (!v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(v15, v16, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(v15, v5);
    goto LABEL_20;
  }
  if (v18)
  {
LABEL_20:
    memcpy(v15, v16, v13);
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v15, v16, v5);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v15, 0, 1, v5);
  return a1;
}

uint64_t sub_1BCA42528(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
  if (a2 > v6)
  {
    uint64_t v9 = ((v7 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + v7;
    char v10 = 8 * v9;
    if (v9 > 3) {
      goto LABEL_8;
    }
    unsigned int v12 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v12))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (v11) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v12 <= 0xFF)
      {
        if (v12 < 2) {
          goto LABEL_23;
        }
LABEL_8:
        int v11 = *((unsigned __int8 *)a1 + v9);
        if (!*((unsigned char *)a1 + v9)) {
          goto LABEL_23;
        }
LABEL_15:
        int v13 = (v11 - 1) << v10;
        if (v9 > 3) {
          int v13 = 0;
        }
        if (v9)
        {
          if (v9 > 3) {
            LODWORD(v9) = 4;
          }
          switch((int)v9)
          {
            case 2:
              LODWORD(v9) = *a1;
              break;
            case 3:
              LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              LODWORD(v9) = *(_DWORD *)a1;
              break;
            default:
              LODWORD(v9) = *(unsigned __int8 *)a1;
              break;
          }
        }
        return v6 + (v9 | v13) + 1;
      }
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_15;
      }
    }
  }
LABEL_23:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v15 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v15 >= 2) {
    return v15 - 1;
  }
  else {
    return 0;
  }
}

void sub_1BCA426D0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v10;
  }
  size_t v11 = ((v10 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)) + v10;
  BOOL v12 = a3 >= v9;
  unsigned int v13 = a3 - v9;
  if (v13 == 0 || !v12)
  {
LABEL_14:
    if (v9 < a2) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
  if (v11 > 3)
  {
    int v6 = 1;
    if (v9 < a2) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
  unsigned int v14 = ((v13 + ~(-1 << (8 * v11))) >> (8 * v11)) + 1;
  if (!HIWORD(v14))
  {
    if (v14 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v14 > 1;
    }
    goto LABEL_14;
  }
  int v6 = 4;
  if (v9 < a2)
  {
LABEL_15:
    unsigned int v15 = ~v9 + a2;
    if (v11 < 4)
    {
      int v16 = (v15 >> (8 * v11)) + 1;
      if (v11)
      {
        int v17 = v15 & ~(-1 << (8 * v11));
        bzero(a1, v11);
        if (v11 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v11 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v15;
      int v16 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v11] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v16;
        return;
      case 3:
        goto LABEL_40;
      case 4:
        *(_DWORD *)&a1[v11] = v16;
        return;
      default:
        return;
    }
  }
LABEL_22:
  switch(v6)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 3:
LABEL_40:
      __break(1u);
      JUMPOUT(0x1BCA4291CLL);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_27:
        if (v8 >= 2)
        {
          int v18 = *(void (**)(void))(v7 + 56);
          v18();
        }
      }
      return;
  }
}

uint64_t type metadata accessor for SettingReflection()
{
  return __swift_instantiateGenericMetadata();
}

double WebDomain.init(domain:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  double result = 0.0;
  *(_OWORD *)(a3 + 16) = xmmword_1BCA49720;
  return result;
}

__n128 sub_1BCA42970@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  __n128 result = *a1;
  a2[1] = *a1;
  return result;
}

__n128 WebDomain.init(token:)@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  __n128 result = *a1;
  a2[1] = *a1;
  return result;
}

uint64_t WebDomain.token.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  *a1 = v2;
  a1[1] = v3;
  return sub_1BC9A3B24(v2, v3);
}

__n128 WebDomain.init(domain:token:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X2>, __n128 *a4@<X8>)
{
  a4->n128_u64[0] = a1;
  a4->n128_u64[1] = a2;
  __n128 result = *a3;
  a4[1] = *a3;
  return result;
}

id static WebDomain.compare(_:with:outExactMatch:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v11 = 0;
  int v6 = self;
  uint64_t v7 = (void *)sub_1BCA487B8();
  unsigned int v8 = (void *)sub_1BCA487B8();
  id v9 = objc_msgSend(v6, sel_compareDomain_withDomainPattern_outExactMatch_, v7, v8, &v11);

  if (a5) {
    *a5 = v11;
  }
  return v9;
}

uint64_t WebDomain.domain.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WebDomain.hash(into:)()
{
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  if (v0[1])
  {
    sub_1BCA48D78();
    swift_bridgeObjectRetain();
    sub_1BCA48848();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BCA48D78();
  }
  if (v2 >> 60 == 15) {
    return sub_1BCA48D78();
  }
  sub_1BCA48D78();
  sub_1BC9A396C(v1, v2);
  sub_1BCA48448();

  return sub_1BC9A3B38(v1, v2);
}

uint64_t WebDomain.hashValue.getter()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_1BCA48D58();
  sub_1BCA48D78();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_1BCA48848();
    swift_bridgeObjectRelease();
  }
  sub_1BCA48D78();
  if (v3 >> 60 != 15)
  {
    sub_1BC9A396C(v2, v3);
    sub_1BCA48448();
    sub_1BC9A3B38(v2, v3);
  }
  return sub_1BCA48D88();
}

uint64_t sub_1BCA42C8C()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  unint64_t v3 = v0[3];
  sub_1BCA48D58();
  sub_1BCA48D78();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_1BCA48848();
    swift_bridgeObjectRelease();
  }
  sub_1BCA48D78();
  if (v3 >> 60 != 15)
  {
    sub_1BC9A396C(v2, v3);
    sub_1BCA48448();
    sub_1BC9A3B38(v2, v3);
  }
  return sub_1BCA48D88();
}

uint64_t WebDomain.description.getter()
{
  uint64_t v1 = v0[2];
  unint64_t v2 = v0[3];
  if (!v0[1])
  {
    if (v2 >> 60 == 15) {
      return 0x69616D6F44626557;
    }
    sub_1BC9A396C(v1, v2);
    sub_1BCA48B58();
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xD000000000000011;
    sub_1BCA48B58();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  if (v2 >> 60 != 15)
  {
    sub_1BC9A396C(v1, v2);
    sub_1BCA48B58();
    swift_bridgeObjectRelease();
    unint64_t v4 = 0xD000000000000012;
    sub_1BCA48858();
    sub_1BCA48858();
    sub_1BCA48B58();
    swift_bridgeObjectRelease();
LABEL_8:
    sub_1BC9A396C(v1, v2);
    sub_1BCA48418();
    sub_1BCA48858();
    swift_bridgeObjectRelease();
    sub_1BC9A3B38(v1, v2);
    sub_1BCA48858();
    sub_1BCA48858();
    swift_bridgeObjectRelease();
    sub_1BCA48858();
    sub_1BC9A3B38(v1, v2);
    return v4;
  }
  sub_1BCA48B58();
  swift_bridgeObjectRelease();
  unint64_t v4 = 0xD000000000000012;
  sub_1BCA48858();
  sub_1BCA48858();
  return v4;
}

uint64_t WebContentSettings.Name.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1BCA48C38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void *static WebContentSettings.Name.allCases.getter()
{
  return &unk_1F16EC780;
}

unint64_t WebContentSettings.Name.rawValue.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_1BCA4304C()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA430A4()
{
  return sub_1BCA48848();
}

uint64_t sub_1BCA430C0()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA43114@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_1BCA48C38();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1BCA43168(void *a1@<X8>)
{
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x80000001BCA4F8A0;
}

void sub_1BCA43188(void *a1@<X8>)
{
  *a1 = &unk_1F16EC818;
}

uint64_t static WebContentSettings.FilterPolicy.maximumSpecificDomainsCount.getter()
{
  return 50;
}

uint64_t static WebContentSettings.FilterPolicy.maximumAutoDomainsCount.getter()
{
  return 50;
}

uint64_t static WebContentSettings.FilterPolicy.maximumAutoExceptionsCount.getter()
{
  return 50;
}

uint64_t static WebContentSettings.FilterPolicy.maximumAllExceptionsCount.getter()
{
  return 50;
}

uint64_t WebContentSettings.blockedByFilter.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD80 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99E2B4((uint64_t)&qword_1E9FAEA40, v4, v3, v6, v5, a1);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

double sub_1BCA43274@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v7 = qword_1E9FABD80;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99E2B4((uint64_t)&qword_1E9FAEA40, v4, v3, v6, v5, (uint64_t)&v10);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  char v8 = v11;
  double result = *(double *)&v10;
  *(_OWORD *)a2 = v10;
  *(unsigned char *)(a2 + 16) = v8;
  return result;
}

uint64_t sub_1BCA4334C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  char v5 = *(unsigned char *)(a1 + 16);
  sub_1BCA44088(*(void *)a1, v4, v5);
  if (qword_1E9FABD80 != -1) {
    swift_once();
  }
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v8 = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BCA0CE10(v3, v4, v5, (uint64_t)&qword_1E9FAEA40, v6, v7, v9, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return sub_1BCA44074(v3, v4, v5);
}

uint64_t WebContentSettings.blockedByFilter.setter(uint64_t a1)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  if (qword_1E9FABD80 != -1) {
    swift_once();
  }
  uint64_t v6 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v15 = v3;
  uint64_t v16 = v2;
  LOBYTE(v17) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v4 == 255)
  {
    v9.isa = 0;
  }
  else
  {
    sub_1BCA44088(v3, v2, v4);
    v9.isa = WebContentSettings.FilterPolicy.persistableValue()().isa;
    sub_1BC9FFA88(v15, v16, v17);
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v10 = v8;
    uint64_t v11 = qword_1E9FAEA58;
    uint64_t v12 = unk_1E9FAEA60;
    uint64_t v15 = v6;
    uint64_t v16 = v5;
    uint64_t v17 = v10;
    uint64_t v18 = v7;
    int v13 = byte_1E9FAEA92;
    swift_retain();
    sub_1BC9A4CA8(v9.isa, v11, v12, &v15, v13);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BCA44074(v3, v2, v4);
}

uint64_t (*WebContentSettings.blockedByFilter.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD80 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99E2B4((uint64_t)&qword_1E9FAEA40, v3, v4, v6, v5, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1BCA4369C;
}

uint64_t sub_1BCA4369C(uint64_t a1, char a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 24);
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  char v5 = *(unsigned char *)(a1 + 16);
  uint64_t v7 = *v2;
  uint64_t v6 = v2[1];
  uint64_t v9 = v2[2];
  uint64_t v8 = v2[3];
  if (a2)
  {
    sub_1BCA44088(*(void *)a1, v4, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BCA0CE10(v3, v4, v5, (uint64_t)&qword_1E9FAEA40, v7, v6, v9, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1BCA44074(v3, v4, v5);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1BCA0CE10(v3, v4, v5, (uint64_t)&qword_1E9FAEA40, v7, v6, v9, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return sub_1BCA44074(v3, v4, v5);
}

uint64_t WebContentSettings.effectiveBlockedByFilter.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9FABD80 != -1) {
    swift_once();
  }
  if (qword_1E9FABAC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (!qword_1E9FAC238) {
    goto LABEL_9;
  }
  uint64_t v2 = qword_1E9FAEA58;
  uint64_t v3 = unk_1E9FAEA60;
  swift_retain();
  uint64_t v4 = sub_1BC9AEFD0(v2, v3);
  swift_release();
  if (!v4) {
    goto LABEL_9;
  }
  id v5 = v4;
  static WebContentSettings.FilterPolicy.value(from:)(v4, (uint64_t)v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABE38);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    *(_OWORD *)a1 = v10;
    *(unsigned char *)(a1 + 16) = v11;
  }
  else
  {
LABEL_9:
    uint64_t v7 = qword_1E9FAEA40;
    uint64_t v8 = *(void *)algn_1E9FAEA48;
    *(void *)a1 = qword_1E9FAEA40;
    *(void *)(a1 + 8) = v8;
    char v9 = byte_1E9FAEA50;
    *(unsigned char *)(a1 + 16) = byte_1E9FAEA50;
    return sub_1BC9A3908(v7, v8, v9);
  }
  return result;
}

void sub_1BCA43914()
{
  qword_1E9FAEA40 = 0;
  *(void *)algn_1E9FAEA48 = 0;
  byte_1E9FAEA50 = 3;
  qword_1E9FAEA58 = 0xD00000000000001ALL;
  unk_1E9FAEA60 = 0x80000001BCA4F8A0;
  qword_1E9FAEA80 = (uint64_t)&type metadata for WebContentFilterPolicyCombineOperator;
  unk_1E9FAEA88 = &protocol witness table for WebContentFilterPolicyCombineOperator;
  word_1E9FAEA90 = 257;
  byte_1E9FAEA92 = 0;
  qword_1E9FAEA98 = 0;
  byte_1E9FAEAA0 = 1;
}

uint64_t static WebContentSettings.blockedByFilter.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9FABD80 != -1) {
    swift_once();
  }

  return sub_1BCA4409C((uint64_t)&qword_1E9FAEA40, a1);
}

unint64_t WebContentSettings.FilterPolicy.description.getter()
{
  unint64_t v1 = 0xD000000000000011;
  switch(*(unsigned char *)(v0 + 16))
  {
    case 1:
      sub_1BCA48B58();
      swift_bridgeObjectRelease();
      unint64_t v4 = 0xD00000000000001BLL;
      sub_1BCA41190();
      sub_1BCA488E8();
      sub_1BCA48858();
      swift_bridgeObjectRelease();
      sub_1BCA48858();
      goto LABEL_6;
    case 2:
      sub_1BCA48B58();
      swift_bridgeObjectRelease();
      unint64_t v2 = 0xD00000000000001DLL;
      goto LABEL_5;
    case 3:
      return v1;
    default:
      sub_1BCA48B58();
      swift_bridgeObjectRelease();
      unint64_t v2 = 0xD00000000000001FLL;
LABEL_5:
      unint64_t v4 = v2;
      sub_1BCA41190();
LABEL_6:
      sub_1BCA488E8();
      sub_1BCA48858();
      swift_bridgeObjectRelease();
      sub_1BCA48858();
      return v4;
  }
}

uint64_t WebContentSettings.customMirror.getter@<X0>(uint64_t a1@<X8>)
{
  v26[1] = a1;
  v26[0] = sub_1BCA48DA8();
  uint64_t v2 = *(void *)(v26[0] - 8);
  MEMORY[0x1F4188790](v26[0], v3);
  id v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA8);
  MEMORY[0x1F4188790](v6 - 8, v7);
  char v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v10 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v12 = v1[3];
  uint64_t v31 = *v1;
  uint64_t v32 = v10;
  uint64_t v33 = v13;
  uint64_t v34 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BCA49BE0;
  uint64_t v15 = qword_1E9FABD80;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = unk_1E9FAEA60;
  *(void *)(v14 + 32) = qword_1E9FAEA58;
  *(void *)(v14 + 40) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99E2B4((uint64_t)&qword_1E9FAEA40, v11, v10, v13, v12, (uint64_t)v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v17 = v29[0];
  uint64_t v18 = v29[1];
  char v19 = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1BC99F190((uint64_t)&qword_1E9FAEA40, (uint64_t)v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v20 = v27[0];
  uint64_t v21 = v27[1];
  char v22 = v28;
  *(void *)(v14 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAEAA8);
  uint64_t v23 = swift_allocObject();
  *(void *)(v14 + 48) = v23;
  *(void *)(v23 + 16) = v17;
  *(void *)(v23 + 24) = v18;
  *(unsigned char *)(v23 + 32) = v19;
  *(void *)(v23 + 40) = v20;
  *(void *)(v23 + 48) = v21;
  *(unsigned char *)(v23 + 56) = v22;
  uint64_t v24 = sub_1BCA48D98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 1, 1, v24);
  (*(void (**)(char *, void, void))(v2 + 104))(v5, *MEMORY[0x1E4FBC430], v26[0]);
  return sub_1BCA48DB8();
}

uint64_t _s15ManagedSettings010WebContentB0V12FilterPolicyO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  switch(*(unsigned char *)(a1 + 16))
  {
    case 1:
      if (v7 != 1) {
        return 0;
      }
      uint64_t v9 = *(void *)(a1 + 8);
      if ((sub_1BC9DEEE8(v4, v5) & 1) == 0) {
        return 0;
      }
      uint64_t v4 = v9;
      uint64_t v5 = v6;
      goto LABEL_10;
    case 2:
      if (v7 == 2) {
        goto LABEL_10;
      }
      return 0;
    case 3:
      return (v7 & 0xF) == 3;
    default:
      if (v7) {
        return 0;
      }
LABEL_10:
      return sub_1BC9DEEE8(v4, v5);
  }
}

BOOL _s15ManagedSettings9WebDomainV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  unint64_t v5 = a1[3];
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  unint64_t v8 = a2[3];
  if (!v3)
  {
    if (v6) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v6) {
    return 0;
  }
  BOOL v9 = *a1 == *a2 && v3 == v6;
  if (v9 || (char v10 = sub_1BCA48CA8(), result = 0, (v10 & 1) != 0))
  {
LABEL_10:
    if (v5 >> 60 == 15)
    {
      if (v8 >> 60 == 15) {
        return 1;
      }
      goto LABEL_14;
    }
    if (v8 >> 60 == 15)
    {
LABEL_14:
      sub_1BC9A3B24(v4, v5);
      sub_1BC9A3B24(v7, v8);
      sub_1BC9A3B38(v4, v5);
      sub_1BC9A3B38(v7, v8);
      return 0;
    }
    sub_1BC9A3B24(v4, v5);
    sub_1BC9A3B24(v7, v8);
    char v12 = sub_1BC9DC9C8(v4, v5, v7, v8);
    sub_1BC9A3B38(v7, v8);
    sub_1BC9A3B38(v4, v5);
    return (v12 & 1) != 0;
  }
  return result;
}

uint64_t sub_1BCA44074(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_1BC9FFA88(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_1BCA44088(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_1BC9A3908(a1, a2, a3);
  }
  return a1;
}

uint64_t sub_1BCA4409C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAE9B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCA44104()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  if (v1 != 255) {
    sub_1BC9FFA88(*(void *)(v0 + 16), *(void *)(v0 + 24), v1);
  }
  int v2 = *(unsigned __int8 *)(v0 + 56);
  if (v2 != 255) {
    sub_1BC9FFA88(*(void *)(v0 + 40), *(void *)(v0 + 48), v2);
  }

  return MEMORY[0x1F4186498](v0, 57, 7);
}

unint64_t sub_1BCA44160()
{
  unint64_t result = qword_1E9FAEAB0;
  if (!qword_1E9FAEAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAEAB0);
  }
  return result;
}

unint64_t sub_1BCA441B8()
{
  unint64_t result = qword_1E9FAEAB8;
  if (!qword_1E9FAEAB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAEAB8);
  }
  return result;
}

unint64_t sub_1BCA44210()
{
  unint64_t result = qword_1E9FAEAC0;
  if (!qword_1E9FAEAC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9FAEAC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAEAC0);
  }
  return result;
}

uint64_t destroy for WebDomain(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >> 60 != 15)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    return sub_1BC9A3ACC(v4, v3);
  }
  return result;
}

uint64_t initializeWithCopy for WebDomain(uint64_t a1, void *a2)
{
  uint64_t v3 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = a2 + 2;
  unint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  if (v5 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *v4;
  }
  else
  {
    uint64_t v6 = *(void *)v4;
    sub_1BC9A396C(v6, v5);
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = v5;
  }
  return a1;
}

void *assignWithCopy for WebDomain(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2 + 2;
  unint64_t v5 = a2[3];
  if (a1[3] >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v7 = *v4;
      sub_1BC9A396C(*v4, v5);
      uint64_t v8 = a1[2];
      unint64_t v9 = a1[3];
      a1[2] = v7;
      a1[3] = v5;
      sub_1BC9A3ACC(v8, v9);
      return a1;
    }
    sub_1BCA44408((uint64_t)(a1 + 2));
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *((_OWORD *)a1 + 1) = *(_OWORD *)v4;
    return a1;
  }
  uint64_t v6 = *v4;
  sub_1BC9A396C(*v4, v5);
  a1[2] = v6;
  a1[3] = v5;
  return a1;
}

uint64_t sub_1BCA44408(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FACA10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *assignWithTake for WebDomain(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  unint64_t v5 = a2 + 2;
  unint64_t v6 = a1[3];
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = a2[3];
    if (v7 >> 60 != 15)
    {
      uint64_t v8 = a1[2];
      a1[2] = *v5;
      a1[3] = v7;
      sub_1BC9A3ACC(v8, v6);
      return a1;
    }
    sub_1BCA44408((uint64_t)(a1 + 2));
  }
  *((_OWORD *)a1 + 1) = *(_OWORD *)v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for WebDomain(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 32)) {
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

uint64_t storeEnumTagSinglePayload for WebDomain(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WebDomain()
{
  return &type metadata for WebDomain;
}

ValueMetadata *type metadata accessor for WebContentSettings()
{
  return &type metadata for WebContentSettings;
}

unsigned char *storeEnumTagSinglePayload for WebContentSettings.Name(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
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
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1BCA44660);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for WebContentSettings.Name()
{
  return &type metadata for WebContentSettings.Name;
}

uint64_t destroy for WebContentSettings.FilterPolicy(uint64_t a1)
{
  return sub_1BC9FFA88(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s15ManagedSettings18WebContentSettingsV12FilterPolicyOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1BC9A3908(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for WebContentSettings.FilterPolicy(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_1BC9A3908(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1BC9FFA88(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for WebContentSettings.FilterPolicy(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1BC9FFA88(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for WebContentSettings.FilterPolicy(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WebContentSettings.FilterPolicy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1BCA44824(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_1BCA4483C(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for WebContentSettings.FilterPolicy()
{
  return &type metadata for WebContentSettings.FilterPolicy;
}

uint64_t sub_1BCA44864()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA448EC()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA449EC()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA44A70()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA44B70()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA44C18()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA44D14()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA44D9C()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA44E44()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA44EE8()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA44F94()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA450A4()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA45124()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA451CC()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA45254()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA45310()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA453BC()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA45464()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA454F8()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA45588()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA45668()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA4575C()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA457EC()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA45880()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA45910()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA459A0()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA45A80()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA45B60()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA45BEC()
{
  sub_1BCA48848();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA45D18()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA45DB8()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA45E34()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA45F30()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA46028()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA460CC()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA46170()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA46228()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA462D0()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA46354()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA463F8()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA46504()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA46588()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA46684()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA46728()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA467A8()
{
  return sub_1BCA48D88();
}

uint64_t sub_1BCA4682C()
{
  return sub_1BCA48D88();
}

ManagedSettings::DeviceActivitySettings::Name_optional __swiftcall DeviceActivitySettings.Name.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1BCA48C38();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

void *static DeviceActivitySettings.Name.allCases.getter()
{
  return &unk_1F16ECC68;
}

unint64_t DeviceActivitySettings.Name.rawValue.getter()
{
  unint64_t v1 = 0xD000000000000021;
  if (*v0 == 1) {
    unint64_t v1 = 0xD00000000000001ELL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0xD00000000000001DLL;
  }
}

uint64_t sub_1BCA46998(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1BC9F478C(*a1, *a2);
}

uint64_t sub_1BCA469A4()
{
  return sub_1BCA453BC();
}

uint64_t sub_1BCA469AC()
{
  return sub_1BCA45880();
}

uint64_t sub_1BCA469B4()
{
  return sub_1BCA460CC();
}

ManagedSettings::DeviceActivitySettings::Name_optional sub_1BCA469BC(Swift::String *a1)
{
  return DeviceActivitySettings.Name.init(rawValue:)(*a1);
}

unint64_t sub_1BCA469C8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = DeviceActivitySettings.Name.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1BCA469F0(void *a1@<X8>)
{
  *a1 = &unk_1F16ECCF8;
}

uint64_t DeviceActivitySettings.allowedClients.getter()
{
  return sub_1BCA46CC0(&qword_1E9FABD88, (uint64_t)&qword_1E9FAEAD0, sub_1BC99D12C);
}

uint64_t DeviceActivitySettings.allowedClients.setter(uint64_t a1)
{
  sub_1BCA47C68(a1);

  return swift_bridgeObjectRelease();
}

void (*DeviceActivitySettings.allowedClients.modify(void *a1))(uint64_t *a1, char a2)
{
  unint64_t v3 = malloc(0x98uLL);
  *a1 = v3;
  int v4 = v3 + 17;
  v3[18] = v1;
  uint64_t v6 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v7 = v1[3];
  if (qword_1E9FABD88 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1BC99D12C((uint64_t)&qword_1E9FAEAD0, v6, v5, v8, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t *v4 = v9;
  return sub_1BCA46B54;
}

void sub_1BCA46B54(uint64_t *a1, char a2)
{
}

uint64_t DeviceActivitySettings.effectiveAllowedClients.getter()
{
  return sub_1BCA4723C(&qword_1E9FABD88, (uint64_t)&qword_1E9FAEAD0, sub_1BC99ECD0);
}

uint64_t sub_1BCA46BB4()
{
  qword_1E9FAEAD0 = MEMORY[0x1E4FBC870];
  qword_1E9FAEAD8 = 0xD00000000000001DLL;
  qword_1E9FAEAE0 = 0x80000001BCA4F8C0;
  qword_1E9FAEB00 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAC1B8);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAC1C0, &qword_1E9FAC1B8);
  qword_1E9FAEB08 = result;
  byte_1E9FAEAE8 = 1;
  word_1E9FAEB10 = 256;
  byte_1E9FAEB12 = 0;
  qword_1E9FAEB18 = 0x7FFFFFFFFFFFFFFFLL;
  byte_1E9FAEB20 = 0;
  return result;
}

uint64_t static DeviceActivitySettings.allowedClients.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA129AC(&qword_1E9FABD88, (uint64_t)&qword_1E9FAEAD0, &qword_1EBA01C48, a1);
}

uint64_t DeviceActivitySettings.sharingAppleIDs.getter()
{
  return sub_1BCA46CC0(&qword_1E9FABD90, (uint64_t)&qword_1E9FAEB28, sub_1BC99E6A4);
}

uint64_t sub_1BCA46CC0(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *v3;
  uint64_t v6 = v3[1];
  uint64_t v9 = v3[2];
  uint64_t v8 = v3[3];
  if (*a1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = a3(a2, v7, v6, v9, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1BCA46D58@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X3>, uint64_t a3@<X4>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v10 = a1[3];
  uint64_t v12 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = a4(a3, v9, v8, v11, v10);
  swift_bridgeObjectRelease_n();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a5 = v13;
  return result;
}

uint64_t DeviceActivitySettings.sharingAppleIDs.setter(uint64_t a1)
{
  sub_1BCA47DF8(a1);

  return swift_bridgeObjectRelease();
}

void (*DeviceActivitySettings.sharingAppleIDs.modify(void *a1))(uint64_t *a1, char a2)
{
  unint64_t v3 = malloc(0x98uLL);
  *a1 = v3;
  int v4 = v3 + 17;
  v3[18] = v1;
  uint64_t v6 = *v1;
  uint64_t v5 = v1[1];
  uint64_t v8 = v1[2];
  uint64_t v7 = v1[3];
  if (qword_1E9FABD90 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1BC99E6A4((uint64_t)&qword_1E9FAEB28, v6, v5, v8, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t *v4 = v9;
  return sub_1BCA46F44;
}

void sub_1BCA46F44(uint64_t *a1, char a2)
{
}

void sub_1BCA46F6C(uint64_t *a1, char a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v8 = *a1;
  uint64_t v9 = *(void *)(*a1 + 136);
  uint64_t v10 = *(uint64_t **)(*a1 + 144);
  sub_1BC9AA050(a3, *a1, a4);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  uint64_t v14 = v10[2];
  uint64_t v13 = v10[3];
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = (void *)a5(v9);
    }
    else
    {
      uint64_t v15 = 0;
    }
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v17 = v14;
      uint64_t v18 = *(void *)(v8 + 8);
      uint64_t v19 = *(void *)(v8 + 16);
      uint64_t v25 = v12;
      uint64_t v26 = v11;
      uint64_t v27 = v17;
      uint64_t v28 = v13;
      int v20 = *(unsigned __int8 *)(v8 + 66);
      swift_retain();
      sub_1BC9A4CA8(v15, v18, v19, &v25, v20);
      swift_release();
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_1BC9A3A70(v8, a4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v9)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = (void *)a5(v9);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = 0;
    }
    if (qword_1E9FABA80 != -1) {
      swift_once();
    }
    swift_beginAccess();
    if (off_1E9FABF10)
    {
      uint64_t v21 = v14;
      uint64_t v22 = *(void *)(v8 + 8);
      uint64_t v23 = *(void *)(v8 + 16);
      uint64_t v25 = v12;
      uint64_t v26 = v11;
      uint64_t v27 = v21;
      uint64_t v28 = v13;
      int v24 = *(unsigned __int8 *)(v8 + 66);
      swift_retain();
      sub_1BC9A4CA8(v16, v22, v23, &v25, v24);
      swift_release();
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_1BC9A3A70(v8, a4);
  }
  swift_bridgeObjectRelease();

  free((void *)v8);
}

uint64_t DeviceActivitySettings.effectiveSharingAppleIDs.getter()
{
  return sub_1BCA4723C(&qword_1E9FABD90, (uint64_t)&qword_1E9FAEB28, sub_1BC99F314);
}

uint64_t sub_1BCA4723C(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (*a1 != -1)
  {
    uint64_t v5 = a3;
    swift_once();
    a3 = v5;
  }

  return a3(a2);
}

uint64_t sub_1BCA4729C()
{
  qword_1E9FAEB28 = MEMORY[0x1E4FBC870];
  qword_1E9FAEB30 = 0xD00000000000001ELL;
  qword_1E9FAEB38 = 0x80000001BCA4F8E0;
  qword_1E9FAEB58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FACDE8);
  uint64_t result = sub_1BC9ADEBC(&qword_1E9FAEBF8, &qword_1E9FACDE8);
  qword_1E9FAEB60 = result;
  byte_1E9FAEB40 = 1;
  word_1E9FAEB68 = 256;
  byte_1E9FAEB6A = 1;
  qword_1E9FAEB70 = 0x7FFFFFFFFFFFFFFFLL;
  byte_1E9FAEB78 = 0;
  return result;
}

uint64_t static DeviceActivitySettings.sharingAppleIDs.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1BCA129AC(&qword_1E9FABD90, (uint64_t)&qword_1E9FAEB28, &qword_1E9FAE8D8, a1);
}

uint64_t DeviceActivitySettings.shareAcrossDevices.getter()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  if (qword_1E9FABD98 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1BC99CD6C((uint64_t)&byte_1E9FAEB80, v2, v1, v4, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BCA47410@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v7 = qword_1E9FABD98;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v8 = sub_1BC99CD6C((uint64_t)&byte_1E9FAEB80, v4, v3, v6, v5);
  swift_bridgeObjectRelease_n();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a2 = v8;
  return result;
}

uint64_t DeviceActivitySettings.shareAcrossDevices.setter(unsigned __int8 a1)
{
  int v2 = a1;
  if (qword_1E9FABD98 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&byte_1E9FAEB80, (uint64_t)v15, &qword_1E9FABDA0);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (v2 == 2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = v2 & 1;
    id v9 = objc_allocWithZone(NSNumber);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v7 = objc_msgSend(v9, sel_initWithBool_, v8);
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v10 = v16;
    uint64_t v11 = v17;
    v14[0] = v4;
    v14[1] = v3;
    v14[2] = v6;
    v14[3] = v5;
    int v12 = v18;
    swift_retain();
    sub_1BC9A4CA8(v7, v10, v11, v14, v12);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BC9A3A70((uint64_t)v15, &qword_1E9FABDA0);
}

uint64_t (*DeviceActivitySettings.shareAcrossDevices.modify(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  if (qword_1E9FABD98 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v7 = sub_1BC99CD6C((uint64_t)&byte_1E9FAEB80, v4, v3, v6, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = v7;
  return sub_1BCA47758;
}

uint64_t sub_1BCA47758(uint64_t a1)
{
  return DeviceActivitySettings.shareAcrossDevices.setter(*(unsigned char *)(a1 + 8));
}

uint64_t DeviceActivitySettings.effectiveShareAcrossDevices.getter()
{
  if (qword_1E9FABD98 != -1) {
    swift_once();
  }

  return sub_1BC99EBCC(&byte_1E9FAEB80);
}

void sub_1BCA477DC()
{
  byte_1E9FAEB80 = 1;
  qword_1E9FAEB88 = 0xD000000000000021;
  unk_1E9FAEB90 = 0x80000001BCA4F900;
  qword_1E9FAEBB0 = (uint64_t)&type metadata for BoolCombineOperator;
  unk_1E9FAEBB8 = &protocol witness table for BoolCombineOperator;
  byte_1E9FAEB98 = 1;
  word_1E9FAEBC0 = 256;
  byte_1E9FAEBC2 = 0;
  qword_1E9FAEBC8 = 0;
  byte_1E9FAEBD0 = 1;
}

uint64_t static DeviceActivitySettings.shareAcrossDevices.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_1E9FABD98 != -1) {
    swift_once();
  }
  return sub_1BC9AA050((uint64_t)&byte_1E9FAEB80, a1, &qword_1E9FABDA0);
}

uint64_t DeviceActivitySettings.customMirror.getter@<X0>(uint64_t a1@<X8>)
{
  v26[1] = a1;
  v26[0] = sub_1BCA48DA8();
  uint64_t v2 = *(void *)(v26[0] - 8);
  MEMORY[0x1F4188790](v26[0], v3);
  uint64_t v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDA8);
  MEMORY[0x1F4188790](v6 - 8, v7);
  id v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v1;
  uint64_t v10 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v12 = v1[3];
  void v26[2] = *v1;
  v26[3] = v10;
  v26[4] = v13;
  v26[5] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BCA49BD0;
  uint64_t v15 = qword_1E9FABD88;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_1E9FAEAE0;
  *(void *)(v14 + 32) = qword_1E9FAEAD8;
  *(void *)(v14 + 40) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_1BC99D12C((uint64_t)&qword_1E9FAEAD0, v11, v10, v13, v12);
  uint64_t v18 = sub_1BC99ECD0((uint64_t)&qword_1E9FAEAD0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v14 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAC188);
  *(void *)(v14 + 48) = v17;
  *(void *)(v14 + 56) = v18;
  if (qword_1E9FABD90 != -1) {
    swift_once();
  }
  uint64_t v19 = qword_1E9FAEB38;
  *(void *)(v14 + 80) = qword_1E9FAEB30;
  *(void *)(v14 + 88) = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_1BC99E6A4((uint64_t)&qword_1E9FAEB28, v11, v10, v13, v12);
  uint64_t v21 = sub_1BC99F314((uint64_t)&qword_1E9FAEB28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v14 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FAEBD8);
  *(void *)(v14 + 96) = v20;
  *(void *)(v14 + 104) = v21;
  if (qword_1E9FABD98 != -1) {
    swift_once();
  }
  uint64_t v22 = unk_1E9FAEB90;
  *(void *)(v14 + 128) = qword_1E9FAEB88;
  *(void *)(v14 + 136) = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(v22) = sub_1BC99CD6C((uint64_t)&byte_1E9FAEB80, v11, v10, v13, v12);
  char v23 = sub_1BC99EBCC(&byte_1E9FAEB80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(v14 + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9FABDB8);
  *(unsigned char *)(v14 + 144) = v22;
  *(unsigned char *)(v14 + 145) = v23;
  uint64_t v24 = sub_1BCA48D98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 1, 1, v24);
  (*(void (**)(char *, void, void))(v2 + 104))(v5, *MEMORY[0x1E4FBC430], v26[0]);
  return sub_1BCA48DB8();
}

uint64_t sub_1BCA47C68(uint64_t a1)
{
  if (qword_1E9FABD88 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAEAD0, (uint64_t)v13, &qword_1EBA01C48);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (a1)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_1BC9AC368(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v8 = v14;
    uint64_t v9 = v15;
    v12[0] = v4;
    v12[1] = v3;
    long long v12[2] = v6;
    v12[3] = v5;
    int v10 = v16;
    swift_retain();
    sub_1BC9A4CA8(v7, v8, v9, v12, v10);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BC9A3A70((uint64_t)v13, &qword_1EBA01C48);
}

uint64_t sub_1BCA47DF8(uint64_t a1)
{
  if (qword_1E9FABD90 != -1) {
    swift_once();
  }
  sub_1BC9AA050((uint64_t)&qword_1E9FAEB28, (uint64_t)v13, &qword_1E9FAE8D8);
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (a1)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_1BC9ACB84(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (qword_1E9FABA80 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (off_1E9FABF10)
  {
    uint64_t v8 = v14;
    uint64_t v9 = v15;
    v12[0] = v4;
    v12[1] = v3;
    long long v12[2] = v6;
    v12[3] = v5;
    int v10 = v16;
    swift_retain();
    sub_1BC9A4CA8(v7, v8, v9, v12, v10);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return sub_1BC9A3A70((uint64_t)v13, &qword_1E9FAE8D8);
}

unint64_t sub_1BCA47F8C()
{
  unint64_t result = qword_1E9FAEBE0;
  if (!qword_1E9FAEBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9FAEBE0);
  }
  return result;
}

uint64_t sub_1BCA47FE0()
{
  return sub_1BC9ADEBC(&qword_1E9FAEBE8, &qword_1E9FAEBF0);
}

uint64_t sub_1BCA4801C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BCA46D58(a1, &qword_1E9FABD88, (uint64_t)&qword_1E9FAEAD0, sub_1BC99D12C, a2);
}

uint64_t sub_1BCA48068(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_2(a1, a2, a3, a4, (void (*)(uint64_t))sub_1BCA47C68);
}

uint64_t sub_1BCA48080@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1BCA46D58(a1, &qword_1E9FABD90, (uint64_t)&qword_1E9FAEB28, sub_1BC99E6A4, a2);
}

uint64_t sub_1BCA480CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm_2(a1, a2, a3, a4, (void (*)(uint64_t))sub_1BCA47DF8);
}

uint64_t keypath_setTm_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v6 = swift_bridgeObjectRetain();
  a5(v6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCA4813C(unsigned __int8 *a1)
{
  return DeviceActivitySettings.shareAcrossDevices.setter(*a1);
}

ValueMetadata *type metadata accessor for DeviceActivitySettings()
{
  return &type metadata for DeviceActivitySettings;
}

unsigned char *storeEnumTagSinglePayload for DeviceActivitySettings.Name(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BCA48240);
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

ValueMetadata *type metadata accessor for DeviceActivitySettings.Name()
{
  return &type metadata for DeviceActivitySettings.Name;
}

uint64_t sub_1BCA48278()
{
  return MEMORY[0x1F40E2D28]();
}

uint64_t sub_1BCA48288()
{
  return MEMORY[0x1F40E2D48]();
}

uint64_t sub_1BCA48298()
{
  return MEMORY[0x1F40E2D60]();
}

uint64_t sub_1BCA482A8()
{
  return MEMORY[0x1F40E2D78]();
}

uint64_t sub_1BCA482B8()
{
  return MEMORY[0x1F40E2D98]();
}

uint64_t sub_1BCA482C8()
{
  return MEMORY[0x1F40E2DB0]();
}

uint64_t sub_1BCA482D8()
{
  return MEMORY[0x1F40E2DF0]();
}

uint64_t sub_1BCA482E8()
{
  return MEMORY[0x1F40E2E08]();
}

uint64_t sub_1BCA482F8()
{
  return MEMORY[0x1F40E3568]();
}

uint64_t sub_1BCA48308()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1BCA48318()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1BCA48328()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1BCA48338()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1BCA48348()
{
  return MEMORY[0x1F40E4138]();
}

uint64_t sub_1BCA48358()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1BCA48368()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1BCA48378()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1BCA48388()
{
  return MEMORY[0x1F40E46B8]();
}

uint64_t sub_1BCA48398()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1BCA483A8()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1BCA483B8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1BCA483C8()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1BCA483D8()
{
  return MEMORY[0x1F40E4B30]();
}

uint64_t sub_1BCA483E8()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1BCA483F8()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1BCA48408()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1BCA48418()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1BCA48428()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1BCA48438()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1BCA48448()
{
  return MEMORY[0x1F40E4DB8]();
}

uint64_t sub_1BCA48458()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1BCA48468()
{
  return MEMORY[0x1F40E4E50]();
}

uint64_t sub_1BCA48478()
{
  return MEMORY[0x1F40E4E60]();
}

uint64_t sub_1BCA48488()
{
  return MEMORY[0x1F40E4E70]();
}

uint64_t sub_1BCA48498()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1BCA484A8()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1BCA484B8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1BCA484C8()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1BCA484D8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1BCA484E8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1BCA484F8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1BCA48508()
{
  return MEMORY[0x1F40D65E8]();
}

uint64_t sub_1BCA48518()
{
  return MEMORY[0x1F40D6608]();
}

uint64_t sub_1BCA48528()
{
  return MEMORY[0x1F40D68A8]();
}

uint64_t sub_1BCA48538()
{
  return MEMORY[0x1F40D68B0]();
}

uint64_t sub_1BCA48548()
{
  return MEMORY[0x1F40D68B8]();
}

uint64_t sub_1BCA48558()
{
  return MEMORY[0x1F40D68C8]();
}

uint64_t sub_1BCA48568()
{
  return MEMORY[0x1F40D68F8]();
}

uint64_t sub_1BCA48578()
{
  return MEMORY[0x1F40D6900]();
}

uint64_t sub_1BCA48588()
{
  return MEMORY[0x1F40D6908]();
}

uint64_t sub_1BCA48598()
{
  return MEMORY[0x1F40D6928]();
}

uint64_t sub_1BCA485A8()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1BCA485B8()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1BCA485C8()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1BCA485D8()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1BCA485E8()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1BCA485F8()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1BCA48608()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1BCA48618()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1BCA48628()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1BCA48638()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1BCA48648()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1BCA48658()
{
  return MEMORY[0x1F40D6DE0]();
}

uint64_t sub_1BCA48668()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1BCA48678()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1BCA48688()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1BCA48698()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1BCA486A8()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1BCA486B8()
{
  return MEMORY[0x1F4183288]();
}

uint64_t sub_1BCA486C8()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1BCA486D8()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1BCA486E8()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1BCA486F8()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1BCA48708()
{
  return MEMORY[0x1F4183448]();
}

uint64_t sub_1BCA48718()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1BCA48728()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1BCA48738()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1BCA48748()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1BCA48758()
{
  return MEMORY[0x1F4183738]();
}

uint64_t sub_1BCA48768()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1BCA48778()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1BCA48788()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1BCA48798()
{
  return MEMORY[0x1F4183808]();
}

uint64_t sub_1BCA487A8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1BCA487B8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BCA487C8()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1BCA487D8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1BCA487E8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BCA487F8()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1BCA48808()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1BCA48818()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1BCA48828()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1BCA48838()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1BCA48848()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1BCA48858()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1BCA48868()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1BCA48878()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_1BCA48888()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1BCA48898()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1BCA488A8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1BCA488B8()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1BCA488C8()
{
  return MEMORY[0x1F40E6448]();
}

uint64_t sub_1BCA488D8()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1BCA488E8()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1BCA488F8()
{
  return MEMORY[0x1F4184120]();
}

uint64_t sub_1BCA48918()
{
  return MEMORY[0x1F4184198]();
}

uint64_t sub_1BCA48928()
{
  return MEMORY[0x1F41841A8]();
}

uint64_t sub_1BCA48938()
{
  return MEMORY[0x1F41841F0]();
}

uint64_t sub_1BCA48948()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1BCA48958()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1BCA48968()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1BCA48978()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1BCA48988()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1BCA48998()
{
  return MEMORY[0x1F40E6520]();
}

uint64_t sub_1BCA489A8()
{
  return MEMORY[0x1F40E6538]();
}

uint64_t sub_1BCA489B8()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1BCA489C8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1BCA489D8()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1BCA489E8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1BCA489F8()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1BCA48A08()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1BCA48A18()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1BCA48A28()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1BCA48A38()
{
  return MEMORY[0x1F40E67D8]();
}

uint64_t sub_1BCA48A48()
{
  return MEMORY[0x1F40E67E8]();
}

uint64_t sub_1BCA48A58()
{
  return MEMORY[0x1F40E67F0]();
}

uint64_t sub_1BCA48A68()
{
  return MEMORY[0x1F40E6840]();
}

uint64_t sub_1BCA48A78()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1BCA48A88()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1BCA48A98()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1BCA48AA8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1BCA48AB8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1BCA48AC8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BCA48AD8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1BCA48AE8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1BCA48AF8()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1BCA48B08()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1BCA48B18()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1BCA48B28()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1BCA48B38()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1BCA48B48()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1BCA48B58()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1BCA48B68()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1BCA48B78()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1BCA48B88()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1BCA48B98()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1BCA48BA8()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1BCA48BB8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1BCA48BC8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1BCA48BD8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1BCA48BE8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1BCA48BF8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1BCA48C08()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1BCA48C18()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1BCA48C38()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1BCA48C48()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1BCA48C58()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1BCA48C68()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1BCA48C78()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1BCA48C88()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1BCA48C98()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1BCA48CA8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1BCA48CB8()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1BCA48CC8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1BCA48CD8()
{
  return MEMORY[0x1F4185D80]();
}

uint64_t sub_1BCA48CE8()
{
  return MEMORY[0x1F4185D90]();
}

uint64_t sub_1BCA48CF8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1BCA48D08()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1BCA48D18()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1BCA48D28()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1BCA48D38()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1BCA48D48()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1BCA48D58()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1BCA48D68()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1BCA48D78()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1BCA48D88()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1BCA48D98()
{
  return MEMORY[0x1F4185F28]();
}

uint64_t sub_1BCA48DA8()
{
  return MEMORY[0x1F4185F38]();
}

uint64_t sub_1BCA48DB8()
{
  return MEMORY[0x1F4185F60]();
}

uint64_t sub_1BCA48DC8()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1BCA48DD8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1BCA48DE8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1BCA48E18()
{
  return MEMORY[0x1F4186318]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}