uint64_t sub_2416E0A58()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24171F5C8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_2416E0AE8(unint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v7 = a1;
  unint64_t v8 = a1 >> 62;
  if (a1 >> 62)
  {
    sub_24171EF98();
    uint64_t v12 = sub_24171FC58();
    swift_bridgeObjectRelease();
    if (v12)
    {
LABEL_3:
      sub_2416E2AA4(0, a2, a3, a4, a5);
      uint64_t v9 = sub_24171FBA8();
      uint64_t v10 = v7 & 0xFFFFFFFFFFFFFF8;
      if (!v8) {
        goto LABEL_4;
      }
LABEL_8:
      sub_24171EF98();
      uint64_t v11 = sub_24171FC58();
      swift_bridgeObjectRelease();
      if (!v11) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v9 = MEMORY[0x263F8EE88];
  uint64_t v10 = v7 & 0xFFFFFFFFFFFFFF8;
  if (v8) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v11 = *(void *)(v10 + 16);
  if (!v11) {
    return;
  }
LABEL_9:
  uint64_t v13 = v9 + 56;
  uint64_t v50 = v11;
  if ((v7 & 0xC000000000000001) != 0)
  {
    uint64_t v14 = 0;
    unint64_t v46 = v7;
    while (1)
    {
      uint64_t v15 = MEMORY[0x245623280](v14, v7);
      BOOL v16 = __OFADD__(v14++, 1);
      if (v16)
      {
        __break(1u);
        goto LABEL_37;
      }
      uint64_t v17 = v15;
      uint64_t v18 = sub_24171FAC8();
      uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
      unint64_t v20 = v18 & ~v19;
      unint64_t v21 = v20 >> 6;
      uint64_t v22 = *(void *)(v13 + 8 * (v20 >> 6));
      uint64_t v23 = 1 << v20;
      if (((1 << v20) & v22) != 0)
      {
        sub_2416FA7F4(0, a3);
        id v24 = *(id *)(*(void *)(v9 + 48) + 8 * v20);
        char v25 = sub_24171FAD8();

        if (v25)
        {
LABEL_11:
          sub_24171F2D8();
          unint64_t v7 = v46;
          goto LABEL_12;
        }
        uint64_t v26 = ~v19;
        while (1)
        {
          unint64_t v20 = (v20 + 1) & v26;
          unint64_t v21 = v20 >> 6;
          uint64_t v22 = *(void *)(v13 + 8 * (v20 >> 6));
          uint64_t v23 = 1 << v20;
          if ((v22 & (1 << v20)) == 0) {
            break;
          }
          id v27 = *(id *)(*(void *)(v9 + 48) + 8 * v20);
          char v28 = sub_24171FAD8();

          if (v28) {
            goto LABEL_11;
          }
        }
        unint64_t v7 = v46;
      }
      *(void *)(v13 + 8 * v21) = v23 | v22;
      *(void *)(*(void *)(v9 + 48) + 8 * v20) = v17;
      uint64_t v29 = *(void *)(v9 + 16);
      BOOL v16 = __OFADD__(v29, 1);
      uint64_t v30 = v29 + 1;
      if (v16) {
        goto LABEL_38;
      }
      *(void *)(v9 + 16) = v30;
LABEL_12:
      if (v14 == v50) {
        return;
      }
    }
  }
  uint64_t v31 = 0;
  uint64_t v47 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v31 != v47)
  {
    id v32 = *(id *)(v7 + 32 + 8 * v31);
    uint64_t v33 = sub_24171FAC8();
    uint64_t v34 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v35 = v33 & ~v34;
    unint64_t v36 = v35 >> 6;
    uint64_t v37 = *(void *)(v13 + 8 * (v35 >> 6));
    uint64_t v38 = 1 << v35;
    if (((1 << v35) & v37) != 0)
    {
      sub_2416FA7F4(0, a3);
      id v39 = *(id *)(*(void *)(v9 + 48) + 8 * v35);
      char v40 = sub_24171FAD8();

      if (v40) {
        goto LABEL_24;
      }
      uint64_t v41 = ~v34;
      unint64_t v35 = (v35 + 1) & v41;
      unint64_t v36 = v35 >> 6;
      uint64_t v37 = *(void *)(v13 + 8 * (v35 >> 6));
      uint64_t v38 = 1 << v35;
      if ((v37 & (1 << v35)) != 0)
      {
        while (1)
        {
          id v42 = *(id *)(*(void *)(v9 + 48) + 8 * v35);
          char v43 = sub_24171FAD8();

          if (v43) {
            break;
          }
          unint64_t v35 = (v35 + 1) & v41;
          unint64_t v36 = v35 >> 6;
          uint64_t v37 = *(void *)(v13 + 8 * (v35 >> 6));
          uint64_t v38 = 1 << v35;
          if ((v37 & (1 << v35)) == 0) {
            goto LABEL_32;
          }
        }
LABEL_24:

        uint64_t v11 = v50;
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v11 = v50;
    }
    *(void *)(v13 + 8 * v36) = v38 | v37;
    *(void *)(*(void *)(v9 + 48) + 8 * v35) = v32;
    uint64_t v44 = *(void *)(v9 + 16);
    BOOL v16 = __OFADD__(v44, 1);
    uint64_t v45 = v44 + 1;
    if (v16) {
      goto LABEL_39;
    }
    *(void *)(v9 + 16) = v45;
LABEL_25:
    if (++v31 == v11) {
      return;
    }
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

void *sub_2416E0E5C(uint64_t a1)
{
  return sub_2416E15A8(a1);
}

uint64_t sub_2416E0E80()
{
  sub_2416E29E4(0, (unint64_t *)&qword_26B018C40);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_241722AF0;
  sub_2416E2B30();
  *(void *)(inited + 32) = MEMORY[0x245623000]((id)*MEMORY[0x263F09248]);
  sub_24171F8B8();
  if (inited >> 62)
  {
    sub_24171EF98();
    uint64_t v3 = sub_24171FC58();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v2 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  if (!*(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  sub_2416E2B70(inited);
  uint64_t v2 = v1;
LABEL_6:
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_2416E0F70(char a1, int64_t a2, char a3, void *a4)
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
    sub_2416E2A2C();
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 48 * v8) {
      memmove(v10 + 4, a4 + 4, 48 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 48 * v8 || v12 >= v13 + 48 * v8)
  {
    sub_2416E2F8C();
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24171FCA8();
  __break(1u);
  return result;
}

uint64_t sub_2416E1110@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  uint64_t result = sub_24171F588();
  *a1 = v2;
  return result;
}

uint64_t sub_2416E1158(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_24171FB68()) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = MEMORY[0x263F8EE88];
    if (v2) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = -1 << *(unsigned char *)(v1 + 32);
    uint64_t v29 = v1 + 56;
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(v1 + 56);
    sub_24171EF98();
    uint64_t result = swift_retain();
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  if (!*(void *)(a1 + 16)) {
    goto LABEL_6;
  }
LABEL_3:
  sub_2416E150C();
  uint64_t v3 = sub_24171FBA8();
  if (!v2) {
    goto LABEL_7;
  }
LABEL_4:
  sub_24171EF98();
  swift_retain();
  sub_24171FB58();
  sub_2416FA7F4(0, &qword_26B018400);
  sub_2416FEF34(&qword_26B018408, &qword_26B018400);
  uint64_t result = sub_24171F918();
  uint64_t v1 = v31;
  uint64_t v29 = v32;
  uint64_t v5 = v33;
  uint64_t v6 = v34;
  unint64_t v7 = v35;
LABEL_11:
  int64_t v11 = (unint64_t)(v5 + 64) >> 6;
  uint64_t v12 = v3 + 56;
  while (v1 < 0)
  {
    if (!sub_24171FB78()) {
      goto LABEL_45;
    }
    sub_2416FA7F4(0, &qword_26B018400);
    swift_dynamicCast();
    BOOL v16 = v30;
LABEL_36:
    uint64_t result = sub_24171FAC8();
    uint64_t v22 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_46;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v3 + 48) + 8 * v13) = v16;
    ++*(void *)(v3 + 16);
  }
  if (v7)
  {
    unint64_t v14 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v15 = v14 | (v6 << 6);
LABEL_35:
    BOOL v16 = *(void **)(*(void *)(v1 + 48) + 8 * v15);
    uint64_t v30 = v16;
    id v21 = v16;
    goto LABEL_36;
  }
  int64_t v17 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v17 >= v11) {
      goto LABEL_45;
    }
    unint64_t v18 = *(void *)(v29 + 8 * v17);
    uint64_t v19 = v6 + 1;
    if (!v18)
    {
      uint64_t v19 = v6 + 2;
      if (v6 + 2 >= v11) {
        goto LABEL_45;
      }
      unint64_t v18 = *(void *)(v29 + 8 * v19);
      if (!v18)
      {
        uint64_t v19 = v6 + 3;
        if (v6 + 3 >= v11) {
          goto LABEL_45;
        }
        unint64_t v18 = *(void *)(v29 + 8 * v19);
        if (!v18)
        {
          uint64_t v19 = v6 + 4;
          if (v6 + 4 >= v11) {
            goto LABEL_45;
          }
          unint64_t v18 = *(void *)(v29 + 8 * v19);
          if (!v18)
          {
            uint64_t v19 = v6 + 5;
            if (v6 + 5 >= v11) {
              goto LABEL_45;
            }
            unint64_t v18 = *(void *)(v29 + 8 * v19);
            if (!v18)
            {
              uint64_t v20 = v6 + 6;
              while (v11 != v20)
              {
                unint64_t v18 = *(void *)(v29 + 8 * v20++);
                if (v18)
                {
                  uint64_t v19 = v20 - 1;
                  goto LABEL_34;
                }
              }
LABEL_45:
              swift_release();
              sub_2416E15A0();
              return v3;
            }
          }
        }
      }
    }
LABEL_34:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v19 << 6);
    uint64_t v6 = v19;
    goto LABEL_35;
  }
LABEL_46:
  __break(1u);
  return result;
}

void sub_2416E150C()
{
  if (!qword_26B018430)
  {
    sub_2416FA7F4(255, &qword_26B0183F0);
    sub_2416FEF34(&qword_26B0183F8, &qword_26B0183F0);
    unint64_t v0 = sub_24171FBB8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B018430);
    }
  }
}

uint64_t sub_2416E15A0()
{
  return swift_release();
}

void *sub_2416E15A8(uint64_t a1)
{
  sub_2416E26BC(0, &qword_26B0184B0, MEMORY[0x263F459B8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388]();
  v4 = (char *)v31 - v3;
  uint64_t v5 = sub_24171E4F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24171F5B8();
  os_log_type_t v10 = sub_24171F958();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v32 = v5;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v33 = a1;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v13 = swift_slowAlloc();
    v37[0] = v13;
    *(_DWORD *)uint64_t v12 = 136446210;
    v31[1] = v1;
    uint64_t v14 = sub_24171FE48();
    *(void *)&v36[0] = sub_2416E1FBC(v14, v15, v37);
    sub_24171FB18();
    uint64_t v5 = v32;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2416DE000, v9, v10, "%{public}s Creating generator pipelines", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v13, -1, -1);
    BOOL v16 = v12;
    a1 = v33;
    MEMORY[0x245623AC0](v16, -1, -1);
  }

  long long v38 = xmmword_241720600;
  int64_t v17 = (void *)sub_24171E4E8();
  if (v17)
  {

    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    v39[1] = 0;
    v39[2] = 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
    sub_2416E2804();
    sub_2416E2B94();
    uint64_t v18 = v21;
    swift_allocObject();
    uint64_t v20 = sub_24171F518();
    uint64_t v19 = sub_2416E2674(&qword_26B018BC8, (void (*)(uint64_t))sub_2416E2B94);
  }
  v39[3] = v18;
  v39[4] = v19;
  v39[0] = v20;
  sub_2416E2348(a1, (uint64_t)v4);
  uint64_t v22 = sub_24171E558();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v4, 1, v22) == 1)
  {
    sub_2416E2FEC((uint64_t)v4);
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v42 = 0;
  }
  else
  {
    *((void *)&v41 + 1) = v22;
    uint64_t v42 = MEMORY[0x263F459B0];
    unint64_t v24 = sub_2416E2980((uint64_t *)&v40);
    (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(v24, v4, v22);
  }
  sub_2416E1BC8((uint64_t)v39, (uint64_t)v37);
  sub_2416E1CC0((uint64_t)v37, (uint64_t)&v34);
  if (v35)
  {
    sub_2416E1BB0(&v34, (uint64_t)v36);
    sub_2416E1BB0(v36, (uint64_t)&v34);
    char v25 = (void *)MEMORY[0x263F8EE78];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v25 = sub_2416E1D50(0, v25[2] + 1, 1, v25);
    }
    unint64_t v27 = v25[2];
    unint64_t v26 = v25[3];
    if (v27 >= v26 >> 1) {
      char v25 = sub_2416E1D50((void *)(v26 > 1), v27 + 1, 1, v25);
    }
    v25[2] = v27 + 1;
    sub_2416E1BB0(&v34, (uint64_t)&v25[5 * v27 + 4]);
  }
  else
  {
    sub_2416E2720((uint64_t)&v34);
    char v25 = (void *)MEMORY[0x263F8EE78];
  }
  sub_2416E1BC8((uint64_t)&v40, (uint64_t)v37);
  sub_2416E1CC0((uint64_t)v37, (uint64_t)&v34);
  if (v35)
  {
    sub_2416E1BB0(&v34, (uint64_t)v36);
    sub_2416E1BB0(v36, (uint64_t)&v34);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v25 = sub_2416E1D50(0, v25[2] + 1, 1, v25);
    }
    unint64_t v29 = v25[2];
    unint64_t v28 = v25[3];
    if (v29 >= v28 >> 1) {
      char v25 = sub_2416E1D50((void *)(v28 > 1), v29 + 1, 1, v25);
    }
    v25[2] = v29 + 1;
    sub_2416E1BB0(&v34, (uint64_t)&v25[5 * v29 + 4]);
  }
  else
  {
    sub_2416E2720((uint64_t)&v34);
  }
  sub_2416E1C58(0, &qword_26B0188E0, &qword_26B0183A0, MEMORY[0x263F456E8], MEMORY[0x263F8D8F0]);
  swift_arrayDestroy();
  return v25;
}

uint64_t sub_2416E1BB0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2416E1BC8(uint64_t a1, uint64_t a2)
{
  sub_2416E1C58(0, &qword_26B0188E0, &qword_26B0183A0, MEMORY[0x263F456E8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2416E1C58(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v8 = sub_2416E22F8(255, a3);
    unint64_t v9 = a5(a1, v8);
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

uint64_t sub_2416E1CC0(uint64_t a1, uint64_t a2)
{
  sub_2416E1C58(0, &qword_26B0188E0, &qword_26B0183A0, MEMORY[0x263F456E8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_2416E1D50(void *result, int64_t a2, char a3, void *a4)
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
      sub_2416E1C58(0, &qword_26B018440, &qword_26B0183A0, MEMORY[0x263F456E8], MEMORY[0x263F8E0F8]);
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
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2416E1EA0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2416E1EA0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_2416E22F8(0, &qword_26B0183A0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24171FCA8();
  __break(1u);
  return result;
}

uint64_t sub_2416E1FBC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2416E213C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2416E20E0((uint64_t)v12, *a3);
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
      sub_2416E20E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_24171EF98();
  }
  sub_2416E2090((uint64_t)v12);
  return v7;
}

uint64_t sub_2416E2090(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2416E20E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2416E213C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24171FB28();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_241701C50(a5, a6);
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
  uint64_t v8 = sub_24171FC28();
  if (!v8)
  {
    sub_24171FC38();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24171FCA8();
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

uint64_t sub_2416E22F8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_2416E2348@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24171E4F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)sub_24171E4E8();
  uint64_t v9 = (void *)sub_24171E438();
  char v10 = sub_24171E428();

  if (v10)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    uint64_t v11 = (void *)*MEMORY[0x263F09810];
    sub_2416E1C58(0, &qword_26B018A70, &qword_26B0188E8, MEMORY[0x263F45938], MEMORY[0x263F8E0F8]);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_241721DB0;
    uint64_t v13 = type metadata accessor for WalkingSteadinessHealthChecklistFeedItemProvider();
    uint64_t v14 = swift_allocObject();
    *(void *)(v12 + 56) = v13;
    *(void *)(v12 + 64) = sub_2416E2674(&qword_26B0189E8, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessHealthChecklistFeedItemProvider);
    *(void *)(v12 + 32) = v14;
    uint64_t v15 = type metadata accessor for WalkingSteadinessNotificationSettingsFeatureStatusFeedItemProvider();
    uint64_t v16 = swift_allocObject();
    *(void *)(v12 + 96) = v15;
    *(void *)(v12 + 104) = sub_2416E2674(&qword_26B018A18, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessNotificationSettingsFeatureStatusFeedItemProvider);
    *(void *)(v12 + 72) = v16;
    uint64_t v17 = type metadata accessor for WalkingSteadinessPromotionFeedItemProvider();
    uint64_t v18 = swift_allocObject();
    *(void *)(v12 + 136) = v17;
    *(void *)(v12 + 144) = sub_2416E2674(&qword_26B018940, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessPromotionFeedItemProvider);
    *(void *)(v12 + 112) = v18;
    id v19 = v11;
    sub_24171E548();
    uint64_t v20 = sub_24171E558();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(a2, 0, 1, v20);
  }
  else
  {
    uint64_t v22 = sub_24171E558();
    uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
    return v23(a2, 1, 1, v22);
  }
}

uint64_t sub_2416E2674(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2416E26BC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2416E2720(uint64_t a1)
{
  sub_2416E1C58(0, &qword_26B0188E0, &qword_26B0183A0, MEMORY[0x263F456E8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2416E27A8()
{
  if (qword_26B0183D0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_26B018DC8;

  return sub_2416E1158(v0);
}

uint64_t sub_2416E2804()
{
  uint64_t v12 = MEMORY[0x263F8EE78];
  sub_2416E2A84(0, 2, 0);
  uint64_t v0 = v12;
  if (byte_26F593B38)
  {
    uint64_t v9 = &type metadata for WalkingSteadinessArticleDataProvider;
    unint64_t v10 = sub_2416E2EE0();
    unint64_t v1 = sub_2416E2E8C();
  }
  else
  {
    uint64_t v9 = &type metadata for ImproveWalkingSteadinessArticleDataProvider;
    unint64_t v10 = sub_2416E2DA0();
    unint64_t v1 = sub_2416E2D4C();
  }
  unint64_t v11 = v1;
  unint64_t v3 = *(void *)(v12 + 16);
  unint64_t v2 = *(void *)(v12 + 24);
  if (v3 >= v2 >> 1)
  {
    sub_2416E2A84(v2 > 1, v3 + 1, 1);
    uint64_t v0 = v12;
  }
  *(void *)(v0 + 16) = v3 + 1;
  sub_2416E2968(&v8, (_OWORD *)(v0 + 48 * v3 + 32));
  if (byte_26F593B39)
  {
    uint64_t v9 = &type metadata for WalkingSteadinessArticleDataProvider;
    unint64_t v10 = sub_2416E2EE0();
    unint64_t v4 = sub_2416E2E8C();
  }
  else
  {
    uint64_t v9 = &type metadata for ImproveWalkingSteadinessArticleDataProvider;
    unint64_t v10 = sub_2416E2DA0();
    unint64_t v4 = sub_2416E2D4C();
  }
  unint64_t v11 = v4;
  uint64_t v12 = v0;
  unint64_t v6 = *(void *)(v0 + 16);
  unint64_t v5 = *(void *)(v0 + 24);
  if (v6 >= v5 >> 1)
  {
    sub_2416E2A84(v5 > 1, v6 + 1, 1);
    uint64_t v0 = v12;
  }
  *(void *)(v0 + 16) = v6 + 1;
  sub_2416E2968(&v8, (_OWORD *)(v0 + 48 * v6 + 32));
  return v0;
}

_OWORD *sub_2416E2968(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t *sub_2416E2980(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_2416E29E4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_24171FD68();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_2416E2A2C()
{
  if (!qword_26B018448)
  {
    sub_2416E2F8C();
    unint64_t v0 = sub_24171FD68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B018448);
    }
  }
}

uint64_t sub_2416E2A84(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2416E0F70(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

void sub_2416E2AA4(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, unint64_t *a5)
{
  if (!*a2)
  {
    sub_2416FA7F4(255, a3);
    sub_2416FEF34(a5, a3);
    unint64_t v8 = sub_24171FBB8();
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_2416E2B30()
{
  unint64_t result = qword_26B018410;
  if (!qword_26B018410)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B018410);
  }
  return result;
}

void sub_2416E2B70(unint64_t a1)
{
}

void sub_2416E2B94()
{
  if (!qword_26B018BD0)
  {
    sub_24171A9C8();
    unint64_t v0 = sub_24171F528();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B018BD0);
    }
  }
}

uint64_t type metadata accessor for WalkingSteadinessNotificationSettingsFeatureStatusFeedItemProvider()
{
  return self;
}

uint64_t sub_2416E2C18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F45570];
  uint64_t v3 = sub_24171E418();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

unint64_t sub_2416E2C8C()
{
  return 0xD00000000000002DLL;
}

uint64_t type metadata accessor for WalkingSteadinessHealthChecklistFeedItemProvider()
{
  return self;
}

uint64_t sub_2416E2CCC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F32880](a1, WitnessTable);
}

unint64_t sub_2416E2D30()
{
  return 0xD00000000000001ELL;
}

unint64_t sub_2416E2D4C()
{
  unint64_t result = qword_26B018CC8;
  if (!qword_26B018CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018CC8);
  }
  return result;
}

unint64_t sub_2416E2DA0()
{
  unint64_t result = qword_26B018CC0;
  if (!qword_26B018CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018CC0);
  }
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessPromotionFeedItemProvider()
{
  return self;
}

uint64_t sub_2416E2E18(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F34878](a1, WitnessTable);
}

uint64_t sub_2416E2E7C()
{
  return sub_24171F818();
}

unint64_t sub_2416E2E8C()
{
  unint64_t result = qword_26B018D08[0];
  if (!qword_26B018D08[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B018D08);
  }
  return result;
}

unint64_t sub_2416E2EE0()
{
  unint64_t result = qword_26B018D00;
  if (!qword_26B018D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018D00);
  }
  return result;
}

uint64_t type metadata accessor for MobilityAppPluginDelegate()
{
  uint64_t result = qword_26B018D88;
  if (!qword_26B018D88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2416E2F80()
{
  return type metadata accessor for MobilityAppPluginDelegate();
}

unint64_t sub_2416E2F8C()
{
  unint64_t result = qword_26B0183C0;
  if (!qword_26B0183C0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B0183C0);
  }
  return result;
}

uint64_t sub_2416E2FEC(uint64_t a1)
{
  sub_2416E26BC(0, &qword_26B0184B0, MEMORY[0x263F459B8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2416E3078(uint64_t a1, void *a2)
{
  v93 = a2;
  uint64_t v88 = a1;
  uint64_t v97 = sub_24171E278();
  uint64_t v96 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  v95 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24171F148();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  sub_2416E6EE4(0, (unint64_t *)&qword_268D245E8, MEMORY[0x263F44068], MEMORY[0x263F8E0F8]);
  uint64_t v7 = *(void *)(sub_24171EE98() - 8);
  uint64_t v92 = *(void *)(v7 + 72);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = swift_allocObject();
  long long v102 = xmmword_241720600;
  uint64_t v94 = v9;
  *(_OWORD *)(v9 + 16) = xmmword_241720600;
  unint64_t v91 = v9 + v8;
  sub_2416E523C();
  uint64_t v90 = v10;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = v102;
  uint64_t v12 = type metadata accessor for MobilityInternalSettingsViewController.Item(0);
  long long v104 = 0u;
  long long v105 = 0u;
  *(void *)(v11 + 56) = v12;
  uint64_t v13 = v12;
  uint64_t v101 = sub_2416E51AC(&qword_268D24600, (void (*)(uint64_t))type metadata accessor for MobilityInternalSettingsViewController.Item);
  *(void *)(v11 + 64) = v101;
  uint64_t v14 = sub_2416E2980((uint64_t *)(v11 + 32));
  uint64_t v15 = v5;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v87 = v5 + 16;
  v89 = v16;
  v78 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = v4;
  v16(v78, a1, v4);
  uint64_t v80 = MEMORY[0x263F8D8F0];
  v98 = (uint64_t (*)(void))sub_2416E63CC;
  uint64_t v17 = MEMORY[0x263F8EE58] + 8;
  sub_2416E6144((uint64_t)&v104, (uint64_t)v103, (uint64_t)&qword_26B018CB8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_2416E63CC);
  uint64_t v18 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v85 = v18 | 7;
  uint64_t v19 = (v18 + 16) & ~v18;
  uint64_t v86 = v19;
  unint64_t v84 = ((v6 + v19 + 7) & 0xFFFFFFFFFFFFFFF8) + 32;
  unint64_t v83 = (v6 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = swift_allocObject();
  v82 = *(void (**)(uint64_t, char *, uint64_t))(v15 + 32);
  v82(v20 + v19, (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  sub_2416E5304((uint64_t)v103, v20 + ((v6 + v19 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v21 = *(int *)(v13 + 28);
  uint64_t v22 = v13;
  uint64_t v77 = v13;
  uint64_t v23 = (char *)v14 + v21;
  *((unsigned char *)v14 + v21) = 1;
  LODWORD(v102) = *MEMORY[0x263F440D8];
  uint64_t v24 = v102;
  uint64_t v99 = sub_24171EEE8();
  uint64_t v25 = *(void *)(v99 - 8);
  v100 = *(void (**)(void))(v25 + 104);
  uint64_t v81 = v25 + 104;
  ((void (*)(char *, uint64_t, uint64_t))v100)(v23, v24, v99);
  sub_24171F3D8();
  *uint64_t v14 = sub_24171EBC8();
  v14[1] = v26;
  v14[2] = 0xD000000000000028;
  v14[3] = 0x80000002417231C0;
  v14[4] = (uint64_t)sub_2416E5390;
  v14[5] = v20;
  uint64_t v27 = v17;
  uint64_t v28 = v17;
  uint64_t v29 = v80;
  uint64_t v30 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))v98;
  sub_2416E61B8((uint64_t)&v104, (uint64_t)&qword_26B018CB8, v28, v80, v98);
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v31 = v101;
  *(void *)(v11 + 96) = v22;
  *(void *)(v11 + 104) = v31;
  uint64_t v32 = sub_2416E2980((uint64_t *)(v11 + 72));
  uint64_t v33 = v78;
  uint64_t v34 = v79;
  v89(v78, v88, v79);
  uint64_t v35 = v27;
  sub_2416E6144((uint64_t)&v104, (uint64_t)v103, (uint64_t)&qword_26B018CB8, v27, v29, v30);
  uint64_t v36 = swift_allocObject();
  v82(v36 + v86, v33, v34);
  sub_2416E5304((uint64_t)v103, v36 + v83);
  uint64_t v37 = v77;
  *((unsigned char *)v32 + *(int *)(v77 + 28)) = 1;
  v100();
  *uint64_t v32 = sub_24171EBC8();
  v32[1] = v38;
  v32[2] = 0xD00000000000002ELL;
  v32[3] = 0x80000002417231F0;
  v32[4] = (uint64_t)sub_2416E5480;
  v32[5] = v36;
  sub_2416E61B8((uint64_t)&v104, (uint64_t)&qword_26B018CB8, v35, v29, v98);
  unint64_t v39 = v91;
  sub_24171EE78();
  v98 = (uint64_t (*)(void))(v39 + v92);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_241720610;
  uint64_t v41 = v37;
  uint64_t v42 = v101;
  *(void *)(v40 + 56) = v37;
  *(void *)(v40 + 64) = v42;
  char v43 = sub_2416E2980((uint64_t *)(v40 + 32));
  uint64_t v44 = swift_allocObject();
  uint64_t v45 = v93;
  *(void *)(v44 + 16) = v93;
  *((unsigned char *)v43 + *(int *)(v41 + 28)) = 1;
  unint64_t v46 = v100;
  v100();
  id v47 = v45;
  *char v43 = sub_24171EBC8();
  v43[1] = v48;
  v43[2] = 0xD00000000000001FLL;
  v43[3] = 0x8000000241723220;
  v43[4] = (uint64_t)sub_2416E5588;
  v43[5] = v44;
  *(void *)(v40 + 96) = v41;
  *(void *)(v40 + 104) = v42;
  v49 = sub_2416E2980((uint64_t *)(v40 + 72));
  uint64_t v50 = swift_allocObject();
  *(void *)(v50 + 16) = v47;
  *((unsigned char *)v49 + *(int *)(v41 + 28)) = 1;
  v46();
  id v51 = v47;
  uint64_t *v49 = sub_24171EBC8();
  v49[1] = v52;
  v49[2] = 0xD000000000000024;
  v49[3] = 0x8000000241723240;
  v49[4] = (uint64_t)sub_2416E55CC;
  v49[5] = v50;
  *(void *)(v40 + 136) = v41;
  *(void *)(v40 + 144) = v42;
  v53 = sub_2416E2980((uint64_t *)(v40 + 112));
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = v51;
  *((unsigned char *)v53 + *(int *)(v41 + 28)) = 1;
  v46();
  id v55 = v51;
  uint64_t *v53 = sub_24171EBC8();
  v53[1] = v56;
  v53[2] = 0xD00000000000001ELL;
  v53[3] = 0x8000000241723270;
  v53[4] = (uint64_t)sub_2416E55D8;
  v53[5] = v54;
  *(void *)(v40 + 176) = v41;
  *(void *)(v40 + 184) = v42;
  v57 = sub_2416E2980((uint64_t *)(v40 + 152));
  uint64_t v58 = swift_allocObject();
  *(void *)(v58 + 16) = v55;
  *((unsigned char *)v57 + *(int *)(v41 + 28)) = 1;
  v46();
  id v59 = v55;
  uint64_t *v57 = sub_24171EBC8();
  v57[1] = v60;
  v57[2] = 0xD000000000000023;
  v57[3] = 0x8000000241723290;
  v57[4] = (uint64_t)sub_2416E55E4;
  v57[5] = v58;
  sub_24171EE78();
  *(void *)&long long v104 = 0x3C53447961727241;
  *((void *)&v104 + 1) = 0xE800000000000000;
  v61 = v95;
  sub_24171E268();
  sub_24171E258();
  (*(void (**)(char *, uint64_t))(v96 + 8))(v61, v97);
  sub_24171F868();
  swift_bridgeObjectRelease();
  sub_24171F868();
  sub_24171EC28();
  swift_allocObject();
  sub_24171EC18();
  uint64_t v62 = sub_24171ED18();
  swift_release();
  uint64_t v63 = sub_2416E51AC(&qword_268D24608, (void (*)(uint64_t))sub_2416E55F0);
  sub_2416E5650(0, &qword_268D24618, MEMORY[0x263F8E0F8]);
  uint64_t v64 = swift_allocObject();
  long long v102 = xmmword_241720620;
  *(_OWORD *)(v64 + 16) = xmmword_241720620;
  *(void *)(v64 + 32) = v62;
  unint64_t v65 = v64 + 32;
  *(void *)(v64 + 40) = v63;
  sub_2416E5714();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v102;
  *(void *)(inited + 32) = v64;
  int64_t v67 = *(void *)(v64 + 16);
  sub_24171EF98();
  sub_24171EF98();
  v68 = sub_2416E5A80(0, v67, 1, MEMORY[0x263F8EE78]);
  v69 = v68;
  if (!*(void *)(v64 + 16))
  {
    if (!v67) {
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v70 = v68[2];
  if ((v68[3] >> 1) - v70 < v67)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v71 = (unint64_t)&v68[2 * v70 + 4];
  if (v65 < v71 + 16 * v67 && v71 < v65 + 16 * v67) {
    goto LABEL_13;
  }
  sub_2416E56C4(0, &qword_268D24620);
  swift_arrayInitWithCopy();
  if (!v67)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    sub_2416E5650(0, &qword_268D24630, MEMORY[0x263F8D488]);
    swift_arrayDestroy();
    return (uint64_t)v69;
  }
  uint64_t v72 = v69[2];
  BOOL v73 = __OFADD__(v72, v67);
  uint64_t v74 = v72 + v67;
  if (!v73)
  {
    v69[2] = v74;
    goto LABEL_9;
  }
LABEL_12:
  __break(1u);
LABEL_13:
  uint64_t result = sub_24171FCA8();
  __break(1u);
  return result;
}

uint64_t sub_2416E3CAC()
{
  uint64_t v0 = sub_24171EF48();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24171EF18();
  uint64_t v4 = sub_24171EF38();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

void sub_2416E3D80()
{
}

void sub_2416E3DDC()
{
  sub_24171F3B8();
  uint64_t v1 = (void (*)(void))sub_24171F3C8();
  v1();
  id v2 = objc_msgSend(v0, sel_collectionView);
  if (v2)
  {
    sub_24171F3D8();
    sub_24171F998();
  }
  else
  {
    __break(1u);
  }
}

id sub_2416E3E7C()
{
  id result = objc_msgSend(v0, sel_collectionView);
  if (result)
  {
    id v2 = result;
    id v3 = objc_allocWithZone(MEMORY[0x263F82540]);
    aBlock[4] = sub_2416E3FA0;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2416E4B0C;
    aBlock[3] = &unk_26F593D20;
    uint64_t v4 = _Block_copy(aBlock);
    id v5 = objc_msgSend(v3, sel_initWithSectionProvider_, v4);
    _Block_release(v4);
    swift_release();
    objc_msgSend(v2, sel_setCollectionViewLayout_, v5);

    v6.receiver = v0;
    v6.super_class = (Class)type metadata accessor for MobilityInternalSettingsViewController(0);
    return objc_msgSendSuper2(&v6, sel_viewDidLoad);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2416E3FA0()
{
  uint64_t v0 = sub_24171EF48();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v2);
  objc_super v6 = &v12[-v5];
  sub_24171EF18();
  uint64_t v7 = (void (*)(unsigned char *, void))sub_24171EF28();
  *unint64_t v8 = 0x4034000000000000;
  v7(v12, 0);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v1 + 16))(v4, v6, v0);
  uint64_t v9 = sub_24171EF38();
  uint64_t v10 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
  v10(v4, v0);
  v10(v6, v0);
  return v9;
}

void sub_2416E4110(void *a1)
{
  id v1 = a1;
  sub_2416E3E7C();
}

uint64_t sub_2416E4158(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t (*a5)(void), void *a6, void (*a7)(uint64_t))
{
  uint64_t v31 = a7;
  uint64_t v32 = a3;
  id v33 = a1;
  uint64_t v11 = sub_24171F148();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v31 - v16;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v18((char *)&v31 - v16, a2, v11);
  a4(0);
  uint64_t v19 = swift_allocObject();
  id v20 = (id)a5();
  *(void *)(v19 + 16) = v20;
  uint64_t v34 = a6;
  uint64_t v21 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(v19 + *a6, v17, v11);
  v31(v21);
  v18(v15, a2, v11);
  objc_allocWithZone((Class)sub_24171F428());
  id v22 = v20;
  uint64_t v23 = (void *)sub_24171F418();
  sub_2416E6144(v32, (uint64_t)v35, (uint64_t)&qword_26B018CB8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_2416E63CC);
  uint64_t v24 = v36;
  if (v36)
  {
    uint64_t v25 = sub_2416E6230(v35, v36);
    uint64_t v26 = *(void *)(v24 - 8);
    MEMORY[0x270FA5388](v25);
    uint64_t v28 = (char *)&v31 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v26 + 16))(v28);
    uint64_t v29 = sub_24171FD78();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v24);
    sub_2416E2090((uint64_t)v35);
  }
  else
  {
    uint64_t v29 = 0;
  }
  objc_msgSend(v33, sel_showViewController_sender_, v23, v29, v31);

  sub_24171F2D8();
  swift_setDeallocating();

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v19 + *v34, v11);
  return swift_deallocClassInstance();
}

void sub_2416E44D4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_2416E454C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24171F678();
  uint64_t v3 = MEMORY[0x263F81F20];
  a1[3] = v2;
  a1[4] = v3;
  sub_2416E2980(a1);
  sub_24171F658();
  sub_24171EF98();
  return sub_24171F668();
}

uint64_t sub_2416E45BC()
{
  sub_2416E6EE4(0, &qword_268D24720, MEMORY[0x263F81DF8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v14 - v1;
  uint64_t v3 = sub_24171F618();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24171F5D8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416E6EE4(0, &qword_268D24728, MEMORY[0x263F81E08], MEMORY[0x263F8E0F8]);
  sub_24171F628();
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_241720620;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F81DE8], v7);
  uint64_t v12 = sub_24171F5E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v2, 1, 1, v12);
  sub_24171F608();
  sub_24171F5F8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v11;
}

uint64_t sub_2416E48D4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 32))(a2);
}

uint64_t sub_2416E4900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = sub_24171EEE8();
  id v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

void sub_2416E4978()
{
}

uint64_t sub_2416E49A8()
{
  uint64_t v1 = *v0;
  sub_24171EF98();
  return v1;
}

uint64_t sub_2416E49D8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_24171EF98();
  return v1;
}

void sub_2416E4A08(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_2416E4A3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MobilityInternalSettingsViewController(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t variable initialization expression of WalkingSteadinessOnboardingViewController.coordinator()
{
  return 0;
}

uint64_t type metadata accessor for MobilityInternalSettingsViewController(uint64_t a1)
{
  return sub_2416E52C8(a1, (uint64_t *)&unk_268D24558);
}

uint64_t sub_2416E4A9C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2416E4ADC()
{
  return type metadata accessor for MobilityInternalSettingsViewController(0);
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

id sub_2416E4B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = (void *)v5(a2, a3);
  swift_release();
  sub_24171F2D8();

  return v6;
}

uint64_t sub_2416E4B88(uint64_t a1, uint64_t a2)
{
  return sub_2416E5974(a1, a2, MEMORY[0x263F07B58]);
}

void sub_2416E4BAC(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_2416E4BBC(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_2416E4BC4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_2416E4BD8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_2416E4BEC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_2416E4C00(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_2416E4C30@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_2416E4C5C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_2416E4C80(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_2416E4C94(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_2416E4CA8(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_2416E4CBC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_2416E4CD0(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_2416E4CE4(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_2416E4CF8(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_2416E4D0C()
{
  return *v0 == 0;
}

uint64_t sub_2416E4D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_2416E4D34(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_2416E4D50(uint64_t a1, id *a2)
{
  uint64_t result = sub_24171F7F8();
  *a2 = 0;
  return result;
}

uint64_t sub_2416E4DC8(uint64_t a1, id *a2)
{
  char v3 = sub_24171F808();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2416E4E48@<X0>(uint64_t *a1@<X8>)
{
  sub_24171F818();
  uint64_t v2 = sub_24171F7D8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2416E4E8C(uint64_t a1, uint64_t a2)
{
  return sub_2416E5974(a1, a2, MEMORY[0x263F8D308]);
}

BOOL sub_2416E4EA8(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2416E4EBC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_2416E6EAC(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *sub_2416E4EFC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2416E4F08()
{
  uint64_t v0 = sub_24171F818();
  uint64_t v2 = v1;
  if (v0 == sub_24171F818() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24171FD88();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2416E4F94(uint64_t a1)
{
  uint64_t v2 = sub_2416E51AC(&qword_268D246F0, type metadata accessor for HKMobilityNotificationCategory);
  uint64_t v3 = sub_2416E51AC(&qword_268D246F8, type metadata accessor for HKMobilityNotificationCategory);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

void *sub_2416E5050@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_2416E5060(uint64_t a1)
{
  uint64_t v2 = sub_2416E51AC(&qword_268D24640, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_2416E51AC(&qword_268D24648, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2416E511C()
{
  return sub_2416E51AC(&qword_268D245D0, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_2416E5164()
{
  return sub_2416E51AC(&qword_268D245D8, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_2416E51AC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2416E51F4()
{
  return sub_2416E51AC(&qword_268D245E0, type metadata accessor for OpenExternalURLOptionsKey);
}

void sub_2416E523C()
{
  if (!qword_268D245F0)
  {
    sub_2416E56C4(255, &qword_268D245F8);
    unint64_t v0 = sub_24171FD68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D245F0);
    }
  }
}

uint64_t type metadata accessor for MobilityInternalSettingsViewController.Item(uint64_t a1)
{
  return sub_2416E52C8(a1, (uint64_t *)&unk_268D24678);
}

uint64_t sub_2416E52C8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2416E5304(uint64_t a1, uint64_t a2)
{
  sub_2416E63CC(0, &qword_26B018CB8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2416E5390(void *a1)
{
  return sub_2416E54C8(a1, (void (*)(void))type metadata accessor for WalkingSteadinessDataTypeDetailDataSourceProvider, MEMORY[0x263F452A8], &OBJC_IVAR____TtC17MobilityAppPlugin49WalkingSteadinessDataTypeDetailDataSourceProvider_context, (void (*)(uint64_t))sub_2416F147C);
}

uint64_t sub_2416E53DC()
{
  uint64_t v1 = sub_24171F148();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  if (*(void *)(v0 + v5 + 24)) {
    sub_2416E2090(v0 + v5);
  }

  return MEMORY[0x270FA0238](v0, v5 + 32, v3 | 7);
}

uint64_t sub_2416E5480(void *a1)
{
  return sub_2416E54C8(a1, (void (*)(void))type metadata accessor for WalkingSteadinessEventDataTypeDetailDataSourceProvider, MEMORY[0x263F45298], &OBJC_IVAR____TtC17MobilityAppPlugin54WalkingSteadinessEventDataTypeDetailDataSourceProvider_context, (void (*)(uint64_t))sub_2416FA974);
}

uint64_t sub_2416E54C8(void *a1, void (*a2)(void), uint64_t (*a3)(void), void *a4, void (*a5)(uint64_t))
{
  uint64_t v11 = *(void *)(sub_24171F148() - 8);
  unint64_t v12 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  return sub_2416E4158(a1, v5 + v12, v5 + ((*(void *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8), a2, a3, a4, a5);
}

id sub_2416E5588()
{
  return sub_2416E5CC4(1, *(void *)(v0 + 16));
}

uint64_t sub_2416E5594()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2416E55CC()
{
  return sub_2416E5CC4(2, *(void *)(v0 + 16));
}

id sub_2416E55D8()
{
  return sub_2416E5CC4(3, *(void *)(v0 + 16));
}

id sub_2416E55E4()
{
  return sub_2416E5CC4(4, *(void *)(v0 + 16));
}

void sub_2416E55F0()
{
  if (!qword_268D24610)
  {
    sub_24171EC28();
    unint64_t v0 = sub_24171EDF8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24610);
    }
  }
}

void sub_2416E5650(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_2416E56C4(255, &qword_268D24620);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_2416E56C4(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_2416E5714()
{
  if (!qword_268D24628)
  {
    sub_2416E5650(255, &qword_268D24630, MEMORY[0x263F8D488]);
    unint64_t v0 = sub_24171FD68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24628);
    }
  }
}

uint64_t sub_2416E5788(uint64_t a1)
{
  uint64_t v2 = sub_2416E51AC(&qword_268D24700, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
  uint64_t v3 = sub_2416E51AC(&qword_268D24708, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2416E5844@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24171F7D8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2416E588C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24171F818();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2416E58B8(uint64_t a1)
{
  uint64_t v2 = sub_2416E51AC(&qword_268D24710, type metadata accessor for Key);
  uint64_t v3 = sub_2416E51AC(&qword_268D24718, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2416E5974(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24171F818();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2416E59B8()
{
  sub_24171F818();
  sub_24171F858();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2416E5A0C()
{
  sub_24171F818();
  sub_24171FDC8();
  sub_24171F858();
  uint64_t v0 = sub_24171FDE8();
  swift_bridgeObjectRelease();
  return v0;
}

void *sub_2416E5A80(void *result, int64_t a2, char a3, void *a4)
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
      sub_2416E5650(0, &qword_268D24618, MEMORY[0x263F8E0F8]);
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
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_2416E5BA8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2416E5BA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_2416E56C4(0, &qword_268D24620);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24171FCA8();
  __break(1u);
  return result;
}

id sub_2416E5CC4(uint64_t a1, uint64_t a2)
{
  sub_2416E6EE4(0, &qword_268D24638, MEMORY[0x263F44998], MEMORY[0x263F8D8F0]);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  unint64_t v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&aBlock[-1] - v7;
  id result = (id)HKMobilityNotificationCategoryForWalkingSteadinessEventValue();
  if (result)
  {
    uint64_t v10 = result;
    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A3D0]), sel_initWithFeatureIdentifier_healthStore_currentCountryCode_, *MEMORY[0x263F09818], a2, 0);
    sub_2416E6104();
    sub_24171F4F8();
    uint64_t v12 = sub_24171F4D8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 0, 1, v12);
    sub_2416E6144((uint64_t)v8, (uint64_t)v6, (uint64_t)&qword_268D24638, MEMORY[0x263F44998], MEMORY[0x263F8D8F0], (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))sub_2416E6EE4);
    sub_24171F4D8();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v12) == 1)
    {
      sub_2416E61B8((uint64_t)v6, (uint64_t)&qword_268D24638, MEMORY[0x263F44998], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_2416E6EE4);
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v15 = (void *)sub_24171F4E8();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v6, v12);
      uint64_t v14 = (uint64_t)objc_msgSend(v15, sel_areAllRequirementsSatisfied);
    }
    id v16 = objc_msgSend(self, sel_hkmobility_requestForCategory_shouldHidePregnancyContent_, v10, v14);
    id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A578]), sel_initWithHealthStore_, a2);
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2416E44D4;
    aBlock[3] = &unk_26F593CF8;
    uint64_t v18 = _Block_copy(aBlock);
    objc_msgSend(v17, sel_postNotificationWithRequest_completion_, v16, v18);
    _Block_release(v18);

    return (id)sub_2416E61B8((uint64_t)v8, (uint64_t)&qword_268D24638, MEMORY[0x263F44998], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_2416E6EE4);
  }
  return result;
}

unint64_t sub_2416E6104()
{
  unint64_t result = qword_26B018418;
  if (!qword_26B018418)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B018418);
  }
  return result;
}

uint64_t sub_2416E6144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = a6(0, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  return a2;
}

uint64_t sub_2416E61B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_2416E6218(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2416E6228()
{
  return swift_release();
}

void *sub_2416E6230(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void type metadata accessor for HKMobilityNotificationCategory(uint64_t a1)
{
}

void type metadata accessor for UNNotificationPresentationOptions(uint64_t a1)
{
}

void type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for FitnessPlusDataSource.FitnessPlusItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_2416E6324(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2416E6330(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2416E6350(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for NSDirectionalEdgeInsets(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

void sub_2416E63CC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void *sub_2416E6418(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  char v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *char v3 = *a2;
    char v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = a2[2];
    uint64_t v6 = a2[5];
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    *(void *)(a1 + 40) = v6;
    uint64_t v10 = sub_24171EEE8();
    id v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    sub_24171EF98();
    sub_24171EF98();
    swift_retain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_2416E6538(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_24171EEE8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_2416E65C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24171EEE8();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  sub_24171EF98();
  sub_24171EF98();
  swift_retain();
  v10(v7, v8, v9);
  return a1;
}

void *sub_2416E6690(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_24171EF98();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  sub_24171EF98();
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24171EEE8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

_OWORD *sub_2416E6764(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_24171EEE8();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_2416E67E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_24171EEE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_2416E6894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2416E68A8);
}

uint64_t sub_2416E68A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24171EEE8();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2416E6958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2416E696C);
}

uint64_t sub_2416E696C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24171EEE8();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2416E6A14()
{
  uint64_t result = sub_24171EEE8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2416E6ABC()
{
  return sub_2416E51AC(&qword_268D24600, (void (*)(uint64_t))type metadata accessor for MobilityInternalSettingsViewController.Item);
}

uint64_t sub_2416E6B04()
{
  return sub_2416E51AC(&qword_268D24688, type metadata accessor for Key);
}

uint64_t sub_2416E6B4C()
{
  return sub_2416E51AC(&qword_268D24690, type metadata accessor for Key);
}

uint64_t sub_2416E6B94()
{
  return sub_2416E51AC(&qword_268D24698, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

uint64_t sub_2416E6BDC()
{
  return sub_2416E51AC(&qword_268D246A0, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

uint64_t sub_2416E6C24()
{
  return sub_2416E51AC(&qword_268D246A8, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

uint64_t sub_2416E6C6C()
{
  return sub_2416E51AC(&qword_268D246B0, type metadata accessor for UNNotificationPresentationOptions);
}

uint64_t sub_2416E6CB4()
{
  return sub_2416E51AC(&qword_268D246B8, type metadata accessor for UNNotificationPresentationOptions);
}

uint64_t sub_2416E6CFC()
{
  return sub_2416E51AC(&qword_268D246C0, type metadata accessor for UNNotificationPresentationOptions);
}

uint64_t sub_2416E6D44()
{
  return sub_2416E51AC(&qword_268D246C8, type metadata accessor for UNNotificationPresentationOptions);
}

uint64_t sub_2416E6D8C()
{
  return sub_2416E51AC(&qword_268D246D0, type metadata accessor for HKMobilityNotificationCategory);
}

uint64_t sub_2416E6DD4()
{
  return sub_2416E51AC(&qword_268D246D8, type metadata accessor for HKMobilityNotificationCategory);
}

uint64_t sub_2416E6E1C()
{
  return sub_2416E51AC(&qword_268D246E0, type metadata accessor for HKMobilityNotificationCategory);
}

uint64_t sub_2416E6E64()
{
  return sub_2416E51AC(&qword_268D246E8, type metadata accessor for Key);
}

uint64_t sub_2416E6EAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  unint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

void sub_2416E6EE4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

id sub_2416E6F6C()
{
  type metadata accessor for MobilityAppPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_26B018E00 = (uint64_t)result;
  return result;
}

uint64_t sub_2416E6FC4()
{
  uint64_t v0 = sub_24171E8B8();
  sub_2416E7068(v0, qword_26B018E08);
  sub_2416E70CC(v0, (uint64_t)qword_26B018E08);
  if (qword_26B018CF8 != -1) {
    swift_once();
  }
  id v1 = (id)qword_26B018E00;
  return sub_24171E8A8();
}

uint64_t *sub_2416E7068(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2416E70CC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for WalkingSteadinessFeatureStatusActionHandler(uint64_t a1)
{
  return sub_2416E52C8(a1, (uint64_t *)&unk_26B018A98);
}

uint64_t sub_2416E7124()
{
  return swift_initClassMetadata2();
}

unint64_t sub_2416E7164(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
    case 8:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    case 6:
      unint64_t result = 0xD000000000000022;
      break;
    case 7:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_2416E725C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2416E7270()
{
  return sub_24171FDE8();
}

uint64_t sub_2416E72B8()
{
  return sub_24171FDD8();
}

uint64_t sub_2416E72E4()
{
  return sub_24171FDE8();
}

unint64_t sub_2416E7328()
{
  return sub_2416E7164(*v0);
}

uint64_t sub_2416E7330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2416EDF3C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2416E7358()
{
  return 0;
}

void sub_2416E7364(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_2416E7370(uint64_t a1)
{
  unint64_t v2 = sub_2416EE6A0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416E73AC(uint64_t a1)
{
  unint64_t v2 = sub_2416EE6A0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416E73E8(void *a1)
{
  unint64_t v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E0C0];
  sub_2416EE7A4(0, &qword_26B018C18, (uint64_t (*)(void))sub_2416EE3AC, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenRegionGatedArticleCodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v69 = *(void *)(v3 - 8);
  uint64_t v70 = v3;
  MEMORY[0x270FA5388](v3);
  v68 = (char *)&v44 - v4;
  sub_2416EE7A4(0, &qword_26B018C28, (uint64_t (*)(void))sub_2416EE400, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenKnowledgeBaseArticleCodingKeys, v2);
  uint64_t v66 = *(void *)(v5 - 8);
  uint64_t v67 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v65 = (char *)&v44 - v6;
  sub_2416EE7A4(0, &qword_26B018C30, (uint64_t (*)(void))sub_2416EE454, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToMotionAndFitnessSettingsCodingKeys, v2);
  uint64_t v63 = *(void *)(v7 - 8);
  uint64_t v64 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v62 = (char *)&v44 - v8;
  sub_2416EE7A4(0, &qword_26B018C20, (uint64_t (*)(void))sub_2416EE4A8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToHealthSettingsCodingKeys, v2);
  uint64_t v58 = *(void *)(v9 - 8);
  uint64_t v59 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v56 = (char *)&v44 - v10;
  sub_2416EE7A4(0, &qword_26B018BE8, (uint64_t (*)(void))sub_2416EE4FC, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys, v2);
  uint64_t v60 = *(void *)(v11 - 8);
  uint64_t v61 = v11;
  MEMORY[0x270FA5388](v11);
  v57 = (char *)&v44 - v12;
  sub_2416EE7A4(0, &qword_26B018BF0, (uint64_t (*)(void))sub_2416EE550, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHeightAddDataControllerCodingKeys, v2);
  uint64_t v55 = v13;
  uint64_t v54 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  v53 = (char *)&v44 - v14;
  sub_2416EE7A4(0, &qword_26B018C10, (uint64_t (*)(void))sub_2416EE5A4, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHealthDetailsCodingKeys, v2);
  uint64_t v50 = v15;
  uint64_t v49 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  unint64_t v46 = (char *)&v44 - v16;
  sub_2416EE7A4(0, &qword_26B018BF8, (uint64_t (*)(void))sub_2416EE5F8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys, v2);
  uint64_t v52 = v17;
  uint64_t v51 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v48 = (char *)&v44 - v18;
  uint64_t v71 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  uint64_t v19 = MEMORY[0x270FA5388](v71);
  uint64_t v45 = (uint64_t)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v47 = (uint64_t)&v44 - v21;
  sub_2416EE7A4(0, &qword_26B018C08, (uint64_t (*)(void))sub_2416EE64C, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentOnboardingCodingKeys, v2);
  uint64_t v23 = v22;
  uint64_t v44 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v44 - v24;
  uint64_t v26 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v44 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416EE7A4(0, &qword_26B018C00, (uint64_t (*)(void))sub_2416EE6A0, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys, v2);
  uint64_t v72 = *(void *)(v29 - 8);
  uint64_t v73 = v29;
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&v44 - v30;
  sub_2416E6230(a1, a1[3]);
  sub_2416EE6A0();
  sub_24171FE18();
  sub_2416EE80C(v74, (uint64_t)v28, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v32 = v45;
      sub_2416EBCF0((uint64_t)v28, v45, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      char v79 = 4;
      sub_2416EE4FC();
      id v33 = v57;
      uint64_t v34 = v73;
      sub_24171FD28();
      sub_2416EB9F0(&qword_26B0189C8, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      uint64_t v35 = v61;
      sub_24171FD48();
      uint64_t v36 = v60;
      goto LABEL_4;
    case 2u:
      char v75 = 0;
      sub_2416EE64C();
      uint64_t v38 = v73;
      sub_24171FD28();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v23);
      goto LABEL_13;
    case 3u:
      char v77 = 2;
      sub_2416EE5A4();
      unint64_t v39 = v46;
      uint64_t v38 = v73;
      sub_24171FD28();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v39, v50);
      goto LABEL_13;
    case 4u:
      char v78 = 3;
      sub_2416EE550();
      uint64_t v40 = v53;
      uint64_t v38 = v73;
      sub_24171FD28();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v40, v55);
      goto LABEL_13;
    case 5u:
      char v80 = 5;
      sub_2416EE4A8();
      uint64_t v41 = v56;
      uint64_t v38 = v73;
      sub_24171FD28();
      uint64_t v43 = v58;
      uint64_t v42 = v59;
      goto LABEL_12;
    case 6u:
      char v81 = 6;
      sub_2416EE454();
      uint64_t v41 = v62;
      uint64_t v38 = v73;
      sub_24171FD28();
      uint64_t v43 = v63;
      uint64_t v42 = v64;
      goto LABEL_12;
    case 7u:
      char v82 = 7;
      sub_2416EE400();
      uint64_t v41 = v65;
      uint64_t v38 = v73;
      sub_24171FD28();
      uint64_t v43 = v66;
      uint64_t v42 = v67;
      goto LABEL_12;
    case 8u:
      char v83 = 8;
      sub_2416EE3AC();
      uint64_t v41 = v68;
      uint64_t v38 = v73;
      sub_24171FD28();
      uint64_t v43 = v69;
      uint64_t v42 = v70;
LABEL_12:
      (*(void (**)(char *, uint64_t))(v43 + 8))(v41, v42);
LABEL_13:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v31, v38);
      break;
    default:
      uint64_t v32 = v47;
      sub_2416EBCF0((uint64_t)v28, v47, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      char v76 = 1;
      sub_2416EE5F8();
      id v33 = v48;
      uint64_t v34 = v73;
      sub_24171FD28();
      sub_2416EB9F0(&qword_26B0189C8, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      uint64_t v35 = v52;
      sub_24171FD48();
      uint64_t v36 = v51;
LABEL_4:
      (*(void (**)(char *, uint64_t))(v36 + 8))(v33, v35);
      sub_2416EE8D8(v32, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v31, v34);
      break;
  }
  return result;
}

uint64_t sub_2416E800C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v101 = a2;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E040];
  sub_2416EE7A4(0, &qword_268D24760, (uint64_t (*)(void))sub_2416EE3AC, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenRegionGatedArticleCodingKeys, MEMORY[0x263F8E040]);
  uint64_t v106 = v4;
  uint64_t v94 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v105 = (char *)&v74 - v5;
  sub_2416EE7A4(0, &qword_268D24768, (uint64_t (*)(void))sub_2416EE400, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenKnowledgeBaseArticleCodingKeys, v3);
  uint64_t v92 = *(void *)(v6 - 8);
  uint64_t v93 = v6;
  MEMORY[0x270FA5388](v6);
  v100 = (char *)&v74 - v7;
  sub_2416EE7A4(0, &qword_268D24770, (uint64_t (*)(void))sub_2416EE454, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToMotionAndFitnessSettingsCodingKeys, v3);
  uint64_t v90 = *(void *)(v8 - 8);
  uint64_t v91 = v8;
  MEMORY[0x270FA5388](v8);
  long long v104 = (char *)&v74 - v9;
  sub_2416EE7A4(0, &qword_268D24778, (uint64_t (*)(void))sub_2416EE4A8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToHealthSettingsCodingKeys, v3);
  uint64_t v87 = v10;
  uint64_t v86 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v98 = (char *)&v74 - v11;
  sub_2416EE7A4(0, &qword_268D24780, (uint64_t (*)(void))sub_2416EE4FC, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys, v3);
  uint64_t v89 = v12;
  uint64_t v88 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v99 = (char *)&v74 - v13;
  sub_2416EE7A4(0, &qword_268D24788, (uint64_t (*)(void))sub_2416EE550, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHeightAddDataControllerCodingKeys, v3);
  uint64_t v85 = v14;
  uint64_t v84 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v97 = (char *)&v74 - v15;
  sub_2416EE7A4(0, &qword_268D24790, (uint64_t (*)(void))sub_2416EE5A4, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHealthDetailsCodingKeys, v3);
  uint64_t v82 = v16;
  uint64_t v81 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v96 = (char *)&v74 - v17;
  sub_2416EE7A4(0, &qword_268D24798, (uint64_t (*)(void))sub_2416EE5F8, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys, v3);
  uint64_t v80 = v18;
  uint64_t v83 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  v103 = (char *)&v74 - v19;
  sub_2416EE7A4(0, &qword_268D247A0, (uint64_t (*)(void))sub_2416EE64C, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentOnboardingCodingKeys, v3);
  uint64_t v79 = v20;
  uint64_t v78 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  v95 = (char *)&v74 - v21;
  sub_2416EE7A4(0, &qword_268D247A8, (uint64_t (*)(void))sub_2416EE6A0, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys, v3);
  uint64_t v23 = v22;
  uint64_t v102 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v74 - v24;
  uint64_t v26 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v74 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v74 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v74 - v33;
  uint64_t v35 = a1[3];
  v108 = a1;
  sub_2416E6230(a1, v35);
  sub_2416EE6A0();
  v107 = v25;
  uint64_t v36 = v109;
  sub_24171FE08();
  if (v36) {
    goto LABEL_23;
  }
  uint64_t v77 = 0;
  char v75 = v32;
  char v76 = v29;
  uint64_t v37 = v103;
  uint64_t v38 = v104;
  uint64_t v40 = v105;
  uint64_t v39 = v106;
  uint64_t v109 = v26;
  uint64_t v41 = sub_24171FD18();
  if (*(void *)(v41 + 16) != 1)
  {
    uint64_t v46 = sub_24171FC18();
    swift_allocError();
    uint64_t v48 = v47;
    sub_2416EE6F4();
    *uint64_t v48 = v109;
    uint64_t v49 = v107;
    sub_24171FCE8();
    sub_24171FBF8();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v46 - 8) + 104))(v48, *MEMORY[0x263F8DCB0], v46);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v102 + 8))(v49, v23);
LABEL_23:
    uint64_t v68 = (uint64_t)v108;
    return sub_2416E2090(v68);
  }
  uint64_t v42 = v23;
  switch(*(unsigned char *)(v41 + 32))
  {
    case 1:
      uint64_t v106 = v41;
      char v111 = 1;
      sub_2416EE5F8();
      uint64_t v50 = v23;
      uint64_t v51 = v77;
      sub_24171FCD8();
      if (!v51)
      {
        type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
        sub_2416EB9F0(&qword_268D247C0, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
        uint64_t v65 = (uint64_t)v75;
        uint64_t v66 = v80;
        sub_24171FD08();
        uint64_t v67 = v102;
        (*(void (**)(char *, uint64_t))(v83 + 8))(v37, v66);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v67 + 8))(v107, v50);
        swift_storeEnumTagMultiPayload();
        uint64_t v45 = (uint64_t)v34;
        sub_2416EBCF0(v65, (uint64_t)v34, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
        uint64_t v72 = (uint64_t)v108;
        uint64_t v73 = v101;
        goto LABEL_30;
      }
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v102 + 8))(v107, v23);
      uint64_t v68 = (uint64_t)v108;
      return sub_2416E2090(v68);
    case 2:
      char v112 = 2;
      sub_2416EE5A4();
      uint64_t v52 = v96;
      uint64_t v53 = v77;
      sub_24171FCD8();
      if (v53) {
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t))(v81 + 8))(v52, v82);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v102 + 8))(v107, v23);
      uint64_t v45 = (uint64_t)v34;
      goto LABEL_28;
    case 3:
      char v113 = 3;
      sub_2416EE550();
      uint64_t v54 = v97;
      uint64_t v55 = v77;
      sub_24171FCD8();
      if (v55) {
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t))(v84 + 8))(v54, v85);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v102 + 8))(v107, v42);
      uint64_t v45 = (uint64_t)v34;
      goto LABEL_28;
    case 4:
      uint64_t v106 = v41;
      char v114 = 4;
      sub_2416EE4FC();
      uint64_t v56 = v99;
      uint64_t v57 = v77;
      sub_24171FCD8();
      if (v57)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v102 + 8))(v107, v23);
        goto LABEL_23;
      }
      type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
      sub_2416EB9F0(&qword_268D247C0, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      uint64_t v69 = (uint64_t)v76;
      uint64_t v70 = v89;
      sub_24171FD08();
      uint64_t v71 = v102;
      (*(void (**)(char *, uint64_t))(v88 + 8))(v56, v70);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v107, v23);
      swift_storeEnumTagMultiPayload();
      uint64_t v45 = (uint64_t)v34;
      sub_2416EBCF0(v69, (uint64_t)v34, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
      goto LABEL_29;
    case 5:
      char v115 = 5;
      sub_2416EE4A8();
      uint64_t v58 = v98;
      uint64_t v59 = v77;
      sub_24171FCD8();
      if (v59) {
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t))(v86 + 8))(v58, v87);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v102 + 8))(v107, v42);
      uint64_t v45 = (uint64_t)v34;
      goto LABEL_28;
    case 6:
      char v116 = 6;
      sub_2416EE454();
      uint64_t v60 = v77;
      sub_24171FCD8();
      if (v60) {
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t))(v90 + 8))(v38, v91);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v102 + 8))(v107, v23);
      uint64_t v45 = (uint64_t)v34;
      goto LABEL_28;
    case 7:
      char v117 = 7;
      sub_2416EE400();
      uint64_t v61 = v100;
      uint64_t v62 = v77;
      sub_24171FCD8();
      if (v62) {
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t))(v92 + 8))(v61, v93);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v102 + 8))(v107, v42);
      uint64_t v45 = (uint64_t)v34;
      goto LABEL_28;
    case 8:
      char v118 = 8;
      sub_2416EE3AC();
      uint64_t v63 = v77;
      sub_24171FCD8();
      if (v63) {
        goto LABEL_22;
      }
      (*(void (**)(char *, uint64_t))(v94 + 8))(v40, v39);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v102 + 8))(v107, v23);
      uint64_t v45 = (uint64_t)v34;
      goto LABEL_28;
    default:
      char v110 = 0;
      sub_2416EE64C();
      uint64_t v43 = v95;
      uint64_t v44 = v77;
      sub_24171FCD8();
      if (v44)
      {
LABEL_22:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v102 + 8))(v107, v42);
        goto LABEL_23;
      }
      (*(void (**)(char *, uint64_t))(v78 + 8))(v43, v79);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v102 + 8))(v107, v23);
      uint64_t v45 = (uint64_t)v34;
LABEL_28:
      swift_storeEnumTagMultiPayload();
LABEL_29:
      uint64_t v72 = (uint64_t)v108;
      uint64_t v73 = v101;
LABEL_30:
      sub_2416EBCF0(v45, v73, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
      uint64_t v68 = v72;
      break;
  }
  return sub_2416E2090(v68);
}

uint64_t sub_2416E9120()
{
  return 0;
}

void sub_2416E912C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2416E9138(uint64_t a1)
{
  unint64_t v2 = sub_2416EE4A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416E9174(uint64_t a1)
{
  unint64_t v2 = sub_2416EE4A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416E91B0(uint64_t a1)
{
  unint64_t v2 = sub_2416EE454();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416E91EC(uint64_t a1)
{
  unint64_t v2 = sub_2416EE454();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416E9228(uint64_t a1)
{
  unint64_t v2 = sub_2416EE400();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416E9264(uint64_t a1)
{
  unint64_t v2 = sub_2416EE400();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416E92A0(uint64_t a1)
{
  unint64_t v2 = sub_2416EE3AC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416E92DC(uint64_t a1)
{
  unint64_t v2 = sub_2416EE3AC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416E9318()
{
  return 1;
}

uint64_t sub_2416E932C(uint64_t a1)
{
  unint64_t v2 = sub_2416EE5F8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416E9368(uint64_t a1)
{
  unint64_t v2 = sub_2416EE5F8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416E93A4(uint64_t a1)
{
  unint64_t v2 = sub_2416EE5A4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416E93E0(uint64_t a1)
{
  unint64_t v2 = sub_2416EE5A4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416E941C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_2416E944C(uint64_t a1)
{
  unint64_t v2 = sub_2416EE550();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416E9488(uint64_t a1)
{
  unint64_t v2 = sub_2416EE550();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416E94C4(uint64_t a1)
{
  unint64_t v2 = sub_2416EE64C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416E9500(uint64_t a1)
{
  unint64_t v2 = sub_2416EE64C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416E953C()
{
  return sub_24171FDD8();
}

uint64_t sub_2416E9564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2416EE284(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2416E9590(uint64_t a1)
{
  unint64_t v2 = sub_2416EE4FC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416E95CC(uint64_t a1)
{
  unint64_t v2 = sub_2416EE4FC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416E9608@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2416E800C(a1, a2);
}

uint64_t sub_2416E9620(void *a1)
{
  return sub_2416E73E8(a1);
}

uint64_t sub_2416E963C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  sub_2416EBBA4(0, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v20 = (char *)&v17 - v4;
  sub_2416EE7A4(0, &qword_268D24730, (uint64_t (*)(void))sub_2416EBA58, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys, MEMORY[0x263F8E040]);
  uint64_t v6 = v5;
  uint64_t v19 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  sub_2416E6230(a1, a1[3]);
  sub_2416EBA58();
  uint64_t v13 = v21;
  sub_24171FE08();
  if (!v13)
  {
    uint64_t v14 = v19;
    sub_2416EB9F0(&qword_268D24738, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    uint64_t v15 = (uint64_t)v20;
    sub_24171FCF8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
    sub_2416EBACC(v15, (uint64_t)v11);
    sub_2416EE80C((uint64_t)v11, v18, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
  }
  sub_2416E2090((uint64_t)a1);
  return sub_2416EE8D8((uint64_t)v11, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
}

uint64_t sub_2416E9950()
{
  return sub_24171FDE8();
}

uint64_t sub_2416E9994()
{
  return sub_24171FDE8();
}

uint64_t sub_2416E99D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2416EE300(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2416E9A04(uint64_t a1)
{
  unint64_t v2 = sub_2416EBA58();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416E9A40(uint64_t a1)
{
  unint64_t v2 = sub_2416EBA58();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416E9A7C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2416E963C(a1, a2);
}

uint64_t sub_2416E9A94(void *a1)
{
  sub_2416EE7A4(0, &qword_26B018C38, (uint64_t (*)(void))sub_2416EBA58, (uint64_t)&type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v8 - v5;
  sub_2416E6230(a1, a1[3]);
  sub_2416EBA58();
  sub_24171FE18();
  type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  sub_2416EB9F0(&qword_26B018B98, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  sub_24171FD38();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_2416E9C40()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v131 = sub_24171E6E8();
  uint64_t v130 = *(void *)(v131 - 8);
  MEMORY[0x270FA5388](v131);
  v129 = (char *)&v122 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v135 = sub_24171E248();
  uint64_t v134 = *(void *)(v135 - 8);
  MEMORY[0x270FA5388](v135);
  v133 = (char *)&v122 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416EBB4C();
  uint64_t v126 = v2;
  uint64_t v125 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v124 = (char *)&v122 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v132 = (uint64_t)&v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v137 = (uint64_t)&v122 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v138 = (uint64_t)&v122 - v9;
  uint64_t v10 = sub_24171EBB8();
  MEMORY[0x270FA5388](v10 - 8);
  v128 = (char *)&v122 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = sub_24171F5C8();
  uint64_t v147 = *(void *)(v146 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v146);
  v143 = (char *)&v122 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v123 = (char *)&v122 - v15;
  MEMORY[0x270FA5388](v14);
  v139 = (char *)&v122 - v16;
  sub_2416EBBA4(0, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v142 = (uint64_t)&v122 - v18;
  uint64_t v145 = sub_24171E9D8();
  uint64_t v144 = *(void *)(v145 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v145);
  v136 = (char *)&v122 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  v141 = (char *)&v122 - v21;
  uint64_t v22 = sub_24171F218();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v127 = (char *)&v122 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v122 - v26;
  sub_2416EBBA4(0, &qword_268D24748, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
  MEMORY[0x270FA5388](v28 - 8);
  uint64_t v30 = (char *)&v122 - v29;
  uint64_t v31 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(0);
  uint64_t v32 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)&v122 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24171F328();
  sub_2416EB9F0(&qword_268D24750, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
  sub_2416EB9F0(&qword_26B018BB8, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
  sub_24171F208();
  uint64_t v35 = *(void (**)(char *, uint64_t))(v23 + 8);
  v35(v27, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31) != 1)
  {
    sub_2416EBCF0((uint64_t)v30, (uint64_t)v34, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
    sub_24171F328();
    v143 = (char *)sub_24171F1F8();
    v35(v27, v22);
    sub_24171F328();
    sub_24171F1E8();
    v35(v27, v22);
    sub_2416E6230(v152, v152[3]);
    uint64_t v44 = (void *)sub_24171F1A8();
    sub_2416E2090((uint64_t)v152);
    sub_24171F328();
    uint64_t v45 = (void *)sub_24171F1F8();
    v35(v27, v22);
    sub_24171F9A8();

    sub_24171F328();
    uint64_t v46 = v141;
    sub_24171E748();
    v35(v27, v22);
    uint64_t v47 = v142;
    sub_2416EBC70((uint64_t)v34, v142);
    uint64_t v48 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 48))(v47, 1, v48) == 1)
    {
      uint64_t v49 = v44;
      uint64_t v50 = v139;
      sub_24171F598();
      uint64_t v51 = sub_24171F5B8();
      os_log_type_t v52 = sub_24171F938();
      if (os_log_type_enabled(v51, v52))
      {
        uint64_t v53 = (uint8_t *)swift_slowAlloc();
        uint64_t v54 = swift_slowAlloc();
        uint64_t v151 = v54;
        *(_DWORD *)uint64_t v53 = 136315138;
        uint64_t v55 = sub_24171FE48();
        v150[0] = sub_2416E1FBC(v55, v56, &v151);
        sub_24171FB18();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2416DE000, v51, v52, "[%s] No tap action given (likely due to error on generation side, doing nothing", v53, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x245623AC0](v54, -1, -1);
        MEMORY[0x245623AC0](v53, -1, -1);

        (*(void (**)(char *, uint64_t))(v147 + 8))(v139, v146);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v147 + 8))(v50, v146);
      }
      (*(void (**)(char *, uint64_t))(v144 + 8))(v46, v145);
      sub_2416E2090((uint64_t)v152);
      uint64_t v57 = (uint64_t)v34;
      return sub_2416EE8D8(v57, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
    }
    v139 = v34;
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v84 = v132;
        sub_2416EBCF0(v47, v132, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
        uint64_t v85 = v137;
        sub_2416EE80C(v84, v137, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
        uint64_t v86 = v144;
        uint64_t v87 = (uint64_t)v136;
        uint64_t v88 = v46;
        uint64_t v89 = v46;
        uint64_t v90 = v145;
        (*(void (**)(char *, char *, uint64_t))(v144 + 16))(v136, v88, v145);
        id v91 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessFeatureStatusViewController(0));
        id v92 = v44;
        id v93 = sub_2416F9C10(v85, v92, v87);
        id v94 = v143;
        id v95 = objc_msgSend(v143, sel_navigationController);
        if (v95)
        {
          uint64_t v96 = v95;
          objc_msgSend(v95, sel_pushViewController_animated_, v93, 1);
        }
        else
        {
        }
        sub_2416EE8D8(v84, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
        (*(void (**)(char *, uint64_t))(v86 + 8))(v89, v90);
        goto LABEL_27;
      case 2u:
        sub_2416EBD70((uint64_t)v152, (uint64_t)&v151);
        id v97 = v44;
        sub_24171F328();
        sub_24171F1E8();
        v35(v27, v22);
        v98 = v46;
        sub_2416E6230(v150, v150[3]);
        sub_24171F1C8();
        uint64_t v99 = v127;
        sub_24171F328();
        sub_24171F1E8();
        v35(v99, v22);
        sub_2416E6230(v148, v148[3]);
        uint64_t v100 = (uint64_t)v128;
        sub_24171F1B8();
        id v101 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingViewController());
        uint64_t v102 = WalkingSteadinessOnboardingViewController.init(healthStore:healthExperienceStore:pinnedContentManager:navigateToDetailRoomUponOnboardingCompletion:presentation:)(v97, (uint64_t)&v151, (uint64_t)v149, 0, v100);
        sub_2416E2090((uint64_t)v148);
        sub_2416E2090((uint64_t)v150);
        id v103 = v143;
        objc_msgSend(v143, sel_presentViewController_animated_completion_, v102, 1, 0);

        (*(void (**)(char *, uint64_t))(v144 + 8))(v98, v145);
        goto LABEL_27;
      case 3u:
        sub_24171F328();
        id v104 = objc_allocWithZone((Class)type metadata accessor for HealthDetailsModalViewController());
        id v105 = sub_2416EB654((uint64_t)v27);
        id v106 = v143;
        objc_msgSend(v143, sel_presentViewController_animated_completion_, v105, 1, 0);

        goto LABEL_26;
      case 4u:
        uint64_t v69 = v46;
        uint64_t v70 = v44;
        id v71 = objc_msgSend(v44, sel_displayTypeController);
        if (v71)
        {
          uint64_t v72 = v71;
          id v73 = objc_msgSend(self, sel_quantityTypeForIdentifier_, *MEMORY[0x263F09E50]);
          uint64_t v74 = v144;
          uint64_t v75 = v145;
          if (v73)
          {
            char v76 = v73;
            id v77 = objc_msgSend(v72, sel_displayTypeForObjectType_, v73);

            if (v77)
            {
              id v78 = objc_msgSend(self, sel_sharedInstanceForHealthStore_, v70);
              uint64_t v79 = v133;
              sub_24171E238();
              uint64_t v80 = (void *)sub_24171E218();
              (*(void (**)(char *, uint64_t))(v134 + 8))(v79, v135);
              id v81 = objc_msgSend(v77, sel_wd_addDataViewControllerWithHealthStore_healthToolBox_initialStartDate_, v70, v78, v80);

              id v82 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F46858]), sel_initWithRootViewController_, v81);
              id v83 = v143;
              objc_msgSend(v143, sel_presentViewController_animated_completion_, v82, 1, 0);

              (*(void (**)(char *, uint64_t))(v74 + 8))(v69, v75);
LABEL_27:
              sub_2416E2090((uint64_t)v152);
              uint64_t v57 = (uint64_t)v139;
              return sub_2416EE8D8(v57, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
            }
LABEL_37:
            __break(1u);
            JUMPOUT(0x2416EB210);
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_37;
      case 5u:
        uint64_t v107 = v130;
        v108 = v129;
        uint64_t v109 = v131;
        (*(void (**)(char *, void, uint64_t))(v130 + 104))(v129, *MEMORY[0x263F43580], v131);
        sub_24171E6D8();

        (*(void (**)(char *, uint64_t))(v107 + 8))(v108, v109);
        goto LABEL_26;
      case 6u:
        sub_24171E988();
        goto LABEL_25;
      case 7u:
        sub_24171E9A8();
        goto LABEL_25;
      case 8u:
        sub_24171E998();
LABEL_25:
        sub_24171F848();

        swift_bridgeObjectRelease();
LABEL_26:
        (*(void (**)(char *, uint64_t))(v144 + 8))(v46, v145);
        goto LABEL_27;
      default:
        uint64_t v58 = v138;
        sub_2416EBCF0(v47, v138, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
        if (objc_msgSend(v44, sel_featureAvailabilityProviderForIdentifier_, *MEMORY[0x263F09810]))
        {
          uint64_t v59 = v137;
          sub_2416EE80C(v58, v137, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
          uint64_t v60 = v144;
          uint64_t v61 = (uint64_t)v136;
          (*(void (**)(char *, char *, uint64_t))(v144 + 16))(v136, v46, v145);
          id v62 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessFeatureStatusViewController(0));
          id v63 = v44;
          id v64 = sub_2416F9C10(v59, v63, v61);
          uint64_t v65 = v46;
          id v66 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F46858]), sel_initWithRootViewController_, v64);
          id v67 = v143;
          objc_msgSend(v143, sel_presentViewController_animated_completion_, v66, 1, 0);
          swift_getObjectType();
          uint64_t v68 = v124;
          sub_24171F9C8();
          *(void *)(swift_allocObject() + 16) = ObjectType;
          sub_24171FA68();

          sub_24171F2D8();
          swift_release();

          (*(void (**)(char *, uint64_t))(v125 + 8))(v68, v126);
          sub_2416EE8D8(v138, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
          (*(void (**)(char *, uint64_t))(v60 + 8))(v65, v145);
          goto LABEL_27;
        }
        char v110 = v44;
        char v111 = v123;
        sub_24171F598();
        char v112 = sub_24171F5B8();
        os_log_type_t v113 = sub_24171F948();
        if (os_log_type_enabled(v112, v113))
        {
          char v114 = (uint8_t *)swift_slowAlloc();
          uint64_t v115 = swift_slowAlloc();
          uint64_t v151 = v115;
          *(_DWORD *)char v114 = 136315138;
          uint64_t v116 = sub_24171FE48();
          v150[0] = sub_2416E1FBC(v116, v117, &v151);
          sub_24171FB18();
          char v118 = v139;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2416DE000, v112, v113, "[%s] Attempted to grab feature availability but failed, is this not the primary profile?", v114, 0xCu);
          swift_arrayDestroy();
          uint64_t v119 = v115;
          uint64_t v58 = v138;
          MEMORY[0x245623AC0](v119, -1, -1);
          MEMORY[0x245623AC0](v114, -1, -1);

          (*(void (**)(char *, uint64_t))(v147 + 8))(v111, v146);
          uint64_t v120 = v144;
          uint64_t v121 = v145;
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v147 + 8))(v111, v146);
          uint64_t v120 = v144;
          uint64_t v121 = v145;
          char v118 = v139;
        }
        sub_2416EE8D8(v58, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
        (*(void (**)(char *, uint64_t))(v120 + 8))(v46, v121);
        sub_2416E2090((uint64_t)v152);
        uint64_t v57 = (uint64_t)v118;
        return sub_2416EE8D8(v57, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
    }
  }
  sub_2416EBBF8((uint64_t)v30);
  uint64_t v36 = v143;
  sub_24171F598();
  uint64_t v37 = sub_24171F5B8();
  os_log_type_t v38 = sub_24171F948();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    v152[0] = v40;
    *(_DWORD *)uint64_t v39 = 136315138;
    uint64_t v41 = sub_24171FE48();
    uint64_t v151 = sub_2416E1FBC(v41, v42, v152);
    sub_24171FB18();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2416DE000, v37, v38, "[%s] Could not access action handler user data!", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v40, -1, -1);
    MEMORY[0x245623AC0](v39, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v147 + 8))(v36, v146);
}

uint64_t sub_2416EB234(char a1, void *a2)
{
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24171F5C8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    sub_24171F598();
    id v9 = a2;
    id v10 = a2;
    uint64_t v11 = sub_24171F5B8();
    os_log_type_t v12 = sub_24171F938();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v21 = (void *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v24[0] = v22;
      *(_DWORD *)uint64_t v13 = 136315394;
      uint64_t v14 = sub_24171FE48();
      uint64_t v23 = sub_2416E1FBC(v14, v15, v24);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2112;
      if (a2)
      {
        id v16 = a2;
        uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v23 = v17;
        sub_24171FB18();
      }
      else
      {
        uint64_t v23 = 0;
        sub_24171FB18();
        uint64_t v17 = 0;
      }
      uint64_t v18 = v21;
      *uint64_t v21 = v17;

      _os_log_impl(&dword_2416DE000, v11, v12, "[%s] Error when setting feature setting: %@", (uint8_t *)v13, 0x16u);
      sub_2416EBBA4(0, (unint64_t *)&qword_26B018A40, (void (*)(uint64_t))sub_2416EBDD4);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v18, -1, -1);
      uint64_t v19 = v22;
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v19, -1, -1);
      MEMORY[0x245623AC0](v13, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

uint64_t sub_2416EB530(uint64_t a1)
{
  uint64_t v3 = sub_24171F218();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v8 = sub_24171F338();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

id sub_2416EB630()
{
  return sub_2416EB8FC(type metadata accessor for WalkingSteadinessFeatureStatusActionHandler);
}

uint64_t sub_2416EB648()
{
  return type metadata accessor for WalkingSteadinessFeatureStatusActionHandler(0);
}

id sub_2416EB654(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_24171F1E8();
  sub_2416E6230(v13, v13[3]);
  sub_24171F1A8();
  uint64_t v4 = (void *)sub_24171F1F8();
  sub_24171F9A8();

  id v5 = objc_allocWithZone((Class)sub_24171F448());
  uint64_t v6 = (void *)sub_24171F438();
  sub_2416E2090((uint64_t)v13);
  objc_msgSend(v6, sel_setAccessType_, 3);
  v12.receiver = v2;
  v12.super_class = (Class)type metadata accessor for HealthDetailsModalViewController();
  id v7 = objc_msgSendSuper2(&v12, sel_initWithRootViewController_, v6);
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824A8]), sel_initWithBarButtonSystemItem_target_action_, 0, v7, sel_dismissPresentedViewController);
  id v9 = objc_msgSend(v6, sel_navigationItem);
  objc_msgSend(v9, sel_setLeftBarButtonItem_, v8);

  uint64_t v10 = sub_24171F218();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  return v7;
}

id sub_2416EB8E4()
{
  return sub_2416EB8FC((uint64_t (*)(void))type metadata accessor for HealthDetailsModalViewController);
}

id sub_2416EB8FC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for HealthDetailsModalViewController()
{
  return self;
}

uint64_t sub_2416EB960()
{
  return sub_2416EB9F0(&qword_26B018A90, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandler);
}

uint64_t sub_2416EB9A8()
{
  return sub_2416EB9F0(&qword_26B018BC0, MEMORY[0x263F445D8]);
}

uint64_t sub_2416EB9F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(uint64_t a1)
{
  return sub_2416E52C8(a1, (uint64_t *)&unk_26B0189F0);
}

unint64_t sub_2416EBA58()
{
  unint64_t result = qword_26B018BA0;
  if (!qword_26B018BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018BA0);
  }
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(uint64_t a1)
{
  return sub_2416E52C8(a1, (uint64_t *)&unk_26B018A08);
}

uint64_t sub_2416EBACC(uint64_t a1, uint64_t a2)
{
  sub_2416EBBA4(0, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_2416EBB4C()
{
  if (!qword_268D24740)
  {
    unint64_t v0 = sub_24171F9D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24740);
    }
  }
}

void sub_2416EBBA4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24171FB08();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_2416EBBF8(uint64_t a1)
{
  sub_2416EBBA4(0, &qword_268D24748, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2416EBC70(uint64_t a1, uint64_t a2)
{
  sub_2416EBBA4(0, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2416EBCF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2416EBD58()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2416EBD68(char a1, void *a2)
{
  return sub_2416EB234(a1, a2);
}

uint64_t sub_2416EBD70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2416EBDD4()
{
  unint64_t result = qword_26B018A38;
  if (!qword_26B018A38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B018A38);
  }
  return result;
}

uint64_t sub_2416EBE20()
{
  return 0;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.CodingKeys;
}

uint64_t *sub_2416EBE38(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v7 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
      uint64_t v8 = *(int *)(v7 + 20);
      id v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_24171E708();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      *(uint64_t *)((char *)a1 + *(int *)(v7 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 24));
      sub_24171EF98();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_2416EBFF0(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result <= 1)
  {
    uint64_t v3 = a1 + *(int *)(type metadata accessor for WalkingSteadinessHealthChecklistSettingsState() + 20);
    uint64_t v4 = sub_24171E708();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unsigned char *sub_2416EC09C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v6 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    uint64_t v7 = *(int *)(v6 + 20);
    uint64_t v8 = &a1[v7];
    id v9 = &a2[v7];
    uint64_t v10 = sub_24171E708();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    *(void *)&a1[*(int *)(v6 + 24)] = *(void *)&a2[*(int *)(v6 + 24)];
    sub_24171EF98();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

unsigned char *sub_2416EC210(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2416EE8D8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      uint64_t v6 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
      uint64_t v7 = *(int *)(v6 + 20);
      uint64_t v8 = &a1[v7];
      id v9 = &a2[v7];
      uint64_t v10 = sub_24171E708();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      *(void *)&a1[*(int *)(v6 + 24)] = *(void *)&a2[*(int *)(v6 + 24)];
      sub_24171EF98();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

unsigned char *sub_2416EC3A8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v6 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    uint64_t v7 = *(int *)(v6 + 20);
    uint64_t v8 = &a1[v7];
    id v9 = &a2[v7];
    uint64_t v10 = sub_24171E708();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
    *(void *)&a1[*(int *)(v6 + 24)] = *(void *)&a2[*(int *)(v6 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

unsigned char *sub_2416EC514(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2416EE8D8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      uint64_t v6 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
      uint64_t v7 = *(int *)(v6 + 20);
      uint64_t v8 = &a1[v7];
      id v9 = &a2[v7];
      uint64_t v10 = sub_24171E708();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      *(void *)&a1[*(int *)(v6 + 24)] = *(void *)&a2[*(int *)(v6 + 24)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_2416EC6A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_2416EC6CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2416EC6F8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2416EC708()
{
  uint64_t result = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_2416EC790(uint64_t *a1, uint64_t *a2)
{
  sub_2416EBBA4(0, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(v4 - 8);
    uint64_t v7 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() > 1)
      {
        memcpy(a1, a2, *(void *)(v8 + 64));
      }
      else
      {
        *(unsigned char *)a1 = *(unsigned char *)a2;
        uint64_t v10 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
        uint64_t v11 = *(int *)(v10 + 20);
        uint64_t v12 = (char *)a1 + v11;
        uint64_t v13 = (char *)a2 + v11;
        uint64_t v14 = sub_24171E708();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
        *(uint64_t *)((char *)a1 + *(int *)(v10 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v10 + 24));
        sub_24171EF98();
        swift_storeEnumTagMultiPayload();
      }
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_2416ECA10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t result = swift_getEnumCaseMultiPayload();
    if (result <= 1)
    {
      uint64_t v4 = a1 + *(int *)(type metadata accessor for WalkingSteadinessHealthChecklistSettingsState() + 20);
      uint64_t v5 = sub_24171E708();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

unsigned char *sub_2416ECB08(unsigned char *a1, unsigned char *a2)
{
  uint64_t v4 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_2416EBBA4(0, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }
    else
    {
      *a1 = *a2;
      uint64_t v7 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
      uint64_t v8 = *(int *)(v7 + 20);
      uint64_t v9 = &a1[v8];
      uint64_t v10 = &a2[v8];
      uint64_t v11 = sub_24171E708();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      *(void *)&a1[*(int *)(v7 + 24)] = *(void *)&a2[*(int *)(v7 + 24)];
      sub_24171EF98();
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

unsigned char *sub_2416ECD48(unsigned char *a1, unsigned char *a2)
{
  uint64_t v4 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      if (a1 == a2) {
        return a1;
      }
      sub_2416EE8D8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
      if (swift_getEnumCaseMultiPayload() <= 1)
      {
        *a1 = *a2;
        uint64_t v16 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
        uint64_t v17 = *(int *)(v16 + 20);
        uint64_t v18 = &a1[v17];
        uint64_t v19 = &a2[v17];
        uint64_t v20 = sub_24171E708();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
        *(void *)&a1[*(int *)(v16 + 24)] = *(void *)&a2[*(int *)(v16 + 24)];
        sub_24171EF98();
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      size_t v15 = *(void *)(v5 + 64);
      goto LABEL_8;
    }
    sub_2416EE8D8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
LABEL_7:
    sub_2416EBBA4(0, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    size_t v15 = *(void *)(*(void *)(v14 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v15);
    return a1;
  }
  if (v8) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(v5 + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v9 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    uint64_t v10 = *(int *)(v9 + 20);
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = sub_24171E708();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    *(void *)&a1[*(int *)(v9 + 24)] = *(void *)&a2[*(int *)(v9 + 24)];
    sub_24171EF98();
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

unsigned char *sub_2416ED10C(unsigned char *a1, unsigned char *a2)
{
  uint64_t v4 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_2416EBBA4(0, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }
    else
    {
      *a1 = *a2;
      uint64_t v7 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
      uint64_t v8 = *(int *)(v7 + 20);
      uint64_t v9 = &a1[v8];
      uint64_t v10 = &a2[v8];
      uint64_t v11 = sub_24171E708();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      *(void *)&a1[*(int *)(v7 + 24)] = *(void *)&a2[*(int *)(v7 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

unsigned char *sub_2416ED344(unsigned char *a1, unsigned char *a2)
{
  uint64_t v4 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      if (a1 == a2) {
        return a1;
      }
      sub_2416EE8D8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
      if (swift_getEnumCaseMultiPayload() <= 1)
      {
        *a1 = *a2;
        uint64_t v16 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
        uint64_t v17 = *(int *)(v16 + 20);
        uint64_t v18 = &a1[v17];
        uint64_t v19 = &a2[v17];
        uint64_t v20 = sub_24171E708();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
        *(void *)&a1[*(int *)(v16 + 24)] = *(void *)&a2[*(int *)(v16 + 24)];
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      size_t v15 = *(void *)(v5 + 64);
      goto LABEL_8;
    }
    sub_2416EE8D8((uint64_t)a1, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
LABEL_7:
    sub_2416EBBA4(0, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
    size_t v15 = *(void *)(*(void *)(v14 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v15);
    return a1;
  }
  if (v8) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(v5 + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v9 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    uint64_t v10 = *(int *)(v9 + 20);
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = sub_24171E708();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
    *(void *)&a1[*(int *)(v9 + 24)] = *(void *)&a2[*(int *)(v9 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_2416ED6F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2416ED70C);
}

uint64_t sub_2416ED70C(uint64_t a1, uint64_t a2)
{
  sub_2416EBBA4(0, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_2416ED794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2416ED7A8);
}

uint64_t sub_2416ED7A8(uint64_t a1, uint64_t a2)
{
  sub_2416EBBA4(0, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_2416ED834()
{
  sub_2416EBBA4(319, &qword_26B018A00, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_2416ED8E0()
{
  unint64_t result = qword_268D24758;
  if (!qword_268D24758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24758);
  }
  return result;
}

unint64_t sub_2416ED938()
{
  unint64_t result = qword_26B018BB0;
  if (!qword_26B018BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018BB0);
  }
  return result;
}

unint64_t sub_2416ED990()
{
  unint64_t result = qword_26B018BA8;
  if (!qword_26B018BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018BA8);
  }
  return result;
}

uint64_t sub_2416ED9E4(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  uint64_t v4 = MEMORY[0x270FA5388](v33);
  uint64_t v6 = (unsigned __int8 *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  int v8 = (unsigned __int8 *)&v32 - v7;
  uint64_t v9 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (unsigned __int8 *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (unsigned __int8 *)&v32 - v13;
  sub_2416EE874();
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (uint64_t)&v18[*(int *)(v16 + 56)];
  sub_2416EE80C(a1, (uint64_t)v18, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  sub_2416EE80C(a2, v19, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2416EE80C((uint64_t)v18, (uint64_t)v12, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_9;
      }
      sub_2416EBCF0(v19, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      if (*v12 == *v6
        && (sub_24171E6F8() & 1) != 0
        && (sub_2416FD9FC(*(void **)&v12[*(int *)(v33 + 24)], *(void **)&v6[*(int *)(v33 + 24)]) & 1) != 0)
      {
        sub_2416EE8D8((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
        uint64_t v20 = (uint64_t)v12;
        goto LABEL_30;
      }
      sub_2416EE8D8((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      uint64_t v31 = (uint64_t)v12;
      goto LABEL_32;
    case 2u:
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      uint64_t v22 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction;
      if (EnumCaseMultiPayload == 2) {
        goto LABEL_23;
      }
      goto LABEL_21;
    case 3u:
      int v23 = swift_getEnumCaseMultiPayload();
      uint64_t v22 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction;
      if (v23 == 3) {
        goto LABEL_23;
      }
      goto LABEL_21;
    case 4u:
      int v24 = swift_getEnumCaseMultiPayload();
      uint64_t v22 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction;
      if (v24 == 4) {
        goto LABEL_23;
      }
      goto LABEL_21;
    case 5u:
      int v25 = swift_getEnumCaseMultiPayload();
      uint64_t v22 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction;
      if (v25 == 5) {
        goto LABEL_23;
      }
      goto LABEL_21;
    case 6u:
      int v26 = swift_getEnumCaseMultiPayload();
      uint64_t v22 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction;
      if (v26 == 6) {
        goto LABEL_23;
      }
      goto LABEL_21;
    case 7u:
      int v27 = swift_getEnumCaseMultiPayload();
      uint64_t v22 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction;
      if (v27 != 7) {
        goto LABEL_21;
      }
      goto LABEL_23;
    case 8u:
      int v29 = swift_getEnumCaseMultiPayload();
      uint64_t v22 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction;
      if (v29 != 8) {
        goto LABEL_21;
      }
LABEL_23:
      uint64_t v28 = 1;
      break;
    default:
      sub_2416EE80C((uint64_t)v18, (uint64_t)v14, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction);
      if (swift_getEnumCaseMultiPayload())
      {
        uint64_t v12 = v14;
LABEL_9:
        sub_2416EE8D8((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
LABEL_21:
        uint64_t v28 = 0;
        uint64_t v22 = (uint64_t (*)(void))sub_2416EE874;
      }
      else
      {
        sub_2416EBCF0(v19, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
        if (*v14 == *v8
          && (sub_24171E6F8() & 1) != 0
          && (sub_2416FD9FC(*(void **)&v14[*(int *)(v33 + 24)], *(void **)&v8[*(int *)(v33 + 24)]) & 1) != 0)
        {
          sub_2416EE8D8((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
          uint64_t v20 = (uint64_t)v14;
LABEL_30:
          sub_2416EE8D8(v20, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
          uint64_t v28 = 1;
          uint64_t v22 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction;
        }
        else
        {
          sub_2416EE8D8((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
          uint64_t v31 = (uint64_t)v14;
LABEL_32:
          sub_2416EE8D8(v31, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
          uint64_t v28 = 0;
          uint64_t v22 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction;
        }
      }
      break;
  }
  sub_2416EE8D8((uint64_t)v18, v22);
  return v28;
}

uint64_t sub_2416EDF3C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x80000002417236C0 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002417236E0 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000241723700 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x8000000241723720 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000241723740 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000241723760 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000022 && a2 == 0x8000000241723780 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000002417237B0 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002417237D0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v5 = sub_24171FD88();
    swift_bridgeObjectRelease();
    if (v5) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

uint64_t sub_2416EE284(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24171FD88();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2416EE2F4()
{
  return 12383;
}

uint64_t sub_2416EE300(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6F69746341706174 && a2 == 0xE90000000000006ELL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24171FD88();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2416EE390()
{
  return 0x6F69746341706174;
}

unint64_t sub_2416EE3AC()
{
  unint64_t result = qword_26B018B38;
  if (!qword_26B018B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B38);
  }
  return result;
}

unint64_t sub_2416EE400()
{
  unint64_t result = qword_26B018B68;
  if (!qword_26B018B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B68);
  }
  return result;
}

unint64_t sub_2416EE454()
{
  unint64_t result = qword_26B018B80;
  if (!qword_26B018B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B80);
  }
  return result;
}

unint64_t sub_2416EE4A8()
{
  unint64_t result = qword_26B018B50;
  if (!qword_26B018B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B50);
  }
  return result;
}

unint64_t sub_2416EE4FC()
{
  unint64_t result = qword_26B018AA8;
  if (!qword_26B018AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018AA8);
  }
  return result;
}

unint64_t sub_2416EE550()
{
  unint64_t result = qword_26B018AC0;
  if (!qword_26B018AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018AC0);
  }
  return result;
}

unint64_t sub_2416EE5A4()
{
  unint64_t result = qword_26B018B20;
  if (!qword_26B018B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B20);
  }
  return result;
}

unint64_t sub_2416EE5F8()
{
  unint64_t result = qword_26B018AD8;
  if (!qword_26B018AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018AD8);
  }
  return result;
}

unint64_t sub_2416EE64C()
{
  unint64_t result = qword_26B018B08;
  if (!qword_26B018B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B08);
  }
  return result;
}

unint64_t sub_2416EE6A0()
{
  unint64_t result = qword_26B018AF0;
  if (!qword_26B018AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018AF0);
  }
  return result;
}

void sub_2416EE6F4()
{
  if (!qword_268D247B0)
  {
    sub_2416EE764();
    sub_24171FC08();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268D247B0);
    }
  }
}

unint64_t sub_2416EE764()
{
  unint64_t result = qword_268D247B8;
  if (!qword_268D247B8)
  {
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_268D247B8);
  }
  return result;
}

void sub_2416EE7A4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
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

uint64_t sub_2416EE80C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_2416EE874()
{
  if (!qword_268D247C8)
  {
    type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268D247C8);
    }
  }
}

uint64_t sub_2416EE8D8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *initializeBufferWithCopyOfBuffer for WalkingSteadinessHealthChecklistSettingsState.SwitchState(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x2416EEAA0);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_2416EEAC8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2416EEAD0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.CodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentOnboardingCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentOnboardingCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentFeatureSettingsCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHealthDetailsCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHealthDetailsCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHeightAddDataControllerCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PresentHeightAddDataControllerCodingKeys;
}

uint64_t _s17MobilityAppPlugin51WalkingSteadinessFeatureStatusActionHandlerUserDataV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s17MobilityAppPlugin51WalkingSteadinessFeatureStatusActionHandlerUserDataV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2416EEC14);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.PushEnabledFeatureSettingsCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToHealthSettingsCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToHealthSettingsCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToMotionAndFitnessSettingsCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.DeepLinkToMotionAndFitnessSettingsCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenKnowledgeBaseArticleCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenKnowledgeBaseArticleCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenRegionGatedArticleCodingKeys()
{
  return &type metadata for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction.OpenRegionGatedArticleCodingKeys;
}

unint64_t sub_2416EEC90()
{
  unint64_t result = qword_268D247D0;
  if (!qword_268D247D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D247D0);
  }
  return result;
}

unint64_t sub_2416EECE8()
{
  unint64_t result = qword_268D247D8;
  if (!qword_268D247D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D247D8);
  }
  return result;
}

unint64_t sub_2416EED40()
{
  unint64_t result = qword_268D247E0;
  if (!qword_268D247E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D247E0);
  }
  return result;
}

unint64_t sub_2416EED98()
{
  unint64_t result = qword_26B018B00;
  if (!qword_26B018B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B00);
  }
  return result;
}

unint64_t sub_2416EEDF0()
{
  unint64_t result = qword_26B018AF8;
  if (!qword_26B018AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018AF8);
  }
  return result;
}

unint64_t sub_2416EEE48()
{
  unint64_t result = qword_26B018B18;
  if (!qword_26B018B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B18);
  }
  return result;
}

unint64_t sub_2416EEEA0()
{
  unint64_t result = qword_26B018B10;
  if (!qword_26B018B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B10);
  }
  return result;
}

unint64_t sub_2416EEEF8()
{
  unint64_t result = qword_26B018AE8;
  if (!qword_26B018AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018AE8);
  }
  return result;
}

unint64_t sub_2416EEF50()
{
  unint64_t result = qword_26B018AE0;
  if (!qword_26B018AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018AE0);
  }
  return result;
}

unint64_t sub_2416EEFA8()
{
  unint64_t result = qword_26B018B30;
  if (!qword_26B018B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B30);
  }
  return result;
}

unint64_t sub_2416EF000()
{
  unint64_t result = qword_26B018B28;
  if (!qword_26B018B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B28);
  }
  return result;
}

unint64_t sub_2416EF058()
{
  unint64_t result = qword_26B018AD0;
  if (!qword_26B018AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018AD0);
  }
  return result;
}

unint64_t sub_2416EF0B0()
{
  unint64_t result = qword_26B018AC8;
  if (!qword_26B018AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018AC8);
  }
  return result;
}

unint64_t sub_2416EF108()
{
  unint64_t result = qword_26B018AB8;
  if (!qword_26B018AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018AB8);
  }
  return result;
}

unint64_t sub_2416EF160()
{
  unint64_t result = qword_26B018AB0;
  if (!qword_26B018AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018AB0);
  }
  return result;
}

unint64_t sub_2416EF1B8()
{
  unint64_t result = qword_26B018B60;
  if (!qword_26B018B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B60);
  }
  return result;
}

unint64_t sub_2416EF210()
{
  unint64_t result = qword_26B018B58;
  if (!qword_26B018B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B58);
  }
  return result;
}

unint64_t sub_2416EF268()
{
  unint64_t result = qword_26B018B90;
  if (!qword_26B018B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B90);
  }
  return result;
}

unint64_t sub_2416EF2C0()
{
  unint64_t result = qword_26B018B88;
  if (!qword_26B018B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B88);
  }
  return result;
}

unint64_t sub_2416EF318()
{
  unint64_t result = qword_26B018B78;
  if (!qword_26B018B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B78);
  }
  return result;
}

unint64_t sub_2416EF370()
{
  unint64_t result = qword_26B018B70;
  if (!qword_26B018B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B70);
  }
  return result;
}

unint64_t sub_2416EF3C8()
{
  unint64_t result = qword_26B018B48;
  if (!qword_26B018B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B48);
  }
  return result;
}

unint64_t sub_2416EF420()
{
  unint64_t result = qword_26B018B40;
  if (!qword_26B018B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018B40);
  }
  return result;
}

uint64_t sub_2416EF480()
{
  uint64_t v0 = sub_24171F5C8();
  sub_2416E7068(v0, qword_268D247F0);
  sub_2416E70CC(v0, (uint64_t)qword_268D247F0);
  return sub_24171F5A8();
}

uint64_t sub_2416EF54C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_24171F818();
  uint64_t v5 = v4;
  if (v3 == sub_24171F818() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v8 = sub_24171FD88();
  sub_24171EF98();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v10 = 5;
  while (1)
  {
    uint64_t v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1)) {
      break;
    }
    uint64_t v12 = sub_24171F818();
    uint64_t v14 = v13;
    if (v12 == sub_24171F818() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    char v17 = sub_24171FD88();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_7;
    }
    ++v10;
    if (v11 == v2) {
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

void sub_2416EF6A4(void *a1, void *a2)
{
  if (objc_msgSend(a1, sel_status) == (id)1)
  {
    if (qword_268D24530 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_24171F5C8();
    sub_2416E70CC(v4, (uint64_t)qword_268D247F0);
    id v5 = a2;
    id v6 = a1;
    id v20 = v5;
    id v7 = v6;
    char v8 = sub_24171F5B8();
    os_log_type_t v9 = sub_24171F958();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v21 = v11;
      *(_DWORD *)uint64_t v10 = 136446979;
      uint64_t v12 = sub_24171FE48();
      sub_2416E1FBC(v12, v13, &v21);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2082;
      sub_2416E1FBC(0xD00000000000003BLL, 0x80000002417238B0, &v21);
      sub_24171FB18();
      *(_WORD *)(v10 + 22) = 2081;
      uint64_t v14 = sub_24171F818();
      sub_2416E1FBC(v14, v15, &v21);
      sub_24171FB18();

      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 32) = 2082;
      id v16 = objc_msgSend(v7, sel_error);
      sub_2416F1354(0, &qword_268D24898, (void (*)(uint64_t))sub_2416F13A8);
      uint64_t v17 = sub_24171FAF8();
      unint64_t v19 = v18;

      sub_2416E1FBC(v17, v19, &v21);
      sub_24171FB18();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2416DE000, v8, v9, "[%{public}s.%{public}s] Unable to submit notification interaction analytics for category: %{private}s error: %{public}s", (uint8_t *)v10, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v11, -1, -1);
      MEMORY[0x245623AC0](v10, -1, -1);
    }
    else
    {
    }
  }
}

void sub_2416EF9E0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_2416EFA48(char a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = sub_24171E208();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    if (qword_268D24530 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_24171F5C8();
    sub_2416E70CC(v11, (uint64_t)qword_268D247F0);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
    uint64_t v12 = sub_24171F5B8();
    os_log_type_t v13 = sub_24171F948();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      int v24 = a3;
      uint64_t v15 = v14;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v26 = v23;
      *(_DWORD *)uint64_t v15 = 136446722;
      uint64_t v16 = sub_24171FE48();
      uint64_t v25 = sub_2416E1FBC(v16, v17, &v26);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2082;
      uint64_t v25 = sub_2416E1FBC(0xD00000000000003BLL, 0x80000002417238B0, &v26);
      sub_24171FB18();
      *(_WORD *)(v15 + 22) = 2082;
      sub_2416F12CC(&qword_268D24890, 255, MEMORY[0x263F06EA8]);
      uint64_t v18 = sub_24171FD58();
      uint64_t v25 = sub_2416E1FBC(v18, v19, &v26);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      _os_log_impl(&dword_2416DE000, v12, v13, "[%{public}s.%{public}s] Failed to navigate to: %{public}s", (uint8_t *)v15, 0x20u);
      uint64_t v20 = v23;
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v20, -1, -1);
      uint64_t v21 = v15;
      a3 = v24;
      MEMORY[0x245623AC0](v21, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
  }
  return a3(v8);
}

uint64_t sub_2416EFD88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_2416EFF48()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MobilityAppPluginAppDelegate()
{
  return self;
}

uint64_t sub_2416EFFB4(uint64_t a1, uint64_t a2)
{
  return sub_2416F12CC(&qword_26B018C78, a2, (void (*)(uint64_t))type metadata accessor for MobilityAppPluginAppDelegate);
}

id sub_2416EFFFC()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

uint64_t sub_2416F0034(uint64_t a1)
{
  if (a1 != 7) {
    return 0;
  }
  swift_unknownObjectRetain();
  return v1;
}

uint64_t sub_2416F006C(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();

  return MEMORY[0x270F34948](ObjectType, a2);
}

uint64_t sub_2416F00A8()
{
  uint64_t v0 = (void (*)(uint64_t))MEMORY[0x263F43C08];
  sub_2416F1354(0, (unint64_t *)&unk_268D24880, MEMORY[0x263F43C08]);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v25 - v2;
  uint64_t v26 = sub_24171F148();
  uint64_t v4 = *(void *)(v26 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v26);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v25 - v8;
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
  uint64_t v11 = sub_24171E528();
  id v12 = v10;
  uint64_t v13 = sub_24171E518();
  uint64_t v14 = sub_24171E3E8();
  uint64_t v15 = sub_24171E3D8();
  uint64_t v33 = v14;
  uint64_t v34 = MEMORY[0x263F45450];
  uint64_t v32 = v15;
  id v16 = v12;
  id v17 = objc_msgSend(v16, sel_profileIdentifier);
  uint64_t v18 = sub_24171EBB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v3, 1, 1, v18);
  sub_24171ECC8();

  sub_2416F10FC((uint64_t)v3, (unint64_t *)&unk_268D24880, v0);
  uint64_t v30 = v11;
  uint64_t v31 = MEMORY[0x263F45760];
  uint64_t v29 = v13;
  swift_retain();
  sub_24171F118();
  uint64_t v19 = v26;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v26);
  id v20 = objc_allocWithZone((Class)type metadata accessor for MobilityInternalSettingsViewController(0));
  uint64_t v21 = (void *)sub_24171F128();
  sub_24171EFF8();
  int v27 = v7;
  uint64_t v28 = v21;
  sub_24171EFE8();
  uint64_t v22 = sub_24171F3A8();

  uint64_t v23 = *(void (**)(char *, uint64_t))(v4 + 8);
  v23(v7, v19);

  swift_release();
  v23(v9, v19);
  return v22;
}

uint64_t sub_2416F03B8()
{
  return sub_2416E3078(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2416F03C0()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2416F03F8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_2416F040C(void *a1, uint64_t (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t ObjectType = swift_getObjectType();
  sub_2416F1354(0, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v82[-v7];
  uint64_t v9 = sub_24171E208();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  id v91 = &v82[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v90 = &v82[-v14];
  MEMORY[0x270FA5388](v13);
  id v16 = &v82[-v15];
  id v17 = objc_msgSend(a1, sel_notification);
  sub_24171F988();

  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_2416F10FC((uint64_t)v8, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8]);
    if (qword_268D24530 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_24171F5C8();
    sub_2416E70CC(v18, (uint64_t)qword_268D247F0);
    uint64_t v19 = sub_24171F5B8();
    os_log_type_t v20 = sub_24171F938();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t aBlock = v22;
      *(_DWORD *)uint64_t v21 = 136446466;
      uint64_t v23 = sub_24171FE48();
      uint64_t v102 = sub_2416E1FBC(v23, v24, &aBlock);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2082;
      uint64_t v102 = sub_2416E1FBC(0xD00000000000003BLL, 0x80000002417238B0, &aBlock);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v19, v20, "[%{public}s.%{public}s] Unable to resolve notification. No URL present.", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v22, -1, -1);
      MEMORY[0x245623AC0](v21, -1, -1);
    }

    return a2();
  }
  uint64_t v92 = v10;
  id v93 = v16;
  uint64_t v88 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32);
  uint64_t v89 = v10 + 32;
  v88(v16, v8, v9);
  id v26 = objc_msgSend(a1, sel_notification);
  id v27 = objc_msgSend(v26, sel_request);

  id v28 = objc_msgSend(v27, sel_content);
  id v29 = objc_msgSend(v28, sel_categoryIdentifier);

  if (!v29)
  {
    sub_24171F818();
    id v29 = (id)sub_24171F7D8();
    swift_bridgeObjectRelease();
  }
  id v30 = (id)HKMobilityAllWalkingSteadinessNotificationCategories();
  type metadata accessor for HKMobilityNotificationCategory(0);
  uint64_t v31 = sub_24171F8A8();

  LOBYTE(v30) = sub_2416EF54C((uint64_t)v29, v31);
  swift_bridgeObjectRelease();
  if (v30)
  {
    id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A410]), sel_init);
    id v33 = v29;
    id v34 = objc_msgSend(a1, sel_actionIdentifier);
    uint64_t v87 = (void (*)(unsigned char *, unsigned char *, uint64_t))v9;
    id v35 = v34;
    sub_24171F818();

    id v36 = objc_allocWithZone(MEMORY[0x263F452C8]);
    uint64_t v37 = (void *)sub_24171F7D8();
    uint64_t v38 = ObjectType;
    swift_bridgeObjectRelease();
    id v39 = objc_msgSend(v36, sel_initWithHealthStore_category_action_, v32, v33, v37);

    uint64_t v40 = *(void **)((char *)v94 + OBJC_IVAR____TtC17MobilityAppPlugin28MobilityAppPluginAppDelegate_analyticsManager);
    uint64_t v41 = swift_allocObject();
    *(void *)(v41 + 16) = v33;
    *(void *)(v41 + 24) = v38;
    uint64_t v100 = sub_2416F134C;
    uint64_t v101 = v41;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v97 = 1107296256;
    v98 = sub_2416EF9E0;
    uint64_t v99 = &unk_26F594280;
    unint64_t v42 = _Block_copy(&aBlock);
    id v43 = v33;
    id v44 = v39;
    uint64_t v9 = (uint64_t)v87;
    id v45 = v44;
    swift_release();
    objc_msgSend(v40, sel_submitNotificationInteractionEventWithDataSource_resultHandler_, v45, v42);
    _Block_release(v42);
  }
  id v46 = objc_msgSend(a1, sel_actionIdentifier);
  uint64_t v47 = sub_24171F818();
  uint64_t v49 = v48;

  if (v47 == sub_24171F818() && v49 == v50)
  {
    uint64_t v51 = swift_bridgeObjectRelease_n();
LABEL_15:
    ((void (*)(uint64_t))a2)(v51);

    return (*(uint64_t (**)(unsigned char *, uint64_t))(v92 + 8))(v93, v9);
  }
  char v52 = sub_24171FD88();
  swift_bridgeObjectRelease();
  uint64_t v51 = swift_bridgeObjectRelease();
  if (v52) {
    goto LABEL_15;
  }
  uint64_t v53 = v9;
  uint64_t v54 = v93;
  if (qword_268D24530 != -1) {
    swift_once();
  }
  id v94 = a3;
  uint64_t v55 = sub_24171F5C8();
  sub_2416E70CC(v55, (uint64_t)qword_268D247F0);
  uint64_t v56 = v92;
  uint64_t v57 = v90;
  uint64_t v87 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v92 + 16);
  v87(v90, v54, v9);
  uint64_t v58 = sub_24171F5B8();
  os_log_type_t v59 = sub_24171F958();
  int v60 = v59;
  BOOL v61 = os_log_type_enabled(v58, v59);
  id v85 = v29;
  uint64_t v86 = a2;
  if (v61)
  {
    uint64_t v62 = swift_slowAlloc();
    uint64_t v84 = swift_slowAlloc();
    uint64_t aBlock = v84;
    *(_DWORD *)uint64_t v62 = 136446722;
    uint64_t v63 = sub_24171FE48();
    id v64 = v58;
    uint64_t v102 = sub_2416E1FBC(v63, v65, &aBlock);
    int v83 = v60;
    sub_24171FB18();
    swift_bridgeObjectRelease();
    *(_WORD *)(v62 + 12) = 2082;
    uint64_t v102 = sub_2416E1FBC(0xD00000000000003BLL, 0x80000002417238B0, &aBlock);
    sub_24171FB18();
    *(_WORD *)(v62 + 22) = 2082;
    sub_2416F12CC(&qword_268D24890, 255, MEMORY[0x263F06EA8]);
    uint64_t v66 = sub_24171FD58();
    uint64_t v102 = sub_2416E1FBC(v66, v67, &aBlock);
    sub_24171FB18();
    swift_bridgeObjectRelease();
    uint64_t v90 = *(unsigned char **)(v92 + 8);
    ((void (*)(unsigned char *, uint64_t))v90)(v57, v9);
    _os_log_impl(&dword_2416DE000, v58, (os_log_type_t)v83, "[%{public}s.%{public}s Attempting to navigate to: %{public}s", (uint8_t *)v62, 0x20u);
    uint64_t v68 = v84;
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v68, -1, -1);
    uint64_t v69 = v62;
    uint64_t v56 = v92;
    MEMORY[0x245623AC0](v69, -1, -1);
  }
  else
  {
    uint64_t v90 = *(unsigned char **)(v56 + 8);
    ((void (*)(unsigned char *, uint64_t))v90)(v57, v9);
  }
  id v70 = objc_msgSend(self, sel_sharedApplication);
  id v71 = v93;
  uint64_t v72 = (void *)sub_24171E1E8();
  id v73 = v91;
  v87(v91, v71, v9);
  unint64_t v74 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  unint64_t v75 = (v11 + v74 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v76 = (v75 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v77 = v53;
  uint64_t v78 = swift_allocObject();
  v88((unsigned char *)(v78 + v74), v73, v77);
  uint64_t v79 = (uint64_t (**)(void))(v78 + v75);
  uint64_t v80 = v94;
  *uint64_t v79 = v86;
  v79[1] = v80;
  *(void *)(v78 + v76) = ObjectType;
  uint64_t v100 = sub_2416F1208;
  uint64_t v101 = v78;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v97 = 1107296256;
  v98 = sub_2416EFD88;
  uint64_t v99 = &unk_26F594230;
  id v81 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v70, sel_openURL_withCompletionHandler_, v72, v81);
  _Block_release(v81);

  return ((uint64_t (*)(unsigned char *, uint64_t))v90)(v71, v77);
}

uint64_t sub_2416F0F04(uint64_t (*a1)(uint64_t))
{
  swift_getObjectType();
  if (qword_268D24530 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24171F5C8();
  sub_2416E70CC(v2, (uint64_t)qword_268D247F0);
  uint64_t v3 = sub_24171F5B8();
  os_log_type_t v4 = sub_24171F958();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)uint64_t v5 = 136446466;
    uint64_t v7 = sub_24171FE48();
    sub_2416E1FBC(v7, v8, &v10);
    sub_24171FB18();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2082;
    sub_2416E1FBC(0xD00000000000003CLL, 0x8000000241723870, &v10);
    sub_24171FB18();
    _os_log_impl(&dword_2416DE000, v3, v4, "[%{public}s.%{public}s]", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v6, -1, -1);
    MEMORY[0x245623AC0](v5, -1, -1);
  }

  return a1(26);
}

uint64_t sub_2416F10EC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_2416F10FC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_2416F1354(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_2416F1158()
{
  uint64_t v1 = sub_24171E208();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2416F1208(char a1)
{
  uint64_t v3 = *(void *)(sub_24171E208() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(uint64_t (**)(void))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_2416EFA48(a1, v1 + v4, v5);
}

uint64_t sub_2416F12B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2416F12C4()
{
  return swift_release();
}

uint64_t sub_2416F12CC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_2416F1314()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2416F134C(void *a1)
{
  sub_2416EF6A4(a1, *(void **)(v1 + 16));
}

void sub_2416F1354(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_24171FB08();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_2416F13A8()
{
  unint64_t result = qword_26B018C60[0];
  if (!qword_26B018C60[0])
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_26B018C60);
  }
  return result;
}

ValueMetadata *type metadata accessor for DataTypeDetailConfiguration.ComponentIdentifier.WalkingSteadiness()
{
  return &type metadata for DataTypeDetailConfiguration.ComponentIdentifier.WalkingSteadiness;
}

uint64_t type metadata accessor for WalkingSteadinessViewController(uint64_t a1)
{
  return sub_2416E52C8(a1, (uint64_t *)&unk_268D24960);
}

uint64_t sub_2416F143C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2416F147C()
{
  uint64_t v25 = sub_24171F068();
  uint64_t v1 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24171F158();
  uint64_t v26 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(v0 + 16);
  sub_24171F078();
  id v8 = v7;
  sub_24171F0B8();
  *((void *)&v29 + 1) = &_s43WalkingSteadinessChartOrOnboardingComponentVN;
  unint64_t v30 = sub_2416F3114();
  *(void *)&long long v28 = v8;
  id v9 = v8;
  sub_24171F358();
  swift_bridgeObjectRelease();
  sub_2416F3168((uint64_t)&v28);
  sub_24171F0D8();
  unint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  sub_24171F358();
  swift_bridgeObjectRelease();
  sub_2416F3168((uint64_t)&v28);
  sub_24171F0E8();
  unint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  sub_24171F358();
  swift_bridgeObjectRelease();
  sub_2416F3168((uint64_t)&v28);
  sub_24171F0C8();
  unint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v24 = v4;
  sub_24171F358();
  swift_bridgeObjectRelease();
  sub_2416F3168((uint64_t)&v28);
  sub_24171E5A8();
  sub_24171E578();
  *((void *)&v29 + 1) = sub_24171F018();
  unint64_t v30 = MEMORY[0x263F44350];
  sub_2416E2980((uint64_t *)&v28);
  id v10 = v9;
  sub_24171F008();
  sub_24171F088();
  uint64_t v11 = v1;
  uint64_t v12 = *(void (**)(char *, void, uint64_t))(v1 + 104);
  uint64_t v13 = v3;
  uint64_t v14 = v3;
  uint64_t v15 = v25;
  v12(v14, *MEMORY[0x263F44380], v25);
  sub_24171F348();
  swift_bridgeObjectRelease();
  id v16 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v23 = v11 + 8;
  v16(v13, v15);
  uint64_t v17 = _s37WalkingSteadinessFitnessPlusComponentCMa();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v10;
  v27[3] = v17;
  v27[4] = sub_2416F3494((unint64_t *)&qword_268D24998, (void (*)(uint64_t))_s37WalkingSteadinessFitnessPlusComponentCMa);
  v27[0] = v18;
  id v19 = v10;
  swift_retain();
  sub_24171F0A8();
  v12(v13, *MEMORY[0x263F44388], v15);
  uint64_t v20 = v24;
  sub_24171F348();
  swift_bridgeObjectRelease();
  v16(v13, v15);
  sub_2416E2090((uint64_t)v27);
  uint64_t v21 = sub_24171F028();

  swift_release();
  sub_2416E2090((uint64_t)&v28);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v20);
  return v21;
}

id sub_2416F18F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_2416F35C8(a1, a2, a3);
  swift_release();

  return v8;
}

void sub_2416F1954()
{
  qword_268D24ED8 = 0x507373656E746946;
  unk_268D24EE0 = 0xEB0000000073756CLL;
}

void sub_2416F1980()
{
}

id sub_2416F19DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessViewController(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2416F1A14()
{
  return type metadata accessor for WalkingSteadinessViewController(0);
}

uint64_t sub_2416F1A1C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MobilityAppPlugin49WalkingSteadinessDataTypeDetailDataSourceProvider_context;
  uint64_t v2 = sub_24171F148();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2416F1AC4()
{
  return type metadata accessor for WalkingSteadinessDataTypeDetailDataSourceProvider(0);
}

uint64_t type metadata accessor for WalkingSteadinessDataTypeDetailDataSourceProvider(uint64_t a1)
{
  return sub_2416E52C8(a1, (uint64_t *)&unk_268D24970);
}

uint64_t sub_2416F1AEC()
{
  uint64_t result = sub_24171F148();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_2416F1B8C(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_24171F148();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = (void *)swift_allocObject();
  v8[2] = sub_2416F2044;
  v8[3] = 0;
  v8[4] = v3;
  sub_24171F188();
  sub_24171F138();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v9 = sub_24171ECD8();
  uint64_t v11 = v10;
  if (v9 == sub_24171ECD8() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v14 = sub_24171FD88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      sub_2416F2044(a1, 0xD000000000000036, 0x8000000241723A40);
      swift_release();
      return;
    }
  }
  uint64_t v15 = (void *)sub_24171F168();
  id v16 = (void *)sub_24171F7D8();
  uint64_t v17 = (void *)sub_24171F7D8();
  id v18 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v16, v17, 1);

  id v19 = (void *)sub_24171F7D8();
  id v35 = (void (*)(uint64_t))nullsub_1;
  id v36 = 0;
  id v30 = a1;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v32 = 1107296256;
  id v33 = sub_2416EF9E0;
  id v34 = &unk_26F5942F0;
  uint64_t v20 = _Block_copy(&aBlock);
  swift_release();
  uint64_t v21 = self;
  id v22 = objc_msgSend(v21, sel_actionWithTitle_style_handler_, v19, 1, v20);
  _Block_release(v20);

  uint64_t v23 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v24 = (void *)swift_allocObject();
  uint64_t v24[2] = v15;
  v24[3] = sub_2416F3214;
  v24[4] = v8;
  v24[5] = v23;
  v24[6] = sub_2416F2044;
  v24[7] = 0;
  v24[8] = v3;
  id v25 = v15;
  swift_retain();
  swift_retain();
  uint64_t v26 = (void *)sub_24171F7D8();
  id v35 = sub_2416F32C0;
  id v36 = v24;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v32 = 1107296256;
  id v33 = sub_2416EF9E0;
  id v34 = &unk_26F594368;
  id v27 = _Block_copy(&aBlock);
  swift_release();
  id v28 = objc_msgSend(v21, sel_actionWithTitle_style_handler_, v26, 2, v27);
  _Block_release(v27);
  swift_release();

  objc_msgSend(v18, sel_addAction_, v28);
  objc_msgSend(v18, sel_addAction_, v22);
  objc_msgSend(v30, sel_presentViewController_animated_completion_, v18, 1, 0);
  swift_release();
}

uint64_t sub_2416F2044(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24171F738();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_24171F768();
  uint64_t v10 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416F3408();
  uint64_t v13 = (void *)sub_24171FA08();
  char v14 = (void *)swift_allocObject();
  v14[2] = a2;
  v14[3] = a3;
  v14[4] = a1;
  aBlock[4] = sub_2416F3488;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2416F9734;
  aBlock[3] = &unk_26F594458;
  uint64_t v15 = _Block_copy(aBlock);
  sub_24171EF98();
  id v16 = a1;
  swift_release();
  sub_24171F758();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2416F3494((unint64_t *)&qword_26B018CD0, MEMORY[0x263F8F030]);
  sub_2416F34DC(0, &qword_26B018CD8, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_2416F3540();
  sub_24171FB48();
  MEMORY[0x2456230B0](0, v12, v9, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v19);
}

void sub_2416F2330(uint64_t a1, uint64_t a2, void *a3)
{
  sub_24171EF98();
  uint64_t v4 = (void *)sub_24171F7D8();
  uint64_t v5 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v4, v5, 1);

  uint64_t v7 = (void *)sub_24171F7D8();
  v10[4] = nullsub_1;
  v10[5] = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_2416EF9E0;
  v10[3] = &unk_26F594480;
  uint64_t v8 = _Block_copy(v10);
  swift_release();
  id v9 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v7, 0, v8);
  _Block_release(v8);

  objc_msgSend(v6, sel_addAction_, v9);
  objc_msgSend(a3, sel_presentViewController_animated_completion_, v6, 1, 0);
}

void sub_2416F24D8(void *a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5)
{
  uint64_t v41 = a4;
  unint64_t v42 = a3;
  id v43 = a1;
  uint64_t v7 = sub_24171F5C8();
  uint64_t v8 = *(void **)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v37 - v12;
  uint64_t v45 = 0;
  unint64_t v46 = 0xE000000000000000;
  sub_24171FBC8();
  sub_24171F868();
  uint64_t v44 = a2;
  sub_2416F33B0(0, &qword_268D24898, qword_26B018C60);
  sub_24171FAF8();
  sub_24171F868();
  swift_bridgeObjectRelease();
  uint64_t v14 = v45;
  unint64_t v15 = v46;
  sub_24171F568();
  swift_bridgeObjectRetain_n();
  id v16 = sub_24171F5B8();
  os_log_type_t v17 = sub_24171F938();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v40 = a5;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v38 = v11;
    uint64_t v20 = v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v37 = v14;
    uint64_t v22 = v21;
    uint64_t v45 = v21;
    *(_DWORD *)uint64_t v20 = 136446466;
    uint64_t v23 = sub_24171FE48();
    uint64_t v39 = v7;
    uint64_t v44 = sub_2416E1FBC(v23, v24, &v45);
    sub_24171FB18();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    sub_24171EF98();
    uint64_t v44 = sub_2416E1FBC(v37, v15, &v45);
    uint64_t v7 = v39;
    sub_24171FB18();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2416DE000, v16, v17, "[%{public}s]: %{public}s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v22, -1, -1);
    uint64_t v25 = v20;
    uint64_t v11 = v38;
    MEMORY[0x245623AC0](v25, -1, -1);

    uint64_t v26 = (void (*)(char *, uint64_t))v8[1];
    v26(v13, v7);
    id v27 = v43;
    if (v43)
    {
LABEL_3:
      id v28 = v27;
      v42();
      swift_bridgeObjectRelease();

      return;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v26 = (void (*)(char *, uint64_t))v8[1];
    v26(v13, v7);
    id v27 = v43;
    if (v43) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  sub_24171F568();
  uint64_t v29 = sub_24171F5B8();
  os_log_type_t v30 = sub_24171F938();
  if (os_log_type_enabled(v29, v30))
  {
    id v43 = v8;
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = v11;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v45 = v33;
    *(_DWORD *)uint64_t v31 = 136315138;
    uint64_t v34 = sub_24171FE48();
    uint64_t v44 = sub_2416E1FBC(v34, v35, &v45);
    sub_24171FB18();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2416DE000, v29, v30, "%s: view controller found nil", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v33, -1, -1);
    MEMORY[0x245623AC0](v31, -1, -1);

    id v36 = v32;
  }
  else
  {

    id v36 = v11;
  }
  v26(v36, v7);
}

void sub_2416F2988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A3B8]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x263F09810], a2);
  unint64_t v15 = (void *)*MEMORY[0x263F09830];
  id v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = v14;
  v16[6] = a6;
  v16[7] = a7;
  v16[8] = a8;
  v20[4] = sub_2416F3324;
  v20[5] = v16;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 1107296256;
  v20[2] = sub_2416E44D4;
  v20[3] = &unk_26F5943B8;
  os_log_type_t v17 = _Block_copy(v20);
  id v18 = v15;
  swift_retain();
  swift_retain();
  id v19 = v14;
  swift_retain();
  swift_release();
  objc_msgSend(v19, sel_removeFeatureSettingValueForKey_completion_, v18, v17);
  _Block_release(v17);
}

void sub_2416F2B00(char a1, uint64_t a2, void (*a3)(void *, uint64_t), uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    unint64_t v15 = (void *)swift_allocObject();
    v15[2] = a3;
    v15[3] = a4;
    v15[4] = a5;
    v15[5] = a7;
    v15[6] = a8;
    v15[7] = a9;
    v19[4] = sub_2416F33A0;
    v19[5] = v15;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 1107296256;
    v19[2] = sub_2416E44D4;
    v19[3] = &unk_26F594408;
    id v16 = _Block_copy(v19);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(a6, sel_resetOnboardingWithCompletion_, v16);
    _Block_release(v16);
  }
  else
  {
    swift_beginAccess();
    id v18 = (void *)MEMORY[0x245623B40](a5 + 16);
    a3(v18, a2);
  }
}

void sub_2416F2C5C(char a1, uint64_t a2, void (*a3)(void *, uint64_t), uint64_t a4, uint64_t a5, void (*a6)(uint64_t, unint64_t, unint64_t), uint64_t a7, uint64_t a8)
{
  uint64_t v14 = sub_24171F5C8();
  uint64_t v44 = *(void *)(v14 - 8);
  uint64_t v45 = v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  os_log_type_t v17 = (char *)v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v19 = (char *)v42 - v18;
  uint64_t v20 = a5 + 16;
  if (a1)
  {
    id v43 = a6;
    sub_24171F568();
    uint64_t v21 = sub_24171F5B8();
    os_log_type_t v22 = sub_24171F958();
    BOOL v23 = os_log_type_enabled(v21, v22);
    v42[1] = a8;
    if (v23)
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      v48[0] = v25;
      *(_DWORD *)uint64_t v24 = 136446466;
      v42[0] = v17;
      uint64_t v26 = sub_24171FE48();
      uint64_t v47 = sub_2416E1FBC(v26, v27, v48);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2082;
      uint64_t v47 = sub_2416E1FBC(0xD000000000000032, 0x8000000241723AF0, v48);
      uint64_t v28 = v44;
      os_log_type_t v17 = (char *)v42[0];
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v21, v22, "[%{public}s]: %{public}s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v25, -1, -1);
      MEMORY[0x245623AC0](v24, -1, -1);

      uint64_t v29 = *(void (**)(char *, uint64_t))(v28 + 8);
    }
    else
    {

      uint64_t v29 = *(void (**)(char *, uint64_t))(v44 + 8);
    }
    v29(v19, v45);
    os_log_type_t v30 = v43;
    swift_beginAccess();
    uint64_t v32 = MEMORY[0x245623B40](v20);
    if (v32)
    {
      uint64_t v33 = (void *)v32;
      v30(v32, 0xD000000000000032, 0x8000000241723AF0);
    }
    else
    {
      sub_24171F568();
      uint64_t v34 = sub_24171F5B8();
      os_log_type_t v35 = sub_24171F938();
      if (os_log_type_enabled(v34, v35))
      {
        id v36 = (uint8_t *)swift_slowAlloc();
        uint64_t v37 = v17;
        uint64_t v38 = swift_slowAlloc();
        uint64_t v47 = v38;
        *(_DWORD *)id v36 = 136315138;
        uint64_t v39 = sub_24171FE48();
        uint64_t v46 = sub_2416E1FBC(v39, v40, &v47);
        sub_24171FB18();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2416DE000, v34, v35, "%s: view controller found nil", v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x245623AC0](v38, -1, -1);
        MEMORY[0x245623AC0](v36, -1, -1);

        uint64_t v41 = v37;
      }
      else
      {

        uint64_t v41 = v17;
      }
      v29(v41, v45);
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t v31 = (void *)MEMORY[0x245623B40](v20);
    a3(v31, a2);
  }
}

uint64_t sub_2416F30BC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WalkingSteadinessDataTypeDetailDebugActionProviding()
{
  return self;
}

void sub_2416F30F0(void *a1)
{
}

unint64_t sub_2416F3114()
{
  unint64_t result = qword_268D24980;
  if (!qword_268D24980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24980);
  }
  return result;
}

uint64_t sub_2416F3168(uint64_t a1)
{
  sub_2416F33B0(0, &qword_268D24988, &qword_268D24990);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2416F31DC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2416F3214(void *a1, uint64_t a2)
{
  sub_2416F24D8(a1, a2, *(void (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_2416F3220(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2416F3230()
{
  return swift_release();
}

uint64_t sub_2416F3238()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2416F3270()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_2416F32C0(uint64_t a1)
{
  sub_2416F2988(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8]);
}

uint64_t sub_2416F32D4()
{
  swift_release();
  swift_release();

  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

void sub_2416F3324(char a1, uint64_t a2)
{
  sub_2416F2B00(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void **)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64));
}

uint64_t sub_2416F3358()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_2416F33A0(char a1, uint64_t a2)
{
  sub_2416F2C5C(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void (**)(uint64_t, unint64_t, unint64_t))(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

void sub_2416F33B0(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_2416E22F8(255, a3);
    unint64_t v4 = sub_24171FB08();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_2416F3408()
{
  unint64_t result = qword_26B018CF0;
  if (!qword_26B018CF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B018CF0);
  }
  return result;
}

uint64_t sub_2416F3448()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2416F3488()
{
  sub_2416F2330(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_2416F3494(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2416F34DC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_2416F3540()
{
  unint64_t result = qword_26B018CE0;
  if (!qword_26B018CE0)
  {
    sub_2416F34DC(255, &qword_26B018CD8, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018CE0);
  }
  return result;
}

id sub_2416F35C8(uint64_t a1, uint64_t a2, void *a3)
{
  sub_2416F34DC(0, &qword_268D249A0, MEMORY[0x263F44790], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v16[-v6];
  uint64_t v8 = sub_24171F148();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16))(&v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], a2, v8);
  swift_retain();
  id v11 = a3;
  id v12 = (id)sub_24171F418();
  uint64_t v13 = (void *)sub_24171F128();
  sub_24171F818();
  os_log_type_t v17 = &type metadata for ImproveWalkingSteadinessArticleDataProvider;
  unint64_t v18 = sub_2416E2DA0();
  unint64_t v19 = sub_2416E2D4C();
  sub_24171F3E8();
  swift_bridgeObjectRelease();
  sub_2416E2090((uint64_t)v16);
  uint64_t v14 = sub_24171F3F8();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v7, 0, 1, v14);
  sub_24171F408();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a2, v8);
  return v12;
}

uint64_t sub_2416F3840(void *a1, uint64_t a2)
{
  uint64_t v58 = a2;
  uint64_t v3 = (void *)sub_24171F5C8();
  uint64_t v56 = *(v3 - 1);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v55 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v53 - v6;
  uint64_t v8 = sub_24171F158();
  uint64_t v54 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24171F148();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v57 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v53 - v15;
  id v59 = a1;
  id v17 = objc_msgSend(a1, sel_identifier);
  uint64_t v18 = sub_24171F818();
  uint64_t v20 = v19;

  if (v18 == 0xD000000000000033 && v20 == 0x8000000241723BD0 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    os_log_type_t v22 = v16;
    BOOL v23 = v16;
    uint64_t v24 = v58;
    v21(v23, v58, v11);
    type metadata accessor for WalkingSteadinessEventDataTypeDetailDataSourceProvider();
    uint64_t v25 = swift_allocObject();
    id v26 = (id)HKMobilityWalkingSteadinessEventType();
    *(void *)(v25 + 16) = v26;
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v25 + OBJC_IVAR____TtC17MobilityAppPlugin54WalkingSteadinessEventDataTypeDetailDataSourceProvider_context, v22, v11);
    sub_2416FA974();
    v21(v57, v24, v11);
    id v27 = objc_allocWithZone((Class)sub_24171F428());
    id v28 = v59;
    uint64_t v29 = sub_24171F418();

    swift_setDeallocating();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v25 + OBJC_IVAR____TtC17MobilityAppPlugin54WalkingSteadinessEventDataTypeDetailDataSourceProvider_context, v11);
LABEL_5:
    swift_deallocClassInstance();
    return v29;
  }
  if (v18 == 0xD00000000000002ELL && v20 == 0x8000000241723C10)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    uint64_t v32 = v12;
    uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    uint64_t v34 = v58;
    v33(v16, v58, v11);
    type metadata accessor for WalkingSteadinessDataTypeDetailDataSourceProvider(0);
    uint64_t v35 = swift_allocObject();
    id v36 = (id)HKMobilityWalkingSteadinessType();
    *(void *)(v35 + 16) = v36;
    (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v35 + OBJC_IVAR____TtC17MobilityAppPlugin49WalkingSteadinessDataTypeDetailDataSourceProvider_context, v16, v11);
    uint64_t v37 = sub_2416F147C();
    uint64_t v38 = (uint64_t)v57;
    v33(v57, v34, v11);
    id v39 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessViewController(0));
    id v40 = v59;
    uint64_t v29 = (uint64_t)sub_2416F35C8(v37, v38, v40);

    swift_release();
    swift_setDeallocating();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v35 + OBJC_IVAR____TtC17MobilityAppPlugin49WalkingSteadinessDataTypeDetailDataSourceProvider_context, v11);
    goto LABEL_5;
  }
  char v31 = sub_24171FD88();
  swift_bridgeObjectRelease();
  if (v31) {
    goto LABEL_11;
  }
  uint64_t v64 = 0;
  memset(v63, 0, sizeof(v63));
  sub_2416F4180((uint64_t)v63, (uint64_t)&v60);
  if (v61)
  {
    sub_2416E1BB0(&v60, (uint64_t)v62);
    sub_2416E6230(v62, v62[3]);
    sub_24171F318();
    uint64_t v50 = v58;
    sub_24171F028();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, v50, v11);
    id v51 = objc_allocWithZone((Class)sub_24171F198());
    id v52 = v59;
    uint64_t v29 = sub_24171F178();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v10, v8);
    sub_2416F424C((uint64_t)v63);
    sub_2416E2090((uint64_t)v62);
  }
  else
  {
    sub_2416F424C((uint64_t)&v60);
    sub_24171F578();
    id v41 = v59;
    unint64_t v42 = v7;
    id v43 = sub_24171F5B8();
    os_log_type_t v44 = sub_24171F938();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = swift_slowAlloc();
      id v59 = v3;
      uint64_t v46 = (uint8_t *)v45;
      uint64_t v47 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 138412290;
      v62[0] = v41;
      id v48 = v41;
      sub_24171FB18();
      *uint64_t v47 = v41;

      _os_log_impl(&dword_2416DE000, v43, v44, "[MobilityAppPluginAppDelegate] No custom detail view controller or configuration provided for %@", v46, 0xCu);
      sub_2416F42A8();
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v47, -1, -1);
      uint64_t v49 = v46;
      uint64_t v3 = v59;
      MEMORY[0x245623AC0](v49, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, void *))(v56 + 8))(v42, v3);
    sub_2416F424C((uint64_t)v63);
    return 0;
  }
  return v29;
}

uint64_t sub_2416F4180(uint64_t a1, uint64_t a2)
{
  sub_2416F41E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2416F41E4()
{
  if (!qword_268D249A8)
  {
    sub_2416E22F8(255, &qword_268D249B0);
    unint64_t v0 = sub_24171FB08();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D249A8);
    }
  }
}

uint64_t sub_2416F424C(uint64_t a1)
{
  sub_2416F41E4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2416F42A8()
{
  if (!qword_26B018A40)
  {
    sub_2416EBDD4();
    unint64_t v0 = sub_24171FB08();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B018A40);
    }
  }
}

unint64_t sub_2416F4300()
{
  unint64_t v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2416F7824(0, &qword_268D249B8, MEMORY[0x263F42AE8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v1 - 8);
  v325 = (char *)&v296 - v2;
  sub_2416F7824(0, &qword_26B018CA8, MEMORY[0x263F07690], v0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v296 - v4;
  uint64_t v6 = sub_24171E5C8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v332 = (char *)&v296 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v324 = (char *)&v296 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v331 = (char *)&v296 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)((char *)&v296 - v14);
  uint64_t v16 = sub_24171E288();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, void (**)(void, void)))(v17 + 56);
  v334 = (void (**)(void, void))v16;
  v328 = v18;
  uint64_t v326 = v17 + 56;
  ((void (*)(char *, uint64_t, uint64_t))v18)(v5, 1, 1);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_24171E8B8();
  v329 = (void (**)(uint64_t, void, uint64_t, uint64_t))sub_2416E70CC(v19, (uint64_t)qword_26B018E08);
  uint64_t v20 = sub_24171E9B8();
  uint64_t v22 = v21;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, MEMORY[0x263F07690]);
  *uint64_t v15 = v20;
  v15[1] = v22;
  sub_2416F75C8(0, (unint64_t *)&qword_26B018450, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_241721DB0;
  *(void *)(v23 + 32) = 0x656C6369747241;
  *(void *)(v23 + 40) = 0xE700000000000000;
  *(void *)(v23 + 48) = 0xD000000000000011;
  *(void *)(v23 + 56) = 0x8000000241723C40;
  strcpy((char *)(v23 + 64), "PDF_LINK_TEXT");
  *(_WORD *)(v23 + 78) = -4864;
  uint64_t v24 = (void *)sub_24171F898();
  swift_bridgeObjectRelease();
  id v25 = (id)HKUIJoinStringsForAutomationIdentifier();

  if (v25)
  {
    uint64_t v26 = sub_24171F818();
    uint64_t v28 = v27;
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v28 = 0;
  }
  sub_2416F6850();
  os_log_type_t v30 = (uint64_t (**)(void *))((char *)v15 + *(int *)(v29 + 64));
  v15[2] = v26;
  v15[3] = v28;
  *os_log_type_t v30 = sub_2416F68F8;
  v30[1] = 0;
  uint64_t v31 = *MEMORY[0x263F42A68];
  uint64_t v32 = sub_24171E5B8();
  (*(void (**)(uint64_t (**)(void *), uint64_t, uint64_t))(*(void *)(v32 - 8) + 104))(v30, v31, v32);
  uint64_t v33 = *(void (**)(void))(v7 + 104);
  ((void (*)(uint64_t *, void, uint64_t))v33)(v15, *MEMORY[0x263F42A60], v6);
  uint64_t v34 = v7 + 104;
  sub_2416F7824(0, &qword_268D249D0, MEMORY[0x263F42AE8], MEMORY[0x263F8E0F8]);
  uint64_t v335 = v7;
  unint64_t v35 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v36 = *(void *)(v7 + 72);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_241721DC0;
  uint64_t v304 = v37;
  unint64_t v323 = v35;
  unint64_t v38 = v37 + v35;
  *(void *)unint64_t v38 = sub_2416F7360();
  *(unsigned char *)(v38 + 8) = 0;
  uint64_t v39 = *MEMORY[0x263F42AB8];
  unint64_t v327 = v38;
  ((void (*)(unint64_t, uint64_t, uint64_t))v33)(v38, v39, v6);
  id v40 = (void (*)(uint64_t *, uint64_t, uint64_t))v33;
  id v41 = (uint64_t *)(v38 + v36);
  unint64_t v42 = v328;
  v328(v5, 1, 1, v334);
  uint64_t v43 = sub_24171E9B8();
  v306 = v15;
  uint64_t v45 = v44;
  v322 = (uint64_t (*)(uint64_t))MEMORY[0x263F07690];
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, MEMORY[0x263F07690]);
  *id v41 = v43;
  v41[1] = v45;
  uint64_t v46 = *MEMORY[0x263F42AC0];
  uint64_t v333 = v6;
  uint64_t v320 = v34;
  v40(v41, v46, v6);
  uint64_t v321 = v36;
  uint64_t v47 = (uint64_t *)(v327 + 2 * v36);
  v42(v5, 1, 1, v334);
  v330 = (char *)0xD000000000000032;
  uint64_t v48 = sub_24171E9B8();
  uint64_t v50 = v49;
  id v51 = v322;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  *uint64_t v47 = v48;
  v47[1] = v50;
  v47[2] = 0;
  LODWORD(v317) = *MEMORY[0x263F42A80];
  ((void (*)(uint64_t *))v40)(v47);
  unint64_t v52 = v327;
  uint64_t v53 = v328;
  unint64_t v54 = v327 + 3 * v36;
  uint64_t v55 = v334;
  v328(v5, 1, 1, v334);
  uint64_t v56 = sub_24171E9B8();
  uint64_t v58 = v57;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v51);
  *(void *)unint64_t v54 = v56;
  *(void *)(v54 + 8) = v58;
  *(unsigned char *)(v54 + 16) = 0;
  unsigned int v318 = *MEMORY[0x263F42AE0];
  ((void (*)(unint64_t))v40)(v54);
  v316 = (char *)(4 * v321);
  unint64_t v59 = v52 + 4 * v321;
  v53(v5, 1, 1, v55);
  uint64_t v60 = sub_24171E9B8();
  uint64_t v62 = v61;
  uint64_t v63 = v322;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  *(void *)unint64_t v59 = v60;
  *(void *)(v59 + 8) = v62;
  *(unsigned char *)(v59 + 16) = 0;
  v40((uint64_t *)v59, v318, v333);
  uint64_t v64 = v40;
  unint64_t v65 = (uint64_t *)&v316[v321 + v327];
  uint64_t v66 = v55;
  unint64_t v67 = v55;
  uint64_t v68 = v328;
  v328(v5, 1, 1, v67);
  uint64_t v69 = sub_24171E9B8();
  uint64_t v71 = v70;
  uint64_t v72 = v63;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v63);
  *unint64_t v65 = v69;
  v65[1] = v71;
  v65[2] = 0;
  uint64_t v73 = v333;
  v319 = v64;
  v64(v65, v317, v333);
  unint64_t v74 = v327 + 6 * v321;
  v68(v5, 1, 1, v66);
  uint64_t v75 = sub_24171E9B8();
  uint64_t v77 = v76;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v72);
  *(void *)unint64_t v74 = v75;
  *(void *)(v74 + 8) = v77;
  *(unsigned char *)(v74 + 16) = 0;
  uint64_t v78 = v318;
  v64((uint64_t *)v74, v318, v73);
  v316 = (char *)(8 * v321);
  unint64_t v79 = v327;
  unint64_t v80 = v327 + 7 * v321;
  id v81 = v334;
  v68(v5, 1, 1, v334);
  uint64_t v82 = sub_24171E9B8();
  uint64_t v84 = v83;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  *(void *)unint64_t v80 = v82;
  *(void *)(v80 + 8) = v84;
  *(unsigned char *)(v80 + 16) = 0;
  uint64_t v85 = v78;
  uint64_t v86 = v319;
  v319((uint64_t *)v80, v85, v333);
  uint64_t v87 = (uint64_t *)&v316[v79];
  v68(v5, 1, 1, v81);
  uint64_t v88 = sub_24171E9B8();
  uint64_t v90 = v89;
  id v91 = v322;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  *uint64_t v87 = v88;
  v87[1] = v90;
  v87[2] = 0;
  uint64_t v92 = v333;
  v86(v87, v317, v333);
  id v93 = &v316[v321 + v327];
  v328(v5, 1, 1, v81);
  uint64_t v94 = sub_24171E9B8();
  uint64_t v96 = v95;
  uint64_t v97 = v91;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v91);
  *(void *)id v93 = v94;
  *((void *)v93 + 1) = v96;
  v93[16] = 0;
  uint64_t v98 = v318;
  uint64_t v99 = (void (*)(unint64_t, uint64_t, uint64_t))v319;
  v319((uint64_t *)v93, v318, v92);
  uint64_t v100 = v328;
  unint64_t v101 = v327 + 10 * v321;
  v328(v5, 1, 1, v81);
  uint64_t v102 = sub_24171E9B8();
  uint64_t v104 = v103;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v97);
  *(void *)unint64_t v101 = v102;
  *(void *)(v101 + 8) = v104;
  *(unsigned char *)(v101 + 16) = 0;
  uint64_t v105 = v333;
  v99(v101, v98, v333);
  unint64_t v106 = v327 + 11 * v321;
  v100(v5, 1, 1, v334);
  uint64_t v107 = sub_24171E9B8();
  uint64_t v109 = v108;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v97);
  *(void *)unint64_t v106 = v107;
  *(void *)(v106 + 8) = v109;
  *(unsigned char *)(v106 + 16) = 0;
  uint64_t v110 = v105;
  char v111 = (void (*)(unint64_t, void, uint64_t))v319;
  v319((uint64_t *)v106, v98, v110);
  unint64_t v112 = v327;
  uint64_t v113 = v321;
  char v114 = (uint64_t *)(v327 + 12 * v321);
  v328(v5, 1, 1, v334);
  uint64_t v115 = sub_24171E9B8();
  uint64_t v117 = v116;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v97);
  *char v114 = v115;
  v114[1] = v117;
  v114[2] = 0;
  v111(v112 + 12 * v113, v317, v333);
  char v118 = (char *)(v112 + 13 * v113);
  sub_2416F7454();
  v308 = v119;
  v315 = &v118[v119[12]];
  uint64_t v120 = (uint64_t *)&v118[v119[16]];
  v316 = &v118[v119[20]];
  v330 = &v118[v119[24]];
  sub_2416F6C88(v118);
  uint64_t v121 = v334;
  uint64_t v122 = v328;
  v328(v5, 1, 1, v334);
  unint64_t v303 = 0xD000000000000015;
  unint64_t v302 = 0x8000000241723FD0;
  uint64_t v123 = sub_24171E9B8();
  uint64_t v125 = v124;
  uint64_t v126 = v322;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  *uint64_t v120 = v123;
  v120[1] = v125;
  v122(v5, 1, 1, v121);
  v301 = (char *)0xD000000000000055;
  uint64_t v127 = MEMORY[0x263F8EE78];
  uint64_t v128 = sub_24171E9B8();
  uint64_t v130 = v129;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v126);
  uint64_t v131 = v316;
  *(void *)v316 = v128;
  *((void *)v131 + 1) = v130;
  uint64_t v132 = v330;
  *(void *)v330 = 0x3FE999999999999ALL;
  v132[8] = 0;
  uint64_t v133 = sub_24171E688();
  uint64_t v336 = v127;
  uint64_t v309 = sub_2416F77DC(&qword_268D249E8, MEMORY[0x263F42B00]);
  uint64_t v134 = (uint64_t (*)(uint64_t))MEMORY[0x263F42B00];
  sub_2416F7824(0, &qword_268D249F0, MEMORY[0x263F42B00], MEMORY[0x263F8D488]);
  v330 = v135;
  v316 = (char *)sub_2416F7614(&qword_268D249F8, &qword_268D249F0, v134);
  uint64_t v307 = v133;
  sub_24171FB48();
  LODWORD(v315) = *MEMORY[0x263F42AC8];
  v136 = (void (*)(unint64_t))v319;
  ((void (*)(char *))v319)(v118);
  unint64_t v137 = v327;
  uint64_t v138 = v321;
  v139 = (uint64_t *)(v327 + 14 * v321);
  sub_2416F7678();
  uint64_t v310 = v140;
  v141 = (char *)v139 + *(int *)(v140 + 48);
  v122(v5, 1, 1, v334);
  v300 = (char *)0xD00000000000003FLL;
  uint64_t v142 = sub_24171E9B8();
  uint64_t v144 = v143;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  uint64_t *v139 = v142;
  v139[1] = v144;
  uint64_t v314 = sub_24171E1A8();
  uint64_t v145 = *(void *)(v314 - 8);
  v313 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v145 + 56);
  uint64_t v311 = v145 + 56;
  v313(v141, 1, 1, v314);
  unsigned int v312 = *MEMORY[0x263F42AA8];
  v136(v137 + 14 * v138);
  uint64_t v305 = 16 * v138;
  uint64_t v146 = (char *)(v137 + 15 * v138);
  v299 = &v146[v308[12]];
  uint64_t v147 = (uint64_t *)&v146[v308[16]];
  v297 = (uint64_t *)&v146[v308[20]];
  v298 = &v146[v308[24]];
  sub_2416F6C88(v146);
  v148 = v334;
  v149 = v328;
  v328(v5, 1, 1, v334);
  uint64_t v150 = sub_24171E9B8();
  uint64_t v152 = v151;
  v153 = v322;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  *uint64_t v147 = v150;
  v147[1] = v152;
  v149(v5, 1, 1, v148);
  uint64_t v154 = MEMORY[0x263F8EE78];
  uint64_t v155 = sub_24171E9B8();
  uint64_t v157 = v156;
  v158 = v153;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v153);
  v159 = v297;
  uint64_t *v297 = v155;
  v159[1] = v157;
  v160 = v298;
  *(void *)v298 = 0x3FE999999999999ALL;
  v160[8] = 0;
  uint64_t v336 = v154;
  sub_24171FB48();
  v161 = v319;
  v319((uint64_t *)v146, v315, v333);
  v162 = v328;
  v163 = (uint64_t *)(v327 + v305);
  uint64_t v164 = v327 + v305 + *(int *)(v310 + 48);
  v328(v5, 1, 1, v334);
  uint64_t v165 = sub_24171E9B8();
  uint64_t v167 = v166;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v158);
  uint64_t *v163 = v165;
  v163[1] = v167;
  v313((char *)v164, 1, 1, v314);
  v161(v163, v312, v333);
  uint64_t v168 = v321;
  unint64_t v169 = v327;
  v170 = (uint64_t *)(v327 + v305 + v321);
  v162(v5, 1, 1, v334);
  uint64_t v171 = sub_24171E9B8();
  uint64_t v173 = v172;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  uint64_t *v170 = v171;
  v170[1] = v173;
  v170[2] = 0;
  v161(v170, v317, v333);
  v174 = (char *)(v169 + 18 * v168);
  uint64_t v305 = (uint64_t)&v174[v308[12]];
  v175 = (uint64_t *)&v174[v308[16]];
  v300 = &v174[v308[20]];
  v301 = &v174[v308[24]];
  sub_2416F6C88(v174);
  v176 = v334;
  v177 = v328;
  v328(v5, 1, 1, v334);
  uint64_t v178 = sub_24171E9B8();
  uint64_t v180 = v179;
  v181 = v322;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  uint64_t *v175 = v178;
  v175[1] = v180;
  v177(v5, 1, 1, v176);
  uint64_t v182 = MEMORY[0x263F8EE78];
  uint64_t v183 = sub_24171E9B8();
  uint64_t v185 = v184;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v181);
  v186 = v300;
  *(void *)v300 = v183;
  *((void *)v186 + 1) = v185;
  v187 = v301;
  *(void *)v301 = 0x3FE999999999999ALL;
  v187[8] = 0;
  uint64_t v336 = v182;
  sub_24171FB48();
  v188 = (void (*)(unint64_t, void, uint64_t))v319;
  v319((uint64_t *)v174, v315, v333);
  uint64_t v189 = v321;
  unint64_t v190 = v327;
  v191 = (uint64_t *)(v327 + 19 * v321);
  v192 = (char *)v191 + *(int *)(v310 + 48);
  v328(v5, 1, 1, v334);
  uint64_t v193 = sub_24171E9B8();
  uint64_t v195 = v194;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  uint64_t *v191 = v193;
  v191[1] = v195;
  v313(v192, 1, 1, v314);
  v188(v190 + 19 * v189, v312, v333);
  v196 = (char *)(v190 + 20 * v189);
  unint64_t v302 = (unint64_t)&v196[v308[12]];
  v197 = (uint64_t *)&v196[v308[16]];
  v300 = &v196[v308[20]];
  v301 = &v196[v308[24]];
  sub_2416F6C88(v196);
  v198 = v334;
  v199 = v328;
  v328(v5, 1, 1, v334);
  unint64_t v303 = 0xD000000000000017;
  uint64_t v305 = 0x8000000241724240;
  uint64_t v200 = sub_24171E9B8();
  uint64_t v202 = v201;
  v203 = v322;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  uint64_t *v197 = v200;
  v197[1] = v202;
  v199(v5, 1, 1, v198);
  uint64_t v204 = MEMORY[0x263F8EE78];
  uint64_t v205 = sub_24171E9B8();
  uint64_t v207 = v206;
  v208 = v203;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v203);
  v209 = v300;
  *(void *)v300 = v205;
  *((void *)v209 + 1) = v207;
  v210 = v301;
  *(void *)v301 = 0x3FE999999999999ALL;
  v210[8] = 0;
  uint64_t v336 = v204;
  sub_24171FB48();
  v319((uint64_t *)v196, v315, v333);
  uint64_t v211 = v321;
  v212 = (uint64_t *)(v327 + 21 * v321);
  v301 = (char *)v212 + *(int *)(v310 + 48);
  v213 = v334;
  v199(v5, 1, 1, v334);
  unint64_t v302 = 0xD000000000000043;
  uint64_t v214 = sub_24171E9B8();
  uint64_t v216 = v215;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v208);
  uint64_t *v212 = v214;
  v212[1] = v216;
  uint64_t v217 = v333;
  v313(v301, 1, 1, v314);
  v218 = (void (*)(unint64_t, void, uint64_t))v319;
  v319(v212, v312, v217);
  unint64_t v219 = v327;
  v220 = (uint64_t *)(v327 + 22 * v211);
  v328(v5, 1, 1, v213);
  uint64_t v221 = sub_24171E9B8();
  uint64_t v223 = v222;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v208);
  uint64_t *v220 = v221;
  v220[1] = v223;
  v220[2] = 0;
  v218(v219 + 22 * v211, v317, v217);
  v224 = (char *)(v219 + 23 * v211);
  unint64_t v302 = (unint64_t)&v224[v308[12]];
  v300 = &v224[v308[16]];
  v301 = &v224[v308[20]];
  v308 = (int *)&v224[v308[24]];
  sub_2416F6C88(v224);
  v225 = v334;
  v226 = v328;
  v328(v5, 1, 1, v334);
  uint64_t v227 = sub_24171E9B8();
  uint64_t v229 = v228;
  v230 = v322;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  v231 = v300;
  *(void *)v300 = v227;
  *((void *)v231 + 1) = v229;
  v226(v5, 1, 1, v225);
  uint64_t v232 = MEMORY[0x263F8EE78];
  uint64_t v233 = sub_24171E9B8();
  uint64_t v235 = v234;
  v236 = v230;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v230);
  v237 = v301;
  *(void *)v301 = v233;
  *((void *)v237 + 1) = v235;
  v238 = v308;
  *(void *)v308 = 0x3FE999999999999ALL;
  *((unsigned char *)v238 + 8) = 0;
  uint64_t v336 = v232;
  sub_24171FB48();
  v239 = (void (*)(unint64_t, void, uint64_t))v319;
  v319((uint64_t *)v224, v315, v217);
  uint64_t v240 = v321;
  unint64_t v241 = v327;
  v242 = (uint64_t *)(v327 + 24 * v321);
  v330 = (char *)v242 + *(int *)(v310 + 48);
  v328(v5, 1, 1, v334);
  uint64_t v243 = sub_24171E9B8();
  uint64_t v245 = v244;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v236);
  uint64_t *v242 = v243;
  v242[1] = v245;
  v313(v330, 1, 1, v314);
  v239(v241 + 24 * v240, v312, v217);
  v246 = *(char **)(v335 + 16);
  v335 += 16;
  v330 = v246;
  ((void (*)(unint64_t, uint64_t *, uint64_t))v246)(v241 + 25 * v240, v306, v217);
  v247 = (uint64_t *)(v241 + 26 * v240);
  v248 = v334;
  v249 = v328;
  v328(v5, 1, 1, v334);
  uint64_t v250 = sub_24171E9B8();
  uint64_t v252 = v251;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  uint64_t *v247 = v250;
  v247[1] = v252;
  v247[2] = 0;
  v319(v247, v317, v217);
  uint64_t v253 = v321;
  unint64_t v254 = v327 + 27 * v321;
  v249(v5, 1, 1, v248);
  unint64_t v317 = 0xD000000000000038;
  uint64_t v255 = sub_24171E9B8();
  uint64_t v257 = v256;
  v258 = v322;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  *(void *)unint64_t v254 = v255;
  *(void *)(v254 + 8) = v257;
  *(unsigned char *)(v254 + 16) = 0;
  uint64_t v259 = v318;
  v260 = (void (*)(unint64_t, uint64_t, uint64_t))v319;
  v319((uint64_t *)v254, v318, v217);
  unint64_t v261 = v327 + 28 * v253;
  v262 = v328;
  v328(v5, 1, 1, v334);
  uint64_t v263 = sub_24171E9B8();
  uint64_t v265 = v264;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v258);
  *(void *)unint64_t v261 = v263;
  *(void *)(v261 + 8) = v265;
  *(unsigned char *)(v261 + 16) = 0;
  v260(v261, v259, v217);
  unint64_t v266 = v327;
  uint64_t v267 = v321;
  unint64_t v268 = v327 + 29 * v321;
  v269 = v334;
  v262(v5, 1, 1, v334);
  uint64_t v270 = sub_24171E9B8();
  uint64_t v272 = v271;
  sub_2416F7714((uint64_t)v5, &qword_26B018CA8, v322);
  *(void *)unint64_t v268 = v270;
  *(void *)(v268 + 8) = v272;
  unint64_t v273 = MEMORY[0x263F8EE78];
  *(unsigned char *)(v268 + 16) = 0;
  v319((uint64_t *)(v266 + 29 * v267), v318, v217);
  unint64_t v274 = v266 + 30 * v267;
  v328(v5, 1, 1, v269);
  uint64_t v275 = sub_24171E9B8();
  uint64_t v277 = v276;
  uint64_t v278 = (uint64_t)v5;
  uint64_t v279 = v267;
  sub_2416F7714(v278, &qword_26B018CA8, v322);
  *(void *)unint64_t v274 = v275;
  *(void *)(v274 + 8) = v277;
  *(unsigned char *)(v274 + 16) = 0;
  v319((uint64_t *)v274, v318, v217);
  v334 = (void (**)(void, void))(v335 - 8);
  v328 = (void (*)(char *, uint64_t, uint64_t, void (**)(void, void)))(v335 + 32);
  v329 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v335 + 40);
  v280 = (void (**)(char *, uint64_t, uint64_t))(v335 + 16);
  uint64_t v281 = 31;
  unint64_t v282 = v266;
  uint64_t v283 = (uint64_t)v325;
  do
  {
    v285 = v330;
    v284 = v331;
    ((void (*)(char *, unint64_t, uint64_t))v330)(v331, v282, v217);
    ((void (*)(uint64_t, char *, uint64_t))v285)(v283, v284, v217);
    (*v329)(v283, 0, 1, v217);
    v286 = (void (*)(uint64_t *, uint64_t))*v334;
    (*v334)(v284, v217);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v328)(v283, 1, v217) == 1)
    {
      sub_2416F7714(v283, &qword_268D249B8, MEMORY[0x263F42AE8]);
    }
    else
    {
      uint64_t v287 = v279;
      v288 = *v280;
      unint64_t v289 = v273;
      v290 = v324;
      (*v280)(v324, v283, v217);
      v291 = v290;
      unint64_t v273 = v289;
      v288(v332, (uint64_t)v291, v217);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v273 = sub_24171A5DC(0, *(void *)(v289 + 16) + 1, 1, v289);
      }
      unint64_t v293 = *(void *)(v273 + 16);
      unint64_t v292 = *(void *)(v273 + 24);
      uint64_t v279 = v287;
      if (v293 >= v292 >> 1) {
        unint64_t v273 = sub_24171A5DC(v292 > 1, v293 + 1, 1, v273);
      }
      *(void *)(v273 + 16) = v293 + 1;
      unint64_t v294 = v273 + v323 + v293 * v287;
      uint64_t v217 = v333;
      v288((char *)v294, (uint64_t)v332, v333);
      uint64_t v283 = (uint64_t)v325;
    }
    v282 += v279;
    --v281;
  }
  while (v281);
  v286(v306, v217);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v273;
}

void sub_2416F6850()
{
  if (!qword_268D249C0)
  {
    sub_2416F75C8(255, (unint64_t *)&qword_268D249C8, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
    sub_24171E5B8();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_268D249C0);
    }
  }
}

uint64_t sub_2416F68F8(void *a1)
{
  uint64_t v2 = sub_24171F738();
  uint64_t v15 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24171F768();
  uint64_t v5 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416F3408();
  uint64_t v8 = (void *)sub_24171FA08();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  aBlock[4] = sub_2416F77BC;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2416F9734;
  aBlock[3] = &unk_26F5944D0;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = a1;
  swift_release();
  sub_24171F758();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2416F77DC((unint64_t *)&qword_26B018CD0, MEMORY[0x263F8F030]);
  uint64_t v12 = (uint64_t (*)(uint64_t))MEMORY[0x263F8F030];
  sub_2416F7824(0, &qword_26B018CD8, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_2416F7614((unint64_t *)&qword_26B018CE0, &qword_26B018CD8, v12);
  sub_24171FB48();
  MEMORY[0x2456230B0](0, v7, v4, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v14);
}

uint64_t sub_2416F6BEC()
{
  uint64_t v0 = type metadata accessor for ImproveWalkingSteadinessPDFProvider();
  uint64_t v1 = swift_allocObject();
  v3[3] = v0;
  v3[4] = sub_2416F77DC(&qword_268D24A10, (void (*)(uint64_t))type metadata accessor for ImproveWalkingSteadinessPDFProvider);
  v3[0] = v1;
  sub_24171F9B8();
  return sub_2416E2090((uint64_t)v3);
}

uint64_t sub_2416F6C88@<X0>(char *a1@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v1 = sub_24171E208();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v34 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416F7824(0, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v27 - v5;
  long long v35 = xmmword_241720600;
  uint64_t v31 = v36;
  v36[0] = 3436653;
  v36[1] = 0xE300000000000000;
  long long v36[2] = 7761773;
  v36[3] = 0xE300000000000000;
  uint64_t v7 = (void (**)(char *, char *, uint64_t))(v2 + 32);
  uint64_t v8 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
  uint64_t v33 = (unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48);
  uint64_t v9 = qword_26B018CF8;
  sub_24171EF98();
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)qword_26B018E00;
  id v11 = (void *)sub_24171F7D8();
  uint64_t v12 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v10, sel_URLForResource_withExtension_, v11, v12);

  uint64_t v30 = (unint64_t)v7 & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  if (v13)
  {
    uint64_t v14 = v34;
    sub_24171E1F8();

    uint64_t v15 = *v7;
    (*v7)(v6, v14, v1);
    uint64_t v16 = *v8;
    (*v8)(v6, 0, 1, v1);
    if ((*v33)(v6, 1, v1) != 1) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v16 = *v8;
    (*v8)(v6, 1, 1, v1);
  }
  sub_2416F7714((uint64_t)v6, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8]);
  if ((unint64_t)v35 < 2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v28 = v16;
    unint64_t v29 = (unint64_t)v8 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v17 = qword_26B018CF8;
    sub_24171EF98();
    if (v17 == -1) {
      goto LABEL_9;
    }
  }
  swift_once();
LABEL_9:
  uint64_t v18 = (void *)qword_26B018E00;
  uint64_t v19 = (void *)sub_24171F7D8();
  uint64_t v20 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(v18, sel_URLForResource_withExtension_, v19, v20);

  if (!v21)
  {
    uint64_t v16 = v28;
    v28(v6, 1, 1, v1);
    goto LABEL_13;
  }
  uint64_t v22 = v34;
  sub_24171E1F8();

  uint64_t v15 = *v7;
  (*v7)(v6, v22, v1);
  uint64_t v16 = v28;
  v28(v6, 0, 1, v1);
  if ((*v33)(v6, 1, v1) == 1)
  {
LABEL_13:
    sub_2416F7714((uint64_t)v6, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8]);
    swift_arrayDestroy();
    uint64_t v24 = v32;
    uint64_t v25 = 1;
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v16)(v24, v25, 1, v1);
  }
LABEL_11:
  swift_arrayDestroy();
  uint64_t v23 = v32;
  v15(v32, v6, v1);
  uint64_t v24 = v23;
  uint64_t v25 = 0;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v16)(v24, v25, 1, v1);
}

unint64_t sub_2416F7154()
{
  return 0xD000000000000018;
}

uint64_t sub_2416F7170()
{
  return sub_2416F71C4();
}

uint64_t sub_2416F718C()
{
  return sub_2416F71C4();
}

uint64_t sub_2416F71A8()
{
  return sub_2416F71C4();
}

uint64_t sub_2416F71C4()
{
  sub_2416F7824(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - v1;
  uint64_t v3 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24171E8B8();
  sub_2416E70CC(v4, (uint64_t)qword_26B018E08);
  uint64_t v5 = sub_24171E9B8();
  sub_2416F7714((uint64_t)v2, &qword_26B018CA8, MEMORY[0x263F07690]);
  return v5;
}

id sub_2416F7360()
{
  if (qword_26B018CF8 != -1) {
    swift_once();
  }
  id v0 = (id)qword_26B018E00;
  uint64_t v1 = (void *)sub_24171F7D8();
  id v2 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v1, v0, 0);

  if (v2) {
    return v2;
  }
  id v4 = objc_allocWithZone(MEMORY[0x263F827E8]);

  return objc_msgSend(v4, sel_init);
}

void sub_2416F7454()
{
  if (!qword_268D249D8)
  {
    MEMORY[0x270FA5388](0);
    sub_2416F7824(255, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
    sub_24171E688();
    id v0 = (uint64_t (*)(void, uint64_t))MEMORY[0x263F8D8F0];
    sub_2416F75C8(255, (unint64_t *)&qword_268D249C8, MEMORY[0x263F8D310], MEMORY[0x263F8D8F0]);
    sub_2416F75C8(255, &qword_268D249E0, MEMORY[0x263F8D538], v0);
    unint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v2) {
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_268D249D8);
    }
  }
}

void sub_2416F75C8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_2416F7614(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2416F7824(255, a2, a3, MEMORY[0x263F8D488]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_2416F7678()
{
  if (!qword_268D24A00)
  {
    sub_2416F7824(255, &qword_268D24A08, MEMORY[0x263F06768], MEMORY[0x263F8D8F0]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268D24A00);
    }
  }
}

uint64_t sub_2416F7714(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_2416F7824(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_2416F7784()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2416F77BC()
{
  return sub_2416F6BEC();
}

uint64_t sub_2416F77C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2416F77D4()
{
  return swift_release();
}

uint64_t sub_2416F77DC(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_2416F7824(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

ValueMetadata *type metadata accessor for ImproveWalkingSteadinessArticleDataProvider()
{
  return &type metadata for ImproveWalkingSteadinessArticleDataProvider;
}

uint64_t type metadata accessor for WalkingSteadinessFeatureStatusSpecifierDataSource(uint64_t a1)
{
  return sub_2416E52C8(a1, (uint64_t *)&unk_268D24A50);
}

uint64_t sub_2416F78B8()
{
  uint64_t result = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_2416F7980()
{
  qword_268D24A18 = 1313423693;
  unk_268D24A20 = 0xE400000000000000;
}

uint64_t sub_2416F799C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_268D24A30;
  swift_beginAccess();
  uint64_t v4 = v3 + *(int *)(type metadata accessor for WalkingSteadinessHealthChecklistSettingsState() + 20);
  uint64_t v5 = sub_24171E708();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, v4, v5);
}

uint64_t sub_2416F7A30()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v19 = (uint64_t (*)(uint64_t))MEMORY[0x263F8F110];
  sub_2416FA368(0, &qword_268D24A90, MEMORY[0x263F8F110], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v17 - v3;
  sub_2416FA5AC();
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416FA6C0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v20 = v10;
  uint64_t v21 = v11;
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A3D0]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x263F09810], *(void *)(v0 + qword_268D24A38));
  sub_2416FA7F4(0, (unint64_t *)&qword_26B018418);
  id v22 = (id)sub_24171F508();
  *(void *)(swift_allocObject() + 16) = ObjectType;
  sub_2416FA658();
  type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  sub_2416FA850(&qword_268D24AA8, (void (*)(uint64_t))sub_2416FA658);
  sub_24171F6F8();
  swift_release();
  swift_release();
  sub_2416FA7F4(0, (unint64_t *)&qword_26B018CF0);
  id v22 = (id)sub_24171FA08();
  uint64_t v14 = sub_24171F9F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
  sub_2416FA850(&qword_268D24AB8, (void (*)(uint64_t))sub_2416FA5AC);
  sub_2416FA78C();
  sub_24171F708();
  sub_2416FA8FC((uint64_t)v4, &qword_268D24A90, v19);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2416FA850(&qword_268D24AC8, (void (*)(uint64_t))sub_2416FA6C0);
  uint64_t v15 = v20;
  sub_24171F718();
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v15);
  swift_beginAccess();
  sub_24171F6C8();
  swift_endAccess();

  return swift_release();
}

uint64_t sub_2416F7ED8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_24171F5C8();
  uint64_t v30 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416FA368(0, (unint64_t *)&qword_26B018C50, MEMORY[0x263F437D8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = sub_24171E828();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (void *)sub_24171F4E8();
  sub_241706050(v14, a1, sub_241710098, 0, (uint64_t)v9);

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    uint64_t v28 = v4;
    unint64_t v29 = a2;
    sub_2416FA8FC((uint64_t)v9, (unint64_t *)&qword_26B018C50, MEMORY[0x263F437D8]);
    sub_24171F598();
    uint64_t v15 = sub_24171F5B8();
    os_log_type_t v16 = sub_24171F938();
    BOOL v17 = os_log_type_enabled(v15, v16);
    uint64_t v18 = v30;
    if (v17)
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v32 = v20;
      *(_DWORD *)uint64_t v19 = 136446210;
      uint64_t v21 = sub_24171FE48();
      uint64_t v31 = sub_2416E1FBC(v21, v22, &v32);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2416DE000, v15, v16, "[%{public}s] Unable to create feature status configuration", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v20, -1, -1);
      MEMORY[0x245623AC0](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v28);
    uint64_t v23 = v29;
    uint64_t v24 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    sub_2417079B8(a2);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v26 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(a2, 0, 1, v26);
  }
}

void sub_2416F82F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a2 + 16;
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x245623B40](v7);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    sub_2416FA090(a1, (uint64_t)v6);
    uint64_t v10 = (uint64_t)v9 + qword_268D24A30;
    swift_beginAccess();
    sub_2416FA898((uint64_t)v6, v10);
    swift_endAccess();
  }
  swift_beginAccess();
  uint64_t v11 = MEMORY[0x245623B40](v7);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = v11 + qword_268D24A28;
    swift_beginAccess();
    uint64_t v14 = MEMORY[0x245623B40](v13);

    if (v14)
    {
      swift_getObjectType();
      sub_24171F238();
      sub_24171F2D8();
    }
  }
}

void sub_2416F844C(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24171E708();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416FA7F4(0, (unint64_t *)&qword_26B018420);
  uint64_t v8 = (void *)sub_24171FAB8();
  uint64_t v9 = (void *)sub_24171F7D8();
  id v10 = objc_msgSend(self, sel_imageNamed_inBundle_, v9, v8);

  if (v10)
  {
    uint64_t v11 = v2 + qword_268D24A30;
    swift_beginAccess();
    uint64_t v12 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11 + *(int *)(v12 + 20), v4);
    sub_24171EF98();
    sub_24171E758();
    sub_24171E738();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_24171F288();
    uint64_t v13 = sub_24171F298();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a1, 0, 1, v13);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2416F8670()
{
  sub_2416FA4E0();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_241720600;
  uint64_t v1 = self;
  if (qword_268D24540 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)sub_24171F7D8();
  id v3 = objc_msgSend(v1, sel_groupSpecifierWithID_, v2);

  *(void *)(inited + 32) = v3;
  *(void *)(inited + 40) = sub_2416F8828();
  sub_24171F8B8();
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (*(void *)(inited + 32))
  {
    uint64_t v4 = swift_unknownObjectRetain();
    MEMORY[0x245622F20](v4);
    if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24171F8C8();
    }
    sub_24171F8D8();
    sub_24171F8B8();
  }
  if (*(void *)(inited + 40))
  {
    uint64_t v5 = swift_unknownObjectRetain();
    MEMORY[0x245622F20](v5);
    if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24171F8C8();
    }
    sub_24171F8D8();
    sub_24171F8B8();
  }
  swift_bridgeObjectRelease();
  return v7;
}

id sub_2416F8828()
{
  sub_2416FA368(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = (char *)&v13 - v2;
  uint64_t v4 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_24171E8B8();
  sub_2416E70CC(v5, (uint64_t)qword_26B018E08);
  sub_24171E9B8();
  sub_2416FA8FC((uint64_t)v3, &qword_26B018CA8, MEMORY[0x263F07690]);
  uint64_t v6 = self;
  uint64_t v7 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v7, v0, sel_setNotificationsEnabled_, sel_isNotificationsEnabled, 0, 6, 0);

  if (v8)
  {
    uint64_t v9 = (void *)sub_24171F7D8();
    objc_msgSend(v8, sel_setIdentifier_, v9);

    swift_beginAccess();
    id v10 = (void *)sub_24171F8F8();
    objc_msgSend(v8, sel_setProperty_forKey_, v10, *MEMORY[0x263F600A8]);

    uint64_t v11 = (void *)sub_24171F8F8();
    objc_msgSend(v8, sel_setProperty_forKey_, v11, *MEMORY[0x263F5FEF8]);
  }
  return v8;
}

id sub_2416F8AF0()
{
  swift_beginAccess();
  uint64_t v0 = (void *)sub_24171F8F8();

  return v0;
}

uint64_t sub_2416F8B54(void *a1)
{
  uint64_t v23 = a1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_24171F738();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_24171F768();
  uint64_t v5 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24171F748();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416FA7F4(0, (unint64_t *)&qword_26B018CF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F8F068], v8);
  uint64_t v12 = (void *)sub_24171FA28();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = *(void *)(v1 + qword_268D24A40);
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = ObjectType;
  BOOL v17 = v23;
  v15[2] = v14;
  v15[3] = v17;
  v15[4] = v13;
  v15[5] = v16;
  aBlock[4] = sub_2416FA474;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2416F9734;
  aBlock[3] = &unk_26F594568;
  uint64_t v18 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  id v19 = v17;
  swift_retain();
  sub_24171F758();
  uint64_t v26 = MEMORY[0x263F8EE78];
  sub_2416FA850((unint64_t *)&qword_26B018CD0, MEMORY[0x263F8F030]);
  sub_2416FA368(0, &qword_26B018CD8, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_2416F3540();
  sub_24171FB48();
  MEMORY[0x2456230B0](0, v7, v4, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v24);
  swift_release();
  return swift_release();
}

uint64_t sub_2416F8F5C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  sub_2416FA560(0, (unint64_t *)&qword_268D24740, MEMORY[0x263F8D4F8], MEMORY[0x263F44B40]);
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(v8 - 8);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v15 - v12;
  if (a1)
  {
    swift_getObjectType();
    objc_msgSend(a2, sel_BOOLValue);
    sub_24171F9C8();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a3;
    *(void *)(v14 + 24) = a4;
    swift_retain();
    sub_24171FA68();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  return result;
}

uint64_t sub_2416F90DC(char a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v40 = a4;
  void aBlock[6] = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_24171F738();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24171F768();
  uint64_t v41 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24171F5C8();
  MEMORY[0x270FA5388](v14);
  BOOL v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v39 = v15;
    sub_24171F568();
    id v18 = a2;
    id v19 = a2;
    uint64_t v20 = sub_24171F5B8();
    int v38 = sub_24171F938();
    if (os_log_type_enabled(v20, (os_log_type_t)v38))
    {
      os_log_t v34 = v20;
      uint64_t v35 = a3;
      uint64_t v36 = v11;
      uint64_t v37 = v8;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      aBlock[0] = v33;
      *(_DWORD *)uint64_t v21 = 136446466;
      uint64_t v22 = sub_24171FE48();
      uint64_t v42 = sub_2416E1FBC(v22, v23, aBlock);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2112;
      if (a2)
      {
        id v24 = a2;
        uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v42 = v25;
        sub_24171FB18();
      }
      else
      {
        uint64_t v42 = 0;
        sub_24171FB18();
        uint64_t v25 = 0;
      }
      uint64_t v26 = v32;
      *uint64_t v32 = v25;

      os_log_t v27 = v34;
      _os_log_impl(&dword_2416DE000, v34, (os_log_type_t)v38, "[%{public}s] Error when setting Walking Steadiness setting enabled: %@", (uint8_t *)v21, 0x16u);
      sub_2416F42A8();
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v26, -1, -1);
      uint64_t v28 = v33;
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v28, -1, -1);
      MEMORY[0x245623AC0](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v39 + 8))(v17, v14);
      uint64_t v11 = v36;
      uint64_t v8 = v37;
      a3 = v35;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v39 + 8))(v17, v14);
    }
  }
  sub_2416FA7F4(0, (unint64_t *)&qword_26B018CF0);
  unint64_t v29 = (void *)sub_24171FA08();
  aBlock[4] = (uint64_t)sub_2416FA4D8;
  aBlock[5] = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2416F9734;
  aBlock[3] = (uint64_t)&unk_26F5945B8;
  uint64_t v30 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_24171F758();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2416FA850((unint64_t *)&qword_26B018CD0, MEMORY[0x263F8F030]);
  sub_2416FA368(0, &qword_26B018CD8, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_2416F3540();
  sub_24171FB48();
  MEMORY[0x2456230B0](0, v13, v10, v30);
  _Block_release(v30);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v13, v11);
}

void sub_2416F9690(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x245623B40](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = v2 + qword_268D24A28;
    swift_beginAccess();
    uint64_t v5 = MEMORY[0x245623B40](v4);

    if (v5)
    {
      swift_getObjectType();
      sub_24171F228();
      sub_24171F2D8();
    }
  }
}

uint64_t sub_2416F9734(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_2416F9778(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_2416F8B54(v4);
}

void sub_2416F97E0()
{
}

uint64_t sub_2416F9810()
{
  sub_2416FA3CC(v0 + qword_268D24A28);
  sub_2416FA30C(v0 + qword_268D24A30);

  sub_24171F2D8();

  return swift_bridgeObjectRelease();
}

id sub_2416F9880()
{
  return sub_2416FA048(type metadata accessor for WalkingSteadinessFeatureStatusSpecifierDataSource);
}

uint64_t sub_2416F9898(uint64_t a1)
{
  sub_2416FA3CC(a1 + qword_268D24A28);
  sub_2416FA30C(a1 + qword_268D24A30);

  sub_24171F2D8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2416F9914()
{
  return type metadata accessor for WalkingSteadinessFeatureStatusSpecifierDataSource(0);
}

uint64_t type metadata accessor for WalkingSteadinessFeatureStatusViewController(uint64_t a1)
{
  return sub_2416E52C8(a1, (uint64_t *)&unk_268D24A60);
}

uint64_t sub_2416F993C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2416F997C()
{
  uint64_t v1 = v0 + qword_268D24A28;
  swift_beginAccess();
  return MEMORY[0x245623B40](v1);
}

uint64_t sub_2416F99CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + qword_268D24A28;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return sub_24171F2D8();
}

void (*sub_2416F9A38(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = qword_268D24A28;
  void v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x245623B40](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_2416F9AC0;
}

void sub_2416F9AC0(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    sub_24171F2D8();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_24171F2D8();
  }

  free(v3);
}

void (*sub_2416F9B50(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24171F2B8();
  return sub_2416F9BC0;
}

void sub_2416F9BC0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

id sub_2416F9C10(uint64_t a1, void *a2, uint64_t a3)
{
  sub_2416FA368(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = sub_24171E9D8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = a1;
  sub_2416FA090(a1, (uint64_t)v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  id v16 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessFeatureStatusSpecifierDataSource(0));
  id v17 = sub_2416FA0F4((uint64_t)v15, a2, (uint64_t)v12);
  sub_2416FA850(&qword_268D24A70, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusSpecifierDataSource);
  id v18 = v17;
  id v19 = (void *)sub_24171F1D8();
  uint64_t v20 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v8, 1, 1, v20);
  uint64_t v21 = qword_26B018CB0;
  id v22 = v19;
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_24171E8B8();
  sub_2416E70CC(v23, (uint64_t)qword_26B018E08);
  sub_24171E9B8();
  sub_2416FA8FC((uint64_t)v8, &qword_26B018CA8, MEMORY[0x263F07690]);
  id v24 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setTitle_, v24);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a3, v9);
  sub_2416FA30C(v27);
  return v22;
}

void sub_2416F9FA4()
{
}

void sub_2416FA000()
{
}

id sub_2416FA030()
{
  return sub_2416FA048(type metadata accessor for WalkingSteadinessFeatureStatusViewController);
}

id sub_2416FA048(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_2416FA088()
{
  return type metadata accessor for WalkingSteadinessFeatureStatusViewController(0);
}

uint64_t sub_2416FA090(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_2416FA0F4(uint64_t a1, void *a2, uint64_t a3)
{
  sub_2416FA368(0, &qword_268D24A78, MEMORY[0x263F43A90], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - v8;
  *(void *)&v3[qword_268D24A28 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v3[qword_268D24A48] = MEMORY[0x263F8EE88];
  sub_2416FA090(a1, (uint64_t)&v3[qword_268D24A30]);
  *(void *)&v3[qword_268D24A38] = a2;
  uint64_t v10 = *MEMORY[0x263F09810];
  uint64_t v11 = v3;
  id v12 = objc_msgSend(a2, sel_featureAvailabilityProviderForIdentifier_, v10);
  *(void *)&v11[qword_268D24A40] = v12;

  uint64_t v13 = sub_24171E9D8();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v9, a3, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
  id v15 = (id)sub_24171E9C8();
  sub_2416F7A30();

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a3, v13);
  sub_2416FA30C(a1);
  return v15;
}

uint64_t sub_2416FA30C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2416FA368(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2416FA3CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2416FA3F4()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2416FA42C()
{
  sub_24171F2D8();

  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2416FA474()
{
  return sub_2416F8F5C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_2416FA480(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2416FA490()
{
  return swift_release();
}

uint64_t sub_2416FA498()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2416FA4D0(char a1, void *a2)
{
  return sub_2416F90DC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

void sub_2416FA4D8()
{
  sub_2416F9690(v0);
}

void sub_2416FA4E0()
{
  if (!qword_268D24A80)
  {
    sub_2416FA560(255, &qword_268D24A88, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8D8F0]);
    unint64_t v0 = sub_24171FD68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24A80);
    }
  }
}

void sub_2416FA560(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_2416FA5AC()
{
  if (!qword_268D24A98)
  {
    sub_2416FA658();
    type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    sub_2416FA850(&qword_268D24AA8, (void (*)(uint64_t))sub_2416FA658);
    unint64_t v0 = sub_24171F698();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24A98);
    }
  }
}

void sub_2416FA658()
{
  if (!qword_268D24AA0)
  {
    sub_24171F4D8();
    unint64_t v0 = sub_24171F6B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24AA0);
    }
  }
}

void sub_2416FA6C0()
{
  if (!qword_268D24AB0)
  {
    sub_2416FA5AC();
    sub_2416FA7F4(255, (unint64_t *)&qword_26B018CF0);
    sub_2416FA850(&qword_268D24AB8, (void (*)(uint64_t))sub_2416FA5AC);
    sub_2416FA78C();
    unint64_t v0 = sub_24171F6A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24AB0);
    }
  }
}

unint64_t sub_2416FA78C()
{
  unint64_t result = qword_268D24AC0;
  if (!qword_268D24AC0)
  {
    sub_2416FA7F4(255, (unint64_t *)&qword_26B018CF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24AC0);
  }
  return result;
}

uint64_t sub_2416FA7F4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2416FA830()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2416FA840@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_2416F7ED8(a1, a2);
}

void sub_2416FA848(uint64_t a1)
{
  sub_2416F82F4(a1, v1);
}

uint64_t sub_2416FA850(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2416FA898(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2416FA8FC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_2416FA368(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_2416FA974()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24171F068();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24171F158();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void **)(v1 + 16);
  sub_24171F0F8();
  sub_24171F098();
  unint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  sub_24171F358();
  swift_bridgeObjectRelease();
  sub_2416F3168((uint64_t)&v17);
  sub_24171F0D8();
  unint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  sub_24171F358();
  swift_bridgeObjectRelease();
  sub_2416F3168((uint64_t)&v17);
  sub_24171F0C8();
  unint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  sub_24171F358();
  swift_bridgeObjectRelease();
  sub_2416F3168((uint64_t)&v17);
  sub_24171F088();
  unint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  sub_24171F358();
  swift_bridgeObjectRelease();
  sub_2416F3168((uint64_t)&v17);
  uint64_t v11 = _s37WalkingSteadinessFitnessPlusComponentCMa();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  *((void *)&v18 + 1) = v11;
  unint64_t v19 = sub_2416FAD84();
  *(void *)&long long v17 = v12;
  id v13 = v10;
  swift_retain();
  sub_24171F0A8();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F44388], v2);
  sub_24171F348();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_2416E2090((uint64_t)&v17);
  uint64_t v14 = sub_24171F028();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v14;
}

uint64_t sub_2416FAC88()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MobilityAppPlugin54WalkingSteadinessEventDataTypeDetailDataSourceProvider_context;
  uint64_t v2 = sub_24171F148();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2416FAD30()
{
  return type metadata accessor for WalkingSteadinessEventDataTypeDetailDataSourceProvider();
}

uint64_t type metadata accessor for WalkingSteadinessEventDataTypeDetailDataSourceProvider()
{
  uint64_t result = qword_268D24AD0;
  if (!qword_268D24AD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_2416FAD84()
{
  unint64_t result = qword_268D24998;
  if (!qword_268D24998)
  {
    _s37WalkingSteadinessFitnessPlusComponentCMa();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24998);
  }
  return result;
}

ValueMetadata *type metadata accessor for WalkingSteadinessArticleDataProvider()
{
  return &type metadata for WalkingSteadinessArticleDataProvider;
}

void sub_2416FADEC(void *a1)
{
  sub_2416FC194(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - v3;
  uint64_t v5 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24171E8B8();
  sub_2416E70CC(v6, (uint64_t)qword_26B018E08);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v4);
  sub_2416F4300();
  id v7 = objc_allocWithZone((Class)sub_24171E5F8());
  uint64_t v8 = (void *)sub_24171E5E8();
  id v9 = objc_msgSend(a1, sel_navigationController);
  if (v9)
  {
    uint64_t v10 = v9;
    objc_msgSend(v9, sel_pushViewController_animated_, v8, 1);
  }
}

unint64_t sub_2416FAFD0()
{
  return 0xD000000000000011;
}

uint64_t sub_2416FAFEC()
{
  return sub_2416FB024();
}

uint64_t sub_2416FB008()
{
  return sub_2416FB024();
}

uint64_t sub_2416FB024()
{
  sub_2416FC194(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - v1;
  uint64_t v3 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24171E8B8();
  sub_2416E70CC(v4, (uint64_t)qword_26B018E08);
  uint64_t v5 = sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v2);
  return v5;
}

uint64_t sub_2416FB194()
{
  return sub_2416FB024();
}

id sub_2416FB1B4()
{
  if (qword_26B018CF8 != -1) {
    swift_once();
  }
  id v0 = (id)qword_26B018E00;
  uint64_t v1 = (void *)sub_24171F7D8();
  id v2 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v1, v0, 0);

  if (v2) {
    return v2;
  }
  id v4 = objc_allocWithZone(MEMORY[0x263F827E8]);

  return objc_msgSend(v4, sel_init);
}

uint64_t sub_2416FB2A8()
{
  sub_2416FC194(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v0 - 8);
  id v2 = (char *)&v137 - v1;
  sub_2416FC194(0, &qword_268D249D0, MEMORY[0x263F42AE8], MEMORY[0x263F8E0F8]);
  uint64_t v3 = sub_24171E5C8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 72);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_241722000;
  uint64_t v137 = v7;
  unint64_t v8 = v7 + v6;
  *(void *)unint64_t v8 = sub_2416FB1B4();
  *(unsigned char *)(v8 + 8) = 0;
  uint64_t v11 = *(void (**)(void))(v4 + 104);
  uint64_t v9 = v4 + 104;
  uint64_t v10 = v11;
  ((void (*)(unint64_t, void, uint64_t))v11)(v8, *MEMORY[0x263F42AB8], v3);
  unint64_t v12 = v8;
  uint64_t v13 = v8 + v5;
  uint64_t v14 = sub_24171E288();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  uint64_t v149 = v14;
  uint64_t v144 = v15 + 56;
  uint64_t v145 = v16;
  ((void (*)(char *, uint64_t, uint64_t))v16)(v2, 1, 1);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_24171E8B8();
  uint64_t v18 = sub_2416E70CC(v17, (uint64_t)qword_26B018E08);
  uint64_t v19 = sub_24171E9B8();
  uint64_t v21 = v20;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)(v12 + v5) = v19;
  *(void *)(v13 + 8) = v21;
  ((void (*)(uint64_t, void, uint64_t))v10)(v13, *MEMORY[0x263F42AC0], v3);
  uint64_t v147 = v10;
  uint64_t v148 = v3;
  uint64_t v22 = v5;
  uint64_t v150 = v9;
  uint64_t v141 = 2 * v5;
  uint64_t v143 = v5;
  uint64_t v23 = (uint64_t *)(v12 + 2 * v5);
  uint64_t v24 = v149;
  v145(v2, 1, 1, v149);
  unint64_t v140 = 0xD00000000000002ALL;
  uint64_t v142 = v18;
  uint64_t v25 = sub_24171E9B8();
  uint64_t v27 = v26;
  sub_2416FC1F8((uint64_t)v2);
  *uint64_t v23 = v25;
  v23[1] = v27;
  v23[2] = 0;
  unsigned int v139 = *MEMORY[0x263F42A80];
  uint64_t v28 = (void (*)(unint64_t, uint64_t, uint64_t))v147;
  v147(v23);
  unint64_t v29 = v12 + v141 + v22;
  uint64_t v30 = v145;
  v145(v2, 1, 1, v24);
  uint64_t v31 = sub_24171E9B8();
  uint64_t v33 = v32;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)unint64_t v29 = v31;
  *(void *)(v29 + 8) = v33;
  *(unsigned char *)(v29 + 16) = 0;
  LODWORD(v141) = *MEMORY[0x263F42AE0];
  uint64_t v34 = v141;
  uint64_t v35 = v148;
  v28(v29, v141, v148);
  uint64_t v138 = 4 * v143;
  unint64_t v36 = v12 + 4 * v143;
  v30(v2, 1, 1, v149);
  uint64_t v37 = sub_24171E9B8();
  uint64_t v39 = v38;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)unint64_t v36 = v37;
  *(void *)(v36 + 8) = v39;
  *(unsigned char *)(v36 + 16) = 0;
  uint64_t v40 = v34;
  uint64_t v41 = v35;
  v28(v36, v40, v35);
  uint64_t v42 = v143;
  uint64_t v43 = (uint64_t *)(v12 + v138 + v143);
  unint64_t v146 = v12;
  uint64_t v44 = v149;
  uint64_t v45 = v145;
  v145(v2, 1, 1, v149);
  uint64_t v46 = sub_24171E9B8();
  uint64_t v48 = v47;
  sub_2416FC1F8((uint64_t)v2);
  *uint64_t v43 = v46;
  v43[1] = v48;
  v43[2] = 0;
  uint64_t v49 = v41;
  uint64_t v50 = (void (*)(unint64_t, uint64_t, uint64_t))v147;
  ((void (*)(uint64_t *, void, uint64_t))v147)(v43, v139, v49);
  unint64_t v51 = v12 + 6 * v42;
  v45(v2, 1, 1, v44);
  uint64_t v52 = sub_24171E9B8();
  uint64_t v54 = v53;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)unint64_t v51 = v52;
  *(void *)(v51 + 8) = v54;
  *(unsigned char *)(v51 + 16) = 0;
  uint64_t v55 = v141;
  v50(v51, v141, v148);
  uint64_t v138 = 8 * v42;
  uint64_t v56 = v145;
  unint64_t v57 = v146 + 7 * v42;
  v145(v2, 1, 1, v44);
  uint64_t v58 = sub_24171E9B8();
  uint64_t v60 = v59;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)unint64_t v57 = v58;
  *(void *)(v57 + 8) = v60;
  *(unsigned char *)(v57 + 16) = 0;
  uint64_t v61 = v148;
  v50(v57, v55, v148);
  unint64_t v62 = v146 + v138;
  v56(v2, 1, 1, v149);
  uint64_t v63 = sub_24171E9B8();
  uint64_t v65 = v64;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)unint64_t v62 = v63;
  *(void *)(v62 + 8) = v65;
  *(unsigned char *)(v62 + 16) = 0;
  uint64_t v66 = v141;
  v50(v62, v141, v61);
  uint64_t v67 = v143;
  unint64_t v68 = v146;
  unint64_t v69 = v146 + v138 + v143;
  uint64_t v70 = v149;
  v56(v2, 1, 1, v149);
  uint64_t v71 = sub_24171E9B8();
  uint64_t v73 = v72;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)unint64_t v69 = v71;
  *(void *)(v69 + 8) = v73;
  *(unsigned char *)(v69 + 16) = 0;
  uint64_t v74 = v148;
  ((void (*)(unint64_t, uint64_t, uint64_t))v147)(v69, v66, v148);
  uint64_t v75 = (uint64_t *)(v68 + 10 * v67);
  uint64_t v76 = v145;
  v145(v2, 1, 1, v70);
  uint64_t v77 = sub_24171E9B8();
  uint64_t v79 = v78;
  sub_2416FC1F8((uint64_t)v2);
  *uint64_t v75 = v77;
  v75[1] = v79;
  v75[2] = 0;
  unint64_t v80 = (void (*)(unint64_t, void, uint64_t))v147;
  ((void (*)(uint64_t *, void, uint64_t))v147)(v75, v139, v74);
  unint64_t v81 = v146;
  unint64_t v82 = v146 + 11 * v67;
  v76(v2, 1, 1, v149);
  uint64_t v83 = sub_24171E9B8();
  uint64_t v85 = v84;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)unint64_t v82 = v83;
  *(void *)(v82 + 8) = v85;
  *(unsigned char *)(v82 + 16) = 0;
  uint64_t v86 = v141;
  v80(v82, v141, v148);
  unint64_t v87 = v81 + 12 * v143;
  uint64_t v88 = v149;
  uint64_t v89 = v145;
  v145(v2, 1, 1, v149);
  uint64_t v90 = sub_24171E9B8();
  uint64_t v92 = v91;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)unint64_t v87 = v90;
  *(void *)(v87 + 8) = v92;
  *(unsigned char *)(v87 + 16) = 0;
  uint64_t v93 = v148;
  ((void (*)(unint64_t, uint64_t, uint64_t))v147)(v87, v86, v148);
  uint64_t v94 = v143;
  unint64_t v95 = v146 + 13 * v143;
  v89(v2, 1, 1, v88);
  uint64_t v96 = sub_24171E9B8();
  uint64_t v98 = v97;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)unint64_t v95 = v96;
  *(void *)(v95 + 8) = v98;
  *(unsigned char *)(v95 + 16) = 0;
  ((void (*)(unint64_t, void, uint64_t))v147)(v95, v141, v93);
  uint64_t v99 = (uint64_t *)(v146 + 14 * v94);
  v89(v2, 1, 1, v88);
  uint64_t v100 = sub_24171E9B8();
  uint64_t v102 = v101;
  sub_2416FC1F8((uint64_t)v2);
  *uint64_t v99 = v100;
  v99[1] = v102;
  sub_2416FC284(0, (unint64_t *)&qword_26B018450, MEMORY[0x263F8E0F8]);
  uint64_t v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = xmmword_241721DB0;
  *(void *)(v103 + 32) = 0x656C6369747241;
  *(void *)(v103 + 40) = 0xE700000000000000;
  *(void *)(v103 + 48) = 0xD000000000000011;
  *(void *)(v103 + 56) = 0x8000000241723C40;
  *(void *)(v103 + 64) = 0xD000000000000033;
  *(void *)(v103 + 72) = 0x8000000241724BF0;
  uint64_t v104 = (void *)sub_24171F898();
  swift_bridgeObjectRelease();
  id v105 = (id)HKUIJoinStringsForAutomationIdentifier();

  uint64_t v106 = v149;
  if (v105)
  {
    uint64_t v107 = sub_24171F818();
    uint64_t v109 = v108;
  }
  else
  {
    uint64_t v107 = 0;
    uint64_t v109 = 0;
  }
  sub_2416F6850();
  char v111 = (void (**)(void *))((char *)v99 + *(int *)(v110 + 64));
  v99[2] = v107;
  v99[3] = v109;
  *char v111 = sub_2416FADEC;
  v111[1] = 0;
  uint64_t v112 = *MEMORY[0x263F42A68];
  uint64_t v113 = sub_24171E5B8();
  (*(void (**)(void (**)(void *), uint64_t, uint64_t))(*(void *)(v113 - 8) + 104))(v111, v112, v113);
  char v114 = v99;
  uint64_t v115 = v148;
  ((void (*)(uint64_t *, void, uint64_t))v147)(v114, *MEMORY[0x263F42A60], v148);
  uint64_t v116 = 16 * v143;
  uint64_t v138 = 16 * v143;
  unint64_t v117 = v146;
  char v118 = (uint64_t *)(v146 + 15 * v143);
  v145(v2, 1, 1, v106);
  uint64_t v119 = sub_24171E9B8();
  uint64_t v121 = v120;
  sub_2416FC1F8((uint64_t)v2);
  *char v118 = v119;
  v118[1] = v121;
  v118[2] = 0;
  uint64_t v122 = v115;
  uint64_t v123 = (void (*)(unint64_t, uint64_t, uint64_t))v147;
  ((void (*)(uint64_t *, void, uint64_t))v147)(v118, v139, v122);
  unint64_t v124 = v117 + v116;
  uint64_t v125 = v149;
  uint64_t v126 = v145;
  v145(v2, 1, 1, v149);
  uint64_t v127 = sub_24171E9B8();
  uint64_t v129 = v128;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)unint64_t v124 = v127;
  *(void *)(v124 + 8) = v129;
  *(unsigned char *)(v124 + 16) = 0;
  uint64_t v130 = v141;
  uint64_t v131 = v148;
  v123(v124, v141, v148);
  unint64_t v132 = v146 + v138 + v143;
  v126(v2, 1, 1, v125);
  uint64_t v133 = sub_24171E9B8();
  uint64_t v135 = v134;
  sub_2416FC1F8((uint64_t)v2);
  *(void *)unint64_t v132 = v133;
  *(void *)(v132 + 8) = v135;
  *(unsigned char *)(v132 + 16) = 0;
  v123(v132, v130, v131);
  return v137;
}

void sub_2416FC194(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_2416FC1F8(uint64_t a1)
{
  sub_2416FC194(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2416FC284(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void, void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0, MEMORY[0x263F8D310]);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *sub_2416FC2D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    uint64_t *v4 = *a2;
    unint64_t v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = *(int *)(a3 + 20);
    unint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_24171E708();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    sub_24171EF98();
  }
  return v4;
}

uint64_t sub_2416FC3C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_24171E708();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  return swift_bridgeObjectRelease();
}

unsigned char *sub_2416FC444(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  unint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24171E708();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  sub_24171EF98();
  return a1;
}

unsigned char *sub_2416FC4E0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  unint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24171E708();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  sub_24171EF98();
  swift_bridgeObjectRelease();
  return a1;
}

unsigned char *sub_2416FC588(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  unint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24171E708();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *sub_2416FC620(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  unint64_t v8 = &a2[v6];
  uint64_t v9 = sub_24171E708();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2416FC6C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2416FC6D4);
}

uint64_t sub_2416FC6D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24171E708();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_2416FC798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2416FC7AC);
}

uint64_t sub_2416FC7AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24171E708();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for WalkingSteadinessHealthChecklistSettingsState()
{
  uint64_t result = qword_26B0189D0;
  if (!qword_26B0189D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2416FC8B8()
{
  uint64_t result = sub_24171E708();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2416FC95C(char a1)
{
  return *(void *)&aDisabledon[8 * a1];
}

uint64_t sub_2416FC97C(void *a1, int a2)
{
  int v28 = a2;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E0C0];
  sub_2416FE5B8(0, &qword_26B018A58, (uint64_t (*)(void))sub_2416FE468, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OffCodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)&v21 - v5;
  sub_2416FE5B8(0, &qword_26B018A50, (uint64_t (*)(void))sub_2416FE4BC, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OnCodingKeys, v3);
  uint64_t v23 = *(void *)(v6 - 8);
  uint64_t v24 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v22 = (char *)&v21 - v7;
  sub_2416FE5B8(0, &qword_26B018A60, (uint64_t (*)(void))sub_2416FE510, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.DisabledCodingKeys, v3);
  uint64_t v9 = v8;
  uint64_t v21 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - v10;
  sub_2416FE5B8(0, &qword_26B018A48, (uint64_t (*)(void))sub_2416FE564, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys, v3);
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v21 - v15;
  sub_2416E6230(a1, a1[3]);
  sub_2416FE564();
  sub_24171FE18();
  if ((_BYTE)v28)
  {
    if (v28 == 1)
    {
      char v30 = 1;
      sub_2416FE4BC();
      uint64_t v17 = v22;
      sub_24171FD28();
      uint64_t v19 = v23;
      uint64_t v18 = v24;
    }
    else
    {
      char v31 = 2;
      sub_2416FE468();
      uint64_t v17 = v25;
      sub_24171FD28();
      uint64_t v19 = v26;
      uint64_t v18 = v27;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
  }
  else
  {
    char v29 = 0;
    sub_2416FE510();
    sub_24171FD28();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v9);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_2416FCD7C(char a1)
{
  if (!a1) {
    return 0x7453686374697773;
  }
  if (a1 == 1) {
    return 0x73696C6B63656863;
  }
  return 0xD000000000000019;
}

uint64_t sub_2416FCDEC(void *a1)
{
  uint64_t v3 = v1;
  sub_2416FE5B8(0, &qword_26B018A68, (uint64_t (*)(void))sub_2416FD804, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.CodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v12 - v8;
  sub_2416E6230(a1, a1[3]);
  sub_2416FD804();
  sub_24171FE18();
  char v16 = *v3;
  char v15 = 0;
  sub_2416FD904();
  sub_24171FD48();
  if (!v2)
  {
    uint64_t v10 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
    char v14 = 1;
    sub_24171E708();
    sub_2416FD958(&qword_26B0188F0);
    sub_24171FD48();
    v12[1] = *(void *)&v3[*(int *)(v10 + 24)];
    char v13 = 2;
    sub_2416FD8AC();
    sub_2416FD99C(&qword_26B018A30);
    sub_24171FD48();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_2416FD054@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v3 = sub_24171E708();
  uint64_t v25 = *(void *)(v3 - 8);
  uint64_t v26 = v3;
  MEMORY[0x270FA5388](v3);
  sub_2416FE5B8(0, &qword_268D24AE0, (uint64_t (*)(void))sub_2416FD804, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.CodingKeys, MEMORY[0x263F8E040]);
  uint64_t v28 = v4;
  uint64_t v24 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v21 - v5;
  uint64_t v7 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416E6230(a1, a1[3]);
  sub_2416FD804();
  uint64_t v27 = v6;
  uint64_t v10 = (uint64_t)v29;
  sub_24171FE08();
  if (v10) {
    return sub_2416E2090((uint64_t)a1);
  }
  char v29 = a1;
  uint64_t v11 = v9;
  uint64_t v13 = v24;
  uint64_t v12 = v25;
  char v33 = 0;
  sub_2416FD858();
  char v14 = v27;
  uint64_t v15 = v28;
  sub_24171FD08();
  uint64_t v22 = v11;
  *uint64_t v11 = v34;
  char v32 = 1;
  sub_2416FD958(&qword_268D24AF0);
  sub_24171FD08();
  char v16 = *(void (**)(void))(v12 + 32);
  uint64_t v21 = &v22[*(int *)(v7 + 20)];
  v16();
  sub_2416FD8AC();
  char v31 = 2;
  sub_2416FD99C(&qword_268D24AF8);
  sub_24171FD08();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v14, v15);
  uint64_t v17 = *(int *)(v7 + 24);
  uint64_t v19 = (uint64_t)v22;
  uint64_t v18 = v23;
  *(void *)&v22[v17] = v30;
  sub_2416FA090(v19, v18);
  sub_2416E2090((uint64_t)v29);
  return sub_2416FA30C(v19);
}

uint64_t sub_2416FD444()
{
  return sub_2416FC95C(*v0);
}

uint64_t sub_2416FD44C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2416FDC4C(a1, a2);
  *a3 = result;
  return result;
}

void sub_2416FD474(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2416FD480(uint64_t a1)
{
  unint64_t v2 = sub_2416FE564();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416FD4BC(uint64_t a1)
{
  unint64_t v2 = sub_2416FE564();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416FD4F8(uint64_t a1)
{
  unint64_t v2 = sub_2416FE510();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416FD534(uint64_t a1)
{
  unint64_t v2 = sub_2416FE510();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416FD570(uint64_t a1)
{
  unint64_t v2 = sub_2416FE468();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416FD5AC(uint64_t a1)
{
  unint64_t v2 = sub_2416FE468();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416FD5E8(uint64_t a1)
{
  unint64_t v2 = sub_2416FE4BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416FD624(uint64_t a1)
{
  unint64_t v2 = sub_2416FE4BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416FD660@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_2416FDD6C(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2416FD68C(void *a1)
{
  return sub_2416FC97C(a1, *v1);
}

uint64_t sub_2416FD6A8()
{
  return sub_2416FCD7C(*v0);
}

uint64_t sub_2416FD6B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2416FE2FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2416FD6D8(uint64_t a1)
{
  unint64_t v2 = sub_2416FD804();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2416FD714(uint64_t a1)
{
  unint64_t v2 = sub_2416FD804();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2416FD750@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2416FD054(a1, a2);
}

uint64_t sub_2416FD768(void *a1)
{
  return sub_2416FCDEC(a1);
}

uint64_t sub_2416FD780(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*a1 != *a2 || (sub_24171E6F8() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = *(void **)&a1[v6];
  uint64_t v8 = *(void **)&a2[v6];

  return sub_2416FD9FC(v7, v8);
}

unint64_t sub_2416FD804()
{
  unint64_t result = qword_26B0189B0;
  if (!qword_26B0189B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0189B0);
  }
  return result;
}

unint64_t sub_2416FD858()
{
  unint64_t result = qword_268D24AE8;
  if (!qword_268D24AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24AE8);
  }
  return result;
}

void sub_2416FD8AC()
{
  if (!qword_26B018A28)
  {
    unint64_t v0 = sub_24171F8E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B018A28);
    }
  }
}

unint64_t sub_2416FD904()
{
  unint64_t result = qword_26B0189A8;
  if (!qword_26B0189A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0189A8);
  }
  return result;
}

uint64_t sub_2416FD958(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24171E708();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2416FD99C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2416FD8AC();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2416FD9FC(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = sub_24171FD88(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_24171FD88() & 1) == 0) {
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

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.CodingKeys()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.CodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.SwitchState()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState;
}

unint64_t sub_2416FDAF0()
{
  unint64_t result = qword_268D24B00;
  if (!qword_268D24B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24B00);
  }
  return result;
}

unint64_t sub_2416FDB48()
{
  unint64_t result = qword_268D24B08;
  if (!qword_268D24B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24B08);
  }
  return result;
}

unint64_t sub_2416FDBA0()
{
  unint64_t result = qword_26B0189C0;
  if (!qword_26B0189C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0189C0);
  }
  return result;
}

unint64_t sub_2416FDBF8()
{
  unint64_t result = qword_26B0189B8;
  if (!qword_26B0189B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0189B8);
  }
  return result;
}

uint64_t sub_2416FDC4C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x64656C6261736964 && a2 == 0xE800000000000000;
  if (v3 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 28271 && a2 == 0xE200000000000000 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 6710895 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24171FD88();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2416FDD6C(uint64_t a1)
{
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E040];
  sub_2416FE5B8(0, &qword_268D24B10, (uint64_t (*)(void))sub_2416FE468, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OffCodingKeys, MEMORY[0x263F8E040]);
  uint64_t v30 = v3;
  uint64_t v28 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v33 = (char *)&v25 - v4;
  sub_2416FE5B8(0, &qword_268D24B18, (uint64_t (*)(void))sub_2416FE4BC, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OnCodingKeys, v2);
  uint64_t v29 = v5;
  uint64_t v27 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v32 = (char *)&v25 - v6;
  sub_2416FE5B8(0, &qword_268D24B20, (uint64_t (*)(void))sub_2416FE510, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.DisabledCodingKeys, v2);
  uint64_t v8 = v7;
  uint64_t v26 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v25 - v9;
  sub_2416FE5B8(0, &qword_268D24B28, (uint64_t (*)(void))sub_2416FE564, (uint64_t)&type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys, v2);
  uint64_t v12 = v11;
  uint64_t v31 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v14 = (char *)&v25 - v13;
  sub_2416E6230((void *)a1, *(void *)(a1 + 24));
  sub_2416FE564();
  uint64_t v15 = v34;
  sub_24171FE08();
  if (v15) {
    goto LABEL_7;
  }
  uint64_t v25 = v8;
  char v16 = v32;
  uint64_t v17 = v33;
  uint64_t v34 = a1;
  uint64_t v18 = v14;
  uint64_t v19 = sub_24171FD18();
  if (*(void *)(v19 + 16) != 1)
  {
    uint64_t v21 = sub_24171FC18();
    swift_allocError();
    uint64_t v23 = v22;
    sub_2416EE6F4();
    *uint64_t v23 = &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState;
    sub_24171FCE8();
    sub_24171FBF8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v18, v12);
    a1 = v34;
LABEL_7:
    sub_2416E2090(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v19 + 32);
  if (*(unsigned char *)(v19 + 32))
  {
    if (a1 == 1)
    {
      char v36 = 1;
      sub_2416FE4BC();
      sub_24171FCD8();
      uint64_t v20 = v31;
      (*(void (**)(char *, uint64_t))(v27 + 8))(v16, v29);
    }
    else
    {
      char v37 = 2;
      sub_2416FE468();
      sub_24171FCD8();
      uint64_t v20 = v31;
      (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v30);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v35 = 0;
    sub_2416FE510();
    sub_24171FCD8();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v25);
    swift_bridgeObjectRelease();
    uint64_t v20 = v31;
  }
  (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v12);
  sub_2416E2090(v34);
  return a1;
}

uint64_t sub_2416FE2FC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7453686374697773 && a2 == 0xEB00000000657461;
  if (v3 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73696C6B63656863 && a2 == 0xEF73757461745374 || (sub_24171FD88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x8000000241724D10)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24171FD88();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_2416FE468()
{
  unint64_t result = qword_26B018978;
  if (!qword_26B018978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018978);
  }
  return result;
}

unint64_t sub_2416FE4BC()
{
  unint64_t result = qword_26B018960;
  if (!qword_26B018960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018960);
  }
  return result;
}

unint64_t sub_2416FE510()
{
  unint64_t result = qword_26B018990;
  if (!qword_26B018990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018990);
  }
  return result;
}

unint64_t sub_2416FE564()
{
  unint64_t result = qword_26B018948;
  if (!qword_26B018948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018948);
  }
  return result;
}

void sub_2416FE5B8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
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

uint64_t _s17MobilityAppPlugin45WalkingSteadinessHealthChecklistSettingsStateV11SwitchStateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s17MobilityAppPlugin45WalkingSteadinessHealthChecklistSettingsStateV11SwitchStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2416FE77CLL);
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

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.CodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.SwitchState.DisabledCodingKeys()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.DisabledCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OnCodingKeys()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OnCodingKeys;
}

ValueMetadata *type metadata accessor for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OffCodingKeys()
{
  return &type metadata for WalkingSteadinessHealthChecklistSettingsState.SwitchState.OffCodingKeys;
}

unint64_t sub_2416FE7E8()
{
  unint64_t result = qword_268D24B30;
  if (!qword_268D24B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24B30);
  }
  return result;
}

unint64_t sub_2416FE840()
{
  unint64_t result = qword_26B018958;
  if (!qword_26B018958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018958);
  }
  return result;
}

unint64_t sub_2416FE898()
{
  unint64_t result = qword_26B018950;
  if (!qword_26B018950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018950);
  }
  return result;
}

unint64_t sub_2416FE8F0()
{
  unint64_t result = qword_26B0189A0;
  if (!qword_26B0189A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0189A0);
  }
  return result;
}

unint64_t sub_2416FE948()
{
  unint64_t result = qword_26B018998;
  if (!qword_26B018998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018998);
  }
  return result;
}

unint64_t sub_2416FE9A0()
{
  unint64_t result = qword_26B018970;
  if (!qword_26B018970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018970);
  }
  return result;
}

unint64_t sub_2416FE9F8()
{
  unint64_t result = qword_26B018968;
  if (!qword_26B018968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018968);
  }
  return result;
}

unint64_t sub_2416FEA50()
{
  unint64_t result = qword_26B018988;
  if (!qword_26B018988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018988);
  }
  return result;
}

unint64_t sub_2416FEAA8()
{
  unint64_t result = qword_26B018980;
  if (!qword_26B018980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018980);
  }
  return result;
}

id sub_2416FEB0C()
{
  return (id)*MEMORY[0x263F45260];
}

id sub_2416FEB1C()
{
  return (id)*MEMORY[0x263F45270];
}

void sub_2416FEB34(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
}

void sub_2416FEB50(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_2416FEB74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F43768];
  uint64_t v3 = sub_24171E7C8();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t sub_2416FEBE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F32898](a1, a2, a3, WitnessTable);
}

uint64_t sub_2416FEC54(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F32890](a1, a2, WitnessTable);
}

uint64_t sub_2416FECC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F32870](a1, a2, a3, WitnessTable);
}

uint64_t sub_2416FED2C(uint64_t a1, uint64_t a2)
{
  return sub_2416FEDC0(&qword_26B0189E8, a2, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessHealthChecklistFeedItemProvider);
}

uint64_t sub_2416FED74()
{
  return sub_2416FEDC0(&qword_26B018A90, 255, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandler);
}

uint64_t sub_2416FEDC0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_2416FEE08()
{
  return sub_2416FEDC0(&qword_26B0183C8, 255, MEMORY[0x263F43778]);
}

uint64_t sub_2416FEE54(uint64_t a1, uint64_t a2)
{
  return sub_2416FEDC0(&qword_26B0189E0, a2, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessHealthChecklistFeedItemProvider);
}

uint64_t sub_2416FEE9C()
{
  return sub_2416FEDC0(&qword_268D24750, 255, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
}

uint64_t sub_2416FEEE8()
{
  return sub_2416FEDC0(&qword_26B018BB8, 255, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData);
}

uint64_t sub_2416FEF34(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_2416FA7F4(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2416FEF84()
{
  sub_2416FF080();
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_241722830;
  *(void *)(inited + 32) = (id)HKMobilityWalkingSteadinessType();
  *(void *)(inited + 40) = (id)HKMobilityWalkingSteadinessEventType();
  sub_24171F8B8();
  if (inited >> 62)
  {
    sub_24171EF98();
    uint64_t v3 = sub_24171FC58();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v2 = MEMORY[0x263F8EE88];
    goto LABEL_6;
  }
  if (!*(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  sub_2416E0AE8(inited, &qword_26B018438, &qword_26B018400, 0x263F0A6E8, &qword_26B018408);
  uint64_t v2 = v1;
LABEL_6:
  uint64_t result = swift_bridgeObjectRelease();
  qword_26B018DC8 = v2;
  return result;
}

void sub_2416FF080()
{
  if (!qword_26B018C40)
  {
    unint64_t v0 = sub_24171FD68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B018C40);
    }
  }
}

uint64_t sub_2416FF0DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_2416FF27C();
    uint64_t v3 = sub_24171FBA8();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unsigned int v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_24171FDC8();
      sub_24171EF98();
      sub_24171F858();
      uint64_t result = sub_24171FDE8();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        char v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_24171FD88(), (result & 1) != 0))
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
            uint64_t result = sub_24171FD88();
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
  return MEMORY[0x263F8EE88];
}

void sub_2416FF27C()
{
  if (!qword_26B018428)
  {
    unint64_t v0 = sub_24171FBB8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B018428);
    }
  }
}

uint64_t type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController()
{
  uint64_t result = qword_26B0183E0;
  if (!qword_26B0183E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2416FF328()
{
  uint64_t result = sub_24171F5C8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2416FF3C0()
{
  uint64_t v1 = sub_24171F818();
  sub_24171EF98();
  sub_24171F868();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2416FF430()
{
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2416FF438(uint64_t *a1))()
{
  uint64_t v4 = sub_24171F818();
  uint64_t v5 = v2;
  sub_24171EF98();
  sub_24171F868();
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v5;
  return sub_2416FF4D4;
}

uint64_t sub_2416FF4D4()
{
  return swift_bridgeObjectRelease();
}

id sub_2416FF4DC(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    sub_24171F818();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a4;
  sub_24171F598();
  if (v7)
  {
    uint64_t v9 = (void *)sub_24171F7D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController();
  id v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, v9, v8);

  return v10;
}

id sub_2416FF5AC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  sub_24171F598();
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, v4);

  return v5;
}

uint64_t sub_2416FF624()
{
  uint64_t v1 = v0 + qword_26B0183D8;
  uint64_t v2 = sub_24171F5C8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

id sub_2416FF690()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2416FF6C8(uint64_t a1)
{
  uint64_t v1 = a1 + qword_26B0183D8;
  uint64_t v2 = sub_24171F5C8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t sub_2416FF734()
{
  return type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController();
}

void sub_2416FF73C(uint64_t a1, void *a2)
{
}

void sub_2416FF768(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_24171F5C8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v59 - v5;
  uint64_t v7 = sub_24171E9D8();
  uint64_t v60 = *(void *)(v7 - 8);
  uint64_t v61 = v7;
  MEMORY[0x270FA5388](v7);
  unint64_t v62 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v64 = (uint64_t)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v65 = (char *)&v59 - v12;
  sub_2417002BC();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24171E828();
  uint64_t v72 = *(void (***)(void, void))(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v70 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24171F4D8();
  uint64_t v68 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = a1;
  id v21 = objc_msgSend(a1, sel_resolvedHealthStore);
  if (v21)
  {
    uint64_t v59 = v18;
    uint64_t v66 = v3;
    uint64_t v67 = v2;
    uint64_t v22 = *MEMORY[0x263F09810];
    BOOL v23 = v21;
    id v24 = objc_allocWithZone(MEMORY[0x263F0A3D0]);
    id v71 = v23;
    id v25 = objc_msgSend(v24, sel_initWithFeatureIdentifier_healthStore_, v22, v23);
    sub_2416FA7F4(0, (unint64_t *)&qword_26B018418);
    id v69 = v25;
    sub_24171F4F8();
    uint64_t v31 = (void *)sub_24171F4E8();
    sub_241706050(v31, (uint64_t)v20, sub_241710098, 0, (uint64_t)v15);

    char v32 = v72;
    if (((unsigned int (*)(char *, uint64_t, uint64_t))v72[6])(v15, 1, v16) == 1)
    {
      sub_241700314((uint64_t)v15, (uint64_t (*)(void))sub_2417002BC);
      sub_24171F598();
      char v33 = sub_24171F5B8();
      os_log_type_t v34 = sub_24171F938();
      if (os_log_type_enabled(v33, v34))
      {
        char v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        uint64_t v75 = v36;
        *(_DWORD *)char v35 = 136446210;
        uint64_t v37 = sub_24171FE48();
        uint64_t v74 = sub_2416E1FBC(v37, v38, &v75);
        sub_24171FB18();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2416DE000, v33, v34, "[%{public}s] Unable to create feature status configuration", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x245623AC0](v36, -1, -1);
        MEMORY[0x245623AC0](v35, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v66 + 8))(v6, v67);
      (*(void (**)(char *, uint64_t))(v68 + 8))(v20, v59);
    }
    else
    {
      ((void (*)(char *, char *, uint64_t))v32[4])(v70, v15, v16);
      uint64_t v40 = v65;
      sub_2417079B8(v65);
      uint64_t v41 = sub_24171F5B8();
      os_log_type_t v42 = sub_24171F958();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = swift_slowAlloc();
        uint64_t v44 = swift_slowAlloc();
        uint64_t v75 = v44;
        *(_DWORD *)uint64_t v43 = 136315394;
        uint64_t v45 = sub_24171FE48();
        uint64_t v74 = sub_2416E1FBC(v45, v46, &v75);
        sub_24171FB18();
        swift_bridgeObjectRelease();
        *(_WORD *)(v43 + 12) = 2080;
        uint64_t v74 = sub_2416E1FBC(0xD000000000000014, 0x8000000241724E20, &v75);
        sub_24171FB18();
        _os_log_impl(&dword_2416DE000, v41, v42, "[%s.%s]: Presenting walking steadiness settings view", (uint8_t *)v43, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x245623AC0](v44, -1, -1);
        MEMORY[0x245623AC0](v43, -1, -1);
      }

      uint64_t v48 = v68;
      id v47 = v69;
      uint64_t v50 = (uint64_t)v62;
      uint64_t v49 = v63;
      uint64_t v52 = v60;
      uint64_t v51 = v61;
      uint64_t v53 = (uint64_t)v40;
      uint64_t v54 = (uint64_t)v40;
      uint64_t v55 = v64;
      sub_2416FA090(v53, v64);
      (*(void (**)(uint64_t, void, uint64_t))(v52 + 104))(v50, *MEMORY[0x263F43A78], v51);
      id v56 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessFeatureStatusViewController(0));
      id v57 = v71;
      id v58 = sub_2416F9C10(v55, v57, v50);
      objc_msgSend(v49, sel_showViewController_sender_, v58, 0);

      sub_241700314(v54, (uint64_t (*)(void))type metadata accessor for WalkingSteadinessHealthChecklistSettingsState);
      ((void (**)(char *, uint64_t))v72)[1](v70, v16);
      (*(void (**)(char *, uint64_t))(v48 + 8))(v20, v59);
    }
  }
  else
  {
    uint64_t v72 = (void (**)(void, void))sub_24171F5B8();
    os_log_type_t v26 = sub_24171F938();
    if (os_log_type_enabled((os_log_t)v72, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v75 = v28;
      *(_DWORD *)uint64_t v27 = 136315394;
      uint64_t v29 = sub_24171FE48();
      uint64_t v74 = sub_2416E1FBC(v29, v30, &v75);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      uint64_t v74 = sub_2416E1FBC(0xD000000000000014, 0x8000000241724E20, &v75);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, (os_log_t)v72, v26, "[%s.%s] No available health store for walking steadiness settings view", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v28, -1, -1);
      MEMORY[0x245623AC0](v27, -1, -1);
    }
    else
    {
      id v39 = v72;
    }
  }
}

void sub_2417002BC()
{
  if (!qword_26B018C50)
  {
    sub_24171E828();
    unint64_t v0 = sub_24171FB08();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B018C50);
    }
  }
}

uint64_t sub_241700314(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *WalkingSteadinessOnboardingViewController.__allocating_init(healthStore:healthExperienceStore:pinnedContentManager:navigateToDetailRoomUponOnboardingCompletion:presentation:)(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  return WalkingSteadinessOnboardingViewController.init(healthStore:healthExperienceStore:pinnedContentManager:navigateToDetailRoomUponOnboardingCompletion:presentation:)(a1, a2, a3, a4, a5);
}

uint64_t sub_2417003D8()
{
  uint64_t v0 = sub_24171F5C8();
  sub_2416E7068(v0, qword_268D24B38);
  sub_2416E70CC(v0, (uint64_t)qword_268D24B38);
  return sub_24171F598();
}

void *WalkingSteadinessOnboardingViewController.coordinator.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_coordinator);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void WalkingSteadinessOnboardingViewController.coordinator.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_coordinator);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*WalkingSteadinessOnboardingViewController.coordinator.modify())()
{
  return j__swift_endAccess;
}

char *WalkingSteadinessOnboardingViewController.init(healthStore:healthExperienceStore:pinnedContentManager:navigateToDetailRoomUponOnboardingCompletion:presentation:)(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v6 = v5;
  swift_getObjectType();
  *(void *)&v6[OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_coordinator] = 0;
  v6[OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_navigateToDetailRoomUponOnboardingCompletion] = a4;
  v30[3] = sub_2416FA7F4(0, &qword_268D24B60);
  v30[4] = MEMORY[0x263F452F8];
  v30[0] = a1;
  sub_24171E8D8();
  swift_allocObject();
  id v11 = a1;
  sub_24171E8C8();
  sub_24171E8F8();
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A3D0]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x263F09810], v11);
  swift_retain();
  sub_24171E8E8();
  v29.receiver = v6;
  v29.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingViewController();
  id v12 = objc_msgSendSuper2(&v29, sel_initWithNibName_bundle_, 0, 0);
  sub_2416EBD70(a2, (uint64_t)v30);
  sub_2416EBD70(a3, (uint64_t)v28);
  sub_24171E958();
  swift_allocObject();
  id v13 = v11;
  swift_retain();
  uint64_t v14 = (char *)v12;
  swift_retain();
  sub_24171E948();
  objc_msgSend(v14, sel_setModalPresentationStyle_, 2);
  sub_24170221C(&qword_268D24B68, v15, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessOnboardingViewController);
  id v16 = v13;
  swift_retain();
  sub_24171E7D8();
  id v17 = objc_allocWithZone((Class)sub_24171E938());
  sub_24171E928();
  sub_24170221C(&qword_268D24B70, v18, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessOnboardingViewController);
  id v19 = objc_allocWithZone((Class)sub_24171E918());
  uint64_t v20 = sub_24171E908();
  swift_release();

  uint64_t v21 = sub_24171EBB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(a5, v21);
  sub_2416E2090(a3);
  sub_2416E2090(a2);
  uint64_t v22 = (void **)&v14[OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_coordinator];
  swift_beginAccess();
  BOOL v23 = *v22;
  *uint64_t v22 = (void *)v20;

  return v14;
}

uint64_t WalkingSteadinessOnboardingViewController.dismiss(dueToCompletion:deepLinkUrlToUse:completion:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v60 = (void *)a2;
  swift_getObjectType();
  sub_241701B7C();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24171E208();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v4;
  v15[3] = a3;
  v15[4] = a4;
  if ((a1 & 1) == 0
    || *((unsigned char *)v4
       + OBJC_IVAR____TtC17MobilityAppPlugin41WalkingSteadinessOnboardingViewController_navigateToDetailRoomUponOnboardingCompletion) != 1)
  {
    sub_241701C28(a3);
    uint64_t v34 = qword_268D24548;
    id v35 = v4;
    if (v34 != -1) {
      swift_once();
    }
    uint64_t v36 = sub_24171F5C8();
    sub_2416E70CC(v36, (uint64_t)qword_268D24B38);
    uint64_t v37 = sub_24171F5B8();
    os_log_type_t v38 = sub_24171F958();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v60 = v15;
      id v41 = v35;
      uint64_t v42 = a4;
      uint64_t v43 = v40;
      uint64_t aBlock = v40;
      *(_DWORD *)uint64_t v39 = 136446466;
      uint64_t v44 = sub_24171FE48();
      uint64_t v61 = sub_2416E1FBC(v44, v45, &aBlock);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2082;
      uint64_t v61 = sub_2416E1FBC(0xD000000000000035, 0x8000000241724E80, &aBlock);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v37, v38, "[%{public}s.%{public}s]: Dismissing onboarding and landing back where user was before", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      uint64_t v46 = v43;
      a4 = v42;
      id v35 = v41;
      MEMORY[0x245623AC0](v46, -1, -1);
      MEMORY[0x245623AC0](v39, -1, -1);
    }

    if (a3)
    {
      uint64_t v66 = (uint64_t (*)())a3;
      uint64_t v67 = a4;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v63 = 1107296256;
      uint64_t v64 = sub_2416F9734;
      uint64_t v65 = &unk_26F594860;
      char v33 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
    }
    else
    {
      char v33 = 0;
    }
    objc_msgSend(v35, sel_dismissViewControllerAnimated_completion_, 1, v33);
    goto LABEL_20;
  }
  uint64_t v59 = a4;
  sub_241701C28(a3);
  uint64_t v16 = qword_268D24548;
  id v58 = v4;
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_24171F5C8();
  uint64_t v18 = sub_2416E70CC(v17, (uint64_t)qword_268D24B38);
  id v19 = sub_24171F5B8();
  os_log_type_t v20 = sub_24171F958();
  int v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v56 = v18;
    int v54 = v21;
    uint64_t v23 = v22;
    uint64_t v55 = swift_slowAlloc();
    uint64_t aBlock = v55;
    *(_DWORD *)uint64_t v23 = 136446466;
    v53[1] = v23 + 4;
    uint64_t v24 = sub_24171FE48();
    uint64_t v61 = sub_2416E1FBC(v24, v25, &aBlock);
    uint64_t v57 = v12;
    sub_24171FB18();
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2082;
    uint64_t v61 = sub_2416E1FBC(0xD000000000000035, 0x8000000241724E80, &aBlock);
    uint64_t v12 = v57;
    sub_24171FB18();
    _os_log_impl(&dword_2416DE000, v19, (os_log_type_t)v54, "[%{public}s.%{public}s]: Dismissing onboarding and navigating to Walking Steadiness detail room", (uint8_t *)v23, 0x16u);
    uint64_t v26 = v55;
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v26, -1, -1);
    MEMORY[0x245623AC0](v23, -1, -1);
  }

  sub_241702058((uint64_t)v60, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_2417020BC((uint64_t)v10);
    uint64_t v27 = sub_24171F5B8();
    os_log_type_t v28 = sub_24171F948();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t aBlock = v30;
      *(_DWORD *)uint64_t v29 = 136446466;
      uint64_t v31 = sub_24171FE48();
      uint64_t v61 = sub_2416E1FBC(v31, v32, &aBlock);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2082;
      uint64_t v61 = sub_2416E1FBC(0xD000000000000035, 0x8000000241724E80, &aBlock);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v27, v28, "[%{public}s.%{public}s]: Failed to construct deep link URL to go to detail room after onboarding completed", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v30, -1, -1);
      MEMORY[0x245623AC0](v29, -1, -1);
    }

    if (a3)
    {
      uint64_t v66 = (uint64_t (*)())a3;
      uint64_t v67 = v59;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v63 = 1107296256;
      uint64_t v64 = sub_2416F9734;
      uint64_t v65 = &unk_26F594888;
      char v33 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
    }
    else
    {
      char v33 = 0;
    }
    objc_msgSend(v58, sel_dismissViewControllerAnimated_completion_, 1, v33);
LABEL_20:
    _Block_release(v33);
    return swift_release();
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  id v48 = objc_msgSend(self, sel_sharedApplication);
  uint64_t v49 = (void *)sub_24171E1E8();
  sub_2417013B0(MEMORY[0x263F8EE78], (void (*)(void))sub_24170236C, &qword_268D24B98, type metadata accessor for OpenExternalURLOptionsKey, (uint64_t (*)(uint64_t))sub_2417145A0);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_24170221C(&qword_268D24640, 255, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v50 = (void *)sub_24171F7A8();
  swift_bridgeObjectRelease();
  uint64_t v51 = swift_allocObject();
  *(void *)(v51 + 16) = sub_241701C1C;
  *(void *)(v51 + 24) = v15;
  uint64_t v66 = sub_241702150;
  uint64_t v67 = v51;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v63 = 1107296256;
  uint64_t v64 = sub_2416EFD88;
  uint64_t v65 = &unk_26F5948D8;
  uint64_t v52 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v48, sel_openURL_options_completionHandler_, v49, v50, v52);
  _Block_release(v52);
  swift_release();

  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

void sub_241701258(void *a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    v5[4] = a2;
    v5[5] = a3;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 1107296256;
    v5[2] = sub_2416F9734;
    v5[3] = &unk_26F594950;
    uint64_t v4 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  objc_msgSend(a1, sel_dismissViewControllerAnimated_completion_, 1, v4);
  _Block_release(v4);
}

unint64_t sub_241701320(uint64_t a1)
{
  return sub_2417013B0(a1, (void (*)(void))sub_24170236C, &qword_268D24B98, type metadata accessor for OpenExternalURLOptionsKey, (uint64_t (*)(uint64_t))sub_2417145A0);
}

unint64_t sub_241701368(uint64_t a1)
{
  return sub_2417013B0(a1, (void (*)(void))sub_241702178, (unint64_t *)&qword_268D24B80, type metadata accessor for Key, (uint64_t (*)(uint64_t))sub_2417145A0);
}

unint64_t sub_2417013B0(uint64_t a1, void (*a2)(void), unint64_t *a3, void (*a4)(uint64_t), uint64_t (*a5)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  a2(0);
  uint64_t v9 = sub_24171FC88();
  uint64_t v10 = (void *)v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (!v11)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v10;
  }
  uint64_t v12 = v9 + 64;
  uint64_t v13 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_241702264(v13, (uint64_t)&v20, a3, a4);
    uint64_t v14 = v20;
    unint64_t result = a5(v20);
    if (v16) {
      break;
    }
    *(void *)(v12 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v10[6] + 8 * result) = v14;
    unint64_t result = (unint64_t)sub_2417022D0(&v21, (_OWORD *)(v10[7] + 32 * result));
    uint64_t v17 = v10[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v10[2] = v19;
    v13 += 40;
    if (!--v11)
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

id WalkingSteadinessOnboardingViewController.__allocating_init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t ObjCClassFromMetadata = 0;
  if (a2) {
LABEL_3:
  }
    uint64_t v3 = swift_getObjCClassFromMetadata();
LABEL_4:
  id v5 = objc_allocWithZone(v2);

  return objc_msgSend(v5, sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
}

void WalkingSteadinessOnboardingViewController.init(navigationBarClass:toolbarClass:)()
{
}

id WalkingSteadinessOnboardingViewController.__allocating_init(rootViewController:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithRootViewController_, a1);

  return v3;
}

void WalkingSteadinessOnboardingViewController.init(rootViewController:)()
{
}

id WalkingSteadinessOnboardingViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_24171F7D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void WalkingSteadinessOnboardingViewController.init(nibName:bundle:)()
{
}

id WalkingSteadinessOnboardingViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessOnboardingViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_241701794()
{
  id v1 = objc_msgSend(v0, sel_presentationController);

  return v1;
}

void sub_2417017CC(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    v8[4] = a3;
    v8[5] = a4;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    v8[2] = sub_2416F9734;
    v8[3] = &unk_26F594928;
    id v7 = _Block_copy(v8);
    swift_retain();
    swift_release();
  }
  else
  {
    id v7 = 0;
  }
  objc_msgSend(v4, sel_presentViewController_animated_completion_, a1, a2 & 1, v7);
  _Block_release(v7);
}

void sub_2417018A4(uint64_t a1, char a2)
{
  sub_2416FA7F4(0, &qword_268D24B88);
  id v4 = (id)sub_24171F898();
  objc_msgSend(v2, sel_setViewControllers_animated_, v4, a2 & 1);
}

uint64_t sub_241701930(uint64_t a1, uint64_t a2)
{
  sub_2417022E0(a2, (uint64_t)v11);
  uint64_t v4 = v12;
  if (v12)
  {
    id v5 = sub_2416E6230(v11, v12);
    uint64_t v6 = *(void *)(v4 - 8);
    MEMORY[0x270FA5388](v5);
    uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v6 + 16))(v8);
    uint64_t v9 = sub_24171FD78();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
    sub_2416E2090((uint64_t)v11);
  }
  else
  {
    uint64_t v9 = 0;
  }
  objc_msgSend(v2, sel_showViewController_sender_, a1, v9);
  return sub_24171F2D8();
}

void sub_241701A84(char a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    v6[4] = a2;
    v6[5] = a3;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 1107296256;
    v6[2] = sub_2416F9734;
    v6[3] = &unk_26F594900;
    id v5 = _Block_copy(v6);
    swift_retain();
    swift_release();
  }
  else
  {
    id v5 = 0;
  }
  objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, a1 & 1, v5);
  _Block_release(v5);
}

uint64_t type metadata accessor for WalkingSteadinessOnboardingViewController()
{
  return self;
}

void sub_241701B7C()
{
  if (!qword_26B018C48)
  {
    sub_24171E208();
    unint64_t v0 = sub_24171FB08();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B018C48);
    }
  }
}

uint64_t sub_241701BD4()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_241701C1C()
{
  sub_241701258(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_241701C28(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_241701C38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_241701C48()
{
  return swift_release();
}

uint64_t sub_241701C50(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_241701CE8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_241701EE8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_241701EE8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_241701CE8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_241701E60(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24171FBD8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24171FC38();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24171F878();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24171FCA8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24171FC38();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_241701E60(uint64_t a1, uint64_t a2)
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
  sub_241702478(0, qword_26B018458, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_241701EE8(char a1, int64_t a2, char a3, char *a4)
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
    sub_241702478(0, qword_26B018458, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_24171FCA8();
  __break(1u);
  return result;
}

uint64_t sub_241702058(uint64_t a1, uint64_t a2)
{
  sub_241701B7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2417020BC(uint64_t a1)
{
  sub_241701B7C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_241702118()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_241702150()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_241702178()
{
  if (!qword_268D24B78)
  {
    type metadata accessor for Key(255);
    sub_24170221C(&qword_268D24710, 255, type metadata accessor for Key);
    unint64_t v0 = sub_24171FC98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24B78);
    }
  }
}

uint64_t sub_24170221C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_241702264(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_241702410(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

_OWORD *sub_2417022D0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2417022E0(uint64_t a1, uint64_t a2)
{
  sub_241702478(0, &qword_26B018CB8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_24170236C()
{
  if (!qword_268D24B90)
  {
    type metadata accessor for OpenExternalURLOptionsKey(255);
    sub_24170221C(&qword_268D24640, 255, type metadata accessor for OpenExternalURLOptionsKey);
    unint64_t v0 = sub_24171FC98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24B90);
    }
  }
}

void sub_241702410(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v5) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

void sub_241702478(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_2417024EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v43 = *v1;
  sub_241704DD4(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = (char *)&v39 - v4;
  uint64_t v6 = sub_24171E728();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v44 = sub_24171E878();
  MEMORY[0x270FA5388](v44);
  int64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24171F5C8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v39 - v14;
  char v16 = (void *)sub_24171F4E8();
  unsigned int v17 = objc_msgSend(v16, sel_areAllRequirementsSatisfied);

  if (v17)
  {
    sub_24171F588();
    BOOL v18 = sub_24171F5B8();
    os_log_type_t v19 = sub_24171F958();
    BOOL v20 = os_log_type_enabled(v18, v19);
    uint64_t v41 = a1;
    uint64_t v42 = v8;
    if (v20)
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v46 = v40;
      *(_DWORD *)uint64_t v21 = 136446466;
      uint64_t v22 = sub_24171FE48();
      uint64_t v45 = sub_2416E1FBC(v22, v23, &v46);
      uint64_t v43 = v9;
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2082;
      uint64_t v45 = sub_2416E1FBC(0xD000000000000017, 0x80000002417252D0, &v46);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v18, v19, "[%{public}s.%{public}s]: Creating walking steadiness promo tile configuration", (uint8_t *)v21, 0x16u);
      uint64_t v24 = v40;
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v24, -1, -1);
      MEMORY[0x245623AC0](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v43);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    }
    uint64_t v43 = sub_24171F818();
    uint64_t v40 = v31;
    sub_2416FA7F4(0, (unint64_t *)&qword_26B018420);
    sub_24171FAB8();
    sub_24171E718();
    sub_24171E868();
    swift_storeEnumTagMultiPayload();
    uint64_t v32 = sub_24171E288();
    char v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56);
    v33(v5, 1, 1, v32);
    if (qword_26B018CB0 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_24171E8B8();
    sub_2416E70CC(v34, (uint64_t)qword_26B018E08);
    uint64_t v44 = sub_24171E9B8();
    sub_2416FC1F8((uint64_t)v5);
    v33(v5, 1, 1, v32);
    sub_24171E9B8();
    sub_2416FC1F8((uint64_t)v5);
    v33(v5, 1, 1, v32);
    sub_24171E9B8();
    sub_2416FC1F8((uint64_t)v5);
    uint64_t v35 = v41;
    sub_24171E858();
    uint64_t v36 = sub_24171E888();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 0, 1, v36);
  }
  else
  {
    sub_24171F588();
    unint64_t v25 = sub_24171F5B8();
    os_log_type_t v26 = sub_24171F958();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v46 = v28;
      *(_DWORD *)uint64_t v27 = 136446466;
      uint64_t v29 = sub_24171FE48();
      uint64_t v43 = v9;
      uint64_t v45 = sub_2416E1FBC(v29, v30, &v46);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2082;
      uint64_t v45 = sub_2416E1FBC(0xD000000000000017, 0x80000002417252D0, &v46);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v25, v26, "[%{public}s.%{public}s]: Onboarding promotion context not satisfied, no promotion tile", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v28, -1, -1);
      MEMORY[0x245623AC0](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v43);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    uint64_t v38 = sub_24171E888();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(a1, 1, 1, v38);
  }
}

uint64_t sub_241702D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v72 = *v3;
  uint64_t v77 = sub_24171F5C8();
  uint64_t v7 = *(void *)(v77 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v77);
  id v71 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v63 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v63 - v13;
  uint64_t v15 = sub_24171E4D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(a3, a1, v15);
  if (qword_26B0183D0 != -1) {
    swift_once();
  }
  sub_2416FA7F4(0, &qword_26B018400);
  uint64_t v16 = sub_24171F908();
  uint64_t v68 = a3;
  unsigned int v17 = (void (*)(uint64_t *, void))sub_24171E4A8();
  sub_241703588(v16);
  v17(v79, 0);
  BOOL v18 = (void *)sub_24171F4E8();
  unsigned int v19 = objc_msgSend(v18, sel_areAllRequirementsSatisfied);

  sub_24171F588();
  BOOL v20 = sub_24171F5B8();
  os_log_type_t v21 = sub_24171F958();
  if (!os_log_type_enabled(v20, v21))
  {

    uint64_t v76 = *(void (**)(char *, uint64_t))(v7 + 8);
    v76(v14, v77);
    if (v19) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint64_t v22 = swift_slowAlloc();
  uint64_t v75 = a2;
  uint64_t v23 = v22;
  uint64_t v24 = swift_slowAlloc();
  v79[0] = v24;
  *(_DWORD *)uint64_t v23 = 136446722;
  uint64_t v25 = sub_24171FE48();
  uint64_t v78 = sub_2416E1FBC(v25, v26, v79);
  LODWORD(v74) = v19;
  sub_24171FB18();
  swift_bridgeObjectRelease();
  *(_WORD *)(v23 + 12) = 2082;
  uint64_t v78 = sub_2416E1FBC(0xD000000000000026, 0x80000002417252A0, v79);
  sub_24171FB18();
  *(_WORD *)(v23 + 22) = 1024;
  char v27 = v74;
  LODWORD(v78) = v74;
  sub_24171FB18();
  _os_log_impl(&dword_2416DE000, v20, v21, "[%{public}s.%{public}s]: Setting hide from discover to %{BOOL}d given promotion requirements", (uint8_t *)v23, 0x1Cu);
  swift_arrayDestroy();
  MEMORY[0x245623AC0](v24, -1, -1);
  MEMORY[0x245623AC0](v23, -1, -1);

  uint64_t v76 = *(void (**)(char *, uint64_t))(v7 + 8);
  v76(v14, v77);
  if ((v27 & 1) == 0) {
LABEL_7:
  }
    sub_24171E458();
LABEL_8:
  uint64_t v28 = (void *)sub_24171F4E8();
  id v29 = objc_msgSend(v28, sel_unsatisfiedRequirementIdentifiers);

  type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(0);
  uint64_t v30 = sub_24171F8A8();

  uint64_t v64 = v30;
  uint64_t v32 = *(void *)(v30 + 16);
  if (v32)
  {
    char v33 = (void **)(v64 + 32);
    uint64_t v34 = *MEMORY[0x263F09698];
    uint64_t v74 = v7 + 8;
    uint64_t v75 = v34;
    *(void *)&long long v31 = 136446722;
    long long v67 = v31;
    unint64_t v70 = (unint64_t)"SetUpWalkingSteadiness";
    unint64_t v66 = 0x80000002417252A0;
    uint64_t v65 = MEMORY[0x263F8EE58] + 8;
    *(void *)&long long v31 = 136446466;
    long long v69 = v31;
    uint64_t v73 = 0x8000000241723A10;
    while (1)
    {
      uint64_t v36 = *v33;
      uint64_t v37 = sub_24171F818();
      uint64_t v39 = v38;
      if (v37 == sub_24171F818() && v39 == v40) {
        break;
      }
      char v42 = sub_24171FD88();
      id v43 = v36;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v42) {
        goto LABEL_20;
      }
      uint64_t v44 = v71;
      sub_24171F588();
      id v45 = v43;
      uint64_t v46 = sub_24171F5B8();
      os_log_type_t v47 = sub_24171F948();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        v79[0] = v49;
        *(_DWORD *)uint64_t v48 = v67;
        uint64_t v50 = sub_24171FE48();
        *(void *)(v48 + 4) = sub_2416E1FBC(v50, v51, v79);
        swift_bridgeObjectRelease();
        *(_WORD *)(v48 + 12) = 2082;
        *(void *)(v48 + 14) = sub_2416E1FBC(0xD000000000000026, v66, v79);
        *(_WORD *)(v48 + 22) = 2080;
        uint64_t v52 = sub_24171F818();
        *(void *)(v48 + 24) = sub_2416E1FBC(v52, v53, v79);

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2416DE000, v46, v47, "[%{public}s.%{public}s]: Unaccounted feature tag with identifier: %s", (uint8_t *)v48, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x245623AC0](v49, -1, -1);
        MEMORY[0x245623AC0](v48, -1, -1);

        int v54 = v71;
      }
      else
      {

        int v54 = v44;
      }
      v76(v54, v77);
LABEL_11:
      ++v33;
      if (!--v32) {
        return swift_bridgeObjectRelease();
      }
    }
    id v55 = v36;
    swift_bridgeObjectRelease_n();
LABEL_20:
    sub_24171F588();
    uint64_t v56 = sub_24171F5B8();
    os_log_type_t v57 = sub_24171F958();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      v79[0] = v59;
      *(_DWORD *)uint64_t v58 = v69;
      uint64_t v60 = sub_24171FE48();
      *(void *)(v58 + 4) = sub_2416E1FBC(v60, v61, v79);
      swift_bridgeObjectRelease();
      *(_WORD *)(v58 + 12) = 2082;
      *(void *)(v58 + 14) = sub_2416E1FBC(0xD000000000000026, v70 | 0x8000000000000000, v79);
      _os_log_impl(&dword_2416DE000, v56, v57, "[%{public}s.%{public}s]: Setting HeightNotAvailable feature tag", (uint8_t *)v58, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v59, -1, -1);
      MEMORY[0x245623AC0](v58, -1, -1);
    }

    v76(v12, v77);
    uint64_t v35 = (void (*)(uint64_t *, void))sub_24171E4A8();
    sub_241704350(&v78, 0xD000000000000023, v73);
    swift_bridgeObjectRelease();
    v35(v79, 0);

    goto LABEL_11;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_241703588(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    uint64_t v10 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v9);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    sub_24171EF98();
    sub_241704350(&v16, v11, v12);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 < v7)
  {
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v2 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v15;
    goto LABEL_22;
  }
LABEL_23:

  return swift_release();
}

uint64_t type metadata accessor for WalkingSteadinessPromotionActionHandler()
{
  uint64_t result = qword_26B018930;
  if (!qword_26B018930) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_241703754()
{
  return swift_initClassMetadata2();
}

uint64_t sub_241703794@<X0>(uint64_t a1@<X8>)
{
  return sub_2417024EC(a1);
}

void sub_2417037BC(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_2417037CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_241702D1C(a1, a2, a3);
}

uint64_t sub_2417037F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F34870](a1, a2, a3, WitnessTable);
}

unint64_t sub_24170385C()
{
  return 0xD000000000000016;
}

void sub_241703878()
{
  uint64_t v1 = sub_24171EBB8();
  int64_t v2 = *(unsigned __int8 **)(v1 - 8);
  uint64_t v59 = v1 - 8;
  uint64_t v60 = v2;
  unint64_t v61 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  int v54 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  unint64_t v62 = (char *)&v48 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v63 = (char *)&v48 - v7;
  uint64_t v8 = sub_24171F218();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v53 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v56 = (char *)&v48 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v48 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  unsigned int v19 = (char *)&v48 - v18;
  MEMORY[0x270FA5388](v17);
  os_log_type_t v21 = (char *)&v48 - v20;
  sub_24171F328();
  sub_24171F1E8();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v21, v8);
  sub_2416E6230(v69, v69[3]);
  id v55 = (void *)sub_24171F1A8();
  uint64_t v57 = v0;
  sub_24171F328();
  uint64_t v23 = (void *)sub_24171F1F8();
  uint64_t v58 = v9 + 8;
  v22(v19, v8);
  sub_24171F9A8();

  sub_24171F328();
  sub_24171F1E8();
  v22(v16, v8);
  sub_2416E6230(v67, v67[3]);
  sub_24171F1C8();
  sub_241704DD4(0, &qword_268D24BA0, MEMORY[0x263F43C08], MEMORY[0x263F8E0F8]);
  uint64_t v24 = *((void *)v60 + 9);
  uint64_t v25 = v61;
  unint64_t v26 = (v61[80] + 32) & ~(unint64_t)v61[80];
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_241721DB0;
  unint64_t v50 = v26;
  uint64_t v28 = (void (*)(unint64_t, void, uint64_t))*((void *)v25 + 13);
  v28(v27 + v26, *MEMORY[0x263F43BA0], v1);
  uint64_t v59 = v24;
  v28(v27 + v26 + v24, *MEMORY[0x263F43BF8], v1);
  v28(v27 + v26 + 2 * v24, *MEMORY[0x263F43BE0], v1);
  id v29 = v56;
  sub_24171F328();
  sub_24171F1E8();
  uint64_t v56 = (char *)v22;
  v22(v29, v8);
  sub_2416E6230(v64, v65);
  uint64_t v30 = v27;
  sub_24171F1B8();
  uint64_t v60 = *(unsigned __int8 **)(v27 + 16);
  if (!v60)
  {
    char v35 = 0;
    uint64_t v36 = (uint64_t)v54;
    uint64_t v37 = v53;
    (*((void (**)(char *, uint64_t))v25 + 1))(v63, v1);
LABEL_16:
    swift_bridgeObjectRelease();
    sub_2416E2090((uint64_t)v64);
    sub_24171F328();
    sub_24171F1E8();
    uint64_t v44 = (void (*)(char *, uint64_t))v56;
    ((void (*)(char *, uint64_t))v56)(v37, v8);
    sub_2416E6230(v64, v65);
    sub_24171F1B8();
    id v45 = objc_allocWithZone((Class)type metadata accessor for WalkingSteadinessOnboardingViewController());
    uint64_t v46 = WalkingSteadinessOnboardingViewController.init(healthStore:healthExperienceStore:pinnedContentManager:navigateToDetailRoomUponOnboardingCompletion:presentation:)(v55, (uint64_t)v68, (uint64_t)v66, v35, v36);
    sub_2416E2090((uint64_t)v64);
    sub_2416E2090((uint64_t)v67);
    sub_2416E2090((uint64_t)v69);
    sub_24171F328();
    os_log_type_t v47 = (void *)sub_24171F1F8();
    v44(v37, v8);
    objc_msgSend(v47, sel_presentViewController_animated_completion_, v46, 1, 0);

    return;
  }
  uint64_t v52 = v8;
  long long v31 = (void (*)(char *, unint64_t, uint64_t))*((void *)v25 + 2);
  uint64_t v32 = v62;
  v31(v62, v27 + v26, v1);
  sub_241704308(&qword_268D24BA8, 255, MEMORY[0x263F43C08]);
  char v33 = sub_24171F7C8();
  uint64_t v34 = (unsigned __int8 *)*((void *)v25 + 1);
  uint64_t v51 = (unint64_t)(v25 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  sub_24171EF98();
  unint64_t v61 = v34;
  ((void (*)(char *, uint64_t))v34)(v32, v1);
  if (v33)
  {
    swift_bridgeObjectRelease();
    char v35 = 1;
    goto LABEL_7;
  }
  uint64_t v49 = v30;
  if (v60 == (unsigned __int8 *)1)
  {
    swift_bridgeObjectRelease();
    char v35 = 0;
LABEL_7:
    uint64_t v8 = v52;
    uint64_t v36 = (uint64_t)v54;
    uint64_t v37 = v53;
LABEL_15:
    ((void (*)(char *, uint64_t))v61)(v63, v1);
    goto LABEL_16;
  }
  uint64_t v38 = v31;
  unint64_t v39 = v49 + v59 + v50;
  uint64_t v40 = 1;
  uint64_t v41 = v62;
  while (1)
  {
    v38(v41, v39, v1);
    uint64_t v42 = v40 + 1;
    if (__OFADD__(v40, 1)) {
      break;
    }
    char v43 = sub_24171F7C8();
    ((void (*)(char *, uint64_t))v61)(v41, v1);
    if (v43)
    {
      swift_bridgeObjectRelease();
      char v35 = 1;
      goto LABEL_14;
    }
    ++v40;
    v39 += v59;
    if ((unsigned __int8 *)v42 == v60)
    {
      swift_bridgeObjectRelease();
      char v35 = 0;
LABEL_14:
      uint64_t v8 = v52;
      uint64_t v36 = (uint64_t)v54;
      uint64_t v37 = v53;
      goto LABEL_15;
    }
  }
  __break(1u);
}

uint64_t sub_2417040C4(uint64_t a1)
{
  uint64_t v3 = sub_24171F218();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v8 = sub_24171F338();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

id sub_2417041C4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WalkingSteadinessPromotionActionHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2417041FC()
{
  return type metadata accessor for WalkingSteadinessPromotionActionHandler();
}

uint64_t sub_241704204()
{
  return sub_241704308(&qword_26B018A20, 255, MEMORY[0x263F43E20]);
}

uint64_t sub_241704250()
{
  return sub_241704308(&qword_26B018928, 255, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessPromotionActionHandler);
}

uint64_t sub_2417042A8(uint64_t a1, uint64_t a2)
{
  return sub_241704308(&qword_26B018940, a2, (void (*)(uint64_t))type metadata accessor for WalkingSteadinessPromotionFeedItemProvider);
}

uint64_t sub_2417042F0()
{
  return MEMORY[0x263F8D6F8];
}

uint64_t sub_2417042FC()
{
  return MEMORY[0x263F8D6D0];
}

uint64_t sub_241704308(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_241704350(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24171FDC8();
  sub_24171EF98();
  sub_24171F858();
  uint64_t v8 = sub_24171FDE8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24171FD88() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      sub_24171EF98();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24171FD88() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_24171EF98();
  sub_2417047DC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_241704500()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2416FF27C();
  uint64_t v3 = sub_24171FB98();
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
                  *uint64_t v30 = -1 << v29;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24171FDC8();
      sub_24171F858();
      uint64_t result = sub_24171FDE8();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2417047DC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_241704500();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_241704978();
      goto LABEL_22;
    }
    sub_241704B28();
  }
  uint64_t v11 = *v4;
  sub_24171FDC8();
  sub_24171F858();
  uint64_t result = sub_24171FDE8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24171FD88(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24171FD98();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24171FD88();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_241704978()
{
  uint64_t v1 = v0;
  sub_2416FF27C();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24171FB88();
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)sub_24171EF98();
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

uint64_t sub_241704B28()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2416FF27C();
  uint64_t v3 = sub_24171FB98();
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24171FDC8();
    sub_24171EF98();
    sub_24171F858();
    uint64_t result = sub_24171FDE8();
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
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
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

void sub_241704DD4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

ValueMetadata *_s43WalkingSteadinessChartOrOnboardingComponentVMa()
{
  return &_s43WalkingSteadinessChartOrOnboardingComponentVN;
}

uint64_t sub_241704E48(uint64_t a1, void *a2)
{
  uint64_t v28 = a2;
  uint64_t v3 = sub_24171F058();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24171F148();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24171F138();
  uint64_t v11 = sub_24171ECD8();
  uint64_t v13 = v12;
  if (v11 == sub_24171ECD8() && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
LABEL_12:
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v22 = v28;
    goto LABEL_13;
  }
  char v15 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  if (v15) {
    goto LABEL_12;
  }
  sub_24171F138();
  uint64_t v16 = sub_24171ECD8();
  uint64_t v18 = v17;
  if (v16 == sub_24171ECD8() && v18 == v19)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  char v21 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v22 = v28;
  if (v21)
  {
LABEL_13:
    id v25 = v22;
    sub_24171F048();
    uint64_t v24 = sub_24171F038();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return v24;
  }
  sub_2417052A4();
  unint64_t v23 = (void *)sub_24171F128();
  sub_24170577C(v22);

  sub_241705B04();
  swift_allocObject();
  uint64_t v24 = sub_24171EFC8();
  sub_241705D04(&qword_268D24BE0, (void (*)(uint64_t))sub_241705B04);
  return v24;
}

uint64_t sub_2417051A8()
{
  uint64_t v0 = sub_24171ED78();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24171ED68();
  uint64_t v4 = sub_24171ED28();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

unint64_t sub_241705280()
{
  return 0xD000000000000022;
}

uint64_t sub_24170529C(uint64_t a1)
{
  return sub_241704E48(a1, *v1);
}

uint64_t sub_2417052A4()
{
  uint64_t v43 = sub_24171ED78();
  uint64_t v0 = *(void *)(v43 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v43);
  uint64_t v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v39 - v4;
  sub_24171F108();
  sub_2416FA7F4(0, &qword_268D24BF0);
  sub_241705E40(0, &qword_268D24BF8, (unint64_t *)&qword_268D24C00);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_241720600;
  sub_24171E5A8();
  uint64_t v7 = sub_24171E598();
  uint64_t v9 = v8;
  uint64_t v10 = MEMORY[0x263F8D310];
  *(void *)(v6 + 56) = MEMORY[0x263F8D310];
  unint64_t v11 = sub_241705E98();
  *(void *)(v6 + 64) = v11;
  *(void *)(v6 + 32) = v7;
  *(void *)(v6 + 40) = v9;
  uint64_t v12 = sub_24171F818();
  *(void *)(v6 + 96) = v10;
  *(void *)(v6 + 104) = v11;
  *(void *)(v6 + 72) = v12;
  *(void *)(v6 + 80) = v13;
  uint64_t v14 = (void *)sub_24171F928();
  char v15 = (void *)sub_24171E568();
  uint64_t v16 = (void *)MEMORY[0x245621C20]();
  sub_2416FF080();
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_241722830;
  *(void *)(v17 + 32) = v14;
  *(void *)(v17 + 40) = v15;
  v44[0] = v17;
  sub_24171F8B8();
  id v42 = v14;
  id v41 = v15;
  uint64_t v18 = (void *)sub_24171F898();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v18);

  objc_msgSend(v16, sel_setPredicate_, v19);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_241722AF0;
  id v21 = objc_allocWithZone(MEMORY[0x263F08B30]);
  uint64_t v22 = (void *)sub_24171F7D8();
  id v23 = objc_msgSend(v21, sel_initWithKey_ascending_, v22, 1);

  *(void *)(v20 + 32) = v23;
  v44[0] = v20;
  sub_24171F8B8();
  sub_2416FA7F4(0, &qword_268D24C10);
  uint64_t v24 = (void *)sub_24171F898();
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setSortDescriptors_, v24);

  sub_2416E6230(v45, v45[3]);
  id v25 = v16;
  id v40 = v25;
  unint64_t v26 = (void *)sub_24171E408();
  id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF270]), sel_initWithFetchRequest_managedObjectContext_sectionNameKeyPath_cacheName_, v25, v26, 0, 0);

  sub_241705BD4(0);
  id v29 = objc_allocWithZone(v28);
  id v39 = v27;
  uint64_t v30 = (void *)sub_24171F2E8();
  long long v31 = v3;
  sub_24171ED58();
  sub_24171ED38();
  uint64_t v32 = *(void (**)(char *, uint64_t))(v0 + 8);
  char v33 = v3;
  uint64_t v34 = v43;
  v32(v33, v43);
  char v35 = (void (*)(uint64_t *, void))sub_24171ED48();
  *uint64_t v36 = 0x4030000000000000;
  v35(v44, 0);
  (*(void (**)(char *, char *, uint64_t))(v0 + 16))(v31, v5, v34);
  sub_241705CD0();
  uint64_t v37 = sub_24171ED08();

  v32(v31, v34);
  v32(v5, v34);
  sub_2416E2090((uint64_t)v45);
  return v37;
}

uint64_t sub_24170577C(void *a1)
{
  uint64_t v2 = sub_24171E278();
  uint64_t v23 = *(void *)(v2 - 8);
  uint64_t v24 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_24171EE98();
  uint64_t v5 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24171EF08();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a1;
  sub_24171EEF8();
  sub_241705E40(0, (unint64_t *)&qword_268D245F0, &qword_268D245F8);
  uint64_t v13 = swift_allocObject();
  long long v21 = xmmword_241720620;
  *(_OWORD *)(v13 + 16) = xmmword_241720620;
  uint64_t v22 = v8;
  *(void *)(v13 + 56) = v8;
  *(void *)(v13 + 64) = sub_241705D04(&qword_268D24BE8, MEMORY[0x263F440F8]);
  uint64_t v14 = sub_2416E2980((uint64_t *)(v13 + 32));
  (*(void (**)(uint64_t *, char *, uint64_t))(v9 + 16))(v14, v11, v8);
  sub_24171E268();
  sub_24171E258();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v24);
  sub_24171EE88();
  sub_241705DE8();
  unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = v21;
  unint64_t v17 = v16 + v15;
  uint64_t v18 = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 16))(v17, v7, v25);
  sub_24171F268();
  swift_allocObject();
  uint64_t v19 = sub_24171F248();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v18);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v22);
  return v19;
}

void sub_241705B04()
{
  if (!qword_268D24BB0)
  {
    sub_241705C1C(255, &qword_268D24BB8, (uint64_t (*)(uint64_t))sub_241705BD4, sub_241705CD0, MEMORY[0x263F43F28]);
    sub_24171F268();
    sub_241705D4C();
    unint64_t v0 = sub_24171EFD8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24BB0);
    }
  }
}

void sub_241705BD4(uint64_t a1)
{
}

void sub_241705C1C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v9 = a3(255);
    uint64_t v10 = a4();
    unint64_t v11 = a5(a1, v9, v10);
    if (!v12) {
      atomic_store(v11, a2);
    }
  }
}

uint64_t sub_241705C9C()
{
  return sub_241705D04(&qword_268D24BC8, MEMORY[0x263F459D8]);
}

uint64_t sub_241705CD0()
{
  return sub_241705D04(&qword_268D24BD0, sub_241705BD4);
}

uint64_t sub_241705D04(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_241705D4C()
{
  unint64_t result = qword_268D24BD8;
  if (!qword_268D24BD8)
  {
    sub_241705C1C(255, &qword_268D24BB8, (uint64_t (*)(uint64_t))sub_241705BD4, sub_241705CD0, MEMORY[0x263F43F28]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24BD8);
  }
  return result;
}

void sub_241705DE8()
{
  if (!qword_268D245E8)
  {
    sub_24171EE98();
    unint64_t v0 = sub_24171FD68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D245E8);
    }
  }
}

void sub_241705E40(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_2416E22F8(255, a3);
    unint64_t v4 = sub_24171FD68();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_241705E98()
{
  unint64_t result = qword_268D24C08;
  if (!qword_268D24C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24C08);
  }
  return result;
}

double sub_241705EEC@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(a1, sel_identifier);
  uint64_t v4 = sub_24171F818();
  uint64_t v6 = v5;

  if (v4 == 0xD00000000000002ELL && v6 == 0x8000000241723C10)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v8 = type metadata accessor for WalkingSteadinessDataTypeDetailDebugActionProviding();
    uint64_t v9 = swift_allocObject();
    *(void *)(a2 + 24) = v8;
    *(void *)(a2 + 32) = sub_241705FF8();
    *(void *)a2 = v9;
    return result;
  }
  char v7 = sub_24171FD88();
  swift_bridgeObjectRelease();
  if (v7) {
    goto LABEL_5;
  }
  *(void *)(a2 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

double sub_241705FE0@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_241705EEC(a1, a2);
}

unint64_t sub_241705FF8()
{
  unint64_t result = qword_268D24C18;
  if (!qword_268D24C18)
  {
    type metadata accessor for WalkingSteadinessDataTypeDetailDebugActionProviding();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24C18);
  }
  return result;
}

void sub_241706050(void *a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v182 = (uint64_t (*)(uint64_t))a3;
  uint64_t v183 = a4;
  uint64_t v181 = a2;
  uint64_t v184 = sub_24171F5C8();
  uint64_t v7 = *(void *)(v184 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v184);
  uint64_t v172 = (char *)&v171 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v171 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v173 = (char *)&v171 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v174 = (char *)&v171 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v175 = (char *)&v171 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v176 = (char *)&v171 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v177 = (char *)&v171 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v171 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  Class v28 = (char *)&v171 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  long long v31 = (char *)&v171 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = (char *)&v171 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v37 = (char *)&v171 - v36;
  MEMORY[0x270FA5388](v35);
  id v39 = (char *)&v171 - v38;
  id v171 = a1;
  id v40 = objc_msgSend(a1, sel_highestPriorityUnsatisfiedRequirement);
  if (!v40)
  {
    sub_24171F588();
    uint64_t v46 = sub_24171F5B8();
    os_log_type_t v47 = sub_24171F958();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v186 = v49;
      *(_DWORD *)uint64_t v48 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v46, v47, "[%{public}s:FeatureStatusConfiguration] Onboarded, available, and enabled", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v49, -1, -1);
      MEMORY[0x245623AC0](v48, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v184);
    unint64_t v62 = (void *)sub_24171F4E8();
    unsigned int v63 = objc_msgSend(v62, sel_areAllRequirementsSatisfied);

    if (v63) {
      sub_24170EA78(v182, v183, a5);
    }
    else {
      sub_24170FB30((uint64_t (*)(void))v182, v183, a5);
    }
    uint64_t v58 = sub_24171E828();
    uint64_t v59 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56);
    uint64_t v60 = a5;
    goto LABEL_17;
  }
  id v41 = v40;
  uint64_t v178 = a5;
  uint64_t v179 = v7;
  uint64_t v42 = sub_24171F818();
  uint64_t v44 = v43;
  id v180 = v41;
  if (v42 == sub_24171F818() && v44 == v45)
  {
    swift_bridgeObjectRelease_n();
LABEL_8:
    sub_24171F588();
    uint64_t v51 = sub_24171F5B8();
    os_log_type_t v52 = sub_24171F958();
    BOOL v53 = os_log_type_enabled(v51, v52);
    id v54 = v180;
    if (v53)
    {
      id v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      uint64_t v186 = v56;
      *(_DWORD *)id v55 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v51, v52, "[%{public}s:FeatureStatusConfiguration] Health app hidden, hiding", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v56, -1, -1);
      MEMORY[0x245623AC0](v55, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v179 + 8))(v39, v184);
LABEL_11:
    uint64_t v57 = v178;
    uint64_t v58 = sub_24171E828();
    uint64_t v59 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56);
    uint64_t v60 = v57;
LABEL_12:
    uint64_t v61 = 1;
LABEL_18:
    v59(v60, v61, 1, v58);
    return;
  }
  char v50 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v50) {
    goto LABEL_8;
  }
  uint64_t v64 = sub_24171F818();
  uint64_t v66 = v65;
  id v67 = v180;
  if (v64 == sub_24171F818() && v66 == v68)
  {
    swift_bridgeObjectRelease_n();
LABEL_23:
    sub_24171F588();
    unint64_t v70 = sub_24171F5B8();
    os_log_type_t v71 = sub_24171F958();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = (uint8_t *)swift_slowAlloc();
      uint64_t v73 = swift_slowAlloc();
      uint64_t v186 = v73;
      *(_DWORD *)uint64_t v72 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v70, v71, "[%{public}s:FeatureStatusConfiguration] Not background delivered hiding", v72, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v73, -1, -1);
      MEMORY[0x245623AC0](v72, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v179 + 8))(v37, v184);
    goto LABEL_11;
  }
  char v69 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v69) {
    goto LABEL_23;
  }
  uint64_t v74 = sub_24171F818();
  uint64_t v76 = v75;
  if (v74 == sub_24171F818() && v76 == v77)
  {
    swift_bridgeObjectRelease_n();
LABEL_30:
    sub_24171F588();
    uint64_t v79 = sub_24171F5B8();
    os_log_type_t v80 = sub_24171F958();
    if (os_log_type_enabled(v79, v80))
    {
      unint64_t v81 = (uint8_t *)swift_slowAlloc();
      uint64_t v82 = swift_slowAlloc();
      uint64_t v186 = v82;
      *(_DWORD *)unint64_t v81 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v79, v80, "[%{public}s:FeatureStatusConfiguration] Country not supported on local device, treating as unavailable", v81, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v82, -1, -1);
      MEMORY[0x245623AC0](v81, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v179 + 8))(v34, v184);
    uint64_t v83 = v178;
LABEL_33:
    sub_24170BC38(v83);
LABEL_34:

LABEL_35:
    uint64_t v58 = sub_24171E828();
    uint64_t v59 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56);
    uint64_t v60 = v83;
LABEL_17:
    uint64_t v61 = 0;
    goto LABEL_18;
  }
  char v78 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v78) {
    goto LABEL_30;
  }
  uint64_t v84 = sub_24171F818();
  uint64_t v86 = v85;
  if (v84 == sub_24171F818() && v86 == v87)
  {
    swift_bridgeObjectRelease_n();
LABEL_40:
    sub_24171F588();
    uint64_t v89 = sub_24171F5B8();
    os_log_type_t v90 = sub_24171F958();
    if (os_log_type_enabled(v89, v90))
    {
      uint64_t v91 = (uint8_t *)swift_slowAlloc();
      uint64_t v92 = swift_slowAlloc();
      uint64_t v186 = v92;
      *(_DWORD *)uint64_t v91 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v89, v90, "[%{public}s:FeatureStatusConfiguration] Age gated, treating as unavailable", v91, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v92, -1, -1);
      MEMORY[0x245623AC0](v91, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v179 + 8))(v31, v184);
    uint64_t v83 = v178;
    goto LABEL_33;
  }
  char v88 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v88) {
    goto LABEL_40;
  }
  uint64_t v93 = sub_24171F818();
  uint64_t v95 = v94;
  if (v93 == sub_24171F818() && v95 == v96)
  {
    swift_bridgeObjectRelease_n();
LABEL_47:
    sub_24171F588();
    uint64_t v98 = sub_24171F5B8();
    os_log_type_t v99 = sub_24171F958();
    if (os_log_type_enabled(v98, v99))
    {
      uint64_t v100 = (uint8_t *)swift_slowAlloc();
      uint64_t v101 = swift_slowAlloc();
      uint64_t v186 = v101;
      *(_DWORD *)uint64_t v100 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v98, v99, "[%{public}s:FeatureStatusConfiguration] Capability not supported on phone, treating as unavailable", v100, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v101, -1, -1);
      MEMORY[0x245623AC0](v100, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v179 + 8))(v28, v184);
    uint64_t v83 = v178;
    sub_24170C120(v178);
    goto LABEL_34;
  }
  char v97 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v97) {
    goto LABEL_47;
  }
  uint64_t v102 = sub_24171F818();
  uint64_t v104 = v103;
  if (v102 == sub_24171F818() && v104 == v105)
  {
    swift_bridgeObjectRelease_n();
LABEL_54:
    sub_24171F588();
    uint64_t v107 = sub_24171F5B8();
    os_log_type_t v108 = sub_24171F958();
    if (os_log_type_enabled(v107, v108))
    {
      uint64_t v109 = (uint8_t *)swift_slowAlloc();
      uint64_t v110 = swift_slowAlloc();
      uint64_t v186 = v110;
      *(_DWORD *)uint64_t v109 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v107, v108, "[%{public}s:FeatureStatusConfiguration] Age is not present, treating as unavailable", v109, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v110, -1, -1);
      MEMORY[0x245623AC0](v109, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v179 + 8))(v25, v184);
    uint64_t v83 = v178;
    sub_24170C688(v178);
    goto LABEL_34;
  }
  char v106 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v106) {
    goto LABEL_54;
  }
  uint64_t v111 = sub_24171F818();
  uint64_t v113 = v112;
  if (v111 == sub_24171F818() && v113 == v114)
  {
    swift_bridgeObjectRelease_n();
LABEL_61:
    uint64_t v116 = v177;
    sub_24171F588();
    unint64_t v117 = sub_24171F5B8();
    os_log_type_t v118 = sub_24171F958();
    if (os_log_type_enabled(v117, v118))
    {
      uint64_t v119 = (uint8_t *)swift_slowAlloc();
      uint64_t v120 = swift_slowAlloc();
      uint64_t v186 = v120;
      *(_DWORD *)uint64_t v119 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v117, v118, "[%{public}s:FeatureStatusConfiguration] Notifications not authorized, treating as unavailable invalid settings", v119, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v120, -1, -1);
      MEMORY[0x245623AC0](v119, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v179 + 8))(v116, v184);
    uint64_t v83 = v178;
    sub_24170CD00(v178);
LABEL_64:

    goto LABEL_35;
  }
  char v115 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v115) {
    goto LABEL_61;
  }
  uint64_t v121 = sub_24171F818();
  uint64_t v123 = v122;
  if (v121 == sub_24171F818() && v123 == v124)
  {
    swift_bridgeObjectRelease_n();
LABEL_69:
    sub_24171F588();
    uint64_t v126 = sub_24171F5B8();
    os_log_type_t v127 = sub_24171F958();
    if (os_log_type_enabled(v126, v127))
    {
      uint64_t v128 = (uint8_t *)swift_slowAlloc();
      uint64_t v129 = swift_slowAlloc();
      uint64_t v186 = v129;
      *(_DWORD *)uint64_t v128 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v126, v127, "[%{public}s:FeatureStatusConfiguration] Fitness tracking is not enabled, treating as unavailable", v128, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v129, -1, -1);
      MEMORY[0x245623AC0](v128, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v179 + 8))(v176, v184);
    uint64_t v83 = v178;
    sub_24170D2F4(v178);
    goto LABEL_64;
  }
  char v125 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v125) {
    goto LABEL_69;
  }
  uint64_t v130 = sub_24171F818();
  uint64_t v132 = v131;
  if (v130 == sub_24171F818() && v132 == v133)
  {
    swift_bridgeObjectRelease_n();
LABEL_76:
    sub_24171F588();
    uint64_t v135 = sub_24171F5B8();
    os_log_type_t v136 = sub_24171F958();
    if (os_log_type_enabled(v135, v136))
    {
      uint64_t v137 = (uint8_t *)swift_slowAlloc();
      uint64_t v138 = swift_slowAlloc();
      uint64_t v186 = v138;
      *(_DWORD *)uint64_t v137 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v135, v136, "[%{public}s:FeatureStatusConfiguration] Height is not set, treating as unavailable", v137, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v138, -1, -1);
      MEMORY[0x245623AC0](v137, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v179 + 8))(v175, v184);
    uint64_t v83 = v178;
    sub_24170D87C(v178);
    goto LABEL_64;
  }
  char v134 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v134) {
    goto LABEL_76;
  }
  uint64_t v139 = sub_24171F818();
  uint64_t v141 = v140;
  if (v139 == sub_24171F818() && v141 == v142)
  {
    swift_bridgeObjectRelease_n();
LABEL_83:
    sub_24171F588();
    uint64_t v144 = sub_24171F5B8();
    os_log_type_t v145 = sub_24171F958();
    if (os_log_type_enabled(v144, v145))
    {
      unint64_t v146 = (uint8_t *)swift_slowAlloc();
      uint64_t v147 = swift_slowAlloc();
      uint64_t v186 = v147;
      *(_DWORD *)unint64_t v146 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v144, v145, "[%{public}s:FeatureStatusConfiguration] Onboarding not acknowledged, treating as not onboarded", v146, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v147, -1, -1);
      MEMORY[0x245623AC0](v146, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v179 + 8))(v174, v184);
    uint64_t v148 = (void *)sub_24171F4E8();
    unsigned int v149 = objc_msgSend(v148, sel_areAllRequirementsSatisfied);

    uint64_t v83 = v178;
    if (v149) {
      sub_24170DF50(v182, v183, v178);
    }
    else {
      sub_24170F5B8((uint64_t (*)(void))v182, v183, v178);
    }
    goto LABEL_64;
  }
  char v143 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v143) {
    goto LABEL_83;
  }
  uint64_t v150 = sub_24171F818();
  uint64_t v152 = v151;
  if (v150 == sub_24171F818() && v152 == v153)
  {
    swift_bridgeObjectRelease_n();
LABEL_92:
    sub_24171F588();
    uint64_t v155 = sub_24171F5B8();
    os_log_type_t v156 = sub_24171F958();
    if (os_log_type_enabled(v155, v156))
    {
      uint64_t v157 = (uint8_t *)swift_slowAlloc();
      uint64_t v158 = swift_slowAlloc();
      uint64_t v186 = v158;
      *(_DWORD *)uint64_t v157 = 136446210;
      uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v155, v156, "[%{public}s:FeatureStatusConfiguration] Onboarded and acknowledged but feature disabled", v157, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v158, -1, -1);
      MEMORY[0x245623AC0](v157, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v179 + 8))(v173, v184);
    v159 = (void *)sub_24171F4E8();
    unsigned int v160 = objc_msgSend(v159, sel_areAllRequirementsSatisfied);

    uint64_t v83 = v178;
    if (v160) {
      sub_24170E4B4(v182, v183, v178);
    }
    else {
      sub_24170EFD0((uint64_t (*)(void))v182, v183, v178);
    }
    goto LABEL_64;
  }
  char v154 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v154) {
    goto LABEL_92;
  }

  sub_24171F588();
  id v161 = v171;
  v162 = sub_24171F5B8();
  os_log_type_t v163 = sub_24171F948();
  if (!os_log_type_enabled(v162, v163))
  {

    goto LABEL_101;
  }
  uint64_t v164 = swift_slowAlloc();
  uint64_t v165 = swift_slowAlloc();
  uint64_t v186 = v165;
  *(_DWORD *)uint64_t v164 = 136446466;
  uint64_t v185 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v186);
  sub_24171FB18();
  *(_WORD *)(v164 + 12) = 2082;
  id v166 = objc_msgSend(v161, sel_highestPriorityUnsatisfiedRequirement);
  if (v166)
  {
    uint64_t v167 = v166;
    uint64_t v168 = sub_24171F818();
    unint64_t v170 = v169;

    uint64_t v185 = sub_2416E1FBC(v168, v170, &v186);
    sub_24171FB18();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2416DE000, v162, v163, "[%{public}s:FeatureStatusConfiguration] Unhandled, unsatisfied requirement encountered: %{public}s", (uint8_t *)v164, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v165, -1, -1);
    MEMORY[0x245623AC0](v164, -1, -1);

LABEL_101:
    (*(void (**)(char *, uint64_t))(v179 + 8))(v172, v184);
    uint64_t v58 = sub_24171E828();
    uint64_t v59 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56);
    uint64_t v60 = v178;
    goto LABEL_12;
  }

  __break(1u);
}

uint64_t sub_2417079B8@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_24171E708();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v25 - v7;
  uint64_t v9 = sub_24171F5C8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24171E7F8();
  swift_bridgeObjectRelease();
  if (!v13)
  {
    sub_24171F588();
    uint64_t v14 = sub_24171F5B8();
    os_log_type_t v15 = sub_24171F948();
    uint64_t v29 = v14;
    int v28 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v31 = v26;
      uint64_t v27 = v10;
      *(_DWORD *)uint64_t v16 = 136446210;
      v25[1] = v16 + 4;
      uint64_t v30 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v31);
      sub_24171FB18();
      uint64_t v17 = v16;
      _os_log_impl(&dword_2416DE000, v29, (os_log_type_t)v28, "[%{public}s] Expected to have primary description content but it's not present", v16, 0xCu);
      uint64_t v18 = v26;
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v18, -1, -1);
      MEMORY[0x245623AC0](v17, -1, -1);

      (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v9);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    }
  }
  sub_24171E7E8();
  int v19 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v8, v2);
  if (v19 == *MEMORY[0x263F435C8])
  {
    char v20 = 1;
  }
  else if (v19 == *MEMORY[0x263F435D0])
  {
    char v20 = 2;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    char v20 = 0;
  }
  sub_24171E7E8();
  uint64_t v21 = sub_24171E7F8();
  if (v21) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = MEMORY[0x263F8EE78];
  }
  *a1 = v20;
  uint64_t v23 = type metadata accessor for WalkingSteadinessHealthChecklistSettingsState();
  uint64_t result = (*(uint64_t (**)(char *, char *, uint64_t))(v3 + 32))(&a1[*(int *)(v23 + 20)], v6, v2);
  *(void *)&a1[*(int *)(v23 + 24)] = v22;
  return result;
}

void sub_241707D5C(void *a1@<X0>, uint64_t (*a2)(uint64_t)@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v113 = a4;
  uint64_t v7 = sub_24171F5C8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v111 = v7;
  uint64_t v112 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  os_log_type_t v108 = (char *)&v108 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v108 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v109 = (char *)&v108 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v110 = (char *)&v108 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  char v20 = (char *)&v108 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)&v108 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = (char *)&v108 - v25;
  MEMORY[0x270FA5388](v24);
  int v28 = (char *)&v108 - v27;
  id v29 = objc_msgSend(a1, sel_highestPriorityUnsatisfiedRequirement);
  if (!v29)
  {
    uint64_t v41 = a3;
    sub_24171F588();
    uint64_t v42 = sub_24171F5B8();
    os_log_type_t v43 = sub_24171F958();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v115 = v45;
      *(_DWORD *)uint64_t v44 = 136446210;
      uint64_t v114 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v115);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v42, v43, "[%{public}s:FeatureStatusConfiguration] Onboarded, available, and enabled", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v45, -1, -1);
      MEMORY[0x245623AC0](v44, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v112 + 8))(v13, v111);
    uint64_t v46 = (void *)sub_24171F4E8();
    unsigned int v47 = objc_msgSend(v46, sel_areAllRequirementsSatisfied);

    uint64_t v48 = v113;
    if (v47) {
      sub_24170DF50(a2, v41, v113);
    }
    else {
      sub_24170F5B8((uint64_t (*)(void))a2, v41, v113);
    }
    goto LABEL_20;
  }
  uint64_t v30 = v29;
  uint64_t v31 = sub_24171F818();
  uint64_t v33 = v32;
  if (v31 == sub_24171F818() && v33 == v34)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  char v36 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v36)
  {
LABEL_15:
    sub_24171F588();
    uint64_t v49 = sub_24171F5B8();
    os_log_type_t v50 = sub_24171F958();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      uint64_t v115 = v52;
      *(_DWORD *)uint64_t v51 = 136446210;
      uint64_t v114 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v115);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v49, v50, "[%{public}s:FeatureStatusConfiguration] Health app hidden, hiding", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v52, -1, -1);
      MEMORY[0x245623AC0](v51, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v112 + 8))(v28, v111);
    goto LABEL_18;
  }
  uint64_t v37 = sub_24171F818();
  uint64_t v39 = v38;
  if (v37 == sub_24171F818() && v39 == v40)
  {
    swift_bridgeObjectRelease_n();
LABEL_22:
    sub_24171F588();
    uint64_t v56 = sub_24171F5B8();
    os_log_type_t v57 = sub_24171F958();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      uint64_t v115 = v59;
      *(_DWORD *)uint64_t v58 = 136446210;
      uint64_t v114 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v115);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v56, v57, "[%{public}s:FeatureStatusConfiguration] Not background delivered hiding", v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v59, -1, -1);
      MEMORY[0x245623AC0](v58, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v112 + 8))(v26, v111);
    goto LABEL_18;
  }
  char v55 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v55) {
    goto LABEL_22;
  }
  uint64_t v60 = sub_24171F818();
  uint64_t v62 = v61;
  if (v60 == sub_24171F818() && v62 == v63)
  {
    swift_bridgeObjectRelease_n();
LABEL_29:
    sub_24171F588();
    uint64_t v65 = sub_24171F5B8();
    os_log_type_t v66 = sub_24171F958();
    if (os_log_type_enabled(v65, v66))
    {
      id v67 = (uint8_t *)swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      uint64_t v115 = v68;
      *(_DWORD *)id v67 = 136446210;
      uint64_t v114 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v115);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v65, v66, "[%{public}s:FeatureStatusConfiguration] Country not supported on local device, treating as unavailable", v67, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v68, -1, -1);
      MEMORY[0x245623AC0](v67, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v112 + 8))(v23, v111);
    uint64_t v48 = v113;
LABEL_32:
    sub_24170BC38(v48);
LABEL_33:

LABEL_20:
    uint64_t v54 = sub_24171E828();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v48, 0, 1, v54);
    return;
  }
  char v64 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v64) {
    goto LABEL_29;
  }
  uint64_t v69 = sub_24171F818();
  uint64_t v71 = v70;
  if (v69 == sub_24171F818() && v71 == v72)
  {
    swift_bridgeObjectRelease_n();
LABEL_38:
    sub_24171F588();
    uint64_t v74 = sub_24171F5B8();
    os_log_type_t v75 = sub_24171F958();
    if (os_log_type_enabled(v74, v75))
    {
      uint64_t v76 = (uint8_t *)swift_slowAlloc();
      uint64_t v77 = swift_slowAlloc();
      uint64_t v115 = v77;
      *(_DWORD *)uint64_t v76 = 136446210;
      uint64_t v114 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v115);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v74, v75, "[%{public}s:FeatureStatusConfiguration] Age gated, treating as unavailable", v76, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v77, -1, -1);
      MEMORY[0x245623AC0](v76, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v112 + 8))(v20, v111);
    uint64_t v48 = v113;
    goto LABEL_32;
  }
  char v73 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v73) {
    goto LABEL_38;
  }
  uint64_t v78 = sub_24171F818();
  uint64_t v80 = v79;
  if (v78 == sub_24171F818() && v80 == v81)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v82 = v110;
LABEL_45:
    sub_24171F588();
    uint64_t v84 = sub_24171F5B8();
    os_log_type_t v85 = sub_24171F958();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      uint64_t v115 = v87;
      *(_DWORD *)uint64_t v86 = 136446210;
      uint64_t v114 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v115);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v84, v85, "[%{public}s:FeatureStatusConfiguration] Capability not supported on phone, treating as unavailable", v86, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v87, -1, -1);
      MEMORY[0x245623AC0](v86, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v112 + 8))(v82, v111);
    uint64_t v48 = v113;
    sub_24170C120(v113);
    goto LABEL_33;
  }
  char v83 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v82 = v110;
  if (v83) {
    goto LABEL_45;
  }
  uint64_t v88 = sub_24171F818();
  uint64_t v90 = v89;
  if (v88 == sub_24171F818() && v90 == v91)
  {
    swift_bridgeObjectRelease_n();
LABEL_52:
    uint64_t v93 = v109;
    sub_24171F588();
    uint64_t v94 = sub_24171F5B8();
    os_log_type_t v95 = sub_24171F958();
    if (os_log_type_enabled(v94, v95))
    {
      uint64_t v96 = (uint8_t *)swift_slowAlloc();
      uint64_t v97 = swift_slowAlloc();
      uint64_t v115 = v97;
      *(_DWORD *)uint64_t v96 = 136446210;
      uint64_t v114 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v115);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v94, v95, "[%{public}s:FeatureStatusConfiguration] Fitness tracking is not enabled, treating as unavailable", v96, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v97, -1, -1);
      MEMORY[0x245623AC0](v96, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v112 + 8))(v93, v111);
    uint64_t v48 = v113;
    sub_24170D2F4(v113);
    goto LABEL_33;
  }
  char v92 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v92) {
    goto LABEL_52;
  }

  sub_24171F588();
  id v98 = a1;
  os_log_type_t v99 = sub_24171F5B8();
  os_log_type_t v100 = sub_24171F948();
  if (!os_log_type_enabled(v99, v100))
  {

    goto LABEL_59;
  }
  uint64_t v101 = swift_slowAlloc();
  uint64_t v102 = swift_slowAlloc();
  uint64_t v115 = v102;
  *(_DWORD *)uint64_t v101 = 136446466;
  uint64_t v114 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v115);
  sub_24171FB18();
  *(_WORD *)(v101 + 12) = 2082;
  id v103 = objc_msgSend(v98, sel_highestPriorityUnsatisfiedRequirement);
  if (v103)
  {
    uint64_t v104 = v103;
    uint64_t v105 = sub_24171F818();
    unint64_t v107 = v106;

    uint64_t v114 = sub_2416E1FBC(v105, v107, &v115);
    sub_24171FB18();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2416DE000, v99, v100, "[%{public}s:FeatureStatusConfiguration] Unhandled, unsatisfied requirement encountered: %{public}s", (uint8_t *)v101, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v102, -1, -1);
    MEMORY[0x245623AC0](v101, -1, -1);

LABEL_59:
    (*(void (**)(char *, uint64_t))(v112 + 8))(v108, v111);
LABEL_18:
    uint64_t v53 = sub_24171E828();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v113, 1, 1, v53);
    return;
  }

  __break(1u);
}

void sub_241708CA4(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v184 = a1;
  uint64_t v3 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(0);
  uint64_t v191 = *(void *)(v3 - 8);
  uint64_t v192 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v186 = (char *)&v177 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2417101F0(0, &qword_26B018A00, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v185 = (char *)&v177 - v6;
  uint64_t v7 = sub_24171F5C8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v188 = v7;
  uint64_t v189 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v178 = (char *)&v177 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v177 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v179 = (char *)&v177 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  id v180 = (char *)&v177 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v181 = (char *)&v177 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v182 = (char *)&v177 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v177 - v23;
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v177 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v30 = (char *)&v177 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)&v177 - v32;
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  char v36 = (char *)&v177 - v35;
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v39 = (char *)&v177 - v38;
  MEMORY[0x270FA5388](v37);
  uint64_t v41 = (char *)&v177 - v40;
  id v190 = (id)sub_24171F4E8();
  id v42 = objc_msgSend(v190, sel_highestPriorityUnsatisfiedRequirement);
  if (!v42)
  {
    sub_24171F588();
    uint64_t v48 = sub_24171F5B8();
    os_log_type_t v49 = sub_24171F958();
    if (os_log_type_enabled(v48, v49))
    {
      os_log_type_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v194 = v51;
      *(_DWORD *)os_log_type_t v50 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v48, v49, "[%{public}s:ActionHandler] Onboarded, available, and enabled", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v51, -1, -1);
      MEMORY[0x245623AC0](v50, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v13, v188);
    uint64_t v53 = v191;
    uint64_t v52 = v192;
    id v54 = v190;
    uint64_t v56 = v185;
    uint64_t v55 = (uint64_t)v186;
    sub_2417079B8(v185);
    uint64_t v57 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    swift_storeEnumTagMultiPayload();
    uint64_t v58 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56);
    v58(v56, 0, 1, v57);
    v58((char *)v55, 1, 1, v57);
    sub_2416EBACC((uint64_t)v56, v55);
    sub_24171009C(v55, a2);
    goto LABEL_8;
  }
  uint64_t v183 = a2;
  os_log_type_t v43 = v42;
  uint64_t v44 = sub_24171F818();
  uint64_t v46 = v45;
  id v187 = v43;
  if (v44 == sub_24171F818() && v46 == v47)
  {
    swift_bridgeObjectRelease_n();
LABEL_10:
    sub_24171F588();
    uint64_t v61 = sub_24171F5B8();
    os_log_type_t v62 = sub_24171F958();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      uint64_t v194 = v64;
      *(_DWORD *)uint64_t v63 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v61, v62, "[%{public}s:ActionHandler] Health app hidden, hiding", v63, 0xCu);
      uint64_t v59 = 1;
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v64, -1, -1);
      MEMORY[0x245623AC0](v63, -1, -1);

      (*(void (**)(char *, uint64_t))(v189 + 8))(v41, v188);
LABEL_14:
      a2 = v183;
LABEL_15:
      uint64_t v53 = v191;
      uint64_t v52 = v192;
      goto LABEL_16;
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v41, v188);
LABEL_13:
    uint64_t v59 = 1;
    goto LABEL_14;
  }
  char v60 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v60) {
    goto LABEL_10;
  }
  uint64_t v65 = sub_24171F818();
  uint64_t v67 = v66;
  if (v65 == sub_24171F818() && v67 == v68)
  {
    swift_bridgeObjectRelease_n();
LABEL_21:
    sub_24171F588();
    uint64_t v70 = sub_24171F5B8();
    os_log_type_t v71 = sub_24171F958();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = (uint8_t *)swift_slowAlloc();
      uint64_t v73 = swift_slowAlloc();
      uint64_t v194 = v73;
      *(_DWORD *)uint64_t v72 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v70, v71, "[%{public}s:ActionHandler] Not background delivered hiding", v72, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v73, -1, -1);
      MEMORY[0x245623AC0](v72, -1, -1);

      (*(void (**)(char *, uint64_t))(v189 + 8))(v39, v188);
      uint64_t v59 = 1;
      goto LABEL_14;
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v39, v188);
    goto LABEL_13;
  }
  char v69 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v69) {
    goto LABEL_21;
  }
  uint64_t v74 = sub_24171F818();
  uint64_t v76 = v75;
  if (v74 == sub_24171F818() && v76 == v77)
  {
    swift_bridgeObjectRelease_n();
LABEL_28:
    sub_24171F588();
    uint64_t v79 = sub_24171F5B8();
    os_log_type_t v80 = sub_24171F958();
    if (os_log_type_enabled(v79, v80))
    {
      uint64_t v81 = (uint8_t *)swift_slowAlloc();
      uint64_t v82 = swift_slowAlloc();
      uint64_t v194 = v82;
      *(_DWORD *)uint64_t v81 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v79, v80, "[%{public}s:ActionHandler] Country not supported on local device, treating as unavailable", v81, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v82, -1, -1);
      MEMORY[0x245623AC0](v81, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v36, v188);
    a2 = v183;
    uint64_t v53 = v191;
    uint64_t v52 = v192;
    id v54 = v190;
    uint64_t v84 = v185;
    uint64_t v83 = (uint64_t)v186;
    uint64_t v85 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    goto LABEL_39;
  }
  char v78 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v78) {
    goto LABEL_28;
  }
  uint64_t v86 = sub_24171F818();
  uint64_t v88 = v87;
  if (v86 == sub_24171F818() && v88 == v89)
  {
    swift_bridgeObjectRelease_n();
LABEL_35:
    sub_24171F588();
    uint64_t v91 = sub_24171F5B8();
    os_log_type_t v92 = sub_24171F958();
    if (os_log_type_enabled(v91, v92))
    {
      uint64_t v93 = (uint8_t *)swift_slowAlloc();
      uint64_t v94 = swift_slowAlloc();
      uint64_t v194 = v94;
      *(_DWORD *)uint64_t v93 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v91, v92, "[%{public}s:ActionHandler] Age gated, treating as unavailable", v93, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v94, -1, -1);
      MEMORY[0x245623AC0](v93, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v33, v188);
LABEL_38:
    a2 = v183;
    uint64_t v53 = v191;
    uint64_t v52 = v192;
    id v54 = v190;
    uint64_t v84 = v185;
    uint64_t v83 = (uint64_t)v186;
    uint64_t v85 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
LABEL_39:
    swift_storeEnumTagMultiPayload();
    os_log_type_t v95 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v85 - 8) + 56);
    v95(v84, 0, 1, v85);
    v95((char *)v83, 1, 1, v85);
    sub_2416EBACC((uint64_t)v84, v83);
    sub_24171009C(v83, a2);

LABEL_8:
    uint64_t v59 = 0;
LABEL_16:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 56))(a2, v59, 1, v52);
    return;
  }
  char v90 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v90) {
    goto LABEL_35;
  }
  uint64_t v96 = sub_24171F818();
  uint64_t v98 = v97;
  if (v96 == sub_24171F818() && v98 == v99)
  {
    swift_bridgeObjectRelease_n();
LABEL_44:
    sub_24171F588();
    uint64_t v101 = sub_24171F5B8();
    os_log_type_t v102 = sub_24171F958();
    if (os_log_type_enabled(v101, v102))
    {
      id v103 = (uint8_t *)swift_slowAlloc();
      uint64_t v104 = swift_slowAlloc();
      uint64_t v194 = v104;
      *(_DWORD *)id v103 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v101, v102, "[%{public}s:ActionHandler] Capability not supported on phone, treating as unavailable", v103, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v104, -1, -1);
      MEMORY[0x245623AC0](v103, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v30, v188);
    goto LABEL_38;
  }
  char v100 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v100) {
    goto LABEL_44;
  }
  uint64_t v105 = sub_24171F818();
  uint64_t v107 = v106;
  if (v105 == sub_24171F818() && v107 == v108)
  {
    swift_bridgeObjectRelease_n();
LABEL_51:
    sub_24171F588();
    uint64_t v110 = sub_24171F5B8();
    os_log_type_t v111 = sub_24171F958();
    if (os_log_type_enabled(v110, v111))
    {
      uint64_t v112 = (uint8_t *)swift_slowAlloc();
      uint64_t v113 = swift_slowAlloc();
      uint64_t v194 = v113;
      *(_DWORD *)uint64_t v112 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v110, v111, "[%{public}s:ActionHandler] Age is not present, treating as unavailable", v112, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v113, -1, -1);
      MEMORY[0x245623AC0](v112, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v27, v188);
    a2 = v183;
    uint64_t v53 = v191;
    uint64_t v52 = v192;
    uint64_t v114 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    uint64_t v115 = v185;
    swift_storeEnumTagMultiPayload();
    uint64_t v116 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v114 - 8) + 56);
    v116(v115, 0, 1, v114);
    uint64_t v117 = (uint64_t)v186;
    v116(v186, 1, 1, v114);
    sub_2416EBACC((uint64_t)v115, v117);
    sub_24171009C(v117, a2);

    uint64_t v59 = 0;
    goto LABEL_16;
  }
  char v109 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v109) {
    goto LABEL_51;
  }
  uint64_t v118 = sub_24171F818();
  uint64_t v120 = v119;
  if (v118 == sub_24171F818() && v120 == v121)
  {
    swift_bridgeObjectRelease_n();
LABEL_58:
    sub_24171F588();
    uint64_t v123 = sub_24171F5B8();
    os_log_type_t v124 = sub_24171F958();
    if (os_log_type_enabled(v123, v124))
    {
      char v125 = (uint8_t *)swift_slowAlloc();
      uint64_t v126 = swift_slowAlloc();
      uint64_t v194 = v126;
      *(_DWORD *)char v125 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v123, v124, "[%{public}s:ActionHandler] Notifications not authorized, treating as unavailable invalid settings", v125, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v126, -1, -1);
      MEMORY[0x245623AC0](v125, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v24, v188);
    uint64_t v127 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    uint64_t v128 = v185;
LABEL_61:
    swift_storeEnumTagMultiPayload();
    uint64_t v129 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v127 - 8) + 56);
    v129(v128, 0, 1, v127);
    uint64_t v130 = (uint64_t)v186;
    v129(v186, 1, 1, v127);
    sub_2416EBACC((uint64_t)v128, v130);
    a2 = v183;
    sub_24171009C(v130, v183);

    uint64_t v59 = 0;
    goto LABEL_15;
  }
  char v122 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v122) {
    goto LABEL_58;
  }
  uint64_t v131 = sub_24171F818();
  uint64_t v133 = v132;
  if (v131 == sub_24171F818() && v133 == v134)
  {
    swift_bridgeObjectRelease_n();
LABEL_66:
    sub_24171F588();
    os_log_type_t v136 = sub_24171F5B8();
    os_log_type_t v137 = sub_24171F958();
    if (os_log_type_enabled(v136, v137))
    {
      uint64_t v138 = (uint8_t *)swift_slowAlloc();
      uint64_t v139 = swift_slowAlloc();
      uint64_t v194 = v139;
      *(_DWORD *)uint64_t v138 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v136, v137, "[%{public}s:ActionHandler] Fitness tracking is not enabled, treating as unavailable", v138, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v139, -1, -1);
      MEMORY[0x245623AC0](v138, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v182, v188);
    uint64_t v127 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    uint64_t v128 = v185;
    goto LABEL_61;
  }
  char v135 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v135) {
    goto LABEL_66;
  }
  uint64_t v140 = sub_24171F818();
  uint64_t v142 = v141;
  if (v140 == sub_24171F818() && v142 == v143)
  {
    swift_bridgeObjectRelease_n();
LABEL_73:
    sub_24171F588();
    os_log_type_t v145 = sub_24171F5B8();
    os_log_type_t v146 = sub_24171F958();
    if (os_log_type_enabled(v145, v146))
    {
      uint64_t v147 = (uint8_t *)swift_slowAlloc();
      uint64_t v148 = swift_slowAlloc();
      uint64_t v194 = v148;
      *(_DWORD *)uint64_t v147 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v145, v146, "[%{public}s:ActionHandler] Height is not set, treating as unavailable", v147, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v148, -1, -1);
      MEMORY[0x245623AC0](v147, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v181, v188);
    uint64_t v127 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    uint64_t v128 = v185;
    goto LABEL_61;
  }
  char v144 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v144) {
    goto LABEL_73;
  }
  uint64_t v149 = sub_24171F818();
  uint64_t v151 = v150;
  if (v149 == sub_24171F818() && v151 == v152)
  {
    swift_bridgeObjectRelease_n();
LABEL_80:
    sub_24171F588();
    char v154 = sub_24171F5B8();
    os_log_type_t v155 = sub_24171F958();
    if (os_log_type_enabled(v154, v155))
    {
      os_log_type_t v156 = (uint8_t *)swift_slowAlloc();
      uint64_t v157 = swift_slowAlloc();
      uint64_t v194 = v157;
      *(_DWORD *)os_log_type_t v156 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v154, v155, "[%{public}s:ActionHandler] Onboarding not acknowledged, treating as not onboarded", v156, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v157, -1, -1);
      MEMORY[0x245623AC0](v156, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v180, v188);
    uint64_t v127 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    uint64_t v128 = v185;
    goto LABEL_61;
  }
  char v153 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v153) {
    goto LABEL_80;
  }
  uint64_t v158 = sub_24171F818();
  uint64_t v160 = v159;
  if (v158 == sub_24171F818() && v160 == v161)
  {
    swift_bridgeObjectRelease_n();
LABEL_87:
    sub_24171F588();
    os_log_type_t v163 = sub_24171F5B8();
    os_log_type_t v164 = sub_24171F958();
    if (os_log_type_enabled(v163, v164))
    {
      uint64_t v165 = (uint8_t *)swift_slowAlloc();
      uint64_t v166 = swift_slowAlloc();
      uint64_t v194 = v166;
      *(_DWORD *)uint64_t v165 = 136446210;
      uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v163, v164, "[%{public}s:ActionHandler] Onboarded and acknowledged but feature disabled", v165, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v166, -1, -1);
      MEMORY[0x245623AC0](v165, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v189 + 8))(v179, v188);
    uint64_t v128 = v185;
    sub_2417079B8(v185);
    uint64_t v127 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    goto LABEL_61;
  }
  char v162 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v162) {
    goto LABEL_87;
  }

  sub_24171F588();
  id v167 = v190;
  uint64_t v168 = sub_24171F5B8();
  os_log_type_t v169 = sub_24171F948();
  if (!os_log_type_enabled(v168, v169))
  {

    goto LABEL_94;
  }
  uint64_t v170 = swift_slowAlloc();
  uint64_t v171 = swift_slowAlloc();
  uint64_t v194 = v171;
  *(_DWORD *)uint64_t v170 = 136446466;
  uint64_t v193 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v194);
  sub_24171FB18();
  *(_WORD *)(v170 + 12) = 2082;
  id v172 = objc_msgSend(v167, sel_highestPriorityUnsatisfiedRequirement);
  if (v172)
  {
    uint64_t v173 = v172;
    uint64_t v174 = sub_24171F818();
    unint64_t v176 = v175;

    uint64_t v193 = sub_2416E1FBC(v174, v176, &v194);
    sub_24171FB18();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2416DE000, v168, v169, "[%{public}s:ActionHandler] Unhandled, unsatisfied requirement encountered: %{public}s", (uint8_t *)v170, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v171, -1, -1);
    MEMORY[0x245623AC0](v170, -1, -1);

LABEL_94:
    (*(void (**)(char *, uint64_t))(v189 + 8))(v178, v188);

    goto LABEL_13;
  }

  __break(1u);
}

void sub_24170A848(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(0);
  uint64_t v129 = *(void *)(v2 - 8);
  uint64_t v130 = v2;
  MEMORY[0x270FA5388](v2);
  char v125 = (char *)&v121 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2417101F0(0, &qword_26B018A00, type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  os_log_type_t v124 = (char *)&v121 - v5;
  uint64_t v6 = sub_24171F5C8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v127 = v6;
  uint64_t v128 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v121 = (char *)&v121 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v121 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v121 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v121 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v121 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  uint64_t v24 = (char *)&v121 - v23;
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v121 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v121 - v28;
  id v126 = (id)sub_24171F4E8();
  id v30 = objc_msgSend(v126, sel_highestPriorityUnsatisfiedRequirement);
  if (!v30)
  {
    sub_24171F588();
    char v36 = sub_24171F5B8();
    os_log_type_t v37 = sub_24171F958();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v132 = v39;
      *(_DWORD *)uint64_t v38 = 136446210;
      uint64_t v131 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v132);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v36, v37, "[%{public}s:ActionHandler] Not onboarded and no unavailability reason", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v39, -1, -1);
      MEMORY[0x245623AC0](v38, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v128 + 8))(v12, v127);
    uint64_t v41 = v129;
    uint64_t v40 = v130;
    uint64_t v43 = (uint64_t)v125;
    id v42 = v126;
    uint64_t v44 = (uint64_t)v124;
    uint64_t v45 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    swift_storeEnumTagMultiPayload();
    uint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56);
    v46(v44, 0, 1, v45);
    v46(v43, 1, 1, v45);
    sub_2416EBACC(v44, v43);
    sub_24171009C(v43, a1);
    goto LABEL_8;
  }
  uint64_t v31 = v30;
  uint64_t v123 = a1;
  uint64_t v32 = sub_24171F818();
  uint64_t v34 = v33;
  id v122 = v31;
  if (v32 == sub_24171F818() && v34 == v35)
  {
    swift_bridgeObjectRelease_n();
LABEL_10:
    sub_24171F588();
    os_log_type_t v49 = sub_24171F5B8();
    os_log_type_t v50 = sub_24171F958();
    BOOL v51 = os_log_type_enabled(v49, v50);
    id v52 = v122;
    if (v51)
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = swift_slowAlloc();
      uint64_t v132 = v54;
      *(_DWORD *)uint64_t v53 = 136446210;
      uint64_t v131 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v132);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v49, v50, "[%{public}s:ActionHandler] Health app hidden, hiding", v53, 0xCu);
      uint64_t v47 = 1;
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v54, -1, -1);
      MEMORY[0x245623AC0](v53, -1, -1);

      (*(void (**)(char *, uint64_t))(v128 + 8))(v29, v127);
LABEL_14:
      a1 = v123;
LABEL_15:
      uint64_t v41 = v129;
      uint64_t v40 = v130;
      goto LABEL_16;
    }

    (*(void (**)(char *, uint64_t))(v128 + 8))(v29, v127);
LABEL_13:
    uint64_t v47 = 1;
    goto LABEL_14;
  }
  char v48 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v48) {
    goto LABEL_10;
  }
  uint64_t v55 = sub_24171F818();
  uint64_t v57 = v56;
  id v58 = v122;
  if (v55 == sub_24171F818() && v57 == v59)
  {
    swift_bridgeObjectRelease_n();
LABEL_21:
    sub_24171F588();
    uint64_t v61 = sub_24171F5B8();
    os_log_type_t v62 = sub_24171F958();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      uint64_t v132 = v64;
      *(_DWORD *)uint64_t v63 = 136446210;
      uint64_t v131 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v132);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v61, v62, "[%{public}s:ActionHandler] Not background delivered hiding", v63, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v64, -1, -1);
      MEMORY[0x245623AC0](v63, -1, -1);

      (*(void (**)(char *, uint64_t))(v128 + 8))(v27, v127);
      uint64_t v47 = 1;
      goto LABEL_14;
    }

    (*(void (**)(char *, uint64_t))(v128 + 8))(v27, v127);
    goto LABEL_13;
  }
  char v60 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v60) {
    goto LABEL_21;
  }
  uint64_t v65 = sub_24171F818();
  uint64_t v67 = v66;
  if (v65 == sub_24171F818() && v67 == v68)
  {
    swift_bridgeObjectRelease_n();
    a1 = v123;
LABEL_28:
    sub_24171F588();
    uint64_t v70 = sub_24171F5B8();
    os_log_type_t v71 = sub_24171F958();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = (uint8_t *)swift_slowAlloc();
      uint64_t v73 = swift_slowAlloc();
      uint64_t v132 = v73;
      *(_DWORD *)uint64_t v72 = 136446210;
      uint64_t v131 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v132);
      a1 = v123;
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v70, v71, "[%{public}s:ActionHandler] Country not supported on local device, treating as unavailable", v72, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v73, -1, -1);
      MEMORY[0x245623AC0](v72, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v128 + 8))(v24, v127);
    uint64_t v41 = v129;
    uint64_t v75 = (uint64_t)v125;
    id v74 = v126;
    uint64_t v76 = (uint64_t)v124;
    uint64_t v77 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    swift_storeEnumTagMultiPayload();
    char v78 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56);
    v78(v76, 0, 1, v77);
    v78(v75, 1, 1, v77);
    sub_2416EBACC(v76, v75);
    sub_24171009C(v75, a1);

    uint64_t v47 = 0;
    uint64_t v40 = v130;
    goto LABEL_16;
  }
  char v69 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1 = v123;
  if (v69) {
    goto LABEL_28;
  }
  uint64_t v79 = sub_24171F818();
  uint64_t v81 = v80;
  if (v79 == sub_24171F818() && v81 == v82)
  {
    swift_bridgeObjectRelease_n();
LABEL_35:
    sub_24171F588();
    uint64_t v84 = sub_24171F5B8();
    os_log_type_t v85 = sub_24171F958();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      uint64_t v132 = v87;
      *(_DWORD *)uint64_t v86 = 136446210;
      uint64_t v131 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v132);
      a1 = v123;
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v84, v85, "[%{public}s:ActionHandler] Age gated, treating as unavailable", v86, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v87, -1, -1);
      MEMORY[0x245623AC0](v86, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v128 + 8))(v21, v127);
LABEL_38:
    uint64_t v41 = v129;
    uint64_t v40 = v130;
    uint64_t v88 = (uint64_t)v125;
    id v42 = v126;
    uint64_t v89 = (uint64_t)v124;
    uint64_t v90 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
LABEL_39:
    swift_storeEnumTagMultiPayload();
    uint64_t v91 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v90 - 8) + 56);
    v91(v89, 0, 1, v90);
    v91(v88, 1, 1, v90);
    sub_2416EBACC(v89, v88);
    sub_24171009C(v88, a1);

LABEL_8:
    uint64_t v47 = 0;
LABEL_16:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(a1, v47, 1, v40);
    return;
  }
  char v83 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v83) {
    goto LABEL_35;
  }
  uint64_t v92 = sub_24171F818();
  uint64_t v94 = v93;
  if (v92 == sub_24171F818() && v94 == v95)
  {
    swift_bridgeObjectRelease_n();
LABEL_44:
    sub_24171F588();
    uint64_t v97 = sub_24171F5B8();
    os_log_type_t v98 = sub_24171F958();
    if (os_log_type_enabled(v97, v98))
    {
      uint64_t v99 = (uint8_t *)swift_slowAlloc();
      uint64_t v100 = swift_slowAlloc();
      uint64_t v132 = v100;
      *(_DWORD *)uint64_t v99 = 136446210;
      uint64_t v131 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v132);
      a1 = v123;
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v97, v98, "[%{public}s:ActionHandler] Capability not supported on phone, treating as unavailable", v99, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v100, -1, -1);
      MEMORY[0x245623AC0](v99, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v128 + 8))(v18, v127);
    goto LABEL_38;
  }
  char v96 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v96) {
    goto LABEL_44;
  }
  uint64_t v101 = sub_24171F818();
  uint64_t v103 = v102;
  if (v101 == sub_24171F818() && v103 == v104)
  {
    swift_bridgeObjectRelease_n();
LABEL_51:
    sub_24171F588();
    uint64_t v106 = sub_24171F5B8();
    os_log_type_t v107 = sub_24171F958();
    if (os_log_type_enabled(v106, v107))
    {
      uint64_t v108 = (uint8_t *)swift_slowAlloc();
      uint64_t v109 = swift_slowAlloc();
      uint64_t v132 = v109;
      *(_DWORD *)uint64_t v108 = 136446210;
      uint64_t v131 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v132);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v106, v107, "[%{public}s:ActionHandler] Fitness tracking is not enabled, treating as unavailable", v108, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v109, -1, -1);
      MEMORY[0x245623AC0](v108, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v128 + 8))(v15, v127);
    uint64_t v41 = v129;
    uint64_t v40 = v130;
    uint64_t v88 = (uint64_t)v125;
    id v42 = v126;
    uint64_t v90 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData.TapAction(0);
    uint64_t v89 = (uint64_t)v124;
    goto LABEL_39;
  }
  char v105 = sub_24171FD88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v105) {
    goto LABEL_51;
  }

  uint64_t v110 = v121;
  sub_24171F588();
  id v111 = v126;
  uint64_t v112 = sub_24171F5B8();
  os_log_type_t v113 = sub_24171F948();
  if (!os_log_type_enabled(v112, v113))
  {

    (*(void (**)(char *, uint64_t))(v128 + 8))(v110, v127);
    uint64_t v47 = 1;
    goto LABEL_15;
  }
  uint64_t v114 = swift_slowAlloc();
  id v126 = (id)swift_slowAlloc();
  uint64_t v132 = (uint64_t)v126;
  *(_DWORD *)uint64_t v114 = 136446466;
  uint64_t v131 = sub_2416E1FBC(0xD00000000000002DLL, 0x80000002417253B0, &v132);
  sub_24171FB18();
  *(_WORD *)(v114 + 12) = 2082;
  id v115 = objc_msgSend(v111, sel_highestPriorityUnsatisfiedRequirement);
  if (v115)
  {
    uint64_t v116 = v115;
    uint64_t v117 = sub_24171F818();
    unint64_t v119 = v118;

    uint64_t v131 = sub_2416E1FBC(v117, v119, &v132);
    sub_24171FB18();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2416DE000, v112, v113, "[%{public}s:ActionHandler] Unhandled, unsatisfied requirement encountered: %{public}s", (uint8_t *)v114, 0x16u);
    id v120 = v126;
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v120, -1, -1);
    MEMORY[0x245623AC0](v114, -1, -1);

    (*(void (**)(char *, uint64_t))(v128 + 8))(v110, v127);
    goto LABEL_13;
  }

  __break(1u);
}

uint64_t sub_24170BA40()
{
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v9 - v1;
  uint64_t v3 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_24171E8B8();
  sub_2416E70CC(v4, (uint64_t)qword_26B018E08);
  uint64_t v5 = sub_24171E9B8();
  uint64_t v7 = v6;
  uint64_t result = sub_2416FC1F8((uint64_t)v2);
  qword_26B018918 = v5;
  unk_26B018920 = v7;
  return result;
}

uint64_t sub_24170BBBC()
{
  uint64_t v0 = sub_24171E728();
  sub_2416E7068(v0, qword_26B0188F8);
  sub_2416E70CC(v0, (uint64_t)qword_26B0188F8);
  sub_241710158();
  sub_24171FAB8();
  return sub_24171E718();
}

uint64_t sub_24170BC38@<X0>(uint64_t a1@<X8>)
{
  v27[3] = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v27 - v3;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v1);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v27 - v6;
  uint64_t v8 = sub_24171E708();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v1);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v27 - v13;
  uint64_t v15 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_24171E8B8();
  sub_2416E70CC(v16, (uint64_t)qword_26B018E08);
  uint64_t v17 = sub_24171E9B8();
  uint64_t v19 = v18;
  sub_2416FC1F8((uint64_t)v14);
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  v27[2] = qword_26B018918;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F435B8], v8);
  uint64_t v20 = qword_26B018910;
  sub_24171EF98();
  v27[1] = v11;
  if (v20 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_24171E728();
  uint64_t v22 = sub_2416E70CC(v21, (uint64_t)qword_26B0188F8);
  uint64_t v23 = *(void *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v7, v22, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v7, 0, 1, v21);
  sub_241710100();
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_241720620;
  *(void *)(v24 + 32) = v17;
  *(void *)(v24 + 40) = v19;
  sub_24171EF98();
  sub_24171E778();
  MEMORY[0x245621E40](v17, v19);
  swift_bridgeObjectRelease();
  sub_24171E778();
  uint64_t v25 = sub_24171E208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v4, 1, 1, v25);
  return sub_24171E808();
}

uint64_t sub_24170C120@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  id v30 = (char *)v29 - v3;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v1);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v29 - v5;
  uint64_t v7 = sub_24171E708();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v1);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v29 - v12;
  uint64_t v14 = self;
  uint64_t v15 = (void *)sub_24171F7D8();
  id v16 = objc_msgSend(v14, sel_modelSpecificLocalizedStringKeyForKey_, v15);

  if (v16)
  {
    sub_24171F818();
  }
  uint64_t v17 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v13, 1, 1, v17);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_24171E8B8();
  sub_2416E70CC(v18, (uint64_t)qword_26B018E08);
  uint64_t v19 = sub_24171E9B8();
  uint64_t v21 = v20;
  swift_bridgeObjectRelease();
  sub_2416FC1F8((uint64_t)v13);
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  v29[1] = qword_26B018918;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F435B8], v7);
  uint64_t v22 = qword_26B018910;
  sub_24171EF98();
  v29[0] = v10;
  if (v22 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_24171E728();
  uint64_t v24 = sub_2416E70CC(v23, (uint64_t)qword_26B0188F8);
  uint64_t v25 = *(void *)(v23 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v6, v24, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v6, 0, 1, v23);
  sub_241710100();
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_241720620;
  *(void *)(v26 + 32) = v19;
  *(void *)(v26 + 40) = v21;
  sub_24171EF98();
  sub_24171E778();
  MEMORY[0x245621E40](v19, v21);
  swift_bridgeObjectRelease();
  sub_24171E778();
  uint64_t v27 = sub_24171E208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v30, 1, 1, v27);
  return sub_24171E808();
}

uint64_t sub_24170C688@<X0>(uint64_t a1@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v40 = (char *)&v31 - v3;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v1);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v39 = (char *)&v31 - v5;
  uint64_t v33 = sub_24171E708();
  uint64_t v6 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  os_log_type_t v37 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v1);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v31 - v9;
  uint64_t v11 = sub_24171E288();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v14 = v12 + 56;
  v13(v10, 1, 1, v11);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_24171E8B8();
  sub_2416E70CC(v15, (uint64_t)qword_26B018E08);
  uint64_t v16 = sub_24171E9B8();
  uint64_t v18 = v17;
  sub_2416FC1F8((uint64_t)v10);
  uint64_t v38 = v13;
  uint64_t v34 = v14;
  v13(v10, 1, 1, v11);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v10);
  sub_2417101F0(0, &qword_268D24BF8, (uint64_t (*)(uint64_t))sub_241710198, MEMORY[0x263F8E0F8]);
  uint64_t v19 = swift_allocObject();
  long long v31 = xmmword_241720620;
  *(_OWORD *)(v19 + 16) = xmmword_241720620;
  *(void *)(v19 + 56) = MEMORY[0x263F8D310];
  *(void *)(v19 + 64) = sub_241705E98();
  uint64_t v35 = v18;
  uint64_t v36 = v16;
  *(void *)(v19 + 32) = v16;
  *(void *)(v19 + 40) = v18;
  sub_24171EF98();
  uint64_t v20 = sub_24171F7E8();
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  uint64_t v32 = qword_26B018918;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v37, *MEMORY[0x263F435C0], v33);
  uint64_t v23 = qword_26B018910;
  sub_24171EF98();
  if (v23 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_24171E728();
  uint64_t v25 = sub_2416E70CC(v24, (uint64_t)qword_26B0188F8);
  uint64_t v26 = *(void *)(v24 - 8);
  uint64_t v27 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v39, v25, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v27, 0, 1, v24);
  sub_241710100();
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = v31;
  *(void *)(v28 + 32) = v20;
  *(void *)(v28 + 40) = v22;
  v38(v10, 1, 1, v11);
  sub_24171EF98();
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v10);
  uint64_t v29 = sub_24171E208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v40, 1, 1, v29);
  return sub_24171E808();
}

uint64_t sub_24170CD00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v35 = (char *)v29 - v3;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v1);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v34 = (char *)v29 - v5;
  uint64_t v33 = sub_24171E708();
  uint64_t v31 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v1);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v29 - v9;
  uint64_t v11 = sub_24171E288();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24171E8B8();
  sub_2416E70CC(v13, (uint64_t)qword_26B018E08);
  uint64_t v14 = sub_24171E9B8();
  uint64_t v16 = v15;
  sub_2416FC1F8((uint64_t)v10);
  v12(v10, 1, 1, v11);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v10);
  sub_2417101F0(0, &qword_268D24BF8, (uint64_t (*)(uint64_t))sub_241710198, MEMORY[0x263F8E0F8]);
  uint64_t v17 = swift_allocObject();
  long long v30 = xmmword_241720620;
  *(_OWORD *)(v17 + 16) = xmmword_241720620;
  *(void *)(v17 + 56) = MEMORY[0x263F8D310];
  *(void *)(v17 + 64) = sub_241705E98();
  uint64_t v32 = v14;
  *(void *)(v17 + 32) = v14;
  *(void *)(v17 + 40) = v16;
  sub_24171EF98();
  uint64_t v18 = sub_24171F7E8();
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  v29[1] = qword_26B018918;
  (*(void (**)(char *, void, uint64_t))(v31 + 104))(v7, *MEMORY[0x263F435C0], v33);
  uint64_t v21 = qword_26B018910;
  sub_24171EF98();
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_24171E728();
  uint64_t v23 = sub_2416E70CC(v22, (uint64_t)qword_26B0188F8);
  uint64_t v24 = *(void *)(v22 - 8);
  uint64_t v25 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v34, v23, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v25, 0, 1, v22);
  sub_241710100();
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = v30;
  *(void *)(v26 + 32) = v18;
  *(void *)(v26 + 40) = v20;
  sub_24171EF98();
  sub_24171E798();
  uint64_t v27 = sub_24171E208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v35, 1, 1, v27);
  return sub_24171E808();
}

uint64_t sub_24170D2F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v33 = (char *)v30 - v3;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v1);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v30 - v5;
  uint64_t v7 = sub_24171E708();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v1);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v30 - v12;
  uint64_t v14 = sub_24171E7B8();
  uint64_t v16 = v15;
  uint64_t v17 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v13, 1, 1, v17);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_24171E8B8();
  sub_2416E70CC(v18, (uint64_t)qword_26B018E08);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v13);
  sub_2417101F0(0, &qword_268D24BF8, (uint64_t (*)(uint64_t))sub_241710198, MEMORY[0x263F8E0F8]);
  uint64_t v19 = swift_allocObject();
  long long v31 = xmmword_241720620;
  *(_OWORD *)(v19 + 16) = xmmword_241720620;
  *(void *)(v19 + 56) = MEMORY[0x263F8D310];
  *(void *)(v19 + 64) = sub_241705E98();
  uint64_t v32 = v14;
  *(void *)(v19 + 32) = v14;
  *(void *)(v19 + 40) = v16;
  sub_24171EF98();
  uint64_t v20 = sub_24171F7E8();
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  v30[1] = qword_26B018918;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F435C0], v7);
  uint64_t v23 = qword_26B018910;
  sub_24171EF98();
  if (v23 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_24171E728();
  uint64_t v25 = sub_2416E70CC(v24, (uint64_t)qword_26B0188F8);
  uint64_t v26 = *(void *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v6, v25, v24);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v6, 0, 1, v24);
  sub_241710100();
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = v31;
  *(void *)(v27 + 32) = v20;
  *(void *)(v27 + 40) = v22;
  sub_24171EF98();
  sub_24171E798();
  uint64_t v28 = sub_24171E208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v33, 1, 1, v28);
  return sub_24171E808();
}

uint64_t sub_24170D87C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v41 = (char *)&v30 - v3;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v1);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v40 = (char *)&v30 - v5;
  uint64_t v39 = sub_24171E708();
  uint64_t v37 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v1);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v30 - v9;
  uint64_t v11 = sub_24171E288();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24171E8B8();
  sub_2416E70CC(v13, (uint64_t)qword_26B018E08);
  uint64_t v14 = sub_24171E9B8();
  uint64_t v33 = v15;
  uint64_t v34 = v14;
  sub_2416FC1F8((uint64_t)v10);
  v12(v10, 1, 1, v11);
  uint64_t v16 = sub_24171E9B8();
  uint64_t v18 = v17;
  sub_2416FC1F8((uint64_t)v10);
  uint64_t v35 = v12;
  v12(v10, 1, 1, v11);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v10);
  sub_2417101F0(0, &qword_268D24BF8, (uint64_t (*)(uint64_t))sub_241710198, MEMORY[0x263F8E0F8]);
  uint64_t v19 = swift_allocObject();
  long long v30 = xmmword_241720620;
  *(_OWORD *)(v19 + 16) = xmmword_241720620;
  *(void *)(v19 + 56) = MEMORY[0x263F8D310];
  *(void *)(v19 + 64) = sub_241705E98();
  uint64_t v38 = v16;
  *(void *)(v19 + 32) = v16;
  *(void *)(v19 + 40) = v18;
  uint64_t v36 = v18;
  sub_24171EF98();
  uint64_t v31 = sub_24171F7E8();
  uint64_t v32 = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  (*(void (**)(char *, void, uint64_t))(v37 + 104))(v7, *MEMORY[0x263F435C0], v39);
  uint64_t v21 = qword_26B018910;
  sub_24171EF98();
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_24171E728();
  uint64_t v23 = sub_2416E70CC(v22, (uint64_t)qword_26B0188F8);
  uint64_t v24 = *(void *)(v22 - 8);
  uint64_t v25 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v40, v23, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v25, 0, 1, v22);
  sub_241710100();
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = v30;
  uint64_t v27 = v33;
  *(void *)(v26 + 32) = v34;
  *(void *)(v26 + 40) = v27;
  v35(v10, 1, 1, v11);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v10);
  uint64_t v28 = sub_24171E208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v41, 1, 1, v28);
  return sub_24171E808();
}

uint64_t sub_24170DF50@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v39[6] = a2;
  uint64_t v40 = a1;
  uint64_t v42 = a3;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, &qword_26B018A78, MEMORY[0x263F45848], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v41 = (char *)v39 - v5;
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v3);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v39 - v7;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v3);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v39 - v10;
  uint64_t v12 = sub_24171E708();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  uint64_t v16 = unk_26B018920;
  v39[3] = qword_26B018918;
  uint64_t v17 = *MEMORY[0x263F435D0];
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 104);
  v39[4] = v15;
  v18(v15, v17, v12);
  uint64_t v19 = qword_26B018910;
  v39[2] = v16;
  sub_24171EF98();
  if (v19 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_24171E728();
  uint64_t v21 = sub_2416E70CC(v20, (uint64_t)qword_26B0188F8);
  uint64_t v22 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v11, v21, v20);
  uint64_t v23 = *(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56);
  void v39[5] = v11;
  v23(v11, 0, 1, v20);
  uint64_t v24 = sub_24171E768();
  v39[0] = v25;
  v39[1] = v24;
  sub_241710100();
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_241720600;
  uint64_t v27 = sub_24171E288();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56);
  v28(v8, 1, 1, v27);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_24171E8B8();
  sub_2416E70CC(v29, (uint64_t)qword_26B018E08);
  uint64_t v30 = sub_24171E9B8();
  uint64_t v32 = v31;
  sub_2416FC1F8((uint64_t)v8);
  *(void *)(v26 + 32) = v30;
  *(void *)(v26 + 40) = v32;
  v28(v8, 1, 1, v27);
  uint64_t v33 = sub_24171E9B8();
  uint64_t v35 = v34;
  uint64_t v36 = sub_2416FC1F8((uint64_t)v8);
  *(void *)(v26 + 48) = v33;
  *(void *)(v26 + 56) = v35;
  if (v40(v36)) {
    sub_24171E788();
  }
  uint64_t v37 = sub_24171E538();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v41, 1, 1, v37);
  return sub_24171E818();
}

uint64_t sub_24170E4B4@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v37[6] = a2;
  uint64_t v38 = a1;
  uint64_t v40 = a3;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, &qword_26B018A78, MEMORY[0x263F45848], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v39 = (char *)v37 - v5;
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v3);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v37 - v7;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v3);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v37 - v10;
  uint64_t v12 = sub_24171E708();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  uint64_t v16 = unk_26B018920;
  v37[3] = qword_26B018918;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F435D0], v12);
  uint64_t v17 = qword_26B018910;
  v37[2] = v16;
  sub_24171EF98();
  if (v17 != -1) {
    swift_once();
  }
  v37[4] = v15;
  uint64_t v18 = sub_24171E728();
  uint64_t v19 = sub_2416E70CC(v18, (uint64_t)qword_26B0188F8);
  uint64_t v20 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v11, v19, v18);
  uint64_t v21 = *(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56);
  uint64_t v37[5] = v11;
  v21(v11, 0, 1, v18);
  uint64_t v22 = sub_24171E288();
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
  v23(v8, 1, 1, v22);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_24171E8B8();
  sub_2416E70CC(v24, (uint64_t)qword_26B018E08);
  uint64_t v25 = sub_24171E9B8();
  v37[0] = v26;
  v37[1] = v25;
  sub_2416FC1F8((uint64_t)v8);
  sub_241710100();
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_241720600;
  v23(v8, 1, 1, v22);
  uint64_t v28 = sub_24171E9B8();
  uint64_t v30 = v29;
  sub_2416FC1F8((uint64_t)v8);
  *(void *)(v27 + 32) = v28;
  *(void *)(v27 + 40) = v30;
  v23(v8, 1, 1, v22);
  uint64_t v31 = sub_24171E9B8();
  uint64_t v33 = v32;
  uint64_t v34 = sub_2416FC1F8((uint64_t)v8);
  *(void *)(v27 + 48) = v31;
  *(void *)(v27 + 56) = v33;
  if (v38(v34)) {
    sub_24171E788();
  }
  uint64_t v35 = sub_24171E538();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v39, 1, 1, v35);
  return sub_24171E818();
}

uint64_t sub_24170EA78@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v35[4] = a2;
  uint64_t v36 = a1;
  uint64_t v38 = a3;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, &qword_26B018A78, MEMORY[0x263F45848], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v37 = (char *)v35 - v5;
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v3);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v35 - v7;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v3);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v35 - v10;
  uint64_t v12 = sub_24171E708();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  uint64_t v16 = unk_26B018920;
  v35[1] = qword_26B018918;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F435C8], v12);
  uint64_t v17 = qword_26B018910;
  v35[0] = v16;
  sub_24171EF98();
  if (v17 != -1) {
    swift_once();
  }
  v35[2] = v15;
  uint64_t v18 = sub_24171E728();
  uint64_t v19 = sub_2416E70CC(v18, (uint64_t)qword_26B0188F8);
  uint64_t v20 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v11, v19, v18);
  uint64_t v21 = *(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56);
  void v35[3] = v11;
  v21(v11, 0, 1, v18);
  sub_241710100();
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_241720600;
  uint64_t v23 = sub_24171E288();
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
  v24(v8, 1, 1, v23);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_24171E8B8();
  sub_2416E70CC(v25, (uint64_t)qword_26B018E08);
  uint64_t v26 = sub_24171E9B8();
  uint64_t v28 = v27;
  sub_2416FC1F8((uint64_t)v8);
  *(void *)(v22 + 32) = v26;
  *(void *)(v22 + 40) = v28;
  v24(v8, 1, 1, v23);
  uint64_t v29 = sub_24171E9B8();
  uint64_t v31 = v30;
  uint64_t v32 = sub_2416FC1F8((uint64_t)v8);
  *(void *)(v22 + 48) = v29;
  *(void *)(v22 + 56) = v31;
  if (v36(v32)) {
    sub_24171E788();
  }
  uint64_t v33 = sub_24171E538();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v37, 1, 1, v33);
  return sub_24171E818();
}

uint64_t sub_24170EFD0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v35[4] = a2;
  uint64_t v36 = a1;
  uint64_t v38 = a3;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, &qword_26B018A78, MEMORY[0x263F45848], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v37 = (char *)v35 - v5;
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v3);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v35 - v7;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v3);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v35 - v10;
  uint64_t v12 = sub_24171E708();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  uint64_t v16 = unk_26B018920;
  void v35[3] = qword_26B018918;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F435D0], v12);
  uint64_t v17 = qword_26B018910;
  v35[2] = v16;
  sub_24171EF98();
  if (v17 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_24171E728();
  uint64_t v19 = sub_2416E70CC(v18, (uint64_t)qword_26B0188F8);
  uint64_t v20 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v11, v19, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v11, 0, 1, v18);
  uint64_t v21 = sub_24171E288();
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  v22(v8, 1, 1, v21);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_24171E8B8();
  sub_2416E70CC(v23, (uint64_t)qword_26B018E08);
  v35[1] = sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v8);
  sub_241710100();
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_241720600;
  v22(v8, 1, 1, v21);
  uint64_t v25 = sub_24171E9B8();
  uint64_t v27 = v26;
  sub_2416FC1F8((uint64_t)v8);
  *(void *)(v24 + 32) = v25;
  *(void *)(v24 + 40) = v27;
  type metadata accessor for MobilityAppPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v29 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v30 = sub_24171E1B8();
  uint64_t v32 = v31;

  *(void *)(v24 + 48) = v30;
  *(void *)(v24 + 56) = v32;
  if (v36()) {
    sub_24171E788();
  }
  uint64_t v33 = sub_24171E538();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v37, 1, 1, v33);
  return sub_24171E818();
}

uint64_t sub_24170F5B8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v36[3] = a2;
  uint64_t v37 = a1;
  uint64_t v38 = a3;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, &qword_26B018A78, MEMORY[0x263F45848], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v36 - v5;
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v3);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v36 - v8;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v3);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v36 - v11;
  uint64_t v13 = sub_24171E708();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  long long v36[2] = qword_26B018918;
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F435D0], v13);
  uint64_t v17 = qword_26B018910;
  sub_24171EF98();
  if (v17 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_24171E728();
  uint64_t v19 = sub_2416E70CC(v18, (uint64_t)qword_26B0188F8);
  uint64_t v20 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v12, v19, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v12, 0, 1, v18);
  uint64_t v21 = sub_24171E768();
  v36[0] = v22;
  v36[1] = v21;
  sub_241710100();
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_241720600;
  uint64_t v24 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v9, 1, 1, v24);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_24171E8B8();
  sub_2416E70CC(v25, (uint64_t)qword_26B018E08);
  uint64_t v26 = sub_24171E9B8();
  uint64_t v28 = v27;
  sub_2416FC1F8((uint64_t)v9);
  *(void *)(v23 + 32) = v26;
  *(void *)(v23 + 40) = v28;
  type metadata accessor for MobilityAppPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v30 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v31 = sub_24171E1B8();
  uint64_t v33 = v32;

  *(void *)(v23 + 48) = v31;
  *(void *)(v23 + 56) = v33;
  if (v37()) {
    sub_24171E788();
  }
  uint64_t v34 = sub_24171E538();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v6, 1, 1, v34);
  return sub_24171E818();
}

uint64_t sub_24170FB30@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v34[1] = a2;
  uint64_t v35 = a1;
  uint64_t v36 = a3;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_2417101F0(0, &qword_26B018A78, MEMORY[0x263F45848], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v34 - v5;
  sub_2417101F0(0, &qword_26B018CA8, MEMORY[0x263F07690], v3);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v34 - v8;
  sub_2417101F0(0, &qword_26B018A80, MEMORY[0x263F43658], v3);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v34 - v11;
  uint64_t v13 = sub_24171E708();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B0184B8 != -1) {
    swift_once();
  }
  v34[0] = qword_26B018918;
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F435C8], v13);
  uint64_t v17 = qword_26B018910;
  sub_24171EF98();
  if (v17 != -1) {
    swift_once();
  }
  uint64_t v18 = sub_24171E728();
  uint64_t v19 = sub_2416E70CC(v18, (uint64_t)qword_26B0188F8);
  uint64_t v20 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v12, v19, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v12, 0, 1, v18);
  sub_241710100();
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_241720600;
  uint64_t v22 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v9, 1, 1, v22);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_24171E8B8();
  sub_2416E70CC(v23, (uint64_t)qword_26B018E08);
  uint64_t v24 = sub_24171E9B8();
  uint64_t v26 = v25;
  sub_2416FC1F8((uint64_t)v9);
  *(void *)(v21 + 32) = v24;
  *(void *)(v21 + 40) = v26;
  type metadata accessor for MobilityAppPluginDelegate();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v28 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v29 = sub_24171E1B8();
  uint64_t v31 = v30;

  *(void *)(v21 + 48) = v29;
  *(void *)(v21 + 56) = v31;
  if (v35()) {
    sub_24171E788();
  }
  uint64_t v32 = sub_24171E538();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v6, 1, 1, v32);
  return sub_24171E818();
}

uint64_t sub_24171009C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WalkingSteadinessFeatureStatusActionHandlerUserData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_241710100()
{
  if (!qword_26B018450)
  {
    unint64_t v0 = sub_24171FD68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B018450);
    }
  }
}

unint64_t sub_241710158()
{
  unint64_t result = qword_26B018420;
  if (!qword_26B018420)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B018420);
  }
  return result;
}

unint64_t sub_241710198()
{
  unint64_t result = qword_268D24C00;
  if (!qword_268D24C00)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_268D24C00);
  }
  return result;
}

void sub_2417101F0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_241710254()
{
  return swift_deallocClassInstance();
}

uint64_t _s37WalkingSteadinessFitnessPlusComponentCMa()
{
  return self;
}

uint64_t sub_2417102B0()
{
  if (qword_268D24538 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_268D24ED8;
  sub_24171EF98();
  return v0;
}

uint64_t sub_24171031C()
{
  v18[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = sub_24171E248();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24171F138();
  uint64_t v4 = sub_24171ECD8();
  uint64_t v6 = v5;
  if (v4 == sub_24171ECD8() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v8 = sub_24171FD88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      return 0;
    }
  }
  uint64_t v9 = (void *)sub_24171F128();
  v18[0] = 0;
  id v10 = objc_msgSend(v9, sel_dateOfBirthComponentsWithError_, v18);

  if (v10)
  {
    id v11 = v18[0];
    sub_24171E238();
    uint64_t v12 = (void *)sub_24171E218();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    id v13 = objc_msgSend(v10, sel_hk_ageWithCurrentDate_, v12);
  }
  else
  {
    id v14 = v18[0];
    uint64_t v15 = (void *)sub_24171E1C8();

    swift_willThrow();
    id v13 = 0;
  }
  return sub_241717CC0((uint64_t)v13, v10 == 0);
}

uint64_t sub_24171053C()
{
  uint64_t v49 = *v0;
  uint64_t v50 = sub_24171EED8();
  uint64_t v48 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  BOOL v51 = (char *)v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_24171ED88();
  uint64_t v44 = *(void *)(v2 - 8);
  uint64_t v45 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v47 = (char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24171EC88();
  uint64_t v42 = *(void *)(v4 - 8);
  uint64_t v43 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v46 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_24171E298();
  uint64_t v39 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v37 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_24171E2B8();
  uint64_t v38 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  char v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24171E248();
  MEMORY[0x270FA5388](v9 - 8);
  id v10 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_241714FDC(0, &qword_268D24C20, MEMORY[0x263F063B0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)v34 - v12;
  uint64_t v36 = sub_24171EFB8();
  uint64_t v35 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v15 = (char *)v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241714FDC(0, &qword_26B018CA8, MEMORY[0x263F07690], v10);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)v34 - v17;
  uint64_t v19 = sub_24171E288();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  v20(v18, 1, 1, v19);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_24171E8B8();
  sub_2416E70CC(v21, (uint64_t)qword_26B018E08);
  v34[1] = sub_24171E9B8();
  v34[0] = v22;
  sub_2416FC1F8((uint64_t)v18);
  uint64_t v23 = sub_24171E198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v13, 1, 1, v23);
  sub_24171E228();
  sub_24171EFA8();
  v20(v18, 1, 1, v19);
  uint64_t v24 = sub_24171E9B8();
  uint64_t v26 = v25;
  sub_2416FC1F8((uint64_t)v18);
  uint64_t v27 = v39;
  id v28 = v37;
  uint64_t v29 = v41;
  (*(void (**)(char *, void, uint64_t))(v39 + 104))(v37, *MEMORY[0x263F07740], v41);
  sub_24171E2A8();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
  MEMORY[0x2456224A0](v15, v24, v26, MEMORY[0x263F8EE88], v8);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v40);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v36);
  v53[3] = sub_24171EF88();
  v53[4] = MEMORY[0x263F44278];
  sub_2416E2980(v53);
  sub_24171EF78();
  (*(void (**)(char *, void, uint64_t))(v42 + 104))(v46, *MEMORY[0x263F43D68], v43);
  (*(void (**)(char *, void, uint64_t))(v44 + 104))(v47, *MEMORY[0x263F43EE0], v45);
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = v48;
  *(void *)(v30 + 16) = v49;
  (*(void (**)(char *, void, uint64_t))(v31 + 104))(v51, *MEMORY[0x263F440C0], v50);
  v52[3] = sub_24171ECA8();
  v52[4] = MEMORY[0x263F43D78];
  sub_2416E2980(v52);
  sub_24171EC98();
  id v32 = objc_allocWithZone((Class)sub_24171EEC8());
  return sub_24171EEB8();
}

uint64_t sub_241710D78(uint64_t a1)
{
  sub_241714FDC(0, &qword_268D24C28, MEMORY[0x263F43AC8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v10[-v3];
  uint64_t v5 = sub_24171EA98();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v11 = a1;
  uint64_t v12[3] = sub_24171EAB8();
  v12[4] = MEMORY[0x263F43AD0];
  sub_2416E2980(v12);
  sub_24171EAA8();
  uint64_t v6 = sub_24171EF68();
  sub_2416E2090((uint64_t)v12);
  sub_2417144D8(0, &qword_268D24C30, &qword_268D24C38, &qword_268D24C40);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_241720620;
  *(void *)(v7 + 32) = v6;
  uint64_t v8 = MEMORY[0x2456225F0]();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_241710F40()
{
  uint64_t v0 = sub_24171EDA8();
  uint64_t v1 = MEMORY[0x263F43EE8];
  uint64_t v12 = v0;
  uint64_t v13 = MEMORY[0x263F43EE8];
  sub_2416E2980(v11);
  sub_24171ED98();
  uint64_t v2 = sub_24171EE28();
  sub_2416E2090((uint64_t)v11);
  uint64_t v12 = v0;
  uint64_t v13 = v1;
  sub_2416E2980(v11);
  sub_24171ED98();
  uint64_t v3 = sub_24171EE28();
  sub_2416E2090((uint64_t)v11);
  uint64_t v12 = v0;
  uint64_t v13 = v1;
  sub_2416E2980(v11);
  sub_24171ED98();
  uint64_t v4 = sub_24171EE28();
  sub_2416E2090((uint64_t)v11);
  uint64_t v12 = v0;
  uint64_t v13 = v1;
  sub_2416E2980(v11);
  sub_24171ED98();
  uint64_t v5 = sub_24171EE28();
  sub_2416E2090((uint64_t)v11);
  uint64_t v12 = v0;
  uint64_t v13 = v1;
  sub_2416E2980(v11);
  sub_24171ED98();
  uint64_t v6 = sub_24171EE28();
  sub_2416E2090((uint64_t)v11);
  uint64_t v12 = v0;
  uint64_t v13 = v1;
  sub_2416E2980(v11);
  sub_24171ED98();
  uint64_t v7 = sub_24171EE28();
  sub_2416E2090((uint64_t)v11);
  sub_2417144D8(0, &qword_268D24C48, &qword_268D24C50, &qword_26B0183A8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_241722C00;
  *(void *)(v8 + 32) = v2;
  *(void *)(v8 + 40) = v3;
  *(void *)(v8 + 48) = v4;
  *(void *)(v8 + 56) = v5;
  *(void *)(v8 + 64) = v6;
  *(void *)(v8 + 72) = v7;
  uint64_t v9 = MEMORY[0x2456224B0]();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_2417111AC()
{
  sub_24171EAF8();
  v4[3] = sub_24171F4C8();
  v4[4] = MEMORY[0x263F448B8];
  sub_2416E2980(v4);
  sub_24171F4B8();
  uint64_t v0 = sub_24171EE28();
  sub_2416E2090((uint64_t)v4);
  sub_2417144D8(0, &qword_268D24C48, &qword_268D24C50, &qword_26B0183A8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_241720620;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = MEMORY[0x2456224B0]();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_241711290()
{
  uint64_t v0 = sub_24171ECB8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241714FDC(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v24 - v5;
  uint64_t v7 = sub_24171E288();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v24[1] = v8 + 56;
  uint64_t v25 = v9;
  v9(v6, 1, 1, v7);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24171E8B8();
  sub_2416E70CC(v10, (uint64_t)qword_26B018E08);
  uint64_t v11 = sub_24171E9B8();
  uint64_t v13 = v12;
  sub_2416FC1F8((uint64_t)v6);
  uint64_t v14 = *MEMORY[0x263F43D88];
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v15(v3, v14, v0);
  uint64_t v16 = sub_24171EB58();
  v24[0] = v0;
  uint64_t v17 = v16;
  uint64_t v27 = sub_24171F498();
  uint64_t v28 = MEMORY[0x263F44898];
  sub_2416E2980(v26);
  MEMORY[0x245622B40](v11, v13, v3, v17);
  uint64_t v18 = sub_24171EE28();
  sub_2416E2090((uint64_t)v26);
  v25(v6, 1, 1, v7);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v6);
  uint64_t v19 = ((uint64_t (*)(char *, uint64_t, void))v15)(v3, v14, v24[0]);
  MEMORY[0x2456221C0](v19);
  uint64_t v27 = sub_24171F468();
  uint64_t v28 = MEMORY[0x263F44830];
  sub_2416E2980(v26);
  sub_24171F458();
  uint64_t v20 = sub_24171EE28();
  sub_2416E2090((uint64_t)v26);
  sub_2417144D8(0, &qword_268D24C48, &qword_268D24C50, &qword_26B0183A8);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_241720600;
  *(void *)(v21 + 32) = v18;
  *(void *)(v21 + 40) = v20;
  uint64_t v22 = MEMORY[0x2456224B0]();
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_241711658(uint64_t a1)
{
  v25[3] = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_241714FDC(0, &qword_26B0183B0, MEMORY[0x263F44888], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v25 - v3;
  sub_241714FDC(0, &qword_26B018CA8, MEMORY[0x263F07690], v1);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v25 - v6;
  uint64_t v8 = sub_24171E288();
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24171E8B8();
  sub_2416E70CC(v10, (uint64_t)qword_26B018E08);
  void v25[2] = sub_24171E9B8();
  v25[1] = v11;
  sub_2416FC1F8((uint64_t)v7);
  sub_241714FDC(0, &qword_268D24C58, (uint64_t (*)(uint64_t))sub_241714534, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  long long v26 = xmmword_241720620;
  uint64_t v13 = (void **)MEMORY[0x263F814F0];
  *(_OWORD *)(inited + 16) = xmmword_241720620;
  uint64_t v14 = *v13;
  *(void *)(inited + 32) = *v13;
  uint64_t v15 = self;
  double v16 = *MEMORY[0x263F81840];
  id v17 = v14;
  id v18 = objc_msgSend(v15, sel_systemFontOfSize_weight_, 14.0, v16);
  *(void *)(inited + 64) = sub_2416FA7F4(0, &qword_268D24C60);
  *(void *)(inited + 40) = v18;
  sub_241701368(inited);
  sub_241711B28(0x6174536F54746953, 0xEA0000000000646ELL);
  v9(v7, 1, 1, v8);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v7);
  sub_24171EAE8();
  sub_24171F478();
  uint64_t v19 = sub_24171F488();
  uint64_t v20 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v4, 0, 1, v19);
  MEMORY[0x2456221C0](v20);
  sub_24171EAF8();
  sub_24171EB08();
  v27[3] = sub_24171EA88();
  void v27[4] = MEMORY[0x263F43AC0];
  sub_2416E2980(v27);
  sub_24171EA78();
  uint64_t v21 = sub_24171EE28();
  sub_2416E2090((uint64_t)v27);
  sub_2417144D8(0, &qword_268D24C48, &qword_268D24C50, &qword_26B0183A8);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = v26;
  *(void *)(v22 + 32) = v21;
  uint64_t v23 = MEMORY[0x2456224B0]();
  swift_bridgeObjectRelease();
  return v23;
}

id sub_241711B28(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_24171F5C8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = qword_26B018CF8;
  sub_24171EF98();
  if (v8 != -1) {
    swift_once();
  }
  id v9 = (id)qword_26B018E00;
  uint64_t v10 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  unint64_t v11 = 0x263F82000uLL;
  id v12 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v10, v9, 0);

  if (!v12)
  {
    sub_24171F598();
    swift_bridgeObjectRetain_n();
    uint64_t v13 = sub_24171F5B8();
    os_log_type_t v14 = sub_24171F948();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v23 = v21;
      *(_DWORD *)uint64_t v15 = 136315394;
      uint64_t v16 = sub_24171FE48();
      uint64_t v22 = sub_2416E1FBC(v16, v17, &v23);
      uint64_t v20 = v5;
      unint64_t v11 = 0x263F82000;
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      sub_24171EF98();
      uint64_t v22 = sub_2416E1FBC(a1, a2, &v23);
      sub_24171FB18();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2416DE000, v13, v14, "[%s] Image named: %s not found for Improved Walking Steadiness", (uint8_t *)v15, 0x16u);
      uint64_t v18 = v21;
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v18, -1, -1);
      MEMORY[0x245623AC0](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v4);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    return objc_msgSend(objc_allocWithZone(*(Class *)(v11 + 2024)), sel_init);
  }
  return v12;
}

uint64_t sub_241711E4C()
{
  return sub_241712390(0xD000000000000016, 0x8000000241725CD0, 0xD000000000000011, 0x8000000241725CF0);
}

uint64_t sub_241711E84(uint64_t a1)
{
  v25[3] = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_241714FDC(0, &qword_26B0183B0, MEMORY[0x263F44888], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v25 - v3;
  sub_241714FDC(0, &qword_26B018CA8, MEMORY[0x263F07690], v1);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v25 - v6;
  uint64_t v8 = sub_24171E288();
  id v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24171E8B8();
  sub_2416E70CC(v10, (uint64_t)qword_26B018E08);
  void v25[2] = sub_24171E9B8();
  v25[1] = v11;
  sub_2416FC1F8((uint64_t)v7);
  sub_241714FDC(0, &qword_268D24C58, (uint64_t (*)(uint64_t))sub_241714534, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  long long v26 = xmmword_241720620;
  uint64_t v13 = (void **)MEMORY[0x263F814F0];
  *(_OWORD *)(inited + 16) = xmmword_241720620;
  os_log_type_t v14 = *v13;
  *(void *)(inited + 32) = *v13;
  uint64_t v15 = self;
  double v16 = *MEMORY[0x263F81840];
  id v17 = v14;
  id v18 = objc_msgSend(v15, sel_systemFontOfSize_weight_, 14.0, v16);
  *(void *)(inited + 64) = sub_2416FA7F4(0, &qword_268D24C60);
  *(void *)(inited + 40) = v18;
  sub_241701368(inited);
  sub_241711B28(0x73696152666C6143, 0xEA00000000007365);
  v9(v7, 1, 1, v8);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v7);
  sub_24171EAE8();
  sub_24171F478();
  uint64_t v19 = sub_24171F488();
  uint64_t v20 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v4, 0, 1, v19);
  MEMORY[0x2456221C0](v20);
  sub_24171EAF8();
  sub_24171EB08();
  v27[3] = sub_24171EA88();
  void v27[4] = MEMORY[0x263F43AC0];
  sub_2416E2980(v27);
  sub_24171EA78();
  uint64_t v21 = sub_24171EE28();
  sub_2416E2090((uint64_t)v27);
  sub_2417144D8(0, &qword_268D24C48, &qword_268D24C50, &qword_26B0183A8);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = v26;
  *(void *)(v22 + 32) = v21;
  uint64_t v23 = MEMORY[0x2456224B0]();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_241712354()
{
  return sub_241712390(0xD000000000000015, 0x8000000241725C70, 0xD000000000000010, 0x8000000241725C90);
}

uint64_t sub_241712390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v49 = a3;
  uint64_t v50 = a4;
  uint64_t v4 = sub_24171F468();
  uint64_t v52 = *(void *)(v4 - 8);
  uint64_t v53 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v57 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v56 = (char *)&v43 - v7;
  uint64_t v8 = sub_24171ECB8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241714FDC(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v12 - 8);
  os_log_type_t v14 = (char *)&v43 - v13;
  uint64_t v55 = sub_24171EAC8();
  uint64_t v51 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  id v58 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_24171E288();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = v16;
  uint64_t v54 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 56);
  uint64_t v48 = v17 + 56;
  v54(v14, 1, 1);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_24171E8B8();
  uint64_t v45 = sub_2416E70CC(v19, (uint64_t)qword_26B018E08);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v14);
  sub_241714E54();
  unsigned int v47 = *MEMORY[0x263F43D88];
  uint64_t v46 = *(uint64_t (**)(char *))(v9 + 104);
  uint64_t v44 = v8;
  uint64_t v20 = v46(v11);
  MEMORY[0x2456221B0](v20);
  sub_24171EAD8();
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(v14, 1, 1, v18);
  sub_24171E9B8();
  uint64_t v21 = sub_2416FC1F8((uint64_t)v14);
  MEMORY[0x2456221B0](v21);
  uint64_t v22 = v47;
  uint64_t v23 = v8;
  uint64_t v24 = (uint64_t (*)(char *, uint64_t, uint64_t))v46;
  ((void (*)(char *, void, uint64_t))v46)(v11, v47, v23);
  sub_24171F458();
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v54)(v14, 1, 1, v18);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v14);
  uint64_t v25 = v24(v11, v22, v44);
  MEMORY[0x2456221C0](v25);
  sub_24171F458();
  sub_241714FDC(0, &qword_268D24C68, (uint64_t (*)(uint64_t))sub_241715040, MEMORY[0x263F8E0F8]);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_241721DB0;
  uint64_t v27 = MEMORY[0x263F43B30];
  uint64_t v28 = v55;
  *(void *)(v26 + 56) = v55;
  *(void *)(v26 + 64) = v27;
  *(void *)(v26 + 72) = MEMORY[0x263F43B28];
  uint64_t v29 = sub_2416E2980((uint64_t *)(v26 + 32));
  uint64_t v30 = v51;
  (*(void (**)(uint64_t *, char *, uint64_t))(v51 + 16))(v29, v58, v28);
  uint64_t v31 = MEMORY[0x263F44838];
  uint64_t v32 = v53;
  *(void *)(v26 + 104) = v53;
  *(void *)(v26 + 112) = v31;
  uint64_t v33 = MEMORY[0x263F44830];
  *(void *)(v26 + 120) = MEMORY[0x263F44830];
  uint64_t v34 = sub_2416E2980((uint64_t *)(v26 + 80));
  uint64_t v35 = v52;
  uint64_t v36 = *(void (**)(uint64_t *, char *, uint64_t))(v52 + 16);
  uint64_t v37 = v56;
  v36(v34, v56, v32);
  *(void *)(v26 + 152) = v32;
  *(void *)(v26 + 160) = v31;
  *(void *)(v26 + 168) = v33;
  uint64_t v38 = sub_2416E2980((uint64_t *)(v26 + 128));
  uint64_t v39 = v57;
  v36(v38, v57, v32);
  uint64_t v40 = sub_24171EF98();
  swift_bridgeObjectRelease();
  uint64_t v41 = *(void (**)(char *, uint64_t))(v35 + 8);
  v41(v39, v32);
  v41(v37, v32);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v58, v55);
  return v40;
}

uint64_t sub_2417129C4(uint64_t a1)
{
  v25[3] = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_241714FDC(0, &qword_26B0183B0, MEMORY[0x263F44888], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v25 - v3;
  sub_241714FDC(0, &qword_26B018CA8, MEMORY[0x263F07690], v1);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v25 - v6;
  uint64_t v8 = sub_24171E288();
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24171E8B8();
  sub_2416E70CC(v10, (uint64_t)qword_26B018E08);
  void v25[2] = sub_24171E9B8();
  v25[1] = v11;
  sub_2416FC1F8((uint64_t)v7);
  sub_241714FDC(0, &qword_268D24C58, (uint64_t (*)(uint64_t))sub_241714534, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  long long v26 = xmmword_241720620;
  uint64_t v13 = (void **)MEMORY[0x263F814F0];
  *(_OWORD *)(inited + 16) = xmmword_241720620;
  os_log_type_t v14 = *v13;
  *(void *)(inited + 32) = *v13;
  uint64_t v15 = self;
  double v16 = *MEMORY[0x263F81840];
  id v17 = v14;
  id v18 = objc_msgSend(v15, sel_systemFontOfSize_weight_, 14.0, v16);
  *(void *)(inited + 64) = sub_2416FA7F4(0, &qword_268D24C60);
  *(void *)(inited + 40) = v18;
  sub_241701368(inited);
  sub_241711B28(0x6375646241706948, 0xEC0000006E6F6974);
  v9(v7, 1, 1, v8);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v7);
  sub_24171EAE8();
  sub_24171F478();
  uint64_t v19 = sub_24171F488();
  uint64_t v20 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v4, 0, 1, v19);
  MEMORY[0x2456221C0](v20);
  sub_24171EAF8();
  sub_24171EB08();
  v27[3] = sub_24171EA88();
  void v27[4] = MEMORY[0x263F43AC0];
  sub_2416E2980(v27);
  sub_24171EA78();
  uint64_t v21 = sub_24171EE28();
  sub_2416E2090((uint64_t)v27);
  sub_2417144D8(0, &qword_268D24C48, &qword_268D24C50, &qword_26B0183A8);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = v26;
  *(void *)(v22 + 32) = v21;
  uint64_t v23 = MEMORY[0x2456224B0]();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_241712E98()
{
  uint64_t v0 = sub_24171F468();
  uint64_t v50 = *(void *)(v0 - 8);
  uint64_t v51 = v0;
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v49 = &v41[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v1);
  uint64_t v54 = &v41[-v3];
  uint64_t v52 = sub_24171ECB8();
  uint64_t v4 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v6 = &v41[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_241714FDC(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = &v41[-v8];
  uint64_t v53 = sub_24171EAC8();
  uint64_t v48 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v55 = &v41[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_24171E288();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v46 = v12 + 56;
  unsigned int v47 = v13;
  v13(v9, 1, 1, v11);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24171E8B8();
  uint64_t v43 = sub_2416E70CC(v14, (uint64_t)qword_26B018E08);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v9);
  sub_241714E54();
  uint64_t v15 = *MEMORY[0x263F43D88];
  uint64_t v45 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v4 + 104);
  unsigned int v42 = v15;
  uint64_t v16 = v45(v6, v15, v52);
  MEMORY[0x2456221B0](v16);
  sub_24171EAD8();
  uint64_t v17 = v11;
  uint64_t v44 = v11;
  id v18 = v47;
  v47(v9, 1, 1, v17);
  sub_24171E9B8();
  uint64_t v19 = sub_2416FC1F8((uint64_t)v9);
  MEMORY[0x2456221B0](v19);
  uint64_t v20 = v15;
  uint64_t v21 = v52;
  uint64_t v22 = v45;
  v45(v6, v20, v52);
  sub_24171F458();
  v18(v9, 1, 1, v44);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v9);
  uint64_t v23 = v22(v6, v42, v21);
  MEMORY[0x2456221C0](v23);
  uint64_t v24 = v49;
  sub_24171F458();
  sub_241714FDC(0, &qword_268D24C68, (uint64_t (*)(uint64_t))sub_241715040, MEMORY[0x263F8E0F8]);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_241721DB0;
  uint64_t v26 = MEMORY[0x263F43B30];
  uint64_t v27 = v53;
  *(void *)(v25 + 56) = v53;
  *(void *)(v25 + 64) = v26;
  *(void *)(v25 + 72) = MEMORY[0x263F43B28];
  uint64_t v28 = sub_2416E2980((uint64_t *)(v25 + 32));
  uint64_t v29 = v48;
  (*(void (**)(uint64_t *, unsigned char *, uint64_t))(v48 + 16))(v28, v55, v27);
  uint64_t v30 = MEMORY[0x263F44838];
  uint64_t v31 = v51;
  *(void *)(v25 + 104) = v51;
  *(void *)(v25 + 112) = v30;
  uint64_t v32 = MEMORY[0x263F44830];
  *(void *)(v25 + 120) = MEMORY[0x263F44830];
  uint64_t v33 = sub_2416E2980((uint64_t *)(v25 + 80));
  uint64_t v34 = v50;
  uint64_t v35 = *(void (**)(uint64_t *, unsigned char *, uint64_t))(v50 + 16);
  uint64_t v36 = v54;
  v35(v33, v54, v31);
  *(void *)(v25 + 152) = v31;
  *(void *)(v25 + 160) = v30;
  *(void *)(v25 + 168) = v32;
  uint64_t v37 = sub_2416E2980((uint64_t *)(v25 + 128));
  v35(v37, v24, v31);
  uint64_t v38 = sub_24171EF98();
  swift_bridgeObjectRelease();
  uint64_t v39 = *(void (**)(unsigned char *, uint64_t))(v34 + 8);
  v39(v24, v31);
  v39(v36, v31);
  (*(void (**)(unsigned char *, uint64_t))(v29 + 8))(v55, v53);
  return v38;
}

uint64_t sub_2417134E4(uint64_t a1)
{
  v25[3] = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_241714FDC(0, &qword_26B0183B0, MEMORY[0x263F44888], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v25 - v3;
  sub_241714FDC(0, &qword_26B018CA8, MEMORY[0x263F07690], v1);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v25 - v6;
  uint64_t v8 = sub_24171E288();
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24171E8B8();
  sub_2416E70CC(v10, (uint64_t)qword_26B018E08);
  void v25[2] = sub_24171E9B8();
  v25[1] = v11;
  sub_2416FC1F8((uint64_t)v7);
  sub_241714FDC(0, &qword_268D24C58, (uint64_t (*)(uint64_t))sub_241714534, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  long long v26 = xmmword_241720620;
  uint64_t v13 = (void **)MEMORY[0x263F814F0];
  *(_OWORD *)(inited + 16) = xmmword_241720620;
  uint64_t v14 = *v13;
  *(void *)(inited + 32) = *v13;
  uint64_t v15 = self;
  double v16 = *MEMORY[0x263F81840];
  id v17 = v14;
  id v18 = objc_msgSend(v15, sel_systemFontOfSize_weight_, 14.0, v16);
  *(void *)(inited + 64) = sub_2416FA7F4(0, &qword_268D24C60);
  *(void *)(inited + 40) = v18;
  sub_241701368(inited);
  sub_241711B28(0x57656F546C656548, 0xEE00676E696B6C61);
  v9(v7, 1, 1, v8);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v7);
  sub_24171EAE8();
  sub_24171F478();
  uint64_t v19 = sub_24171F488();
  uint64_t v20 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v4, 0, 1, v19);
  MEMORY[0x2456221C0](v20);
  sub_24171EAF8();
  sub_24171EB08();
  v27[3] = sub_24171EA88();
  void v27[4] = MEMORY[0x263F43AC0];
  sub_2416E2980(v27);
  sub_24171EA78();
  uint64_t v21 = sub_24171EE28();
  sub_2416E2090((uint64_t)v27);
  sub_2417144D8(0, &qword_268D24C48, &qword_268D24C50, &qword_26B0183A8);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = v26;
  *(void *)(v22 + 32) = v21;
  uint64_t v23 = MEMORY[0x2456224B0]();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_2417139BC()
{
  uint64_t v0 = sub_24171F468();
  uint64_t v37 = *(void *)(v0 - 8);
  uint64_t v38 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v36 = (char *)v31 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_24171ECB8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241714FDC(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v31 - v7;
  uint64_t v9 = sub_24171EAC8();
  uint64_t v34 = *(void *)(v9 - 8);
  uint64_t v35 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v39 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24171E288();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 56);
  uint64_t v33 = v11;
  v31[1] = v12 + 56;
  v32(v8, 1, 1);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24171E8B8();
  sub_2416E70CC(v13, (uint64_t)qword_26B018E08);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v8);
  sub_241714E54();
  uint64_t v14 = *MEMORY[0x263F43D88];
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 104);
  uint64_t v16 = v15(v5, v14, v2);
  MEMORY[0x2456221B0](v16);
  sub_24171EAD8();
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v32)(v8, 1, 1, v33);
  sub_24171E9B8();
  uint64_t v17 = sub_2416FC1F8((uint64_t)v8);
  MEMORY[0x2456221B0](v17);
  v15(v5, v14, v2);
  id v18 = v36;
  sub_24171F458();
  sub_241714FDC(0, &qword_268D24C68, (uint64_t (*)(uint64_t))sub_241715040, MEMORY[0x263F8E0F8]);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_241720600;
  uint64_t v20 = MEMORY[0x263F43B30];
  uint64_t v21 = v35;
  *(void *)(v19 + 56) = v35;
  *(void *)(v19 + 64) = v20;
  *(void *)(v19 + 72) = MEMORY[0x263F43B28];
  uint64_t v22 = sub_2416E2980((uint64_t *)(v19 + 32));
  uint64_t v23 = v34;
  uint64_t v24 = v39;
  (*(void (**)(uint64_t *, char *, uint64_t))(v34 + 16))(v22, v39, v21);
  uint64_t v25 = MEMORY[0x263F44838];
  uint64_t v26 = v38;
  *(void *)(v19 + 104) = v38;
  *(void *)(v19 + 112) = v25;
  *(void *)(v19 + 120) = MEMORY[0x263F44830];
  uint64_t v27 = sub_2416E2980((uint64_t *)(v19 + 80));
  uint64_t v28 = v37;
  (*(void (**)(uint64_t *, char *, uint64_t))(v37 + 16))(v27, v18, v26);
  uint64_t v29 = sub_24171EF98();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v18, v26);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v21);
  return v29;
}

uint64_t sub_241713EEC(uint64_t a1)
{
  uint64_t v28 = a1;
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_241714FDC(0, &qword_26B0183B0, MEMORY[0x263F44888], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v26 - v3;
  sub_241714FDC(0, &qword_26B018CA8, MEMORY[0x263F07690], v1);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v26 - v6;
  uint64_t v8 = sub_24171E288();
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_24171E8B8();
  sub_2416E70CC(v10, (uint64_t)qword_26B018E08);
  uint64_t v11 = sub_24171E9B8();
  v26[0] = v12;
  v26[1] = v11;
  sub_2416FC1F8((uint64_t)v7);
  sub_241714FDC(0, &qword_268D24C58, (uint64_t (*)(uint64_t))sub_241714534, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  long long v27 = xmmword_241720620;
  uint64_t v14 = (void **)MEMORY[0x263F814F0];
  *(_OWORD *)(inited + 16) = xmmword_241720620;
  uint64_t v15 = *v14;
  *(void *)(inited + 32) = *v14;
  uint64_t v16 = self;
  double v17 = *MEMORY[0x263F81840];
  id v18 = v15;
  id v19 = objc_msgSend(v16, sel_systemFontOfSize_weight_, 14.0, v17);
  *(void *)(inited + 64) = sub_2416FA7F4(0, &qword_268D24C60);
  *(void *)(inited + 40) = v19;
  sub_241701368(inited);
  sub_241711B28(0xD000000000000017, 0x8000000241724360);
  v9(v7, 1, 1, v8);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v7);
  sub_24171EAE8();
  sub_24171F478();
  uint64_t v20 = sub_24171F488();
  uint64_t v21 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v4, 0, 1, v20);
  MEMORY[0x2456221C0](v21);
  sub_24171EAF8();
  sub_24171EB08();
  v29[3] = sub_24171EA88();
  v29[4] = MEMORY[0x263F43AC0];
  sub_2416E2980(v29);
  sub_24171EA78();
  uint64_t v22 = sub_24171EE28();
  sub_2416E2090((uint64_t)v29);
  sub_2417144D8(0, &qword_268D24C48, &qword_268D24C50, &qword_26B0183A8);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = v27;
  *(void *)(v23 + 32) = v22;
  uint64_t v24 = MEMORY[0x2456224B0]();
  swift_bridgeObjectRelease();
  return v24;
}

uint64_t sub_2417143AC()
{
  return sub_241712390(0xD000000000000024, 0x8000000241725B00, 0xD00000000000001FLL, 0x8000000241725B50);
}

uint64_t type metadata accessor for ImproveWalkingSteadinessPDFProvider()
{
  return self;
}

uint64_t sub_241714408()
{
  return sub_24171053C();
}

uint64_t sub_24171442C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24171443C()
{
  return sub_241710D78(*(void *)(v0 + 16));
}

uint64_t sub_241714444()
{
  return sub_241710F40();
}

uint64_t sub_24171444C()
{
  return MEMORY[0x263F8EE78];
}

void sub_241714458(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (!*a2)
  {
    sub_2416E22F8(255, a3);
    unint64_t v4 = sub_24171F8E8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_2417144B0()
{
  return sub_241711658(*(void *)(v0 + 16));
}

uint64_t sub_2417144B8()
{
  return sub_241711E84(*(void *)(v0 + 16));
}

uint64_t sub_2417144C0()
{
  return sub_2417129C4(*(void *)(v0 + 16));
}

uint64_t sub_2417144C8()
{
  return sub_2417134E4(*(void *)(v0 + 16));
}

uint64_t sub_2417144D0()
{
  return sub_241713EEC(*(void *)(v0 + 16));
}

void sub_2417144D8(uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  if (!*a2)
  {
    sub_241714458(255, a3, a4);
    unint64_t v5 = sub_24171FD68();
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_241714534()
{
  if (!qword_268D24B80)
  {
    type metadata accessor for Key(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268D24B80);
    }
  }
}

unint64_t sub_2417145A0(uint64_t a1)
{
  sub_24171F818();
  sub_24171FDC8();
  sub_24171F858();
  uint64_t v2 = sub_24171FDE8();
  swift_bridgeObjectRelease();

  return sub_241714634(a1, v2);
}

unint64_t sub_241714634(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24171F818();
    uint64_t v8 = v7;
    if (v6 == sub_24171F818() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24171FD88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_24171F818();
          uint64_t v15 = v14;
          if (v13 == sub_24171F818() && v15 == v16) {
            break;
          }
          char v18 = sub_24171FD88();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_2417147AC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_241702178();
  char v35 = a2;
  uint64_t v6 = sub_24171FC78();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
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
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33) {
      break;
    }
    char v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v33) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v34 + 8 * v13);
      if (!v19)
      {
        int64_t v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v13 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v33) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v34 + 8 * v13);
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
    unint64_t v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    uint64_t v21 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
    uint64_t v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
    if (v35)
    {
      sub_2417022D0(v22, v36);
    }
    else
    {
      sub_2416E20E0((uint64_t)v22, (uint64_t)v36);
      id v23 = v21;
    }
    sub_24171F818();
    sub_24171FDC8();
    sub_24171F858();
    uint64_t v24 = sub_24171FDE8();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = v24 & ~v25;
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
          goto LABEL_42;
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
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v21;
    uint64_t result = (uint64_t)sub_2417022D0(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v18 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v18 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_241714AE4(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_2417145A0((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_241714C90();
      goto LABEL_7;
    }
    sub_2417147AC(v12, a3 & 1);
    unint64_t v18 = sub_2417145A0((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      unint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for Key(0);
    uint64_t result = (_OWORD *)sub_24171FDA8();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    unint64_t v16 = (_OWORD *)(v15[7] + 32 * v9);
    sub_2416E2090((uint64_t)v16);
    return sub_2417022D0(a1, v16);
  }
LABEL_13:
  sub_241714C28(v9, (uint64_t)a2, a1, v15);

  return a2;
}

_OWORD *sub_241714C28(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_2417022D0(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

id sub_241714C90()
{
  uint64_t v1 = v0;
  sub_241702178();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24171FC68();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_2416E20E0(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_2417022D0(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_241714E54()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F81650]), sel_init);
  sub_24171EB38();
  objc_msgSend(v0, sel_setLineSpacing_);
  sub_24171EB48();
  objc_msgSend(v0, sel_setParagraphSpacing_);
  sub_241714FDC(0, &qword_268D24C58, (uint64_t (*)(uint64_t))sub_241714534, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_241720620;
  uint64_t v2 = (void *)*MEMORY[0x263F814F0];
  *(void *)(inited + 32) = *MEMORY[0x263F814F0];
  id v3 = v2;
  uint64_t v4 = sub_24171EB68();
  *(void *)(inited + 64) = sub_2416FA7F4(0, &qword_268D24C60);
  *(void *)(inited + 40) = v4;
  unint64_t v5 = sub_241701368(inited);
  uint64_t v6 = (void *)*MEMORY[0x263F81540];
  uint64_t v13 = sub_2416FA7F4(0, &qword_268D24C78);
  *(void *)&long long v12 = v0;
  sub_2417022D0(&v12, v11);
  id v7 = v6;
  id v8 = v0;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_241714AE4(v11, v7, isUniquelyReferenced_nonNull_native);

  swift_bridgeObjectRelease();
  return v5;
}

void sub_241714FDC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_241715040()
{
  unint64_t result = qword_268D24C70;
  if (!qword_268D24C70)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_268D24C70);
  }
  return result;
}

uint64_t sub_2417150A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24171F5C8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v29 - v9;
  uint64_t v11 = (void *)sub_24171F4E8();
  unsigned int v12 = objc_msgSend(v11, sel_areAllRequirementsSatisfied);

  if (v12)
  {
    sub_24171F588();
    uint64_t v13 = sub_24171F5B8();
    os_log_type_t v14 = sub_24171F958();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v31 = a2;
      uint64_t v17 = v16;
      uint64_t v34 = v16;
      *(_DWORD *)uint64_t v15 = 136315394;
      uint64_t v32 = v4;
      uint64_t v18 = sub_24171FE48();
      uint64_t v33 = sub_2416E1FBC(v18, v19, &v34);
      BOOL v30 = a1;
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      uint64_t v33 = sub_2416E1FBC(0xD000000000000024, 0x8000000241725E40, &v34);
      a1 = v30;
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v13, v14, "[%s.%s] Creating walking steadiness settings feed item", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      uint64_t v20 = v17;
      a2 = v31;
      MEMORY[0x245623AC0](v20, -1, -1);
      MEMORY[0x245623AC0](v15, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v32);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
    return sub_241715550(a1, 0xD00000000000002DLL, 0x8000000241725D70, a2);
  }
  else
  {
    sub_24171F588();
    int64_t v21 = sub_24171F5B8();
    os_log_type_t v22 = sub_24171F958();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v34 = v24;
      *(_DWORD *)uint64_t v23 = 136315394;
      uint64_t v32 = v4;
      uint64_t v25 = sub_24171FE48();
      uint64_t v33 = sub_2416E1FBC(v25, v26, &v34);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2080;
      uint64_t v33 = sub_2416E1FBC(0xD000000000000024, 0x8000000241725E40, &v34);
      sub_24171FB18();
      _os_log_impl(&dword_2416DE000, v21, v22, "[%s.%s]: Not creating walking steadiness settings feed item", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v24, -1, -1);
      MEMORY[0x245623AC0](v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v32);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    uint64_t v28 = sub_24171E4D8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a2, 1, 1, v28);
  }
}

uint64_t sub_241715550@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v49 = a3;
  uint64_t v48 = a2;
  id v60 = a1;
  uint64_t v64 = a4;
  uint64_t v44 = *v4;
  uint64_t v54 = sub_24171F5C8();
  uint64_t v53 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v55 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_24171E848();
  uint64_t v51 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v50 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_24171E418();
  uint64_t v59 = *(void *)(v65 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v65);
  unsigned int v47 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v66 = (char *)&v44 - v9;
  sub_2417162D0(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v10 - 8);
  unsigned int v12 = (char *)&v44 - v11;
  uint64_t v46 = sub_24171EBF8();
  uint64_t v45 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  os_log_type_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24171EDE8();
  uint64_t v62 = *(void *)(v15 - 8);
  uint64_t v63 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for WalkingSteadinessNotificationSettingsDisclosureCellViewController();
  uint64_t v56 = sub_24171E448();
  uint64_t v57 = v18;
  int v58 = v19;
  uint64_t v20 = sub_24171E288();
  int64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  v21(v12, 1, 1, v20);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_24171E8B8();
  sub_2416E70CC(v22, (uint64_t)qword_26B018E08);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v12);
  sub_24171EBD8();
  v21(v12, 1, 1, v20);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v12);
  sub_24171EDB8();
  uint64_t v23 = v59;
  uint64_t v25 = v65;
  uint64_t v24 = v66;
  (*(void (**)(char *, void, uint64_t))(v59 + 104))(v66, *MEMORY[0x263F45570], v65);
  unint64_t v26 = (void *)sub_24171E4E8();
  uint64_t v27 = sub_24171EDD8();
  uint64_t v61 = v17;
  uint64_t v28 = v27;
  unint64_t v30 = v29;
  uint64_t v31 = v23;
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v47, v24, v25);
  sub_2417163D4(v28, v30);
  id v60 = v26;
  sub_24171EF98();
  uint64_t v32 = v64;
  unint64_t v33 = v30;
  sub_24171E488();
  sub_24171EDC8();
  sub_24171EBE8();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v14, v46);
  sub_24171E478();
  sub_2416E29E4(0, (unint64_t *)&qword_26B018450);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_241720620;
  *(void *)(inited + 32) = sub_24171E508();
  *(void *)(inited + 40) = v35;
  sub_2416FF0DC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  sub_24171E4B8();
  uint64_t v36 = v51;
  uint64_t v37 = v50;
  uint64_t v38 = v52;
  (*(void (**)(char *, void, uint64_t))(v51 + 104))(v50, *MEMORY[0x263F43838], v52);
  sub_24171E838();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  sub_24171E4C8();
  sub_24171E468();
  sub_2416E29E4(0, (unint64_t *)&qword_26B018C40);
  uint64_t v39 = swift_initStackObject();
  *(_OWORD *)(v39 + 16) = xmmword_241722AF0;
  sub_2416E2B30();
  *(void *)(v39 + 32) = MEMORY[0x245623000]((id)*MEMORY[0x263F09248]);
  unint64_t v67 = v39;
  sub_24171F8B8();
  unint64_t v40 = v67;
  if (v67 >> 62)
  {
    sub_24171EF98();
    uint64_t v41 = sub_24171FC58();
    swift_bridgeObjectRelease();
    if (!v41) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (*(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
LABEL_5:
  }
    sub_2416E2B70(v40);
LABEL_7:
  swift_bridgeObjectRelease();
  sub_24171E498();

  sub_24171642C(v28, v33);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v66, v25);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v61, v63);
  uint64_t v42 = sub_24171E4D8();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v32, 0, 1, v42);
}

uint64_t sub_2417160F8(void *a1)
{
  sub_24171629C(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2417162D0(0, &qword_26B018BE0, (uint64_t (*)(uint64_t))sub_24171629C, MEMORY[0x263EFDDF8]);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v12 - v8;
  sub_2417150A0(a1, (uint64_t)v4);
  sub_24171F6D8();
  sub_241716334();
  uint64_t v10 = sub_24171F6E8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v10;
}

unint64_t sub_241716280()
{
  return 0xD000000000000042;
}

void sub_24171629C(uint64_t a1)
{
}

void sub_2417162D0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_241716334()
{
  unint64_t result = qword_26B018BD8;
  if (!qword_26B018BD8)
  {
    sub_2417162D0(255, &qword_26B018BE0, (uint64_t (*)(uint64_t))sub_24171629C, MEMORY[0x263EFDDF8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018BD8);
  }
  return result;
}

uint64_t sub_2417163BC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 5u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2417163D4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_24171642C(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for FitnessPlusDataSource()
{
  uint64_t result = qword_268D24C88;
  if (!qword_268D24C88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2417164D0()
{
  return swift_initClassMetadata2();
}

BOOL sub_24171651C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_241716534()
{
  return sub_24171F998();
}

uint64_t sub_2417165A4()
{
  uint64_t v1 = sub_24171EC78();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24171EC68();
  uint64_t v5 = sub_24171EC58();
  if (v0)
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    uint64_t v6 = (void *)v5;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    id v7 = objc_msgSend(self, sel_estimatedDimension_, 100.0);
    uint64_t v1 = sub_24171FA58();
  }
  return v1;
}

uint64_t sub_2417166F4()
{
  uint64_t v0 = sub_24171F5C8();
  uint64_t v45 = *(void *)(v0 - 8);
  uint64_t v46 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v44 = (char *)&v44 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2417181D8(0, &qword_268D24CD0, MEMORY[0x263F6A320], MEMORY[0x263F6B138]);
  uint64_t v50 = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  unsigned int v47 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v48 = (char *)&v44 - v6;
  sub_2417183E8();
  uint64_t v8 = v7;
  uint64_t v55 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v55 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v49 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v51 = (char *)&v44 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v53 = (char *)&v44 - v13;
  uint64_t v54 = sub_24171E2F8();
  uint64_t v52 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v56 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24171E3A8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(self, sel_isAppleInternalInstall)
    && (sub_2416FA7F4(0, &qword_268D24CE0),
        int v19 = (void *)sub_24171F978(),
        uint64_t v20 = (void *)sub_24171F7D8(),
        unsigned __int8 v21 = objc_msgSend(v19, sel_BOOLForKey_, v20),
        v19,
        v20,
        (v21 & 1) != 0))
  {
    uint64_t v22 = v44;
    sub_24171F598();
    uint64_t v23 = sub_24171F5B8();
    os_log_type_t v24 = sub_24171F958();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_2416DE000, v23, v24, "FitnessPlusDataSource: subscription check has been overridden to be true", v25, 2u);
      MEMORY[0x245623AC0](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v45 + 8))(v22, v46);
    return sub_241717384();
  }
  else
  {
    sub_24171E378();
    sub_2416FA7F4(0, (unint64_t *)&qword_26B018CF0);
    swift_retain();
    sub_24171FA08();
    (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x263F68950], v15);
    v58[3] = sub_24171E398();
    v58[4] = MEMORY[0x263F68940];
    sub_2416E2980(v58);
    sub_24171E388();
    sub_24171E3C8();
    swift_allocObject();
    sub_24171E3B8();
    sub_24171FA08();
    uint64_t v46 = sub_24171E368();
    sub_24171E2E8();
    uint64_t v27 = v48;
    sub_24171E358();
    uint64_t v28 = v47;
    uint64_t v29 = v50;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v47, v27, v50);
    unint64_t v30 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v31 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v31 + v30, v28, v29);
    uint64_t v32 = (uint64_t (**)())(v31 + ((v4 + v30 + 7) & 0xFFFFFFFFFFFFFFF8));
    unint64_t v33 = v57;
    *uint64_t v32 = sub_241718444;
    v32[1] = v33;
    swift_retain();
    uint64_t v34 = v51;
    sub_24171E308();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v27, v29);
    uint64_t v35 = v55;
    uint64_t v36 = v49;
    (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v49, v34, v8);
    unint64_t v37 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
    uint64_t v38 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v35 + 32))(v38 + v37, v36, v8);
    uint64_t v39 = (uint64_t (**)@<X0>(void *@<X0>, uint64_t@<X8>))(v38 + ((v9 + v37 + 7) & 0xFFFFFFFFFFFFFFF8));
    *uint64_t v39 = sub_2417170F4;
    v39[1] = 0;
    unint64_t v40 = v53;
    sub_24171E308();
    uint64_t v41 = *(void (**)(char *, uint64_t))(v35 + 8);
    v41(v34, v8);
    uint64_t v42 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_24171E328();
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = 0;
    *(void *)(v43 + 24) = 0;
    v42(sub_241718760, v43);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v41(v40, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v56, v54);
  }
}

uint64_t sub_241716EB8()
{
  uint64_t v0 = sub_24171F5C8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24171E248();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24171E238();
  char v8 = sub_24171E2C8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_24171F598();
  uint64_t v9 = sub_24171F5B8();
  os_log_type_t v10 = sub_24171F958();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 67109120;
    v13[3] = v8 & 1;
    sub_24171FB18();
    _os_log_impl(&dword_2416DE000, v9, v10, "FitnessPlusDataSource: subscription check yielded %{BOOL}d", v11, 8u);
    MEMORY[0x245623AC0](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v8) {
    sub_241717384();
  }
  return sub_24171E338();
}

uint64_t sub_2417170F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24171F5C8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24171F598();
  id v8 = a1;
  id v9 = a1;
  os_log_type_t v10 = sub_24171F5B8();
  os_log_type_t v11 = sub_24171F938();
  if (os_log_type_enabled(v10, v11))
  {
    v19[0] = v4;
    uint64_t v12 = swift_slowAlloc();
    v19[1] = a2;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_getErrorValue();
    uint64_t v15 = sub_24171FDB8();
    v19[2] = sub_2416E1FBC(v15, v16, &v20);
    sub_24171FB18();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2416DE000, v10, v11, "FitnessPlusDataSource: subscription check error: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245623AC0](v14, -1, -1);
    MEMORY[0x245623AC0](v13, -1, -1);

    (*(void (**)(char *, void))(v5 + 8))(v7, v19[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *(void *)(swift_allocObject() + 16) = a1;
  id v17 = a1;
  return sub_24171E318();
}

uint64_t sub_241717384()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24171E278();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2416E523C();
  uint64_t v6 = swift_allocObject();
  long long v12 = xmmword_241720620;
  *(_OWORD *)(v6 + 16) = xmmword_241720620;
  BOOL v7 = (*(unsigned char *)(v1 + qword_268D24C80 + 8) & 1) == 0 && *(uint64_t *)(v1 + qword_268D24C80) > 54;
  uint64_t v9 = qword_268D24DE0;
  id v8 = off_268D24DE8;
  sub_24171EF98();
  *(void *)(v6 + 56) = &type metadata for FitnessPlusDataSource.FitnessPlusItem;
  *(void *)(v6 + 64) = sub_241718378();
  uint64_t v10 = swift_allocObject();
  *(void *)(v6 + 32) = v10;
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v8;
  *(void *)(v10 + 32) = 0xD00000000000001DLL;
  *(void *)(v10 + 40) = 0x8000000241725F90;
  *(unsigned char *)(v10 + 48) = v7;
  sub_2417181D8(0, (unint64_t *)&qword_268D245E8, MEMORY[0x263F44068], MEMORY[0x263F8E0F8]);
  sub_24171EE98();
  *(_OWORD *)(swift_allocObject() + 16) = v12;
  sub_24171E268();
  sub_24171E258();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_24171EE88();
  sub_24171EEA8();
  return swift_bridgeObjectRelease();
}

void sub_24171760C()
{
}

void sub_241717628()
{
}

void sub_241717644()
{
}

uint64_t sub_241717670()
{
  sub_24171F278();

  return swift_deallocClassInstance();
}

uint64_t sub_2417176A0()
{
  return type metadata accessor for FitnessPlusDataSource();
}

uint64_t sub_2417176A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2417181D8(0, &qword_268D24CD0, MEMORY[0x263F6A320], MEMORY[0x263F6B138]);
  uint64_t v9 = (void (*)(void (*)(uint64_t), void *))sub_24171E328();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a5;
  v10[4] = a1;
  v10[5] = a2;
  swift_retain();
  swift_retain();
  v9(sub_241718824, v10);
  swift_release();

  return swift_release();
}

uint64_t sub_2417177A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_2417183E8();
  uint64_t v9 = (void (*)(uint64_t (*)(uint64_t), void *))sub_24171E328();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a4;
  v10[5] = a5;
  swift_retain();
  swift_retain();
  v9(sub_241718780, v10);
  swift_release();

  return swift_release();
}

uint64_t sub_241717868(void *a1, char a2, uint64_t (*a3)(void **), uint64_t a4, void (*a5)(void *))
{
  sub_2417183E8();
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v16 = a1;
    a5(a1);
    id v17 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_24171E328();
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = a3;
    *(void *)(v18 + 24) = a4;
    swift_retain();
    v17(sub_241718760, v18);
    swift_release();
    swift_release();
    sub_24171879C(a1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    int v19 = a1;
    char v20 = 0;
    return a3(&v19);
  }
}

void sub_241717A00(uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(id *), uint64_t a5)
{
  os_log_type_t v24 = a4;
  uint64_t v25 = a5;
  v23[1] = a3;
  sub_2417183E8();
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24171E2D8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241718830();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (id *)((char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2417188B0(a1, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v26 = *v18;
    id v19 = v26;
    char v27 = 1;
    id v20 = v26;
    v24(&v26);
  }
  else
  {
    (*(void (**)(char *, id *, uint64_t))(v13 + 32))(v15, v18, v12);
    a2(v15);
    unsigned __int8 v21 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_24171E328();
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v24;
    *(void *)(v22 + 24) = v25;
    swift_retain();
    v21(sub_241718760, v22);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
}

uint64_t sub_241717CC0(uint64_t a1, char a2)
{
  uint64_t v4 = sub_24171F678();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_24171E278();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2417181D8(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v21 - v10;
  uint64_t v12 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24171E8B8();
  sub_2416E70CC(v13, (uint64_t)qword_26B018E08);
  uint64_t v14 = sub_24171E9B8();
  v21[1] = v15;
  v21[2] = v14;
  sub_2416FC1F8((uint64_t)v11);
  type metadata accessor for FitnessPlusDataSource();
  uint64_t v16 = swift_allocObject() + qword_268D24C80;
  *(void *)uint64_t v16 = a1;
  *(unsigned char *)(v16 + 8) = a2 & 1;
  sub_2417181D8(0, (unint64_t *)&qword_268D245E8, MEMORY[0x263F44068], MEMORY[0x263F8E0F8]);
  sub_24171EE98();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_241720620;
  sub_24171E268();
  sub_24171E258();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_24171EE88();
  sub_24171F258();
  sub_2417166F4();
  sub_24171ECE8();
  swift_release();
  sub_24171F648();
  uint64_t v17 = sub_24171EA68();
  swift_allocObject();
  uint64_t v18 = sub_24171EA58();
  v22[3] = v17;
  v22[4] = sub_241718330(&qword_268D24C98, MEMORY[0x263F43AA8]);
  v22[0] = v18;
  sub_24171823C();
  sub_241718330(&qword_268D24CA8, (void (*)(uint64_t))sub_24171823C);
  uint64_t v19 = sub_24171ECF8();
  swift_release();
  sub_2416E2090((uint64_t)v22);
  sub_241718330(&qword_268D24CB0, (void (*)(uint64_t))sub_24171829C);
  return v19;
}

void sub_2417181D8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_24171823C()
{
  if (!qword_268D24CA0)
  {
    type metadata accessor for FitnessPlusDataSource();
    unint64_t v0 = sub_24171EC38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24CA0);
    }
  }
}

void sub_24171829C()
{
  if (!qword_268D24CB8)
  {
    sub_24171823C();
    sub_241718330(&qword_268D24CA8, (void (*)(uint64_t))sub_24171823C);
    unint64_t v0 = sub_24171EC08();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24CB8);
    }
  }
}

uint64_t sub_241718330(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_241718378()
{
  unint64_t result = qword_268D24CC8;
  if (!qword_268D24CC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24CC8);
  }
  return result;
}

uint64_t sub_2417183CC()
{
  return sub_2417187C4(MEMORY[0x263F8EEA0], 49);
}

void sub_2417183E8()
{
  if (!qword_268D24CD8)
  {
    unint64_t v0 = sub_24171E348();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24CD8);
    }
  }
}

uint64_t sub_241718444()
{
  return sub_241716EB8();
}

uint64_t sub_24171844C()
{
  sub_2417181D8(0, &qword_268D24CD0, MEMORY[0x263F6A320], MEMORY[0x263F6B138]);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_241718524(uint64_t a1, uint64_t a2)
{
  sub_2417181D8(0, &qword_268D24CD0, MEMORY[0x263F6A320], MEMORY[0x263F6B138]);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = v2 + v7;
  uint64_t v9 = (uint64_t *)(v2 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];

  return sub_2417176A8(a1, a2, v8, v10, v11);
}

uint64_t sub_241718604()
{
  sub_2417183E8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2417186AC(uint64_t a1, uint64_t a2)
{
  sub_2417183E8();
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = v2 + v7;
  uint64_t v9 = (uint64_t *)(v2 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];

  return sub_2417177A0(a1, a2, v8, v10, v11);
}

uint64_t sub_241718764()
{
  return sub_2417187C4(MEMORY[0x263F8EED8], 48);
}

uint64_t sub_241718780(uint64_t a1)
{
  return sub_241717868(*(void **)a1, *(unsigned char *)(a1 + 8), *(uint64_t (**)(void **))(v1 + 16), *(void *)(v1 + 24), *(void (**)(void *))(v1 + 32));
}

void sub_24171879C(id a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_2417187A8()
{
  return sub_2417187C4(MEMORY[0x263F8EED8], 48);
}

uint64_t sub_2417187C4(void (*a1)(void), uint64_t a2)
{
  a1(*(void *)(v2 + 24));
  a1(*(void *)(v2 + 40));

  return MEMORY[0x270FA0238](v2, a2, 7);
}

void sub_241718824(uint64_t a1)
{
  sub_241717A00(a1, *(void (**)(char *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(id *))(v1 + 32), *(void *)(v1 + 40));
}

void sub_241718830()
{
  if (!qword_268D24CE8)
  {
    sub_24171E2D8();
    sub_2416E22F8(255, qword_26B018C60);
    unint64_t v0 = sub_24171FDF8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24CE8);
    }
  }
}

uint64_t sub_2417188B0(uint64_t a1, uint64_t a2)
{
  sub_241718830();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_241718918()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_241718958(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *(unsigned char *)(result + 8);
  uint64_t v4 = *(void *)result;
  char v5 = v3;
  if (v2) {
    return v2(&v4);
  }
  return result;
}

uint64_t sub_2417189A0()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2417189D8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_willThrow();
  return v1;
}

uint64_t destroy for FitnessPlusDataSource.FitnessPlusItem()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FitnessPlusDataSource.FitnessPlusItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  sub_24171EF98();
  sub_24171EF98();
  return a1;
}

uint64_t assignWithCopy for FitnessPlusDataSource.FitnessPlusItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  sub_24171EF98();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_24171EF98();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for FitnessPlusDataSource.FitnessPlusItem(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for FitnessPlusDataSource.FitnessPlusItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for FitnessPlusDataSource.FitnessPlusItem(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FitnessPlusDataSource.FitnessPlusItem(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FitnessPlusDataSource.FitnessPlusItem()
{
  return &type metadata for FitnessPlusDataSource.FitnessPlusItem;
}

uint64_t getEnumTagSinglePayload for FitnessPlusDataSource.FitnessPlusItem.WorkoutType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FitnessPlusDataSource.FitnessPlusItem.WorkoutType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x241718D64);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_241718D8C(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FitnessPlusDataSource.FitnessPlusItem.WorkoutType()
{
  return &type metadata for FitnessPlusDataSource.FitnessPlusItem.WorkoutType;
}

unint64_t sub_241718DAC()
{
  unint64_t result = qword_268D24CF0;
  if (!qword_268D24CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24CF0);
  }
  return result;
}

double sub_241718E00@<D0>(uint64_t a1@<X8>)
{
  sub_24171EF98();
  uint64_t v2 = sub_24171FCC8();
  swift_bridgeObjectRelease();
  if (!v2)
  {
    *(void *)(a1 + 24) = &type metadata for ImproveWalkingSteadinessArticleDataProvider;
    *(void *)(a1 + 32) = sub_2416E2DA0();
    unint64_t v3 = sub_2416E2D4C();
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    *(void *)(a1 + 24) = &type metadata for WalkingSteadinessArticleDataProvider;
    *(void *)(a1 + 32) = sub_2416E2EE0();
    unint64_t v3 = sub_2416E2E8C();
LABEL_5:
    *(void *)(a1 + 40) = v3;
    return result;
  }
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

ValueMetadata *type metadata accessor for MobilityArticleTileDataController()
{
  return &type metadata for MobilityArticleTileDataController;
}

uint64_t sub_241718EC4()
{
  sub_2416FA7F4(0, (unint64_t *)&unk_268D24D70);
  uint64_t result = sub_24171FAE8();
  qword_268D24D00 = result;
  return result;
}

void sub_241718FF8(void *a1)
{
  uint64_t v2 = sub_24171F558();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24171FA38();
  if (qword_268D24550 != -1) {
    swift_once();
  }
  sub_24171F548();
  sub_24171F538();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_24171EB78();
  unsigned int v6 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_finishedTest_, v6);
}

void sub_241719168(uint64_t a1, void *a2, void *a3)
{
  sub_24171EB78();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  id v6 = objc_allocWithZone(MEMORY[0x263F62D00]);
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  v12[4] = sub_24171A514;
  uint64_t v12[5] = v5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  void v12[2] = sub_2416F9734;
  uint64_t v12[3] = &unk_26F594D30;
  uint64_t v10 = _Block_copy(v12);
  swift_release();
  id v11 = objc_msgSend(v6, sel_initWithTestName_scrollView_completionHandler_, v9, v7, v10);

  _Block_release(v10);
  objc_msgSend(v11, sel_setDirection_, 3);
  objc_msgSend(self, sel_runTestWithParameters_, v11);
}

uint64_t sub_2417192D4(void *a1, uint64_t a2)
{
  uint64_t v28 = sub_24171EB88();
  uint64_t v4 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  v26[1] = v5;
  char v27 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[0] = sub_24171F558();
  uint64_t v6 = *(void *)(v26[0] - 8);
  MEMORY[0x270FA5388](v26[0]);
  id v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24171A478(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)v26 - v10;
  uint64_t v12 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24171E8B8();
  sub_2416E70CC(v13, (uint64_t)qword_26B018E08);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v11);
  sub_2416F4300();
  id v14 = objc_allocWithZone((Class)sub_24171E5F8());
  uint64_t v15 = (void *)sub_24171E5E8();
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F46848]), sel_initWithRootViewController_, v15);
  uint64_t v17 = (void *)sub_24171EBA8();
  sub_24171EB78();
  uint64_t v18 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_startedTest_, v18);

  sub_24171FA48();
  if (qword_268D24550 != -1) {
    swift_once();
  }
  sub_24171F548();
  sub_24171F538();
  (*(void (**)(char *, void))(v6 + 8))(v8, v26[0]);
  id v20 = v27;
  uint64_t v19 = v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v27, a2, v28);
  unint64_t v21 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v22 + v21, v20, v19);
  aBlock[4] = sub_24171A250;
  aBlock[5] = v22;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2416F9734;
  aBlock[3] = &unk_26F594C90;
  uint64_t v23 = _Block_copy(aBlock);
  id v24 = a1;
  swift_release();
  objc_msgSend(v17, sel_presentViewController_animated_completion_, v16, 1, v23);

  _Block_release(v23);
  return 1;
}

BOOL sub_241719788(void *a1, uint64_t a2)
{
  uint64_t v56 = a2;
  id v58 = a1;
  uint64_t v2 = sub_24171F738();
  uint64_t v54 = *(void *)(v2 - 8);
  uint64_t v55 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v52 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_24171F768();
  uint64_t v51 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v50 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_24171EB88();
  uint64_t v5 = *(void *)(v48 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v48);
  unsigned int v47 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24171F728();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char **)((char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v57 = sub_24171F788();
  uint64_t v49 = *(void *)(v57 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v57);
  uint64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v44 - v14;
  sub_24171A478(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v44 - v17;
  uint64_t v19 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_24171E8B8();
  sub_2416E70CC(v20, (uint64_t)qword_26B018E08);
  sub_24171E9B8();
  sub_2416FC1F8((uint64_t)v18);
  sub_2416F4300();
  id v21 = objc_allocWithZone((Class)sub_24171E5F8());
  uint64_t v22 = (void *)sub_24171E5E8();
  objc_msgSend(v22, sel_loadViewIfNeeded);
  id v23 = (id)sub_24171E5D8();
  if (v23)
  {
    id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F46848]), sel_initWithRootViewController_, v22);
    id v46 = v24;
    uint64_t v25 = (void *)sub_24171EBA8();
    id v58 = v23;
    id v26 = v25;
    objc_msgSend(v25, sel_presentViewController_animated_completion_, v24, 1, 0);
    sub_2416FA7F4(0, (unint64_t *)&qword_26B018CF0);
    uint64_t v45 = sub_24171FA08();
    sub_24171F778();
    *uint64_t v10 = 4;
    (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F018], v7);
    MEMORY[0x245622E30](v13, v10);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v44 = v15;
    uint64_t v49 = *(void *)(v49 + 8);
    ((void (*)(char *, uint64_t))v49)(v13, v57);
    uint64_t v28 = v47;
    uint64_t v27 = v48;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v47, v56, v48);
    unint64_t v29 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    unint64_t v30 = (v6 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v31 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v31 + v29, v28, v27);
    *(void *)(v31 + v30) = v58;
    *(void *)(v31 + ((v30 + 15) & 0xFFFFFFFFFFFFFFF8)) = v26;
    aBlock[4] = sub_24171A388;
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2416F9734;
    aBlock[3] = &unk_26F594CE0;
    uint64_t v32 = _Block_copy(aBlock);
    id v33 = v58;
    id v34 = v26;
    swift_release();
    uint64_t v35 = v50;
    sub_24171F758();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_24171A420();
    sub_24171A478(0, &qword_26B018CD8, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
    sub_2416F3540();
    uint64_t v36 = v52;
    uint64_t v37 = v55;
    sub_24171FB48();
    uint64_t v39 = v44;
    uint64_t v38 = (void *)v45;
    MEMORY[0x245623080](v44, v35, v36, v32);
    _Block_release(v32);

    uint64_t v40 = v37;
    id v23 = v58;
    (*(void (**)(char *, uint64_t))(v54 + 8))(v36, v40);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v35, v53);
    ((void (*)(char *, uint64_t))v49)(v39, v57);
  }
  else
  {
    sub_24171EB78();
    uint64_t v41 = (void *)sub_24171F7D8();
    swift_bridgeObjectRelease();
    uint64_t v42 = (void *)sub_24171F7D8();
    objc_msgSend(v58, sel_failedTest_withFailure_, v41, v42);
  }
  return v23 != 0;
}

uint64_t sub_241719F68(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_24171EB88();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    __break(1u);
    goto LABEL_13;
  }
  sub_24171EF98();
  uint64_t result = sub_24171EB98();
  if (!a3)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_24171EF98();
  uint64_t v12 = sub_24171FCC8();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v12)
  {
    if (a1)
    {
      char v13 = sub_2417192D4(a1, (uint64_t)v11);
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  if (v12 == 1)
  {
    if (a1)
    {
      char v13 = sub_241719788(a1, (uint64_t)v11);
LABEL_11:
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      return v13 & 1;
    }
    goto LABEL_14;
  }
  if (a1)
  {
    sub_24171EB78();
    uint64_t v14 = (void *)sub_24171F7D8();
    swift_bridgeObjectRelease();
    unint64_t v16 = 0;
    unint64_t v17 = 0xE000000000000000;
    sub_24171FBC8();
    swift_bridgeObjectRelease();
    unint64_t v16 = 0xD000000000000011;
    unint64_t v17 = 0x8000000241726010;
    sub_24171EB78();
    sub_24171F868();
    swift_bridgeObjectRelease();
    uint64_t v15 = (void *)sub_24171F7D8();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_failedTest_withFailure_, v14, v15);

    char v13 = 0;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_24171A184()
{
  uint64_t v1 = sub_24171EB88();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_24171A250()
{
  sub_24171EB88();
  uint64_t v1 = *(void **)(v0 + 16);

  sub_241718FF8(v1);
}

uint64_t sub_24171A2B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24171A2C4()
{
  return swift_release();
}

uint64_t sub_24171A2CC()
{
  uint64_t v1 = sub_24171EB88();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v7 + 8, v5);
}

void sub_24171A388()
{
  uint64_t v1 = *(void *)(sub_24171EB88() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void **)(v0 + v3);
  uint64_t v5 = *(void **)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8));

  sub_241719168(v0 + v2, v4, v5);
}

unint64_t sub_24171A420()
{
  unint64_t result = qword_26B018CD0;
  if (!qword_26B018CD0)
  {
    sub_24171F738();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018CD0);
  }
  return result;
}

void sub_24171A478(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_24171A4DC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_24171A514()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_dismissViewControllerAnimated_completion_, 1, 0);
}

uint64_t sub_24171A53C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MobilityAppPlugin25MobilityAppPluginDelegate_logger;
  uint64_t v2 = sub_24171F5C8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_24171A5DC(char a1, int64_t a2, char a3, unint64_t a4)
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
  sub_2416E26BC(0, &qword_268D249D0, MEMORY[0x263F42AE8], MEMORY[0x263F8E0F8]);
  uint64_t v10 = *(void *)(sub_24171E5C8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  char v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24171FC38();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_24171E5C8() - 8);
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
    sub_24171A870(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_24171A870(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_24171E5C8() - 8);
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
  uint64_t result = sub_24171FCA8();
  __break(1u);
  return result;
}

unint64_t sub_24171A9C8()
{
  unint64_t result = qword_26B018A88;
  if (!qword_26B018A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B018A88);
  }
  return result;
}

id sub_24171AA1C()
{
  uint64_t v1 = OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay);
  }
  else
  {
    uint64_t v4 = v0;
    type metadata accessor for FitnessPlusCell();
    sub_24171D81C(&qword_268D24E38, v5, (void (*)(uint64_t))type metadata accessor for FitnessPlusCell);
    unint64_t v6 = (void *)sub_24171E628();
    uint64_t v7 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id sub_24171AAD4()
{
  uint64_t v1 = OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay);
  }
  else
  {
    uint64_t v4 = v0;
    sub_2416FA7F4(0, &qword_268D24E58);
    uint64_t v5 = (void *)sub_24171FA98();
    type metadata accessor for FitnessPlusCell();
    sub_24171D81C(&qword_268D24E38, v6, (void (*)(uint64_t))type metadata accessor for FitnessPlusCell);
    uint64_t v7 = (void *)sub_24171E638();

    id v8 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

id sub_24171ABC4()
{
  return sub_24171AEC0(&OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___fitnessPlusHeroImage, (uint64_t (*)(uint64_t))sub_24171ABE4);
}

id sub_24171ABE4(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  objc_msgSend(v2, sel_setContentMode_, 2);
  objc_msgSend(v2, sel_setClipsToBounds_, 1);
  uint64_t v6 = *(void *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier);
  uint64_t v7 = *(void *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier + 8);
  id v3 = v2;
  sub_24171EF98();
  sub_24171F868();
  uint64_t v4 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setAccessibilityIdentifier_, v4, v6, v7);

  return v3;
}

id sub_24171ACD0()
{
  return sub_24171ACEC(&OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryTitleLabel);
}

id sub_24171ACEC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  id v3 = *(void **)(v1 + *a1);
  if (v3)
  {
    id v4 = *(id *)(v1 + *a1);
  }
  else
  {
    id v5 = sub_24171AD74(v1);
    uint64_t v6 = *(void **)(v1 + v2);
    *(void *)(v1 + v2) = v5;
    id v4 = v5;

    id v3 = 0;
  }
  id v7 = v3;
  return v4;
}

id sub_24171AD4C()
{
  return sub_24171ACEC(&OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryDescriptionLabel);
}

id sub_24171AD74(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  id v3 = objc_msgSend(self, sel_whiteColor);
  objc_msgSend(v2, sel_setTextColor_, v3);

  objc_msgSend(v2, sel_setLineBreakMode_, 0);
  objc_msgSend(v2, sel_setNumberOfLines_, 0);
  uint64_t v7 = *(void *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier);
  uint64_t v8 = *(void *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier + 8);
  id v4 = v2;
  sub_24171EF98();
  sub_24171F868();
  id v5 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setAccessibilityIdentifier_, v5, v7, v8);

  return v4;
}

id sub_24171AEA0()
{
  return sub_24171AEC0(&OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___linkToFitnessButton, (uint64_t (*)(uint64_t))sub_24171AF24);
}

id sub_24171AEC0(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  id v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    uint64_t v6 = (void *)a2(v2);
    uint64_t v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    id v4 = 0;
  }
  id v8 = v4;
  return v5;
}

id sub_24171AF24(uint64_t a1)
{
  sub_24171D6F8(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)v16 - v3;
  sub_24171EC48();
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_buttonWithType_, 1);
  uint64_t v6 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  if (qword_26B018CB0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24171E8B8();
  sub_2416E70CC(v7, (uint64_t)qword_26B018E08);
  sub_24171E9B8();
  sub_24171DD54((uint64_t)v4, &qword_26B018CA8, MEMORY[0x263F07690]);
  id v8 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setTitle_forState_, v8, 0);

  objc_msgSend(v5, sel_addTarget_action_forControlEvents_, a1, sel_linkButtonPressed, 64);
  objc_msgSend(v5, sel_setContentHorizontalAlignment_, 4);
  id v9 = objc_msgSend(v5, sel_titleLabel);
  objc_msgSend(v9, sel_setNumberOfLines_, 0);

  sub_2416FA7F4(0, &qword_268D24E58);
  uint64_t v10 = (void *)sub_24171FAA8();
  objc_msgSend(v5, sel_setTitleColor_forState_, v10, 0);
  uint64_t v11 = *(void *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier);
  uint64_t v12 = *(void *)(a1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier + 8);
  v16[0] = v11;
  v16[1] = v12;
  id v13 = v5;
  sub_24171EF98();
  sub_24171F868();
  size_t v14 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setAccessibilityIdentifier_, v14);

  return v13;
}

id sub_24171B258(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay] = 0;
  *(void *)&v4[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay] = 0;
  id v9 = (uint64_t *)&v4[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier];
  uint64_t v10 = v4;
  sub_24171FBC8();
  uint64_t v11 = sub_24171F818();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  sub_24171F868();
  *id v9 = v11;
  v9[1] = v13;
  size_t v14 = &v10[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item];
  *(_OWORD *)size_t v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((void *)v14 + 4) = 0;
  *(void *)&v10[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___fitnessPlusHeroImage] = 0;
  *(void *)&v10[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryTitleLabel] = 0;
  *(void *)&v10[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryDescriptionLabel] = 0;
  *(void *)&v10[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___linkToFitnessButton] = 0;

  v56.receiver = v10;
  v56.super_class = (Class)type metadata accessor for FitnessPlusCell();
  id v15 = objc_msgSendSuper2(&v56, sel_initWithFrame_, a1, a2, a3, a4);
  sub_24171EF98();
  uint64_t v16 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setAccessibilityIdentifier_, v16);

  sub_24171D6F8(0, &qword_268D24E60, (uint64_t (*)(uint64_t))sub_24171DE10, MEMORY[0x263F8E0F8]);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_241722EE0;
  *(void *)(inited + 32) = sub_24171ABC4();
  *(_OWORD *)(inited + 40) = 0u;
  *(_OWORD *)(inited + 56) = 0u;
  *(void *)(inited + 72) = sub_24171C0DC();
  *(_OWORD *)(inited + 80) = xmmword_241722EF0;
  *(_OWORD *)(inited + 96) = xmmword_241722F00;
  *(void *)(inited + 112) = sub_24171ACD0();
  *(_OWORD *)(inited + 120) = xmmword_241722F10;
  *(_OWORD *)(inited + 136) = xmmword_241722F00;
  *(void *)(inited + 152) = sub_24171AD4C();
  *(_OWORD *)(inited + 160) = xmmword_241722F20;
  *(_OWORD *)(inited + 176) = xmmword_241722F00;
  *(void *)(inited + 192) = sub_24171AEA0();
  *(_OWORD *)(inited + 200) = xmmword_241722F30;
  *(_OWORD *)(inited + 216) = xmmword_241722EF0;
  sub_24171CBD0(inited, 0.0, 0.0, 0.0, 0.0);
  swift_setDeallocating();
  sub_24171DE10();
  swift_arrayDestroy();
  id v18 = sub_24171ABC4();
  objc_msgSend(v18, sel_hk_constraintAspectRatioFromSize_, 5.0, 3.0);

  id v19 = objc_msgSend(v15, sel_contentView);
  id v20 = sub_24171AA1C();
  id v21 = sub_24171ABC4();
  objc_msgSend(v19, sel_insertSubview_aboveSubview_, v20, v21);

  id v22 = objc_msgSend(v15, sel_contentView);
  id v23 = sub_24171AAD4();
  id v24 = sub_24171ABC4();
  objc_msgSend(v22, sel_insertSubview_belowSubview_, v23, v24);

  id v25 = sub_24171AA1C();
  id v26 = sub_24171ABC4();
  objc_msgSend(v25, sel_hk_alignConstraintsWithView_, v26);

  id v27 = sub_24171AAD4();
  id v28 = objc_msgSend(v15, sel_contentView);
  objc_msgSend(v27, sel_hk_alignHorizontalConstraintsWithView_insets_, v28, 0.0, 0.0, 0.0, 0.0);

  id v29 = sub_24171AAD4();
  id v30 = objc_msgSend(v29, sel_topAnchor);

  id v31 = sub_24171ABC4();
  id v32 = objc_msgSend(v31, sel_bottomAnchor);

  id v33 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v32);
  objc_msgSend(v33, sel_setActive_, 1);

  id v34 = sub_24171AAD4();
  id v35 = objc_msgSend(v34, sel_bottomAnchor);

  id v36 = objc_msgSend(v15, sel_contentView);
  id v37 = objc_msgSend(v36, sel_bottomAnchor);

  id v38 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v37);
  objc_msgSend(v38, sel_setActive_, 1);

  id v39 = objc_msgSend(v15, sel_contentView);
  id v40 = objc_msgSend(v39, sel_layer);

  objc_msgSend(v40, sel_setCornerRadius_, 10.0);
  id v41 = objc_msgSend(v15, sel_contentView);
  id v42 = objc_msgSend(v41, sel_layer);

  objc_msgSend(v42, sel_setMasksToBounds_, 1);
  id v43 = objc_msgSend(v15, sel_contentView);
  id v44 = objc_allocWithZone(MEMORY[0x263F825C8]);
  aBlock[4] = sub_24171C070;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24171D75C;
  aBlock[3] = &unk_26F594D80;
  uint64_t v45 = _Block_copy(aBlock);
  id v46 = objc_msgSend(v44, sel_initWithDynamicProvider_, v45);
  _Block_release(v45);
  swift_release();
  objc_msgSend(v43, sel_setBackgroundColor_, v46);

  id v47 = sub_24171ACD0();
  sub_2416FA7F4(0, &qword_268D24C60);
  uint64_t v48 = (void *)sub_24171FA78();
  objc_msgSend(v47, sel_setFont_, v48);

  id v49 = sub_24171AD4C();
  uint64_t v50 = (void *)sub_24171FA78();
  objc_msgSend(v49, sel_setFont_, v50);

  id v51 = sub_24171AEA0();
  id v52 = objc_msgSend(v51, sel_titleLabel);

  if (v52)
  {
    uint64_t v53 = (void *)sub_24171FA78();
    objc_msgSend(v52, sel_setFont_, v53);
  }
  sub_24171BA8C();

  return v15;
}

uint64_t sub_24171BA8C()
{
  swift_getObjectType();
  sub_24171D6F8(0, &qword_268D24E40, (uint64_t (*)(uint64_t))sub_24171DDC4, MEMORY[0x263F8E0F8]);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_241720600;
  uint64_t v1 = sub_24171F688();
  uint64_t v2 = MEMORY[0x263F82018];
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  uint64_t v3 = sub_24171F638();
  uint64_t v4 = MEMORY[0x263F81EC8];
  *(void *)(v0 + 48) = v3;
  *(void *)(v0 + 56) = v4;
  sub_24171FA88();
  sub_24171F2D8();

  return swift_bridgeObjectRelease();
}

void sub_24171BB74()
{
  swift_getObjectType();
  uint64_t v1 = sub_24171F5C8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (uint64_t)v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item;
  swift_beginAccess();
  sub_24171D694(v5, (uint64_t)v31);
  if (!v31[3])
  {
    sub_24171D638((uint64_t)v31);
LABEL_10:
    sub_24171F598();
    id v15 = v0;
    uint64_t v16 = sub_24171F5B8();
    os_log_type_t v17 = sub_24171F948();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v27 = v1;
      uint64_t v19 = v18;
      uint64_t v20 = swift_slowAlloc();
      v31[0] = v20;
      *(_DWORD *)uint64_t v19 = 136446466;
      uint64_t v21 = sub_24171FE48();
      uint64_t v28 = sub_2416E1FBC(v21, v22, v31);
      sub_24171FB18();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 12) = 2082;
      uint64_t v28 = sub_2416E1FBC(0xD000000000000021, 0x8000000241726380, v31);
      sub_24171FB18();

      _os_log_impl(&dword_2416DE000, v16, v17, "[%{public}s] Unexpected data source item type: %{public}s", (uint8_t *)v19, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v20, -1, -1);
      MEMORY[0x245623AC0](v19, -1, -1);

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v27);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    }
    return;
  }
  sub_2416E22F8(0, &qword_268D245F8);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v27 = v29;
  char v6 = v30;
  id v7 = sub_24171ABC4();
  uint64_t v8 = qword_26B018CF8;
  sub_24171EF98();
  if (v8 != -1) {
    swift_once();
  }
  id v9 = (id)qword_26B018E00;
  uint64_t v10 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v10, v9, 0);

  if (!v11) {
    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setImage_, v11);

  id v12 = sub_24171ACD0();
  sub_24171DB5C(v6);
  if (v13)
  {
    size_t v14 = (void *)sub_24171F7D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    size_t v14 = 0;
  }
  objc_msgSend(v12, sel_setText_, v14);

  id v23 = sub_24171AD4C();
  sub_24171DB5C(v6);
  uint64_t v25 = v24;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25)
  {
    id v26 = (void *)sub_24171F7D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v26 = 0;
  }
  objc_msgSend(v23, sel_setText_, v26);
}

id sub_24171C070(void *a1)
{
  id v1 = objc_msgSend(a1, sel_userInterfaceStyle);
  uint64_t v2 = self;
  uint64_t v3 = &selRef_tertiarySystemBackgroundColor;
  if (v1 != (id)2) {
    uint64_t v3 = &selRef_blackColor;
  }
  id v4 = [v2 *v3];

  return v4;
}

id sub_24171C0DC()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  if (qword_26B018CF8 != -1) {
    swift_once();
  }
  id v2 = (id)qword_26B018E00;
  uint64_t v3 = (void *)sub_24171F7D8();
  id v4 = objc_msgSend(self, sel_imageNamed_inBundle_compatibleWithTraitCollection_, v3, v2, 0);

  if (!v4) {
    id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  }
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v4);

  uint64_t v21 = *(void *)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier);
  uint64_t v22 = *(void *)(v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier + 8);
  id v6 = v5;
  sub_24171EF98();
  sub_24171F868();
  id v7 = (void *)sub_24171F7D8();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setAccessibilityIdentifier_, v7, v21, v22);

  objc_msgSend(v1, sel_addSubview_, v6);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v8 = objc_msgSend(v6, sel_topAnchor);
  id v9 = objc_msgSend(v1, sel_topAnchor);
  id v10 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v9);

  objc_msgSend(v10, sel_setActive_, 1);
  id v11 = objc_msgSend(v6, sel_bottomAnchor);
  id v12 = objc_msgSend(v1, sel_bottomAnchor);
  id v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

  objc_msgSend(v13, sel_setActive_, 1);
  id v14 = objc_msgSend(v6, sel_leadingAnchor);
  id v15 = objc_msgSend(v1, sel_leadingAnchor);
  id v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

  objc_msgSend(v16, sel_setActive_, 1);
  id v17 = objc_msgSend(v6, sel_trailingAnchor);
  id v18 = objc_msgSend(v1, sel_trailingAnchor);
  id v19 = objc_msgSend(v17, sel_constraintLessThanOrEqualToAnchor_, v18);

  objc_msgSend(v19, sel_setActive_, 1);
  return v1;
}

uint64_t sub_24171C474()
{
  uint64_t v28 = sub_24171F5C8();
  uint64_t v1 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24171D6F8(0, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v27 - v5;
  uint64_t v7 = sub_24171E208();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v0 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item;
  swift_beginAccess();
  sub_24171D694(v11, (uint64_t)&aBlock);
  if (v34)
  {
    sub_2416E22F8(0, &qword_268D245F8);
    if (swift_dynamicCast())
    {
      uint64_t v12 = sub_24171DB5C(v30);
      uint64_t v14 = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_24171D638((uint64_t)&aBlock);
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  sub_24171EF98();
  sub_24171E1D8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_24171DD54((uint64_t)v6, (unint64_t *)&qword_26B018C48, MEMORY[0x263F06EA8]);
    sub_24171F598();
    sub_24171EF98();
    id v15 = sub_24171F5B8();
    os_log_type_t v16 = sub_24171F938();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v27 = v1;
      uint64_t v19 = v18;
      uint64_t v29 = v18;
      *(_DWORD *)id v17 = 136315138;
      uint64_t aBlock = v12;
      uint64_t v32 = v14;
      sub_24171D7C4();
      uint64_t v20 = sub_24171FAF8();
      uint64_t aBlock = sub_2416E1FBC(v20, v21, &v29);
      sub_24171FB18();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2416DE000, v15, v16, "FitnesssPlusCell: Unable to construct URL from '%s'", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245623AC0](v19, -1, -1);
      MEMORY[0x245623AC0](v17, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v3, v28);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v28);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    id v23 = objc_msgSend(self, sel_sharedApplication);
    uint64_t v24 = (void *)sub_24171E1E8();
    sub_241701320(MEMORY[0x263F8EE78]);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_24171D81C(&qword_268D24640, 255, type metadata accessor for OpenExternalURLOptionsKey);
    uint64_t v25 = (void *)sub_24171F7A8();
    swift_bridgeObjectRelease();
    id v35 = sub_24171CA4C;
    uint64_t v36 = 0;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v32 = 1107296256;
    id v33 = sub_2416EFD88;
    id v34 = &unk_26F594D58;
    id v26 = _Block_copy(&aBlock);
    objc_msgSend(v23, sel_openURL_options_completionHandler_, v24, v25, v26);
    _Block_release(v26);

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_24171CA4C(char a1)
{
  uint64_t v2 = sub_24171F5C8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    sub_24171F598();
    uint64_t v7 = sub_24171F5B8();
    os_log_type_t v8 = sub_24171F938();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_2416DE000, v7, v8, "FitnessPlusCell: unable to open link to Fitness+", v9, 2u);
      MEMORY[0x245623AC0](v9, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

void sub_24171CBD0(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    uint64_t v53 = a1 + 32;
    uint64_t v10 = 0;
    uint64_t v52 = sub_24171EF98();
    uint64_t v11 = (double *)(v52 + 64);
    double v12 = 0.0;
    uint64_t v13 = &off_2650EC000;
    uint64_t v14 = &off_2650EC000;
    id v15 = (const char *)&off_2650EC000;
    uint64_t v54 = v6;
    do
    {
      double v24 = *(v11 - 3);
      double v25 = *(v11 - 2);
      double v26 = *(v11 - 1);
      double v27 = *v11;
      id v57 = *((id *)v11 - 4);
      id v28 = [v5 (SEL)v13[189]];
      objc_msgSend(v28, sel_addSubview_, v57);

      objc_msgSend(v57, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      if (v10)
      {
        id v56 = v10;
        id v29 = objc_msgSend(v57, sel_topAnchor);
        id v30 = objc_msgSend(v56, sel_bottomAnchor);
        id v31 = objc_msgSend(v29, (SEL)v14[193], v30, v12 + v24);
        uint64_t v32 = v6;
        id v33 = v10;
        id v34 = v5;
        id v35 = v13;
        uint64_t v36 = v14;
        id v37 = v15;
        id v38 = v31;

        objc_msgSend(v38, v37 + 3224, 1);
        id v15 = v37;
        uint64_t v14 = v36;
        uint64_t v13 = v35;
        uint64_t v5 = v34;
        uint64_t v10 = v33;
        uint64_t v6 = v32;
      }
      id v16 = objc_msgSend(v57, sel_leadingAnchor, v52);
      id v17 = [v5 (SEL)v13[189]];
      id v18 = objc_msgSend(v17, sel_leadingAnchor);

      id v19 = objc_msgSend(v16, (SEL)v14[193], v18, v25 + a3);
      objc_msgSend(v19, *((SEL *)v15 + 194), 1);

      id v20 = objc_msgSend(v57, sel_trailingAnchor);
      id v21 = [v5 (SEL)v13[189]];
      id v22 = objc_msgSend(v21, sel_trailingAnchor);

      id v23 = objc_msgSend(v20, (SEL)v14[193], v22, -(v27 + a5));
      objc_msgSend(v23, *((SEL *)v15 + 194), 1);

      v11 += 5;
      uint64_t v10 = v57;
      double v12 = v26;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    double v39 = *(double *)(v52 + 40) + a2;
    id v40 = *(id *)(v52 + 32);
    id v41 = objc_msgSend(v40, sel_topAnchor);
    id v42 = [v5 (SEL)v13[189]];
    id v43 = objc_msgSend(v42, sel_topAnchor);

    id v44 = objc_msgSend(v41, (SEL)v14[193], v43, v39);
    objc_msgSend(v44, *((SEL *)v15 + 194), 1);

    uint64_t v45 = v53 + 40 * v54;
    double v46 = *(double *)(v45 - 16) + a4;
    id v47 = *(id *)(v45 - 40);
    id v48 = objc_msgSend(v47, sel_bottomAnchor);
    id v49 = [v5 (SEL)v13[189]];
    id v50 = objc_msgSend(v49, sel_bottomAnchor);

    id v51 = objc_msgSend(v48, (SEL)v14[193], v50, -v46);
    objc_msgSend(v51, *((SEL *)v15 + 194), 1);
  }
}

id sub_24171D068()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FitnessPlusCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FitnessPlusCell()
{
  return self;
}

uint64_t sub_24171D170()
{
  uint64_t v0 = qword_268D24DE0;
  sub_24171EF98();
  return v0;
}

uint64_t sub_24171D1A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item;
  swift_beginAccess();
  return sub_24171D694(v3, a1);
}

uint64_t sub_24171D1FC(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item;
  swift_beginAccess();
  sub_24171D56C(a1, v3);
  swift_endAccess();
  sub_24171BB74();
  return sub_24171D638(a1);
}

void (*sub_24171D26C(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_24171D2CC;
}

void sub_24171D2CC(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_24171BB74();
  }
}

id sub_24171D300()
{
  return sub_24171AA1C();
}

id sub_24171D324()
{
  return sub_24171AAD4();
}

double sub_24171D350()
{
  id v1 = objc_msgSend(*v0, sel_traitCollection);
  id v2 = objc_msgSend(v1, sel_userInterfaceStyle);

  double result = 0.1;
  if (v2 == (id)2) {
    return 1.0;
  }
  return result;
}

uint64_t sub_24171D3B4()
{
  return sub_24171C474();
}

uint64_t sub_24171D3D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F440E0];
  uint64_t v3 = sub_24171EEE8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

uint64_t sub_24171D56C(uint64_t a1, uint64_t a2)
{
  sub_24171D5D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_24171D5D0()
{
  if (!qword_268D24E30)
  {
    sub_2416E22F8(255, &qword_268D245F8);
    unint64_t v0 = sub_24171FB08();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24E30);
    }
  }
}

uint64_t sub_24171D638(uint64_t a1)
{
  sub_24171D5D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24171D694(uint64_t a1, uint64_t a2)
{
  sub_24171D5D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_24171D6F8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

id sub_24171D75C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = (void *)v3();
  swift_release();

  return v5;
}

void sub_24171D7C4()
{
  if (!qword_268D249C8)
  {
    unint64_t v0 = sub_24171FB08();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D249C8);
    }
  }
}

uint64_t sub_24171D81C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_24171D864(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24171D874()
{
  return swift_release();
}

void sub_24171D880()
{
  *(void *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedImageOverlay] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___highlightedSashUnderlay] = 0;
  uint64_t v1 = (uint64_t *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_baseIdentifier];
  sub_24171FBC8();
  uint64_t v2 = sub_24171F818();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  sub_24171F868();
  *uint64_t v1 = v2;
  v1[1] = v4;
  uint64_t v5 = &v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell_item];
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(void *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___fitnessPlusHeroImage] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryTitleLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___categoryDescriptionLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17MobilityAppPlugin15FitnessPlusCell____lazy_storage___linkToFitnessButton] = 0;

  sub_24171FC48();
  __break(1u);
}

void sub_24171D9C4()
{
  id v0 = sub_24171ACD0();
  sub_2416FA7F4(0, &qword_268D24C60);
  uint64_t v1 = (void *)sub_24171FA78();
  objc_msgSend(v0, sel_setFont_, v1);

  id v2 = sub_24171AD4C();
  uint64_t v3 = (void *)sub_24171FA78();
  objc_msgSend(v2, sel_setFont_, v3);

  id v4 = sub_24171AEA0();
  id v5 = objc_msgSend(v4, sel_titleLabel);

  if (v5)
  {
    id v6 = (id)sub_24171FA78();
    objc_msgSend(v5, sel_setFont_, v6);
  }
}

uint64_t sub_24171DB5C(char a1)
{
  sub_24171D6F8(0, &qword_26B018CA8, MEMORY[0x263F07690], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v9 - v3;
  uint64_t v5 = sub_24171E288();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  if (a1)
  {
    if (qword_26B018CB0 != -1) {
      swift_once();
    }
  }
  else if (qword_26B018CB0 != -1)
  {
    swift_once();
  }
  uint64_t v6 = sub_24171E8B8();
  sub_2416E70CC(v6, (uint64_t)qword_26B018E08);
  uint64_t v7 = sub_24171E9B8();
  sub_24171DD54((uint64_t)v4, &qword_26B018CA8, MEMORY[0x263F07690]);
  return v7;
}

uint64_t sub_24171DD54(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_24171D6F8(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

unint64_t sub_24171DDC4()
{
  unint64_t result = qword_268D24E48;
  if (!qword_268D24E48)
  {
    sub_2416E22F8(255, &qword_268D24E50);
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_268D24E48);
  }
  return result;
}

void sub_24171DE10()
{
  if (!qword_268D24E68)
  {
    sub_2416FA7F4(255, &qword_268D24E70);
    type metadata accessor for NSDirectionalEdgeInsets(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268D24E68);
    }
  }
}

uint64_t type metadata accessor for MobilityAdvertisableFeatureSourceProvider()
{
  return self;
}

uint64_t sub_24171DEBC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MobilityAdvertisableFeatureSourceProvider();
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_24171DEF4(uint64_t a1)
{
  uint64_t v2 = sub_24171E898();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24171E978();
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v7(v5, a1, v2);
  uint64_t v8 = sub_24171E968();
  sub_24171E070();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_241720620;
  sub_24171E6C8();
  v7(v5, a1, v2);
  _DWORD v13[4] = v6;
  v13[5] = sub_24171E11C();
  v13[1] = v8;
  swift_retain();
  uint64_t v10 = sub_24171E6B8();
  uint64_t v11 = MEMORY[0x263F43538];
  *(void *)(v9 + 32) = v10;
  *(void *)(v9 + 40) = v11;
  swift_release();
  return v9;
}

void sub_24171E070()
{
  if (!qword_268D24E78)
  {
    sub_24171E0C8();
    unint64_t v0 = sub_24171FD68();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D24E78);
    }
  }
}

unint64_t sub_24171E0C8()
{
  unint64_t result = qword_268D24E80;
  if (!qword_268D24E80)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_268D24E80);
  }
  return result;
}

unint64_t sub_24171E11C()
{
  unint64_t result = qword_268D24E88;
  if (!qword_268D24E88)
  {
    sub_24171E978();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D24E88);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_24171E198()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_24171E1A8()
{
  return MEMORY[0x270EEEC28]();
}

uint64_t sub_24171E1B8()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_24171E1C8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24171E1D8()
{
  return MEMORY[0x270F5EC28]();
}

uint64_t sub_24171E1E8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24171E1F8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_24171E208()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24171E218()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24171E228()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_24171E238()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24171E248()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24171E258()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24171E268()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24171E278()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24171E288()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24171E298()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_24171E2A8()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_24171E2B8()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24171E2C8()
{
  return MEMORY[0x270F5D2A0]();
}

uint64_t sub_24171E2D8()
{
  return MEMORY[0x270F604A0]();
}

uint64_t sub_24171E2E8()
{
  return MEMORY[0x270F614D0]();
}

uint64_t sub_24171E2F8()
{
  return MEMORY[0x270F614D8]();
}

uint64_t sub_24171E308()
{
  return MEMORY[0x270F61D58]();
}

uint64_t sub_24171E318()
{
  return MEMORY[0x270F61D60]();
}

uint64_t sub_24171E328()
{
  return MEMORY[0x270F61D68]();
}

uint64_t sub_24171E338()
{
  return MEMORY[0x270F61D70]();
}

uint64_t sub_24171E348()
{
  return MEMORY[0x270F61D78]();
}

uint64_t sub_24171E358()
{
  return MEMORY[0x270F5D890]();
}

uint64_t sub_24171E368()
{
  return MEMORY[0x270F5D8A0]();
}

uint64_t sub_24171E378()
{
  return MEMORY[0x270F5D8A8]();
}

uint64_t sub_24171E388()
{
  return MEMORY[0x270F5E3A0]();
}

uint64_t sub_24171E398()
{
  return MEMORY[0x270F5E3A8]();
}

uint64_t sub_24171E3A8()
{
  return MEMORY[0x270F5E3D0]();
}

uint64_t sub_24171E3B8()
{
  return MEMORY[0x270F5E9D8]();
}

uint64_t sub_24171E3C8()
{
  return MEMORY[0x270F5E9E0]();
}

uint64_t sub_24171E3D8()
{
  return MEMORY[0x270F36140]();
}

uint64_t sub_24171E3E8()
{
  return MEMORY[0x270F36148]();
}

uint64_t sub_24171E3F8()
{
  return MEMORY[0x270F36178]();
}

uint64_t sub_24171E408()
{
  return MEMORY[0x270F36180]();
}

uint64_t sub_24171E418()
{
  return MEMORY[0x270F362C0]();
}

uint64_t sub_24171E428()
{
  return MEMORY[0x270F36338]();
}

uint64_t sub_24171E438()
{
  return MEMORY[0x270F36340]();
}

uint64_t sub_24171E448()
{
  return MEMORY[0x270F36348]();
}

uint64_t sub_24171E458()
{
  return MEMORY[0x270F363D8]();
}

uint64_t sub_24171E468()
{
  return MEMORY[0x270F363E8]();
}

uint64_t sub_24171E478()
{
  return MEMORY[0x270F363F8]();
}

uint64_t sub_24171E488()
{
  return MEMORY[0x270F36400]();
}

uint64_t sub_24171E498()
{
  return MEMORY[0x270F36420]();
}

uint64_t sub_24171E4A8()
{
  return MEMORY[0x270F364C8]();
}

uint64_t sub_24171E4B8()
{
  return MEMORY[0x270F364D8]();
}

uint64_t sub_24171E4C8()
{
  return MEMORY[0x270F364F0]();
}

uint64_t sub_24171E4D8()
{
  return MEMORY[0x270F36500]();
}

uint64_t sub_24171E4E8()
{
  return MEMORY[0x270F36630]();
}

uint64_t sub_24171E4F8()
{
  return MEMORY[0x270F36660]();
}

uint64_t sub_24171E508()
{
  return MEMORY[0x270F36870]();
}

uint64_t sub_24171E518()
{
  return MEMORY[0x270F36960]();
}

uint64_t sub_24171E528()
{
  return MEMORY[0x270F36970]();
}

uint64_t sub_24171E538()
{
  return MEMORY[0x270F36AB8]();
}

uint64_t sub_24171E548()
{
  return MEMORY[0x270F36D68]();
}

uint64_t sub_24171E558()
{
  return MEMORY[0x270F36D70]();
}

uint64_t sub_24171E568()
{
  return MEMORY[0x270F36FF0]();
}

uint64_t sub_24171E578()
{
  return MEMORY[0x270F37000]();
}

uint64_t sub_24171E588()
{
  return MEMORY[0x270F36DC8]();
}

uint64_t sub_24171E598()
{
  return MEMORY[0x270F36DD8]();
}

uint64_t sub_24171E5A8()
{
  return MEMORY[0x270F36DE8]();
}

uint64_t sub_24171E5B8()
{
  return MEMORY[0x270F30F10]();
}

uint64_t sub_24171E5C8()
{
  return MEMORY[0x270F30F18]();
}

uint64_t sub_24171E5D8()
{
  return MEMORY[0x270F30F20]();
}

uint64_t sub_24171E5E8()
{
  return MEMORY[0x270F30F28]();
}

uint64_t sub_24171E5F8()
{
  return MEMORY[0x270F30F30]();
}

uint64_t sub_24171E608()
{
  return MEMORY[0x270F30F38]();
}

uint64_t sub_24171E618()
{
  return MEMORY[0x270F30F40]();
}

uint64_t sub_24171E628()
{
  return MEMORY[0x270F30F48]();
}

uint64_t sub_24171E638()
{
  return MEMORY[0x270F30F50]();
}

uint64_t sub_24171E648()
{
  return MEMORY[0x270F30F58]();
}

uint64_t sub_24171E658()
{
  return MEMORY[0x270F30F80]();
}

uint64_t sub_24171E668()
{
  return MEMORY[0x270F30F88]();
}

uint64_t sub_24171E678()
{
  return MEMORY[0x270F30F90]();
}

uint64_t sub_24171E688()
{
  return MEMORY[0x270F30FA8]();
}

uint64_t sub_24171E698()
{
  return MEMORY[0x270F30FB0]();
}

uint64_t sub_24171E6A8()
{
  return MEMORY[0x270F30FB8]();
}

uint64_t sub_24171E6B8()
{
  return MEMORY[0x270F31C78]();
}

uint64_t sub_24171E6C8()
{
  return MEMORY[0x270F31C80]();
}

uint64_t sub_24171E6D8()
{
  return MEMORY[0x270F31DE8]();
}

uint64_t sub_24171E6E8()
{
  return MEMORY[0x270F31DF0]();
}

uint64_t sub_24171E6F8()
{
  return MEMORY[0x270F31E38]();
}

uint64_t sub_24171E708()
{
  return MEMORY[0x270F31E40]();
}

uint64_t sub_24171E718()
{
  return MEMORY[0x270F31EB0]();
}

uint64_t sub_24171E728()
{
  return MEMORY[0x270F31EB8]();
}

uint64_t sub_24171E738()
{
  return MEMORY[0x270F31FD8]();
}

uint64_t sub_24171E748()
{
  return MEMORY[0x270F326A8]();
}

uint64_t sub_24171E758()
{
  return MEMORY[0x270F32008]();
}

uint64_t sub_24171E768()
{
  return MEMORY[0x270F32010]();
}

uint64_t sub_24171E778()
{
  return MEMORY[0x270F32028]();
}

uint64_t sub_24171E788()
{
  return MEMORY[0x270F32030]();
}

uint64_t sub_24171E798()
{
  return MEMORY[0x270F32048]();
}

uint64_t sub_24171E7A8()
{
  return MEMORY[0x270F32050]();
}

uint64_t sub_24171E7B8()
{
  return MEMORY[0x270F32058]();
}

uint64_t sub_24171E7C8()
{
  return MEMORY[0x270F320A8]();
}

uint64_t sub_24171E7D8()
{
  return MEMORY[0x270F326B0]();
}

uint64_t sub_24171E7E8()
{
  return MEMORY[0x270F32240]();
}

uint64_t sub_24171E7F8()
{
  return MEMORY[0x270F32248]();
}

uint64_t sub_24171E808()
{
  return MEMORY[0x270F32258]();
}

uint64_t sub_24171E818()
{
  return MEMORY[0x270F32260]();
}

uint64_t sub_24171E828()
{
  return MEMORY[0x270F32270]();
}

uint64_t sub_24171E838()
{
  return MEMORY[0x270F322B8]();
}

uint64_t sub_24171E848()
{
  return MEMORY[0x270F322C0]();
}

uint64_t sub_24171E858()
{
  return MEMORY[0x270F32300]();
}

uint64_t sub_24171E868()
{
  return MEMORY[0x270F32318]();
}

uint64_t sub_24171E878()
{
  return MEMORY[0x270F32328]();
}

uint64_t sub_24171E888()
{
  return MEMORY[0x270F32330]();
}

uint64_t sub_24171E898()
{
  return MEMORY[0x270F324F0]();
}

uint64_t sub_24171E8A8()
{
  return MEMORY[0x270F35E18]();
}

uint64_t sub_24171E8B8()
{
  return MEMORY[0x270F35E20]();
}

uint64_t sub_24171E8C8()
{
  return MEMORY[0x270F35E28]();
}

uint64_t sub_24171E8D8()
{
  return MEMORY[0x270F35E30]();
}

uint64_t sub_24171E8E8()
{
  return MEMORY[0x270F35E38]();
}

uint64_t sub_24171E8F8()
{
  return MEMORY[0x270F35E40]();
}

uint64_t sub_24171E908()
{
  return MEMORY[0x270F35E48]();
}

uint64_t sub_24171E918()
{
  return MEMORY[0x270F35E50]();
}

uint64_t sub_24171E928()
{
  return MEMORY[0x270F35E58]();
}

uint64_t sub_24171E938()
{
  return MEMORY[0x270F35E60]();
}

uint64_t sub_24171E948()
{
  return MEMORY[0x270F35E68]();
}

uint64_t sub_24171E958()
{
  return MEMORY[0x270F35E70]();
}

uint64_t sub_24171E968()
{
  return MEMORY[0x270F35E78]();
}

uint64_t sub_24171E978()
{
  return MEMORY[0x270F35E80]();
}

uint64_t sub_24171E988()
{
  return MEMORY[0x270F35E88]();
}

uint64_t sub_24171E998()
{
  return MEMORY[0x270F35E90]();
}

uint64_t sub_24171E9A8()
{
  return MEMORY[0x270F35E98]();
}

uint64_t sub_24171E9B8()
{
  return MEMORY[0x270F35EA0]();
}

uint64_t sub_24171E9C8()
{
  return MEMORY[0x270F327C0]();
}

uint64_t sub_24171E9D8()
{
  return MEMORY[0x270F32800]();
}

uint64_t sub_24171E9E8()
{
  return MEMORY[0x270F32868]();
}

uint64_t sub_24171EA18()
{
  return MEMORY[0x270F32888]();
}

uint64_t sub_24171EA48()
{
  return MEMORY[0x270F328A0]();
}

uint64_t sub_24171EA58()
{
  return MEMORY[0x270F328A8]();
}

uint64_t sub_24171EA68()
{
  return MEMORY[0x270F328B8]();
}

uint64_t sub_24171EA78()
{
  return MEMORY[0x270F328D8]();
}

uint64_t sub_24171EA88()
{
  return MEMORY[0x270F328E0]();
}

uint64_t sub_24171EA98()
{
  return MEMORY[0x270F32910]();
}

uint64_t sub_24171EAA8()
{
  return MEMORY[0x270F32960]();
}

uint64_t sub_24171EAB8()
{
  return MEMORY[0x270F32968]();
}

uint64_t sub_24171EAC8()
{
  return MEMORY[0x270F329F0]();
}

uint64_t sub_24171EAD8()
{
  return MEMORY[0x270F329F8]();
}

uint64_t sub_24171EAE8()
{
  return MEMORY[0x270F32A00]();
}

uint64_t sub_24171EAF8()
{
  return MEMORY[0x270F32A20]();
}

uint64_t sub_24171EB08()
{
  return MEMORY[0x270F32A30]();
}

uint64_t sub_24171EB18()
{
  return MEMORY[0x270F32A40]();
}

uint64_t sub_24171EB28()
{
  return MEMORY[0x270F32A50]();
}

uint64_t sub_24171EB38()
{
  return MEMORY[0x270F32A70]();
}

uint64_t sub_24171EB48()
{
  return MEMORY[0x270F32AA0]();
}

uint64_t sub_24171EB58()
{
  return MEMORY[0x270F32AB0]();
}

uint64_t sub_24171EB68()
{
  return MEMORY[0x270F32AD8]();
}

uint64_t sub_24171EB78()
{
  return MEMORY[0x270F32B98]();
}

uint64_t sub_24171EB88()
{
  return MEMORY[0x270F32BA0]();
}

uint64_t sub_24171EB98()
{
  return MEMORY[0x270F32BA8]();
}

uint64_t sub_24171EBA8()
{
  return MEMORY[0x270F32BB0]();
}

uint64_t sub_24171EBB8()
{
  return MEMORY[0x270F32BE0]();
}

uint64_t sub_24171EBC8()
{
  return MEMORY[0x270F32BE8]();
}

uint64_t sub_24171EBD8()
{
  return MEMORY[0x270F32BF0]();
}

uint64_t sub_24171EBE8()
{
  return MEMORY[0x270F32BF8]();
}

uint64_t sub_24171EBF8()
{
  return MEMORY[0x270F32C00]();
}

uint64_t sub_24171EC08()
{
  return MEMORY[0x270F32C90]();
}

uint64_t sub_24171EC18()
{
  return MEMORY[0x270F32D60]();
}

uint64_t sub_24171EC28()
{
  return MEMORY[0x270F32D68]();
}

uint64_t sub_24171EC38()
{
  return MEMORY[0x270F32D80]();
}

uint64_t sub_24171EC48()
{
  return MEMORY[0x270F32DB0]();
}

uint64_t sub_24171EC58()
{
  return MEMORY[0x270F32E40]();
}

uint64_t sub_24171EC68()
{
  return MEMORY[0x270F32E48]();
}

uint64_t sub_24171EC78()
{
  return MEMORY[0x270F32E60]();
}

uint64_t sub_24171EC88()
{
  return MEMORY[0x270F32EA0]();
}

uint64_t sub_24171EC98()
{
  return MEMORY[0x270F32EA8]();
}

uint64_t sub_24171ECA8()
{
  return MEMORY[0x270F32EB0]();
}

uint64_t sub_24171ECB8()
{
  return MEMORY[0x270F32ED0]();
}

uint64_t sub_24171ECC8()
{
  return MEMORY[0x270F32FD0]();
}

uint64_t sub_24171ECD8()
{
  return MEMORY[0x270F32FD8]();
}

uint64_t sub_24171ECE8()
{
  return MEMORY[0x270F33088]();
}

uint64_t sub_24171ECF8()
{
  return MEMORY[0x270F33090]();
}

uint64_t sub_24171ED08()
{
  return MEMORY[0x270F33098]();
}

uint64_t sub_24171ED18()
{
  return MEMORY[0x270F330A8]();
}

uint64_t sub_24171ED28()
{
  return MEMORY[0x270F33118]();
}

uint64_t sub_24171ED38()
{
  return MEMORY[0x270F33128]();
}

uint64_t sub_24171ED48()
{
  return MEMORY[0x270F33140]();
}

uint64_t sub_24171ED58()
{
  return MEMORY[0x270F33170]();
}

uint64_t sub_24171ED68()
{
  return MEMORY[0x270F33188]();
}

uint64_t sub_24171ED78()
{
  return MEMORY[0x270F331B0]();
}

uint64_t sub_24171ED88()
{
  return MEMORY[0x270F331F0]();
}

uint64_t sub_24171ED98()
{
  return MEMORY[0x270F33200]();
}

uint64_t sub_24171EDA8()
{
  return MEMORY[0x270F33208]();
}

uint64_t sub_24171EDB8()
{
  return MEMORY[0x270F33278]();
}

uint64_t sub_24171EDC8()
{
  return MEMORY[0x270F33280]();
}

uint64_t sub_24171EDD8()
{
  return MEMORY[0x270F33288]();
}

uint64_t sub_24171EDE8()
{
  return MEMORY[0x270F33290]();
}

uint64_t sub_24171EDF8()
{
  return MEMORY[0x270F332B0]();
}

uint64_t sub_24171EE08()
{
  return MEMORY[0x270F33300]();
}

uint64_t sub_24171EE18()
{
  return MEMORY[0x270F33320]();
}

uint64_t sub_24171EE28()
{
  return MEMORY[0x270F33340]();
}

uint64_t sub_24171EE38()
{
  return MEMORY[0x270F333D0]();
}

uint64_t sub_24171EE48()
{
  return MEMORY[0x270F333D8]();
}

uint64_t sub_24171EE58()
{
  return MEMORY[0x270F333E0]();
}

uint64_t sub_24171EE68()
{
  return MEMORY[0x270F333E8]();
}

uint64_t sub_24171EE78()
{
  return MEMORY[0x270F33518]();
}

uint64_t sub_24171EE88()
{
  return MEMORY[0x270F33530]();
}

uint64_t sub_24171EE98()
{
  return MEMORY[0x270F33538]();
}

uint64_t sub_24171EEA8()
{
  return MEMORY[0x270F33640]();
}

uint64_t sub_24171EEB8()
{
  return MEMORY[0x270F336F0]();
}

uint64_t sub_24171EEC8()
{
  return MEMORY[0x270F33700]();
}

uint64_t sub_24171EED8()
{
  return MEMORY[0x270F33718]();
}

uint64_t sub_24171EEE8()
{
  return MEMORY[0x270F33748]();
}

uint64_t sub_24171EEF8()
{
  return MEMORY[0x270F33778]();
}

uint64_t sub_24171EF08()
{
  return MEMORY[0x270F33780]();
}

uint64_t sub_24171EF18()
{
  return MEMORY[0x270F337C0]();
}

uint64_t sub_24171EF28()
{
  return MEMORY[0x270F337E8]();
}

uint64_t sub_24171EF38()
{
  return MEMORY[0x270F337F8]();
}

uint64_t sub_24171EF48()
{
  return MEMORY[0x270F33800]();
}

uint64_t sub_24171EF58()
{
  return MEMORY[0x270F33A68]();
}

uint64_t sub_24171EF68()
{
  return MEMORY[0x270F33A80]();
}

uint64_t sub_24171EF78()
{
  return MEMORY[0x270F33A88]();
}

uint64_t sub_24171EF88()
{
  return MEMORY[0x270F33A90]();
}

uint64_t sub_24171EF98()
{
  return MEMORY[0x270F33AE0]();
}

uint64_t sub_24171EFA8()
{
  return MEMORY[0x270F33AF0]();
}

uint64_t sub_24171EFB8()
{
  return MEMORY[0x270F33AF8]();
}

uint64_t sub_24171EFC8()
{
  return MEMORY[0x270F33B28]();
}

uint64_t sub_24171EFD8()
{
  return MEMORY[0x270F33B30]();
}

uint64_t sub_24171EFE8()
{
  return MEMORY[0x270F33C10]();
}

uint64_t sub_24171EFF8()
{
  return MEMORY[0x270F33C50]();
}

uint64_t sub_24171F008()
{
  return MEMORY[0x270F33CA8]();
}

uint64_t sub_24171F018()
{
  return MEMORY[0x270F33CB8]();
}

uint64_t sub_24171F028()
{
  return MEMORY[0x270F33CC0]();
}

uint64_t sub_24171F038()
{
  return MEMORY[0x270F33D00]();
}

uint64_t sub_24171F048()
{
  return MEMORY[0x270F33D08]();
}

uint64_t sub_24171F058()
{
  return MEMORY[0x270F33D18]();
}

uint64_t sub_24171F068()
{
  return MEMORY[0x270F33D78]();
}

uint64_t sub_24171F078()
{
  return MEMORY[0x270F33D80]();
}

uint64_t sub_24171F088()
{
  return MEMORY[0x270F33D98]();
}

uint64_t sub_24171F098()
{
  return MEMORY[0x270F33DA8]();
}

uint64_t sub_24171F0A8()
{
  return MEMORY[0x270F33DC0]();
}

uint64_t sub_24171F0B8()
{
  return MEMORY[0x270F33DC8]();
}

uint64_t sub_24171F0C8()
{
  return MEMORY[0x270F33DD0]();
}

uint64_t sub_24171F0D8()
{
  return MEMORY[0x270F33DE0]();
}

uint64_t sub_24171F0E8()
{
  return MEMORY[0x270F33DF0]();
}

uint64_t sub_24171F0F8()
{
  return MEMORY[0x270F33E68]();
}

uint64_t sub_24171F108()
{
  return MEMORY[0x270F33ED0]();
}

uint64_t sub_24171F118()
{
  return MEMORY[0x270F33ED8]();
}

uint64_t sub_24171F128()
{
  return MEMORY[0x270F33EE0]();
}

uint64_t sub_24171F138()
{
  return MEMORY[0x270F33EF8]();
}

uint64_t sub_24171F148()
{
  return MEMORY[0x270F33F00]();
}

uint64_t sub_24171F158()
{
  return MEMORY[0x270F33F08]();
}

uint64_t sub_24171F168()
{
  return MEMORY[0x270F34008]();
}

uint64_t sub_24171F178()
{
  return MEMORY[0x270F34010]();
}

uint64_t sub_24171F188()
{
  return MEMORY[0x270F34030]();
}

uint64_t sub_24171F198()
{
  return MEMORY[0x270F34038]();
}

uint64_t sub_24171F1A8()
{
  return MEMORY[0x270F34108]();
}

uint64_t sub_24171F1B8()
{
  return MEMORY[0x270F34110]();
}

uint64_t sub_24171F1C8()
{
  return MEMORY[0x270F34120]();
}

uint64_t sub_24171F1D8()
{
  return MEMORY[0x270F34148]();
}

uint64_t sub_24171F1E8()
{
  return MEMORY[0x270F34160]();
}

uint64_t sub_24171F1F8()
{
  return MEMORY[0x270F34168]();
}

uint64_t sub_24171F208()
{
  return MEMORY[0x270F34170]();
}

uint64_t sub_24171F218()
{
  return MEMORY[0x270F34178]();
}

uint64_t sub_24171F228()
{
  return MEMORY[0x270F34350]();
}

uint64_t sub_24171F238()
{
  return MEMORY[0x270F34368]();
}

uint64_t sub_24171F248()
{
  return MEMORY[0x270F343F8]();
}

uint64_t sub_24171F258()
{
  return MEMORY[0x270F34400]();
}

uint64_t sub_24171F268()
{
  return MEMORY[0x270F34408]();
}

uint64_t sub_24171F278()
{
  return MEMORY[0x270F34418]();
}

uint64_t sub_24171F288()
{
  return MEMORY[0x270F34448]();
}

uint64_t sub_24171F298()
{
  return MEMORY[0x270F34450]();
}

uint64_t sub_24171F2A8()
{
  return MEMORY[0x270F34470]();
}

uint64_t sub_24171F2B8()
{
  return MEMORY[0x270F344A8]();
}

uint64_t sub_24171F2C8()
{
  return MEMORY[0x270F344B0]();
}

uint64_t sub_24171F2D8()
{
  return MEMORY[0x270F344B8]();
}

uint64_t sub_24171F2E8()
{
  return MEMORY[0x270F34548]();
}

uint64_t sub_24171F2F8()
{
  return MEMORY[0x270F345E8]();
}

uint64_t sub_24171F308()
{
  return MEMORY[0x270F345F0]();
}

uint64_t sub_24171F318()
{
  return MEMORY[0x270F34648]();
}

uint64_t sub_24171F328()
{
  return MEMORY[0x270F346D8]();
}

uint64_t sub_24171F338()
{
  return MEMORY[0x270F346E0]();
}

uint64_t sub_24171F348()
{
  return MEMORY[0x270F34758]();
}

uint64_t sub_24171F358()
{
  return MEMORY[0x270F34760]();
}

uint64_t sub_24171F388()
{
  return MEMORY[0x270F34880]();
}

uint64_t sub_24171F3A8()
{
  return MEMORY[0x270F34970]();
}

uint64_t sub_24171F3B8()
{
  return MEMORY[0x270F34988]();
}

uint64_t sub_24171F3C8()
{
  return MEMORY[0x270F34990]();
}

uint64_t sub_24171F3D8()
{
  return MEMORY[0x270F34998]();
}

uint64_t sub_24171F3E8()
{
  return MEMORY[0x270F30ED0]();
}

uint64_t sub_24171F3F8()
{
  return MEMORY[0x270F349A8]();
}

uint64_t sub_24171F408()
{
  return MEMORY[0x270F349C0]();
}

uint64_t sub_24171F418()
{
  return MEMORY[0x270F349D8]();
}

uint64_t sub_24171F428()
{
  return MEMORY[0x270F349E0]();
}

uint64_t sub_24171F438()
{
  return MEMORY[0x270F34B38]();
}

uint64_t sub_24171F448()
{
  return MEMORY[0x270F34B40]();
}

uint64_t sub_24171F458()
{
  return MEMORY[0x270F34B60]();
}

uint64_t sub_24171F468()
{
  return MEMORY[0x270F34B68]();
}

uint64_t sub_24171F478()
{
  return MEMORY[0x270F34BF0]();
}

uint64_t sub_24171F488()
{
  return MEMORY[0x270F34BF8]();
}

uint64_t sub_24171F498()
{
  return MEMORY[0x270F34C20]();
}

uint64_t sub_24171F4A8()
{
  return MEMORY[0x270F34C28]();
}

uint64_t sub_24171F4B8()
{
  return MEMORY[0x270F34CC0]();
}

uint64_t sub_24171F4C8()
{
  return MEMORY[0x270F34CC8]();
}

uint64_t sub_24171F4D8()
{
  return MEMORY[0x270F34FA0]();
}

uint64_t sub_24171F4E8()
{
  return MEMORY[0x270F34FB0]();
}

uint64_t sub_24171F4F8()
{
  return MEMORY[0x270F35028]();
}

uint64_t sub_24171F508()
{
  return MEMORY[0x270F35030]();
}

uint64_t sub_24171F518()
{
  return MEMORY[0x270F30ED8]();
}

uint64_t sub_24171F528()
{
  return MEMORY[0x270F30EF0]();
}

uint64_t sub_24171F538()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_24171F548()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_24171F558()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_24171F568()
{
  return MEMORY[0x270F36E80]();
}

uint64_t sub_24171F578()
{
  return MEMORY[0x270F36E98]();
}

uint64_t sub_24171F588()
{
  return MEMORY[0x270F35EA8]();
}

uint64_t sub_24171F598()
{
  return MEMORY[0x270F35EB0]();
}

uint64_t sub_24171F5A8()
{
  return MEMORY[0x270F35EB8]();
}

uint64_t sub_24171F5B8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24171F5C8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24171F5D8()
{
  return MEMORY[0x270F81960]();
}

uint64_t sub_24171F5E8()
{
  return MEMORY[0x270F81978]();
}

uint64_t sub_24171F5F8()
{
  return MEMORY[0x270F81990]();
}

uint64_t sub_24171F608()
{
  return MEMORY[0x270F819A8]();
}

uint64_t sub_24171F618()
{
  return MEMORY[0x270F819B0]();
}

uint64_t sub_24171F628()
{
  return MEMORY[0x270F819D0]();
}

uint64_t sub_24171F638()
{
  return MEMORY[0x270F81C40]();
}

uint64_t sub_24171F648()
{
  return MEMORY[0x270F81E88]();
}

uint64_t sub_24171F658()
{
  return MEMORY[0x270F81EA0]();
}

uint64_t sub_24171F668()
{
  return MEMORY[0x270F81EB0]();
}

uint64_t sub_24171F678()
{
  return MEMORY[0x270F81EE0]();
}

uint64_t sub_24171F688()
{
  return MEMORY[0x270F823A0]();
}

uint64_t sub_24171F698()
{
  return MEMORY[0x270EE3880]();
}

uint64_t sub_24171F6A8()
{
  return MEMORY[0x270EE3AD8]();
}

uint64_t sub_24171F6B8()
{
  return MEMORY[0x270EE3B60]();
}

uint64_t sub_24171F6C8()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_24171F6D8()
{
  return MEMORY[0x270EE3D40]();
}

uint64_t sub_24171F6E8()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_24171F6F8()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_24171F708()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_24171F718()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_24171F728()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_24171F738()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24171F748()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24171F758()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24171F768()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24171F778()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_24171F788()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_24171F798()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_24171F7A8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24171F7B8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24171F7C8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24171F7D8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24171F7E8()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_24171F7F8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24171F808()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24171F818()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24171F828()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24171F838()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_24171F848()
{
  return MEMORY[0x270F32530]();
}

uint64_t sub_24171F858()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24171F868()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24171F878()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24171F888()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24171F898()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24171F8A8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24171F8B8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24171F8C8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24171F8D8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24171F8E8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24171F8F8()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_24171F908()
{
  return MEMORY[0x270F37098]();
}

uint64_t sub_24171F918()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24171F928()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_24171F938()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24171F948()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24171F958()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24171F968()
{
  return MEMORY[0x270EF33E8]();
}

uint64_t sub_24171F978()
{
  return MEMORY[0x270F36F60]();
}

uint64_t sub_24171F988()
{
  return MEMORY[0x270F36F68]();
}

uint64_t sub_24171F998()
{
  return MEMORY[0x270F34D40]();
}

uint64_t sub_24171F9A8()
{
  return MEMORY[0x270F34D60]();
}

uint64_t sub_24171F9B8()
{
  return MEMORY[0x270F34D68]();
}

uint64_t sub_24171F9C8()
{
  return MEMORY[0x270F35240]();
}

uint64_t sub_24171F9D8()
{
  return MEMORY[0x270F35248]();
}

uint64_t sub_24171F9E8()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_24171F9F8()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_24171FA08()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_24171FA18()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24171FA28()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_24171FA38()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_24171FA48()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_24171FA58()
{
  return MEMORY[0x270F34E20]();
}

uint64_t sub_24171FA68()
{
  return MEMORY[0x270F35288]();
}

uint64_t sub_24171FA78()
{
  return MEMORY[0x270F34E68]();
}

uint64_t sub_24171FA88()
{
  return MEMORY[0x270F828E0]();
}

uint64_t sub_24171FA98()
{
  return MEMORY[0x270F34E90]();
}

uint64_t sub_24171FAA8()
{
  return MEMORY[0x270F82918]();
}

uint64_t sub_24171FAB8()
{
  return MEMORY[0x270F35EC0]();
}

uint64_t sub_24171FAC8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24171FAD8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24171FAE8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_24171FAF8()
{
  return MEMORY[0x270F62148]();
}

uint64_t sub_24171FB08()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24171FB18()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24171FB28()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24171FB48()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24171FB58()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24171FB68()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_24171FB78()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24171FB88()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24171FB98()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24171FBA8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24171FBB8()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_24171FBC8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24171FBD8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24171FBE8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24171FBF8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24171FC08()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_24171FC18()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24171FC28()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24171FC38()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24171FC48()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24171FC58()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24171FC68()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24171FC78()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24171FC88()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24171FC98()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_24171FCA8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24171FCC8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24171FCD8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24171FCE8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24171FCF8()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24171FD08()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24171FD18()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24171FD28()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24171FD38()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24171FD48()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24171FD58()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24171FD68()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_24171FD78()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24171FD88()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24171FD98()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24171FDA8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24171FDB8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24171FDC8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24171FDD8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24171FDE8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24171FDF8()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_24171FE08()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24171FE18()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24171FE48()
{
  return MEMORY[0x270FA0128]();
}

uint64_t HKMobilityAllWalkingSteadinessNotificationCategories()
{
  return MEMORY[0x270F35DE8]();
}

uint64_t HKMobilityNotificationCategoryForWalkingSteadinessEventValue()
{
  return MEMORY[0x270F35DF0]();
}

uint64_t HKMobilityWalkingSteadinessEventType()
{
  return MEMORY[0x270F35DF8]();
}

uint64_t HKMobilityWalkingSteadinessType()
{
  return MEMORY[0x270F35E10]();
}

uint64_t HKUIJoinStringsForAutomationIdentifier()
{
  return MEMORY[0x270F38330]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x270FA0350]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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